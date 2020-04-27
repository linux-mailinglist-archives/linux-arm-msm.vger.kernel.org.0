Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56F481BB241
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2020 01:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgD0X5S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Apr 2020 19:57:18 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:3807 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726355AbgD0X5S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Apr 2020 19:57:18 -0400
X-UUID: d81cef179746473c9e5ea4be07c45f40-20200428
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=aI88OR5SoOs9oP8eEG6yM2tCCWEGm3PDTnuHvBFnmpg=;
        b=KE7SstV4bwvN+YCOdoKCXfKRyg7mhOAKILQa7nJERn3w3DCd+1JUkMPcoofMTKi98F5oqmBOoIif1PsMkCfmb3IxGowaBYbB/PD0C9ZDFF4kf1q019cZI2Oexh+T7qOhvA0+dZS+40Wz95rhs9jltandraGtcAaUkoxZiQVWR2k=;
X-UUID: d81cef179746473c9e5ea4be07c45f40-20200428
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <chun-hung.wu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1311210949; Tue, 28 Apr 2020 07:57:14 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Apr 2020 07:57:08 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 28 Apr 2020 07:56:09 +0800
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
Subject: [PATCH v5 0/5] mmc: mediatek: add mmc cqhci support
Date:   Tue, 28 Apr 2020 07:56:03 +0800
Message-ID: <1588031768-23677-1-git-send-email-chun-hung.wu@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

VGhpcyBzZXJpZXMgcHJvdmlkZXMgTWVkaWFUZWsgY3FoY2kgaW1wbGVtZW50YXRpb25zIGFzIGJl
bG93Og0KICAtIEV4dGVuZCBtbWNfb2ZfcGFyc2UoKSB0byBwYXJzZSBDUUUgYmluZGluZ3MNCiAg
LSBSZW1vdmUgcmVkdW5kYW50IGhvc3QgQ1FFIGJpbmRpbmdzDQogIC0gUmVmaW5lIG1zZGMgdGlt
ZW91dCBhcGkgdG8gcmVkdWNlIHJlZHVuZGFudCBjb2RlDQogIC0gTWVkaWFUZWsgY29tbWFuZCBx
dWV1ZSBzdXBwb3J0DQogIC0gZHQtYmluZGluZ3MgZm9yIG10Njc3OQ0KDQp2MSAtPiB2MjoNCiAg
LSBBZGQgbW9yZSBwYXRjaCBkZXRhaWxzIGluIGNvbW1pdCBtZXNzYWdlDQogIC0gU2VwYXJhdGUg
bXNkYyB0aW1lb3V0IGFwaSByZWZpbmUgdG8gaW5kaXZpZHVhbCBwYXRjaA0KDQp2MiAtPiB2MzoN
CiAgLSBSZW1vdmUgQ1ItSWQsIENoYW5nZS1JZCBhbmQgRmVhdHVyZSBpbiBwYXRjaGVzDQogIC0g
QWRkIFNpZ25lZC1vZmYtYnkgaW4gcGF0Y2hlcw0KDQp2MyAtPiB2NDoNCiAgLSBSZWZpbmUgQ1FF
IGJpbmRpbmdzIGluIG1tY19vZl9wYXJzZSAoVWxmIEhhbnNzb24pDQogIC0gUmVtb3ZlIHJlZHVu
ZGFudCBob3N0IENRRSBiaW5kaW5ncyAoTGludXggV2FsbGVpaikNCg0KdjQgLT4gdjU6DQogIC0g
QWRkIEFja2VkLWJ5IGFuZCBtb3JlIG1haW50YWluZXJzDQoNCkNodW4tSHVuZyBXdSAoNSk6DQog
IFsxLzVdIG1tYzogY29yZTogRXh0ZW5kIG1tY19vZl9wYXJzZSgpIHRvIHBhcnNlIENRRSBiaW5k
aW5ncw0KICBbMi81XSBtbWM6IGhvc3Q6IFJlbW92ZSByZWR1bmRhbnQgQ1FFIGJpbmRpbmdzDQog
IFszLzVdIG1tYzogbWVkaWF0ZWs6IHJlZmluZSBtc2RjIHRpbWVvdXQgYXBpDQogIFs0LzVdIG1t
YzogbWVkaWF0ZWs6IGNvbW1hbmQgcXVldWUgc3VwcG9ydA0KICBbNS81XSBkdC1iaW5kaW5nczog
bW1jOiBtZWRpYXRlazogQWRkIGRvY3VtZW50IGZvciBtdDY3NzkNCg0KIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvbXRrLXNkLnR4dCB8ICAgMSArDQogZHJpdmVycy9tbWMv
Y29yZS9ob3N0LmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA1ICsNCiBkcml2ZXJzL21t
Yy9ob3N0L210ay1zZC5jICAgICAgICAgICAgICAgICAgICAgICAgfCAxNTEgKysrKysrKysrKysr
KysrKysrKysrLS0NCiBkcml2ZXJzL21tYy9ob3N0L3NkaGNpLWJyY21zdGIuYyAgICAgICAgICAg
ICAgICAgfCAgMTEgKy0NCiBkcml2ZXJzL21tYy9ob3N0L3NkaGNpLW1zbS5jICAgICAgICAgICAg
ICAgICAgICAgfCAgIDMgKy0NCiBkcml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLWFyYXNhbi5jICAg
ICAgICAgICAgICAgfCAgIDMgLQ0KIGRyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktdGVncmEuYyAgICAg
ICAgICAgICAgICAgICB8ICAgMiArLQ0KIDcgZmlsZXMgY2hhbmdlZCwgMTU1IGluc2VydGlvbnMo
KyksIDIxIGRlbGV0aW9ucygtKQ0KDQotLSANCjIuNi40DQo=

