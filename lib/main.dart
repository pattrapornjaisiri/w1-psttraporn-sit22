import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // ฟังก์ชันเริ่มต้นของแอป → เรียกให้แอปเริ่มทำงานด้วย MyApp
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', // ชื่อแอป (ไม่ค่อยเห็น)
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: ("/"), // หน้าแรกที่จะแสดงตอนเปิดแอป
      routes: {
        "/" :(context) => const MyHomePage(),  // เส้นทางของหน้าแรก
        "/second"  : (context) => const SecondPage() // เส้นทางของหน้าสอง
      },
    );
  }
}

// ---------------------- หน้าแรก ----------------------
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // ฟังก์ชันสร้างข้อมูลส่วนตัวแต่ละแถว เช่น เบอร์โทร, วันเกิด ฯลฯ
  Widget buildInfoItem(Color bgColor, IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          // กล่องไอคอนซ้าย
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 28, color: Colors.white),
          ),

          SizedBox(width: 15),

          // ข้อความด้านขวา (หัวข้อ + ข้อมูลจริง)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              Text(value, style: TextStyle(fontSize: 15)),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            // ------------------ ส่วนหัวพื้นหลังน้ำเงิน ------------------
            Container(
              width: double.infinity, // กว้างเต็มจอ
              decoration: BoxDecoration(color: Colors.blue),
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Column(
                children: [
                  // ข้อความหัวข้อ
                  Text(
                    "ข้อมูลส่วนตัว",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 20),

                  // รูปโปรไฟล์
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: ClipOval(
                      child: Image.network(
                        "https://i.pinimg.com/736x/60/c2/b4/60c2b4ee73200c31d9c9319fe39ad4b3.jpg",
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // ชื่อ
                  Text(
                    "Pattraporn Jaisiri",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 4),

                  // อีเมล
                  Text(
                    "pattraporn.jaisiri@e-tech.ac.th",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            // ------------------ เนื้อหาข้อมูลส่วนตัว ------------------
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // หัวข้อเนื้อหา
                      Text(
                        "ข้อมูลส่วนตัว",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 10),

                      // ใช้ฟังก์ชัน buildInfoItem ที่เขียนไว้ด้านบน
                      buildInfoItem(
                        Colors.green.shade300, Icons.phone,
                        "เบอร์โทรศัพท์", "062-967-9395",
                      ),

                      buildInfoItem(
                        Colors.pink.shade300, Icons.cake,
                        "วันเกิด", "20 September 2005",
                      ),

                      buildInfoItem(
                        Colors.orange.shade300, Icons.location_on,
                        "ที่อยู่", "ชลบุรี",
                      ),

                      buildInfoItem(
                        Colors.deepPurple.shade300, Icons.school,
                        "การศึกษา",
                        "วิทยาลัยเทคโนโลยีภาคตะวันออก (อี.เทค)",
                      ),

                      SizedBox(height: 25),

                      // ปุ่มไปหน้า 2
                      Center(
                        child: ElevatedButton(
                          onPressed: () =>
                              Navigator.pushNamed(context,"/second"), // ไปหน้า SecondPage
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 80, vertical: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                          ),
                          child: Text("Change Page"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ---------------------- หน้าที่สอง ----------------------
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8EFF4),

      // AppBar พร้อมปุ่ม Back
      appBar: AppBar(
        backgroundColor: Color(0xFFF8EFF4),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context), // ย้อนกลับหน้าก่อน
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              // ----- ส่วนหัวรูป + สถิติ -----
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  children: [

                    // รูปโปรไฟล์
                    ClipOval(
                      child: Image.network(
                        "https://i.pinimg.com/736x/60/c2/b4/60c2b4ee73200c31d9c9319fe39ad4b3.jpg",
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),

                    SizedBox(width: 20),

                    // ตัวเลขสถิติ (ติดตาม / ผู้ติดตาม / ถูกใจ)
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          profileStat("5", "กำลังติดตาม"),
                          profileStat("828.1 K", "ผู้ติดตาม"),
                          profileStat("329.9 K", "ถูกใจและบันทึก"),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              // ชื่อ + ติ๊กฟ้า
              Row(
                children: [
                  SizedBox(width: 20),
                  Text(
                    "Pattraporn Jaisiri",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.verified, color: Colors.blue, size: 22),
                ],
              ),

              // @username
              Row(
                children: [
                  SizedBox(width: 20),
                  Text("@Dollytoey__",
                      style: TextStyle(fontSize: 15, color: Colors.black54)),
                  Icon(Icons.keyboard_arrow_down_rounded)
                ],
              ),

              SizedBox(height: 15),

              // ปุ่มติดตาม + ปุ่มแชร์
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [

                    // ปุ่มติดตาม
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 13),
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "ติดตาม",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 10),

                    // ปุ่มแชร์กลมๆ
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.share),
                    )
                  ],
                ),
              ),

              SizedBox(height: 20),

              // รูปโชว์ 2 ช่อง
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    // รูปซ้าย
                    Expanded(
                      child: Container(
                        height: 180,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://i.pinimg.com/736x/08/aa/b7/08aab7d00dfc941ca756a9cebcfea5e1.jpg"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),

                    SizedBox(width: 10),

                    // รูปขวา
                    Expanded(
                      child: Container(
                        height: 180,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://i.pinimg.com/736x/48/9b/ae/489bae53f505f450c0df7e71095f044c.jpg"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // ฟังก์ชันสำหรับสร้างตัวเลขสถิติต่างๆ แบบเป็นคอลัมน์
  Widget profileStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 3),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.black87),
        ),
      ],
    );
  }
}
