drop table if exists zepto;

CREATE TABLE zepto (
    sku_id SERIAL PRIMARY KEY,
    Category VARCHAR(120),
    name VARCHAR(150) NOT NULL,
    mrp NUMERIC(8,2),
    discountPercent NUMERIC(5,2),
    availableQuantity INT,
    discountedSellingPrice NUMERIC(8,2),
    weightInGms INT,
    outOfStock BOOLEAN,
    quantity INT
);


-- DATA EXPLORATION

-- count of rows
SELECT COUNT(*) FROM zepto;

-- sample data
SELECT * FROM zepto
LIMIT 10;

-- null values
SELECT * FROM zepto
WHERE name IS NULL
OR
Category IS NULL
OR
mrp IS NULL
OR
discountPercent IS NULL
OR
availableQuantity IS NULL
OR
discountedSellingPrice IS NULL
OR
weightInGms IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;

-- different product categories
SELECT distinct Category
from zepto
order by Category;

-- product in stock vs out of stock
SELECT outOfStock, COUNT(sku_id)
FROM zepto
GROUP BY outOfStock;

-- product names present multiple times
select name,count(*) as "Number of Times"
from zepto
group by name
having count(*)>1
order by count(*) DESC;

-- DATA CLEANING 

-- product with price = 0
SELECT * FROM zepto
WHERE mrp = 0 or discountedSellingPrice = 0;

delete from zepto 
where mrp = 0; 


--convert paise to rupees
UPDATE zepto
SET mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

select mrp,discountedSellingPrice from zepto;


--Q1. Find the top 10 best-value products based on the discount percentage.
SELECT DISTINCT name, mrp,discountPercent
FROM zepto
order by discountPercent DESC
LIMIT 10;


--Q2. What are the products with high MRP but out of stock?
SELECT DISTINCT name,mrp
FROM zepto
where outOfStock =TRUE and mrp > 300
ORDER BY mrp DESC;

--Q3. Calculate estimated revenue for each category.
SELECT Category,
SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto
GROUP BY Category
ORDER BY total_revenue;

--Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
SELECT DISTINCT name,mrp,discountPercent
FROM zepto
WHERE mrp > 500 and discountPercent < 10
ORDER BY mrp DESC,discountPercent DESC;

--Q5. Identify the top 5 categories offering the highest average discount percentage.
SELECT Category,
ROUND(AVG(discountPercent),2) as avg_discount
FROM zepto
GROUP BY Category
ORDER BY avg_discount DESC
LIMIT 5;

--Q6. Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT name,weightInGms,discountedSellingPrice,
ROUND(discountedSellingPrice/weightInGms,2) as price_per_gram
FROM zepto
WHERE weightInGms >=100
ORDER BY price_per_gram;

--Q7. Group the products into categories like Low, Medium, and Bulk.
SELECT DISTINCT name,weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
	WHEN weightInGms < 5000 THEN 'Medium'
	ELSE 'Bulk'
	END AS weight_category
FROM zepto;

--Q8. What is the total inventory weight per category?
SELECT Category,
SUM(weightInGms * availableQuantity) as total_weight
FROM zepto
GROUP BY Category
ORDER BY total_weight;

-- Q9. Top revenue-generating product per category (in stock)
SELECT Category,name,revenue
FROM (
    SELECT Category,name,
        discountedSellingPrice * availableQuantity AS revenue,
        ROW_NUMBER() OVER (
            PARTITION BY Category
            ORDER BY discountedSellingPrice * availableQuantity DESC
        ) AS rn
    FROM zepto
    WHERE outOfStock = FALSE
) ranked_products
WHERE rn = 1
ORDER BY revenue DESC;

-- Q10. Revenue contribution percentage by category
SELECT Category,
    ROUND(
        SUM(discountedSellingPrice * availableQuantity) * 100.0 /
        (SELECT SUM(discountedSellingPrice * availableQuantity) FROM zepto),
        2
    ) AS revenue_percentage
FROM zepto
WHERE outOfStock = FALSE
GROUP BY Category
ORDER BY revenue_percentage DESC;
