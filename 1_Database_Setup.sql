CREATE DATABASE ShopSphere_OLTP_V2;
GO

USE ShopSphere_OLTP_V2;
GO

-- Customers Table
CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50)
);

-- Products Table
CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName VARCHAR(100),
    Price INT
);

-- Orders Table
CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Quantity INT
);

-- Insert Sample Data
INSERT INTO Customers (CustomerName, City)
SELECT TOP 50 
'Customer_' + CAST(ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS VARCHAR),
'City_' + CAST(ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS VARCHAR)
FROM sys.objects;

INSERT INTO Products (ProductName, Price)
SELECT TOP 50 
'Product_' + CAST(ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS VARCHAR),
ABS(CHECKSUM(NEWID())) % 5000 + 100
FROM sys.objects;

INSERT INTO Orders (CustomerID, ProductID, Quantity)
SELECT TOP 100
ABS(CHECKSUM(NEWID())) % 50 + 1,
ABS(CHECKSUM(NEWID())) % 50 + 1,
ABS(CHECKSUM(NEWID())) % 5 + 1
FROM sys.objects;
