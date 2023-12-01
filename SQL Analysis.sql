-- Analysis

-- List the employee number, last name, first name, sex, and salary of each employee.
select emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
	from employees as emp 
	inner join  salaries as sal 
		on emp.emp_no = sal.emp_no;
	
-- List the first name, last name, and hire date for the employees who were hired in 1986.
select first_name,last_name,hire_date
	from employees
	where hire_date like '%/1986';
	
-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
select emp.last_name, emp.first_name, emp.emp_no, dman.dept_no, dept.dept_name
from employees as emp
inner join dept_manager as dman 
	on emp.emp_no = dman.emp_no
inner join departments as dept 
	on dman.dept_no = dept.dept_no
order by emp.last_name;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select dept.dept_no, emp.emp_no, emp.last_name, emp.first_name, dept.dept_name 
from departments as dept
inner join dept_emp as demp 
	on dept.dept_no = demp.dept_no 
inner join employees as emp 
	on demp.emp_no = emp.emp_no;
	
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select emp.first_name, emp.last_name, emp.sex
from employees as emp
where first_name = 'Hercules' 
	and last_name like 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
select emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
from employees as emp
join dept_emp as demp 
	on emp.emp_no = demp.emp_no
join departments as dept
	on dept.dept_no = demp.dept_no
where dept.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
from employees as emp
join dept_emp as demp 
	on emp.emp_no = demp.emp_no
join departments as dept
	on dept.dept_no = demp.dept_no
where dept.dept_name in ('Sales', 'Development')
order by dept.dept_name asc, emp.last_name asc;

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) (4 points)
select last_name, count(last_name)
from employees
group by last_name
order by count(last_name)
