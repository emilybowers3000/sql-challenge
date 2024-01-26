--Create Departments Table
Create Table departments (
	dept_no varchar(4)Primary Key NOT NULL,
	dept_name varchar(255)
);


--drop table
Drop Table dept_emp

--Create dept_emp Table
Create Table dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(4) NOT NULL,
    Primary Key (emp_no, dept_no),
    Foreign Key (dept_no) References departments(dept_no),
    Foreign Key (emp_no)  References employees(emp_no)
);

--drop table
Drop Table dept_manager

--Create dept_manager Table
Create Table dept_manager (
	dept_no varchar(4) NOT NULL,
	emp_no int NOT NULL,
	Primary Key (dept_no, emp_no),
	Foreign Key (dept_no) References departments(dept_no),
	Foreign Key (emp_no) References employees (emp_no)
);

--Create employees Table
Create Table employees (
	emp_no int Primary Key,
	emp_title_id varchar(255) NOT NULL,
	birth_date DATE,
	first_name varchar(50),
	last_name varchar(50),
	sex char(1),
	hire_date DATE
);

--Create salaries Table
Create Table salaries (
	emp_no INT Primary Key,
	salary INT);
	
--Create Titles Table
Create Table Titles (
	title_id varchar(255) Primary Key NOT NULL,
	title char);
	
--#1 List employee number, last name, first name, sex, and salary of each employee
SELECT
    employees.emp_no AS employee_number,
    employees.last_name,
    employees.first_name,
    employees.sex AS sex,
    salaries.salary
FROM
    employees
    JOIN salaries ON employees.emp_no = salaries.emp_no;

--#2 List the first name, last name, and hire date for the employees who were hired in 1986.
Select
	first_name,
	last_name,
	hire_date
From
	employees
Where
	Extract(Year from hire_date) = 1986;
	
--#List the manager of each department along with their department number, department name, employee number, last name, and first name.
Select
	dept_manager.dept_no As department_number,
	departments.dept_name As department_name,
	dept_manager.emp_no As employee_number,
	employees.last_name,
	employees.first_name
From
	dept_manager
	Join departments on dept_manager.dept_no =departments.dept_no
	Join employees on dept_manager.emp_no = employees.emp_no;

--#4 List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

Select
	dept_emp.emp_no As employee_number,
	employees.last_name,
	employees.first_name,
	dept_emp.dept_no As department_number,
	departments.dept_name As department_name
From
	dept_emp
	Join employees on dept_emp.emp_no = employees.emp_no
	Join departments on dept_emp.dept_no = departments.dept_no;

--#5 List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

Select
	first_name,
	last_name,
	sex
From employees
Where
	first_name = 'Hercules'
	And last_name Like 'B%';

--#6 List each employee in the Sales department, including their employee number, last name, and first name.

Select 
	employees.emp_no as employee_number,
	employees.last_name,
	employees.first_name
From
	employees
	Join dept_emp on employees.emp_no = dept_emp.emp_no
	Join departments on dept_emp.dept_no = departments.dept_no
Where
	departments.dept_name = 'Sales';
	
--#7 List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

Select 
	employees.emp_no as employee_number,
	employees.last_name,
	employees.first_name,
	departments.dept_name as department_name
From
	employees
	Join dept_emp on employees.emp_no = dept_emp.emp_no
	Join departments on dept_emp.dept_no = departments.dept_no
Where
	departments.dept_name In ('Sales','Development');
	
--#8 List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

Select
	last_name,
	count(*) as Frequency
From employees
Group By last_name
Order By frequency DESC, last_name;
