<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="crossorigin="anonymous">
</script> <!-- jQuery 안에 ajax가 있으므로 CDN방식으로 jQuery 사용 -->
</head>
<body>

<h2>문자 인증번호 전송하기</h2>
<div id="sms">

	<input type="tel" value="010" disabled/>
	<input type="tel" name="phone" id="phone" placeholder="ex) 12345678"  maxlength="8"/>
	<button class="btn" onclick="sms();">인증번호 전송</button>
	<div id="result1"></div> 
	
	
	<input type="hidden" name="randNum" id="randNum">
	<input type="tel" name="checkNum" id="checkNum" maxlength="6"/>
	<button class="btn" onclick="smsCheck();">인증번호 확인</button>
	<div id="result2"></div> 

</div>

<script type="text/javascript">
var number = 0;

	function sms(){
		var phone = $("#phone").val();
		
		$.ajax({
			type: 'POST',
			url: '${pageContext.request.contextPath}/Sms',
			data:{phone:phone},
			success: function(randNum){
				console.log("로그: ["+randNum+"]")
				if(randNum != null){
					$("#result1").text("인증번호 전송이 완료되었습니다!");
					$("#result1").css("color","blue");
					
					number = randNum;
				}
				else{
					$("#result1").text("인증번호 전송이 불가합니다...");
					$("#result1").css("color","red");
				}
				
			},
			
			error: function(request, status, error){ // 요청 보낸 곳(서블릿)에서 에러가 발생할 시 실행
				console.log("code: "+request.status);
				console.log("message: "+request.responseText);
				console.log("error: "+error);
			}
			
		});
	}
	

	function smsCheck(){
		var checkNum = $("#checkNum").val();
		
		$.ajax({
			type: 'POST',
			url: '${pageContext.request.contextPath}/SmsCheck',
			data: {randNum:number,checkNum:checkNum},
			success: function(result){
				console.log("로그: ["+result+"]")
				if(result == 1){
					$("#result2").text("인증번호가 일치합니다");
					$("#result2").css("color","blue");
				}
				else{
					$("#result2").text("인증번호가 일치하지 않습니다");
					$("#result2").css("color","red");
				}
			},
			
			error: function(request, status, error){ // 요청 보낸 곳(서블릿)에서 에러가 발생할 시 실행
				console.log("code: "+request.status);
				console.log("message: "+request.responseText);
				console.log("error: "+error);
			}
			
		});
	}
</script>



</body>
</html>