select e.*, rank() over(partition by department_id order by salary desc) rnkk
from employees e
qualify rnkk = 1;


show stages;
drop stage stage_new;