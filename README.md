# Introduction - Data Cleaning

The main objective of this project is to fix any issues with the raw data and to make the data useful for future analysis and visualisation.

# Background

This project was born from a desire to polish my skills on data cleaning, an integral skill required when navigating data analysis.

The data was extracted from the YouTube [Learn SQL Beginner to Advanced course](https://github.com/AlexTheAnalyst/MySQL-YouTube-Series/blob/main/layoffs.csv). The raw data is based on tracking layoffs across diffent countries and industries, and when made useful and analysed should provide insights on various industries, locations and precentages of layoffs.

# Tools used in the project

- **SQL:** The backbone of my analysis, allowing me to query the database and unearth critical insights.
- **MySQL:** The database management system I used to store and process job posting data.
- **Docker**: I utilized Docker to containerize my database environment, ensuring a seamless and reproducible setup.
- **Adminer**: A lightweight database management tool that allowed me to interact with my PostgreSQL database via a simple web interface.
- **Visual Studio Code:** My go-to code editor for writing and executing SQL queries efficiently.
- **Git & GitHub:** Essential for version control, collaboration, and tracking my SQL scripts and analysis.

# Cleaning the Data:

### 1. Importing the dataset

To import the dataset, I copied the cvs file into my Docker container.

```shell
docker cp layoffs.csv world-layoffs-mysql-1:/var/lib/mysql-files/layoffs.csv

```

### 2. Creating empty table in Database

I created a table in the database, wherein I would store the data. You might notice that the Data Types for columns were generic, I used TEXT for most colums to avoid getting errors. For example, if I would have set DATE as a data type for the date colum, I would not be able to insert the data because my batabase has a different format to the standard yyyy-MM-dd format.

```sql
CREATE TABLE layoffs (
    company TEXT,
    location TEXT,
    industry TEXT,
    total_laid_off INT,
    percentage_laid_off TEXT,
    date TEXT,
    stage TEXT,
    country TEXT,
    funds_raised_millions TEXT
);
```

### 3. Inserting data into table

To import the data successfuly, it's important that the column names and order of the table in the database match with those in the raw data.

```sql
LOAD DATA INFILE '/var/lib/mysql-files/layoffs.csv'
INTO TABLE layoffs
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
```
