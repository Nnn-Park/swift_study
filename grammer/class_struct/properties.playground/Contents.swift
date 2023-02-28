import UIKit

//             Lazy Stored Properties(지연 저장 속성)

struct Bird1 {
    var name: String
    lazy var weight: Double = 0.2
    
    init(name: String) {
        self.name = name
        //self.weight ??
    }
    func fly() {
        print("날아갑니다.")
    }
}


var aBird1 = Bird1(name: "새")  //
// name     [   "새"   ]


aBird1.weight // 해당 변수에 접근하는 이 시점에 초기화됨 (메모리 공간이 생기고 숫자가 저장됨)

// weight    [   0.2   ]



/**===========================================================
 - 저장 속성은 저장 속성인데, 지연(lazy)의 의미가 뭘까?

 - 지연 저장 속성은 "해당 저장 속성"의 초기화를 지연시키는 것임
 - 즉, 인스턴스가 초기화되는 시점에 해당 속성이 값을 갖고 초기화되는
   것이 아니라(메모리에 공간과 값을 갖는 것이 아니라),
 - 해당 속성(변수)에 접근하는 순간에 (해당 저장 속성만)개별적으로 초기화됨

 - 따라서, 상수로의 선언은 안되고 변수(var)로의 선언만 가능
   ➡︎ lazy var만 가능(lazy let 불가능)

 - 즉, 위의 weight이라는 속성은 초기화 시점에 메모리 공간이 생기는 것이 아님
 - 예를 들어, 인스턴스가 생기고 난 후, aBird.weight 이렇게 접근하는
   순간 메모리 공간을 만들고 숫자를 저장 하게됨
=============================================================**/


class Aview {
    var a: Int
    
    // 1) 메모리를 많이 차지할 때
    lazy var view = UIImageView()   // 객체를 생성하는 형태
    
    // 2) 다른 속성을 이용해야할 때
    lazy var b: Int = {
        return a * 10
    }()
    
    init(num: Int) {
        self.a = num
    }
}


/**====================================================
 - 지연 저장 속성을 사용하는 이유

 - 1)
 - 메모리 공간을 많이 차지하는 이미지 등의 속성에 저장할때,
 - (반드시 메모리에 다 올릴 필요가 없으므로) 지연 저장 속성으로
   선언 함 (메모리 낭비 막기 위함)

 - 2)
 - 다른 속성들을 이용해야 할때
 - 초기화 시점에 모든 속성들이 동시에 메모리 공간에 저장되므로
 - 어떤 한가지 속성이 다른 속성에 접근할 수가 없다.
 - (그렇지만, 지연 저장 속성을 이용 하는 경우 지연으로 저장된 속성은
   먼저 초기화된 속성에 접근 할 수 있게됨)

 
 - 실제 프로젝트에서 많이 활용
 - 실제 프로젝트를 다루면서 자연스럽게 이해되는 내용이므로
   (프로젝트 다룰 때 설명 예정)

 - (클로저의 실행문 부분도 연결해서 설명 예정)
======================================================**/


