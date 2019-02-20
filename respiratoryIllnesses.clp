/*
*@author Arnav Joshi
*@version 12/01/18
*This module is an expert system that tries to determine which respiratory illness a patient had.
*The module asks the user various questions, to which the user is asked to respond with a
*yes, no or ?.  Eventually, the module will either guess the respiratory illness or indicate that it
*is unable to determine which illness the patient has.
*/


(clear)
(reset)

/*
*The start function describes the expert system and gives the user some other important information.
*/
(deffunction start ()
   (printout t "Welcome! This expert system is designed to determine which respiratory illness you have." crlf)
   (printout t crlf)
   (printout t "IMPORTANT: Please note that we are not liable for any misdiagnoses and we recommend making
      all final decisions with the help of a liscensed physician" crlf)
   (printout t crlf)
   (printout t "Please answer the following questions with y, n, or ?" crlf)
   (return)
)

(start)

/*
*This template is used to assert facts describing the relationship between various symptoms
*and illnesses. Slot a indicates the illness, slot b indicates the symptom, and slot c is an
*integer in the range [-10,10] where negative integers demonstrate a negative correlation between
*the symptom and the illness and positive integers demonstrate a positive correlation.
*/
(deftemplate illness (slot a) (slot b) (slot c))

/*
*This template is used to assert whether or not a patient has a particular symptom
*Slot a indicates the symptom. Slot b is "y" , "n" or "?".
*/
(deftemplate symptom (slot a) (slot b))

/*
*This template is used to indicate that the relative values indicating which illness the patient
*is most likely to have need to be adjusted. Slot a indicates the symptom or attribute for which
*the relative values need to be adjusted.
*/
(deftemplate value (slot a))


/*
*The following assertions use the illness template to establish the correlation between all
*symptoms and illnesses. These assertions were created by a python script based on a .csv data database.
*/
(assert (illness (a  asthma) (b  LowFever) (c  -3)))

;as an example, the following assertion indicates that if the patient doesn't have a fever
;he/she is more likely to have asthma as opposed to other respiratory illnesses
(assert (illness (a  asthma) (b  NoFever) (c  6)))

(assert (illness (a  asthma) (b  HighFever ) (c  -8 )))
(assert (illness (a  asthma ) (b  Acute ) (c  -5 )))
(assert (illness (a  asthma ) (b  Chronic ) (c  7 )))
(assert (illness (a  asthma ) (b  NoCough ) (c  -7 )))
(assert (illness (a  asthma ) (b  DryCough ) (c  4 )))
(assert (illness (a  asthma ) (b  WetCough ) (c  -1 )))
(assert (illness (a  asthma ) (b  BloodCough ) (c  -7 )))
(assert (illness (a  asthma ) (b  NoHistory ) (c  -1 )))
(assert (illness (a  asthma ) (b  asthmaHistory ) (c  2 )))
(assert (illness (a  asthma ) (b  CancerHistory ) (c  0 )))
(assert (illness (a  asthma ) (b  NoSinusPain ) (c  0 )))
(assert (illness (a  asthma ) (b  SinusPain ) (c  0 )))
(assert (illness (a  asthma ) (b  NoMucus ) (c  7 )))
(assert (illness (a  asthma ) (b  YellowMucus ) (c  -2 )))
(assert (illness (a  asthma ) (b  GreenMucus ) (c  -5 )))
(assert (illness (a  asthma ) (b  NormalBreathing ) (c  -5 )))
(assert (illness (a  asthma ) (b  Rhonchi ) (c  0 )))
(assert (illness (a  asthma ) (b  Crackles ) (c  0 )))
(assert (illness (a  asthma ) (b  Wheezing ) (c  5 )))
(assert (illness (a  asthma ) (b  Stridor ) (c  0 )))
(assert (illness (a  asthma ) (b  NoHeadache ) (c  3 )))
(assert (illness (a  asthma ) (b  Headache ) (c  0 )))
(assert (illness (a  asthma ) (b  Smoke ) (c  0 )))
(assert (illness (a  asthma ) (b  NoSmoke ) (c  0 )))
(assert (illness (a  copd ) (b  NoFever ) (c  6 )))
(assert (illness (a  copd ) (b  LowFever ) (c  -3 )))
(assert (illness (a  copd) (b  HighFever) (c  -8 )))
(assert (illness (a  copd ) (b  Acute ) (c  -5 )))
(assert (illness (a  copd ) (b  Chronic ) (c  7 )))
(assert (illness (a  copd ) (b  NoCough ) (c  -7 )))
(assert (illness (a  copd ) (b  DryCough ) (c  3 )))
(assert (illness (a  copd ) (b  WetCough ) (c  -1 )))
(assert (illness (a  copd ) (b  BloodCough ) (c  -5 )))
(assert (illness (a  copd ) (b  NoHistory ) (c  -1 )))
(assert (illness (a  copd ) (b  asthmaHistory ) (c  0 )))
(assert (illness (a  copd ) (b  CancerHistory ) (c  0 )))
(assert (illness (a  copd ) (b  NoSinusPain ) (c  0 )))
(assert (illness (a  copd ) (b  SinusPain ) (c  0 )))
(assert (illness (a  copd ) (b  NoMucus ) (c  7 )))
(assert (illness (a  copd ) (b  YellowMucus ) (c  -2 )))
(assert (illness (a  copd ) (b  GreenMucus ) (c  -5 )))
(assert (illness (a  copd ) (b  NormalBreathing ) (c  -5 )))
(assert (illness (a  copd ) (b  Rhonchi ) (c  5 )))
(assert (illness (a  copd ) (b  Crackles ) (c  0 )))
(assert (illness (a  copd ) (b  Wheezing ) (c  5 )))
(assert (illness (a  copd ) (b  Stridor ) (c  0 )))
(assert (illness (a  copd ) (b  NoHeadache ) (c  3 )))
(assert (illness (a  copd ) (b  Headache ) (c  0 )))
(assert (illness (a  copd ) (b  Smoke ) (c  0 )))
(assert (illness (a  copd ) (b  NoSmoke ) (c  0 )))
(assert (illness (a  pneumonia ) (b  NoFever ) (c  -9 )))
(assert (illness (a  pneumonia ) (b  LowFever ) (c  3 )))
(assert (illness (a  pneumonia) (b  HighFever) (c  7 )))
(assert (illness (a  pneumonia ) (b  Acute ) (c  7 )))
(assert (illness (a  pneumonia ) (b  Chronic ) (c  -5 )))
(assert (illness (a  pneumonia ) (b  NoCough ) (c  -6 )))
(assert (illness (a  pneumonia ) (b  DryCough ) (c  -3 )))
(assert (illness (a  pneumonia ) (b  WetCough ) (c  5 )))
(assert (illness (a  pneumonia ) (b  BloodCough ) (c  -7 )))
(assert (illness (a  pneumonia ) (b  NoHistory ) (c  0 )))
(assert (illness (a  pneumonia ) (b  asthmaHistory ) (c  0 )))
(assert (illness (a  pneumonia ) (b  CancerHistory ) (c  0 )))
(assert (illness (a  pneumonia ) (b  NoSinusPain ) (c  -2 )))
(assert (illness (a  pneumonia ) (b  SinusPain ) (c  1 )))
(assert (illness (a  pneumonia ) (b  NoMucus ) (c  -7 )))
(assert (illness (a  pneumonia ) (b  YellowMucus ) (c  1 )))
(assert (illness (a  pneumonia ) (b  GreenMucus ) (c  4 )))
(assert (illness (a  pneumonia ) (b  NormalBreathing ) (c  -3 )))
(assert (illness (a  pneumonia ) (b  Rhonchi ) (c  5 )))
(assert (illness (a  pneumonia ) (b  Crackles ) (c  5 )))
(assert (illness (a  pneumonia ) (b  Wheezing ) (c  2 )))
(assert (illness (a  pneumonia ) (b  Stridor ) (c  0 )))
(assert (illness (a  pneumonia ) (b  NoHeadache ) (c  -3 )))
(assert (illness (a  pneumonia ) (b  Headache ) (c  3 )))
(assert (illness (a  pneumonia ) (b  Smoke ) (c  0 )))
(assert (illness (a  pneumonia ) (b  NoSmoke ) (c  0 )))
(assert (illness (a  bronchitis ) (b  NoFever ) (c  -9 )))
(assert (illness (a  bronchitis ) (b  LowFever ) (c  4 )))
(assert (illness (a  bronchitis) (b  HighFever) (c  6 )))
(assert (illness (a  bronchitis ) (b  Acute ) (c  7 )))
(assert (illness (a  bronchitis ) (b  Chronic ) (c  -5 )))
(assert (illness (a  bronchitis ) (b  NoCough ) (c  -6 )))
(assert (illness (a  bronchitis ) (b  DryCough ) (c  5 )))
(assert (illness (a  bronchitis ) (b  WetCough ) (c  -3 )))
(assert (illness (a  bronchitis ) (b  BloodCough ) (c  -7 )))
(assert (illness (a  bronchitis ) (b  NoHistory ) (c  0 )))
(assert (illness (a  bronchitis ) (b  asthmaHistory ) (c  0 )))
(assert (illness (a  bronchitis ) (b  CancerHistory ) (c  0 )))
(assert (illness (a  bronchitis ) (b  NoSinusPain ) (c  -2 )))
(assert (illness (a  bronchitis ) (b  SinusPain ) (c  1 )))
(assert (illness (a  bronchitis ) (b  NoMucus ) (c  -5 )))
(assert (illness (a  bronchitis ) (b  YellowMucus ) (c  3 )))
(assert (illness (a  bronchitis ) (b  GreenMucus ) (c  2 )))
(assert (illness (a  bronchitis ) (b  NormalBreathing ) (c  -1 )))
(assert (illness (a  bronchitis ) (b  Rhonchi ) (c  5 )))
(assert (illness (a  bronchitis ) (b  Crackles ) (c  5 )))
(assert (illness (a  bronchitis ) (b  Wheezing ) (c  2 )))
(assert (illness (a  bronchitis ) (b  Stridor ) (c  0 )))
(assert (illness (a  bronchitis ) (b  NoHeadache ) (c  -4 )))
(assert (illness (a  bronchitis ) (b  Headache ) (c  4 )))
(assert (illness (a  bronchitis ) (b  Smoke ) (c  0 )))
(assert (illness (a  bronchitis ) (b  NoSmoke ) (c  0 )))
(assert (illness (a  lungCancer ) (b  NoFever ) (c  7 )))
(assert (illness (a  lungCancer ) (b  LowFever ) (c  -6 )))
(assert (illness (a  lungCancer) (b  HighFever) (c  -9 )))
(assert (illness (a  lungCancer ) (b  Acute ) (c  -5 )))
(assert (illness (a  lungCancer ) (b  Chronic ) (c  7 )))
(assert (illness (a  lungCancer ) (b  NoCough ) (c  -5 )))
(assert (illness (a  lungCancer ) (b  DryCough ) (c  -5 )))
(assert (illness (a  lungCancer ) (b  WetCough ) (c  2 )))
(assert (illness (a  lungCancer ) (b  BloodCough ) (c  8 )))
(assert (illness (a  lungCancer ) (b  NoHistory ) (c  -1 )))
(assert (illness (a  lungCancer ) (b  asthmaHistory ) (c  0 )))
(assert (illness (a  lungCancer ) (b  CancerHistory ) (c  2 )))
(assert (illness (a  lungCancer ) (b  NoSinusPain ) (c  0 )))
(assert (illness (a  lungCancer ) (b  SinusPain ) (c  0 )))
(assert (illness (a  lungCancer ) (b  NoMucus ) (c  8 )))
(assert (illness (a  lungCancer ) (b  YellowMucus ) (c  -4 )))
(assert (illness (a  lungCancer ) (b  GreenMucus ) (c  -7 )))
(assert (illness (a  lungCancer ) (b  NormalBreathing ) (c  -5 )))
(assert (illness (a  lungCancer ) (b  Rhonchi ) (c  0 )))
(assert (illness (a  lungCancer ) (b  Crackles ) (c  0 )))
(assert (illness (a  lungCancer ) (b  Wheezing ) (c  3 )))
(assert (illness (a  lungCancer ) (b  Stridor ) (c  3 )))
(assert (illness (a  lungCancer ) (b  NoHeadache ) (c  3 )))
(assert (illness (a  lungCancer ) (b  Headache ) (c  0 )))
(assert (illness (a  lungCancer ) (b  Smoke ) (c  5 )))
(assert (illness (a  lungCancer ) (b  NoSmoke ) (c  -3 )))
(assert (illness (a  tuberculosis ) (b  NoFever ) (c  -9 )))
(assert (illness (a  tuberculosis ) (b  LowFever ) (c  3 )))
(assert (illness (a  tuberculosis) (b  HighFever) (c  5 )))
(assert (illness (a  tuberculosis ) (b  Acute ) (c  7 )))
(assert (illness (a  tuberculosis ) (b  Chronic ) (c  -5 )))
(assert (illness (a  tuberculosis ) (b  NoCough ) (c  -9 )))
(assert (illness (a  tuberculosis ) (b  DryCough ) (c  -7 )))
(assert (illness (a  tuberculosis ) (b  WetCough ) (c  5 )))
(assert (illness (a  tuberculosis ) (b  BloodCough ) (c  8 )))
(assert (illness (a  tuberculosis ) (b  NoHistory ) (c  0 )))
(assert (illness (a  tuberculosis ) (b  asthmaHistory ) (c  0 )))
(assert (illness (a  tuberculosis ) (b  CancerHistory ) (c  0 )))
(assert (illness (a  tuberculosis ) (b  NoSinusPain ) (c  0 )))
(assert (illness (a  tuberculosis ) (b  SinusPain ) (c  0 )))
(assert (illness (a  tuberculosis ) (b  NoMucus ) (c  -7 )))
(assert (illness (a  tuberculosis ) (b  YellowMucus ) (c  1 )))
(assert (illness (a  tuberculosis ) (b  GreenMucus ) (c  4 )))
(assert (illness (a  tuberculosis ) (b  NormalBreathing ) (c  -5 )))
(assert (illness (a  tuberculosis ) (b  Rhonchi ) (c  0 )))
(assert (illness (a  tuberculosis ) (b  Crackles ) (c  0 )))
(assert (illness (a  tuberculosis ) (b  Wheezing ) (c  2 )))
(assert (illness (a  tuberculosis ) (b  Stridor ) (c  0 )))
(assert (illness (a  tuberculosis ) (b  NoHeadache ) (c  -4 )))
(assert (illness (a  tuberculosis ) (b  Headache ) (c  4 )))
(assert (illness (a  tuberculosis ) (b  Smoke ) (c  0 )))
(assert (illness (a  tuberculosis ) (b  NoSmoke ) (c  0 )))
(assert (illness (a  commonCold ) (b  NoFever ) (c  -3 )))
(assert (illness (a  commonCold ) (b  LowFever ) (c  7 )))
(assert (illness (a  commonCold) (b  HighFever) (c  -1 )))
(assert (illness (a  commonCold ) (b  Acute ) (c  8 )))
(assert (illness (a  commonCold ) (b  Chronic ) (c  -6 )))
(assert (illness (a  commonCold ) (b  NoCough ) (c  -6 )))
(assert (illness (a  commonCold ) (b  DryCough ) (c  7 )))
(assert (illness (a  commonCold ) (b  WetCough ) (c  3 )))
(assert (illness (a  commonCold ) (b  BloodCough ) (c  -9 )))
(assert (illness (a  commonCold ) (b  NoHistory ) (c  0 )))
(assert (illness (a  commonCold ) (b  asthmaHistory ) (c  0 )))
(assert (illness (a  commonCold ) (b  CancerHistory ) (c  0 )))
(assert (illness (a  commonCold ) (b  NoSinusPain ) (c  -1 )))
(assert (illness (a  commonCold ) (b  SinusPain ) (c  1 )))
(assert (illness (a  commonCold ) (b  NoMucus ) (c  -3 )))
(assert (illness (a  commonCold ) (b  YellowMucus ) (c  7 )))
(assert (illness (a  commonCold ) (b  GreenMucus ) (c  -1 )))
(assert (illness (a  commonCold ) (b  NormalBreathing ) (c  4 )))
(assert (illness (a  commonCold ) (b  Rhonchi ) (c  0 )))
(assert (illness (a  commonCold ) (b  Crackles ) (c  0 )))
(assert (illness (a  commonCold ) (b  Wheezing ) (c  0 )))
(assert (illness (a  commonCold ) (b  Stridor ) (c  0 )))
(assert (illness (a  commonCold ) (b  NoHeadache ) (c  -5 )))
(assert (illness (a  commonCold ) (b  Headache ) (c  5 )))
(assert (illness (a  commonCold ) (b  Smoke ) (c  0 )))
(assert (illness (a  commonCold ) (b  NoSmoke ) (c  0 )))
(assert (illness (a  influenza ) (b  NoFever ) (c  -9 )))
(assert (illness (a  influenza ) (b  LowFever ) (c  7 )))
(assert (illness (a  influenza) (b  HighFever) (c  0 )))
(assert (illness (a  influenza ) (b  Acute ) (c  8 )))
(assert (illness (a  influenza ) (b  Chronic ) (c  -6 )))
(assert (illness (a  influenza ) (b  NoCough ) (c  -5 )))
(assert (illness (a  influenza ) (b  DryCough ) (c  7 )))
(assert (illness (a  influenza ) (b  WetCough ) (c  3 )))
(assert (illness (a  influenza ) (b  BloodCough ) (c  -9 )))
(assert (illness (a  influenza ) (b  NoHistory ) (c  0 )))
(assert (illness (a  influenza ) (b  asthmaHistory ) (c  0 )))
(assert (illness (a  influenza ) (b  CancerHistory ) (c  0 )))
(assert (illness (a  influenza ) (b  NoSinusPain ) (c  -2 )))
(assert (illness (a  influenza ) (b  SinusPain ) (c  1 )))
(assert (illness (a  influenza ) (b  NoMucus ) (c  -4 )))
(assert (illness (a  influenza ) (b  YellowMucus ) (c  5 )))
(assert (illness (a  influenza ) (b  GreenMucus ) (c  1 )))
(assert (illness (a  influenza ) (b  NormalBreathing ) (c  4 )))
(assert (illness (a  influenza ) (b  Rhonchi ) (c  0 )))
(assert (illness (a  influenza ) (b  Crackles ) (c  0 )))
(assert (illness (a  influenza ) (b  Wheezing ) (c  0 )))
(assert (illness (a  influenza ) (b  Stridor ) (c  0 )))
(assert (illness (a  influenza ) (b  NoHeadache ) (c  -6 )))
(assert (illness (a  influenza ) (b  Headache ) (c  6 )))
(assert (illness (a  influenza ) (b  Smoke ) (c  0 )))
(assert (illness (a  influenza ) (b  NoSmoke ) (c  0 )))
(assert (illness (a  sinusInfection ) (b  NoFever ) (c  -9 )))
(assert (illness (a  sinusInfection ) (b  LowFever ) (c  6 )))
(assert (illness (a  sinusInfection) (b  HighFever) (c  3)))
(assert (illness (a  sinusInfection ) (b  Acute ) (c  7 )))
(assert (illness (a  sinusInfection ) (b  Chronic ) (c  -5 )))
(assert (illness (a  sinusInfection ) (b  NoCough ) (c  -5 )))
(assert (illness (a  sinusInfection ) (b  DryCough ) (c  1 )))
(assert (illness (a  sinusInfection ) (b  WetCough ) (c  1 )))
(assert (illness (a  sinusInfection ) (b  BloodCough ) (c  -9 )))
(assert (illness (a  sinusInfection ) (b  NoHistory ) (c  0 )))
(assert (illness (a  sinusInfection ) (b  asthmaHistory ) (c  0 )))
(assert (illness (a  sinusInfection ) (b  CancerHistory ) (c  0 )))
(assert (illness (a  sinusInfection ) (b  NoSinusPain ) (c  -9 )))
(assert (illness (a  sinusInfection ) (b  SinusPain ) (c  7 )))
(assert (illness (a  sinusInfection ) (b  NoMucus ) (c  -9 )))
(assert (illness (a  sinusInfection ) (b  YellowMucus ) (c  -2 )))
(assert (illness (a  sinusInfection ) (b  GreenMucus ) (c  8 )))
(assert (illness (a  sinusInfection ) (b  NormalBreathing ) (c  5 )))
(assert (illness (a  sinusInfection ) (b  Rhonchi ) (c  0 )))
(assert (illness (a  sinusInfection ) (b  Crackles ) (c  0 )))
(assert (illness (a  sinusInfection ) (b  Wheezing ) (c  0 )))
(assert (illness (a  sinusInfection ) (b  Stridor ) (c  0 )))
(assert (illness (a  sinusInfection ) (b  NoHeadache ) (c  -6 )))
(assert (illness (a  sinusInfection ) (b  Headache ) (c  6 )))
(assert (illness (a  sinusInfection ) (b  Smoke ) (c  0 )))
(assert (illness (a  sinusInfection ) (b  NoSmoke ) (c  0 )))


/*
*These global variables are the cornerstone of this expert system.
*As the expert systems determines various attributes regarding the illness that a patient has,
*the expert systems adjusts these values. In the end, whichever variable has the highest value
*determines the prediction that the expert system makes. Right now, all the variables are set
*to zero because we have no information.
*/
(defglobal ?*asthma* = 0)
(defglobal ?*copd* = 0)
(defglobal ?*pneumonia* = 0)
(defglobal ?*bronchitis* = 0)
(defglobal ?*lungCancer* = 0)
(defglobal ?*tuberculosis* = 0)
(defglobal ?*commonCold* = 0)
(defglobal ?*influenza* = 0)
(defglobal ?*sinusInfection* = 0)


/*****************************************************
*           Rules Asking for Attributes              *
******************************************************
*Note that some of the rules are dependent on each other. For example, if the user indicates that
*he/she does not have a fever, the expert system will not ask if the user specifically has a high fever.
*Additionally, when one of the rules determines an attribute that requires adjustion
*(as defined by the illness assertions above). It asserts that attribute using the "value" template.
*/


(defrule fever
=>
   (bind ?i (illnessAsk "Does the patient have a fever"))
   (assert (symptom (a fever) (b ?i)))
   (if (= (asc ?i) (asc "n")) then
      (assert (value (a noFever)))
   )
)

(defrule highFever
   (symptom (a fever) (b "y"))
=>
   (bind ?i (illnessAsk "Is the patient's fever a high fever (above 102 degrees Farenheit)"))
   (if (= (asc ?i) (asc "n")) then
      (assert (value (a LowFever)))
   else
      (if (= (asc ?i) (asc "y")) then
         (assert (value (a HighFever)))
      )
   )
)

(defrule acute
=>
   (bind ?i (illnessAsk "Have the symptoms lasted for less than 2 weeks"))
   (if (= (asc ?i) (asc "n")) then
      (assert (value (a Chronic)))
   else
      (if (= (asc ?i) (asc "y")) then
         (assert (value (a Acute)))
      )
   )
)

(defrule cough
=>
   (bind ?i (illnessAsk "Does the patient have a cough"))
   (assert (symptom (a cough) (b ?i)))
   (if (= (asc ?i) (asc "n")) then
      (assert (value (a NoCough)))
   )
)

(defrule wetCough
   (symptom (a cough) (b "y"))
=>
   (bind ?i (illnessAsk "Does the patient have a wet cough"))
   (if (= (asc ?i) (asc "y")) then
      (assert (value (a WetCough)))
   )
)

(defrule dryCough
   (symptom (a cough) (b "y"))
=>
   (bind ?i (illnessAsk "Does the patient have a dry cough"))
   (if (= (asc ?i) (asc "y")) then
      (assert (value (a DryCough)))
   )
)

(defrule bloodCough
   (symptom (a cough) (b "y"))
=>
   (bind ?i (illnessAsk "Is the patient coughing up blood"))
   (if (= (asc ?i) (asc "y")) then
      (assert (value (a BloodCough)))
   )
)

(defrule history
=>
   (bind ?i (illnessAsk "Does the patient have a family history of respiratory illnesses"))
   (assert (symptom (a history) (b ?i)))
   (if (= (asc ?i) (asc "n")) then
      (assert (value (a NoHistory)))
   )
)

(defrule asthmaHistory
   (symptom (a history) (b "y"))
=>
   (bind ?i (illnessAsk "Does the patient have a family history of asthma"))
   (if (= (asc ?i) (asc "y")) then
      (assert (value (a asthmaHistory)))
   )
)

(defrule cancerHistory
   (symptom (a history) (b "y"))
=>
   (bind ?i (illnessAsk "Does the patient have a family history of lung cancer"))
   (if (= (asc ?i) (asc "y")) then
      (assert (value (a CancerHistory)))
   )
)

(defrule sinus
=>
   (bind ?i (illnessAsk "Does the patient have sinus pain"))
   (if (= (asc ?i) (asc "n")) then
      (assert (value (a NoSinusPain)))
   else
      (if (= (asc ?i) (asc "y")) then
         (assert (value (a SinusPain)))
      )
   )
)

(defrule mucus
=>
   (bind ?i (illnessAsk "Does the patient have mucus"))
   (assert (symptom (a mucus) (b ?i)))
   (if (= (asc ?i) (asc "n")) then
      (assert (value (a NoMucus)))
   )
)

(defrule yellowMucus
   (symptom (a mucus) (b "y"))
=>
   (bind ?i (illnessAsk "Does the patient have yellow mucus"))
   (if (= (asc ?i) (asc "y")) then
      (assert (value (a YellowMucus)))
   )
)

(defrule greenMucus
   (symptom (a mucus) (b "y"))
=>
   (bind ?i (illnessAsk "Does the patient have green mucus"))
   (if (= (asc ?i) (asc "y")) then
      (assert (value (a GreenMucus)))
   )
)

(defrule normalBreathing
=>
   (bind ?i (illnessAsk "Do the patient's lungs sound normal"))
   (assert (symptom (a normalBreathing) (b ?i)))
   (if (= (asc ?i) (asc "y")) then
      (assert (value (a NormalBreathing)))
   )
)

(defrule rhonchi
   (symptom (a normalBreathing) (b "n"))
=>
   (bind ?i (illnessAsk "Do you hear rhonchi in the patient's lungs"))
   (if (= (asc ?i) (asc "y")) then
      (assert (value (a Rhonchi)))
   )
)

(defrule crackles
   (symptom (a normalBreathing) (b "n"))
=>
   (bind ?i (illnessAsk "Do you hear crackles in the patient's lungs"))
   (if (= (asc ?i) (asc "y")) then
      (assert (value (a Crackles)))
   )
)

(defrule wheezing
   (symptom (a normalBreathing) (b "n"))
=>
   (bind ?i (illnessAsk "Do you hear wheezing in the patient's lungs"))
   (if (= (asc ?i) (asc "y")) then
      (assert (value (a Wheezing)))
   )
)

(defrule stridor
   (symptom (a normalBreathing) (b "n"))
=>
   (bind ?i (illnessAsk "Do you hear stridor in the patient's lungs"))
   (if (= (asc ?i) (asc "y")) then
      (assert (value (a Stridor)))
   )
)

(defrule headache
=>
   (bind ?i (illnessAsk "Does the patient have a headache"))
   (if (= (asc ?i) (asc "y")) then
      (assert (value (a Headache)))
   else
      (if (= (asc ?i) (asc "n")) then
         (assert (value (a NoHeadache)))
      )
   )
)

(defrule smoke
=>
   (bind ?i (illnessAsk "Does the patient have a history of smoking"))
   (if (= (asc ?i) (asc "y")) then
      (assert (value (a Smoke)))
   else
      (if (= (asc ?i) (asc "n")) then
         (assert (value (a NoSmoke)))
      )
   )
)


/***************************************
* Extra rules to run the expert system *
***************************************/

/*
*If there is a fact of type value in the knowledge base, that means that the illness values
*need to be adjusted for some attribute. Thus, we use the illness assertions in the knowledge
*base to determine the amount by which each illness value needs to be adjusted. Then, we
*must retract the fact of type value, and adjust the illness constants as necessary.
*/
(defrule adjust
   ?f1 <- (value (a ?n))
   (illness (a asthma) (b ?n) (c ?as))
   (illness (a copd) (b ?n) (c ?co))
   (illness (a pneumonia) (b ?n) (c ?pn))
   (illness (a bronchitis) (b ?n) (c ?br))
   (illness (a lungCancer) (b ?n) (c ?lu))
   (illness (a tuberculosis) (b ?n) (c ?tu))
   (illness (a commonCold) (b ?n) (c ?com))
   (illness (a influenza) (b ?n) (c ?in))
   (illness (a sinusInfection) (b ?n) (c ?si))
=>
   (retract ?f1)
   (bind ?*asthma* (+ ?*asthma* ?as))
   (bind ?*copd* (+ ?*copd* ?co))
   (bind ?*pneumonia* (+ ?*pneumonia* ?pn))
   (bind ?*bronchitis* (+ ?*bronchitis* ?br))
   (bind ?*lungCancer* (+ ?*lungCancer* ?lu))
   (bind ?*tuberculosis* (+ ?*tuberculosis* ?tu))
   (bind ?*commonCold* (+ ?*commonCold* ?com))
   (bind ?*influenza* (+ ?*influenza* ?in))
   (bind ?*sinusInfection* (+ ?*sinusInfection* ?si))
)

/*
*This rule goes through each of the global variables and finds the one with the highest value.
*Then, the system prints that the patient has this illness. For example, if ?*asthma* is the highest,
*the system will print that the patient has asthma. If, however, the highest global variable is
*less than or equal to zero, the system indicates that there isnt enough information to make a proper
*prediction.
*/
(defrule finish "fires when there are no other rules left"
   (declare (salience -100))
=>
   (bind ?max ?*asthma*)
   (bind ?output "asthma")

   
   (if (> ?*copd* ?max) then
      (bind ?max ?*copd*)
      (bind ?output "copd")
   )
   
   (if (> ?*pneumonia* ?max) then
      (bind ?max ?*pneumonia*)
      (bind ?output "pneumonia")
   )
   
   (if (> ?*bronchitis* ?max) then
      (bind ?max ?*bronchitis*)
      (bind ?output "bronchitis")
   )
   
   (if (> ?*lungCancer* ?max) then
      (bind ?max ?*lungCancer*)
      (bind ?output "Lung Cancer")
   )
   
   (if (> ?*tuberculosis* ?max) then
      (bind ?max ?*tuberculosis*)
      (bind ?output "tuberculosis")
   )
   
   (if (> ?*commonCold* ?max) then
      (bind ?max ?*commonCold*)
      (bind ?output "Common Cold")
   )
   
   (if (> ?*influenza* ?max) then
      (bind ?max ?*influenza*)
      (bind ?output "influenza")
   )
   
   (if (> ?*sinusInfection* ?max) then
      (bind ?max ?*sinusInfection*)
      (bind ?output "Sinus Infection")
   )
   (printout t crlf)
   
   ;the following if statement ensures that we know enough about the illnesses to actually make a valid diagnosis.
   ;In this case, confidence regarding the diagnosis is defined as a max value above 0. Using the value of 0 will always be correct.
   (if (> ?max 0) then
      (printout t "We have determined that the patient is afflicted with " ?output crlf)
   else
      (printout t "Unfortunately, we cannot determine the illness that the patient is afflicted with" crlf)
   
   )

);defrule finish



/*************************************
* Functions needed for expert system *
*************************************/




;This function prompts the user for something. Automatically adds "?"
;Takes only the first token
(deffunction ask (?prompt)
   (printout t ?prompt "? ")
   (bind ?response (read))
   (return ?response)
)

/*
*illnessAsk takes in a question regarding symptoms and ultimately returns "y" "n" or "?"
*depending on the user. The illnessAsk function repeatedly uses the ask function to prompt the user
*until the user inputs a valid answer (a word beginning with "y" "n" or "?"). To determine if
*the user has inputted a valid input, illnessAsk uses the validAsk function.
*/
(deffunction illnessAsk (?question)
   (bind ?i (ask ?question))
   (bind ?i (sub-string 1 1 ?i))
   (bind ?i (lowcase ?i))
   (while (not (validAsk ?i))
      (printout t "Sorry, please enter y,n, or ?" crlf)
      (bind ?i (ask ?question))
      (bind ?i (sub-string 1 1 ?i))
      (bind ?i (lowcase ?i))
   )
   (return ?i)
)



/*
*Simply takes in a value and determines if that value is a string representing "y" "n" or "?"
*/
(deffunction validAsk (?i)
   (return (or (or (= (asc ?i) (asc "y"))
   (= (asc ?i) (asc "n")))(= (asc ?i) (asc "?"))))
)

(run)
