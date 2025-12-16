REPORT zemp_details.

TABLES: zmk_emp.

TYPES: BEGIN OF ty_emp,
         empid      TYPE zmk_emp-zempid,
         name       TYPE zmk_emp-zname,
         age        TYPE zmk_emp-zage,
         gender     TYPE zmk_emp-zgender,
         salary     TYPE zmk_emp-zsalary,
         sal_unit   TYPE zmk_emp-zsal_unit,
       END OF ty_emp.

DATA: gt_emp TYPE TABLE OF ty_emp,
      gs_emp TYPE ty_emp.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE text-001.
PARAMETERS: p_empid TYPE zmk_emp-zempid.
SELECTION-SCREEN END OF BLOCK b1.

START-OF-SELECTION.

SELECT zempid
       zname
       zage
       zgender
       zsalary
       zsal_unit
  FROM zmk_emp
  INTO TABLE gt_emp
  WHERE zempid = p_empid.

LOOP AT gt_emp INTO gs_emp.
  WRITE: / 'Employee ID :', gs_emp-empid,
         / 'Name        :', gs_emp-name,
         / 'Age         :', gs_emp-age,
         / 'Gender      :', gs_emp-gender,
         / 'Salary      :', gs_emp-salary,
         / 'Currency    :', gs_emp-sal_unit.
  SKIP.
ENDLOOP.
