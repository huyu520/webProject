/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.1.49-community : Database - vote
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`vote` /*!40100 DEFAULT CHARACTER SET gbk */;

USE `vote`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `logintime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gbk ROW_FORMAT=REDUNDANT;

/*Data for the table `admin` */

insert  into `admin`(`admin_id`,`name`,`password`,`logintime`) values (4,'admin','1111','2013-08-25 17:49:33');

/*Table structure for table `vote` */

DROP TABLE IF EXISTS `vote`;

CREATE TABLE `vote` (
  `vote_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `createdate` varchar(50) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `publish` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`vote_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gbk ROW_FORMAT=COMPRESSED;

/*Data for the table `vote` */

insert  into `vote`(`vote_id`,`title`,`createdate`,`type`,`publish`,`admin_id`) values (1,'你喜欢的编程语言是？','2013-08-25 17:50:06',1,1,4);

/*Table structure for table `votecontext` */

DROP TABLE IF EXISTS `votecontext`;

CREATE TABLE `votecontext` (
  `votecontext_id` int(11) NOT NULL AUTO_INCREMENT,
  `context` varchar(50) DEFAULT NULL,
  `count` int(11) DEFAULT '0',
  `vote_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`votecontext_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=gbk ROW_FORMAT=REDUNDANT;

/*Data for the table `votecontext` */

insert  into `votecontext`(`votecontext_id`,`context`,`count`,`vote_id`) values (5,'Java语言',34,1),(6,'C#.Net语言',23,1),(7,'PHP语言',12,1);

/*Table structure for table `voter` */

DROP TABLE IF EXISTS `voter`;

CREATE TABLE `voter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vote_id` int(11) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gbk ROW_FORMAT=REDUNDANT;

/*Data for the table `voter` */

insert  into `voter`(`id`,`vote_id`,`ip`) values (2,1,'0:0:0:0:0:0:0:1');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
