CREATE DATABASE Umuzi;

CREATE TABLE Customers(
CustomerID serial PRIMARY KEY,
FirstName VARCHAR (50) NOT NULL,
LastName VARCHAR (50) NOT NULL,
Gender VARCHAR NOT NULL,
Address VARCHAR (200) NOT NULL,
Phone text NOT NULL,
Email VARCHAR (100) NOT NULL,
City VARCHAR (20) NOT NULL,
Country VARCHAR (50) NOT NULL);

CREATE TABLE Employees(
EmployeeID serial PRIMARY KEY,
FirstName VARCHAR (50) NOT NULL,
LastName VARCHAR (50) NOT NULL,
Email VARCHAR (100) NOT NULL,
JobTitle VARCHAR (20) NOT NULL);

CREATE TABLE Orders(
OrderId serial PRIMARY KEY,
ProductID int NOT NULL,
PaymentID int NOT NULL,
FulfilledByEmployeeID int NOT NULL,
DateRequired DATE NOT NULL,
DateShipped DATE,
Status VARCHAR (20) NOT NULL,
FOREIGN KEY (ProductID) REFERENCES Products (ProductID),
FOREIGN KEY (PaymentID) REFERENCES Payments (PaymentID),
FOREIGN KEY (FulfilledByEmployeeID) REFERENCES Employees (EmployeeID)
);

CREATE TABLE Payments (
CustomerID int NOT NULL,
PaymentID serial PRIMARY KEY,
PaymentDate DATE NOT NULL,
Amount_r NUMERIC(5,2) NOT NULL,
FOREIGN KEY (CustomerID) 
 REFERENCES customers (CustomerID)
);

CREATE TABLE Products (
ProductId serial PRIMARY KEY,
ProductName VARCHAR (100) NOT NULL,
Description VARCHAR (300) NOT NULL,
BuyPrice_r NUMERIC(5,2) NOT NULL);

INSERT INTO Customers (FirstName, LastName, Gender, Address, Phone, Email, City, Country)
VALUES ('John', 'Hibert', 'Male', '284 chaucer st', '084789657', 'john@gmail.com', 'Johanesburg', 'South Africa'),
('Thando', 'Sithole', 'Female', '240 Sect 1', '0794445584', 'thando.com', 'Cape Town', 'South Africa'),
('Leon', 'Glen', 'Male', '81 Everton Rd,Gilits', '0820832830', 'leon@gmail.com', 'Durban', 'South Africa'),
('Charl', 'Muller', 'Male', '290A Dorset Ecke', '+44856872553', 'Charl.muller@yahoo.com', 'Berlin', 'Germany'),
('Julia', 'Stein', 'Female', '2 Wernerring', '+448672445058', 'Js234@yahoo.com', 'Frankfurt', 'Germany');

INSERT INTO Employees (FirstName, LastName, Email, JobTitle)
VALUES ('Kani', 'Matthew', 'Mat@gmail.com', 'Manager'),
('Lesly', 'Cronje', 'LesC@gmail.com', 'Clerk'),
('Gideon', 'Maduku', 'm@gmail.com', 'Accountant');

INSERT INTO Payments(CustomerId, PaymentDate, Amount_R)
VALUES(1, '01-09-2018', '150.75'),
      (5, '03-09-2018', '150.75'),
      (4, '03-09-2018', '700.60');

INSERT INTO products(ProductName, Description, BuyPrice_R)
VALUES('Harley Davidson Chopper', 'This replica features working kickstand,front suspension, gear-shift lever', '150.75'),
('Classic Car', 'Turnable front Wheels, steering function', '550.75'),
('Sports Car', 'Turnable front Wheels, steering function', '700.60');

INSERT INTO Orders(ProductID, PaymentID, FulfilledByEmployeeID, DateRequired, DateShipped, Status)
VALUES(1, 1, 2, '05-09-2018', NULL , 'Not shipped'),
(1, 2, 2, '04-09-2018', '03-09-2018' , 'Shipped'),
(3, 3, 3, '06-09-2018', NULL , 'Not shipped');

