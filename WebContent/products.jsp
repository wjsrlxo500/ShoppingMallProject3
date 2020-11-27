<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>

<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" integrity ="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1f784/j6cY/iJTQUOhcwr7x9JvoRxT2MZw17" crossorigin="anonymous">
<title>상품 목록</title>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jubotron">
		<div class="container">
			<h1 class="display-3">상품목록</h1>
	</div>
	</div>
	<%
		ProductRepository dao = ProductRepository.getInstance();	
		ArrayList<Product> listOfProducts = dao.getAllProducts();
	%>
	<div class="containe">
		<div class="row" align="center">
			<%
				for(int i=0; i<listOfProducts.size(); i++) {
					Product product = listOfProducts.get(i);
				
			%>
				<div class="col-md-4">
					<img src="./resources/images/<%=product.getFilename() %>" style="width:100%">
					<h3><%=product.getPname() %></h3>
					<p><%=product.getDescription() %>
					<p><%=product.getUnitPrice() %>원
					<p><a href="./product.jsp?id=<%=product.getProductId()%>" class="btn btn-secondary" role="button">상세정보</a>
				</div>
			<%
				}
			%>
		</div>
	</div>
	<p>
	<%
		response.setIntHeader("Refresh",1);
	%>
	<p> <%=(new java.util.Date()) %>	
	<jsp:include page="footer.jsp"/>
</body>
</html>