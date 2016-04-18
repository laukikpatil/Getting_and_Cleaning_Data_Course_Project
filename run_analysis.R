# Read the test Data Set
test_data <- read.table("./test/X_test.txt")

# Read the test activities
test_activities <- read.table("./test/y_test.txt")

# Read the test Subjects
test_subjects <- read.table("./test/subject_test.txt")

#Merge the test_data
test<-cbind(test_subjects, test_activities, test_data)

# Read the training Data Set
train_data <- read.table("./train/X_train.txt")

# Read the training activities
train_activities <- read.table("./train/y_train.txt")

# Read the training Subjects
train_subjects <- read.table("./train/subject_train.txt")

#Merge the train data
train <- cbind(train_subjects, train_activities, train_data)

# Read the feature names
features <- read.table("features.txt")

# clean up the Feature names
features<-c( "subjects", "activity", gsub("([-(),])","", tolower((features[,2]))))

# Merge the test and train
data <- rbind(test, train)

# Apply the feature names to dataset
colnames(data) <- features

# Create a dataset with Mean and Standard Deviations
m_s_data <- data[,grep("subjects|activity|mean|std", features)]

# Read Activity names
activities <- read.table("activity_labels.txt")
colnames(activities) <- c("activity", "activityname")

# Apply Activity Names to rows.
final_data <- merge(activities, m_s_data)

# Apply Descriptive names to variables
colnames(final_data) <- paste("meanof",colnames(final_data), sep="")

# Create a new tidy dataset average for each variable for each activity for each subject.
tidy_data <- aggregate(final_data[,4:length(colnames(final_data))], 
                       list(subject = final_data$meanofsubjects, 
                            acitvity = final_data$meanofactivityname,
                            activitycode = final_data$meanofactivity  ), mean)
write.table(tidy_data, "sensor_tidy_data.txt", row.name = F)
