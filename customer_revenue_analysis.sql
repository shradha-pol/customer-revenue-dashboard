CREATE DATABASE customer_revenue_db;

USE customer_revenue_db;

CREATE TABLE sales_data (
    order_id VARCHAR(10),
    order_date DATE,
    customer_id VARCHAR(10),
    customer_name VARCHAR(50),
    segment VARCHAR(20),
    region VARCHAR(20),
    product_category VARCHAR(30),
    sales DECIMAL(10 , 2 ),
    quantity INT
);

SELECT 
    *
FROM
    sales_data
LIMIT 10;

# 1. Overall Business Performance

-- Total Revenue
SELECT 
    SUM(sales) AS total_revenue
FROM
    sales_data;


-- Total Orders
SELECT 
    COUNT(DISTINCT order_id) AS total_orders
FROM
    sales_data;


-- Total Quantity Sold
SELECT 
    SUM(quantity) AS total_units_sold
FROM
    sales_data;


-- Average Order Value (AOV)
SELECT 
    SUM(sales) / COUNT(DISTINCT order_id) AS avg_order_value
FROM
    sales_data;


# 2. Time-Based Analysis

-- Monthly Revenue Trend
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(sales) AS monthly_revenue
FROM
    sales_data
GROUP BY month
ORDER BY month;

-- Monthly Order Volume
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    COUNT(order_id) AS total_orders
FROM
    sales_data
GROUP BY month
ORDER BY month;


# 3. Customer Analysis

-- Top Customers by Revenue
SELECT 
    customer_name, SUM(sales) AS total_revenue
FROM
    sales_data
GROUP BY customer_name
ORDER BY total_revenue DESC
LIMIT 10;

-- Revenue Contribution by Customer Segment
SELECT 
    segment, SUM(sales) AS revenue
FROM
    sales_data
GROUP BY segment;

-- Average Revenue per Customer
SELECT 
    customer_name, AVG(sales) AS avg_customer_sales
FROM
    sales_data
GROUP BY customer_name;


# 4. Regional Performance Analysis

-- Revenue by Region
SELECT 
    region, SUM(sales) AS revenue
FROM
    sales_data
GROUP BY region;

-- Orders by Region
SELECT 
    region, COUNT(order_id) AS orders
FROM
    sales_data
GROUP BY region;

-- Average Order Value by Region
SELECT 
    region, SUM(sales) / COUNT(order_id) AS avg_order_value
FROM
    sales_data
GROUP BY region;


# 5. Product Category Analysis

-- Revenue by Product Category
SELECT 
    product_category, SUM(sales) AS revenue
FROM
    sales_data
GROUP BY product_category;

-- Quantity Sold by Category
SELECT 
    product_category, SUM(quantity) AS total_units
FROM
    sales_data
GROUP BY product_category;

-- High Revenue but Low Quantity (Premium Products)
SELECT 
    product_category,
    SUM(sales) AS revenue,
    SUM(quantity) AS units
FROM
    sales_data
GROUP BY product_category
ORDER BY revenue DESC;


# 6. Strategic Business Insights

-- Repeat Customers
SELECT 
    customer_name, COUNT(order_id) AS order_count
FROM
    sales_data
GROUP BY customer_name
HAVING COUNT(order_id) > 1;

-- Top Month by Revenue
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(sales) AS revenue
FROM
    sales_data
GROUP BY month
ORDER BY revenue DESC
LIMIT 1;

-- Segment-wise Monthly Revenue
SELECT 
    segment,
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(sales) AS revenue
FROM
    sales_data
GROUP BY segment , month
ORDER BY month;








