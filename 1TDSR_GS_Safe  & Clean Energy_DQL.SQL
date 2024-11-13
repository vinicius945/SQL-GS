--Vinicius Prates Altafini RM559183
--Lucas Resende Lima RM 556564
--Enzo Prado Soddano RM557937


--Primeira Questão
SELECT 
    tf.nome AS nome_tipo_fonte, 
    COUNT(ps.id_projeto) AS quantidade_projetos
FROM 
    PF0645.tipo_fontes tf
JOIN 
    PF0645.projetos_sustentaveis ps ON tf.id_tipo_fonte = ps.id_tipo_fonte
GROUP BY 
    tf.nome
HAVING 
    COUNT(ps.id_projeto) > 2
ORDER BY 
    tf.nome;
    

-- Segunda Questão

SELECT 
    ps.id_projeto AS id_projeto, 
    ps.descricao AS descricao, 
    ps.custo AS custo
FROM 
    PF0645.projetos_sustentaveis ps
JOIN 
    PF0645.tipo_fontes tf ON ps.id_tipo_fonte = tf.id_tipo_fonte
WHERE 
    tf.nome IN ('Solar', 'Eólica')
ORDER BY 
    ps.descricao ASC;

-- Terceira Questão

SELECT 
    ps.id_projeto AS id_projeto, 
    ps.descricao AS descricao, 
    ps.status AS status
FROM 
    PF0645.projetos_sustentaveis ps
WHERE 
    ps.custo > 500000
    AND ps.status = 'Em andamento'
ORDER BY 
    ps.id_projeto ASC;
    
--Quarta questão

SELECT 
    r.nome AS nome_regiao, 
    ROUND(AVG(p.custo), 2) AS media_custo
FROM 
    PF0645.regioes_sustentaveis r
JOIN 
    PF0645.projetos_sustentaveis p ON r.id_regiao = p.id_regiao
GROUP BY 
    r.nome
ORDER BY 
    media_custo DESC;
    
--Quinta Questão

SELECT
    r.nome AS nome_regiao,
    tf.nome AS tipo_fonte,
    COUNT(ps.id_projeto) AS quantidade_total_projetos,
    ROUND(AVG(ec.emissao), 2) AS media_emissao_carbono
FROM
    PF0645.projetos_sustentaveis ps
JOIN
    PF0645.regioes_sustentaveis r ON ps.id_regiao = r.id_regiao
JOIN
    PF0645.tipo_fontes tf ON ps.id_tipo_fonte = tf.id_tipo_fonte
JOIN
    PF0645.emissoes_carbono ec ON tf.id_tipo_fonte = ec.id_tipo_fonte
GROUP BY
    r.nome,
    tf.nome
HAVING
    AVG(ec.emissao) > 5000
ORDER BY
    r.nome ASC,
    tf.nome ASC;