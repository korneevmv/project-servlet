<%@ page import="com.tictactoe.Sign" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <link href="static/main.css" rel="stylesheet">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script src="<c:url value="/static/jquery-3.6.0.min.js"/>"></script>
    <title style="left: 40px">Tic-Tac-Toe Time</title>
</head>
<body>
<h1 id="head">Tic-Tac-Toe Time</h1>

<table>
    <tr>
        <td onclick="window.location='/tic_tac_toe_war_exploded/logic?click=0'">${data.get(0).getSign()}</td>
        <td onclick="window.location='/tic_tac_toe_war_exploded/logic?click=1'">${data.get(1).getSign()}</td>
        <td onclick="window.location='/tic_tac_toe_war_exploded/logic?click=2'">${data.get(2).getSign()}</td>
    </tr>
    <tr>
        <td onclick="window.location='/tic_tac_toe_war_exploded/logic?click=3'">${data.get(3).getSign()}</td>
        <td onclick="window.location='/tic_tac_toe_war_exploded/logic?click=4'">${data.get(4).getSign()}</td>
        <td onclick="window.location='/tic_tac_toe_war_exploded/logic?click=5'">${data.get(5).getSign()}</td>
    </tr>
    <tr>
        <td onclick="window.location='/tic_tac_toe_war_exploded/logic?click=6'">${data.get(6).getSign()}</td>
        <td onclick="window.location='/tic_tac_toe_war_exploded/logic?click=7'">${data.get(7).getSign()}</td>
        <td onclick="window.location='/tic_tac_toe_war_exploded/logic?click=8'">${data.get(8).getSign()}</td>
    </tr>
</table>

<c:set var="CROSSES" value="<%=Sign.CROSS%>"/>
<c:set var="NOUGHTS" value="<%=Sign.NOUGHT%>"/>

<c:choose>
    <c:when test="${winner == CROSSES}">
        <button id="cross" onclick="restart()">CROSSES WIN! <br> Start again</button>
    </c:when>
    <c:when test="${winner == NOUGHTS}">
        <button id="nought" onclick="restart()">NOUGHTS WIN! <br> Start again</button>
    </c:when>
    <c:when test="${draw}">
        <button id="draw" onclick="restart()">IT'S A DRAW  <br> Start again</button>
    </c:when>
    <c:otherwise>
        <button id="rest" onclick="restart()">LET'S GO ! <br> or restart ?</button>
    </c:otherwise>
</c:choose>

<script>
    function restart() {
        $.ajax({
            url: '/tic_tac_toe_war_exploded/restart',
            type: 'POST',
            contentType: 'application/json;charset=UTF-8',
            async: false,
            success: function () {
                location.reload();
            }
        });
    }
</script>

</body>
</html>