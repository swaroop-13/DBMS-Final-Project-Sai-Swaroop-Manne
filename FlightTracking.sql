-- Creating the database
CREATE DATABASE IF NOT EXISTS flight_database;

-- Using the flight_database
USE flight_database;

-- Creating table for destinations
CREATE TABLE IF NOT EXISTS destinations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name TEXT,
    price DECIMAL(10, 2)
);

-- Creating table for bookings
CREATE TABLE IF NOT EXISTS bookings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name TEXT,
    destination_id INT,
    FOREIGN KEY(destination_id) REFERENCES destinations(id)
);

-- Inserting records into destinations table
INSERT INTO destinations (name, price) VALUES ('USA', 500.0);
INSERT INTO destinations (name, price) VALUES ('UK', 600.0);
INSERT INTO destinations (name, price) VALUES ('France', 700.0);
INSERT INTO destinations (name, price) VALUES ('Germany', 550.0);
INSERT INTO destinations (name, price) VALUES ('Italy', 650.0);
INSERT INTO destinations (name, price) VALUES ('Spain', 600.0);
INSERT INTO destinations (name, price) VALUES ('Canada', 550.0);
INSERT INTO destinations (name, price) VALUES ('Australia', 750.0);
INSERT INTO destinations (name, price) VALUES ('Japan', 800.0);
INSERT INTO destinations (name, price) VALUES ('Brazil', 700.0);
INSERT INTO destinations (name, price) VALUES ('Mexico', 600.0);
INSERT INTO destinations (name, price) VALUES ('China', 750.0);
INSERT INTO destinations (name, price) VALUES ('India', 650.0);
INSERT INTO destinations (name, price) VALUES ('Russia', 700.0);
INSERT INTO destinations (name, price) VALUES ('South Africa', 600.0);
INSERT INTO destinations (name, price) VALUES ('Argentina', 700.0);
INSERT INTO destinations (name, price) VALUES ('New Zealand', 800.0);
INSERT INTO destinations (name, price) VALUES ('South Korea', 750.0);
INSERT INTO destinations (name, price) VALUES ('Thailand', 650.0);
INSERT INTO destinations (name, price) VALUES ('Turkey', 700.0);
INSERT INTO destinations (name, price) VALUES ('IreLand', 1800.0);


-- Inserting records into bookings table
INSERT INTO bookings (customer_name, destination_id) VALUES ('Aarav Sharma', 1);
INSERT INTO bookings (customer_name, destination_id) VALUES ('Aaradhya Gupta', 2);
INSERT INTO bookings (customer_name, destination_id) VALUES ('Advik Singh', 3);
INSERT INTO bookings (customer_name, destination_id) VALUES ('Ananya Verma', 4);
INSERT INTO bookings (customer_name, destination_id) VALUES ('Aarush Mishra', 5);
INSERT INTO bookings (customer_name, destination_id) VALUES ('Aayansh Patel', 6);
INSERT INTO bookings (customer_name, destination_id) VALUES ('Dhruv Yadav', 7);
INSERT INTO bookings (customer_name, destination_id) VALUES ('Ishaan Shah', 8);
INSERT INTO bookings (customer_name, destination_id) VALUES ('Mohammed Khan', 9);
INSERT INTO bookings (customer_name, destination_id) VALUES ('Reyansh Choudhary', 10);
INSERT INTO bookings (customer_name, destination_id) VALUES ('Saachi Kumar', 11);
INSERT INTO bookings (customer_name, destination_id) VALUES ('Vihaan Singh', 12);
INSERT INTO bookings (customer_name, destination_id) VALUES ('Anika Bhatia', 13);
INSERT INTO bookings (customer_name, destination_id) VALUES ('Arnav Gupta', 14);
INSERT INTO bookings (customer_name, destination_id) VALUES ('Ayesha Sharma', 15);
INSERT INTO bookings (customer_name, destination_id) VALUES ('Kabir Singh', 16);
INSERT INTO bookings (customer_name, destination_id) VALUES ('Neha Verma', 17);
INSERT INTO bookings (customer_name, destination_id) VALUES ('Prisha Yadav', 18);
INSERT INTO bookings (customer_name, destination_id) VALUES ('Rudra Singh', 19);
INSERT INTO bookings (customer_name, destination_id) VALUES ('Yashvi Gupta', 20);

-- Checking data in tables
SELECT * FROM destinations;
SELECT * FROM bookings;