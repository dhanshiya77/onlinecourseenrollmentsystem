-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: newproject
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `course_id` int NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` text,
  `category` varchar(50) DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  `instructor_id` int DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `instructor_id` (`instructor_id`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`instructor_id`) REFERENCES `instructors` (`instructor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (301,'Intro to Python','Intro to Python course description','Programming',45,201),(302,'Data Structures','Data Structures course description','Programming',40,202),(303,'Web Development','Web Development course description','Web',50,207),(304,'Machine Learning','Machine Learning course description','AI',35,206),(305,'Database Systems','Database Systems course description','Programming',60,202),(306,'Operating Systems','Operating Systems course description','Systems',55,207),(307,'AI Fundamentals','AI Fundamentals course description','AI',30,203),(308,'Networking Basics','Networking Basics course description','Systems',25,204),(309,'Cloud Computing','Cloud Computing course description','Systems',50,206),(310,'Statistics','Statistics course description','Data Science',40,204),(311,'Java Programming','Java Programming course description','Programming',30,202),(312,'Software Engineering','Software Engineering course description','Programming',50,208);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollments`
--

DROP TABLE IF EXISTS `enrollments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollments` (
  `enrollment_id` int NOT NULL,
  `student_id` int DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  `enrollment_date` date DEFAULT NULL,
  `grade` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`enrollment_id`),
  KEY `student_id` (`student_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollments`
--

LOCK TABLES `enrollments` WRITE;
/*!40000 ALTER TABLE `enrollments` DISABLE KEYS */;
INSERT INTO `enrollments` VALUES (401,105,304,'2023-08-10','A'),(402,112,305,'2023-09-15','B'),(403,110,306,'2023-06-20','C'),(404,108,307,'2024-01-10','A'),(405,115,302,'2024-02-05','B'),(406,111,303,'2023-11-11','A'),(407,101,301,'2024-03-10',NULL),(408,103,312,'2023-12-20','B'),(409,102,309,'2024-01-17','C'),(410,114,310,'2023-10-15','A');
/*!40000 ALTER TABLE `enrollments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructors`
--

DROP TABLE IF EXISTS `instructors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructors` (
  `instructor_id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `specialization` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`instructor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructors`
--

LOCK TABLES `instructors` WRITE;
/*!40000 ALTER TABLE `instructors` DISABLE KEYS */;
INSERT INTO `instructors` VALUES (201,'Jenna Morrison','instructor201@univ.com','Data Science'),(202,'Patrick Foster','instructor202@univ.com','Computer Science'),(203,'Cynthia Chapman','instructor203@univ.com','AI'),(204,'Erik Fernandez','instructor204@univ.com','Mathematics'),(205,'Natasha Keller','instructor205@univ.com','Data Science'),(206,'Trevor Moss','instructor206@univ.com','ML'),(207,'Monica Douglas','instructor207@univ.com','Systems'),(208,'Leo Carr','instructor208@univ.com','AI');
/*!40000 ALTER TABLE `instructors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `schedule_id` int NOT NULL,
  `course_id` int DEFAULT NULL,
  `day_of_week` varchar(10) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (501,301,'Monday','09:00:00','10:30:00'),(502,302,'Tuesday','11:00:00','12:30:00'),(503,303,'Wednesday','13:00:00','14:30:00'),(504,304,'Thursday','10:00:00','11:30:00'),(505,305,'Friday','14:00:00','15:30:00');
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `studentcoursegrade`
--

DROP TABLE IF EXISTS `studentcoursegrade`;
/*!50001 DROP VIEW IF EXISTS `studentcoursegrade`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `studentcoursegrade` AS SELECT 
 1 AS `name`,
 1 AS `title`,
 1 AS `grade`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `student_id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (101,'Dale Mclaughlin','user101@gmail.com','2004-04-16','Female'),(102,'Bradley Turner','user102@gmail.com','2005-10-23','Male'),(103,'Tara Oliver','user103@gmail.com','2006-11-22','Female'),(104,'Julie Mcknight','user104@gmail.com','1999-12-24','Male'),(105,'Justin Brown','user105@gmail.com','2002-11-22','Male'),(106,'Timothy Garcia','user106@gmail.com','2003-10-17','Female'),(107,'Andrea Palmer','user107@gmail.com','2003-11-17','Male'),(108,'Lisa Beard','user108@gmail.com','2001-11-30','Male'),(109,'David Clark','user109@gmail.com','2007-05-22','Male'),(110,'Lisa Phillips','user110@gmail.com','2000-04-21','Female'),(111,'Stephen Johnson','user111@gmail.com','2004-09-02','Male'),(112,'Randy Hayes','user112@gmail.com','2002-06-15','Male'),(113,'Paige Matthews','user113@gmail.com','2003-02-14','Female'),(114,'Brian Cooper','user114@gmail.com','2004-12-19','Male'),(115,'Angela Simmons','user115@gmail.com','2001-03-28','Female');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `studentcoursegrade`
--

/*!50001 DROP VIEW IF EXISTS `studentcoursegrade`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `studentcoursegrade` AS select `s`.`name` AS `name`,`c`.`title` AS `title`,`e`.`grade` AS `grade` from ((`students` `s` join `enrollments` `e` on((`s`.`student_id` = `e`.`student_id`))) join `courses` `c` on((`c`.`course_id` = `e`.`course_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-15 21:04:16
