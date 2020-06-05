/* 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
2. List employees who were hired in 1986.
3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
4. List the department of each employee with the following information: employee number, last name, first name, and department name.
5. List all employees whose first name is "Hercules" and last names begin with "B."
6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.*/

--#1
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
    INNER JOIN salaries
    ON employees.emp_no = salaries.emp_no;

--#2
SELECT *
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--#3
SELECT departments.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name,
    dept_manager.from_date, dept_manager.to_date
FROM dept_manager
    INNER JOIN employees
    ON dept_manager.emp_no = employees.emp_no
    INNER JOIN departments
    ON dept_manager.dept_no = departments.dept_no;

--#4
SELECT dept_emp.emp_no, dept_emp.dept_no, departments.dept_name, employees.last_name, employees.first_name
FROM employees
    INNER JOIN dept_emp
    ON employees.emp_no = dept_emp.emp_no
    INNER JOIN departments
    ON dept_emp.dept_no = departments.dept_no;

--#5	
SELECT *
FROM employees
WHERE first_name LIKE 'Hercules'
    AND last_name LIKE 'B%';

--#6
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
    INNER JOIN dept_emp
    ON dept_emp.emp_no = employees.emp_no
    INNER JOIN departments
    ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales';

--#7
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
    INNER JOIN dept_emp
    ON dept_emp.emp_no = employees.emp_no
    INNER JOIN departments
    ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales'
    OR dept_name = 'Development';

--#8
SELECT last_name, COUNT (last_name) AS "last name"
FROM employees
GROUP BY last_name
ORDER BY "last name" DESC; 
