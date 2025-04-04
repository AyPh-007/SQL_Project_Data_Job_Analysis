/*
Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data analysis
*/

-- Identifies skills in high demand for Data Analyst roles
-- Use Query #3

WITH skills_demand AS(
        SELECT 
            skills,
            skills_dim.skill_id,
            COUNT (skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Data Analyst' AND job_work_from_home = TRUE
                                         AND salary_year_avg IS NOT NULL
    GROUP BY skills_dim.skill_id
),
-- Skills with high average salaries for Data Analyst roles
-- Use Query #4

 average_szalary AS (
SELECT 
        skills_job_dim.skill_id,
        ROUND(AVG(salary_year_avg),2) AS salary_yr_avg
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL
AND job_work_from_home = TRUE
GROUP BY skills_job_dim.skill_id
)

-- Return high demand and high salaries for 10 skills 
SELECT
        skills_demand.skill_id,
        skills_demand.skills,
        demand_count,
        salary_yr_avg
FROM skills_demand
INNER JOIN average_szalary ON average_szalary.skill_id = skills_demand.skill_id
WHERE demand_count > 10
ORDER BY salary_yr_avg DESC,
         demand_count DESC
        
LIMIT 25

-- rewriting this same query more concisely