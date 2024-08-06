CREATE TABLE custemers(
Cus_number varchar (10) not null primary key,
Cus_Fname varchar (30) not null,
Cus_Lname varchar (130) not null,
Cus_gender varchar (10) not null,
Cus_age int not null
);

insert into custemers values('1670', 'Busi', 'Mhlongo', 'Female', '18'),
('1671', 'Tlangie', 'Mkansi', 'Female', '25'),
('1672', 'Cynthia', 'Baloyi', 'Female', '18'),
('1673', 'Andziso', 'Baloyi', 'Male', '3'),
('1674', 'Jonathan ', 'Mabunda', 'Male', '287');

SELECT * FROM custemers;
select Cus_number from custemers where Cus_gender = 'Male';  
select Cus_number from custemers where Cus_age <18; 

CREATE TABLE Orders(
Order_number varchar (10) not null primary key,
Order_name varchar (20) not null,
Order_size varchar (10) not null,
);

insert into Orders values('1', 'Shoe', '7'),
('2', 'Pants', 'XXL'),
('3', 'T-sHIRT', 'Large');

SELECT * FROM Orders;