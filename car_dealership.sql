CREATE TABLE Salesperson (
    salesperson_id INT PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    phone VARCHAR NOT NULL,
    email VARCHAR NOT NULL
);

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    phone_nmber VARCHAR,
    email VARCHAR,
    customer_address VARCHAR
);

CREATE TABLE Car (
    car_id INT PRIMARY KEY,
    car_make VARCHAR NOT NULL,
    car_model VARCHAR NOT NULL,
    car_year INT NOT NULL,
    car_price DECIMAL(7, 2) NOT NULL
);

CREATE TABLE Mechanic (
    mechanic_id INT PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    phone VARCHAR,
    email VARCHAR,
    cars_serviced VARCHAR
);

CREATE TABLE Invoice (
    invoice_id INT PRIMARY KEY,
    salesperson_id INT,
    customer_id INT,
    car_id INT,
    invoice_amount DECIMAL(7, 2),
    invoice_date DATE,
    FOREIGN KEY (salesperson_id) REFERENCES Salesperson(salesperson_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (car_id) REFERENCES Car(car_id)
);

CREATE TABLE ServiceTicket (
    ticket_id INT PRIMARY KEY,
    customer_id INT,
    car_id INT,
    service_date DATE('DD/MM/YYYY'),
    service_type VARCHAR,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (car_id) REFERENCES Car(car_id)
);

CREATE TABLE ServiceHistory (
    service_id INT PRIMARY KEY,
    customer_id INT,
    car_id INT,
    mechanic_id INT,
    service_desc VARCHAR,
    service_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (car_id) REFERENCES Car(car_id),
    FOREIGN KEY (mechanic_id) REFERENCES Mechanic(mechanic_id)
);

insert into Customer
values 
    (1, 'FakeFirst', 'FakeLast', '(999)999-9999', 'fake_email@gmail.com'),
    (2, 'FakeFirstTwo', 'FakeLastTwo', '(234)456-678', 'fake_email2@gmail.com'),
    (3, 'FakeFirstThree', 'FakeLastThree', '(123)456-3452', 'fake_email3@gmail.com');

select * from Customer;

insert into Salesperson
values 
    (1, 'SalesFirst', 'SalesLast', '(888)888-8888', 'sales_email@gmail.com'),
    (2, 'SalesFirstTwo', 'SalesLastTwo', '(867)468-3455', 'sales_email2@gmail.com');

select * from Salesperson;

insert into Mechanic
values (1, 'MechanicFirst', 'MechanicLast', '(777)777-7777', 'mech_email@gmail.com', 'cars serviced');

select * from Mechanic;

insert into Car 
	values (1, 'Toyota', 'Tundra', 2017, 20000)
	
select * from Car;

insert into Invoice
values (1, 2, 3, 1, 120.45);

select * from Invoice