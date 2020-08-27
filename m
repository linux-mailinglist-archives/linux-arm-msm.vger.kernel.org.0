Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF58E254271
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Aug 2020 11:33:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728324AbgH0JdV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Aug 2020 05:33:21 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:43919 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726851AbgH0JdO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Aug 2020 05:33:14 -0400
X-UUID: d56d71e04f374e5a8d0e659889c3b18c-20200827
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=sOsx+/Ixg/H533GD9DuoQ2e+BVG8OHUWraoXKvxGaVM=;
        b=ddAY1fb9gsdG55Iau0UxKuq5MXY4ZuY4ZXmYZxpmfUKMTwHei30ED9qft498qqU9svQVDLC0N9pDiKGfV/A9R15y+S/gXsTmo3SsMhYGNJBUWm+f9H1MUkOxaZVJ0iu/7Y1TklEIENV9OW5WLItJbVDsHkPCoq0opZZHV+qjZi8=;
X-UUID: d56d71e04f374e5a8d0e659889c3b18c-20200827
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chun-hung.wu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 876698712; Thu, 27 Aug 2020 17:33:09 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 Aug 2020 17:33:07 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 27 Aug 2020 17:33:08 +0800
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
        Mao Yong <yong.mao@mediatek.com>,
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
        Asutosh Das <asutoshd@codeaurora.org>,
        Ritesh Harjani <riteshh@codeaurora.org>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Kuohong Wang <kuohong.wang@mediatek.com>
CC:     <kernel-team@android.com>, <linux-kernel@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <wsd_upstream@mediatek.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Chun-Hung Wu <chun-hung.wu@mediatek.com>
Subject: [PATCH v1 1/2] mmc: cqhci: add new cqhci_host_ops pre_enable() and post_disable()
Date:   Thu, 27 Aug 2020 17:33:02 +0800
Message-ID: <1598520783-25250-2-git-send-email-chun-hung.wu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1598520783-25250-1-git-send-email-chun-hung.wu@mediatek.com>
References: <1598520783-25250-1-git-send-email-chun-hung.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 1A51BED8B7CD5237DD2E95BA511B67CCBDB8EA47EF3D2DB61BDEFA5BDD9EBA022000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

QWRkIHByZV9lbmFibGUoKSBhbmQgcG9zdF9kaXNhYmxlKCkgZm9yIGNxaGNpX2hvc3Rfb3BzLg0K
QWRkIGhvb2sgZnVuY3Rpb25zIGJlZm9yZSBjcWhjaSBlbmFibGUgYW5kDQphZnRlciBjcWhjaSBk
aXNhYmxlIGZvciBwbGF0Zm9ybXMgbmVlZCB0aGVtLg0KDQpTaWduZWQtb2ZmLWJ5OiBDaHVuLUh1
bmcgV3UgPGNodW4taHVuZy53dUBtZWRpYXRlay5jb20+DQotLS0NCiBkcml2ZXJzL21tYy9ob3N0
L2NxaGNpLmMgfCAgICA2ICsrKysrKw0KIGRyaXZlcnMvbW1jL2hvc3QvY3FoY2kuaCB8ICAgIDIg
KysNCiAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tbWMvaG9zdC9jcWhjaS5jIGIvZHJpdmVycy9tbWMvaG9zdC9jcWhjaS5jDQppbmRleCBj
ZmE4N2RmLi42OTdmZTQwIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9tbWMvaG9zdC9jcWhjaS5jDQor
KysgYi9kcml2ZXJzL21tYy9ob3N0L2NxaGNpLmMNCkBAIC0zNzYsNiArMzc2LDkgQEAgc3RhdGlj
IHZvaWQgY3FoY2lfb2ZmKHN0cnVjdCBtbWNfaG9zdCAqbW1jKQ0KIAllbHNlDQogCQlwcl9kZWJ1
ZygiJXM6IGNxaGNpOiBDUUUgb2ZmXG4iLCBtbWNfaG9zdG5hbWUobW1jKSk7DQogDQorCWlmIChj
cV9ob3N0LT5vcHMtPnBvc3RfZGlzYWJsZSkNCisJCWNxX2hvc3QtPm9wcy0+cG9zdF9kaXNhYmxl
KG1tYyk7DQorDQogCW1tYy0+Y3FlX29uID0gZmFsc2U7DQogfQ0KIA0KQEAgLTU4MCw2ICs1ODMs
OSBAQCBzdGF0aWMgaW50IGNxaGNpX3JlcXVlc3Qoc3RydWN0IG1tY19ob3N0ICptbWMsIHN0cnVj
dCBtbWNfcmVxdWVzdCAqbXJxKQ0KIAkJX19jcWhjaV9lbmFibGUoY3FfaG9zdCk7DQogDQogCWlm
ICghbW1jLT5jcWVfb24pIHsNCisJCWlmIChjcV9ob3N0LT5vcHMtPnByZV9lbmFibGUpDQorCQkJ
Y3FfaG9zdC0+b3BzLT5wcmVfZW5hYmxlKG1tYyk7DQorDQogCQljcWhjaV93cml0ZWwoY3FfaG9z
dCwgMCwgQ1FIQ0lfQ1RMKTsNCiAJCW1tYy0+Y3FlX29uID0gdHJ1ZTsNCiAJCXByX2RlYnVnKCIl
czogY3FoY2k6IENRRSBvblxuIiwgbW1jX2hvc3RuYW1lKG1tYykpOw0KZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbW1jL2hvc3QvY3FoY2kuaCBiL2RyaXZlcnMvbW1jL2hvc3QvY3FoY2kuaA0KaW5kZXgg
NDM3NzAwMS4uODliZjZhZCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbW1jL2hvc3QvY3FoY2kuaA0K
KysrIGIvZHJpdmVycy9tbWMvaG9zdC9jcWhjaS5oDQpAQCAtMjA2LDYgKzIwNiw4IEBAIHN0cnVj
dCBjcWhjaV9ob3N0X29wcyB7DQogCXZvaWQgKCpkaXNhYmxlKShzdHJ1Y3QgbW1jX2hvc3QgKm1t
YywgYm9vbCByZWNvdmVyeSk7DQogCXZvaWQgKCp1cGRhdGVfZGNtZF9kZXNjKShzdHJ1Y3QgbW1j
X2hvc3QgKm1tYywgc3RydWN0IG1tY19yZXF1ZXN0ICptcnEsDQogCQkJCSB1NjQgKmRhdGEpOw0K
Kwl2b2lkICgqcHJlX2VuYWJsZSkoc3RydWN0IG1tY19ob3N0ICptbWMpOw0KKwl2b2lkICgqcG9z
dF9kaXNhYmxlKShzdHJ1Y3QgbW1jX2hvc3QgKm1tYyk7DQogfTsNCiANCiBzdGF0aWMgaW5saW5l
IHZvaWQgY3FoY2lfd3JpdGVsKHN0cnVjdCBjcWhjaV9ob3N0ICpob3N0LCB1MzIgdmFsLCBpbnQg
cmVnKQ0KLS0gDQoxLjcuOS41DQo=

