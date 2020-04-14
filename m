Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2DEF1A6FFE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 02:22:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390409AbgDNAWc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 20:22:32 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:24421 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727878AbgDNAW3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 20:22:29 -0400
X-UUID: 4b5dded000a94e5a9fad9dcc8006c109-20200414
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=Qfibg8F6E8+hj4EjDr9mFBEQ8hTeGgupZlAGc7uyKyo=;
        b=lpQqBfweIWwe8jBJW65IqHCihW5yAxLHNlfg3nL954aJXU0+KftOg/lYpsmkqI4txLOBh5MVyztEOnN1ujLPyiBzyJCqTCG7tuQL37vlWPxlXrlt76chHztjCSkMlSrZ3EgQ0+2Kvoxc8mOacHHO0HJGuGSQAgfso+c2omoSFMs=;
X-UUID: 4b5dded000a94e5a9fad9dcc8006c109-20200414
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <chun-hung.wu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 662297651; Tue, 14 Apr 2020 08:22:21 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Apr 2020 08:22:13 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Apr 2020 08:22:13 +0800
Message-ID: <1586823738.16047.7.camel@mtkswgap22>
Subject: Re: [PATCH 2/5] [2/5] mmc: host: Remove redundant host CQE bindings
From:   Chun-Hung Wu <chun-hung.wu@mediatek.com>
To:     Alan Cooper <alcooperx@gmail.com>
CC:     <mirq-linux@rere.qmqm.pl>, Jonathan Hunter <jonathanh@nvidia.com>,
        "Adrian Hunter" <adrian.hunter@intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Michal Simek" <michal.simek@xilinx.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        Pavel Machek <pavel@ucw.cz>,
        "Kate Stewart" <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Pan Bian <bianpan2016@163.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        Mathieu Malaterre <malat@debian.org>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Kuohong Wang <kuohong.wang@mediatek.com>,
        <kernel-team@android.com>,
        ": Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        DTML <devicetree@vger.kernel.org>, <wsd_upstream@mediatek.com>,
        "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Date:   Tue, 14 Apr 2020 08:22:18 +0800
In-Reply-To: <CAOGqxeUjx+OWRhwWznk-uHZ9op7WTZaAGq6xd4Z4QdL+Hja2yA@mail.gmail.com>
References: <1586165281-11888-1-git-send-email-chun-hung.wu@mediatek.com>
         <1586165281-11888-3-git-send-email-chun-hung.wu@mediatek.com>
         <CAOGqxeUjx+OWRhwWznk-uHZ9op7WTZaAGq6xd4Z4QdL+Hja2yA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 77A645C6C1487FDA3CF0BD874F90ED07C2006FF3480317B16A64447FB4E51E462000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

T24gTW9uLCAyMDIwLTA0LTA2IGF0IDA5OjU5IC0wNDAwLCBBbGFuIENvb3BlciB3cm90ZToNCj4g
T24gTW9uLCBBcHIgNiwgMjAyMCBhdCA1OjI4IEFNIENodW4tSHVuZyBXdSA8Y2h1bi1odW5nLnd1
QG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBDUUUgYmluZGluZ3MgInN1cHBvcnRzLWNx
ZSIgYW5kICJkaXNhYmxlLWNxZS1kY21kIiBpcyBwYXJzZWQNCj4gPiBpbiBtbWNfb2ZfcGFyc2Uo
KS4gUmVtb3ZlIHZlbmRvciBjb2RlIHdoaWNoIHBhcnNlcyBDUUUgYmluZGluZ3MsDQo+ID4gYW5k
IHVzZSBtbWNfaG9zdC0+Y2FwczIgdG8gZGVjaWRlIHN1cHBvcnQgQ1FFIG9yIG5vdC4NCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IENodW4tSHVuZyBXdSA8Y2h1bi1odW5nLnd1QG1lZGlhdGVrLmNv
bT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1icmNtc3RiLmMgICB8IDEx
ICsrKysrKy0tLS0tDQo+ID4gIGRyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktbXNtLmMgICAgICAgfCAg
MyArLS0NCj4gPiAgZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1vZi1hcmFzYW4uYyB8ICAzIC0tLQ0K
PiA+ICBkcml2ZXJzL21tYy9ob3N0L3NkaGNpLXRlZ3JhLmMgICAgIHwgIDIgKy0NCj4gPiAgNCBm
aWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktYnJjbXN0Yi5jIGIvZHJpdmVycy9t
bWMvaG9zdC9zZGhjaS1icmNtc3RiLmMNCj4gPiBpbmRleCBhZDAxZjY0Li4wN2M5MGM2IDEwMDY0
NA0KPiA+IC0tLSBhL2RyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktYnJjbXN0Yi5jDQo+ID4gKysrIGIv
ZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1icmNtc3RiLmMNCj4gPiBAQCAtMjQ3LDEwICsyNDcsNiBA
QCBzdGF0aWMgaW50IHNkaGNpX2JyY21zdGJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikNCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIHJlczsNCj4gPg0KPiA+ICAgICAgICAg
bWVtc2V0KCZicmNtc3RiX3BkYXRhLCAwLCBzaXplb2YoYnJjbXN0Yl9wZGF0YSkpOw0KPiA+IC0g
ICAgICAgaWYgKGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woJnBkZXYtPmRldiwgInN1cHBvcnRz
LWNxZSIpKSB7DQo+ID4gLSAgICAgICAgICAgICAgIGhhc19jcWUgPSB0cnVlOw0KPiA+IC0gICAg
ICAgICAgICAgICBtYXRjaF9wcml2LT5vcHMtPmlycSA9IHNkaGNpX2JyY21zdGJfY3FoY2lfaXJx
Ow0KPiANCj4gVGhlIGFib3ZlIGxpbmUgdGhhdCBzZXRzIHRoZSBpcnEgd2FzIG1vdmVkIHRvIGxh
dGVyIGluIHRoZSBmdW5jdGlvbiwNCj4gYnV0IG5lZWRzIHRvIGNvbWUgYmVmb3JlIHNkaGNpX3Bs
dGZtX2luaXQoKQ0KPiANCj4gQWwNCkFmdGVyIGNoZWNrIHRoZSBjb2RlIGluIHNkaGNpX3BsdGZt
X2luaXQoKSwgSSBkb24ndCBzZWUgd2hlcmUNCm1hdGNoX3ByaXYtPm9wcy0+aXJxIGJlaW5nIHVz
ZWQgaW4gY29kZSBzZWN0aW9uLg0KT25seSAiaG9zdC0+b3BzID0gcGRhdGEtPm9wczsiIGlzIGFz
c2lnbmVkLCBtYXkgSSBrbm93IHdoeSBzaG91bGQNCndlIHB1dCBtYXRjaF9wcml2LT5vcHMtPmly
cSA9IHNkaGNpX2JyY21zdGJfY3FoY2lfaXJxOyBiZWZvcmUNCnNkaGNpX3BsdGZtX2luaXQoKT8N
CkJ5IHRoZSB3YXksIGhvc3Qgb25seSBhZGRlZCB0byBrZXJuZWwgYWZ0ZXIgc2RoY2lfYnJjbXN0
Yl9hZGRfaG9zdCgpLA0KU28sIEkgc3VwcG9zZSBpc3IgYXNzaWdubWVudCBpcyBvayBiZWZvcmUg
YW55d2hlcmUgb2YgaXQuIA0KPiANCj4gPiAtICAgICAgIH0NCj4gPiAgICAgICAgIGJyY21zdGJf
cGRhdGEub3BzID0gbWF0Y2hfcHJpdi0+b3BzOw0KPiA+ICAgICAgICAgaG9zdCA9IHNkaGNpX3Bs
dGZtX2luaXQocGRldiwgJmJyY21zdGJfcGRhdGEsDQo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzaXplb2Yoc3RydWN0IHNkaGNpX2JyY21zdGJfcHJpdikpOw0KPiA+IEBAIC0y
NjEsNyArMjU3LDYgQEAgc3RhdGljIGludCBzZGhjaV9icmNtc3RiX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4NCj4gPiAgICAgICAgIHBsdGZtX2hvc3QgPSBzZGhjaV9w
cml2KGhvc3QpOw0KPiA+ICAgICAgICAgcHJpdiA9IHNkaGNpX3BsdGZtX3ByaXYocGx0Zm1faG9z
dCk7DQo+ID4gLSAgICAgICBwcml2LT5oYXNfY3FlID0gaGFzX2NxZTsNCj4gPg0KPiA+ICAgICAg
ICAgLyogTWFwIGluIHRoZSBub24tc3RhbmRhcmQgQ0ZHIHJlZ2lzdGVycyAqLw0KPiA+ICAgICAg
ICAgaW9tZW0gPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwgSU9SRVNPVVJDRV9NRU0sIDEp
Ow0KPiA+IEBAIC0yNzYsNiArMjcxLDEyIEBAIHN0YXRpYyBpbnQgc2RoY2lfYnJjbXN0Yl9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICAgICAgICAgaWYgKHJlcykNCj4g
PiAgICAgICAgICAgICAgICAgZ290byBlcnI7DQo+ID4NCj4gPiArICAgICAgIGlmIChob3N0LT5t
bWMtPmNhcHMyICYgTU1DX0NBUDJfQ1FFKSB7DQo+ID4gKyAgICAgICAgICAgICAgIGhhc19jcWUg
PSB0cnVlOw0KPiA+ICsgICAgICAgICAgICAgICBtYXRjaF9wcml2LT5vcHMtPmlycSA9IHNkaGNp
X2JyY21zdGJfY3FoY2lfaXJxOw0KPiA+ICsgICAgICAgfQ0KPiA+ICsgICAgICAgcHJpdi0+aGFz
X2NxZSA9IGhhc19jcWU7DQo+ID4gKw0KPiA+ICAgICAgICAgLyoNCj4gPiAgICAgICAgICAqIElm
IHRoZSBjaGlwIGhhcyBlbmhhbmNlZCBzdHJvYmUgYW5kIGl0J3MgZW5hYmxlZCwgYWRkDQo+ID4g
ICAgICAgICAgKiBjYWxsYmFjaw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21tYy9ob3N0L3Nk
aGNpLW1zbS5jIGIvZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1tc20uYw0KPiA+IGluZGV4IGMzYTE2
MGMuLmZiYjJmNTcgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1tc20u
Yw0KPiA+ICsrKyBiL2RyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktbXNtLmMNCj4gPiBAQCAtMTg4MCw3
ICsxODgwLDYgQEAgc3RhdGljIGludCBzZGhjaV9tc21fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikNCj4gPiAgICAgICAgIHU4IGNvcmVfbWFqb3I7DQo+ID4gICAgICAgICBjb25z
dCBzdHJ1Y3Qgc2RoY2lfbXNtX29mZnNldCAqbXNtX29mZnNldDsNCj4gPiAgICAgICAgIGNvbnN0
IHN0cnVjdCBzZGhjaV9tc21fdmFyaWFudF9pbmZvICp2YXJfaW5mbzsNCj4gPiAtICAgICAgIHN0
cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSA9IHBkZXYtPmRldi5vZl9ub2RlOw0KPiA+DQo+ID4gICAg
ICAgICBob3N0ID0gc2RoY2lfcGx0Zm1faW5pdChwZGV2LCAmc2RoY2lfbXNtX3BkYXRhLCBzaXpl
b2YoKm1zbV9ob3N0KSk7DQo+ID4gICAgICAgICBpZiAoSVNfRVJSKGhvc3QpKQ0KPiA+IEBAIC0y
MDc2LDcgKzIwNzUsNyBAQCBzdGF0aWMgaW50IHNkaGNpX21zbV9wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQ0KPiA+ICAgICAgICAgcG1fcnVudGltZV91c2VfYXV0b3N1c3BlbmQo
JnBkZXYtPmRldik7DQo+ID4NCj4gPiAgICAgICAgIGhvc3QtPm1tY19ob3N0X29wcy5leGVjdXRl
X3R1bmluZyA9IHNkaGNpX21zbV9leGVjdXRlX3R1bmluZzsNCj4gPiAtICAgICAgIGlmIChvZl9w
cm9wZXJ0eV9yZWFkX2Jvb2wobm9kZSwgInN1cHBvcnRzLWNxZSIpKQ0KPiA+ICsgICAgICAgaWYg
KGhvc3QtPm1tYy0+Y2FwczIgJiBNTUNfQ0FQMl9DUUUpDQo+ID4gICAgICAgICAgICAgICAgIHJl
dCA9IHNkaGNpX21zbV9jcWVfYWRkX2hvc3QoaG9zdCwgcGRldik7DQo+ID4gICAgICAgICBlbHNl
DQo+ID4gICAgICAgICAgICAgICAgIHJldCA9IHNkaGNpX2FkZF9ob3N0KGhvc3QpOw0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLWFyYXNhbi5jIGIvZHJpdmVycy9t
bWMvaG9zdC9zZGhjaS1vZi1hcmFzYW4uYw0KPiA+IGluZGV4IGU0OWI0NGIuLjM1OWVmZjYgMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1vZi1hcmFzYW4uYw0KPiA+ICsr
KyBiL2RyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktb2YtYXJhc2FuLmMNCj4gPiBAQCAtMTI4MSw5ICsx
MjgxLDYgQEAgc3RhdGljIGludCBzZGhjaV9hcmFzYW5fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c2RoY2lfYXJhc2FuX3ZvbHRhZ2Vfc3dpdGNoOw0KPiA+ICAgICAgICAgICAgICAgICBzZGhjaV9h
cmFzYW4tPmhhc19jcWUgPSB0cnVlOw0KPiA+ICAgICAgICAgICAgICAgICBob3N0LT5tbWMtPmNh
cHMyIHw9IE1NQ19DQVAyX0NRRTsNCj4gPiAtDQo+ID4gLSAgICAgICAgICAgICAgIGlmICghb2Zf
cHJvcGVydHlfcmVhZF9ib29sKG5wLCAiZGlzYWJsZS1jcWUtZGNtZCIpKQ0KPiA+IC0gICAgICAg
ICAgICAgICAgICAgICAgIGhvc3QtPm1tYy0+Y2FwczIgfD0gTU1DX0NBUDJfQ1FFX0RDTUQ7DQo+
ID4gICAgICAgICB9DQo+ID4NCj4gPiAgICAgICAgIHJldCA9IHNkaGNpX2FyYXNhbl9hZGRfaG9z
dChzZGhjaV9hcmFzYW4pOw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21tYy9ob3N0L3NkaGNp
LXRlZ3JhLmMgYi9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLXRlZ3JhLmMNCj4gPiBpbmRleCA0MDNh
YzQ0Li5kMDlhYmRkIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktdGVn
cmEuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktdGVncmEuYw0KPiA+IEBAIC03
MTUsNyArNzE1LDcgQEAgc3RhdGljIHZvaWQgdGVncmFfc2RoY2lfcGFyc2VfZHQoc3RydWN0IHNk
aGNpX2hvc3QgKmhvc3QpDQo+ID4gICAgICAgICBzdHJ1Y3Qgc2RoY2lfcGx0Zm1faG9zdCAqcGx0
Zm1faG9zdCA9IHNkaGNpX3ByaXYoaG9zdCk7DQo+ID4gICAgICAgICBzdHJ1Y3Qgc2RoY2lfdGVn
cmEgKnRlZ3JhX2hvc3QgPSBzZGhjaV9wbHRmbV9wcml2KHBsdGZtX2hvc3QpOw0KPiA+DQo+ID4g
LSAgICAgICBpZiAoZGV2aWNlX3Byb3BlcnR5X3JlYWRfYm9vbChob3N0LT5tbWMtPnBhcmVudCwg
InN1cHBvcnRzLWNxZSIpKQ0KPiA+ICsgICAgICAgaWYgKGhvc3QtPm1tYy0+Y2FwczIgJiBNTUNf
Q0FQMl9DUUUpDQo+ID4gICAgICAgICAgICAgICAgIHRlZ3JhX2hvc3QtPmVuYWJsZV9od2NxID0g
dHJ1ZTsNCj4gPiAgICAgICAgIGVsc2UNCj4gPiAgICAgICAgICAgICAgICAgdGVncmFfaG9zdC0+
ZW5hYmxlX2h3Y3EgPSBmYWxzZTsNCj4gPiAtLQ0KPiA+IDEuOS4xDQoNCg==

