/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.5.28 : Database - myschooldb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`myschooldb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `myschooldb`;

/*Table structure for table `result` */

DROP TABLE IF EXISTS `result`;

CREATE TABLE `result` (
  `studentNo` int(4) NOT NULL COMMENT '学号',
  `subjectNo` int(4) NOT NULL COMMENT '课程编号',
  `examDate` datetime NOT NULL COMMENT '考试日期',
  `studentResult` int(4) NOT NULL COMMENT '考试成绩',
  PRIMARY KEY (`studentNo`,`subjectNo`,`examDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `result` */

insert  into `result`(`studentNo`,`subjectNo`,`examDate`,`studentResult`) values (10000,1,'2016-02-15 00:00:00',71),(10000,1,'2016-02-17 00:00:00',60),(10001,1,'2016-02-17 00:00:00',46),(10002,1,'2016-02-17 00:00:00',83),(10003,1,'2016-02-17 00:00:00',60),(10004,1,'2016-02-17 00:00:00',60),(10005,1,'2016-02-17 00:00:00',95),(10006,1,'2016-02-17 00:00:00',93),(10007,1,'2016-02-17 00:00:00',23);

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `studentNo` int(4) NOT NULL COMMENT '学号',
  `loginPwd` varchar(20) NOT NULL COMMENT '密码',
  `studentName` varchar(50) NOT NULL COMMENT '学生姓名',
  `sex` char(2) NOT NULL DEFAULT '男' COMMENT '性别',
  `gradeId` int(4) unsigned DEFAULT NULL COMMENT '年级编号',
  `phone` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `bornDate` datetime DEFAULT NULL COMMENT '出生时间',
  `email` varchar(50) DEFAULT NULL COMMENT '邮件账号',
  `identityCard` varchar(18) DEFAULT NULL COMMENT '身份证号码',
  PRIMARY KEY (`studentNo`),
  KEY `index_student_studentName` (`studentName`),
  KEY `index_name_gradeId` (`studentName`,`gradeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`studentNo`,`loginPwd`,`studentName`,`sex`,`gradeId`,`phone`,`address`,`bornDate`,`email`,`identityCard`) values (10000,'123','郭靖','男',1,'13645667783','天津市河西区','1990-09-08 00:00:00',NULL,NULL),(10001,'123','李文才','男',1,'13645667890','地址不详','1994-04-12 00:00:00',NULL,NULL),(10002,'123','李斯文','男',1,'13645556793','河南洛阳','1993-07-23 00:00:00',NULL,NULL),(10003,'123','张萍','女',1,'13642345112','地址不详','1995-06-10 00:00:00',NULL,NULL),(10004,'123','韩秋洁','女',1,'13812344566','北京市海淀区','1995-07-15 00:00:00',NULL,NULL),(10005,'123','张秋丽','女',1,'13567893246','北京市东城区','1994-01-17 00:00:00',NULL,NULL),(10006,'123','肖梅','女',1,'13563456721','河北省石家庄市','1991-02-17 00:00:00',NULL,NULL),(10007,'123','秦洋','男',1,'13056434411','上海市卢湾区','1992-04-18 00:00:00',NULL,NULL),(10008,'123','何睛睛','女',1,'13053445221','广州市天河区','1997-07-23 00:00:00',NULL,NULL),(20000,'123','王宝宝','男',2,'15076552323','地址不详','1996-06-05 00:00:00',NULL,NULL),(20010,'123','何小华','女',2,'13318877954','地址不详','1995-09-10 00:00:00',NULL,NULL),(30011,'123','陈志强','男',3,'13689965430','地址不详','1994-09-27 00:00:00',NULL,NULL),(30012,'123','李露露','女',3,'13685678854','地址不详','1992-09-27 00:00:00',NULL,NULL),(30013,'123','andy','男',NULL,NULL,NULL,NULL,NULL,NULL);

/* Procedure structure for procedure `proc_selectStudent` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_selectStudent` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_selectStudent`()
BEGIN
	SELECT * FROM student;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_test1` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_test1` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_test1`()
BEGIN
	DECLARE myvalue INT  DEFAULT 100;   #定义一个变量myvalue，类型为int，默认值为100；
	declare var1,var2,var3 int;  #定义var1,var2,var3三个整形变量。
	set var1=10,var2=20;    #给var1，var2赋值
	set var3=var1+var2;    #把var1，var2相加的值，赋值给var3
	
	select myvalue,var1,var2,var3;
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_test2` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_test2` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_test2`()
BEGIN
	DECLARE s_studentName varchar(100);  #定义一个字符串类型变量
	declare s_address varchar(1000); #定义一个字符类型变量
	
	#使用select语句给s_studentName和s_address赋值
	select studentName,address into s_studentName,s_address from student where studentNo=10000;
	
	select s_studentName,s_address;
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_test3` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_test3` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_test3`()
BEGIN
#定义"ERROR1148(4200)"错误，名称为command_not_allowed。可以用两种不同的方法来定义。
#方法一：使用sqlstate_value
DECLARE can_not_find CONDITION FOR SQLSTATE '42000' ;
#方法二：
#declare can_not_find condition for 1148;
#定义处理程序1-捕获sqlstate_value
DECLARE CONTINUE HANDLER FOR SQLSTATE '42S02' SET @info='can_not_find'; 
#定义处理程序2-捕获mysql_error_code
#DECLARE CONTINUE HANDLER for 1146 set @info='can_not_find';
#定义处理程序3-先定义条件，然后调用
#DECLARE CONTINUE HANDLER FOR NO_SUCH_TABLE SET @info='ERROR';
#定义处理程序4-使用SQLWARMIMG
#DECLARE CONTINUE HANDLER FOR sqlwarning SET @info='ERROR';
#定义处理程序5-使用NOT FOUND
#DECLARE exit handler for NOT_FOUND SET @info='can_not_find';
#定义处理程序6-使用SQLEXCEPTION
#DECLARE EXIT HANDLER FOR sqlexception SET @info='ERROR';
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_test4` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_test4` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_test4`()
BEGIN
#定义处理程序1-捕获sqlstate_value
DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SET @X2=1;   
set @X=1;
insert into student(studentNo,loginPwd,studentName)values(30013,'123','andy');
set @X=2;
INSERT INTO student(studentNo,loginPwd,studentName)VALUES(30013,'123','jack');
set @X=3;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
