-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 17, 2024 at 05:58 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `republic_of_engineers`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `event_title` varchar(100) NOT NULL,
  `event_description` text NOT NULL,
  `event_poster` varchar(255) NOT NULL,
  `event_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `schedule_type` varchar(20) NOT NULL,
  `event_address` varchar(255) DEFAULT NULL,
  `event_city` varchar(100) DEFAULT NULL,
  `event_state` varchar(100) DEFAULT NULL,
  `event_pincode` varchar(20) DEFAULT NULL,
  `event_agenda` text NOT NULL,
  `organization_name` varchar(100) NOT NULL,
  `organizer_name` varchar(100) NOT NULL,
  `organizer_contact` varchar(20) NOT NULL,
  `contact_visibility` tinyint(1) DEFAULT 0,
  `event_type` varchar(50) NOT NULL,
  `event_category` varchar(50) NOT NULL,
  `created_by_email` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `isDeleted` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `rating` int(11) DEFAULT 0,
  `category` varchar(50) DEFAULT 'Null',
  `date_submitted` datetime DEFAULT current_timestamp(),
  `isDeleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `news_letter`
--

CREATE TABLE `news_letter` (
  `Email` varchar(50) NOT NULL,
  `JoinedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `isDeleted` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `placement`
--

CREATE TABLE `placement` (
  `Email` varchar(255) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `DOB` date NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `University` varchar(255) NOT NULL,
  `College` varchar(255) NOT NULL,
  `Branch` varchar(255) NOT NULL,
  `Semester` int(11) NOT NULL,
  `Payment_Screenshot` varchar(255) NOT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `Email` varchar(255) NOT NULL,
  `FirstName` varchar(100) DEFAULT 'Null',
  `LastName` varchar(100) DEFAULT 'Null',
  `Phone` varchar(15) DEFAULT '00-00-0000',
  `DOB` date DEFAULT NULL,
  `Gender` varchar(10) DEFAULT 'Null',
  `Category` varchar(30) DEFAULT 'Null',
  `University` varchar(255) DEFAULT 'Null',
  `College` varchar(255) DEFAULT 'Null',
  `Branch` varchar(255) DEFAULT 'Null',
  `Semester` int(11) DEFAULT 0,
  `ProfilePicture` varchar(255) DEFAULT 'Null',
  `isDeleted` tinyint(1) DEFAULT 0,
  `isActive` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`Email`, `FirstName`, `LastName`, `Phone`, `DOB`, `Gender`, `Category`, `University`, `College`, `Branch`, `Semester`, `ProfilePicture`, `isDeleted`, `isActive`) VALUES
('mithun.1504.gowda@gmail.com', 'Mithuna', 'Gowda H', '7899238398', '2018-12-01', 'Male', 'Student', 'VTU', 'sjbit', 'CSE', 6, NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(2, 'admin'),
(1, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `ticket_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `ticket_title` varchar(100) NOT NULL,
  `ticket_description` text NOT NULL,
  `ticket_type` varchar(20) NOT NULL,
  `ticket_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `ticket_quantity` int(11) NOT NULL DEFAULT 0,
  `ticket_date` date NOT NULL,
  `ticket_end_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(500) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Category` varchar(30) DEFAULT NULL,
  `ProfilePictureURL` varchar(255) DEFAULT NULL,
  `GoogleUserID` varchar(50) DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `LastLogin` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `IsDeleted` tinyint(1) DEFAULT 0,
  `isActive` tinyint(1) DEFAULT 0,
  `role_id` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT 0,
  `verification_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Email`, `Password`, `FirstName`, `LastName`, `Category`, `ProfilePictureURL`, `GoogleUserID`, `CreatedAt`, `LastLogin`, `IsDeleted`, `isActive`, `role_id`, `verified`, `verification_token`) VALUES
(194, 'mithun.1504.gowda@gmail.com', '$2a$10$WeijiR..4vo.KHQ6ANTdBOrdVIPFWYkIIV4DVyR1gbGxBFf9SKrcG', 'Mithun', 'Gowda', NULL, 'https://lh3.googleusercontent.com/a/ACg8ocJb_LJmRzME-jXSCiFH6vgRg-mMlm_imGKtW5I4PWt9gOnYPA=s96-c', '117440016507038630782', '2024-07-08 11:06:49', '2024-07-17 04:21:09', 0, 1, 1, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1pdGh1bi4xNTA0Lmdvd2RhQGdtYWlsLmNvbSIsImlhdCI6MTcyMTE5MDAyNSwiZXhwIjoxNzIxMTkzNjI1fQ.6dS43OF7zoeoT3zRY3KvS5mXVMDUDiSazkwLA-5el2I');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `fk_events_users` (`created_by_email`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_letter`
--
ALTER TABLE `news_letter`
  ADD PRIMARY KEY (`Email`);

--
-- Indexes for table `placement`
--
ALTER TABLE `placement`
  ADD PRIMARY KEY (`Email`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`Email`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `fk_tickets_events` (`event_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `fk_events_users` FOREIGN KEY (`created_by_email`) REFERENCES `users` (`Email`);

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `fk_tickets_events` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
