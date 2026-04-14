
-- CREATE TABLE retail_sales(

--              transactions_id INT PRIMARY KEY,	
-- 			 sale_date	DATE,
-- 			 sale_time	TIME,
-- 			 customer_id INT,	
-- 			 gender	VARCHAR (100),
-- 			 age	INT,
-- 			 category VARCHAR (100),
-- 			 quantiy	INT,
-- 			 price_per_unit	FLOAT,
-- 			 cogs	FLOAT,
-- 			 total_sale FLOAT
-- )

-- DATA CLEANING

-- SELECT * FROM retail_sales
-- ORDER BY transactions_id ASC

-- SELECT COUNT(*) FROM retail_sales


-- SELECT * FROM retail_sales
-- WHERE transactions_id IS NULL;

-- SELECT * FROM retail_sales
-- WHERE total_sale IS NULL;

-- SELECT * FROM retail_sales
-- WHERE 

-- transactions_id IS NULL

-- OR

-- total_sale IS NULL

-- OR

-- gender IS NULL

-- OR

--  category IS NULL

-- OR 

--  cogs IS NULL ;


-- DELETE FROM retail_sales
-- WHERE 
-- transactions_id IS NULL

-- OR

-- total_sale IS NULL

-- OR

-- gender IS NULL

-- OR

--  category IS NULL

-- OR 

--  cogs IS NULL ;

-- SELECT COUNT(*) FROM retail_sales

-- DATA EXPLORATION

-- How many sales we have ?

-- select COUNT(total_sale) AS total_sales from retail_sales

-- How many Unique customers we have ?
-- select COUNT(DISTINCT customer_id) AS "Total Customers" from retail_sales

-- select * from retail_sales

-- How many Unique category we have ?

-- SELECT DISTINCT category FROM retail_sales

-- Data analysis and Business Key Problems and Answers

-- Q1. Write a sql query to retrieve all columns for sales made on '2022-11-05'

-- select * from retail_sales
-- WHERE sale_date = '2022-11-05'
-- ORDER BY transactions_id ASC

-- Q2. Write a sql query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the
-- month of Nov-2022

-- SELECT * FROM retail_sales
-- WHERE category = 'Clothing'
-- AND 
-- TO_CHAR (sale_date, 'YYYY-MM') = '2022-11'
-- ORDER BY sale_date ASC
-- AND 
-- quantiy >= 4

-- Q3. Write a SQL query to calculate the total sales (total_sale) for each category?

-- SELECT DISTINCT category, SUM(total_sale) AS "Total Sales"
-- from retail_sales
-- GROUP BY category
-- ORDER BY "Total Sales" DESC 

-- Q4. Write a SQL query to find the average age of customers who purchased items from the "Beauty" Category? 

-- SELECT * FROM retail_sales

-- SELECT category, ROUND(AVG(age),0) AS customer_avg_age

-- FROM retail_sales

-- WHERE category = 'Beauty'

-- GROUP BY category;

-- Q5. Write a SQL query to find all transactions where the total_sale is greater than 1000.

-- select * from retail_sales

-- SELECT transactions_id, customer_id, total_sale

-- FROM 

-- retail_sales

-- WHERE total_sale >1000

-- order by transactions_id

-- Q6. Write a SQL query to find the total number of transactions (transaction_id) made by each 
-- gender in each category.

-- select * from retail_sales

-- SELECT gender, category, COUNT(*) AS total_sales
-- FROM retail_sales
-- GROUP BY gender,category
-- ORDER BY gender DESC, total_sales DESC

-- Q7. Write a sql query to calculate the average sale for each month. Find out best selling month in each year

-- select * from retail_sales

-- Method 1 without rank


-- SELECT 
-- EXTRACT(YEAR FROM sale_date) as Year,
-- EXTRACT(MONTH FROM sale_date) as Month,
-- AVG(total_sale) as Avg_Sale
-- FROM retail_sales
-- GROUP BY 1,2
-- ORDER BY  Year ASC, Month ASC, Avg_Sale DESC 

-- Method 2 with rank

-- SELECT 
-- EXTRACT(YEAR FROM sale_date) as Year,
-- EXTRACT(MONTH FROM sale_date) as Month,
-- AVG(total_sale) as Avg_Sale,
-- RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale)) as rank
-- FROM retail_sales
-- GROUP BY 1,2
-- ORDER BY  Year ASC, Month ASC, Avg_Sale DESC 

-- Method 3 for selective ranks only 


-- SELECT * FROM (

-- SELECT 
-- EXTRACT (YEAR FROM sale_date) as year,
-- EXTRACT (MONTH FROM sale_date ) AS month,
-- AVG(total_sale) AS avg_sale,
-- RANK() OVER (PARTITION BY EXTRACT (YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) AS rank
-- FROM retail_sales
-- GROUP BY 1,2
-- ) as t1
-- WHERE RANK = 1

-- Q8. Write a SQL query to find the top 5 customers based on the highest total sales 

-- SELECT  customer_id, SUM(total_sale) from retail_sales
-- GROUP BY customer_id
-- ORDER BY 2 DESC
-- LIMIT 5

-- Q9. Write a SQL query to find the number of unique customers who purchased items from each category.

-- SELECT COUNT(distinct customer_id) AS "IDs", category
-- FROM retail_sales

-- GROUP BY category

-- Q10.Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)

-- WITH hourly_sale
-- AS
-- (
-- SELECT *,
--     CASE
--         WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
--         WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
--         ELSE 'Evening'
--     END as shift
-- FROM retail_sales
-- )
-- SELECT 
--     shift,
--     COUNT(*) as total_orders    
-- FROM hourly_sale
-- GROUP BY shift


--- END OF PROJECT ------









