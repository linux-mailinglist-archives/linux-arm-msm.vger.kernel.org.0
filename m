Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BD341BB24A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2020 01:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726495AbgD0X5T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Apr 2020 19:57:19 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:3807 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726472AbgD0X5T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Apr 2020 19:57:19 -0400
X-UUID: e4c8437aa40a471cb743922bcd70d065-20200428
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=4PG5NDEBrD4fO5vzTmIM1OqLtc9TFzvj1Pom1O6bbj0=;
        b=hM855UT/qYcScQoS1QHW0kcPRTdW/YiJuGwQfgDtFEHI2T/UP3H0PCKyrNtxZLKXRy4k+XCajPqUt9zlW8OhFmgoucPRP/4CdUHKQ8GXVU3bb7aUQaJqjXql4RVY2cq53bvMPHgmxdEDFrf3Bryz5aZHOVunv95zBUOlIZp4+XQ=;
X-UUID: e4c8437aa40a471cb743922bcd70d065-20200428
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <chun-hung.wu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1814683827; Tue, 28 Apr 2020 07:57:14 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Apr 2020 07:57:08 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 28 Apr 2020 07:57:13 +0800
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
Subject: [PATCH v5 3/5] mmc: mediatek: refine msdc timeout api
Date:   Tue, 28 Apr 2020 07:56:06 +0800
Message-ID: <1588031768-23677-4-git-send-email-chun-hung.wu@mediatek.com>
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

RXh0cmFjdCBtc2RjIHRpbWVvdXQgYXBpIGNvbW1vbiBwYXJ0IHRvIGhhdmUNCmJldHRlciBjb2Rl
IGFyY2hpdGVjdHVyZSBhbmQgYXZvaWQgcmVkdW5kZW50DQpjb2RlLg0KDQpTaWduZWQtb2ZmLWJ5
OiBDaHVuLUh1bmcgV3UgPGNodW4taHVuZy53dUBtZWRpYXRlay5jb20+DQotLS0NCiBkcml2ZXJz
L21tYy9ob3N0L210ay1zZC5jIHwgMzIgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0N
CiAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQoNCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL21tYy9ob3N0L210ay1zZC5jIGIvZHJpdmVycy9tbWMvaG9zdC9t
dGstc2QuYw0KaW5kZXggNzcyNmRjZi4uYTIzMjhmYiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbW1j
L2hvc3QvbXRrLXNkLmMNCisrKyBiL2RyaXZlcnMvbW1jL2hvc3QvbXRrLXNkLmMNCkBAIC02OTks
MjEgKzY5OSwyMSBAQCBzdGF0aWMgdm9pZCBtc2RjX3VucHJlcGFyZV9kYXRhKHN0cnVjdCBtc2Rj
X2hvc3QgKmhvc3QsIHN0cnVjdCBtbWNfcmVxdWVzdCAqbXJxKQ0KIAl9DQogfQ0KIA0KLS8qIGNs
b2NrIGNvbnRyb2wgcHJpbWl0aXZlcyAqLw0KLXN0YXRpYyB2b2lkIG1zZGNfc2V0X3RpbWVvdXQo
c3RydWN0IG1zZGNfaG9zdCAqaG9zdCwgdTMyIG5zLCB1MzIgY2xrcykNCitzdGF0aWMgdTY0IG1z
ZGNfdGltZW91dF9jYWwoc3RydWN0IG1zZGNfaG9zdCAqaG9zdCwgdTY0IG5zLCB1NjQgY2xrcykN
CiB7DQotCXUzMiB0aW1lb3V0LCBjbGtfbnM7DQorCXU2NCB0aW1lb3V0LCBjbGtfbnM7DQogCXUz
MiBtb2RlID0gMDsNCiANCi0JaG9zdC0+dGltZW91dF9ucyA9IG5zOw0KLQlob3N0LT50aW1lb3V0
X2Nsa3MgPSBjbGtzOw0KIAlpZiAoaG9zdC0+bW1jLT5hY3R1YWxfY2xvY2sgPT0gMCkgew0KIAkJ
dGltZW91dCA9IDA7DQogCX0gZWxzZSB7DQotCQljbGtfbnMgID0gMTAwMDAwMDAwMFVMIC8gaG9z
dC0+bW1jLT5hY3R1YWxfY2xvY2s7DQotCQl0aW1lb3V0ID0gKG5zICsgY2xrX25zIC0gMSkgLyBj
bGtfbnMgKyBjbGtzOw0KKwkJY2xrX25zICA9IDEwMDAwMDAwMDBVTEw7DQorCQlkb19kaXYoY2xr
X25zLCBob3N0LT5tbWMtPmFjdHVhbF9jbG9jayk7DQorCQl0aW1lb3V0ID0gbnMgKyBjbGtfbnMg
LSAxOw0KKwkJZG9fZGl2KHRpbWVvdXQsIGNsa19ucyk7DQorCQl0aW1lb3V0ICs9IGNsa3M7DQog
CQkvKiBpbiAxMDQ4NTc2IHNjbGsgY3ljbGUgdW5pdCAqLw0KLQkJdGltZW91dCA9ICh0aW1lb3V0
ICsgKDB4MSA8PCAyMCkgLSAxKSA+PiAyMDsNCisJCXRpbWVvdXQgPSBESVZfUk9VTkRfVVAodGlt
ZW91dCwgKDB4MSA8PCAyMCkpOw0KIAkJaWYgKGhvc3QtPmRldl9jb21wLT5jbGtfZGl2X2JpdHMg
PT0gOCkNCiAJCQlzZHJfZ2V0X2ZpZWxkKGhvc3QtPmJhc2UgKyBNU0RDX0NGRywNCiAJCQkJICAg
ICAgTVNEQ19DRkdfQ0tNT0QsICZtb2RlKTsNCkBAIC03MjMsOSArNzIzLDIxIEBAIHN0YXRpYyB2
b2lkIG1zZGNfc2V0X3RpbWVvdXQoc3RydWN0IG1zZGNfaG9zdCAqaG9zdCwgdTMyIG5zLCB1MzIg
Y2xrcykNCiAJCS8qRERSIG1vZGUgd2lsbCBkb3VibGUgdGhlIGNsayBjeWNsZXMgZm9yIGRhdGEg
dGltZW91dCAqLw0KIAkJdGltZW91dCA9IG1vZGUgPj0gMiA/IHRpbWVvdXQgKiAyIDogdGltZW91
dDsNCiAJCXRpbWVvdXQgPSB0aW1lb3V0ID4gMSA/IHRpbWVvdXQgLSAxIDogMDsNCi0JCXRpbWVv
dXQgPSB0aW1lb3V0ID4gMjU1ID8gMjU1IDogdGltZW91dDsNCiAJfQ0KLQlzZHJfc2V0X2ZpZWxk
KGhvc3QtPmJhc2UgKyBTRENfQ0ZHLCBTRENfQ0ZHX0RUT0MsIHRpbWVvdXQpOw0KKwlyZXR1cm4g
dGltZW91dDsNCit9DQorDQorLyogY2xvY2sgY29udHJvbCBwcmltaXRpdmVzICovDQorc3RhdGlj
IHZvaWQgbXNkY19zZXRfdGltZW91dChzdHJ1Y3QgbXNkY19ob3N0ICpob3N0LCB1NjQgbnMsIHU2
NCBjbGtzKQ0KK3sNCisJdTY0IHRpbWVvdXQ7DQorDQorCWhvc3QtPnRpbWVvdXRfbnMgPSBuczsN
CisJaG9zdC0+dGltZW91dF9jbGtzID0gY2xrczsNCisNCisJdGltZW91dCA9IG1zZGNfdGltZW91
dF9jYWwoaG9zdCwgbnMsIGNsa3MpOw0KKwlzZHJfc2V0X2ZpZWxkKGhvc3QtPmJhc2UgKyBTRENf
Q0ZHLCBTRENfQ0ZHX0RUT0MsDQorCQkgICAgICAodTMyKSh0aW1lb3V0ID4gMjU1ID8gMjU1IDog
dGltZW91dCkpOw0KIH0NCiANCiBzdGF0aWMgdm9pZCBtc2RjX2dhdGVfY2xvY2soc3RydWN0IG1z
ZGNfaG9zdCAqaG9zdCkNCi0tIA0KMi42LjQNCg==

