<%@page import="produtos.modelo.Produto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<script type="text/javascript" src="<c:url value="/js/jquery.js"/>"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		function removeProduto(id){
			$("#mensagem").load('<c:url value="/produto/remove"/>' + '?produto.id=' + id);
			$("#produto" + id).remove();
		}
	</script>

	<h1>Produtos</h1>
	<div id="mensagem"></div>
	
	<fmt:message key="mensagem.bemvindo" />
	
	
	<table width="100%">
		<tr>
			<td width="20%">Nome</td>
			<td>Preco</td>
			<td>Descricao</td>
			<td>Data de Inicio da Venda</td>
			<td>Usado?</td>
			<td width="20%">Remover?</td>
			<td>No.</td>
		</tr>

		<c:forEach var="p" items="${produtoList}" varStatus="st">
			<tr id="produto${p.getId()}">
				<td>${p.nome.toUpperCase()}</td>
				<td>
					<fmt:formatNumber value="${p.getPreco()}" type="currency"/>
				</td>
				<td>${p.getDescricao()}</td>
				<td>
					<fmt:formatDate value="${p.getDataInicioVenda().getTime()}"	pattern="EEEE, dd 'de' MMMM 'de' yyyy" />
				</td>
				<!-- <td>${p.getDataInicioVenda().getTime()}</td> -->


				<!-- FORMA UTILIZANDO A TAGLIB IF
				<c:if test="${p.usado}">
					<td> SIM </td>
				</c:if>
				<c:if test="${not p.usado}">
					<td> NÃO </td>
				</c:if>-->

				<!-- FORMA UTILIZANDO A TAGLIB 'choose' 'when' e 'otherwise' -->
				<c:choose>
					<c:when test="${p.usado}">
						<td>SIM</td>
					</c:when>
					<c:otherwise>
						<td>NÃO</td>
					</c:otherwise>
				</c:choose>

				<td><a href="#" onclick="return removeProduto(${p.getId()})">Remover</a></td>
				<td>${st.count}</td>
			</tr>
		</c:forEach>
		
	</table>

	<c:url value="/produto/formulario" var="adiciona">
	</c:url>
	<a href="${adiciona}"> 
		<fmt:message key="mensagem.novoProduto"/>
	</a>

	<!-- EXEMPLO DE ATRIBUIÇÃO E IMPRESSÃO NA TELA COM TAGLLIB SET E OUT 
	<c:set var="nome" value="João da Silva" />
	<c:out value="${nome}" />
	-->
	
	<c:import url="../_comum/rodape.jsp"/>
	
	
</body>
</html>