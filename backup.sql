-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: niquiton_bk
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `beneficiario`
--

DROP TABLE IF EXISTS `beneficiario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beneficiario` (
  `id_beneficiario` int NOT NULL AUTO_INCREMENT,
  `direccion` varchar(200) DEFAULT NULL,
  `nombre_encargado` varchar(200) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`id_beneficiario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beneficiario`
--

LOCK TABLES `beneficiario` WRITE;
/*!40000 ALTER TABLE `beneficiario` DISABLE KEYS */;
/*!40000 ALTER TABLE `beneficiario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_donacion`
--

DROP TABLE IF EXISTS `categoria_donacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_donacion` (
  `id_categoria_donacion` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) DEFAULT NULL,
  `tipo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_categoria_donacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_donacion`
--

LOCK TABLES `categoria_donacion` WRITE;
/*!40000 ALTER TABLE `categoria_donacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria_donacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_voluntario`
--

DROP TABLE IF EXISTS `categoria_voluntario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_voluntario` (
  `id_categoria_voluntario` int NOT NULL AUTO_INCREMENT,
  `descripcion_tareas` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_categoria_voluntario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_voluntario`
--

LOCK TABLES `categoria_voluntario` WRITE;
/*!40000 ALTER TABLE `categoria_voluntario` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria_voluntario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centro_recepcion`
--

DROP TABLE IF EXISTS `centro_recepcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `centro_recepcion` (
  `id_centro_recepcion` int NOT NULL AUTO_INCREMENT,
  `ubicacion` varchar(200) NOT NULL,
  `encargado` varchar(200) NOT NULL,
  PRIMARY KEY (`id_centro_recepcion`),
  UNIQUE KEY `ubicacion` (`ubicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centro_recepcion`
--

LOCK TABLES `centro_recepcion` WRITE;
/*!40000 ALTER TABLE `centro_recepcion` DISABLE KEYS */;
/*!40000 ALTER TABLE `centro_recepcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centro_recepcion_beneficiario`
--

DROP TABLE IF EXISTS `centro_recepcion_beneficiario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `centro_recepcion_beneficiario` (
  `id_centro_recepcion_beneficiario` int NOT NULL AUTO_INCREMENT,
  `id_beneficiario` int DEFAULT NULL,
  `id_centro_recepcion` int DEFAULT NULL,
  `voluntario` int DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  PRIMARY KEY (`id_centro_recepcion_beneficiario`),
  KEY `fk_const_id_beneficiario` (`id_beneficiario`),
  KEY `fk_const_id_centro_recepcion` (`id_centro_recepcion`),
  CONSTRAINT `fk_const_id_beneficiario` FOREIGN KEY (`id_beneficiario`) REFERENCES `beneficiario` (`id_beneficiario`),
  CONSTRAINT `fk_const_id_centro_recepcion` FOREIGN KEY (`id_centro_recepcion`) REFERENCES `centro_recepcion` (`id_centro_recepcion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centro_recepcion_beneficiario`
--

LOCK TABLES `centro_recepcion_beneficiario` WRITE;
/*!40000 ALTER TABLE `centro_recepcion_beneficiario` DISABLE KEYS */;
/*!40000 ALTER TABLE `centro_recepcion_beneficiario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centro_recepcion_voluntario`
--

DROP TABLE IF EXISTS `centro_recepcion_voluntario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `centro_recepcion_voluntario` (
  `id_centro_recepcion_voluntario` int NOT NULL AUTO_INCREMENT,
  `id_centro_recepcion` int DEFAULT NULL,
  `id_voluntario` int DEFAULT NULL,
  `fecha_inicio_voluntario` date DEFAULT NULL,
  `fecha_fin_voluntario` date DEFAULT NULL,
  PRIMARY KEY (`id_centro_recepcion_voluntario`),
  KEY `fk_c_id_centro_recepcion` (`id_centro_recepcion`),
  KEY `fk_c_id_voluntario` (`id_voluntario`),
  CONSTRAINT `fk_c_id_centro_recepcion` FOREIGN KEY (`id_centro_recepcion`) REFERENCES `centro_recepcion` (`id_centro_recepcion`),
  CONSTRAINT `fk_c_id_voluntario` FOREIGN KEY (`id_voluntario`) REFERENCES `voluntario` (`id_voluntario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centro_recepcion_voluntario`
--

LOCK TABLES `centro_recepcion_voluntario` WRITE;
/*!40000 ALTER TABLE `centro_recepcion_voluntario` DISABLE KEYS */;
/*!40000 ALTER TABLE `centro_recepcion_voluntario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donacion`
--

DROP TABLE IF EXISTS `donacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donacion` (
  `id_donacion` int NOT NULL AUTO_INCREMENT,
  `id_donador` int DEFAULT NULL,
  `id_categoria_donacion` int DEFAULT NULL,
  `id_centro_recepcion` int DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `detalles` varchar(200) DEFAULT NULL,
  `fecha_donacion` datetime DEFAULT (now()),
  `fechar_termino_donacion` date DEFAULT NULL,
  PRIMARY KEY (`id_donacion`),
  KEY `fk_constraint_id_donador` (`id_donador`),
  KEY `fk_constraint_id_categoria_donacion` (`id_categoria_donacion`),
  KEY `fk_constraint_id_centro_recepcion` (`id_centro_recepcion`),
  CONSTRAINT `fk_constraint_id_categoria_donacion` FOREIGN KEY (`id_categoria_donacion`) REFERENCES `categoria_donacion` (`id_categoria_donacion`),
  CONSTRAINT `fk_constraint_id_centro_recepcion` FOREIGN KEY (`id_centro_recepcion`) REFERENCES `centro_recepcion` (`id_centro_recepcion`),
  CONSTRAINT `fk_constraint_id_donador` FOREIGN KEY (`id_donador`) REFERENCES `donador` (`id_donador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donacion`
--

LOCK TABLES `donacion` WRITE;
/*!40000 ALTER TABLE `donacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `donacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donador`
--

DROP TABLE IF EXISTS `donador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donador` (
  `id_donador` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `status_donador` enum('ANONIMO','PUBLICA') DEFAULT NULL,
  PRIMARY KEY (`id_donador`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donador`
--

LOCK TABLES `donador` WRITE;
/*!40000 ALTER TABLE `donador` DISABLE KEYS */;
/*!40000 ALTER TABLE `donador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voluntario`
--

DROP TABLE IF EXISTS `voluntario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voluntario` (
  `id_voluntario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  PRIMARY KEY (`id_voluntario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voluntario`
--

LOCK TABLES `voluntario` WRITE;
/*!40000 ALTER TABLE `voluntario` DISABLE KEYS */;
/*!40000 ALTER TABLE `voluntario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voluntario_categoria`
--

DROP TABLE IF EXISTS `voluntario_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voluntario_categoria` (
  `id_voluntario_categoria` int NOT NULL AUTO_INCREMENT,
  `id_categoria_` int DEFAULT NULL,
  `id_beneficiario` int DEFAULT NULL,
  PRIMARY KEY (`id_voluntario_categoria`),
  KEY `fk_const_id_categoria_` (`id_categoria_`),
  KEY `fk_const_id_beneficiario_categoria` (`id_beneficiario`),
  CONSTRAINT `fk_const_id_beneficiario_categoria` FOREIGN KEY (`id_beneficiario`) REFERENCES `beneficiario` (`id_beneficiario`),
  CONSTRAINT `fk_const_id_categoria_` FOREIGN KEY (`id_categoria_`) REFERENCES `categoria_voluntario` (`id_categoria_voluntario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voluntario_categoria`
--

LOCK TABLES `voluntario_categoria` WRITE;
/*!40000 ALTER TABLE `voluntario_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `voluntario_categoria` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-10 20:22:06
