Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BF5B1F31D7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 03:21:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbgFIBSv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jun 2020 21:18:51 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:10754 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727846AbgFIBSs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jun 2020 21:18:48 -0400
X-UUID: 24b93e8a0e9c43f88eaff07ddcb15f07-20200609
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=f4+67G7xgWOFI4Df7srHiquevOClsUeUQ0E//bDoxO4=;
        b=cbaAN1ONuGok0Ml+8hEnDNHB1l3rsNFg1i+qh9MueUzxr84MxjQQFaxcIfESECP9U/uzgGJqfp7NSzVbU7FnCbRlbCWC71V4R0Ua9DHq6UZtyq0iQbkOyNPpitjkw1J2fkU9Fzk7T7WrxJ20bGPOFK2jZb1BhYupf0bGkla8hIA=;
X-UUID: 24b93e8a0e9c43f88eaff07ddcb15f07-20200609
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <chun-hung.wu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1119152382; Tue, 09 Jun 2020 09:18:37 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Jun 2020 09:18:29 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 9 Jun 2020 09:18:32 +0800
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
Subject: [PATCH v6 1/4] mmc: mediatek: add MT6779 MMC driver support
Date:   Tue, 9 Jun 2020 09:18:19 +0800
Message-ID: <1591665502-6573-2-git-send-email-chun-hung.wu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1591665502-6573-1-git-send-email-chun-hung.wu@mediatek.com>
References: <1591665502-6573-1-git-send-email-chun-hung.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: A85D7183B572A39BDF0A8A2A597D719FFF5365D541C623C15841B4593F5CEF132000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

TVQ2Nzc5IGFkZCBjcWhjaSBzdXBwb3J0LCBzbyBuZWVkIHRvIGFkZCBuZXcgY29kZQ0KdG8gc3Vw
cG9ydCBpdC4NCg0KU2lnbmVkLW9mZi1ieTogQ2h1bi1IdW5nIFd1IDxjaHVuLWh1bmcud3VAbWVk
aWF0ZWsuY29tPg0KLS0tDQogZHJpdmVycy9tbWMvaG9zdC9tdGstc2QuYyB8IDEzICsrKysrKysr
KysrKysNCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tbWMvaG9zdC9tdGstc2QuYyBiL2RyaXZlcnMvbW1jL2hvc3QvbXRrLXNkLmMNCmlu
ZGV4IGIyMjFjMDIuLjhhZGE2NzUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL21tYy9ob3N0L210ay1z
ZC5jDQorKysgYi9kcml2ZXJzL21tYy9ob3N0L210ay1zZC5jDQpAQCAtNTM4LDYgKzUzOCwxOCBA
QCBzdHJ1Y3QgbXNkY19ob3N0IHsNCiAJLnVzZV9pbnRlcm5hbF9jZCA9IHRydWUsDQogfTsNCiAN
CitzdGF0aWMgY29uc3Qgc3RydWN0IG10a19tbWNfY29tcGF0aWJsZSBtdDY3NzlfY29tcGF0ID0g
ew0KKwkuY2xrX2Rpdl9iaXRzID0gMTIsDQorCS5oczQwMF90dW5lID0gZmFsc2UsDQorCS5wYWRf
dHVuZV9yZWcgPSBNU0RDX1BBRF9UVU5FMCwNCisJLmFzeW5jX2ZpZm8gPSB0cnVlLA0KKwkuZGF0
YV90dW5lID0gdHJ1ZSwNCisJLmJ1c3lfY2hlY2sgPSB0cnVlLA0KKwkuc3RvcF9jbGtfZml4ID0g
dHJ1ZSwNCisJLmVuaGFuY2VfcnggPSB0cnVlLA0KKwkuc3VwcG9ydF82NGcgPSB0cnVlLA0KK307
DQorDQogc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXNkY19vZl9pZHNbXSA9IHsN
CiAJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxMzUtbW1jIiwgLmRhdGEgPSAmbXQ4MTM1
X2NvbXBhdH0sDQogCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTczLW1tYyIsIC5kYXRh
ID0gJm10ODE3M19jb21wYXR9LA0KQEAgLTU0Nyw2ICs1NTksNyBAQCBzdHJ1Y3QgbXNkY19ob3N0
IHsNCiAJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDc2MjItbW1jIiwgLmRhdGEgPSAmbXQ3
NjIyX2NvbXBhdH0sDQogCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4NTE2LW1tYyIsIC5k
YXRhID0gJm10ODUxNl9jb21wYXR9LA0KIAl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10NzYy
MC1tbWMiLCAuZGF0YSA9ICZtdDc2MjBfY29tcGF0fSwNCisJeyAuY29tcGF0aWJsZSA9ICJtZWRp
YXRlayxtdDY3NzktbW1jIiwgLmRhdGEgPSAmbXQ2Nzc5X2NvbXBhdH0sDQogCXt9DQogfTsNCiBN
T0RVTEVfREVWSUNFX1RBQkxFKG9mLCBtc2RjX29mX2lkcyk7DQotLSANCjEuOS4xDQo=

