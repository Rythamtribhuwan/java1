```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
String version = "1.0.0";
String appName = "FoodieExpress";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FoodieExpress | Food Delivery</title>
<style>
*{box-sizing:border-box;margin:0;padding:0}
body{font-family:Arial,sans-serif;background:#fffaf5;color:#222}
nav{padding:20px 7%;background:white;display:flex;justify-content:space-between;align-items:center;gap:15px;box-shadow:0 2px 12px #ddd;position:sticky;top:0;z-index:5}
.logo{font-size:25px;font-weight:bold;color:#ff5b1a}
nav a{color:#333;text-decoration:none;margin:0 8px;font-weight:bold;font-size:14px}
button,.btn{border:0;background:#ff5b1a;color:white;padding:12px 18px;border-radius:8px;cursor:pointer;font-weight:bold}
button:hover,.btn:hover{background:#e94708}
.hero{padding:75px 7%;color:white;background:linear-gradient(90deg,#17100beF,#17100b66),url('https://images.unsplash.com/photo-1513104890138-7c749659a591?auto=format&fit=crop&w=1600&q=85') center/cover}
.hero h1{font-size:clamp(35px,5vw,55px);max-width:600px;line-height:1.15}
.hero h1 span{color:#ff793f}
.hero p{margin:18px 0;line-height:1.8}
.search{display:flex;max-width:460px;gap:8px}
.search input{padding:14px;border:0;border-radius:8px;flex:1;min-width:0}
section{padding:45px 7%}
.heading{display:flex;justify-content:space-between;align-items:center;margin-bottom:24px;gap:12px}
.heading h2{font-size:26px}
.heading span{color:#ff5b1a;font-weight:bold}
.categories{display:grid;grid-template-columns:repeat(5,1fr);gap:15px}
.category{text-align:center;background:white;border:1px solid #eee;border-radius:12px;padding:20px 5px;cursor:pointer}
.category b{display:block;font-size:32px;margin-bottom:8px}
.category:hover{border-color:#ff5b1a}
.menu{background:#fff0e5}
.food-grid{display:grid;grid-template-columns:repeat(3,minmax(0,1fr));gap:20px}
.food{background:white;border-radius:14px;overflow:hidden;box-shadow:0 5px 20px #0000000c}
.food img{width:100%;height:190px;object-fit:cover;display:block}
.info{padding:17px}
.info p{color:#777;margin:10px 0;font-size:14px;line-height:1.5}
.rating{color:#d88b00;margin:10px 0}
.bottom{display:flex;justify-content:space-between;align-items:center;gap:8px}
.price{font-size:21px;color:#ff5b1a;font-weight:bold}
.offer{margin:35px 7%;padding:30px;border-radius:15px;background:linear-gradient(120deg,#ff4d12,#ff8d2c);color:white;display:flex;justify-content:space-between;align-items:center;gap:20px}
.offer h2{font-size:30px;margin-bottom:10px}
.offer .btn{background:white;color:#ff5b1a;text-decoration:none;white-space:nowrap}
#cart{background:white}
.cart-box{max-width:800px;margin:auto;padding:22px;background:#fffaf5;border-radius:12px}
.cart-row{display:flex;justify-content:space-between;align-items:center;gap:12px;padding:14px 0;border-bottom:1px solid #eee}
.cart-row button{padding:6px 10px}
.total{display:flex;justify-content:space-between;font-size:23px;font-weight:bold;margin:22px 0}
footer{background:#191919;color:white;padding:35px 7% 20px}
.footer-grid{display:grid;grid-template-columns:2fr 1fr 1fr;gap:25px}
footer p,footer a{color:#ccc;text-decoration:none;font-size:14px;line-height:2}
footer h3{margin-bottom:12px}
.foot-bottom{border-top:1px solid #444;margin-top:25px;padding-top:18px;display:flex;justify-content:space-between;gap:10px;flex-wrap:wrap}
.version{color:#ffb18c;font-size:12px;margin-top:12px}
#toast{position:fixed;bottom:20px;right:20px;background:#222;color:white;padding:14px 20px;border-radius:9px;display:none;z-index:9}
@media(max-width:750px){nav{flex-wrap:wrap}.categories{grid-template-columns:repeat(3,1fr)}.food-grid{grid-template-columns:repeat(2,minmax(0,1fr))}.footer-grid{grid-template-columns:1fr 1fr}}
@media(max-width:500px){nav a{margin:0 3px;font-size:12px}.hero{padding:55px 6%}section{padding:32px 5%}.categories{grid-template-columns:repeat(2,1fr)}.food-grid{grid-template-columns:1fr}.food img{height:220px}.offer{margin:25px 5%;padding:22px;flex-direction:column;align-items:flex-start}.footer-grid{grid-template-columns:1fr}}
</style>
</head>
<body>

<nav>
 <div class="logo">🍴 FoodieExpress</div>
 <div>
  <a href="#">Home</a>
  <a href="#menu">Menu</a>
  <a href="#cart">Cart (<span id="count">0</span>)</a>
 </div>
 <a class="btn" href="#menu">Order Now</a>
</nav>

<header class="hero">
 <p style="color:#ffb18c;font-weight:bold">WELCOME TO FOODIEEXPRESS</p>
 <h1>Delicious Food.<br><span>Delivered To Your Door.</span></h1>
 <p>Fresh ingredients, amazing flavours and happiness in every bite!</p>
 <div class="search">
  <input id="search" placeholder="Search pizza, burger, biryani...">
  <button onclick="searchFood()">Search</button>
 </div>
 <p>🛵 Fast Delivery &nbsp; • &nbsp; 🍽️ Fresh Food &nbsp; • &nbsp; ❤️ Great Taste</p>
</header>

<section id="categories">
 <div class="heading"><h2>🍽️ Explore Categories</h2><span>Choose your favourite</span></div>
 <div class="categories">
  <div class="category" onclick="filter('Pizza')"><b>🍕</b>Pizza</div>
  <div class="category" onclick="filter('Burger')"><b>🍔</b>Burger</div>
  <div class="category" onclick="filter('Biryani')"><b>🍛</b>Biryani</div>
  <div class="category" onclick="filter('Dosa')"><b>🥞</b>Dosa</div>
  <div class="category" onclick="filter('All')"><b>🍜</b>All Food</div>
 </div>
</section>

<section class="menu" id="menu">
 <div class="heading"><h2>🔥 Popular Dishes</h2><span>Fresh & Delicious</span></div>
 <div class="food-grid" id="foodGrid">

  <article class="food" data-name="Margherita Pizza" data-cat="Pizza">
   <img src="https://images.unsplash.com/photo-1579751626657-72bc17010498?auto=format&fit=crop&w=700&q=80" alt="Pizza">
   <div class="info"><h3>Margherita Pizza</h3><p>Classic cheese pizza with fresh herbs.</p><div class="rating">⭐ 4.8 / 5</div><div class="bottom"><span class="price">₹149</span><button onclick="add('Margherita Pizza',149)">+ Add</button></div></div>
  </article>

  <article class="food" data-name="Classic Burger" data-cat="Burger">
   <img src="https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=700&q=80" alt="Burger">
   <div class="info"><h3>Classic Burger</h3><p>Juicy burger with cheese and lettuce.</p><div class="rating">⭐ 4.7 / 5</div><div class="bottom"><span class="price">₹99</span><button onclick="add('Classic Burger',99)">+ Add</button></div></div>
  </article>

  <article class="food" data-name="Chicken Biryani" data-cat="Biryani">
   <img src="https://images.unsplash.com/photo-1563379091339-03246963d96a?auto=format&fit=crop&w=700&q=80" alt="Biryani">
   <div class="info"><h3>Chicken Biryani</h3><p>Rich Indian spices and aromatic rice.</p><div class="rating">⭐ 4.9 / 5</div><div class="bottom"><span class="price">₹179</span><button onclick="add('Chicken Biryani',179)">+ Add</button></div></div>
  </article>

  <article class="food" data-name="Masala Dosa" data-cat="Dosa">
   <img src="https://images.unsplash.com/photo-1668236543090-82eba5ee5976?auto=format&fit=crop&w=700&q=80" alt="Dosa">
   <div class="info"><h3>Masala Dosa</h3><p>Crispy dosa with chutney and sambar.</p><div class="rating">⭐ 4.6 / 5</div><div class="bottom"><span class="price">₹89</span><button onclick="add('Masala Dosa',89)">+ Add</button></div></div>
  </article>

  <article class="food" data-name="Veg Momos" data-cat="Momos">
   <img src="https://images.unsplash.com/photo-1563245372-f21724e3856d?auto=format&fit=crop&w=700&q=80" alt="Momos">
   <div class="info"><h3>Veg Momos</h3><p>Steamed dumplings with spicy dip.</p><div class="rating">⭐ 4.5 / 5</div><div class="bottom"><span class="price">₹79</span><button onclick="add('Veg Momos',79)">+ Add</button></div></div>
  </article>

  <article class="food" data-name="Hakka Noodles" data-cat="Chinese">
   <img src="https://images.unsplash.com/photo-1585032226651-759b368d7246?auto=format&fit=crop&w=700&q=80" alt="Noodles">
   <div class="info"><h3>Hakka Noodles</h3><p>Delicious noodles tossed with vegetables.</p><div class="rating">⭐ 4.4 / 5</div><div class="bottom"><span class="price">₹119</span><button onclick="add('Hakka Noodles',119)">+ Add</button></div></div>
  </article>

 </div>
 <p id="empty" style="display:none;padding:25px;text-align:center">No food found. Try another search.</p>
</section>

<div class="offer">
 <div><h2>🎉 Flat 50% OFF</h2><p>Special offer on your first order!</p><p>Coupon: <b>FOODIE50</b></p></div>
 <a class="btn" href="#menu">Order Now →</a>
</div>

<section id="cart">
 <div class="heading"><h2>🛒 Your Cart</h2><span>Order summary</span></div>
 <div class="cart-box">
  <div id="items"><p>Your cart is empty. Add something delicious!</p></div>
  <div class="total"><span>Total</span><span id="total">₹0</span></div>
  <button onclick="checkout()">Proceed to Checkout →</button>
  <p style="margin-top:12px;color:#777;font-size:13px">Demo checkout only; online payment is not connected.</p>
 </div>
</section>

<footer>
 <div class="footer-grid">
  <div><div class="logo">🍴 FoodieExpress</div><p>Great food, great mood!<br>Your favourite meals, one click away.</p><p class="version">VERSION <%= version %> | First Release</p></div>
  <div><h3>Quick Links</h3><p><a href="#">Home</a></p><p><a href="#menu">Menu</a></p><p><a href="#cart">My Cart</a></p></div>
  <div><h3>Application Info</h3><p>Java JSP + Tomcat</p><p>Jenkins + Maven</p><p>Version <%= version %></p></div>
 </div>
 <div class="foot-bottom"><p>© 2026 FoodieExpress</p><p>Made by Rytham ❤️</p></div>
</footer>
<div id="toast" role="status"></div>

<script>
const cart = {};

function notify(message){
 const toast=document.getElementById('toast');
 toast.textContent=message;
 toast.style.display='block';
 clearTimeout(window.toastTimer);
 window.toastTimer=setTimeout(()=>toast.style.display='none',2300);
}

function add(name,price){
 if(cart[name]) cart[name].qty++;
 else cart[name]={price:price,qty:1};
 render();
 notify(name+' added to cart!');
}

function change(name,amount){
 if(!cart[name]) return;
 cart[name].qty+=amount;
 if(cart[name].qty<=0) delete cart[name];
 render();
}

function render(){
 let total=0,count=0,html='';
 Object.keys(cart).forEach(name=>{
  const item=cart[name];
  total+=item.price*item.qty;
  count+=item.qty;
  html+=`<div class="cart-row">
   <div><b>${name}</b><p>₹${item.price} each</p></div>
   <div><button onclick="change('${name}',-1)">−</button>
   ${item.qty}<button onclick="change('${name}',1)">+</button></div>
   <b>₹${item.price*item.qty}</b>
  </div>`;
 });
 document.getElementById('items').innerHTML=html||'<p>Your cart is empty. Add something delicious!</p>';
 document.getElementById('total').textContent='₹'+total;
 document.getElementById('count').textContent=count;
}

function searchFood(){
 const query=document.getElementById('search').value.toLowerCase().trim();
 let visible=0;
 document.querySelectorAll('.food').forEach(card=>{
  const match=(card.dataset.name+' '+card.dataset.cat).toLowerCase().includes(query);
  card.style.display=match?'':'none';
  if(match) visible++;
 });
 document.getElementById('empty').style.display=visible?'none':'block';
}

function filter(category){
 document.getElementById('search').value=category==='All'?'':category;
 searchFood();
 document.getElementById('menu').scrollIntoView({behavior:'smooth'});
}

document.getElementById('search').addEventListener('keydown',e=>{
 if(e.key==='Enter') searchFood();
});

function checkout(){
 if(Object.keys(cart).length===0){
  notify('Please add food to your cart first!');
  return;
 }
 notify('Demo order ready! Backend is not connected.');
}
</script>
</body>
</html>
```
