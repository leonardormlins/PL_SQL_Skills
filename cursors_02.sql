set serveroutput on;

create or replace procedure hr.Show_Rows_For_Dept_Static_Sql (
  p_department_id in hr.employees.department_id%type ) is


  v_last_names_tab hr.Employees_Cur_Static_Sql.Last_Names_Tab_t;

begin
  v_last_names_tab := hr.Employees_Cur_Static_Sql.Fetch_All_Rows ( p_department_id );

  for j in v_last_names_tab.First..v_last_names_tab.Last
  loop
    Dbms_Output.Put_Line ( v_last_names_tab(j) );
  end loop;

end Show_Rows_For_Dept_Static_Sql;
/
Show Errors

