Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4075819F283
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2020 11:28:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgDFJ2Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Apr 2020 05:28:24 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:40133 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726691AbgDFJ2X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Apr 2020 05:28:23 -0400
X-UUID: e1fbba31212849089817f05cd655f285-20200406
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=srrLwmXWOsczNhYEI0r57sCOdKX0qiPArgR8S/J7H+U=;
        b=L0NHiUrqjNGBMyWYrJjHkLgOM7VDUBoeGOzLanUU8XYi3YwSL6zfwFPRcb7OWDzwl4kuBKdgk+0ADruwlyqPMmcQnLyJXtk9ragxXo96LKYsP4EU0SQHKfjnM4rO9egFuEBlo27BBUTNI8Fjc932DPW2pFxsNrlehuyPEtnrpWY=;
X-UUID: e1fbba31212849089817f05cd655f285-20200406
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chun-hung.wu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1333813333; Mon, 06 Apr 2020 17:28:03 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Apr 2020 17:28:02 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 6 Apr 2020 17:28:01 +0800
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
Subject: [PATCH 1/5] [1/5] mmc: core: Extend mmc_of_parse() to parse CQE bindings
Date:   Mon, 6 Apr 2020 17:27:57 +0800
Message-ID: <1586165281-11888-2-git-send-email-chun-hung.wu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1586165281-11888-1-git-send-email-chun-hung.wu@mediatek.com>
References: <1586165281-11888-1-git-send-email-chun-hung.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 31970E197ED6CDA124A0AA6672FCC67F20B8B96C7BEB98C749FB250F256067A82000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

UGFyc2UgQ1FFIGJpbmRpbmdzICJzdXBwb3J0cy1jcWUiIGFuZCAiZGlzYWJsZS1jcWUtZGNtZCIN
CmluIG1tY19vZl9wYXJzZSgpLg0KDQpTaWduZWQtb2ZmLWJ5OiBDaHVuLUh1bmcgV3UgPGNodW4t
aHVuZy53dUBtZWRpYXRlay5jb20+DQotLS0NCiBkcml2ZXJzL21tYy9jb3JlL2hvc3QuYyB8IDUg
KysrKysNCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9k
cml2ZXJzL21tYy9jb3JlL2hvc3QuYyBiL2RyaXZlcnMvbW1jL2NvcmUvaG9zdC5jDQppbmRleCBj
ODc2ODcyLi40NzUyMWM2IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9tbWMvY29yZS9ob3N0LmMNCisr
KyBiL2RyaXZlcnMvbW1jL2NvcmUvaG9zdC5jDQpAQCAtMzAyLDYgKzMwMiwxMSBAQCBpbnQgbW1j
X29mX3BhcnNlKHN0cnVjdCBtbWNfaG9zdCAqaG9zdCkNCiAJCWhvc3QtPmNhcHMyIHw9IE1NQ19D
QVAyX05PX1NEOw0KIAlpZiAoZGV2aWNlX3Byb3BlcnR5X3JlYWRfYm9vbChkZXYsICJuby1tbWMi
KSkNCiAJCWhvc3QtPmNhcHMyIHw9IE1NQ19DQVAyX05PX01NQzsNCisJaWYgKGRldmljZV9wcm9w
ZXJ0eV9yZWFkX2Jvb2woZGV2LCAic3VwcG9ydHMtY3FlIikpDQorCQlob3N0LT5jYXBzMiB8PSBN
TUNfQ0FQMl9DUUU7DQorCWlmICghZGV2aWNlX3Byb3BlcnR5X3JlYWRfYm9vbChkZXYsICJkaXNh
YmxlLWNxZS1kY21kIikpIHsNCisJCWhvc3QtPmNhcHMyIHw9IE1NQ19DQVAyX0NRRV9EQ01EOw0K
Kwl9DQogDQogCS8qIE11c3QgYmUgYWZ0ZXIgIm5vbi1yZW1vdmFibGUiIGNoZWNrICovDQogCWlm
IChkZXZpY2VfcHJvcGVydHlfcmVhZF91MzIoZGV2LCAiZml4ZWQtZW1tYy1kcml2ZXItdHlwZSIs
ICZkcnZfdHlwZSkgPT0gMCkgew0KLS0gDQoxLjkuMQ0K

