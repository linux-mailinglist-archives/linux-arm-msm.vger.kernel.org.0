Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 632781BB250
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2020 01:57:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726517AbgD0X5X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Apr 2020 19:57:23 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:7418 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726472AbgD0X5W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Apr 2020 19:57:22 -0400
X-UUID: 1596a3af7b894470a7fc18519ca4281e-20200428
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=KIB6Wc6OlR9OdFAkZ9URtiP7nJvudaOVXuS/SxVSoHI=;
        b=HzTCrtEY7w6Mok7Rc1XGpr/fP31B0pG7BUs7dT8C+j1WH++jGa0LghhBAd0TKByhzz+7WGxnFgqCZzd8Om3RCX1QivdDFEWZKjvqCiuNWGWOk6sQdj3mmgOSeu8fsQqbMlspzfZghkaHoSS/dJaGDn4mn3smUPnZyC4ko9hp2Bk=;
X-UUID: 1596a3af7b894470a7fc18519ca4281e-20200428
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <chun-hung.wu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 122815350; Tue, 28 Apr 2020 07:57:14 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
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
Subject: [PATCH v5 1/5] mmc: core: Extend mmc_of_parse() to parse CQE bindings
Date:   Tue, 28 Apr 2020 07:56:04 +0800
Message-ID: <1588031768-23677-2-git-send-email-chun-hung.wu@mediatek.com>
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
ICZkcnZfdHlwZSkgPT0gMCkgew0KLS0gDQoyLjYuNA0K

