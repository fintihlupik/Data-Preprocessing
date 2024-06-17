# Data Preprocessing

# Importing the dataset
dataset = read.csv('Data.csv')
# dataset = dataset[, 2:3]


#Splitting the data into the Training and Test set
#install.packages('caTools')
library('caTools')
set.seed(123)
#primer parametro es y, la variable dependiente,
#segundo el tamaño del training set. devuelve true si va a training set y false si va a test set
split = sample.split(dataset$Purchased, SplitRatio=0.8) 
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling. los salarios y edades tienen que estra en la misma escala
training_set[, 2:3]= scale(training_set[, 2:3]) #las columnas en R empiezan por 1 y no 0. La 1 y 4 no son numericos, ya que eran strings cambiados a vectores
test_set[, 2:3] = scale(test_set[, 2:3])