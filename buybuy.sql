Select *
From Buybuy_company..buybuy


--changing the date format

Select Sales_dateconverted, CONVERT(date,sales_date)
From Buybuy_company..buybuy

Update  buybuy
SET sales_date = CONVERT(date,sales_date)

ALTER TABLE buybuy
Add Sales_dateconverted Date;

Update  buybuy
SET Sales_dateconverted = CONVERT(date,sales_date)

--Adding a quarter column
SELECT DATEPART(QUARTER, Sales_dateconverted) AS QUARTERS
From Buybuy_company..buybuy

ALTER TABLE buybuy
Add Quarters as VARCHAR;

Update buybuy
SET Quarters = DATEPART(QUARTER, Sales_dateconverted)

/*Write a query that returns the total profit made by BuyBuy from 1Q11 to 4Q16 (all
quarters of every year).*/

--ADDING A PROFIT COLUMN
Select CAST((revenue - cost) as int) as Profit
From Buybuy_company..buybuy
Group by revenue, cost

ALTER TABLE buybuy 
Add Profit int;

Update buybuy
SET Profit = CAST((revenue - cost) as int)


Select SUM(profit) as Total_profit
From Buybuy_company..buybuy

/*Write queries that return the total profit made by BuyBuy in Q2 of every year from
2011 to 2016.*/
Select sales_year, SUM(profit) as Total_profit
From Buybuy_company..buybuy
Where Quarters = 2
Group by sales_year
Order by Sales_year

/*Write a query that returns the annual profit made by BuyBuy from the year 2011 to
2016.*/
Select sales_year, SUM(profit) 
From Buybuy_company..buybuy
Group by sales_year


/*Write 2 queries that return the countries where BuyBuy has made the most profit
and also the least profit of all-time. Your query must display both results on the
same output.*/

Select cus_country, SUM(profit)
 From Buybuy_company..buybuy
 Group by cus_country

 UNION

Select cus_country, SUM(profit)
 From Buybuy_company..buybuy
 Group by cus_country
 Order by 2 Desc

 /*Write a query that shows the Top-10 most profitable countries for BuyBuy sales
operations from 2011 to 2016*/
Select top 10 cus_country,sales_year, SUM(profit) as Total_profit
 From Buybuy_company..buybuy
 Group by cus_country,sales_year
 Order by 3 Desc

 /*Write a query that shows the all-time Top-10 least profitable countries for BuyBuy
sales operations.*/
Select top 10  cus_country,sales_year, SUM(profit)
 From Buybuy_company..buybuy
 Group by cus_country,sales_year
 Order by 3 Asc

 /*Write a query that ranks all product categories sold by Buybuy, from least amount
to the most amount of all-time revenue generated.*/

 Select prod_category,sales_year, SUM(revenue)
 From Buybuy_company..buybuy
 Group by prod_category,sales_year
 Order by 3 Asc

 /*Write a query that returns Top-2 product categories offered by Buybuy with an
all-time high number of units sold.*/

 Select top 2 prod_category, SUM(ord_quantity) As total_unitsold
 From Buybuy_company..buybuy
 Group by prod_category
 Order by 2 Desc

 /*Write a query that shows the Top 10 highest-grossing products sold by BuyBuy
based on all-time profits.*/

 Select top 10 product, SUM(revenue)
 From Buybuy_company..buybuy
 Group by product
 Order by 2 Desc
