use mominamusic;

create table fact_table as 
select song_id, album_id from tracks
;

##Query1: Count for the song type Solo and Colab
select s.song_type, count(t.song_id) as Song_count
from fact_table as t
join songs as s
on
s.song_id = t.song_id
group by s.song_type;


#Query2: Song names of TOP 5 Highest Year end score 
select year,s.song_name, p.year_end_score
from song_pop as p
join songs as s
on
s.song_id = p.song_id 
order by year, year_end_score desc
limit 5; 

##Query3: 5 song names of the Highest rank
select s.song_name, artists, peak_position, r.rank_score
from songs as s
join song_chart as r 
on 
s.song_id = r.song_id
order by peak_position asc
limit 5; 


##Query4: Top 5 most popular songs with highest year end score in 2018. 
select s.song_name,  p.year_end_score
from song_pop as p
join songs as s
on
s.song_id = p.song_id
where p.year = 2018
order by year_end_Score desc
limit 5;



##Query5: Total Number of Popular Songs for Ed Sheeran in 2018
select s.artists, count(s.song_id) as Song_Count
from songs as s
join song_pop as p on s.song_id = p.song_id
where s.artists = '{''6eUKZXaKkcviH0Ku9w2n3V'': ''Ed Sheeran''}'
and p.is_pop = 'True' and year= 2018
group by s.artists;