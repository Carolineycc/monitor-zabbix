-- MySQL dump 10.14  Distrib 5.5.52-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: zabbix
-- ------------------------------------------------------
-- Server version	5.5.52-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acknowledges`
--

DROP TABLE IF EXISTS `acknowledges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acknowledges` (
  `acknowledgeid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `eventid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `message` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`acknowledgeid`),
  KEY `acknowledges_1` (`userid`),
  KEY `acknowledges_2` (`eventid`),
  KEY `acknowledges_3` (`clock`),
  CONSTRAINT `c_acknowledges_2` FOREIGN KEY (`eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE,
  CONSTRAINT `c_acknowledges_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acknowledges`
--

LOCK TABLES `acknowledges` WRITE;
/*!40000 ALTER TABLE `acknowledges` DISABLE KEYS */;
/*!40000 ALTER TABLE `acknowledges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions` (
  `actionid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `eventsource` int(11) NOT NULL DEFAULT '0',
  `evaltype` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `esc_period` int(11) NOT NULL DEFAULT '0',
  `def_shortdata` varchar(255) NOT NULL DEFAULT '',
  `def_longdata` text NOT NULL,
  `recovery_msg` int(11) NOT NULL DEFAULT '0',
  `r_shortdata` varchar(255) NOT NULL DEFAULT '',
  `r_longdata` text NOT NULL,
  `formula` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`actionid`),
  UNIQUE KEY `actions_2` (`name`),
  KEY `actions_1` (`eventsource`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions`
--

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
INSERT INTO `actions` VALUES (2,'Auto discovery. Linux servers.',1,0,1,0,'','',0,'','',''),(3,'Report problems to Zabbix administrators',0,0,1,3600,'{TRIGGER.STATUS}: {TRIGGER.NAME}','Trigger: {TRIGGER.NAME}\r\nTrigger status: {TRIGGER.STATUS}\r\nTrigger severity: {TRIGGER.SEVERITY}\r\nTrigger URL: {TRIGGER.URL}\r\n\r\nItem values:\r\n\r\n1. {ITEM.NAME1} ({HOST.NAME1}:{ITEM.KEY1}): {ITEM.VALUE1}\r\n2. {ITEM.NAME2} ({HOST.NAME2}:{ITEM.KEY2}): {ITEM.VALUE2}\r\n3. {ITEM.NAME3} ({HOST.NAME3}:{ITEM.KEY3}): {ITEM.VALUE3}\r\n\r\nOriginal event ID: {EVENT.ID}',1,'{TRIGGER.STATUS}: {TRIGGER.NAME}','Trigger: {TRIGGER.NAME}\r\nTrigger status: {TRIGGER.STATUS}\r\nTrigger severity: {TRIGGER.SEVERITY}\r\nTrigger URL: {TRIGGER.URL}\r\n\r\nItem values:\r\n\r\n1. {ITEM.NAME1} ({HOST.NAME1}:{ITEM.KEY1}): {ITEM.VALUE1}\r\n2. {ITEM.NAME2} ({HOST.NAME2}:{ITEM.KEY2}): {ITEM.VALUE2}\r\n3. {ITEM.NAME3} ({HOST.NAME3}:{ITEM.KEY3}): {ITEM.VALUE3}\r\n\r\nOriginal event ID: {EVENT.ID}',''),(4,'Report not supported items',3,0,1,3600,'{ITEM.STATE}: {HOST.NAME}:{ITEM.NAME}','Host: {HOST.NAME}\r\nItem: {ITEM.NAME}\r\nKey: {ITEM.KEY}\r\nState: {ITEM.STATE}',1,'{ITEM.STATE}: {HOST.NAME}:{ITEM.NAME}','Host: {HOST.NAME}\r\nItem: {ITEM.NAME}\r\nKey: {ITEM.KEY}\r\nState: {ITEM.STATE}',''),(5,'Report not supported low level discovery rules',3,0,1,3600,'{LLDRULE.STATE}: {HOST.NAME}:{LLDRULE.NAME}','Host: {HOST.NAME}\r\nLow level discovery rule: {LLDRULE.NAME}\r\nKey: {LLDRULE.KEY}\r\nState: {LLDRULE.STATE}',1,'{LLDRULE.STATE}: {HOST.NAME}:{LLDRULE.NAME}','Host: {HOST.NAME}\r\nLow level discovery rule: {LLDRULE.NAME}\r\nKey: {LLDRULE.KEY}\r\nState: {LLDRULE.STATE}',''),(6,'Report unknown triggers',3,0,1,3600,'{TRIGGER.STATE}: {TRIGGER.NAME}','Trigger name: {TRIGGER.NAME}\r\nExpression: {TRIGGER.EXPRESSION}\r\nState: {TRIGGER.STATE}',1,'{TRIGGER.STATE}: {TRIGGER.NAME}','Trigger name: {TRIGGER.NAME}\r\nExpression: {TRIGGER.EXPRESSION}\r\nState: {TRIGGER.STATE}',''),(7,'Send E-mail',0,0,0,120,'Cluster故障: {HOST.IP}  {EVENT.TIME} {TRIGGER.STATUS}: {TRIGGER.NAME}','Trigger: {TRIGGER.NAME}\r\nTrigger status: {TRIGGER.STATUS}\r\nTrigger severity: {TRIGGER.SEVERITY}\r\n\r\nItem values:\r\n\r\n{ITEM.NAME1} ({HOST.NAME1}:{ITEM.KEY1}): {ITEM.VALUE1}\r\n\r\nOriginal event ID: {EVENT.ID}',1,'Cluster故障恢复: {HOST.IP}  {TRIGGER.STATUS}: {TRIGGER.NAME}','Trigger: {TRIGGER.NAME}\r\nTrigger status: {TRIGGER.STATUS}\r\nTrigger severity: {TRIGGER.SEVERITY}\r\n\r\nItem values:\r\n\r\n{ITEM.NAME1} ({HOST.NAME1}:{ITEM.KEY1}): {ITEM.VALUE1}\r\n\r\nOriginal event ID: {EVENT.ID}',''),(8,'Auto registration:controller',2,0,0,0,'Auto registration: {HOST.HOST}','Host name: {HOST.HOST}\r\nHost IP: {HOST.IP}\r\nAgent port: {HOST.PORT}',0,'','',''),(9,'Auto registration:compute',2,0,0,0,'Auto registration: {HOST.HOST}','Host name: {HOST.HOST}\r\nHost IP: {HOST.IP}\r\nAgent port: {HOST.PORT}',0,'','',''),(10,'Auto registration:agent',2,0,0,0,'Auto registration: {HOST.HOST}','Host name: {HOST.HOST}\r\nHost IP: {HOST.IP}\r\nAgent port: {HOST.PORT}',0,'','',''),(11,'send wechat',0,0,0,3600,'Cluster: {HOST.IP}  {EVENT.TIME} {TRIGGER.STATUS}: {TRIGGER.NAME}','Trigger: {TRIGGER.NAME}\r\nTrigger status: {TRIGGER.STATUS}\r\nTrigger severity: {TRIGGER.SEVERITY}\r\n\r\nItem values:\r\n\r\n{ITEM.NAME1} ({HOST.NAME1}:{ITEM.KEY1}): {ITEM.VALUE1}\r\n\r\nOriginal event ID: {EVENT.ID}',1,'Cluster: {HOST.IP}  {TRIGGER.STATUS}: {TRIGGER.NAME}','Trigger: {TRIGGER.NAME}\r\nTrigger status: {TRIGGER.STATUS}\r\nTrigger severity: {TRIGGER.SEVERITY}\r\n\r\nItem values:\r\n\r\n{ITEM.NAME1} ({HOST.NAME1}:{ITEM.KEY1}): {ITEM.VALUE1}\r\n\r\nOriginal event ID: {EVENT.ID}',''),(12,'send email by 163',0,0,0,3600,'Cluster故障: {HOST.IP}  {EVENT.TIME} {TRIGGER.STATUS}: {TRIGGER.NAME}','Trigger: {TRIGGER.NAME}\r\nTrigger status: {TRIGGER.STATUS}\r\nTrigger severity: {TRIGGER.SEVERITY}\r\n\r\nItem values:\r\n\r\n{ITEM.NAME1} ({HOST.NAME1}:{ITEM.KEY1}): {ITEM.VALUE1}\r\n\r\nOriginal event ID: {EVENT.ID}',1,'Cluster故障恢复: {HOST.IP}  {TRIGGER.STATUS}: {TRIGGER.NAME}','Trigger: {TRIGGER.NAME}\r\nTrigger status: {TRIGGER.STATUS}\r\nTrigger severity: {TRIGGER.SEVERITY}\r\n\r\nItem values:\r\n\r\n{ITEM.NAME1} ({HOST.NAME1}:{ITEM.KEY1}): {ITEM.VALUE1}\r\n\r\nOriginal event ID: {EVENT.ID}','');
/*!40000 ALTER TABLE `actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alerts` (
  `alertid` bigint(20) unsigned NOT NULL,
  `actionid` bigint(20) unsigned NOT NULL,
  `eventid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned DEFAULT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `mediatypeid` bigint(20) unsigned DEFAULT NULL,
  `sendto` varchar(100) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `retries` int(11) NOT NULL DEFAULT '0',
  `error` varchar(128) NOT NULL DEFAULT '',
  `esc_step` int(11) NOT NULL DEFAULT '0',
  `alerttype` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`alertid`),
  KEY `alerts_1` (`actionid`),
  KEY `alerts_2` (`clock`),
  KEY `alerts_3` (`eventid`),
  KEY `alerts_4` (`status`,`retries`),
  KEY `alerts_5` (`mediatypeid`),
  KEY `alerts_6` (`userid`),
  CONSTRAINT `c_alerts_4` FOREIGN KEY (`mediatypeid`) REFERENCES `media_type` (`mediatypeid`) ON DELETE CASCADE,
  CONSTRAINT `c_alerts_1` FOREIGN KEY (`actionid`) REFERENCES `actions` (`actionid`) ON DELETE CASCADE,
  CONSTRAINT `c_alerts_2` FOREIGN KEY (`eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE,
  CONSTRAINT `c_alerts_3` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerts`
--

LOCK TABLES `alerts` WRITE;
/*!40000 ALTER TABLE `alerts` DISABLE KEYS */;
/*!40000 ALTER TABLE `alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_discovery`
--

DROP TABLE IF EXISTS `application_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_discovery` (
  `application_discoveryid` bigint(20) unsigned NOT NULL,
  `applicationid` bigint(20) unsigned NOT NULL,
  `application_prototypeid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `lastcheck` int(11) NOT NULL DEFAULT '0',
  `ts_delete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`application_discoveryid`),
  KEY `application_discovery_1` (`applicationid`),
  KEY `application_discovery_2` (`application_prototypeid`),
  CONSTRAINT `c_application_discovery_2` FOREIGN KEY (`application_prototypeid`) REFERENCES `application_prototype` (`application_prototypeid`) ON DELETE CASCADE,
  CONSTRAINT `c_application_discovery_1` FOREIGN KEY (`applicationid`) REFERENCES `applications` (`applicationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_discovery`
--

LOCK TABLES `application_discovery` WRITE;
/*!40000 ALTER TABLE `application_discovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_prototype`
--

DROP TABLE IF EXISTS `application_prototype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_prototype` (
  `application_prototypeid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`application_prototypeid`),
  KEY `application_prototype_1` (`itemid`),
  KEY `application_prototype_2` (`templateid`),
  CONSTRAINT `c_application_prototype_2` FOREIGN KEY (`templateid`) REFERENCES `application_prototype` (`application_prototypeid`) ON DELETE CASCADE,
  CONSTRAINT `c_application_prototype_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_prototype`
--

LOCK TABLES `application_prototype` WRITE;
/*!40000 ALTER TABLE `application_prototype` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_prototype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_template`
--

DROP TABLE IF EXISTS `application_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_template` (
  `application_templateid` bigint(20) unsigned NOT NULL,
  `applicationid` bigint(20) unsigned NOT NULL,
  `templateid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`application_templateid`),
  UNIQUE KEY `application_template_1` (`applicationid`,`templateid`),
  KEY `application_template_2` (`templateid`),
  CONSTRAINT `c_application_template_2` FOREIGN KEY (`templateid`) REFERENCES `applications` (`applicationid`) ON DELETE CASCADE,
  CONSTRAINT `c_application_template_1` FOREIGN KEY (`applicationid`) REFERENCES `applications` (`applicationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_template`
--

LOCK TABLES `application_template` WRITE;
/*!40000 ALTER TABLE `application_template` DISABLE KEYS */;
INSERT INTO `application_template` VALUES (2,345,406);
/*!40000 ALTER TABLE `application_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applications` (
  `applicationid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`applicationid`),
  UNIQUE KEY `applications_2` (`hostid`,`name`),
  CONSTRAINT `c_applications_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (345,10084,'Zabbix server',0),(346,10084,'CPU',0),(347,10084,'Filesystems',0),(348,10084,'General',0),(349,10084,'Memory',0),(350,10084,'Network interfaces',0),(351,10084,'OS',0),(352,10084,'Performance',0),(353,10084,'Processes',0),(354,10084,'Security',0),(355,10084,'Zabbix agent',0),(387,10107,'Openstack',0),(388,10108,'Openstack',0),(389,10109,'Openstack',0),(390,10110,'Openstack',0),(391,10111,'Openstack',0),(392,10112,'Openstack',0),(393,10113,'Openstack',0),(394,10114,'Openstack',0),(395,10115,'Openstack',0),(396,10116,'Openstack',0),(397,10117,'CephProNum',0),(398,10118,'Ceph_State',0),(399,10119,'IO_states',0),(400,10120,'MySQL',0),(401,10121,'Openstack',0),(402,10122,'Openstack',0),(403,10123,'SSH service',0),(404,10124,'Zabbix agent',0),(405,10125,'Zabbix proxy',0),(406,10126,'Zabbix server',0),(407,10127,'CPU',0),(408,10127,'Filesystems',0),(409,10127,'General',0),(410,10127,'Memory',0),(411,10127,'Network interfaces',0),(412,10127,'OS',0),(413,10127,'Performance',0),(414,10127,'Processes',0),(415,10127,'scripts',0),(416,10127,'Security',0),(417,10127,'Zabbix agent',0),(418,10128,'CPU',0),(419,10128,'Filesystems',0),(420,10128,'General',0),(421,10128,'Memory',0),(422,10128,'Network interfaces',0),(423,10128,'OS',0),(424,10128,'Performance',0),(425,10128,'Processes',0),(426,10128,'Zabbix agent',0);
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditlog`
--

DROP TABLE IF EXISTS `auditlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditlog` (
  `auditid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `action` int(11) NOT NULL DEFAULT '0',
  `resourcetype` int(11) NOT NULL DEFAULT '0',
  `details` varchar(128) NOT NULL DEFAULT '0',
  `ip` varchar(39) NOT NULL DEFAULT '',
  `resourceid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `resourcename` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`auditid`),
  KEY `auditlog_1` (`userid`,`clock`),
  KEY `auditlog_2` (`clock`),
  CONSTRAINT `c_auditlog_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditlog`
--

LOCK TABLES `auditlog` WRITE;
/*!40000 ALTER TABLE `auditlog` DISABLE KEYS */;
INSERT INTO `auditlog` VALUES (1,1,1490925968,3,0,'0','10.103.196.191',1,''),(2,1,1490925978,2,31,'0','10.103.196.191',13266,'Free disk space is less than 20% on volume {#FSNAME}:{12592}<20'),(3,1,1490925978,2,31,'0','10.103.196.191',13272,'Free inodes is less than 20% on volume {#FSNAME}:{12598}<20'),(4,1,1490925978,2,31,'0','10.103.196.191',13287,'Operational status was changed on {HOST.NAME} interface {#SNMPVALUE}:{12671}=1'),(5,1,1490925978,2,31,'0','10.103.196.191',13288,'Operational status was changed on {HOST.NAME} interface {#SNMPVALUE}:{12672}=1'),(6,1,1490925978,2,31,'0','10.103.196.191',13289,'Operational status was changed on {HOST.NAME} interface {#SNMPVALUE}:{12673}=1'),(7,1,1490925978,2,31,'0','10.103.196.191',13291,'Free disk space is less than 20% on volume {#SNMPVALUE}:{12675} / {12676} > 0.8'),(8,1,1490925978,2,31,'0','10.103.196.191',13292,'Free disk space is less than 20% on volume {#SNMPVALUE}:{12677} / {12678} > 0.8'),(9,1,1490925978,2,31,'0','10.103.196.191',13293,'Free disk space is less than 20% on volume {#SNMPVALUE}:{12679} / {12680} > 0.8'),(10,1,1490925978,2,31,'0','10.103.196.191',13294,'Operational status was changed on {HOST.NAME} interface {#SNMPVALUE}:{12681}=1'),(11,1,1490925978,2,31,'0','10.103.196.191',13342,'Free inodes is less than 20% on volume {#FSNAME}:{12729}<20'),(12,1,1490925978,2,31,'0','10.103.196.191',13343,'Free disk space is less than 20% on volume {#FSNAME}:{12730}<20'),(13,1,1490925978,2,31,'0','10.103.196.191',13358,'Free inodes is less than 20% on volume {#FSNAME}:{12745}<20'),(14,1,1490925978,2,31,'0','10.103.196.191',13359,'Free disk space is less than 20% on volume {#FSNAME}:{12746}<20'),(15,1,1490925978,2,31,'0','10.103.196.191',13374,'Free inodes is less than 20% on volume {#FSNAME}:{12761}<20'),(16,1,1490925978,2,31,'0','10.103.196.191',13375,'Free disk space is less than 20% on volume {#FSNAME}:{12762}<20'),(17,1,1490925978,2,31,'0','10.103.196.191',13390,'Free inodes is less than 20% on volume {#FSNAME}:{12777}<20'),(18,1,1490925978,2,31,'0','10.103.196.191',13391,'Free disk space is less than 20% on volume {#FSNAME}:{12778}<20'),(19,1,1490925978,2,31,'0','10.103.196.191',13406,'Free inodes is less than 20% on volume {#FSNAME}:{12793}<20'),(20,1,1490925978,2,31,'0','10.103.196.191',13407,'Free disk space is less than 20% on volume {#FSNAME}:{12794}<20'),(21,1,1490925978,2,31,'0','10.103.196.191',13422,'Free inodes is less than 20% on volume {#FSNAME}:{12809}<20'),(22,1,1490925978,2,31,'0','10.103.196.191',13423,'Free disk space is less than 20% on volume {#FSNAME}:{12810}<20'),(23,1,1490925978,2,31,'0','10.103.196.191',13439,'Free disk space is less than 20% on volume {#FSNAME}:{12826}<20'),(24,1,1490925979,2,13,'0','10.103.196.191',10010,'Processor load is too high on {HOST.NAME}'),(25,1,1490925979,2,13,'0','10.103.196.191',10011,'Too many processes running on {HOST.NAME}'),(26,1,1490925979,2,13,'0','10.103.196.191',10012,'Lack of free swap space on {HOST.NAME}'),(27,1,1490925979,2,13,'0','10.103.196.191',10016,'/etc/passwd has been changed on {HOST.NAME}'),(28,1,1490925979,2,13,'0','10.103.196.191',10021,'{HOST.NAME} has just been restarted'),(29,1,1490925979,2,13,'0','10.103.196.191',10041,'Configured max number of processes is too low on {HOST.NAME}'),(30,1,1490925979,2,13,'0','10.103.196.191',10042,'Configured max number of opened files is too low on {HOST.NAME}'),(31,1,1490925979,2,13,'0','10.103.196.191',10043,'Hostname was changed on {HOST.NAME}'),(32,1,1490925979,2,13,'0','10.103.196.191',10044,'Host information was changed on {HOST.NAME}'),(33,1,1490925979,2,13,'0','10.103.196.191',10045,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(34,1,1490925979,2,13,'0','10.103.196.191',10047,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(35,1,1490925979,2,13,'0','10.103.196.191',10190,'Too many processes on {HOST.NAME}'),(36,1,1490925979,2,13,'0','10.103.196.191',13000,'Lack of available memory on server {HOST.NAME}'),(37,1,1490925979,2,13,'0','10.103.196.191',13015,'Less than 25% free in the configuration cache'),(38,1,1490925979,2,13,'0','10.103.196.191',13017,'Less than 25% free in the history index cache'),(39,1,1490925979,2,13,'0','10.103.196.191',13019,'Less than 25% free in the trends cache'),(40,1,1490925979,2,13,'0','10.103.196.191',13023,'More than 100 items having missing data for more than 10 minutes'),(41,1,1490925979,2,13,'0','10.103.196.191',13025,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(42,1,1490925979,2,13,'0','10.103.196.191',13026,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(43,1,1490925979,2,13,'0','10.103.196.191',13073,'Less than 25% free in the history cache'),(44,1,1490925979,2,13,'0','10.103.196.191',13074,'Less than 5% free in the value cache'),(45,1,1490925979,2,13,'0','10.103.196.191',13080,'Zabbix alerter processes more than 75% busy'),(46,1,1490925979,2,13,'0','10.103.196.191',13081,'Zabbix configuration syncer processes more than 75% busy'),(47,1,1490925979,2,13,'0','10.103.196.191',13082,'Zabbix db watchdog processes more than 75% busy'),(48,1,1490925979,2,13,'0','10.103.196.191',13083,'Zabbix discoverer processes more than 75% busy'),(49,1,1490925979,2,13,'0','10.103.196.191',13084,'Zabbix escalator processes more than 75% busy'),(50,1,1490925979,2,13,'0','10.103.196.191',13085,'Zabbix history syncer processes more than 75% busy'),(51,1,1490925979,2,13,'0','10.103.196.191',13086,'Zabbix housekeeper processes more than 75% busy'),(52,1,1490925979,2,13,'0','10.103.196.191',13087,'Zabbix http poller processes more than 75% busy'),(53,1,1490925979,2,13,'0','10.103.196.191',13088,'Zabbix icmp pinger processes more than 75% busy'),(54,1,1490925979,2,13,'0','10.103.196.191',13089,'Zabbix ipmi poller processes more than 75% busy'),(55,1,1490925979,2,13,'0','10.103.196.191',13091,'Zabbix poller processes more than 75% busy'),(56,1,1490925979,2,13,'0','10.103.196.191',13092,'Zabbix proxy poller processes more than 75% busy'),(57,1,1490925979,2,13,'0','10.103.196.191',13093,'Zabbix self-monitoring processes more than 75% busy'),(58,1,1490925979,2,13,'0','10.103.196.191',13094,'Zabbix timer processes more than 75% busy'),(59,1,1490925979,2,13,'0','10.103.196.191',13095,'Zabbix trapper processes more than 75% busy'),(60,1,1490925979,2,13,'0','10.103.196.191',13096,'Zabbix unreachable poller processes more than 75% busy'),(61,1,1490925979,2,13,'0','10.103.196.191',13097,'Zabbix vmware collector processes more than 75% busy'),(62,1,1490925979,2,13,'0','10.103.196.191',13243,'Disk I/O is overloaded on {HOST.NAME}'),(63,1,1490925979,2,13,'0','10.103.196.191',13275,'Zabbix java poller processes more than 75% busy'),(64,1,1490925979,2,13,'0','10.103.196.191',13285,'Telnet service is down on {HOST.NAME}'),(65,1,1490925979,2,13,'0','10.103.196.191',13295,'Baseboard Temp Critical [{ITEM.VALUE}]'),(66,1,1490925979,2,13,'0','10.103.196.191',13296,'Baseboard Temp Non-Critical [{ITEM.VALUE}]'),(67,1,1490925979,2,13,'0','10.103.196.191',13297,'BB +1.05V PCH Critical [{ITEM.VALUE}]'),(68,1,1490925979,2,13,'0','10.103.196.191',13298,'BB +1.05V PCH Non-Critical [{ITEM.VALUE}]'),(69,1,1490925979,2,13,'0','10.103.196.191',13299,'BB +1.1V P1 Vccp Critical [{ITEM.VALUE}]'),(70,1,1490925979,2,13,'0','10.103.196.191',13300,'BB +1.1V P1 Vccp Non-Critical [{ITEM.VALUE}]'),(71,1,1490925979,2,13,'0','10.103.196.191',13301,'BB +1.5V P1 DDR3 Critical [{ITEM.VALUE}]'),(72,1,1490925979,2,13,'0','10.103.196.191',13302,'BB +1.5V P1 DDR3 Non-Critical [{ITEM.VALUE}]'),(73,1,1490925979,2,13,'0','10.103.196.191',13303,'BB +1.8V SM Critical [{ITEM.VALUE}]'),(74,1,1490925979,2,13,'0','10.103.196.191',13304,'BB +1.8V SM Non-Critical [{ITEM.VALUE}]'),(75,1,1490925979,2,13,'0','10.103.196.191',13305,'BB +3.3V Critical [{ITEM.VALUE}]'),(76,1,1490925979,2,13,'0','10.103.196.191',13306,'BB +3.3V Critical [{ITEM.VALUE}]'),(77,1,1490925979,2,13,'0','10.103.196.191',13307,'BB +3.3V Non-Critical [{ITEM.VALUE}]'),(78,1,1490925979,2,13,'0','10.103.196.191',13308,'BB +3.3V Non-Critical [{ITEM.VALUE}]'),(79,1,1490925979,2,13,'0','10.103.196.191',13309,'BB +3.3V STBY Critical [{ITEM.VALUE}]'),(80,1,1490925979,2,13,'0','10.103.196.191',13310,'BB +3.3V STBY Critical [{ITEM.VALUE}]'),(81,1,1490925979,2,13,'0','10.103.196.191',13311,'BB +3.3V STBY Non-Critical [{ITEM.VALUE}]'),(82,1,1490925979,2,13,'0','10.103.196.191',13312,'BB +3.3V STBY Non-Critical [{ITEM.VALUE}]'),(83,1,1490925979,2,13,'0','10.103.196.191',13313,'BB +5.0V Critical [{ITEM.VALUE}]'),(84,1,1490925979,2,13,'0','10.103.196.191',13314,'BB +5.0V Critical [{ITEM.VALUE}]'),(85,1,1490925979,2,13,'0','10.103.196.191',13315,'BB +5.0V Non-Critical [{ITEM.VALUE}]'),(86,1,1490925979,2,13,'0','10.103.196.191',13316,'BB +5.0V Non-Critical [{ITEM.VALUE}]'),(87,1,1490925979,2,13,'0','10.103.196.191',13317,'BB Ambient Temp Critical [{ITEM.VALUE}]'),(88,1,1490925979,2,13,'0','10.103.196.191',13318,'BB Ambient Temp Non-Critical [{ITEM.VALUE}]'),(89,1,1490925979,2,13,'0','10.103.196.191',13319,'Front Panel Temp Critical [{ITEM.VALUE}]'),(90,1,1490925979,2,13,'0','10.103.196.191',13320,'Front Panel Temp Non-Critical [{ITEM.VALUE}]'),(91,1,1490925979,2,13,'0','10.103.196.191',13321,'Power'),(92,1,1490925979,2,13,'0','10.103.196.191',13322,'Power'),(93,1,1490925979,2,13,'0','10.103.196.191',13323,'System Fan 2 Critical [{ITEM.VALUE}]'),(94,1,1490925979,2,13,'0','10.103.196.191',13324,'System Fan 2 Non-Critical [{ITEM.VALUE}]'),(95,1,1490925979,2,13,'0','10.103.196.191',13325,'System Fan 3 Critical [{ITEM.VALUE}]'),(96,1,1490925979,2,13,'0','10.103.196.191',13326,'System Fan 3 Non-Critical [{ITEM.VALUE}]'),(97,1,1490925979,2,13,'0','10.103.196.191',13327,'MySQL is down'),(98,1,1490925979,2,13,'0','10.103.196.191',13328,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(99,1,1490925979,2,13,'0','10.103.196.191',13329,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(100,1,1490925979,2,13,'0','10.103.196.191',13330,'Configured max number of opened files is too low on {HOST.NAME}'),(101,1,1490925979,2,13,'0','10.103.196.191',13331,'Configured max number of processes is too low on {HOST.NAME}'),(102,1,1490925979,2,13,'0','10.103.196.191',13332,'Too many processes running on {HOST.NAME}'),(103,1,1490925979,2,13,'0','10.103.196.191',13333,'Too many processes on {HOST.NAME}'),(104,1,1490925979,2,13,'0','10.103.196.191',13334,'Processor load is too high on {HOST.NAME}'),(105,1,1490925979,2,13,'0','10.103.196.191',13336,'Hostname was changed on {HOST.NAME}'),(106,1,1490925979,2,13,'0','10.103.196.191',13337,'Lack of free swap space on {HOST.NAME}'),(107,1,1490925979,2,13,'0','10.103.196.191',13338,'Host information was changed on {HOST.NAME}'),(108,1,1490925979,2,13,'0','10.103.196.191',13339,'{HOST.NAME} has just been restarted'),(109,1,1490925979,2,13,'0','10.103.196.191',13340,'/etc/passwd has been changed on {HOST.NAME}'),(110,1,1490925979,2,13,'0','10.103.196.191',13341,'Lack of available memory on server {HOST.NAME}'),(111,1,1490925979,2,13,'0','10.103.196.191',13344,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(112,1,1490925979,2,13,'0','10.103.196.191',13345,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(113,1,1490925979,2,13,'0','10.103.196.191',13346,'Configured max number of opened files is too low on {HOST.NAME}'),(114,1,1490925979,2,13,'0','10.103.196.191',13347,'Configured max number of processes is too low on {HOST.NAME}'),(115,1,1490925979,2,13,'0','10.103.196.191',13348,'Too many processes running on {HOST.NAME}'),(116,1,1490925979,2,13,'0','10.103.196.191',13349,'Too many processes on {HOST.NAME}'),(117,1,1490925979,2,13,'0','10.103.196.191',13350,'Processor load is too high on {HOST.NAME}'),(118,1,1490925979,2,13,'0','10.103.196.191',13352,'Hostname was changed on {HOST.NAME}'),(119,1,1490925979,2,13,'0','10.103.196.191',13353,'Lack of free swap space on {HOST.NAME}'),(120,1,1490925979,2,13,'0','10.103.196.191',13354,'Host information was changed on {HOST.NAME}'),(121,1,1490925979,2,13,'0','10.103.196.191',13355,'{HOST.NAME} has just been restarted'),(122,1,1490925979,2,13,'0','10.103.196.191',13356,'/etc/passwd has been changed on {HOST.NAME}'),(123,1,1490925979,2,13,'0','10.103.196.191',13357,'Lack of available memory on server {HOST.NAME}'),(124,1,1490925979,2,13,'0','10.103.196.191',13360,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(125,1,1490925979,2,13,'0','10.103.196.191',13361,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(126,1,1490925979,2,13,'0','10.103.196.191',13364,'Too many processes running on {HOST.NAME}'),(127,1,1490925979,2,13,'0','10.103.196.191',13365,'Too many processes on {HOST.NAME}'),(128,1,1490925979,2,13,'0','10.103.196.191',13366,'Processor load is too high on {HOST.NAME}'),(129,1,1490925979,2,13,'0','10.103.196.191',13367,'Disk I/O is overloaded on {HOST.NAME}'),(130,1,1490925979,2,13,'0','10.103.196.191',13368,'Hostname was changed on {HOST.NAME}'),(131,1,1490925979,2,13,'0','10.103.196.191',13370,'Host information was changed on {HOST.NAME}'),(132,1,1490925979,2,13,'0','10.103.196.191',13371,'{HOST.NAME} has just been restarted'),(133,1,1490925979,2,13,'0','10.103.196.191',13372,'/etc/passwd has been changed on {HOST.NAME}'),(134,1,1490925979,2,13,'0','10.103.196.191',13373,'Lack of available memory on server {HOST.NAME}'),(135,1,1490925979,2,13,'0','10.103.196.191',13376,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(136,1,1490925979,2,13,'0','10.103.196.191',13377,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(137,1,1490925979,2,13,'0','10.103.196.191',13382,'Processor load is too high on {HOST.NAME}'),(138,1,1490925979,2,13,'0','10.103.196.191',13384,'Hostname was changed on {HOST.NAME}'),(139,1,1490925979,2,13,'0','10.103.196.191',13386,'Host information was changed on {HOST.NAME}'),(140,1,1490925979,2,13,'0','10.103.196.191',13388,'/etc/passwd has been changed on {HOST.NAME}'),(141,1,1490925979,2,13,'0','10.103.196.191',13389,'Lack of available memory on server {HOST.NAME}'),(142,1,1490925979,2,13,'0','10.103.196.191',13392,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(143,1,1490925979,2,13,'0','10.103.196.191',13393,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(144,1,1490925979,2,13,'0','10.103.196.191',13395,'Configured max number of processes is too low on {HOST.NAME}'),(145,1,1490925979,2,13,'0','10.103.196.191',13396,'Too many processes running on {HOST.NAME}'),(146,1,1490925979,2,13,'0','10.103.196.191',13397,'Too many processes on {HOST.NAME}'),(147,1,1490925979,2,13,'0','10.103.196.191',13398,'Processor load is too high on {HOST.NAME}'),(148,1,1490925979,2,13,'0','10.103.196.191',13399,'Disk I/O is overloaded on {HOST.NAME}'),(149,1,1490925979,2,13,'0','10.103.196.191',13400,'Hostname was changed on {HOST.NAME}'),(150,1,1490925979,2,13,'0','10.103.196.191',13401,'Lack of free swap space on {HOST.NAME}'),(151,1,1490925979,2,13,'0','10.103.196.191',13402,'Host information was changed on {HOST.NAME}'),(152,1,1490925979,2,13,'0','10.103.196.191',13403,'{HOST.NAME} has just been restarted'),(153,1,1490925979,2,13,'0','10.103.196.191',13404,'/etc/passwd has been changed on {HOST.NAME}'),(154,1,1490925979,2,13,'0','10.103.196.191',13405,'Lack of available memory on server {HOST.NAME}'),(155,1,1490925979,2,13,'0','10.103.196.191',13408,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(156,1,1490925979,2,13,'0','10.103.196.191',13409,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(157,1,1490925979,2,13,'0','10.103.196.191',13410,'Configured max number of opened files is too low on {HOST.NAME}'),(158,1,1490925979,2,13,'0','10.103.196.191',13411,'Configured max number of processes is too low on {HOST.NAME}'),(159,1,1490925979,2,13,'0','10.103.196.191',13414,'Processor load is too high on {HOST.NAME}'),(160,1,1490925979,2,13,'0','10.103.196.191',13416,'Hostname was changed on {HOST.NAME}'),(161,1,1490925979,2,13,'0','10.103.196.191',13418,'Host information was changed on {HOST.NAME}'),(162,1,1490925979,2,13,'0','10.103.196.191',13419,'{HOST.NAME} has just been restarted'),(163,1,1490925979,2,13,'0','10.103.196.191',13420,'/etc/passwd has been changed on {HOST.NAME}'),(164,1,1490925979,2,13,'0','10.103.196.191',13421,'Lack of available memory on server {HOST.NAME}'),(165,1,1490925979,2,13,'0','10.103.196.191',13425,'Host information was changed on {HOST.NAME}'),(166,1,1490925979,2,13,'0','10.103.196.191',13428,'{HOST.NAME} has just been restarted'),(167,1,1490925979,2,13,'0','10.103.196.191',13430,'Too many processes on {HOST.NAME}'),(168,1,1490925979,2,13,'0','10.103.196.191',13431,'Lack of available virtual memory on server {HOST.NAME}'),(169,1,1490925979,2,13,'0','10.103.196.191',13433,'Lack of free memory on server {HOST.NAME}'),(170,1,1490925979,2,13,'0','10.103.196.191',13435,'Processor load is too high on {HOST.NAME}'),(171,1,1490925979,2,13,'0','10.103.196.191',13437,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(172,1,1490925979,2,13,'0','10.103.196.191',13438,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(173,1,1490925979,2,13,'0','10.103.196.191',13441,'Zabbix snmp trapper processes more than 75% busy'),(174,1,1490925979,2,13,'0','10.103.196.191',13442,'70% http-8080 worker threads busy on {HOST.NAME}'),(175,1,1490925979,2,13,'0','10.103.196.191',13443,'70% http-8443 worker threads busy on {HOST.NAME}'),(176,1,1490925979,2,13,'0','10.103.196.191',13444,'70% jk-8009 worker threads busy on {HOST.NAME}'),(177,1,1490925979,2,13,'0','10.103.196.191',13445,'70% mp CMS Old Gen used on {HOST.NAME}'),(178,1,1490925979,2,13,'0','10.103.196.191',13446,'70% mp CMS Perm Gen used on {HOST.NAME}'),(179,1,1490925979,2,13,'0','10.103.196.191',13447,'70% mp Code Cache used on {HOST.NAME}'),(180,1,1490925979,2,13,'0','10.103.196.191',13448,'70% mp Perm Gen used on {HOST.NAME}'),(181,1,1490925979,2,13,'0','10.103.196.191',13449,'70% mp PS Old Gen used on {HOST.NAME}'),(182,1,1490925979,2,13,'0','10.103.196.191',13450,'70% mp PS Perm Gen used on {HOST.NAME}'),(183,1,1490925979,2,13,'0','10.103.196.191',13451,'70% mp Tenured Gen used on {HOST.NAME}'),(184,1,1490925979,2,13,'0','10.103.196.191',13452,'70% os Opened File Descriptor Count used on {HOST.NAME}'),(185,1,1490925979,2,13,'0','10.103.196.191',13453,'gc Concurrent Mark Sweep in fire fighting mode on {HOST.NAME}'),(186,1,1490925979,2,13,'0','10.103.196.191',13454,'gc Mark Sweep Compact in fire fighting mode on {HOST.NAME}'),(187,1,1490925979,2,13,'0','10.103.196.191',13455,'gc PS Mark Sweep in fire fighting mode on {HOST.NAME}'),(188,1,1490925979,2,13,'0','10.103.196.191',13456,'gzip compression is off for connector http-8080 on {HOST.NAME}'),(189,1,1490925979,2,13,'0','10.103.196.191',13457,'gzip compression is off for connector http-8443 on {HOST.NAME}'),(190,1,1490925979,2,13,'0','10.103.196.191',13458,'mp CMS Old Gen fully committed on {HOST.NAME}'),(191,1,1490925979,2,13,'0','10.103.196.191',13459,'mp CMS Perm Gen fully committed on {HOST.NAME}'),(192,1,1490925979,2,13,'0','10.103.196.191',13460,'mp Code Cache fully committed on {HOST.NAME}'),(193,1,1490925979,2,13,'0','10.103.196.191',13461,'mp Perm Gen fully committed on {HOST.NAME}'),(194,1,1490925979,2,13,'0','10.103.196.191',13462,'mp PS Old Gen fully committed on {HOST.NAME}'),(195,1,1490925979,2,13,'0','10.103.196.191',13463,'mp PS Perm Gen fully committed on {HOST.NAME}'),(196,1,1490925979,2,13,'0','10.103.196.191',13464,'mp Tenured Gen fully committed on {HOST.NAME}'),(197,1,1490925979,2,13,'0','10.103.196.191',13465,'{HOST.NAME} is not reachable'),(198,1,1490925979,2,13,'0','10.103.196.191',13466,'{HOST.NAME} uses suboptimal JIT compiler'),(199,1,1490925979,2,13,'0','10.103.196.191',13507,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(200,1,1490925979,2,13,'0','10.103.196.191',13508,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(201,1,1490925979,2,13,'0','10.103.196.191',13510,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(202,1,1490925979,2,13,'0','10.103.196.191',13511,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(203,1,1490925979,2,13,'0','10.103.196.191',13512,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(204,1,1490925979,2,13,'0','10.103.196.191',13513,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(205,1,1490925979,2,13,'0','10.103.196.191',13514,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(206,1,1490925979,2,13,'0','10.103.196.191',13515,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(207,1,1490925979,2,13,'0','10.103.196.191',13516,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(208,1,1490925979,2,13,'0','10.103.196.191',13517,'Less than 25% free in the configuration cache'),(209,1,1490925979,2,13,'0','10.103.196.191',13518,'Less than 25% free in the history cache'),(210,1,1490925979,2,13,'0','10.103.196.191',13519,'Less than 25% free in the history index cache'),(211,1,1490925979,2,13,'0','10.103.196.191',13520,'More than 100 items having missing data for more than 10 minutes'),(212,1,1490925979,2,13,'0','10.103.196.191',13521,'Zabbix configuration syncer processes more than 75% busy'),(213,1,1490925979,2,13,'0','10.103.196.191',13522,'Zabbix discoverer processes more than 75% busy'),(214,1,1490925979,2,13,'0','10.103.196.191',13523,'Zabbix history syncer processes more than 75% busy'),(215,1,1490925979,2,13,'0','10.103.196.191',13524,'Zabbix housekeeper processes more than 75% busy'),(216,1,1490925979,2,13,'0','10.103.196.191',13525,'Zabbix http poller processes more than 75% busy'),(217,1,1490925979,2,13,'0','10.103.196.191',13526,'Zabbix icmp pinger processes more than 75% busy'),(218,1,1490925979,2,13,'0','10.103.196.191',13527,'Zabbix ipmi poller processes more than 75% busy'),(219,1,1490925979,2,13,'0','10.103.196.191',13528,'Zabbix java poller processes more than 75% busy'),(220,1,1490925979,2,13,'0','10.103.196.191',13529,'Zabbix poller processes more than 75% busy'),(221,1,1490925979,2,13,'0','10.103.196.191',13530,'Zabbix self-monitoring processes more than 75% busy'),(222,1,1490925979,2,13,'0','10.103.196.191',13531,'Zabbix snmp trapper processes more than 75% busy'),(223,1,1490925979,2,13,'0','10.103.196.191',13532,'Zabbix trapper processes more than 75% busy'),(224,1,1490925979,2,13,'0','10.103.196.191',13533,'Zabbix unreachable poller processes more than 75% busy'),(225,1,1490925979,2,13,'0','10.103.196.191',13534,'Zabbix data sender processes more than 75% busy'),(226,1,1490925979,2,13,'0','10.103.196.191',13535,'Zabbix heartbeat sender processes more than 75% busy'),(227,1,1490925979,2,13,'0','10.103.196.191',13536,'Less than 25% free in the vmware cache'),(228,1,1490925979,2,13,'0','10.103.196.191',13538,'70% os Process CPU Load on {HOST.NAME}'),(229,1,1490925979,2,13,'0','10.103.196.191',13539,'70% mem Heap Memory used on {HOST.NAME}'),(230,1,1490925979,2,13,'0','10.103.196.191',13540,'70% mem Non-Heap Memory used on {HOST.NAME}'),(231,1,1490925979,2,13,'0','10.103.196.191',13541,'mem Heap Memory fully committed on {HOST.NAME}'),(232,1,1490925979,2,13,'0','10.103.196.191',13542,'mem Non-Heap Memory fully committed on {HOST.NAME}'),(233,1,1490925979,2,13,'0','10.103.196.191',13543,'{HOST.NAME} runs suboptimal VM type'),(234,1,1490925979,2,13,'0','10.103.196.191',13544,'FTP service is down on {HOST.NAME}'),(235,1,1490925979,2,13,'0','10.103.196.191',13545,'HTTP service is down on {HOST.NAME}'),(236,1,1490925979,2,13,'0','10.103.196.191',13546,'HTTPS service is down on {HOST.NAME}'),(237,1,1490925979,2,13,'0','10.103.196.191',13547,'IMAP service is down on {HOST.NAME}'),(238,1,1490925979,2,13,'0','10.103.196.191',13548,'LDAP service is down on {HOST.NAME}'),(239,1,1490925979,2,13,'0','10.103.196.191',13549,'NNTP service is down on {HOST.NAME}'),(240,1,1490925979,2,13,'0','10.103.196.191',13550,'NTP service is down on {HOST.NAME}'),(241,1,1490925979,2,13,'0','10.103.196.191',13551,'POP service is down on {HOST.NAME}'),(242,1,1490925979,2,13,'0','10.103.196.191',13552,'SMTP service is down on {HOST.NAME}'),(243,1,1490925979,2,13,'0','10.103.196.191',13553,'SSH service is down on {HOST.NAME}'),(244,1,1490925979,2,13,'0','10.103.196.191',13554,'{HOST.NAME} is unavailable by ICMP'),(245,1,1490925979,2,13,'0','10.103.196.191',13555,'Response time is too high on {HOST.NAME}'),(246,1,1490925979,2,13,'0','10.103.196.191',13556,'Ping loss is too high on {HOST.NAME}'),(247,1,1490925979,2,13,'0','10.103.196.191',13557,'Zabbix value cache working in low memory mode'),(248,1,1490925979,2,4,'0','10.103.196.191',10001,'Template OS Linux'),(249,1,1490925979,2,4,'0','10.103.196.191',10047,'Template App Zabbix Server'),(250,1,1490925979,2,4,'0','10.103.196.191',10048,'Template App Zabbix Proxy'),(251,1,1490925979,2,4,'0','10.103.196.191',10050,'Template App Zabbix Agent'),(252,1,1490925979,2,4,'0','10.103.196.191',10060,'Template SNMP Interfaces'),(253,1,1490925979,2,4,'0','10.103.196.191',10065,'Template SNMP Generic'),(254,1,1490925979,2,4,'0','10.103.196.191',10066,'Template SNMP Device'),(255,1,1490925979,2,4,'0','10.103.196.191',10067,'Template SNMP OS Windows'),(256,1,1490925979,2,4,'0','10.103.196.191',10068,'Template SNMP Disks'),(257,1,1490925979,2,4,'0','10.103.196.191',10069,'Template SNMP OS Linux'),(258,1,1490925979,2,4,'0','10.103.196.191',10070,'Template SNMP Processors'),(259,1,1490925979,2,4,'0','10.103.196.191',10071,'Template IPMI Intel SR1530'),(260,1,1490925979,2,4,'0','10.103.196.191',10072,'Template IPMI Intel SR1630'),(261,1,1490925979,2,4,'0','10.103.196.191',10073,'Template App MySQL'),(262,1,1490925979,2,4,'0','10.103.196.191',10074,'Template OS OpenBSD'),(263,1,1490925979,2,4,'0','10.103.196.191',10075,'Template OS FreeBSD'),(264,1,1490925979,2,4,'0','10.103.196.191',10076,'Template OS AIX'),(265,1,1490925979,2,4,'0','10.103.196.191',10077,'Template OS HP-UX'),(266,1,1490925979,2,4,'0','10.103.196.191',10078,'Template OS Solaris'),(267,1,1490925979,2,4,'0','10.103.196.191',10079,'Template OS Mac OS X'),(268,1,1490925979,2,4,'0','10.103.196.191',10081,'Template OS Windows'),(269,1,1490925979,2,4,'0','10.103.196.191',10082,'Template JMX Generic'),(270,1,1490925979,2,4,'0','10.103.196.191',10083,'Template JMX Tomcat'),(271,1,1490925979,2,4,'0','10.103.196.191',10088,'Template Virt VMware'),(272,1,1490925979,2,4,'0','10.103.196.191',10089,'Template Virt VMware Guest'),(273,1,1490925979,2,4,'0','10.103.196.191',10091,'Template Virt VMware Hypervisor'),(274,1,1490925979,2,4,'0','10.103.196.191',10093,'Template App FTP Service'),(275,1,1490925979,2,4,'0','10.103.196.191',10094,'Template App HTTP Service'),(276,1,1490925979,2,4,'0','10.103.196.191',10095,'Template App HTTPS Service'),(277,1,1490925979,2,4,'0','10.103.196.191',10096,'Template App IMAP Service'),(278,1,1490925979,2,4,'0','10.103.196.191',10097,'Template App LDAP Service'),(279,1,1490925979,2,4,'0','10.103.196.191',10098,'Template App NNTP Service'),(280,1,1490925979,2,4,'0','10.103.196.191',10099,'Template App NTP Service'),(281,1,1490925979,2,4,'0','10.103.196.191',10100,'Template App POP Service'),(282,1,1490925979,2,4,'0','10.103.196.191',10101,'Template App SMTP Service'),(283,1,1490925979,2,4,'0','10.103.196.191',10102,'Template App SSH Service'),(284,1,1490925979,2,4,'0','10.103.196.191',10103,'Template App Telnet Service'),(285,1,1490925979,2,4,'0','10.103.196.191',10104,'Template ICMP Ping'),(286,1,1490925991,0,13,'0','10.103.196.191',13559,'/etc/passwd has been changed on {HOST.NAME}'),(287,1,1490925991,0,13,'0','10.103.196.191',13560,'CEPH critical error'),(288,1,1490925991,0,13,'0','10.103.196.191',13561,'CEPH warning'),(289,1,1490925991,0,13,'0','10.103.196.191',13562,'Configured max number of opened files is too low on {HOST.NAME}'),(290,1,1490925991,0,13,'0','10.103.196.191',13563,'Configured max number of processes is too low on {HOST.NAME}'),(291,1,1490925991,0,13,'0','10.103.196.191',13564,'Disk I/O is overloaded on {HOST.NAME}'),(292,1,1490925991,0,13,'0','10.103.196.191',13565,'Host information was changed on {HOST.NAME}'),(293,1,1490925991,0,13,'0','10.103.196.191',13566,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(294,1,1490925991,0,13,'0','10.103.196.191',13567,'Hostname was changed on {HOST.NAME}'),(295,1,1490925991,0,13,'0','10.103.196.191',13568,'IMAP service is down on {HOST.NAME}'),(296,1,1490925991,0,13,'0','10.103.196.191',13569,'Lack of available memory on server {HOST.NAME}'),(297,1,1490925991,0,13,'0','10.103.196.191',13570,'Lack of free swap space on {HOST.NAME}'),(298,1,1490925991,0,13,'0','10.103.196.191',13571,'LDAP service is down on {HOST.NAME}'),(299,1,1490925991,0,13,'0','10.103.196.191',13572,'Less than 5% free in the value cache'),(300,1,1490925991,0,13,'0','10.103.196.191',13573,'Less than 25% free in the configuration cache'),(301,1,1490925991,0,13,'0','10.103.196.191',13574,'Less than 25% free in the configuration cache'),(302,1,1490925991,0,13,'0','10.103.196.191',13575,'Less than 25% free in the history cache'),(303,1,1490925991,0,13,'0','10.103.196.191',13576,'Less than 25% free in the history cache'),(304,1,1490925991,0,13,'0','10.103.196.191',13577,'Less than 25% free in the history index cache'),(305,1,1490925991,0,13,'0','10.103.196.191',13578,'Less than 25% free in the text history cache'),(306,1,1490925991,0,13,'0','10.103.196.191',13579,'Less than 25% free in the trends cache'),(307,1,1490925991,0,13,'0','10.103.196.191',13580,'Less than 25% free in the vmware cache'),(308,1,1490925991,0,13,'0','10.103.196.191',13581,'More than 100 items having missing data for more than 10'),(309,1,1490925991,0,13,'0','10.103.196.191',13582,'More than 100 items having missing data for more than 10 minutes'),(310,1,1490925991,0,13,'0','10.103.196.191',13583,'MySQL is down'),(311,1,1490925991,0,13,'0','10.103.196.191',13584,'Neutron server daemon status'),(312,1,1490925991,0,13,'0','10.103.196.191',13585,'openstack ceilometer-agent-notification has down'),(313,1,1490925991,0,13,'0','10.103.196.191',13586,'openstack ceilometer-collector has down'),(314,1,1490925991,0,13,'0','10.103.196.191',13587,'openstack ceilometer-polling has down'),(315,1,1490925991,0,13,'0','10.103.196.191',13588,'openstack ceilometer-polling has down'),(316,1,1490925991,0,13,'0','10.103.196.191',13589,'openstack ceilometer collector daemon status'),(317,1,1490925991,0,13,'0','10.103.196.191',13590,'openstack cinder-api has down'),(318,1,1490925991,0,13,'0','10.103.196.191',13591,'openstack cinder-scheduler has down'),(319,1,1490925991,0,13,'0','10.103.196.191',13592,'openstack cinder-volume has down'),(320,1,1490925991,0,13,'0','10.103.196.191',13593,'Openstack cinder process status'),(321,1,1490925991,0,13,'0','10.103.196.191',13594,'Openstack compute service cinder volume'),(322,1,1490925991,0,13,'0','10.103.196.191',13595,'Openstack compute service libvirtd'),(323,1,1490925991,0,13,'0','10.103.196.191',13596,'Openstack compute service neutron l3 agent'),(324,1,1490925991,0,13,'0','10.103.196.191',13597,'Openstack compute service neutron metadata agent'),(325,1,1490925991,0,13,'0','10.103.196.191',13598,'Openstack compute service neutron openvswitch agent'),(326,1,1490925991,0,13,'0','10.103.196.191',13599,'Openstack compute service nova compute'),(327,1,1490925991,0,13,'0','10.103.196.191',13600,'Openstack controller service cinder api'),(328,1,1490925991,0,13,'0','10.103.196.191',13601,'Openstack controller service cinder scheduler'),(329,1,1490925991,0,13,'0','10.103.196.191',13602,'Openstack controller service glance api'),(330,1,1490925991,0,13,'0','10.103.196.191',13603,'Openstack controller service glance registry'),(331,1,1490925991,0,13,'0','10.103.196.191',13604,'Openstack controller service httpd'),(332,1,1490925991,0,13,'0','10.103.196.191',13605,'Openstack controller service memcached'),(333,1,1490925991,0,13,'0','10.103.196.191',13606,'Openstack controller service neutron dhcp agent'),(334,1,1490925991,0,13,'0','10.103.196.191',13607,'Openstack controller service neutron l3 agent'),(335,1,1490925991,0,13,'0','10.103.196.191',13608,'Openstack controller service neutron metadata agent'),(336,1,1490925991,0,13,'0','10.103.196.191',13609,'Openstack controller service neutron openvswitch agent'),(337,1,1490925991,0,13,'0','10.103.196.191',13610,'Openstack controller service neutron server'),(338,1,1490925991,0,13,'0','10.103.196.191',13611,'Openstack controller service nova api'),(339,1,1490925991,0,13,'0','10.103.196.191',13612,'Openstack controller service nova cert'),(340,1,1490925991,0,13,'0','10.103.196.191',13613,'Openstack controller service nova conductor'),(341,1,1490925991,0,13,'0','10.103.196.191',13614,'Openstack controller service nova consoleauth'),(342,1,1490925991,0,13,'0','10.103.196.191',13615,'Openstack controller service nova novncproxy'),(343,1,1490925991,0,13,'0','10.103.196.191',13616,'Openstack controller service nova scheduler'),(344,1,1490925991,0,13,'0','10.103.196.191',13617,'openstack glance-api has down'),(345,1,1490925991,0,13,'0','10.103.196.191',13618,'openstack glance-registry has down'),(346,1,1490925991,0,13,'0','10.103.196.191',13619,'openstack heat api daemon status'),(347,1,1490925991,0,13,'0','10.103.196.191',13620,'openstack httpd has down'),(348,1,1490925991,0,13,'0','10.103.196.191',13621,'openstack httpd has down'),(349,1,1490925991,0,13,'0','10.103.196.191',13622,'openstack libvirtd has down'),(350,1,1490925991,0,13,'0','10.103.196.191',13623,'openstack memcached has down'),(351,1,1490925991,0,13,'0','10.103.196.191',13624,'openstack mysqld has down'),(352,1,1490925991,0,13,'0','10.103.196.191',13625,'openstack neutron-dhcp-agent has down'),(353,1,1490925991,0,13,'0','10.103.196.191',13626,'openstack neutron-l3-agent has down'),(354,1,1490925991,0,13,'0','10.103.196.191',13627,'openstack neutron-l3-agent has down'),(355,1,1490925991,0,13,'0','10.103.196.191',13628,'openstack neutron-lbaasv2-agent has down'),(356,1,1490925991,0,13,'0','10.103.196.191',13629,'openstack  neutron-metadata-agent has down'),(357,1,1490925991,0,13,'0','10.103.196.191',13630,'openstack neutron-openvswitch-agent has down'),(358,1,1490925991,0,13,'0','10.103.196.191',13631,'openstack neutron-openvswitch-agent has down'),(359,1,1490925991,0,13,'0','10.103.196.191',13632,'openstack neutron-server has down'),(360,1,1490925991,0,13,'0','10.103.196.191',13633,'Openstack neutron process status'),(361,1,1490925991,0,13,'0','10.103.196.191',13634,'openstack nova-api has down'),(362,1,1490925991,0,13,'0','10.103.196.191',13635,'openstack nova-cert has down'),(363,1,1490925991,0,13,'0','10.103.196.191',13636,'openstack nova-compute has down'),(364,1,1490925991,0,13,'0','10.103.196.191',13637,'openstack nova-conductor has down'),(365,1,1490925991,0,13,'0','10.103.196.191',13638,'openstack nova-consoleauth has down'),(366,1,1490925991,0,13,'0','10.103.196.191',13639,'openstack nova-novncproxy has down'),(367,1,1490925991,0,13,'0','10.103.196.191',13640,'openstack nova-scheduler has down'),(368,1,1490925991,0,13,'0','10.103.196.191',13641,'Openstack nova process status'),(369,1,1490925991,0,13,'0','10.103.196.191',13642,'openstack ntpd has down'),(370,1,1490925991,0,13,'0','10.103.196.191',13643,'openstack openvswitch has down'),(371,1,1490925991,0,13,'0','10.103.196.191',13644,'openstack rabbitmq-server has down'),(372,1,1490925991,0,13,'0','10.103.196.191',13645,'Openstack service haproxy has down'),(373,1,1490925991,0,13,'0','10.103.196.191',13646,'Openstack service heat api cfn daemon status'),(374,1,1490925991,0,13,'0','10.103.196.191',13647,'Openstack service heat engine daemon status'),(375,1,1490925991,0,13,'0','10.103.196.191',13648,'Openstack service keepalived has down'),(376,1,1490925991,0,13,'0','10.103.196.191',13649,'openstack xinetd has down'),(377,1,1490925991,0,13,'0','10.103.196.191',13650,'Processor load is too high on {HOST.NAME}'),(378,1,1490925991,0,13,'0','10.103.196.191',13651,'SSH service is down on {HOST.NAME}'),(379,1,1490925991,0,13,'0','10.103.196.191',13652,'Too many processes on {HOST.NAME}'),(380,1,1490925991,0,13,'0','10.103.196.191',13653,'Too many processes running on {HOST.NAME}'),(381,1,1490925991,0,13,'0','10.103.196.191',13654,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(382,1,1490925991,0,13,'0','10.103.196.191',13655,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(383,1,1490925991,0,13,'0','10.103.196.191',13656,'Zabbix alerter processes more than 75% busy'),(384,1,1490925991,0,13,'0','10.103.196.191',13657,'Zabbix configuration syncer processes more than 75% busy'),(385,1,1490925991,0,13,'0','10.103.196.191',13658,'Zabbix configuration syncer processes more than 75% busy'),(386,1,1490925991,0,13,'0','10.103.196.191',13659,'Zabbix data sender processes more than 75% busy'),(387,1,1490925991,0,13,'0','10.103.196.191',13660,'Zabbix db watchdog processes more than 75% busy'),(388,1,1490925991,0,13,'0','10.103.196.191',13661,'Zabbix discoverer processes more than 75% busy'),(389,1,1490925991,0,13,'0','10.103.196.191',13662,'Zabbix discoverer processes more than 75% busy'),(390,1,1490925991,0,13,'0','10.103.196.191',13663,'Zabbix escalator processes more than 75% busy'),(391,1,1490925991,0,13,'0','10.103.196.191',13664,'Zabbix heartbeat sender processes more than 75% busy'),(392,1,1490925991,0,13,'0','10.103.196.191',13665,'Zabbix history syncer processes more than 75% busy'),(393,1,1490925991,0,13,'0','10.103.196.191',13666,'Zabbix history syncer processes more than 75% busy'),(394,1,1490925991,0,13,'0','10.103.196.191',13667,'Zabbix housekeeper processes more than 75% busy'),(395,1,1490925991,0,13,'0','10.103.196.191',13668,'Zabbix housekeeper processes more than 75% busy'),(396,1,1490925991,0,13,'0','10.103.196.191',13669,'Zabbix http poller processes more than 75% busy'),(397,1,1490925991,0,13,'0','10.103.196.191',13670,'Zabbix http poller processes more than 75% busy'),(398,1,1490925991,0,13,'0','10.103.196.191',13671,'Zabbix icmp pinger processes more than 75% busy'),(399,1,1490925991,0,13,'0','10.103.196.191',13672,'Zabbix icmp pinger processes more than 75% busy'),(400,1,1490925991,0,13,'0','10.103.196.191',13673,'Zabbix ipmi poller processes more than 75% busy'),(401,1,1490925991,0,13,'0','10.103.196.191',13674,'Zabbix ipmi poller processes more than 75% busy'),(402,1,1490925991,0,13,'0','10.103.196.191',13675,'Zabbix java poller processes more than 75% busy'),(403,1,1490925991,0,13,'0','10.103.196.191',13676,'Zabbix java poller processes more than 75% busy'),(404,1,1490925991,0,13,'0','10.103.196.191',13677,'Zabbix poller processes more than 75% busy'),(405,1,1490925991,0,13,'0','10.103.196.191',13678,'Zabbix poller processes more than 75% busy'),(406,1,1490925991,0,13,'0','10.103.196.191',13679,'Zabbix proxy poller processes more than 75% busy'),(407,1,1490925991,0,13,'0','10.103.196.191',13680,'Zabbix self-monitoring processes more than 75% busy'),(408,1,1490925991,0,13,'0','10.103.196.191',13681,'Zabbix self-monitoring processes more than 75% busy'),(409,1,1490925991,0,13,'0','10.103.196.191',13682,'Zabbix snmp trapper processes more than 75% busy'),(410,1,1490925991,0,13,'0','10.103.196.191',13683,'Zabbix snmp trapper processes more than 75% busy'),(411,1,1490925991,0,13,'0','10.103.196.191',13684,'Zabbix timer processes more than 75% busy'),(412,1,1490925991,0,13,'0','10.103.196.191',13685,'Zabbix trapper processes more than 75% busy'),(413,1,1490925991,0,13,'0','10.103.196.191',13686,'Zabbix trapper processes more than 75% busy'),(414,1,1490925991,0,13,'0','10.103.196.191',13687,'Zabbix unreachable poller processes more than 75% busy'),(415,1,1490925991,0,13,'0','10.103.196.191',13688,'Zabbix unreachable poller processes more than 75% busy'),(416,1,1490925991,0,13,'0','10.103.196.191',13689,'Zabbix vmware collector processes more than 75% busy'),(417,1,1490925991,0,13,'0','10.103.196.191',13690,'{HOST.NAME} has just been restarted'),(418,1,1490925991,0,13,'0','10.103.196.191',13691,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(419,1,1490925991,0,13,'0','10.103.196.191',13692,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(420,1,1490925991,0,13,'0','10.103.196.191',13693,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(421,1,1490926108,1,3,'Media type [Email]','10.103.196.191',0,''),(422,1,1490926323,1,5,'Name: Send E-mail','10.103.196.191',0,''),(423,1,1490926336,1,5,'Name: Send E-mail','10.103.196.191',0,''),(424,1,1490926453,0,5,'Name: Auto registration:controller','10.103.196.191',0,''),(425,1,1490926534,0,5,'Name: Auto registration:compute','10.103.196.191',0,''),(426,1,1490926613,0,5,'Name: Auto registration:ceph','10.103.196.191',0,''),(427,1,1490926877,1,0,'User alias [Admin] name [Zabbix] surname [Administrator]','10.103.196.191',0,''),(428,1,1490927033,0,3,'Media type [Wechat]','10.103.196.191',0,''),(429,1,1490927057,0,5,'Name: send wechat','10.103.196.191',0,''),(430,1,1492236757,3,0,'0','10.96.196.127',1,''),(431,1,1492239584,2,13,'0','10.96.196.127',13691,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(432,1,1492239584,2,13,'0','10.96.196.127',13692,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(433,1,1492239584,2,13,'0','10.96.196.127',13693,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(434,1,1492239584,2,31,'0','10.96.196.127',13694,'Free disk space is less than 20% on volume {#FSNAME}:{13297}<20'),(435,1,1492239584,2,31,'0','10.96.196.127',13695,'Free inodes is less than 20% on volume {#FSNAME}:{13298}<20'),(436,1,1492239584,2,13,'0','10.96.196.127',13559,'/etc/passwd has been changed on {HOST.NAME}'),(437,1,1492239584,2,13,'0','10.96.196.127',13560,'CEPH critical error'),(438,1,1492239584,2,13,'0','10.96.196.127',13561,'CEPH warning'),(439,1,1492239584,2,13,'0','10.96.196.127',13562,'Configured max number of opened files is too low on {HOST.NAME}'),(440,1,1492239584,2,13,'0','10.96.196.127',13563,'Configured max number of processes is too low on {HOST.NAME}'),(441,1,1492239584,2,13,'0','10.96.196.127',13564,'Disk I/O is overloaded on {HOST.NAME}'),(442,1,1492239584,2,13,'0','10.96.196.127',13565,'Host information was changed on {HOST.NAME}'),(443,1,1492239584,2,13,'0','10.96.196.127',13566,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(444,1,1492239584,2,13,'0','10.96.196.127',13567,'Hostname was changed on {HOST.NAME}'),(445,1,1492239584,2,13,'0','10.96.196.127',13568,'IMAP service is down on {HOST.NAME}'),(446,1,1492239584,2,13,'0','10.96.196.127',13569,'Lack of available memory on server {HOST.NAME}'),(447,1,1492239584,2,13,'0','10.96.196.127',13570,'Lack of free swap space on {HOST.NAME}'),(448,1,1492239584,2,13,'0','10.96.196.127',13571,'LDAP service is down on {HOST.NAME}'),(449,1,1492239584,2,13,'0','10.96.196.127',13572,'Less than 5% free in the value cache'),(450,1,1492239584,2,13,'0','10.96.196.127',13573,'Less than 25% free in the configuration cache'),(451,1,1492239584,2,13,'0','10.96.196.127',13574,'Less than 25% free in the configuration cache'),(452,1,1492239584,2,13,'0','10.96.196.127',13575,'Less than 25% free in the history cache'),(453,1,1492239584,2,13,'0','10.96.196.127',13576,'Less than 25% free in the history cache'),(454,1,1492239584,2,13,'0','10.96.196.127',13577,'Less than 25% free in the history index cache'),(455,1,1492239584,2,13,'0','10.96.196.127',13578,'Less than 25% free in the text history cache'),(456,1,1492239584,2,13,'0','10.96.196.127',13579,'Less than 25% free in the trends cache'),(457,1,1492239584,2,13,'0','10.96.196.127',13580,'Less than 25% free in the vmware cache'),(458,1,1492239584,2,13,'0','10.96.196.127',13581,'More than 100 items having missing data for more than 10'),(459,1,1492239584,2,13,'0','10.96.196.127',13582,'More than 100 items having missing data for more than 10 minutes'),(460,1,1492239584,2,13,'0','10.96.196.127',13583,'MySQL is down'),(461,1,1492239584,2,13,'0','10.96.196.127',13584,'Neutron server daemon status'),(462,1,1492239584,2,13,'0','10.96.196.127',13585,'openstack ceilometer-agent-notification has down'),(463,1,1492239584,2,13,'0','10.96.196.127',13586,'openstack ceilometer-collector has down'),(464,1,1492239584,2,13,'0','10.96.196.127',13587,'openstack ceilometer-polling has down'),(465,1,1492239584,2,13,'0','10.96.196.127',13588,'openstack ceilometer-polling has down'),(466,1,1492239584,2,13,'0','10.96.196.127',13589,'openstack ceilometer collector daemon status'),(467,1,1492239584,2,13,'0','10.96.196.127',13590,'openstack cinder-api has down'),(468,1,1492239584,2,13,'0','10.96.196.127',13591,'openstack cinder-scheduler has down'),(469,1,1492239584,2,13,'0','10.96.196.127',13592,'openstack cinder-volume has down'),(470,1,1492239584,2,13,'0','10.96.196.127',13593,'Openstack cinder process status'),(471,1,1492239584,2,13,'0','10.96.196.127',13594,'Openstack compute service cinder volume'),(472,1,1492239584,2,13,'0','10.96.196.127',13595,'Openstack compute service libvirtd'),(473,1,1492239584,2,13,'0','10.96.196.127',13596,'Openstack compute service neutron l3 agent'),(474,1,1492239584,2,13,'0','10.96.196.127',13597,'Openstack compute service neutron metadata agent'),(475,1,1492239584,2,13,'0','10.96.196.127',13598,'Openstack compute service neutron openvswitch agent'),(476,1,1492239584,2,13,'0','10.96.196.127',13599,'Openstack compute service nova compute'),(477,1,1492239584,2,13,'0','10.96.196.127',13600,'Openstack controller service cinder api'),(478,1,1492239584,2,13,'0','10.96.196.127',13601,'Openstack controller service cinder scheduler'),(479,1,1492239584,2,13,'0','10.96.196.127',13602,'Openstack controller service glance api'),(480,1,1492239584,2,13,'0','10.96.196.127',13603,'Openstack controller service glance registry'),(481,1,1492239584,2,13,'0','10.96.196.127',13604,'Openstack controller service httpd'),(482,1,1492239584,2,13,'0','10.96.196.127',13605,'Openstack controller service memcached'),(483,1,1492239584,2,13,'0','10.96.196.127',13606,'Openstack controller service neutron dhcp agent'),(484,1,1492239584,2,13,'0','10.96.196.127',13607,'Openstack controller service neutron l3 agent'),(485,1,1492239584,2,13,'0','10.96.196.127',13608,'Openstack controller service neutron metadata agent'),(486,1,1492239584,2,13,'0','10.96.196.127',13609,'Openstack controller service neutron openvswitch agent'),(487,1,1492239584,2,13,'0','10.96.196.127',13610,'Openstack controller service neutron server'),(488,1,1492239584,2,13,'0','10.96.196.127',13611,'Openstack controller service nova api'),(489,1,1492239584,2,13,'0','10.96.196.127',13612,'Openstack controller service nova cert'),(490,1,1492239584,2,13,'0','10.96.196.127',13613,'Openstack controller service nova conductor'),(491,1,1492239584,2,13,'0','10.96.196.127',13614,'Openstack controller service nova consoleauth'),(492,1,1492239584,2,13,'0','10.96.196.127',13615,'Openstack controller service nova novncproxy'),(493,1,1492239584,2,13,'0','10.96.196.127',13616,'Openstack controller service nova scheduler'),(494,1,1492239584,2,13,'0','10.96.196.127',13617,'openstack glance-api has down'),(495,1,1492239584,2,13,'0','10.96.196.127',13618,'openstack glance-registry has down'),(496,1,1492239584,2,13,'0','10.96.196.127',13619,'openstack heat api daemon status'),(497,1,1492239584,2,13,'0','10.96.196.127',13620,'openstack httpd has down'),(498,1,1492239584,2,13,'0','10.96.196.127',13621,'openstack httpd has down'),(499,1,1492239584,2,13,'0','10.96.196.127',13622,'openstack libvirtd has down'),(500,1,1492239584,2,13,'0','10.96.196.127',13623,'openstack memcached has down'),(501,1,1492239584,2,13,'0','10.96.196.127',13624,'openstack mysqld has down'),(502,1,1492239584,2,13,'0','10.96.196.127',13625,'openstack neutron-dhcp-agent has down'),(503,1,1492239584,2,13,'0','10.96.196.127',13626,'openstack neutron-l3-agent has down'),(504,1,1492239584,2,13,'0','10.96.196.127',13627,'openstack neutron-l3-agent has down'),(505,1,1492239584,2,13,'0','10.96.196.127',13628,'openstack neutron-lbaasv2-agent has down'),(506,1,1492239584,2,13,'0','10.96.196.127',13629,'openstack  neutron-metadata-agent has down'),(507,1,1492239584,2,13,'0','10.96.196.127',13630,'openstack neutron-openvswitch-agent has down'),(508,1,1492239584,2,13,'0','10.96.196.127',13631,'openstack neutron-openvswitch-agent has down'),(509,1,1492239584,2,13,'0','10.96.196.127',13632,'openstack neutron-server has down'),(510,1,1492239584,2,13,'0','10.96.196.127',13633,'Openstack neutron process status'),(511,1,1492239584,2,13,'0','10.96.196.127',13634,'openstack nova-api has down'),(512,1,1492239584,2,13,'0','10.96.196.127',13635,'openstack nova-cert has down'),(513,1,1492239584,2,13,'0','10.96.196.127',13636,'openstack nova-compute has down'),(514,1,1492239584,2,13,'0','10.96.196.127',13637,'openstack nova-conductor has down'),(515,1,1492239584,2,13,'0','10.96.196.127',13638,'openstack nova-consoleauth has down'),(516,1,1492239584,2,13,'0','10.96.196.127',13639,'openstack nova-novncproxy has down'),(517,1,1492239584,2,13,'0','10.96.196.127',13640,'openstack nova-scheduler has down'),(518,1,1492239584,2,13,'0','10.96.196.127',13641,'Openstack nova process status'),(519,1,1492239584,2,13,'0','10.96.196.127',13642,'openstack ntpd has down'),(520,1,1492239584,2,13,'0','10.96.196.127',13643,'openstack openvswitch has down'),(521,1,1492239584,2,13,'0','10.96.196.127',13644,'openstack rabbitmq-server has down'),(522,1,1492239584,2,13,'0','10.96.196.127',13645,'Openstack service haproxy has down'),(523,1,1492239584,2,13,'0','10.96.196.127',13646,'Openstack service heat api cfn daemon status'),(524,1,1492239584,2,13,'0','10.96.196.127',13647,'Openstack service heat engine daemon status'),(525,1,1492239584,2,13,'0','10.96.196.127',13648,'Openstack service keepalived has down'),(526,1,1492239584,2,13,'0','10.96.196.127',13649,'openstack xinetd has down'),(527,1,1492239584,2,13,'0','10.96.196.127',13650,'Processor load is too high on {HOST.NAME}'),(528,1,1492239584,2,13,'0','10.96.196.127',13651,'SSH service is down on {HOST.NAME}'),(529,1,1492239584,2,13,'0','10.96.196.127',13652,'Too many processes on {HOST.NAME}'),(530,1,1492239584,2,13,'0','10.96.196.127',13653,'Too many processes running on {HOST.NAME}'),(531,1,1492239584,2,13,'0','10.96.196.127',13654,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(532,1,1492239584,2,13,'0','10.96.196.127',13655,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(533,1,1492239584,2,13,'0','10.96.196.127',13656,'Zabbix alerter processes more than 75% busy'),(534,1,1492239584,2,13,'0','10.96.196.127',13657,'Zabbix configuration syncer processes more than 75% busy'),(535,1,1492239584,2,13,'0','10.96.196.127',13658,'Zabbix configuration syncer processes more than 75% busy'),(536,1,1492239584,2,13,'0','10.96.196.127',13659,'Zabbix data sender processes more than 75% busy'),(537,1,1492239584,2,13,'0','10.96.196.127',13660,'Zabbix db watchdog processes more than 75% busy'),(538,1,1492239584,2,13,'0','10.96.196.127',13661,'Zabbix discoverer processes more than 75% busy'),(539,1,1492239584,2,13,'0','10.96.196.127',13662,'Zabbix discoverer processes more than 75% busy'),(540,1,1492239584,2,13,'0','10.96.196.127',13663,'Zabbix escalator processes more than 75% busy'),(541,1,1492239584,2,13,'0','10.96.196.127',13664,'Zabbix heartbeat sender processes more than 75% busy'),(542,1,1492239584,2,13,'0','10.96.196.127',13665,'Zabbix history syncer processes more than 75% busy'),(543,1,1492239584,2,13,'0','10.96.196.127',13666,'Zabbix history syncer processes more than 75% busy'),(544,1,1492239584,2,13,'0','10.96.196.127',13667,'Zabbix housekeeper processes more than 75% busy'),(545,1,1492239584,2,13,'0','10.96.196.127',13668,'Zabbix housekeeper processes more than 75% busy'),(546,1,1492239584,2,13,'0','10.96.196.127',13669,'Zabbix http poller processes more than 75% busy'),(547,1,1492239584,2,13,'0','10.96.196.127',13670,'Zabbix http poller processes more than 75% busy'),(548,1,1492239584,2,13,'0','10.96.196.127',13671,'Zabbix icmp pinger processes more than 75% busy'),(549,1,1492239584,2,13,'0','10.96.196.127',13672,'Zabbix icmp pinger processes more than 75% busy'),(550,1,1492239584,2,13,'0','10.96.196.127',13673,'Zabbix ipmi poller processes more than 75% busy'),(551,1,1492239584,2,13,'0','10.96.196.127',13674,'Zabbix ipmi poller processes more than 75% busy'),(552,1,1492239584,2,13,'0','10.96.196.127',13675,'Zabbix java poller processes more than 75% busy'),(553,1,1492239584,2,13,'0','10.96.196.127',13676,'Zabbix java poller processes more than 75% busy'),(554,1,1492239584,2,13,'0','10.96.196.127',13677,'Zabbix poller processes more than 75% busy'),(555,1,1492239584,2,13,'0','10.96.196.127',13678,'Zabbix poller processes more than 75% busy'),(556,1,1492239584,2,13,'0','10.96.196.127',13679,'Zabbix proxy poller processes more than 75% busy'),(557,1,1492239584,2,13,'0','10.96.196.127',13680,'Zabbix self-monitoring processes more than 75% busy'),(558,1,1492239584,2,13,'0','10.96.196.127',13681,'Zabbix self-monitoring processes more than 75% busy'),(559,1,1492239584,2,13,'0','10.96.196.127',13682,'Zabbix snmp trapper processes more than 75% busy'),(560,1,1492239584,2,13,'0','10.96.196.127',13683,'Zabbix snmp trapper processes more than 75% busy'),(561,1,1492239584,2,13,'0','10.96.196.127',13684,'Zabbix timer processes more than 75% busy'),(562,1,1492239584,2,13,'0','10.96.196.127',13685,'Zabbix trapper processes more than 75% busy'),(563,1,1492239584,2,13,'0','10.96.196.127',13686,'Zabbix trapper processes more than 75% busy'),(564,1,1492239584,2,13,'0','10.96.196.127',13687,'Zabbix unreachable poller processes more than 75% busy'),(565,1,1492239584,2,13,'0','10.96.196.127',13688,'Zabbix unreachable poller processes more than 75% busy'),(566,1,1492239584,2,13,'0','10.96.196.127',13689,'Zabbix vmware collector processes more than 75% busy'),(567,1,1492239584,2,13,'0','10.96.196.127',13690,'{HOST.NAME} has just been restarted'),(568,1,1492239584,2,4,'0','10.96.196.127',10085,'compute node'),(569,1,1492239584,2,4,'0','10.96.196.127',10086,'controller node'),(570,1,1492239584,2,4,'0','10.96.196.127',10087,'dashboard'),(571,1,1492239584,2,4,'0','10.96.196.127',10088,'haproxy'),(572,1,1492239584,2,4,'0','10.96.196.127',10089,'lbaas'),(573,1,1492239584,2,4,'0','10.96.196.127',10090,'memcache'),(574,1,1492239584,2,4,'0','10.96.196.127',10091,'mysql'),(575,1,1492239584,2,4,'0','10.96.196.127',10092,'novnc'),(576,1,1492239584,2,4,'0','10.96.196.127',10093,'ntp'),(577,1,1492239584,2,4,'0','10.96.196.127',10094,'rabbitmq'),(578,1,1492239584,2,4,'0','10.96.196.127',10095,'Template App Ceph ProcessNum'),(579,1,1492239584,2,4,'0','10.96.196.127',10096,'Template App Ceph State'),(580,1,1492239584,2,4,'0','10.96.196.127',10097,'Template App IMAP Service'),(581,1,1492239584,2,4,'0','10.96.196.127',10098,'Template App LDAP Service'),(582,1,1492239584,2,4,'0','10.96.196.127',10099,'Template App MySQL'),(583,1,1492239584,2,4,'0','10.96.196.127',10100,'Template App Openstack Compute ServiceExist'),(584,1,1492239584,2,4,'0','10.96.196.127',10101,'Template App Openstack Controller ServiceExist'),(585,1,1492239584,2,4,'0','10.96.196.127',10102,'Template App SSH Service'),(586,1,1492239584,2,4,'0','10.96.196.127',10103,'Template App Zabbix Agent'),(587,1,1492239584,2,4,'0','10.96.196.127',10104,'Template App Zabbix Proxy'),(588,1,1492239584,2,4,'0','10.96.196.127',10105,'Template App Zabbix Server'),(589,1,1492239584,2,4,'0','10.96.196.127',10106,'Template OS Linux'),(590,1,1492239623,0,13,'0','10.96.196.127',13696,'/etc/passwd has been changed on {HOST.NAME}'),(591,1,1492239623,0,13,'0','10.96.196.127',13697,'Auto Increment Control is disabled'),(592,1,1492239623,0,13,'0','10.96.196.127',13698,'Binary Log Do Filter is enabled'),(593,1,1492239623,0,13,'0','10.96.196.127',13699,'Binary Log Ignore Filter is enabled'),(594,1,1492239623,0,13,'0','10.96.196.127',13700,'Binary Log is disabled'),(595,1,1492239623,0,13,'0','10.96.196.127',13701,'Binlog format MIXED with filtering'),(596,1,1492239623,0,13,'0','10.96.196.127',13702,'Binlog Statement Cache size too small'),(597,1,1492239623,0,13,'0','10.96.196.127',13703,'Binlog Transaction Cache size too small'),(598,1,1492239623,0,13,'0','10.96.196.127',13704,'Causal Reads is enabled'),(599,1,1492239623,0,13,'0','10.96.196.127',13705,'CEPH critical error'),(600,1,1492239623,0,13,'0','10.96.196.127',13706,'CEPH warning'),(601,1,1492239623,0,13,'0','10.96.196.127',13707,'Character Set of Server is utf8'),(602,1,1492239623,0,13,'0','10.96.196.127',13708,'Cluster Configuration has changed'),(603,1,1492239623,0,13,'0','10.96.196.127',13709,'Cluster is slowed down due to slave lag'),(604,1,1492239623,0,13,'0','10.96.196.127',13710,'Cluster node status'),(605,1,1492239623,0,13,'0','10.96.196.127',13711,'Cluster size is different from expected'),(606,1,1492239623,0,13,'0','10.96.196.127',13712,'Configured max number of opened files is too low on {HOST.NAME}'),(607,1,1492239623,0,13,'0','10.96.196.127',13713,'Configured max number of processes is too low on {HOST.NAME}'),(608,1,1492239623,0,13,'0','10.96.196.127',13714,'CPU interrupt time {HOST.NAME}'),(609,1,1492239623,0,13,'0','10.96.196.127',13715,'Default Storage Engine is not InnoDB'),(610,1,1492239623,0,13,'0','10.96.196.127',13716,'Disk I/O is overloaded on {HOST.NAME}'),(611,1,1492239623,0,13,'0','10.96.196.127',13717,'fpmmm Agent is down'),(612,1,1492239623,0,13,'0','10.96.196.127',13718,'fpmmm MaaS Agent is not sending data'),(613,1,1492239623,0,13,'0','10.96.196.127',13719,'fpmmm MaaS Agent is sending data again'),(614,1,1492239623,0,13,'0','10.96.196.127',13720,'fpmmm Version'),(615,1,1492239623,0,13,'0','10.96.196.127',13721,'General Log is enabled'),(616,1,1492239623,0,13,'0','10.96.196.127',13722,'Host information was changed on {HOST.NAME}'),(617,1,1492239623,0,13,'0','10.96.196.127',13723,'Host information was changed on {HOST.NAME}'),(618,1,1492239623,0,13,'0','10.96.196.127',13724,'InnoDB Buffer Pool Instances is too small'),(619,1,1492239623,0,13,'0','10.96.196.127',13725,'InnoDB Deadlock detected'),(620,1,1492239623,0,13,'0','10.96.196.127',13726,'InnoDB Flush Log at Transaction Commit'),(621,1,1492239623,0,13,'0','10.96.196.127',13727,'InnoDB Flush Method has changed'),(622,1,1492239623,0,13,'0','10.96.196.127',13728,'InnoDB Force Recovery is enabled'),(623,1,1492239623,0,13,'0','10.96.196.127',13729,'InnoDB Foreign Key error detected'),(624,1,1492239623,0,13,'0','10.96.196.127',13730,'InnoDB Log Buffer too small'),(625,1,1492239623,0,13,'0','10.96.196.127',13731,'InnoDB Log File size is too small'),(626,1,1492239623,0,13,'0','10.96.196.127',13732,'InnoDB Log File size is too small'),(627,1,1492239623,0,13,'0','10.96.196.127',13733,'InnoDB Plugin is enabled'),(628,1,1492239623,0,13,'0','10.96.196.127',13734,'IO thread stopped'),(629,1,1492239623,0,13,'0','10.96.196.127',13735,'Lack of available memory on server {HOST.NAME}'),(630,1,1492239623,0,13,'0','10.96.196.127',13736,'Lack of free memory on server {HOST.NAME}'),(631,1,1492239623,0,13,'0','10.96.196.127',13737,'Lack of free swap space on {HOST.NAME}'),(632,1,1492239623,0,13,'0','10.96.196.127',13738,'Less than 5% free in the value cache'),(633,1,1492239623,0,13,'0','10.96.196.127',13739,'Less than 25% free in the configuration cache'),(634,1,1492239623,0,13,'0','10.96.196.127',13740,'Less than 25% free in the configuration cache'),(635,1,1492239623,0,13,'0','10.96.196.127',13741,'Less than 25% free in the history cache'),(636,1,1492239623,0,13,'0','10.96.196.127',13742,'Less than 25% free in the history cache'),(637,1,1492239623,0,13,'0','10.96.196.127',13743,'Less than 25% free in the history index cache'),(638,1,1492239623,0,13,'0','10.96.196.127',13744,'Less than 25% free in the text history cache'),(639,1,1492239623,0,13,'0','10.96.196.127',13745,'Less than 25% free in the trends cache'),(640,1,1492239623,0,13,'0','10.96.196.127',13746,'Less than 25% free in the vmware cache'),(641,1,1492239623,0,13,'0','10.96.196.127',13747,'Log Output is other than File'),(642,1,1492239623,0,13,'0','10.96.196.127',13748,'Log Queries not using Indexes is disabled'),(643,1,1492239623,0,13,'0','10.96.196.127',13749,'Low free disk space'),(644,1,1492239623,0,13,'0','10.96.196.127',13750,'Low free disk space'),(645,1,1492239623,0,13,'0','10.96.196.127',13751,'More than 100 items having missing data for more than 10 minutes'),(646,1,1492239623,0,13,'0','10.96.196.127',13752,'More than 100 items having missing data for more than 10 minutes'),(647,1,1492239623,0,13,'0','10.96.196.127',13753,'MySQL is down'),(648,1,1492239623,0,13,'0','10.96.196.127',13754,'MySQL is down'),(649,1,1492239623,0,13,'0','10.96.196.127',13755,'MySQL is up again'),(650,1,1492239623,0,13,'0','10.96.196.127',13756,'Node is not ready'),(651,1,1492239623,0,13,'0','10.96.196.127',13757,'nova-novncproxy has  down'),(652,1,1492239623,0,13,'0','10.96.196.127',13758,'Old Binlog Format is still used'),(653,1,1492239623,0,13,'0','10.96.196.127',13759,'Open files high'),(654,1,1492239623,0,13,'0','10.96.196.127',13760,'openstack ceilometer-agent-notification has down'),(655,1,1492239623,0,13,'0','10.96.196.127',13761,'openstack ceilometer-collector has down'),(656,1,1492239623,0,13,'0','10.96.196.127',13762,'openstack ceilometer-polling has down'),(657,1,1492239623,0,13,'0','10.96.196.127',13763,'openstack ceilometer-polling has down'),(658,1,1492239623,0,13,'0','10.96.196.127',13764,'openstack cinder-api has down'),(659,1,1492239623,0,13,'0','10.96.196.127',13765,'openstack cinder-scheduler has down'),(660,1,1492239623,0,13,'0','10.96.196.127',13766,'openstack cinder-volume has down'),(661,1,1492239623,0,13,'0','10.96.196.127',13767,'Openstack cinder process status'),(662,1,1492239623,0,13,'0','10.96.196.127',13768,'Openstack compute service cinder volume'),(663,1,1492239623,0,13,'0','10.96.196.127',13769,'Openstack compute service libvirtd'),(664,1,1492239623,0,13,'0','10.96.196.127',13770,'Openstack compute service neutron l3 agent'),(665,1,1492239623,0,13,'0','10.96.196.127',13771,'Openstack compute service neutron metadata agent'),(666,1,1492239623,0,13,'0','10.96.196.127',13772,'Openstack compute service neutron openvswitch agent'),(667,1,1492239623,0,13,'0','10.96.196.127',13773,'Openstack compute service nova compute'),(668,1,1492239623,0,13,'0','10.96.196.127',13774,'Openstack controller service cinder api'),(669,1,1492239623,0,13,'0','10.96.196.127',13775,'Openstack controller service cinder scheduler'),(670,1,1492239623,0,13,'0','10.96.196.127',13776,'Openstack controller service glance api'),(671,1,1492239623,0,13,'0','10.96.196.127',13777,'Openstack controller service glance registry'),(672,1,1492239623,0,13,'0','10.96.196.127',13778,'Openstack controller service httpd'),(673,1,1492239623,0,13,'0','10.96.196.127',13779,'Openstack controller service memcached'),(674,1,1492239623,0,13,'0','10.96.196.127',13780,'Openstack controller service neutron dhcp agent'),(675,1,1492239623,0,13,'0','10.96.196.127',13781,'Openstack controller service neutron l3 agent'),(676,1,1492239623,0,13,'0','10.96.196.127',13782,'Openstack controller service neutron metadata agent'),(677,1,1492239623,0,13,'0','10.96.196.127',13783,'Openstack controller service neutron openvswitch agent'),(678,1,1492239623,0,13,'0','10.96.196.127',13784,'Openstack controller service neutron server'),(679,1,1492239623,0,13,'0','10.96.196.127',13785,'Openstack controller service nova api'),(680,1,1492239623,0,13,'0','10.96.196.127',13786,'Openstack controller service nova cert'),(681,1,1492239623,0,13,'0','10.96.196.127',13787,'Openstack controller service nova conductor'),(682,1,1492239623,0,13,'0','10.96.196.127',13788,'Openstack controller service nova consoleauth'),(683,1,1492239623,0,13,'0','10.96.196.127',13789,'Openstack controller service nova novncproxy'),(684,1,1492239623,0,13,'0','10.96.196.127',13790,'Openstack controller service nova scheduler'),(685,1,1492239623,0,13,'0','10.96.196.127',13791,'openstack glance-api has down'),(686,1,1492239623,0,13,'0','10.96.196.127',13792,'openstack glance-registry has down'),(687,1,1492239623,0,13,'0','10.96.196.127',13793,'Openstack haproxy has down'),(688,1,1492239623,0,13,'0','10.96.196.127',13794,'openstack httpd has down'),(689,1,1492239623,0,13,'0','10.96.196.127',13795,'openstack httpd has down'),(690,1,1492239623,0,13,'0','10.96.196.127',13796,'openstack libvirtd has down'),(691,1,1492239623,0,13,'0','10.96.196.127',13797,'openstack memcached has down'),(692,1,1492239623,0,13,'0','10.96.196.127',13798,'openstack mysqld has down'),(693,1,1492239623,0,13,'0','10.96.196.127',13799,'openstack neutron-dhcp-agent has down'),(694,1,1492239623,0,13,'0','10.96.196.127',13800,'openstack neutron-l3-agent has down'),(695,1,1492239623,0,13,'0','10.96.196.127',13801,'openstack neutron-l3-agent has down'),(696,1,1492239623,0,13,'0','10.96.196.127',13802,'openstack neutron-lbaasv2-agent has down'),(697,1,1492239623,0,13,'0','10.96.196.127',13803,'openstack  neutron-metadata-agent has down'),(698,1,1492239623,0,13,'0','10.96.196.127',13804,'openstack neutron-openvswitch-agent has down'),(699,1,1492239623,0,13,'0','10.96.196.127',13805,'openstack neutron-openvswitch-agent has down'),(700,1,1492239623,0,13,'0','10.96.196.127',13806,'openstack neutron-server has down'),(701,1,1492239623,0,13,'0','10.96.196.127',13807,'Openstack neutron process status'),(702,1,1492239623,0,13,'0','10.96.196.127',13808,'openstack nova-api has down'),(703,1,1492239623,0,13,'0','10.96.196.127',13809,'openstack nova-cert has down'),(704,1,1492239623,0,13,'0','10.96.196.127',13810,'openstack nova-compute has down'),(705,1,1492239623,0,13,'0','10.96.196.127',13811,'openstack nova-conductor has down'),(706,1,1492239623,0,13,'0','10.96.196.127',13812,'openstack nova-consoleauth has down'),(707,1,1492239623,0,13,'0','10.96.196.127',13813,'openstack nova-novncproxy has down'),(708,1,1492239623,0,13,'0','10.96.196.127',13814,'openstack nova-scheduler has down'),(709,1,1492239623,0,13,'0','10.96.196.127',13815,'Openstack nova process status'),(710,1,1492239623,0,13,'0','10.96.196.127',13816,'openstack ntpd has down'),(711,1,1492239623,0,13,'0','10.96.196.127',13817,'openstack openvswitch has down'),(712,1,1492239623,0,13,'0','10.96.196.127',13818,'openstack rabbitmq-server has down'),(713,1,1492239623,0,13,'0','10.96.196.127',13819,'Openstack service haproxy has down'),(714,1,1492239623,0,13,'0','10.96.196.127',13820,'Openstack service keepalived has down'),(715,1,1492239623,0,13,'0','10.96.196.127',13821,'openstack xinetd has down'),(716,1,1492239623,0,13,'0','10.96.196.127',13822,'Processor load is too high on(5min)  {HOST.NAME}'),(717,1,1492239623,0,13,'0','10.96.196.127',13823,'Processor load is too high on (15min){HOST.NAME}'),(718,1,1492239623,0,13,'0','10.96.196.127',13824,'Processor load is too high on {HOST.NAME}'),(719,1,1492239623,0,13,'0','10.96.196.127',13825,'Processor load is too high on {HOST.NAME}'),(720,1,1492239623,0,13,'0','10.96.196.127',13826,'Read buffer size is bigger than max. allowed packet size'),(721,1,1492239623,0,13,'0','10.96.196.127',13827,'Slave errors are skipped!'),(722,1,1492239623,0,13,'0','10.96.196.127',13828,'Slave is NOT read only'),(723,1,1492239623,0,13,'0','10.96.196.127',13829,'Slave lagging behind Master'),(724,1,1492239623,0,13,'0','10.96.196.127',13830,'Slave lagging behind Master'),(725,1,1492239623,0,13,'0','10.96.196.127',13831,'Sort buffer possibly missconfigured'),(726,1,1492239623,0,13,'0','10.96.196.127',13832,'SQL thread stopped'),(727,1,1492239623,0,13,'0','10.96.196.127',13833,'SSH service is down on {HOST.NAME}'),(728,1,1492239623,0,13,'0','10.96.196.127',13834,'Sync Binlog is enabled'),(729,1,1492239623,0,13,'0','10.96.196.127',13835,'Table definition cache too small'),(730,1,1492239623,0,13,'0','10.96.196.127',13836,'Table open cache too small'),(731,1,1492239623,0,13,'0','10.96.196.127',13837,'Thread stack size is possibly too small'),(732,1,1492239623,0,13,'0','10.96.196.127',13838,'Thread stack size is too small'),(733,1,1492239623,0,13,'0','10.96.196.127',13839,'Too little Slave Threads'),(734,1,1492239623,0,13,'0','10.96.196.127',13840,'Too many processes on {HOST.NAME}'),(735,1,1492239623,0,13,'0','10.96.196.127',13841,'Transaction isolation level is set to non-default value'),(736,1,1492239623,0,13,'0','10.96.196.127',13842,'Transaction isolation level is set to non-recommended value'),(737,1,1492239623,0,13,'0','10.96.196.127',13843,'Very low free disk space'),(738,1,1492239623,0,13,'0','10.96.196.127',13844,'Very low free disk space'),(739,1,1492239623,0,13,'0','10.96.196.127',13845,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(740,1,1492239623,0,13,'0','10.96.196.127',13846,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(741,1,1492239623,0,13,'0','10.96.196.127',13847,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(742,1,1492239623,0,13,'0','10.96.196.127',13848,'Zabbix alerter processes more than 75% busy'),(743,1,1492239623,0,13,'0','10.96.196.127',13849,'Zabbix configuration syncer processes more than 75% busy'),(744,1,1492239623,0,13,'0','10.96.196.127',13850,'Zabbix configuration syncer processes more than 75% busy'),(745,1,1492239623,0,13,'0','10.96.196.127',13851,'Zabbix data sender processes more than 75% busy'),(746,1,1492239623,0,13,'0','10.96.196.127',13852,'Zabbix db watchdog processes more than 75% busy'),(747,1,1492239623,0,13,'0','10.96.196.127',13853,'Zabbix discoverer processes more than 75% busy'),(748,1,1492239623,0,13,'0','10.96.196.127',13854,'Zabbix discoverer processes more than 75% busy'),(749,1,1492239623,0,13,'0','10.96.196.127',13855,'Zabbix escalator processes more than 75% busy'),(750,1,1492239623,0,13,'0','10.96.196.127',13856,'Zabbix heartbeat sender processes more than 75% busy'),(751,1,1492239623,0,13,'0','10.96.196.127',13857,'Zabbix history syncer processes more than 75% busy'),(752,1,1492239623,0,13,'0','10.96.196.127',13858,'Zabbix history syncer processes more than 75% busy'),(753,1,1492239623,0,13,'0','10.96.196.127',13859,'Zabbix housekeeper processes more than 75% busy'),(754,1,1492239623,0,13,'0','10.96.196.127',13860,'Zabbix housekeeper processes more than 75% busy'),(755,1,1492239623,0,13,'0','10.96.196.127',13861,'Zabbix http poller processes more than 75% busy'),(756,1,1492239623,0,13,'0','10.96.196.127',13862,'Zabbix http poller processes more than 75% busy'),(757,1,1492239623,0,13,'0','10.96.196.127',13863,'Zabbix icmp pinger processes more than 75% busy'),(758,1,1492239623,0,13,'0','10.96.196.127',13864,'Zabbix icmp pinger processes more than 75% busy'),(759,1,1492239623,0,13,'0','10.96.196.127',13865,'Zabbix ipmi poller processes more than 75% busy'),(760,1,1492239623,0,13,'0','10.96.196.127',13866,'Zabbix ipmi poller processes more than 75% busy'),(761,1,1492239623,0,13,'0','10.96.196.127',13867,'Zabbix java poller processes more than 75% busy'),(762,1,1492239623,0,13,'0','10.96.196.127',13868,'Zabbix java poller processes more than 75% busy'),(763,1,1492239623,0,13,'0','10.96.196.127',13869,'Zabbix poller processes more than 75% busy'),(764,1,1492239623,0,13,'0','10.96.196.127',13870,'Zabbix poller processes more than 75% busy'),(765,1,1492239623,0,13,'0','10.96.196.127',13871,'Zabbix proxy poller processes more than 75% busy'),(766,1,1492239623,0,13,'0','10.96.196.127',13872,'Zabbix self-monitoring processes more than 75% busy'),(767,1,1492239623,0,13,'0','10.96.196.127',13873,'Zabbix self-monitoring processes more than 75% busy'),(768,1,1492239623,0,13,'0','10.96.196.127',13874,'Zabbix snmp trapper processes more than 75% busy'),(769,1,1492239623,0,13,'0','10.96.196.127',13875,'Zabbix snmp trapper processes more than 75% busy'),(770,1,1492239623,0,13,'0','10.96.196.127',13876,'Zabbix timer processes more than 75% busy'),(771,1,1492239623,0,13,'0','10.96.196.127',13877,'Zabbix trapper processes more than 75% busy'),(772,1,1492239623,0,13,'0','10.96.196.127',13878,'Zabbix trapper processes more than 75% busy'),(773,1,1492239623,0,13,'0','10.96.196.127',13879,'Zabbix unreachable poller processes more than 75% busy'),(774,1,1492239623,0,13,'0','10.96.196.127',13880,'Zabbix unreachable poller processes more than 75% busy'),(775,1,1492239623,0,13,'0','10.96.196.127',13881,'Zabbix value cache working in low memory mode'),(776,1,1492239623,0,13,'0','10.96.196.127',13882,'Zabbix vmware collector processes more than 75% busy'),(777,1,1492239623,0,13,'0','10.96.196.127',13883,'{HOST.NAME} has just been restarted'),(778,1,1492239623,0,13,'0','10.96.196.127',13884,'{HOST.NAME} has just been restarted'),(779,1,1492239823,2,13,'0','10.96.196.127',13774,'Openstack controller service cinder api'),(780,1,1492239823,2,13,'0','10.96.196.127',13775,'Openstack controller service cinder scheduler'),(781,1,1492239823,2,13,'0','10.96.196.127',13776,'Openstack controller service glance api'),(782,1,1492239823,2,13,'0','10.96.196.127',13777,'Openstack controller service glance registry'),(783,1,1492239823,2,13,'0','10.96.196.127',13778,'Openstack controller service httpd'),(784,1,1492239823,2,13,'0','10.96.196.127',13779,'Openstack controller service memcached'),(785,1,1492239823,2,13,'0','10.96.196.127',13780,'Openstack controller service neutron dhcp agent'),(786,1,1492239823,2,13,'0','10.96.196.127',13781,'Openstack controller service neutron l3 agent'),(787,1,1492239823,2,13,'0','10.96.196.127',13782,'Openstack controller service neutron metadata agent'),(788,1,1492239823,2,13,'0','10.96.196.127',13783,'Openstack controller service neutron openvswitch agent'),(789,1,1492239823,2,13,'0','10.96.196.127',13784,'Openstack controller service neutron server'),(790,1,1492239823,2,13,'0','10.96.196.127',13785,'Openstack controller service nova api'),(791,1,1492239823,2,13,'0','10.96.196.127',13786,'Openstack controller service nova cert'),(792,1,1492239823,2,13,'0','10.96.196.127',13787,'Openstack controller service nova conductor'),(793,1,1492239823,2,13,'0','10.96.196.127',13788,'Openstack controller service nova consoleauth'),(794,1,1492239823,2,13,'0','10.96.196.127',13789,'Openstack controller service nova novncproxy'),(795,1,1492239823,2,13,'0','10.96.196.127',13790,'Openstack controller service nova scheduler'),(796,1,1492239823,2,13,'0','10.96.196.127',13793,'Openstack haproxy has down'),(797,1,1492239823,2,15,'Item [openstack.serviceexist[haproxy]] [23917] Host [Template App Openstack Controller ServiceExist]','10.96.196.127',0,''),(798,1,1492239823,2,15,'Item [openstack.serviceexist[httpd]] [23918] Host [Template App Openstack Controller ServiceExist]','10.96.196.127',0,''),(799,1,1492239823,2,15,'Item [openstack.serviceexist[memcached]] [23919] Host [Template App Openstack Controller ServiceExist]','10.96.196.127',0,''),(800,1,1492239823,2,15,'Item [openstack.serviceexist[neutron-dhcp-agent]] [23920] Host [Template App Openstack Controller ServiceExist]','10.96.196.127',0,''),(801,1,1492239823,2,15,'Item [openstack.serviceexist[neutron-l3-agent]] [23921] Host [Template App Openstack Controller ServiceExist]','10.96.196.127',0,''),(802,1,1492239823,2,15,'Item [openstack.serviceexist[neutron-metadata-agent]] [23922] Host [Template App Openstack Controller ServiceExist]','10.96.196.127',0,''),(803,1,1492239823,2,15,'Item [openstack.serviceexist[neutron-openvswitch-agent]] [23923] Host [Template App Openstack Controller ServiceExist]','10.96.196.127',0,''),(804,1,1492239823,2,15,'Item [openstack.serviceexist[ neutron-server]] [23924] Host [Template App Openstack Controller ServiceExist]','10.96.196.127',0,''),(805,1,1492239823,2,15,'Item [openstack.serviceexist[openstack-cinder-api]] [23925] Host [Template App Openstack Controller ServiceExist]','10.96.196.127',0,''),(806,1,1492239823,2,15,'Item [openstack.serviceexist[openstack-cinder-scheduler]] [23926] Host [Template App Openstack Controller ServiceExist]','10.96.196.127',0,''),(807,1,1492239823,2,15,'Item [openstack.serviceexist[openstack-glance-api]] [23927] Host [Template App Openstack Controller ServiceExist]','10.96.196.127',0,''),(808,1,1492239823,2,15,'Item [openstack.serviceexist[openstack-glance-registry]] [23928] Host [Template App Openstack Controller ServiceExist]','10.96.196.127',0,''),(809,1,1492239823,2,15,'Item [openstack.serviceexist[openstack-nova-api]] [23929] Host [Template App Openstack Controller ServiceExist]','10.96.196.127',0,''),(810,1,1492239823,2,15,'Item [openstack.serviceexist[openstack-nova-cert]] [23930] Host [Template App Openstack Controller ServiceExist]','10.96.196.127',0,''),(811,1,1492239823,2,15,'Item [openstack.serviceexist[openstack-nova-conductor]] [23931] Host [Template App Openstack Controller ServiceExist]','10.96.196.127',0,''),(812,1,1492239823,2,15,'Item [openstack.serviceexist[openstack-nova-consoleauth]] [23932] Host [Template App Openstack Controller ServiceExist]','10.96.196.127',0,''),(813,1,1492239823,2,15,'Item [openstack.serviceexist[openstack-nova-novncproxy]] [23933] Host [Template App Openstack Controller ServiceExist]','10.96.196.127',0,''),(814,1,1492239823,2,15,'Item [openstack.serviceexist[openstack-nova-scheduler]] [23934] Host [Template App Openstack Controller ServiceExist]','10.96.196.127',0,''),(815,1,1492253247,1,0,'User alias [Admin] name [Zabbix] surname [Administrator]','10.96.206.88',0,''),(816,1,1492253334,1,5,'Name: Send E-mail','10.96.206.88',0,''),(817,1,1492253469,1,5,'Name: Auto registration:compute','10.96.206.88',0,''),(818,1,1492253517,1,5,'Name: Auto registration:controller','10.96.206.88',0,''),(819,1,1492253597,1,5,'Name: Auto registration:ceph','10.96.206.88',0,''),(820,1,1492253616,1,5,'Name: Auto registration:compute','10.96.206.88',0,''),(821,1,1497494728,3,0,'0','10.103.197.133',1,''),(822,1,1497494766,1,3,'Media type [Wechat]','10.103.197.133',0,''),(823,1,1497494914,0,3,'Media type [Email-163]','10.103.197.133',0,''),(824,1,1497494999,0,5,'Name: send email by 163','10.103.197.133',0,''),(825,1,1497495040,1,5,'Name: Auto registration:compute','10.103.197.133',0,''),(826,1,1497495054,1,5,'Name: Auto registration:controller','10.103.197.133',0,''),(827,1,1497495076,1,5,'Name: Auto registration:ceph','10.103.197.133',0,''),(828,1,1497495083,1,5,'Name: Auto registration:agent','10.103.197.133',0,''),(829,1,1497495087,1,5,' Actions [8] enabled','10.103.197.133',0,''),(830,1,1497495088,1,5,' Actions [9] enabled','10.103.197.133',0,''),(831,1,1497495088,1,5,' Actions [10] enabled','10.103.197.133',0,''),(832,1,1497495125,1,0,'User alias [Admin] name [Zabbix] surname [Administrator]','10.103.197.133',0,''),(833,1,1497495153,2,13,'0','10.103.197.133',13697,'Auto Increment Control is disabled'),(834,1,1497495153,2,13,'0','10.103.197.133',13698,'Binary Log Do Filter is enabled'),(835,1,1497495153,2,13,'0','10.103.197.133',13699,'Binary Log Ignore Filter is enabled'),(836,1,1497495153,2,13,'0','10.103.197.133',13700,'Binary Log is disabled'),(837,1,1497495153,2,13,'0','10.103.197.133',13701,'Binlog format MIXED with filtering'),(838,1,1497495153,2,13,'0','10.103.197.133',13702,'Binlog Statement Cache size too small'),(839,1,1497495153,2,13,'0','10.103.197.133',13703,'Binlog Transaction Cache size too small'),(840,1,1497495153,2,13,'0','10.103.197.133',13704,'Causal Reads is enabled'),(841,1,1497495153,2,13,'0','10.103.197.133',13707,'Character Set of Server is utf8'),(842,1,1497495153,2,13,'0','10.103.197.133',13708,'Cluster Configuration has changed'),(843,1,1497495153,2,13,'0','10.103.197.133',13709,'Cluster is slowed down due to slave lag'),(844,1,1497495153,2,13,'0','10.103.197.133',13710,'Cluster node status'),(845,1,1497495153,2,13,'0','10.103.197.133',13711,'Cluster size is different from expected'),(846,1,1497495153,2,13,'0','10.103.197.133',13715,'Default Storage Engine is not InnoDB'),(847,1,1497495153,2,13,'0','10.103.197.133',13717,'fpmmm Agent is down'),(848,1,1497495153,2,13,'0','10.103.197.133',13718,'fpmmm MaaS Agent is not sending data'),(849,1,1497495153,2,13,'0','10.103.197.133',13719,'fpmmm MaaS Agent is sending data again'),(850,1,1497495153,2,13,'0','10.103.197.133',13720,'fpmmm Version'),(851,1,1497495153,2,13,'0','10.103.197.133',13721,'General Log is enabled'),(852,1,1497495153,2,13,'0','10.103.197.133',13724,'InnoDB Buffer Pool Instances is too small'),(853,1,1497495153,2,13,'0','10.103.197.133',13725,'InnoDB Deadlock detected'),(854,1,1497495153,2,13,'0','10.103.197.133',13726,'InnoDB Flush Log at Transaction Commit'),(855,1,1497495153,2,13,'0','10.103.197.133',13727,'InnoDB Flush Method has changed'),(856,1,1497495153,2,13,'0','10.103.197.133',13728,'InnoDB Force Recovery is enabled'),(857,1,1497495153,2,13,'0','10.103.197.133',13729,'InnoDB Foreign Key error detected'),(858,1,1497495153,2,13,'0','10.103.197.133',13730,'InnoDB Log Buffer too small'),(859,1,1497495153,2,13,'0','10.103.197.133',13731,'InnoDB Log File size is too small'),(860,1,1497495153,2,13,'0','10.103.197.133',13732,'InnoDB Log File size is too small'),(861,1,1497495153,2,13,'0','10.103.197.133',13733,'InnoDB Plugin is enabled'),(862,1,1497495153,2,13,'0','10.103.197.133',13734,'IO thread stopped'),(863,1,1497495153,2,13,'0','10.103.197.133',13747,'Log Output is other than File'),(864,1,1497495153,2,13,'0','10.103.197.133',13748,'Log Queries not using Indexes is disabled'),(865,1,1497495153,2,13,'0','10.103.197.133',13749,'Low free disk space'),(866,1,1497495153,2,13,'0','10.103.197.133',13750,'Low free disk space'),(867,1,1497495153,2,13,'0','10.103.197.133',13754,'MySQL is down'),(868,1,1497495153,2,13,'0','10.103.197.133',13755,'MySQL is up again'),(869,1,1497495153,2,13,'0','10.103.197.133',13756,'Node is not ready'),(870,1,1497495153,2,13,'0','10.103.197.133',13758,'Old Binlog Format is still used'),(871,1,1497495153,2,13,'0','10.103.197.133',13759,'Open files high'),(872,1,1497495153,2,13,'0','10.103.197.133',13826,'Read buffer size is bigger than max. allowed packet size'),(873,1,1497495153,2,13,'0','10.103.197.133',13827,'Slave errors are skipped!'),(874,1,1497495153,2,13,'0','10.103.197.133',13828,'Slave is NOT read only'),(875,1,1497495153,2,13,'0','10.103.197.133',13829,'Slave lagging behind Master'),(876,1,1497495153,2,13,'0','10.103.197.133',13830,'Slave lagging behind Master'),(877,1,1497495153,2,13,'0','10.103.197.133',13831,'Sort buffer possibly missconfigured'),(878,1,1497495153,2,13,'0','10.103.197.133',13832,'SQL thread stopped'),(879,1,1497495153,2,13,'0','10.103.197.133',13834,'Sync Binlog is enabled'),(880,1,1497495153,2,13,'0','10.103.197.133',13835,'Table definition cache too small'),(881,1,1497495153,2,13,'0','10.103.197.133',13836,'Table open cache too small'),(882,1,1497495153,2,13,'0','10.103.197.133',13837,'Thread stack size is possibly too small'),(883,1,1497495153,2,13,'0','10.103.197.133',13838,'Thread stack size is too small'),(884,1,1497495153,2,13,'0','10.103.197.133',13839,'Too little Slave Threads'),(885,1,1497495153,2,13,'0','10.103.197.133',13841,'Transaction isolation level is set to non-default value'),(886,1,1497495153,2,13,'0','10.103.197.133',13842,'Transaction isolation level is set to non-recommended value'),(887,1,1497495153,2,13,'0','10.103.197.133',13843,'Very low free disk space'),(888,1,1497495153,2,13,'0','10.103.197.133',13844,'Very low free disk space'),(889,1,1497495153,2,4,'0','10.103.197.133',10129,'Template_FromDual.MySQL.aria'),(890,1,1497495153,2,4,'0','10.103.197.133',10130,'Template_FromDual.MySQL.fpmmm'),(891,1,1497495153,2,4,'0','10.103.197.133',10131,'Template_FromDual.MySQL.galera'),(892,1,1497495153,2,4,'0','10.103.197.133',10132,'Template_FromDual.MySQL.innodb'),(893,1,1497495153,2,4,'0','10.103.197.133',10133,'Template_FromDual.MySQL.master'),(894,1,1497495153,2,4,'0','10.103.197.133',10134,'Template_FromDual.MySQL.mysql'),(895,1,1497495153,2,4,'0','10.103.197.133',10135,'Template_FromDual.MySQL.process'),(896,1,1497495153,2,4,'0','10.103.197.133',10136,'Template_FromDual.MySQL.security'),(897,1,1497495153,2,4,'0','10.103.197.133',10137,'Template_FromDual.MySQL.server'),(898,1,1497495153,2,4,'0','10.103.197.133',10138,'Template_FromDual.MySQL.slave'),(899,1,1497495170,1,15,'0','10.103.197.133',23851,'compute node: neutron-dhcp-agent'),(900,1,1497495173,1,15,'0','10.103.197.133',23852,'compute node: neutron-l3-agent'),(901,1,1497495177,1,15,'0','10.103.197.133',23853,'compute node: neutron-metadata-agent'),(902,1,1497495187,1,15,'0','10.103.197.133',23856,'compute node: openstack-cinder-volume'),(903,1,1497495227,1,5,'Name: Auto registration:compute','10.103.197.133',0,''),(904,1,1497495242,1,5,'Name: Auto registration:controller','10.103.197.133',0,''),(905,1,1497496729,1,13,'0','10.103.197.133',13467,'Zabbix alerter processes more than 75% busy'),(906,1,1497496729,1,13,'0','10.103.197.133',13468,'Zabbix configuration syncer processes more than 75% busy'),(907,1,1497496729,1,13,'0','10.103.197.133',13469,'Zabbix db watchdog processes more than 75% busy'),(908,1,1497496729,1,13,'0','10.103.197.133',13470,'Zabbix discoverer processes more than 75% busy'),(909,1,1497496729,1,13,'0','10.103.197.133',13471,'Zabbix escalator processes more than 75% busy'),(910,1,1497496729,1,13,'0','10.103.197.133',13472,'Zabbix history syncer processes more than 75% busy'),(911,1,1497496729,1,13,'0','10.103.197.133',13473,'Zabbix housekeeper processes more than 75% busy'),(912,1,1497496729,1,13,'0','10.103.197.133',13474,'Zabbix http poller processes more than 75% busy'),(913,1,1497496729,1,13,'0','10.103.197.133',13475,'Zabbix icmp pinger processes more than 75% busy'),(914,1,1497496729,1,13,'0','10.103.197.133',13476,'Zabbix ipmi poller processes more than 75% busy'),(915,1,1497496729,1,13,'0','10.103.197.133',13477,'Zabbix java poller processes more than 75% busy'),(916,1,1497496729,1,13,'0','10.103.197.133',13479,'Zabbix poller processes more than 75% busy'),(917,1,1497496729,1,13,'0','10.103.197.133',13480,'Zabbix proxy poller processes more than 75% busy'),(918,1,1497496729,1,13,'0','10.103.197.133',13481,'Zabbix self-monitoring processes more than 75% busy'),(919,1,1497496729,1,13,'0','10.103.197.133',13482,'Zabbix snmp trapper processes more than 75% busy'),(920,1,1497496729,1,13,'0','10.103.197.133',13483,'Zabbix timer processes more than 75% busy'),(921,1,1497496729,1,13,'0','10.103.197.133',13484,'Zabbix trapper processes more than 75% busy'),(922,1,1497496729,1,13,'0','10.103.197.133',13485,'Zabbix unreachable poller processes more than 75% busy'),(923,1,1497496729,1,13,'0','10.103.197.133',13436,'Zabbix vmware collector processes more than 75% busy'),(924,1,1497496729,1,13,'0','10.103.197.133',13486,'More than 100 items having missing data for more than 10 minutes'),(925,1,1497496729,1,13,'0','10.103.197.133',13487,'Less than 25% free in the configuration cache'),(926,1,1497496729,1,13,'0','10.103.197.133',13075,'Less than 5% free in the value cache'),(927,1,1497496729,1,13,'0','10.103.197.133',13558,'Zabbix value cache working in low memory mode'),(928,1,1497496729,1,13,'0','10.103.197.133',13537,'Less than 25% free in the vmware cache'),(929,1,1497496729,1,13,'0','10.103.197.133',13488,'Less than 25% free in the history cache'),(930,1,1497496729,1,13,'0','10.103.197.133',13489,'Less than 25% free in the history index cache'),(931,1,1497496729,1,13,'0','10.103.197.133',13490,'Less than 25% free in the trends cache');
/*!40000 ALTER TABLE `auditlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditlog_details`
--

DROP TABLE IF EXISTS `auditlog_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditlog_details` (
  `auditdetailid` bigint(20) unsigned NOT NULL,
  `auditid` bigint(20) unsigned NOT NULL,
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `field_name` varchar(64) NOT NULL DEFAULT '',
  `oldvalue` text NOT NULL,
  `newvalue` text NOT NULL,
  PRIMARY KEY (`auditdetailid`),
  KEY `auditlog_details_1` (`auditid`),
  CONSTRAINT `c_auditlog_details_1` FOREIGN KEY (`auditid`) REFERENCES `auditlog` (`auditid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditlog_details`
--

LOCK TABLES `auditlog_details` WRITE;
/*!40000 ALTER TABLE `auditlog_details` DISABLE KEYS */;
INSERT INTO `auditlog_details` VALUES (1,899,'items','status','0','1'),(2,900,'items','status','0','1'),(3,901,'items','status','0','1'),(4,902,'items','status','0','1'),(5,905,'','templateid','0','13848'),(6,906,'','templateid','0','13850'),(7,907,'','templateid','0','13852'),(8,908,'','status','0','1'),(9,908,'','templateid','0','13854'),(10,909,'','templateid','0','13855'),(11,910,'','templateid','0','13858'),(12,911,'','templateid','0','13860'),(13,912,'','templateid','0','13862'),(14,913,'','templateid','0','13864'),(15,914,'','templateid','0','13866'),(16,915,'','templateid','0','13868'),(17,916,'','templateid','0','13870'),(18,917,'','templateid','0','13871'),(19,918,'','templateid','0','13873'),(20,919,'','templateid','0','13875'),(21,920,'','templateid','0','13876'),(22,921,'','templateid','0','13878'),(23,922,'','templateid','0','13880'),(24,923,'','templateid','0','13882'),(25,924,'','templateid','0','13752'),(26,925,'','templateid','0','13740'),(27,926,'','templateid','0','13738'),(28,927,'','templateid','0','13881'),(29,928,'','templateid','0','13746'),(30,929,'','templateid','0','13742'),(31,930,'','templateid','0','13743'),(32,931,'','templateid','0','13745');
/*!40000 ALTER TABLE `auditlog_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autoreg_host`
--

DROP TABLE IF EXISTS `autoreg_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autoreg_host` (
  `autoreg_hostid` bigint(20) unsigned NOT NULL,
  `proxy_hostid` bigint(20) unsigned DEFAULT NULL,
  `host` varchar(64) NOT NULL DEFAULT '',
  `listen_ip` varchar(39) NOT NULL DEFAULT '',
  `listen_port` int(11) NOT NULL DEFAULT '0',
  `listen_dns` varchar(64) NOT NULL DEFAULT '',
  `host_metadata` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`autoreg_hostid`),
  KEY `autoreg_host_1` (`proxy_hostid`,`host`),
  CONSTRAINT `c_autoreg_host_1` FOREIGN KEY (`proxy_hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autoreg_host`
--

LOCK TABLES `autoreg_host` WRITE;
/*!40000 ALTER TABLE `autoreg_host` DISABLE KEYS */;
/*!40000 ALTER TABLE `autoreg_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conditions`
--

DROP TABLE IF EXISTS `conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conditions` (
  `conditionid` bigint(20) unsigned NOT NULL,
  `actionid` bigint(20) unsigned NOT NULL,
  `conditiontype` int(11) NOT NULL DEFAULT '0',
  `operator` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`conditionid`),
  KEY `conditions_1` (`actionid`),
  CONSTRAINT `c_conditions_1` FOREIGN KEY (`actionid`) REFERENCES `actions` (`actionid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conditions`
--

LOCK TABLES `conditions` WRITE;
/*!40000 ALTER TABLE `conditions` DISABLE KEYS */;
INSERT INTO `conditions` VALUES (2,2,10,0,'0'),(3,2,8,0,'9'),(4,2,12,2,'Linux'),(5,3,16,7,''),(6,3,5,0,'1'),(7,4,23,0,'0'),(8,5,23,0,'2'),(9,6,23,0,'4'),(10,7,16,7,''),(11,7,5,0,'1'),(12,8,24,2,'controller'),(13,9,24,2,'compute'),(14,10,24,2,'agent'),(15,11,16,7,''),(16,11,5,0,'1'),(17,12,16,7,''),(18,12,5,0,'1');
/*!40000 ALTER TABLE `conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `configid` bigint(20) unsigned NOT NULL,
  `refresh_unsupported` int(11) NOT NULL DEFAULT '0',
  `work_period` varchar(100) NOT NULL DEFAULT '1-5,00:00-24:00',
  `alert_usrgrpid` bigint(20) unsigned DEFAULT NULL,
  `event_ack_enable` int(11) NOT NULL DEFAULT '1',
  `event_expire` int(11) NOT NULL DEFAULT '7',
  `event_show_max` int(11) NOT NULL DEFAULT '100',
  `default_theme` varchar(128) NOT NULL DEFAULT 'blue-theme',
  `authentication_type` int(11) NOT NULL DEFAULT '0',
  `ldap_host` varchar(255) NOT NULL DEFAULT '',
  `ldap_port` int(11) NOT NULL DEFAULT '389',
  `ldap_base_dn` varchar(255) NOT NULL DEFAULT '',
  `ldap_bind_dn` varchar(255) NOT NULL DEFAULT '',
  `ldap_bind_password` varchar(128) NOT NULL DEFAULT '',
  `ldap_search_attribute` varchar(128) NOT NULL DEFAULT '',
  `dropdown_first_entry` int(11) NOT NULL DEFAULT '1',
  `dropdown_first_remember` int(11) NOT NULL DEFAULT '1',
  `discovery_groupid` bigint(20) unsigned NOT NULL,
  `max_in_table` int(11) NOT NULL DEFAULT '50',
  `search_limit` int(11) NOT NULL DEFAULT '1000',
  `severity_color_0` varchar(6) NOT NULL DEFAULT '97AAB3',
  `severity_color_1` varchar(6) NOT NULL DEFAULT '7499FF',
  `severity_color_2` varchar(6) NOT NULL DEFAULT 'FFC859',
  `severity_color_3` varchar(6) NOT NULL DEFAULT 'FFA059',
  `severity_color_4` varchar(6) NOT NULL DEFAULT 'E97659',
  `severity_color_5` varchar(6) NOT NULL DEFAULT 'E45959',
  `severity_name_0` varchar(32) NOT NULL DEFAULT 'Not classified',
  `severity_name_1` varchar(32) NOT NULL DEFAULT 'Information',
  `severity_name_2` varchar(32) NOT NULL DEFAULT 'Warning',
  `severity_name_3` varchar(32) NOT NULL DEFAULT 'Average',
  `severity_name_4` varchar(32) NOT NULL DEFAULT 'High',
  `severity_name_5` varchar(32) NOT NULL DEFAULT 'Disaster',
  `ok_period` int(11) NOT NULL DEFAULT '1800',
  `blink_period` int(11) NOT NULL DEFAULT '1800',
  `problem_unack_color` varchar(6) NOT NULL DEFAULT 'DC0000',
  `problem_ack_color` varchar(6) NOT NULL DEFAULT 'DC0000',
  `ok_unack_color` varchar(6) NOT NULL DEFAULT '00AA00',
  `ok_ack_color` varchar(6) NOT NULL DEFAULT '00AA00',
  `problem_unack_style` int(11) NOT NULL DEFAULT '1',
  `problem_ack_style` int(11) NOT NULL DEFAULT '1',
  `ok_unack_style` int(11) NOT NULL DEFAULT '1',
  `ok_ack_style` int(11) NOT NULL DEFAULT '1',
  `snmptrap_logging` int(11) NOT NULL DEFAULT '1',
  `server_check_interval` int(11) NOT NULL DEFAULT '10',
  `hk_events_mode` int(11) NOT NULL DEFAULT '1',
  `hk_events_trigger` int(11) NOT NULL DEFAULT '365',
  `hk_events_internal` int(11) NOT NULL DEFAULT '365',
  `hk_events_discovery` int(11) NOT NULL DEFAULT '365',
  `hk_events_autoreg` int(11) NOT NULL DEFAULT '365',
  `hk_services_mode` int(11) NOT NULL DEFAULT '1',
  `hk_services` int(11) NOT NULL DEFAULT '365',
  `hk_audit_mode` int(11) NOT NULL DEFAULT '1',
  `hk_audit` int(11) NOT NULL DEFAULT '365',
  `hk_sessions_mode` int(11) NOT NULL DEFAULT '1',
  `hk_sessions` int(11) NOT NULL DEFAULT '365',
  `hk_history_mode` int(11) NOT NULL DEFAULT '1',
  `hk_history_global` int(11) NOT NULL DEFAULT '0',
  `hk_history` int(11) NOT NULL DEFAULT '90',
  `hk_trends_mode` int(11) NOT NULL DEFAULT '1',
  `hk_trends_global` int(11) NOT NULL DEFAULT '0',
  `hk_trends` int(11) NOT NULL DEFAULT '365',
  `default_inventory_mode` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`configid`),
  KEY `config_1` (`alert_usrgrpid`),
  KEY `config_2` (`discovery_groupid`),
  CONSTRAINT `c_config_2` FOREIGN KEY (`discovery_groupid`) REFERENCES `groups` (`groupid`),
  CONSTRAINT `c_config_1` FOREIGN KEY (`alert_usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,600,'1-5,09:00-18:00;',7,1,7,100,'blue-theme',0,'',389,'','','','',1,1,5,50,1000,'97AAB3','7499FF','FFC859','FFA059','E97659','E45959','Not classified','Information','Warning','Average','High','Disaster',1800,1800,'DC0000','DC0000','00AA00','00AA00',1,1,1,1,1,10,1,365,365,365,365,1,365,1,365,1,365,1,0,90,1,0,365,-1);
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbversion`
--

DROP TABLE IF EXISTS `dbversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbversion` (
  `mandatory` int(11) NOT NULL DEFAULT '0',
  `optional` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbversion`
--

LOCK TABLES `dbversion` WRITE;
/*!40000 ALTER TABLE `dbversion` DISABLE KEYS */;
INSERT INTO `dbversion` VALUES (3000000,3000000);
/*!40000 ALTER TABLE `dbversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dchecks`
--

DROP TABLE IF EXISTS `dchecks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dchecks` (
  `dcheckid` bigint(20) unsigned NOT NULL,
  `druleid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `key_` varchar(255) NOT NULL DEFAULT '',
  `snmp_community` varchar(255) NOT NULL DEFAULT '',
  `ports` varchar(255) NOT NULL DEFAULT '0',
  `snmpv3_securityname` varchar(64) NOT NULL DEFAULT '',
  `snmpv3_securitylevel` int(11) NOT NULL DEFAULT '0',
  `snmpv3_authpassphrase` varchar(64) NOT NULL DEFAULT '',
  `snmpv3_privpassphrase` varchar(64) NOT NULL DEFAULT '',
  `uniq` int(11) NOT NULL DEFAULT '0',
  `snmpv3_authprotocol` int(11) NOT NULL DEFAULT '0',
  `snmpv3_privprotocol` int(11) NOT NULL DEFAULT '0',
  `snmpv3_contextname` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`dcheckid`),
  KEY `dchecks_1` (`druleid`),
  CONSTRAINT `c_dchecks_1` FOREIGN KEY (`druleid`) REFERENCES `drules` (`druleid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dchecks`
--

LOCK TABLES `dchecks` WRITE;
/*!40000 ALTER TABLE `dchecks` DISABLE KEYS */;
INSERT INTO `dchecks` VALUES (2,2,9,'system.uname','','10050','',0,'','',0,0,0,'');
/*!40000 ALTER TABLE `dchecks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dhosts`
--

DROP TABLE IF EXISTS `dhosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dhosts` (
  `dhostid` bigint(20) unsigned NOT NULL,
  `druleid` bigint(20) unsigned NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `lastup` int(11) NOT NULL DEFAULT '0',
  `lastdown` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dhostid`),
  KEY `dhosts_1` (`druleid`),
  CONSTRAINT `c_dhosts_1` FOREIGN KEY (`druleid`) REFERENCES `drules` (`druleid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dhosts`
--

LOCK TABLES `dhosts` WRITE;
/*!40000 ALTER TABLE `dhosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `dhosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drules`
--

DROP TABLE IF EXISTS `drules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drules` (
  `druleid` bigint(20) unsigned NOT NULL,
  `proxy_hostid` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `iprange` varchar(2048) NOT NULL DEFAULT '',
  `delay` int(11) NOT NULL DEFAULT '3600',
  `nextcheck` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`druleid`),
  UNIQUE KEY `drules_2` (`name`),
  KEY `drules_1` (`proxy_hostid`),
  CONSTRAINT `c_drules_1` FOREIGN KEY (`proxy_hostid`) REFERENCES `hosts` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drules`
--

LOCK TABLES `drules` WRITE;
/*!40000 ALTER TABLE `drules` DISABLE KEYS */;
INSERT INTO `drules` VALUES (2,NULL,'Local network','192.168.0.1-254',3600,0,1);
/*!40000 ALTER TABLE `drules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dservices`
--

DROP TABLE IF EXISTS `dservices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dservices` (
  `dserviceid` bigint(20) unsigned NOT NULL,
  `dhostid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `key_` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  `port` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `lastup` int(11) NOT NULL DEFAULT '0',
  `lastdown` int(11) NOT NULL DEFAULT '0',
  `dcheckid` bigint(20) unsigned NOT NULL,
  `ip` varchar(39) NOT NULL DEFAULT '',
  `dns` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`dserviceid`),
  UNIQUE KEY `dservices_1` (`dcheckid`,`type`,`key_`,`ip`,`port`),
  KEY `dservices_2` (`dhostid`),
  CONSTRAINT `c_dservices_2` FOREIGN KEY (`dcheckid`) REFERENCES `dchecks` (`dcheckid`) ON DELETE CASCADE,
  CONSTRAINT `c_dservices_1` FOREIGN KEY (`dhostid`) REFERENCES `dhosts` (`dhostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dservices`
--

LOCK TABLES `dservices` WRITE;
/*!40000 ALTER TABLE `dservices` DISABLE KEYS */;
/*!40000 ALTER TABLE `dservices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escalations`
--

DROP TABLE IF EXISTS `escalations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `escalations` (
  `escalationid` bigint(20) unsigned NOT NULL,
  `actionid` bigint(20) unsigned NOT NULL,
  `triggerid` bigint(20) unsigned DEFAULT NULL,
  `eventid` bigint(20) unsigned DEFAULT NULL,
  `r_eventid` bigint(20) unsigned DEFAULT NULL,
  `nextcheck` int(11) NOT NULL DEFAULT '0',
  `esc_step` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `itemid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`escalationid`),
  UNIQUE KEY `escalations_1` (`actionid`,`triggerid`,`itemid`,`escalationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escalations`
--

LOCK TABLES `escalations` WRITE;
/*!40000 ALTER TABLE `escalations` DISABLE KEYS */;
/*!40000 ALTER TABLE `escalations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `eventid` bigint(20) unsigned NOT NULL,
  `source` int(11) NOT NULL DEFAULT '0',
  `object` int(11) NOT NULL DEFAULT '0',
  `objectid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  `acknowledged` int(11) NOT NULL DEFAULT '0',
  `ns` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`eventid`),
  KEY `events_1` (`source`,`object`,`objectid`,`clock`),
  KEY `events_2` (`source`,`object`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expressions`
--

DROP TABLE IF EXISTS `expressions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expressions` (
  `expressionid` bigint(20) unsigned NOT NULL,
  `regexpid` bigint(20) unsigned NOT NULL,
  `expression` varchar(255) NOT NULL DEFAULT '',
  `expression_type` int(11) NOT NULL DEFAULT '0',
  `exp_delimiter` varchar(1) NOT NULL DEFAULT '',
  `case_sensitive` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`expressionid`),
  KEY `expressions_1` (`regexpid`),
  CONSTRAINT `c_expressions_1` FOREIGN KEY (`regexpid`) REFERENCES `regexps` (`regexpid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expressions`
--

LOCK TABLES `expressions` WRITE;
/*!40000 ALTER TABLE `expressions` DISABLE KEYS */;
INSERT INTO `expressions` VALUES (1,1,'^(btrfs|ext2|ext3|ext4|jfs|reiser|xfs|ffs|ufs|jfs|jfs2|vxfs|hfs|refs|ntfs|fat32|zfs)$',3,',',0),(2,2,'^lo$',4,',',1),(3,3,'^(Physical memory|Virtual memory|Memory buffers|Cached memory|Swap space)$',4,',',1),(4,2,'^Software Loopback Interface',4,',',1);
/*!40000 ALTER TABLE `expressions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `functions`
--

DROP TABLE IF EXISTS `functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `functions` (
  `functionid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `triggerid` bigint(20) unsigned NOT NULL,
  `function` varchar(12) NOT NULL DEFAULT '',
  `parameter` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`functionid`),
  KEY `functions_1` (`triggerid`),
  KEY `functions_2` (`itemid`,`function`,`parameter`),
  CONSTRAINT `c_functions_2` FOREIGN KEY (`triggerid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE,
  CONSTRAINT `c_functions_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `functions`
--

LOCK TABLES `functions` WRITE;
/*!40000 ALTER TABLE `functions` DISABLE KEYS */;
INSERT INTO `functions` VALUES (12648,23620,13075,'min','10m'),(12895,23271,13486,'min','10m'),(12896,23273,13487,'min','10m'),(12897,23274,13488,'min','10m'),(12898,23275,13489,'min','10m'),(12899,23276,13490,'min','10m'),(12900,23287,13491,'nodata','5m'),(12902,23289,13493,'last','0'),(12903,23290,13494,'last','0'),(12908,23307,13499,'diff','0'),(12909,23310,13500,'last','0'),(12910,23312,13501,'diff','0'),(12911,23313,13502,'change','0'),(12912,23315,13503,'diff','0'),(12913,23316,13504,'last','0'),(12914,23282,13505,'last','0'),(12915,23284,13506,'last','0'),(12928,23288,13492,'diff','0'),(12938,23327,13509,'diff','0'),(12966,23635,13537,'min','10m'),(13030,23266,13481,'min','10m'),(13079,23296,13497,'avg','5m'),(13081,23301,13498,'avg','5m'),(13083,23292,13496,'avg','5m'),(13085,23291,13495,'avg','5m'),(13100,23252,13467,'avg','10m'),(13102,23253,13468,'avg','10m'),(13104,23254,13469,'avg','10m'),(13106,23255,13470,'avg','10m'),(13108,23256,13471,'avg','10m'),(13110,23257,13472,'avg','10m'),(13112,23258,13473,'avg','30m'),(13114,23259,13474,'avg','10m'),(13116,23260,13475,'avg','10m'),(13118,23261,13476,'avg','10m'),(13120,23262,13477,'avg','10m'),(13124,23264,13479,'avg','10m'),(13126,23265,13480,'avg','10m'),(13128,23267,13482,'avg','10m'),(13130,23268,13483,'avg','10m'),(13132,23269,13484,'avg','10m'),(13134,23270,13485,'avg','10m'),(13136,23328,13436,'avg','10m'),(13161,23662,13558,'last',''),(13299,24013,13696,'diff','0'),(13310,23893,13705,'last',''),(13311,23893,13706,'last',''),(13317,23990,13712,'last','0'),(13318,23991,13713,'last','0'),(13319,24002,13714,'avg','5m'),(13321,24003,13716,'avg','5m'),(13329,24010,13722,'diff','0'),(13330,24028,13723,'diff','0'),(13345,24014,13735,'last','0'),(13346,24030,13736,'last','0'),(13347,24026,13737,'last','0'),(13348,23980,13738,'min','10m'),(13349,23954,13739,'min','10m'),(13350,23979,13740,'min','10m'),(13351,23955,13741,'min','10m'),(13352,23985,13742,'min','10m'),(13353,23986,13743,'min','10m'),(13354,23956,13744,'min','10m'),(13355,23987,13745,'min','10m'),(13356,23984,13746,'min','10m'),(13361,23952,13751,'min','10m'),(13362,23977,13752,'min','10m'),(13363,23894,13753,'last','0'),(13368,23872,13757,'last',''),(13372,23863,13760,'last',''),(13373,23862,13761,'last',''),(13374,23855,13762,'last',''),(13375,23861,13763,'last',''),(13376,23864,13764,'last',''),(13377,23865,13765,'last',''),(13378,23856,13766,'last',''),(13379,23914,13767,'strlen',''),(13380,23912,13768,'last',''),(13381,23908,13769,'last',''),(13382,23909,13770,'last',''),(13383,23910,13771,'last',''),(13384,23911,13772,'last',''),(13385,23913,13773,'last',''),(13403,23866,13791,'last',''),(13404,23867,13792,'last',''),(13406,23859,13794,'last',''),(13407,23874,13795,'last',''),(13408,23850,13796,'last',''),(13409,23880,13797,'last',''),(13410,23881,13798,'last',''),(13411,23851,13799,'last',''),(13412,23852,13800,'last',''),(13413,23877,13801,'last',''),(13414,23878,13802,'last',''),(13415,23853,13803,'last',''),(13416,23854,13804,'last',''),(13417,23879,13805,'last',''),(13418,23860,13806,'last',''),(13419,23915,13807,'strlen',''),(13420,23868,13808,'last',''),(13421,23869,13809,'last',''),(13422,23857,13810,'last',''),(13423,23870,13811,'last',''),(13424,23871,13812,'last',''),(13425,23883,13813,'last',''),(13426,23873,13814,'last',''),(13427,23916,13815,'strlen',''),(13428,23884,13816,'last',''),(13429,23858,13817,'last',''),(13430,23885,13818,'last',''),(13431,23875,13819,'last',''),(13432,23876,13820,'last',''),(13433,23882,13821,'last',''),(13434,23997,13822,'avg','5m'),(13435,23998,13823,'avg','5m'),(13436,23996,13824,'avg','5m'),(13437,24023,13825,'avg','5m'),(13448,23935,13833,'max','#3'),(13458,24022,13840,'avg','5m'),(13464,23936,13845,'nodata','5m'),(13465,23989,13846,'nodata','5m'),(13466,24016,13847,'nodata','5m'),(13467,23958,13848,'avg','10m'),(13468,23937,13849,'avg','10m'),(13469,23959,13850,'avg','10m'),(13470,23938,13851,'avg','10m'),(13471,23960,13852,'avg','10m'),(13472,23939,13853,'avg','10m'),(13473,23961,13854,'avg','10m'),(13474,23962,13855,'avg','10m'),(13475,23940,13856,'avg','10m'),(13476,23941,13857,'avg','10m'),(13477,23963,13858,'avg','10m'),(13478,23942,13859,'avg','30m'),(13479,23964,13860,'avg','30m'),(13480,23943,13861,'avg','10m'),(13481,23965,13862,'avg','10m'),(13482,23944,13863,'avg','10m'),(13483,23966,13864,'avg','10m'),(13484,23945,13865,'avg','10m'),(13485,23967,13866,'avg','10m'),(13486,23946,13867,'avg','10m'),(13487,23968,13868,'avg','10m'),(13488,23947,13869,'avg','10m'),(13489,23969,13870,'avg','10m'),(13490,23970,13871,'avg','10m'),(13491,23948,13872,'avg','10m'),(13492,23971,13873,'min','10m'),(13493,23949,13874,'avg','10m'),(13494,23972,13875,'avg','10m'),(13495,23973,13876,'avg','10m'),(13496,23950,13877,'avg','10m'),(13497,23974,13878,'avg','10m'),(13498,23951,13879,'avg','10m'),(13499,23975,13880,'avg','10m'),(13500,23983,13881,'last',''),(13501,23976,13882,'avg','10m'),(13502,24011,13883,'change','0'),(13503,24029,13884,'change','0'),(13504,24695,13885,'last','0'),(13505,24693,13886,'last','0'),(13506,24701,13887,'last','0');
/*!40000 ALTER TABLE `functions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalmacro`
--

DROP TABLE IF EXISTS `globalmacro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalmacro` (
  `globalmacroid` bigint(20) unsigned NOT NULL,
  `macro` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`globalmacroid`),
  UNIQUE KEY `globalmacro_1` (`macro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalmacro`
--

LOCK TABLES `globalmacro` WRITE;
/*!40000 ALTER TABLE `globalmacro` DISABLE KEYS */;
INSERT INTO `globalmacro` VALUES (2,'{$SNMP_COMMUNITY}','public');
/*!40000 ALTER TABLE `globalmacro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalvars`
--

DROP TABLE IF EXISTS `globalvars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalvars` (
  `globalvarid` bigint(20) unsigned NOT NULL,
  `snmp_lastsize` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`globalvarid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalvars`
--

LOCK TABLES `globalvars` WRITE;
/*!40000 ALTER TABLE `globalvars` DISABLE KEYS */;
/*!40000 ALTER TABLE `globalvars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_discovery`
--

DROP TABLE IF EXISTS `graph_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graph_discovery` (
  `graphid` bigint(20) unsigned NOT NULL,
  `parent_graphid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`graphid`),
  KEY `graph_discovery_1` (`parent_graphid`),
  CONSTRAINT `c_graph_discovery_2` FOREIGN KEY (`parent_graphid`) REFERENCES `graphs` (`graphid`),
  CONSTRAINT `c_graph_discovery_1` FOREIGN KEY (`graphid`) REFERENCES `graphs` (`graphid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_discovery`
--

LOCK TABLES `graph_discovery` WRITE;
/*!40000 ALTER TABLE `graph_discovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `graph_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_theme`
--

DROP TABLE IF EXISTS `graph_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graph_theme` (
  `graphthemeid` bigint(20) unsigned NOT NULL,
  `theme` varchar(64) NOT NULL DEFAULT '',
  `backgroundcolor` varchar(6) NOT NULL DEFAULT '',
  `graphcolor` varchar(6) NOT NULL DEFAULT '',
  `gridcolor` varchar(6) NOT NULL DEFAULT '',
  `maingridcolor` varchar(6) NOT NULL DEFAULT '',
  `gridbordercolor` varchar(6) NOT NULL DEFAULT '',
  `textcolor` varchar(6) NOT NULL DEFAULT '',
  `highlightcolor` varchar(6) NOT NULL DEFAULT '',
  `leftpercentilecolor` varchar(6) NOT NULL DEFAULT '',
  `rightpercentilecolor` varchar(6) NOT NULL DEFAULT '',
  `nonworktimecolor` varchar(6) NOT NULL DEFAULT '',
  PRIMARY KEY (`graphthemeid`),
  UNIQUE KEY `graph_theme_1` (`theme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_theme`
--

LOCK TABLES `graph_theme` WRITE;
/*!40000 ALTER TABLE `graph_theme` DISABLE KEYS */;
INSERT INTO `graph_theme` VALUES (1,'blue-theme','FFFFFF','FFFFFF','CCD5D9','ACBBC2','ACBBC2','1F2C33','E33734','429E47','E33734','EBEBEB'),(2,'dark-theme','2B2B2B','2B2B2B','454545','4F4F4F','4F4F4F','F2F2F2','E45959','59DB8F','E45959','333333');
/*!40000 ALTER TABLE `graph_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graphs`
--

DROP TABLE IF EXISTS `graphs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graphs` (
  `graphid` bigint(20) unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `width` int(11) NOT NULL DEFAULT '900',
  `height` int(11) NOT NULL DEFAULT '200',
  `yaxismin` double(16,4) NOT NULL DEFAULT '0.0000',
  `yaxismax` double(16,4) NOT NULL DEFAULT '100.0000',
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `show_work_period` int(11) NOT NULL DEFAULT '1',
  `show_triggers` int(11) NOT NULL DEFAULT '1',
  `graphtype` int(11) NOT NULL DEFAULT '0',
  `show_legend` int(11) NOT NULL DEFAULT '1',
  `show_3d` int(11) NOT NULL DEFAULT '0',
  `percent_left` double(16,4) NOT NULL DEFAULT '0.0000',
  `percent_right` double(16,4) NOT NULL DEFAULT '0.0000',
  `ymin_type` int(11) NOT NULL DEFAULT '0',
  `ymax_type` int(11) NOT NULL DEFAULT '0',
  `ymin_itemid` bigint(20) unsigned DEFAULT NULL,
  `ymax_itemid` bigint(20) unsigned DEFAULT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`graphid`),
  KEY `graphs_1` (`name`),
  KEY `graphs_2` (`templateid`),
  KEY `graphs_3` (`ymin_itemid`),
  KEY `graphs_4` (`ymax_itemid`),
  CONSTRAINT `c_graphs_3` FOREIGN KEY (`ymax_itemid`) REFERENCES `items` (`itemid`),
  CONSTRAINT `c_graphs_1` FOREIGN KEY (`templateid`) REFERENCES `graphs` (`graphid`) ON DELETE CASCADE,
  CONSTRAINT `c_graphs_2` FOREIGN KEY (`ymin_itemid`) REFERENCES `items` (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graphs`
--

LOCK TABLES `graphs` WRITE;
/*!40000 ALTER TABLE `graphs` DISABLE KEYS */;
INSERT INTO `graphs` VALUES (517,'Zabbix internal process busy %',900,200,0.0000,100.0000,653,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(518,'Zabbix data gathering process busy %',900,200,0.0000,100.0000,651,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(519,'Zabbix server performance',900,200,0.0000,100.0000,655,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(520,'Zabbix cache usage, % free',900,200,0.0000,100.0000,649,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(521,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(522,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(523,'CPU jumps',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(524,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(525,'CPU utilization',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(526,'Swap usage',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,0),(528,'Value cache effectiveness',900,200,0.0000,100.0000,647,1,1,1,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(534,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,23317,0),(553,'IO_asu on {#DISK_NAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(554,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(555,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(556,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(557,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(564,'compute node',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(566,'controller node',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(567,'CPU jumps',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(568,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(569,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(570,'CPU utilization',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(583,'haproxy',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(605,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,24031,0),(606,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,24015,0),(607,'MySQL bandwidth',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(612,'mysqld',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(614,'MySQL operations',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(631,'ntp',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(642,'rabbitmq-server',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(647,'Value cache effectiveness',900,200,0.0000,100.0000,NULL,1,1,1,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(648,'Zabbix cache usage, % free',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(649,'Zabbix cache usage, % free',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(650,'Zabbix data gathering process busy %',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(651,'Zabbix data gathering process busy %',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(652,'Zabbix internal process busy %',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(653,'Zabbix internal process busy %',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(654,'Zabbix proxy performance',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(655,'Zabbix server performance',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0);
/*!40000 ALTER TABLE `graphs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graphs_items`
--

DROP TABLE IF EXISTS `graphs_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graphs_items` (
  `gitemid` bigint(20) unsigned NOT NULL,
  `graphid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `drawtype` int(11) NOT NULL DEFAULT '0',
  `sortorder` int(11) NOT NULL DEFAULT '0',
  `color` varchar(6) NOT NULL DEFAULT '009600',
  `yaxisside` int(11) NOT NULL DEFAULT '0',
  `calc_fnc` int(11) NOT NULL DEFAULT '2',
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`gitemid`),
  KEY `graphs_items_1` (`itemid`),
  KEY `graphs_items_2` (`graphid`),
  CONSTRAINT `c_graphs_items_2` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_graphs_items_1` FOREIGN KEY (`graphid`) REFERENCES `graphs` (`graphid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graphs_items`
--

LOCK TABLES `graphs_items` WRITE;
/*!40000 ALTER TABLE `graphs_items` DISABLE KEYS */;
INSERT INTO `graphs_items` VALUES (1714,521,23280,5,0,'00AA00',0,2,0),(1715,521,23281,5,1,'3333FF',0,2,0),(1716,522,23285,0,0,'C80000',0,2,2),(1717,522,23283,0,1,'00C800',0,2,0),(1718,523,23298,0,0,'009900',0,2,0),(1719,523,23294,0,1,'000099',0,2,0),(1720,524,23296,0,0,'009900',0,2,0),(1721,524,23297,0,1,'000099',0,2,0),(1722,524,23295,0,2,'990000',0,2,0),(1723,525,23304,1,0,'FF5555',0,2,0),(1724,525,23303,1,1,'55FF55',0,2,0),(1725,525,23300,1,2,'009999',0,2,0),(1726,525,23302,1,3,'990099',0,2,0),(1727,525,23301,1,4,'999900',0,2,0),(1728,525,23305,1,5,'990000',0,2,0),(1729,525,23306,1,6,'000099',0,2,0),(1730,525,23299,1,7,'009900',0,2,0),(1731,526,23311,0,0,'AA0000',0,2,2),(1732,526,23309,0,1,'00AA00',0,2,0),(1792,534,23316,5,0,'00C800',0,2,0),(1871,553,24682,0,0,'00C800',0,2,0),(1872,553,24683,0,1,'C80000',0,2,0),(1873,553,24684,0,2,'0000C8',0,2,0),(1874,553,24685,0,3,'C800C8',0,2,0),(1875,553,24686,0,4,'00C8C8',0,2,0),(1876,553,24687,0,5,'C8C800',0,2,0),(1877,553,24688,0,6,'C8C8C8',0,2,0),(1878,553,24689,0,7,'009600',0,2,0),(1879,553,24690,0,8,'960000',0,2,0),(1880,554,24691,5,0,'00AA00',0,2,0),(1881,554,24692,5,1,'3333FF',0,2,0),(1882,555,24696,0,0,'C80000',0,2,2),(1883,555,24694,0,1,'00C800',0,2,0),(1884,556,24698,5,0,'00AA00',0,2,0),(1885,556,24699,5,1,'3333FF',0,2,0),(1886,557,24702,0,0,'C80000',0,2,2),(1887,557,24700,0,1,'00C800',0,2,0),(1909,564,23855,0,0,'1A7C11',0,2,0),(1910,564,23856,0,1,'F63100',0,2,0),(1911,564,23850,0,2,'2774A4',0,2,0),(1912,564,23851,0,3,'A54F10',0,2,0),(1913,564,23852,0,4,'FC6EA3',0,2,0),(1914,564,23853,0,5,'6C59DC',0,2,0),(1915,564,23854,0,6,'AC8C14',0,2,0),(1916,564,23857,0,7,'611F27',0,2,0),(1917,564,23858,0,9,'5CCD18',0,2,0),(1919,566,23859,0,0,'1A7C11',0,2,0),(1920,566,23860,0,1,'F63100',0,2,0),(1921,566,23861,0,2,'2774A4',0,2,0),(1922,566,23862,0,3,'A54F10',0,2,0),(1923,566,23863,0,4,'FC6EA3',0,2,0),(1924,566,23864,0,5,'6C59DC',0,2,0),(1925,566,23865,0,6,'AC8C14',0,2,0),(1926,566,23866,0,7,'611F27',0,2,0),(1927,566,23867,0,8,'F230E0',0,2,0),(1928,566,23868,0,9,'5CCD18',0,2,0),(1929,566,23869,0,10,'BB2A02',0,2,0),(1930,566,23870,0,11,'5A2B57',0,2,0),(1931,566,23871,0,12,'89ABF8',0,2,0),(1932,566,23872,0,13,'7EC25C',0,2,0),(1933,566,23873,0,14,'274482',0,2,0),(1934,567,23999,0,0,'009900',0,2,0),(1935,567,23995,0,1,'000099',0,2,0),(1936,568,23996,0,0,'009900',0,2,0),(1937,568,23997,0,1,'000099',0,2,0),(1938,568,23998,0,2,'990000',0,2,0),(1939,569,24023,0,0,'009900',0,2,0),(1940,569,24024,0,1,'000099',0,2,0),(1941,569,24025,0,2,'990000',0,2,0),(1942,570,24006,1,0,'FF5555',0,2,0),(1943,570,24005,1,1,'55FF55',0,2,0),(1944,570,24002,1,2,'009999',0,2,0),(1945,570,24004,1,3,'990099',0,2,0),(1946,570,24003,1,4,'999900',0,2,0),(1947,570,24007,1,5,'990000',0,2,0),(1948,570,24008,1,6,'000099',0,2,0),(1949,570,24001,1,7,'009900',0,2,0),(2006,583,23875,0,0,'1A7C11',0,2,0),(2007,583,23876,0,1,'F63100',0,2,0),(2062,605,24030,5,0,'00C800',0,2,0),(2063,606,24014,5,0,'00C800',0,2,0),(2064,607,23895,5,0,'00AA00',0,2,0),(2065,607,23896,5,1,'3333FF',0,2,0),(2079,612,23881,0,0,'1A7C11',0,2,0),(2080,612,23882,0,1,'F63100',0,2,0),(2083,614,23897,0,0,'C8C800',0,2,0),(2084,614,23898,0,1,'006400',0,2,0),(2085,614,23899,0,2,'C80000',0,2,0),(2086,614,23900,0,3,'0000EE',0,2,0),(2087,614,23901,0,4,'640000',0,2,0),(2088,614,23902,0,5,'00C800',0,2,0),(2089,614,23903,0,6,'C800C8',0,2,0),(2151,631,23884,0,0,'1A7C11',0,2,0),(2182,642,23885,0,0,'1A7C11',0,2,0),(2191,647,23982,0,0,'C80000',0,2,0),(2192,647,23981,0,1,'00C800',0,2,0),(2193,648,23954,0,0,'DD0000',0,2,0),(2194,648,23956,0,1,'00DDDD',0,2,0),(2195,648,23955,0,2,'3333FF',0,2,0),(2196,649,23987,0,0,'009900',0,2,0),(2197,649,23979,0,1,'DD0000',0,2,0),(2198,649,23986,0,2,'00DDDD',0,2,0),(2199,649,23985,0,3,'3333FF',0,2,0),(2200,649,23980,0,4,'999900',0,2,0),(2201,649,23984,0,5,'00FF00',0,2,0),(2202,650,23950,0,0,'990099',0,2,0),(2203,650,23947,0,1,'990000',0,2,0),(2204,650,23945,0,2,'0000EE',0,2,0),(2205,650,23939,0,3,'FF33FF',0,2,0),(2206,650,23944,0,4,'00EE00',0,2,0),(2207,650,23943,0,5,'003300',0,2,0),(2208,650,23951,0,6,'33FFFF',0,2,0),(2209,650,23946,0,7,'DD0000',0,2,0),(2210,650,23949,0,8,'000099',0,7,0),(2211,651,23974,0,0,'990099',0,2,0),(2212,651,23969,0,1,'990000',0,2,0),(2213,651,23967,0,2,'0000EE',0,2,0),(2214,651,23961,0,3,'FF33FF',0,2,0),(2215,651,23966,0,4,'009600',0,2,0),(2216,651,23965,0,5,'003300',0,2,0),(2217,651,23970,0,6,'CCCC00',0,2,0),(2218,651,23975,0,7,'33FFFF',0,2,0),(2219,651,23968,0,8,'DD0000',0,2,0),(2220,651,23972,0,9,'000099',0,2,0),(2221,651,23976,0,10,'00FF00',0,2,0),(2222,652,23942,0,0,'FFAA00',0,2,0),(2223,652,23937,0,1,'990099',0,2,0),(2224,652,23941,0,2,'EE0000',0,2,0),(2225,652,23948,0,3,'FF66FF',0,2,0),(2226,652,23940,0,4,'960000',0,2,0),(2227,652,23938,0,5,'009600',0,2,0),(2228,653,23973,0,0,'00EE00',0,2,0),(2229,653,23962,0,1,'0000EE',0,2,0),(2230,653,23964,0,2,'FFAA00',0,2,0),(2231,653,23958,0,3,'00EEEE',0,2,0),(2232,653,23959,0,4,'990099',0,2,0),(2233,653,23960,0,5,'666600',0,2,0),(2234,653,23963,0,6,'EE0000',0,2,0),(2235,653,23971,0,7,'FF66FF',0,2,0),(2236,654,23957,5,0,'00C800',0,2,0),(2237,654,23953,5,1,'C80000',1,2,0),(2238,655,23988,5,0,'00C800',0,2,0),(2239,655,23978,5,1,'C80000',1,2,0),(2240,517,23268,0,0,'00EE00',0,2,0),(2241,517,23256,0,1,'0000EE',0,2,0),(2242,517,23258,0,2,'FFAA00',0,2,0),(2243,517,23252,0,3,'00EEEE',0,2,0),(2244,517,23253,0,4,'990099',0,2,0),(2245,517,23254,0,5,'666600',0,2,0),(2246,517,23257,0,6,'EE0000',0,2,0),(2247,517,23266,0,7,'FF66FF',0,2,0),(2248,518,23269,0,0,'990099',0,2,0),(2249,518,23264,0,1,'990000',0,2,0),(2250,518,23261,0,2,'0000EE',0,2,0),(2251,518,23255,0,3,'FF33FF',0,2,0),(2252,518,23260,0,4,'009600',0,2,0),(2253,518,23259,0,5,'003300',0,2,0),(2254,518,23265,0,6,'CCCC00',0,2,0),(2255,518,23270,0,7,'33FFFF',0,2,0),(2256,518,23262,0,8,'DD0000',0,2,0),(2257,518,23267,0,9,'000099',0,2,0),(2258,518,23328,0,10,'00FF00',0,2,0),(2259,519,23277,5,0,'00C800',0,2,0),(2260,519,23272,5,1,'C80000',1,2,0),(2261,520,23276,0,0,'009900',0,2,0),(2262,520,23273,0,1,'DD0000',0,2,0),(2263,520,23275,0,2,'00DDDD',0,2,0),(2264,520,23274,0,3,'3333FF',0,2,0),(2265,520,23620,0,4,'999900',0,2,0),(2266,520,23635,0,5,'00FF00',0,2,0),(2267,528,23628,0,0,'C80000',0,2,0),(2268,528,23625,0,1,'00C800',0,2,0);
/*!40000 ALTER TABLE `graphs_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_discovery`
--

DROP TABLE IF EXISTS `group_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_discovery` (
  `groupid` bigint(20) unsigned NOT NULL,
  `parent_group_prototypeid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `lastcheck` int(11) NOT NULL DEFAULT '0',
  `ts_delete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`),
  KEY `c_group_discovery_2` (`parent_group_prototypeid`),
  CONSTRAINT `c_group_discovery_2` FOREIGN KEY (`parent_group_prototypeid`) REFERENCES `group_prototype` (`group_prototypeid`),
  CONSTRAINT `c_group_discovery_1` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_discovery`
--

LOCK TABLES `group_discovery` WRITE;
/*!40000 ALTER TABLE `group_discovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_prototype`
--

DROP TABLE IF EXISTS `group_prototype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_prototype` (
  `group_prototypeid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `groupid` bigint(20) unsigned DEFAULT NULL,
  `templateid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`group_prototypeid`),
  KEY `group_prototype_1` (`hostid`),
  KEY `c_group_prototype_2` (`groupid`),
  KEY `c_group_prototype_3` (`templateid`),
  CONSTRAINT `c_group_prototype_3` FOREIGN KEY (`templateid`) REFERENCES `group_prototype` (`group_prototypeid`) ON DELETE CASCADE,
  CONSTRAINT `c_group_prototype_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_group_prototype_2` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_prototype`
--

LOCK TABLES `group_prototype` WRITE;
/*!40000 ALTER TABLE `group_prototype` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_prototype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `groupid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `internal` int(11) NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`),
  KEY `groups_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Templates',0,0),(2,'Linux servers',0,0),(4,'Zabbix servers',0,0),(5,'Discovered hosts',1,0),(6,'Virtual machines',0,0),(7,'Hypervisors',0,0),(8,'Ceph',0,0),(9,'Openstack',0,0),(10,'Compute node',0,0),(11,'Controller node',0,0),(12,'IO_State',0,0);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` double(16,4) NOT NULL DEFAULT '0.0000',
  `ns` int(11) NOT NULL DEFAULT '0',
  KEY `history_1` (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_log`
--

DROP TABLE IF EXISTS `history_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_log` (
  `id` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `source` varchar(64) NOT NULL DEFAULT '',
  `severity` int(11) NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  `logeventid` int(11) NOT NULL DEFAULT '0',
  `ns` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `history_log_2` (`itemid`,`id`),
  KEY `history_log_1` (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_log`
--

LOCK TABLES `history_log` WRITE;
/*!40000 ALTER TABLE `history_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `history_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_str`
--

DROP TABLE IF EXISTS `history_str`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_str` (
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  `ns` int(11) NOT NULL DEFAULT '0',
  KEY `history_str_1` (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_str`
--

LOCK TABLES `history_str` WRITE;
/*!40000 ALTER TABLE `history_str` DISABLE KEYS */;
/*!40000 ALTER TABLE `history_str` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_text`
--

DROP TABLE IF EXISTS `history_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_text` (
  `id` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  `ns` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `history_text_2` (`itemid`,`id`),
  KEY `history_text_1` (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_text`
--

LOCK TABLES `history_text` WRITE;
/*!40000 ALTER TABLE `history_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `history_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_uint`
--

DROP TABLE IF EXISTS `history_uint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_uint` (
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` bigint(20) unsigned NOT NULL DEFAULT '0',
  `ns` int(11) NOT NULL DEFAULT '0',
  KEY `history_uint_1` (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_uint`
--

LOCK TABLES `history_uint` WRITE;
/*!40000 ALTER TABLE `history_uint` DISABLE KEYS */;
/*!40000 ALTER TABLE `history_uint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_discovery`
--

DROP TABLE IF EXISTS `host_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host_discovery` (
  `hostid` bigint(20) unsigned NOT NULL,
  `parent_hostid` bigint(20) unsigned DEFAULT NULL,
  `parent_itemid` bigint(20) unsigned DEFAULT NULL,
  `host` varchar(64) NOT NULL DEFAULT '',
  `lastcheck` int(11) NOT NULL DEFAULT '0',
  `ts_delete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`hostid`),
  KEY `c_host_discovery_2` (`parent_hostid`),
  KEY `c_host_discovery_3` (`parent_itemid`),
  CONSTRAINT `c_host_discovery_3` FOREIGN KEY (`parent_itemid`) REFERENCES `items` (`itemid`),
  CONSTRAINT `c_host_discovery_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_host_discovery_2` FOREIGN KEY (`parent_hostid`) REFERENCES `hosts` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host_discovery`
--

LOCK TABLES `host_discovery` WRITE;
/*!40000 ALTER TABLE `host_discovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `host_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_inventory`
--

DROP TABLE IF EXISTS `host_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host_inventory` (
  `hostid` bigint(20) unsigned NOT NULL,
  `inventory_mode` int(11) NOT NULL DEFAULT '0',
  `type` varchar(64) NOT NULL DEFAULT '',
  `type_full` varchar(64) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '',
  `alias` varchar(64) NOT NULL DEFAULT '',
  `os` varchar(64) NOT NULL DEFAULT '',
  `os_full` varchar(255) NOT NULL DEFAULT '',
  `os_short` varchar(64) NOT NULL DEFAULT '',
  `serialno_a` varchar(64) NOT NULL DEFAULT '',
  `serialno_b` varchar(64) NOT NULL DEFAULT '',
  `tag` varchar(64) NOT NULL DEFAULT '',
  `asset_tag` varchar(64) NOT NULL DEFAULT '',
  `macaddress_a` varchar(64) NOT NULL DEFAULT '',
  `macaddress_b` varchar(64) NOT NULL DEFAULT '',
  `hardware` varchar(255) NOT NULL DEFAULT '',
  `hardware_full` text NOT NULL,
  `software` varchar(255) NOT NULL DEFAULT '',
  `software_full` text NOT NULL,
  `software_app_a` varchar(64) NOT NULL DEFAULT '',
  `software_app_b` varchar(64) NOT NULL DEFAULT '',
  `software_app_c` varchar(64) NOT NULL DEFAULT '',
  `software_app_d` varchar(64) NOT NULL DEFAULT '',
  `software_app_e` varchar(64) NOT NULL DEFAULT '',
  `contact` text NOT NULL,
  `location` text NOT NULL,
  `location_lat` varchar(16) NOT NULL DEFAULT '',
  `location_lon` varchar(16) NOT NULL DEFAULT '',
  `notes` text NOT NULL,
  `chassis` varchar(64) NOT NULL DEFAULT '',
  `model` varchar(64) NOT NULL DEFAULT '',
  `hw_arch` varchar(32) NOT NULL DEFAULT '',
  `vendor` varchar(64) NOT NULL DEFAULT '',
  `contract_number` varchar(64) NOT NULL DEFAULT '',
  `installer_name` varchar(64) NOT NULL DEFAULT '',
  `deployment_status` varchar(64) NOT NULL DEFAULT '',
  `url_a` varchar(255) NOT NULL DEFAULT '',
  `url_b` varchar(255) NOT NULL DEFAULT '',
  `url_c` varchar(255) NOT NULL DEFAULT '',
  `host_networks` text NOT NULL,
  `host_netmask` varchar(39) NOT NULL DEFAULT '',
  `host_router` varchar(39) NOT NULL DEFAULT '',
  `oob_ip` varchar(39) NOT NULL DEFAULT '',
  `oob_netmask` varchar(39) NOT NULL DEFAULT '',
  `oob_router` varchar(39) NOT NULL DEFAULT '',
  `date_hw_purchase` varchar(64) NOT NULL DEFAULT '',
  `date_hw_install` varchar(64) NOT NULL DEFAULT '',
  `date_hw_expiry` varchar(64) NOT NULL DEFAULT '',
  `date_hw_decomm` varchar(64) NOT NULL DEFAULT '',
  `site_address_a` varchar(128) NOT NULL DEFAULT '',
  `site_address_b` varchar(128) NOT NULL DEFAULT '',
  `site_address_c` varchar(128) NOT NULL DEFAULT '',
  `site_city` varchar(128) NOT NULL DEFAULT '',
  `site_state` varchar(64) NOT NULL DEFAULT '',
  `site_country` varchar(64) NOT NULL DEFAULT '',
  `site_zip` varchar(64) NOT NULL DEFAULT '',
  `site_rack` varchar(128) NOT NULL DEFAULT '',
  `site_notes` text NOT NULL,
  `poc_1_name` varchar(128) NOT NULL DEFAULT '',
  `poc_1_email` varchar(128) NOT NULL DEFAULT '',
  `poc_1_phone_a` varchar(64) NOT NULL DEFAULT '',
  `poc_1_phone_b` varchar(64) NOT NULL DEFAULT '',
  `poc_1_cell` varchar(64) NOT NULL DEFAULT '',
  `poc_1_screen` varchar(64) NOT NULL DEFAULT '',
  `poc_1_notes` text NOT NULL,
  `poc_2_name` varchar(128) NOT NULL DEFAULT '',
  `poc_2_email` varchar(128) NOT NULL DEFAULT '',
  `poc_2_phone_a` varchar(64) NOT NULL DEFAULT '',
  `poc_2_phone_b` varchar(64) NOT NULL DEFAULT '',
  `poc_2_cell` varchar(64) NOT NULL DEFAULT '',
  `poc_2_screen` varchar(64) NOT NULL DEFAULT '',
  `poc_2_notes` text NOT NULL,
  PRIMARY KEY (`hostid`),
  CONSTRAINT `c_host_inventory_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host_inventory`
--

LOCK TABLES `host_inventory` WRITE;
/*!40000 ALTER TABLE `host_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `host_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostmacro`
--

DROP TABLE IF EXISTS `hostmacro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hostmacro` (
  `hostmacroid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `macro` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`hostmacroid`),
  UNIQUE KEY `hostmacro_1` (`hostid`,`macro`),
  CONSTRAINT `c_hostmacro_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostmacro`
--

LOCK TABLES `hostmacro` WRITE;
/*!40000 ALTER TABLE `hostmacro` DISABLE KEYS */;
/*!40000 ALTER TABLE `hostmacro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hosts`
--

DROP TABLE IF EXISTS `hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hosts` (
  `hostid` bigint(20) unsigned NOT NULL,
  `proxy_hostid` bigint(20) unsigned DEFAULT NULL,
  `host` varchar(128) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `disable_until` int(11) NOT NULL DEFAULT '0',
  `error` varchar(2048) NOT NULL DEFAULT '',
  `available` int(11) NOT NULL DEFAULT '0',
  `errors_from` int(11) NOT NULL DEFAULT '0',
  `lastaccess` int(11) NOT NULL DEFAULT '0',
  `ipmi_authtype` int(11) NOT NULL DEFAULT '0',
  `ipmi_privilege` int(11) NOT NULL DEFAULT '2',
  `ipmi_username` varchar(16) NOT NULL DEFAULT '',
  `ipmi_password` varchar(20) NOT NULL DEFAULT '',
  `ipmi_disable_until` int(11) NOT NULL DEFAULT '0',
  `ipmi_available` int(11) NOT NULL DEFAULT '0',
  `snmp_disable_until` int(11) NOT NULL DEFAULT '0',
  `snmp_available` int(11) NOT NULL DEFAULT '0',
  `maintenanceid` bigint(20) unsigned DEFAULT NULL,
  `maintenance_status` int(11) NOT NULL DEFAULT '0',
  `maintenance_type` int(11) NOT NULL DEFAULT '0',
  `maintenance_from` int(11) NOT NULL DEFAULT '0',
  `ipmi_errors_from` int(11) NOT NULL DEFAULT '0',
  `snmp_errors_from` int(11) NOT NULL DEFAULT '0',
  `ipmi_error` varchar(2048) NOT NULL DEFAULT '',
  `snmp_error` varchar(2048) NOT NULL DEFAULT '',
  `jmx_disable_until` int(11) NOT NULL DEFAULT '0',
  `jmx_available` int(11) NOT NULL DEFAULT '0',
  `jmx_errors_from` int(11) NOT NULL DEFAULT '0',
  `jmx_error` varchar(2048) NOT NULL DEFAULT '',
  `name` varchar(128) NOT NULL DEFAULT '',
  `flags` int(11) NOT NULL DEFAULT '0',
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `description` text NOT NULL,
  `tls_connect` int(11) NOT NULL DEFAULT '1',
  `tls_accept` int(11) NOT NULL DEFAULT '1',
  `tls_issuer` varchar(1024) NOT NULL DEFAULT '',
  `tls_subject` varchar(1024) NOT NULL DEFAULT '',
  `tls_psk_identity` varchar(128) NOT NULL DEFAULT '',
  `tls_psk` varchar(512) NOT NULL DEFAULT '',
  PRIMARY KEY (`hostid`),
  KEY `hosts_1` (`host`),
  KEY `hosts_2` (`status`),
  KEY `hosts_3` (`proxy_hostid`),
  KEY `hosts_4` (`name`),
  KEY `hosts_5` (`maintenanceid`),
  KEY `c_hosts_3` (`templateid`),
  CONSTRAINT `c_hosts_3` FOREIGN KEY (`templateid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_hosts_1` FOREIGN KEY (`proxy_hostid`) REFERENCES `hosts` (`hostid`),
  CONSTRAINT `c_hosts_2` FOREIGN KEY (`maintenanceid`) REFERENCES `maintenances` (`maintenanceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosts`
--

LOCK TABLES `hosts` WRITE;
/*!40000 ALTER TABLE `hosts` DISABLE KEYS */;
INSERT INTO `hosts` VALUES (10084,NULL,'Zabbix server',1,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Zabbix server',0,NULL,'',1,1,'','','',''),(10107,NULL,'compute node',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','compute node',0,NULL,'',1,1,'','','',''),(10108,NULL,'controller node',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','controller node',0,NULL,'',1,1,'','','',''),(10109,NULL,'dashboard',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','dashboard',0,NULL,'',1,1,'','','',''),(10110,NULL,'haproxy',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','haproxy',0,NULL,'',1,1,'','','',''),(10111,NULL,'lbaas',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','lbaas',0,NULL,'',1,1,'','','',''),(10112,NULL,'memcache',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','memcache',0,NULL,'',1,1,'','','',''),(10113,NULL,'mysql',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','mysql',0,NULL,'',1,1,'','','',''),(10114,NULL,'novnc',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','novnc',0,NULL,'',1,1,'','','',''),(10115,NULL,'ntp',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','ntp',0,NULL,'',1,1,'','','',''),(10116,NULL,'rabbitmq',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','rabbitmq',0,NULL,'',1,1,'','','',''),(10117,NULL,'Template App Ceph ProcessNum',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Ceph ProcessNum',0,NULL,'',1,1,'','','',''),(10118,NULL,'Template App Ceph State',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Ceph State',0,NULL,'',1,1,'','','',''),(10119,NULL,'Template App IO State',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App IO State',0,NULL,'',1,1,'','','',''),(10120,NULL,'Template App MySQL',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App MySQL',0,NULL,'',1,1,'','','',''),(10121,NULL,'Template App Openstack Compute ServiceExist',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Openstack Compute ServiceExist',0,NULL,'',1,1,'','','',''),(10122,NULL,'Template App Openstack Controller ServiceExist',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Openstack Controller ServiceExist',0,NULL,'',1,1,'','','',''),(10123,NULL,'Template App SSH Service',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App SSH Service',0,NULL,'',1,1,'','','',''),(10124,NULL,'Template App Zabbix Agent',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Zabbix Agent',0,NULL,'',1,1,'','','',''),(10125,NULL,'Template App Zabbix Proxy',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Zabbix Proxy',0,NULL,'',1,1,'','','',''),(10126,NULL,'Template App Zabbix Server',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Zabbix Server',0,NULL,'',1,1,'','','',''),(10127,NULL,'Template OS Linux - physical',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS Linux - physical',0,NULL,'',1,1,'','','',''),(10128,NULL,'Template OS Windows',3,0,'',0,0,0,0,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS Windows',0,NULL,'',1,1,'','','','');
/*!40000 ALTER TABLE `hosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hosts_groups`
--

DROP TABLE IF EXISTS `hosts_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hosts_groups` (
  `hostgroupid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `groupid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`hostgroupid`),
  UNIQUE KEY `hosts_groups_1` (`hostid`,`groupid`),
  KEY `hosts_groups_2` (`groupid`),
  CONSTRAINT `c_hosts_groups_2` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`) ON DELETE CASCADE,
  CONSTRAINT `c_hosts_groups_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosts_groups`
--

LOCK TABLES `hosts_groups` WRITE;
/*!40000 ALTER TABLE `hosts_groups` DISABLE KEYS */;
INSERT INTO `hosts_groups` VALUES (92,10084,4),(129,10107,1),(128,10107,11),(131,10108,1),(130,10108,11),(133,10109,1),(132,10109,10),(134,10110,11),(136,10111,1),(135,10111,11),(138,10112,1),(137,10112,11),(140,10113,1),(139,10113,10),(142,10114,1),(141,10114,11),(144,10115,1),(143,10115,10),(146,10116,1),(145,10116,11),(148,10117,1),(147,10117,8),(150,10118,1),(149,10118,8),(152,10119,1),(151,10119,12),(153,10120,1),(156,10121,1),(155,10121,9),(154,10121,10),(158,10122,1),(157,10122,11),(159,10123,1),(160,10124,1),(161,10125,1),(162,10126,1),(163,10127,1),(164,10128,1);
/*!40000 ALTER TABLE `hosts_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hosts_templates`
--

DROP TABLE IF EXISTS `hosts_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hosts_templates` (
  `hosttemplateid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `templateid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`hosttemplateid`),
  UNIQUE KEY `hosts_templates_1` (`hostid`,`templateid`),
  KEY `hosts_templates_2` (`templateid`),
  CONSTRAINT `c_hosts_templates_2` FOREIGN KEY (`templateid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_hosts_templates_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosts_templates`
--

LOCK TABLES `hosts_templates` WRITE;
/*!40000 ALTER TABLE `hosts_templates` DISABLE KEYS */;
INSERT INTO `hosts_templates` VALUES (2,10084,10126);
/*!40000 ALTER TABLE `hosts_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `housekeeper`
--

DROP TABLE IF EXISTS `housekeeper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `housekeeper` (
  `housekeeperid` bigint(20) unsigned NOT NULL,
  `tablename` varchar(64) NOT NULL DEFAULT '',
  `field` varchar(64) NOT NULL DEFAULT '',
  `value` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`housekeeperid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `housekeeper`
--

LOCK TABLES `housekeeper` WRITE;
/*!40000 ALTER TABLE `housekeeper` DISABLE KEYS */;
INSERT INTO `housekeeper` VALUES (4649,'trends','itemid',24032),(4650,'trends_uint','itemid',24032),(4651,'history_text','itemid',24032),(4652,'history_log','itemid',24032),(4653,'history_uint','itemid',24032),(4654,'history_str','itemid',24032),(4655,'history','itemid',24032),(4656,'trends','itemid',24033),(4657,'trends_uint','itemid',24033),(4658,'history_text','itemid',24033),(4659,'history_log','itemid',24033),(4660,'history_uint','itemid',24033),(4661,'history_str','itemid',24033),(4662,'history','itemid',24033),(4663,'trends','itemid',24034),(4664,'trends_uint','itemid',24034),(4665,'history_text','itemid',24034),(4666,'history_log','itemid',24034),(4667,'history_uint','itemid',24034),(4668,'history_str','itemid',24034),(4669,'history','itemid',24034),(4670,'trends','itemid',24035),(4671,'trends_uint','itemid',24035),(4672,'history_text','itemid',24035),(4673,'history_log','itemid',24035),(4674,'history_uint','itemid',24035),(4675,'history_str','itemid',24035),(4676,'history','itemid',24035),(4677,'trends','itemid',24036),(4678,'trends_uint','itemid',24036),(4679,'history_text','itemid',24036),(4680,'history_log','itemid',24036),(4681,'history_uint','itemid',24036),(4682,'history_str','itemid',24036),(4683,'history','itemid',24036),(4684,'trends','itemid',24037),(4685,'trends_uint','itemid',24037),(4686,'history_text','itemid',24037),(4687,'history_log','itemid',24037),(4688,'history_uint','itemid',24037),(4689,'history_str','itemid',24037),(4690,'history','itemid',24037),(4691,'trends','itemid',24038),(4692,'trends_uint','itemid',24038),(4693,'history_text','itemid',24038),(4694,'history_log','itemid',24038),(4695,'history_uint','itemid',24038),(4696,'history_str','itemid',24038),(4697,'history','itemid',24038),(4698,'trends','itemid',24039),(4699,'trends_uint','itemid',24039),(4700,'history_text','itemid',24039),(4701,'history_log','itemid',24039),(4702,'history_uint','itemid',24039),(4703,'history_str','itemid',24039),(4704,'history','itemid',24039),(4705,'trends','itemid',24040),(4706,'trends_uint','itemid',24040),(4707,'history_text','itemid',24040),(4708,'history_log','itemid',24040),(4709,'history_uint','itemid',24040),(4710,'history_str','itemid',24040),(4711,'history','itemid',24040),(4712,'trends','itemid',24041),(4713,'trends_uint','itemid',24041),(4714,'history_text','itemid',24041),(4715,'history_log','itemid',24041),(4716,'history_uint','itemid',24041),(4717,'history_str','itemid',24041),(4718,'history','itemid',24041),(4719,'trends','itemid',24042),(4720,'trends_uint','itemid',24042),(4721,'history_text','itemid',24042),(4722,'history_log','itemid',24042),(4723,'history_uint','itemid',24042),(4724,'history_str','itemid',24042),(4725,'history','itemid',24042),(4726,'trends','itemid',24043),(4727,'trends_uint','itemid',24043),(4728,'history_text','itemid',24043),(4729,'history_log','itemid',24043),(4730,'history_uint','itemid',24043),(4731,'history_str','itemid',24043),(4732,'history','itemid',24043),(4733,'trends','itemid',24044),(4734,'trends_uint','itemid',24044),(4735,'history_text','itemid',24044),(4736,'history_log','itemid',24044),(4737,'history_uint','itemid',24044),(4738,'history_str','itemid',24044),(4739,'history','itemid',24044),(4740,'trends','itemid',24045),(4741,'trends_uint','itemid',24045),(4742,'history_text','itemid',24045),(4743,'history_log','itemid',24045),(4744,'history_uint','itemid',24045),(4745,'history_str','itemid',24045),(4746,'history','itemid',24045),(4747,'trends','itemid',24046),(4748,'trends_uint','itemid',24046),(4749,'history_text','itemid',24046),(4750,'history_log','itemid',24046),(4751,'history_uint','itemid',24046),(4752,'history_str','itemid',24046),(4753,'history','itemid',24046),(4754,'trends','itemid',24047),(4755,'trends_uint','itemid',24047),(4756,'history_text','itemid',24047),(4757,'history_log','itemid',24047),(4758,'history_uint','itemid',24047),(4759,'history_str','itemid',24047),(4760,'history','itemid',24047),(4761,'trends','itemid',24048),(4762,'trends_uint','itemid',24048),(4763,'history_text','itemid',24048),(4764,'history_log','itemid',24048),(4765,'history_uint','itemid',24048),(4766,'history_str','itemid',24048),(4767,'history','itemid',24048),(4768,'trends','itemid',24049),(4769,'trends_uint','itemid',24049),(4770,'history_text','itemid',24049),(4771,'history_log','itemid',24049),(4772,'history_uint','itemid',24049),(4773,'history_str','itemid',24049),(4774,'history','itemid',24049),(4775,'trends','itemid',24050),(4776,'trends_uint','itemid',24050),(4777,'history_text','itemid',24050),(4778,'history_log','itemid',24050),(4779,'history_uint','itemid',24050),(4780,'history_str','itemid',24050),(4781,'history','itemid',24050),(4782,'trends','itemid',24051),(4783,'trends_uint','itemid',24051),(4784,'history_text','itemid',24051),(4785,'history_log','itemid',24051),(4786,'history_uint','itemid',24051),(4787,'history_str','itemid',24051),(4788,'history','itemid',24051),(4789,'trends','itemid',24052),(4790,'trends_uint','itemid',24052),(4791,'history_text','itemid',24052),(4792,'history_log','itemid',24052),(4793,'history_uint','itemid',24052),(4794,'history_str','itemid',24052),(4795,'history','itemid',24052),(4796,'trends','itemid',24053),(4797,'trends_uint','itemid',24053),(4798,'history_text','itemid',24053),(4799,'history_log','itemid',24053),(4800,'history_uint','itemid',24053),(4801,'history_str','itemid',24053),(4802,'history','itemid',24053),(4803,'trends','itemid',24054),(4804,'trends_uint','itemid',24054),(4805,'history_text','itemid',24054),(4806,'history_log','itemid',24054),(4807,'history_uint','itemid',24054),(4808,'history_str','itemid',24054),(4809,'history','itemid',24054),(4810,'trends','itemid',24055),(4811,'trends_uint','itemid',24055),(4812,'history_text','itemid',24055),(4813,'history_log','itemid',24055),(4814,'history_uint','itemid',24055),(4815,'history_str','itemid',24055),(4816,'history','itemid',24055),(4817,'trends','itemid',24056),(4818,'trends_uint','itemid',24056),(4819,'history_text','itemid',24056),(4820,'history_log','itemid',24056),(4821,'history_uint','itemid',24056),(4822,'history_str','itemid',24056),(4823,'history','itemid',24056),(4824,'trends','itemid',24057),(4825,'trends_uint','itemid',24057),(4826,'history_text','itemid',24057),(4827,'history_log','itemid',24057),(4828,'history_uint','itemid',24057),(4829,'history_str','itemid',24057),(4830,'history','itemid',24057),(4831,'trends','itemid',24058),(4832,'trends_uint','itemid',24058),(4833,'history_text','itemid',24058),(4834,'history_log','itemid',24058),(4835,'history_uint','itemid',24058),(4836,'history_str','itemid',24058),(4837,'history','itemid',24058),(4838,'trends','itemid',24059),(4839,'trends_uint','itemid',24059),(4840,'history_text','itemid',24059),(4841,'history_log','itemid',24059),(4842,'history_uint','itemid',24059),(4843,'history_str','itemid',24059),(4844,'history','itemid',24059),(4845,'trends','itemid',24060),(4846,'trends_uint','itemid',24060),(4847,'history_text','itemid',24060),(4848,'history_log','itemid',24060),(4849,'history_uint','itemid',24060),(4850,'history_str','itemid',24060),(4851,'history','itemid',24060),(4852,'trends','itemid',24061),(4853,'trends_uint','itemid',24061),(4854,'history_text','itemid',24061),(4855,'history_log','itemid',24061),(4856,'history_uint','itemid',24061),(4857,'history_str','itemid',24061),(4858,'history','itemid',24061),(4859,'trends','itemid',24062),(4860,'trends_uint','itemid',24062),(4861,'history_text','itemid',24062),(4862,'history_log','itemid',24062),(4863,'history_uint','itemid',24062),(4864,'history_str','itemid',24062),(4865,'history','itemid',24062),(4866,'trends','itemid',24063),(4867,'trends_uint','itemid',24063),(4868,'history_text','itemid',24063),(4869,'history_log','itemid',24063),(4870,'history_uint','itemid',24063),(4871,'history_str','itemid',24063),(4872,'history','itemid',24063),(4873,'trends','itemid',24064),(4874,'trends_uint','itemid',24064),(4875,'history_text','itemid',24064),(4876,'history_log','itemid',24064),(4877,'history_uint','itemid',24064),(4878,'history_str','itemid',24064),(4879,'history','itemid',24064),(4880,'trends','itemid',24065),(4881,'trends_uint','itemid',24065),(4882,'history_text','itemid',24065),(4883,'history_log','itemid',24065),(4884,'history_uint','itemid',24065),(4885,'history_str','itemid',24065),(4886,'history','itemid',24065),(4887,'trends','itemid',24066),(4888,'trends_uint','itemid',24066),(4889,'history_text','itemid',24066),(4890,'history_log','itemid',24066),(4891,'history_uint','itemid',24066),(4892,'history_str','itemid',24066),(4893,'history','itemid',24066),(4894,'trends','itemid',24067),(4895,'trends_uint','itemid',24067),(4896,'history_text','itemid',24067),(4897,'history_log','itemid',24067),(4898,'history_uint','itemid',24067),(4899,'history_str','itemid',24067),(4900,'history','itemid',24067),(4901,'trends','itemid',24068),(4902,'trends_uint','itemid',24068),(4903,'history_text','itemid',24068),(4904,'history_log','itemid',24068),(4905,'history_uint','itemid',24068),(4906,'history_str','itemid',24068),(4907,'history','itemid',24068),(4908,'trends','itemid',24069),(4909,'trends_uint','itemid',24069),(4910,'history_text','itemid',24069),(4911,'history_log','itemid',24069),(4912,'history_uint','itemid',24069),(4913,'history_str','itemid',24069),(4914,'history','itemid',24069),(4915,'trends','itemid',24070),(4916,'trends_uint','itemid',24070),(4917,'history_text','itemid',24070),(4918,'history_log','itemid',24070),(4919,'history_uint','itemid',24070),(4920,'history_str','itemid',24070),(4921,'history','itemid',24070),(4922,'trends','itemid',24071),(4923,'trends_uint','itemid',24071),(4924,'history_text','itemid',24071),(4925,'history_log','itemid',24071),(4926,'history_uint','itemid',24071),(4927,'history_str','itemid',24071),(4928,'history','itemid',24071),(4929,'trends','itemid',24072),(4930,'trends_uint','itemid',24072),(4931,'history_text','itemid',24072),(4932,'history_log','itemid',24072),(4933,'history_uint','itemid',24072),(4934,'history_str','itemid',24072),(4935,'history','itemid',24072),(4936,'trends','itemid',24073),(4937,'trends_uint','itemid',24073),(4938,'history_text','itemid',24073),(4939,'history_log','itemid',24073),(4940,'history_uint','itemid',24073),(4941,'history_str','itemid',24073),(4942,'history','itemid',24073),(4943,'trends','itemid',24074),(4944,'trends_uint','itemid',24074),(4945,'history_text','itemid',24074),(4946,'history_log','itemid',24074),(4947,'history_uint','itemid',24074),(4948,'history_str','itemid',24074),(4949,'history','itemid',24074),(4950,'trends','itemid',24075),(4951,'trends_uint','itemid',24075),(4952,'history_text','itemid',24075),(4953,'history_log','itemid',24075),(4954,'history_uint','itemid',24075),(4955,'history_str','itemid',24075),(4956,'history','itemid',24075),(4957,'trends','itemid',24076),(4958,'trends_uint','itemid',24076),(4959,'history_text','itemid',24076),(4960,'history_log','itemid',24076),(4961,'history_uint','itemid',24076),(4962,'history_str','itemid',24076),(4963,'history','itemid',24076),(4964,'trends','itemid',24077),(4965,'trends_uint','itemid',24077),(4966,'history_text','itemid',24077),(4967,'history_log','itemid',24077),(4968,'history_uint','itemid',24077),(4969,'history_str','itemid',24077),(4970,'history','itemid',24077),(4971,'trends','itemid',24078),(4972,'trends_uint','itemid',24078),(4973,'history_text','itemid',24078),(4974,'history_log','itemid',24078),(4975,'history_uint','itemid',24078),(4976,'history_str','itemid',24078),(4977,'history','itemid',24078),(4978,'trends','itemid',24079),(4979,'trends_uint','itemid',24079),(4980,'history_text','itemid',24079),(4981,'history_log','itemid',24079),(4982,'history_uint','itemid',24079),(4983,'history_str','itemid',24079),(4984,'history','itemid',24079),(4985,'trends','itemid',24080),(4986,'trends_uint','itemid',24080),(4987,'history_text','itemid',24080),(4988,'history_log','itemid',24080),(4989,'history_uint','itemid',24080),(4990,'history_str','itemid',24080),(4991,'history','itemid',24080),(4992,'trends','itemid',24081),(4993,'trends_uint','itemid',24081),(4994,'history_text','itemid',24081),(4995,'history_log','itemid',24081),(4996,'history_uint','itemid',24081),(4997,'history_str','itemid',24081),(4998,'history','itemid',24081),(4999,'trends','itemid',24082),(5000,'trends_uint','itemid',24082),(5001,'history_text','itemid',24082),(5002,'history_log','itemid',24082),(5003,'history_uint','itemid',24082),(5004,'history_str','itemid',24082),(5005,'history','itemid',24082),(5006,'trends','itemid',24083),(5007,'trends_uint','itemid',24083),(5008,'history_text','itemid',24083),(5009,'history_log','itemid',24083),(5010,'history_uint','itemid',24083),(5011,'history_str','itemid',24083),(5012,'history','itemid',24083),(5013,'trends','itemid',24084),(5014,'trends_uint','itemid',24084),(5015,'history_text','itemid',24084),(5016,'history_log','itemid',24084),(5017,'history_uint','itemid',24084),(5018,'history_str','itemid',24084),(5019,'history','itemid',24084),(5020,'trends','itemid',24085),(5021,'trends_uint','itemid',24085),(5022,'history_text','itemid',24085),(5023,'history_log','itemid',24085),(5024,'history_uint','itemid',24085),(5025,'history_str','itemid',24085),(5026,'history','itemid',24085),(5027,'trends','itemid',24086),(5028,'trends_uint','itemid',24086),(5029,'history_text','itemid',24086),(5030,'history_log','itemid',24086),(5031,'history_uint','itemid',24086),(5032,'history_str','itemid',24086),(5033,'history','itemid',24086),(5034,'trends','itemid',24087),(5035,'trends_uint','itemid',24087),(5036,'history_text','itemid',24087),(5037,'history_log','itemid',24087),(5038,'history_uint','itemid',24087),(5039,'history_str','itemid',24087),(5040,'history','itemid',24087),(5041,'trends','itemid',24088),(5042,'trends_uint','itemid',24088),(5043,'history_text','itemid',24088),(5044,'history_log','itemid',24088),(5045,'history_uint','itemid',24088),(5046,'history_str','itemid',24088),(5047,'history','itemid',24088),(5048,'trends','itemid',24089),(5049,'trends_uint','itemid',24089),(5050,'history_text','itemid',24089),(5051,'history_log','itemid',24089),(5052,'history_uint','itemid',24089),(5053,'history_str','itemid',24089),(5054,'history','itemid',24089),(5055,'trends','itemid',24090),(5056,'trends_uint','itemid',24090),(5057,'history_text','itemid',24090),(5058,'history_log','itemid',24090),(5059,'history_uint','itemid',24090),(5060,'history_str','itemid',24090),(5061,'history','itemid',24090),(5062,'trends','itemid',24091),(5063,'trends_uint','itemid',24091),(5064,'history_text','itemid',24091),(5065,'history_log','itemid',24091),(5066,'history_uint','itemid',24091),(5067,'history_str','itemid',24091),(5068,'history','itemid',24091),(5069,'trends','itemid',24092),(5070,'trends_uint','itemid',24092),(5071,'history_text','itemid',24092),(5072,'history_log','itemid',24092),(5073,'history_uint','itemid',24092),(5074,'history_str','itemid',24092),(5075,'history','itemid',24092),(5076,'trends','itemid',24093),(5077,'trends_uint','itemid',24093),(5078,'history_text','itemid',24093),(5079,'history_log','itemid',24093),(5080,'history_uint','itemid',24093),(5081,'history_str','itemid',24093),(5082,'history','itemid',24093),(5083,'trends','itemid',24094),(5084,'trends_uint','itemid',24094),(5085,'history_text','itemid',24094),(5086,'history_log','itemid',24094),(5087,'history_uint','itemid',24094),(5088,'history_str','itemid',24094),(5089,'history','itemid',24094),(5090,'trends','itemid',24095),(5091,'trends_uint','itemid',24095),(5092,'history_text','itemid',24095),(5093,'history_log','itemid',24095),(5094,'history_uint','itemid',24095),(5095,'history_str','itemid',24095),(5096,'history','itemid',24095),(5097,'trends','itemid',24096),(5098,'trends_uint','itemid',24096),(5099,'history_text','itemid',24096),(5100,'history_log','itemid',24096),(5101,'history_uint','itemid',24096),(5102,'history_str','itemid',24096),(5103,'history','itemid',24096),(5104,'trends','itemid',24097),(5105,'trends_uint','itemid',24097),(5106,'history_text','itemid',24097),(5107,'history_log','itemid',24097),(5108,'history_uint','itemid',24097),(5109,'history_str','itemid',24097),(5110,'history','itemid',24097),(5111,'trends','itemid',24098),(5112,'trends_uint','itemid',24098),(5113,'history_text','itemid',24098),(5114,'history_log','itemid',24098),(5115,'history_uint','itemid',24098),(5116,'history_str','itemid',24098),(5117,'history','itemid',24098),(5118,'trends','itemid',24099),(5119,'trends_uint','itemid',24099),(5120,'history_text','itemid',24099),(5121,'history_log','itemid',24099),(5122,'history_uint','itemid',24099),(5123,'history_str','itemid',24099),(5124,'history','itemid',24099),(5125,'trends','itemid',24100),(5126,'trends_uint','itemid',24100),(5127,'history_text','itemid',24100),(5128,'history_log','itemid',24100),(5129,'history_uint','itemid',24100),(5130,'history_str','itemid',24100),(5131,'history','itemid',24100),(5132,'trends','itemid',24101),(5133,'trends_uint','itemid',24101),(5134,'history_text','itemid',24101),(5135,'history_log','itemid',24101),(5136,'history_uint','itemid',24101),(5137,'history_str','itemid',24101),(5138,'history','itemid',24101),(5139,'trends','itemid',24102),(5140,'trends_uint','itemid',24102),(5141,'history_text','itemid',24102),(5142,'history_log','itemid',24102),(5143,'history_uint','itemid',24102),(5144,'history_str','itemid',24102),(5145,'history','itemid',24102),(5146,'trends','itemid',24103),(5147,'trends_uint','itemid',24103),(5148,'history_text','itemid',24103),(5149,'history_log','itemid',24103),(5150,'history_uint','itemid',24103),(5151,'history_str','itemid',24103),(5152,'history','itemid',24103),(5153,'trends','itemid',24104),(5154,'trends_uint','itemid',24104),(5155,'history_text','itemid',24104),(5156,'history_log','itemid',24104),(5157,'history_uint','itemid',24104),(5158,'history_str','itemid',24104),(5159,'history','itemid',24104),(5160,'trends','itemid',24105),(5161,'trends_uint','itemid',24105),(5162,'history_text','itemid',24105),(5163,'history_log','itemid',24105),(5164,'history_uint','itemid',24105),(5165,'history_str','itemid',24105),(5166,'history','itemid',24105),(5167,'trends','itemid',24106),(5168,'trends_uint','itemid',24106),(5169,'history_text','itemid',24106),(5170,'history_log','itemid',24106),(5171,'history_uint','itemid',24106),(5172,'history_str','itemid',24106),(5173,'history','itemid',24106),(5174,'trends','itemid',24107),(5175,'trends_uint','itemid',24107),(5176,'history_text','itemid',24107),(5177,'history_log','itemid',24107),(5178,'history_uint','itemid',24107),(5179,'history_str','itemid',24107),(5180,'history','itemid',24107),(5181,'trends','itemid',24108),(5182,'trends_uint','itemid',24108),(5183,'history_text','itemid',24108),(5184,'history_log','itemid',24108),(5185,'history_uint','itemid',24108),(5186,'history_str','itemid',24108),(5187,'history','itemid',24108),(5188,'trends','itemid',24109),(5189,'trends_uint','itemid',24109),(5190,'history_text','itemid',24109),(5191,'history_log','itemid',24109),(5192,'history_uint','itemid',24109),(5193,'history_str','itemid',24109),(5194,'history','itemid',24109),(5195,'trends','itemid',24110),(5196,'trends_uint','itemid',24110),(5197,'history_text','itemid',24110),(5198,'history_log','itemid',24110),(5199,'history_uint','itemid',24110),(5200,'history_str','itemid',24110),(5201,'history','itemid',24110),(5202,'trends','itemid',24111),(5203,'trends_uint','itemid',24111),(5204,'history_text','itemid',24111),(5205,'history_log','itemid',24111),(5206,'history_uint','itemid',24111),(5207,'history_str','itemid',24111),(5208,'history','itemid',24111),(5209,'trends','itemid',24112),(5210,'trends_uint','itemid',24112),(5211,'history_text','itemid',24112),(5212,'history_log','itemid',24112),(5213,'history_uint','itemid',24112),(5214,'history_str','itemid',24112),(5215,'history','itemid',24112),(5216,'trends','itemid',24113),(5217,'trends_uint','itemid',24113),(5218,'history_text','itemid',24113),(5219,'history_log','itemid',24113),(5220,'history_uint','itemid',24113),(5221,'history_str','itemid',24113),(5222,'history','itemid',24113),(5223,'trends','itemid',24114),(5224,'trends_uint','itemid',24114),(5225,'history_text','itemid',24114),(5226,'history_log','itemid',24114),(5227,'history_uint','itemid',24114),(5228,'history_str','itemid',24114),(5229,'history','itemid',24114),(5230,'trends','itemid',24115),(5231,'trends_uint','itemid',24115),(5232,'history_text','itemid',24115),(5233,'history_log','itemid',24115),(5234,'history_uint','itemid',24115),(5235,'history_str','itemid',24115),(5236,'history','itemid',24115),(5237,'trends','itemid',24116),(5238,'trends_uint','itemid',24116),(5239,'history_text','itemid',24116),(5240,'history_log','itemid',24116),(5241,'history_uint','itemid',24116),(5242,'history_str','itemid',24116),(5243,'history','itemid',24116),(5244,'trends','itemid',24117),(5245,'trends_uint','itemid',24117),(5246,'history_text','itemid',24117),(5247,'history_log','itemid',24117),(5248,'history_uint','itemid',24117),(5249,'history_str','itemid',24117),(5250,'history','itemid',24117),(5251,'trends','itemid',24118),(5252,'trends_uint','itemid',24118),(5253,'history_text','itemid',24118),(5254,'history_log','itemid',24118),(5255,'history_uint','itemid',24118),(5256,'history_str','itemid',24118),(5257,'history','itemid',24118),(5258,'trends','itemid',24119),(5259,'trends_uint','itemid',24119),(5260,'history_text','itemid',24119),(5261,'history_log','itemid',24119),(5262,'history_uint','itemid',24119),(5263,'history_str','itemid',24119),(5264,'history','itemid',24119),(5265,'trends','itemid',24120),(5266,'trends_uint','itemid',24120),(5267,'history_text','itemid',24120),(5268,'history_log','itemid',24120),(5269,'history_uint','itemid',24120),(5270,'history_str','itemid',24120),(5271,'history','itemid',24120),(5272,'trends','itemid',24121),(5273,'trends_uint','itemid',24121),(5274,'history_text','itemid',24121),(5275,'history_log','itemid',24121),(5276,'history_uint','itemid',24121),(5277,'history_str','itemid',24121),(5278,'history','itemid',24121),(5279,'trends','itemid',24122),(5280,'trends_uint','itemid',24122),(5281,'history_text','itemid',24122),(5282,'history_log','itemid',24122),(5283,'history_uint','itemid',24122),(5284,'history_str','itemid',24122),(5285,'history','itemid',24122),(5286,'trends','itemid',24123),(5287,'trends_uint','itemid',24123),(5288,'history_text','itemid',24123),(5289,'history_log','itemid',24123),(5290,'history_uint','itemid',24123),(5291,'history_str','itemid',24123),(5292,'history','itemid',24123),(5293,'trends','itemid',24124),(5294,'trends_uint','itemid',24124),(5295,'history_text','itemid',24124),(5296,'history_log','itemid',24124),(5297,'history_uint','itemid',24124),(5298,'history_str','itemid',24124),(5299,'history','itemid',24124),(5300,'trends','itemid',24125),(5301,'trends_uint','itemid',24125),(5302,'history_text','itemid',24125),(5303,'history_log','itemid',24125),(5304,'history_uint','itemid',24125),(5305,'history_str','itemid',24125),(5306,'history','itemid',24125),(5307,'trends','itemid',24126),(5308,'trends_uint','itemid',24126),(5309,'history_text','itemid',24126),(5310,'history_log','itemid',24126),(5311,'history_uint','itemid',24126),(5312,'history_str','itemid',24126),(5313,'history','itemid',24126),(5314,'trends','itemid',24127),(5315,'trends_uint','itemid',24127),(5316,'history_text','itemid',24127),(5317,'history_log','itemid',24127),(5318,'history_uint','itemid',24127),(5319,'history_str','itemid',24127),(5320,'history','itemid',24127),(5321,'trends','itemid',24128),(5322,'trends_uint','itemid',24128),(5323,'history_text','itemid',24128),(5324,'history_log','itemid',24128),(5325,'history_uint','itemid',24128),(5326,'history_str','itemid',24128),(5327,'history','itemid',24128),(5328,'trends','itemid',24129),(5329,'trends_uint','itemid',24129),(5330,'history_text','itemid',24129),(5331,'history_log','itemid',24129),(5332,'history_uint','itemid',24129),(5333,'history_str','itemid',24129),(5334,'history','itemid',24129),(5335,'trends','itemid',24130),(5336,'trends_uint','itemid',24130),(5337,'history_text','itemid',24130),(5338,'history_log','itemid',24130),(5339,'history_uint','itemid',24130),(5340,'history_str','itemid',24130),(5341,'history','itemid',24130),(5342,'trends','itemid',24131),(5343,'trends_uint','itemid',24131),(5344,'history_text','itemid',24131),(5345,'history_log','itemid',24131),(5346,'history_uint','itemid',24131),(5347,'history_str','itemid',24131),(5348,'history','itemid',24131),(5349,'trends','itemid',24132),(5350,'trends_uint','itemid',24132),(5351,'history_text','itemid',24132),(5352,'history_log','itemid',24132),(5353,'history_uint','itemid',24132),(5354,'history_str','itemid',24132),(5355,'history','itemid',24132),(5356,'trends','itemid',24133),(5357,'trends_uint','itemid',24133),(5358,'history_text','itemid',24133),(5359,'history_log','itemid',24133),(5360,'history_uint','itemid',24133),(5361,'history_str','itemid',24133),(5362,'history','itemid',24133),(5363,'trends','itemid',24134),(5364,'trends_uint','itemid',24134),(5365,'history_text','itemid',24134),(5366,'history_log','itemid',24134),(5367,'history_uint','itemid',24134),(5368,'history_str','itemid',24134),(5369,'history','itemid',24134),(5370,'trends','itemid',24135),(5371,'trends_uint','itemid',24135),(5372,'history_text','itemid',24135),(5373,'history_log','itemid',24135),(5374,'history_uint','itemid',24135),(5375,'history_str','itemid',24135),(5376,'history','itemid',24135),(5377,'trends','itemid',24136),(5378,'trends_uint','itemid',24136),(5379,'history_text','itemid',24136),(5380,'history_log','itemid',24136),(5381,'history_uint','itemid',24136),(5382,'history_str','itemid',24136),(5383,'history','itemid',24136),(5384,'trends','itemid',24137),(5385,'trends_uint','itemid',24137),(5386,'history_text','itemid',24137),(5387,'history_log','itemid',24137),(5388,'history_uint','itemid',24137),(5389,'history_str','itemid',24137),(5390,'history','itemid',24137),(5391,'trends','itemid',24138),(5392,'trends_uint','itemid',24138),(5393,'history_text','itemid',24138),(5394,'history_log','itemid',24138),(5395,'history_uint','itemid',24138),(5396,'history_str','itemid',24138),(5397,'history','itemid',24138),(5398,'trends','itemid',24139),(5399,'trends_uint','itemid',24139),(5400,'history_text','itemid',24139),(5401,'history_log','itemid',24139),(5402,'history_uint','itemid',24139),(5403,'history_str','itemid',24139),(5404,'history','itemid',24139),(5405,'trends','itemid',24140),(5406,'trends_uint','itemid',24140),(5407,'history_text','itemid',24140),(5408,'history_log','itemid',24140),(5409,'history_uint','itemid',24140),(5410,'history_str','itemid',24140),(5411,'history','itemid',24140),(5412,'trends','itemid',24141),(5413,'trends_uint','itemid',24141),(5414,'history_text','itemid',24141),(5415,'history_log','itemid',24141),(5416,'history_uint','itemid',24141),(5417,'history_str','itemid',24141),(5418,'history','itemid',24141),(5419,'trends','itemid',24142),(5420,'trends_uint','itemid',24142),(5421,'history_text','itemid',24142),(5422,'history_log','itemid',24142),(5423,'history_uint','itemid',24142),(5424,'history_str','itemid',24142),(5425,'history','itemid',24142),(5426,'trends','itemid',24143),(5427,'trends_uint','itemid',24143),(5428,'history_text','itemid',24143),(5429,'history_log','itemid',24143),(5430,'history_uint','itemid',24143),(5431,'history_str','itemid',24143),(5432,'history','itemid',24143),(5433,'trends','itemid',24144),(5434,'trends_uint','itemid',24144),(5435,'history_text','itemid',24144),(5436,'history_log','itemid',24144),(5437,'history_uint','itemid',24144),(5438,'history_str','itemid',24144),(5439,'history','itemid',24144),(5440,'trends','itemid',24145),(5441,'trends_uint','itemid',24145),(5442,'history_text','itemid',24145),(5443,'history_log','itemid',24145),(5444,'history_uint','itemid',24145),(5445,'history_str','itemid',24145),(5446,'history','itemid',24145),(5447,'trends','itemid',24146),(5448,'trends_uint','itemid',24146),(5449,'history_text','itemid',24146),(5450,'history_log','itemid',24146),(5451,'history_uint','itemid',24146),(5452,'history_str','itemid',24146),(5453,'history','itemid',24146),(5454,'trends','itemid',24147),(5455,'trends_uint','itemid',24147),(5456,'history_text','itemid',24147),(5457,'history_log','itemid',24147),(5458,'history_uint','itemid',24147),(5459,'history_str','itemid',24147),(5460,'history','itemid',24147),(5461,'trends','itemid',24148),(5462,'trends_uint','itemid',24148),(5463,'history_text','itemid',24148),(5464,'history_log','itemid',24148),(5465,'history_uint','itemid',24148),(5466,'history_str','itemid',24148),(5467,'history','itemid',24148),(5468,'trends','itemid',24149),(5469,'trends_uint','itemid',24149),(5470,'history_text','itemid',24149),(5471,'history_log','itemid',24149),(5472,'history_uint','itemid',24149),(5473,'history_str','itemid',24149),(5474,'history','itemid',24149),(5475,'trends','itemid',24150),(5476,'trends_uint','itemid',24150),(5477,'history_text','itemid',24150),(5478,'history_log','itemid',24150),(5479,'history_uint','itemid',24150),(5480,'history_str','itemid',24150),(5481,'history','itemid',24150),(5482,'trends','itemid',24151),(5483,'trends_uint','itemid',24151),(5484,'history_text','itemid',24151),(5485,'history_log','itemid',24151),(5486,'history_uint','itemid',24151),(5487,'history_str','itemid',24151),(5488,'history','itemid',24151),(5489,'trends','itemid',24152),(5490,'trends_uint','itemid',24152),(5491,'history_text','itemid',24152),(5492,'history_log','itemid',24152),(5493,'history_uint','itemid',24152),(5494,'history_str','itemid',24152),(5495,'history','itemid',24152),(5496,'trends','itemid',24153),(5497,'trends_uint','itemid',24153),(5498,'history_text','itemid',24153),(5499,'history_log','itemid',24153),(5500,'history_uint','itemid',24153),(5501,'history_str','itemid',24153),(5502,'history','itemid',24153),(5503,'trends','itemid',24154),(5504,'trends_uint','itemid',24154),(5505,'history_text','itemid',24154),(5506,'history_log','itemid',24154),(5507,'history_uint','itemid',24154),(5508,'history_str','itemid',24154),(5509,'history','itemid',24154),(5510,'trends','itemid',24155),(5511,'trends_uint','itemid',24155),(5512,'history_text','itemid',24155),(5513,'history_log','itemid',24155),(5514,'history_uint','itemid',24155),(5515,'history_str','itemid',24155),(5516,'history','itemid',24155),(5517,'trends','itemid',24156),(5518,'trends_uint','itemid',24156),(5519,'history_text','itemid',24156),(5520,'history_log','itemid',24156),(5521,'history_uint','itemid',24156),(5522,'history_str','itemid',24156),(5523,'history','itemid',24156),(5524,'trends','itemid',24157),(5525,'trends_uint','itemid',24157),(5526,'history_text','itemid',24157),(5527,'history_log','itemid',24157),(5528,'history_uint','itemid',24157),(5529,'history_str','itemid',24157),(5530,'history','itemid',24157),(5531,'trends','itemid',24158),(5532,'trends_uint','itemid',24158),(5533,'history_text','itemid',24158),(5534,'history_log','itemid',24158),(5535,'history_uint','itemid',24158),(5536,'history_str','itemid',24158),(5537,'history','itemid',24158),(5538,'trends','itemid',24159),(5539,'trends_uint','itemid',24159),(5540,'history_text','itemid',24159),(5541,'history_log','itemid',24159),(5542,'history_uint','itemid',24159),(5543,'history_str','itemid',24159),(5544,'history','itemid',24159),(5545,'trends','itemid',24160),(5546,'trends_uint','itemid',24160),(5547,'history_text','itemid',24160),(5548,'history_log','itemid',24160),(5549,'history_uint','itemid',24160),(5550,'history_str','itemid',24160),(5551,'history','itemid',24160),(5552,'trends','itemid',24161),(5553,'trends_uint','itemid',24161),(5554,'history_text','itemid',24161),(5555,'history_log','itemid',24161),(5556,'history_uint','itemid',24161),(5557,'history_str','itemid',24161),(5558,'history','itemid',24161),(5559,'trends','itemid',24162),(5560,'trends_uint','itemid',24162),(5561,'history_text','itemid',24162),(5562,'history_log','itemid',24162),(5563,'history_uint','itemid',24162),(5564,'history_str','itemid',24162),(5565,'history','itemid',24162),(5566,'trends','itemid',24163),(5567,'trends_uint','itemid',24163),(5568,'history_text','itemid',24163),(5569,'history_log','itemid',24163),(5570,'history_uint','itemid',24163),(5571,'history_str','itemid',24163),(5572,'history','itemid',24163),(5573,'trends','itemid',24164),(5574,'trends_uint','itemid',24164),(5575,'history_text','itemid',24164),(5576,'history_log','itemid',24164),(5577,'history_uint','itemid',24164),(5578,'history_str','itemid',24164),(5579,'history','itemid',24164),(5580,'trends','itemid',24165),(5581,'trends_uint','itemid',24165),(5582,'history_text','itemid',24165),(5583,'history_log','itemid',24165),(5584,'history_uint','itemid',24165),(5585,'history_str','itemid',24165),(5586,'history','itemid',24165),(5587,'trends','itemid',24166),(5588,'trends_uint','itemid',24166),(5589,'history_text','itemid',24166),(5590,'history_log','itemid',24166),(5591,'history_uint','itemid',24166),(5592,'history_str','itemid',24166),(5593,'history','itemid',24166),(5594,'trends','itemid',24167),(5595,'trends_uint','itemid',24167),(5596,'history_text','itemid',24167),(5597,'history_log','itemid',24167),(5598,'history_uint','itemid',24167),(5599,'history_str','itemid',24167),(5600,'history','itemid',24167),(5601,'trends','itemid',24168),(5602,'trends_uint','itemid',24168),(5603,'history_text','itemid',24168),(5604,'history_log','itemid',24168),(5605,'history_uint','itemid',24168),(5606,'history_str','itemid',24168),(5607,'history','itemid',24168),(5608,'trends','itemid',24169),(5609,'trends_uint','itemid',24169),(5610,'history_text','itemid',24169),(5611,'history_log','itemid',24169),(5612,'history_uint','itemid',24169),(5613,'history_str','itemid',24169),(5614,'history','itemid',24169),(5615,'trends','itemid',24170),(5616,'trends_uint','itemid',24170),(5617,'history_text','itemid',24170),(5618,'history_log','itemid',24170),(5619,'history_uint','itemid',24170),(5620,'history_str','itemid',24170),(5621,'history','itemid',24170),(5622,'trends','itemid',24171),(5623,'trends_uint','itemid',24171),(5624,'history_text','itemid',24171),(5625,'history_log','itemid',24171),(5626,'history_uint','itemid',24171),(5627,'history_str','itemid',24171),(5628,'history','itemid',24171),(5629,'trends','itemid',24172),(5630,'trends_uint','itemid',24172),(5631,'history_text','itemid',24172),(5632,'history_log','itemid',24172),(5633,'history_uint','itemid',24172),(5634,'history_str','itemid',24172),(5635,'history','itemid',24172),(5636,'trends','itemid',24173),(5637,'trends_uint','itemid',24173),(5638,'history_text','itemid',24173),(5639,'history_log','itemid',24173),(5640,'history_uint','itemid',24173),(5641,'history_str','itemid',24173),(5642,'history','itemid',24173),(5643,'trends','itemid',24174),(5644,'trends_uint','itemid',24174),(5645,'history_text','itemid',24174),(5646,'history_log','itemid',24174),(5647,'history_uint','itemid',24174),(5648,'history_str','itemid',24174),(5649,'history','itemid',24174),(5650,'trends','itemid',24175),(5651,'trends_uint','itemid',24175),(5652,'history_text','itemid',24175),(5653,'history_log','itemid',24175),(5654,'history_uint','itemid',24175),(5655,'history_str','itemid',24175),(5656,'history','itemid',24175),(5657,'trends','itemid',24176),(5658,'trends_uint','itemid',24176),(5659,'history_text','itemid',24176),(5660,'history_log','itemid',24176),(5661,'history_uint','itemid',24176),(5662,'history_str','itemid',24176),(5663,'history','itemid',24176),(5664,'trends','itemid',24177),(5665,'trends_uint','itemid',24177),(5666,'history_text','itemid',24177),(5667,'history_log','itemid',24177),(5668,'history_uint','itemid',24177),(5669,'history_str','itemid',24177),(5670,'history','itemid',24177),(5671,'trends','itemid',24178),(5672,'trends_uint','itemid',24178),(5673,'history_text','itemid',24178),(5674,'history_log','itemid',24178),(5675,'history_uint','itemid',24178),(5676,'history_str','itemid',24178),(5677,'history','itemid',24178),(5678,'trends','itemid',24179),(5679,'trends_uint','itemid',24179),(5680,'history_text','itemid',24179),(5681,'history_log','itemid',24179),(5682,'history_uint','itemid',24179),(5683,'history_str','itemid',24179),(5684,'history','itemid',24179),(5685,'trends','itemid',24180),(5686,'trends_uint','itemid',24180),(5687,'history_text','itemid',24180),(5688,'history_log','itemid',24180),(5689,'history_uint','itemid',24180),(5690,'history_str','itemid',24180),(5691,'history','itemid',24180),(5692,'trends','itemid',24181),(5693,'trends_uint','itemid',24181),(5694,'history_text','itemid',24181),(5695,'history_log','itemid',24181),(5696,'history_uint','itemid',24181),(5697,'history_str','itemid',24181),(5698,'history','itemid',24181),(5699,'trends','itemid',24182),(5700,'trends_uint','itemid',24182),(5701,'history_text','itemid',24182),(5702,'history_log','itemid',24182),(5703,'history_uint','itemid',24182),(5704,'history_str','itemid',24182),(5705,'history','itemid',24182),(5706,'trends','itemid',24183),(5707,'trends_uint','itemid',24183),(5708,'history_text','itemid',24183),(5709,'history_log','itemid',24183),(5710,'history_uint','itemid',24183),(5711,'history_str','itemid',24183),(5712,'history','itemid',24183),(5713,'trends','itemid',24184),(5714,'trends_uint','itemid',24184),(5715,'history_text','itemid',24184),(5716,'history_log','itemid',24184),(5717,'history_uint','itemid',24184),(5718,'history_str','itemid',24184),(5719,'history','itemid',24184),(5720,'trends','itemid',24185),(5721,'trends_uint','itemid',24185),(5722,'history_text','itemid',24185),(5723,'history_log','itemid',24185),(5724,'history_uint','itemid',24185),(5725,'history_str','itemid',24185),(5726,'history','itemid',24185),(5727,'trends','itemid',24186),(5728,'trends_uint','itemid',24186),(5729,'history_text','itemid',24186),(5730,'history_log','itemid',24186),(5731,'history_uint','itemid',24186),(5732,'history_str','itemid',24186),(5733,'history','itemid',24186),(5734,'trends','itemid',24187),(5735,'trends_uint','itemid',24187),(5736,'history_text','itemid',24187),(5737,'history_log','itemid',24187),(5738,'history_uint','itemid',24187),(5739,'history_str','itemid',24187),(5740,'history','itemid',24187),(5741,'trends','itemid',24188),(5742,'trends_uint','itemid',24188),(5743,'history_text','itemid',24188),(5744,'history_log','itemid',24188),(5745,'history_uint','itemid',24188),(5746,'history_str','itemid',24188),(5747,'history','itemid',24188),(5748,'trends','itemid',24189),(5749,'trends_uint','itemid',24189),(5750,'history_text','itemid',24189),(5751,'history_log','itemid',24189),(5752,'history_uint','itemid',24189),(5753,'history_str','itemid',24189),(5754,'history','itemid',24189),(5755,'trends','itemid',24190),(5756,'trends_uint','itemid',24190),(5757,'history_text','itemid',24190),(5758,'history_log','itemid',24190),(5759,'history_uint','itemid',24190),(5760,'history_str','itemid',24190),(5761,'history','itemid',24190),(5762,'trends','itemid',24191),(5763,'trends_uint','itemid',24191),(5764,'history_text','itemid',24191),(5765,'history_log','itemid',24191),(5766,'history_uint','itemid',24191),(5767,'history_str','itemid',24191),(5768,'history','itemid',24191),(5769,'trends','itemid',24192),(5770,'trends_uint','itemid',24192),(5771,'history_text','itemid',24192),(5772,'history_log','itemid',24192),(5773,'history_uint','itemid',24192),(5774,'history_str','itemid',24192),(5775,'history','itemid',24192),(5776,'trends','itemid',24193),(5777,'trends_uint','itemid',24193),(5778,'history_text','itemid',24193),(5779,'history_log','itemid',24193),(5780,'history_uint','itemid',24193),(5781,'history_str','itemid',24193),(5782,'history','itemid',24193),(5783,'trends','itemid',24194),(5784,'trends_uint','itemid',24194),(5785,'history_text','itemid',24194),(5786,'history_log','itemid',24194),(5787,'history_uint','itemid',24194),(5788,'history_str','itemid',24194),(5789,'history','itemid',24194),(5790,'trends','itemid',24195),(5791,'trends_uint','itemid',24195),(5792,'history_text','itemid',24195),(5793,'history_log','itemid',24195),(5794,'history_uint','itemid',24195),(5795,'history_str','itemid',24195),(5796,'history','itemid',24195),(5797,'trends','itemid',24196),(5798,'trends_uint','itemid',24196),(5799,'history_text','itemid',24196),(5800,'history_log','itemid',24196),(5801,'history_uint','itemid',24196),(5802,'history_str','itemid',24196),(5803,'history','itemid',24196),(5804,'trends','itemid',24197),(5805,'trends_uint','itemid',24197),(5806,'history_text','itemid',24197),(5807,'history_log','itemid',24197),(5808,'history_uint','itemid',24197),(5809,'history_str','itemid',24197),(5810,'history','itemid',24197),(5811,'trends','itemid',24198),(5812,'trends_uint','itemid',24198),(5813,'history_text','itemid',24198),(5814,'history_log','itemid',24198),(5815,'history_uint','itemid',24198),(5816,'history_str','itemid',24198),(5817,'history','itemid',24198),(5818,'trends','itemid',24199),(5819,'trends_uint','itemid',24199),(5820,'history_text','itemid',24199),(5821,'history_log','itemid',24199),(5822,'history_uint','itemid',24199),(5823,'history_str','itemid',24199),(5824,'history','itemid',24199),(5825,'trends','itemid',24200),(5826,'trends_uint','itemid',24200),(5827,'history_text','itemid',24200),(5828,'history_log','itemid',24200),(5829,'history_uint','itemid',24200),(5830,'history_str','itemid',24200),(5831,'history','itemid',24200),(5832,'trends','itemid',24201),(5833,'trends_uint','itemid',24201),(5834,'history_text','itemid',24201),(5835,'history_log','itemid',24201),(5836,'history_uint','itemid',24201),(5837,'history_str','itemid',24201),(5838,'history','itemid',24201),(5839,'trends','itemid',24202),(5840,'trends_uint','itemid',24202),(5841,'history_text','itemid',24202),(5842,'history_log','itemid',24202),(5843,'history_uint','itemid',24202),(5844,'history_str','itemid',24202),(5845,'history','itemid',24202),(5846,'trends','itemid',24203),(5847,'trends_uint','itemid',24203),(5848,'history_text','itemid',24203),(5849,'history_log','itemid',24203),(5850,'history_uint','itemid',24203),(5851,'history_str','itemid',24203),(5852,'history','itemid',24203),(5853,'trends','itemid',24204),(5854,'trends_uint','itemid',24204),(5855,'history_text','itemid',24204),(5856,'history_log','itemid',24204),(5857,'history_uint','itemid',24204),(5858,'history_str','itemid',24204),(5859,'history','itemid',24204),(5860,'trends','itemid',24205),(5861,'trends_uint','itemid',24205),(5862,'history_text','itemid',24205),(5863,'history_log','itemid',24205),(5864,'history_uint','itemid',24205),(5865,'history_str','itemid',24205),(5866,'history','itemid',24205),(5867,'trends','itemid',24206),(5868,'trends_uint','itemid',24206),(5869,'history_text','itemid',24206),(5870,'history_log','itemid',24206),(5871,'history_uint','itemid',24206),(5872,'history_str','itemid',24206),(5873,'history','itemid',24206),(5874,'trends','itemid',24207),(5875,'trends_uint','itemid',24207),(5876,'history_text','itemid',24207),(5877,'history_log','itemid',24207),(5878,'history_uint','itemid',24207),(5879,'history_str','itemid',24207),(5880,'history','itemid',24207),(5881,'trends','itemid',24208),(5882,'trends_uint','itemid',24208),(5883,'history_text','itemid',24208),(5884,'history_log','itemid',24208),(5885,'history_uint','itemid',24208),(5886,'history_str','itemid',24208),(5887,'history','itemid',24208),(5888,'trends','itemid',24209),(5889,'trends_uint','itemid',24209),(5890,'history_text','itemid',24209),(5891,'history_log','itemid',24209),(5892,'history_uint','itemid',24209),(5893,'history_str','itemid',24209),(5894,'history','itemid',24209),(5895,'trends','itemid',24210),(5896,'trends_uint','itemid',24210),(5897,'history_text','itemid',24210),(5898,'history_log','itemid',24210),(5899,'history_uint','itemid',24210),(5900,'history_str','itemid',24210),(5901,'history','itemid',24210),(5902,'trends','itemid',24211),(5903,'trends_uint','itemid',24211),(5904,'history_text','itemid',24211),(5905,'history_log','itemid',24211),(5906,'history_uint','itemid',24211),(5907,'history_str','itemid',24211),(5908,'history','itemid',24211),(5909,'trends','itemid',24212),(5910,'trends_uint','itemid',24212),(5911,'history_text','itemid',24212),(5912,'history_log','itemid',24212),(5913,'history_uint','itemid',24212),(5914,'history_str','itemid',24212),(5915,'history','itemid',24212),(5916,'trends','itemid',24213),(5917,'trends_uint','itemid',24213),(5918,'history_text','itemid',24213),(5919,'history_log','itemid',24213),(5920,'history_uint','itemid',24213),(5921,'history_str','itemid',24213),(5922,'history','itemid',24213),(5923,'trends','itemid',24214),(5924,'trends_uint','itemid',24214),(5925,'history_text','itemid',24214),(5926,'history_log','itemid',24214),(5927,'history_uint','itemid',24214),(5928,'history_str','itemid',24214),(5929,'history','itemid',24214),(5930,'trends','itemid',24215),(5931,'trends_uint','itemid',24215),(5932,'history_text','itemid',24215),(5933,'history_log','itemid',24215),(5934,'history_uint','itemid',24215),(5935,'history_str','itemid',24215),(5936,'history','itemid',24215),(5937,'trends','itemid',24216),(5938,'trends_uint','itemid',24216),(5939,'history_text','itemid',24216),(5940,'history_log','itemid',24216),(5941,'history_uint','itemid',24216),(5942,'history_str','itemid',24216),(5943,'history','itemid',24216),(5944,'trends','itemid',24217),(5945,'trends_uint','itemid',24217),(5946,'history_text','itemid',24217),(5947,'history_log','itemid',24217),(5948,'history_uint','itemid',24217),(5949,'history_str','itemid',24217),(5950,'history','itemid',24217),(5951,'trends','itemid',24218),(5952,'trends_uint','itemid',24218),(5953,'history_text','itemid',24218),(5954,'history_log','itemid',24218),(5955,'history_uint','itemid',24218),(5956,'history_str','itemid',24218),(5957,'history','itemid',24218),(5958,'trends','itemid',24219),(5959,'trends_uint','itemid',24219),(5960,'history_text','itemid',24219),(5961,'history_log','itemid',24219),(5962,'history_uint','itemid',24219),(5963,'history_str','itemid',24219),(5964,'history','itemid',24219),(5965,'trends','itemid',24220),(5966,'trends_uint','itemid',24220),(5967,'history_text','itemid',24220),(5968,'history_log','itemid',24220),(5969,'history_uint','itemid',24220),(5970,'history_str','itemid',24220),(5971,'history','itemid',24220),(5972,'trends','itemid',24221),(5973,'trends_uint','itemid',24221),(5974,'history_text','itemid',24221),(5975,'history_log','itemid',24221),(5976,'history_uint','itemid',24221),(5977,'history_str','itemid',24221),(5978,'history','itemid',24221),(5979,'trends','itemid',24222),(5980,'trends_uint','itemid',24222),(5981,'history_text','itemid',24222),(5982,'history_log','itemid',24222),(5983,'history_uint','itemid',24222),(5984,'history_str','itemid',24222),(5985,'history','itemid',24222),(5986,'trends','itemid',24223),(5987,'trends_uint','itemid',24223),(5988,'history_text','itemid',24223),(5989,'history_log','itemid',24223),(5990,'history_uint','itemid',24223),(5991,'history_str','itemid',24223),(5992,'history','itemid',24223),(5993,'trends','itemid',24224),(5994,'trends_uint','itemid',24224),(5995,'history_text','itemid',24224),(5996,'history_log','itemid',24224),(5997,'history_uint','itemid',24224),(5998,'history_str','itemid',24224),(5999,'history','itemid',24224),(6000,'trends','itemid',24225),(6001,'trends_uint','itemid',24225),(6002,'history_text','itemid',24225),(6003,'history_log','itemid',24225),(6004,'history_uint','itemid',24225),(6005,'history_str','itemid',24225),(6006,'history','itemid',24225),(6007,'trends','itemid',24226),(6008,'trends_uint','itemid',24226),(6009,'history_text','itemid',24226),(6010,'history_log','itemid',24226),(6011,'history_uint','itemid',24226),(6012,'history_str','itemid',24226),(6013,'history','itemid',24226),(6014,'trends','itemid',24227),(6015,'trends_uint','itemid',24227),(6016,'history_text','itemid',24227),(6017,'history_log','itemid',24227),(6018,'history_uint','itemid',24227),(6019,'history_str','itemid',24227),(6020,'history','itemid',24227),(6021,'trends','itemid',24228),(6022,'trends_uint','itemid',24228),(6023,'history_text','itemid',24228),(6024,'history_log','itemid',24228),(6025,'history_uint','itemid',24228),(6026,'history_str','itemid',24228),(6027,'history','itemid',24228),(6028,'trends','itemid',24229),(6029,'trends_uint','itemid',24229),(6030,'history_text','itemid',24229),(6031,'history_log','itemid',24229),(6032,'history_uint','itemid',24229),(6033,'history_str','itemid',24229),(6034,'history','itemid',24229),(6035,'trends','itemid',24230),(6036,'trends_uint','itemid',24230),(6037,'history_text','itemid',24230),(6038,'history_log','itemid',24230),(6039,'history_uint','itemid',24230),(6040,'history_str','itemid',24230),(6041,'history','itemid',24230),(6042,'trends','itemid',24231),(6043,'trends_uint','itemid',24231),(6044,'history_text','itemid',24231),(6045,'history_log','itemid',24231),(6046,'history_uint','itemid',24231),(6047,'history_str','itemid',24231),(6048,'history','itemid',24231),(6049,'trends','itemid',24232),(6050,'trends_uint','itemid',24232),(6051,'history_text','itemid',24232),(6052,'history_log','itemid',24232),(6053,'history_uint','itemid',24232),(6054,'history_str','itemid',24232),(6055,'history','itemid',24232),(6056,'trends','itemid',24233),(6057,'trends_uint','itemid',24233),(6058,'history_text','itemid',24233),(6059,'history_log','itemid',24233),(6060,'history_uint','itemid',24233),(6061,'history_str','itemid',24233),(6062,'history','itemid',24233),(6063,'trends','itemid',24234),(6064,'trends_uint','itemid',24234),(6065,'history_text','itemid',24234),(6066,'history_log','itemid',24234),(6067,'history_uint','itemid',24234),(6068,'history_str','itemid',24234),(6069,'history','itemid',24234),(6070,'trends','itemid',24235),(6071,'trends_uint','itemid',24235),(6072,'history_text','itemid',24235),(6073,'history_log','itemid',24235),(6074,'history_uint','itemid',24235),(6075,'history_str','itemid',24235),(6076,'history','itemid',24235),(6077,'trends','itemid',24236),(6078,'trends_uint','itemid',24236),(6079,'history_text','itemid',24236),(6080,'history_log','itemid',24236),(6081,'history_uint','itemid',24236),(6082,'history_str','itemid',24236),(6083,'history','itemid',24236),(6084,'trends','itemid',24237),(6085,'trends_uint','itemid',24237),(6086,'history_text','itemid',24237),(6087,'history_log','itemid',24237),(6088,'history_uint','itemid',24237),(6089,'history_str','itemid',24237),(6090,'history','itemid',24237),(6091,'trends','itemid',24238),(6092,'trends_uint','itemid',24238),(6093,'history_text','itemid',24238),(6094,'history_log','itemid',24238),(6095,'history_uint','itemid',24238),(6096,'history_str','itemid',24238),(6097,'history','itemid',24238),(6098,'trends','itemid',24239),(6099,'trends_uint','itemid',24239),(6100,'history_text','itemid',24239),(6101,'history_log','itemid',24239),(6102,'history_uint','itemid',24239),(6103,'history_str','itemid',24239),(6104,'history','itemid',24239),(6105,'trends','itemid',24240),(6106,'trends_uint','itemid',24240),(6107,'history_text','itemid',24240),(6108,'history_log','itemid',24240),(6109,'history_uint','itemid',24240),(6110,'history_str','itemid',24240),(6111,'history','itemid',24240),(6112,'trends','itemid',24241),(6113,'trends_uint','itemid',24241),(6114,'history_text','itemid',24241),(6115,'history_log','itemid',24241),(6116,'history_uint','itemid',24241),(6117,'history_str','itemid',24241),(6118,'history','itemid',24241),(6119,'trends','itemid',24242),(6120,'trends_uint','itemid',24242),(6121,'history_text','itemid',24242),(6122,'history_log','itemid',24242),(6123,'history_uint','itemid',24242),(6124,'history_str','itemid',24242),(6125,'history','itemid',24242),(6126,'trends','itemid',24243),(6127,'trends_uint','itemid',24243),(6128,'history_text','itemid',24243),(6129,'history_log','itemid',24243),(6130,'history_uint','itemid',24243),(6131,'history_str','itemid',24243),(6132,'history','itemid',24243),(6133,'trends','itemid',24244),(6134,'trends_uint','itemid',24244),(6135,'history_text','itemid',24244),(6136,'history_log','itemid',24244),(6137,'history_uint','itemid',24244),(6138,'history_str','itemid',24244),(6139,'history','itemid',24244),(6140,'trends','itemid',24245),(6141,'trends_uint','itemid',24245),(6142,'history_text','itemid',24245),(6143,'history_log','itemid',24245),(6144,'history_uint','itemid',24245),(6145,'history_str','itemid',24245),(6146,'history','itemid',24245),(6147,'trends','itemid',24246),(6148,'trends_uint','itemid',24246),(6149,'history_text','itemid',24246),(6150,'history_log','itemid',24246),(6151,'history_uint','itemid',24246),(6152,'history_str','itemid',24246),(6153,'history','itemid',24246),(6154,'trends','itemid',24247),(6155,'trends_uint','itemid',24247),(6156,'history_text','itemid',24247),(6157,'history_log','itemid',24247),(6158,'history_uint','itemid',24247),(6159,'history_str','itemid',24247),(6160,'history','itemid',24247),(6161,'trends','itemid',24248),(6162,'trends_uint','itemid',24248),(6163,'history_text','itemid',24248),(6164,'history_log','itemid',24248),(6165,'history_uint','itemid',24248),(6166,'history_str','itemid',24248),(6167,'history','itemid',24248),(6168,'trends','itemid',24249),(6169,'trends_uint','itemid',24249),(6170,'history_text','itemid',24249),(6171,'history_log','itemid',24249),(6172,'history_uint','itemid',24249),(6173,'history_str','itemid',24249),(6174,'history','itemid',24249),(6175,'trends','itemid',24250),(6176,'trends_uint','itemid',24250),(6177,'history_text','itemid',24250),(6178,'history_log','itemid',24250),(6179,'history_uint','itemid',24250),(6180,'history_str','itemid',24250),(6181,'history','itemid',24250),(6182,'trends','itemid',24251),(6183,'trends_uint','itemid',24251),(6184,'history_text','itemid',24251),(6185,'history_log','itemid',24251),(6186,'history_uint','itemid',24251),(6187,'history_str','itemid',24251),(6188,'history','itemid',24251),(6189,'trends','itemid',24252),(6190,'trends_uint','itemid',24252),(6191,'history_text','itemid',24252),(6192,'history_log','itemid',24252),(6193,'history_uint','itemid',24252),(6194,'history_str','itemid',24252),(6195,'history','itemid',24252),(6196,'trends','itemid',24253),(6197,'trends_uint','itemid',24253),(6198,'history_text','itemid',24253),(6199,'history_log','itemid',24253),(6200,'history_uint','itemid',24253),(6201,'history_str','itemid',24253),(6202,'history','itemid',24253),(6203,'trends','itemid',24254),(6204,'trends_uint','itemid',24254),(6205,'history_text','itemid',24254),(6206,'history_log','itemid',24254),(6207,'history_uint','itemid',24254),(6208,'history_str','itemid',24254),(6209,'history','itemid',24254),(6210,'trends','itemid',24255),(6211,'trends_uint','itemid',24255),(6212,'history_text','itemid',24255),(6213,'history_log','itemid',24255),(6214,'history_uint','itemid',24255),(6215,'history_str','itemid',24255),(6216,'history','itemid',24255),(6217,'trends','itemid',24256),(6218,'trends_uint','itemid',24256),(6219,'history_text','itemid',24256),(6220,'history_log','itemid',24256),(6221,'history_uint','itemid',24256),(6222,'history_str','itemid',24256),(6223,'history','itemid',24256),(6224,'trends','itemid',24257),(6225,'trends_uint','itemid',24257),(6226,'history_text','itemid',24257),(6227,'history_log','itemid',24257),(6228,'history_uint','itemid',24257),(6229,'history_str','itemid',24257),(6230,'history','itemid',24257),(6231,'trends','itemid',24258),(6232,'trends_uint','itemid',24258),(6233,'history_text','itemid',24258),(6234,'history_log','itemid',24258),(6235,'history_uint','itemid',24258),(6236,'history_str','itemid',24258),(6237,'history','itemid',24258),(6238,'trends','itemid',24259),(6239,'trends_uint','itemid',24259),(6240,'history_text','itemid',24259),(6241,'history_log','itemid',24259),(6242,'history_uint','itemid',24259),(6243,'history_str','itemid',24259),(6244,'history','itemid',24259),(6245,'trends','itemid',24260),(6246,'trends_uint','itemid',24260),(6247,'history_text','itemid',24260),(6248,'history_log','itemid',24260),(6249,'history_uint','itemid',24260),(6250,'history_str','itemid',24260),(6251,'history','itemid',24260),(6252,'trends','itemid',24261),(6253,'trends_uint','itemid',24261),(6254,'history_text','itemid',24261),(6255,'history_log','itemid',24261),(6256,'history_uint','itemid',24261),(6257,'history_str','itemid',24261),(6258,'history','itemid',24261),(6259,'trends','itemid',24262),(6260,'trends_uint','itemid',24262),(6261,'history_text','itemid',24262),(6262,'history_log','itemid',24262),(6263,'history_uint','itemid',24262),(6264,'history_str','itemid',24262),(6265,'history','itemid',24262),(6266,'trends','itemid',24263),(6267,'trends_uint','itemid',24263),(6268,'history_text','itemid',24263),(6269,'history_log','itemid',24263),(6270,'history_uint','itemid',24263),(6271,'history_str','itemid',24263),(6272,'history','itemid',24263),(6273,'trends','itemid',24264),(6274,'trends_uint','itemid',24264),(6275,'history_text','itemid',24264),(6276,'history_log','itemid',24264),(6277,'history_uint','itemid',24264),(6278,'history_str','itemid',24264),(6279,'history','itemid',24264),(6280,'trends','itemid',24265),(6281,'trends_uint','itemid',24265),(6282,'history_text','itemid',24265),(6283,'history_log','itemid',24265),(6284,'history_uint','itemid',24265),(6285,'history_str','itemid',24265),(6286,'history','itemid',24265),(6287,'trends','itemid',24266),(6288,'trends_uint','itemid',24266),(6289,'history_text','itemid',24266),(6290,'history_log','itemid',24266),(6291,'history_uint','itemid',24266),(6292,'history_str','itemid',24266),(6293,'history','itemid',24266),(6294,'trends','itemid',24267),(6295,'trends_uint','itemid',24267),(6296,'history_text','itemid',24267),(6297,'history_log','itemid',24267),(6298,'history_uint','itemid',24267),(6299,'history_str','itemid',24267),(6300,'history','itemid',24267),(6301,'trends','itemid',24268),(6302,'trends_uint','itemid',24268),(6303,'history_text','itemid',24268),(6304,'history_log','itemid',24268),(6305,'history_uint','itemid',24268),(6306,'history_str','itemid',24268),(6307,'history','itemid',24268),(6308,'trends','itemid',24269),(6309,'trends_uint','itemid',24269),(6310,'history_text','itemid',24269),(6311,'history_log','itemid',24269),(6312,'history_uint','itemid',24269),(6313,'history_str','itemid',24269),(6314,'history','itemid',24269),(6315,'trends','itemid',24270),(6316,'trends_uint','itemid',24270),(6317,'history_text','itemid',24270),(6318,'history_log','itemid',24270),(6319,'history_uint','itemid',24270),(6320,'history_str','itemid',24270),(6321,'history','itemid',24270),(6322,'trends','itemid',24271),(6323,'trends_uint','itemid',24271),(6324,'history_text','itemid',24271),(6325,'history_log','itemid',24271),(6326,'history_uint','itemid',24271),(6327,'history_str','itemid',24271),(6328,'history','itemid',24271),(6329,'trends','itemid',24272),(6330,'trends_uint','itemid',24272),(6331,'history_text','itemid',24272),(6332,'history_log','itemid',24272),(6333,'history_uint','itemid',24272),(6334,'history_str','itemid',24272),(6335,'history','itemid',24272),(6336,'trends','itemid',24273),(6337,'trends_uint','itemid',24273),(6338,'history_text','itemid',24273),(6339,'history_log','itemid',24273),(6340,'history_uint','itemid',24273),(6341,'history_str','itemid',24273),(6342,'history','itemid',24273),(6343,'trends','itemid',24274),(6344,'trends_uint','itemid',24274),(6345,'history_text','itemid',24274),(6346,'history_log','itemid',24274),(6347,'history_uint','itemid',24274),(6348,'history_str','itemid',24274),(6349,'history','itemid',24274),(6350,'trends','itemid',24275),(6351,'trends_uint','itemid',24275),(6352,'history_text','itemid',24275),(6353,'history_log','itemid',24275),(6354,'history_uint','itemid',24275),(6355,'history_str','itemid',24275),(6356,'history','itemid',24275),(6357,'trends','itemid',24276),(6358,'trends_uint','itemid',24276),(6359,'history_text','itemid',24276),(6360,'history_log','itemid',24276),(6361,'history_uint','itemid',24276),(6362,'history_str','itemid',24276),(6363,'history','itemid',24276),(6364,'trends','itemid',24277),(6365,'trends_uint','itemid',24277),(6366,'history_text','itemid',24277),(6367,'history_log','itemid',24277),(6368,'history_uint','itemid',24277),(6369,'history_str','itemid',24277),(6370,'history','itemid',24277),(6371,'trends','itemid',24278),(6372,'trends_uint','itemid',24278),(6373,'history_text','itemid',24278),(6374,'history_log','itemid',24278),(6375,'history_uint','itemid',24278),(6376,'history_str','itemid',24278),(6377,'history','itemid',24278),(6378,'trends','itemid',24279),(6379,'trends_uint','itemid',24279),(6380,'history_text','itemid',24279),(6381,'history_log','itemid',24279),(6382,'history_uint','itemid',24279),(6383,'history_str','itemid',24279),(6384,'history','itemid',24279),(6385,'trends','itemid',24280),(6386,'trends_uint','itemid',24280),(6387,'history_text','itemid',24280),(6388,'history_log','itemid',24280),(6389,'history_uint','itemid',24280),(6390,'history_str','itemid',24280),(6391,'history','itemid',24280),(6392,'trends','itemid',24281),(6393,'trends_uint','itemid',24281),(6394,'history_text','itemid',24281),(6395,'history_log','itemid',24281),(6396,'history_uint','itemid',24281),(6397,'history_str','itemid',24281),(6398,'history','itemid',24281),(6399,'trends','itemid',24282),(6400,'trends_uint','itemid',24282),(6401,'history_text','itemid',24282),(6402,'history_log','itemid',24282),(6403,'history_uint','itemid',24282),(6404,'history_str','itemid',24282),(6405,'history','itemid',24282),(6406,'trends','itemid',24283),(6407,'trends_uint','itemid',24283),(6408,'history_text','itemid',24283),(6409,'history_log','itemid',24283),(6410,'history_uint','itemid',24283),(6411,'history_str','itemid',24283),(6412,'history','itemid',24283),(6413,'trends','itemid',24284),(6414,'trends_uint','itemid',24284),(6415,'history_text','itemid',24284),(6416,'history_log','itemid',24284),(6417,'history_uint','itemid',24284),(6418,'history_str','itemid',24284),(6419,'history','itemid',24284),(6420,'trends','itemid',24285),(6421,'trends_uint','itemid',24285),(6422,'history_text','itemid',24285),(6423,'history_log','itemid',24285),(6424,'history_uint','itemid',24285),(6425,'history_str','itemid',24285),(6426,'history','itemid',24285),(6427,'trends','itemid',24286),(6428,'trends_uint','itemid',24286),(6429,'history_text','itemid',24286),(6430,'history_log','itemid',24286),(6431,'history_uint','itemid',24286),(6432,'history_str','itemid',24286),(6433,'history','itemid',24286),(6434,'trends','itemid',24287),(6435,'trends_uint','itemid',24287),(6436,'history_text','itemid',24287),(6437,'history_log','itemid',24287),(6438,'history_uint','itemid',24287),(6439,'history_str','itemid',24287),(6440,'history','itemid',24287),(6441,'trends','itemid',24288),(6442,'trends_uint','itemid',24288),(6443,'history_text','itemid',24288),(6444,'history_log','itemid',24288),(6445,'history_uint','itemid',24288),(6446,'history_str','itemid',24288),(6447,'history','itemid',24288),(6448,'trends','itemid',24289),(6449,'trends_uint','itemid',24289),(6450,'history_text','itemid',24289),(6451,'history_log','itemid',24289),(6452,'history_uint','itemid',24289),(6453,'history_str','itemid',24289),(6454,'history','itemid',24289),(6455,'trends','itemid',24290),(6456,'trends_uint','itemid',24290),(6457,'history_text','itemid',24290),(6458,'history_log','itemid',24290),(6459,'history_uint','itemid',24290),(6460,'history_str','itemid',24290),(6461,'history','itemid',24290),(6462,'trends','itemid',24291),(6463,'trends_uint','itemid',24291),(6464,'history_text','itemid',24291),(6465,'history_log','itemid',24291),(6466,'history_uint','itemid',24291),(6467,'history_str','itemid',24291),(6468,'history','itemid',24291),(6469,'trends','itemid',24292),(6470,'trends_uint','itemid',24292),(6471,'history_text','itemid',24292),(6472,'history_log','itemid',24292),(6473,'history_uint','itemid',24292),(6474,'history_str','itemid',24292),(6475,'history','itemid',24292),(6476,'trends','itemid',24293),(6477,'trends_uint','itemid',24293),(6478,'history_text','itemid',24293),(6479,'history_log','itemid',24293),(6480,'history_uint','itemid',24293),(6481,'history_str','itemid',24293),(6482,'history','itemid',24293),(6483,'trends','itemid',24294),(6484,'trends_uint','itemid',24294),(6485,'history_text','itemid',24294),(6486,'history_log','itemid',24294),(6487,'history_uint','itemid',24294),(6488,'history_str','itemid',24294),(6489,'history','itemid',24294),(6490,'trends','itemid',24295),(6491,'trends_uint','itemid',24295),(6492,'history_text','itemid',24295),(6493,'history_log','itemid',24295),(6494,'history_uint','itemid',24295),(6495,'history_str','itemid',24295),(6496,'history','itemid',24295),(6497,'trends','itemid',24296),(6498,'trends_uint','itemid',24296),(6499,'history_text','itemid',24296),(6500,'history_log','itemid',24296),(6501,'history_uint','itemid',24296),(6502,'history_str','itemid',24296),(6503,'history','itemid',24296),(6504,'trends','itemid',24297),(6505,'trends_uint','itemid',24297),(6506,'history_text','itemid',24297),(6507,'history_log','itemid',24297),(6508,'history_uint','itemid',24297),(6509,'history_str','itemid',24297),(6510,'history','itemid',24297),(6511,'trends','itemid',24298),(6512,'trends_uint','itemid',24298),(6513,'history_text','itemid',24298),(6514,'history_log','itemid',24298),(6515,'history_uint','itemid',24298),(6516,'history_str','itemid',24298),(6517,'history','itemid',24298),(6518,'trends','itemid',24299),(6519,'trends_uint','itemid',24299),(6520,'history_text','itemid',24299),(6521,'history_log','itemid',24299),(6522,'history_uint','itemid',24299),(6523,'history_str','itemid',24299),(6524,'history','itemid',24299),(6525,'trends','itemid',24300),(6526,'trends_uint','itemid',24300),(6527,'history_text','itemid',24300),(6528,'history_log','itemid',24300),(6529,'history_uint','itemid',24300),(6530,'history_str','itemid',24300),(6531,'history','itemid',24300),(6532,'trends','itemid',24301),(6533,'trends_uint','itemid',24301),(6534,'history_text','itemid',24301),(6535,'history_log','itemid',24301),(6536,'history_uint','itemid',24301),(6537,'history_str','itemid',24301),(6538,'history','itemid',24301),(6539,'trends','itemid',24302),(6540,'trends_uint','itemid',24302),(6541,'history_text','itemid',24302),(6542,'history_log','itemid',24302),(6543,'history_uint','itemid',24302),(6544,'history_str','itemid',24302),(6545,'history','itemid',24302),(6546,'trends','itemid',24303),(6547,'trends_uint','itemid',24303),(6548,'history_text','itemid',24303),(6549,'history_log','itemid',24303),(6550,'history_uint','itemid',24303),(6551,'history_str','itemid',24303),(6552,'history','itemid',24303),(6553,'trends','itemid',24304),(6554,'trends_uint','itemid',24304),(6555,'history_text','itemid',24304),(6556,'history_log','itemid',24304),(6557,'history_uint','itemid',24304),(6558,'history_str','itemid',24304),(6559,'history','itemid',24304),(6560,'trends','itemid',24305),(6561,'trends_uint','itemid',24305),(6562,'history_text','itemid',24305),(6563,'history_log','itemid',24305),(6564,'history_uint','itemid',24305),(6565,'history_str','itemid',24305),(6566,'history','itemid',24305),(6567,'trends','itemid',24306),(6568,'trends_uint','itemid',24306),(6569,'history_text','itemid',24306),(6570,'history_log','itemid',24306),(6571,'history_uint','itemid',24306),(6572,'history_str','itemid',24306),(6573,'history','itemid',24306),(6574,'trends','itemid',24307),(6575,'trends_uint','itemid',24307),(6576,'history_text','itemid',24307),(6577,'history_log','itemid',24307),(6578,'history_uint','itemid',24307),(6579,'history_str','itemid',24307),(6580,'history','itemid',24307),(6581,'trends','itemid',24308),(6582,'trends_uint','itemid',24308),(6583,'history_text','itemid',24308),(6584,'history_log','itemid',24308),(6585,'history_uint','itemid',24308),(6586,'history_str','itemid',24308),(6587,'history','itemid',24308),(6588,'trends','itemid',24309),(6589,'trends_uint','itemid',24309),(6590,'history_text','itemid',24309),(6591,'history_log','itemid',24309),(6592,'history_uint','itemid',24309),(6593,'history_str','itemid',24309),(6594,'history','itemid',24309),(6595,'trends','itemid',24310),(6596,'trends_uint','itemid',24310),(6597,'history_text','itemid',24310),(6598,'history_log','itemid',24310),(6599,'history_uint','itemid',24310),(6600,'history_str','itemid',24310),(6601,'history','itemid',24310),(6602,'trends','itemid',24311),(6603,'trends_uint','itemid',24311),(6604,'history_text','itemid',24311),(6605,'history_log','itemid',24311),(6606,'history_uint','itemid',24311),(6607,'history_str','itemid',24311),(6608,'history','itemid',24311),(6609,'trends','itemid',24312),(6610,'trends_uint','itemid',24312),(6611,'history_text','itemid',24312),(6612,'history_log','itemid',24312),(6613,'history_uint','itemid',24312),(6614,'history_str','itemid',24312),(6615,'history','itemid',24312),(6616,'trends','itemid',24313),(6617,'trends_uint','itemid',24313),(6618,'history_text','itemid',24313),(6619,'history_log','itemid',24313),(6620,'history_uint','itemid',24313),(6621,'history_str','itemid',24313),(6622,'history','itemid',24313),(6623,'trends','itemid',24314),(6624,'trends_uint','itemid',24314),(6625,'history_text','itemid',24314),(6626,'history_log','itemid',24314),(6627,'history_uint','itemid',24314),(6628,'history_str','itemid',24314),(6629,'history','itemid',24314),(6630,'trends','itemid',24315),(6631,'trends_uint','itemid',24315),(6632,'history_text','itemid',24315),(6633,'history_log','itemid',24315),(6634,'history_uint','itemid',24315),(6635,'history_str','itemid',24315),(6636,'history','itemid',24315),(6637,'trends','itemid',24316),(6638,'trends_uint','itemid',24316),(6639,'history_text','itemid',24316),(6640,'history_log','itemid',24316),(6641,'history_uint','itemid',24316),(6642,'history_str','itemid',24316),(6643,'history','itemid',24316),(6644,'trends','itemid',24317),(6645,'trends_uint','itemid',24317),(6646,'history_text','itemid',24317),(6647,'history_log','itemid',24317),(6648,'history_uint','itemid',24317),(6649,'history_str','itemid',24317),(6650,'history','itemid',24317),(6651,'trends','itemid',24318),(6652,'trends_uint','itemid',24318),(6653,'history_text','itemid',24318),(6654,'history_log','itemid',24318),(6655,'history_uint','itemid',24318),(6656,'history_str','itemid',24318),(6657,'history','itemid',24318),(6658,'trends','itemid',24319),(6659,'trends_uint','itemid',24319),(6660,'history_text','itemid',24319),(6661,'history_log','itemid',24319),(6662,'history_uint','itemid',24319),(6663,'history_str','itemid',24319),(6664,'history','itemid',24319),(6665,'trends','itemid',24320),(6666,'trends_uint','itemid',24320),(6667,'history_text','itemid',24320),(6668,'history_log','itemid',24320),(6669,'history_uint','itemid',24320),(6670,'history_str','itemid',24320),(6671,'history','itemid',24320),(6672,'trends','itemid',24321),(6673,'trends_uint','itemid',24321),(6674,'history_text','itemid',24321),(6675,'history_log','itemid',24321),(6676,'history_uint','itemid',24321),(6677,'history_str','itemid',24321),(6678,'history','itemid',24321),(6679,'trends','itemid',24322),(6680,'trends_uint','itemid',24322),(6681,'history_text','itemid',24322),(6682,'history_log','itemid',24322),(6683,'history_uint','itemid',24322),(6684,'history_str','itemid',24322),(6685,'history','itemid',24322),(6686,'trends','itemid',24323),(6687,'trends_uint','itemid',24323),(6688,'history_text','itemid',24323),(6689,'history_log','itemid',24323),(6690,'history_uint','itemid',24323),(6691,'history_str','itemid',24323),(6692,'history','itemid',24323),(6693,'trends','itemid',24324),(6694,'trends_uint','itemid',24324),(6695,'history_text','itemid',24324),(6696,'history_log','itemid',24324),(6697,'history_uint','itemid',24324),(6698,'history_str','itemid',24324),(6699,'history','itemid',24324),(6700,'trends','itemid',24325),(6701,'trends_uint','itemid',24325),(6702,'history_text','itemid',24325),(6703,'history_log','itemid',24325),(6704,'history_uint','itemid',24325),(6705,'history_str','itemid',24325),(6706,'history','itemid',24325),(6707,'trends','itemid',24326),(6708,'trends_uint','itemid',24326),(6709,'history_text','itemid',24326),(6710,'history_log','itemid',24326),(6711,'history_uint','itemid',24326),(6712,'history_str','itemid',24326),(6713,'history','itemid',24326),(6714,'trends','itemid',24327),(6715,'trends_uint','itemid',24327),(6716,'history_text','itemid',24327),(6717,'history_log','itemid',24327),(6718,'history_uint','itemid',24327),(6719,'history_str','itemid',24327),(6720,'history','itemid',24327),(6721,'trends','itemid',24328),(6722,'trends_uint','itemid',24328),(6723,'history_text','itemid',24328),(6724,'history_log','itemid',24328),(6725,'history_uint','itemid',24328),(6726,'history_str','itemid',24328),(6727,'history','itemid',24328),(6728,'trends','itemid',24329),(6729,'trends_uint','itemid',24329),(6730,'history_text','itemid',24329),(6731,'history_log','itemid',24329),(6732,'history_uint','itemid',24329),(6733,'history_str','itemid',24329),(6734,'history','itemid',24329),(6735,'trends','itemid',24330),(6736,'trends_uint','itemid',24330),(6737,'history_text','itemid',24330),(6738,'history_log','itemid',24330),(6739,'history_uint','itemid',24330),(6740,'history_str','itemid',24330),(6741,'history','itemid',24330),(6742,'trends','itemid',24331),(6743,'trends_uint','itemid',24331),(6744,'history_text','itemid',24331),(6745,'history_log','itemid',24331),(6746,'history_uint','itemid',24331),(6747,'history_str','itemid',24331),(6748,'history','itemid',24331),(6749,'trends','itemid',24332),(6750,'trends_uint','itemid',24332),(6751,'history_text','itemid',24332),(6752,'history_log','itemid',24332),(6753,'history_uint','itemid',24332),(6754,'history_str','itemid',24332),(6755,'history','itemid',24332),(6756,'trends','itemid',24333),(6757,'trends_uint','itemid',24333),(6758,'history_text','itemid',24333),(6759,'history_log','itemid',24333),(6760,'history_uint','itemid',24333),(6761,'history_str','itemid',24333),(6762,'history','itemid',24333),(6763,'trends','itemid',24334),(6764,'trends_uint','itemid',24334),(6765,'history_text','itemid',24334),(6766,'history_log','itemid',24334),(6767,'history_uint','itemid',24334),(6768,'history_str','itemid',24334),(6769,'history','itemid',24334),(6770,'trends','itemid',24335),(6771,'trends_uint','itemid',24335),(6772,'history_text','itemid',24335),(6773,'history_log','itemid',24335),(6774,'history_uint','itemid',24335),(6775,'history_str','itemid',24335),(6776,'history','itemid',24335),(6777,'trends','itemid',24336),(6778,'trends_uint','itemid',24336),(6779,'history_text','itemid',24336),(6780,'history_log','itemid',24336),(6781,'history_uint','itemid',24336),(6782,'history_str','itemid',24336),(6783,'history','itemid',24336),(6784,'trends','itemid',24337),(6785,'trends_uint','itemid',24337),(6786,'history_text','itemid',24337),(6787,'history_log','itemid',24337),(6788,'history_uint','itemid',24337),(6789,'history_str','itemid',24337),(6790,'history','itemid',24337),(6791,'trends','itemid',24338),(6792,'trends_uint','itemid',24338),(6793,'history_text','itemid',24338),(6794,'history_log','itemid',24338),(6795,'history_uint','itemid',24338),(6796,'history_str','itemid',24338),(6797,'history','itemid',24338),(6798,'trends','itemid',24339),(6799,'trends_uint','itemid',24339),(6800,'history_text','itemid',24339),(6801,'history_log','itemid',24339),(6802,'history_uint','itemid',24339),(6803,'history_str','itemid',24339),(6804,'history','itemid',24339),(6805,'trends','itemid',24340),(6806,'trends_uint','itemid',24340),(6807,'history_text','itemid',24340),(6808,'history_log','itemid',24340),(6809,'history_uint','itemid',24340),(6810,'history_str','itemid',24340),(6811,'history','itemid',24340),(6812,'trends','itemid',24341),(6813,'trends_uint','itemid',24341),(6814,'history_text','itemid',24341),(6815,'history_log','itemid',24341),(6816,'history_uint','itemid',24341),(6817,'history_str','itemid',24341),(6818,'history','itemid',24341),(6819,'trends','itemid',24342),(6820,'trends_uint','itemid',24342),(6821,'history_text','itemid',24342),(6822,'history_log','itemid',24342),(6823,'history_uint','itemid',24342),(6824,'history_str','itemid',24342),(6825,'history','itemid',24342),(6826,'trends','itemid',24343),(6827,'trends_uint','itemid',24343),(6828,'history_text','itemid',24343),(6829,'history_log','itemid',24343),(6830,'history_uint','itemid',24343),(6831,'history_str','itemid',24343),(6832,'history','itemid',24343),(6833,'trends','itemid',24344),(6834,'trends_uint','itemid',24344),(6835,'history_text','itemid',24344),(6836,'history_log','itemid',24344),(6837,'history_uint','itemid',24344),(6838,'history_str','itemid',24344),(6839,'history','itemid',24344),(6840,'trends','itemid',24345),(6841,'trends_uint','itemid',24345),(6842,'history_text','itemid',24345),(6843,'history_log','itemid',24345),(6844,'history_uint','itemid',24345),(6845,'history_str','itemid',24345),(6846,'history','itemid',24345),(6847,'trends','itemid',24346),(6848,'trends_uint','itemid',24346),(6849,'history_text','itemid',24346),(6850,'history_log','itemid',24346),(6851,'history_uint','itemid',24346),(6852,'history_str','itemid',24346),(6853,'history','itemid',24346),(6854,'trends','itemid',24347),(6855,'trends_uint','itemid',24347),(6856,'history_text','itemid',24347),(6857,'history_log','itemid',24347),(6858,'history_uint','itemid',24347),(6859,'history_str','itemid',24347),(6860,'history','itemid',24347),(6861,'trends','itemid',24348),(6862,'trends_uint','itemid',24348),(6863,'history_text','itemid',24348),(6864,'history_log','itemid',24348),(6865,'history_uint','itemid',24348),(6866,'history_str','itemid',24348),(6867,'history','itemid',24348),(6868,'trends','itemid',24349),(6869,'trends_uint','itemid',24349),(6870,'history_text','itemid',24349),(6871,'history_log','itemid',24349),(6872,'history_uint','itemid',24349),(6873,'history_str','itemid',24349),(6874,'history','itemid',24349),(6875,'trends','itemid',24350),(6876,'trends_uint','itemid',24350),(6877,'history_text','itemid',24350),(6878,'history_log','itemid',24350),(6879,'history_uint','itemid',24350),(6880,'history_str','itemid',24350),(6881,'history','itemid',24350),(6882,'trends','itemid',24351),(6883,'trends_uint','itemid',24351),(6884,'history_text','itemid',24351),(6885,'history_log','itemid',24351),(6886,'history_uint','itemid',24351),(6887,'history_str','itemid',24351),(6888,'history','itemid',24351),(6889,'trends','itemid',24352),(6890,'trends_uint','itemid',24352),(6891,'history_text','itemid',24352),(6892,'history_log','itemid',24352),(6893,'history_uint','itemid',24352),(6894,'history_str','itemid',24352),(6895,'history','itemid',24352),(6896,'trends','itemid',24353),(6897,'trends_uint','itemid',24353),(6898,'history_text','itemid',24353),(6899,'history_log','itemid',24353),(6900,'history_uint','itemid',24353),(6901,'history_str','itemid',24353),(6902,'history','itemid',24353),(6903,'trends','itemid',24354),(6904,'trends_uint','itemid',24354),(6905,'history_text','itemid',24354),(6906,'history_log','itemid',24354),(6907,'history_uint','itemid',24354),(6908,'history_str','itemid',24354),(6909,'history','itemid',24354),(6910,'trends','itemid',24355),(6911,'trends_uint','itemid',24355),(6912,'history_text','itemid',24355),(6913,'history_log','itemid',24355),(6914,'history_uint','itemid',24355),(6915,'history_str','itemid',24355),(6916,'history','itemid',24355),(6917,'trends','itemid',24356),(6918,'trends_uint','itemid',24356),(6919,'history_text','itemid',24356),(6920,'history_log','itemid',24356),(6921,'history_uint','itemid',24356),(6922,'history_str','itemid',24356),(6923,'history','itemid',24356),(6924,'trends','itemid',24357),(6925,'trends_uint','itemid',24357),(6926,'history_text','itemid',24357),(6927,'history_log','itemid',24357),(6928,'history_uint','itemid',24357),(6929,'history_str','itemid',24357),(6930,'history','itemid',24357),(6931,'trends','itemid',24358),(6932,'trends_uint','itemid',24358),(6933,'history_text','itemid',24358),(6934,'history_log','itemid',24358),(6935,'history_uint','itemid',24358),(6936,'history_str','itemid',24358),(6937,'history','itemid',24358),(6938,'trends','itemid',24359),(6939,'trends_uint','itemid',24359),(6940,'history_text','itemid',24359),(6941,'history_log','itemid',24359),(6942,'history_uint','itemid',24359),(6943,'history_str','itemid',24359),(6944,'history','itemid',24359),(6945,'trends','itemid',24360),(6946,'trends_uint','itemid',24360),(6947,'history_text','itemid',24360),(6948,'history_log','itemid',24360),(6949,'history_uint','itemid',24360),(6950,'history_str','itemid',24360),(6951,'history','itemid',24360),(6952,'trends','itemid',24361),(6953,'trends_uint','itemid',24361),(6954,'history_text','itemid',24361),(6955,'history_log','itemid',24361),(6956,'history_uint','itemid',24361),(6957,'history_str','itemid',24361),(6958,'history','itemid',24361),(6959,'trends','itemid',24362),(6960,'trends_uint','itemid',24362),(6961,'history_text','itemid',24362),(6962,'history_log','itemid',24362),(6963,'history_uint','itemid',24362),(6964,'history_str','itemid',24362),(6965,'history','itemid',24362),(6966,'trends','itemid',24363),(6967,'trends_uint','itemid',24363),(6968,'history_text','itemid',24363),(6969,'history_log','itemid',24363),(6970,'history_uint','itemid',24363),(6971,'history_str','itemid',24363),(6972,'history','itemid',24363),(6973,'trends','itemid',24364),(6974,'trends_uint','itemid',24364),(6975,'history_text','itemid',24364),(6976,'history_log','itemid',24364),(6977,'history_uint','itemid',24364),(6978,'history_str','itemid',24364),(6979,'history','itemid',24364),(6980,'trends','itemid',24365),(6981,'trends_uint','itemid',24365),(6982,'history_text','itemid',24365),(6983,'history_log','itemid',24365),(6984,'history_uint','itemid',24365),(6985,'history_str','itemid',24365),(6986,'history','itemid',24365),(6987,'trends','itemid',24366),(6988,'trends_uint','itemid',24366),(6989,'history_text','itemid',24366),(6990,'history_log','itemid',24366),(6991,'history_uint','itemid',24366),(6992,'history_str','itemid',24366),(6993,'history','itemid',24366),(6994,'trends','itemid',24367),(6995,'trends_uint','itemid',24367),(6996,'history_text','itemid',24367),(6997,'history_log','itemid',24367),(6998,'history_uint','itemid',24367),(6999,'history_str','itemid',24367),(7000,'history','itemid',24367),(7001,'trends','itemid',24368),(7002,'trends_uint','itemid',24368),(7003,'history_text','itemid',24368),(7004,'history_log','itemid',24368),(7005,'history_uint','itemid',24368),(7006,'history_str','itemid',24368),(7007,'history','itemid',24368),(7008,'trends','itemid',24369),(7009,'trends_uint','itemid',24369),(7010,'history_text','itemid',24369),(7011,'history_log','itemid',24369),(7012,'history_uint','itemid',24369),(7013,'history_str','itemid',24369),(7014,'history','itemid',24369),(7015,'trends','itemid',24370),(7016,'trends_uint','itemid',24370),(7017,'history_text','itemid',24370),(7018,'history_log','itemid',24370),(7019,'history_uint','itemid',24370),(7020,'history_str','itemid',24370),(7021,'history','itemid',24370),(7022,'trends','itemid',24371),(7023,'trends_uint','itemid',24371),(7024,'history_text','itemid',24371),(7025,'history_log','itemid',24371),(7026,'history_uint','itemid',24371),(7027,'history_str','itemid',24371),(7028,'history','itemid',24371),(7029,'trends','itemid',24372),(7030,'trends_uint','itemid',24372),(7031,'history_text','itemid',24372),(7032,'history_log','itemid',24372),(7033,'history_uint','itemid',24372),(7034,'history_str','itemid',24372),(7035,'history','itemid',24372),(7036,'trends','itemid',24373),(7037,'trends_uint','itemid',24373),(7038,'history_text','itemid',24373),(7039,'history_log','itemid',24373),(7040,'history_uint','itemid',24373),(7041,'history_str','itemid',24373),(7042,'history','itemid',24373),(7043,'trends','itemid',24374),(7044,'trends_uint','itemid',24374),(7045,'history_text','itemid',24374),(7046,'history_log','itemid',24374),(7047,'history_uint','itemid',24374),(7048,'history_str','itemid',24374),(7049,'history','itemid',24374),(7050,'trends','itemid',24375),(7051,'trends_uint','itemid',24375),(7052,'history_text','itemid',24375),(7053,'history_log','itemid',24375),(7054,'history_uint','itemid',24375),(7055,'history_str','itemid',24375),(7056,'history','itemid',24375),(7057,'trends','itemid',24376),(7058,'trends_uint','itemid',24376),(7059,'history_text','itemid',24376),(7060,'history_log','itemid',24376),(7061,'history_uint','itemid',24376),(7062,'history_str','itemid',24376),(7063,'history','itemid',24376),(7064,'trends','itemid',24377),(7065,'trends_uint','itemid',24377),(7066,'history_text','itemid',24377),(7067,'history_log','itemid',24377),(7068,'history_uint','itemid',24377),(7069,'history_str','itemid',24377),(7070,'history','itemid',24377),(7071,'trends','itemid',24378),(7072,'trends_uint','itemid',24378),(7073,'history_text','itemid',24378),(7074,'history_log','itemid',24378),(7075,'history_uint','itemid',24378),(7076,'history_str','itemid',24378),(7077,'history','itemid',24378),(7078,'trends','itemid',24379),(7079,'trends_uint','itemid',24379),(7080,'history_text','itemid',24379),(7081,'history_log','itemid',24379),(7082,'history_uint','itemid',24379),(7083,'history_str','itemid',24379),(7084,'history','itemid',24379),(7085,'trends','itemid',24380),(7086,'trends_uint','itemid',24380),(7087,'history_text','itemid',24380),(7088,'history_log','itemid',24380),(7089,'history_uint','itemid',24380),(7090,'history_str','itemid',24380),(7091,'history','itemid',24380),(7092,'trends','itemid',24381),(7093,'trends_uint','itemid',24381),(7094,'history_text','itemid',24381),(7095,'history_log','itemid',24381),(7096,'history_uint','itemid',24381),(7097,'history_str','itemid',24381),(7098,'history','itemid',24381),(7099,'trends','itemid',24382),(7100,'trends_uint','itemid',24382),(7101,'history_text','itemid',24382),(7102,'history_log','itemid',24382),(7103,'history_uint','itemid',24382),(7104,'history_str','itemid',24382),(7105,'history','itemid',24382),(7106,'trends','itemid',24383),(7107,'trends_uint','itemid',24383),(7108,'history_text','itemid',24383),(7109,'history_log','itemid',24383),(7110,'history_uint','itemid',24383),(7111,'history_str','itemid',24383),(7112,'history','itemid',24383),(7113,'trends','itemid',24384),(7114,'trends_uint','itemid',24384),(7115,'history_text','itemid',24384),(7116,'history_log','itemid',24384),(7117,'history_uint','itemid',24384),(7118,'history_str','itemid',24384),(7119,'history','itemid',24384),(7120,'trends','itemid',24385),(7121,'trends_uint','itemid',24385),(7122,'history_text','itemid',24385),(7123,'history_log','itemid',24385),(7124,'history_uint','itemid',24385),(7125,'history_str','itemid',24385),(7126,'history','itemid',24385),(7127,'trends','itemid',24386),(7128,'trends_uint','itemid',24386),(7129,'history_text','itemid',24386),(7130,'history_log','itemid',24386),(7131,'history_uint','itemid',24386),(7132,'history_str','itemid',24386),(7133,'history','itemid',24386),(7134,'trends','itemid',24387),(7135,'trends_uint','itemid',24387),(7136,'history_text','itemid',24387),(7137,'history_log','itemid',24387),(7138,'history_uint','itemid',24387),(7139,'history_str','itemid',24387),(7140,'history','itemid',24387),(7141,'trends','itemid',24388),(7142,'trends_uint','itemid',24388),(7143,'history_text','itemid',24388),(7144,'history_log','itemid',24388),(7145,'history_uint','itemid',24388),(7146,'history_str','itemid',24388),(7147,'history','itemid',24388),(7148,'trends','itemid',24389),(7149,'trends_uint','itemid',24389),(7150,'history_text','itemid',24389),(7151,'history_log','itemid',24389),(7152,'history_uint','itemid',24389),(7153,'history_str','itemid',24389),(7154,'history','itemid',24389),(7155,'trends','itemid',24390),(7156,'trends_uint','itemid',24390),(7157,'history_text','itemid',24390),(7158,'history_log','itemid',24390),(7159,'history_uint','itemid',24390),(7160,'history_str','itemid',24390),(7161,'history','itemid',24390),(7162,'trends','itemid',24391),(7163,'trends_uint','itemid',24391),(7164,'history_text','itemid',24391),(7165,'history_log','itemid',24391),(7166,'history_uint','itemid',24391),(7167,'history_str','itemid',24391),(7168,'history','itemid',24391),(7169,'trends','itemid',24392),(7170,'trends_uint','itemid',24392),(7171,'history_text','itemid',24392),(7172,'history_log','itemid',24392),(7173,'history_uint','itemid',24392),(7174,'history_str','itemid',24392),(7175,'history','itemid',24392),(7176,'trends','itemid',24393),(7177,'trends_uint','itemid',24393),(7178,'history_text','itemid',24393),(7179,'history_log','itemid',24393),(7180,'history_uint','itemid',24393),(7181,'history_str','itemid',24393),(7182,'history','itemid',24393),(7183,'trends','itemid',24394),(7184,'trends_uint','itemid',24394),(7185,'history_text','itemid',24394),(7186,'history_log','itemid',24394),(7187,'history_uint','itemid',24394),(7188,'history_str','itemid',24394),(7189,'history','itemid',24394),(7190,'trends','itemid',24395),(7191,'trends_uint','itemid',24395),(7192,'history_text','itemid',24395),(7193,'history_log','itemid',24395),(7194,'history_uint','itemid',24395),(7195,'history_str','itemid',24395),(7196,'history','itemid',24395),(7197,'trends','itemid',24396),(7198,'trends_uint','itemid',24396),(7199,'history_text','itemid',24396),(7200,'history_log','itemid',24396),(7201,'history_uint','itemid',24396),(7202,'history_str','itemid',24396),(7203,'history','itemid',24396),(7204,'trends','itemid',24397),(7205,'trends_uint','itemid',24397),(7206,'history_text','itemid',24397),(7207,'history_log','itemid',24397),(7208,'history_uint','itemid',24397),(7209,'history_str','itemid',24397),(7210,'history','itemid',24397),(7211,'trends','itemid',24398),(7212,'trends_uint','itemid',24398),(7213,'history_text','itemid',24398),(7214,'history_log','itemid',24398),(7215,'history_uint','itemid',24398),(7216,'history_str','itemid',24398),(7217,'history','itemid',24398),(7218,'trends','itemid',24399),(7219,'trends_uint','itemid',24399),(7220,'history_text','itemid',24399),(7221,'history_log','itemid',24399),(7222,'history_uint','itemid',24399),(7223,'history_str','itemid',24399),(7224,'history','itemid',24399),(7225,'trends','itemid',24400),(7226,'trends_uint','itemid',24400),(7227,'history_text','itemid',24400),(7228,'history_log','itemid',24400),(7229,'history_uint','itemid',24400),(7230,'history_str','itemid',24400),(7231,'history','itemid',24400),(7232,'trends','itemid',24401),(7233,'trends_uint','itemid',24401),(7234,'history_text','itemid',24401),(7235,'history_log','itemid',24401),(7236,'history_uint','itemid',24401),(7237,'history_str','itemid',24401),(7238,'history','itemid',24401),(7239,'trends','itemid',24402),(7240,'trends_uint','itemid',24402),(7241,'history_text','itemid',24402),(7242,'history_log','itemid',24402),(7243,'history_uint','itemid',24402),(7244,'history_str','itemid',24402),(7245,'history','itemid',24402),(7246,'trends','itemid',24403),(7247,'trends_uint','itemid',24403),(7248,'history_text','itemid',24403),(7249,'history_log','itemid',24403),(7250,'history_uint','itemid',24403),(7251,'history_str','itemid',24403),(7252,'history','itemid',24403),(7253,'trends','itemid',24404),(7254,'trends_uint','itemid',24404),(7255,'history_text','itemid',24404),(7256,'history_log','itemid',24404),(7257,'history_uint','itemid',24404),(7258,'history_str','itemid',24404),(7259,'history','itemid',24404),(7260,'trends','itemid',24405),(7261,'trends_uint','itemid',24405),(7262,'history_text','itemid',24405),(7263,'history_log','itemid',24405),(7264,'history_uint','itemid',24405),(7265,'history_str','itemid',24405),(7266,'history','itemid',24405),(7267,'trends','itemid',24406),(7268,'trends_uint','itemid',24406),(7269,'history_text','itemid',24406),(7270,'history_log','itemid',24406),(7271,'history_uint','itemid',24406),(7272,'history_str','itemid',24406),(7273,'history','itemid',24406),(7274,'trends','itemid',24407),(7275,'trends_uint','itemid',24407),(7276,'history_text','itemid',24407),(7277,'history_log','itemid',24407),(7278,'history_uint','itemid',24407),(7279,'history_str','itemid',24407),(7280,'history','itemid',24407),(7281,'trends','itemid',24408),(7282,'trends_uint','itemid',24408),(7283,'history_text','itemid',24408),(7284,'history_log','itemid',24408),(7285,'history_uint','itemid',24408),(7286,'history_str','itemid',24408),(7287,'history','itemid',24408),(7288,'trends','itemid',24409),(7289,'trends_uint','itemid',24409),(7290,'history_text','itemid',24409),(7291,'history_log','itemid',24409),(7292,'history_uint','itemid',24409),(7293,'history_str','itemid',24409),(7294,'history','itemid',24409),(7295,'trends','itemid',24410),(7296,'trends_uint','itemid',24410),(7297,'history_text','itemid',24410),(7298,'history_log','itemid',24410),(7299,'history_uint','itemid',24410),(7300,'history_str','itemid',24410),(7301,'history','itemid',24410),(7302,'trends','itemid',24411),(7303,'trends_uint','itemid',24411),(7304,'history_text','itemid',24411),(7305,'history_log','itemid',24411),(7306,'history_uint','itemid',24411),(7307,'history_str','itemid',24411),(7308,'history','itemid',24411),(7309,'trends','itemid',24412),(7310,'trends_uint','itemid',24412),(7311,'history_text','itemid',24412),(7312,'history_log','itemid',24412),(7313,'history_uint','itemid',24412),(7314,'history_str','itemid',24412),(7315,'history','itemid',24412),(7316,'trends','itemid',24413),(7317,'trends_uint','itemid',24413),(7318,'history_text','itemid',24413),(7319,'history_log','itemid',24413),(7320,'history_uint','itemid',24413),(7321,'history_str','itemid',24413),(7322,'history','itemid',24413),(7323,'trends','itemid',24414),(7324,'trends_uint','itemid',24414),(7325,'history_text','itemid',24414),(7326,'history_log','itemid',24414),(7327,'history_uint','itemid',24414),(7328,'history_str','itemid',24414),(7329,'history','itemid',24414),(7330,'trends','itemid',24415),(7331,'trends_uint','itemid',24415),(7332,'history_text','itemid',24415),(7333,'history_log','itemid',24415),(7334,'history_uint','itemid',24415),(7335,'history_str','itemid',24415),(7336,'history','itemid',24415),(7337,'trends','itemid',24416),(7338,'trends_uint','itemid',24416),(7339,'history_text','itemid',24416),(7340,'history_log','itemid',24416),(7341,'history_uint','itemid',24416),(7342,'history_str','itemid',24416),(7343,'history','itemid',24416),(7344,'trends','itemid',24417),(7345,'trends_uint','itemid',24417),(7346,'history_text','itemid',24417),(7347,'history_log','itemid',24417),(7348,'history_uint','itemid',24417),(7349,'history_str','itemid',24417),(7350,'history','itemid',24417),(7351,'trends','itemid',24418),(7352,'trends_uint','itemid',24418),(7353,'history_text','itemid',24418),(7354,'history_log','itemid',24418),(7355,'history_uint','itemid',24418),(7356,'history_str','itemid',24418),(7357,'history','itemid',24418),(7358,'trends','itemid',24419),(7359,'trends_uint','itemid',24419),(7360,'history_text','itemid',24419),(7361,'history_log','itemid',24419),(7362,'history_uint','itemid',24419),(7363,'history_str','itemid',24419),(7364,'history','itemid',24419),(7365,'trends','itemid',24420),(7366,'trends_uint','itemid',24420),(7367,'history_text','itemid',24420),(7368,'history_log','itemid',24420),(7369,'history_uint','itemid',24420),(7370,'history_str','itemid',24420),(7371,'history','itemid',24420),(7372,'trends','itemid',24421),(7373,'trends_uint','itemid',24421),(7374,'history_text','itemid',24421),(7375,'history_log','itemid',24421),(7376,'history_uint','itemid',24421),(7377,'history_str','itemid',24421),(7378,'history','itemid',24421),(7379,'trends','itemid',24422),(7380,'trends_uint','itemid',24422),(7381,'history_text','itemid',24422),(7382,'history_log','itemid',24422),(7383,'history_uint','itemid',24422),(7384,'history_str','itemid',24422),(7385,'history','itemid',24422),(7386,'trends','itemid',24423),(7387,'trends_uint','itemid',24423),(7388,'history_text','itemid',24423),(7389,'history_log','itemid',24423),(7390,'history_uint','itemid',24423),(7391,'history_str','itemid',24423),(7392,'history','itemid',24423),(7393,'trends','itemid',24424),(7394,'trends_uint','itemid',24424),(7395,'history_text','itemid',24424),(7396,'history_log','itemid',24424),(7397,'history_uint','itemid',24424),(7398,'history_str','itemid',24424),(7399,'history','itemid',24424),(7400,'trends','itemid',24425),(7401,'trends_uint','itemid',24425),(7402,'history_text','itemid',24425),(7403,'history_log','itemid',24425),(7404,'history_uint','itemid',24425),(7405,'history_str','itemid',24425),(7406,'history','itemid',24425),(7407,'trends','itemid',24426),(7408,'trends_uint','itemid',24426),(7409,'history_text','itemid',24426),(7410,'history_log','itemid',24426),(7411,'history_uint','itemid',24426),(7412,'history_str','itemid',24426),(7413,'history','itemid',24426),(7414,'trends','itemid',24427),(7415,'trends_uint','itemid',24427),(7416,'history_text','itemid',24427),(7417,'history_log','itemid',24427),(7418,'history_uint','itemid',24427),(7419,'history_str','itemid',24427),(7420,'history','itemid',24427),(7421,'trends','itemid',24428),(7422,'trends_uint','itemid',24428),(7423,'history_text','itemid',24428),(7424,'history_log','itemid',24428),(7425,'history_uint','itemid',24428),(7426,'history_str','itemid',24428),(7427,'history','itemid',24428),(7428,'trends','itemid',24429),(7429,'trends_uint','itemid',24429),(7430,'history_text','itemid',24429),(7431,'history_log','itemid',24429),(7432,'history_uint','itemid',24429),(7433,'history_str','itemid',24429),(7434,'history','itemid',24429),(7435,'trends','itemid',24430),(7436,'trends_uint','itemid',24430),(7437,'history_text','itemid',24430),(7438,'history_log','itemid',24430),(7439,'history_uint','itemid',24430),(7440,'history_str','itemid',24430),(7441,'history','itemid',24430),(7442,'trends','itemid',24431),(7443,'trends_uint','itemid',24431),(7444,'history_text','itemid',24431),(7445,'history_log','itemid',24431),(7446,'history_uint','itemid',24431),(7447,'history_str','itemid',24431),(7448,'history','itemid',24431),(7449,'trends','itemid',24432),(7450,'trends_uint','itemid',24432),(7451,'history_text','itemid',24432),(7452,'history_log','itemid',24432),(7453,'history_uint','itemid',24432),(7454,'history_str','itemid',24432),(7455,'history','itemid',24432),(7456,'trends','itemid',24433),(7457,'trends_uint','itemid',24433),(7458,'history_text','itemid',24433),(7459,'history_log','itemid',24433),(7460,'history_uint','itemid',24433),(7461,'history_str','itemid',24433),(7462,'history','itemid',24433),(7463,'trends','itemid',24434),(7464,'trends_uint','itemid',24434),(7465,'history_text','itemid',24434),(7466,'history_log','itemid',24434),(7467,'history_uint','itemid',24434),(7468,'history_str','itemid',24434),(7469,'history','itemid',24434),(7470,'trends','itemid',24435),(7471,'trends_uint','itemid',24435),(7472,'history_text','itemid',24435),(7473,'history_log','itemid',24435),(7474,'history_uint','itemid',24435),(7475,'history_str','itemid',24435),(7476,'history','itemid',24435),(7477,'trends','itemid',24436),(7478,'trends_uint','itemid',24436),(7479,'history_text','itemid',24436),(7480,'history_log','itemid',24436),(7481,'history_uint','itemid',24436),(7482,'history_str','itemid',24436),(7483,'history','itemid',24436),(7484,'trends','itemid',24437),(7485,'trends_uint','itemid',24437),(7486,'history_text','itemid',24437),(7487,'history_log','itemid',24437),(7488,'history_uint','itemid',24437),(7489,'history_str','itemid',24437),(7490,'history','itemid',24437),(7491,'trends','itemid',24438),(7492,'trends_uint','itemid',24438),(7493,'history_text','itemid',24438),(7494,'history_log','itemid',24438),(7495,'history_uint','itemid',24438),(7496,'history_str','itemid',24438),(7497,'history','itemid',24438),(7498,'trends','itemid',24439),(7499,'trends_uint','itemid',24439),(7500,'history_text','itemid',24439),(7501,'history_log','itemid',24439),(7502,'history_uint','itemid',24439),(7503,'history_str','itemid',24439),(7504,'history','itemid',24439),(7505,'trends','itemid',24440),(7506,'trends_uint','itemid',24440),(7507,'history_text','itemid',24440),(7508,'history_log','itemid',24440),(7509,'history_uint','itemid',24440),(7510,'history_str','itemid',24440),(7511,'history','itemid',24440),(7512,'trends','itemid',24441),(7513,'trends_uint','itemid',24441),(7514,'history_text','itemid',24441),(7515,'history_log','itemid',24441),(7516,'history_uint','itemid',24441),(7517,'history_str','itemid',24441),(7518,'history','itemid',24441),(7519,'trends','itemid',24442),(7520,'trends_uint','itemid',24442),(7521,'history_text','itemid',24442),(7522,'history_log','itemid',24442),(7523,'history_uint','itemid',24442),(7524,'history_str','itemid',24442),(7525,'history','itemid',24442),(7526,'trends','itemid',24443),(7527,'trends_uint','itemid',24443),(7528,'history_text','itemid',24443),(7529,'history_log','itemid',24443),(7530,'history_uint','itemid',24443),(7531,'history_str','itemid',24443),(7532,'history','itemid',24443),(7533,'trends','itemid',24444),(7534,'trends_uint','itemid',24444),(7535,'history_text','itemid',24444),(7536,'history_log','itemid',24444),(7537,'history_uint','itemid',24444),(7538,'history_str','itemid',24444),(7539,'history','itemid',24444),(7540,'trends','itemid',24445),(7541,'trends_uint','itemid',24445),(7542,'history_text','itemid',24445),(7543,'history_log','itemid',24445),(7544,'history_uint','itemid',24445),(7545,'history_str','itemid',24445),(7546,'history','itemid',24445),(7547,'trends','itemid',24446),(7548,'trends_uint','itemid',24446),(7549,'history_text','itemid',24446),(7550,'history_log','itemid',24446),(7551,'history_uint','itemid',24446),(7552,'history_str','itemid',24446),(7553,'history','itemid',24446),(7554,'trends','itemid',24447),(7555,'trends_uint','itemid',24447),(7556,'history_text','itemid',24447),(7557,'history_log','itemid',24447),(7558,'history_uint','itemid',24447),(7559,'history_str','itemid',24447),(7560,'history','itemid',24447),(7561,'trends','itemid',24448),(7562,'trends_uint','itemid',24448),(7563,'history_text','itemid',24448),(7564,'history_log','itemid',24448),(7565,'history_uint','itemid',24448),(7566,'history_str','itemid',24448),(7567,'history','itemid',24448),(7568,'trends','itemid',24449),(7569,'trends_uint','itemid',24449),(7570,'history_text','itemid',24449),(7571,'history_log','itemid',24449),(7572,'history_uint','itemid',24449),(7573,'history_str','itemid',24449),(7574,'history','itemid',24449),(7575,'trends','itemid',24450),(7576,'trends_uint','itemid',24450),(7577,'history_text','itemid',24450),(7578,'history_log','itemid',24450),(7579,'history_uint','itemid',24450),(7580,'history_str','itemid',24450),(7581,'history','itemid',24450),(7582,'trends','itemid',24451),(7583,'trends_uint','itemid',24451),(7584,'history_text','itemid',24451),(7585,'history_log','itemid',24451),(7586,'history_uint','itemid',24451),(7587,'history_str','itemid',24451),(7588,'history','itemid',24451),(7589,'trends','itemid',24452),(7590,'trends_uint','itemid',24452),(7591,'history_text','itemid',24452),(7592,'history_log','itemid',24452),(7593,'history_uint','itemid',24452),(7594,'history_str','itemid',24452),(7595,'history','itemid',24452),(7596,'trends','itemid',24453),(7597,'trends_uint','itemid',24453),(7598,'history_text','itemid',24453),(7599,'history_log','itemid',24453),(7600,'history_uint','itemid',24453),(7601,'history_str','itemid',24453),(7602,'history','itemid',24453),(7603,'trends','itemid',24454),(7604,'trends_uint','itemid',24454),(7605,'history_text','itemid',24454),(7606,'history_log','itemid',24454),(7607,'history_uint','itemid',24454),(7608,'history_str','itemid',24454),(7609,'history','itemid',24454),(7610,'trends','itemid',24455),(7611,'trends_uint','itemid',24455),(7612,'history_text','itemid',24455),(7613,'history_log','itemid',24455),(7614,'history_uint','itemid',24455),(7615,'history_str','itemid',24455),(7616,'history','itemid',24455),(7617,'trends','itemid',24456),(7618,'trends_uint','itemid',24456),(7619,'history_text','itemid',24456),(7620,'history_log','itemid',24456),(7621,'history_uint','itemid',24456),(7622,'history_str','itemid',24456),(7623,'history','itemid',24456),(7624,'trends','itemid',24457),(7625,'trends_uint','itemid',24457),(7626,'history_text','itemid',24457),(7627,'history_log','itemid',24457),(7628,'history_uint','itemid',24457),(7629,'history_str','itemid',24457),(7630,'history','itemid',24457),(7631,'trends','itemid',24458),(7632,'trends_uint','itemid',24458),(7633,'history_text','itemid',24458),(7634,'history_log','itemid',24458),(7635,'history_uint','itemid',24458),(7636,'history_str','itemid',24458),(7637,'history','itemid',24458),(7638,'trends','itemid',24459),(7639,'trends_uint','itemid',24459),(7640,'history_text','itemid',24459),(7641,'history_log','itemid',24459),(7642,'history_uint','itemid',24459),(7643,'history_str','itemid',24459),(7644,'history','itemid',24459),(7645,'trends','itemid',24460),(7646,'trends_uint','itemid',24460),(7647,'history_text','itemid',24460),(7648,'history_log','itemid',24460),(7649,'history_uint','itemid',24460),(7650,'history_str','itemid',24460),(7651,'history','itemid',24460),(7652,'trends','itemid',24461),(7653,'trends_uint','itemid',24461),(7654,'history_text','itemid',24461),(7655,'history_log','itemid',24461),(7656,'history_uint','itemid',24461),(7657,'history_str','itemid',24461),(7658,'history','itemid',24461),(7659,'trends','itemid',24462),(7660,'trends_uint','itemid',24462),(7661,'history_text','itemid',24462),(7662,'history_log','itemid',24462),(7663,'history_uint','itemid',24462),(7664,'history_str','itemid',24462),(7665,'history','itemid',24462),(7666,'trends','itemid',24463),(7667,'trends_uint','itemid',24463),(7668,'history_text','itemid',24463),(7669,'history_log','itemid',24463),(7670,'history_uint','itemid',24463),(7671,'history_str','itemid',24463),(7672,'history','itemid',24463),(7673,'trends','itemid',24464),(7674,'trends_uint','itemid',24464),(7675,'history_text','itemid',24464),(7676,'history_log','itemid',24464),(7677,'history_uint','itemid',24464),(7678,'history_str','itemid',24464),(7679,'history','itemid',24464),(7680,'trends','itemid',24465),(7681,'trends_uint','itemid',24465),(7682,'history_text','itemid',24465),(7683,'history_log','itemid',24465),(7684,'history_uint','itemid',24465),(7685,'history_str','itemid',24465),(7686,'history','itemid',24465),(7687,'trends','itemid',24466),(7688,'trends_uint','itemid',24466),(7689,'history_text','itemid',24466),(7690,'history_log','itemid',24466),(7691,'history_uint','itemid',24466),(7692,'history_str','itemid',24466),(7693,'history','itemid',24466),(7694,'trends','itemid',24467),(7695,'trends_uint','itemid',24467),(7696,'history_text','itemid',24467),(7697,'history_log','itemid',24467),(7698,'history_uint','itemid',24467),(7699,'history_str','itemid',24467),(7700,'history','itemid',24467),(7701,'trends','itemid',24468),(7702,'trends_uint','itemid',24468),(7703,'history_text','itemid',24468),(7704,'history_log','itemid',24468),(7705,'history_uint','itemid',24468),(7706,'history_str','itemid',24468),(7707,'history','itemid',24468),(7708,'trends','itemid',24469),(7709,'trends_uint','itemid',24469),(7710,'history_text','itemid',24469),(7711,'history_log','itemid',24469),(7712,'history_uint','itemid',24469),(7713,'history_str','itemid',24469),(7714,'history','itemid',24469),(7715,'trends','itemid',24470),(7716,'trends_uint','itemid',24470),(7717,'history_text','itemid',24470),(7718,'history_log','itemid',24470),(7719,'history_uint','itemid',24470),(7720,'history_str','itemid',24470),(7721,'history','itemid',24470),(7722,'trends','itemid',24471),(7723,'trends_uint','itemid',24471),(7724,'history_text','itemid',24471),(7725,'history_log','itemid',24471),(7726,'history_uint','itemid',24471),(7727,'history_str','itemid',24471),(7728,'history','itemid',24471),(7729,'trends','itemid',24472),(7730,'trends_uint','itemid',24472),(7731,'history_text','itemid',24472),(7732,'history_log','itemid',24472),(7733,'history_uint','itemid',24472),(7734,'history_str','itemid',24472),(7735,'history','itemid',24472),(7736,'trends','itemid',24473),(7737,'trends_uint','itemid',24473),(7738,'history_text','itemid',24473),(7739,'history_log','itemid',24473),(7740,'history_uint','itemid',24473),(7741,'history_str','itemid',24473),(7742,'history','itemid',24473),(7743,'trends','itemid',24474),(7744,'trends_uint','itemid',24474),(7745,'history_text','itemid',24474),(7746,'history_log','itemid',24474),(7747,'history_uint','itemid',24474),(7748,'history_str','itemid',24474),(7749,'history','itemid',24474),(7750,'trends','itemid',24475),(7751,'trends_uint','itemid',24475),(7752,'history_text','itemid',24475),(7753,'history_log','itemid',24475),(7754,'history_uint','itemid',24475),(7755,'history_str','itemid',24475),(7756,'history','itemid',24475),(7757,'trends','itemid',24476),(7758,'trends_uint','itemid',24476),(7759,'history_text','itemid',24476),(7760,'history_log','itemid',24476),(7761,'history_uint','itemid',24476),(7762,'history_str','itemid',24476),(7763,'history','itemid',24476),(7764,'trends','itemid',24477),(7765,'trends_uint','itemid',24477),(7766,'history_text','itemid',24477),(7767,'history_log','itemid',24477),(7768,'history_uint','itemid',24477),(7769,'history_str','itemid',24477),(7770,'history','itemid',24477),(7771,'trends','itemid',24478),(7772,'trends_uint','itemid',24478),(7773,'history_text','itemid',24478),(7774,'history_log','itemid',24478),(7775,'history_uint','itemid',24478),(7776,'history_str','itemid',24478),(7777,'history','itemid',24478),(7778,'trends','itemid',24479),(7779,'trends_uint','itemid',24479),(7780,'history_text','itemid',24479),(7781,'history_log','itemid',24479),(7782,'history_uint','itemid',24479),(7783,'history_str','itemid',24479),(7784,'history','itemid',24479),(7785,'trends','itemid',24480),(7786,'trends_uint','itemid',24480),(7787,'history_text','itemid',24480),(7788,'history_log','itemid',24480),(7789,'history_uint','itemid',24480),(7790,'history_str','itemid',24480),(7791,'history','itemid',24480),(7792,'trends','itemid',24481),(7793,'trends_uint','itemid',24481),(7794,'history_text','itemid',24481),(7795,'history_log','itemid',24481),(7796,'history_uint','itemid',24481),(7797,'history_str','itemid',24481),(7798,'history','itemid',24481),(7799,'trends','itemid',24482),(7800,'trends_uint','itemid',24482),(7801,'history_text','itemid',24482),(7802,'history_log','itemid',24482),(7803,'history_uint','itemid',24482),(7804,'history_str','itemid',24482),(7805,'history','itemid',24482),(7806,'trends','itemid',24483),(7807,'trends_uint','itemid',24483),(7808,'history_text','itemid',24483),(7809,'history_log','itemid',24483),(7810,'history_uint','itemid',24483),(7811,'history_str','itemid',24483),(7812,'history','itemid',24483),(7813,'trends','itemid',24484),(7814,'trends_uint','itemid',24484),(7815,'history_text','itemid',24484),(7816,'history_log','itemid',24484),(7817,'history_uint','itemid',24484),(7818,'history_str','itemid',24484),(7819,'history','itemid',24484),(7820,'trends','itemid',24485),(7821,'trends_uint','itemid',24485),(7822,'history_text','itemid',24485),(7823,'history_log','itemid',24485),(7824,'history_uint','itemid',24485),(7825,'history_str','itemid',24485),(7826,'history','itemid',24485),(7827,'trends','itemid',24486),(7828,'trends_uint','itemid',24486),(7829,'history_text','itemid',24486),(7830,'history_log','itemid',24486),(7831,'history_uint','itemid',24486),(7832,'history_str','itemid',24486),(7833,'history','itemid',24486),(7834,'trends','itemid',24487),(7835,'trends_uint','itemid',24487),(7836,'history_text','itemid',24487),(7837,'history_log','itemid',24487),(7838,'history_uint','itemid',24487),(7839,'history_str','itemid',24487),(7840,'history','itemid',24487),(7841,'trends','itemid',24488),(7842,'trends_uint','itemid',24488),(7843,'history_text','itemid',24488),(7844,'history_log','itemid',24488),(7845,'history_uint','itemid',24488),(7846,'history_str','itemid',24488),(7847,'history','itemid',24488),(7848,'trends','itemid',24489),(7849,'trends_uint','itemid',24489),(7850,'history_text','itemid',24489),(7851,'history_log','itemid',24489),(7852,'history_uint','itemid',24489),(7853,'history_str','itemid',24489),(7854,'history','itemid',24489),(7855,'trends','itemid',24490),(7856,'trends_uint','itemid',24490),(7857,'history_text','itemid',24490),(7858,'history_log','itemid',24490),(7859,'history_uint','itemid',24490),(7860,'history_str','itemid',24490),(7861,'history','itemid',24490),(7862,'trends','itemid',24491),(7863,'trends_uint','itemid',24491),(7864,'history_text','itemid',24491),(7865,'history_log','itemid',24491),(7866,'history_uint','itemid',24491),(7867,'history_str','itemid',24491),(7868,'history','itemid',24491),(7869,'trends','itemid',24492),(7870,'trends_uint','itemid',24492),(7871,'history_text','itemid',24492),(7872,'history_log','itemid',24492),(7873,'history_uint','itemid',24492),(7874,'history_str','itemid',24492),(7875,'history','itemid',24492),(7876,'trends','itemid',24493),(7877,'trends_uint','itemid',24493),(7878,'history_text','itemid',24493),(7879,'history_log','itemid',24493),(7880,'history_uint','itemid',24493),(7881,'history_str','itemid',24493),(7882,'history','itemid',24493),(7883,'trends','itemid',24494),(7884,'trends_uint','itemid',24494),(7885,'history_text','itemid',24494),(7886,'history_log','itemid',24494),(7887,'history_uint','itemid',24494),(7888,'history_str','itemid',24494),(7889,'history','itemid',24494),(7890,'trends','itemid',24495),(7891,'trends_uint','itemid',24495),(7892,'history_text','itemid',24495),(7893,'history_log','itemid',24495),(7894,'history_uint','itemid',24495),(7895,'history_str','itemid',24495),(7896,'history','itemid',24495),(7897,'trends','itemid',24496),(7898,'trends_uint','itemid',24496),(7899,'history_text','itemid',24496),(7900,'history_log','itemid',24496),(7901,'history_uint','itemid',24496),(7902,'history_str','itemid',24496),(7903,'history','itemid',24496),(7904,'trends','itemid',24497),(7905,'trends_uint','itemid',24497),(7906,'history_text','itemid',24497),(7907,'history_log','itemid',24497),(7908,'history_uint','itemid',24497),(7909,'history_str','itemid',24497),(7910,'history','itemid',24497),(7911,'trends','itemid',24498),(7912,'trends_uint','itemid',24498),(7913,'history_text','itemid',24498),(7914,'history_log','itemid',24498),(7915,'history_uint','itemid',24498),(7916,'history_str','itemid',24498),(7917,'history','itemid',24498),(7918,'trends','itemid',24499),(7919,'trends_uint','itemid',24499),(7920,'history_text','itemid',24499),(7921,'history_log','itemid',24499),(7922,'history_uint','itemid',24499),(7923,'history_str','itemid',24499),(7924,'history','itemid',24499),(7925,'trends','itemid',24500),(7926,'trends_uint','itemid',24500),(7927,'history_text','itemid',24500),(7928,'history_log','itemid',24500),(7929,'history_uint','itemid',24500),(7930,'history_str','itemid',24500),(7931,'history','itemid',24500),(7932,'trends','itemid',24501),(7933,'trends_uint','itemid',24501),(7934,'history_text','itemid',24501),(7935,'history_log','itemid',24501),(7936,'history_uint','itemid',24501),(7937,'history_str','itemid',24501),(7938,'history','itemid',24501),(7939,'trends','itemid',24502),(7940,'trends_uint','itemid',24502),(7941,'history_text','itemid',24502),(7942,'history_log','itemid',24502),(7943,'history_uint','itemid',24502),(7944,'history_str','itemid',24502),(7945,'history','itemid',24502),(7946,'trends','itemid',24503),(7947,'trends_uint','itemid',24503),(7948,'history_text','itemid',24503),(7949,'history_log','itemid',24503),(7950,'history_uint','itemid',24503),(7951,'history_str','itemid',24503),(7952,'history','itemid',24503),(7953,'trends','itemid',24504),(7954,'trends_uint','itemid',24504),(7955,'history_text','itemid',24504),(7956,'history_log','itemid',24504),(7957,'history_uint','itemid',24504),(7958,'history_str','itemid',24504),(7959,'history','itemid',24504),(7960,'trends','itemid',24505),(7961,'trends_uint','itemid',24505),(7962,'history_text','itemid',24505),(7963,'history_log','itemid',24505),(7964,'history_uint','itemid',24505),(7965,'history_str','itemid',24505),(7966,'history','itemid',24505),(7967,'trends','itemid',24506),(7968,'trends_uint','itemid',24506),(7969,'history_text','itemid',24506),(7970,'history_log','itemid',24506),(7971,'history_uint','itemid',24506),(7972,'history_str','itemid',24506),(7973,'history','itemid',24506),(7974,'trends','itemid',24507),(7975,'trends_uint','itemid',24507),(7976,'history_text','itemid',24507),(7977,'history_log','itemid',24507),(7978,'history_uint','itemid',24507),(7979,'history_str','itemid',24507),(7980,'history','itemid',24507),(7981,'trends','itemid',24508),(7982,'trends_uint','itemid',24508),(7983,'history_text','itemid',24508),(7984,'history_log','itemid',24508),(7985,'history_uint','itemid',24508),(7986,'history_str','itemid',24508),(7987,'history','itemid',24508),(7988,'trends','itemid',24509),(7989,'trends_uint','itemid',24509),(7990,'history_text','itemid',24509),(7991,'history_log','itemid',24509),(7992,'history_uint','itemid',24509),(7993,'history_str','itemid',24509),(7994,'history','itemid',24509),(7995,'trends','itemid',24510),(7996,'trends_uint','itemid',24510),(7997,'history_text','itemid',24510),(7998,'history_log','itemid',24510),(7999,'history_uint','itemid',24510),(8000,'history_str','itemid',24510),(8001,'history','itemid',24510),(8002,'trends','itemid',24511),(8003,'trends_uint','itemid',24511),(8004,'history_text','itemid',24511),(8005,'history_log','itemid',24511),(8006,'history_uint','itemid',24511),(8007,'history_str','itemid',24511),(8008,'history','itemid',24511),(8009,'trends','itemid',24512),(8010,'trends_uint','itemid',24512),(8011,'history_text','itemid',24512),(8012,'history_log','itemid',24512),(8013,'history_uint','itemid',24512),(8014,'history_str','itemid',24512),(8015,'history','itemid',24512),(8016,'trends','itemid',24513),(8017,'trends_uint','itemid',24513),(8018,'history_text','itemid',24513),(8019,'history_log','itemid',24513),(8020,'history_uint','itemid',24513),(8021,'history_str','itemid',24513),(8022,'history','itemid',24513),(8023,'trends','itemid',24514),(8024,'trends_uint','itemid',24514),(8025,'history_text','itemid',24514),(8026,'history_log','itemid',24514),(8027,'history_uint','itemid',24514),(8028,'history_str','itemid',24514),(8029,'history','itemid',24514),(8030,'trends','itemid',24515),(8031,'trends_uint','itemid',24515),(8032,'history_text','itemid',24515),(8033,'history_log','itemid',24515),(8034,'history_uint','itemid',24515),(8035,'history_str','itemid',24515),(8036,'history','itemid',24515),(8037,'trends','itemid',24516),(8038,'trends_uint','itemid',24516),(8039,'history_text','itemid',24516),(8040,'history_log','itemid',24516),(8041,'history_uint','itemid',24516),(8042,'history_str','itemid',24516),(8043,'history','itemid',24516),(8044,'trends','itemid',24517),(8045,'trends_uint','itemid',24517),(8046,'history_text','itemid',24517),(8047,'history_log','itemid',24517),(8048,'history_uint','itemid',24517),(8049,'history_str','itemid',24517),(8050,'history','itemid',24517),(8051,'trends','itemid',24518),(8052,'trends_uint','itemid',24518),(8053,'history_text','itemid',24518),(8054,'history_log','itemid',24518),(8055,'history_uint','itemid',24518),(8056,'history_str','itemid',24518),(8057,'history','itemid',24518),(8058,'trends','itemid',24519),(8059,'trends_uint','itemid',24519),(8060,'history_text','itemid',24519),(8061,'history_log','itemid',24519),(8062,'history_uint','itemid',24519),(8063,'history_str','itemid',24519),(8064,'history','itemid',24519),(8065,'trends','itemid',24520),(8066,'trends_uint','itemid',24520),(8067,'history_text','itemid',24520),(8068,'history_log','itemid',24520),(8069,'history_uint','itemid',24520),(8070,'history_str','itemid',24520),(8071,'history','itemid',24520),(8072,'trends','itemid',24521),(8073,'trends_uint','itemid',24521),(8074,'history_text','itemid',24521),(8075,'history_log','itemid',24521),(8076,'history_uint','itemid',24521),(8077,'history_str','itemid',24521),(8078,'history','itemid',24521),(8079,'trends','itemid',24522),(8080,'trends_uint','itemid',24522),(8081,'history_text','itemid',24522),(8082,'history_log','itemid',24522),(8083,'history_uint','itemid',24522),(8084,'history_str','itemid',24522),(8085,'history','itemid',24522),(8086,'trends','itemid',24523),(8087,'trends_uint','itemid',24523),(8088,'history_text','itemid',24523),(8089,'history_log','itemid',24523),(8090,'history_uint','itemid',24523),(8091,'history_str','itemid',24523),(8092,'history','itemid',24523),(8093,'trends','itemid',24524),(8094,'trends_uint','itemid',24524),(8095,'history_text','itemid',24524),(8096,'history_log','itemid',24524),(8097,'history_uint','itemid',24524),(8098,'history_str','itemid',24524),(8099,'history','itemid',24524),(8100,'trends','itemid',24525),(8101,'trends_uint','itemid',24525),(8102,'history_text','itemid',24525),(8103,'history_log','itemid',24525),(8104,'history_uint','itemid',24525),(8105,'history_str','itemid',24525),(8106,'history','itemid',24525),(8107,'trends','itemid',24526),(8108,'trends_uint','itemid',24526),(8109,'history_text','itemid',24526),(8110,'history_log','itemid',24526),(8111,'history_uint','itemid',24526),(8112,'history_str','itemid',24526),(8113,'history','itemid',24526),(8114,'trends','itemid',24527),(8115,'trends_uint','itemid',24527),(8116,'history_text','itemid',24527),(8117,'history_log','itemid',24527),(8118,'history_uint','itemid',24527),(8119,'history_str','itemid',24527),(8120,'history','itemid',24527),(8121,'trends','itemid',24528),(8122,'trends_uint','itemid',24528),(8123,'history_text','itemid',24528),(8124,'history_log','itemid',24528),(8125,'history_uint','itemid',24528),(8126,'history_str','itemid',24528),(8127,'history','itemid',24528),(8128,'trends','itemid',24529),(8129,'trends_uint','itemid',24529),(8130,'history_text','itemid',24529),(8131,'history_log','itemid',24529),(8132,'history_uint','itemid',24529),(8133,'history_str','itemid',24529),(8134,'history','itemid',24529),(8135,'trends','itemid',24530),(8136,'trends_uint','itemid',24530),(8137,'history_text','itemid',24530),(8138,'history_log','itemid',24530),(8139,'history_uint','itemid',24530),(8140,'history_str','itemid',24530),(8141,'history','itemid',24530),(8142,'trends','itemid',24531),(8143,'trends_uint','itemid',24531),(8144,'history_text','itemid',24531),(8145,'history_log','itemid',24531),(8146,'history_uint','itemid',24531),(8147,'history_str','itemid',24531),(8148,'history','itemid',24531),(8149,'trends','itemid',24532),(8150,'trends_uint','itemid',24532),(8151,'history_text','itemid',24532),(8152,'history_log','itemid',24532),(8153,'history_uint','itemid',24532),(8154,'history_str','itemid',24532),(8155,'history','itemid',24532),(8156,'trends','itemid',24533),(8157,'trends_uint','itemid',24533),(8158,'history_text','itemid',24533),(8159,'history_log','itemid',24533),(8160,'history_uint','itemid',24533),(8161,'history_str','itemid',24533),(8162,'history','itemid',24533),(8163,'trends','itemid',24534),(8164,'trends_uint','itemid',24534),(8165,'history_text','itemid',24534),(8166,'history_log','itemid',24534),(8167,'history_uint','itemid',24534),(8168,'history_str','itemid',24534),(8169,'history','itemid',24534),(8170,'trends','itemid',24535),(8171,'trends_uint','itemid',24535),(8172,'history_text','itemid',24535),(8173,'history_log','itemid',24535),(8174,'history_uint','itemid',24535),(8175,'history_str','itemid',24535),(8176,'history','itemid',24535),(8177,'trends','itemid',24536),(8178,'trends_uint','itemid',24536),(8179,'history_text','itemid',24536),(8180,'history_log','itemid',24536),(8181,'history_uint','itemid',24536),(8182,'history_str','itemid',24536),(8183,'history','itemid',24536),(8184,'trends','itemid',24537),(8185,'trends_uint','itemid',24537),(8186,'history_text','itemid',24537),(8187,'history_log','itemid',24537),(8188,'history_uint','itemid',24537),(8189,'history_str','itemid',24537),(8190,'history','itemid',24537),(8191,'trends','itemid',24538),(8192,'trends_uint','itemid',24538),(8193,'history_text','itemid',24538),(8194,'history_log','itemid',24538),(8195,'history_uint','itemid',24538),(8196,'history_str','itemid',24538),(8197,'history','itemid',24538),(8198,'trends','itemid',24539),(8199,'trends_uint','itemid',24539),(8200,'history_text','itemid',24539),(8201,'history_log','itemid',24539),(8202,'history_uint','itemid',24539),(8203,'history_str','itemid',24539),(8204,'history','itemid',24539),(8205,'trends','itemid',24540),(8206,'trends_uint','itemid',24540),(8207,'history_text','itemid',24540),(8208,'history_log','itemid',24540),(8209,'history_uint','itemid',24540),(8210,'history_str','itemid',24540),(8211,'history','itemid',24540),(8212,'trends','itemid',24541),(8213,'trends_uint','itemid',24541),(8214,'history_text','itemid',24541),(8215,'history_log','itemid',24541),(8216,'history_uint','itemid',24541),(8217,'history_str','itemid',24541),(8218,'history','itemid',24541),(8219,'trends','itemid',24542),(8220,'trends_uint','itemid',24542),(8221,'history_text','itemid',24542),(8222,'history_log','itemid',24542),(8223,'history_uint','itemid',24542),(8224,'history_str','itemid',24542),(8225,'history','itemid',24542),(8226,'trends','itemid',24543),(8227,'trends_uint','itemid',24543),(8228,'history_text','itemid',24543),(8229,'history_log','itemid',24543),(8230,'history_uint','itemid',24543),(8231,'history_str','itemid',24543),(8232,'history','itemid',24543),(8233,'trends','itemid',24544),(8234,'trends_uint','itemid',24544),(8235,'history_text','itemid',24544),(8236,'history_log','itemid',24544),(8237,'history_uint','itemid',24544),(8238,'history_str','itemid',24544),(8239,'history','itemid',24544),(8240,'trends','itemid',24545),(8241,'trends_uint','itemid',24545),(8242,'history_text','itemid',24545),(8243,'history_log','itemid',24545),(8244,'history_uint','itemid',24545),(8245,'history_str','itemid',24545),(8246,'history','itemid',24545),(8247,'trends','itemid',24546),(8248,'trends_uint','itemid',24546),(8249,'history_text','itemid',24546),(8250,'history_log','itemid',24546),(8251,'history_uint','itemid',24546),(8252,'history_str','itemid',24546),(8253,'history','itemid',24546),(8254,'trends','itemid',24547),(8255,'trends_uint','itemid',24547),(8256,'history_text','itemid',24547),(8257,'history_log','itemid',24547),(8258,'history_uint','itemid',24547),(8259,'history_str','itemid',24547),(8260,'history','itemid',24547),(8261,'trends','itemid',24548),(8262,'trends_uint','itemid',24548),(8263,'history_text','itemid',24548),(8264,'history_log','itemid',24548),(8265,'history_uint','itemid',24548),(8266,'history_str','itemid',24548),(8267,'history','itemid',24548),(8268,'trends','itemid',24549),(8269,'trends_uint','itemid',24549),(8270,'history_text','itemid',24549),(8271,'history_log','itemid',24549),(8272,'history_uint','itemid',24549),(8273,'history_str','itemid',24549),(8274,'history','itemid',24549),(8275,'trends','itemid',24550),(8276,'trends_uint','itemid',24550),(8277,'history_text','itemid',24550),(8278,'history_log','itemid',24550),(8279,'history_uint','itemid',24550),(8280,'history_str','itemid',24550),(8281,'history','itemid',24550),(8282,'trends','itemid',24551),(8283,'trends_uint','itemid',24551),(8284,'history_text','itemid',24551),(8285,'history_log','itemid',24551),(8286,'history_uint','itemid',24551),(8287,'history_str','itemid',24551),(8288,'history','itemid',24551),(8289,'trends','itemid',24552),(8290,'trends_uint','itemid',24552),(8291,'history_text','itemid',24552),(8292,'history_log','itemid',24552),(8293,'history_uint','itemid',24552),(8294,'history_str','itemid',24552),(8295,'history','itemid',24552),(8296,'trends','itemid',24553),(8297,'trends_uint','itemid',24553),(8298,'history_text','itemid',24553),(8299,'history_log','itemid',24553),(8300,'history_uint','itemid',24553),(8301,'history_str','itemid',24553),(8302,'history','itemid',24553),(8303,'trends','itemid',24554),(8304,'trends_uint','itemid',24554),(8305,'history_text','itemid',24554),(8306,'history_log','itemid',24554),(8307,'history_uint','itemid',24554),(8308,'history_str','itemid',24554),(8309,'history','itemid',24554),(8310,'trends','itemid',24555),(8311,'trends_uint','itemid',24555),(8312,'history_text','itemid',24555),(8313,'history_log','itemid',24555),(8314,'history_uint','itemid',24555),(8315,'history_str','itemid',24555),(8316,'history','itemid',24555),(8317,'trends','itemid',24556),(8318,'trends_uint','itemid',24556),(8319,'history_text','itemid',24556),(8320,'history_log','itemid',24556),(8321,'history_uint','itemid',24556),(8322,'history_str','itemid',24556),(8323,'history','itemid',24556),(8324,'trends','itemid',24557),(8325,'trends_uint','itemid',24557),(8326,'history_text','itemid',24557),(8327,'history_log','itemid',24557),(8328,'history_uint','itemid',24557),(8329,'history_str','itemid',24557),(8330,'history','itemid',24557),(8331,'trends','itemid',24558),(8332,'trends_uint','itemid',24558),(8333,'history_text','itemid',24558),(8334,'history_log','itemid',24558),(8335,'history_uint','itemid',24558),(8336,'history_str','itemid',24558),(8337,'history','itemid',24558),(8338,'trends','itemid',24559),(8339,'trends_uint','itemid',24559),(8340,'history_text','itemid',24559),(8341,'history_log','itemid',24559),(8342,'history_uint','itemid',24559),(8343,'history_str','itemid',24559),(8344,'history','itemid',24559),(8345,'trends','itemid',24560),(8346,'trends_uint','itemid',24560),(8347,'history_text','itemid',24560),(8348,'history_log','itemid',24560),(8349,'history_uint','itemid',24560),(8350,'history_str','itemid',24560),(8351,'history','itemid',24560),(8352,'trends','itemid',24561),(8353,'trends_uint','itemid',24561),(8354,'history_text','itemid',24561),(8355,'history_log','itemid',24561),(8356,'history_uint','itemid',24561),(8357,'history_str','itemid',24561),(8358,'history','itemid',24561),(8359,'trends','itemid',24562),(8360,'trends_uint','itemid',24562),(8361,'history_text','itemid',24562),(8362,'history_log','itemid',24562),(8363,'history_uint','itemid',24562),(8364,'history_str','itemid',24562),(8365,'history','itemid',24562),(8366,'trends','itemid',24563),(8367,'trends_uint','itemid',24563),(8368,'history_text','itemid',24563),(8369,'history_log','itemid',24563),(8370,'history_uint','itemid',24563),(8371,'history_str','itemid',24563),(8372,'history','itemid',24563),(8373,'trends','itemid',24564),(8374,'trends_uint','itemid',24564),(8375,'history_text','itemid',24564),(8376,'history_log','itemid',24564),(8377,'history_uint','itemid',24564),(8378,'history_str','itemid',24564),(8379,'history','itemid',24564),(8380,'trends','itemid',24565),(8381,'trends_uint','itemid',24565),(8382,'history_text','itemid',24565),(8383,'history_log','itemid',24565),(8384,'history_uint','itemid',24565),(8385,'history_str','itemid',24565),(8386,'history','itemid',24565),(8387,'trends','itemid',24566),(8388,'trends_uint','itemid',24566),(8389,'history_text','itemid',24566),(8390,'history_log','itemid',24566),(8391,'history_uint','itemid',24566),(8392,'history_str','itemid',24566),(8393,'history','itemid',24566),(8394,'trends','itemid',24567),(8395,'trends_uint','itemid',24567),(8396,'history_text','itemid',24567),(8397,'history_log','itemid',24567),(8398,'history_uint','itemid',24567),(8399,'history_str','itemid',24567),(8400,'history','itemid',24567),(8401,'trends','itemid',24568),(8402,'trends_uint','itemid',24568),(8403,'history_text','itemid',24568),(8404,'history_log','itemid',24568),(8405,'history_uint','itemid',24568),(8406,'history_str','itemid',24568),(8407,'history','itemid',24568),(8408,'trends','itemid',24569),(8409,'trends_uint','itemid',24569),(8410,'history_text','itemid',24569),(8411,'history_log','itemid',24569),(8412,'history_uint','itemid',24569),(8413,'history_str','itemid',24569),(8414,'history','itemid',24569),(8415,'trends','itemid',24570),(8416,'trends_uint','itemid',24570),(8417,'history_text','itemid',24570),(8418,'history_log','itemid',24570),(8419,'history_uint','itemid',24570),(8420,'history_str','itemid',24570),(8421,'history','itemid',24570),(8422,'trends','itemid',24571),(8423,'trends_uint','itemid',24571),(8424,'history_text','itemid',24571),(8425,'history_log','itemid',24571),(8426,'history_uint','itemid',24571),(8427,'history_str','itemid',24571),(8428,'history','itemid',24571),(8429,'trends','itemid',24572),(8430,'trends_uint','itemid',24572),(8431,'history_text','itemid',24572),(8432,'history_log','itemid',24572),(8433,'history_uint','itemid',24572),(8434,'history_str','itemid',24572),(8435,'history','itemid',24572),(8436,'trends','itemid',24573),(8437,'trends_uint','itemid',24573),(8438,'history_text','itemid',24573),(8439,'history_log','itemid',24573),(8440,'history_uint','itemid',24573),(8441,'history_str','itemid',24573),(8442,'history','itemid',24573),(8443,'trends','itemid',24574),(8444,'trends_uint','itemid',24574),(8445,'history_text','itemid',24574),(8446,'history_log','itemid',24574),(8447,'history_uint','itemid',24574),(8448,'history_str','itemid',24574),(8449,'history','itemid',24574),(8450,'trends','itemid',24575),(8451,'trends_uint','itemid',24575),(8452,'history_text','itemid',24575),(8453,'history_log','itemid',24575),(8454,'history_uint','itemid',24575),(8455,'history_str','itemid',24575),(8456,'history','itemid',24575),(8457,'trends','itemid',24576),(8458,'trends_uint','itemid',24576),(8459,'history_text','itemid',24576),(8460,'history_log','itemid',24576),(8461,'history_uint','itemid',24576),(8462,'history_str','itemid',24576),(8463,'history','itemid',24576),(8464,'trends','itemid',24577),(8465,'trends_uint','itemid',24577),(8466,'history_text','itemid',24577),(8467,'history_log','itemid',24577),(8468,'history_uint','itemid',24577),(8469,'history_str','itemid',24577),(8470,'history','itemid',24577),(8471,'trends','itemid',24578),(8472,'trends_uint','itemid',24578),(8473,'history_text','itemid',24578),(8474,'history_log','itemid',24578),(8475,'history_uint','itemid',24578),(8476,'history_str','itemid',24578),(8477,'history','itemid',24578),(8478,'trends','itemid',24579),(8479,'trends_uint','itemid',24579),(8480,'history_text','itemid',24579),(8481,'history_log','itemid',24579),(8482,'history_uint','itemid',24579),(8483,'history_str','itemid',24579),(8484,'history','itemid',24579),(8485,'trends','itemid',24580),(8486,'trends_uint','itemid',24580),(8487,'history_text','itemid',24580),(8488,'history_log','itemid',24580),(8489,'history_uint','itemid',24580),(8490,'history_str','itemid',24580),(8491,'history','itemid',24580),(8492,'trends','itemid',24581),(8493,'trends_uint','itemid',24581),(8494,'history_text','itemid',24581),(8495,'history_log','itemid',24581),(8496,'history_uint','itemid',24581),(8497,'history_str','itemid',24581),(8498,'history','itemid',24581),(8499,'trends','itemid',24582),(8500,'trends_uint','itemid',24582),(8501,'history_text','itemid',24582),(8502,'history_log','itemid',24582),(8503,'history_uint','itemid',24582),(8504,'history_str','itemid',24582),(8505,'history','itemid',24582),(8506,'trends','itemid',24583),(8507,'trends_uint','itemid',24583),(8508,'history_text','itemid',24583),(8509,'history_log','itemid',24583),(8510,'history_uint','itemid',24583),(8511,'history_str','itemid',24583),(8512,'history','itemid',24583),(8513,'trends','itemid',24584),(8514,'trends_uint','itemid',24584),(8515,'history_text','itemid',24584),(8516,'history_log','itemid',24584),(8517,'history_uint','itemid',24584),(8518,'history_str','itemid',24584),(8519,'history','itemid',24584),(8520,'trends','itemid',24585),(8521,'trends_uint','itemid',24585),(8522,'history_text','itemid',24585),(8523,'history_log','itemid',24585),(8524,'history_uint','itemid',24585),(8525,'history_str','itemid',24585),(8526,'history','itemid',24585),(8527,'trends','itemid',24586),(8528,'trends_uint','itemid',24586),(8529,'history_text','itemid',24586),(8530,'history_log','itemid',24586),(8531,'history_uint','itemid',24586),(8532,'history_str','itemid',24586),(8533,'history','itemid',24586),(8534,'trends','itemid',24587),(8535,'trends_uint','itemid',24587),(8536,'history_text','itemid',24587),(8537,'history_log','itemid',24587),(8538,'history_uint','itemid',24587),(8539,'history_str','itemid',24587),(8540,'history','itemid',24587),(8541,'trends','itemid',24588),(8542,'trends_uint','itemid',24588),(8543,'history_text','itemid',24588),(8544,'history_log','itemid',24588),(8545,'history_uint','itemid',24588),(8546,'history_str','itemid',24588),(8547,'history','itemid',24588),(8548,'trends','itemid',24589),(8549,'trends_uint','itemid',24589),(8550,'history_text','itemid',24589),(8551,'history_log','itemid',24589),(8552,'history_uint','itemid',24589),(8553,'history_str','itemid',24589),(8554,'history','itemid',24589),(8555,'trends','itemid',24590),(8556,'trends_uint','itemid',24590),(8557,'history_text','itemid',24590),(8558,'history_log','itemid',24590),(8559,'history_uint','itemid',24590),(8560,'history_str','itemid',24590),(8561,'history','itemid',24590),(8562,'trends','itemid',24591),(8563,'trends_uint','itemid',24591),(8564,'history_text','itemid',24591),(8565,'history_log','itemid',24591),(8566,'history_uint','itemid',24591),(8567,'history_str','itemid',24591),(8568,'history','itemid',24591),(8569,'trends','itemid',24592),(8570,'trends_uint','itemid',24592),(8571,'history_text','itemid',24592),(8572,'history_log','itemid',24592),(8573,'history_uint','itemid',24592),(8574,'history_str','itemid',24592),(8575,'history','itemid',24592),(8576,'trends','itemid',24593),(8577,'trends_uint','itemid',24593),(8578,'history_text','itemid',24593),(8579,'history_log','itemid',24593),(8580,'history_uint','itemid',24593),(8581,'history_str','itemid',24593),(8582,'history','itemid',24593),(8583,'trends','itemid',24594),(8584,'trends_uint','itemid',24594),(8585,'history_text','itemid',24594),(8586,'history_log','itemid',24594),(8587,'history_uint','itemid',24594),(8588,'history_str','itemid',24594),(8589,'history','itemid',24594),(8590,'trends','itemid',24595),(8591,'trends_uint','itemid',24595),(8592,'history_text','itemid',24595),(8593,'history_log','itemid',24595),(8594,'history_uint','itemid',24595),(8595,'history_str','itemid',24595),(8596,'history','itemid',24595),(8597,'trends','itemid',24596),(8598,'trends_uint','itemid',24596),(8599,'history_text','itemid',24596),(8600,'history_log','itemid',24596),(8601,'history_uint','itemid',24596),(8602,'history_str','itemid',24596),(8603,'history','itemid',24596),(8604,'trends','itemid',24597),(8605,'trends_uint','itemid',24597),(8606,'history_text','itemid',24597),(8607,'history_log','itemid',24597),(8608,'history_uint','itemid',24597),(8609,'history_str','itemid',24597),(8610,'history','itemid',24597),(8611,'trends','itemid',24598),(8612,'trends_uint','itemid',24598),(8613,'history_text','itemid',24598),(8614,'history_log','itemid',24598),(8615,'history_uint','itemid',24598),(8616,'history_str','itemid',24598),(8617,'history','itemid',24598),(8618,'trends','itemid',24599),(8619,'trends_uint','itemid',24599),(8620,'history_text','itemid',24599),(8621,'history_log','itemid',24599),(8622,'history_uint','itemid',24599),(8623,'history_str','itemid',24599),(8624,'history','itemid',24599),(8625,'trends','itemid',24600),(8626,'trends_uint','itemid',24600),(8627,'history_text','itemid',24600),(8628,'history_log','itemid',24600),(8629,'history_uint','itemid',24600),(8630,'history_str','itemid',24600),(8631,'history','itemid',24600),(8632,'trends','itemid',24601),(8633,'trends_uint','itemid',24601),(8634,'history_text','itemid',24601),(8635,'history_log','itemid',24601),(8636,'history_uint','itemid',24601),(8637,'history_str','itemid',24601),(8638,'history','itemid',24601),(8639,'trends','itemid',24602),(8640,'trends_uint','itemid',24602),(8641,'history_text','itemid',24602),(8642,'history_log','itemid',24602),(8643,'history_uint','itemid',24602),(8644,'history_str','itemid',24602),(8645,'history','itemid',24602),(8646,'trends','itemid',24603),(8647,'trends_uint','itemid',24603),(8648,'history_text','itemid',24603),(8649,'history_log','itemid',24603),(8650,'history_uint','itemid',24603),(8651,'history_str','itemid',24603),(8652,'history','itemid',24603),(8653,'trends','itemid',24604),(8654,'trends_uint','itemid',24604),(8655,'history_text','itemid',24604),(8656,'history_log','itemid',24604),(8657,'history_uint','itemid',24604),(8658,'history_str','itemid',24604),(8659,'history','itemid',24604),(8660,'trends','itemid',24605),(8661,'trends_uint','itemid',24605),(8662,'history_text','itemid',24605),(8663,'history_log','itemid',24605),(8664,'history_uint','itemid',24605),(8665,'history_str','itemid',24605),(8666,'history','itemid',24605),(8667,'trends','itemid',24606),(8668,'trends_uint','itemid',24606),(8669,'history_text','itemid',24606),(8670,'history_log','itemid',24606),(8671,'history_uint','itemid',24606),(8672,'history_str','itemid',24606),(8673,'history','itemid',24606),(8674,'trends','itemid',24607),(8675,'trends_uint','itemid',24607),(8676,'history_text','itemid',24607),(8677,'history_log','itemid',24607),(8678,'history_uint','itemid',24607),(8679,'history_str','itemid',24607),(8680,'history','itemid',24607),(8681,'trends','itemid',24608),(8682,'trends_uint','itemid',24608),(8683,'history_text','itemid',24608),(8684,'history_log','itemid',24608),(8685,'history_uint','itemid',24608),(8686,'history_str','itemid',24608),(8687,'history','itemid',24608),(8688,'trends','itemid',24609),(8689,'trends_uint','itemid',24609),(8690,'history_text','itemid',24609),(8691,'history_log','itemid',24609),(8692,'history_uint','itemid',24609),(8693,'history_str','itemid',24609),(8694,'history','itemid',24609),(8695,'trends','itemid',24610),(8696,'trends_uint','itemid',24610),(8697,'history_text','itemid',24610),(8698,'history_log','itemid',24610),(8699,'history_uint','itemid',24610),(8700,'history_str','itemid',24610),(8701,'history','itemid',24610),(8702,'trends','itemid',24611),(8703,'trends_uint','itemid',24611),(8704,'history_text','itemid',24611),(8705,'history_log','itemid',24611),(8706,'history_uint','itemid',24611),(8707,'history_str','itemid',24611),(8708,'history','itemid',24611),(8709,'trends','itemid',24612),(8710,'trends_uint','itemid',24612),(8711,'history_text','itemid',24612),(8712,'history_log','itemid',24612),(8713,'history_uint','itemid',24612),(8714,'history_str','itemid',24612),(8715,'history','itemid',24612),(8716,'trends','itemid',24613),(8717,'trends_uint','itemid',24613),(8718,'history_text','itemid',24613),(8719,'history_log','itemid',24613),(8720,'history_uint','itemid',24613),(8721,'history_str','itemid',24613),(8722,'history','itemid',24613),(8723,'trends','itemid',24614),(8724,'trends_uint','itemid',24614),(8725,'history_text','itemid',24614),(8726,'history_log','itemid',24614),(8727,'history_uint','itemid',24614),(8728,'history_str','itemid',24614),(8729,'history','itemid',24614),(8730,'trends','itemid',24615),(8731,'trends_uint','itemid',24615),(8732,'history_text','itemid',24615),(8733,'history_log','itemid',24615),(8734,'history_uint','itemid',24615),(8735,'history_str','itemid',24615),(8736,'history','itemid',24615),(8737,'trends','itemid',24616),(8738,'trends_uint','itemid',24616),(8739,'history_text','itemid',24616),(8740,'history_log','itemid',24616),(8741,'history_uint','itemid',24616),(8742,'history_str','itemid',24616),(8743,'history','itemid',24616),(8744,'trends','itemid',24617),(8745,'trends_uint','itemid',24617),(8746,'history_text','itemid',24617),(8747,'history_log','itemid',24617),(8748,'history_uint','itemid',24617),(8749,'history_str','itemid',24617),(8750,'history','itemid',24617),(8751,'trends','itemid',24618),(8752,'trends_uint','itemid',24618),(8753,'history_text','itemid',24618),(8754,'history_log','itemid',24618),(8755,'history_uint','itemid',24618),(8756,'history_str','itemid',24618),(8757,'history','itemid',24618),(8758,'trends','itemid',24619),(8759,'trends_uint','itemid',24619),(8760,'history_text','itemid',24619),(8761,'history_log','itemid',24619),(8762,'history_uint','itemid',24619),(8763,'history_str','itemid',24619),(8764,'history','itemid',24619),(8765,'trends','itemid',24620),(8766,'trends_uint','itemid',24620),(8767,'history_text','itemid',24620),(8768,'history_log','itemid',24620),(8769,'history_uint','itemid',24620),(8770,'history_str','itemid',24620),(8771,'history','itemid',24620),(8772,'trends','itemid',24621),(8773,'trends_uint','itemid',24621),(8774,'history_text','itemid',24621),(8775,'history_log','itemid',24621),(8776,'history_uint','itemid',24621),(8777,'history_str','itemid',24621),(8778,'history','itemid',24621),(8779,'trends','itemid',24622),(8780,'trends_uint','itemid',24622),(8781,'history_text','itemid',24622),(8782,'history_log','itemid',24622),(8783,'history_uint','itemid',24622),(8784,'history_str','itemid',24622),(8785,'history','itemid',24622),(8786,'trends','itemid',24623),(8787,'trends_uint','itemid',24623),(8788,'history_text','itemid',24623),(8789,'history_log','itemid',24623),(8790,'history_uint','itemid',24623),(8791,'history_str','itemid',24623),(8792,'history','itemid',24623),(8793,'trends','itemid',24624),(8794,'trends_uint','itemid',24624),(8795,'history_text','itemid',24624),(8796,'history_log','itemid',24624),(8797,'history_uint','itemid',24624),(8798,'history_str','itemid',24624),(8799,'history','itemid',24624),(8800,'trends','itemid',24625),(8801,'trends_uint','itemid',24625),(8802,'history_text','itemid',24625),(8803,'history_log','itemid',24625),(8804,'history_uint','itemid',24625),(8805,'history_str','itemid',24625),(8806,'history','itemid',24625),(8807,'trends','itemid',24626),(8808,'trends_uint','itemid',24626),(8809,'history_text','itemid',24626),(8810,'history_log','itemid',24626),(8811,'history_uint','itemid',24626),(8812,'history_str','itemid',24626),(8813,'history','itemid',24626),(8814,'trends','itemid',24627),(8815,'trends_uint','itemid',24627),(8816,'history_text','itemid',24627),(8817,'history_log','itemid',24627),(8818,'history_uint','itemid',24627),(8819,'history_str','itemid',24627),(8820,'history','itemid',24627),(8821,'trends','itemid',24628),(8822,'trends_uint','itemid',24628),(8823,'history_text','itemid',24628),(8824,'history_log','itemid',24628),(8825,'history_uint','itemid',24628),(8826,'history_str','itemid',24628),(8827,'history','itemid',24628),(8828,'trends','itemid',24629),(8829,'trends_uint','itemid',24629),(8830,'history_text','itemid',24629),(8831,'history_log','itemid',24629),(8832,'history_uint','itemid',24629),(8833,'history_str','itemid',24629),(8834,'history','itemid',24629),(8835,'trends','itemid',24630),(8836,'trends_uint','itemid',24630),(8837,'history_text','itemid',24630),(8838,'history_log','itemid',24630),(8839,'history_uint','itemid',24630),(8840,'history_str','itemid',24630),(8841,'history','itemid',24630),(8842,'trends','itemid',24631),(8843,'trends_uint','itemid',24631),(8844,'history_text','itemid',24631),(8845,'history_log','itemid',24631),(8846,'history_uint','itemid',24631),(8847,'history_str','itemid',24631),(8848,'history','itemid',24631),(8849,'trends','itemid',24632),(8850,'trends_uint','itemid',24632),(8851,'history_text','itemid',24632),(8852,'history_log','itemid',24632),(8853,'history_uint','itemid',24632),(8854,'history_str','itemid',24632),(8855,'history','itemid',24632),(8856,'trends','itemid',24633),(8857,'trends_uint','itemid',24633),(8858,'history_text','itemid',24633),(8859,'history_log','itemid',24633),(8860,'history_uint','itemid',24633),(8861,'history_str','itemid',24633),(8862,'history','itemid',24633),(8863,'trends','itemid',24634),(8864,'trends_uint','itemid',24634),(8865,'history_text','itemid',24634),(8866,'history_log','itemid',24634),(8867,'history_uint','itemid',24634),(8868,'history_str','itemid',24634),(8869,'history','itemid',24634),(8870,'trends','itemid',24635),(8871,'trends_uint','itemid',24635),(8872,'history_text','itemid',24635),(8873,'history_log','itemid',24635),(8874,'history_uint','itemid',24635),(8875,'history_str','itemid',24635),(8876,'history','itemid',24635),(8877,'trends','itemid',24636),(8878,'trends_uint','itemid',24636),(8879,'history_text','itemid',24636),(8880,'history_log','itemid',24636),(8881,'history_uint','itemid',24636),(8882,'history_str','itemid',24636),(8883,'history','itemid',24636),(8884,'trends','itemid',24637),(8885,'trends_uint','itemid',24637),(8886,'history_text','itemid',24637),(8887,'history_log','itemid',24637),(8888,'history_uint','itemid',24637),(8889,'history_str','itemid',24637),(8890,'history','itemid',24637),(8891,'trends','itemid',24638),(8892,'trends_uint','itemid',24638),(8893,'history_text','itemid',24638),(8894,'history_log','itemid',24638),(8895,'history_uint','itemid',24638),(8896,'history_str','itemid',24638),(8897,'history','itemid',24638),(8898,'trends','itemid',24639),(8899,'trends_uint','itemid',24639),(8900,'history_text','itemid',24639),(8901,'history_log','itemid',24639),(8902,'history_uint','itemid',24639),(8903,'history_str','itemid',24639),(8904,'history','itemid',24639),(8905,'trends','itemid',24640),(8906,'trends_uint','itemid',24640),(8907,'history_text','itemid',24640),(8908,'history_log','itemid',24640),(8909,'history_uint','itemid',24640),(8910,'history_str','itemid',24640),(8911,'history','itemid',24640),(8912,'trends','itemid',24641),(8913,'trends_uint','itemid',24641),(8914,'history_text','itemid',24641),(8915,'history_log','itemid',24641),(8916,'history_uint','itemid',24641),(8917,'history_str','itemid',24641),(8918,'history','itemid',24641),(8919,'trends','itemid',24642),(8920,'trends_uint','itemid',24642),(8921,'history_text','itemid',24642),(8922,'history_log','itemid',24642),(8923,'history_uint','itemid',24642),(8924,'history_str','itemid',24642),(8925,'history','itemid',24642),(8926,'trends','itemid',24643),(8927,'trends_uint','itemid',24643),(8928,'history_text','itemid',24643),(8929,'history_log','itemid',24643),(8930,'history_uint','itemid',24643),(8931,'history_str','itemid',24643),(8932,'history','itemid',24643),(8933,'trends','itemid',24644),(8934,'trends_uint','itemid',24644),(8935,'history_text','itemid',24644),(8936,'history_log','itemid',24644),(8937,'history_uint','itemid',24644),(8938,'history_str','itemid',24644),(8939,'history','itemid',24644),(8940,'trends','itemid',24645),(8941,'trends_uint','itemid',24645),(8942,'history_text','itemid',24645),(8943,'history_log','itemid',24645),(8944,'history_uint','itemid',24645),(8945,'history_str','itemid',24645),(8946,'history','itemid',24645),(8947,'trends','itemid',24646),(8948,'trends_uint','itemid',24646),(8949,'history_text','itemid',24646),(8950,'history_log','itemid',24646),(8951,'history_uint','itemid',24646),(8952,'history_str','itemid',24646),(8953,'history','itemid',24646),(8954,'trends','itemid',24647),(8955,'trends_uint','itemid',24647),(8956,'history_text','itemid',24647),(8957,'history_log','itemid',24647),(8958,'history_uint','itemid',24647),(8959,'history_str','itemid',24647),(8960,'history','itemid',24647),(8961,'trends','itemid',24648),(8962,'trends_uint','itemid',24648),(8963,'history_text','itemid',24648),(8964,'history_log','itemid',24648),(8965,'history_uint','itemid',24648),(8966,'history_str','itemid',24648),(8967,'history','itemid',24648),(8968,'trends','itemid',24649),(8969,'trends_uint','itemid',24649),(8970,'history_text','itemid',24649),(8971,'history_log','itemid',24649),(8972,'history_uint','itemid',24649),(8973,'history_str','itemid',24649),(8974,'history','itemid',24649),(8975,'trends','itemid',24650),(8976,'trends_uint','itemid',24650),(8977,'history_text','itemid',24650),(8978,'history_log','itemid',24650),(8979,'history_uint','itemid',24650),(8980,'history_str','itemid',24650),(8981,'history','itemid',24650),(8982,'trends','itemid',24651),(8983,'trends_uint','itemid',24651),(8984,'history_text','itemid',24651),(8985,'history_log','itemid',24651),(8986,'history_uint','itemid',24651),(8987,'history_str','itemid',24651),(8988,'history','itemid',24651),(8989,'trends','itemid',24652),(8990,'trends_uint','itemid',24652),(8991,'history_text','itemid',24652),(8992,'history_log','itemid',24652),(8993,'history_uint','itemid',24652),(8994,'history_str','itemid',24652),(8995,'history','itemid',24652),(8996,'trends','itemid',24653),(8997,'trends_uint','itemid',24653),(8998,'history_text','itemid',24653),(8999,'history_log','itemid',24653),(9000,'history_uint','itemid',24653),(9001,'history_str','itemid',24653),(9002,'history','itemid',24653),(9003,'trends','itemid',24654),(9004,'trends_uint','itemid',24654),(9005,'history_text','itemid',24654),(9006,'history_log','itemid',24654),(9007,'history_uint','itemid',24654),(9008,'history_str','itemid',24654),(9009,'history','itemid',24654),(9010,'trends','itemid',24655),(9011,'trends_uint','itemid',24655),(9012,'history_text','itemid',24655),(9013,'history_log','itemid',24655),(9014,'history_uint','itemid',24655),(9015,'history_str','itemid',24655),(9016,'history','itemid',24655),(9017,'trends','itemid',24656),(9018,'trends_uint','itemid',24656),(9019,'history_text','itemid',24656),(9020,'history_log','itemid',24656),(9021,'history_uint','itemid',24656),(9022,'history_str','itemid',24656),(9023,'history','itemid',24656),(9024,'trends','itemid',24657),(9025,'trends_uint','itemid',24657),(9026,'history_text','itemid',24657),(9027,'history_log','itemid',24657),(9028,'history_uint','itemid',24657),(9029,'history_str','itemid',24657),(9030,'history','itemid',24657),(9031,'trends','itemid',24658),(9032,'trends_uint','itemid',24658),(9033,'history_text','itemid',24658),(9034,'history_log','itemid',24658),(9035,'history_uint','itemid',24658),(9036,'history_str','itemid',24658),(9037,'history','itemid',24658),(9038,'trends','itemid',24659),(9039,'trends_uint','itemid',24659),(9040,'history_text','itemid',24659),(9041,'history_log','itemid',24659),(9042,'history_uint','itemid',24659),(9043,'history_str','itemid',24659),(9044,'history','itemid',24659),(9045,'trends','itemid',24660),(9046,'trends_uint','itemid',24660),(9047,'history_text','itemid',24660),(9048,'history_log','itemid',24660),(9049,'history_uint','itemid',24660),(9050,'history_str','itemid',24660),(9051,'history','itemid',24660),(9052,'trends','itemid',24661),(9053,'trends_uint','itemid',24661),(9054,'history_text','itemid',24661),(9055,'history_log','itemid',24661),(9056,'history_uint','itemid',24661),(9057,'history_str','itemid',24661),(9058,'history','itemid',24661),(9059,'trends','itemid',24662),(9060,'trends_uint','itemid',24662),(9061,'history_text','itemid',24662),(9062,'history_log','itemid',24662),(9063,'history_uint','itemid',24662),(9064,'history_str','itemid',24662),(9065,'history','itemid',24662),(9066,'trends','itemid',24663),(9067,'trends_uint','itemid',24663),(9068,'history_text','itemid',24663),(9069,'history_log','itemid',24663),(9070,'history_uint','itemid',24663),(9071,'history_str','itemid',24663),(9072,'history','itemid',24663),(9073,'trends','itemid',24664),(9074,'trends_uint','itemid',24664),(9075,'history_text','itemid',24664),(9076,'history_log','itemid',24664),(9077,'history_uint','itemid',24664),(9078,'history_str','itemid',24664),(9079,'history','itemid',24664),(9080,'trends','itemid',24665),(9081,'trends_uint','itemid',24665),(9082,'history_text','itemid',24665),(9083,'history_log','itemid',24665),(9084,'history_uint','itemid',24665),(9085,'history_str','itemid',24665),(9086,'history','itemid',24665),(9087,'trends','itemid',24666),(9088,'trends_uint','itemid',24666),(9089,'history_text','itemid',24666),(9090,'history_log','itemid',24666),(9091,'history_uint','itemid',24666),(9092,'history_str','itemid',24666),(9093,'history','itemid',24666),(9094,'trends','itemid',24667),(9095,'trends_uint','itemid',24667),(9096,'history_text','itemid',24667),(9097,'history_log','itemid',24667),(9098,'history_uint','itemid',24667),(9099,'history_str','itemid',24667),(9100,'history','itemid',24667),(9101,'trends','itemid',24668),(9102,'trends_uint','itemid',24668),(9103,'history_text','itemid',24668),(9104,'history_log','itemid',24668),(9105,'history_uint','itemid',24668),(9106,'history_str','itemid',24668),(9107,'history','itemid',24668),(9108,'trends','itemid',24669),(9109,'trends_uint','itemid',24669),(9110,'history_text','itemid',24669),(9111,'history_log','itemid',24669),(9112,'history_uint','itemid',24669),(9113,'history_str','itemid',24669),(9114,'history','itemid',24669),(9115,'trends','itemid',24670),(9116,'trends_uint','itemid',24670),(9117,'history_text','itemid',24670),(9118,'history_log','itemid',24670),(9119,'history_uint','itemid',24670),(9120,'history_str','itemid',24670),(9121,'history','itemid',24670),(9122,'trends','itemid',24671),(9123,'trends_uint','itemid',24671),(9124,'history_text','itemid',24671),(9125,'history_log','itemid',24671),(9126,'history_uint','itemid',24671),(9127,'history_str','itemid',24671),(9128,'history','itemid',24671),(9129,'trends','itemid',24672),(9130,'trends_uint','itemid',24672),(9131,'history_text','itemid',24672),(9132,'history_log','itemid',24672),(9133,'history_uint','itemid',24672),(9134,'history_str','itemid',24672),(9135,'history','itemid',24672),(9136,'trends','itemid',24673),(9137,'trends_uint','itemid',24673),(9138,'history_text','itemid',24673),(9139,'history_log','itemid',24673),(9140,'history_uint','itemid',24673),(9141,'history_str','itemid',24673),(9142,'history','itemid',24673),(9143,'trends','itemid',24674),(9144,'trends_uint','itemid',24674),(9145,'history_text','itemid',24674),(9146,'history_log','itemid',24674),(9147,'history_uint','itemid',24674),(9148,'history_str','itemid',24674),(9149,'history','itemid',24674),(9150,'trends','itemid',24675),(9151,'trends_uint','itemid',24675),(9152,'history_text','itemid',24675),(9153,'history_log','itemid',24675),(9154,'history_uint','itemid',24675),(9155,'history_str','itemid',24675),(9156,'history','itemid',24675),(9157,'trends','itemid',24676),(9158,'trends_uint','itemid',24676),(9159,'history_text','itemid',24676),(9160,'history_log','itemid',24676),(9161,'history_uint','itemid',24676),(9162,'history_str','itemid',24676),(9163,'history','itemid',24676);
/*!40000 ALTER TABLE `housekeeper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httpstep`
--

DROP TABLE IF EXISTS `httpstep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httpstep` (
  `httpstepid` bigint(20) unsigned NOT NULL,
  `httptestid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `no` int(11) NOT NULL DEFAULT '0',
  `url` varchar(2048) NOT NULL DEFAULT '',
  `timeout` int(11) NOT NULL DEFAULT '15',
  `posts` text NOT NULL,
  `required` varchar(255) NOT NULL DEFAULT '',
  `status_codes` varchar(255) NOT NULL DEFAULT '',
  `variables` text NOT NULL,
  `follow_redirects` int(11) NOT NULL DEFAULT '1',
  `retrieve_mode` int(11) NOT NULL DEFAULT '0',
  `headers` text NOT NULL,
  PRIMARY KEY (`httpstepid`),
  KEY `httpstep_1` (`httptestid`),
  CONSTRAINT `c_httpstep_1` FOREIGN KEY (`httptestid`) REFERENCES `httptest` (`httptestid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httpstep`
--

LOCK TABLES `httpstep` WRITE;
/*!40000 ALTER TABLE `httpstep` DISABLE KEYS */;
/*!40000 ALTER TABLE `httpstep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httpstepitem`
--

DROP TABLE IF EXISTS `httpstepitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httpstepitem` (
  `httpstepitemid` bigint(20) unsigned NOT NULL,
  `httpstepid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`httpstepitemid`),
  UNIQUE KEY `httpstepitem_1` (`httpstepid`,`itemid`),
  KEY `httpstepitem_2` (`itemid`),
  CONSTRAINT `c_httpstepitem_2` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_httpstepitem_1` FOREIGN KEY (`httpstepid`) REFERENCES `httpstep` (`httpstepid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httpstepitem`
--

LOCK TABLES `httpstepitem` WRITE;
/*!40000 ALTER TABLE `httpstepitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `httpstepitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httptest`
--

DROP TABLE IF EXISTS `httptest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httptest` (
  `httptestid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `applicationid` bigint(20) unsigned DEFAULT NULL,
  `nextcheck` int(11) NOT NULL DEFAULT '0',
  `delay` int(11) NOT NULL DEFAULT '60',
  `status` int(11) NOT NULL DEFAULT '0',
  `variables` text NOT NULL,
  `agent` varchar(255) NOT NULL DEFAULT 'Zabbix',
  `authentication` int(11) NOT NULL DEFAULT '0',
  `http_user` varchar(64) NOT NULL DEFAULT '',
  `http_password` varchar(64) NOT NULL DEFAULT '',
  `hostid` bigint(20) unsigned NOT NULL,
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `http_proxy` varchar(255) NOT NULL DEFAULT '',
  `retries` int(11) NOT NULL DEFAULT '1',
  `ssl_cert_file` varchar(255) NOT NULL DEFAULT '',
  `ssl_key_file` varchar(255) NOT NULL DEFAULT '',
  `ssl_key_password` varchar(64) NOT NULL DEFAULT '',
  `verify_peer` int(11) NOT NULL DEFAULT '0',
  `verify_host` int(11) NOT NULL DEFAULT '0',
  `headers` text NOT NULL,
  PRIMARY KEY (`httptestid`),
  UNIQUE KEY `httptest_2` (`hostid`,`name`),
  KEY `httptest_1` (`applicationid`),
  KEY `httptest_3` (`status`),
  KEY `httptest_4` (`templateid`),
  CONSTRAINT `c_httptest_3` FOREIGN KEY (`templateid`) REFERENCES `httptest` (`httptestid`) ON DELETE CASCADE,
  CONSTRAINT `c_httptest_1` FOREIGN KEY (`applicationid`) REFERENCES `applications` (`applicationid`),
  CONSTRAINT `c_httptest_2` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httptest`
--

LOCK TABLES `httptest` WRITE;
/*!40000 ALTER TABLE `httptest` DISABLE KEYS */;
/*!40000 ALTER TABLE `httptest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httptestitem`
--

DROP TABLE IF EXISTS `httptestitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httptestitem` (
  `httptestitemid` bigint(20) unsigned NOT NULL,
  `httptestid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`httptestitemid`),
  UNIQUE KEY `httptestitem_1` (`httptestid`,`itemid`),
  KEY `httptestitem_2` (`itemid`),
  CONSTRAINT `c_httptestitem_2` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_httptestitem_1` FOREIGN KEY (`httptestid`) REFERENCES `httptest` (`httptestid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httptestitem`
--

LOCK TABLES `httptestitem` WRITE;
/*!40000 ALTER TABLE `httptestitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `httptestitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icon_map`
--

DROP TABLE IF EXISTS `icon_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icon_map` (
  `iconmapid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `default_iconid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`iconmapid`),
  UNIQUE KEY `icon_map_1` (`name`),
  KEY `icon_map_2` (`default_iconid`),
  CONSTRAINT `c_icon_map_1` FOREIGN KEY (`default_iconid`) REFERENCES `images` (`imageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icon_map`
--

LOCK TABLES `icon_map` WRITE;
/*!40000 ALTER TABLE `icon_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `icon_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icon_mapping`
--

DROP TABLE IF EXISTS `icon_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icon_mapping` (
  `iconmappingid` bigint(20) unsigned NOT NULL,
  `iconmapid` bigint(20) unsigned NOT NULL,
  `iconid` bigint(20) unsigned NOT NULL,
  `inventory_link` int(11) NOT NULL DEFAULT '0',
  `expression` varchar(64) NOT NULL DEFAULT '',
  `sortorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`iconmappingid`),
  KEY `icon_mapping_1` (`iconmapid`),
  KEY `icon_mapping_2` (`iconid`),
  CONSTRAINT `c_icon_mapping_2` FOREIGN KEY (`iconid`) REFERENCES `images` (`imageid`),
  CONSTRAINT `c_icon_mapping_1` FOREIGN KEY (`iconmapid`) REFERENCES `icon_map` (`iconmapid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icon_mapping`
--

LOCK TABLES `icon_mapping` WRITE;
/*!40000 ALTER TABLE `icon_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `icon_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ids`
--

DROP TABLE IF EXISTS `ids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ids` (
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `field_name` varchar(64) NOT NULL DEFAULT '',
  `nextid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`table_name`,`field_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ids`
--

LOCK TABLES `ids` WRITE;
/*!40000 ALTER TABLE `ids` DISABLE KEYS */;
INSERT INTO `ids` VALUES ('actions','actionid',12),('applications','applicationid',458),('application_template','application_templateid',2),('auditlog','auditid',931),('auditlog_details','auditdetailid',32),('conditions','conditionid',18),('functions','functionid',13506),('graphs','graphid',655),('graphs_items','gitemid',2268),('groups','groupid',12),('hosts','hostid',10138),('hosts_groups','hostgroupid',174),('hosts_templates','hosttemplateid',2),('housekeeper','housekeeperid',9163),('items','itemid',24705),('items_applications','itemappid',7034),('item_condition','item_conditionid',26),('item_discovery','itemdiscoveryid',217),('media','mediaid',11),('media_type','mediatypeid',5),('opcommand_grp','opcommand_grpid',1),('opconditions','opconditionid',1),('operations','operationid',28),('opgroup','opgroupid',4),('opmessage_grp','opmessage_grpid',8),('opmessage_usr','opmessage_usrid',3),('optemplate','optemplateid',15),('profiles','profileid',55),('screens','screenid',25),('screens_items','screenitemid',81),('triggers','triggerid',13887);
/*!40000 ALTER TABLE `ids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `imageid` bigint(20) unsigned NOT NULL,
  `imagetype` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '0',
  `image` longblob NOT NULL,
  PRIMARY KEY (`imageid`),
  UNIQUE KEY `images_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interface`
--

DROP TABLE IF EXISTS `interface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interface` (
  `interfaceid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `main` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `useip` int(11) NOT NULL DEFAULT '1',
  `ip` varchar(64) NOT NULL DEFAULT '127.0.0.1',
  `dns` varchar(64) NOT NULL DEFAULT '',
  `port` varchar(64) NOT NULL DEFAULT '10050',
  `bulk` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`interfaceid`),
  KEY `interface_1` (`hostid`,`type`),
  KEY `interface_2` (`ip`,`dns`),
  CONSTRAINT `c_interface_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interface`
--

LOCK TABLES `interface` WRITE;
/*!40000 ALTER TABLE `interface` DISABLE KEYS */;
INSERT INTO `interface` VALUES (1,10084,1,1,1,'127.0.0.1','','10050',1);
/*!40000 ALTER TABLE `interface` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interface_discovery`
--

DROP TABLE IF EXISTS `interface_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interface_discovery` (
  `interfaceid` bigint(20) unsigned NOT NULL,
  `parent_interfaceid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`interfaceid`),
  KEY `c_interface_discovery_2` (`parent_interfaceid`),
  CONSTRAINT `c_interface_discovery_2` FOREIGN KEY (`parent_interfaceid`) REFERENCES `interface` (`interfaceid`) ON DELETE CASCADE,
  CONSTRAINT `c_interface_discovery_1` FOREIGN KEY (`interfaceid`) REFERENCES `interface` (`interfaceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interface_discovery`
--

LOCK TABLES `interface_discovery` WRITE;
/*!40000 ALTER TABLE `interface_discovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `interface_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_application_prototype`
--

DROP TABLE IF EXISTS `item_application_prototype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_application_prototype` (
  `item_application_prototypeid` bigint(20) unsigned NOT NULL,
  `application_prototypeid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`item_application_prototypeid`),
  UNIQUE KEY `item_application_prototype_1` (`application_prototypeid`,`itemid`),
  KEY `item_application_prototype_2` (`itemid`),
  CONSTRAINT `c_item_application_prototype_2` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_item_application_prototype_1` FOREIGN KEY (`application_prototypeid`) REFERENCES `application_prototype` (`application_prototypeid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_application_prototype`
--

LOCK TABLES `item_application_prototype` WRITE;
/*!40000 ALTER TABLE `item_application_prototype` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_application_prototype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_condition`
--

DROP TABLE IF EXISTS `item_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_condition` (
  `item_conditionid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `operator` int(11) NOT NULL DEFAULT '8',
  `macro` varchar(64) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`item_conditionid`),
  KEY `item_condition_1` (`itemid`),
  CONSTRAINT `c_item_condition_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_condition`
--

LOCK TABLES `item_condition` WRITE;
/*!40000 ALTER TABLE `item_condition` DISABLE KEYS */;
INSERT INTO `item_condition` VALUES (19,23278,8,'{#IFNAME}','@Network interfaces for discovery'),(20,23279,8,'{#FSTYPE}','@File systems for discovery'),(23,24678,8,'{#IFNAME}','@Network interfaces for discovery'),(24,24679,8,'{#FSTYPE}','@File systems for discovery'),(25,24680,8,'{#IFNAME}','@Network interfaces for discovery'),(26,24681,8,'{#FSTYPE}','@File systems for discovery');
/*!40000 ALTER TABLE `item_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_discovery`
--

DROP TABLE IF EXISTS `item_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_discovery` (
  `itemdiscoveryid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `parent_itemid` bigint(20) unsigned NOT NULL,
  `key_` varchar(255) NOT NULL DEFAULT '',
  `lastcheck` int(11) NOT NULL DEFAULT '0',
  `ts_delete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemdiscoveryid`),
  UNIQUE KEY `item_discovery_1` (`itemid`,`parent_itemid`),
  KEY `item_discovery_2` (`parent_itemid`),
  CONSTRAINT `c_item_discovery_2` FOREIGN KEY (`parent_itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_item_discovery_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_discovery`
--

LOCK TABLES `item_discovery` WRITE;
/*!40000 ALTER TABLE `item_discovery` DISABLE KEYS */;
INSERT INTO `item_discovery` VALUES (182,23280,23278,'',0,0),(183,23281,23278,'',0,0),(184,23282,23279,'',0,0),(185,23283,23279,'',0,0),(186,23284,23279,'',0,0),(187,23285,23279,'',0,0),(188,23286,23279,'',0,0),(196,24682,24677,'',0,0),(197,24683,24677,'',0,0),(198,24684,24677,'',0,0),(199,24685,24677,'',0,0),(200,24686,24677,'',0,0),(201,24687,24677,'',0,0),(202,24688,24677,'',0,0),(203,24689,24677,'',0,0),(204,24690,24677,'',0,0),(205,24691,24678,'',0,0),(206,24692,24678,'',0,0),(207,24693,24679,'',0,0),(208,24694,24679,'',0,0),(209,24695,24679,'',0,0),(210,24696,24679,'',0,0),(211,24697,24679,'',0,0),(212,24698,24680,'',0,0),(213,24699,24680,'',0,0),(214,24700,24681,'',0,0),(215,24701,24681,'',0,0),(216,24702,24681,'',0,0),(217,24703,24681,'',0,0);
/*!40000 ALTER TABLE `item_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `itemid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `snmp_community` varchar(64) NOT NULL DEFAULT '',
  `snmp_oid` varchar(255) NOT NULL DEFAULT '',
  `hostid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `key_` varchar(255) NOT NULL DEFAULT '',
  `delay` int(11) NOT NULL DEFAULT '0',
  `history` int(11) NOT NULL DEFAULT '90',
  `trends` int(11) NOT NULL DEFAULT '365',
  `status` int(11) NOT NULL DEFAULT '0',
  `value_type` int(11) NOT NULL DEFAULT '0',
  `trapper_hosts` varchar(255) NOT NULL DEFAULT '',
  `units` varchar(255) NOT NULL DEFAULT '',
  `multiplier` int(11) NOT NULL DEFAULT '0',
  `delta` int(11) NOT NULL DEFAULT '0',
  `snmpv3_securityname` varchar(64) NOT NULL DEFAULT '',
  `snmpv3_securitylevel` int(11) NOT NULL DEFAULT '0',
  `snmpv3_authpassphrase` varchar(64) NOT NULL DEFAULT '',
  `snmpv3_privpassphrase` varchar(64) NOT NULL DEFAULT '',
  `formula` varchar(255) NOT NULL DEFAULT '',
  `error` varchar(2048) NOT NULL DEFAULT '',
  `lastlogsize` bigint(20) unsigned NOT NULL DEFAULT '0',
  `logtimefmt` varchar(64) NOT NULL DEFAULT '',
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `valuemapid` bigint(20) unsigned DEFAULT NULL,
  `delay_flex` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `ipmi_sensor` varchar(128) NOT NULL DEFAULT '',
  `data_type` int(11) NOT NULL DEFAULT '0',
  `authtype` int(11) NOT NULL DEFAULT '0',
  `username` varchar(64) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL DEFAULT '',
  `publickey` varchar(64) NOT NULL DEFAULT '',
  `privatekey` varchar(64) NOT NULL DEFAULT '',
  `mtime` int(11) NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  `interfaceid` bigint(20) unsigned DEFAULT NULL,
  `port` varchar(64) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `inventory_link` int(11) NOT NULL DEFAULT '0',
  `lifetime` varchar(64) NOT NULL DEFAULT '30',
  `snmpv3_authprotocol` int(11) NOT NULL DEFAULT '0',
  `snmpv3_privprotocol` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `snmpv3_contextname` varchar(255) NOT NULL DEFAULT '',
  `evaltype` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`),
  UNIQUE KEY `items_1` (`hostid`,`key_`),
  KEY `items_3` (`status`),
  KEY `items_4` (`templateid`),
  KEY `items_5` (`valuemapid`),
  KEY `items_6` (`interfaceid`),
  CONSTRAINT `c_items_4` FOREIGN KEY (`interfaceid`) REFERENCES `interface` (`interfaceid`),
  CONSTRAINT `c_items_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_items_2` FOREIGN KEY (`templateid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_items_3` FOREIGN KEY (`valuemapid`) REFERENCES `valuemaps` (`valuemapid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (23252,5,'','',10084,'Zabbix $4 $2 processes, in %','zabbix[process,alerter,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',23958,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23253,5,'','',10084,'Zabbix $4 $2 processes, in %','zabbix[process,configuration syncer,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',23959,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23254,5,'','',10084,'Zabbix $4 $2 processes, in %','zabbix[process,db watchdog,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',23960,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23255,5,'','',10084,'Zabbix $4 $2 processes, in %','zabbix[process,discoverer,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',23961,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23256,5,'','',10084,'Zabbix $4 $2 processes, in %','zabbix[process,escalator,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',23962,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23257,5,'','',10084,'Zabbix $4 $2 processes, in %','zabbix[process,history syncer,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',23963,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23258,5,'','',10084,'Zabbix $4 $2 processes, in %','zabbix[process,housekeeper,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',23964,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23259,5,'','',10084,'Zabbix $4 $2 processes, in %','zabbix[process,http poller,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',23965,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23260,5,'','',10084,'Zabbix $4 $2 processes, in %','zabbix[process,icmp pinger,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',23966,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23261,5,'','',10084,'Zabbix $4 $2 processes, in %','zabbix[process,ipmi poller,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',23967,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23262,5,'','',10084,'Zabbix $4 $2 processes, in %','zabbix[process,java poller,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',23968,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23264,5,'','',10084,'Zabbix $4 $2 processes, in %','zabbix[process,poller,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',23969,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23265,5,'','',10084,'Zabbix $4 $2 processes, in %','zabbix[process,proxy poller,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',23970,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23266,5,'','',10084,'Zabbix $4 $2 processes, in %','zabbix[process,self-monitoring,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',23971,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23267,5,'','',10084,'Zabbix $4 $2 processes, in %','zabbix[process,snmp trapper,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',23972,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23268,5,'','',10084,'Zabbix $4 $2 processes, in %','zabbix[process,timer,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',23973,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23269,5,'','',10084,'Zabbix $4 $2 processes, in %','zabbix[process,trapper,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',23974,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23270,5,'','',10084,'Zabbix $4 $2 processes, in %','zabbix[process,unreachable poller,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',23975,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23271,5,'','',10084,'Zabbix queue over $2','zabbix[queue,10m]',600,7,365,0,3,'','',0,0,'',0,'','','1','',0,'',23977,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23272,5,'','',10084,'Zabbix queue','zabbix[queue]',600,7,365,0,3,'','',0,0,'',0,'','','1','',0,'',23978,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23273,5,'','',10084,'Zabbix configuration cache, % free','zabbix[rcache,buffer,pfree]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',23979,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23274,5,'','',10084,'Zabbix $2 write cache, % free','zabbix[wcache,history,pfree]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',23985,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23275,5,'','',10084,'Zabbix history index cache, % free','zabbix[wcache,index,pfree]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',23986,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23276,5,'','',10084,'Zabbix $2 write cache, % free','zabbix[wcache,trend,pfree]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',23987,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23277,5,'','',10084,'Values processed by Zabbix server per second','zabbix[wcache,values]',60,7,365,0,0,'','',0,1,'',0,'','','1','',0,'',23988,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23278,0,'','',10084,'Network interface discovery','net.if.discovery',3600,90,0,0,4,'','',0,0,'',0,'','','','',0,'',NULL,NULL,'','','',0,0,'','','','',0,1,1,'','Discovery of network interfaces as defined in global regular expression \"Network interfaces for discovery\".',0,'30',0,0,0,'',0),(23279,0,'','',10084,'Mounted filesystem discovery','vfs.fs.discovery',3600,90,0,0,4,'','',0,0,'',0,'','','','',0,'',NULL,NULL,'','','',0,0,'','','','',0,1,1,'','Discovery of file systems of different types as defined in global regular expression \"File systems for discovery\".',0,'30',0,0,0,'',0),(23280,0,'','',10084,'Incoming network traffic on $1','net.if.in[{#IFNAME}]',60,7,365,0,3,'','bps',1,1,'',0,'','','8','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,1,'','',0,'0',0,0,0,'',0),(23281,0,'','',10084,'Outgoing network traffic on $1','net.if.out[{#IFNAME}]',60,7,365,0,3,'','bps',1,1,'',0,'','','8','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,1,'','',0,'0',0,0,0,'',0),(23282,0,'','',10084,'Free inodes on $1 (percentage)','vfs.fs.inode[{#FSNAME},pfree]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,1,'','',0,'0',0,0,0,'',0),(23283,0,'','',10084,'Free disk space on $1','vfs.fs.size[{#FSNAME},free]',60,7,365,0,3,'','B',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,1,'','',0,'0',0,0,0,'',0),(23284,0,'','',10084,'Free disk space on $1 (percentage)','vfs.fs.size[{#FSNAME},pfree]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,1,'','',0,'0',0,0,0,'',0),(23285,0,'','',10084,'Total disk space on $1','vfs.fs.size[{#FSNAME},total]',3600,7,365,0,3,'','B',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,1,'','',0,'0',0,0,0,'',0),(23286,0,'','',10084,'Used disk space on $1','vfs.fs.size[{#FSNAME},used]',60,7,365,0,3,'','B',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,1,'','',0,'0',0,0,0,'',0),(23287,0,'','',10084,'Agent ping','agent.ping',60,7,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,10,'','','',0,0,'','','','',0,0,1,'','The agent always returns 1 for this item. It could be used in combination with nodata() for availability check.',0,'0',0,0,0,'',0),(23288,0,'','',10084,'Version of zabbix_agent(d) running','agent.version',3600,7,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','',0,'0',0,0,0,'',0),(23289,0,'','',10084,'Maximum number of opened files','kernel.maxfiles',3600,7,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','It could be increased by using sysctrl utility or modifying file /etc/sysctl.conf.',0,'0',0,0,0,'',0),(23290,0,'','',10084,'Maximum number of processes','kernel.maxproc',3600,7,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','It could be increased by using sysctrl utility or modifying file /etc/sysctl.conf.',0,'0',0,0,0,'',0),(23291,0,'','',10084,'Number of running processes','proc.num[,,run]',60,7,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','Number of processes in running state.',0,'0',0,0,0,'',0),(23292,0,'','',10084,'Number of processes','proc.num[]',60,7,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','Total number of processes in any state.',0,'0',0,0,0,'',0),(23293,0,'','',10084,'Host boot time','system.boottime',600,7,365,0,3,'','unixtime',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','',0,'0',0,0,0,'',0),(23294,0,'','',10084,'Interrupts per second','system.cpu.intr',60,7,365,0,3,'','ips',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','',0,'0',0,0,0,'',0),(23295,0,'','',10084,'Processor load (15 min average per core)','system.cpu.load[percpu,avg15]',60,7,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'0',0,0,0,'',0),(23296,0,'','',10084,'Processor load (1 min average per core)','system.cpu.load[percpu,avg1]',60,7,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'0',0,0,0,'',0),(23297,0,'','',10084,'Processor load (5 min average per core)','system.cpu.load[percpu,avg5]',60,7,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','The processor load is calculated as system CPU load divided by number of CPU cores.',0,'0',0,0,0,'',0),(23298,0,'','',10084,'Context switches per second','system.cpu.switches',60,7,365,0,3,'','sps',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','',0,'0',0,0,0,'',0),(23299,0,'','',10084,'CPU $2 time','system.cpu.util[,idle]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','The time the CPU has spent doing nothing.',0,'0',0,0,0,'',0),(23300,0,'','',10084,'CPU $2 time','system.cpu.util[,interrupt]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','The amount of time the CPU has been servicing hardware interrupts.',0,'0',0,0,0,'',0),(23301,0,'','',10084,'CPU $2 time','system.cpu.util[,iowait]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','Amount of time the CPU has been waiting for I/O to complete.',0,'0',0,0,0,'',0),(23302,0,'','',10084,'CPU $2 time','system.cpu.util[,nice]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','The time the CPU has spent running users\' processes that have been niced.',0,'0',0,0,0,'',0),(23303,0,'','',10084,'CPU $2 time','system.cpu.util[,softirq]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','The amount of time the CPU has been servicing software interrupts.',0,'0',0,0,0,'',0),(23304,0,'','',10084,'CPU $2 time','system.cpu.util[,steal]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','The amount of CPU \'stolen\' from this virtual machine by the hypervisor for other tasks (such as running another virtual machine).',0,'0',0,0,0,'',0),(23305,0,'','',10084,'CPU $2 time','system.cpu.util[,system]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','The time the CPU has spent running the kernel and its processes.',0,'0',0,0,0,'',0),(23306,0,'','',10084,'CPU $2 time','system.cpu.util[,user]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','The time the CPU has spent running users\' processes that are not niced.',0,'0',0,0,0,'',0),(23307,0,'','',10084,'Host name','system.hostname',3600,7,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','System host name.',3,'0',0,0,0,'',0),(23308,0,'','',10084,'Host local time','system.localtime',60,7,365,0,3,'','unixtime',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','',0,'0',0,0,0,'',0),(23309,0,'','',10084,'Free swap space','system.swap.size[,free]',60,7,365,0,3,'','B',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','',0,'0',0,0,0,'',0),(23310,0,'','',10084,'Free swap space in %','system.swap.size[,pfree]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','',0,'0',0,0,0,'',0),(23311,0,'','',10084,'Total swap space','system.swap.size[,total]',3600,7,365,0,3,'','B',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','',0,'0',0,0,0,'',0),(23312,0,'','',10084,'System information','system.uname',3600,7,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','The information as normally returned by \'uname -a\'.',5,'0',0,0,0,'',0),(23313,0,'','',10084,'System uptime','system.uptime',600,7,365,0,3,'','uptime',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','',0,'0',0,0,0,'',0),(23314,0,'','',10084,'Number of logged in users','system.users.num',60,7,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','Number of users who are currently logged in.',0,'0',0,0,0,'',0),(23315,0,'','',10084,'Checksum of $1','vfs.file.cksum[/etc/passwd]',3600,7,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','',0,'0',0,0,0,'',0),(23316,0,'','',10084,'Available memory','vm.memory.size[available]',60,7,365,0,3,'','B',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','Available memory is defined as free+cached+buffers memory.',0,'0',0,0,0,'',0),(23317,0,'','',10084,'Total memory','vm.memory.size[total]',3600,7,365,0,3,'','B',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','',0,'0',0,0,0,'',0),(23327,0,'','',10084,'Host name of zabbix_agentd running','agent.hostname',3600,7,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,1,'','',0,'30',0,0,0,'',0),(23328,5,'','',10084,'Zabbix $4 $2 processes, in %','zabbix[process,vmware collector,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',23976,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23620,5,'','',10084,'Zabbix value cache, % free','zabbix[vcache,buffer,pfree]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',23980,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23625,5,'','',10084,'Zabbix value cache hits','zabbix[vcache,cache,hits]',60,7,365,0,0,'','vps',0,1,'',0,'','','1','',0,'',23981,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23628,5,'','',10084,'Zabbix value cache misses','zabbix[vcache,cache,misses]',60,7,365,0,0,'','vps',0,1,'',0,'','','1','',0,'',23982,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23635,5,'','',10084,'Zabbix vmware cache, % free','zabbix[vmware,buffer,pfree]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',23984,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23662,5,'','',10084,'Zabbix value cache operating mode','zabbix[vcache,cache,mode]',60,7,365,0,3,'','',0,0,'',0,'','','1','',0,'',23983,15,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23850,0,'','',10107,'libvirtd','openstack.serviceexist[libvirtd]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23851,0,'','',10107,'neutron-dhcp-agent','openstack.serviceexist[neutron-dhcp-agent]',60,180,365,1,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23852,0,'','',10107,'neutron-l3-agent','openstack.serviceexist[neutron-l3-agent]',60,180,365,1,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23853,0,'','',10107,'neutron-metadata-agent','openstack.serviceexist[neutron-metadata-agent]',60,180,365,1,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23854,0,'','',10107,'neutron-openvswitch-agent','openstack.serviceexist[neutron-openvswitch-agent]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23855,0,'','',10107,'openstack-ceilometer-compute','openstack.serviceexist[openstack-ceilometer-compute]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23856,0,'','',10107,'openstack-cinder-volume','openstack.serviceexist[openstack-cinder-volume]',60,180,365,1,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23857,0,'','',10107,'openstack-nova-compute','openstack.serviceexist[openstack-nova-compute]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23858,0,'','',10107,'openvswitch','openstack.serviceexist[openvswitch]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23859,0,'','',10108,'httpd','openstack.serviceexist[httpd]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23860,0,'','',10108,'neutron-server','openstack.serviceexist[neutron-server]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23861,0,'','',10108,'openstack-ceilometer-central','openstack.serviceexist[openstack-ceilometer-central]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23862,0,'','',10108,'openstack-ceilometer-collector','openstack.serviceexist[openstack-ceilometer-collector]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23863,0,'','',10108,'openstack-ceilometer-notification','openstack.serviceexist[openstack-ceilometer-notification]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23864,0,'','',10108,'openstack-cinder-api','openstack.serviceexist[openstack-cinder-api]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23865,0,'','',10108,'openstack-cinder-scheduler','openstack.serviceexist[openstack-cinder-scheduler]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23866,0,'','',10108,'openstack-glance-api','openstack.serviceexist[openstack-glance-api]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23867,0,'','',10108,'openstack-glance-registry','openstack.serviceexist[openstack-glance-registry]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23868,0,'','',10108,'openstack-nova-api','openstack.serviceexist[openstack-nova-api]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23869,0,'','',10108,'openstack-nova-cert','openstack.serviceexist[openstack-nova-cert]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23870,0,'','',10108,'openstack-nova-conductor','openstack.serviceexist[openstack-nova-conductor]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23871,0,'','',10108,'openstack-nova-consoleauth','openstack.serviceexist[openstack-nova-consoleauth]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23872,0,'','',10108,'openstack-nova-novncproxy','openstack.serviceexist[openstack-nova-novncproxy]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23873,0,'','',10108,'openstack-nova-scheduler','openstack.serviceexist[openstack-nova-scheduler]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23874,0,'','',10109,'httpd','openstack.serviceexist[httpd]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23875,0,'','',10110,'Openstack service haproxy','openstack.serviceexist[haproxy]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23876,0,'','',10110,'Openstack service keepalived','openstack.serviceexist[keepalived]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23877,0,'','',10111,'neutron-l3-agent','openstack.serviceexist[neutron-l3-agent]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23878,0,'','',10111,'neutron-lbaasv2-agent','openstack.serviceexist[neutron-lbaasv2-agent]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23879,0,'','',10111,'neutron-openvswitch-agent','openstack.serviceexist[neutron-openvswitch-agent]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23880,0,'','',10112,'memcached','openstack.serviceexist[memcached]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23881,0,'','',10113,'mysqld','openstack.serviceexist[mysqldi]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23882,0,'','',10113,'xinetd','openstack.serviceexist[xinetd]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23883,0,'','',10114,'nova-novncproxy','openstack.serviceexist[nova-novncproxy]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23884,0,'','',10115,'ntpd','openstack.serviceexist[ntpd]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23885,0,'','',10116,'rabbitmq-server','openstack.serviceexist[rabbitmq-server]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23886,0,'','',10117,'ceph-pronum','ceph.pnum[ceph]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23887,0,'','',10118,'CEPH_osd_df','ceph.osd_df',60,180,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23888,0,'','',10118,'CEPH_osd_perf','ceph.osd_perf',60,180,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23889,0,'','',10118,'CEPH_osd_pool_stats','ceph.osd_pool_stats',60,180,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23890,0,'','',10118,'CEPH_osd_tree','ceph.osd_tree',60,180,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23891,0,'','',10118,'CEPH_pg_stat','ceph.pg_stat',60,180,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23892,0,'','',10118,'CEPH_status','ceph.status',60,180,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23893,0,'','',10118,'Ceph_warn','ceph.warn',60,180,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23894,0,'','',10120,'MySQL status','mysql.ping',60,7,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,1,'','','',0,0,'','','','',0,0,NULL,'','It requires user parameter mysql.ping, which is defined in userparameter_mysql.conf.\r\n\r\n0 - MySQL server is down\r\n1 - MySQL server is up',0,'30',0,0,0,'',0),(23895,0,'','',10120,'MySQL bytes received per second','mysql.status[Bytes_received]',60,7,365,0,0,'','Bps',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','The number of bytes received from all clients. \r\n\r\nIt requires user parameter mysql.status[*], which is defined in \r\nuserparameter_mysql.conf.',0,'30',0,0,0,'',0),(23896,0,'','',10120,'MySQL bytes sent per second','mysql.status[Bytes_sent]',60,7,365,0,0,'','Bps',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','The number of bytes sent to all clients.\r\n\r\nIt requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30',0,0,0,'',0),(23897,0,'','',10120,'MySQL begin operations per second','mysql.status[Com_begin]',60,7,365,0,0,'','qps',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30',0,0,0,'',0),(23898,0,'','',10120,'MySQL commit operations per second','mysql.status[Com_commit]',60,7,365,0,0,'','qps',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30',0,0,0,'',0),(23899,0,'','',10120,'MySQL delete operations per second','mysql.status[Com_delete]',60,7,365,0,0,'','qps',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30',0,0,0,'',0),(23900,0,'','',10120,'MySQL insert operations per second','mysql.status[Com_insert]',60,7,365,0,0,'','qps',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30',0,0,0,'',0),(23901,0,'','',10120,'MySQL rollback operations per second','mysql.status[Com_rollback]',60,7,365,0,0,'','qps',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30',0,0,0,'',0),(23902,0,'','',10120,'MySQL select operations per second','mysql.status[Com_select]',60,7,365,0,0,'','qps',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30',0,0,0,'',0),(23903,0,'','',10120,'MySQL update operations per second','mysql.status[Com_update]',60,7,365,0,0,'','qps',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30',0,0,0,'',0),(23904,0,'','',10120,'MySQL queries per second','mysql.status[Questions]',60,7,365,0,0,'','qps',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30',0,0,0,'',0),(23905,0,'','',10120,'MySQL slow queries','mysql.status[Slow_queries]',60,7,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30',0,0,0,'',0),(23906,0,'','',10120,'MySQL uptime','mysql.status[Uptime]',60,7,365,0,3,'','uptime',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','It requires user parameter mysql.status[*], which is defined in userparameter_mysql.conf.',0,'30',0,0,0,'',0),(23907,0,'','',10120,'MySQL version','mysql.version',3600,7,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','It requires user parameter mysql.version, which is defined in userparameter_mysql.conf.',0,'30',0,0,0,'',0),(23908,0,'','',10121,'Openstack_service_libvirtd','openstack.serviceexist[libvirtd]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23909,0,'','',10121,'Openstack_service_neutron_l3_agent','openstack.serviceexist[ neutron-l3-agent]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23910,0,'','',10121,'Openstack_service_neutron_metadata_agent','openstack.serviceexist[neutron-metadata-agent]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23911,0,'','',10121,'Openstack_service_neutron_openvswitch_agent','openstack.serviceexist[neutron-openvswitch-agent]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23912,0,'','',10121,'Openstack_service_cinder_volume','openstack.serviceexist[openstack-cinder-volume]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23913,0,'','',10121,'Openstack_service_nova_compute','openstack.serviceexist[openstack-nova-compute]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23914,0,'','',10122,'check cinder process status','check-process-status-openstack[cinder]',120,90,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23915,0,'','',10122,'check neutron process status','check-process-status-openstack[neutron]',120,90,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23916,0,'','',10122,'check nova process status','check-process-status-openstack[nova]',30,90,0,0,4,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23935,3,'','',10123,'SSH service is running','net.tcp.service[ssh]',60,7,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,1,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23936,7,'','',10124,'Agent ping','agent.ping',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,10,'','','',0,0,'','','','',0,0,NULL,'','The agent always returns 1 for this item. It could be used in combination with nodata() for availability check.',0,'30',0,0,0,'',0),(23937,5,'','',10125,'Zabbix $4 $2 processes, in %','zabbix[process,configuration syncer,avg,busy]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23938,5,'','',10125,'Zabbix $4 $2 processes, in %','zabbix[process,data sender,avg,busy]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23939,5,'','',10125,'Zabbix $4 $2 processes, in %','zabbix[process,discoverer,avg,busy]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23940,5,'','',10125,'Zabbix $4 $2 processes, in %','zabbix[process,heartbeat sender,avg,busy]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23941,5,'','',10125,'Zabbix $4 $2 processes, in %','zabbix[process,history syncer,avg,busy]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23942,5,'','',10125,'Zabbix $4 $2 processes, in %','zabbix[process,housekeeper,avg,busy]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23943,5,'','',10125,'Zabbix $4 $2 processes, in %','zabbix[process,http poller,avg,busy]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23944,5,'','',10125,'Zabbix $4 $2 processes, in %','zabbix[process,icmp pinger,avg,busy]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23945,5,'','',10125,'Zabbix $4 $2 processes, in %','zabbix[process,ipmi poller,avg,busy]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23946,5,'','',10125,'Zabbix $4 $2 processes, in %','zabbix[process,java poller,avg,busy]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23947,5,'','',10125,'Zabbix $4 $2 processes, in %','zabbix[process,poller,avg,busy]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23948,5,'','',10125,'Zabbix $4 $2 processes, in %','zabbix[process,self-monitoring,avg,busy]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23949,5,'','',10125,'Zabbix $4 $2 processes, in %','zabbix[process,snmp trapper,avg,busy]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23950,5,'','',10125,'Zabbix $4 $2 processes, in %','zabbix[process,trapper,avg,busy]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23951,5,'','',10125,'Zabbix $4 $2 processes, in %','zabbix[process,unreachable poller,avg,busy]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23952,5,'','',10125,'Zabbix queue over $2','zabbix[queue,10m]',600,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23953,5,'','',10125,'Zabbix queue','zabbix[queue]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23954,5,'','',10125,'Zabbix configuration cache, % free','zabbix[rcache,buffer,pfree]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23955,5,'','',10125,'Zabbix $2 write cache, % free','zabbix[wcache,history,pfree]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23956,5,'','',10125,'Zabbix $2 write cache, % free','zabbix[wcache,text,pfree]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23957,5,'','',10125,'Values processed by Zabbix proxy per second','zabbix[wcache,values]',60,180,365,0,0,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23958,5,'','',10126,'Zabbix $4 $2 processes, in %','zabbix[process,alerter,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23959,5,'','',10126,'Zabbix $4 $2 processes, in %','zabbix[process,configuration syncer,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23960,5,'','',10126,'Zabbix $4 $2 processes, in %','zabbix[process,db watchdog,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23961,5,'','',10126,'Zabbix $4 $2 processes, in %','zabbix[process,discoverer,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23962,5,'','',10126,'Zabbix $4 $2 processes, in %','zabbix[process,escalator,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23963,5,'','',10126,'Zabbix $4 $2 processes, in %','zabbix[process,history syncer,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23964,5,'','',10126,'Zabbix $4 $2 processes, in %','zabbix[process,housekeeper,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23965,5,'','',10126,'Zabbix $4 $2 processes, in %','zabbix[process,http poller,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23966,5,'','',10126,'Zabbix $4 $2 processes, in %','zabbix[process,icmp pinger,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23967,5,'','',10126,'Zabbix $4 $2 processes, in %','zabbix[process,ipmi poller,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23968,5,'','',10126,'Zabbix $4 $2 processes, in %','zabbix[process,java poller,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23969,5,'','',10126,'Zabbix $4 $2 processes, in %','zabbix[process,poller,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23970,5,'','',10126,'Zabbix $4 $2 processes, in %','zabbix[process,proxy poller,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23971,5,'','',10126,'Zabbix $4 $2 processes, in %','zabbix[process,self-monitoring,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23972,5,'','',10126,'Zabbix $4 $2 processes, in %','zabbix[process,snmp trapper,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23973,5,'','',10126,'Zabbix $4 $2 processes, in %','zabbix[process,timer,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23974,5,'','',10126,'Zabbix $4 $2 processes, in %','zabbix[process,trapper,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23975,5,'','',10126,'Zabbix $4 $2 processes, in %','zabbix[process,unreachable poller,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23976,5,'','',10126,'Zabbix $4 $2 processes, in %','zabbix[process,vmware collector,avg,busy]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23977,5,'','',10126,'Zabbix queue over $2','zabbix[queue,10m]',600,7,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23978,5,'','',10126,'Zabbix queue','zabbix[queue]',600,7,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23979,5,'','',10126,'Zabbix configuration cache, % free','zabbix[rcache,buffer,pfree]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23980,5,'','',10126,'Zabbix value cache, % free','zabbix[vcache,buffer,pfree]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23981,5,'','',10126,'Zabbix value cache hits','zabbix[vcache,cache,hits]',60,7,365,0,0,'','vps',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23982,5,'','',10126,'Zabbix value cache misses','zabbix[vcache,cache,misses]',60,7,365,0,0,'','vps',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23983,5,'','',10126,'Zabbix value cache operating mode','zabbix[vcache,cache,mode]',60,7,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,15,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23984,5,'','',10126,'Zabbix vmware cache, % free','zabbix[vmware,buffer,pfree]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23985,5,'','',10126,'Zabbix $2 write cache, % free','zabbix[wcache,history,pfree]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23986,5,'','',10126,'Zabbix history index cache, % free','zabbix[wcache,index,pfree]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23987,5,'','',10126,'Zabbix $2 write cache, % free','zabbix[wcache,trend,pfree]',60,7,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23988,5,'','',10126,'Values processed by Zabbix server per second','zabbix[wcache,values]',60,7,365,0,0,'','',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23989,7,'','',10127,'Agent ping','agent.ping',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,10,'','','',0,0,'','','','',0,0,NULL,'','The agent always returns 1 for this item. It could be used in combination with nodata() for availability check.',0,'30',0,0,0,'',0),(23990,7,'','',10127,'Maximum number of opened files','kernel.maxfiles',3600,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','Maximum number of opened files',0,'30',0,0,0,'',0),(23991,7,'','',10127,'Maximum number of processes','kernel.maxproc',3600,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','Maximum number of processes',0,'30',0,0,0,'',0),(23992,7,'','',10127,'Host boot time','system.boottime',600,180,365,0,3,'','unixtime',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','Host boot time',0,'30',0,0,0,'',0),(23993,7,'','',10127,'Highload CPU index','system.cpu.highload[CpuNumber]',60,180,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','The index of the first CPU reaching 100%',0,'30',0,0,0,'',0),(23994,7,'','',10127,'Total highload CPU number','system.cpu.highload[CpuTotal]',60,180,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(23995,7,'','',10127,'Interrupts per second','system.cpu.intr',60,180,365,0,3,'','ips',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','Interrupts per second',0,'30',0,0,0,'',0),(23996,7,'','',10127,'Processor load (1 min average per core)','system.cpu.load[percpu,avg1]',60,180,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.(1 minute)',0,'30',0,0,0,'',0),(23997,7,'','',10127,'Processor load (5 min average per core)','system.cpu.load[percpu,avg5]',60,180,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.(5 minutes)',0,'30',0,0,0,'',0),(23998,7,'','',10127,'Processor load (15 min average per core)','system.cpu.load[percpu,avg15]',60,180,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','The processor load is calculated as system CPU load divided by number of CPU cores.(15 minutes)',0,'30',0,0,0,'',0),(23999,7,'','',10127,'Context switches per second','system.cpu.switches',600,180,365,0,3,'','sps',0,1,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','Context switches per second on host',0,'30',0,0,0,'',0),(24000,7,'','',10127,'Highload CPU process','system.cpu.top',60,180,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','The first process id whose CPU reaches100%',0,'30',0,0,0,'',0),(24001,7,'','',10127,'CPU $2 time','system.cpu.util[,idle]',120,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','The time the CPU has spent doing nothing.',0,'30',0,0,0,'',0),(24002,7,'','',10127,'CPU $2 time','system.cpu.util[,interrupt]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','Hardware interrupt time.',0,'30',0,0,0,'',0),(24003,7,'','',10127,'CPU $2 time','system.cpu.util[,iowait]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','CPU iowait time',0,'30',0,0,0,'',0),(24004,7,'','',10127,'CPU $2 time','system.cpu.util[,nice]',120,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','CPU nice time',0,'30',0,0,0,'',0),(24005,7,'','',10127,'CPU $2 time','system.cpu.util[,softirq]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','Software interrupt time',0,'30',0,0,0,'',0),(24006,7,'','',10127,'CPU $2 time','system.cpu.util[,steal]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','The amount of CPU \'stolen\' from this virtual machine by the hypervisor for other tasks (such as running another virtual machine).',0,'30',0,0,0,'',0),(24007,7,'','',10127,'CPU $2 time','system.cpu.util[,system]',120,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','CPU system time',0,'30',0,0,0,'',0),(24008,7,'','',10127,'CPU $2 time','system.cpu.util[,user]',120,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','CPU time spent in user space',0,'30',0,0,0,'',0),(24009,7,'','',10127,'Host name','system.hostname',3600,14,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','Host name',3,'30',0,0,0,'',0),(24010,7,'','',10127,'System information','system.uname',3600,180,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','The information as normally returned by \'uname -a\'.',5,'30',0,0,0,'',0),(24011,7,'','',10127,'System uptime','system.uptime',600,180,365,0,3,'','uptime',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','System uptime',0,'30',0,0,0,'',0),(24012,7,'','',10127,'Number of logged in users','system.users.num',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','Number of logged in users',0,'30',0,0,0,'',0),(24013,7,'','',10127,'Checksum of $1','vfs.file.cksum[/etc/passwd]',60,3,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','Check whether the password is changed',0,'30',0,0,0,'',0),(24014,7,'','',10127,'Available memory','vm.memory.size[available]',60,180,365,0,3,'','B',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','Available memory',0,'30',0,0,0,'',0),(24015,7,'','',10127,'Total memory','vm.memory.size[total]',3600,180,365,0,3,'','B',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24016,7,'','',10128,'Agent ping','agent.ping',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,10,'','','',0,0,'','','','',0,0,NULL,'','The agent always returns 1 for this item. It could be used in combination with nodata() for availability check.',0,'30',0,0,0,'',0),(24017,0,'','',10128,'File read bytes per second','perf_counter[\\2\\16]',60,180,365,0,0,'','Bps',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','Full counter name: \\System\\File Read Bytes/sec',0,'30',0,0,0,'',0),(24018,0,'','',10128,'File write bytes per second','perf_counter[\\2\\18]',60,180,365,0,0,'','Bps',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','Full counter name: \\System\\File Write Bytes/sec',0,'30',0,0,0,'',0),(24019,0,'','',10128,'Number of threads','perf_counter[\\2\\250]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','Full counter name: \\System\\Threads',0,'30',0,0,0,'',0),(24020,0,'','',10128,'Average disk read queue length','perf_counter[\\234(_Total)\\1402]',60,180,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','Full counter name: \\PhysicalDisk(_Total)\\Avg. Disk Read Queue Length',0,'30',0,0,0,'',0),(24021,0,'','',10128,'Average disk write queue length','perf_counter[\\234(_Total)\\1404]',60,180,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','Full counter name: \\PhysicalDisk(_Total)\\Avg. Disk Write Queue Length',0,'30',0,0,0,'',0),(24022,0,'','',10128,'Number of processes','proc.num[]',60,180,365,0,3,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24023,0,'','',10128,'Processor load (1 min average)','system.cpu.load[percpu,avg1]',60,180,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24024,0,'','',10128,'Processor load (5 min average)','system.cpu.load[percpu,avg5]',60,180,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24025,0,'','',10128,'Processor load (15 min average)','system.cpu.load[percpu,avg15]',60,180,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24026,0,'','',10128,'Free swap space','system.swap.size[,free]',60,180,365,0,3,'','B',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24027,0,'','',10128,'Total swap space','system.swap.size[,total]',3600,180,365,0,3,'','B',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24028,0,'','',10128,'System information','system.uname',3600,180,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',5,'30',0,0,0,'',0),(24029,0,'','',10128,'System uptime','system.uptime',60,180,365,0,3,'','uptime',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24030,0,'','',10128,'Free memory','vm.memory.size[free]',60,180,365,0,3,'','B',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24031,0,'','',10128,'Total memory','vm.memory.size[total]',3600,180,365,0,3,'','B',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24677,0,'','',10119,'IO_discover','io.scandisk',60,90,0,0,4,'','',0,0,'',0,'','','','',0,'',NULL,NULL,'','','',0,0,'','','','',0,1,NULL,'','',0,'30',0,0,0,'',0),(24678,0,'','',10127,'Network interface discovery','net.if.discovery',60,90,0,0,4,'','',0,0,'',0,'','','','',0,'',NULL,NULL,'','','',0,0,'','','','',0,1,NULL,'','Discovery of network interfaces as defined in global regular expression \"Network interfaces for discovery\".',0,'30',0,0,0,'',1),(24679,0,'','',10127,'Mounted filesystem discovery','vfs.fs.discovery',3600,90,0,0,4,'','',0,0,'',0,'','','','',0,'',NULL,NULL,'','','',0,0,'','','','',0,1,NULL,'','Discovery of file systems of different types as defined in global regular expression \"File systems for discovery\".',0,'30',0,0,0,'',0),(24680,0,'','',10128,'Network interface discovery','net.if.discovery',3600,90,0,0,4,'','',0,0,'',0,'','','','',0,'',NULL,NULL,'','','',0,0,'','','','',0,1,NULL,'','Discovery of network interfaces as defined in global regular expression \"Network interfaces for discovery\".',0,'30',0,0,0,'',0),(24681,0,'','',10128,'Mounted filesystem discovery','vfs.fs.discovery',3600,90,0,0,4,'','',0,0,'',0,'','','','',0,'',NULL,NULL,'','','',0,0,'','','','',0,1,NULL,'','Discovery of file systems of different types as defined in global regular expression \"File systems for discovery\".',0,'30',0,0,0,'',0),(24682,0,'','',10119,'IO_avgqu-sz on $1','io.avgqu-sz[{#DISK_NAME}]',10,180,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24683,0,'','',10119,'IO_avgrq-sz on $1','io.avgrq-sz[{#DISK_NAME}]',10,180,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24684,0,'','',10119,'IO_await on $1','io.await[{#DISK_NAME}]',10,180,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24685,0,'','',10119,'IO_rMBps on $1','io.rMBps[{#DISK_NAME}]',10,180,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24686,0,'','',10119,'IO_rps on $1','io.rps[{#DISK_NAME}]',10,180,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24687,0,'','',10119,'IO_svctm on $1','io.svctm[{#DISK_NAME}]',10,180,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24688,0,'','',10119,'IO_util on $1','io.util[{#DISK_NAME}]',10,180,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24689,0,'','',10119,'IO_wMBps on $1','io.wMBps[{#DISK_NAME}]',10,180,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24690,0,'','',10119,'IO_wps on $1','io.wps[{#DISK_NAME}]',10,180,365,0,0,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24691,0,'','',10127,'Incoming network traffic on $1','net.if.in[{#IFNAME}]',40,180,365,0,3,'','bps',1,1,'',0,'','','8','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24692,0,'','',10127,'Outgoing network traffic on $1','net.if.out[{#IFNAME}]',50,180,365,0,3,'','bps',1,1,'',0,'','','8','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24693,0,'','',10127,'Free inodes on $1 (percentage)','vfs.fs.inode[{#FSNAME},pfree]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24694,0,'','',10127,'Free disk space on $1','vfs.fs.size[{#FSNAME},free]',60,180,365,0,3,'','B',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24695,0,'','',10127,'Free disk space on $1 (percentage)','vfs.fs.size[{#FSNAME},pfree]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24696,0,'','',10127,'Total disk space on $1','vfs.fs.size[{#FSNAME},total]',3600,180,365,0,3,'','B',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24697,0,'','',10127,'Used disk space on $1','vfs.fs.size[{#FSNAME},used]',60,180,365,0,3,'','B',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24698,0,'','',10128,'Incoming network traffic on $1','net.if.in[{#IFNAME}]',60,180,365,0,3,'','bps',1,1,'',0,'','','8','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24699,0,'','',10128,'Outgoing network traffic on $1','net.if.out[{#IFNAME}]',60,180,365,0,3,'','bps',1,1,'',0,'','','8','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24700,0,'','',10128,'Free disk space on $1','vfs.fs.size[{#FSNAME},free]',60,180,365,0,3,'','B',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24701,0,'','',10128,'Free disk space on $1 (percentage)','vfs.fs.size[{#FSNAME},pfree]',60,180,365,0,0,'','%',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24702,0,'','',10128,'Total disk space on $1','vfs.fs.size[{#FSNAME},total]',3600,180,365,0,3,'','B',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24703,0,'','',10128,'Used disk space on $1','vfs.fs.size[{#FSNAME},used]',60,180,365,0,3,'','B',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,2,NULL,'','',0,'30',0,0,0,'',0),(24704,0,'','',10126,'Get  zabbix database size','get-zabbix-database-size',86400,180,0,0,1,'','',0,0,'',0,'','','1','',0,'',NULL,NULL,'','','',0,0,'','','','',0,0,NULL,'','',0,'30',0,0,0,'',0),(24705,0,'','',10084,'Get  zabbix database size','get-zabbix-database-size',86400,180,0,0,1,'','',0,0,'',0,'','','1','',0,'',24704,NULL,'','','',0,0,'','','','',0,0,1,'','',0,'30',0,0,0,'',0);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items_applications`
--

DROP TABLE IF EXISTS `items_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items_applications` (
  `itemappid` bigint(20) unsigned NOT NULL,
  `applicationid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`itemappid`),
  UNIQUE KEY `items_applications_1` (`applicationid`,`itemid`),
  KEY `items_applications_2` (`itemid`),
  CONSTRAINT `c_items_applications_2` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_items_applications_1` FOREIGN KEY (`applicationid`) REFERENCES `applications` (`applicationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items_applications`
--

LOCK TABLES `items_applications` WRITE;
/*!40000 ALTER TABLE `items_applications` DISABLE KEYS */;
INSERT INTO `items_applications` VALUES (7004,345,23252),(7005,345,23253),(7006,345,23254),(7007,345,23255),(7008,345,23256),(7009,345,23257),(7010,345,23258),(7011,345,23259),(7012,345,23260),(7013,345,23261),(7014,345,23262),(7015,345,23264),(7016,345,23265),(7017,345,23266),(7018,345,23267),(7019,345,23268),(7020,345,23269),(7021,345,23270),(7023,345,23271),(7024,345,23272),(7025,345,23273),(7031,345,23274),(7032,345,23275),(7033,345,23276),(7034,345,23277),(7022,345,23328),(7026,345,23620),(7027,345,23625),(7028,345,23628),(7030,345,23635),(7029,345,23662),(7003,345,24705),(5468,346,23294),(5470,346,23295),(5472,346,23296),(5474,346,23297),(5476,346,23298),(5478,346,23299),(5480,346,23300),(5482,346,23301),(5484,346,23302),(5486,346,23303),(5488,346,23304),(5490,346,23305),(5492,346,23306),(5455,347,23282),(5456,347,23283),(5457,347,23284),(5458,347,23285),(5459,347,23286),(5467,348,23293),(5495,348,23307),(5497,348,23308),(5502,348,23312),(5504,348,23313),(5498,349,23309),(5499,349,23310),(5500,349,23311),(5508,349,23316),(5509,349,23317),(5453,350,23280),(5454,350,23281),(5462,351,23289),(5463,351,23290),(5466,351,23293),(5494,351,23307),(5496,351,23308),(5501,351,23312),(5503,351,23313),(5505,351,23314),(5469,352,23294),(5471,352,23295),(5473,352,23296),(5475,352,23297),(5477,352,23298),(5479,352,23299),(5481,352,23300),(5483,352,23301),(5485,352,23302),(5487,352,23303),(5489,352,23304),(5491,352,23305),(5493,352,23306),(5464,353,23291),(5465,353,23292),(5506,354,23314),(5507,354,23315),(5460,355,23287),(5461,355,23288),(5523,355,23327),(6054,387,23850),(6055,387,23851),(6056,387,23852),(6057,387,23853),(6058,387,23854),(6059,387,23855),(6060,387,23856),(6061,387,23857),(6062,387,23858),(6063,388,23859),(6064,388,23860),(6065,388,23861),(6066,388,23862),(6067,388,23863),(6068,388,23864),(6069,388,23865),(6070,388,23866),(6071,388,23867),(6072,388,23868),(6073,388,23869),(6074,388,23870),(6075,388,23871),(6076,388,23872),(6077,388,23873),(6078,389,23874),(6079,390,23875),(6080,390,23876),(6081,391,23877),(6082,391,23878),(6083,391,23879),(6084,392,23880),(6085,393,23881),(6086,393,23882),(6087,394,23883),(6088,395,23884),(6089,396,23885),(6090,397,23886),(6091,398,23887),(6092,398,23888),(6093,398,23889),(6094,398,23890),(6095,398,23891),(6096,398,23892),(6097,398,23893),(6980,399,24682),(6981,399,24683),(6982,399,24684),(6983,399,24685),(6984,399,24686),(6985,399,24687),(6986,399,24688),(6987,399,24689),(6988,399,24690),(6098,400,23894),(6099,400,23895),(6100,400,23896),(6101,400,23897),(6102,400,23898),(6103,400,23899),(6104,400,23900),(6105,400,23901),(6106,400,23902),(6107,400,23903),(6108,400,23904),(6109,400,23905),(6110,400,23906),(6111,400,23907),(6112,401,23908),(6113,401,23909),(6114,401,23910),(6115,401,23911),(6116,401,23912),(6117,401,23913),(6118,402,23914),(6119,402,23915),(6120,402,23916),(6139,403,23935),(6140,404,23936),(6141,405,23937),(6142,405,23938),(6143,405,23939),(6144,405,23940),(6145,405,23941),(6146,405,23942),(6147,405,23943),(6148,405,23944),(6149,405,23945),(6150,405,23946),(6151,405,23947),(6152,405,23948),(6153,405,23949),(6154,405,23950),(6155,405,23951),(6156,405,23952),(6157,405,23953),(6158,405,23954),(6159,405,23955),(6160,405,23956),(6161,405,23957),(6162,406,23958),(6163,406,23959),(6164,406,23960),(6165,406,23961),(6166,406,23962),(6167,406,23963),(6168,406,23964),(6169,406,23965),(6170,406,23966),(6171,406,23967),(6172,406,23968),(6173,406,23969),(6174,406,23970),(6175,406,23971),(6176,406,23972),(6177,406,23973),(6178,406,23974),(6179,406,23975),(6180,406,23976),(6181,406,23977),(6182,406,23978),(6183,406,23979),(6184,406,23980),(6185,406,23981),(6186,406,23982),(6187,406,23983),(6188,406,23984),(6189,406,23985),(6190,406,23986),(6191,406,23987),(6192,406,23988),(7002,406,24704),(6200,407,23995),(6202,407,23996),(6204,407,23997),(6206,407,23998),(6208,407,23999),(6211,407,24001),(6213,407,24002),(6215,407,24003),(6217,407,24004),(6219,407,24005),(6221,407,24006),(6223,407,24007),(6225,407,24008),(6991,408,24693),(6992,408,24694),(6993,408,24695),(6994,408,24696),(6995,408,24697),(6196,409,23992),(6227,409,24009),(6229,409,24010),(6231,409,24011),(6236,410,24014),(6237,410,24015),(6989,411,24691),(6990,411,24692),(6194,412,23990),(6195,412,23991),(6197,412,23992),(6228,412,24009),(6230,412,24010),(6232,412,24011),(6233,412,24012),(6201,413,23995),(6203,413,23996),(6205,413,23997),(6207,413,23998),(6209,413,23999),(6212,413,24001),(6214,413,24002),(6216,413,24003),(6218,413,24004),(6220,413,24005),(6222,413,24006),(6224,413,24007),(6226,413,24008),(6198,415,23993),(6199,415,23994),(6210,415,24000),(6234,416,24012),(6235,416,24013),(6193,417,23989),(6249,418,24023),(6251,418,24024),(6253,418,24025),(6239,419,24017),(6241,419,24018),(6244,419,24020),(6246,419,24021),(6998,419,24700),(6999,419,24701),(7000,419,24702),(7001,419,24703),(6257,420,24028),(6259,420,24029),(6255,421,24026),(6256,421,24027),(6260,421,24030),(6261,421,24031),(6996,422,24698),(6997,422,24699),(6243,423,24019),(6258,423,24028),(6240,424,24017),(6242,424,24018),(6245,424,24020),(6247,424,24021),(6250,424,24023),(6252,424,24024),(6254,424,24025),(6248,425,24022),(6238,426,24016);
/*!40000 ALTER TABLE `items_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenances`
--

DROP TABLE IF EXISTS `maintenances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenances` (
  `maintenanceid` bigint(20) unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `maintenance_type` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `active_since` int(11) NOT NULL DEFAULT '0',
  `active_till` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`maintenanceid`),
  UNIQUE KEY `maintenances_2` (`name`),
  KEY `maintenances_1` (`active_since`,`active_till`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenances`
--

LOCK TABLES `maintenances` WRITE;
/*!40000 ALTER TABLE `maintenances` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenances_groups`
--

DROP TABLE IF EXISTS `maintenances_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenances_groups` (
  `maintenance_groupid` bigint(20) unsigned NOT NULL,
  `maintenanceid` bigint(20) unsigned NOT NULL,
  `groupid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`maintenance_groupid`),
  UNIQUE KEY `maintenances_groups_1` (`maintenanceid`,`groupid`),
  KEY `maintenances_groups_2` (`groupid`),
  CONSTRAINT `c_maintenances_groups_2` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`) ON DELETE CASCADE,
  CONSTRAINT `c_maintenances_groups_1` FOREIGN KEY (`maintenanceid`) REFERENCES `maintenances` (`maintenanceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenances_groups`
--

LOCK TABLES `maintenances_groups` WRITE;
/*!40000 ALTER TABLE `maintenances_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenances_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenances_hosts`
--

DROP TABLE IF EXISTS `maintenances_hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenances_hosts` (
  `maintenance_hostid` bigint(20) unsigned NOT NULL,
  `maintenanceid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`maintenance_hostid`),
  UNIQUE KEY `maintenances_hosts_1` (`maintenanceid`,`hostid`),
  KEY `maintenances_hosts_2` (`hostid`),
  CONSTRAINT `c_maintenances_hosts_2` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_maintenances_hosts_1` FOREIGN KEY (`maintenanceid`) REFERENCES `maintenances` (`maintenanceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenances_hosts`
--

LOCK TABLES `maintenances_hosts` WRITE;
/*!40000 ALTER TABLE `maintenances_hosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenances_hosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenances_windows`
--

DROP TABLE IF EXISTS `maintenances_windows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenances_windows` (
  `maintenance_timeperiodid` bigint(20) unsigned NOT NULL,
  `maintenanceid` bigint(20) unsigned NOT NULL,
  `timeperiodid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`maintenance_timeperiodid`),
  UNIQUE KEY `maintenances_windows_1` (`maintenanceid`,`timeperiodid`),
  KEY `maintenances_windows_2` (`timeperiodid`),
  CONSTRAINT `c_maintenances_windows_2` FOREIGN KEY (`timeperiodid`) REFERENCES `timeperiods` (`timeperiodid`) ON DELETE CASCADE,
  CONSTRAINT `c_maintenances_windows_1` FOREIGN KEY (`maintenanceid`) REFERENCES `maintenances` (`maintenanceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenances_windows`
--

LOCK TABLES `maintenances_windows` WRITE;
/*!40000 ALTER TABLE `maintenances_windows` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenances_windows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mappings`
--

DROP TABLE IF EXISTS `mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mappings` (
  `mappingid` bigint(20) unsigned NOT NULL,
  `valuemapid` bigint(20) unsigned NOT NULL,
  `value` varchar(64) NOT NULL DEFAULT '',
  `newvalue` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`mappingid`),
  KEY `mappings_1` (`valuemapid`),
  CONSTRAINT `c_mappings_1` FOREIGN KEY (`valuemapid`) REFERENCES `valuemaps` (`valuemapid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mappings`
--

LOCK TABLES `mappings` WRITE;
/*!40000 ALTER TABLE `mappings` DISABLE KEYS */;
INSERT INTO `mappings` VALUES (1,1,'0','Down'),(2,1,'1','Up'),(3,2,'0','not available'),(4,2,'1','available'),(5,2,'2','unknown'),(13,6,'1','Other'),(14,6,'2','OK'),(15,6,'3','Degraded'),(17,7,'1','Other'),(18,7,'2','Unknown'),(19,7,'3','OK'),(20,7,'4','NonCritical'),(21,7,'5','Critical'),(22,7,'6','NonRecoverable'),(23,5,'1','unknown'),(24,5,'2','batteryNormal'),(25,5,'3','batteryLow'),(26,4,'1','unknown'),(27,4,'2','notInstalled'),(28,4,'3','ok'),(29,4,'4','failed'),(30,4,'5','highTemperature'),(31,4,'6','replaceImmediately'),(32,4,'7','lowCapacity'),(33,3,'0','Running'),(34,3,'1','Paused'),(35,3,'3','Pause pending'),(36,3,'4','Continue pending'),(37,3,'5','Stop pending'),(38,3,'6','Stopped'),(39,3,'7','Unknown'),(40,3,'255','No such service'),(41,3,'2','Start pending'),(49,9,'1','unknown'),(50,9,'2','running'),(51,9,'3','warning'),(52,9,'4','testing'),(53,9,'5','down'),(61,8,'1','up'),(62,8,'2','down'),(63,8,'3','testing'),(64,8,'4','unknown'),(65,8,'5','dormant'),(66,8,'6','notPresent'),(67,8,'7','lowerLayerDown'),(68,10,'1','Up'),(69,11,'1','up'),(70,11,'2','down'),(71,11,'3','testing'),(72,12,'0','poweredOff'),(73,12,'1','poweredOn'),(74,12,'2','suspended'),(75,13,'0','gray'),(76,13,'1','green'),(77,13,'2','yellow'),(78,13,'3','red'),(79,14,'0','normal'),(80,14,'1','in maintenance'),(81,14,'2','no data collection'),(82,15,'0','Normal'),(83,15,'1','Low memory'),(84,16,'0','Automatic'),(85,16,'1','Automatic delayed'),(86,16,'2','Manual'),(87,16,'3','Disabled'),(88,16,'4','Unknown'),(89,17,'100','Continue'),(90,17,'101','Switching Protocols'),(91,17,'102','Processing'),(92,17,'200','OK'),(93,17,'201','Created'),(94,17,'202','Accepted'),(95,17,'203','Non-Authoritative Information'),(96,17,'204','No Content'),(97,17,'205','Reset Content'),(98,17,'206','Partial Content'),(99,17,'207','Multi-Status'),(100,17,'208','Already Reported'),(101,17,'226','IM Used'),(102,17,'300','Multiple Choices'),(103,17,'301','Moved Permanently'),(104,17,'302','Found'),(105,17,'303','See Other'),(106,17,'304','Not Modified'),(107,17,'305','Use Proxy'),(108,17,'306','Switch Proxy'),(109,17,'307','Temporary Redirect'),(110,17,'308','Permanent Redirect/Resume Incomplete'),(111,17,'400','Bad Request'),(112,17,'401','Unauthorized'),(113,17,'402','Payment Required'),(114,17,'403','Forbidden'),(115,17,'404','Not Found'),(116,17,'405','Method Not Allowed'),(117,17,'406','Not Acceptable'),(118,17,'407','Proxy Authentication Required'),(119,17,'408','Request Timeout'),(120,17,'409','Conflict'),(121,17,'410','Gone'),(122,17,'411','Length Required'),(123,17,'412','Precondition Failed'),(124,17,'413','Payload Too Large'),(125,17,'414','Request-URI Too Long'),(126,17,'415','Unsupported Media Type'),(127,17,'416','Requested Range Not Satisfiable'),(128,17,'417','Expectation Failed'),(129,17,'418','I\'m a Teapot'),(130,17,'419','Authentication Timeout'),(131,17,'420','Method Failure/Enhance Your Calm'),(132,17,'421','Misdirected Request'),(133,17,'422','Unprocessable Entity'),(134,17,'423','Locked'),(135,17,'424','Failed Dependency'),(136,17,'426','Upgrade Required'),(137,17,'428','Precondition Required'),(138,17,'429','Too Many Requests'),(139,17,'431','Request Header Fields Too Large'),(140,17,'440','Login Timeout'),(141,17,'444','No Response'),(142,17,'449','Retry With'),(143,17,'450','Blocked by Windows Parental Controls'),(144,17,'451','Unavailable for Legal Reasons/Redirect'),(145,17,'494','Request Header Too Large'),(146,17,'495','Cert Error'),(147,17,'496','No Cert'),(148,17,'497','HTTP to HTTPS'),(149,17,'498','Token Expired/Invalid'),(150,17,'499','Client Closed Request/Token Required'),(151,17,'500','Internal Server Error'),(152,17,'501','Not Implemented'),(153,17,'502','Bad Gateway'),(154,17,'503','Service Unavailable'),(155,17,'504','Gateway Timeout'),(156,17,'505','HTTP Version Not Supported'),(157,17,'506','Variant Also Negotiates'),(158,17,'507','Insufficient Storage'),(159,17,'508','Loop Detected'),(160,17,'509','Bandwidth Limit Exceeded'),(161,17,'510','Not Extended'),(162,17,'511','Network Authentication Required'),(163,17,'520','Unknown Error'),(164,17,'598','Network Read Timeout Error'),(165,17,'599','Network Connect Timeout Error');
/*!40000 ALTER TABLE `mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `mediaid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `mediatypeid` bigint(20) unsigned NOT NULL,
  `sendto` varchar(100) NOT NULL DEFAULT '',
  `active` int(11) NOT NULL DEFAULT '0',
  `severity` int(11) NOT NULL DEFAULT '63',
  `period` varchar(100) NOT NULL DEFAULT '1-7,00:00-24:00',
  PRIMARY KEY (`mediaid`),
  KEY `media_1` (`userid`),
  KEY `media_2` (`mediatypeid`),
  CONSTRAINT `c_media_2` FOREIGN KEY (`mediatypeid`) REFERENCES `media_type` (`mediatypeid`) ON DELETE CASCADE,
  CONSTRAINT `c_media_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (10,1,5,'lihao21@lenovo.com',0,63,'1-7,00:00-24:00'),(11,1,4,'lihao',0,63,'1-7,00:00-24:00');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_type`
--

DROP TABLE IF EXISTS `media_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_type` (
  `mediatypeid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `description` varchar(100) NOT NULL DEFAULT '',
  `smtp_server` varchar(255) NOT NULL DEFAULT '',
  `smtp_helo` varchar(255) NOT NULL DEFAULT '',
  `smtp_email` varchar(255) NOT NULL DEFAULT '',
  `exec_path` varchar(255) NOT NULL DEFAULT '',
  `gsm_modem` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(255) NOT NULL DEFAULT '',
  `passwd` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `smtp_port` int(11) NOT NULL DEFAULT '25',
  `smtp_security` int(11) NOT NULL DEFAULT '0',
  `smtp_verify_peer` int(11) NOT NULL DEFAULT '0',
  `smtp_verify_host` int(11) NOT NULL DEFAULT '0',
  `smtp_authentication` int(11) NOT NULL DEFAULT '0',
  `exec_params` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`mediatypeid`),
  UNIQUE KEY `media_type_1` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_type`
--

LOCK TABLES `media_type` WRITE;
/*!40000 ALTER TABLE `media_type` DISABLE KEYS */;
INSERT INTO `media_type` VALUES (1,1,'Email','mail.company.com','company.com','zabbix@company.com','Email.py','','','',1,25,0,0,0,0,'{ALERT.SENDTO}\n{ALERT.SUBJECT}\n{ALERT.MESSAGE}\n'),(2,3,'Jabber','','','','','','jabber@company.com','zabbix',0,25,0,0,0,0,''),(3,2,'SMS','','','','','/dev/ttyS0','','',0,25,0,0,0,0,''),(4,1,'Wechat','','','','Wechat.py','','','',0,25,0,0,0,0,'{ALERT.SENDTO}\n{ALERT.SUBJECT}\n{ALERT.MESSAGE}\n'),(5,0,'Email-163','smtp.163.com','163','telecomopenstack@163.com','','','telecomopenstack','Openstack2016',0,25,0,0,0,1,'');
/*!40000 ALTER TABLE `media_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcommand`
--

DROP TABLE IF EXISTS `opcommand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opcommand` (
  `operationid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `scriptid` bigint(20) unsigned DEFAULT NULL,
  `execute_on` int(11) NOT NULL DEFAULT '0',
  `port` varchar(64) NOT NULL DEFAULT '',
  `authtype` int(11) NOT NULL DEFAULT '0',
  `username` varchar(64) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL DEFAULT '',
  `publickey` varchar(64) NOT NULL DEFAULT '',
  `privatekey` varchar(64) NOT NULL DEFAULT '',
  `command` text NOT NULL,
  PRIMARY KEY (`operationid`),
  KEY `opcommand_1` (`scriptid`),
  CONSTRAINT `c_opcommand_2` FOREIGN KEY (`scriptid`) REFERENCES `scripts` (`scriptid`),
  CONSTRAINT `c_opcommand_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcommand`
--

LOCK TABLES `opcommand` WRITE;
/*!40000 ALTER TABLE `opcommand` DISABLE KEYS */;
/*!40000 ALTER TABLE `opcommand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcommand_grp`
--

DROP TABLE IF EXISTS `opcommand_grp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opcommand_grp` (
  `opcommand_grpid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `groupid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`opcommand_grpid`),
  KEY `opcommand_grp_1` (`operationid`),
  KEY `opcommand_grp_2` (`groupid`),
  CONSTRAINT `c_opcommand_grp_2` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`),
  CONSTRAINT `c_opcommand_grp_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcommand_grp`
--

LOCK TABLES `opcommand_grp` WRITE;
/*!40000 ALTER TABLE `opcommand_grp` DISABLE KEYS */;
/*!40000 ALTER TABLE `opcommand_grp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcommand_hst`
--

DROP TABLE IF EXISTS `opcommand_hst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opcommand_hst` (
  `opcommand_hstid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`opcommand_hstid`),
  KEY `opcommand_hst_1` (`operationid`),
  KEY `opcommand_hst_2` (`hostid`),
  CONSTRAINT `c_opcommand_hst_2` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`),
  CONSTRAINT `c_opcommand_hst_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcommand_hst`
--

LOCK TABLES `opcommand_hst` WRITE;
/*!40000 ALTER TABLE `opcommand_hst` DISABLE KEYS */;
/*!40000 ALTER TABLE `opcommand_hst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opconditions`
--

DROP TABLE IF EXISTS `opconditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opconditions` (
  `opconditionid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `conditiontype` int(11) NOT NULL DEFAULT '0',
  `operator` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`opconditionid`),
  KEY `opconditions_1` (`operationid`),
  CONSTRAINT `c_opconditions_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opconditions`
--

LOCK TABLES `opconditions` WRITE;
/*!40000 ALTER TABLE `opconditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `opconditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operations`
--

DROP TABLE IF EXISTS `operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operations` (
  `operationid` bigint(20) unsigned NOT NULL,
  `actionid` bigint(20) unsigned NOT NULL,
  `operationtype` int(11) NOT NULL DEFAULT '0',
  `esc_period` int(11) NOT NULL DEFAULT '0',
  `esc_step_from` int(11) NOT NULL DEFAULT '1',
  `esc_step_to` int(11) NOT NULL DEFAULT '1',
  `evaltype` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`operationid`),
  KEY `operations_1` (`actionid`),
  CONSTRAINT `c_operations_1` FOREIGN KEY (`actionid`) REFERENCES `actions` (`actionid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operations`
--

LOCK TABLES `operations` WRITE;
/*!40000 ALTER TABLE `operations` DISABLE KEYS */;
INSERT INTO `operations` VALUES (2,2,4,0,1,1,0),(3,3,0,0,1,1,0),(4,4,0,0,1,1,0),(5,5,0,0,1,1,0),(6,6,0,0,1,1,0),(9,7,0,0,1,1,0),(10,8,2,0,1,1,0),(11,8,4,0,1,1,0),(14,9,2,0,1,1,0),(15,9,4,0,1,1,0),(17,10,2,0,1,1,0),(21,11,0,0,1,1,0),(22,9,6,0,1,1,0),(23,8,6,0,1,1,0),(24,10,6,0,1,1,0),(26,12,0,0,1,1,0),(27,9,6,0,1,1,0),(28,8,6,0,1,1,0);
/*!40000 ALTER TABLE `operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opgroup`
--

DROP TABLE IF EXISTS `opgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opgroup` (
  `opgroupid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `groupid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`opgroupid`),
  UNIQUE KEY `opgroup_1` (`operationid`,`groupid`),
  KEY `opgroup_2` (`groupid`),
  CONSTRAINT `c_opgroup_2` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`),
  CONSTRAINT `c_opgroup_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opgroup`
--

LOCK TABLES `opgroup` WRITE;
/*!40000 ALTER TABLE `opgroup` DISABLE KEYS */;
INSERT INTO `opgroup` VALUES (1,2,2),(2,11,9),(3,15,9);
/*!40000 ALTER TABLE `opgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opinventory`
--

DROP TABLE IF EXISTS `opinventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opinventory` (
  `operationid` bigint(20) unsigned NOT NULL,
  `inventory_mode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`operationid`),
  CONSTRAINT `c_opinventory_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opinventory`
--

LOCK TABLES `opinventory` WRITE;
/*!40000 ALTER TABLE `opinventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `opinventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opmessage`
--

DROP TABLE IF EXISTS `opmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opmessage` (
  `operationid` bigint(20) unsigned NOT NULL,
  `default_msg` int(11) NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `mediatypeid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`operationid`),
  KEY `opmessage_1` (`mediatypeid`),
  CONSTRAINT `c_opmessage_2` FOREIGN KEY (`mediatypeid`) REFERENCES `media_type` (`mediatypeid`),
  CONSTRAINT `c_opmessage_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opmessage`
--

LOCK TABLES `opmessage` WRITE;
/*!40000 ALTER TABLE `opmessage` DISABLE KEYS */;
INSERT INTO `opmessage` VALUES (3,1,'{TRIGGER.STATUS}: {TRIGGER.NAME}','Trigger: {TRIGGER.NAME}\r\nTrigger status: {TRIGGER.STATUS}\r\nTrigger severity: {TRIGGER.SEVERITY}\r\nTrigger URL: {TRIGGER.URL}\r\n\r\nItem values:\r\n\r\n1. {ITEM.NAME1} ({HOST.NAME1}:{ITEM.KEY1}): {ITEM.VALUE1}\r\n2. {ITEM.NAME2} ({HOST.NAME2}:{ITEM.KEY2}): {ITEM.VALUE2}\r\n3. {ITEM.NAME3} ({HOST.NAME3}:{ITEM.KEY3}): {ITEM.VALUE3}',NULL),(4,1,'','',NULL),(5,1,'','',NULL),(6,1,'','',NULL),(9,1,'{TRIGGER.STATUS}: {TRIGGER.NAME}','Trigger: {TRIGGER.NAME}\r\nTrigger status: {TRIGGER.STATUS}\r\nTrigger severity: {TRIGGER.SEVERITY}\r\nTrigger URL: {TRIGGER.URL}\r\n\r\nItem values:\r\n\r\n1. {ITEM.NAME1} ({HOST.NAME1}:{ITEM.KEY1}): {ITEM.VALUE1}\r\n2. {ITEM.NAME2} ({HOST.NAME2}:{ITEM.KEY2}): {ITEM.VALUE2}\r\n3. {ITEM.NAME3} ({HOST.NAME3}:{ITEM.KEY3}): {ITEM.VALUE3}\r\n\r\nOriginal event ID: {EVENT.ID}',1),(21,1,'{TRIGGER.STATUS}: {TRIGGER.NAME}','Trigger: {TRIGGER.NAME}\r\nTrigger status: {TRIGGER.STATUS}\r\nTrigger severity: {TRIGGER.SEVERITY}\r\nTrigger URL: {TRIGGER.URL}\r\n\r\nItem values:\r\n\r\n1. {ITEM.NAME1} ({HOST.NAME1}:{ITEM.KEY1}): {ITEM.VALUE1}\r\n2. {ITEM.NAME2} ({HOST.NAME2}:{ITEM.KEY2}): {ITEM.VALUE2}\r\n3. {ITEM.NAME3} ({HOST.NAME3}:{ITEM.KEY3}): {ITEM.VALUE3}\r\n\r\nOriginal event ID: {EVENT.ID}',4),(26,1,'{TRIGGER.STATUS}: {TRIGGER.NAME}','Trigger: {TRIGGER.NAME}\r\nTrigger status: {TRIGGER.STATUS}\r\nTrigger severity: {TRIGGER.SEVERITY}\r\nTrigger URL: {TRIGGER.URL}\r\n\r\nItem values:\r\n\r\n1. {ITEM.NAME1} ({HOST.NAME1}:{ITEM.KEY1}): {ITEM.VALUE1}\r\n2. {ITEM.NAME2} ({HOST.NAME2}:{ITEM.KEY2}): {ITEM.VALUE2}\r\n3. {ITEM.NAME3} ({HOST.NAME3}:{ITEM.KEY3}): {ITEM.VALUE3}\r\n\r\nOriginal event ID: {EVENT.ID}',5);
/*!40000 ALTER TABLE `opmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opmessage_grp`
--

DROP TABLE IF EXISTS `opmessage_grp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opmessage_grp` (
  `opmessage_grpid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`opmessage_grpid`),
  UNIQUE KEY `opmessage_grp_1` (`operationid`,`usrgrpid`),
  KEY `opmessage_grp_2` (`usrgrpid`),
  CONSTRAINT `c_opmessage_grp_2` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`),
  CONSTRAINT `c_opmessage_grp_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opmessage_grp`
--

LOCK TABLES `opmessage_grp` WRITE;
/*!40000 ALTER TABLE `opmessage_grp` DISABLE KEYS */;
INSERT INTO `opmessage_grp` VALUES (1,3,7),(2,4,7),(3,5,7),(4,6,7),(6,9,7),(7,21,7),(8,26,7);
/*!40000 ALTER TABLE `opmessage_grp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opmessage_usr`
--

DROP TABLE IF EXISTS `opmessage_usr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opmessage_usr` (
  `opmessage_usrid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`opmessage_usrid`),
  UNIQUE KEY `opmessage_usr_1` (`operationid`,`userid`),
  KEY `opmessage_usr_2` (`userid`),
  CONSTRAINT `c_opmessage_usr_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `c_opmessage_usr_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opmessage_usr`
--

LOCK TABLES `opmessage_usr` WRITE;
/*!40000 ALTER TABLE `opmessage_usr` DISABLE KEYS */;
INSERT INTO `opmessage_usr` VALUES (1,9,1),(2,21,1),(3,26,1);
/*!40000 ALTER TABLE `opmessage_usr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `optemplate`
--

DROP TABLE IF EXISTS `optemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `optemplate` (
  `optemplateid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `templateid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`optemplateid`),
  UNIQUE KEY `optemplate_1` (`operationid`,`templateid`),
  KEY `optemplate_2` (`templateid`),
  CONSTRAINT `c_optemplate_2` FOREIGN KEY (`templateid`) REFERENCES `hosts` (`hostid`),
  CONSTRAINT `c_optemplate_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `optemplate`
--

LOCK TABLES `optemplate` WRITE;
/*!40000 ALTER TABLE `optemplate` DISABLE KEYS */;
INSERT INTO `optemplate` VALUES (9,22,10127),(11,23,10127),(12,24,10127),(14,27,10107),(15,28,10108);
/*!40000 ALTER TABLE `optemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `profileid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `idx` varchar(96) NOT NULL DEFAULT '',
  `idx2` bigint(20) unsigned NOT NULL DEFAULT '0',
  `value_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `value_int` int(11) NOT NULL DEFAULT '0',
  `value_str` varchar(255) NOT NULL DEFAULT '',
  `source` varchar(96) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`profileid`),
  KEY `profiles_1` (`userid`,`idx`,`idx2`),
  KEY `profiles_2` (`userid`,`profileid`),
  CONSTRAINT `c_profiles_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,1,'web.menu.config.last',0,0,0,'templates.php','',3),(2,1,'web.templates.php.groupid',0,0,0,'','',1),(3,1,'web.latest.groupid',0,0,0,'','',1),(4,1,'web.templates.php.sort',0,0,0,'name','',3),(5,1,'web.templates.php.sortorder',0,0,0,'ASC','',3),(6,1,'web.paging.lastpage',0,0,0,'templates.php','',3),(7,1,'web.items.filter_groupid',0,0,0,'','',1),(8,1,'web.items.filter_hostid',0,10126,0,'','',1),(9,1,'web.items.filter_application',0,0,0,'','',3),(10,1,'web.items.filter_name',0,0,0,'','',3),(11,1,'web.items.filter_type',0,0,-1,'','',2),(12,1,'web.items.filter_key',0,0,0,'','',3),(13,1,'web.items.filter_snmp_community',0,0,0,'','',3),(14,1,'web.items.filter_snmpv3_securityname',0,0,0,'','',3),(15,1,'web.items.filter_snmp_oid',0,0,0,'','',3),(16,1,'web.items.filter_port',0,0,0,'','',3),(17,1,'web.items.filter_value_type',0,0,-1,'','',2),(18,1,'web.items.filter_data_type',0,0,-1,'','',2),(19,1,'web.items.filter_delay',0,0,0,'','',3),(20,1,'web.items.filter_history',0,0,0,'','',3),(21,1,'web.items.filter_trends',0,0,0,'','',3),(22,1,'web.items.filter_status',0,0,-1,'','',2),(23,1,'web.items.filter_state',0,0,-1,'','',2),(24,1,'web.items.filter_templated_items',0,0,-1,'','',2),(25,1,'web.items.filter_with_triggers',0,0,-1,'','',2),(26,1,'web.items.filter_ipmi_sensor',0,0,0,'','',3),(27,1,'web.items.subfilter_apps',0,0,0,'','',3),(28,1,'web.items.subfilter_types',0,0,0,'','',3),(29,1,'web.items.subfilter_value_types',0,0,0,'','',3),(30,1,'web.items.subfilter_status',0,0,0,'','',3),(31,1,'web.items.subfilter_state',0,0,0,'','',3),(32,1,'web.items.subfilter_templated_items',0,0,0,'','',3),(33,1,'web.items.subfilter_with_triggers',0,0,0,'','',3),(34,1,'web.items.subfilter_hosts',0,0,0,'','',3),(35,1,'web.items.subfilter_interval',0,0,0,'','',3),(36,1,'web.items.subfilter_history',0,0,0,'','',3),(37,1,'web.items.subfilter_trends',0,0,0,'','',3),(38,1,'web.items.php.sort',0,0,0,'name','',3),(39,1,'web.items.php.sortorder',0,0,0,'ASC','',3),(40,1,'web.media_type.php.sort',0,0,0,'description','',3),(41,1,'web.media_types.php.sortorder',0,0,0,'ASC','',3),(42,1,'web.actionconf.php.sort',0,0,0,'name','',3),(43,1,'web.actionconf.php.sortorder',0,0,0,'ASC','',3),(44,1,'web.reports.groupid',0,1,0,'','',1),(45,1,'web.actionconf.eventsource',0,0,0,'','',2),(46,1,'web.config.groupid',0,0,0,'','',1),(47,1,'web.hosts.php.sort',0,0,0,'name','',3),(48,1,'web.hosts.php.sortorder',0,0,0,'ASC','',3),(49,1,'web.menu.admin.last',0,0,0,'users.php','',3),(50,1,'web.users.filter.usrgrpid',0,0,0,'','',1),(51,1,'web.users.php.sort',0,0,0,'alias','',3),(52,1,'web.users.php.sortorder',0,0,0,'ASC','',3),(53,1,'web.paging.page',0,0,6,'','',2),(54,1,'web.scripts.php.sort',0,0,0,'name','',3),(55,1,'web.scripts.php.sortorder',0,0,0,'ASC','',3);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxy_autoreg_host`
--

DROP TABLE IF EXISTS `proxy_autoreg_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxy_autoreg_host` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `clock` int(11) NOT NULL DEFAULT '0',
  `host` varchar(64) NOT NULL DEFAULT '',
  `listen_ip` varchar(39) NOT NULL DEFAULT '',
  `listen_port` int(11) NOT NULL DEFAULT '0',
  `listen_dns` varchar(64) NOT NULL DEFAULT '',
  `host_metadata` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `proxy_autoreg_host_1` (`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxy_autoreg_host`
--

LOCK TABLES `proxy_autoreg_host` WRITE;
/*!40000 ALTER TABLE `proxy_autoreg_host` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxy_autoreg_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxy_dhistory`
--

DROP TABLE IF EXISTS `proxy_dhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxy_dhistory` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `clock` int(11) NOT NULL DEFAULT '0',
  `druleid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(39) NOT NULL DEFAULT '',
  `port` int(11) NOT NULL DEFAULT '0',
  `key_` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `dcheckid` bigint(20) unsigned DEFAULT NULL,
  `dns` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `proxy_dhistory_1` (`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxy_dhistory`
--

LOCK TABLES `proxy_dhistory` WRITE;
/*!40000 ALTER TABLE `proxy_dhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxy_dhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxy_history`
--

DROP TABLE IF EXISTS `proxy_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxy_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `source` varchar(64) NOT NULL DEFAULT '',
  `severity` int(11) NOT NULL DEFAULT '0',
  `value` longtext NOT NULL,
  `logeventid` int(11) NOT NULL DEFAULT '0',
  `ns` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `lastlogsize` bigint(20) unsigned NOT NULL DEFAULT '0',
  `mtime` int(11) NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `proxy_history_1` (`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxy_history`
--

LOCK TABLES `proxy_history` WRITE;
/*!40000 ALTER TABLE `proxy_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxy_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regexps`
--

DROP TABLE IF EXISTS `regexps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regexps` (
  `regexpid` bigint(20) unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `test_string` text NOT NULL,
  PRIMARY KEY (`regexpid`),
  UNIQUE KEY `regexps_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regexps`
--

LOCK TABLES `regexps` WRITE;
/*!40000 ALTER TABLE `regexps` DISABLE KEYS */;
INSERT INTO `regexps` VALUES (1,'File systems for discovery','ext3'),(2,'Network interfaces for discovery','eth0'),(3,'Storage devices for SNMP discovery','/boot');
/*!40000 ALTER TABLE `regexps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rights`
--

DROP TABLE IF EXISTS `rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rights` (
  `rightid` bigint(20) unsigned NOT NULL,
  `groupid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '0',
  `id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`rightid`),
  KEY `rights_1` (`groupid`),
  KEY `rights_2` (`id`),
  CONSTRAINT `c_rights_2` FOREIGN KEY (`id`) REFERENCES `groups` (`groupid`) ON DELETE CASCADE,
  CONSTRAINT `c_rights_1` FOREIGN KEY (`groupid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rights`
--

LOCK TABLES `rights` WRITE;
/*!40000 ALTER TABLE `rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screen_user`
--

DROP TABLE IF EXISTS `screen_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screen_user` (
  `screenuserid` bigint(20) unsigned NOT NULL,
  `screenid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`screenuserid`),
  UNIQUE KEY `screen_user_1` (`screenid`,`userid`),
  KEY `c_screen_user_2` (`userid`),
  CONSTRAINT `c_screen_user_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE,
  CONSTRAINT `c_screen_user_1` FOREIGN KEY (`screenid`) REFERENCES `screens` (`screenid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screen_user`
--

LOCK TABLES `screen_user` WRITE;
/*!40000 ALTER TABLE `screen_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `screen_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screen_usrgrp`
--

DROP TABLE IF EXISTS `screen_usrgrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screen_usrgrp` (
  `screenusrgrpid` bigint(20) unsigned NOT NULL,
  `screenid` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`screenusrgrpid`),
  UNIQUE KEY `screen_usrgrp_1` (`screenid`,`usrgrpid`),
  KEY `c_screen_usrgrp_2` (`usrgrpid`),
  CONSTRAINT `c_screen_usrgrp_2` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE,
  CONSTRAINT `c_screen_usrgrp_1` FOREIGN KEY (`screenid`) REFERENCES `screens` (`screenid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screen_usrgrp`
--

LOCK TABLES `screen_usrgrp` WRITE;
/*!40000 ALTER TABLE `screen_usrgrp` DISABLE KEYS */;
/*!40000 ALTER TABLE `screen_usrgrp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screens`
--

DROP TABLE IF EXISTS `screens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screens` (
  `screenid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `hsize` int(11) NOT NULL DEFAULT '1',
  `vsize` int(11) NOT NULL DEFAULT '1',
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `userid` bigint(20) unsigned DEFAULT NULL,
  `private` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`screenid`),
  KEY `screens_1` (`templateid`),
  KEY `c_screens_3` (`userid`),
  CONSTRAINT `c_screens_3` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `c_screens_1` FOREIGN KEY (`templateid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screens`
--

LOCK TABLES `screens` WRITE;
/*!40000 ALTER TABLE `screens` DISABLE KEYS */;
INSERT INTO `screens` VALUES (16,'Zabbix server',2,2,NULL,1,0),(21,'MySQL performance',2,1,10120,NULL,1),(22,'Zabbix proxy health',2,2,10125,NULL,1),(23,'Zabbix server health',2,3,10126,NULL,1),(24,'System performance',2,3,10127,NULL,1),(25,'System performance',2,2,10128,NULL,1);
/*!40000 ALTER TABLE `screens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screens_items`
--

DROP TABLE IF EXISTS `screens_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screens_items` (
  `screenitemid` bigint(20) unsigned NOT NULL,
  `screenid` bigint(20) unsigned NOT NULL,
  `resourcetype` int(11) NOT NULL DEFAULT '0',
  `resourceid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `width` int(11) NOT NULL DEFAULT '320',
  `height` int(11) NOT NULL DEFAULT '200',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  `colspan` int(11) NOT NULL DEFAULT '1',
  `rowspan` int(11) NOT NULL DEFAULT '1',
  `elements` int(11) NOT NULL DEFAULT '25',
  `valign` int(11) NOT NULL DEFAULT '0',
  `halign` int(11) NOT NULL DEFAULT '0',
  `style` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `dynamic` int(11) NOT NULL DEFAULT '0',
  `sort_triggers` int(11) NOT NULL DEFAULT '0',
  `application` varchar(255) NOT NULL DEFAULT '',
  `max_columns` int(11) NOT NULL DEFAULT '3',
  PRIMARY KEY (`screenitemid`),
  KEY `screens_items_1` (`screenid`),
  CONSTRAINT `c_screens_items_1` FOREIGN KEY (`screenid`) REFERENCES `screens` (`screenid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screens_items`
--

LOCK TABLES `screens_items` WRITE;
/*!40000 ALTER TABLE `screens_items` DISABLE KEYS */;
INSERT INTO `screens_items` VALUES (44,16,2,1,500,100,0,0,2,1,0,0,0,0,'',0,0,'',3),(45,16,0,524,400,156,0,1,1,1,0,0,0,0,'',0,0,'',3),(46,16,0,525,400,100,1,1,1,1,0,0,0,0,'',0,0,'',3),(64,21,0,614,500,200,0,0,1,1,0,1,0,0,'',0,0,'',3),(65,21,0,607,500,270,1,0,1,1,0,1,0,0,'',0,0,'',3),(66,22,0,654,500,212,0,0,1,1,0,1,0,0,'',0,0,'',3),(67,22,0,650,500,100,1,0,1,1,0,1,0,0,'',0,0,'',3),(68,22,0,652,500,100,0,1,1,1,0,1,0,0,'',0,0,'',3),(69,22,0,648,500,128,1,1,1,1,0,1,0,0,'',0,0,'',3),(70,23,0,655,500,212,0,0,1,1,0,1,0,0,'',0,0,'',3),(71,23,0,651,500,100,1,0,1,1,0,1,0,0,'',0,0,'',3),(72,23,0,653,555,114,0,1,1,1,0,1,0,0,'',0,0,'',3),(73,23,0,649,500,128,1,1,1,1,0,1,0,0,'',0,0,'',3),(74,23,0,647,500,160,0,2,2,1,0,0,0,0,'',0,0,'',3),(75,24,0,568,500,120,0,0,1,1,0,1,0,0,'',0,0,'',3),(76,24,0,570,500,148,1,0,1,1,0,1,0,0,'',0,0,'',3),(77,24,0,606,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(78,25,0,569,500,100,0,0,1,1,0,0,0,0,'',0,0,'',3),(79,25,0,605,500,100,1,0,1,1,0,0,0,0,'',0,0,'',3),(80,25,1,24022,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(81,25,1,24019,500,100,1,1,1,1,0,0,0,0,'',0,0,'',3);
/*!40000 ALTER TABLE `screens_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scripts`
--

DROP TABLE IF EXISTS `scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scripts` (
  `scriptid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `command` varchar(255) NOT NULL DEFAULT '',
  `host_access` int(11) NOT NULL DEFAULT '2',
  `usrgrpid` bigint(20) unsigned DEFAULT NULL,
  `groupid` bigint(20) unsigned DEFAULT NULL,
  `description` text NOT NULL,
  `confirmation` varchar(255) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0',
  `execute_on` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`scriptid`),
  UNIQUE KEY `scripts_3` (`name`),
  KEY `scripts_1` (`usrgrpid`),
  KEY `scripts_2` (`groupid`),
  CONSTRAINT `c_scripts_2` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`),
  CONSTRAINT `c_scripts_1` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scripts`
--

LOCK TABLES `scripts` WRITE;
/*!40000 ALTER TABLE `scripts` DISABLE KEYS */;
INSERT INTO `scripts` VALUES (1,'Ping','/bin/ping -c 3 {HOST.CONN} 2>&1',2,NULL,NULL,'','',0,1),(2,'Traceroute','/bin/traceroute {HOST.CONN} 2>&1',2,NULL,NULL,'','',0,1),(3,'Detect operating system','sudo /usr/bin/nmap -O {HOST.CONN} 2>&1',2,7,NULL,'','',0,1);
/*!40000 ALTER TABLE `scripts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_alarms`
--

DROP TABLE IF EXISTS `service_alarms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_alarms` (
  `servicealarmid` bigint(20) unsigned NOT NULL,
  `serviceid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`servicealarmid`),
  KEY `service_alarms_1` (`serviceid`,`clock`),
  KEY `service_alarms_2` (`clock`),
  CONSTRAINT `c_service_alarms_1` FOREIGN KEY (`serviceid`) REFERENCES `services` (`serviceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_alarms`
--

LOCK TABLES `service_alarms` WRITE;
/*!40000 ALTER TABLE `service_alarms` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_alarms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `serviceid` bigint(20) unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `algorithm` int(11) NOT NULL DEFAULT '0',
  `triggerid` bigint(20) unsigned DEFAULT NULL,
  `showsla` int(11) NOT NULL DEFAULT '0',
  `goodsla` double(16,4) NOT NULL DEFAULT '99.9000',
  `sortorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`serviceid`),
  KEY `services_1` (`triggerid`),
  CONSTRAINT `c_services_1` FOREIGN KEY (`triggerid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_links`
--

DROP TABLE IF EXISTS `services_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services_links` (
  `linkid` bigint(20) unsigned NOT NULL,
  `serviceupid` bigint(20) unsigned NOT NULL,
  `servicedownid` bigint(20) unsigned NOT NULL,
  `soft` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`linkid`),
  UNIQUE KEY `services_links_2` (`serviceupid`,`servicedownid`),
  KEY `services_links_1` (`servicedownid`),
  CONSTRAINT `c_services_links_2` FOREIGN KEY (`servicedownid`) REFERENCES `services` (`serviceid`) ON DELETE CASCADE,
  CONSTRAINT `c_services_links_1` FOREIGN KEY (`serviceupid`) REFERENCES `services` (`serviceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_links`
--

LOCK TABLES `services_links` WRITE;
/*!40000 ALTER TABLE `services_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `services_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_times`
--

DROP TABLE IF EXISTS `services_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services_times` (
  `timeid` bigint(20) unsigned NOT NULL,
  `serviceid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `ts_from` int(11) NOT NULL DEFAULT '0',
  `ts_to` int(11) NOT NULL DEFAULT '0',
  `note` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`timeid`),
  KEY `services_times_1` (`serviceid`,`type`,`ts_from`,`ts_to`),
  CONSTRAINT `c_services_times_1` FOREIGN KEY (`serviceid`) REFERENCES `services` (`serviceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_times`
--

LOCK TABLES `services_times` WRITE;
/*!40000 ALTER TABLE `services_times` DISABLE KEYS */;
/*!40000 ALTER TABLE `services_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `sessionid` varchar(32) NOT NULL DEFAULT '',
  `userid` bigint(20) unsigned NOT NULL,
  `lastaccess` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sessionid`),
  KEY `sessions_1` (`userid`,`status`),
  CONSTRAINT `c_sessions_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('1c84cba6bfab10f050924e7376151ec6',1,1497496842,0),('391dc181f506d12dd3a255a9791959e2',1,1492253851,0),('a505292d98cc94a03559fe24079c4f9d',1,1490926267,0),('b77069254195de422976ae35185cf5b9',1,1490927149,0);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slides`
--

DROP TABLE IF EXISTS `slides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slides` (
  `slideid` bigint(20) unsigned NOT NULL,
  `slideshowid` bigint(20) unsigned NOT NULL,
  `screenid` bigint(20) unsigned NOT NULL,
  `step` int(11) NOT NULL DEFAULT '0',
  `delay` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`slideid`),
  KEY `slides_1` (`slideshowid`),
  KEY `slides_2` (`screenid`),
  CONSTRAINT `c_slides_2` FOREIGN KEY (`screenid`) REFERENCES `screens` (`screenid`) ON DELETE CASCADE,
  CONSTRAINT `c_slides_1` FOREIGN KEY (`slideshowid`) REFERENCES `slideshows` (`slideshowid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slides`
--

LOCK TABLES `slides` WRITE;
/*!40000 ALTER TABLE `slides` DISABLE KEYS */;
/*!40000 ALTER TABLE `slides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slideshow_user`
--

DROP TABLE IF EXISTS `slideshow_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slideshow_user` (
  `slideshowuserid` bigint(20) unsigned NOT NULL,
  `slideshowid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`slideshowuserid`),
  UNIQUE KEY `slideshow_user_1` (`slideshowid`,`userid`),
  KEY `c_slideshow_user_2` (`userid`),
  CONSTRAINT `c_slideshow_user_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE,
  CONSTRAINT `c_slideshow_user_1` FOREIGN KEY (`slideshowid`) REFERENCES `slideshows` (`slideshowid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slideshow_user`
--

LOCK TABLES `slideshow_user` WRITE;
/*!40000 ALTER TABLE `slideshow_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `slideshow_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slideshow_usrgrp`
--

DROP TABLE IF EXISTS `slideshow_usrgrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slideshow_usrgrp` (
  `slideshowusrgrpid` bigint(20) unsigned NOT NULL,
  `slideshowid` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`slideshowusrgrpid`),
  UNIQUE KEY `slideshow_usrgrp_1` (`slideshowid`,`usrgrpid`),
  KEY `c_slideshow_usrgrp_2` (`usrgrpid`),
  CONSTRAINT `c_slideshow_usrgrp_2` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE,
  CONSTRAINT `c_slideshow_usrgrp_1` FOREIGN KEY (`slideshowid`) REFERENCES `slideshows` (`slideshowid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slideshow_usrgrp`
--

LOCK TABLES `slideshow_usrgrp` WRITE;
/*!40000 ALTER TABLE `slideshow_usrgrp` DISABLE KEYS */;
/*!40000 ALTER TABLE `slideshow_usrgrp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slideshows`
--

DROP TABLE IF EXISTS `slideshows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slideshows` (
  `slideshowid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `delay` int(11) NOT NULL DEFAULT '0',
  `userid` bigint(20) unsigned NOT NULL,
  `private` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`slideshowid`),
  UNIQUE KEY `slideshows_1` (`name`),
  KEY `c_slideshows_3` (`userid`),
  CONSTRAINT `c_slideshows_3` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slideshows`
--

LOCK TABLES `slideshows` WRITE;
/*!40000 ALTER TABLE `slideshows` DISABLE KEYS */;
/*!40000 ALTER TABLE `slideshows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmap_element_url`
--

DROP TABLE IF EXISTS `sysmap_element_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmap_element_url` (
  `sysmapelementurlid` bigint(20) unsigned NOT NULL,
  `selementid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`sysmapelementurlid`),
  UNIQUE KEY `sysmap_element_url_1` (`selementid`,`name`),
  CONSTRAINT `c_sysmap_element_url_1` FOREIGN KEY (`selementid`) REFERENCES `sysmaps_elements` (`selementid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmap_element_url`
--

LOCK TABLES `sysmap_element_url` WRITE;
/*!40000 ALTER TABLE `sysmap_element_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmap_element_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmap_url`
--

DROP TABLE IF EXISTS `sysmap_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmap_url` (
  `sysmapurlid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `elementtype` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sysmapurlid`),
  UNIQUE KEY `sysmap_url_1` (`sysmapid`,`name`),
  CONSTRAINT `c_sysmap_url_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmap_url`
--

LOCK TABLES `sysmap_url` WRITE;
/*!40000 ALTER TABLE `sysmap_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmap_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmap_user`
--

DROP TABLE IF EXISTS `sysmap_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmap_user` (
  `sysmapuserid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`sysmapuserid`),
  UNIQUE KEY `sysmap_user_1` (`sysmapid`,`userid`),
  KEY `c_sysmap_user_2` (`userid`),
  CONSTRAINT `c_sysmap_user_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmap_user_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmap_user`
--

LOCK TABLES `sysmap_user` WRITE;
/*!40000 ALTER TABLE `sysmap_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmap_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmap_usrgrp`
--

DROP TABLE IF EXISTS `sysmap_usrgrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmap_usrgrp` (
  `sysmapusrgrpid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`sysmapusrgrpid`),
  UNIQUE KEY `sysmap_usrgrp_1` (`sysmapid`,`usrgrpid`),
  KEY `c_sysmap_usrgrp_2` (`usrgrpid`),
  CONSTRAINT `c_sysmap_usrgrp_2` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmap_usrgrp_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmap_usrgrp`
--

LOCK TABLES `sysmap_usrgrp` WRITE;
/*!40000 ALTER TABLE `sysmap_usrgrp` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmap_usrgrp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmaps`
--

DROP TABLE IF EXISTS `sysmaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmaps` (
  `sysmapid` bigint(20) unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `width` int(11) NOT NULL DEFAULT '600',
  `height` int(11) NOT NULL DEFAULT '400',
  `backgroundid` bigint(20) unsigned DEFAULT NULL,
  `label_type` int(11) NOT NULL DEFAULT '2',
  `label_location` int(11) NOT NULL DEFAULT '0',
  `highlight` int(11) NOT NULL DEFAULT '1',
  `expandproblem` int(11) NOT NULL DEFAULT '1',
  `markelements` int(11) NOT NULL DEFAULT '0',
  `show_unack` int(11) NOT NULL DEFAULT '0',
  `grid_size` int(11) NOT NULL DEFAULT '50',
  `grid_show` int(11) NOT NULL DEFAULT '1',
  `grid_align` int(11) NOT NULL DEFAULT '1',
  `label_format` int(11) NOT NULL DEFAULT '0',
  `label_type_host` int(11) NOT NULL DEFAULT '2',
  `label_type_hostgroup` int(11) NOT NULL DEFAULT '2',
  `label_type_trigger` int(11) NOT NULL DEFAULT '2',
  `label_type_map` int(11) NOT NULL DEFAULT '2',
  `label_type_image` int(11) NOT NULL DEFAULT '2',
  `label_string_host` varchar(255) NOT NULL DEFAULT '',
  `label_string_hostgroup` varchar(255) NOT NULL DEFAULT '',
  `label_string_trigger` varchar(255) NOT NULL DEFAULT '',
  `label_string_map` varchar(255) NOT NULL DEFAULT '',
  `label_string_image` varchar(255) NOT NULL DEFAULT '',
  `iconmapid` bigint(20) unsigned DEFAULT NULL,
  `expand_macros` int(11) NOT NULL DEFAULT '0',
  `severity_min` int(11) NOT NULL DEFAULT '0',
  `userid` bigint(20) unsigned NOT NULL,
  `private` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`sysmapid`),
  UNIQUE KEY `sysmaps_1` (`name`),
  KEY `sysmaps_2` (`backgroundid`),
  KEY `sysmaps_3` (`iconmapid`),
  KEY `c_sysmaps_3` (`userid`),
  CONSTRAINT `c_sysmaps_3` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `c_sysmaps_1` FOREIGN KEY (`backgroundid`) REFERENCES `images` (`imageid`),
  CONSTRAINT `c_sysmaps_2` FOREIGN KEY (`iconmapid`) REFERENCES `icon_map` (`iconmapid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmaps`
--

LOCK TABLES `sysmaps` WRITE;
/*!40000 ALTER TABLE `sysmaps` DISABLE KEYS */;
INSERT INTO `sysmaps` VALUES (1,'Local network',680,200,NULL,0,0,1,1,1,0,50,1,1,0,2,2,2,2,2,'','','','','',NULL,1,0,1,0);
/*!40000 ALTER TABLE `sysmaps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmaps_elements`
--

DROP TABLE IF EXISTS `sysmaps_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmaps_elements` (
  `selementid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `elementid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `elementtype` int(11) NOT NULL DEFAULT '0',
  `iconid_off` bigint(20) unsigned DEFAULT NULL,
  `iconid_on` bigint(20) unsigned DEFAULT NULL,
  `label` varchar(2048) NOT NULL DEFAULT '',
  `label_location` int(11) NOT NULL DEFAULT '-1',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  `iconid_disabled` bigint(20) unsigned DEFAULT NULL,
  `iconid_maintenance` bigint(20) unsigned DEFAULT NULL,
  `elementsubtype` int(11) NOT NULL DEFAULT '0',
  `areatype` int(11) NOT NULL DEFAULT '0',
  `width` int(11) NOT NULL DEFAULT '200',
  `height` int(11) NOT NULL DEFAULT '200',
  `viewtype` int(11) NOT NULL DEFAULT '0',
  `use_iconmap` int(11) NOT NULL DEFAULT '1',
  `application` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`selementid`),
  KEY `sysmaps_elements_1` (`sysmapid`),
  KEY `sysmaps_elements_2` (`iconid_off`),
  KEY `sysmaps_elements_3` (`iconid_on`),
  KEY `sysmaps_elements_4` (`iconid_disabled`),
  KEY `sysmaps_elements_5` (`iconid_maintenance`),
  CONSTRAINT `c_sysmaps_elements_5` FOREIGN KEY (`iconid_maintenance`) REFERENCES `images` (`imageid`),
  CONSTRAINT `c_sysmaps_elements_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmaps_elements_2` FOREIGN KEY (`iconid_off`) REFERENCES `images` (`imageid`),
  CONSTRAINT `c_sysmaps_elements_3` FOREIGN KEY (`iconid_on`) REFERENCES `images` (`imageid`),
  CONSTRAINT `c_sysmaps_elements_4` FOREIGN KEY (`iconid_disabled`) REFERENCES `images` (`imageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmaps_elements`
--

LOCK TABLES `sysmaps_elements` WRITE;
/*!40000 ALTER TABLE `sysmaps_elements` DISABLE KEYS */;
INSERT INTO `sysmaps_elements` VALUES (1,1,10084,0,185,NULL,'{HOST.NAME}\r\n{HOST.CONN}',0,111,61,NULL,NULL,0,0,200,200,0,0,'');
/*!40000 ALTER TABLE `sysmaps_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmaps_link_triggers`
--

DROP TABLE IF EXISTS `sysmaps_link_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmaps_link_triggers` (
  `linktriggerid` bigint(20) unsigned NOT NULL,
  `linkid` bigint(20) unsigned NOT NULL,
  `triggerid` bigint(20) unsigned NOT NULL,
  `drawtype` int(11) NOT NULL DEFAULT '0',
  `color` varchar(6) NOT NULL DEFAULT '000000',
  PRIMARY KEY (`linktriggerid`),
  UNIQUE KEY `sysmaps_link_triggers_1` (`linkid`,`triggerid`),
  KEY `sysmaps_link_triggers_2` (`triggerid`),
  CONSTRAINT `c_sysmaps_link_triggers_2` FOREIGN KEY (`triggerid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmaps_link_triggers_1` FOREIGN KEY (`linkid`) REFERENCES `sysmaps_links` (`linkid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmaps_link_triggers`
--

LOCK TABLES `sysmaps_link_triggers` WRITE;
/*!40000 ALTER TABLE `sysmaps_link_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmaps_link_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmaps_links`
--

DROP TABLE IF EXISTS `sysmaps_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmaps_links` (
  `linkid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `selementid1` bigint(20) unsigned NOT NULL,
  `selementid2` bigint(20) unsigned NOT NULL,
  `drawtype` int(11) NOT NULL DEFAULT '0',
  `color` varchar(6) NOT NULL DEFAULT '000000',
  `label` varchar(2048) NOT NULL DEFAULT '',
  PRIMARY KEY (`linkid`),
  KEY `sysmaps_links_1` (`sysmapid`),
  KEY `sysmaps_links_2` (`selementid1`),
  KEY `sysmaps_links_3` (`selementid2`),
  CONSTRAINT `c_sysmaps_links_3` FOREIGN KEY (`selementid2`) REFERENCES `sysmaps_elements` (`selementid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmaps_links_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmaps_links_2` FOREIGN KEY (`selementid1`) REFERENCES `sysmaps_elements` (`selementid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmaps_links`
--

LOCK TABLES `sysmaps_links` WRITE;
/*!40000 ALTER TABLE `sysmaps_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmaps_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timeperiods`
--

DROP TABLE IF EXISTS `timeperiods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeperiods` (
  `timeperiodid` bigint(20) unsigned NOT NULL,
  `timeperiod_type` int(11) NOT NULL DEFAULT '0',
  `every` int(11) NOT NULL DEFAULT '1',
  `month` int(11) NOT NULL DEFAULT '0',
  `dayofweek` int(11) NOT NULL DEFAULT '0',
  `day` int(11) NOT NULL DEFAULT '0',
  `start_time` int(11) NOT NULL DEFAULT '0',
  `period` int(11) NOT NULL DEFAULT '0',
  `start_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`timeperiodid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeperiods`
--

LOCK TABLES `timeperiods` WRITE;
/*!40000 ALTER TABLE `timeperiods` DISABLE KEYS */;
/*!40000 ALTER TABLE `timeperiods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trends`
--

DROP TABLE IF EXISTS `trends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trends` (
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0',
  `value_min` double(16,4) NOT NULL DEFAULT '0.0000',
  `value_avg` double(16,4) NOT NULL DEFAULT '0.0000',
  `value_max` double(16,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trends`
--

LOCK TABLES `trends` WRITE;
/*!40000 ALTER TABLE `trends` DISABLE KEYS */;
/*!40000 ALTER TABLE `trends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trends_uint`
--

DROP TABLE IF EXISTS `trends_uint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trends_uint` (
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0',
  `value_min` bigint(20) unsigned NOT NULL DEFAULT '0',
  `value_avg` bigint(20) unsigned NOT NULL DEFAULT '0',
  `value_max` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trends_uint`
--

LOCK TABLES `trends_uint` WRITE;
/*!40000 ALTER TABLE `trends_uint` DISABLE KEYS */;
/*!40000 ALTER TABLE `trends_uint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trigger_depends`
--

DROP TABLE IF EXISTS `trigger_depends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trigger_depends` (
  `triggerdepid` bigint(20) unsigned NOT NULL,
  `triggerid_down` bigint(20) unsigned NOT NULL,
  `triggerid_up` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`triggerdepid`),
  UNIQUE KEY `trigger_depends_1` (`triggerid_down`,`triggerid_up`),
  KEY `trigger_depends_2` (`triggerid_up`),
  CONSTRAINT `c_trigger_depends_2` FOREIGN KEY (`triggerid_up`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE,
  CONSTRAINT `c_trigger_depends_1` FOREIGN KEY (`triggerid_down`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trigger_depends`
--

LOCK TABLES `trigger_depends` WRITE;
/*!40000 ALTER TABLE `trigger_depends` DISABLE KEYS */;
/*!40000 ALTER TABLE `trigger_depends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trigger_discovery`
--

DROP TABLE IF EXISTS `trigger_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trigger_discovery` (
  `triggerid` bigint(20) unsigned NOT NULL,
  `parent_triggerid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`triggerid`),
  KEY `trigger_discovery_1` (`parent_triggerid`),
  CONSTRAINT `c_trigger_discovery_2` FOREIGN KEY (`parent_triggerid`) REFERENCES `triggers` (`triggerid`),
  CONSTRAINT `c_trigger_discovery_1` FOREIGN KEY (`triggerid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trigger_discovery`
--

LOCK TABLES `trigger_discovery` WRITE;
/*!40000 ALTER TABLE `trigger_discovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `trigger_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `triggers`
--

DROP TABLE IF EXISTS `triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `triggers` (
  `triggerid` bigint(20) unsigned NOT NULL,
  `expression` varchar(2048) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '0',
  `lastchange` int(11) NOT NULL DEFAULT '0',
  `comments` text NOT NULL,
  `error` varchar(128) NOT NULL DEFAULT '',
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`triggerid`),
  KEY `triggers_1` (`status`),
  KEY `triggers_2` (`value`,`lastchange`),
  KEY `triggers_3` (`templateid`),
  CONSTRAINT `c_triggers_1` FOREIGN KEY (`templateid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `triggers`
--

LOCK TABLES `triggers` WRITE;
/*!40000 ALTER TABLE `triggers` DISABLE KEYS */;
INSERT INTO `triggers` VALUES (13075,'{12648}<5','Less than 5% free in the value cache','',0,0,3,0,'','',13738,0,0,0),(13436,'({TRIGGER.VALUE}=0 and {13136}>75) or ({TRIGGER.VALUE}=1 and {13136}>65)','Zabbix vmware collector processes more than 75% busy','',0,0,3,0,'','',13882,0,0,0),(13467,'({TRIGGER.VALUE}=0 and {13100}>75) or ({TRIGGER.VALUE}=1 and {13100}>65)','Zabbix alerter processes more than 75% busy','',0,0,3,0,'','',13848,0,0,0),(13468,'({TRIGGER.VALUE}=0 and {13102}>75) or ({TRIGGER.VALUE}=1 and {13102}>65)','Zabbix configuration syncer processes more than 75% busy','',0,0,3,0,'','',13850,0,0,0),(13469,'({TRIGGER.VALUE}=0 and {13104}>75) or ({TRIGGER.VALUE}=1 and {13104}>65)','Zabbix db watchdog processes more than 75% busy','',0,0,3,0,'','',13852,0,0,0),(13470,'({TRIGGER.VALUE}=0 and {13106}>75) or ({TRIGGER.VALUE}=1 and {13106}>65)','Zabbix discoverer processes more than 75% busy','',1,0,3,0,'','',13854,0,0,0),(13471,'({TRIGGER.VALUE}=0 and {13108}>75) or ({TRIGGER.VALUE}=1 and {13108}>65)','Zabbix escalator processes more than 75% busy','',0,0,3,0,'','',13855,0,0,0),(13472,'({TRIGGER.VALUE}=0 and {13110}>75) or ({TRIGGER.VALUE}=1 and {13110}>65)','Zabbix history syncer processes more than 75% busy','',0,0,3,0,'','',13858,0,0,0),(13473,'({TRIGGER.VALUE}=0 and {13112}>75) or ({TRIGGER.VALUE}=1 and {13112}>65)','Zabbix housekeeper processes more than 75% busy','',0,0,3,0,'','',13860,0,0,0),(13474,'({TRIGGER.VALUE}=0 and {13114}>75) or ({TRIGGER.VALUE}=1 and {13114}>65)','Zabbix http poller processes more than 75% busy','',0,0,3,0,'','',13862,0,0,0),(13475,'({TRIGGER.VALUE}=0 and {13116}>75) or ({TRIGGER.VALUE}=1 and {13116}>65)','Zabbix icmp pinger processes more than 75% busy','',0,0,3,0,'','',13864,0,0,0),(13476,'({TRIGGER.VALUE}=0 and {13118}>75) or ({TRIGGER.VALUE}=1 and {13118}>65)','Zabbix ipmi poller processes more than 75% busy','',0,0,3,0,'','',13866,0,0,0),(13477,'({TRIGGER.VALUE}=0 and {13120}>75) or ({TRIGGER.VALUE}=1 and {13120}>65)','Zabbix java poller processes more than 75% busy','',0,0,3,0,'','',13868,0,0,0),(13479,'({TRIGGER.VALUE}=0 and {13124}>75) or ({TRIGGER.VALUE}=1 and {13124}>65)','Zabbix poller processes more than 75% busy','',0,0,3,0,'','',13870,0,0,0),(13480,'({TRIGGER.VALUE}=0 and {13126}>75) or ({TRIGGER.VALUE}=1 and {13126}>65)','Zabbix proxy poller processes more than 75% busy','',0,0,3,0,'','',13871,0,0,0),(13481,'({TRIGGER.VALUE}=0 and {13030}>75) or ({TRIGGER.VALUE}=1 and {13030}>65)','Zabbix self-monitoring processes more than 75% busy','',0,0,3,0,'','',13873,0,0,0),(13482,'({TRIGGER.VALUE}=0 and {13128}>75) or ({TRIGGER.VALUE}=1 and {13128}>65)','Zabbix snmp trapper processes more than 75% busy','',0,0,3,0,'','',13875,0,0,0),(13483,'({TRIGGER.VALUE}=0 and {13130}>75) or ({TRIGGER.VALUE}=1 and {13130}>65)','Zabbix timer processes more than 75% busy','',0,0,3,0,'','',13876,0,0,0),(13484,'({TRIGGER.VALUE}=0 and {13132}>75) or ({TRIGGER.VALUE}=1 and {13132}>65)','Zabbix trapper processes more than 75% busy','',0,0,3,0,'','',13878,0,0,0),(13485,'({TRIGGER.VALUE}=0 and {13134}>75) or ({TRIGGER.VALUE}=1 and {13134}>65)','Zabbix unreachable poller processes more than 75% busy','',0,0,3,0,'','',13880,0,0,0),(13486,'{12895}>100','More than 100 items having missing data for more than 10 minutes','',0,0,2,0,'zabbix[queue,10m] item is collecting data about how many items are missing data for more than 10 minutes (next parameter)','',13752,0,0,0),(13487,'{12896}<25','Less than 25% free in the configuration cache','',0,0,3,0,'Consider increasing CacheSize in the zabbix_server.conf configuration file','',13740,0,0,0),(13488,'{12897}<25','Less than 25% free in the history cache','',0,0,3,0,'','',13742,0,0,0),(13489,'{12898}<25','Less than 25% free in the history index cache','',0,0,3,0,'','',13743,0,0,0),(13490,'{12899}<25','Less than 25% free in the trends cache','',0,0,3,0,'','',13745,0,0,0),(13491,'{12900}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,0,'','',NULL,0,0,0),(13492,'{12928}>0','Version of zabbix_agent(d) was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0),(13493,'{12902}<1024','Configured max number of opened files is too low on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0),(13494,'{12903}<256','Configured max number of processes is too low on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0),(13495,'{13085}>30','Too many processes running on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0),(13496,'{13083}>300','Too many processes on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0),(13497,'{13079}>5','Processor load is too high on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0),(13498,'{13081}>20','Disk I/O is overloaded on {HOST.NAME}','',0,0,2,0,'OS spends significant time waiting for I/O (input/output) operations. It could be indicator of performance issues with storage system.','',NULL,0,0,0),(13499,'{12908}>0','Hostname was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0),(13500,'{12909}<50','Lack of free swap space on {HOST.NAME}','',0,0,2,0,'It probably means that the systems requires more physical memory.','',NULL,0,0,0),(13501,'{12910}>0','Host information was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0),(13502,'{12911}<0','{HOST.NAME} has just been restarted','',0,0,1,0,'','',NULL,0,0,0),(13503,'{12912}>0','/etc/passwd has been changed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0),(13504,'{12913}<20M','Lack of available memory on server {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0),(13505,'{12914}<20','Free inodes is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2),(13506,'{12915}<20','Free disk space is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2),(13509,'{12938}>0','Host name of zabbix_agentd was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0),(13537,'{12966}<25','Less than 25% free in the vmware cache','',0,0,3,0,'','',13746,0,0,0),(13558,'{13161}=1','Zabbix value cache working in low memory mode','',0,0,4,0,'','',13881,0,0,0),(13696,'{13299}>0','/etc/passwd has been changed on {HOST.NAME}','',0,0,3,0,'Password has been changed','',NULL,0,0,0),(13705,'{13310}=1','CEPH critical error','',0,0,3,0,'CEPH encounters a citical issue needing immediate fix.','',NULL,0,0,0),(13706,'{13311}=2','CEPH warning','',0,0,2,0,'CEPH is in wrong status, but still can run normally now.','',NULL,0,0,0),(13712,'{13317}<1024','Configured max number of opened files is too low on {HOST.NAME}','',0,0,1,0,'Configured max number of opened files is too low','',NULL,0,0,0),(13713,'{13318}<256','Configured max number of processes is too low on {HOST.NAME}','',0,0,1,0,'Configured max number of processes is too low','',NULL,0,0,0),(13714,'{13319}>20','CPU interrupt time {HOST.NAME}','',0,0,2,0,'CPU interrupt time','',NULL,0,0,0),(13716,'{13321}>35','Disk I/O is overloaded on {HOST.NAME}','',0,0,2,0,'OS spends significant time waiting for I/O (input/output) operations. It could be indicator of performance issues with storage system.','',NULL,0,0,0),(13722,'{13329}>0','Host information was changed on {HOST.NAME}','',0,0,1,0,'Host information was changed','',NULL,0,0,0),(13723,'{13330}>0','Host information was changed on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0),(13735,'{13345}<1000M','Lack of available memory on server {HOST.NAME}','',0,0,3,0,'Lack of available memory','',NULL,0,0,0),(13736,'{13346}<10000','Lack of free memory on server {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0),(13737,'{13347}<100000','Lack of free swap space on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0),(13738,'{13348}<5','Less than 5% free in the value cache','',0,0,3,0,'','',NULL,0,0,0),(13739,'{13349}<25','Less than 25% free in the configuration cache','',0,0,3,0,'Consider increasing CacheSize in the zabbix_server.conf configuration file','',NULL,0,0,0),(13740,'{13350}<25','Less than 25% free in the configuration cache','',0,0,3,0,'Consider increasing CacheSize in the zabbix_server.conf configuration file','',NULL,0,0,0),(13741,'{13351}<25','Less than 25% free in the history cache','',0,0,3,0,'Less than 25% free in the history cache','',NULL,0,0,0),(13742,'{13352}<25','Less than 25% free in the history cache','',0,0,3,0,'','',NULL,0,0,0),(13743,'{13353}<25','Less than 25% free in the history index cache','',0,0,3,0,'','',NULL,0,0,0),(13744,'{13354}<25','Less than 25% free in the text history cache','',0,0,3,0,'','',NULL,0,0,0),(13745,'{13355}<25','Less than 25% free in the trends cache','',0,0,3,0,'','',NULL,0,0,0),(13746,'{13356}<25','Less than 25% free in the vmware cache','',0,0,3,0,'','',NULL,0,0,0),(13751,'{13361}>100','More than 100 items having missing data for more than 10 minutes','',0,0,2,0,'zabbix[queue,10m] item is collecting data about how many items are missing data for more than 10 minutes (next parameter)','',NULL,0,0,0),(13752,'{13362}>100','More than 100 items having missing data for more than 10 minutes','',0,0,2,0,'zabbix[queue,10m] item is collecting data about how many items are missing data for more than 10 minutes (next parameter)','',NULL,0,0,0),(13753,'{13363}=0','MySQL is down','',0,0,2,0,'','',NULL,0,0,0),(13757,'{13368}=0','nova-novncproxy has  down','',0,0,3,0,'','',NULL,0,0,0),(13760,'{13372}=0','openstack ceilometer-agent-notification has down','',0,0,3,0,'','',NULL,0,0,0),(13761,'{13373}=0','openstack ceilometer-collector has down','',0,0,3,0,'','',NULL,0,0,0),(13762,'{13374}<>1','openstack ceilometer-polling has down','',0,0,3,0,'','',NULL,0,0,0),(13763,'{13375}=0','openstack ceilometer-polling has down','',0,0,3,0,'','',NULL,0,0,0),(13764,'{13376}=0','openstack cinder-api has down','',0,0,3,0,'','',NULL,0,0,0),(13765,'{13377}=0','openstack cinder-scheduler has down','',0,0,3,0,'','',NULL,0,0,0),(13766,'{13378}<>1','openstack cinder-volume has down','',0,0,3,0,'','',NULL,0,0,0),(13767,'{13379}>1','Openstack cinder process status','',0,0,3,0,'The service of cinder which is down','',NULL,0,0,0),(13768,'{13380}=0','Openstack compute service cinder volume','',0,0,3,0,'Openstack compute service cinder volume error','',NULL,0,0,0),(13769,'{13381}=0','Openstack compute service libvirtd','',0,0,3,0,'Openstack compute service libvirtd error','',NULL,0,0,0),(13770,'{13382}=0','Openstack compute service neutron l3 agent','',0,0,3,0,'Openstack compute service neutron l3 agent','',NULL,0,0,0),(13771,'{13383}=0','Openstack compute service neutron metadata agent','',0,0,3,0,'Openstack compute service neutron metadata agent error','',NULL,0,0,0),(13772,'{13384}=0','Openstack compute service neutron openvswitch agent','',0,0,3,0,'Openstack compute service neutron openvswitch agent error','',NULL,0,0,0),(13773,'{13385}=0','Openstack compute service nova compute','',0,0,3,0,'Openstack compute service nova compute status','',NULL,0,0,0),(13791,'{13403}=0','openstack glance-api has down','',0,0,3,0,'','',NULL,0,0,0),(13792,'{13404}=0','openstack glance-registry has down','',0,0,3,0,'','',NULL,0,0,0),(13794,'{13406}=0','openstack httpd has down','',0,0,3,0,'','',NULL,0,0,0),(13795,'{13407}=0','openstack httpd has down','',0,0,3,0,'','',NULL,0,0,0),(13796,'{13408}<>1','openstack libvirtd has down','',0,0,3,0,'','',NULL,0,0,0),(13797,'{13409}=0','openstack memcached has down','',0,0,3,0,'','',NULL,0,0,0),(13798,'{13410}=0','openstack mysqld has down','',0,0,3,0,'','',NULL,0,0,0),(13799,'{13411}<>1','openstack neutron-dhcp-agent has down','',0,0,3,0,'','',NULL,0,0,0),(13800,'{13412}=0','openstack neutron-l3-agent has down','',0,0,3,0,'','',NULL,0,0,0),(13801,'{13413}=0','openstack neutron-l3-agent has down','',0,0,3,0,'','',NULL,0,0,0),(13802,'{13414}=0','openstack neutron-lbaasv2-agent has down','',0,0,3,0,'','',NULL,0,0,0),(13803,'{13415}=0','openstack  neutron-metadata-agent has down','',0,0,3,0,'','',NULL,0,0,0),(13804,'{13416}=0','openstack neutron-openvswitch-agent has down','',0,0,3,0,'','',NULL,0,0,0),(13805,'{13417}=0','openstack neutron-openvswitch-agent has down','',0,0,3,0,'','',NULL,0,0,0),(13806,'{13418}=0','openstack neutron-server has down','',0,0,3,0,'','',NULL,0,0,0),(13807,'{13419}>1','Openstack neutron process status','',0,0,3,0,'The service of neutron which is down','',NULL,0,0,0),(13808,'{13420}=0','openstack nova-api has down','',0,0,3,0,'','',NULL,0,0,0),(13809,'{13421}=0','openstack nova-cert has down','',0,0,3,0,'','',NULL,0,0,0),(13810,'{13422}=0','openstack nova-compute has down','',0,0,3,0,'','',NULL,0,0,0),(13811,'{13423}=0','openstack nova-conductor has down','',0,0,3,0,'','',NULL,0,0,0),(13812,'{13424}=0','openstack nova-consoleauth has down','',0,0,3,0,'','',NULL,0,0,0),(13813,'{13425}=0','openstack nova-novncproxy has down','',0,0,3,0,'','',NULL,0,0,0),(13814,'{13426}=0','openstack nova-scheduler has down','',0,0,3,0,'','',NULL,0,0,0),(13815,'{13427}<>1','Openstack nova process status','',0,0,3,0,'The service of nova which is down','',NULL,0,0,0),(13816,'{13428}=0','openstack ntpd has down','',0,0,3,0,'','',NULL,0,0,0),(13817,'{13429}=0','openstack openvswitch has down','',0,0,3,0,'','',NULL,0,0,0),(13818,'{13430}=0','openstack rabbitmq-server has down','',0,0,3,0,'','',NULL,0,0,0),(13819,'{13431}=0','Openstack service haproxy has down','',0,0,3,0,'','',NULL,0,0,0),(13820,'{13432}=0','Openstack service keepalived has down','',0,0,3,0,'','',NULL,0,0,0),(13821,'{13433}=0','openstack xinetd has down','',0,0,3,0,'','',NULL,0,0,0),(13822,'{13434}>5','Processor load is too high on(5min)  {HOST.NAME}','',0,0,2,0,'Processor load is too high (5min)','',NULL,0,0,0),(13823,'{13435}>5','Processor load is too high on (15min){HOST.NAME}','',0,0,2,0,'Processor load is too high(15min)','',NULL,0,0,0),(13824,'{13436}>5','Processor load is too high on {HOST.NAME}','',0,0,2,0,'Processor load is too high （1min）','',NULL,0,0,0),(13825,'{13437}>5','Processor load is too high on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0),(13833,'{13448}=0','SSH service is down on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0),(13840,'{13458}>300','Too many processes on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0),(13845,'{13464}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,0,'Zabbix agent is unreachable for 5 minutes','',NULL,0,0,0),(13846,'{13465}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,0,'Zabbix agent is unreachable for 5 minutes','',NULL,0,0,0),(13847,'{13466}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,0,'Zabbix agent is unreachable for 5 minutes','',NULL,0,0,0),(13848,'({TRIGGER.VALUE}=0 and {13467}>75) or ({TRIGGER.VALUE}=1 and {13467}>65)','Zabbix alerter processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13849,'({TRIGGER.VALUE}=0 and {13468}>75) or ({TRIGGER.VALUE}=1 and {13468}>65)','Zabbix configuration syncer processes more than 75% busy','',0,0,3,0,'Zabbix configuration syncer processes more than 75% busy','',NULL,0,0,0),(13850,'({TRIGGER.VALUE}=0 and {13469}>75) or ({TRIGGER.VALUE}=1 and {13469}>65)','Zabbix configuration syncer processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13851,'({TRIGGER.VALUE}=0 and {13470}>75) or ({TRIGGER.VALUE}=1 and {13470}>65)','Zabbix data sender processes more than 75% busy','',0,0,3,0,'Zabbix data sender processes more than 75% busy','',NULL,0,0,0),(13852,'({TRIGGER.VALUE}=0 and {13471}>75) or ({TRIGGER.VALUE}=1 and {13471}>65)','Zabbix db watchdog processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13853,'({TRIGGER.VALUE}=0 and {13472}>75) or ({TRIGGER.VALUE}=1 and {13472}>65)','Zabbix discoverer processes more than 75% busy','',0,0,3,0,'Zabbix discoverer processes more than 75% busy','',NULL,0,0,0),(13854,'({TRIGGER.VALUE}=0 and {13473}>75) or ({TRIGGER.VALUE}=1 and {13473}>65)','Zabbix discoverer processes more than 75% busy','',1,0,3,0,'','',NULL,0,0,0),(13855,'({TRIGGER.VALUE}=0 and {13474}>75) or ({TRIGGER.VALUE}=1 and {13474}>65)','Zabbix escalator processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13856,'({TRIGGER.VALUE}=0 and {13475}>75) or ({TRIGGER.VALUE}=1 and {13475}>65)','Zabbix heartbeat sender processes more than 75% busy','',0,0,3,0,'Zabbix heartbeat sender processes more than 75% busy','',NULL,0,0,0),(13857,'({TRIGGER.VALUE}=0 and {13476}>75) or ({TRIGGER.VALUE}=1 and {13476}>65)','Zabbix history syncer processes more than 75% busy','',0,0,3,0,'Zabbix history syncer processes more than 75% busy','',NULL,0,0,0),(13858,'({TRIGGER.VALUE}=0 and {13477}>75) or ({TRIGGER.VALUE}=1 and {13477}>65)','Zabbix history syncer processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13859,'({TRIGGER.VALUE}=0 and {13478}>75) or ({TRIGGER.VALUE}=1 and {13478}>65)','Zabbix housekeeper processes more than 75% busy','',0,0,3,0,'Zabbix housekeeper processes more than 75% busy','',NULL,0,0,0),(13860,'({TRIGGER.VALUE}=0 and {13479}>75) or ({TRIGGER.VALUE}=1 and {13479}>65)','Zabbix housekeeper processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13861,'({TRIGGER.VALUE}=0 and {13480}>75) or ({TRIGGER.VALUE}=1 and {13480}>65)','Zabbix http poller processes more than 75% busy','',0,0,3,0,'Zabbix http poller processes more than 75% busy','',NULL,0,0,0),(13862,'({TRIGGER.VALUE}=0 and {13481}>75) or ({TRIGGER.VALUE}=1 and {13481}>65)','Zabbix http poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13863,'({TRIGGER.VALUE}=0 and {13482}>75) or ({TRIGGER.VALUE}=1 and {13482}>65)','Zabbix icmp pinger processes more than 75% busy','',0,0,3,0,'Zabbix icmp pinger processes more than 75% busy','',NULL,0,0,0),(13864,'({TRIGGER.VALUE}=0 and {13483}>75) or ({TRIGGER.VALUE}=1 and {13483}>65)','Zabbix icmp pinger processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13865,'({TRIGGER.VALUE}=0 and {13484}>75) or ({TRIGGER.VALUE}=1 and {13484}>65)','Zabbix ipmi poller processes more than 75% busy','',0,0,3,0,'Zabbix ipmi poller processes more than 75% busy','',NULL,0,0,0),(13866,'({TRIGGER.VALUE}=0 and {13485}>75) or ({TRIGGER.VALUE}=1 and {13485}>65)','Zabbix ipmi poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13867,'({TRIGGER.VALUE}=0 and {13486}>75) or ({TRIGGER.VALUE}=1 and {13486}>65)','Zabbix java poller processes more than 75% busy','',0,0,3,0,'Zabbix java poller processes more than 75% busy','',NULL,0,0,0),(13868,'({TRIGGER.VALUE}=0 and {13487}>75) or ({TRIGGER.VALUE}=1 and {13487}>65)','Zabbix java poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13869,'({TRIGGER.VALUE}=0 and {13488}>75) or ({TRIGGER.VALUE}=1 and {13488}>65)','Zabbix poller processes more than 75% busy','',0,0,3,0,'Zabbix poller processes more than 75% busy','',NULL,0,0,0),(13870,'({TRIGGER.VALUE}=0 and {13489}>75) or ({TRIGGER.VALUE}=1 and {13489}>65)','Zabbix poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13871,'({TRIGGER.VALUE}=0 and {13490}>75) or ({TRIGGER.VALUE}=1 and {13490}>65)','Zabbix proxy poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13872,'({TRIGGER.VALUE}=0 and {13491}>75) or ({TRIGGER.VALUE}=1 and {13491}>65)','Zabbix self-monitoring processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13873,'({TRIGGER.VALUE}=0 and {13492}>75) or ({TRIGGER.VALUE}=1 and {13492}>65)','Zabbix self-monitoring processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13874,'({TRIGGER.VALUE}=0 and {13493}>75) or ({TRIGGER.VALUE}=1 and {13493}>65)','Zabbix snmp trapper processes more than 75% busy','',0,0,3,0,'Zabbix snmp trapper processes more than 75% busy','',NULL,0,0,0),(13875,'({TRIGGER.VALUE}=0 and {13494}>75) or ({TRIGGER.VALUE}=1 and {13494}>65)','Zabbix snmp trapper processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13876,'({TRIGGER.VALUE}=0 and {13495}>75) or ({TRIGGER.VALUE}=1 and {13495}>65)','Zabbix timer processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13877,'({TRIGGER.VALUE}=0 and {13496}>75) or ({TRIGGER.VALUE}=1 and {13496}>65)','Zabbix trapper processes more than 75% busy','',0,0,3,0,'Zabbix trapper processes more than 75% busy','',NULL,0,0,0),(13878,'({TRIGGER.VALUE}=0 and {13497}>75) or ({TRIGGER.VALUE}=1 and {13497}>65)','Zabbix trapper processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13879,'({TRIGGER.VALUE}=0 and {13498}>75) or ({TRIGGER.VALUE}=1 and {13498}>65)','Zabbix unreachable poller processes more than 75% busy','',0,0,3,0,'Zabbix unreachable poller processes more than 75% busy','',NULL,0,0,0),(13880,'({TRIGGER.VALUE}=0 and {13499}>75) or ({TRIGGER.VALUE}=1 and {13499}>65)','Zabbix unreachable poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13881,'{13500}=1','Zabbix value cache working in low memory mode','',0,0,4,0,'','',NULL,0,0,0),(13882,'({TRIGGER.VALUE}=0 and {13501}>75) or ({TRIGGER.VALUE}=1 and {13501}>65)','Zabbix vmware collector processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0),(13883,'{13502}<0','{HOST.NAME} has just been restarted','',0,0,3,0,'Server just been restarted','',NULL,0,0,0),(13884,'{13503}<0','{HOST.NAME} has just been restarted','',0,0,3,0,'','',NULL,0,0,0),(13885,'{13504}<20','Free disk space is less than 20% on volume {#FSNAME}','',0,0,2,0,'Free disk space is less than 20% on volume {#FSNAME}','',NULL,0,0,2),(13886,'{13505}<20','Free inodes is less than 20% on volume {#FSNAME}','',0,0,2,0,'Free inodes is less than 20% on volume {#FSNAME}','',NULL,0,0,2),(13887,'{13506}<20','Free disk space is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2);
/*!40000 ALTER TABLE `triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userid` bigint(20) unsigned NOT NULL,
  `alias` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `surname` varchar(100) NOT NULL DEFAULT '',
  `passwd` char(32) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `autologin` int(11) NOT NULL DEFAULT '0',
  `autologout` int(11) NOT NULL DEFAULT '900',
  `lang` varchar(5) NOT NULL DEFAULT 'en_GB',
  `refresh` int(11) NOT NULL DEFAULT '30',
  `type` int(11) NOT NULL DEFAULT '1',
  `theme` varchar(128) NOT NULL DEFAULT 'default',
  `attempt_failed` int(11) NOT NULL DEFAULT '0',
  `attempt_ip` varchar(39) NOT NULL DEFAULT '',
  `attempt_clock` int(11) NOT NULL DEFAULT '0',
  `rows_per_page` int(11) NOT NULL DEFAULT '50',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `users_1` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','Zabbix','Administrator','5fce1b3e34b520afeffb37ce08c7cd66','',1,0,'en_GB',30,3,'default',0,'',0,50),(2,'guest','','','d41d8cd98f00b204e9800998ecf8427e','',0,900,'en_GB',30,1,'default',0,'',0,50);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_groups` (
  `id` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_groups_1` (`usrgrpid`,`userid`),
  KEY `users_groups_2` (`userid`),
  CONSTRAINT `c_users_groups_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE,
  CONSTRAINT `c_users_groups_1` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
INSERT INTO `users_groups` VALUES (4,7,1),(2,8,2);
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usrgrp`
--

DROP TABLE IF EXISTS `usrgrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usrgrp` (
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `gui_access` int(11) NOT NULL DEFAULT '0',
  `users_status` int(11) NOT NULL DEFAULT '0',
  `debug_mode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`usrgrpid`),
  UNIQUE KEY `usrgrp_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usrgrp`
--

LOCK TABLES `usrgrp` WRITE;
/*!40000 ALTER TABLE `usrgrp` DISABLE KEYS */;
INSERT INTO `usrgrp` VALUES (7,'Zabbix administrators',0,0,0),(8,'Guests',0,0,0),(9,'Disabled',0,1,0),(11,'Enabled debug mode',0,0,1),(12,'No access to the frontend',2,0,0);
/*!40000 ALTER TABLE `usrgrp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valuemaps`
--

DROP TABLE IF EXISTS `valuemaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valuemaps` (
  `valuemapid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`valuemapid`),
  UNIQUE KEY `valuemaps_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valuemaps`
--

LOCK TABLES `valuemaps` WRITE;
/*!40000 ALTER TABLE `valuemaps` DISABLE KEYS */;
INSERT INTO `valuemaps` VALUES (4,'APC Battery Replacement Status'),(5,'APC Battery Status'),(7,'Dell Open Manage System Status'),(2,'Host availability'),(6,'HP Insight System Status'),(17,'HTTP response status code'),(14,'Maintenance status'),(1,'Service state'),(9,'SNMP device status (hrDeviceStatus)'),(11,'SNMP interface status (ifAdminStatus)'),(8,'SNMP interface status (ifOperStatus)'),(15,'Value cache operating mode'),(13,'VMware status'),(12,'VMware VirtualMachinePowerState'),(16,'Windows service startup type'),(3,'Windows service state'),(10,'Zabbix agent ping status');
/*!40000 ALTER TABLE `valuemaps` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-15 11:20:46