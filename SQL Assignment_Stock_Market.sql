-- Stock market analysis
-- -------------------------------calaculate the following KPI's--------------------------------------------

-- 1) Average daily trading volume

DESCRIBE synthetic_stock_data;

use stock_market;

SELECT Ticker, AVG(Volume) AS Average_Daily_Trading_Volume
FROM synthetic_stock_data
GROUP BY Ticker;

SELECT Ticker, AVG(Volume) AS Average_Daily_Trading_Volume
FROM synthetic_stock_data
where year(date) = '2023'
GROUP BY Ticker;

-- 2) Most volitile stocks	


select Ticker, avg(Beta) as Most_Volatile_Stocks
from synthetic_stock_data
group by ticker;

select Ticker, avg(Beta) as Most_Volatile_Stocks
from synthetic_stock_data
where year(date) = '2023'
group by ticker;


-- 3)Stocks with Highest and Lowest Dividend
SELECT Ticker, max(`Dividend Amount`) as highest_dividend,
min(`dividend Amount`) as lowest_dividend
FROM synthetic_stock_data
group by ticker;

SELECT Ticker, max(`Dividend Amount`) as highest_dividend,
min(`dividend Amount`) as lowest_dividend
FROM synthetic_stock_data
where year(date)= '2023'
group by ticker;

-- 4) Highest and Lowest P/E Ratios

SELECT Ticker, max(`PE Ratio`) as highest_dividend,
min(`PE Ratio`) as lowest_dividend 
from synthetic_stock_data
group by ticker;

SELECT Ticker, max(`PE Ratio`) as highest_dividend,
min(`PE Ratio`) as lowest_dividend 
from synthetic_stock_data
where year(date)= '2023'
group by ticker;

-- 5) Stocks with Highest Market Cap

select Ticker,
concat(format(avg(`Market Cap`) / 10000000,2),' M') as Highest_market_cap
from synthetic_stock_data
group by ticker;

select Ticker,
concat(format(avg(`Market Cap`) / 10000000,2),' M') as Highest_market_cap
from synthetic_stock_data
where year(date) = '2023'
group by ticker;

-- 6) Stocks Near 52 Weeks High and Low

SELECT ticker,
        MAX(`52 Week High`) AS highest_price_52_weeks
FROM synthetic_stock_data
GROUP BY ticker;

SELECT ticker,
        MAX(`52 Week High`) AS highest_price_52_weeks
FROM synthetic_stock_data
where year(date) = '2023'
GROUP BY ticker;

SELECT ticker,
        MIN(`52 Week Low`) AS highest_price_52_weeks
FROM synthetic_stock_data
GROUP BY ticker;

SELECT ticker,
        MIN(`52 Week Low`) AS highest_price_52_weeks
FROM synthetic_stock_data
where year(date) = '2023'
GROUP BY ticker;

-- 7)Stocks with Strong Buy Signal and strong selling signals

select Ticker,
     min(`RSI (14 days)`)as strong_buy, MAX(MACD) as strong_buy,
     min(MACD) as strong_sell,MAX(`RSI (14 days)`) as strong_sell
               from synthetic_stock_data
			    group by Ticker;

select Ticker,
     min(`RSI (14 days)`)as strong_buy, MAX(MACD) as strong_buy,
     min(MACD) as strong_sell,MAX(`RSI (14 days)`) as strong_sell
               from synthetic_stock_data
               where year(date) = '2023'
			    group by Ticker;
--------------------------------------------------------------------------------------------


