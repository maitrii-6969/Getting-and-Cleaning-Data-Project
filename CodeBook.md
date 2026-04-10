# Code Book
## Data Source
Human Activity Recognition Using Smartphones Dataset
## Variables
- subject : ID of the subject (1–30)
- activity : Type of activity performed:
  - WALKING
  - WALKING_UPSTAIRS
  - WALKING_DOWNSTAIRS
  - SITTING
  - STANDING
  - LAYING
## Measurements
Only mean and standard deviation variables are included.
Examples:
- tbodyacc_mean_x
- tbodyacc_std_y
- tgravityacc_mean_z
## Transformations
1. Combined train and test datasets
2. Extracted only mean() and std() columns
3. Replaced activity numbers with names
4. Cleaned column names (removed symbols, lowercase)
5. Aggregated data to compute mean for each subject and activity
## Output
Final tidy dataset stored in:
tidy_data.txt
