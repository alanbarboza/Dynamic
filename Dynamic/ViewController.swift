//
//  ViewController.swift
//  Dynamic
//
//  Created by Alan Barboza on 19/01/19.
//  Copyright © 2019 Alan Barboza. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var webViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var html = "<header><meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0'></header>"
        html += "<h1>Duo Reges: constructio interrete.</h1>"
        html += "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nos paucis ad haec additis finem faciamus aliquando; <a href=\"#\" target=\"_blank\">Paulum, cum regem Persem captum adduceret, eodem flumine invectio?</a> Quo modo autem optimum, si bonum praeterea nullum est? Ipse Epicurus fortasse redderet, ut Sextus Peducaeus, Sex. At ille pellit, qui permulcet sensum voluptate. Quae cum dixisset, finem ille. <a href=\"#\" target=\"_blank\">Gerendus est mos, modo recte sentiat.</a> <i>Consequens enim est et post oritur, ut dixi.</i> </p>"
        html += "<ol><li>An est aliquid per se ipsum flagitiosum, etiamsi nulla comitetur infamia?</li><li>Nec vero alia sunt quaerenda contra Carneadeam illam sententiam.</li></ol>"
        html += "<p>Et si turpitudinem fugimus in statu et motu corporis, quid est cur pulchritudinem non sequamur? <b>A mene tu?</b> Si mala non sunt, iacet omnis ratio Peripateticorum. Tecum optime, deinde etiam cum mediocri amico. Deinceps videndum est, quoniam satis apertum est sibi quemque natura esse carum, quae sit hominis natura. </p>"
        html += "<h2>Sed ego in hoc resisto;</h2>"
        html += "<p>Huic mori optimum esse propter desperationem sapientiae, illi propter spem vivere. Et quod est munus, quod opus sapientiae? Si longus, levis dictata sunt. Facit enim ille duo seiuncta ultima bonorum, quae ut essent vera, coniungi debuerunt; <i>Ecce aliud simile dissimile.</i> Cur tantas regiones barbarorum pedibus obiit, tot maria transmisit? Oculorum, inquit Plato, est in nobis sensus acerrimus, quibus sapientiam non cernimus.</p>"
        
        self.webView.loadHTMLString(html, baseURL: nil)
        self.webView.scrollView.isScrollEnabled = false
        self.webView.navigationDelegate = self

    }

}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.webViewHeight.constant = webView.scrollView.contentSize.height
        }
    }
}
