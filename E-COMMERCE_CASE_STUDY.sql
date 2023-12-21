CREATE DATABASE CASE_STUDIES

--E-COMMERCE

CREATE TABLE Customers (
customer_ID INT PRIMARY KEY,
name VARCHAR(50),
email VARCHAR(50),
password VARCHAR(50)
);
INSERT INTO Customers(customer_ID, name, email, password) VALUES
(1, 'John Doe', 'johndoe@example.com', '123 Main St, City'),
(2, 'Jane Smith', 'janesmith@example.com', '456 Elm St, Town'),
(3, 'Robert Johnson', 'robert@example.com', '789 Oak St, Village'),
(4, 'Sarah Brown', 'sarah@example.com', '101 Pine St, Suburb'),
(5, 'David Lee', 'david@example.com', '234 Cedar St, District'),
(6, 'Laura Hall', 'laura@example.com', '567 Birch St, County'),
(7, 'Michael Davis', 'michael@example.com', '890 Maple St, State'),
(8, 'Emma Wilson', 'emma@example.com', '321 Redwood St, Country'),
(9, 'William Taylor', 'william@example.com', '432 Spruce St, Province'),
(10, 'Olivia Adams', 'olivia@example.com', '765 Fir St, Territory');

CREATE TABLE Product (
product_ID INT PRIMARY KEY,
name VARCHAR(50),
description VARCHAR(50),
price smallmoney,
stockQuantity INT
);

INSERT INTO Product (product_ID, name, description, price, stockQuantity) VALUES
(1, 'Laptop', 'High-performance laptop', 800, 10),
(2, 'Smartphone', 'Latest smartphone', 600, 15),
(3, 'Tablet', 'Portable tablet', 300, 20),
(4, 'Headphones', 'Noise-canceling', 150, 30),
(5, 'TV', '4K Smart TV', 900, 5),
(6, 'Coffee Maker', 'Automatic coffee maker', 50, 25),
(7, 'Refrigerator', 'Energy-efficient', 700, 10),
(8, 'Microwave Oven', 'Countertop microwave', 80, 15),
(9,'Blender','High-speed blender',70,20),
(10,'Vaccum Cleaner','Bagless vaccum cleaner',120,10);

CREATE TABLE Cart (
cart_ID INT PRIMARY KEY,
customer_ID INT foreign key(customer_ID) references Customers(customer_ID) on delete cascade,
product_ID INT foreign key(product_ID) references Product(product_ID) on delete cascade,
quantity INT
);
INSERT INTO Cart (cart_ID, customer_ID, product_ID, quantity) VALUES
(1, 1, 1, 2),
(2, 1, 3, 1),
(3, 2, 2, 3),
(4, 3, 4, 4),
(5, 3, 5, 2),
(6, 4, 6, 1),
(7, 5, 1, 1),
(8, 6, 10, 2),
(9, 6, 9, 3),
(10, 7, 7, 2);

CREATE TABLE Orders (
order_ID INT PRIMARY KEY,
customer_ID INT foreign key(customer_ID) references Customers(customer_ID) on delete cascade,
order_date DATE,
total_price smallmoney,
shipping_address varchar(50)
);
INSERT INTO Orders(order_ID, customer_ID, order_date, total_price,shipping_address) VALUES
(1, 1, '2023-01-05', 1200, '123 Main St, City'),
(2, 2, '2023-02-10', 900, '456 Elm St, Town'),
(3, 3, '2023-03-15', 300, '789 Oak St, Village'),
(4, 4, '2023-04-20', 150, '101 Pine St, Suburb'),
(5, 5, '2023-05-25', 1800, '234 Cedar St, District'),
(6, 6, '2023-06-30', 400, '567 Birch St, County'),
(7, 7, '2023-07-05', 700, '890 Maple St, State'),
(8, 8, '2023-08-10', 160, '321 Redwood St, Country'),
(9, 9, '2023-09-15', 140, '432 Spruce St, Province'),
(10, 10, '2023-10-20', 1400, '765 Fir St, Territory');


CREATE TABLE Order_Items (
order_item_ID INT PRIMARY KEY,
order_ID INT foreign key(order_ID) references Orders(order_ID) on delete cascade,
product_ID INT foreign key(product_ID) references Product(product_ID) on delete cascade,
quantity INT
);
INSERT INTO Order_Items (order_item_ID, order_ID, product_ID, quantity) VALUES
(1, 1, 1, 2),
(2, 1, 3, 1),
(3, 2, 2, 3),
(4, 3, 5, 2),
(5, 4, 4, 4),
(6, 4, 6, 1),
(7, 5, 1, 1),
(8, 5, 2, 2),
(9, 6, 10, 2),
(10, 6, 9, 3);