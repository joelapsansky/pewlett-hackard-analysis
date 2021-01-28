# Pewlett Hackard Analysis
  
SQL files:  
[Queries](/Queries/queries.sql)  
[Employee Database Challenge](/Queries/SQL/Employee_Database_Challenge.sql)  
  
## Overview of Project
Using SQL, derive a list of retiring employees and their titles, and then identify the particular employees eligible to participate in the mentorship program.
  
## Results
* By left joining the current employees table with the department employees table and grouping by department number, we see that department 5 has the most employees with 9,281.  
	- Taking that a step further, we can left join on this newly created current employees table to see that department 5 returns null, which means that no managers from that department are retiring just yet.  
```
SELECT  dm.dept_no,
        dm.emp_no,
	ce.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
FROM dept_manager AS dm
    LEFT JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no)
```  
### Employee Count by Unique Titles  
  
![Department 5](/Department_5.png "Department 5")  
* When we left join on the titles table, the number of rows increases from ~300K to over ~400K because of "versioning."  
	-Many employees have worked multiple jobs so they have multiple titles on the titles table (to and from dates differentiate the jobs held by each employee).          	  	  -Employee IDs are foreign keys on the titles table.    
* It is no surprise that most of the retirees are senior staff as shown on this chart:  
![Employees_By_Unique_Title](/Employees_By_Unique_Title.png "Employees_By_Unique_Title")  
  
* 1,549 employees are eligible to participate in the mentor program.   
	-They are current employees with birth dates in 1965.   
  
## Summary
From summing the 'Employee Count by Unique Titles' chart, it's evident that 90,398 roles will become vacant.  With only 1,549 mentors, that's over 58 employees per mentor.  Since that is not realistic, it is probably best to pull some experienced employees into the mentorship program.  Pewlett should also consider hiring highly talented employees to fill those roles so that less training is required.  This will cost extra money, of course.  Pewlett can start by looking at a few other tables (i.e., count of employees by department with more than 3 years of experience, list of top 3 most experienced managers in each department, etc.).    
  

