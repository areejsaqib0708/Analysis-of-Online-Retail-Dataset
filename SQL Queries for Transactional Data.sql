 --                            Calculate total revenue per transaction
 SELECT InvoiceNo, SUM(Quantity * UnitPrice) AS TotalRevenue
FROM   [Internship].[dbo].['Cleaned_Online Retail$']
GROUP BY InvoiceNo;

--                              Identify cancelled transactions
SELECT InvoiceNo, SUM(Quantity * UnitPrice) AS TotalRevenue
FROM  [Internship].[dbo].['Cleaned_Online Retail$']
WHERE InvoiceNo LIKE 'C%'
GROUP BY InvoiceNo;

--                               Count transactions per customer
SELECT CustomerID, COUNT(DISTINCT InvoiceNo) AS TransactionCount
FROM  [Internship].[dbo].['Cleaned_Online Retail$']
GROUP BY CustomerID;

--                                Calculate monthly revenue
SELECT YEAR(InvoiceDate) AS Year, MONTH(InvoiceDate) AS Month, 
       SUM(Quantity * UnitPrice) AS MonthlyRevenue
FROM  [Internship].[dbo].['Cleaned_Online Retail$']
GROUP BY YEAR(InvoiceDate), MONTH(InvoiceDate)
ORDER BY Year, Month;

--                                Identify top 10 best-selling products
SELECT TOP 10 Description, SUM(Quantity) AS TotalQuantitySold
FROM  [Internship].[dbo].['Cleaned_Online Retail$']
GROUP BY Description
ORDER BY TotalQuantitySold DESC


--                                Flag cancelled transactions and confirmed transactions
SELECT InvoiceNo, CustomerID, 
       CASE 
           WHEN InvoiceNo LIKE 'C%' THEN 'Cancelled'
           ELSE 'Confirmed'
       END AS Status,
       SUM(Quantity * UnitPrice) AS TotalRevenue
FROM  [Internship].[dbo].['Cleaned_Online Retail$']
GROUP BY InvoiceNo, CustomerID;

--                                Calculate average order value
SELECT CustomerID, 
       AVG(TotalRevenue) AS AverageOrderValue
FROM (SELECT InvoiceNo, CustomerID, SUM(Quantity * UnitPrice) AS TotalRevenue
FROM  [Internship].[dbo].['Cleaned_Online Retail$']
    GROUP BY InvoiceNo, CustomerID
) AS Subquery
GROUP BY CustomerID;




