--
-- Create Database
CREATE DATABASE Amazon;
-- -------------------------------------------------------

-- Create Tables
 
CREATE TABLE Customer (
	CustomerID INT PRIMARY KEY,
	CustomerName VARCHAR(255),
	CustomerPhoneNumber VARCHAR(20),
	CustomerEmail VARCHAR(255),
	CustomerStreet VARCHAR(255),
	CustomerCity VARCHAR(255),
	CustomerState VARCHAR(255),
	CustomerZipCode VARCHAR(10)
);
 
CREATE TABLE Seller (
	SellerID INT PRIMARY KEY,
	SellerName VARCHAR(255),
	SellerPhoneNumber VARCHAR(20),
	SellerEmail VARCHAR(255),
	SellerStreet VARCHAR(255),
	SellerCity VARCHAR(255),
	SellerState VARCHAR(255),
	SellerZipCode VARCHAR(10)
);
 
CREATE TABLE Account (
	AccountID INT PRIMARY KEY,
	CustomerID INT,
	SellerID INT,
	Password VARCHAR(255),
	UserName VARCHAR(255),
	FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
	FOREIGN KEY (SellerID) REFERENCES Seller(SellerID)
);
 
CREATE TABLE `Order` (
	OrderID INT PRIMARY KEY,
	CustomerID INT,
	OrderDate DATE,
	OrderStatus VARCHAR(255),
	FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);
 
CREATE TABLE Product (
	ProductID INT PRIMARY KEY,
	ProductName VARCHAR(255),
	UnitPrice DECIMAL(10, 2),
	SellerID INT,
	FOREIGN KEY (SellerID) REFERENCES Seller(SellerID)
);
 
CREATE TABLE OrderProductDetail (
	OrderID INT,
	ProductID INT,
	OrderQuantity INT,
	PRIMARY KEY (OrderID, ProductID),
	FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID),
	FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);
 
 
CREATE TABLE ReturnRequest (
	ReturnID INT PRIMARY KEY,
	ProductID INT,
	OrderID INT,
	ReturnRequestDate DATE,
	ReturnQuantity INT,
	ReturnReason VARCHAR(255),
	ReturnStatus VARCHAR(255),
	ReturnDate DATE,
	FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
	FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID)
);
 
 
CREATE TABLE Replacement (
	ReplacementID INT PRIMARY KEY,
	ReturnID INT,
	ReturnQuantity INT,
	FOREIGN KEY (ReturnID) REFERENCES ReturnRequest(ReturnID)
);
 
CREATE TABLE Refund (
	RefundID INT PRIMARY KEY,
	ReturnID INT,
	RefundPrice DECIMAL(10, 2),
	FOREIGN KEY (ReturnID) REFERENCES ReturnRequest(ReturnID)
);
 
CREATE TABLE Warehouse (
	WarehouseID INT PRIMARY KEY,
	WarehouseName VARCHAR(255),
	WarehousePhoneNumber VARCHAR(20),
	WarehouseStreet VARCHAR(255),
	WarehouseCity VARCHAR(255),
	WarehouseState VARCHAR(255),
	WarehouseZipCode VARCHAR(10)
);
 
CREATE TABLE ProductWarehouse (
	ProductID INT,
	WarehouseID INT,
             ProductNum INT,
	PRIMARY KEY (ProductID, WarehouseID),
	FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
	FOREIGN KEY (WarehouseID) REFERENCES Warehouse(WarehouseID)
);

--
--
-- Insert value into Table `Customer`
--

INSERT INTO `Customer` (`CustomerID`, `CustomerName`, `CustomerPhoneNumber`, `CustomerEmail`, `CustomerStreet`, `CustomerCity`, `CustomerState`, `CustomerZipCode`) VALUES
(1, 'CN1', '123456000', 'TEST_EMAIL_1', 'TEST_ADDRESS_1', 'TEST_CITY_1', 'TEST_STATE_1', NULL),
(2, 'CN2', '123456001', 'TEST_EMAIL_2', 'TEST_ADDRESS_2', 'TEST_CITY_1', 'TEST_STATE_1', '22002'),
(3, 'CN3', '123456003', 'TEST_EMAIL_3', 'TEST_ADDRESS_4', 'TEST_CITY_1', 'TEST_STATE_1', '22002'),
(4, 'CN4', '123456004', 'TEST_EMAIL_3', 'TEST_ADDRESS_4', 'TEST_CITY_1', 'TEST_STATE_1', '22002'),
(5, 'CN5', '123456005', 'TEST_EMAIL_5', 'TEST_ADDRESS_5', 'TEST_CITY_2', 'TEST_STATE_1', '22003'),
(6, 'CN6', '123456006', 'TEST_EMAIL_6', 'TEST_ADDRESS_6', 'TEST_CITY_2', 'TEST_STATE_1', '22003'),
(7, 'CN7', '123456007', 'TEST_EMAIL_7', 'TEST_ADDRESS_7', 'TEST_CITY_3', 'TEST_STATE_2', '22004'),
(8, 'CN8', '123456008', 'TEST_EMAIL_8', 'TEST_ADDRESS_8', 'TEST_CITY_3', 'TEST_STATE_2', '22004'),
(9, 'CN9', '123456009', 'TEST_EMAIL_9', 'TEST_ADDRESS_9', 'TEST_CITY_4', 'TEST_STATE_3', '22005'),
(10, 'CN10', '123456010', 'TEST_EMAIL_10', 'TEST_ADDRESS_10', 'TEST_CITY_5', 'TEST_STATE_4', '22006');


-- Insert value into Table `Seller`
--

INSERT INTO `Seller` (`SellerID`, `SellerName`, `SellerPhoneNumber`, `SellerEmail`, `SellerStreet`, `SellerCity`, `SellerState`, `SellerZipCode`) VALUES
(1, 'SN1', '6543210001', 'TEST_EMAIL_11', 'TEST_ADDRESS_11', 'TEST_CITY_1', 'TEST_STATE_1', '20001'),
(2, 'SN2', '6543210002', 'TEST_EMAIL_12', 'TEST_ADDRESS_12', 'TEST_CITY_12', 'TEST_STATE_12', '20002'),
(3, 'SN3', '6543210003', 'TEST_EMAIL_13', 'TEST_ADDRESS_13', 'TEST_CITY_13', 'TEST_STATE_12', '20003'),
(4, 'SN4', '6543210004', 'TEST_EMAIL_14', 'TEST_ADDRESS_14', 'TEST_CITY_14', 'TEST_STATE_12', '20004'),
(5, 'SN5', '6543210005', 'TEST_EMAIL_15', 'TEST_ADDRESS_15', 'TEST_CITY_15', 'TEST_STATE_12', '20005'),
(6, 'SN6', '6543210006', 'TEST_EMAIL_16', 'TEST_ADDRESS_16', 'TEST_CITY_16', 'TEST_STATE_12', '20006'),
(7, 'SN7', '6543210007', 'TEST_EMAIL_17', 'TEST_ADDRESS_17', 'TEST_CITY_17', 'TEST_STATE_13', '21007'),
(8, 'SN8', '6543210008', 'TEST_EMAIL_18', 'TEST_ADDRESS_18', 'TEST_CITY_17', 'TEST_STATE_13', '21008'),
(9, 'SN9', '6543210009', 'TEST_EMAIL_19', 'TEST_ADDRESS_19', 'TEST_CITY_3', 'TEST_STATE_2', '22004'),
(10, 'SN10', '1234560001', 'TEST_EMAIL_6', 'TEST_ADDRESS_6', 'TEST_CITY_2', 'TEST_STATE_1', '22003');


-- Insert value into Table `Account`
--
INSERT INTO `Account` (`AccountID`, `CustomerID`, `SellerID`, `Password`, `UserName`) VALUES
(1, 1, NULL, 'PWD1', 'UN1'),
(2, 2, NULL, 'PWD2', 'UN2'),
(3, 3, NULL, 'PWD3', 'UN3'),
(4, 4, NULL, 'PWD4', 'UN4'),
(5, 5, NULL, 'PWD5', 'UN5'),
(6, 6, NULL, 'PWD6', 'UN6'),
(7, 7, NULL, 'PWD7', 'UN7'),
(8, 8, NULL, 'PWD8', 'UN8'),
(9, 9, NULL, 'PWD9', 'UN9'),
(10, 10, NULL, 'PWD10', 'UN10'),
(11, NULL, 1, 'PWD11', 'UN11'),
(12, NULL, 2, 'PWD12', 'UN12'),
(13, NULL, 3, 'PWD13', 'UN13'),
(14, NULL, 4, 'PWD14', 'UN14'),
(15, NULL, 5, 'PWD15', 'UN15'),
(16, NULL, 6, 'PWD16', 'UN16'),
(17, NULL, 7, 'PWD17', 'UN17'),
(18, NULL, 8, 'PWD18', 'UN18'),
(19, NULL, 9, 'PWD19', 'UN19'),
(20, NULL, 10, 'PWD20', 'UN6'),
(21, 6, 10, 'PWD21', 'UN6')

--
-- Insert value into Table `Warehouse`
--

INSERT INTO `Warehouse` (`WarehouseID`, `WarehouseName`, `WarehousePhoneNumber`, `WarehouseStreet`, `WarehouseCity`, `WarehouseState`, `WarehouseZipCode`) VALUES
(1, 'WN1', '1122334401', 'TEST_ADDRESS_20', 'TEST_CITY_1', 'TEST_STATE_1', '20001'),
(2, 'WN2', '1122334402', 'TEST_ADDRESS_21', 'TEST_CITY_2', 'TEST_STATE_1', '22003'),
(3, 'WN3', '1122334403', 'TEST_ADDRESS_22', 'TEST_CITY_3', 'TEST_STATE_2', '22004'),
(4, 'WN4', '1122334404', 'TEST_ADDRESS_23', 'TEST_CITY_12', 'TEST_STATE_12', '20002'),
(5, 'WN5', '1122334405', 'TEST_ADDRESS_24', 'TEST_CITY_17', 'TEST_STATE_13', '21007'),
(6, 'WN6', '1122334406', 'TEST_ADDRESS_25', 'TEST_CITY_4', 'TEST_STATE_3', '22005'),
(7, 'WN7', '1122334407', 'TEST_ADDRESS_26', 'TEST_CITY_5', 'TEST_STATE_4', '22006'),
(8, 'WN8', '1122334408', 'TEST_ADDRESS_27', 'TEST_CITY_1', 'TEST_STATE_1', '20001'),
(9, 'WN9', '1122334409', 'TEST_ADDRESS_28', 'TEST_CITY_3', 'TEST_STATE_2', '22004'),
(10, 'WN10', '1122334410', 'TEST_ADDRESS_29', 'TEST_CITY_15', 'TEST_STATE_12', '20005');


--
-- Insert value into Table `Product`
--

INSERT INTO `Product` (`ProductID`, `ProductName`, `UnitPrice`, `SellerID`) VALUES
(1, 'PN1', '22.01', 1),
(2, 'PN2', '23.01', 2),
(3, 'PN3', '33.01', 3),
(4, 'PN4', '43.01', 4),
(5, 'PN5', '53.01', 5),
(6, 'PN6', '26.01', 6),
(7, 'PN7', '27.01', 7),
(8, 'PN8', '28.01', 8),
(9, 'PN9', '23.91', 9),
(10, 'PN10', '23.11', 10),
(11, 'PN11', '24.21', 1);

-- --------------------------------------------------------

--Insert value into Table`Order`
--

INSERT INTO `Order` (`OrderID`, `CustomerID`, `OrderDate`, `OrderStatus`) VALUES
(1, 1, '2023-10-07', 'FINISHED'),
(2, 2, '2023-10-02', 'FINISHED'),
(3, 3, '2023-10-03', 'FINISHED'),
(4, 4, '2023-10-04', 'FINISHED'),
(5, 5, '2023-10-05', 'FINISHED'),
(6, 6, '2023-11-03', 'FINISHED'),
(7, 7, '2023-11-03', 'FINISHED'),
(8, 8, '2023-11-04', 'FINISHED'),
(9, 9, '2023-10-09', 'FINISHED'),
(10, 1, '2023-12-02', 'PROCESSING');

-- --------------------------------------------------------

--
-- Insert value into Table `OrderProductDetail`
--

INSERT INTO `OrderProductDetail` (`OrderID`, `ProductID`, `OrderQuantity`) VALUES
(1, 1, 5),
(1, 2, 2),
(2, 2, 4),
(2, 3, 3),
(3, 3, 3),
(3, 4, 4),
(4, 4, 2),
(4, 5, 5),
(5, 5, 1),
(5, 6, 5),
(6, 6, 5),
(6, 7, 4),
(7, 7, 4),
(7, 8, 3),
(8, 8, 3),
(8, 9, 2),
(9, 9, 2),
(9, 11, 1),
(10, 1, 1),
(10, 2, 21),
(10, 7, 1);

-- --------------------------------------------------------
-- Insert value into Table `ProductWarehouse`
--

INSERT INTO `ProductWarehouse` (`ProductID`, `WarehouseID`, `ProductNum`) VALUES
(1, 10, 1145141),
(2, 6, 1145140),
(2, 9, 1145142),
(3, 8, 1145143),
(4, 7, 1145144),
(5, 6, 1145145),
(6, 5, 1145146),
(7, 4, 1145147),
(8, 3, 1145148),
(9, 2, 1145149),
(10, 1, 1145141),
(11, 1, 1145140);

-- --------------------------------------------------------
-- Insert value into Table `ReturnRequest`
--
INSERT INTO `ReturnRequest` (`ReturnID`, `ProductID`, `OrderID`, `ReturnRequestDate`, `ReturnQuantity`, `ReturnReason`, `ReturnStatus`, `ReturnDate`) VALUES
(1, 1, 1, '2023-10-08', 4, 'RR1', 'FINISHED', '2023-10-18'),
(2, 2, 1, '2023-10-08', 2, 'RR1', 'FINISHED', '2023-10-18'),
(3, 2, 2, '2023-10-08', 4, 'RR1', 'FINISHED', '2023-10-18'),
(4, 3, 2, '2023-10-08', 1, 'RR1', 'FINISHED', '2023-10-18'),
(5, 3, 3, '2023-10-08', 1, 'RR1', 'FINISHED', '2023-10-18'),
(6, 4, 4, '2023-11-11', 2, 'RR4', 'FINISHED', '2023-11-29'),
(7, 5, 4, '2023-11-11', 5, 'RR1', 'FINISHED', '2023-11-29'),
(8, 5, 5, '2023-10-08', 1, 'RR1', 'FINISHED', '2023-10-18'),
(9, 6, 5, '2023-10-08', 1, 'RR1', 'FINISHED', '2023-10-18'),
(10, 6, 6, '2023-11-11', 5, 'RR1', 'FINISHED', '2023-11-29'),
(11, 7, 6, '2023-11-11', 5, 'RR1', 'FINISHED', '2023-11-29'),
(12, 7, 7, '2023-11-11', 5, 'RR1', 'FINISHED', '2023-11-29'),
(13, 8, 7, '2023-11-11', 5, 'RR1', 'FINISHED', '2023-11-29'),
(14, 8, 8, '2023-11-11', 5, 'RR1', 'FINISHED', '2023-11-29'),
(15, 9, 8, '2023-11-11', 5, 'RR1', 'FINISHED', '2023-11-29'),
(16, 9, 9, '2023-10-11', 1, 'RR1', 'FINISHED', '2023-10-27'),
(17, 11, 9, '2023-10-11', 1, 'RR2', 'FINISHED', '2023-10-27'),
(18, 1, 10, '2023-12-03', 1, 'RR1', 'PROCESSING', NULL),
(19, 2, 10, '2023-12-03', 10, 'RR2', 'PROCESSING', NULL),
(20, 4, 3, '2023-10-08', 4, 'RR1', 'FINISHED', '2023-10-18');

-- --------------------------------------------------------
--
-- Insert value into Table `Refund`
--

INSERT INTO `Refund` (`RefundID`, `ReturnID`, `RefundPrice`) VALUES
(1, 1, '50.00'),
(2, 2, '50.00'),
(3, 3, '25.00'),
(4, 4, '35.00'),
(5, 5, '34.00'),
(6, 6, '8.00'),
(7, 7, '12.00'),
(8, 8, '51.00'),
(9, 9, '18.00'),
(10, 10, '22.00');

-- --------------------------------------------------------
--
-- Insert value into Table `Replacement`
--

INSERT INTO `Replacement` (`ReplacementID`, `ReturnID`, `ReturnQuantity`) VALUES
(11, 11, 5),
(12, 12, 5),
(13, 13, 5),
(14, 14, 5),
(15, 15, 5),
(16, 16, 1),
(17, 17, 1),
(18, 18, 1),
(19, 19, 10),
(20, 20, 4);

-- --------------------------------------------------------
--------------------- Business questions ------------------

-- Retrieve the total quantity of each product in each warehouse:
SELECT ProductID, WarehouseID, SUM(ProductNum) AS TotalQuantity
FROM ProductWarehouse
GROUP BY ProductID, WarehouseID;

--  Retrieve all orders with the corresponding customer information:
SELECT O.OrderID, O.OrderDate, O.OrderStatus, C.CustomerName
FROM `Order` O
JOIN Customer C ON O.CustomerID = C.CustomerID;

-- Get the count of orders for each customer
SELECT CustomerID, COUNT(OrderID) AS OrderCount
FROM `Order`
GROUP BY CustomerID;

-- Find the total revenue generated by each seller
SELECT SellerID, SUM(UnitPrice * OrderQuantity) AS TotalRevenue
FROM Product
JOIN OrderProductDetail ON Product.ProductID = OrderProductDetail.ProductID
GROUP BY SellerID;

-- Identify the products with the highest return quantities
SELECT ProductID, SUM(ReturnQuantity) AS TotalReturns
FROM ReturnRequest
GROUP BY ProductID
ORDER BY TotalReturns DESC;

-- Get the number of returns as 'FINISHED' by each warehouse
SELECT WarehouseID, COUNT(ReturnID) AS ReturnsProcessed
FROM ReturnRequest
WHERE ReturnStatus = 'FINISHED'
GROUP BY WarehouseID;

-- Identify the top-selling product (highest total quantity sold)
SELECT ProductID, SUM(OrderQuantity) AS TotalSold
FROM OrderProductDetail
GROUP BY ProductID
ORDER BY TotalSold DESC
LIMIT 1;

-- Get the count of return requests for each reason
SELECT ReturnReason, COUNT(ReturnID) AS RequestCount
FROM ReturnRequest
GROUP BY ReturnReason;

-- Find the sellers with the most returned products
SELECT SellerID, COUNT(ReturnID) AS ReturnedProducts
FROM Product
JOIN ReturnRequest ON Product.ProductID = ReturnRequest.ProductID
GROUP BY SellerID
ORDER BY ReturnedProducts DESC;

-- Identify customers who have returned products more than once and list the products they returned
SELECT r.CustomerID, COUNT(DISTINCT r.ReturnID) AS ReturnCount, GROUP_CONCAT(DISTINCT p.ProductName ORDER BY p.ProductName) AS ReturnedProducts
FROM ReturnRequest r
JOIN Product p ON r.ProductID = p.ProductID
GROUP BY r.CustomerID
HAVING ReturnCount > 1;

-- Identify the sellers with the highest total revenue and the number of completed orders they contributed to
SELECT s.SellerName, COUNT(DISTINCT o.OrderID) AS CompletedOrders, SUM(p.UnitPrice * op.OrderQuantity) AS TotalRevenue
FROM Seller s
JOIN Product p ON s.SellerID = p.SellerID
JOIN OrderProductDetail op ON p.ProductID = op.ProductID
JOIN `Order` o ON op.OrderID = o.OrderID
WHERE o.OrderStatus = 'FINISHED'
GROUP BY s.SellerName
ORDER BY TotalRevenue DESC;

-- Retrieve the products that were ordered the most during the last month
SELECT p.ProductName, SUM(op.OrderQuantity) AS TotalOrderedQuantity
FROM `Order` o
JOIN OrderProductDetail op ON o.OrderID = op.OrderID
JOIN Product p ON op.ProductID = p.ProductID
WHERE o.OrderDate >= LAST_DAY(CURDATE() - INTERVAL 2 MONTH) + INTERVAL 1 DAY AND o.OrderDate < LAST_DAY(CURDATE() - INTERVAL 1 MONTH) + INTERVAL 1 DAY
GROUP BY p.ProductName
ORDER BY TotalOrderedQuantity DESC;

-- Find the average time it takes for customers to request a return after placing an order
SELECT r.CustomerID, AVG(DATEDIFF(r.ReturnRequestDate, o.OrderDate)) AS AvgDaysToReturn
FROM ReturnRequest r
JOIN `Order` o ON r.OrderID = o.OrderID
GROUP BY r.CustomerID;



