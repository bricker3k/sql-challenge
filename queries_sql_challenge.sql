--List the following details of each employee: employee number, last name, first name, gender, and salary.
Select 
E.emp_no,
E.last_name,
E.first_name,
E.gender,
S.salary
From "Employees" as E 
JOIN "Salaries" as S 
ON E.emp_no = S.emp_no;

--List employees who were hired in 1986.
Select * 
From "Employees" 
where hire_date like '1986%';

--List the manager of each department with the following information: department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.

Select
dm.dept_no,
d.dept_name,
dm.emp_no,
e.last_name,
e.first_name,
dm.from_date,
dm.to_date
From "Dept_manager" as dm
INNER JOIN "Employees" as e 
ON dm.emp_no = e.emp_no
Left Join "Departments" as d 
ON dm.dept_no = d.dept_no;


--List the department of each employee with the following information: employee number, last name, first name, and department name.

Select
dm.emp_no,
e.last_name,
e.first_name,
d.dept_name
From "Dept_manager" as dm Left Join "Departments" as d ON dm.dept_no = d.dept_no
inner join "Employees" as e 
ON dm.emp_no = e.emp_no;

--List all employees whose first name is "Hercules" and last names begin with "B."
Select first_name, last_name 
From "Employees" 
where first_name = 'Hercules' and last_name like 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
Select
dm.emp_no,
e.last_name,
e.first_name,
d.dept_name
From "Dept_manager" as dm LEFT Join "Departments" as d 
ON dm.dept_no = d.dept_no LEFT Join "Employees" as e 
ON dm.emp_no = e.emp_no
Where d.dept_name = 'Sales';

select * from "Departments"

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
Select
dm.emp_no,
e.last_name,
e.first_name,
d.dept_name
From "Dept_manager" as dm 
inner join "Departments" as d 
ON dm.dept_no = d.dept_no
inner join"Employees" as e 
ON dm.emp_no = e.emp_no
Where d.dept_name in ('Sales', 'Development');

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "last name count"
FROM "Employees"
GROUP BY last_name
ORDER BY "last name count" DESC;
