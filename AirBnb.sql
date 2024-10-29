CREATE DATABASE `New York AIRBnB`;
USE `New York AIRBnB`;

CREATE TABLE bookings (
	booking_id INT PRIMARY KEY,
	listing_name VARCHAR(200),
	host_id INT,
	host_name VARCHAR(50),
	neighbourhood_group VARCHAR(30),
	neighbourhood VARCHAR(30),	
	latitude DECIMAL(11,8),
	longitude DECIMAL(11,8),
	room_type VARCHAR(30),
	price INT,
	minimum_nights INT,
	num_of_reviews INT,
	last_review DATE,
	reviews_per_month DECIMAL(4,2),
	calculated_host_listings_count INT,
	availability_365 INT
);

SELECT * FROM bookings;

-- 1.To show Average price using OVER
SELECT
	booking_id,
	listing_name,
	neighbourhood_group,
	ROUND(AVG(price) OVER(),2) Avg_price
FROM bookings;

-- 2.Find Percent difference from average price
SELECT  
    booking_id,  
    listing_name,  
    neighbourhood_group,  
    price,  
    AVG(price) OVER() AS Avg_price,  
    ROUND((price / AVG(price) OVER() - 1) * 100, 2) AS Percentage_Diff_Avg_price 
FROM bookings;

-- 3.To show Average, minimum and maximum price using OVER
SELECT
	booking_id,
	listing_name,
	neighbourhood_group,
    MAX(price) OVER() Max_price,
    MIN(price) OVER() Min_price
FROM bookings;

-- 4.Find the Percent of average price with OVER()
SELECT
	booking_id,
	listing_name,
	neighbourhood_group,
	price,
	AVG(price) OVER() Avg_price,
	ROUND((price / AVG(price) OVER()* 100), 2)  Diff_of_Price_Avg_price
FROM bookings;

-- 5.To show Difference from average price with OVER from the price
SELECT
	booking_id,
	listing_name,
	neighbourhood_group,
	price,
	AVG(price) OVER() Avg_price,
	ROUND((price - AVG(price) OVER()), 2)  Diff_of_Price_Avg_price
FROM bookings;

--

