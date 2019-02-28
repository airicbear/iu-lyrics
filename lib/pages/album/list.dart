import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iu_lyrics/pages/song/song.dart';

class LyricsList extends StatefulWidget {
  final List<dynamic> lyrics;
  final String albumTitle;
  final int albumIndex;

  LyricsList({Key key, this.lyrics, this.albumTitle, this.albumIndex})
    : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LyricsListState();
  }
}

class _LyricsListState extends State<LyricsList> {

  void _openSong(String songTitle, int songIndex, List<dynamic> songLyrics) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
        Song(
            albumTitle: widget.albumTitle,
            albumIndex: widget.albumIndex,
            songTitle: songTitle,
            songIndex: songIndex,
            songLyrics: songLyrics
        )
      ),
    );
  }

  Widget _buildRowSong(String songTitle, int songIndex, List<dynamic> songLyrics) {
    return InkWell(
      onTap: () => _openSong(songTitle, songIndex, songLyrics),
      child: ListTile(
        title: Text(widget.lyrics[widget.albumIndex]['songs'][songIndex]['title'])
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.lyrics == null ? 0 : widget.lyrics[1].length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: _buildRowSong(
            widget.lyrics[widget.albumIndex]['songs'][index]['title'],
            index,
            widget.lyrics[widget.albumIndex]['songs'][index]['lyrics']
          ),
        );
      },
    );
  }
}