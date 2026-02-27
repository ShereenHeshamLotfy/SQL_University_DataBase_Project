Create Database University;
USE University;

--Creation of Table Department
CREATE TABLE Department(
Dept_Code VARCHAR(20) PRIMARY KEY,
Dept_Name VARCHAR(100) UNIQUE NOT NULL,
Office_Number VARCHAR(20),
College VARCHAR(100),
Office_Phone VARCHAR(20));

--Creation of Table Course
CREATE TABLE Course(
Course_Number INT PRIMARY KEY,
Course_Name VARCHAR(100) NOT NULL,
Description VARCHAR(255),
Dept_Code VARCHAR(20),
Semester VARCHAR(20),
CONSTRAINT FK_Course_Dept FOREIGN KEY (Dept_Code) REFERENCES Department(Dept_Code)
);

--Creation of Table Instructor
CREATE TABLE Instructor(
Instructor_ID INT PRIMARY KEY,
Instructor_Name VARCHAR(100),
Sex CHAR(1),
Dept_Code VARCHAR(20),
SSN VARCHAR(20) UNIQUE NOT NULL,
BirthDate DATE,
Phone VARCHAR(20),
Salary INT,
CONSTRAINT FK_Instructor_Dept FOREIGN KEY (Dept_Code) REFERENCES Department(Dept_Code),
);

--Creation of table Section
CREATE TABLE Section(
Section_ID INT PRIMARY KEY IDENTITY(1,1),
Section_Number INT NOT NULL,
Instructor_ID INT,
Course_Number INT,
Semester VARCHAR(20),
CONSTRAINT FK_Instructor_ID FOREIGN KEY (Instructor_ID) REFERENCES Instructor(Instructor_ID),
CONSTRAINT FK_Course_ID FOREIGN KEY (Course_Number) REFERENCES Course(Course_Number));

--Creation of table Student
CREATE TABLE Student(
Student_ID INT PRIMARY KEY,
Student_Name VARCHAR(100),
Sex CHAR(1),
Major_Department VARCHAR(20),
SSN VARCHAR(20) UNIQUE NOT NULL,
BirthDate DATE,
Study_Year INT,
Current_Phone VARCHAR(20),
Current_Address VARCHAR(100),
Current_City VARCHAR(50),
Current_State VARCHAR(50),
Current_ZipCode VARCHAR(10),
Permanent_Phone VARCHAR(20),
Permanent_Address VARCHAR(100),
Permanent_City VARCHAR(50),
Permanent_State VARCHAR(50),
Permanent_ZipCode VARCHAR(10),
CONSTRAINT FK_Student_Department FOREIGN KEY (Major_Department) REFERENCES Department(Dept_Code)
);

-- Creation of table RegistrationCourse
CREATE TABLE RegistrationCourse(
Student_ID INT,
Course_Number INT,
CONSTRAINT PK_RegistrationCourse PRIMARY KEY (Student_ID, Course_Number),
CONSTRAINT FK_RegistrationCourse_Student FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
CONSTRAINT FK_RegistrationCourse_Course FOREIGN KEY (Course_Number) REFERENCES Course(Course_Number)
);

-- Creation of table RegistrationSection
CREATE TABLE RegistrationSection(
Student_ID INT,
Section_ID INT,
CONSTRAINT PK_RegistrationSection PRIMARY KEY (Student_ID, Section_ID),
CONSTRAINT FK_RegistrationSection_Student FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
CONSTRAINT FK_RegistrationSection_Section FOREIGN KEY (Section_ID) REFERENCES Section(Section_ID)
);

-- Creation of table InstructorCourse
CREATE TABLE InstructorCourse (
Instructor_ID INT,
Course_Number INT,
CONSTRAINT PK_InstructorCourse PRIMARY KEY (Instructor_ID, Course_Number),
CONSTRAINT FK_InstructorCourse_Instructor FOREIGN KEY (Instructor_ID) REFERENCES Instructor(Instructor_ID),
CONSTRAINT FK_InstructorCourse_Course FOREIGN KEY (Course_Number) REFERENCES Course(Course_Number)
);

--Insertion into Debartment Table 
INSERT INTO Department (Dept_Code, Dept_Name, Office_Number, College, Office_Phone) VALUES
('CS', 'Computer Science', '101', 'Engineering', '1234567890'),
('EE', 'Electrical Engineering', '102', 'Engineering', '1234567891'),
('ME', 'Mechanical Engineering', '103', 'Engineering', '1234567892'),
('CE', 'Civil Engineering', '104', 'Engineering', '1234567893'),
('BIO', 'Biology', '201', 'Science', '1234567894'),
('CHE', 'Chemistry', '202', 'Science', '1234567895'),
('PHY', 'Physics', '203', 'Science', '1234567896'),
('MAT', 'Mathematics', '204', 'Science', '1234567897'),
('ENG', 'English', '301', 'Arts', '1234567898'),
('HIS', 'History', '302', 'Arts', '1234567899');

--Insertion into Course Table
INSERT INTO Course (Course_Number, Course_Name, Description, Dept_Code, Semester) VALUES
(101, 'Intro to Programming', 'Basic programming concepts', 'CS', 'Fall 2025'),
(102, 'Data Structures', 'Study of data structures', 'CS', 'Fall 2025'),
(103, 'Circuits', 'Basic Electrical Circuits', 'EE', 'Fall 2025'),
(104, 'Thermodynamics', 'Intro to Thermodynamics', 'ME', 'Fall 2025'),
(105, 'Statics', 'Study of forces', 'CE', 'Fall 2025'),
(106, 'Genetics', 'Basics of genetics', 'BIO', 'Fall 2025'),
(107, 'Organic Chemistry', 'Organic compounds', 'CHE', 'Fall 2025'),
(108, 'Mechanics', 'Physics mechanics', 'PHY', 'Fall 2025'),
(109, 'Calculus I', 'Differential calculus', 'MAT', 'Fall 2025'),
(110, 'English Literature', 'Study of English lit', 'ENG', 'Fall 2025'),
(111,'DataBase','Study Database','CS','Fall 2025'),
(112,'Software','Study of Software','CS','Fall 2025');

--Insertion into Instructor Table
INSERT INTO Instructor (Instructor_ID, Instructor_Name, Sex, Dept_Code, SSN, BirthDate, Phone,Salary) VALUES
(1001, 'Dr. Ahmed', 'M', 'CS', 'SSN001', '1980-01-01','5551110001',10000),
(1002, 'Dr. Sara', 'F', 'CS', 'SSN002', '1982-02-02', '5551110002',12000),
(1003, 'Dr. Ali', 'M', 'EE', 'SSN003', '1979-03-03','5551110003',7000),
(1004, 'Dr. Mona', 'F', 'ME', 'SSN004', '1985-04-04', '5551110004',15000),
(1005, 'Dr. Khalid', 'M', 'CE', 'SSN005', '1981-05-05', '5551110005',20000),
(1006, 'Dr. Lina', 'F', 'BIO', 'SSN006', '1983-06-06', '5551110006',7500),
(1007, 'Dr. Tamer', 'M', 'CHE', 'SSN007', '1980-07-07', '5551110007',6000),
(1008, 'Dr. Hanan', 'F', 'PHY', 'SSN008', '1978-08-08', '5551110008',5000),
(1009, 'Dr. Samir', 'M', 'MAT', 'SSN009', '1982-09-09', '5551110009',1100),
(1010, 'Dr. Fatima', 'F', 'ENG', 'SSN010', '1984-10-10', '5551110010',9000),
(1011, 'Dr. Mohamed', 'M', 'HIS', 'SSN011', '1984-09-10', '5551110011',6600);

--Insertion into Section Table
INSERT INTO Section (Section_Number, Instructor_ID, Course_Number, Semester) VALUES
(1, 1001, 101, 'Fall 2025'),
(2, 1001, 101, 'Fall 2025'),
(1, 1002, 102, 'Fall 2025'),
(1, 1003, 103, 'Fall 2025'),
(2, 1003, 103, 'Fall 2025'),
(1, 1004, 104, 'Fall 2025'),
(1, 1005, 105, 'Fall 2025'),
(1, 1006, 106, 'Fall 2025'),
(1, 1007, 107, 'Fall 2025'),
(1, 1008, 108, 'Fall 2025');

--Insertion into Student Table
INSERT INTO Student (Student_ID, Student_Name, Sex, Major_Department, SSN, BirthDate, Study_Year, Current_Phone, Current_Address, Current_City, Current_State, Current_ZipCode, Permanent_Phone, Permanent_Address, Permanent_City, Permanent_State, Permanent_ZipCode) VALUES
(201, 'Ahmed Ali', 'M', 'CS', 'STU001', '2002-01-01', 2, '5552000001', 'Addr1', 'City1', 'State1', '10001', '5552000001', 'Addr1', 'City1', 'State1', '10001'),
(202, 'Sara Hassan', 'F', 'CS', 'STU002', '2003-02-02', 1, '5552000002', 'Addr2', 'City2', 'State2', '10002', '5552000002', 'Addr2', 'City2', 'State2', '10002'),
(203, 'Omar Nabil', 'M', 'EE', 'STU003', '2002-03-03', 2, '5552000003', 'Addr3', 'City3', 'State3', '10003', '5552000003', 'Addr3', 'City3', 'State3', '10003'),
(204, 'Mona Sami', 'F', 'ME', 'STU004', '2001-04-04', 3, '5552000004', 'Addr4', 'City4', 'State4', '10004', '5552000004', 'Addr4', 'City4', 'State4', '10004'),
(205, 'Khalid Omar', 'M', 'CE', 'STU005', '2000-05-05', 4, '5552000005', 'Addr5', 'City5', 'State5', '10005', '5552000005', 'Addr5', 'City5', 'State5', '10005'),
(206, 'Lina Nabil', 'F', 'BIO', 'STU006', '2003-06-06', 1, '5552000006', 'Addr6', 'City6', 'State6', '10006', '5552000006', 'Addr6', 'City6', 'State6', '10006'),
(207, 'Tamer Ali', 'M', 'CHE', 'STU007', '2002-07-07', 2, '5552000007', 'Addr7', 'City7', 'State7', '10007', '5552000007', 'Addr7', 'City7', 'State7', '10007'),
(208, 'Hanan Sami', 'F', 'PHY', 'STU008', '2001-08-08', 3, '5552000008', 'Addr8', 'City8', 'State8', '10008', '5552000008', 'Addr8', 'City8', 'State8', '10008'),
(209, 'Samir Omar', 'M', 'MAT', 'STU009', '2002-09-09', 2, '5552000009', 'Addr9', 'City9', 'State9', '10009', '5552000009', 'Addr9', 'City9', 'State9', '10009'),
(210, 'Fatima Nabil', 'F', 'ENG', 'STU010', '2003-10-10', 1, '5552000010', 'Addr10', 'City10', 'State10', '10010', '5552000010', 'Addr10', 'City10', 'State10', '10010');

--Insertion into RegistrationCourse
INSERT INTO RegistrationCourse (Student_ID, Course_Number) VALUES
(201, 101),
(201, 102),
(201,111),
(201,112),
(202, 101),
(203, 103),
(204, 104),
(205, 105),
(206, 106),
(207, 107),
(208, 108),
(209, 109);

--Insertion into RegistrationSection
INSERT INTO RegistrationSection (Student_ID, Section_ID) VALUES
(201, 1),
(201, 3),
(202, 2),
(203, 4),
(204, 6),
(205, 7),
(206, 8),
(207, 9),
(208, 10),
(209, 1);

INSERT INTO InstructorCourse(Instructor_ID,Course_Number) VALUES
(1001,101),
(1001,102),
(1002,101),
(1002,102),
(1003,110),
(1004,103),
(1005,105),
(1006,106),
(1007,107),
(1008,108),
(1009,109),
(1010,110);

SELECT * FROM Student;
SELECT * FROM Department;
SELECT * FROM Course;
SELECT * FROM Section;
SELECT * FROM Instructor;
SELECT * FROM RegistrationCourse;
SELECT * FROM RegistrationSection;

--Q1 : Perform a report that displays the number of instructor in each department
SELECT d.Dept_Name,COUNT(i.Instructor_ID) as Number_of_Instructor
FROM Instructor i
INNER JOIN Department d 
ON i.Dept_Code=d.Dept_Code
GROUP BY d.Dept_Name;

--Q2: Perform a report that display the department name that offer maximum number of courses.
WITH DeptCourseCount AS (
SELECT d.Dept_Name,COUNT(c.Course_Number) AS CourseCount
FROM Department d
INNER JOIN Course c ON d.Dept_Code = c.Dept_Code
GROUP BY d.Dept_Name)

SELECT Dept_Name
FROM DeptCourseCount
WHERE CourseCount = (SELECT MAX(CourseCount) FROM DeptCourseCount);

---Q3: Perform a report that displays the name of each instructor with the name of courses he teaches
SELECT i.Instructor_Name,c.Course_Name
FROM Instructor i
INNER JOIN InstructorCourse ic
ON i.Instructor_ID=ic.Instructor_ID
INNER JOIN Course c
ON ic.Course_Number=c.Course_Number
ORDER BY i.Instructor_Name;

--Q4: Perform a report that display the number of students in each department
SELECT d.Dept_Name,COUNT(s.Student_ID) as Number_of_Students
FROM Student s
INNER JOIN Department d
ON s.Major_Department=d.Dept_Code
GROUP BY d.Dept_Name;

--Q5: Perform a report that display the name of department that pay total maximum salary to his instructors.
WITH TotalSalaryDept AS(
SELECT d.Dept_Name,SUM(i.Salary) AS Total_Salary
FROM Instructor i
INNER JOIN Department d
ON i.Dept_Code=d.Dept_Code
GROUP BY d.Dept_Name)

SELECT Dept_Name
FROM TotalSalaryDept 
WHERE Total_Salary=(SELECT MAX(Total_Salary) FROM TotalSalaryDept )

--Q6: Perform a report that display the name that have maximum number of students.
WITH DeptStudentCount AS (
SELECT d.Dept_Name,COUNT(s.Student_ID) AS StudentCount
FROM Department d
INNER JOIN Student s ON d.Dept_Code = s.Major_Department
GROUP BY d.Dept_Name)

SELECT Dept_Name
FROM DeptStudentCount
WHERE StudentCount = (SELECT MAX(StudentCount) FROM DeptStudentCount);

--Q7: Perform a report that display the name of instructor that take salary greater than the average salary of his department
WITH AVGSalaryDept AS (
SELECT d.Dept_Code,d.Dept_Name,AVG(i.Salary) AS AVG_Salary_Dept
FROM Instructor i
INNER JOIN Department d
ON i.Dept_Code=d.Dept_Code
GROUP BY d.Dept_Code, d.Dept_Name)

SELECT i.Instructor_Name
FROM Instructor i
INNER JOIN AVGSalaryDept ad
ON ad.Dept_Code=i.Dept_Code
WHERE i.Salary > ad.AVG_Salary_Dept;

--Q8: Perform a report that display department office telephone that his instructor earn maximum salary.
WITH MaxSalary AS(
SELECT MAX(Salary) as Max_Salary
FROM Instructor)

SELECT Office_Phone
FROM Department d
INNER JOIN Instructor i
ON d.Dept_Code=i.Dept_Code
WHERE i.Salary=(SELECT Max_Salary FROM MaxSalary);

--Q9: Perform a report that display the name of student who is participant in number of courses that greater than 3 courses
WITH CoursesStudentCount AS(
SELECT rc.Student_ID,COUNT(c.Course_Number) AS Number_of_Courses
FROM Course c
INNER JOIN RegistrationCourse rc
ON c.Course_Number=rc.Course_Number
GROUP BY rc.Student_ID)

SELECT s.Student_Name
FROM Student s
INNER JOIN CoursesStudentCount cs ON s.Student_ID=cs.Student_ID
WHERE CS.Number_of_Courses>3;

--Q10: Perform a report that displays the number of instructor in each course.
SELECT c.Course_Name,COUNT(ic.Instructor_ID) AS Number_of_Instructor
FROM InstructorCourse ic
INNER JOIN Course c
ON c.Course_Number=ic.Course_Number
GROUP BY c.Course_Name;

--Master store Procedure for 10 Quiers 
CREATE PROCEDURE sp_RunUniversityReport
    @ReportNumber INT
AS
    IF @ReportNumber = 1
    BEGIN
        -- Q1: Number of instructors per department
        SELECT d.Dept_Name, COUNT(i.Instructor_ID) AS Number_of_Instructor
        FROM Department d
        LEFT JOIN Instructor i 
            ON i.Dept_Code = d.Dept_Code
        GROUP BY d.Dept_Name
        ORDER BY Number_of_Instructor DESC;
    END
    ELSE IF @ReportNumber = 2
    BEGIN
        -- Q2: Department with maximum number of courses
        WITH DeptCourseCount AS (
            SELECT d.Dept_Name, COUNT(c.Course_Number) AS CourseCount
            FROM Department d
            LEFT JOIN Course c 
                ON d.Dept_Code = c.Dept_Code
            GROUP BY d.Dept_Name
        )
        SELECT Dept_Name
        FROM DeptCourseCount
        WHERE CourseCount = (SELECT MAX(CourseCount) FROM DeptCourseCount);
    END
    ELSE IF @ReportNumber = 3
    BEGIN
        -- Q3: Instructor with courses they teach
        SELECT i.Instructor_Name, c.Course_Name
        FROM Instructor i
        INNER JOIN InstructorCourse ic
            ON i.Instructor_ID = ic.Instructor_ID
        INNER JOIN Course c
            ON ic.Course_Number = c.Course_Number
        ORDER BY i.Instructor_Name;
    END
    ELSE IF @ReportNumber = 4
    BEGIN
        -- Q4: Number of students per department
        SELECT d.Dept_Name, COUNT(s.Student_ID) AS Number_of_Students
        FROM Department d
        LEFT JOIN Student s
            ON s.Major_Department = d.Dept_Code
        GROUP BY d.Dept_Name
        ORDER BY Number_of_Students DESC;
    END
    ELSE IF @ReportNumber = 5
    BEGIN
        -- Q5: Department paying maximum total salary
        WITH TotalSalaryDept AS (
            SELECT d.Dept_Name, SUM(i.Salary) AS Total_Salary
            FROM Department d
            INNER JOIN Instructor i
                ON i.Dept_Code = d.Dept_Code
            GROUP BY d.Dept_Name
        )
        SELECT Dept_Name
        FROM TotalSalaryDept
        WHERE Total_Salary = (SELECT MAX(Total_Salary) FROM TotalSalaryDept);
    END
    ELSE IF @ReportNumber = 6
    BEGIN
        -- Q6: Department with maximum students
        WITH DeptStudentCount AS (
            SELECT d.Dept_Name, COUNT(s.Student_ID) AS StudentCount
            FROM Department d
            LEFT JOIN Student s
                ON s.Major_Department = d.Dept_Code
            GROUP BY d.Dept_Name
        )
        SELECT Dept_Name
        FROM DeptStudentCount
        WHERE StudentCount = (SELECT MAX(StudentCount) FROM DeptStudentCount);
    END
    ELSE IF @ReportNumber = 7
    BEGIN
        -- Q7: Instructors earning above department average
        WITH AVGSalaryDept AS (
            SELECT d.Dept_Code, AVG(i.Salary) AS AVG_Salary_Dept
            FROM Department d
            INNER JOIN Instructor i
                ON i.Dept_Code = d.Dept_Code
            GROUP BY d.Dept_Code
        )
        SELECT i.Instructor_Name, i.Salary, d.Dept_Name
        FROM Instructor i
        INNER JOIN AVGSalaryDept ad
            ON i.Dept_Code = ad.Dept_Code
        INNER JOIN Department d
            ON i.Dept_Code = d.Dept_Code
        WHERE i.Salary > ad.AVG_Salary_Dept
        ORDER BY i.Salary DESC;
    END
    ELSE IF @ReportNumber = 8
    BEGIN
        -- Q8: Department office phone for instructor with max salary
        DECLARE @MaxSalary INT;
        SELECT @MaxSalary = MAX(Salary) FROM Instructor;

        SELECT d.Dept_Name, d.Office_Phone, i.Instructor_Name, i.Salary
        FROM Department d
        INNER JOIN Instructor i
            ON i.Dept_Code = d.Dept_Code
        WHERE i.Salary = @MaxSalary;
    END
    ELSE IF @ReportNumber = 9
    BEGIN
        -- Q9: Students with more than 3 courses
        WITH CoursesStudentCount AS (
            SELECT rc.Student_ID, COUNT(rc.Course_Number) AS Number_of_Courses
            FROM RegistrationCourse rc
            GROUP BY rc.Student_ID
        )
        SELECT s.Student_Name, cs.Number_of_Courses
        FROM Student s
        INNER JOIN CoursesStudentCount cs
            ON s.Student_ID = cs.Student_ID
        WHERE cs.Number_of_Courses > 3
        ORDER BY cs.Number_of_Courses DESC;
    END
    ELSE IF @ReportNumber = 10
    BEGIN
        -- Q10: Number of instructors per course
        SELECT c.Course_Name, COUNT(ic.Instructor_ID) AS Number_of_Instructor
        FROM Course c
        LEFT JOIN InstructorCourse ic
            ON c.Course_Number = ic.Course_Number
        GROUP BY c.Course_Name
        ORDER BY Number_of_Instructor DESC;
    END
    ELSE
    BEGIN
        PRINT 'Invalid Report Number. Please enter 1 to 10.';
    END;
GO

EXEC sp_RunUniversityReport @ReportNumber = 3;

DROP PROCEDURE sp_RunUniversityReport;