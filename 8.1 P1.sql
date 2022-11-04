	--What is the Current Date and time
--SQL Server has a way to find the answer



drop view if EXISTS dbo.v_hello_world_load;
go

Create View dbo.v_hello_world_load
AS

--Name: dbo.v_hello_world_load
--Purpose: Create The hellow World Load View 

--Ver     Date        Author            Description
--___     _____   ______________        ______________
--1.0    11/1/22	Jenafae Holley		  1. Built for EC IT143

--runtime:
--NOt Sure yet

--Notes:
--***************************************************************************
Select 'Hello World' As My_Message,
GETDATE() As Current_date_time;




-- thing 2
Select v.my_message,
v.current_date_time
INTO dbo.t_hello_World
From dbo.v_hello_world_load AS v;



---thing 3 
drop table if EXISTS dbo.t_hello_World
Go
Create Table dbo.t_hello_World
(my_message     Varchar(25) Not Null,
Current_Date_time DateTime NOT NULL
		Default GETDATE(),
Constraint PK_t_hello_world PRIMARY KEY CLUSTERED (my_message ASC)
);
Go

--thing 4 
begin

TRUNCATE Table dbo.t_hello_World;

insert INTO dbo.t_hello_World
Select v.My_Message
, v. current_date_time
from dbo.v_hello_world_load as v;

Select t.*
From dbo.t_hello_World AS t;

end;
go


EXEC dbo.usp_hello_world_load;