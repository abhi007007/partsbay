import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_tv/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partsbay/colorsandfonts.dart';
import 'package:partsbay/myicons_icons.dart';

class Itempage extends StatefulWidget {
  final DocumentSnapshot data;
  const Itempage({Key? key, required this.data}) : super(key: key);

  @override
  _ItempageState createState() => _ItempageState(data);
}

class _ItempageState extends State<Itempage> {
  final DocumentSnapshot data;

  _ItempageState(this.data);
  @override
  Widget build(BuildContext context) {
    List<dynamic> links = data.get('urls');
    List<dynamic> sizes = data.get('sizes');
    return Scaffold(
      bottomSheet: Container(
        height: 70,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("price", style: GoogleFonts.oxygen()),
                SizedBox(
                  height: 5,
                ),
                Text('₹' + data.get('price').toString(),
                    style: GoogleFonts.oxygen(
                      fontSize: 20,
                    )),
              ],
            ),
            SizedBox(
              width: 40,
            ),
            Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), color: blue),
              child: Center(
                  child: Text(
                "ADD TO CART",
                style: GoogleFonts.lato(color: pink),
              )),
            ),
          ],
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 500,
                      child: Swiper(
                        fade: 1,
                        autoplay: false,
                        itemCount: links.length,
                        controller: SwiperController(),
                        pagination: SwiperPagination(
                          builder: SwiperPagination.dots,
                          alignment: Alignment.bottomCenter,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: Image.network(
                              links[index],
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      data.get('title'),
                      style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: blue),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      data.get('description'),
                      style: GoogleFonts.lato(
                        color: blue,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: Center(
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                                onTap: () {},
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(13),
                                      color: Colors.grey.shade200,
                                      border: Border.all(color: blue)),
                                  child: Center(
                                    child: Text(sizes[index].toUpperCase()),
                                  ),
                                ));
                          },
                          itemCount: sizes.length,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 70 * 4,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          controller: ScrollController(keepScrollOffset: false),
                          itemCount: 4,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Card(
                                child: ListTile(
                                  leading: Text("Name"),
                                  title: Text("review"),
                                ),
                              ),
                            );
                          }),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "view all reviews",
                          style: GoogleFonts.lato(color: pink),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Add review",
                          style: GoogleFonts.lato(color: pink),
                        )),
                    SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 30,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: pink,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Positioned(
              right: 20,
              top: 35,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300),
                child: IconButton(
                  icon: Icon(
                    Myicons.heart_empty,
                    size: 20,
                    color: pink,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
