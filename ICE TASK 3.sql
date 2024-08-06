------------------------------------------------Question 1-----------------------------------------------

CREATE DATABASE STUDENT_REGISTRATIONS

create table STUDENTS(
STUDENT_ID VARCHAR(8) NOT NULL PRIMARY KEY,
STUDENT_NAME VARCHAR(40) NOT NULL,
STUDENT_SURNAME VARCHAR(40) NOT NULL
);



create table MODULES(
MODULE_ID VARCHAR(8) NOT NULL PRIMARY KEY,
MODULE_NAME VARCHAR(40) NOT NULL,
MODULE_CREDIT SMALLINT NOT NULL,
);


create table STUDENT_MODULES(
STUDENT_ID VARCHAR(8) NOT NULL FOREIGN KEY REFERENCES STUDENTS(STUDENT_ID),
MODULE_ID VARCHAR(8) NOT NULL FOREIGN KEY REFERENCES MODULES(MODULE_ID)
PRIMARY KEY(STUDENT_ID, MODULE_ID)
);


create table LECTURERS(
LECTURER_ID VARCHAR(8) NOT NULL PRIMARY KEY,
LECTURER_NAME VARCHAR(40) NOT NULL,
LECTURER_SURNAME VARCHAR(40) NOT NULL,
);


create table LECTURER_MODULES(
MODULE_ID VARCHAR(8) NOT NULL FOREIGN KEY REFERENCES MODULES(MODULE_ID),
LECTURER_ID VARCHAR(8) NOT NULL FOREIGN KEY REFERENCES LECTURERS(LECTURER_ID),
PRIMARY KEY(MODULE_ID, LECTURER_ID)
);



-----------------------------------------------QUESTION 2------------------------------------------

Insert into STUDENTS values('S123456','Neo','Petlele'),
('S246810','Derek','Moore'),
('S369121','Pedro','Ntaba'),
('S654321','Thabo','Joe'),
('S987654','Dominique','Woolridge');

SELECT * FROM STUDENTS;


Insert into MODULES values('DATA6212','Database Intermediate','30'),
('INPU221','Desktop Publishing','20'),
('PROG6211','Programming 2A','15'),
('PROG6212 ','Programming 2B','15'),
('WEDE220','Web Development (Intermediate)','20');

SELECT * FROM MODULES;


Insert into STUDENT_MODULES values('S123456','PROG6211'),
('S123456','PROG6212'),
('S246810','DATA6212'),
('S369121','DATA6212'),
('S369121','INPU221'),
('S369121','WEDE220'),
('S987654','PROG6211'),
('S987654','PROG6212'),
('S987654','WEDE220');

SELECT * FROM STUDENT_MODULES;


Insert into LECTURERS values('L578963','Kwezi','Mbete'),
('L876592','Julia','Robins'),
('L916482','Trevor','January');

SELECT * FROM LECTURERS;


Insert into LECTURER_MODULES values('DATA6212','L578963'),
('INPU221','L876592'),
('PROG6211','L916482'),
('PROG6212','L916482'),
('WEDE220 ','L876592');

SELECT * FROM LECTURER_MODULES;


USE STUDENT_REGISTRATIONS
GO
CREATE PROC spSTUDENT_REGISTRATIONS
AS 
SELECT * FROM  MODULES;

exec spSTUDENT_REGISTRATIONS
--------------------------------------------------------------QUESTION 3----------------------------------------------


Update STUDENTS Set STUDENT_SURNAME = 'Smith' Where STUDENT_ID = 'S987654'

SELECT * FROM STUDENTS


-------------------------------------------------------------QUESTION 4---------------------------------------------------


SELECT STUDENT_SURNAME, STUDENT_NAME, MODULE_NAME
from STUDENTS t, MODULES c, STUDENT_MODULES tc
where t.STUDENT_ID = tc.STUDENT_ID
AND c.MODULE_ID = tc.MODULE_ID
order by STUDENT_SURNAME asc


-------------------------------------------------------------QUESTION 5-----------------------------------------------------


SELECT top 1 t.STUDENT_SURNAME + ', '+ t.STUDENT_NAME as 'STUDENT' , sum(c. MODULE_CREDIT) AS 'TOTAL CREDITS'
FROM STUDENTS t
INNER JOIN STUDENT_MODULES tc
ON T.STUDENT_ID = TC.STUDENT_ID
inner join MODULES c
on c.MODULE_ID = tc.MODULE_ID
group by t.STUDENT_NAME, t.STUDENT_SURNAME
ORDER BY 'TOTAL CREDITS' DESC


-----------------------------------------------------------QUESTION 6--------------------------------------------------------


SELECT t.STUDENT_ID, t.STUDENT_SURNAME + ',' + t.STUDENT_NAME AS 'STUDENT'
FROM STUDENTS t
LEFT JOIN STUDENT_MODULES TC
ON t.STUDENT_ID = tc.STUDENT_ID
WHERE tc.MODULE_ID is null


---------------------------------------------------------QUESTION 7-----------------------------------------------------------


DELETE FROM STUDENTS WHERE STUDENT_ID = 'S654321' AND STUDENT_SURNAME = 'Joe' AND STUDENT_NAME = 'Thabo'

SELECT * FROM STUDENTS


--------------------------------------------------------QUESTION 8-----------------------------------------------------------


SELECT LECTURER_SURNAME + ',' + LECTURER_NAME AS 'LECTURER', COUNT(MODULE_ID) AS 'NUMBER OF MODULES'
FROM LECTURERS l, LECTURER_MODULES lc
WHERE l.LECTURER_ID = lc.LECTURER_ID
GROUP BY LECTURER_SURNAME,LECTURER_NAME
HAVING COUNT(MODULE_ID) > 1


-------------------------------------------------------QUESTION  9-----------------------------------------------------------


SELECT c1.MODULE_NAME, c2.MODULE_CREDIT
FROM MODULES c1, MODULES c2
WHERE c1.MODULE_ID <> c2.MODULE_ID
AND c1.MODULE_CREDIT = c2.MODULE_CREDIT
ORDER BY c2.MODULE_CREDIT ASC


