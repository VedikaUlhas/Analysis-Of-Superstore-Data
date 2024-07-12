--Connect to PostgreSQl database server
psql -U postgres

--Create Database
CREATE DATABASE superstore_db;

--Create Table
CREATE TABLE superstore (
    "RowID" INTEGER,
    "OrderID" TEXT,
    "OrderDate" DATE,
    "ShipDate" DATE,
    "ShipMode" TEXT,
    "CustomerID" TEXT,
    "CustomerName" TEXT,
    "Segment" TEXT,
    "Country" TEXT,
    "City" TEXT,
    "State" TEXT,
    "PostalCode" TEXT,
    "Region" TEXT,
    "ProductID" TEXT,
    "Category" TEXT,
    "SubCategory" TEXT,
    "ProductName" TEXT,
    "Sales" NUMERIC,
    "Quantity" INT,
    "Discount" NUMERIC,
    "Profit" NUMERIC
);

--Copy data from CSV file to PostgreSQl Table
\copy superstore("RowID", "OrderID", "OrderDate", "ShipDate", "ShipMode", "CustomerID", "CustomerName", "Segment", "Country", "City", "State", "PostalCode", "Region", "ProductID", "Category", "SubCategory", "ProductName", "Sales", "Quantity", "Discount", "Profit") FROM 'C:\Users\Dell\Downloads\archive\Sample - Superstore.csv' WITH (FORMAT csv, HEADER true);

-- Top Sales per Customer
 SELECT "CustomerID", "CustomerName", SUM("Sales") as "TotalSales" FROM superstore GROUP BY "CustomerID", "CustomerName" ORDER BY "TotalSales" DESC;

-- Average Discount by Product Category
SELECT "Category", AVG("Discount") AS avg_discount FROM superstore GROUP BY "Category";

--Top 5 Cities by Total Sales
SELECT "City", SUM("Sales") AS total_sales FROM superstore GROUP BY "City" ORDER BY total_sales DESC LIMIT 5;

--Product with sales greater than $5000
SELECT "ProductID", "ProductName", SUM("Sales") AS total_sales FROM superstore GROUP BY "ProductID", "ProductName" HAVING SUM("Sales") > 5000;

--Number of Orders per Shipping Mode
SELECT "ShipMode", COUNT(*) AS num_orders FROM superstore GROUP BY "ShipMode";