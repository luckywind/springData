#运行
运行之前，需要先创建test库 和people表
create table people (
id serial not null primary key,
first_name varchar(20) not null,
last_name varchar(20) not null,
age integer not null
);

insert into people (id, first_name, last_name, age) values
(1, 'Vlad', 'Boyarskiy', 21),
(2,'Oksi', ' Bahatskaya', 30),
(3,'Vadim', ' Vadimich', 32);
#部署方式
用Java类配置Spring MVC(不通过web.xml和XML方式)
直接执行deploy.sh脚本
##参考
https://www.journaldev.com/17034/spring-data-jpa#spring-configuration-classes
https://www.cnblogs.com/chry/p/6239510.html