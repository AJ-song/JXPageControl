# JXPageControl

[![CI Status](https://img.shields.io/travis/bboyXFX/JXPageControl.svg?style=flat)](https://travis-ci.org/bboyXFX/JXPageControl)
[![Version](https://img.shields.io/cocoapods/v/JXPageControl.svg?style=flat)](https://cocoapods.org/pods/JXPageControl)
[![License](https://img.shields.io/cocoapods/l/JXPageControl.svg?style=flat)](https://cocoapods.org/pods/JXPageControl)
[![Platform](https://img.shields.io/cocoapods/p/JXPageControl.svg?style=flat)](https://cocoapods.org/pods/JXPageControl)


##### (JXPageControl supports multiple animation transformations, content layout transformations, and Xib layouts ) 

---

##### 

* Development environment: Xcode 7 
* Running condition: iOS(8.0+) 
* Open source framework ：[github地址](https://github.com/Code-TanJX/JXPageControl)
* [ Chinese is introduced [ 中文介绍 ]](https://blog.csdn.net/TanJiaXiang/article/details/95796616)

&nbsp;

（If there is any problem, you can leave a message, welcome to study together, welcome star ）

--- 
### Installation

#### Swift Package Manager

SPM 支持 Swift tools 5.5+、iOS 12+，使用 Swift 5 语言模式。

在 Xcode 中选择 **File → Add Package Dependencies**，输入：

```text
https://github.com/AJ-song/JXPageControl.git
```

在本次改动发布为 `0.1.6` 后，选择从 `0.1.6` 开始的版本规则，并将 `JXPageControl` 产品添加到应用 Target。

其他 Swift Package 可以这样依赖本库：

```swift
dependencies: [
    .package(url: "https://github.com/AJ-song/JXPageControl.git", from: "0.1.6")
],
targets: [
    .target(
        name: "YourTarget",
        dependencies: [
            .product(name: "JXPageControl", package: "JXPageControl")
        ]
    )
]
```

使用时继续 `import JXPageControl`。本库只有 UIKit/CoreGraphics 系统框架依赖，无需安装其他第三方包。产品未指定静态或动态链接类型，由 SPM/Xcode 选择；原示例和 Pods 不参与包构建。

##### 构建与版本发布

在仓库根目录验证模拟器构建：

```sh
xcodebuild -scheme JXPageControl -configuration Debug \
  -destination 'generic/platform=iOS Simulator' \
  -derivedDataPath /tmp/JXPageControl-SPM-DerivedData \
  CODE_SIGNING_ALLOWED=NO build
```

根目录的旧 `_Pods.xcodeproj` 软链接已移除，避免命令行误选 Pods 工程；原有 Example 工程保留。

建议将本次清单、README 和忽略规则提交到 `AJ-song/JXPageControl` 后，创建新标签 `0.1.6`。Tag 必须指向包含根目录 `Package.swift` 的提交，SPM 才能按版本安装。`Package.swift` 不填写本库版本，原 `0.1.5` 和 podspec 保持不变。

在 GitHub 网页可通过 **Add file → Upload files** 上传 `Package.swift`，通过文件编辑器更新 README 和 `.gitignore` 并删除根目录 `_Pods.xcodeproj`。全部提交后，进入 **Releases → Draft a new release**，创建 `0.1.6` 标签并选择包含改动的分支，再发布正式 Release。不要勾选预发布版本。

JXBanner 从 `0.3.7` 起通过远程包依赖使用本库。先发布 JXPageControl `0.1.6`，再发布 JXBanner。应用只使用 Banner 时，添加 JXBanner 即可自动解析和构建本依赖。

#### CocoaPods

To install, simply add the following code to your Podfile   : 

```ruby

platform :ios, '8.0'

target 'TargetName' do
    pod 'JXPageControl'
end

```

---

### The UI effect 

JXPageControlChameleon          |   JXPageControlExchange     |        JXPageControlFill 
:-: | :-: | :-:   
<img src="Images/chamelon.gif" width="144" height="88"> | <img src="Images/exchange.gif" width="260" height="124"> | <img src="Images/fill.gif" width="128" height="104">


&nbsp;

JXPageControlJump | JXPageControlScale
:-: | :-: 
<img src="Images/jump.gif" width="128" height="328"> | <img src="Images/scare.gif" width="128" height="300">

---

### Frame set 
* Common   Framework common class files 
* Jump  - Jump animation effects class file  
* Transform  - Transition animation class file

---

---

####  JXPageControl introduction [ JXPageControl 介绍 ]

JXPageControl ADAPTS to Swift and objective-c

&nbsp;

* JXPageControlBase -   Base class for all pageControl 
* JXPageControlType -  All pageControl protocols, it provides a number of custom apis for developers to use 

&nbsp;

######  JXPageControlType - provides - API 

&nbsp;

* numberOfPages --->  Number of indicators. 
* currentPage --->  Current indicator page number. 
* progress --->  Current indicator page numbering process. 
* hidesForSinglePage ---> Whether to hide when there is only one indicator. 
* inactiveColor --->  Inactive indicator color
* activeColor ---> Active indicator color  
* inactiveSize --->  Inactive indicator size 
* activeSize --->   Active indicator size 
* indicatorSize --->  All indicator sizes 
* columnSpacing --->  Horizontal distance between indicators 
* contentAlignment --->  Content layout location (note that this property is easy to use!!!!! )
* contentMode --->  Content layout location, and support for transformation in Xib, real-time view of location changes (note that this property is very useful!!!!! )
* isInactiveHollow ---> Whether the inactive indicator is a hollow pattern 
* isActiveHollow ---> Whether the active indicator is a hollow pattern 
* reload() ---> Refresh data/UI 

###### Be careful  : 
JXPageControl also provides some APIs for non-JXPageControlType. You can view it in the specific classes you use 

&nbsp;

---
####  JXPageControl uses  :

&nbsp;

### Example 1

* Use (xib, storyboard for properties and layout Settings!!! )  
* Note that the module should select JXPageControl, otherwise it will not show up and the call will report an error. 
* ContentMode can be set in View to change content location 

&nbsp;


<img src="Images/Xib_01.png" width="825" height="805">

---

<img src="Images/Xib_02.png" width="810" height="750">


### Example 2

*  Write it in pure code

```

import JXPageControl

class ChamelonVC: UIViewController {

lazy var codePageControl: JXPageControlJump = {
let pageControl = JXPageControlJump(frame: CGRect(x: 0,
y: 0,
width: UIScreen.main.bounds.width,
height: 30))
pageControl.numberOfPages = 4

// JXPageControlType: default property
//        pageControl.currentPage = 0
//        pageControl.progress = 0.0
//        pageControl.hidesForSinglePage = false
//        pageControl.inactiveColor = UIColor.white.withAlphaComponent(0.5)
//        pageControl.activeColor = UIColor.white
//        pageControl.inactiveSize = CGSize(width: 10, height: 10)
//        pageControl.activeSize = CGSize(width: 10, height: 10)
//        pageControl.inactiveSize = CGSize(width: 10, height: 10)
//        pageControl.columnSpacing = 10
//        pageControl.contentAlignment = JXPageControlAlignment(.center,
//                                                              .center)
//        pageControl.contentMode = .center
//        pageControl.isInactiveHollow = false
//        pageControl.isActiveHollow = false

// JXPageControlJump: default "custom property"
pageControl.isAnimation  = true
pageControl.isFlexible = true

return pageControl
}()

override func viewDidLoad() {
super.viewDidLoad()
view.addSubview(codePageControl)
}

}

extension ChamelonVC: UIScrollViewDelegate {
func scrollViewDidScroll(_ scrollView: UIScrollView) {
let progress = scrollView.contentOffset.x / scrollView.bounds.width
let currentPage = Int(round(progress))

//  Mode one 
codePageControl.progress = progress

// Mode two 
//        codePageControl.currentPagev = currentPage

}

}

```

```


```

### Example 2 and so on ...

```

import JXPageControl
...

```

### [The Demo address](https://github.com/Code-TanJX/JXPageControl)

## Author

Code-TanJX, Code_TanJX@163.com

## License

JXPageControl is available under the MIT license. See the LICENSE file for more info.
