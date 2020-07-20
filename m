Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C58BB225515
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 02:43:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbgGTAnG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Jul 2020 20:43:06 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:46765 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726577AbgGTAmy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Jul 2020 20:42:54 -0400
X-UUID: 0cd6a751f3a14a51a82852678aed2b43-20200720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=juG6BnX41+DeE6Q27S76GMbkvGJcmbG29m+dVuuEOXo=;
        b=rvlvlbUcUREd56eWXcM+xZM9O/VGdEbe9/5ysKIOjaBSPx6FRASQ6Y65aOcDtO+/yABGBGtnTTWvuivmW2AwaREvE94A464EHlKfCHOYOaO0byar/VZVEuTWITCVWqQq5VPjhLrCncVKocw1/RwdSH//J9U7ZyPCuRMwZRRA/Ek=;
X-UUID: 0cd6a751f3a14a51a82852678aed2b43-20200720
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chun-hung.wu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 841372942; Mon, 20 Jul 2020 08:42:45 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Jul 2020 08:42:43 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 20 Jul 2020 08:42:43 +0800
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
        Kuohong Wang <kuohong.wang@mediatek.com>
CC:     <kernel-team@android.com>, <linux-kernel@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <wsd_upstream@mediatek.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Chun-Hung Wu <chun-hung.wu@mediatek.com>
Subject: [PATCH v7 2/4] mmc: mediatek: refine msdc timeout api
Date:   Mon, 20 Jul 2020 08:42:37 +0800
Message-ID: <1595205759-5825-3-git-send-email-chun-hung.wu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1595205759-5825-1-git-send-email-chun-hung.wu@mediatek.com>
References: <1595205759-5825-1-git-send-email-chun-hung.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: C4513997F2F8320F12D325293F26DF128DB1966A082367BFE74571B7E9C474092000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

RXh0cmFjdCBtc2RjIHRpbWVvdXQgYXBpIGNvbW1vbiBwYXJ0IHRvIGhhdmUNCmJldHRlciBjb2Rl
IGFyY2hpdGVjdHVyZSBhbmQgYXZvaWQgcmVkdW5kYW50IGNvZGUuDQoNClNpZ25lZC1vZmYtYnk6
IENodW4tSHVuZyBXdSA8Y2h1bi1odW5nLnd1QG1lZGlhdGVrLmNvbT4NCi0tLQ0KIGRyaXZlcnMv
bW1jL2hvc3QvbXRrLXNkLmMgfCAzMiArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQ0K
IDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCg0KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbW1jL2hvc3QvbXRrLXNkLmMgYi9kcml2ZXJzL21tYy9ob3N0L210
ay1zZC5jDQppbmRleCBlZDM3YTNjLi4zNDdlZDcyIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9tbWMv
aG9zdC9tdGstc2QuYw0KKysrIGIvZHJpdmVycy9tbWMvaG9zdC9tdGstc2QuYw0KQEAgLTcyMywy
MSArNzIzLDIxIEBAIHN0YXRpYyB2b2lkIG1zZGNfdW5wcmVwYXJlX2RhdGEoc3RydWN0IG1zZGNf
aG9zdCAqaG9zdCwgc3RydWN0IG1tY19yZXF1ZXN0ICptcnEpDQogCX0NCiB9DQogDQotLyogY2xv
Y2sgY29udHJvbCBwcmltaXRpdmVzICovDQotc3RhdGljIHZvaWQgbXNkY19zZXRfdGltZW91dChz
dHJ1Y3QgbXNkY19ob3N0ICpob3N0LCB1MzIgbnMsIHUzMiBjbGtzKQ0KK3N0YXRpYyB1NjQgbXNk
Y190aW1lb3V0X2NhbChzdHJ1Y3QgbXNkY19ob3N0ICpob3N0LCB1NjQgbnMsIHU2NCBjbGtzKQ0K
IHsNCi0JdTMyIHRpbWVvdXQsIGNsa19uczsNCisJdTY0IHRpbWVvdXQsIGNsa19uczsNCiAJdTMy
IG1vZGUgPSAwOw0KIA0KLQlob3N0LT50aW1lb3V0X25zID0gbnM7DQotCWhvc3QtPnRpbWVvdXRf
Y2xrcyA9IGNsa3M7DQogCWlmIChob3N0LT5tbWMtPmFjdHVhbF9jbG9jayA9PSAwKSB7DQogCQl0
aW1lb3V0ID0gMDsNCiAJfSBlbHNlIHsNCi0JCWNsa19ucyAgPSAxMDAwMDAwMDAwVUwgLyBob3N0
LT5tbWMtPmFjdHVhbF9jbG9jazsNCi0JCXRpbWVvdXQgPSAobnMgKyBjbGtfbnMgLSAxKSAvIGNs
a19ucyArIGNsa3M7DQorCQljbGtfbnMgID0gMTAwMDAwMDAwMFVMTDsNCisJCWRvX2RpdihjbGtf
bnMsIGhvc3QtPm1tYy0+YWN0dWFsX2Nsb2NrKTsNCisJCXRpbWVvdXQgPSBucyArIGNsa19ucyAt
IDE7DQorCQlkb19kaXYodGltZW91dCwgY2xrX25zKTsNCisJCXRpbWVvdXQgKz0gY2xrczsNCiAJ
CS8qIGluIDEwNDg1NzYgc2NsayBjeWNsZSB1bml0ICovDQotCQl0aW1lb3V0ID0gKHRpbWVvdXQg
KyAoMHgxIDw8IDIwKSAtIDEpID4+IDIwOw0KKwkJdGltZW91dCA9IERJVl9ST1VORF9VUCh0aW1l
b3V0LCAoMHgxIDw8IDIwKSk7DQogCQlpZiAoaG9zdC0+ZGV2X2NvbXAtPmNsa19kaXZfYml0cyA9
PSA4KQ0KIAkJCXNkcl9nZXRfZmllbGQoaG9zdC0+YmFzZSArIE1TRENfQ0ZHLA0KIAkJCQkgICAg
ICBNU0RDX0NGR19DS01PRCwgJm1vZGUpOw0KQEAgLTc0Nyw5ICs3NDcsMjEgQEAgc3RhdGljIHZv
aWQgbXNkY19zZXRfdGltZW91dChzdHJ1Y3QgbXNkY19ob3N0ICpob3N0LCB1MzIgbnMsIHUzMiBj
bGtzKQ0KIAkJLypERFIgbW9kZSB3aWxsIGRvdWJsZSB0aGUgY2xrIGN5Y2xlcyBmb3IgZGF0YSB0
aW1lb3V0ICovDQogCQl0aW1lb3V0ID0gbW9kZSA+PSAyID8gdGltZW91dCAqIDIgOiB0aW1lb3V0
Ow0KIAkJdGltZW91dCA9IHRpbWVvdXQgPiAxID8gdGltZW91dCAtIDEgOiAwOw0KLQkJdGltZW91
dCA9IHRpbWVvdXQgPiAyNTUgPyAyNTUgOiB0aW1lb3V0Ow0KIAl9DQotCXNkcl9zZXRfZmllbGQo
aG9zdC0+YmFzZSArIFNEQ19DRkcsIFNEQ19DRkdfRFRPQywgdGltZW91dCk7DQorCXJldHVybiB0
aW1lb3V0Ow0KK30NCisNCisvKiBjbG9jayBjb250cm9sIHByaW1pdGl2ZXMgKi8NCitzdGF0aWMg
dm9pZCBtc2RjX3NldF90aW1lb3V0KHN0cnVjdCBtc2RjX2hvc3QgKmhvc3QsIHU2NCBucywgdTY0
IGNsa3MpDQorew0KKwl1NjQgdGltZW91dDsNCisNCisJaG9zdC0+dGltZW91dF9ucyA9IG5zOw0K
Kwlob3N0LT50aW1lb3V0X2Nsa3MgPSBjbGtzOw0KKw0KKwl0aW1lb3V0ID0gbXNkY190aW1lb3V0
X2NhbChob3N0LCBucywgY2xrcyk7DQorCXNkcl9zZXRfZmllbGQoaG9zdC0+YmFzZSArIFNEQ19D
RkcsIFNEQ19DRkdfRFRPQywNCisJCSAgICAgICh1MzIpKHRpbWVvdXQgPiAyNTUgPyAyNTUgOiB0
aW1lb3V0KSk7DQogfQ0KIA0KIHN0YXRpYyB2b2lkIG1zZGNfZ2F0ZV9jbG9jayhzdHJ1Y3QgbXNk
Y19ob3N0ICpob3N0KQ0KLS0gDQoxLjkuMQ0K

