-- QUESTIONS 1. Which device had the most sales by quantity?
use sakila;
select*
from customer;

SELECT name, sum(quantity) as Total_quantity
FROM orderitem oi
Join product p
	On oi.product_id = p.product_id
group by name
order by Total_quantity desc
Limit 1;


-- Question 2. Which device had the lowest sales by quantity?
SELECT name, sum(quantity) as Total_quantity
FROM orderitem oi
Join product p
	On oi.product_id = p.product_id
group by name
order by Total_quantity asc
Limit 1;

-- Question 3. Top 3 most expensive gadgets.

SELECT name, price 
FROM orderitem oi
Join product p
	On oi.product_id = p.product_id
group by name, price
order by price desc
Limit 3;

-- Question 4. Top 3 customer names that spent the most. (Hint: Sum of product of price and quantity)

SELECT c.name, quantity,  price , sum(price * quantity) as Total_sales
FROM orderitem oi
Join product p ON oi.product_id = p.product_id
Join orders o ON  o.order_id =  oi.order_id
Join customer c ON c.customer_id = o.customer_id
group by c.name, quantity, price
order by Total_sales desc
Limit 3;

-- Question 5. Which order date did the least quantity of gadget sold?

SELECT order_date, p.name, sum(quantity)  as Total_Quantity_Sold
FROM orderitem oi
Join product p ON oi.product_id = p.product_id
Join orders o ON  o.order_id =  oi.order_id
Join customer c ON c.customer_id = o.customer_id
group by order_date, p.name
order by Total_Quantity_Sold asc
limit 1;

-- Question 6. Which customer name had the most orders by quantity?

SELECT c.name, sum(quantity)  as Total_Quantity_Orders
FROM orderitem oi
Join product p ON oi.product_id = p.product_id
Join orders o ON  o.order_id =  oi.order_id
Join customer c ON c.customer_id = o.customer_id
group by c.name
order by Total_Quantity_Orders desc
limit 1;

-- Question 7. List 3 devices with the lowest sales by quantity.

SELECT name, sum(quantity) as Total_quantity_sold
FROM orderitem oi
Join product p
	On oi.product_id = p.product_id
group by name
order by Total_quantity_sold asc
Limit 3;

-- Question 8. On which order date did “iPad Pro” had the most sales by quantity?

SELECT o.order_date, p.name,  SUM(quantity) AS total_quantity
FROM orderitem oi
Join product p ON oi.product_id = p.product_id
Join orders o ON  o.order_id =  oi.order_id
Join customer c ON c.customer_id = o.customer_id
WHERE p.name = 'iPad Pro'
group by  o.order_date
order by total_quantity desc
limit 1;

-- Question 9. Which customer name bought “iPhone 13” the most by quantity?

SELECT c.name, p.name,  SUM(quantity) AS total_quantity
FROM orderitem oi
Join product p ON oi.product_id = p.product_id
Join orders o ON  o.order_id =  oi.order_id
Join customer c ON c.customer_id = o.customer_id
WHERE p.name = 'iPhone 13'
group by c.name, p.name
order by total_quantity desc
limit 	1;

-- Question 10. Between the cheapest device and the most expensive device, 
--- which had more quantity sold? And why is the result so?

SELECT p.name, price, sum(quantity) as Total_Quantity_Sold,  Min(price) as Min_price 
FROM orderitem oi
Join product p ON oi.product_id = p.product_id
Join orders o ON  o.order_id =  oi.order_id
Join customer c ON c.customer_id = o.customer_id
group by  p.name, price
order by Min_price asc
limit 	1;

SELECT p.name, price, sum(quantity) as Total_Quantity_Sold,  Min(price) as Max_price 
FROM orderitem oi
Join product p ON oi.product_id = p.product_id
Join orders o ON  o.order_id =  oi.order_id
Join customer c ON c.customer_id = o.customer_id
group by p.name, price
order by Max_price desc
limit 	1;