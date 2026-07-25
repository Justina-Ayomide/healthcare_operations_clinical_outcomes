CREATE DATABASE healthcare_operations;

USE healthcare_operations;

CREATE TABLE healthcare (
    Patient_ID VARCHAR(20),
    Age INT,
    Gender VARCHAR(10),
    Department VARCHAR(50),
    Diagnosis VARCHAR(100),
    Severity VARCHAR(20),
    Admission_Date VARCHAR(30),
    Discharge_Date VARCHAR(30),
    Length_of_Stay INT,
    Wait_Time_Minutes INT,
    Doctor_ID VARCHAR(20),
    Insurance VARCHAR(50),
    Treatment VARCHAR(100),
    Readmission VARCHAR(10),
    Outcome VARCHAR(50)
    
    );
    
   -- How many patients are in the dataset?
SELECT COUNT(*) AS Total_Patients 
FROM healthcare;

-- How many unique departments?
SELECT COUNT(DISTINCT Department) AS Total_Departments 
FROM healthcare;

-- What departments exist?
SELECT DISTINCT Department 
FROM healthcare;

-- Gender distribution
SELECT Gender, COUNT(*) AS Total
FROM healthcare 
GROUP BY Gender;

-- Average age of patients
SELECT ROUND(AVG(Age), 1) AS Average_Age 
FROM healthcare;

-- Patient distribution by department
SELECT Department, COUNT(*) AS Total_Patients
FROM healthcare
GROUP BY Department
ORDER BY Total_Patients DESC;

-- Severity distribution
SELECT Severity, COUNT(*) AS Total
FROM healthcare
GROUP BY Severity
ORDER BY Total DESC;

-- Readmission rate
SELECT Readmission, COUNT(*) AS Total
FROM healthcare
GROUP BY Readmission;

-- Outcome distribution
SELECT Outcome, COUNT(*) AS Total
FROM healthcare
GROUP BY Outcome
ORDER BY Total DESC;
    
-- Average wait time by department
SELECT Department, 
       ROUND(AVG(Wait_Time_Minutes), 1) AS Avg_Wait_Time
FROM healthcare
GROUP BY Department
ORDER BY Avg_Wait_Time DESC;

-- Average length of stay by severity
SELECT Severity, 
       ROUND(AVG(Length_of_Stay), 1) AS Avg_Length_of_Stay
FROM healthcare
GROUP BY Severity
ORDER BY Avg_Length_of_Stay DESC;

-- Readmission rate by department
SELECT Department,
       COUNT(*) AS Total_Patients,
       SUM(Readmission) AS Readmitted,
       ROUND(SUM(Readmission) / COUNT(*) * 100, 1) AS Readmission_Rate_Percent
FROM healthcare
GROUP BY Department
ORDER BY Readmission_Rate_Percent DESC;

-- Mortality rate by department
SELECT Department,
       COUNT(*) AS Total_Patients,
       SUM(CASE WHEN Outcome = 'Deceased' THEN 1 ELSE 0 END) AS Deaths,
       ROUND(SUM(CASE WHEN Outcome = 'Deceased' THEN 1 ELSE 0 END) / COUNT(*) * 100, 1) AS Mortality_Rate
FROM healthcare
GROUP BY Department
ORDER BY Mortality_Rate DESC;

-- Readmission rate by severity
SELECT Severity,
       COUNT(*) AS Total_Patients,
       SUM(Readmission) AS Readmitted,
       ROUND(SUM(Readmission) / COUNT(*) * 100, 1) AS Readmission_Rate
FROM healthcare
GROUP BY Severity
ORDER BY Readmission_Rate DESC;

-- Most common diagnosis
SELECT Diagnosis,
       COUNT(*) AS Total_Patients
FROM healthcare
GROUP BY Diagnosis
ORDER BY Total_Patients DESC
LIMIT 10;

-- Average wait time by severity
SELECT Severity,
       ROUND(AVG(Wait_Time_Minutes), 1) AS Avg_Wait_Time
FROM healthcare
GROUP BY Severity
ORDER BY Avg_Wait_Time DESC;

-- Outcome by insurance type
SELECT Insurance,
       COUNT(*) AS Total_Patients,
       SUM(CASE WHEN Outcome = 'Recovered' THEN 1 ELSE 0 END) AS Recovered,
       ROUND(SUM(CASE WHEN Outcome = 'Recovered' THEN 1 ELSE 0 END) / COUNT(*) * 100, 1) AS Recovery_Rate
FROM healthcare
GROUP BY Insurance
ORDER BY Recovery_Rate DESC;

-- Gender vs readmission
SELECT Gender,
       COUNT(*) AS Total_Patients,
       SUM(Readmission) AS Readmitted,
       ROUND(SUM(Readmission) / COUNT(*) * 100, 1) AS Readmission_Rate
FROM healthcare
GROUP BY Gender;

-- Top 5 doctors by patient volume
SELECT Doctor_ID,
       COUNT(*) AS Total_Patients,
       ROUND(AVG(Length_of_Stay), 1) AS Avg_Length_of_Stay,
       ROUND(AVG(Wait_Time_Minutes), 1) AS Avg_Wait_Time
FROM healthcare
GROUP BY Doctor_ID
ORDER BY Total_Patients DESC
LIMIT 5;
    
    