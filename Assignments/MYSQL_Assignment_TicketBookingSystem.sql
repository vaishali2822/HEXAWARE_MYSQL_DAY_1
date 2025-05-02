CREATE DATABASE TicketBookingSystem;
use TicketBookingSystem;
-- -------------------------------------------------------task 1--------------------------------------------------------
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


----------------------------------------------------- Task 2 --------------------------------------------------

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



----------------------------------------- task 3-----------------------------------------------------------
-- 1
select  event_name , avg(ticket_price) as total_sales from eventsavailable group by event_name;

-- 2
select sum(total_cost) as total_revenue from booking;

-- 3. 
select e.event_id, e.event_name, sum(num_tickets)as TotalSales from booking b 
inner join eventsavailable e on b.event_id =  e.event_id  
group by b.event_id order by  TotalSales desc limit 1;

-- 4
select event_id , sum(num_tickets) as Totaltickets from booking group by event_id order by Totaltickets desc;

-- 5
select e.event_id ,e.event_name from eventsavailable e 
left join booking b on e.event_id = b.event_id 
where num_tickets is null ;


-- 6
select c.customer_id ,c.customer_name, sum(num_tickets) as Tickets_Booked from customer c
inner join booking b on c.customer_id = b.customer_id
group by c.customer_id, c.customer_name order by Tickets_Booked desc limit 1;


-- 7
SELECT monthname(booking_date) AS month, event_id, SUM(num_tickets)  as Total_Ticket_Booked
FROM Booking 
GROUP BY monthname(booking_date), event_id;

-- 8
SELECT v.venue_name,
AVG(e.ticket_price) AS average_ticket_price
FROM eventsavailable e
JOIN Venue v ON e.venue_id = v.venue_id
GROUP BY v.venue_name
ORDER BY average_ticket_price DESC;

-- 9
select e.event_id , e.event_type , sum(num_tickets) as Total_Tickets_Sold from eventsavailable e
join booking b on e.event_id = b.event_id
group by e.event_type , event_id
order by Total_Tickets_Sold desc;

-- 10.
select year(b.booking_date) AS year,
SUM(b.num_tickets * e.ticket_price) AS total_revenue
FROM Booking b
join eventsavailable e ON b.event_id = e.event_id
group by year(b.booking_date)
order BY year DESC;

-- 11.
select c.customer_name, 
COUNT(distinct b.event_id) as events_booked
from Booking b
join Customer c ON b.customer_id = c.customer_id
group by c.customer_name
having COUNT(distinct b.event_id) > 1;


-- 12
SELECT c.customer_name,
SUM(b.num_tickets * e.ticket_price) AS total_revenue
FROM Booking b
JOIN Customer c ON b.customer_id = c.customer_id
JOIN eventsavailable e ON b.event_id = e.event_id
GROUP BY c.customer_name, c.email
ORDER BY total_revenue DESC;

-- 13
select e.event_id ,e.event_type, avg(e.ticket_price) as avg_ticket_price , venue_name
from eventsavailable e
join venue v on e.event_id= e.event_id
group by e.event_type , e.event_id , venue_name
order by e.event_type;

-- 14.Write a SQL query to list Users and the Total Number of Tickets They've Purchased in the Last 30Days.
SELECT c.customer_name,
SUM(b.num_tickets) AS total_tickets
FROM Booking b
JOIN Customer c ON b.customer_id = c.customer_id
WHERE b.booking_date >= CURDATE() - INTERVAL 30 DAY
GROUP BY c.customer_name
ORDER BY total_tickets DESC;


-- -----------------------------------------------------task 4---------------------------------------------------
-- 1
SELECT v.venue_name,
(SELECT AVG(e.ticket_price)
FROM eventsavailable e
WHERE e.venue_id = v.venue_id) AS average_ticket_price
FROM Venue v;


-- 2
SELECT event_name, total_seats, available_seats
FROM eventsavailable
WHERE (total_seats - available_seats) > (total_seats * 0.5);


-- 3
SELECT e.EVENT_NAME,
(SELECT SUM(NUM_TICKETS)FROM Booking b WHERE e.event_id= b.event_id) TOTAL_TICKETS_SOLD
FROM eventsavailable  e;


-- 4
SELECT c.customer_name, c.email
FROM Customer c
WHERE NOT EXISTS (
    SELECT 1
    FROM Booking b
    WHERE b.customer_id = c.customer_id
);


-- 5
SELECT event_name, event_date
FROM eventsavailable
WHERE event_id NOT IN (SELECT DISTINCT event_id FROM Booking);

-- 6
SELECT event_type, SUM(total_tickets_sold) AS total_tickets_sold
FROM (SELECT e.event_type, b.num_tickets AS total_tickets_sold FROM Booking b JOIN eventsavailable e  ON b.event_id = e.event_id) 
AS EventTickets
GROUP BY event_type;



-- 7
select event_name,ticket_price
from eventsavailable
where ticket_price >(select avg(ticket_price)from eventsavailable);

-- 8
SELECT c.customer_id,c.customer_name,
(SELECT SUM(b.total_cost) FROM Booking b WHERE b.customer_id = c.customer_id) AS total_revenue
FROM Customer c;

-- 9
SELECT c.customer_name,c.email
FROM  Customer AS c
WHERE  c.customer_id IN (SELECT b.customer_id FROM Booking AS b WHERE b.event_id IN (SELECT e.event_id FROM eventsavailable AS e WHERE e.venue_id = 5 ));


-- 10.

SELECT 
    e.event_type,
    SUM(total.total_tickets) AS total_tickets_sold
FROM (
    SELECT 
        event_id, 
        SUM(num_tickets) AS total_tickets
    FROM Booking
    GROUP BY event_id
) AS total
JOIN eventsavailable e ON total.event_id = e.event_id
GROUP BY e.event_type;

-- 11
SELECT  c.customer_name,
YEAR(b.booking_date) AS booking_year,
MONTH(b.booking_date) AS booking_month,
SUM(b.num_tickets) AS total_tickets
FROM Booking AS b
JOIN Customer AS c ON c.customer_id = b.customer_id
WHERE b.booking_date IS NOT NULL
GROUP BY  c.customer_name, YEAR(b.booking_date), MONTH(b.booking_date)
ORDER BY  booking_year, booking_month;


-- 12.Calculate the Average Ticket Price for Events in Each Venue Using a Subquery

SELECT 
    event_name,
    venue_id,
    (SELECT AVG(e2.ticket_price)
     FROM eventsavailable e2
     WHERE e2.venue_id = e1.venue_id) AS avg_ticket_price
FROM 
    eventsavailable e1;
