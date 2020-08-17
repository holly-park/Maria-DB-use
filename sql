-테이블 만들기
create table member(
ember_id varchar(50) not null,
password varchar(50) not null,
username varchar(50) not null,
phone varchar(20),
Email varchar(40),
wdate date
);

INSERT INTO member(member_id, PASSWORD, username, wdate) VALUE('test1', '1234', '홍길동', NOW());
INSERT INTO member(member_id, PASSWORD, username, wdate) VALUE('test1', '1234', '임꺽정', NOW());
ALTER TABLE member ADD CONSTRAINT PK_MEMBER PRIMARY KEY(member_id);

-데이터삭제
delete from member where username='임꺽정';

--기본키
alter table member add constraint PK_MEMBER primary key(member_id);



INSERT INTO member(member_id, PASSWORD, username, wdate) VALUE('test2', '1234', '임꺽정', NOW());
INSERT INTO member(member_id, PASSWORD, username, wdate) VALUE('test3', '1234', '장길산', NOW());
INSERT INTO member(member_id, PASSWORD, username, wdate) VALUE('test4', '1234', '홍명희', NOW());

-확인
select * from member; 이것은 밑에와 같음
=(select member_id, password from member;)

guestbook 테이블에 writer 필드랑 member_id를 연결
회원게시판

--게스트북 데이터 완전히 지우기
delete from guestbook;

member 테이블을 guestbook테이블이 참조한다(FK_GUEST_MUMBER라고 하겠음 FK는 외래키라는거)
제약조건 이름: FK_GUEST_MEMBER
--게스트북의 writer필드가 member테이블의 member_id를 참조
alter table guestbook add constraint FK_GUEST_MUMBER foreign key(writer) references member (member_id);

insert into guestbook(title, writer, wdate, contents) values('제목1', 'test1', now(), '내용1');
insert into guestbook(title, writer, wdate, contents) values('제목2', 'user01', now(), '내용1');  ->foreign키 위배


----사원정보: 번호, 이름, 급여, 입사일, 보너스, 부서번호
create table emp(empno int(10)not null, 
                 ename varchar(40) not null,
                 sal number(10),
                 hiredate date,
                 comm int(10),
                 deptno char(2),
                 primary key(empno)
);

insert into emp(empno, ename, sal, hiredate, comm, deptno) values(100, '최영숙', 6600, '2012-01-01', 500, 10);
insert into emp(empno, ename, sal, hiredate, comm, deptno) values(100, '박지민', 4000, '2019-02-01', NULL, 20);
insert into emp(empno, ename, sal, hiredate, comm, deptno) values(100, '백지현', 5000, '2017-03-04', NULL, 30);
insert into emp(empno, ename, sal, hiredate, comm, deptno) values(100, '최경수', 4700, '2012-01-01', 500, 10);
insert into emp(empno, ename, sal, hiredate, comm, deptno) values(100, '이근희', 5200, '2013-01-01', 1000, 20);

create table dpart(deptno int(3) not null,
                   dname varchar(20) not null,
                   primary key(deptno));

insert into dpart values(10, '마케팅');
insert into dpart values(20, '기획팀');
insert into dpart values(30, '개발팀');
insert into dpart values(40, '운영팀');

emp 테이블의 deptno가 dpart 테이블의 deptno를 참조
alter table emp add constraint FK_EMP_DPART foreign key(deptno) references dpart (deptno);