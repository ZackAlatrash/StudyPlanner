-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Jan 18, 2025 at 10:43 PM
-- Server version: 11.5.2-MariaDB-ubu2404
-- PHP Version: 8.2.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `developmentdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `GroupMembers`
--

CREATE TABLE `GroupMembers` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `joined_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `GroupMembers`
--

INSERT INTO `GroupMembers` (`id`, `group_id`, `user_id`, `joined_at`) VALUES
(18, 28, 1, '2024-12-19 09:21:33'),
(19, 29, 9, '2025-01-14 20:35:25'),
(22, 28, 9, '2025-01-14 20:53:07');

-- --------------------------------------------------------

--
-- Table structure for table `Groups`
--

CREATE TABLE `Groups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `Groups`
--

INSERT INTO `Groups` (`id`, `name`, `description`, `created_by`, `created_at`, `updated_at`) VALUES
(27, 'Haarlem Festival', '', 1, '2024-12-18 19:56:56', '2024-12-18 19:56:56'),
(28, 'test', 'test', 1, '2024-12-19 09:21:33', '2024-12-19 09:21:33'),
(29, 'the homies', 'projects', 9, '2025-01-14 20:35:25', '2025-01-14 20:35:25');

-- --------------------------------------------------------

--
-- Table structure for table `Resources`
--

CREATE TABLE `Resources` (
  `id` int(11) NOT NULL,
  `task_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `type` enum('file','link','note') NOT NULL,
  `resource_path` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `Resources`
--

INSERT INTO `Resources` (`id`, `task_id`, `subject_id`, `type`, `resource_path`, `note`, `created_at`, `user_id`) VALUES
(1, NULL, NULL, 'note', NULL, 'fafa is smart', '2024-12-18 20:48:31', 1),
(2, NULL, 3, 'note', NULL, 'tets', '2024-12-30 20:08:27', 1),
(3, NULL, 1, 'file', 'uploads/58fd4c71-6bd5-4534-8f1f-ab0203d750d7_thumb1920.jpg', NULL, '2024-12-30 20:08:56', 1),
(4, NULL, 3, 'link', 'https://www.w3schools.com/', NULL, '2024-12-30 20:09:13', 1),
(5, NULL, 2, 'note', NULL, 'trest', '2025-01-02 20:17:20', 1),
(6, NULL, 1, 'link', 'https://www.w3schools.com/', NULL, '2025-01-02 20:17:33', 0),
(7, NULL, 3, 'file', 'uploads/58fd4c71-6bd5-4534-8f1f-ab0203d750d7_thumb1920.jpg', NULL, '2025-01-02 20:22:28', 0),
(8, NULL, 12, 'file', 'uploads/2425 Briefing for Assignment 3 _Program and Tickets_FINAL.pdf', NULL, '2025-01-02 20:32:57', 0),
(9, NULL, 3, 'note', NULL, 'testing', '2025-01-06 16:03:50', 1),
(10, NULL, 14, 'link', 'https://www.w3schools.com/', NULL, '2025-01-14 20:44:59', 9),
(11, NULL, 15, 'file', 'uploads/50202d2a54ba41d183185764685bb49b.jpeg', NULL, '2025-01-14 20:45:11', 9),
(12, NULL, 14, 'file', 'uploads/Ashes of the Wake.tri', NULL, '2025-01-18 21:42:51', 9);

-- --------------------------------------------------------

--
-- Table structure for table `Subjects`
--

CREATE TABLE `Subjects` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `Subjects`
--

INSERT INTO `Subjects` (`id`, `user_id`, `name`) VALUES
(1, 1, 'Mathematics'),
(2, 1, 'Physics'),
(3, 1, 'Computer Science'),
(4, 3, 'History'),
(12, 1, 'Web design'),
(13, 1, 'Project management'),
(14, 9, 'English'),
(15, 9, 'math');

-- --------------------------------------------------------

--
-- Table structure for table `Tasks`
--

CREATE TABLE `Tasks` (
  `id` int(11) NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `priority` enum('Low','Medium','High') NOT NULL,
  `due_date` date NOT NULL,
  `is_completed` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `completed_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `Tasks`
--

INSERT INTO `Tasks` (`id`, `subject_id`, `title`, `description`, `priority`, `due_date`, `is_completed`, `created_at`, `updated_at`, `completed_at`, `user_id`, `group_id`) VALUES
(23, 3, 'Project haarlem', 'Sprint 3 and create the scenarios', 'Medium', '2024-12-19', 1, '2024-12-12 13:15:52', '2024-12-19 14:03:21', '2024-12-19 14:03:21', 1, NULL),
(26, 12, 'due time test', 'test', 'Medium', '2024-12-15', 1, '2024-12-14 15:22:27', '2024-12-19 09:17:50', '2024-12-19 09:17:50', 1, NULL),
(33, 3, 'testing', 'testing after adding cascade', 'Medium', '2024-12-26', 1, '2024-12-16 22:54:08', '2024-12-30 19:44:37', '2024-12-30 19:44:37', 1, NULL),
(38, 3, 'test', 'tetr', 'Medium', '2024-12-28', 1, '2024-12-18 19:41:46', '2024-12-30 19:44:38', '2024-12-30 19:44:38', 1, NULL),
(42, NULL, 'Yummy Part', 'Create yummy page', 'Medium', '2025-01-01', 1, '2024-12-18 20:00:06', '2024-12-19 09:19:08', '2024-12-19 09:19:08', NULL, 27),
(44, NULL, 'fdgf', 'gfdgdf', 'Medium', '2025-01-22', 1, '2025-01-06 19:50:18', '2025-01-06 19:50:22', '2025-01-06 19:50:22', NULL, 28),
(46, 15, 'math homework', 'do the math homework', 'Low', '2025-04-11', 0, '2025-01-14 20:38:49', '2025-01-14 20:38:49', NULL, 9, NULL),
(47, 14, 'rijgns', 'gsdgd', 'High', '2025-01-17', 1, '2025-01-14 20:55:35', '2025-01-14 20:55:38', '2025-01-14 20:55:38', 9, NULL),
(50, 14, 'whatever', 'fsdfds', 'Medium', '2025-01-24', 1, '2025-01-17 23:17:22', '2025-01-17 23:17:29', '2025-01-17 23:17:29', 9, NULL),
(51, 15, 'test', 'tre', 'Medium', '2025-02-09', 0, '2025-01-17 23:36:10', '2025-01-17 23:36:10', NULL, 9, NULL),
(52, NULL, 'test', 'test', 'Low', '2025-01-06', 1, '2025-01-18 22:25:01', '2025-01-18 22:25:02', '2025-01-18 22:25:02', NULL, 29);

-- --------------------------------------------------------

--
-- Table structure for table `Team`
--

CREATE TABLE `Team` (
  `id` int(11) NOT NULL,
  `admin_user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `Team`
--

INSERT INTO `Team` (`id`, `admin_user_id`, `name`, `created_at`) VALUES
(1, 1, 'Math Enthusiasts', '2024-11-25 13:28:44'),
(2, 2, 'Physics Lovers', '2024-11-25 13:28:44');

-- --------------------------------------------------------

--
-- Table structure for table `TeamMembers`
--

CREATE TABLE `TeamMembers` (
  `id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` enum('Admin','Member') DEFAULT 'Member',
  `joined_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `TeamMembers`
--

INSERT INTO `TeamMembers` (`id`, `team_id`, `user_id`, `role`, `joined_at`) VALUES
(1, 1, 1, 'Admin', '2024-11-25 13:28:44'),
(2, 1, 2, 'Member', '2024-11-25 13:28:44'),
(3, 2, 2, 'Admin', '2024-11-25 13:28:44'),
(4, 2, 3, 'Member', '2024-11-25 13:28:44');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `role` enum('admin','user') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`id`, `firstname`, `lastname`, `email`, `username`, `password`, `created_at`, `updated_at`, `role`) VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@example.com', 'alicej', '$2y$10$A5CUCSjUrrGshpXI07oVFuF25YvN9IChyV6b7dSx.iLuGhbdvd6yy', '2024-11-25 13:28:44', '2024-11-26 18:48:17', 'user'),
(2, 'Bob', 'Smith', 'bob.smith@example.com', 'bobsmith', 'hashed_password_2', '2024-11-25 13:28:44', '2024-11-25 13:28:44', 'user'),
(3, 'Charlie', 'Brown', 'charlie.brown@example.com', 'charlieb', 'hashed_password_3', '2024-11-25 13:28:44', '2024-11-25 13:28:44', 'user'),
(7, 'test', 'admin', 'admintest@gmail.com', 'admin', '$2y$10$JleMVPq2C73wg7gmuuwhoOE0CUaWsy7lEvwe6OIgbYSDK7JoxrPRa', '2025-01-06 19:27:10', '2025-01-06 19:27:10', 'admin'),
(9, 'faisal', 'Alatrash', 'faisal.atrash@gmail.com', 'Frezario', '$2y$10$.5nzWeXiYrS3jcdav.sgqO8frY2JHCIM.l./2olpdTWJJk5pGTcWG', '2025-01-14 20:29:51', '2025-01-14 20:29:51', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `GroupMembers`
--
ALTER TABLE `GroupMembers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fk_groupmembers_group_id` (`group_id`);

--
-- Indexes for table `Groups`
--
ALTER TABLE `Groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Resources`
--
ALTER TABLE `Resources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_id` (`task_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `fk_user` (`user_id`);

--
-- Indexes for table `Subjects`
--
ALTER TABLE `Subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `Tasks`
--
ALTER TABLE `Tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `user_id_2` (`user_id`),
  ADD KEY `fk_tasks_group_id` (`group_id`);

--
-- Indexes for table `Team`
--
ALTER TABLE `Team`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_user_id` (`admin_user_id`);

--
-- Indexes for table `TeamMembers`
--
ALTER TABLE `TeamMembers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `GroupMembers`
--
ALTER TABLE `GroupMembers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `Groups`
--
ALTER TABLE `Groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `Resources`
--
ALTER TABLE `Resources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `Subjects`
--
ALTER TABLE `Subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `Tasks`
--
ALTER TABLE `Tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `Team`
--
ALTER TABLE `Team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `TeamMembers`
--
ALTER TABLE `TeamMembers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `GroupMembers`
--
ALTER TABLE `GroupMembers`
  ADD CONSTRAINT `GroupMembers_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`),
  ADD CONSTRAINT `fk_groupmembers_group_id` FOREIGN KEY (`group_id`) REFERENCES `Groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `Resources`
--
ALTER TABLE `Resources`
  ADD CONSTRAINT `Resources_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `Tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Resources_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `Subjects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `Subjects`
--
ALTER TABLE `Subjects`
  ADD CONSTRAINT `Subjects_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `Tasks`
--
ALTER TABLE `Tasks`
  ADD CONSTRAINT `Tasks_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `Subjects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tasks_group_id` FOREIGN KEY (`group_id`) REFERENCES `Groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Team`
--
ALTER TABLE `Team`
  ADD CONSTRAINT `Team_ibfk_1` FOREIGN KEY (`admin_user_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `TeamMembers`
--
ALTER TABLE `TeamMembers`
  ADD CONSTRAINT `TeamMembers_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `Team` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `TeamMembers_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
