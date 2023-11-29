-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2023 at 03:13 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbjobs`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Admin_ID` int(10) NOT NULL,
  `Admin_Name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `apply`
--

CREATE TABLE `apply` (
  `ID_Apply` int(10) NOT NULL,
  `JS_ID` int(10) NOT NULL,
  `Date_Apply` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `approve`
--

CREATE TABLE `approve` (
  `ID_Approve` int(10) NOT NULL,
  `Admin_ID` int(10) NOT NULL,
  `Date_Approve` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `username` varchar(30) NOT NULL,
  `ID_Role` int(10) NOT NULL,
  `Name_Customer` varchar(25) NOT NULL,
  `Password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `jobprovider`
--

CREATE TABLE `jobprovider` (
  `JP_ID` int(10) NOT NULL,
  `Company_Name` varchar(30) NOT NULL,
  `Company_Address` varchar(30) NOT NULL,
  `Company_Contact_Num` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `jobseeker`
--

CREATE TABLE `jobseeker` (
  `JS_ID` int(10) NOT NULL,
  `JS_Name` varchar(30) NOT NULL,
  `JS_Address` int(30) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Contact_Num` int(20) NOT NULL,
  `Gender` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `ID_Request` int(10) NOT NULL,
  `JP_ID` int(10) NOT NULL,
  `Date_Request` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `ID_Role` int(10) NOT NULL,
  `Name_Role` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `vacancy`
--

CREATE TABLE `vacancy` (
  `Vacancy_ID` int(10) NOT NULL,
  `ID_Approve` int(10) NOT NULL,
  `ID_Apply` int(10) NOT NULL,
  `ID_Request` int(10) NOT NULL,
  `Vacancy_Title` varchar(30) NOT NULL,
  `Vacancy_Desc` varchar(30) NOT NULL,
  `Num_Of_Jobs` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Admin_ID`);

--
-- Indexes for table `apply`
--
ALTER TABLE `apply`
  ADD PRIMARY KEY (`ID_Apply`),
  ADD KEY `fk_js` (`JS_ID`);

--
-- Indexes for table `approve`
--
ALTER TABLE `approve`
  ADD PRIMARY KEY (`ID_Approve`),
  ADD KEY `fk_Admin` (`Admin_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`username`),
  ADD KEY `fk_Role` (`ID_Role`);

--
-- Indexes for table `jobprovider`
--
ALTER TABLE `jobprovider`
  ADD PRIMARY KEY (`JP_ID`);

--
-- Indexes for table `jobseeker`
--
ALTER TABLE `jobseeker`
  ADD PRIMARY KEY (`JS_ID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`ID_Request`),
  ADD KEY `fk_jp` (`JP_ID`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`ID_Role`);

--
-- Indexes for table `vacancy`
--
ALTER TABLE `vacancy`
  ADD PRIMARY KEY (`Vacancy_ID`),
  ADD KEY `fk_approve` (`ID_Approve`),
  ADD KEY `fk_apply` (`ID_Apply`),
  ADD KEY `fk_request` (`ID_Request`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `apply`
--
ALTER TABLE `apply`
  ADD CONSTRAINT `fk_js` FOREIGN KEY (`JS_ID`) REFERENCES `jobseeker` (`JS_ID`);

--
-- Constraints for table `approve`
--
ALTER TABLE `approve`
  ADD CONSTRAINT `fk_Admin` FOREIGN KEY (`Admin_ID`) REFERENCES `admin` (`Admin_ID`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `fk_Role` FOREIGN KEY (`ID_Role`) REFERENCES `role` (`ID_Role`);

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `fk_jp` FOREIGN KEY (`JP_ID`) REFERENCES `jobprovider` (`JP_ID`);

--
-- Constraints for table `vacancy`
--
ALTER TABLE `vacancy`
  ADD CONSTRAINT `fk_apply` FOREIGN KEY (`ID_Apply`) REFERENCES `apply` (`ID_Apply`),
  ADD CONSTRAINT `fk_approve` FOREIGN KEY (`ID_Approve`) REFERENCES `approve` (`ID_Approve`),
  ADD CONSTRAINT `fk_request` FOREIGN KEY (`ID_Request`) REFERENCES `request` (`ID_Request`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
