# Hospital Diabetic Readmission Project

Analysis of **101,766 diabetic patient records** using MySQL to identify key drivers of early hospital readmission (within 30 days). Findings visualised in an interactive Excel dashboard with pivot tables, lookup formulas, and KPI summaries.

## Tools Used
- **MySQL 8.0** — data loading, querying, segmentation
- **Microsoft Excel** — pivot tables, IF/INDEX-MATCH/COUNTIF formulas, charts, KPI dashboard

## Dataset
- Source: [UCI Diabetes 130-US Hospitals Dataset](https://archive.ics.uci.edu/ml/datasets/Diabetes+130-US+hospitals+for+years+1999-2008)
- 101,766 patient records across 50 features
- Target variable: \`readmitted\` — NO / >30 days / <30 days (early)

## SQL Analysis Overview

| Query | Dimension | Key Finding |
|-------|-----------|-------------|
| 1 | Overall readmission rate | 11.16% early readmission across all patients |
| 2 | By age group | [20-30) age group has highest early readmission at 14.24% |
| 3 | By medication count | High medication (20+) patients show 41% higher readmission than low-medication |
| 4 | By time in hospital | 8-10 day stays show ~75% higher readmission than 1-day stays |
| 5 | By lab procedure volume | High lab cases (50+) show 20% higher readmission than low-lab cases |

## Excel Analysis Features

| Feature | Purpose |
|---|---|
| Pivot Table | Summarised readmission metrics by age group |
| IF (nested) | Classified each age group as HIGH / MEDIUM / LOW risk |
| INDEX-MATCH | Identified the age group with peak readmission rate |
| COUNTIF | Counted segments flagged as high risk |
| AVERAGE | Computed mean readmission rate across cohorts |
| KPI Cards | Highlighted overall totals and headline metrics |
| Charts | Visualised trends across 4 dimensions |

## Key Insights
- **11.16%** of patients are readmitted within 30 days — a critical clinical and financial risk signal
- **Polypharmacy** is a strong readmission predictor: 12.78% (high) vs 9.06% (low medication)
- **Longer stays** correlate with higher readmission — patients staying 10 days have 14.35% readmission vs 8.18% for 1-day stays
- **Younger patients [20-30)** surprisingly show the highest early readmission rate at 14.24%

## Dashboard
![Hospital Readmission Dashboard](main/Dashboard.png)

## Files
- \`analysis.sql\` — all 5 MySQL queries
- \`Hospital_Readmission_Dashboard.xlsx\` — full Excel workbook with dashboard and analysis sheet
- \`dashboard.png\` — Excel dashboard screenshot
