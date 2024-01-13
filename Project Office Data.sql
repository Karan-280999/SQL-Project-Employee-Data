Create database Office_data;
 use  Office_data;

create table Employee
(
Emp_id int not null primary key,
F_name varchar(20),
L_name varchar(20),
Job_id  varchar(20),
Manager_id varchar(20),
Hiring_date date,
Salary int,
Commisssion  int,
Dept_id int
);

Select * from Employee;

insert into Employee values (9360,'neha','sharma','sw engg',7902,'2022-12-17',28000,0,20);
insert into Employee values (9499,'nish','joshi','salesman',7698,'2022-02-20',16000,300,30);
insert into Employee values (9566,'akash','chaudhary','manager',7902,'2022-4-2',35070,0,90);
insert into Employee values (9654,'samiksha','deshpande','salesman',7902,'2022-9-28',12500,1400,30);
insert into Employee values (9782,'lina','umre','manager',7902,'2022-6-9',29400,0,90);
insert into Employee values (9788,'lish','dhule','analyst',7902,'2022-12-9',30000,0,20);
insert into Employee values (9839,'avi','patil','president',7902,'2022-11-17',95000,0,10);
insert into Employee values (9844,'kartik','dev','salesman',7902,'2022-9-8',15000,0,30);
insert into Employee values (9876,'swara','meshram','sw engg',7902,'2022-1-12',30100,0,20);
insert into Employee values (9900,'rahul','sing','technical lead',7902,'2022-12-3',52950,0,60);
insert into Employee values (9902,'dev','ladhha','analyst',7902,'2022-12-3',30000,0,10);
insert into Employee values (9934,'kishan','mathur','swengg',7902,'2022-1-23',3300,0,20);
insert into Employee values (9591,'swara','b','swengg',7902,'2022-2-22',25000,0,100);
insert into Employee values (9698,'vivek','b','swengg',7902,'2022-5-1',34200,0,30);
insert into Employee values (9777,'vivek','ramekar','analyst',7902,'2022-5-1',50000,200,null);
insert into Employee values (9860,'prakash','dive','analyst',7902,'2022-6-21',70000,100,50);
insert into Employee values (9861,'pooja','joshi','analyst',7902,'2022-7-1',50000,100,50);

select * from Employee;

# Que 1 - Retrieve the employee ID, first name, last name and department ID for employees working in department 20.
select emp_id,f_name,l_name,dept_id from employee where dept_id=20;

# Que 2 - Retrieve the employee ID, job ID and salary for the employee with the last name 'Deshpande'.
select emp_id,job_id,salary from employee where l_name='deshpande';

# Que 3 - Retrieve the employee ID, first name, last name and salary for employees whose salary is equal to or greater than 20000.
select emp_id,f_name,l_name,salary from employee where salary>=20000;

# Que 4 - Retrieve the first name, last name, salary and net salary (considering commission) for employees whose net salary falls between 10,000 and 78,000.
select f_name,l_name,salary,
(salary+(salary*commisssion))"Net salary"
 from employee 
 where (salary+(salary*commisssion))
 between 10000 and 78000;

# Que 5 - Retrieve the employee ID, first name, last name, and salary for employees whose salary falls within the range of 10,000 and 78,000.
select emp_id,f_name,l_name,salary from employee where salary between 10000 and 78000;

# Que 6 - Retrieve the employee ID, first name, last name, department ID, and salary for employees who belong to departments with IDs 60, 90, or 100.
select emp_id,f_name,l_name,dept_id,salary from employee where dept_id in (60,90,100);

# Que 7 - Retrieve the employee ID, first name, last name, department ID, and salary for employees whose first names start with the letter 'S'.
select emp_id,f_name,l_name,dept_id,salary from employee where f_name like ('s%');

# Que 8 - Retrieve the employee ID, first name, last name, department ID, and salary for employees who do not belong to any specific department (where the department ID is null).
select emp_id,f_name,l_name,dept_id,salary from employee where dept_id is null;

# Que 9 - Retrieve the employee ID, first name, last name, department ID, and salary for employees whose first names start with the letter 'S' and have a salary equal to or greater than 20,000.
select emp_id,f_name,l_name,dept_id,salary from employee where f_name like ('s%') and salary>=20000;

# Que 10 - Retrieve the employee ID, first name, last name, department ID, and salary for employees whose first names start with the letter 'A' or 'K'.
select emp_id,f_name,l_name,dept_id,salary from employee where f_name like ('a%') or f_name like ('k%');

# Que 11 - Retrieve the employee ID, first name, last name, department ID, and salary for employees who do not belong to departments with IDs 60, 90, or 100.
select emp_id,f_name,l_name,dept_id,salary from employee where dept_id not in (60,90,100);

# Que 12 - Retrieve the department code, job ID, and total salary for each combination of department and job.
select dept_id"Department Code",
job_id , SUM(salary)"Total Salary"
from employee
Group by dept_id , job_id;

# Que 13 - Retrieve the department ID and the number of employees for departments with more than two employees.
select dept_id,count(*)"No of Employee"
from employee
Group by dept_id
having count(*)>2;

##  sub queries
# Que 14 - Retrieve the first name, last name, and salary of employees whose salary is less than the average salary across all employees.
select f_name,l_name,salary from employee where salary<(select avg(salary) from employee);

# Que 15 - Retrieve the department ID and the average salary for departments where the average salary is greater than the average salary in department 30.
select dept_id,avg(salary) "Average Salary"
from employee
group by dept_id
having avg (salary)>
(select avg(salary) from employee where dept_id=30 group by dept_id);

# Que 16 - Retrieve the first name, salary, and department ID of employees whose salary is less than the average salary in their respective departments.
select f_name,salary,dept_id from employee e
 where salary < (select avg(salary) from employee where dept_id=e.dept_id );
 
# Que 17 - Retrieve the department ID and the average salary for departments where the average salary is less than the maximum average salary across all departments.
select dept_id , avg(salary) as avg_salary
 from employee
 group by dept_id
 having avg_salary < (
 select max(avg_salary)
 from (select dept_id , avg(salary) as avg_salary from employee
 group by dept_id) as avg_salaries);
 
# Que 18 - Create a table payment having colu mnsP_id ,P_date, e_id with refrence to employee table using emp_id , designation , amount.
create table payment(
P_id int primary key,
P_date date,
e_id int references employee(emp_id),
designation varchar(20), amount Int);

insert into payment values (101,'2022-12-17',9360,'Data_scientist',28000),
(102,'2022-04-02',9566,'Data_Analyst',35070),
(103,'2022-09-06',9782,'Data_Analyst',29400);

select * from payment;


## Full outer join
# Que 19 - Retrieve the employee ID, first name, salary, payment ID, and payment amount for employees who have payment records include both employees with or without payments, considering both left outer join and right outer join.
select e.emp_id,e.f_name,e.salary,p.P_id as payment_id , p.amount
from
employee e left outer join payment p on e.emp_id=p.e_id
UNION
select e.emp_id,e.f_name,e.salary,p.P_id as payment_id , p.amount
from
employee e right outer join payment p on e.emp_id=p.e_id;

# Que 20 - Retrieve the employee ID, first name, job ID, and a derived column indicating whether an employee is "Senior" or "Junior" based on their commission.
select emp_id,f_name,job_id,
if(commisssion>0,"Senior","Junior") 
as Result 
from employee;

show tables from Office_data;
select * from employee;
select * from payment;
