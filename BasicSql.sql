--Query to create a Books table with specified attributes
 
create table Books(
 
book_id int primary key,

title varchar(50),

author_id int,

publication_year int,

genre varchar(50),

isbn int ,

available_copies int
 
)
 
--Query to add a foreign key to Books table
 
ALTER TABLE Books

ADD FOREIGN KEY (author_id) REFERENCES Author(author_id);
 
alter table books add book_price numeric
 
--Query to insert data into Books Table
 
insert into Books (book_id,title,author_id,publication_year,genre,isbn,available_copies,book_price)

	values(101,'Bahubali',1001,2002,'its a Movie',67890,20,2989)

insert into Books (book_id,title,author_id,publication_year,genre,isbn,available_copies,book_price)

	values(102,'Pushpa',1002,2003,'its a Telugu Movie',678250,23,2890)


insert into Books (book_id,title,author_id,publication_year,genre,isbn,available_copies,book_price)

	values(103,'Kalki',1003,2004,'its a Movie',745890,60,3389)	

insert into Books (book_id,title,author_id,publication_year,genre,isbn,available_copies,book_price)

	values(104,'RRR',1004,2020,'its a Movie',878540,10,6289)	
 
 
--Query to display all details of the table Book	

select * from Books
 
 
--Query to  Retrieve all books along with their authors:
 
 
select Books.book_id , Books.title, Author.first_name from Books join Author  on Books.author_id = Author.author_id
 
 
--Query to Find all books currently on loan along with member details:
 
select Books.title , Members.first_name from Books 

	join Loans on Books.book_id = Loans.book_id 

	join Members on Loans.member_id = Members.member_id 

	where Loans.return_date isnull
 
--Query to List all books borrowed by a specific member:
 
select Books.title , Members.first_name from books 

	join Loans on Books.book_id = Loans.book_id 

	join Members on Loans.member_id = Members.member_id 

--Query to Get the total number of books and the total available copies for each genre:

SELECT Books.genre,

    COUNT(*) AS total_books,

    SUM(available_copies) AS total_available_copies

FROM books GROUP BY Books.genre;
 
 
--Query to Find all staff members who are from 'Health claims' and their hire dates:
 
select Staff.first_name ,Staff.job_title ,Staff.hire_date from Staff

		where Staff.job_title = 'Health claims'
 
 
------------------------------------------------------------------------------------------------------------------
 
 
--Query to create Author Table
 
create table Author(

author_id int primary key,

first_name varchar(50),

last_name varchar(50),

date_of_birth date,

nationality varchar(50)

)
 
--Query to insert data into Author table
 
insert into Author (author_id,first_name,last_name,date_of_birth,nationality)

	values(1001,'Surya','Kumar','10-10-2010','Indian')

 
insert into Author (author_id,first_name,last_name,date_of_birth,nationality)

	values(1002,'Abbu','Shaik','11-11-2011','Indian')

insert into Author (author_id,first_name,last_name,date_of_birth,nationality)

	values(1003,'Ajay','Gattu','12-12-2012','Indian')

insert into Author (author_id,first_name,last_name,date_of_birth,nationality)

	values(1004,'Dhanu','Reddy','1-1-2001','Indian')

select * from Author
 
 
-----------------------------------------------------------------------------------------------------------------------
 
 
--Query to create Members Table
 
create table Members(

member_id int primary key,

first_name varchar(50),

last_name varchar(50),

date_of_birth date,

contact_number numeric,

email varchar(50),

membership_date date
 
)
 
--Query to Alter Members and to add data to the table
 
ALTER TABLE Members

DROP COLUMN email;
 
insert into Members(member_id,first_name,last_name,date_of_birth,contact_number,membership_date)

	values(201,'sai','kumar','7-11-2001',234567890,'7-11-2023')
 
insert into Members(member_id,first_name,last_name,date_of_birth,contact_number,membership_date)

	values(202,'Chetan','Rao','8-10-1993',3254567890,'8-10-2020')

insert into Members(member_id,first_name,last_name,date_of_birth,contact_number,membership_date)

	values(203,'Mohan','Reddy','9-10-2001',987667890,'9-10-2024')

insert into Members(member_id,first_name,last_name,date_of_birth,contact_number,membership_date)

	values(204,'siraz','mohd','3-11-1986',934567890,'3-11-2019')


select * from Members
 
 
update Members set contact_number = 7893486983 where member_id = 201
 
 
 
--------------------------------------------------------------------------------------------------------------------
 
 
--Query to create Loans Table
 
create table Loans(

loan_id int primary key,

book_id int,

member_id int ,

loan_date date,

return_date date,

actual_return_date date
 
 
)
 
--Query to Alter Loans Table and add data to Loans Table
 
ALTER TABLE Loans

ADD FOREIGN KEY (book_id) REFERENCES Books(book_id);
 
 
ALTER TABLE Loans

ADD FOREIGN KEY (member_id) REFERENCES Members(member_id);
 
 
insert into Loans(loan_id,book_id,member_id,loan_date,return_date,actual_return_date)

	values(301,101,201,'02-12-2023','02-01-2024','02-02-2024')

insert into Loans(loan_id,book_id,member_id,loan_date,return_date,actual_return_date)

	values(302,102,202,'03-12-2023','03-01-2024','03-02-2024')	
 
insert into Loans(loan_id,book_id,member_id,loan_date,return_date,actual_return_date)

	values(303,103,203,'04-12-2023','04-01-2024','04-01-2024')
 
insert into Loans(loan_id,book_id,member_id,loan_date,return_date,actual_return_date)

	values(304,104,204,'06-11-2023','08-06-2024','08-06-2024')	


select * from Loans
 
 
delete from Loans where loan_id = 304
 
update Loans set return_date = null where return_date ='08-06-2024'



-----------------------------------------------------------------------------------------------------------------------
 
 
 
--Query to create Staff Table
 
create table Staff(

staff_id int primary key,

first_name varchar(50),

last_name varchar(50),

position varchar(50),

contact_number numeric,

email varchar(50),

hire_date date

)
 
--Queries to Alter staff table and insert data to staff table
 
ALTER TABLE Staff 

RENAME COLUMN position to job_title;
 
insert into Staff(staff_id,first_name,last_name,job_title,contact_number,email,hire_date)

	values(401,'raja','sahab','Health claims',456789987,'asdfghj@gmail.com','22-11-2020')

insert into Staff(staff_id,first_name,last_name,job_title,contact_number,email,hire_date)

	values(402,'Gabbar','singh','Health claims',5699876934,'lkjhgj@gmail.com','22-11-2020')

insert into Staff(staff_id,first_name,last_name,job_title,contact_number,email,hire_date)

	values(403,'Manohar','Bacchan','Sales',786789987,'fdhdfghj@gmail.com','22-11-2020')

insert into Staff(staff_id,first_name,last_name,job_title,contact_number,email,hire_date)

	values(404,'Ramu','reddy','Sales',678649987,'iufghj@gmail.com','20-11-2020')
 
select * from Staff
 
 
 