---
title: "CodeBook.md"
output: html_document
---

1. Read the test data from X_test.txt file in folder test
2. Read the test activities from y_test.txt file in folder test
3. Read the test subject data from subject_test.txt file in folder test
4. Column bind the subjects, activities and the data from 3 files.
5. Read the train data from X_train.txt file in folder train
6. Read the train activities from y_train.txt file in folder train
7. Read the train subject data from subject_train.txt file in folder train
8. Column bind the subjects, activities and the data from 3 files.
9. Read the feature names, that is the names of measurements from the features.txt file.
10. Clean up the feature names using the gsub function to remove special characters and convert the names to lowercase using tolower function.
11. Join the test and the train data using rbind function.
12. Apply the festures vector to the complete data set above.
13. Subset the complete dataset to limit only the columns that contain "mean" or "std" in the name.
14. Read the activity_labels.txt file.
15. Give columns names to this dataset
16. Join the activity lables dataset to the dataset with mean and std columns. To get the names of the activities.
17. Apply descriptive names to the variables.
18. Apply the aggregate (mean) function to all variables and group by for subjects and activities.
19. Output the tidy data to file with the rownames suppressed.
