CREATE DATABASE TicketBookingSystem;
use TicketBookingSystem;

create table Venue
(
venue_id int primary key auto_increment,
venue_name varchar(250)not null,
address varchar(50) not null
);

create table Eventsavailable
(
event_id int primary key auto_increment ,
event_name varchar(50) not null ,
event_date DATE not null ,
event_time TIME not null ,
venue_id int,
total_seats int not null ,
available_seats int not null ,
ticket_price DECIMAL(10,2) not null ,
event_type enum('Movie','Sports','Concert'),
booking_id int ,
constraint fk foreign key (venue_id) references Venue(venue_id) on delete cascade,
constraint fk1 foreign key (booking_id) references Booking(booking_id) on delete cascade
);


create table Customer
(
 customer_id int primary key auto_increment,
 customer_name varchar(50) not null ,
 email varchar(100) unique not null,
 phone_number int not null ,
 booking_id int ,
 constraint fk2 foreign key (booking_id) references Booking(booking_id) on delete cascade
);

create table Booking
(
 booking_id int primary key auto_increment,
 customer_id int,
 event_id int ,
 num_tickets int not null ,
 total_cost DECIMAL(10,2) not null, 
 booking_date date not null,
 constraint fk3 foreign key (customer_id) references Customer(customer_id) on delete cascade,
 constraint fk4 foreign key (event_id) references eventsavailable(event_id) on delete cascade
);

show tables;

set foreign_key_checks =0;

desc booking;

desc eventsavailable;

alter table eventsavailable modify event_name varchar(60);


-- Write a SQL query to insert at least 10 sample records into each table.
insert into venue(venue_id , venue_name , address)
values 
(1, 'Wankhede Stadium', 'Mumbai'),
(2, 'stadium','bangalore'),
(3, 'VR Mall','chennai'),
(4, 'M. A. Chidambaram Stadium','Chepauk'),
(5, 'Biswa Bangla Convention Centre','Kolkata'),
(6, 'PVR ICON','chennai'),
(7, 'Siri Fort Auditorium','New delhi'),
(8, 'Salt Lake Stadium','Kolkata'),
(9, 'Indira Gandhi Indoor Stadium','New Delhi'),
(10, 'IMAX','Mumbai');

select * from venue;


INSERT INTO eventsavailable 
(event_id, event_name, event_date, event_time, venue_id, total_seats, available_seats, ticket_price, event_type, booking_id) 
VALUES
(101, 'IPL Match - CSK vs MI', '2025-05-10', '18:30:00', 1, 50000, 25000, 999.99, 'Sports', 1001),
(102, 'Arijit Singh Live', '2025-05-12', '19:00:00', 2, 10000, 3000, 1499.50, 'Concert', 1002),
(103, 'Mission India Premiere', '2025-05-01', '17:00:00', 3, 200, 50, 299.99, 'Movie', 1003),
(104, 'Zakir Khan Live', '2025-05-03', '20:00:00', 4, 600, 150, 499.99, 'Concert', 1004),
(105, 'FIFA U-20 Qualifier', '2025-06-01', '16:00:00', 5, 60000, 20000, 899.00, 'Sports', 1005),
(106, 'Nucleya Night', '2025-05-08', '21:00:00', 6, 15000, 5000, 1099.75, 'Concert', 1006),
(107, 'Avatar 3 - IMAX', '2025-05-15', '15:00:00', 7, 250, 100, 349.99, 'Movie', 1007),
(108, 'Shershaah - Re-Release', '2025-05-05', '18:00:00', 3, 150, 60, 249.99, 'Movie', 1008),
(109, 'India vs Australia T20', '2025-05-20', '18:00:00', 9, 50000, 10000, 1199.99, 'Sports', 1009),
(110, 'Sunburn Reload', '2025-06-10', '17:30:00', 10, 10000, 3000, 1599.50, 'Concert', 1010),
(111, 'Worldcup 2025', '2025-06-10', '17:30:00', 10, 10000, 3000, 8599.50, 'Sports', 1011);
select *from eventsavailable;
truncate table customer;


INSERT INTO Customer (customer_id, customer_name, email, phone_number, booking_id) 
VALUES
(201, 'priya', 'priya@gmail.com', 9876543210 ,1001),
(202, 'Sneha ', 'sneha@gmail.com', 9876501234,1002),
(203, 'Rahul', 'rahul@gmail.com', 9867543211,1003),
(204, 'riya', 'riya@gmail.com', 9845623123,1004),
(205, 'Rao', 'roa@gmail.com', 9832167890,1005),
(206, 'Meera', 'meera@gmail.com', 9823456789,1006),
(207, 'Deepak', 'deepak@gmail.com', 9812763450,1007),
(208, 'Roy', 'roy@gmail', 9801234567,1008),
(209, 'Rohan', 'rohan@gmail.com', 9798654321,1009),
(210, 'Pooja Iyer', 'pooja@gmail.com', 9786543210,1010);

ALTER TABLE Customer MODIFY phone_number VARCHAR(15);

select * from customer;

INSERT INTO Booking (booking_id, customer_id, event_id, num_tickets, total_cost, booking_date) VALUES
(1001, 201, 101, 3, 2999.97, '2025-04-25'),
(1002, 202, 102, 2, 2999.00, '2025-04-26'),
(1003, 203, 103, 4, 1199.96, '2025-04-27'),
(1004, 204, 104, 2, 999.98, '2025-04-27'),
(1005, 205, 105, 5, 4495.00, '2025-04-28'),
(1006, 206, 106, 3, 3299.25, '2025-04-28'),
(1007, 207, 107, 2, 699.98, '2025-04-29'),
(1008, 208, 108, 1, 99.99, '2025-04-29'),
(1009, 209, 109, 2, 2399.98, '2025-04-30'),
(1010, 210, 110, 3, 4798.50, '2025-04-30');

select * from booking;
-- Task 2 
-- 2
select event_name from eventsavailable;

-- 3
select event_name , available_seats from eventsavailable where available_seats>0 order by available_seats;

-- 4
Select event_name From eventsavailable where event_name like '%cup%';

-- 5
select * from eventsavailable where ticket_price between 1000 and 2500;

-- 6
select event_name, event_date from eventsavailable where event_date between '2025-05-01' and '2025-05-10';

-- 7
select event_name , available_seats, event_type from eventsavailable where available_seats> 0 and event_type like "%concert%";

-- 8
select * from Customer order by customer_id limit 5 offset 5;

-- 9
select * from booking where num_tickets > 4;

-- 10
select * from customer where phone_number like '%000';

-- 11
select * from eventsavailable where total_seats > 15000 order by total_seats;

-- 12
select * from eventsavailable where event_name not like 'x%' and event_name not like 'y%'and event_name not like 'z%';
