-- Duplicate the raw data table, will copy only rows

CREATE TABLE layoffs_staging
LIKE layoffs; 

-- Insert Data in the table
INSERT layoffs_staging
SELECT *
FROM layoffs; 