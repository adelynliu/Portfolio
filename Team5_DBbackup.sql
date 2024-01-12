-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主機： localhost:8889
-- 產生時間： 2023 年 12 月 06 日 00:19
-- 伺服器版本： 5.7.39
-- PHP 版本： 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `Amazon`
--

-- --------------------------------------------------------

--
-- 資料表結構 `Account`
--

CREATE TABLE `Account` (
  `AccountID` int(11) NOT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `SellerID` int(11) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `UserName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `Account`
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
(21, 6, 10, 'PWD21', 'UN6');

-- --------------------------------------------------------

--
-- 資料表結構 `Customer`
--

CREATE TABLE `Customer` (
  `CustomerID` int(11) NOT NULL,
  `CustomerName` varchar(255) DEFAULT NULL,
  `CustomerPhoneNumber` varchar(20) DEFAULT NULL,
  `CustomerEmail` varchar(255) DEFAULT NULL,
  `CustomerStreet` varchar(255) DEFAULT NULL,
  `CustomerCity` varchar(255) DEFAULT NULL,
  `CustomerState` varchar(255) DEFAULT NULL,
  `CustomerZipCode` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `Customer`
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

-- --------------------------------------------------------

--
-- 資料表結構 `Order`
--

CREATE TABLE `Order` (
  `OrderID` int(11) NOT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `OrderDate` date DEFAULT NULL,
  `OrderStatus` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `Order`
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
-- 資料表結構 `OrderProductDetail`
--

CREATE TABLE `OrderProductDetail` (
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `OrderQuantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `OrderProductDetail`
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

--
-- 資料表結構 `Product`
--

CREATE TABLE `Product` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(255) DEFAULT NULL,
  `UnitPrice` decimal(10,2) DEFAULT NULL,
  `SellerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `Product`
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

--
-- 資料表結構 `ProductWarehouse`
--

CREATE TABLE `ProductWarehouse` (
  `ProductID` int(11) NOT NULL,
  `WarehouseID` int(11) NOT NULL,
  `ProductNum` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `ProductWarehouse`
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

--
-- 資料表結構 `Refund`
--

CREATE TABLE `Refund` (
  `RefundID` int(11) NOT NULL,
  `ReturnID` int(11) DEFAULT NULL,
  `RefundPrice` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `Refund`
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
-- 資料表結構 `Replacement`
--

CREATE TABLE `Replacement` (
  `ReplacementID` int(11) NOT NULL,
  `ReturnID` int(11) DEFAULT NULL,
  `ReturnQuantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `Replacement`
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

--
-- 資料表結構 `ReturnRequest`
--

CREATE TABLE `ReturnRequest` (
  `ReturnID` int(11) NOT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `ReturnRequestDate` date DEFAULT NULL,
  `ReturnQuantity` int(11) DEFAULT NULL,
  `ReturnReason` varchar(255) DEFAULT NULL,
  `ReturnStatus` varchar(255) DEFAULT NULL,
  `ReturnDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `ReturnRequest`
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
-- 資料表結構 `Seller`
--

CREATE TABLE `Seller` (
  `SellerID` int(11) NOT NULL,
  `SellerName` varchar(255) DEFAULT NULL,
  `SellerPhoneNumber` varchar(20) DEFAULT NULL,
  `SellerEmail` varchar(255) DEFAULT NULL,
  `SellerStreet` varchar(255) DEFAULT NULL,
  `SellerCity` varchar(255) DEFAULT NULL,
  `SellerState` varchar(255) DEFAULT NULL,
  `SellerZipCode` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `Seller`
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

-- --------------------------------------------------------

--
-- 資料表結構 `Warehouse`
--

CREATE TABLE `Warehouse` (
  `WarehouseID` int(11) NOT NULL,
  `WarehouseName` varchar(255) DEFAULT NULL,
  `WarehousePhoneNumber` varchar(20) DEFAULT NULL,
  `WarehouseStreet` varchar(255) DEFAULT NULL,
  `WarehouseCity` varchar(255) DEFAULT NULL,
  `WarehouseState` varchar(255) DEFAULT NULL,
  `WarehouseZipCode` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `Warehouse`
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
-- 已傾印資料表的索引
--

--
-- 資料表索引 `Account`
--
ALTER TABLE `Account`
  ADD PRIMARY KEY (`AccountID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `SellerID` (`SellerID`);

--
-- 資料表索引 `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- 資料表索引 `Order`
--
ALTER TABLE `Order`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- 資料表索引 `OrderProductDetail`
--
ALTER TABLE `OrderProductDetail`
  ADD PRIMARY KEY (`OrderID`,`ProductID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- 資料表索引 `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `SellerID` (`SellerID`);

--
-- 資料表索引 `ProductWarehouse`
--
ALTER TABLE `ProductWarehouse`
  ADD PRIMARY KEY (`ProductID`,`WarehouseID`),
  ADD KEY `WarehouseID` (`WarehouseID`);

--
-- 資料表索引 `Refund`
--
ALTER TABLE `Refund`
  ADD PRIMARY KEY (`RefundID`),
  ADD KEY `ReturnID` (`ReturnID`);

--
-- 資料表索引 `Replacement`
--
ALTER TABLE `Replacement`
  ADD PRIMARY KEY (`ReplacementID`),
  ADD KEY `ReturnID` (`ReturnID`);

--
-- 資料表索引 `ReturnRequest`
--
ALTER TABLE `ReturnRequest`
  ADD PRIMARY KEY (`ReturnID`),
  ADD KEY `ProductID` (`ProductID`),
  ADD KEY `OrderID` (`OrderID`);

--
-- 資料表索引 `Seller`
--
ALTER TABLE `Seller`
  ADD PRIMARY KEY (`SellerID`);

--
-- 資料表索引 `Warehouse`
--
ALTER TABLE `Warehouse`
  ADD PRIMARY KEY (`WarehouseID`);

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `Account`
--
ALTER TABLE `Account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`),
  ADD CONSTRAINT `account_ibfk_2` FOREIGN KEY (`SellerID`) REFERENCES `Seller` (`SellerID`);

--
-- 資料表的限制式 `Order`
--
ALTER TABLE `Order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`);

--
-- 資料表的限制式 `OrderProductDetail`
--
ALTER TABLE `OrderProductDetail`
  ADD CONSTRAINT `orderproductdetail_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `Order` (`OrderID`),
  ADD CONSTRAINT `orderproductdetail_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`);

--
-- 資料表的限制式 `Product`
--
ALTER TABLE `Product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`SellerID`) REFERENCES `Seller` (`SellerID`);

--
-- 資料表的限制式 `ProductWarehouse`
--
ALTER TABLE `ProductWarehouse`
  ADD CONSTRAINT `productwarehouse_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`),
  ADD CONSTRAINT `productwarehouse_ibfk_2` FOREIGN KEY (`WarehouseID`) REFERENCES `Warehouse` (`WarehouseID`);

--
-- 資料表的限制式 `Refund`
--
ALTER TABLE `Refund`
  ADD CONSTRAINT `refund_ibfk_1` FOREIGN KEY (`ReturnID`) REFERENCES `ReturnRequest` (`ReturnID`);

--
-- 資料表的限制式 `Replacement`
--
ALTER TABLE `Replacement`
  ADD CONSTRAINT `replacement_ibfk_1` FOREIGN KEY (`ReturnID`) REFERENCES `ReturnRequest` (`ReturnID`);

--
-- 資料表的限制式 `ReturnRequest`
--
ALTER TABLE `ReturnRequest`
  ADD CONSTRAINT `returnrequest_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`),
  ADD CONSTRAINT `returnrequest_ibfk_2` FOREIGN KEY (`OrderID`) REFERENCES `Order` (`OrderID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
