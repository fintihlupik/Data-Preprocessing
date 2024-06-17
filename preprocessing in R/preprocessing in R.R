dataset = read.csv('Data.csv')

# Missing data
dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age, FUN = function(x) mean(x,na.rm = TRUE)),
                     dataset$Age)
dataset$Salary = ifelse(is.na(dataset$Salary),
                     ave(dataset$Salary, FUN = function(x) mean(x,na.rm = TRUE)),
                     dataset$Salary)

# Categorical data
dataset$Country = factor(dataset$Country, levels = c('France', 'Spain', 'Germany'),
                         labels = c(1, 2, 3))

dataset$Purchased = factor(dataset$Purchased, levels = c('No', 'Yes'),
                         labels = c(0, 1))

#install.packages('caTools')
#library('caTools')


set.seed(123)
#primer parametro es y, la variable dependiente,
#segundo el tamaño del training set. devuelve true si va a training set y false si va a test set
split = sample.split(dataset$Purchased, SplitRatio=0.8) 
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling. los salarios y edades tienen que estra en la misma escala
training_set[, 2:3]= scale(training_set[, 2:3]) #las columnas en R empiezan por 1 y no 0. La 1 y 4 no son numericos, ya que eran strings cambiados a vectores
test_set[, 2:3] = scale(test_set[, 2:3])
