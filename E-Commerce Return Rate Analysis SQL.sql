/*
Author     :  Gurrala Madhu <gurralamadhu652@gmail.com>
Purpose    :  To identify the underlying reasons behind customer returns and analyse how return 
			  rates vary across product categories, suppliers, geographies, and marketing channels.
start Date :  01/05/2025
End Date   :  06/05/2025
*/

-- First created a schema/Database e-commerce

CREATE DATABASE IF NOT EXISTS `e-commerce`;

/*
USE KEYWORD: USE Keyword is used to create the active session database.
*/

USE `e-commerce`;

-- Then i have loaded the dataset into the database/schmea E-Commerce Sales Data using table data import wizard

/*
 Describe Keyword:
                  Describe keyword tells about the structure of columns including column names,Data type of columns and Constraints.
*/

DESCRIBE e_commerce;

-- Checking for null values in each column and the sum of the null values
SELECT
sum(CASE WHEN `Product ID` IS NULL THEN 1 ELSE 0 END) AS `Product ID`,
sum(CASE WHEN `Product Name` IS NULL THEN 1 ELSE 0 END) AS `Product Name`,
sum(CASE WHEN Category IS NULL THEN 1 ELSE 0 END) AS Category,
sum(CASE WHEN Discount IS NULL THEN 1 ELSE 0 END) AS Discount,
sum(CASE WHEN `Tax Rate` IS NULL THEN 1 ELSE 0 END) AS `Tax Rate`,
sum(CASE WHEN `Stock Level` IS NULL THEN 1 ELSE 0 END) AS `Stock Level`,
sum(CASE WHEN `Supplier ID` IS NULL THEN 1 ELSE 0 END) AS `Supplier ID`,
sum(CASE WHEN `Customer Age Group` IS NULL THEN 1 ELSE 0 END) AS `Customer Age Group`,
sum(CASE WHEN `Customer Location` IS NULL THEN 1 ELSE 0 END) AS `Customer Location`,
sum(CASE WHEN `Customer Gender` IS NULL THEN 1 ELSE 0 END) AS `Customer Gender`,
sum(CASE WHEN `Shipping Cost` IS NULL THEN 1 ELSE 0 END) AS `Shipping Cost`,
sum(CASE WHEN `Shipping Method` IS NULL THEN 1 ELSE 0 END) AS `Shipping Method`,
sum(CASE WHEN `Return Rate` IS NULL THEN 1 ELSE 0 END) AS `Return Rate`,
sum(CASE WHEN Seasonality IS NULL THEN 1 ELSE 0 END) AS Seasonality,
sum(CASE WHEN `Popularity Index` IS NULL THEN 1 ELSE 0 END) AS `Populrity Index` from e_commerce;

-- Retrieve number of products available in the e-commerce

select count(`Product ID`) AS Total_Products from e_commerce;

-- Check the number of suppliers available for e_commerce

select count(`Supplier ID`) AS Total_suppliers from e_commerce;

-- Retrieve the data without duplicate values

select distinct * from e_commerce;

-- Retrieve the average price of each category and show categories from top to bottom

SELECT 
    Category, AVG(Price) AS Avg_price
FROM
    e_commerce
GROUP BY Category
ORDER BY Avg_price DESC;

-- Note: Electronics has high cost categories

-- Retrieve the average discount given for each category

SELECT 
    Category, AVG(Discount) AS Discount
FROM
    e_commerce
GROUP BY Category
ORDER BY Discount DESC;

-- Note: Home Appliances are having high discount.

-- Retrieve the average discount given for each product

SELECT 
    `Product Name`, AVG(Discount) AS Discount
FROM
    e_commerce
GROUP BY `Product Name`
ORDER BY Discount DESC;

-- Note: Magazines are having high discount

-- Retrieve the average price for each category

SELECT 
    `Product Name`, AVG(Price) AS AVG_PRICE
FROM
    e_commerce
GROUP BY `Product Name`
ORDER BY AVG_PRICE DESC;

-- Note: Formal shoes is the product of high cost.

-- Retrieve average tax rate for each category

SELECT 
    Category, AVG(`Tax Rate`) AS avg_tax
FROM
    e_commerce
GROUP BY Category
ORDER BY avg_tax DESC;

-- Note: Books having the high tax rate.

-- Retrieve the average tax rate for every product show top 5

SELECT 
    `Product Name`, AVG(`Tax Rate`) AS avg_tax
FROM
    e_commerce
GROUP BY `Product Name`
ORDER BY avg_tax DESC
LIMIT 0 , 4;

-- Note : Product Camera has high tax rate 

-- Retrieve average  discount for each location

SELECT 
    `Customer Location`, AVG(Discount) AS Discount
FROM
    e_commerce
GROUP BY `Customer Location`
ORDER BY Discount DESC;

-- Note: Sydney is getting high discount for orders.

-- Retrieve customer location wise tax rate.

SELECT 
    `Customer Location`, AVG(`Tax Rate`) AS avg_tax
FROM
    e_commerce
GROUP BY `Customer Location`
ORDER BY avg_tax DESC;

-- Note : New york has high tax rate on orders.

-- Retrieve average discount for shipping method

select `Shipping Method`,avg(Discount) as Discount from e_commerce
group by `Shipping Method`
order by Discount desc;

-- Note: Overnight shipping method has high discount

-- Retrieve average tax rate for shipping method

SELECT 
    `Shipping Method`, AVG(`Tax Rate`) AS avg_tax
FROM
    e_commerce
GROUP BY `Shipping Method`
ORDER BY avg_tax DESC;

-- Note : Over night shipping method has high tax rate.

-- Retrieve Average discount for seasonality

SELECT 
    Seasonality, AVG(Discount) AS discount
FROM
    e_commerce
GROUP BY Seasonality
ORDER BY discount DESC;

-- Seasonality NO has high discount.

-- Retrieve average tax rate for seasonality

SELECT 
    Seasonality, AVG(`Tax Rate`) AS avg_tax
FROM
    e_commerce
GROUP BY Seasonality
ORDER BY avg_tax DESC;

-- Note: seasonality yes has high tax rate.

-- Retrieve average shipping cost for each category

SELECT 
    Category, AVG(`Shipping Cost`) AS avg_shipping_cost
FROM
    e_commerce
GROUP BY Category
ORDER BY avg_shipping_cost DESC;

-- Note : Apparel has highest shipping cost.alter

-- Retrieve Average return rate for each category

SELECT 
    Category, AVG(`Return Rate`) AS avg_return_rate
FROM
    e_commerce
GROUP BY Category
ORDER BY avg_return_rate DESC;

-- Note: Footwear has high return rate.

-- Retrieve the average return rate of each product

SELECT 
    `Product Name`, AVG(`Return Rate`) AS avg_return_rate
FROM
    e_commerce
GROUP BY `Product Name`
ORDER BY avg_return_rate DESC;

-- Note:Sneakers has high return rate.

-- Retrieve customer location wise return rate.

SELECT 
    `Customer Location`, AVG(`Return Rate`) AS avg_return_rate
FROM
    e_commerce
GROUP BY `Customer Location`
ORDER BY avg_return_rate;

-- Toronto,Canada has high return rate

-- Retrieve average return rate by gender

SELECT 
    `Customer Gender`, AVG(`Return Rate`) AS avg_return_rate
FROM
    e_commerce
GROUP BY `Customer Gender`
ORDER BY avg_return_rate DESC;

-- Note : Female has high return rate

-- Retrieve average return rate for each shipping method

SELECT 
    `Shipping Method`, AVG(`Return Rate`) AS avg_return_rate
FROM
    e_commerce
GROUP BY `Shipping Method`
ORDER BY avg_return_rate DESC;

-- Note : Standard shipping method has high return rate

-- Retrieve average return rate for seasonality


SELECT 
    Seasonality, AVG(`Return Rate`) AS avg_return_rate
FROM
    e_commerce
GROUP BY Seasonality
ORDER BY avg_return_rate DESC;

-- Note: Seasonality NO has high return rate

-- Retrieve revenue generated by each category

SELECT 
    Category, SUM(Price) AS Revenue
FROM
    e_commerce
GROUP BY Category
ORDER BY Revenue DESC;

-- Note: Books are generating high revenue

-- Retrieve revenue generated by each product

SELECT 
    `Product Name`, SUM(Price) AS Revenue
FROM
    e_commerce
GROUP BY `Product Name`
ORDER BY Revenue;

-- Note : Smart watch generating high revenue.

-- Retrieve the revenue generated by each customer location

SELECT 
    `Customer Location`, SUM(Price) AS revenue
FROM
    e_commerce
GROUP BY `Customer Location`
ORDER BY revenue DESC;

-- Note : Dubai, UAE generating high revenue

-- Retrive revenue generated by customer gender wise

SELECT 
    `Customer Gender`, SUM(Price) AS revenue
FROM
    e_commerce
GROUP BY `Customer Gender`
ORDER BY revenue DESC;

-- Note: Non-Binary gender is generating high revenue.

-- Retrieve revenue generated by each shipping method

SELECT 
    `Shipping Method`, SUM(Price) AS revenue
FROM
    e_commerce
GROUP BY `Shipping Method`
ORDER BY revenue DESC;

-- Note : Shipping method standard generating high revenue

-- Retrieve the revenue generated by Seasonality

SELECT 
    Seasonality, SUM(Price) AS revenue
FROM
    e_commerce
GROUP BY Seasonality
ORDER BY revenue DESC;

-- Note : Seasonality Yes generating high revenue



