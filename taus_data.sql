-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 20, 2026 at 05:40 PM
-- Server version: 12.2.2-MariaDB
-- PHP Version: 8.5.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `taus_data`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`drew`@`localhost` PROCEDURE `sp_getStudents` ()   SELECT * FROM tbl_student$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_class`
--

CREATE TABLE `tbl_class` (
  `classID` int(11) NOT NULL,
  `className` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_class`
--

INSERT INTO `tbl_class` (`classID`, `className`, `location`) VALUES
(1, 'Math', 'Room 101'),
(2, 'English', 'Room 202'),
(3, 'Math', 'Room 101'),
(5, 'IT', 'Lab');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_student`
--

CREATE TABLE `tbl_student` (
  `studentID` int(11) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_student`
--

INSERT INTO `tbl_student` (`studentID`, `firstName`, `lastName`, `email`) VALUES
(1, 'John', 'Doe', 'John@email.com'),
(2, 'Jane', 'Smith', 'Jane@email.com'),
(5, 'Mike', 'Brown', 'mike@email.com');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_student_class`
--

CREATE TABLE `tbl_student_class` (
  `studentID` int(11) NOT NULL,
  `classID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_student_class`
--

INSERT INTO `tbl_student_class` (`studentID`, `classID`) VALUES
(1, 1),
(2, 2),
(5, 5);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_student_classes`
-- (See below for the actual view)
--
CREATE TABLE `vw_student_classes` (
`firstName` varchar(50)
,`lastName` varchar(50)
,`className` varchar(100)
);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_class`
--
ALTER TABLE `tbl_class`
  ADD PRIMARY KEY (`classID`);

--
-- Indexes for table `tbl_student`
--
ALTER TABLE `tbl_student`
  ADD PRIMARY KEY (`studentID`);

--
-- Indexes for table `tbl_student_class`
--
ALTER TABLE `tbl_student_class`
  ADD KEY `studentID` (`studentID`),
  ADD KEY `classID` (`classID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_class`
--
ALTER TABLE `tbl_class`
  MODIFY `classID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_student`
--
ALTER TABLE `tbl_student`
  MODIFY `studentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

-- --------------------------------------------------------

--
-- Structure for view `vw_student_classes`
--
DROP TABLE IF EXISTS `vw_student_classes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`drew`@`localhost` SQL SECURITY DEFINER VIEW `vw_student_classes`  AS SELECT `s`.`firstName` AS `firstName`, `s`.`lastName` AS `lastName`, `c`.`className` AS `className` FROM ((`tbl_student` `s` join `tbl_student_class` `sc` on(`s`.`studentID` = `sc`.`studentID`)) join `tbl_class` `c` on(`sc`.`classID` = `c`.`classID`)) ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_student_class`
--
ALTER TABLE `tbl_student_class`
  ADD CONSTRAINT `1` FOREIGN KEY (`studentID`) REFERENCES `tbl_student` (`studentID`),
  ADD CONSTRAINT `2` FOREIGN KEY (`classID`) REFERENCES `tbl_class` (`classID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
