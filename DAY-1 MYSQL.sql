CREATE DATABASE TicketBookingSystem;
use TicketBookingSystem;

create table Venue
(
venue_id int primary key ,
venue_name varchar(250)not null,
address varchar(50) not null
);

create table Eventsavailable
(
event_id int primary key ,
event_name varchar(50) not null ,
event_date DATE not null ,
event_time TIME not null ,
venue_id int,
total_seats int not null ,
available_seats int not null ,
ticket_price DECIMAL(10,2) not null ,
event_type enum('Movie','Sports','Concert'),
booking_id int ,
foreign key (venue_id) references Venue(venue_id) on delete cascade,
foreign key (booking_id) references Booking(booking_id) on delete cascade
);


create table Customer
(
 customer_id int primary key,
 customer_name varchar(50) not null ,
 email varchar(100) unique not null,
 phone_number int not null ,
 booking_id int ,
 foreign key (booking_id) references Booking(booking_id) on delete cascade
);

create table Booking
(
 booking_id int primary key,
 customer_id int,
 event_id int ,
 num_tickets int not null ,
 total_cost DECIMAL(10,2) not null, 
 booking_date date not null,
 foreign key (customer_id) references Customer(customer_id) on delete cascade,
 foreign key (event_id) references eventsavailable(event_id) on delete cascade
);
show tables;

drop table todotask;

desc booking;

desc eventsavailable;

alter table eventsavailable modify event_name varchar(60);
