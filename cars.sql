DROP Database cars;
CREATE Database cars;

--
-- Database: `cars`
--

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `carID` varchar(50) NOT NULL,
  `modelName` varchar(50) NOT NULL,
  `engineID` varchar(50) NOT NULL,
  `transmissionID` varchar(50) NOT NULL,
  `trim` varchar(50) NOT NULL,
  `seats` int NOT NULL,
  `drivetrain` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `companyName` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `ticker` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engine`
--

CREATE TABLE `engine` (
  `engineID` varchar(50) NOT NULL,
  `displacement` int NOT NULL,
  `cylinders` int NOT NULL,
  `arrangement` varchar(50) NOT NULL,
  `aspiration` varchar(50) NOT NULL,
  `fuel` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `make`
--

CREATE TABLE `make` (
  `makeName` varchar(50) NOT NULL,
  `companyName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model`
--

CREATE TABLE `model` (
  `modelName` varchar(50) NOT NULL,
  `makeName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transmission`
--

CREATE TABLE `transmission` (
  `transmissionID` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `gears` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`carID`),
  ADD KEY `fk_modelName` (`modelName`),
  ADD KEY `transmissionID` (`transmissionID`),
  ADD KEY `engineID` (`engineID`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`companyName`);

--
-- Indexes for table `engine`
--
ALTER TABLE `engine`
  ADD PRIMARY KEY (`engineID`);

--
-- Indexes for table `make`
--
ALTER TABLE `make`
  ADD PRIMARY KEY (`makeName`),
  ADD KEY `fk_companyName` (`companyName`) USING BTREE;

--
-- Indexes for table `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`modelName`),
  ADD KEY `fk_makeName` (`makeName`) USING BTREE;

--
-- Indexes for table `transmission`
--
ALTER TABLE `transmission`
  ADD PRIMARY KEY (`transmissionID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`transmissionID`) REFERENCES `transmission` (`transmissionID`) ON UPDATE RESTRICT,
  ADD CONSTRAINT `car_ibfk_2` FOREIGN KEY (`engineID`) REFERENCES `engine` (`engineID`) ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_modelName` FOREIGN KEY (`modelName`) REFERENCES `model` (`modelName`) ON UPDATE RESTRICT;

--
-- Constraints for table `make`
--
ALTER TABLE `make`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`companyName`) REFERENCES `company` (`companyName`) ON UPDATE RESTRICT;

--
-- Constraints for table `model`
--
ALTER TABLE `model`
  ADD CONSTRAINT `fk2` FOREIGN KEY (`makeName`) REFERENCES `make` (`makeName`) ON UPDATE RESTRICT;
COMMIT;

