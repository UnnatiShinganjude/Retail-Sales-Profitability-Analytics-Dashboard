USE retail_analytics;

SELECT DATABASE() AS active_database;

SHOW TABLES FROM retail_analytics;
SHOW COLUMNS
FROM `retail_analytics`.`sample - superstore`;

SELECT *
FROM `retail_analytics`.`sample - superstore`
LIMIT 10;

SELECT COUNT(*) AS total_rows
FROM `retail_analytics`.`sample - superstore`;

SELECT
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit,
    COUNT(DISTINCT `Order ID`) AS total_orders
FROM `retail_analytics`.`sample - superstore`;

SELECT
    Category,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM `retail_analytics`.`sample - superstore`
GROUP BY Category
ORDER BY total_sales DESC;

SELECT
    DATE_FORMAT(`Order Date`, '%Y-%m') AS sales_month,
    SUM(Sales) AS monthly_sales,
    SUM(Profit) AS monthly_profit
FROM `retail_analytics`.`sample - superstore`
GROUP BY DATE_FORMAT(`Order Date`, '%Y-%m')
ORDER BY sales_month;

SELECT
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit,
    ROUND(
        100.0 * SUM(Profit) / NULLIF(SUM(Sales), 0),
        2
    ) AS profit_margin_pct
FROM `retail_analytics`.`sample - superstore`;