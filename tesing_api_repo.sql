-- Databricks notebook source
CREATE DATABASE IF NOT EXISTS test;

-- COMMAND ----------

DROP TABLE IF EXISTS test.employees_data;

-- COMMAND ----------

create table test.employees_data (
	emp_id int,
	first_name string,
	last_name string,
	email string,
	gender string
);

-- COMMAND ----------

insert into test.employees_data (id, first_name, last_name, email, gender) 
values 
(1, 'Demetrius', 'Leathlay', 'dleathlay0@lycos.com', 'Male'), 
(2, 'Marlon', 'Charity', 'mcharity1@parallels.com', 'Male'), 
(3, 'Johann', 'Mucci', 'jmucci2@cyberchimps.com', 'Male'),
(4, 'Obie', 'Tomas', 'otomas3@nifty.com', 'Male'),
(5, 'Pinchas', 'Pimm', 'ppimm4@army.mil', 'Male'),
(6, 'Benny', 'Liffey', 'bliffey5@abc.net.au', 'Male'),
(7, 'Eldridge', 'Ind', 'eind6@wix.com', 'Male'),
(8, 'Giustina', 'McEnteggart', 'gmcenteggart7@biblegateway.com', 'Female'),
(9, 'Quinton', 'Secrett', 'qsecrett8@cdbaby.com', 'Male'),
(10, 'Anny', 'Blamires', 'ablamires9@cocolog-nifty.com', 'Female');
