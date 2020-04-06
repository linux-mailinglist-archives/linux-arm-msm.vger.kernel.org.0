Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F79719F293
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2020 11:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbgDFJ2Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Apr 2020 05:28:25 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:22353 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726621AbgDFJ2X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Apr 2020 05:28:23 -0400
X-UUID: 1955524c2a5a4241a0b1b4b93527f277-20200406
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=MWNDe8xiBMP9rQl7Ip5z2SzbYK+nzQInXthBu/WoeY4=;
        b=SPJXejwP86lXCRSA/h1CdJVVoQx3OSO2PCusnTh5m3ug5sVTY5ID/dOpTgrty0mo2iFYErC7jXbqZyitRPBB5RsPr/Z1qDEBNvVlKoswjDdeRUxg/g6YKap/YXDbthFYkb2ydpvYJonHtcUI+MyFpxBpag702L9cMgMPigBSbTo=;
X-UUID: 1955524c2a5a4241a0b1b4b93527f277-20200406
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <chun-hung.wu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 724451446; Mon, 06 Apr 2020 17:28:04 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Apr 2020 17:28:03 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 6 Apr 2020 17:28:02 +0800
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
Subject: [PATCH 2/5] [2/5] mmc: host: Remove redundant host CQE bindings
Date:   Mon, 6 Apr 2020 17:27:58 +0800
Message-ID: <1586165281-11888-3-git-send-email-chun-hung.wu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1586165281-11888-1-git-send-email-chun-hung.wu@mediatek.com>
References: <1586165281-11888-1-git-send-email-chun-hung.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 3A9531E2BC7618BFEB04D1E964ADCBD4D2135A383C34C28A1E705DD966F2B10A2000:8
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
ZWRpYXRlay5jb20+DQotLS0NCiBkcml2ZXJzL21tYy9ob3N0L3NkaGNpLWJyY21zdGIuYyAgIHwg
MTEgKysrKysrLS0tLS0NCiBkcml2ZXJzL21tYy9ob3N0L3NkaGNpLW1zbS5jICAgICAgIHwgIDMg
Ky0tDQogZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1vZi1hcmFzYW4uYyB8ICAzIC0tLQ0KIGRyaXZl
cnMvbW1jL2hvc3Qvc2RoY2ktdGVncmEuYyAgICAgfCAgMiArLQ0KIDQgZmlsZXMgY2hhbmdlZCwg
OCBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bW1jL2hvc3Qvc2RoY2ktYnJjbXN0Yi5jIGIvZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1icmNtc3Ri
LmMNCmluZGV4IGFkMDFmNjQuLjA3YzkwYzYgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL21tYy9ob3N0
L3NkaGNpLWJyY21zdGIuYw0KKysrIGIvZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1icmNtc3RiLmMN
CkBAIC0yNDcsMTAgKzI0Nyw2IEBAIHN0YXRpYyBpbnQgc2RoY2lfYnJjbXN0Yl9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KIAkJcmV0dXJuIHJlczsNCiANCiAJbWVtc2V0KCZi
cmNtc3RiX3BkYXRhLCAwLCBzaXplb2YoYnJjbXN0Yl9wZGF0YSkpOw0KLQlpZiAoZGV2aWNlX3By
b3BlcnR5X3JlYWRfYm9vbCgmcGRldi0+ZGV2LCAic3VwcG9ydHMtY3FlIikpIHsNCi0JCWhhc19j
cWUgPSB0cnVlOw0KLQkJbWF0Y2hfcHJpdi0+b3BzLT5pcnEgPSBzZGhjaV9icmNtc3RiX2NxaGNp
X2lycTsNCi0JfQ0KIAlicmNtc3RiX3BkYXRhLm9wcyA9IG1hdGNoX3ByaXYtPm9wczsNCiAJaG9z
dCA9IHNkaGNpX3BsdGZtX2luaXQocGRldiwgJmJyY21zdGJfcGRhdGEsDQogCQkJCXNpemVvZihz
dHJ1Y3Qgc2RoY2lfYnJjbXN0Yl9wcml2KSk7DQpAQCAtMjYxLDcgKzI1Nyw2IEBAIHN0YXRpYyBp
bnQgc2RoY2lfYnJjbXN0Yl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KIA0K
IAlwbHRmbV9ob3N0ID0gc2RoY2lfcHJpdihob3N0KTsNCiAJcHJpdiA9IHNkaGNpX3BsdGZtX3By
aXYocGx0Zm1faG9zdCk7DQotCXByaXYtPmhhc19jcWUgPSBoYXNfY3FlOw0KIA0KIAkvKiBNYXAg
aW4gdGhlIG5vbi1zdGFuZGFyZCBDRkcgcmVnaXN0ZXJzICovDQogCWlvbWVtID0gcGxhdGZvcm1f
Z2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAxKTsNCkBAIC0yNzYsNiArMjcxLDEy
IEBAIHN0YXRpYyBpbnQgc2RoY2lfYnJjbXN0Yl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQ0KIAlpZiAocmVzKQ0KIAkJZ290byBlcnI7DQogDQorCWlmIChob3N0LT5tbWMtPmNh
cHMyICYgTU1DX0NBUDJfQ1FFKSB7DQorCQloYXNfY3FlID0gdHJ1ZTsNCisJCW1hdGNoX3ByaXYt
Pm9wcy0+aXJxID0gc2RoY2lfYnJjbXN0Yl9jcWhjaV9pcnE7DQorCX0NCisJcHJpdi0+aGFzX2Nx
ZSA9IGhhc19jcWU7DQorDQogCS8qDQogCSAqIElmIHRoZSBjaGlwIGhhcyBlbmhhbmNlZCBzdHJv
YmUgYW5kIGl0J3MgZW5hYmxlZCwgYWRkDQogCSAqIGNhbGxiYWNrDQpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tbWMvaG9zdC9zZGhjaS1tc20uYyBiL2RyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktbXNtLmMN
CmluZGV4IGMzYTE2MGMuLmZiYjJmNTcgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL21tYy9ob3N0L3Nk
aGNpLW1zbS5jDQorKysgYi9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLW1zbS5jDQpAQCAtMTg4MCw3
ICsxODgwLDYgQEAgc3RhdGljIGludCBzZGhjaV9tc21fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikNCiAJdTggY29yZV9tYWpvcjsNCiAJY29uc3Qgc3RydWN0IHNkaGNpX21zbV9v
ZmZzZXQgKm1zbV9vZmZzZXQ7DQogCWNvbnN0IHN0cnVjdCBzZGhjaV9tc21fdmFyaWFudF9pbmZv
ICp2YXJfaW5mbzsNCi0Jc3RydWN0IGRldmljZV9ub2RlICpub2RlID0gcGRldi0+ZGV2Lm9mX25v
ZGU7DQogDQogCWhvc3QgPSBzZGhjaV9wbHRmbV9pbml0KHBkZXYsICZzZGhjaV9tc21fcGRhdGEs
IHNpemVvZigqbXNtX2hvc3QpKTsNCiAJaWYgKElTX0VSUihob3N0KSkNCkBAIC0yMDc2LDcgKzIw
NzUsNyBAQCBzdGF0aWMgaW50IHNkaGNpX21zbV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQ0KIAlwbV9ydW50aW1lX3VzZV9hdXRvc3VzcGVuZCgmcGRldi0+ZGV2KTsNCiANCiAJ
aG9zdC0+bW1jX2hvc3Rfb3BzLmV4ZWN1dGVfdHVuaW5nID0gc2RoY2lfbXNtX2V4ZWN1dGVfdHVu
aW5nOw0KLQlpZiAob2ZfcHJvcGVydHlfcmVhZF9ib29sKG5vZGUsICJzdXBwb3J0cy1jcWUiKSkN
CisJaWYgKGhvc3QtPm1tYy0+Y2FwczIgJiBNTUNfQ0FQMl9DUUUpDQogCQlyZXQgPSBzZGhjaV9t
c21fY3FlX2FkZF9ob3N0KGhvc3QsIHBkZXYpOw0KIAllbHNlDQogCQlyZXQgPSBzZGhjaV9hZGRf
aG9zdChob3N0KTsNCmRpZmYgLS1naXQgYS9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLWFyYXNh
bi5jIGIvZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1vZi1hcmFzYW4uYw0KaW5kZXggZTQ5YjQ0Yi4u
MzU5ZWZmNiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktb2YtYXJhc2FuLmMN
CisrKyBiL2RyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktb2YtYXJhc2FuLmMNCkBAIC0xMjgxLDkgKzEy
ODEsNiBAQCBzdGF0aWMgaW50IHNkaGNpX2FyYXNhbl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQ0KIAkJCQkJc2RoY2lfYXJhc2FuX3ZvbHRhZ2Vfc3dpdGNoOw0KIAkJc2RoY2lf
YXJhc2FuLT5oYXNfY3FlID0gdHJ1ZTsNCiAJCWhvc3QtPm1tYy0+Y2FwczIgfD0gTU1DX0NBUDJf
Q1FFOw0KLQ0KLQkJaWYgKCFvZl9wcm9wZXJ0eV9yZWFkX2Jvb2wobnAsICJkaXNhYmxlLWNxZS1k
Y21kIikpDQotCQkJaG9zdC0+bW1jLT5jYXBzMiB8PSBNTUNfQ0FQMl9DUUVfRENNRDsNCiAJfQ0K
IA0KIAlyZXQgPSBzZGhjaV9hcmFzYW5fYWRkX2hvc3Qoc2RoY2lfYXJhc2FuKTsNCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLXRlZ3JhLmMgYi9kcml2ZXJzL21tYy9ob3N0L3Nk
aGNpLXRlZ3JhLmMNCmluZGV4IDQwM2FjNDQuLmQwOWFiZGQgMTAwNjQ0DQotLS0gYS9kcml2ZXJz
L21tYy9ob3N0L3NkaGNpLXRlZ3JhLmMNCisrKyBiL2RyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktdGVn
cmEuYw0KQEAgLTcxNSw3ICs3MTUsNyBAQCBzdGF0aWMgdm9pZCB0ZWdyYV9zZGhjaV9wYXJzZV9k
dChzdHJ1Y3Qgc2RoY2lfaG9zdCAqaG9zdCkNCiAJc3RydWN0IHNkaGNpX3BsdGZtX2hvc3QgKnBs
dGZtX2hvc3QgPSBzZGhjaV9wcml2KGhvc3QpOw0KIAlzdHJ1Y3Qgc2RoY2lfdGVncmEgKnRlZ3Jh
X2hvc3QgPSBzZGhjaV9wbHRmbV9wcml2KHBsdGZtX2hvc3QpOw0KIA0KLQlpZiAoZGV2aWNlX3By
b3BlcnR5X3JlYWRfYm9vbChob3N0LT5tbWMtPnBhcmVudCwgInN1cHBvcnRzLWNxZSIpKQ0KKwlp
ZiAoaG9zdC0+bW1jLT5jYXBzMiAmIE1NQ19DQVAyX0NRRSkNCiAJCXRlZ3JhX2hvc3QtPmVuYWJs
ZV9od2NxID0gdHJ1ZTsNCiAJZWxzZQ0KIAkJdGVncmFfaG9zdC0+ZW5hYmxlX2h3Y3EgPSBmYWxz
ZTsNCi0tIA0KMS45LjENCg==

