															Sales Analysis Project
## Project 1: Data Exploration

-- Q1. How many records are in the dataset?
SELECT COUNT(*) AS Total_Records
FROM salesdata;

-- Q2. What are the column names and data types?
DESCRIBE salesdata;

-- Q3. What are the different product categories?
SELECT DISTINCT Category
FROM salesdata;

-- Q4. What are the different regions?
SELECT DISTINCT Region
FROM salesdata;

-- Q5. What is the date range of the dataset?
SELECT
    MIN(Order_Date) AS First_Order_Date,
    MAX(Order_Date) AS Last_Order_Date
FROM salesdata;

-- Q6. How many unique products are there?
SELECT COUNT(DISTINCT Product) AS Total_Products
FROM salesdata;

-- Q7. Are there any duplicate Order IDs?
SELECT "Order ID", COUNT(*) AS Duplicate_Count
FROM salesdata
GROUP BY "Order ID"
HAVING COUNT(*) > 1;

-- Q8. Are there any NULL values in important columns?
SELECT *
FROM salesdata
WHERE Order_ID IS NULL
   OR Product IS NULL
   OR Sales IS NULL
   OR Quantity IS NULL
   OR Profit IS NULL;

-- Q9. How many unique orders are there?
SELECT COUNT("Order ID") AS Total_Orders
FROM salesdata;

-- Q10. Show the first 10 rows of the dataset.
SELECT *
FROM salesdata
LIMIT 10;



### Project 2: Sales Performance Analysis

-- Q1. Show the total sales for each category.
SELECT Category,
       SUM(Sales) AS Total_Sales
FROM salesdata
GROUP BY Category;
-- Q2. Show the total profit earned in each region.
select region, SUM(profit) from salesdata
group by region

-- Q3. Find the top 10 products with the highest sales.
SELECT Product,
       Sales
FROM salesdata
ORDER BY Sales DESC
LIMIT 10;

-- Q4. Find the bottom 10 products based on profit.
select product, profit from salesdata
order by sales desc
limit 10;

-- Q5. Find top 5 cities with highest profit.
select city, profit from salesdata
ORDER BY profit desc
limit 5;

-- Q6. Find the total number of orders placed in each state.
SELECT State,
       COUNT(`Order ID`) AS Total_Orders
FROM salesdata
GROUP BY State
ORDER BY Total_Orders DESC;

-- Q7. Show the total sales and total profit for each sub-category.
SELECT `Sub-Category`,
       SUM(Sales) AS Total_Sales,
       SUM(Profit) AS Total_Profit
FROM salesdata
GROUP BY `Sub-Category`;

-- Q8. Find the customer segment with the highest total sales.

SELECT `Customer Segment`,
       SUM(Sales) AS TotalSales
FROM salesdata
GROUP BY `Customer Segment`
ORDER BY TotalSales DESC
LIMIT 1;

-- Q9. Display the monthly sales trend using the Order Date.
SELECT 
    MONTHNAME(Order_Date) AS Sales_Month,
    SUM(Sales) AS Total_Sales
FROM salesdata
GROUP BY MONTH(Order_Date), MONTHNAME(Order_Date)
ORDER BY MONTH(Order_Date);
-- Q10. Find the top 3 sub-category with the highest profit.
SELECT `Sub-Category`,
       SUM(Profit) AS Total_Profit
FROM salesdata
GROUP BY `Sub-Category`
ORDER BY Total_Profit DESC
LIMIT 3;

-- Q11. Show all products whose sales are greater than the average sales.
SELECT Product, Sales
FROM salesdata
WHERE Sales > (
    SELECT AVG(Sales)
    FROM salesdata
);
SELECT * FROM SALESDATA

-- Q12. Find the category with the highest average profit.
SELECT CATEGORY, AVG(PROFIT) AS  AVG_PROFIT FROM SALESDATA
GROUP BY CATEGORY
ORDER BY AVG_PROFIT DESC
LIMIT 1;

-- Q13. Display the total quantity sold for each product.
SELECT SUM(QUANTITY), PRODUCT FROM SALESDATA
GROUP BY PRODUCT

-- Q14. Find the state with the maximum number of orders.
SELECT State,
       COUNT(`Order ID`) AS Total_Orders
FROM salesdata
GROUP BY State
ORDER BY Total_Orders DESC
LIMIT 1;

Select MAX(sales), MIN(sales), avg(sales) FROM SALESDATA

-- Q16. Find the percentage contribution of each category to total sales.
 Select CATEGORY,SUM(SALES) AS TOTAL_SALES,
 SUM(SALES)*100/ (SELECT SUM(SALES) FROM SALESDATA) AS PERCENTAGE
 FROM SALESDATA
 GROUP BY CATEGORY

-- Q17. Display all orders where the profit is negative.
SELECT `Order ID`, `Sub-Category`, Profit
FROM salesdata
WHERE Profit < 0;

-- Q18 Rank sub-categories on the basis of total sales.
SELECT `Sub-Category`,
       SUM(Sales) AS Total_Sales,
       RANK() OVER (ORDER BY SUM(Sales) DESC) AS Sales_Rank
FROM salesdata
GROUP BY `Sub-Category`;

-- Q19. Create a summary showing Category, Total Sales, Total Profit, and Total orders
SELECT CATEGORY, SUM(SALES) AS TOTAL_SALES, SUM(PROFIT) AS TOTAL_PROFIT, COUNT(`ORDER ID`)
FROM SALESDATA
GROUP BY CATEGORY

###Project 3 – Advanced Sales Analysis 
-- Q1 Find the top 5 orders based on total sales.
select `ORDER ID`,SUM(SALES) AS Total_sales FROM SALESDATA
GROUP BY `ORDER ID`
order by Total_sales Desc
limit 5;

-- Q2 Display sub-categories whose total profit is greater than 500000. (Use HAVING)
select `Sub-category`, sum(profit) from salesdata
group by `Sub-category`
having sum(profit) >500000;

-- Q3 Find the customer who placed the highest order by Order ID.
SELECT `Order ID`,
       SUM(Sales) AS Total_Sales
FROM salesdata
GROUP BY `Order ID`
ORDER BY Total_Sales DESC
LIMIT 1;

-- Q4 Find the difference between maximum and minimum sales for each category.
SELECT Category,
       MAX(Sales) AS Max_Sales,
       MIN(Sales) AS Min_Sales,
       MAX(Sales) - MIN(Sales) AS Sales_Difference
FROM salesdata
GROUP BY Category;

-- Q5 Count the number of unique customers in each state. 
SELECT State,
       COUNT(DISTINCT `Order ID`) AS Unique_Orders
FROM salesdata
GROUP BY State;

--  Q6 Find the top 3 states by average profit.
SELECT STATE, AVG(PROFIT) FROM SALESDATA
GROUP BY STATE
ORDER BY AVG(PROFIT) DESC 
LIMIT 3;

-- Q7 Find the top 5 salespersons based on total sales.
SELECT Salesperson,
       SUM(Sales) AS Total_Sales
FROM salesdata
GROUP BY Salesperson
ORDER BY Total_Sales DESC
LIMIT 5;

-- Q8 Find the DATE with the highest total sales.
SELECT `ORDER DATE`,
       SUM(Sales) AS Total_Sales
FROM salesdata
GROUP BY `ORDER DATE`
ORDER BY Total_Sales DESC
LIMIT 1;



