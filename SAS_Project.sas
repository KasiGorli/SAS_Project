/* STEP 1: Import Appointments Data */
proc import datafile="/home/u64081952/sasuser.v94/appointments_data.csv"
    out=appointments
    dbms=csv
    replace;
    getnames=yes;
run;

/* STEP 2: Clean Appointments Data */
data appointments_clean;
    set appointments;
    
    /* Remove No-Shows */
    if No_Show = 'Y' then delete;

    /* Convert time to SAS time values */
    format Arrival_SAS Seen_SAS time5.;
    Arrival_SAS = input(put(Arrival_Time, time5.), time5.);
    Seen_SAS = input(put(Seen_Time, time5.), time5.);

    /* Calculate Wait Time in minutes */
    Wait_Time = (Seen_SAS - Arrival_SAS) / 60;

    /* Flag Delays (Wait > 15 mins) */
    Delayed = (Wait_Time > 15);
run;

/* STEP 3: Analyze Wait Time by Department */
proc means data=appointments_clean n mean stddev maxdec=2;
    class Department;
    var Wait_Time;
run;

/* STEP 4: Import Satisfaction Data */
proc import datafile="/home/u64081952/sasuser.v94/satisfaction_data.csv"
    out=satisfaction
    dbms=csv
    replace;
    getnames=yes;
run;

/* STEP 5: Merge Appointments and Satisfaction Data */
proc sort data=appointments_clean; by Patient_ID; run;
proc sort data=satisfaction; by Patient_ID; run;

data merged_data;
    merge appointments_clean(in=a) satisfaction(in=b);
    by Patient_ID;
    if a and b;
run;

/* STEP 6: Correlation Analysis – Wait Time vs Satisfaction */
proc corr data=merged_data;
    var Wait_Time Satisfaction_Score;
run;

/* STEP 7: Chi-Square Test – Delayed vs Recommend */
proc freq data=merged_data;
    tables Delayed*Recommend / chisq;
run;

/* STEP 8: Summary Table for Power BI Export */
proc sql;
    create table summary_for_bi as
    select Department,
           count(*) as Total_Patients,
           mean(Wait_Time) as Avg_Wait_Time format=8.2,
           mean(Satisfaction_Score) as Avg_Satisfaction format=8.2,
           sum(case when Delayed=1 then 1 else 0 end) as Num_Delayed,
           sum(case when Recommend='Y' then 1 else 0 end) as Num_Recommended
    from merged_data
    group by Department;
quit;

/* STEP 9: Export Summary Table for Power BI */
proc export data= summary_for_bi
    outfile="/home/u64081952/sasuser.v94/satisfaction_data.csv"
    dbms=csv
    replace;
run;