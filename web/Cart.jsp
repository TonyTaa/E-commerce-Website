<%-- 
    Document   : Cart
    Created on : Sep 29, 2024, 3:14:34 PM
    Author     : sontu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Aroma - Cart</title>
        <link rel="icon" href="img/Fevicon.png" type="image/png">
        <link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
        <link rel="stylesheet" href="vendors/linericon/style.css">
        <link rel="stylesheet" href="vendors/owl-carousel/owl.theme.default.min.css">
        <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
        <link rel="stylesheet" href="vendors/nice-select/nice-select.css">
        <link rel="stylesheet" href="vendors/nouislider/nouislider.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <!--================ Start Header Menu Area =================-->
        <%@include  file="Header.jsp" %>
        <!--================ End Header Menu Area =================-->

        <!-- ================ start banner area ================= -->	
        <section class="blog-banner-area" id="category">
            <div class="container h-100">
                <div class="blog-banner">
                    <div class="text-center">
                        <h1>Shopping Cart</h1>
                        <nav aria-label="breadcrumb" class="banner-breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="home">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Shopping Cart</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
        <!-- ================ end banner area ================= -->



        <!--================Cart Area =================-->
        <c:if test="${empty listCartNow}">
            <div class="empty-cart-message">
                <p>Your Cart is Empty now. Go Shopping!</p>
                <a class="gray_btn" href="allproduct">Go Shopping!</a>
            </div>
        </c:if>
        <style>
            .blog-banner-area {
                padding: 50px 0 !important; /* Giảm tối đa khoảng cách trên và dưới */
                height: auto !important; /* Đặt lại chiều cao auto để phù hợp với nội dung */
            }

            .blog-banner-area .blog-banner {
                height: 50px !important; /* Giảm thêm chiều cao tổng thể của banner */
            }

            .blog-banner-area h1 {
                font-size: 20px !important; /* Giảm kích thước chữ tiêu đề */
                margin-bottom: 5px !important; /* Giảm khoảng cách giữa tiêu đề và breadcrumb */
            }

            .banner-breadcrumb {
                font-size: 12px !important; /* Giảm kích thước chữ của breadcrumb */
            }

            .banner-breadcrumb .breadcrumb {
                margin-bottom: 0 !important; /* Loại bỏ khoảng cách dưới của breadcrumb */
            }


            .empty-cart-message {
                text-align: center;         /* Căn giữa chữ và nút */
                font-size: 36px;            /* Kích thước chữ lớn */
                font-weight: bold;          /* In đậm chữ */
                color: #333;                /* Màu chữ */
                margin-top: 50px;           /* Khoảng cách từ đầu trang */
                display: flex;
                flex-direction: column;     /* Căn theo chiều dọc */
                justify-content: center;    /* Căn giữa ngang */
                align-items: center;        /* Căn giữa dọc */
                height: 80vh;               /* Chiều cao phần thông báo */
            }

            .empty-cart-message a {
                display: inline-block;
                margin-top: 20px;           /* Khoảng cách giữa chữ và nút */
                padding: 15px 30px;         /* Kích thước nút */
                background-color: #007bff;  /* Màu nền của nút */
                color: white;               /* Màu chữ của nút */
                text-decoration: none;      /* Bỏ gạch chân */
                border-radius: 5px;         /* Bo tròn các góc nút */
                font-size: 18px;            /* Kích thước chữ trong nút */
                font-weight: bold;          /* In đậm chữ trong nút */
                transition: background-color 0.3s ease; /* Hiệu ứng chuyển màu khi hover */
            }

            .empty-cart-message a:hover {
                background-color: #0056b3;  /* Màu nền khi di chuột qua nút */
            }
            table img {
                width: 100px; /* Chiều rộng mong muốn, có thể thay đổi */
                height: auto; /* Đảm bảo giữ tỷ lệ ảnh */
                object-fit: cover; /* Giúp ảnh vừa với khung mà không bị méo */
            }

        </style>
        <c:if test="${!empty listCartNow}">
            <section class="cart_area">
                <div class="container">
                    <div class="cart_inner">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Product</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Size</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Total</th>
                                        <th scope="col">Remove</th>
                                        <th scope="col">Change Quanlity</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listCartNow}" var="l">
                                    <input type="hidden" name="cartItemID" value="${l.cartItemID}">
                                    <tr>
                                        <td>
                                            <div class="media">
                                                <div class="d-flex">
                                                    <img src="${l.thumbnail}" alt="a">
                                                </div>
                                                <div class="media-body">
                                                </div>
                                            </div>
                                        </td>
                                        <td><p>${l.title}</p></td>
                                        <td>
                                            <c:forEach var="size" items="${allSize}">
                                                <c:if test="${size.sizeId eq l.sizeID}">
                                                    ${size.sizeName}
                                                </c:if>
                                            </c:forEach>
                                        </td>

                                        <td>
                                            <h5>$<span class="price">${l.price}</span></h5>
                                        </td>
                                        <td>
                                            <div class="product_count">
                                                <input type="text" name="qty" class="input-text qty" maxlength="12" value="${l.quantity}" title="Quantity:">
                                                <button onclick="updateQuantity(this, 1);" class="increase items-count" type="button">
                                                    <i class="lnr lnr-chevron-up"></i>
                                                </button>
                                                <button onclick="updateQuantity(this, -1);" class="reduced items-count" type="button">
                                                    <i class="lnr lnr-chevron-down"></i>
                                                </button>
                                            </div>
                                        </td>
                                        <td>
                                            <h5>$<span class="total">${l.price * l.quantity}</span></h5>
                                        </td>
                                        <td><a href="deletecart?service=deleteItem&cartItemID=${l.cartItemID}" class="btn-delete" onclick="return confirm('Bạn có chắc muốn xóa sản phẩm này không?');">
                                                <i class="fa fa-trash" style="color: red;"></i></td>
                                        <td><a href="updateCart?cartItemID=${l.cartItemID}">
                                                <i class="fa fa-pen" style="color: black;"></i></td>
                                    </tr>
                                </c:forEach>
                                <!-- Hiển thị subtotal -->
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td><h5>Subtotal</h5></td>
                                    <td><h5>$<span id="subtotal">0</span></h5></td>
                                </tr>

                                <script>
                                    function updateQuantity(button, change) {
                                        // Lấy input số lượng và giá sản phẩm
                                        var qtyInput = button.parentNode.querySelector('.qty');
                                        var price = parseFloat(button.closest('tr').querySelector('.price').textContent);
                                        var totalElement = button.closest('tr').querySelector('.total');

                                        // Lấy số lượng hiện tại và thay đổi số lượng
                                        var qty = parseInt(qtyInput.value);
                                        if (!isNaN(qty)) {
                                            qty = qty + change;
                                            if (qty > 0) {
                                                qtyInput.value = qty;
                                            }

                                            // Tính lại tổng giá cho sản phẩm này
                                            var totalPrice = (price * qty).toFixed(2);
                                            totalElement.textContent = totalPrice;

                                            // Tính lại tổng tiền (subtotal)
                                            calculateSubtotal();
                                        }
                                    }

                                    function calculateSubtotal() {
                                        // Lấy tất cả các phần tử hiển thị tổng giá của từng sản phẩm
                                        var totalElements = document.querySelectorAll('.total');
                                        var subtotal = 0;

                                        // Cộng dồn tổng giá của tất cả sản phẩm
                                        totalElements.forEach(function (totalElement) {
                                            subtotal += parseFloat(totalElement.textContent);
                                        });

                                        // Cập nhật subtotal trên giao diện
                                        document.getElementById('subtotal').textContent = subtotal.toFixed(2);
                                    }

                                    // Gọi hàm calculateSubtotal để tính tổng tiền khi trang được load
                                    window.onload = function () {
                                        calculateSubtotal();
                                    };
                                </script>

                                <tr class="out_button_area">
                                    <td class="d-none-l">
                                    </td>
                                    <td class="">

                                    </td>
                                    <td>

                                    </td>
                                    <td>
                                        <div class="checkout_btn_inner d-flex align-items-center">
                                            <a class="gray_btn" href="allproduct">Continue Shopping</a>
                                            <a class="primary-btn ml-2" href="cartcontact">Proceed to checkout</a>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </section>
        </c:if>

        <!--================End Cart Area =================-->



        <!--================ Start footer Area  =================-->	
        <%@include file="Footer.jsp" %>
        <!--================ End footer Area  =================-->



        <script src="vendors/jquery/jquery-3.2.1.min.js"></script>
        <script src="vendors/bootstrap/bootstrap.bundle.min.js"></script>
        <script src="vendors/skrollr.min.js"></script>
        <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
        <script src="vendors/nice-select/jquery.nice-select.min.js"></script>
        <script src="vendors/jquery.ajaxchimp.min.js"></script>
        <script src="vendors/mail-script.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
