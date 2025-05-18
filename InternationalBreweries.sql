Select *
From InternationalBreweries..International_Breweries$


--what are the countries 
Select Distinct countries
From InternationalBreweries..International_Breweries$;

/*Within the space of the last three years, what was the profit worth of the breweries,
inclusive of the anglophone and the francophone territories?*/

Select COUNTRIES,YEARS,SUM(PROFIT)
From InternationalBreweries..International_Breweries$
Group by COUNTRIES,YEARS
Order by YEARS

Select SUM(PROFIT) as TotalProfit
From InternationalBreweries..International_Breweries$

/* Compare the total profit between these two territories in order for the territory manager,
Mr. Stone made a strategic decision that will aid profit maximization in 2020*/

Select SUM(profit) as Anglophone_TotalProfit
From InternationalBreweries..International_Breweries$
Where countries in ('Nigeria','Ghana')

Select SUM(profit) as Francophone_TotalProfit
From InternationalBreweries..International_Breweries$
Where countries in ('Senegal','Togo','Benin')

--Country that generated the highest profit in 2019

Select top 1 countries, SUM(profit) as Total_Profit
From InternationalBreweries..International_Breweries$
Where years = 2019
Group by countries
Order by 2 DESC

--Help him find the year with the highest profit.

Select top 1 years, SUM(profit) as Total_Profit
From InternationalBreweries..International_Breweries$
Group by years
Order by 2 DESC

--Which month in the three years was the least profit generated?

Select top 1 months, SUM(profit) as Total_Profit
From InternationalBreweries..International_Breweries$
Group by months
Order by 2 ASC

--What was the minimum profit in the month of December 2018?
Select MIN(profit) as Dec_MinProfit
From InternationalBreweries..International_Breweries$
Where  months = 'december' AND
      years = 2018


-- Compare the profit in percentage for each of the month in 2019
Select years, SUM(PROFIT)
From InternationalBreweries..International_Breweries$
Where  years = 2019
Group by years
--the total profit in 2019 is 30020250

Select months,SUM(profit), (SUM(profit)/30020250)*100 as TotalProfitPercentage
From InternationalBreweries..International_Breweries$
Where  years = 2019
Group by months

-- Which particular brand generated the highest profit in Senegal?

Select top 1 brands, SUM(profit)
From InternationalBreweries..International_Breweries$
where countries = 'senegal'
Group by brands
Order by 2 Desc


/*Within the last two years, the brand manager wants to know the top three brands
consumed in the francophone countries*/Select top 3 brands, SUM(quantity) as TotalQuantity
From InternationalBreweries..International_Breweries$
Where countries in ('Senegal','Togo','Benin') AND years in (2018,2019)
Group by brands
Order by 2 Desc

--Find out the top two choice of consumer brands in GhanaSelect top 2 brands, SUM(quantity) as TotalQuantity
From InternationalBreweries..International_Breweries$
Where countries = 'Ghana'
Group by brands
Order by 2 Desc
/* Find out the details of beers consumed in the past three years in the most oil reached
country in West Africa.*/--the brandsSelect Distinct brandsFrom InternationalBreweries..International_Breweries$-- beta malt and grand malt are not beers-- Nigeria is the most oil rich country in west africaSelect *From InternationalBreweries..International_Breweries$Where NOT brands in ('beta malt','grand malt') AND countries = 'Nigeria'/*Favorites malt brand in Anglophone region between 2018 and 2019*/Select top 1 brands, SUM(quantity)From InternationalBreweries..International_Breweries$Where brands in ('beta malt','grand malt') AND countries in ('Nigeria','Ghana') AND years in (2018, 2019)Group by brandsorder by 2 DESC/* Which brands sold the highest in 2019 in Nigeria*/Select top 1 brands, SUM(quantity)From InternationalBreweries..International_Breweries$Where countries = 'Nigeria' AND years =2019Group by brandsorder by 2 DESC/*Favorites brand in South_South region in Nigeria*/Select top 1  brands, SUM(quantity)From InternationalBreweries..International_Breweries$Where region = 'Southsouth' AND countries = 'Nigeria'Group by brandsOrder by 2 DESC/*Beer consumption in nigeria*/Select brands, SUM(Quantity)From InternationalBreweries..International_Breweries$Where NOT brands in ('beta malt','grand malt') AND countries = 'Nigeria'Group by brands/* Level of consumption of Budweiser in the regions in Nigeria*/Select region, SUM(quantity)From InternationalBreweries..International_Breweries$Where brands = 'budweiser' AND countries = 'Nigeria'Group by region/*Level of consumption of Budweiser in the regions in Nigeria in 2019 (Decision on Promo)*/Select region, SUM(quantity)From InternationalBreweries..International_Breweries$Where brands = 'budweiser' AND countries = 'Nigeria' AND years = 2019Group by region /* Country with the highest consumption of beer*/Select top 1 Countries, SUM(Quantity)From InternationalBreweries..International_Breweries$Where NOT brands in ('beta malt','grand malt') Group by countriesOrder by 2 DESC --Highest sales personnel of Budweiser in Senegal Select  top 1 sales_rep, SUM(Quantity)From InternationalBreweries..International_Breweries$Where brands = 'budweiser' AND countries = 'Senegal'Group by Sales_repOrder by 2 desc--Country with the highest profit of the fourth quarter in 2019Select top 1 countries, SUM(profit)From InternationalBreweries..International_Breweries$Where months in ('october','november','december') AND years = 2019Group by countriesorder by 2 Desc