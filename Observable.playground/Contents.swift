import Foundation
import RxSwift

print(">>>>>>>>>>>> Just")
Observable<Int>.just(1)
    .subscribe (onNext: {
        print($0)
    } )

print(">>>>>>>>>>>> 1. Of")
Observable<Int>.of(1,2,3,4,5)
    .subscribe(onNext: {
      print($0)
    })
print(">>>>>>>>>>>> 2. Of")
Observable.of([1,2,3,4,5]) // 타입을 명시하지 않은 경우 다음은 하나의 배열을 출력함.
// Observable.just([1,2,3,4,5])
    .subscribe(onNext: {
      print($0)
    })

print(">>>>>>>>>>>> From")
Observable.from([1,2,3,4,5])
    .subscribe(onNext: {
      print($0)
    })


// subscribe

print(">>>>>>>>>>>> Subscribe")
Observable.of(1,2,3)
    .subscribe {
        print($0)
    }
print(">>>>>>>>>>>> Subscribe2")
Observable.of(1,2,3)
    .subscribe {
        if let element = $0.element {
            print(element)
        }
    }
print(">>>>>>>>>>>> Subscribe3")
Observable.of(1,2,3)
    .subscribe(onNext: {
        print($0)
    })

print(">>>>>>>>>>>> empty")
Observable<Void>.empty()
    .subscribe {
        print($0)
    }

print(">>>>>>>>>>>> never")
Observable.never()
    .debug("never")
    .subscribe(
        onNext: {
            print($0)
        },
        onCompleted: {
            print("Completed")
        })

print(">>>>>>>>>>>> range")
Observable.range(start: 1, count: 9)
    .subscribe(onNext: {
        print("2 * \($0) = \(2 * $0)")
    })

print(">>>>>>>>>>>> dispose")
Observable.of(1, 2, 3)
    .subscribe(onNext: {
        print($0)
    })
    .dispose()
    

print(">>>>>>>>>>>> disposeBag")
let disposeBag = DisposeBag()

Observable.of(1, 2, 3)
    .subscribe {
        print($0)
    }
    .disposed(by: disposeBag)
