create table departments (
  departments_id int primary key auto_increment not null,
  name varchar(20) not null,
  create_at timestamp default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp
);

第２問
alter table people add departments_id int unsigned after email;

第３問
insert into departments(name)
values
  ('営業'),
  ('開発'),
  ('経理'),
  ('人事'),
  ('情報システム');

insert into people(name,departments_id,age,gender)
values
('山田たかお',1,32,1),
('高橋こうじ',1,24,1),
('増田きよみ',1,54,2),
('山本ゆうた',2,28,1),
('西川さとみ',2,34,2),
('中山さとる',2,26,1),
('吉本ひでお',2,56,1),
('秋山かえで',3,28,2),
('森本こうたろう',4,49,1),
('吉田あきら',5,29,1);

insert into reports(person_id,content)
values
(11,'牛タン定食にはとろろが付き物'),
(15,'今日はお金がなくて昼飯抜きでした'),
(12,'ラーメンは家系しか勝たん！！'),
(14,'ヤサイマシマシニンニクマシアブラカラメ'),
(13,'お腹がすいたらスニッカーズ'),
(10,'お弁当持ってきたのにお箸忘れました'),
(8,'今日は山田さんとランチに行きました'),
(6,'増田さんの食べる量すごかったです'),
(11,'ライス大盛り無料の店、最近減ったなぁ'),
(15,'ジャムパン1個で乗り切れるだろうか');

第４問
update people set departments_id = 2 where person_id = 1;
update people set departments_id = 1 where person_id = 2;
update people set departments_id = 4 where person_id = 3;
update people set departments_id = 5 where person_id = 4;
update people set departments_id = 3 where person_id = 5;

第５問
select * from people where gender = 1 order by age desc;

第６問
peopleテーブルの中で部門idが1の人をname,email,ageのカラムで絞り作成順で表示する

第７問
select * from people where (age between 20 and 29) and gender = 2 or (age between 40 and 49) and gender = 1;

第８問
select * from people where departments_id = 1 order by age asc;

第９問
select *, avg(age) as average_age from people group by gender = 2 and departments_id = 2; 

第１０問
select p.name, d.name, r.content from people p 
inner join departments d on p.departments_id = d.departments_id
inner join reports r on p.person_id = r.person_id;

第１１問
select p.person_id, p.name, r.content from people p left outer join 
reports r using (person_id) where content is null;
