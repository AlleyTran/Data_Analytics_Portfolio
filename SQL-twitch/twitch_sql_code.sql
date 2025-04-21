/* import table stream.csv */
create table stream (
  time	timestamp,
  device_id	varchar(50),
  login	varchar(50),
  channel	varchar(20),
  country	varchar(3),
  player	varchar(20),
  game	varchar(50),
  stream_format	varchar(50),
  subscriber bool);

copy stream FROM 'C:\Users\bichn\OneDrive\Desktop\sandbox\SQL-twitch\stream.csv' WITH CSV HEADER;

/* Unique games from stream*/
select distinct game from stream;
/* Unique channels from stream*/
select distinct channel from stream;

/* Ranking the most popular games in stream*/
select game, count(*) as number_of_viewers from stream
group by game
order by 2 desc;

/* League of Legends fan base by country*/
select country, count(*) as number_of_viewers from stream
where game = "League of Legends"
group by country
order by 2 desc;

/*Sources of streams*/
select player, count(*) as number_of_viewers from stream
group by player
order by 2 desc;

/*Assign a Genre to each game: Multiplayer Online Battle Arena (MOBA), First Person Shooter (FPS), Survival, and Other.*/
select game,
  case
    when game in ("League of Legends","Dota 2","Heroes of the Storm") then "MOBA"
    when game ="Counter-Strike: Global Offensive" then "FPS"
    when game in ("DayZ","ARK: Survival Evolved") then "Survival"
    else "Other"
  end as "genre"
from stream
group by game
order by genre;

/*Number of views per hour in the US*/
select strftime('%H', time) as hour, count(*) as number_of_views from stream
where country="US"
group by 1;

/* Number of streams between subscriber vs non-subscriber*/
select subscriber, count(*) as num_of_streams from stream
where subscriber is not null
group by 1
order by 2 desc;

/* import table chat.csv */
create table chat (
  time timestamp,
  device_id varchar(50),
  login varchar(50),
  channel varchar(50),
  country varchar(3),
  player varchar(20),
  game varchar(50));

copy chat FROM 'C:\Users\bichn\OneDrive\Desktop\sandbox\SQL-twitch\chat.csv' WITH CSV HEADER;
/* Ranking the most popular games in chat*/
select game, count(*) as number_of_chat from chat
where game is NOT NULL
group by game
order by 2 desc;

/*Device sources of chats*/
select player, count(*) as number_of_viewers from chat
where player is not null
group by player
order by 2 desc;
