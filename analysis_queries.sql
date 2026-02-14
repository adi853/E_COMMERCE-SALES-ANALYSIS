--PROJECT: E- COMMERCE SALES ANALYSIS
--AUTHOR : ADHIRAJ GHOSH

--1.TABLE DATA INSPECION
SELECT*FROM data;
--2.TOTAL REVENUE & UNITS SOLD PER PRODUCT
SELECT 
    product_name, 
    category, 
    price,
    (sales_month_1 + sales_month_2 + sales_month_3 + sales_month_4 + sales_month_5 + sales_month_6 + sales_month_7 + sales_month_8 + sales_month_9 + sales_month_10 + sales_month_11) AS Total_Units_Sold,
    (price * (sales_month_1 + sales_month_2 + sales_month_3 + sales_month_4 + sales_month_5 + sales_month_6 + sales_month_7 + sales_month_8 + sales_month_9 + sales_month_10 + sales_month_11)) AS Total_Revenue
FROM data
ORDER BY Total_Revenue DESC;

--3. CATEGORY- WISE PERFORMANCE 
SELECT 
    CATEGORY,
    SUM(sales_month_1 + sales_month_2 + sales_month_3 + sales_month_4 + sales_month_5 + sales_month_6 + sales_month_7 + sales_month_8 + sales_month_9 + sales_month_10 + sales_month_11 + sales_month_12) AS Category_units_sold,
    SUM(price * ( sales_month_1 + sales_month_2 + sales_month_3 + sales_month_4 + sales_month_5 + sales_month_6 + sales_month_7 + sales_month_8 + sales_month_9 + sales_month_10 + sales_month_11 + sales_month_12)) AS Category_revenue
FROM
    data
GROUP BY category
ORDER BY Category_revenue DESC;
--4.SEASONALITY ( QUATERLY REVENUE )
SELECT 
    category, 
    ANY_VALUE(price) AS price, -- Price-er agey ANY_VALUE bosiye de
    SUM(price * (sales_month_1 + sales_month_2 + sales_month_3 + sales_month_4)) AS Total_Q1,
    SUM(price * (sales_month_5 + sales_month_6 + sales_month_7 + sales_month_8)) AS Total_Q2,
    SUM(price * (sales_month_9 + sales_month_10 + sales_month_11)) AS Total_Q3
FROM data
GROUP BY category;
--5.TOP 5 CATEGORIES ( BY PRODUCT COUNT & AVERAGE PRICE )
SELECT 
    category,
    COUNT(product_name) AS total_products,
    ROUND(AVG(price), 2) AS avg_price,
    ROUND(AVG(review_score), 1) AS avg_rating
FROM
    DATA
GROUP BY category
ORDER BY total_products DESC
LIMIT 5;
