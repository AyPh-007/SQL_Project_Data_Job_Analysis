# Introduction
Navigate to Folder : [/csv/](/csv/)

**Bold** - Not bold

*This is in italics*
# Background
![Top Paying Roles](assets\image.png)
```sql
-- Code pasted here
WITH skills_demand AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' 
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = True 
    GROUP BY
        skills_dim.skill_id
), 
```
# Introduction
## 1. Top paying jobs
# Introduction
# Introduction
# Introduction
