CREATE DATABASE  IF NOT EXISTS `tecnologico` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `tecnologico`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tecnologico
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `alumnos` (
  `No_Control` int(8) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Ap_Paterno` varchar(50) NOT NULL,
  `Ap_Materno` varchar(50) NOT NULL,
  `Fecha_Nacimiento` date NOT NULL,
  `Lugar_Nacimiento` varchar(50) DEFAULT NULL,
  `Sexo` enum('Femenino','Masculino') NOT NULL,
  `CURP` varchar(18) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `Domicilio` varchar(100) NOT NULL,
  `Estado_civil` enum('Soltero','Casado','Divorciado','Viudo') DEFAULT NULL,
  PRIMARY KEY (`No_Control`),
  UNIQUE KEY `No_Control_UNIQUE` (`No_Control`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` VALUES (18550501,'Luis','Arellanes','Vazquez','2000-01-02','Chihuahua','Masculino','ARVL000102MCHLJL03','6142093421','LUIS.AREVA@gmail.com','Laguna verde #9801','Soltero'),(18550502,'Alondra','Morales','Rodriguez','2000-02-18',NULL,'Femenino','MORA000218MCHLJL11','6141330926','A.Morales.R@gmail.com','Monte el alto #323','Soltero');
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `carrera` (
  `idCarrera` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Creditos` int(11) NOT NULL,
  `Semestres` int(11) NOT NULL,
  PRIMARY KEY (`idCarrera`),
  UNIQUE KEY `idCarrera_UNIQUE` (`idCarrera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` VALUES (1,'INGENIERIA EN SISTEMAS COMPUTACIONALES',150,9),(2,'INGENIERIA INDUSTRIAL',140,8);
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_empleado`
--

DROP TABLE IF EXISTS `detalle_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `detalle_empleado` (
  `idDetalle_Empleado` int(11) NOT NULL AUTO_INCREMENT,
  `idInstituto` int(11) NOT NULL,
  `idPTrabajo` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `Horas_de_trabajo` int(11) DEFAULT NULL,
  `Plaza` varchar(50) DEFAULT NULL,
  `Sueldo` int(11) DEFAULT NULL,
  `Area` varchar(50) NOT NULL,
  PRIMARY KEY (`idDetalle_Empleado`),
  UNIQUE KEY `idDetalle_Empleado_UNIQUE` (`idDetalle_Empleado`),
  KEY `idInstituto` (`idInstituto`),
  KEY `idPTrabajo` (`idPTrabajo`),
  KEY `idEmpleado` (`idEmpleado`),
  CONSTRAINT `detalle_empleado_ibfk_1` FOREIGN KEY (`idInstituto`) REFERENCES `institucion` (`idInstitucion`) ON UPDATE CASCADE,
  CONSTRAINT `detalle_empleado_ibfk_2` FOREIGN KEY (`idPTrabajo`) REFERENCES `puestos` (`idptrabajo`) ON UPDATE CASCADE,
  CONSTRAINT `detalle_empleado_ibfk_3` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idempleado`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_empleado`
--

LOCK TABLES `detalle_empleado` WRITE;
/*!40000 ALTER TABLE `detalle_empleado` DISABLE KEYS */;
INSERT INTO `detalle_empleado` VALUES (1,55,1,1,4,NULL,NULL,'DEPARTAMENTO DE SISTEMAS'),(2,55,1,2,3,NULL,NULL,'CIENCIAS BASICAS');
/*!40000 ALTER TABLE `detalle_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `empleado` (
  `idEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Ap_Paterno` varchar(50) NOT NULL,
  `Ap_Materno` varchar(50) NOT NULL,
  `Fecha_Nacimiento` date NOT NULL,
  `Lugar_Nacimiento` varchar(50) DEFAULT NULL,
  `Sexo` enum('Femenino','Masculino') NOT NULL,
  `CURP` varchar(18) NOT NULL,
  `RFC` varchar(13) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `Domicilio` varchar(100) NOT NULL,
  `Estado_civil` enum('Soltero','Casado','Divorciado','Viudo') DEFAULT NULL,
  PRIMARY KEY (`idEmpleado`),
  UNIQUE KEY `idEmpleado_UNIQUE` (`idEmpleado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Jose','Chavez','Lopez','1970-09-30',NULL,'Masculino','CHLJ700930HCHLJL03','CHLJ700930J02','6142639202','JoseLopez@gmail.com','Av.Sicomoro #7363',NULL),(2,'Maria','Martinez','Gonzalez','1978-11-15',NULL,'Femenino','MAGM781115MCHLJL08','MAGM781115J12','6144239261','MARIA.MARGO@gmail.com','Calle abandonada a la luz #23043',NULL);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidad`
--

DROP TABLE IF EXISTS `especialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `especialidad` (
  `idEspecialidad` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `No_Materias` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEspecialidad`),
  UNIQUE KEY `idEspecialidad_UNIQUE` (`idEspecialidad`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidad`
--

LOCK TABLES `especialidad` WRITE;
/*!40000 ALTER TABLE `especialidad` DISABLE KEYS */;
INSERT INTO `especialidad` VALUES (1,'ESPECIALIDAD EN DESARROLLO DE APLICACIONES  PARA DISPOSITIVOS MOVILES',5);
/*!40000 ALTER TABLE `especialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `horario` (
  `idHorario` int(11) NOT NULL AUTO_INCREMENT,
  `idAlumno` int(11) NOT NULL,
  `idMateria` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `Grupo` varchar(10) NOT NULL,
  `Aula` varchar(10) NOT NULL,
  `Hora_inicio` time DEFAULT NULL,
  `Hora_fin` time DEFAULT NULL,
  PRIMARY KEY (`idHorario`),
  KEY `idMateria` (`idMateria`),
  KEY `idEmpleado` (`idEmpleado`),
  KEY `idAlumno` (`idAlumno`),
  CONSTRAINT `horario_ibfk_2` FOREIGN KEY (`idMateria`) REFERENCES `materia` (`idmateria`) ON UPDATE CASCADE,
  CONSTRAINT `horario_ibfk_3` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idempleado`) ON UPDATE CASCADE,
  CONSTRAINT `idAlumno` FOREIGN KEY (`idAlumno`) REFERENCES `informacion_alumno` (`idinfa`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
INSERT INTO `horario` VALUES (1,3,1,1,'A','F6','08:00:00','09:00:00'),(2,3,2,2,'A','F4','09:00:00','10:00:00');
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informacion_alumno`
--

DROP TABLE IF EXISTS `informacion_alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `informacion_alumno` (
  `idInfA` int(11) NOT NULL AUTO_INCREMENT,
  `No_Control` int(8) NOT NULL,
  `Idinstitucion` int(11) NOT NULL,
  `idCarrera` int(11) NOT NULL,
  `idEspecialidad` int(11) DEFAULT NULL,
  `Semestre_actual` int(11) NOT NULL,
  `Promedio_Gral` float DEFAULT NULL,
  `Creditos_Aprobados` int(11) DEFAULT NULL,
  PRIMARY KEY (`idInfA`),
  KEY `Idinstitucion` (`Idinstitucion`),
  KEY `idCarrera` (`idCarrera`),
  KEY `no_control_idx` (`No_Control`),
  KEY `informacion_alumno_ibfk_4` (`idEspecialidad`),
  CONSTRAINT `No_Control` FOREIGN KEY (`No_Control`) REFERENCES `alumnos` (`no_control`) ON UPDATE CASCADE,
  CONSTRAINT `informacion_alumno_ibfk_2` FOREIGN KEY (`Idinstitucion`) REFERENCES `institucion` (`idInstitucion`) ON UPDATE CASCADE,
  CONSTRAINT `informacion_alumno_ibfk_3` FOREIGN KEY (`idCarrera`) REFERENCES `carrera` (`idcarrera`) ON UPDATE CASCADE,
  CONSTRAINT `informacion_alumno_ibfk_4` FOREIGN KEY (`idEspecialidad`) REFERENCES `especialidad` (`idespecialidad`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informacion_alumno`
--

LOCK TABLES `informacion_alumno` WRITE;
/*!40000 ALTER TABLE `informacion_alumno` DISABLE KEYS */;
INSERT INTO `informacion_alumno` VALUES (3,18550501,55,1,NULL,1,9.8,NULL),(4,18550502,55,1,NULL,1,7.9,NULL);
/*!40000 ALTER TABLE `informacion_alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institucion`
--

DROP TABLE IF EXISTS `institucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `institucion` (
  `idInstitucion` int(2) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Direccion` varchar(150) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Correo` varchar(30) NOT NULL,
  `Presupuesto` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idInstitucion`),
  UNIQUE KEY `idInstitucion_UNIQUE` (`idInstitucion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institucion`
--

LOCK TABLES `institucion` WRITE;
/*!40000 ALTER TABLE `institucion` DISABLE KEYS */;
INSERT INTO `institucion` VALUES (55,'INSTITUTO TECNOLOGICO DE CHIHUAHUA II','Ave. Tecnológico #2909, Chihuahua, Chih. México, CP 31310','614-2-01-20-00','hola@itchii.com',NULL);
/*!40000 ALTER TABLE `institucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kardex`
--

DROP TABLE IF EXISTS `kardex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `kardex` (
  `idKardex` int(11) NOT NULL AUTO_INCREMENT,
  `idInfA` int(11) NOT NULL,
  `idMateria` int(11) NOT NULL,
  `Calificacion` float NOT NULL,
  `Evaluacion` enum('Ev. Ord. 1','Ev.Ord. 2','Especial') DEFAULT NULL,
  `Observaciones` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idKardex`),
  UNIQUE KEY `idKardex_UNIQUE` (`idKardex`),
  KEY `idMateria` (`idMateria`),
  KEY `idInfA_idx` (`idInfA`),
  CONSTRAINT `idInfA` FOREIGN KEY (`idInfA`) REFERENCES `informacion_alumno` (`idinfa`) ON DELETE CASCADE,
  CONSTRAINT `kardex_ibfk_2` FOREIGN KEY (`idMateria`) REFERENCES `materia` (`idmateria`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kardex`
--

LOCK TABLES `kardex` WRITE;
/*!40000 ALTER TABLE `kardex` DISABLE KEYS */;
INSERT INTO `kardex` VALUES (6,3,1,92,NULL,NULL),(7,3,2,90,NULL,NULL),(8,4,2,81,NULL,NULL),(9,4,1,76,NULL,NULL);
/*!40000 ALTER TABLE `kardex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia`
--

DROP TABLE IF EXISTS `materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `materia` (
  `idMateria` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Creditos` int(11) NOT NULL,
  `Semestre` int(11) NOT NULL,
  `Especialidad` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idMateria`),
  UNIQUE KEY `idMateria_UNIQUE` (`idMateria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
INSERT INTO `materia` VALUES (1,'FUNDAMENTOS DE PROGRAMACION',5,1,'NO'),(2,'CALCULO DIFERENCIAL',5,1,'NO');
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puestos`
--

DROP TABLE IF EXISTS `puestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `puestos` (
  `idPTrabajo` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`idPTrabajo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puestos`
--

LOCK TABLES `puestos` WRITE;
/*!40000 ALTER TABLE `puestos` DISABLE KEYS */;
INSERT INTO `puestos` VALUES (1,'Maestro'),(2,'Conserje'),(3,'Jefe de departamento'),(4,'Administrativo'),(5,'Directivo');
/*!40000 ALTER TABLE `puestos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-30 19:55:51
