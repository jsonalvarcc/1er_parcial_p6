select 
    p.cod_persona,
    p.nombre,
    p.apellidos,
    p.ci,
    COUNT(c.cod_persona) AS cant_catastros,
    SUM(case when left(c.codigo_catastral, 1) = '1' then 1 else 0 end) AS alto,
    SUM(case when left(c.codigo_catastral, 1) = '2' then 1 else 0 end) AS medio,
    SUM(case when left(c.codigo_catastral, 1) = '3' then 1 else 0 end) AS bajo
from 
    persona p
left join 
    catastro c on p.cod_persona = c.cod_persona
group by 
    p.cod_persona, p.nombre, p.apellidos, p.ci
ORDER by 
    p.cod_persona;
