import 'package:flutter/material.dart';

/// ฟังก์ชัน main เป็นจุดเริ่มต้นของโปรแกรม
/// runApp ใช้สั่งให้แอปเริ่มทำงานจาก Widget หลักชื่อ MyApp
void main() {
  runApp(const MyApp());
}

/// คลาส MyApp เป็นคลาสหลักของแอป ใช้กำหนดโครงสร้างพื้นฐานของแอป
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', // ชื่อแอป (ปกติไม่แสดงบนหน้าจอ)
      
      // กำหนดธีมสีหลักของแอป
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      // กำหนดหน้าแรกที่จะแสดงเมื่อเปิดแอป
      initialRoute: ("/"),

      // กำหนดเส้นทาง (routes) สำหรับเปลี่ยนหน้าในแอป
      routes: {
        "/" :(context) => const MyHomePage(),   // เส้นทาง "/" คือหน้าแรก
        "/second"  : (context) => const SecondPage() // เส้นทาง "/second" คือหน้าที่สอง
      },
    );
  }
}

// ---------------------- หน้าแรก (MyHomePage) ----------------------

/// คลาสหน้าแรก ใช้แสดงข้อมูลส่วนตัวของผู้ใช้
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  /// ฟังก์ชัน buildInfoItem ใช้สร้างแถวข้อมูลแต่ละรายการ
  /// เช่น เบอร์โทรศัพท์, วันเกิด, ที่อยู่ ฯลฯ
  Widget buildInfoItem(Color bgColor, IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8), // เว้นระยะด้านบนและล่าง
      child: Row(
        children: [
          // กล่องสีสำหรับแสดงไอคอนทางด้านซ้าย
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: bgColor, // สีพื้นหลังของกล่อง
              borderRadius: BorderRadius.circular(10), // มุมโค้ง
            ),
            child: Icon(icon, size: 28, color: Colors.white), // ไอคอนสีขาว
          ),

          SizedBox(width: 15), // เว้นระยะห่างระหว่างไอคอนกับข้อความ

          // ส่วนแสดงข้อความหัวข้อและค่าข้อมูล
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ข้อความหัวข้อ เช่น เบอร์โทรศัพท์
              Text(title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),

              // ข้อความค่าข้อมูลจริง เช่น 062-xxx-xxxx
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
      // SafeArea ใช้ป้องกันไม่ให้เนื้อหาชนขอบจอหรือรอยบาก
      body: SafeArea(
        child: Column(
          children: [

            // ------------------ ส่วนหัวพื้นหลังสีน้ำเงิน ------------------
            Container(
              width: double.infinity, // ความกว้างเต็มหน้าจอ
              decoration: BoxDecoration(color: Colors.blue),
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Column(
                children: [
                  // ข้อความหัวข้อ "ข้อมูลส่วนตัว"
                  Text(
                    "ข้อมูลส่วนตัว",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 20), // เว้นระยะห่าง

                  // แสดงรูปโปรไฟล์เป็นวงกลม
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
                        fit: BoxFit.cover, // ปรับรูปให้เต็มกรอบ
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // แสดงชื่อผู้ใช้
                  Text(
                    "Pattraporn Jaisiri",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 4),

                  // แสดงอีเมล
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

            // ------------------ ส่วนเนื้อหาข้อมูลส่วนตัว ------------------
            Expanded(
              // SingleChildScrollView ใช้ให้สามารถเลื่อนหน้าจอได้
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // หัวข้อ "ข้อมูลส่วนตัว"
                      Text(
                        "ข้อมูลส่วนตัว",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 10),

                      // เรียกใช้ฟังก์ชัน buildInfoItem เพื่อแสดงข้อมูลแต่ละรายการ
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

                      // ------------------ ปุ่มเปลี่ยนไปหน้าที่สอง ------------------
                      Center(
                        child: ElevatedButton(
                          // เมื่อกดปุ่ม จะเปลี่ยนไปยังหน้า SecondPage
                          onPressed: () =>
                              Navigator.pushNamed(context,"/second"),

                          // กำหนดรูปแบบของปุ่ม
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 80, vertical: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                          ),

                          // ข้อความบนปุ่ม
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

// ---------------------- หน้าที่สอง (SecondPage) ----------------------

/// หน้าที่สองของแอป
/// ใช้แสดงหน้าโปรไฟล์ในรูปแบบโซเชียลมีเดีย
/// ใช้ StatelessWidget เพราะหน้านี้ไม่มีการเปลี่ยนแปลงข้อมูลระหว่างการใช้งาน
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold เป็นโครงสร้างหลักของหน้าจอ
      // ใช้จัดการ AppBar, body และพื้นหลังของหน้า
      backgroundColor: const Color(0xFFF8EFF4),

      // ------------------ AppBar ------------------
      // AppBar ใช้แสดงแถบด้านบนของหน้าจอ
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8EFF4),
        elevation: 0, // ปิดเงาเพื่อให้ UI ดูเรียบ

        // leading คือ widget ด้านซ้ายของ AppBar
        // ใช้เป็นปุ่มย้อนกลับไปหน้าก่อนหน้า
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
          // Navigator.pop ใช้ย้อนกลับไปยังหน้าเดิม
        ),
      ),

      // SafeArea ป้องกันไม่ให้ UI ชนขอบจอหรือรอยบาก
      body: SafeArea(
        // SingleChildScrollView ทำให้หน้าจอสามารถเลื่อนขึ้นลงได้
        child: SingleChildScrollView(
          child: Column(
            children: [

              // ================== ส่วนหัวโปรไฟล์ ==================
              // Row ใช้จัด layout แนวนอน
              // ส่วนนี้ใช้แสดงรูปโปรไฟล์และข้อมูลสถิติ
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  children: [

                    // ClipOval ใช้ตัดรูปภาพให้เป็นวงกลม
                    // Image.network ใช้โหลดรูปจากอินเทอร์เน็ต
                    ClipOval(
                      child: Image.network(
                        "https://i.pinimg.com/736x/60/c2/b4/60c2b4ee73200c31d9c9319fe39ad4b3.jpg",
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover, // ปรับรูปให้เต็มกรอบ
                      ),
                    ),

                    const SizedBox(width: 20),

                    // Expanded ใช้ขยายพื้นที่ส่วนสถิติให้เต็มพื้นที่ที่เหลือ
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // เรียกใช้ฟังก์ชัน profileStat เพื่อแสดงสถิติ
                          profileStat("5", "กำลังติดตาม"),
                          profileStat("828.1 K", "ผู้ติดตาม"),
                          profileStat("329.9 K", "ถูกใจและบันทึก"),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              // ================== ชื่อผู้ใช้ ==================
              // Row ใช้จัดชื่อและไอคอนให้อยู่ในแนวนอนเดียวกัน
              Row(
                children: const [
                  SizedBox(width: 20),
                  Text(
                    "Pattraporn Jaisiri",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5),
                  // ไอคอน verified ใช้ตกแต่ง UI
                  Icon(Icons.verified, color: Colors.blue, size: 22),
                ],
              ),

              // ================== Username ==================
              Row(
                children: const [
                  SizedBox(width: 20),
                  Text(
                    "@Dollytoey__",
                    style: TextStyle(fontSize: 15, color: Colors.black54),
                  ),
                  Icon(Icons.keyboard_arrow_down_rounded),
                ],
              ),

              const SizedBox(height: 15),

              // ================== ปุ่มติดตาม + ปุ่มแชร์ ==================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [

                    // Expanded ใช้ให้ปุ่มติดตามขยายเต็มพื้นที่
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 13),

                        // BoxDecoration ใช้ตกแต่งกล่องให้ดูเหมือนปุ่ม
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(6),
                        ),

                        alignment: Alignment.center,
                        child: const Text(
                          "ติดตาม",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    // ปุ่มแชร์ ใช้ Container + Icon
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle, // ทำให้เป็นวงกลม
                      ),
                      child: const Icon(Icons.share),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ================== รูปโพสต์ ==================
              // Row ใช้จัดรูปภาพ 2 รูปในแนวนอน
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [

                    // Expanded ทำให้รูปขยายเท่ากัน
                    Expanded(
                      child: Container(
                        height: 180,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: NetworkImage(
                              "https://i.pinimg.com/736x/08/aa/b7/08aab7d00dfc941ca756a9cebcfea5e1.jpg",
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: Container(
                        height: 180,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: NetworkImage(
                              "https://i.pinimg.com/736x/48/9b/ae/489bae53f505f450c0df7e71095f044c.jpg",
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // ================== ฟังก์ชันแสดงสถิติ ==================
  /// profileStat ใช้สร้าง Column สำหรับแสดง
  /// ตัวเลขสถิติและข้อความกำกับด้านล่าง
  Widget profileStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 3),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.black87),
        ),
      ],
    );
  }
}