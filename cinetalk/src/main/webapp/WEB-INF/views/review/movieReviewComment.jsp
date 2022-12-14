<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
.main {
	margin: auto;
	margin-top: 30px;
	padding: 20px;
	width: 1200px;
}
#review, .rCommentList{
	margin: auto;
	margin-top: 30px;
	padding: 20px;
	width: 1150px;
	word-break:break-all;
}

.tdHover{
	text-align: center;
	width: 600px;
	height: 50px;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px;
	
}

.tdNone {
	text-align: center;
	width: 600px;
	height: 50px;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px;
	cursor: default;
}
.tdNone:hover{
	background-color: rgba(205, 92, 92, 0.1);
}

.tdHover:hover {
	cursor: pointer;
	background-color: rgba(205, 92, 92, 0.1);
}


.star-input {
	padding: 25px 15px;
}

.star-input>.input {
	text-align: center;
	margin-top: 10px;
}

.star-input>.input, .star-input>.input>label:hover, .star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label {
	display: inline-block;
	vertical-align: middle;
	background: url('resources/image/grade.png') no-repeat;
}

.star-input {
	width: 100%;
	text-align: center;
}

.score {
	font-size: 18px;
	line-height: 25px;
	color: #fc4c4e;
	font-weight: bold;
	text-align: center;
}
/* .star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;} */
.star-input>.input {
	display: inline-block;
	width: 150px;
	background-size: 150px;
	height: 28px;
	white-space: nowrap;
	overflow: hidden;
	position: relative;
}

.star-input>.input>input {
	position: absolute;
	width: 1px;
	height: 1px;
	opacity: 0;
}

star-input>.input.focus {
	outline: 1px dotted #ddd;
}

.star-input>.input>label {
	width: 30px;
	height: 0;
	padding: 28px 0 0 0;
	overflow: hidden;
	float: left;
	cursor: pointer;
	position: absolute;
	top: 0;
	left: 0;
}

.star-input>.input>label:hover, .star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label {
	background-size: 150px;
	background-position: 0 bottom;
}

.star-input>.input>label:hover ~label {
	background-image: none;
}

.star-input>.input>label[for="p1_2"] {
	width: 15px;
	z-index: 10;
}

.star-input>.input>label[for="p1"] {
	width: 30px;
	z-index: 9;
}

.star-input>.input>label[for="p2_2"] {
	width: 45px;
	z-index: 8;
}

.star-input>.input>label[for="p2"] {
	width: 60px;
	z-index: 7;
}

.star-input>.input>label[for="p3_2"] {
	width: 75px;
	z-index: 6;
}

.star-input>.input>label[for="p3"] {
	width: 90px;
	z-index: 5;
}

.star-input>.input>label[for="p4_2"] {
	width: 105px;
	z-index: 4;
}

.star-input>.input>label[for="p4"] {
	width: 120px;
	z-index: 3;
}

.star-input>.input>label[for="p5_2"] {
	width: 135px;
	z-index: 2;
}

.star-input>.input>label[for="p5"] {
	width: 150px;
	z-index: 1;
}

.star-input>output {
	display: inline-block;
	width: 60px;
	font-size: 18px;
	text-align: right;
	vertical-align: middle;
}
</style>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
</head>
<body>

	<jsp:include page="../common/top.jsp" />
	<div class="main">
		<div id="review">
			<table class="table table-borderless" id="table1">
				<tr>
					<td scope="col" colspan="2">
						<i class="bi bi-person-fill" style="font-size: 2rem;"></i>
						<h5 style="display: inline;" id="nickNameSet">${ r.nickName }</h5>
					</td>
				</tr>
				<tr>
					<td scope="col" colspan="2"><h2 id="movieTitleSet">${ movieTitle }</h2></td>
				</tr>
				<tr>
					<td scope="row" width="100px"><span>${ r.modifyDate }</span></td>
					<td scope="row"><span>????????? : ${ r.boardCount }</span></td>

				</tr>
				<tr>
					<td scope="row" colspan="2"><h5>${ r.boardTitle }</h5></td>
				</tr>
				<tr>
					<td scope="row" colspan="2"><p>${ r.boardContent }</p></td>

				</tr>
				<tr>
					<td scope="row" colspan="2">
						<small id="likeCounting">????????? ${ allLikeCount }???</small>
						<small id="commentCounting">?????? ${ allCommentCount }???</small>
						<span class="badge badge rounded-pill text-bg-danger" style="font-size: 1rem; float: right">???${ r.movieRating }</span>
					</td>
				</tr>
			</table>
			<table class="table border-top">
				<tr>
				<c:if test="${!empty loginUser }">
					<c:if test="${loginUser.id == r.boardWriter}">
						<td class="tdHover" data-bs-toggle="modal"
							data-bs-target="#updateModal">???????????? <i
							class="bi bi-pencil-square" style="font-size: 2rem;"
							id="commentUpdate"></i></td>
						<td class="tdHover" data-bs-toggle="modal"
							data-bs-target="#deleteModal">????????????<i class="bi bi-trash"
							style="font-size: 2rem" id="commentDelete"></i></td>
					</c:if>
					<c:if test="${loginUser.id != r.boardWriter}">
						<td class="tdNone" ><span>?????????</span>
							<c:if test="${ likeCount == 1}">
								<i class="heart-click bi-heart-fill" style="font-size: 2rem; cursor:pointer"></i>
							</c:if>
							<c:if test="${ likeCount == 0}">
								<i class="heart-click bi-heart" style="font-size: 2rem; cursor:pointer"></i>
							</c:if>
						</td>
							<c:if test="${already < 1}">
								<td class="tdHover" data-bs-toggle="modal" data-bs-target="#rCommentInsertModal">?????? ?????? <i class="bi bi-chat-left-text"
									style="font-size: 2rem; cursor:pointer"></i></td>
							</c:if>
							<c:if test="${already > 0 }">
								<td class="tdHover" id="myComment"> ??? ?????? <i class="bi bi-chat-left-text"
									style="font-size: 2rem; cursor:pointer"></i></td>
							</c:if>
							<c:if test="${ count == 0 }">
								<td class="tdHover" id="rcReport" data-bs-toggle="modal"
							data-bs-target="#movieReviewReportModal">????????????<i class="bi bi-exclamation-circle"
									style="font-size: 2rem;"></i></td>
							</c:if>
								<c:if test="${ count == 1 }">
								<td class="tdHover" id="rcReport" data-bs-toggle="modal"
							data-bs-target="#reportCancelModal">????????????<i class="bi bi-exclamation-circle"
									style="font-size: 2rem;"></i></td>
							</c:if>
					</c:if>
				</c:if>
				<c:if test="${empty loginUser }">
					<tr>
					</tr>
				</c:if>
				</tr>
			</table>
		</div>
		<br> <br>
	</div>

		<!-- 11/26 ?????? -->
	<div class="rCommentList">
		<c:if test="${ !empty rcList  }">
		<c:forEach items="#{rcList}" var="rc">
			<div class="card text-bg-light mb-3" style="max-width: 1200px;">
				<div class="card-body rCommentsbody">
					<table class="table table-borderless">
						<tr>
							<td scope="col"><i class="bi bi-person-fill" style="font-size: 1rem;"></i>
								<h5 style="display: inline;" class="rcNickName">${ rc.nickName }</h5>
							</td>
						</tr>
						<tr>
							<td scope="row"><span class="rcCommentModifyDate">${ rc.commentModifyDate }</span></td>
						</tr>
						<tr>
							<td scope="row"><p class="rcComentContent">${rc.commentContent }</p></td>
						</tr>
						<c:if test="${rc.nickName eq loginUser.nickName}">
							<tr id="myCommentTarget">
							<td>
								<div class="btn-group" role="group" aria-label="Basic example" style="float:right">
									<button type="button" class="btn btn-light" id="updateComment" data-bs-toggle="modal"
										data-bs-target="#rCommentUpdateModal">
										<i class="bi bi-pencil" style="font-size: 30px;"></i>
									</button>
									<button type="button" class="btn btn-light" data-bs-toggle="modal"
										data-bs-target="#rCommentDeleteModal">
										<i class="bi bi-trash" style="font-size: 30px;"></i>
									</button>
								</div>
							</td>
						</tr>
						</c:if>
						<c:if test="${ rc.nickName != loginUser.nickName}">
							<tr id="myCommentTarget">
								<td>
								<c:if test="${ !empty loginUser }">
									<div class="btn-group" role="group" aria-label="Basic example" style="float:right">
										<input type="hidden" name="reportContentIds" value="${ rc.commentId }">
										<c:if test="${rc.reportCount == 0}">
										<button type="button" class="btn btn-light rCommentReport" data-bs-toggle="modal"
											data-bs-target="#rCommentReportModal"><i class="bi bi-exclamation-circle" style="font-size: 30px;"></i></button>
										</c:if>
										<c:if test="${rc.reportCount == 1}">
										<button type="button" class="btn btn-light rCommentReportDelete" data-bs-toggle="modal"
											data-bs-target="#commentReportCancelModal"><i class="bi bi-exclamation-circle" style="font-size: 30px; color: #CD5C5C;"></i></button>
										</c:if>									
									</div>
								</c:if>
								</td>
							</tr>
						</c:if>
					</table>
				</div>
			</div>
		</c:forEach>
		</c:if>
		<c:if test="${ empty rcList }">
			<div class="alert alert-danger" role="alert">?????? ????????? ????????? ????????????.</div>
		</c:if>
		</div>
		
		<!-- ??? ????????? ?????? ??? clone??? ?????? -->
		<div class="card-body rCommentsbodynone" style="display:none">
					<table class="table table-borderless">
						<tr>
							<td scope="col">
								<i class="bi bi-person-fill" style="font-size: 1rem;"></i>
								<h5 style="display: inline;" class="rcNickName"></h5>
							</td>
						</tr>
						<tr>
							<td scope="row">
								<span class="rcCommentModifyDate"></span>
								<input type="hidden" name="cloneNickName">
								<input type="hidden" name="cloneCount">
							</td>
						</tr>
						<tr>
							<td scope="row"><p class="rcComentContent"></p></td>
						</tr>
						<c:if test="${ nickName eq loginUser.nickName}">
							<tr id="myCommentTarget">
							<td>
								<div class="btn-group" role="group" aria-label="Basic example" style="float:right">
									<button type="button" class="btn btn-light" id="updateComment" data-bs-toggle="modal"
										data-bs-target="#rCommentUpdateModal">
										<i class="bi bi-pencil" style="font-size: 30px;"></i>
									</button>
									<button type="button" class="btn btn-light" data-bs-toggle="modal"
										data-bs-target="#rCommentDeleteModal">
										<i class="bi bi-trash" style="font-size: 30px;"></i>
									</button>
								</div>
							</td>
						</tr>
						</c:if>
						<c:if test="${ nickName != loginUser.nickName}">
							<tr>
								<td>
								<c:if test="${ !empty loginUser }">
									<div class="btn-group" role="group" aria-label="Basic example" style="float:right">
										<c:if test="${i.reportCount == 0}">
										<button type="button" class="btn btn-light rCommentReport" data-bs-toggle="modal"
											data-bs-target="#rCommentReportModal"><i class="bi bi-exclamation-circle" style="font-size: 30px;"></i></button>
										</c:if>
										<c:if test="${i.reportCount == 1}">
										<button type="button" class="btn btn-light rCommentReportDelete" data-bs-toggle="modal"
											data-bs-target="#commentReportCancelModal"><i class="bi bi-exclamation-circle" style="font-size: 30px; color: #CD5C5C;"></i></button>
										</c:if>									
									</div>
								</c:if>
								</td>
							</tr>
						</c:if>
					</table>
				</div>



	<!-- ?????? ?????? ??????  ?????? -->
	<div class="modal" id="updateModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
				<form name="myform" id="myform"
					action="${ contextPath }/updateMovieReview.re" method="post">
					<div class="modal-header">
						<h3 style="color: #CD5C5C;">????????? ???????????????.</h3>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="star-input">
							<h4>????????? ?????? ??????????????????.</h4>
							<span class="input"> <input type="radio" name="star-input"
								value="1" id="p1"> <label for="p1">1</label> <input
								type="radio" name="star-input" value="0.5" id="p1_2"> <label
								for="p1_2">0.5</label> <input type="radio" name="star-input"
								value="2" id="p2"> <label for="p2">2</label> <input
								type="radio" name="star-input" value="1.5" id="p2_2"> <label
								for="p2_2">1.5</label> <input type="radio" name="star-input"
								value="3" id="p3"> <label for="p3">3</label> <input
								type="radio" name="star-input" value="2.5" id="p3_2"> <label
								for="p3_2">2.5</label> <input type="radio" name="star-input"
								value="4" id="p4"> <label for="p4">4</label> <input
								type="radio" name="star-input" value="3.5" id="p4_2"> <label
								for="p4_2">3.5</label> <input type="radio" name="star-input"
								value="5" id="p5"> <label for="p5">5</label> <input
								type="radio" name="star-input" value="4.5" id="p5_2"> <label
								for="p5_2">4.5</label>
							</span>
							<output for="star-input">
								<b id="rating" name="rating"></b>???
							</output>
							<input type="hidden" id="movieId" name="movieId" value="${ r.movieId }">
							<input type="hidden" id="movieRating" name="movieRating" value="0">
							<input type="hidden" id="boardId" name="boardId" value="${r.boardId }">
							<input type="hidden" id="movieTitle" name="movieTitle" value="${ movieTitle }">
						</div>
						<div>
							<input type="text" class="form-control" id="boardTitle" name="boardTitle" placeholder="????????? ???????????????." value="${ r.boardTitle }"><br>
							<textarea class="form-control" placeholder="???????????? ????????? ??????????????????." id="boardContent" name="boardContent" style="height: 300px;">${ r.boardContent }</textarea>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-light" data-bs-dismiss="modal">??? ??????</button>
						<button type="submit" class="btn btn-outline-light" style="background-color: #CD5C5C;" id="reviewSubmit">?????? ????????????</button>
					</div>
				</form>
			</div>
		</div>
	</div>


	<!-- ?????? ?????? ?????? ?????? -->
	<!-- Modal -->
	<div class="modal fade" id="deleteModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel" style="color: #CD5C5C;">????????? ??????</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">????????? ?????????????????????????</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-outline-danger" id="delete">????????? ??????</button>
				</div>
			</div>
		</div>
	</div>
	
	<!--  ?????? ?????? ?????? -->
	<div class="modal" id="rCommentInsertModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
				<input type="hidden" name="writer" id="writer" value="${ r.nickName }">
				<input type="hidden" name="boardId" id="boardId" value="${ r.boardId }">
				<input type="hidden" name="movieTitle" id="movieTitle" value="${ movieTitle }">
				<div class="modal-header">
					<h3 style="color: #CD5C5C;">????????? ??????????????????</h3>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div>
						<textarea class="form-control" placeholder="???????????? ????????? ??????????????????." id="commentContent" name="commentContent" style="height: 300px; resize:none;"></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-light" data-bs-dismiss="modal">??? ??????</button>
					<button type="button" class="btn btn-outline-light" style="background-color: #CD5C5C;" id="rCommentSubmit" data-bs-dismiss="modal">?????? ????????????</button>
				</div>
			</div>
		</div>
	</div>
			
			
			
		<!--  ?????? ?????? ?????? -->
	<div class="modal fade" id="rCommentUpdateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h3 style="color: #CD5C5C;">????????? ???????????????.</h3>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div>
						<c:forEach items="${rcList}" var="rc">
							<c:if test="${rc.userId == loginUser.id}">
								<input type="hidden" id="rCommentId" name="rCommentId" value="${rc.commentId}">
								<textarea class="form-control" placeholder="???????????? ????????? ??????????????????."
										id="commentUpdateContent" name="commentUpdateContent" style="height: 300px; resize:none;">${rc.commentContent}</textarea>
							</c:if>
						</c:forEach>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-light" data-bs-dismiss="modal">??? ??????</button>
					<button type="submit" class="btn btn-outline-light" style="background-color: #CD5C5C;" id="rCommentUpdateSubmit" data-bs-dismiss="modal"> ?????? ????????????</button>
				</div>
			</div>
		</div>
	</div>
		
		<!-- ?????? ?????? ??????-->
		<!-- Modal -->
	<div class="modal fade" id="rCommentDeleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel" style="color: #CD5C5C;">????????? ??????</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">????????? ?????????????????????????</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-outline-danger" id="rCommentDeleteSubmit">????????? ??????</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<!--  ?????? ?????? ?????? ?????? -->
	<div class="modal fade" id="movieReviewReportModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<form action="${ contextPath }/insertReviewReport.rp" method="POST">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel" style="color: #CD5C5C;">?????? ????????????</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body" style="width:800px;">
						<input type="hidden" name="reportContentCategory" id="reportContentCategory" value="r">
						<input type="hidden" name="reportContentId" id="reportContentId" value="${ r.boardId }">
						<input type="hidden" name="reportWriter" id="reportWriter" value="${ loginUser.id }">
						<input type="hidden" name="writer" id="writer" value="${ r.nickName }">
						<input type="hidden" name="movieTitle" id="movieTitle" value="${ movieTitle }">
						<select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" id="reportCategory" name="reportCategory">
							<option selected>?????? ?????? ??????</option>
							<option value="??????">??????</option>
							<option value="??????">????????????</option>
							<option value="??????">????????? ?????????</option>
							<option value="??????">?????? ?????????</option>
							<option value="??????">?????? ?????????</option>
							<option value="??????">????????? ?????????</option>
							<option value="??????">??????</option>
						</select>
						<div class="mb-3">
							<textarea class="form-control" id="exampleFormControlTextarea1"
								rows="3" placeholder="????????? ???????????? ?????? ??????????????????." style="resize:none;" id="reportContent" name="reportContent"></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-outline-danger" id="">?????? ??????</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	
		<!--  ?????? ?????? ?????? ?????? ?????? -->
	<div class="modal fade" id="rCommentReportModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<form action="${ contextPath }/insertRcommentReport.rp" method="POST">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel1" style="color: #CD5C5C;">?????? ????????????</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body" style="width:800px;">
						<input type="hidden" name="reportContentCategory" id="reportContentCategory1" value="c">
						<input type="hidden" name="reportContentId" id="reportContentId1">
						<input type="hidden" name="writer" value="${ r.nickName }">
						<input type="hidden" name="movieTitle" value="${ movieTitle }">
						<input type="hidden" name="boardId" value="${ r.boardId }">
						<select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" id="reportCategory1" name="reportCategory">
							<option selected>?????? ?????? ??????</option>
							<option value="??????">??????</option>
							<option value="??????">????????????</option>
							<option value="??????">????????? ?????????</option>
							<option value="??????">?????? ?????????</option>
							<option value="??????">?????? ?????????</option>
							<option value="??????">????????? ?????????</option>
							<option value="??????">??????</option>
						</select>
						<div class="mb-3">
							<textarea class="form-control" id="exampleFormControlTextarea1"
								rows="3" placeholder="????????? ???????????? ?????? ??????????????????." style="resize:none;" id="reportContent1" name="reportContent"></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-outline-danger">?????? ??????</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<!-- ?????? ?????? ?????? ?????? ?????? -->
		<!-- Modal -->
	<div class="modal fade" id="reportCancelModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel" style="color: #CD5C5C;">?????? ??????</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">????????? ?????????????????????????</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
					<input type="hidden" name="reportContentCategory" id="reportContentCategory1" value="r">
					<input type="hidden" name="reportContentId" id="reportContentId1">
					<input type="hidden" name="writer" value="${ r.nickName }">
					<input type="hidden" name="movieTitle" value="${ movieTitle }">
					<input type="hidden" name="boardId" value="${ r.boardId }">
					<button type="submit" class="btn btn-outline-danger" id="deleteReviewReport">?????? ??????</button>
				</div>
			</div>
		</div>
	</div>
	
	
		<!-- ?????? ?????? ?????? ?????? ?????? -->
		<!-- Modal -->
	<div class="modal fade" id="commentReportCancelModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" style="color: #CD5C5C;">?????? ?????? ??????</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">?????? ????????? ?????????????????????????</div>
				<div class="modal-footer">
					<form action="${ contextPath }/deleteRcommentReport.rp" method="POST">
						<button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
						<input type="hidden" name="reportContentCategory" id="reportContentCategory2" value="c">
						<input type="hidden" name="reportContentId" id="reportContentId2">
						<input type="hidden" name="writer" value="${ r.nickName }">
						<input type="hidden" name="movieTitle" value="${ movieTitle }">
						<input type="hidden" name="boardId" value="${ r.boardId }">
						<button type="submit" class="btn btn-outline-danger" id="deleteReviewReport2">?????? ??????</button>
					</form>
				</div>
			</div>
		</div>
	</div>





	<jsp:include page="../common/footer.jsp" />


	<script>
	 // ?????? ??????
	   var starRating = function(){
	      var $star = $(".star-input"),
	          $result = $star.find("output>b");
	         
	           $(document).on("focusin", ".star-input>.input",function(){
	                $(this).addClass("focus");
	          })
	             
	            .on("focusout", ".star-input>.input", function(){
	             var $this = $(this);
	             setTimeout(function(){
	                  if($this.find(":focus").length === 0){
	                      $this.removeClass("focus");
	                  }
	               }, 100);
	           })
	        
	          .on("change", ".star-input :radio", function(){
	             $result.text($(this).next().text());
	           })
	          .on("mouseover", ".star-input label", function(){
	             $result.text($(this).text());
	             document.getElementById("movieRating").value = $result.text();
// 	             console.log($result.text());
	          })
	         .on("mouseleave", ".star-input>.input", function(){
	             var $checked = $star.find(":checked");
	                if($checked.length === 0){
	                     $result.text("0");
	                   } else {
	                     $result.text($checked.next().text());
	                }
	           });
	      };

	      starRating();

	      
	      window.onload=()=>{
	    	    
	    	  // ?????? ?????? ??????
		      const deleteComment = document.getElementById("delete");
		      deleteComment.addEventListener('click', ()=>{
		    	  const boardId = ${r.boardId }
		    	  const movieId = ${ r.movieId }
// 		    	  console.log(boardId);
		    	  
		    	  location.href='${contextPath}/deleteMovieReview.re?boardId='+boardId + '&movieId=' + movieId;
		    	  $('#deleteModal').modal('hide');
		      });
		      
			// ?????? ?????? ?????? ?????? 
	    	  document.getElementById("rCommentSubmit").addEventListener('click', ()=>{
	    		  
	    		 $.ajax({
	    			url :  '${contextPath}/insertRcomment.re',
	    			data : { commentContent:document.getElementById('commentContent').value,
	    				boardId:${r.boardId }
	    			},
	    			success: (data)=>{
	    				console.log(data);
	    				$('.rCommentList').html('');
	    				for(var i of data){
								
	    					var div = $('.rCommentsbodynone').clone();
	    					div.find('.rcNickName').text(i.nickName);
	    					div.find('.rcCommentModifyDate').text(i.commentModifyDate);
	    					div.find('.rcComentContent').text(i.commentContent);
							
	    					$(".rCommentList").prepend('<div class="card text-bg-light mb-3" style="max-width: 1200px;">'+div.html()+"</div>");
	    					
	    				}
	    				
	    				document.getElementById('commentContent').value = '';
	    				location.reload();
	    				
	    			},
	    			error: (data)=>{
	    				console.log(data);
	    			}
	    		 });
	    	  });
	    	  
// 	    	 document.getElementById("rCommentSubmit").addEventListener('click', ()=>{
// 	    		 
// 	    	 })
			

	    	  // ?????? ????????? ?????? ??????
	    	  document.getElementById("rCommentUpdateSubmit").addEventListener('click', function(){
	    		  $.ajax({
	    			 url : '${contextPath}/updateRcomment.re',
	    			 data : { commentContent :
	    			 document.getElementById("commentUpdateContent").value,
	    				 		commentId : document.getElementById("rCommentId").value,
	    				 		boardId:${r.boardId }
	    			 		},
	    			 success:(data)=>{
	    				 console.log(data);
						
	    				 $('.rCommentList').html('');
		    				for(var i = 0; i < data.length; i++){
									
		    					var div = $('.rCommentsbodynone').clone();
		    					div.find('.rcNickName').text(data[i].nickName);
		    					div.find('.rcCommentModifyDate').text(data[i].commentModifyDate);
		    					div.find('.rcComentContent').text(data[i].commentContent);
		    				
		    					
		    					
		    					$(".rCommentList").prepend('<div class="card text-bg-light mb-3" style="max-width: 1200px;">'+div.html()+"</div>");
		    					
		    				}
		    				document.getElementById('commentContent').value = '';
		    				location.reload();
	    			 },
	    			 error: (data)=>{
		    				console.log(data);
		    			}
	    		 }) ;
	    		  
	    		  
	    		  
	    	  });
	    	  
	    	  
	    	  // ?????????????????? ??????
	    	  document.getElementById("rCommentDeleteSubmit").addEventListener('click', ()=>{
	    		  const commentId = document.getElementById("rCommentId").value;
	    		  const writer = document.getElementById("nickNameSet").innerText;
	    		  const movieTitle = document.getElementById("movieTitleSet").innerText;
	    		  const boardId = ${ r.boardId };
		    	  
		    	  location.href='${contextPath}/deleteRcomment.re?commentId='+commentId + '&writer=' + writer +'&movieTitle=' + movieTitle+'&boardId=' + boardId;
	    	
	    	  });
	    	  
	    	  
	    	  
	    	  // ??? ?????? ????????? ??? ????????? ??????
	    	  document.getElementById("myComment").addEventListener('click', function(){
	    		 const targetButton =  document.querySelector("#myCommentTarget");
	    		 document.location.href='#myCommentTarget';
	    	  });
	    	  
	    	  
// 	    	  const i = document.getElementById("selectReportValue").value;
// 	    	  console.log(i);
	    	  
	      }
	      
	      
	      
	   // ????????? ??????
			const heartClick = $(".heart-click");
// 	   console.log(heartClick);
			heartClick.click(function(){
				if($(this).attr("class") == "heart-click bi-heart"){
			         $.ajax({
				            url: '${contextPath}/insertLike.re',
				            data: {boardId: ${ r.boardId }},
				            type: 'post',
				            success:(data)=>{
			   				 console.log(data);
			   				 $('#likeCounting').text("????????? " + data + "???");
				            },
				            error: (data)=>{
			    				console.log(data);
			    			}
				         });
					
			         $(this).attr("class","heart-click bi-heart-fill");
			         
				}else if($(this).attr("class") == "heart-click bi-heart-fill"){
			         $.ajax({
				            url: '${contextPath}/deleteLike.re',
				            data: {boardId: ${ r.boardId }},
				            type: 'post',
				            success:(data)=>{
			   				 console.log(data);
			   				 $('#likeCounting').text("????????? " + data + "???");
				            },
				            error: (data)=>{
			    				console.log(data);
			    			}
				         });
			         
			         $(this).attr("class","heart-click bi-heart");
				}
			})
			
			
			
			// ?????? ?????? ?????? ??????
			document.getElementById("deleteReviewReport").addEventListener('click', function(){
	    		  const writer = document.getElementById("nickNameSet").innerText;
	    		  const movieTitle = document.getElementById("movieTitleSet").innerText;
	    		  const boardId = ${ r.boardId };
		    	  
		    	  location.href='${contextPath}/deleteReviewReport.rp?writer=' + writer +'&movieTitle=' + movieTitle+'&boardId=' + boardId;
			});
			
			
			// ?????? ?????? ?????? ?????? 
			const rCommentReports = document.getElementsByClassName("btn btn-light rCommentReport");
// 			console.log(rCommentReport);
			
			for( const rcp of rCommentReports){
				rcp.addEventListener('click', function(){
					const rCommentReportId = this.parentNode.childNodes[1].value;
					$('#reportContentId1').val(this.parentNode.childNodes[1].value);
				});
			}
			
			// ?????? ?????? ?????? ?????? ??????
			
			const rCommentReportDeletes = document.getElementsByClassName("btn btn-light rCommentReportDelete");
// 			console.log(rCommentReport);
			
			for( const rcpd of rCommentReportDeletes){
				rcpd.addEventListener('click', function(){
					const rCommentReportId = this.parentNode.childNodes[1].value;
// 					console.log(rCommentReportId);
					$('#reportContentId2').val(this.parentNode.childNodes[1].value);
					$('#reportContentCategory2').val("c");
				});
			}
			

	</script>

</body>
</html>