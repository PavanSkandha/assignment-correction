create table states2
(
stateid int primary key identity,
statename varchar(40),
statecode varchar(40),
region varchar(40),
language varchar(40)
)

select * from states2
select * from students3

create table students3
(
rollno int primary key identity,
name varchar(40),
stateid int foreign key references states(stateid),
class varchar(40),
section varchar(40)
)
insert into students3(name,stateid,class,section) values('nikhil',1,'9th','A');
insert into students3(name,stateid,class,section) values('pavan',2,'9th','A');
select * from students3


insert into states2(statename,statecode,region,language) values('gujarat','gj','north','gujrati');
insert into states2(statename,statecode,region,language) values('andhra pradesh','AP','south','telugu');
select * from states2

alter proc Insert_Data_Table
(
@statename varchar(40),
@statecode varchar(40),
@region varchar(40),
@language varchar(40),  


@name varchar(40),
@class varchar(40),
@section varchar(40)
)
as
begin
insert into states2(statename,statecode,region,language) values(@statename,@statecode,@region,@language)
declare @id int
select @id=SCOPE_IDENTITY()
insert into students3(name,class,section,stateid) values(@name,@class,@section,@id)
end

exec Insert_Data_Table 'karnataka','1','adf','hhgj','pavan','.net','palle'   
exec Insert_Data_Table 'kerala','kl','south','malyalam','jeevan','9th','B'  
select * from students3
select * from states2




alter proc Fetch_Data
(
@id int


)
as
begin
if(ISNULL(@id,'')!='')
begin
select s.stateid,s.rollno,s.name,s.class,s.section,st.statename,st.statecode,st.region,st.language
from states2 st join students3 s on st.stateid=s.stateid and st.stateid=@id 
end
else
begin
select s.stateid,s.rollno,s.name,s.class,s.section,st.statename,st.statecode,st.region,st.language
from states2 st join students3 s on st.stateid=s.stateid
end
end
exec Fetch_Data 2
