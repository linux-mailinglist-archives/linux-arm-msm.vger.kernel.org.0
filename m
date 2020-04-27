Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 485BF1BB252
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2020 01:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbgD0X5X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Apr 2020 19:57:23 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:16479 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726470AbgD0X5T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Apr 2020 19:57:19 -0400
X-UUID: 072fa0113eb34f04bdaa0a04aa8a9613-20200428
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=+sx88la9jukwwPydWrvJ7BtN1WCn5H7eGpl+1G7y/Z8=;
        b=BProQaA5YxpS9zb2gHI6qt5AEiojAjAcS8fvHYKRflGm1ef/v7+mufUppMhKC9EW2rQWj/s568CeUbGDnWrqcLzsIRROuM/k2R8I1Z8RhSl0q7iBD+LraaMFqlhyD5JHx+kXNdIJaJ+uy+T017RGSrD7KCRAhkgp1ayS80EwMxA=;
X-UUID: 072fa0113eb34f04bdaa0a04aa8a9613-20200428
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <chun-hung.wu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 769041113; Tue, 28 Apr 2020 07:57:14 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Apr 2020 07:57:08 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 28 Apr 2020 07:57:12 +0800
From:   Chun-Hung Wu <chun-hung.wu@mediatek.com>
To:     <mirq-linux@rere.qmqm.pl>, Jonathan Hunter <jonathanh@nvidia.com>,
        Al Cooper <alcooperx@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        <bcm-kernel-feedback-list@broadcom.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Pavel Machek <pavel@ucw.cz>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Pan Bian <bianpan2016@163.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        Mathieu Malaterre <malat@debian.org>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Kuohong Wang <kuohong.wang@mediatek.com>,
        Yong Mao <yong.mao@mediatek.com>
CC:     <kernel-team@android.com>, <linux-kernel@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <wsd_upstream@mediatek.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Chun-Hung Wu <chun-hung.wu@mediatek.com>
Subject: [PATCH v5 2/5] mmc: host: Remove redundant CQE bindings
Date:   Tue, 28 Apr 2020 07:56:05 +0800
Message-ID: <1588031768-23677-3-git-send-email-chun-hung.wu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1588031768-23677-1-git-send-email-chun-hung.wu@mediatek.com>
References: <1588031768-23677-1-git-send-email-chun-hung.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Q1FFIGJpbmRpbmdzICJzdXBwb3J0cy1jcWUiIGFuZCAiZGlzYWJsZS1jcWUtZGNtZCIgaXMgcGFy
c2VkDQppbiBtbWNfb2ZfcGFyc2UoKS4gUmVtb3ZlIHZlbmRvciBjb2RlIHdoaWNoIHBhcnNlcyBD
UUUgYmluZGluZ3MsDQphbmQgdXNlIG1tY19ob3N0LT5jYXBzMiB0byBkZWNpZGUgc3VwcG9ydCBD
UUUgb3Igbm90Lg0KDQpTaWduZWQtb2ZmLWJ5OiBDaHVuLUh1bmcgV3UgPGNodW4taHVuZy53dUBt
ZWRpYXRlay5jb20+DQpBY2tlZC1ieTogQWwgQ29vcGVyIDxhbGNvb3BlcnhAZ21haWwuY29tPg0K
LS0tDQogZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1icmNtc3RiLmMgICB8IDExICsrKysrKy0tLS0t
DQogZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1tc20uYyAgICAgICB8ICAzICstLQ0KIGRyaXZlcnMv
bW1jL2hvc3Qvc2RoY2ktb2YtYXJhc2FuLmMgfCAgMyAtLS0NCiBkcml2ZXJzL21tYy9ob3N0L3Nk
aGNpLXRlZ3JhLmMgICAgIHwgIDIgKy0NCiA0IGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KSwgMTEgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL21tYy9ob3N0L3NkaGNp
LWJyY21zdGIuYyBiL2RyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktYnJjbXN0Yi5jDQppbmRleCBhZDAx
ZjY0Li4wN2M5MGM2IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1icmNtc3Ri
LmMNCisrKyBiL2RyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktYnJjbXN0Yi5jDQpAQCAtMjQ3LDEwICsy
NDcsNiBAQCBzdGF0aWMgaW50IHNkaGNpX2JyY21zdGJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikNCiAJCXJldHVybiByZXM7DQogDQogCW1lbXNldCgmYnJjbXN0Yl9wZGF0YSwg
MCwgc2l6ZW9mKGJyY21zdGJfcGRhdGEpKTsNCi0JaWYgKGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jv
b2woJnBkZXYtPmRldiwgInN1cHBvcnRzLWNxZSIpKSB7DQotCQloYXNfY3FlID0gdHJ1ZTsNCi0J
CW1hdGNoX3ByaXYtPm9wcy0+aXJxID0gc2RoY2lfYnJjbXN0Yl9jcWhjaV9pcnE7DQotCX0NCiAJ
YnJjbXN0Yl9wZGF0YS5vcHMgPSBtYXRjaF9wcml2LT5vcHM7DQogCWhvc3QgPSBzZGhjaV9wbHRm
bV9pbml0KHBkZXYsICZicmNtc3RiX3BkYXRhLA0KIAkJCQlzaXplb2Yoc3RydWN0IHNkaGNpX2Jy
Y21zdGJfcHJpdikpOw0KQEAgLTI2MSw3ICsyNTcsNiBAQCBzdGF0aWMgaW50IHNkaGNpX2JyY21z
dGJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCiANCiAJcGx0Zm1faG9zdCA9
IHNkaGNpX3ByaXYoaG9zdCk7DQogCXByaXYgPSBzZGhjaV9wbHRmbV9wcml2KHBsdGZtX2hvc3Qp
Ow0KLQlwcml2LT5oYXNfY3FlID0gaGFzX2NxZTsNCiANCiAJLyogTWFwIGluIHRoZSBub24tc3Rh
bmRhcmQgQ0ZHIHJlZ2lzdGVycyAqLw0KIAlpb21lbSA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZShw
ZGV2LCBJT1JFU09VUkNFX01FTSwgMSk7DQpAQCAtMjc2LDYgKzI3MSwxMiBAQCBzdGF0aWMgaW50
IHNkaGNpX2JyY21zdGJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCiAJaWYg
KHJlcykNCiAJCWdvdG8gZXJyOw0KIA0KKwlpZiAoaG9zdC0+bW1jLT5jYXBzMiAmIE1NQ19DQVAy
X0NRRSkgew0KKwkJaGFzX2NxZSA9IHRydWU7DQorCQltYXRjaF9wcml2LT5vcHMtPmlycSA9IHNk
aGNpX2JyY21zdGJfY3FoY2lfaXJxOw0KKwl9DQorCXByaXYtPmhhc19jcWUgPSBoYXNfY3FlOw0K
Kw0KIAkvKg0KIAkgKiBJZiB0aGUgY2hpcCBoYXMgZW5oYW5jZWQgc3Ryb2JlIGFuZCBpdCdzIGVu
YWJsZWQsIGFkZA0KIAkgKiBjYWxsYmFjaw0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbW1jL2hvc3Qv
c2RoY2ktbXNtLmMgYi9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLW1zbS5jDQppbmRleCBjM2ExNjBj
Li5mYmIyZjU3IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1tc20uYw0KKysr
IGIvZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1tc20uYw0KQEAgLTE4ODAsNyArMTg4MCw2IEBAIHN0
YXRpYyBpbnQgc2RoY2lfbXNtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQog
CXU4IGNvcmVfbWFqb3I7DQogCWNvbnN0IHN0cnVjdCBzZGhjaV9tc21fb2Zmc2V0ICptc21fb2Zm
c2V0Ow0KIAljb25zdCBzdHJ1Y3Qgc2RoY2lfbXNtX3ZhcmlhbnRfaW5mbyAqdmFyX2luZm87DQot
CXN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSA9IHBkZXYtPmRldi5vZl9ub2RlOw0KIA0KIAlob3N0
ID0gc2RoY2lfcGx0Zm1faW5pdChwZGV2LCAmc2RoY2lfbXNtX3BkYXRhLCBzaXplb2YoKm1zbV9o
b3N0KSk7DQogCWlmIChJU19FUlIoaG9zdCkpDQpAQCAtMjA3Niw3ICsyMDc1LDcgQEAgc3RhdGlj
IGludCBzZGhjaV9tc21fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCiAJcG1f
cnVudGltZV91c2VfYXV0b3N1c3BlbmQoJnBkZXYtPmRldik7DQogDQogCWhvc3QtPm1tY19ob3N0
X29wcy5leGVjdXRlX3R1bmluZyA9IHNkaGNpX21zbV9leGVjdXRlX3R1bmluZzsNCi0JaWYgKG9m
X3Byb3BlcnR5X3JlYWRfYm9vbChub2RlLCAic3VwcG9ydHMtY3FlIikpDQorCWlmIChob3N0LT5t
bWMtPmNhcHMyICYgTU1DX0NBUDJfQ1FFKQ0KIAkJcmV0ID0gc2RoY2lfbXNtX2NxZV9hZGRfaG9z
dChob3N0LCBwZGV2KTsNCiAJZWxzZQ0KIAkJcmV0ID0gc2RoY2lfYWRkX2hvc3QoaG9zdCk7DQpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1vZi1hcmFzYW4uYyBiL2RyaXZlcnMv
bW1jL2hvc3Qvc2RoY2ktb2YtYXJhc2FuLmMNCmluZGV4IGU0OWI0NGIuLjM1OWVmZjYgMTAwNjQ0
DQotLS0gYS9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLWFyYXNhbi5jDQorKysgYi9kcml2ZXJz
L21tYy9ob3N0L3NkaGNpLW9mLWFyYXNhbi5jDQpAQCAtMTI4MSw5ICsxMjgxLDYgQEAgc3RhdGlj
IGludCBzZGhjaV9hcmFzYW5fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCiAJ
CQkJCXNkaGNpX2FyYXNhbl92b2x0YWdlX3N3aXRjaDsNCiAJCXNkaGNpX2FyYXNhbi0+aGFzX2Nx
ZSA9IHRydWU7DQogCQlob3N0LT5tbWMtPmNhcHMyIHw9IE1NQ19DQVAyX0NRRTsNCi0NCi0JCWlm
ICghb2ZfcHJvcGVydHlfcmVhZF9ib29sKG5wLCAiZGlzYWJsZS1jcWUtZGNtZCIpKQ0KLQkJCWhv
c3QtPm1tYy0+Y2FwczIgfD0gTU1DX0NBUDJfQ1FFX0RDTUQ7DQogCX0NCiANCiAJcmV0ID0gc2Ro
Y2lfYXJhc2FuX2FkZF9ob3N0KHNkaGNpX2FyYXNhbik7DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
bWMvaG9zdC9zZGhjaS10ZWdyYS5jIGIvZHJpdmVycy9tbWMvaG9zdC9zZGhjaS10ZWdyYS5jDQpp
bmRleCA0MDNhYzQ0Li5kMDlhYmRkIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9tbWMvaG9zdC9zZGhj
aS10ZWdyYS5jDQorKysgYi9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLXRlZ3JhLmMNCkBAIC03MTUs
NyArNzE1LDcgQEAgc3RhdGljIHZvaWQgdGVncmFfc2RoY2lfcGFyc2VfZHQoc3RydWN0IHNkaGNp
X2hvc3QgKmhvc3QpDQogCXN0cnVjdCBzZGhjaV9wbHRmbV9ob3N0ICpwbHRmbV9ob3N0ID0gc2Ro
Y2lfcHJpdihob3N0KTsNCiAJc3RydWN0IHNkaGNpX3RlZ3JhICp0ZWdyYV9ob3N0ID0gc2RoY2lf
cGx0Zm1fcHJpdihwbHRmbV9ob3N0KTsNCiANCi0JaWYgKGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jv
b2woaG9zdC0+bW1jLT5wYXJlbnQsICJzdXBwb3J0cy1jcWUiKSkNCisJaWYgKGhvc3QtPm1tYy0+
Y2FwczIgJiBNTUNfQ0FQMl9DUUUpDQogCQl0ZWdyYV9ob3N0LT5lbmFibGVfaHdjcSA9IHRydWU7
DQogCWVsc2UNCiAJCXRlZ3JhX2hvc3QtPmVuYWJsZV9od2NxID0gZmFsc2U7DQotLSANCjIuNi40
DQo=

