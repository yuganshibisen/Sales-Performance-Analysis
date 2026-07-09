-- ===========================================================
-- Project : Sales Performance Analysis
-- Author  : Yuganshi Bisen
-- Database: MySQL 8.0
-- ===========================================================

-- ===========================================================
-- STEP 1 : CREATE DATABASE
-- ===========================================================
CREATE DATABASE sales_project;

-- ===========================================================
-- STEP 2 : USE DATABASE
-- ===========================================================
USE sales_project;

-- ===========================================================
-- STEP 3 : IMPORT CSV
-- ===========================================================

-- Imported using
-- Table Data Import Wizard

-- File:
-- data/superstore.csv

SHOW DATABASES;
SELECT DATABASE();

-- ===========================================================
-- Query 1
-- Display first 10 records
-- ===========================================================
SELECT *
FROM superstore
LIMIT 10;

-- ===========================================================
-- Query 2
-- Count total records
-- ===========================================================
SELECT COUNT(*) AS total_records
FROM superstore;

-- ===========================================================
-- Query 3
-- View table structure
-- ===========================================================
DESCRIBE superstore;

-- ===========================================================
-- Query 4
-- Display unique categories
-- ===========================================================
SELECT DISTINCT category
FROM superstore;

-- ===========================================================
-- Query 5
-- Display unique regions
-- ===========================================================
SELECT DISTINCT region
FROM superstore;

-- ===========================================================
-- Query 6
-- Total Sales
-- ===========================================================
SELECT SUM(sales) AS total_sales
FROM superstore;

-- ===========================================================
-- Query 7
-- Total Profit
-- ===========================================================
SELECT SUM(profit) AS total_profit
FROM superstore;

-- ===========================================================
-- Query 8
-- Average Sales
-- ===========================================================
SELECT AVG(sales) AS average_sales
FROM superstore;

-- ==========================================================
-- Query 9: Find Highest and Lowest Sales
-- Business Question:
-- What are the highest and lowest sales values recorded?
-- ==========================================================
SELECT
    MAX(sales) AS highest_sale,
    MIN(sales) AS lowest_sale
FROM superstore;

-- ==========================================================
-- Query 10: Orders with Sales Greater Than 500
-- Business Question:
-- Which orders generated sales greater than 500?
-- ==========================================================
SELECT *
FROM superstore
WHERE sales > 500;

-- ==========================================================
-- Query 11: Orders with Negative Profit
-- Business Question:
-- Which orders resulted in a financial loss?
-- ==========================================================
SELECT *
FROM superstore
WHERE profit < 0;

-- ==========================================================
-- Query 12: Technology Category Orders
-- Business Question:
-- Which orders belong to the Technology category?
-- ==========================================================
SELECT *
FROM superstore
WHERE category = 'Technology';

-- ==========================================================
-- Query 13: Total Sales by Category
-- Business Question:
-- Which product category generates the highest total sales?
-- ==========================================================
SELECT
    category,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;

-- ==========================================================
-- Query 14: Total Profit by Category
-- Business Question:
-- Which product category generates the highest total profit?
-- ==========================================================
SELECT
    category,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY category
ORDER BY total_profit DESC;

-- ==========================================================
-- Query 15: Total Sales by Region
-- Business Question:
-- Which region contributes the highest sales?
-- ==========================================================
SELECT
    region,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;

-- ==========================================================
-- Query 16: Total Profit by Region
-- Business Question:
-- Which region earns the highest profit?
-- ==========================================================
SELECT
    region,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY region
ORDER BY total_profit DESC;

-- ==========================================================
-- Query 17: Top 10 States by Sales
-- Business Question:
-- Which 10 states generate the highest sales?
-- ==========================================================
SELECT
    state,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY state
ORDER BY total_sales DESC
LIMIT 10;

-- ==========================================================
-- Query 18: Top 10 States by Profit
-- Business Question:
-- Which 10 states generate the highest profit?
-- ==========================================================
SELECT
    state,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY state
ORDER BY total_profit DESC
LIMIT 10;

-- ==========================================================
-- Query 19: Total Sales by Customer Segment
-- Business Question:
-- Which customer segment contributes the highest sales?
-- ==========================================================
SELECT
    segment,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY segment
ORDER BY total_sales DESC;

-- ==========================================================
-- Query 20: Total Profit by Customer Segment
-- Business Question:
-- Which customer segment contributes the highest profit?
-- ==========================================================
SELECT
    segment,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY segment
ORDER BY total_profit DESC;

-- ==========================================================
-- Query 21: Total Sales by Sub-Category
-- Business Question:
-- Which product sub-category generates the highest sales?
-- ==========================================================
SELECT
    sub_category,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY sub_category
ORDER BY total_sales DESC;

-- ==========================================================
-- Query 22: Total Profit by Sub-Category
-- Business Question:
-- Which product sub-category generates the highest profit?
-- ==========================================================
SELECT
    sub_category,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY sub_category
ORDER BY total_profit DESC;

-- ==========================================================
-- Query 23: Top 10 Customers by Sales
-- Business Question:
-- Who are the top 10 customers based on total sales?
-- ==========================================================
SELECT
    customer_name,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;

-- ==========================================================
-- Query 24: Top 10 Customers by Profit
-- Business Question:
-- Who are the top 10 most profitable customers?
-- ==========================================================
SELECT
    customer_name,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY customer_name
ORDER BY total_profit DESC
LIMIT 10;

-- ==========================================================
-- Query 25: Total Sales by Ship Mode
-- Business Question:
-- Which shipping mode generates the highest sales?
-- ==========================================================
SELECT
    ship_mode,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY ship_mode
ORDER BY total_sales DESC;

-- ==========================================================
-- Query 26: Average Discount by Category
-- Business Question:
-- Which category offers the highest average discount?
-- ==========================================================
SELECT
    category,
    AVG(discount) AS average_discount
FROM superstore
GROUP BY category
ORDER BY average_discount DESC;

-- ==========================================================
-- Query 27: Average Profit by Category
-- Business Question:
-- Which category has the highest average profit per order?
-- ==========================================================
SELECT
    category,
    AVG(profit) AS average_profit
FROM superstore
GROUP BY category
ORDER BY average_profit DESC;

-- ==========================================================
-- Query 28: Number of Orders by Region
-- Business Question:
-- Which region has the highest number of orders?
-- ==========================================================
SELECT
    region,
    COUNT(*) AS total_orders
FROM superstore
GROUP BY region
ORDER BY total_orders DESC;

-- ==========================================================
-- Query 29: Products with Negative Profit
-- Business Question:
-- Which products are generating losses?
-- ==========================================================
SELECT
    product_name,
    category,
    sub_category,
    profit
FROM superstore
WHERE profit < 0
ORDER BY profit;

-- ==========================================================
-- Query 30: Top 10 Most Sold Products
-- Business Question:
-- Which products have the highest quantity sold?
-- ==========================================================
SELECT
    product_name,
    SUM(quantity) AS total_quantity
FROM superstore
GROUP BY product_name
ORDER BY total_quantity DESC
LIMIT 10;

-- ==========================================================
-- Query 31: Categories with Total Sales Greater Than 10000
-- Business Question:
-- Which product categories have total sales greater than 10000?
-- ==========================================================
SELECT
    category,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY category
HAVING SUM(sales) > 10000
ORDER BY total_sales DESC;

-- ==========================================================
-- Query 32: Classify Orders Based on Sales
-- Business Question:
-- Classify each record as High, Medium or Low Sales.
-- ==========================================================
SELECT
    customer_name,
    product_name,
    sales,
    CASE
        WHEN sales >= 500 THEN 'High Sales'
        WHEN sales >= 200 THEN 'Medium Sales'
        ELSE 'Low Sales'
    END AS sales_category
FROM superstore;

-- ==========================================================
-- Query 33: Rank Customers by Total Sales
-- Business Question:
-- Rank customers based on total sales.
-- ==========================================================
SELECT
    customer_name,
    SUM(sales) AS total_sales,
    RANK() OVER (
        ORDER BY SUM(sales) DESC
    ) AS customer_rank
FROM superstore
GROUP BY customer_name;

-- ==========================================================
-- Query 34: Customers with Above Average Sales
-- Business Question:
-- Find customers whose total sales are above average.
-- ==========================================================
WITH customer_sales AS
(
	SELECT
        customer_name,
        SUM(sales) AS total_sales
    FROM superstore
    GROUP BY customer_name
)
SELECT *
FROM customer_sales
WHERE total_sales >
(
    SELECT AVG(total_sales)
    FROM customer_sales
);