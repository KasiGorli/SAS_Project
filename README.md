# SAS_Project
# Patient Wait Time and Satisfaction Analysis in SAS

##  Project Overview
This project analyzes patient wait times and satisfaction survey data using SAS to uncover performance trends across departments and evaluate the relationship between delays and satisfaction outcomes. It includes data cleaning, transformation, statistical analysis, and the creation of a Power BI-ready summary.

##  Objectives
- Clean and process raw appointment and satisfaction data.
- Calculate patient wait times and identify delays.
- Analyze the relationship between delays and satisfaction.
- Generate department-level insights for reporting in Power BI.

## 📂 Files Included
- `appointments_data.csv` – Raw appointment scheduling data.
- `satisfaction_data.csv` – Patient satisfaction survey data.
- `wait_time_analysis.sas` – Full SAS script for data import, cleaning, analysis, and export.
- `summary_for_bi.csv` – Final output dataset, ready for Power BI visualization.
- `project_report.pdf` – Summary of key findings, interpretations, and business recommendations. *(optional but highly recommended)*

##  Key SAS Steps
1. **Data Import** – Brings raw CSV data into SAS.
2. **Data Cleaning** – Removes no-shows, converts time formats, calculates wait time.
3. **Statistical Analysis** – 
   - Mean wait times per department.
   - Correlation between wait time and satisfaction.
   - Chi-square test on delay and recommendation.
4. **Summary Table** – Department-level performance metrics.
5. **Export for Power BI** – Final table ready for dashboarding.

##  Sample KPIs (from Output)
- Avg. wait time by department
- % patients delayed (>15 min)
- Satisfaction score trends
- % patients recommending the department

##  Insights & Business Use
This project can help hospitals:
- Monitor patient flow efficiency
- Identify departments with chronic delays
- Understand how operational delays impact satisfaction and reputation
- Support data-driven staffing or scheduling improvements

##  Tools Used
- **SAS 9.4** 
## 
| File | Purpose |
|------|---------|
| `README.md` | Overview and documentation |
| `wait_time_analysis.sas` | Your full SAS script (with comments) |
| `appointments_data.csv` | Sample dataset (de-identified or dummy) |
| `satisfaction_data.csv` | Sample dataset (de-identified or dummy) |
| `summary_for_bi.csv` | Exported summary table |
| `project_report.pdf` | Optional: Brief PDF with visuals, findings, and next steps |
| `PowerBI_Screenshot.png` | Optional: Screenshot of Power BI dashboard (if built) |
