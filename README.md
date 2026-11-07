# SQL E-Commerce Sales Analysis

## 📌 Project Overview

This project is a hands-on **E-Commerce Sales Analysis** performed using **Microsoft SQL Server**.

The objective of this project is to explore e-commerce order data, calculate revenue, analyze sales patterns, and apply SQL concepts to answer basic business questions.

This project represents my first step in moving from **learning SQL concepts through tutorials to applying them to a practical dataset**.

---

## 🎯 Project Objectives

The project focuses on:

- Exploring the e-commerce dataset
- Understanding the available categories and cities
- Calculating total revenue
- Analyzing revenue by category
- Identifying the top 5 products by revenue
- Analyzing revenue by city
- Classifying orders based on sales value
- Identifying and handling NULL values
- Analyzing monthly revenue
- Ranking products based on total revenue

---

## 🗂️ Dataset

The dataset contains e-commerce order information with the following columns:

| Column | Description |
|---|---|
| `Order_ID` | Identifier for each order |
| `Order_Date` | Date on which the order was placed |
| `Customer` | Customer name |
| `Product` | Product purchased |
| `Category` | Product category |
| `Quantity` | Number of units purchased |
| `Price` | Price per unit |
| `City` | Customer city |
| `Payment_Mode` | Mode of payment |

The dataset contains **26 records** and includes intentionally placed NULL values to practice data cleaning and NULL handling.

---

## 🛠️ Tools & Technologies

- **Microsoft SQL Server**
- **SQL**
- **GitHub**

---

## 📚 SQL Concepts Practiced

### Basic SQL

- `SELECT`
- `WHERE`
- `DISTINCT`
- `TOP`
- `ORDER BY`

### Aggregation & Analysis

- `COUNT()`
- `SUM()`
- `GROUP BY`
- Aggregate functions

### Data Manipulation

- `ALTER TABLE`
- `UPDATE`

### Advanced SQL

- `CASE WHEN`
- NULL handling using `IS NULL`
- `ISNULL()`
- Date functions using `MONTH()`
- Window functions using `RANK() OVER()`

---

## 📊 Analysis Performed

The project answers the following business questions:

1. How many orders are present in the dataset?
2. What product categories are available?
3. Which cities are represented in the dataset?
4. What is the total revenue generated?
5. Which product category generates the highest revenue?
6. What are the top 5 products based on revenue?
7. Which cities generate the highest revenue?
8. How can orders be classified based on their sales value?
9. Which orders contain missing City or Payment Mode information?
10. How can missing Payment Mode values be handled?
11. What is the total revenue generated in each month?
12. How can products be ranked based on their total revenue?

---

## 🔍 Key Analysis Techniques

### Revenue Calculation

Revenue was calculated using:

**Revenue = Quantity × Price**

A `Revenue` column was added to the `Orders` table and populated using SQL.

### Sales Classification

The `CASE WHEN` statement was used to classify orders based on revenue:

- **HIGH** — Revenue ≥ 10,000
- **MEDIUM** — Revenue ≥ 5,000 and < 10,000
- **LOW** — Revenue < 5,000

### NULL Handling

Missing values were identified using `IS NULL`.

The `ISNULL()` function was also used to replace missing `Payment_Mode` values with `"UNKNOWN"` in the query output.

### Monthly Revenue Analysis

The `MONTH()` function was used to extract the month from `Order_Date`, followed by aggregation using `SUM()` and `GROUP BY` to calculate monthly revenue.

### Product Ranking

The `RANK() OVER()` window function was used to rank products based on their total revenue.

---

## 📁 Project Structure

```text
SQL-Ecommerce-Analysis/
│
├── dataset.csv
├── analysis.sql
└── README.md
