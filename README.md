# TagLibIOS

[![Version](https://img.shields.io/cocoapods/v/TagLibIOS.svg?style=flat)](https://cocoapods.org/pods/TagLibIOS)
[![License](https://img.shields.io/cocoapods/l/TagLibIOS.svg?style=flat)](https://cocoapods.org/pods/TagLibIOS)
[![Platform](https://img.shields.io/cocoapods/p/TagLibIOS.svg?style=flat)](https://cocoapods.org/pods/TagLibIOS)

### TagLib Audio Meta-Data Library

http://taglib.org/

TagLib is a library for reading and editing the meta-data of several
popular audio formats. Currently it supports both ID3v1 and [ID3v2][]
for MP3 files, [Ogg Vorbis][] comments and ID3 tags and Vorbis comments
in [FLAC][], MPC, Speex, WavPack, TrueAudio, WAV, AIFF, MP4 and ASF
files.

  [ID3v2]: http://www.id3.org 
  [Ogg Vorbis]: http://vorbis.com/
  [FLAC]: https://xiph.org/flac/
  
  
### Credits

* The Objective C Wrapper is based on [eni9889 TagLib-Objc's](https://github.com/eni9889/TagLib-ObjC/tree/master/taglib-objc) implementation.
* [TagLib version 1.11.1](https://github.com/taglib/taglib/releases/tag/v1.11.1) from GitHub is compiled... 

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

**Swift Example:**

```swift
let audio = TLAudio(fileAtPath: audioFilePath.path)!

audio.title = "exampleTitle"
audio.artist = "exampleArtist"
audio.album = "exampleAlbum"
audio.comment = "exampleComment"
audio.genre = "exampleGenre"
audio.year = 2001
audio.track = 1
audio.updateTag("ALBUMARTIST", stringValue: "exampleAlbumArtist")
audio.updateTag("DISCNUMBER", stringValue: "1")
audio.updateTag("TOTALDISCS", stringValue: "2")
audio.updateTag("TOTALTRACKS", stringValue: "15")
audio.frontCoverPicture = imageData
audio.artistPicture = imageData

audio.save()

audio.audioProperties.forEach { print("newAudio.audioProperties key -> \($0) value -> \($1)") }
audio.allTags.forEach { print("newAudio.allTags key -> \($0) value -> \($1)") }
```

*Currently only a Flac and MPEG/MP3 wrapper are included...*

## Installation

TagLibIOS is available through [CocoaPods](https://cocoapods.org). In order to compile this correctly one has to add `use_frameworks!` to the Podfile! 
To install it, simply add the following lines to your Podfile:

```ruby
use_frameworks!
target 'MyApp' do
  pod 'TagLibIOS'
end
```

## History
2019-10-30 - Expanded tag support to provide access to all tags in the audio file.  Also exposed the audioProperties for the audio file.

## License

TagLib is distributed under the [GNU Lesser General Public License][]
(LGPL) and [Mozilla Public License][] (MPL). Essentially that means that
it may be used in proprietary applications, but if changes are made to
TagLib they must be contributed back to the project. Please review the
licenses if you are considering using TagLib in your project.

  [GNU Lesser General Public License]: http://www.gnu.org/licenses/lgpl.html
  [Mozilla Public License]: http://www.mozilla.org/MPL/MPL-1.1.html


