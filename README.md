# mominamusic Star Schema Project

This repository contains the implementation of a star schema for the "mominamusic" dataset using MySQL Workbench. The schema is designed to facilitate efficient querying and analysis of music data, including songs, albums, and chart performances.

## Project Overview

The project involves:
- Designing a star schema with a central fact table and multiple dimension tables.
- Running SQL queries to extract insights related to song types, popularity, and artist performance.
- Analyzing and documenting the results.

## Star Schema Design

The star schema consists of:
- **Fact Table:** `fact_table`
- **Dimension Tables:** 
  - `songs`
  - `song_pop`
  - `song_chart`
  - `tracks`
  - `albums`
  - `album_chart`

The relationships between these tables are structured to optimize query performance.

## SQL Queries

The following queries were run on the schema:
1. **Count of Song Types (Solo and Colab)**
   select s.song_type, count(t.song_id) as Song_count
   from fact_table as t
   join songs as s
   on s.song_id = t.song_id
   group by s.song_type;

2. **select year, s.song_name, p.year_end_score**
   from song_pop as p
   join songs as s
   on s.song_id = p.song_id 
   order by year, year_end_score desc
   limit 5;
 
3. **select s.song_name, artists, peak_position, r.rank_score**
   from songs as s
   join song_chart as r 
   on s.song_id = r.song_id
   order by peak_position asc
   limit 5;

4. **select s.song_name,  p.year_end_score**
   from song_pop as p
   join songs as s
   on s.song_id = p.song_id
   where p.year = 2018
   order by year_end_Score desc
   limit 5;

5. **select s.artists, count(s.song_id) as Song_Count**
   from songs as s
   join song_pop as p on s.song_id = p.song_id
   where s.artists = '{''6eUKZXaKkcviH0Ku9w2n3V'': ''Ed Sheeran''}' and p.is_pop = 'True' and year= 2018
   group by s.artists;

## Results and Analysis
Each query provided valuable insights into the dataset:

**Query 1: Analyzed the distribution of solo vs. collaboration songs.**
**Query 2: Identified the top songs with the highest year-end scores across different years.**
**Query 3: Found the songs with the highest chart rankings.**
**Query 4: Listed the most popular songs in 2018.**
**Query 5: Counted the number of popular songs by Ed Sheeran in 2018.**

## Conclusion
This project successfully demonstrates the use of a star schema to efficiently query and analyze a large dataset. The schema design optimized query performance, allowing for detailed analysis of music data. The insights obtained highlight the power of structured database design in extracting meaningful information from complex datasets.

## Installation and Usage
To replicate this project:

**Clone the repository.**
1. Import the SQL scripts into MySQL Workbench.
2. Run the provided queries against the star schema.
