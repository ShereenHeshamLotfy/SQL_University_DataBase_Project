# SQL_University_DataBase_Project
📝 Project Overview:
​-	We have a university database that is used to keep track of students' transcripts and it consists of:
# 1.	Student table:
a)	Student_ID which is Primary key
b)	Student_Name 
c)	Sex 
d)	Major_Department which is foreign key for Dept_Code in Department table
e)	SSN and it is unique for each student
f)	BirthDate 
g)	Study_Year 
h)	Current_Phone 
i)	Current_Address 
j)	Current_City 
k)	Current_State 
l)	Current_ZipCode 
m)	Permanent_Phone 
n)	Permanent_Address 
o)	Permanent_City 
p)	Permanent_State 
q)	Permanent_ZipCode

# 3.	Department Table:
a)	Dept_Code which is primary key
b)	Dept_Name and it should be unique for every department and not null
c)	Office_Number 
d)	College 
e)	Office_Phone 
-	There is a relationship between department and student one to many as every student study in one department and every department has many students.
3.	Course Table:
a)	Course_Number which is primary key,
b)	Course_Name and should be not null
c)	Description 
d)	Dept_Code which is foreign key for Dept_Code in department table
e)	Semester 
-	There is a relationship between Course table and Department table one to many as every course belongs to one department and every department has many courses.

# 4.	Instructor Table:
a)	Instructor_ID which is primary key
b)	Instructor_Name 
c)	Sex 
d)	Dept_Code is a foreign key for Dept_Code  in department table
e)	SSN should be unique for every instructor and not null
f)	BirthDate 
g)	Phone 
h)	Salary 
-	There is a relationship between instructor and department one to many as every - department has many instructors and every instructor belongs to one department
-	As an instructor can teach one or many Courses and one course can have one or many instructor so relationship between Course table and Instructor Table so I made injection table between course and instructor called InstructorCourse
  
# 5.	InstructorCourse Table:
a)	Course_Number
b)	Instructor_ID
-	Both of them is a foreign key for Course table and instructor table and both of them is the primary key for the InstructorCourse table.
-	Realtionship between InstructorCourse is one to many for both Instructor and Course tables.
  
# 6.	Section Table:
a)	Section_ID is primary key
b)	Section_Number should be not null as there is no course has no section
c)	Instructor_ID  is foreign key for Instructor _ID in instructor table
d)	Course_Number is a foreign key for Course_Naumber in course table
e)	Semester 
-	There is a relationship one to many between section table and course table as every course can have many sections in semester and every section belongs to one course.
-	There is a relationship one to many between Instructor table and Section table as every instructor can have one or many sections and every section can be taught by  one instructor.
-	As Student can register in one or many courses and that means he can register in one or many section so relationship between Student and both Course and Section tables is many to many so i made injection tables which are RegistrationSection and RegistrationCourse
  
# 7.	RegistrationSection Table:
a)	Student_ID 
b)	Section_ID
-	Both of them is a foreign key for Student table and Section table and both of them is the primary key for the RegistrationSection table.
-	Realtionship between RegistrationSection is one to many for both Student and Section tables.
  
# 8.	RegistrationCourse Table:
a)	Student_ID 
b)	Course_Number
-	Both of them is a foreign key for Student table and Course table and both of them is the primary key for the RegistrationCourse table.
-	Realtionship between RegistrationCourse is one to many for both Student and Course tables.

# ​🛠️ SQL Skills Applied:
​- Joins: To join between tables to answer important questions
- ​Aggregations: (SUM,MAX,COUNT, AVG).
- ​CTEs & Subqueries:to organize complex code and make it easier to read.
- Stored procedure :to encapsulate the 10 queries.
Implement indexing to optimize queries

# Important questions and their results:
Q1 : Perform a report that displays the number of instructor in each department
-	I made an inner join between Instructor Table and Department Table  and use count to get number of student for each department .
<img width="513" height="388" alt="image" src="https://github.com/user-attachments/assets/97c2f2ea-84dd-48d3-b01e-beee75ee911c" />

Q2: Perform a report that display the department name that offer maximum number of courses.
-	I made CTE to get number of courses for each department using inner join between Course Table and Department Table then use this CTE as subquery in WHERE to get department name with maximum number of courses.
 <img width="298" height="136" alt="image" src="https://github.com/user-attachments/assets/ffdf493c-1724-479e-a743-e220ec2c4ac3" />

Q3: Perform a report that displays the name of each instructor with the name of courses he teaches
-	I made multiple join between Instructor Table, InstructorCourse and Course Table as InstructorCourse is injection table between other two tables to get name of courses for each instructor.
<img width="484" height="455" alt="image" src="https://github.com/user-attachments/assets/542aa473-b1a7-4c6b-8d25-cb92f2525784" />

Q4: Perform a report that display the number of students in each department
-	I made inner join between Department Table and Student table and count to get number of students for each department.
 <img width="344" height="252" alt="image" src="https://github.com/user-attachments/assets/13c2df6a-5f10-40e2-9804-b5d74ff6ce3c" />

Q5: Perform a report that display the name of department that pay total maximum salary to his instructors.
-	I made CTE to get total salary for each department using inner join between Instructor Table and Department Table then I used it in WHERE as subquery to get Department name of maximum TotalSalaryDept.
<img width="319" height="122" alt="image" src="https://github.com/user-attachments/assets/a789d7a8-9a38-470f-b849-36c9ba385aa6" />

Q6: Perform a report that display the Department`s name that have maximum number of students.
-	I made CTE to get number of students in each department by using inner join between Department Table and Student table and use CTE as subquery in WHERE to get Department`s Name that that have maximum number of students.
<img width="280" height="127" alt="image" src="https://github.com/user-attachments/assets/722ffa6e-0fac-463f-9253-b2d567fc8910" />

Q7: Perform a report that display the name of instructor that take salary greater than the average salary of his department
-	I made CTE to get average salary for each department by using inner join between Instructor Table and Department Table and I made inner join between Instructor Table and this CTE and in WHERE I compare each salary of each instructor with Resulted Average salary of his department to get instructor`s name with salary greater than average salary of his department.
<img width="305" height="117" alt="image" src="https://github.com/user-attachments/assets/58fc4e3d-9097-4c6b-8299-d23ac0a3bcc8" />

Q8: Perform a report that display department office telephone that his instructor earn maximum salary.
-	I made CTE to get maximum salary of all instructors then I made inner join between it and Department Table and use this CTE as subquery in WHERE to compare each salary of instructor with maximum salary that I got from CTE to get department office telephone that his instructor earns maximum salary.
<img width="281" height="119" alt="image" src="https://github.com/user-attachments/assets/f42f4b53-4d1c-483e-a575-132050ac3983" />

Q9: Perform a report that display the name of student who is participant in number of courses that greater than 3 courses.
-	I made CTE to get number of courses for each student by using inner join between Course Table and Student Table then I made inner join between Student Table and this CTE to get student with number of courses greater than 3 courses.
<img width="303" height="117" alt="image" src="https://github.com/user-attachments/assets/c95da01d-87ab-42a6-bca8-e8b566b4e9ed" />

Q10: Perform a report that displays the number of instructor in each course.
-	I made inner join between Course Table and InstructorCourse to get number of instructor in each course.
<img width="522" height="378" alt="image" src="https://github.com/user-attachments/assets/44fe8615-2e45-40c4-8d07-649688e95e00" />


