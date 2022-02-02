-- 1. I want to know how many employees with each title were born after 1965-01-01.
mysql> SELECT count(t.title), t.title from titles t        
    -> inner join employees e on e.emp_no = t.emp_no
    -> where e.birth_date > 1965-01-01
    -> group by title;

-- 2. I want to know the average salary per title.
mysql> SELECT avg(s.salary), t.title FROM salaries s
    -> INNER JOIN titles t ON t.emp_no = s.emp_no
    -> GROUP BY title;

-- 3. How much money was spent on salary for the marketing department between the years 1990 and 1992?
mysql> SELECT sum(s.salary), d.dept_name FROM salaries s
    -> INNER JOIN dept_emp de ON de.emp_no = s.emp_no
    -> INNER JOIN departments d ON d.dept_no = de.dept_no
    -> WHERE dept_name = 'Marketing' AND year(de.from_date) >= '1990' AND year(de.to_date) <= '1992';
