//
//  ViewController.swift
//  LocationWeather
//
//  Created by Neil Liu on 2016/7/1.
//  Copyright © 2016年 NeiL Liu. All rights reserved.
//

import UIKit
import SwiftyJSON


class ViewController: UIViewController {

    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!

    @IBOutlet var iconLabel: UILabel!
    
    var weatherImgString: String = ""
    let apiId = "e33511d2d1a073421192bcc4bb520756"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        getCurrentWeatherData()
        iconLabel.font = UIFont(name: "Weather Icons", size: 150)
        iconLabel.text = weatherImgString
    }
    
    //获取当前天气数据（北京）
    func getCurrentWeatherData(){
        let urlStr = "http://api.openweathermap.org/data/2.5/weather?q=beijing&units=metric&appid=\(apiId)"
        let url = NSURL(string: urlStr)!
        guard let weatherData = NSData(contentsOfURL: url) else { return }
        
        //将获取到的数据转为json对象
        let jsonData = JSON(data: weatherData)
        
        //日期格式化输出
        let dformatter = NSDateFormatter()
        dformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"

        
        if let name = jsonData["name"].string {
            print("城市：\(jsonData["name"].string!)")
            locationLabel.text = name
        } else {
            // 列印錯誤訊息
            print(jsonData["name"].string)
        }
        
        
        if let weather = jsonData["weather"][0]["main"].string {
            print("天气：\(weather)")
        } else {
            // 列印錯誤訊息
            print(jsonData["weather"][0]["main"])
        }
        
        
        if let weatherDes = jsonData["weather"][0]["description"].string {
            print("详细天气：\(weatherDes)")
        } else {
            // 列印錯誤訊息
            print(jsonData["weather"][0]["description"])
        }
        
        if let weatherId = jsonData["weather"][0]["id"].number {
        
            print("weatherId：\(weatherId)")
            
            switch weatherId {
            case 200:
                weatherImgString = "\u{f01e}"
            case 201:
                weatherImgString = "\u{f01e}"
            case 202:
                weatherImgString = "\u{f01e}"
            case 210:
                weatherImgString = "\u{f016}"
            case 211:
                weatherImgString = "\u{f016}"
            case 212:
                weatherImgString = "\u{f016}"
            case 221:
                weatherImgString = "\u{f016}"
            case 230:
                weatherImgString = "\u{f01e}"
            case 231:
                weatherImgString = "\u{f01e}"
            case 232:
                weatherImgString = "\u{f01e}"
            case 300:
                weatherImgString = "\u{f01c}"
            case 301:
                weatherImgString = "\u{f01c}"
            case 302:
                weatherImgString = "\u{f019}"
            case 310:
                weatherImgString = "\u{f017}"
            case 311:
                weatherImgString = "\u{f019}"
            case 312:
                weatherImgString = "\u{f019}"
            case 313:
                weatherImgString = "\u{f01a}"
            case 314:
                weatherImgString = "\u{f019}"
            case 321:
                weatherImgString = "\u{f01c}"
            case 500:
                weatherImgString = "\u{f01c}"
            case 501:
                weatherImgString = "\u{f019}"
            case 502:
                weatherImgString = "\u{f019}"
            case 503:
                weatherImgString = "\u{f019}"
            case 504:
                weatherImgString = "\u{f019}"
            case 511:
                weatherImgString = "\u{f017}"
            case 520:
                weatherImgString = "\u{f01a}"
            case 521:
                weatherImgString = "\u{f01a}"
            case 522:
                weatherImgString = "\u{f01a}"
            case 531:
                weatherImgString = "\u{f01d}"
            case 600:
                weatherImgString = "\u{f01b}"
            case 601:
                weatherImgString = "\u{f01b}"
            case 602:
                weatherImgString = "\u{f0b5}"
            case 611:
                weatherImgString = "\u{f017}"
            case 612:
                weatherImgString = "\u{f017}"
            case 615:
                weatherImgString = "\u{f017}"
            case 616:
                weatherImgString = "\u{f017}"
            case 620:
                weatherImgString = "\u{f017}"
            case 621:
                weatherImgString = "\u{f01b}"
            case 622:
                weatherImgString = "\u{f01b}"
            case 701:
                weatherImgString = "\u{f01a}"
            case 711:
                weatherImgString = "\u{f062}"
            case 721:
                weatherImgString = "\u{f0b6}"
            case 731:
                weatherImgString = "\u{f063}"
            case 741:
                weatherImgString = "\u{f014}"
            case 761:
                weatherImgString = "\u{f063}"
            case 762:
                weatherImgString = "\u{f063}"
            case 771:
                weatherImgString = "\u{f011}"
            case 781:
                weatherImgString = "\u{f056}"
            case 800:
                weatherImgString = "\u{f00d}"
            case 801:
                weatherImgString = "\u{f011}"
            case 802:
                weatherImgString = "\u{f011}"
            case 803:
                weatherImgString = "\u{f012}"
            case 804:
                weatherImgString = "\u{f013}"
            case 900:
                weatherImgString = "\u{f056}"
            case 901:
                weatherImgString = "\u{f01d}"
            case 902:
                weatherImgString = "\u{f073}"
            case 903:
                weatherImgString = "\u{f076}"
            case 904:
                weatherImgString = "\u{f072}"
            case 905:
                weatherImgString = "\u{f021}"
            case 906:
                weatherImgString = "\u{f015}"
            case 957:
                weatherImgString = "\u{f050}"
            default:
                print("icon 出錯啦")
            }
        } else {
            // 列印錯誤訊息
            print(jsonData["weather"][0]["id"])
        }
        
        if let temp = jsonData["main"]["temp"].number {
            temperatureLabel.text = "\(temp)" + "\u{f03c}"
            print("温度：\(temp)°C")
        } else {
            print(jsonData["main"]["temp"])
        }
        
        if let humidity = jsonData["main"]["humidity"].number {
            print("湿度：\(humidity)%")
        } else {
            print(jsonData["main"]["humidity"])
        }
        
        if let pressure = jsonData["main"]["pressure"].number {
            print("气压：\(pressure)hpa")
        } else {
            print(jsonData["main"]["pressure"])
        }
        
        if let windSpeed = jsonData["wind"]["speed"].number {
            print("风速：\(windSpeed)m/s")
        } else {
            print(jsonData["wind"]["speed"])
        }
        
        if let lon = jsonData["coord"]["lon"].number {
            if let lat = jsonData["coord"]["lat"].number {
                print("坐标：[\(lon),\(lat)]")
            } else {
                print("lat: \(jsonData["coord"]["lat"])")
            }
        } else {
            print("lon: \(jsonData["coord"]["lon"])")
        }
        
        
        
        let timeInterval1 = NSTimeInterval(jsonData["sys"]["sunrise"].number!)
        let date1 = NSDate(timeIntervalSince1970: timeInterval1)
        print("日出时间：\(dformatter.stringFromDate(date1))")
        
        let timeInterval2 = NSTimeInterval(jsonData["sys"]["sunset"].number!)
        let date2 = NSDate(timeIntervalSince1970: timeInterval2)
        print("日落时间：\(dformatter.stringFromDate(date2))")
        
        let timeInterval3 = NSTimeInterval(jsonData["dt"].number!)
        let date3 = NSDate(timeIntervalSince1970: timeInterval3)
        print("数据时间：\(dformatter.stringFromDate(date3))")
    }
    /*
    func getweatherImg() {
        switch weatherImgCode {
        case "200":
            weatherImgString = "\u{f01e}"
        case "201":
            weatherImgString = "\u{f01e}"
        case "202":
            weatherImgString = "\u{f01e}"
        case "210":
            weatherImgString = "\u{f016}"
        case "211":
            weatherImgString = "\u{f016}"
        case "212":
            weatherImgString = "\u{f016}"
        case "221":
            weatherImgString = "\u{f016}"
        case "230":
            weatherImgString = "\u{f01e}"
        case "231":
            weatherImgString = "\u{f01e}"
        case "232":
            weatherImgString = "\u{f01e}"
        case "300":
            weatherImgString = "\u{f01c}"
        case "301":
            weatherImgString = "\u{f01c}"
        case "302":
            weatherImgString = "\u{f019}"
        case "310":
            weatherImgString = "\u{f017}"
        case "311":
            weatherImgString = "\u{f019}"
        case "312":
            weatherImgString = "\u{f019}"
        case "313":
            weatherImgString = "\u{f01a}"
        case "314":
            weatherImgString = "\u{f019}"
        case "321":
            weatherImgString = "\u{f01c}"
        case "500":
            weatherImgString = "\u{f01c}"
        case "501":
            weatherImgString = "\u{f019}"
        case "502":
            weatherImgString = "\u{f019}"
        case "503":
            weatherImgString = "\u{f019}"
        case "504":
            weatherImgString = "\u{f019}"
        case "511":
            weatherImgString = "\u{f017}"
        case "520":
            weatherImgString = "\u{f01a}"
        case "521":
            weatherImgString = "\u{f01a}"
        case "522":
            weatherImgString = "\u{f01a}"
        case "531":
            weatherImgString = "\u{f01d}"
        case "600":
            weatherImgString = "\u{f01b}"
        case "601":
            weatherImgString = "\u{f01b}"
        case "602":
            weatherImgString = "\u{f0b5}"
        case "611":
            weatherImgString = "\u{f017}"
        case "612":
            weatherImgString = "\u{f017}"
        case "615":
            weatherImgString = "\u{f017}"
        case "616":
            weatherImgString = "\u{f017}"
        case "620":
            weatherImgString = "\u{f017}"
        case "621":
            weatherImgString = "\u{f01b}"
        case "622":
            weatherImgString = "\u{f01b}"
        case "701":
            weatherImgString = "\u{f01a}"
        case "711":
            weatherImgString = "\u{f062}"
        case "721":
            weatherImgString = "\u{f0b6}"
        case "731":
            weatherImgString = "\u{f063}"
        case "741":
            weatherImgString = "\u{f014}"
        case "761":
            weatherImgString = "\u{f063}"
        case "762":
            weatherImgString = "\u{f063}"
        case "771":
            weatherImgString = "\u{f011}"
        case "781":
            weatherImgString = "\u{f056}"
        case "800":
            weatherImgString = "\u{f00d}"
        case "801":
            weatherImgString = "\u{f011}"
        case "802":
            weatherImgString = "\u{f011}"
        case "803":
            weatherImgString = "\u{f012}"
        case "804":
            weatherImgString = "\u{f013}"
        case "900":
            weatherImgString = "\u{f056}"
        case "901":
            weatherImgString = "\u{f01d}"
        case "902":
            weatherImgString = "\u{f073}"
        case "903":
            weatherImgString = "\u{f076}"
        case "904":
            weatherImgString = "\u{f072}"
        case "905":
            weatherImgString = "\u{f021}"
        case "906":
            weatherImgString = "\u{f015}"
        case "957":
            weatherImgString = "\u{f050}"
        default:
            print("icon 出錯啦")
        }
    }
 */
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

