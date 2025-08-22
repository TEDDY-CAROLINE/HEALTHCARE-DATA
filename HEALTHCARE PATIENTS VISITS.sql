--View All patients details
SELECT * 
FROM Patients


--Display only female patients from Patients table
SELECT *
FROM Patients
WHERE Gender = 'F'

--visits where the bill amount is greater than 3000, ordered from highest to lowest
SELECT *
FROM Visits
WHERE Bill_amount > 3000
ORDER BY Bill_amount desc


--Joining the Patients and Visits tables to display patient names, visit dates, and diagnoses
SELECT Patients.Patient_id, first_name, last_name, visit_date,diagnosis
FROM Patients
INNER JOIN Visits
ON Patients.Patient_id = Visits. Patient_id


--Showing all visits that occurred in Lagos
SELECT Patients.Patient_id, first_name, last_name, visit_date, City = 'Lagos'  
FROM Patients 
INNER JOIN Visits 
ON Patients.Patient_id = Visits.Patient_id


--Finding the total bill amount for all visits.
SELECT SUM (Bill_amount) AS TOTAL_BILL
FROM Visits


--Counting the number of patients diagnosed with Malaria.
SELECT COUNT (Diagnosis) AS MALARIA_PATIENTS
FROM Visits 
WHERE Diagnosis = 'Malaria'


--Calculating the average bill amount per city.
SELECT 
	city, 
	AVG (bill_amount) as avg_bill  
FROM Patients
JOIN Visits 
ON Patients.Patient_id = Visits.Patient_id
GROUP BY City 


--Showing the total bill amount collected by each doctor.
SELECT 
	doctor_name, 
	SUM (bill_amount) as Total_bill  
FROM Patients
JOIN Visits 
ON Patients.Patient_id = Visits.Patient_id
GROUP BY doctor_name


--Display doctors who have collected more than 5000 in total bills.
SELECT 
	doctor_name, 
	SUM (bill_amount) as Total_bill  
FROM Patients
JOIN Visits 
ON Patients.Patient_id = Visits.Patient_id
GROUP BY doctor_name
HAVING  SUM (bill_amount) > 5000


--Finding patients who have spent more than the average bill amount.
SELECT 
	first_name, last_name, 
	SUM (bill_amount) as Total_bill  
FROM Patients
JOIN Visits 
ON Patients.Patient_id = Visits.Patient_id
GROUP BY first_name, last_name
HAVING SUM (Bill_amount) > AVG (bill_amount) 


--Writing a query that adds a column called bill_category:
ALTER TABLE Visits
ADD Bill_category int 


--Removing duplicate visits (if any) from the Visits table. (there are no duplicates)
SELECT 
	COUNT (*) AS Duplicates
FROM Visits
GROUP BY visit_id 
HAVING COUNT (*) >1


--Finding the city with the highest number of Malaria cases.
SELECT Patients.Patient_id, diagnosis, City 
FROM Patients 
JOIN Visits 
ON Patients.Patient_id = Visits.Patient_id
WHERE diagnosis = 'Malaria'
ORDER BY patient_id DESC 



--Determine which doctor generates the highest average bill per visit.
SELECT 
	doctor_name, 
	AVG (bill_amount) as avg_bill  
FROM Visits
GROUP BY doctor_name
ORDER BY avg_bill desc 



