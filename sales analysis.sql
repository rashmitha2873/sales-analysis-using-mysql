create database company;
use company;
select * from sales;
/*1)find all orders shipped via economy mode with 
a total amount greater than 25000*/
select * from sales where ship_mode="economy" and total_amount>25000;
/*2)retrieve all sales data for technology category 
in 'ireland' made after 2020-01-01*/
select * from sales where 
category="Technology" and country="Ireland" 
and order_date>'2020-01-01';
/*3)list the top 10 most profitable sales in desc order*/
select * from sales order by unit_profit desc limit 10;
select * from sales order by unit_profit desc limit 10,20;

/*4)find all customers whose name starts with 'j' and ends with 'n'*/
select * from sales where customer_name like 'j%n' ;
/*5)retrieve all product names that contain 'Acco' anywhere in the name*/
select order_id,product_name from sales where product_name like '%Acco%';
/*6)get the top5 cities with the highest total sales amount*/
select city,sum(total_amount) as total from sales 
group by city
order by total desc limit 5;

/*7)display the second set of records for 
customer_name and total_amount in decreasing order*/
select customer_name,total_amount from sales
order by total_amount desc
limit 10,10;
/*8) find the total revenue,average unit cost,and total number of orders*/
select sum(total_amount) as 'total_amount',
avg(unit_cost) as 'average_unit_cost',
count(order_id) as 'count_of_cust_id' 
from sales;
/*9)count unique number of regions*/
select distinct(count(region)) as uniq_reg from sales;
/*10) find the number of orders by placed by each customer*/
select customer_name,count(product_name) as count_product 
from sales
group by customer_name
order by count_product desc;
/*11)rank 5 products based on total sales using RANK()*/

select * from sales;

select product_name,sum(total_amount) as total_sales,
RANK()  over (order by sum(total_amount)desc ) as sales_rank
from sales
group by product_name
limit 5;
