
create or replace package hr.Employees_Cur_Static_Sql is               /*Enunciando a criação da package (create or replace)*/
  type Last_Names_Tab_t is table of hr.employees.last_name%type      /*Declara o tipo do dado(como se fosse uma struct), bem como de onde seria o "src" dele*/
    index by binary_integer;                                          /*Indexa a listagem por binary_tree */

  function Fetch_All_Rows ( p_department_id in hr.employees.department_id%type )  /*Enuncia a criação de uma função*/
    return Last_Names_Tab_t;                                                      /*Define o tipo de retorno desta função*/

end Employees_Cur_Static_Sql;                                               /*Finaliza a declaração parcial da package(cabeçalho)*/
/
Show Errors

create or replace package body hr.Employees_Cur_Static_Sql is       /*Retoma a declaração da package para definição do contexto da package*/

  function Fetch_All_Rows ( p_department_id in hr.employees.department_id%type )      /*Retoma a função para detalhamento*/
     return Last_Names_Tab_t                                                            /*Retoma o tipo de retorno*/
  is                                                                                /*Início da definição da função*/
    v_last_names_tab Last_Names_Tab_t;                                                 /*Declara uma variável do tipo alocado em Last_Names_Tab_t*/
    cursor c_employees is                                                             /*Define o cursor*/
      select last_name from hr.employees where department_id = p_department_id;         /*Select que retorna o last_name da tambela employees do usr hr
                                                                                            na qual o id do departamento seja o mesmo passado na chamada
                                                                                                da função*/

  begin                                                                         /*Inicia o corpo da função*/
    open c_employees;                                                                       /*Abre o cursor*/
    fetch c_employees bulk collect into v_last_names_tab;  /*Realiza a busca através do cursor no formato da variável 
                                                                de tipo já definido anteriormente(Last_Names_Tab_t), padronizando o tipo*/
    close c_employees;                      /*Fecha o cursor*/
    return v_last_names_tab;                /*Retorna o resultado encontrado*/
  end Fetch_All_Rows;                       /*Finaliza a definição da função*/

end Employees_Cur_Static_Sql;               /*Conclui integralmente a definição da package*/
/                                           /*Executa o comando*/
Show Errors                                 /*Exibe os possíveis erros*/









