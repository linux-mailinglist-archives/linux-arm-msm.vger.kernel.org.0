Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AECF2254275
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Aug 2020 11:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728295AbgH0Jdd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Aug 2020 05:33:33 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:31883 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728185AbgH0JdV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Aug 2020 05:33:21 -0400
X-UUID: 769124425ee14970af7de22d87642884-20200827
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=jsb359q+NGh2miLjbc2pS9a2c+qg5R24NLYz1yPyyVs=;
        b=rwNtUAX92pp2645XUIWWpaXH3s8VntsbPZnnw9SLC/j41zm2vhKgT5OYx5uBg3AZn4Hc1oGlM8Yk6yJ0ah5cAT7HCdtYuglfXBizId0SnEwrBYoy8R0Tm1gN2syszM2iSUzJJCPik1TVE749ouqgFVkdONWWxIiuyC930TM5rIY=;
X-UUID: 769124425ee14970af7de22d87642884-20200827
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <chun-hung.wu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 946813072; Thu, 27 Aug 2020 17:33:11 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 Aug 2020 17:33:09 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 27 Aug 2020 17:33:09 +0800
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
Subject: [PATCH  v1 2/2] mmc: mediatek: add pre_enable() and post_disable() hook function
Date:   Thu, 27 Aug 2020 17:33:03 +0800
Message-ID: <1598520783-25250-3-git-send-email-chun-hung.wu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1598520783-25250-1-git-send-email-chun-hung.wu@mediatek.com>
References: <1598520783-25250-1-git-send-email-chun-hung.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: CEDAC856A48AA8E85B313FDFD3A88ACA8C2DE2FDB18C66AA2FE8F852F30379052000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Q1FIQ0lfRU5BQkxFIGJpdCBpbiBDUUhDSV9DRkcgc2hvdWxkIGJlIGRpc2FibGVkDQphZnRlciBt
c2RjX2NxZV9kaXNhYmxlKCksIGFuZCBzaG91bGQgYmUgZW5hYmxlZCBiZWZvcmUNCm1zZGNfY2Vx
X2VuYWJsZSgpIGZvciBNVEsgcGxhdGZvcm0uDQpBZGQgaG9vayBmdW5jdGlvbnMgZm9yIGNxaGNp
X2hvc3Rfb3BzLT5wcmVfZW5hYmxlKCkgYW5kDQpjcWhjaV9ob3N0X29wcy0+cG9zdF9kaXNhYmxl
KCkuDQoNClNpZ25lZC1vZmYtYnk6IENodW4tSHVuZyBXdSA8Y2h1bi1odW5nLnd1QG1lZGlhdGVr
LmNvbT4NCi0tLQ0KIGRyaXZlcnMvbW1jL2hvc3QvbXRrLXNkLmMgfCAgIDIyICsrKysrKysrKysr
KysrKysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tbWMvaG9zdC9tdGstc2QuYyBiL2RyaXZlcnMvbW1jL2hvc3QvbXRrLXNk
LmMNCmluZGV4IDRlMjU4M2YuLmY1M2UxMWIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL21tYy9ob3N0
L210ay1zZC5jDQorKysgYi9kcml2ZXJzL21tYy9ob3N0L210ay1zZC5jDQpAQCAtMjI4Miw2ICsy
MjgyLDI2IEBAIHN0YXRpYyB2b2lkIG1zZGNfY3FlX2Rpc2FibGUoc3RydWN0IG1tY19ob3N0ICpt
bWMsIGJvb2wgcmVjb3ZlcnkpDQogCX0NCiB9DQogDQorc3RhdGljIHZvaWQgbXNkY19jcWVfcHJl
X2VuYWJsZShzdHJ1Y3QgbW1jX2hvc3QgKm1tYykNCit7DQorCXN0cnVjdCBjcWhjaV9ob3N0ICpj
cV9ob3N0ID0gbW1jLT5jcWVfcHJpdmF0ZTsNCisJdTMyIHJlZzsNCisNCisJcmVnID0gY3FoY2lf
cmVhZGwoY3FfaG9zdCwgQ1FIQ0lfQ0ZHKTsNCisJcmVnIHw9IENRSENJX0VOQUJMRTsNCisJY3Fo
Y2lfd3JpdGVsKGNxX2hvc3QsIHJlZywgQ1FIQ0lfQ0ZHKTsNCit9DQorDQorc3RhdGljIHZvaWQg
bXNkY19jcWVfcG9zdF9kaXNhYmxlKHN0cnVjdCBtbWNfaG9zdCAqbW1jKQ0KK3sNCisJc3RydWN0
IGNxaGNpX2hvc3QgKmNxX2hvc3QgPSBtbWMtPmNxZV9wcml2YXRlOw0KKwl1MzIgcmVnOw0KKw0K
KwlyZWcgPSBjcWhjaV9yZWFkbChjcV9ob3N0LCBDUUhDSV9DRkcpOw0KKwlyZWcgJj0gfkNRSENJ
X0VOQUJMRTsNCisJY3FoY2lfd3JpdGVsKGNxX2hvc3QsIHJlZywgQ1FIQ0lfQ0ZHKTsNCit9DQor
DQogc3RhdGljIGNvbnN0IHN0cnVjdCBtbWNfaG9zdF9vcHMgbXRfbXNkY19vcHMgPSB7DQogCS5w
b3N0X3JlcSA9IG1zZGNfcG9zdF9yZXEsDQogCS5wcmVfcmVxID0gbXNkY19wcmVfcmVxLA0KQEAg
LTIzMDEsNiArMjMyMSw4IEBAIHN0YXRpYyB2b2lkIG1zZGNfY3FlX2Rpc2FibGUoc3RydWN0IG1t
Y19ob3N0ICptbWMsIGJvb2wgcmVjb3ZlcnkpDQogc3RhdGljIGNvbnN0IHN0cnVjdCBjcWhjaV9o
b3N0X29wcyBtc2RjX2NtZHFfb3BzID0gew0KIAkuZW5hYmxlICAgICAgICAgPSBtc2RjX2NxZV9l
bmFibGUsDQogCS5kaXNhYmxlICAgICAgICA9IG1zZGNfY3FlX2Rpc2FibGUsDQorCS5wcmVfZW5h
YmxlID0gbXNkY19jcWVfcHJlX2VuYWJsZSwNCisJLnBvc3RfZGlzYWJsZSA9IG1zZGNfY3FlX3Bv
c3RfZGlzYWJsZSwNCiB9Ow0KIA0KIHN0YXRpYyB2b2lkIG1zZGNfb2ZfcHJvcGVydHlfcGFyc2Uo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwNCi0tIA0KMS43LjkuNQ0K

