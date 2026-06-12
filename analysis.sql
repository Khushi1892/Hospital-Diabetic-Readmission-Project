-- Hospital Readmission Analysis
-- Dataset: 101,766 diabetic patient records
-- Tool: MySQL 8.0

-- ============================================
-- Query 1: Overall Readmission Rate
-- ============================================
SELECT 
  readmitted,
  COUNT(*) AS count,
  ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM readmission_data), 2) AS percentage
FROM readmission_data
GROUP BY readmitted;

-- ============================================
-- Query 2: Early Readmission by Age Group
-- ============================================
SELECT 
  age,
  COUNT(*) AS total_patients,
  SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END) AS early_readmissions,
  ROUND(SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS early_readmission_rate
FROM readmission_data
GROUP BY age
ORDER BY age;

-- ============================================
-- Query 3: Readmission by Medication Count
-- ============================================
SELECT 
  CASE 
    WHEN num_medications <= 10 THEN 'Low (1-10)'
    WHEN num_medications <= 20 THEN 'Medium (11-20)'
    ELSE 'High (20+)'
  END AS medication_bucket,
  COUNT(*) AS total_patients,
  ROUND(SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS early_readmission_rate
FROM readmission_data
GROUP BY medication_bucket;

-- ============================================
-- Query 4: Readmission by Time in Hospital
-- ============================================
SELECT 
  time_in_hospital,
  COUNT(*) AS total_patients,
  ROUND(SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS early_readmission_rate
FROM readmission_data
GROUP BY time_in_hospital
ORDER BY time_in_hospital;

-- ============================================
-- Query 5: Readmission by Lab Procedure Volume
-- ============================================
SELECT 
  CASE 
    WHEN num_lab_procedures <= 20 THEN 'Low (1-20)'
    WHEN num_lab_procedures <= 50 THEN 'Medium (21-50)'
    ELSE 'High (50+)'
  END AS lab_bucket,
  COUNT(*) AS total_patients,
  ROUND(SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS early_readmission_rate
FROM readmission_data
GROUP BY lab_bucket;