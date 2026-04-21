
student(alice).
student(bob).
student(carla).
student(david).
student(eve).

course(math).
course(biology).
course(chemistry).
course(physics).
course(computer_science).

enroll(alice, math).
enroll(alice, physics).
enroll(bob, math).
enroll(bob, chemistry).
enroll(carla, biology).
enroll(carla, chemistry).
enroll(david, physics).
enroll(david, computer_science).
enroll(eve, biology).
enroll(eve, computer_science).

grades(alice, math, 90).
grades(alice, physics, 85).
grades(bob, math, 78).
grades(bob, chemistry, 92).
grades(carla, biology, 88).
grades(carla, chemistry, 95).
grades(david, physics, 80).
grades(david, computer_science, 85).
grades(eve, biology, 92).
grades(eve, computer_science, 98).

math_physics_students(Student) :- 
    enroll(Student, math), 
    enroll(Student, physics).

science_students(Student) :- 
    enroll(Student, Course), 
    member(Course, [biology, chemistry, physics]).

average_grade(Student, Average) :- 
    student(Student), 
    findall(Score, grades(Student, _, Score), Scores), 
    sum_list(Scores, Sum), 
    length(Scores, Count), 
    Average is Sum / Count.

top_student(Student) :- 
    average_grade(Student, Avg1), 
    \+ (average_grade(Student2, Avg2), Avg2 > Avg1).
