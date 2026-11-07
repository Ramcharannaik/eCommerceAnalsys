-- ============================================================
-- SQL E-COMMERCE SALES ANALYSIS
-- Database: EcommerceAnalysis
-- Table: Orders
-- ============================================================


-- ============================================================
-- 1. CREATE DATABASE
-- ============================================================

CREATE DATABASE EcommerceAnalysis;

USE EcommerceAnalysis;


-- ============================================================
-- 2. CREATE ORDERS TABLE
-- ============================================================

CREATE TABLE Orders
(
    Order_ID INT,
    Order_Date DATE,
    Customer VARCHAR(50),
    Product VARCHAR(50),
    Category VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10,2),
    City VARCHAR(50),
    Payment_Mode VARCHAR(30)
);


-- ============================================================
-- 3. INSERT DATA INTO ORDERS TABLE
-- ============================================================

INSERT INTO Orders VALUES
(1001,'2026-01-05','Ravi','Laptop','Electronics',1,55000,'Chennai','UPI'),
(1002,'2026-01-08','Priya','Mouse','Electronics',2,800,'Bangalore','Card'),
(1003,'2026-01-12','Arjun','Shoes','Fashion',1,2500,'Hyderabad','UPI'),
(1004,'2026-01-18','Sneha','Keyboard','Electronics',1,1500,'Chennai','Cash'),
(1005,'2026-01-22','Ravi','T-Shirt','Fashion',3,900,'Coimbatore','UPI'),
(1006,'2026-02-03','Meena','Headphones','Electronics',2,1800,'Hyderabad','Card'),
(1007,'2026-02-07','Karthik','Jeans','Fashion',2,2200,'Bangalore',NULL),
(1008,'2026-02-11','Priya','Monitor','Electronics',1,12000,'Chennai','Card'),
(1009,'2026-02-15','Arjun','Shoes','Fashion',2,2500,'Coimbatore','Cash'),
(1010,'2026-02-20','Sneha','Mouse','Electronics',3,800,'Chennai','UPI'),
(1011,'2026-03-02','Ravi','Laptop','Electronics',1,55000,'Hyderabad','Card'),
(1012,'2026-03-06','Meena','T-Shirt','Fashion',2,900,'Bangalore','UPI'),
(1013,'2026-03-10','Karthik','Keyboard','Electronics',2,1500,'Chennai','Cash'),
(1014,'2026-03-15','Priya','Jeans','Fashion',1,2200,NULL,'UPI'),
(1015,'2026-03-21','Arjun','Headphones','Electronics',1,1800,'Hyderabad','Card'),
(1016,'2026-04-04','Sneha','Monitor','Electronics',1,12000,'Bangalore','UPI'),
(1017,'2026-04-09','Ravi','Shoes','Fashion',1,2500,'Chennai','Cash'),
(1018,'2026-04-13','Meena','Laptop','Electronics',1,55000,'Coimbatore','Card'),
(1019,'2026-04-19','Karthik','T-Shirt','Fashion',4,900,'Hyderabad','UPI'),
(1020,'2026-04-25','Priya','Mouse','Electronics',2,800,'Bangalore','Card'),
(1019,'2026-04-19','Karthik','T-Shirt','Fashion',4,900,'Hyderabad','UPI'),
(1021,'2026-05-03','Ravi','Keyboard','Electronics',1,1500,'Chennai','UPI'),
(1022,'2026-05-08','Sneha','Jeans','Fashion',2,2200,'Coimbatore','Cash'),
(1023,'2026-05-14','Meena','Headphones','Electronics',2,1800,'Bangalore','Card'),
(1024,'2026-05-20','Arjun','Monitor','Electronics',1,12000,'Hyderabad','UPI'),
(1025,'2026-05-27','Karthik','Shoes','Fashion',2,2500,'Chennai','Cash');


-- ============================================================
-- 4. BASIC DATA EXPLORATION
-- ============================================================

-- View all records
SELECT *
FROM Orders;


-- Count total number of records
SELECT COUNT(*) AS Total_Orders
FROM Orders;


-- Find different product categories
SELECT DISTINCT Category
FROM Orders;


-- Find different cities
SELECT DISTINCT City
FROM Orders;


-- ============================================================
-- 5. CREATE REVENUE COLUMN
-- ============================================================

-- Add Revenue column to the Orders table
ALTER TABLE Orders
ADD Revenue DECIMAL(12,2);


-- Calculate revenue for each order
-- Revenue = Quantity × Price
UPDATE Orders
SET Revenue = Quantity * Price;


-- ============================================================
-- 6. REVENUE ANALYSIS
-- ============================================================

-- Calculate total revenue
SELECT SUM(Revenue) AS Total_Revenue
FROM Orders;


-- Calculate revenue by category
SELECT
    Category,
    SUM(Revenue) AS Total_Revenue
FROM Orders
GROUP BY Category
ORDER BY Total_Revenue DESC;


-- Find the top 5 products by revenue
SELECT TOP 5
    Product,
    SUM(Revenue) AS Total_Revenue
FROM Orders
GROUP BY Product
ORDER BY Total_Revenue DESC;


-- Calculate revenue by city
SELECT
    City,
    SUM(Revenue) AS Total_Revenue
FROM Orders
GROUP BY City
ORDER BY Total_Revenue DESC;


-- ============================================================
-- 7. CASE WHEN - SALES CLASSIFICATION
-- ============================================================

-- Classify each order based on its revenue
SELECT
    Order_ID,
    Revenue,
    CASE
        WHEN Revenue >= 10000 THEN 'HIGH'
        WHEN Revenue >= 5000 AND Revenue < 10000 THEN 'MEDIUM'
        WHEN Revenue < 5000 THEN 'LOW'
    END AS Sales_Category
FROM Orders;


-- ============================================================
-- 8. NULL HANDLING
-- ============================================================

-- Find orders where City or Payment_Mode is missing
SELECT *
FROM Orders
WHERE City IS NULL
   OR Payment_Mode IS NULL;


-- Replace missing Payment_Mode values with 'UNKNOWN'
SELECT
    Order_ID,
    ISNULL(Payment_Mode, 'UNKNOWN') AS Payment_Mode
FROM Orders;


-- ============================================================
-- 9. DATE ANALYSIS
-- ============================================================

-- Calculate total revenue for each month
SELECT
    MONTH(Order_Date) AS Sales_Month,
    SUM(Revenue) AS Total_Revenue
FROM Orders
GROUP BY MONTH(Order_Date)
ORDER BY Sales_Month;


-- ============================================================
-- 10. WINDOW FUNCTION - PRODUCT RANKING
-- ============================================================

-- Rank products based on their total revenue
SELECT
    Product,
    SUM(Revenue) AS Total_Revenue,
    RANK() OVER(
        ORDER BY SUM(Revenue) DESC
    ) AS Product_Rank
FROM Orders
GROUP BY Product;


-- ============================================================
-- 11. FINAL CHECK
-- ============================================================

-- View the final Orders table
SELECT *
FROM Orders;


-- ============================================================
-- END OF ANALYSIS
-- ============================================================