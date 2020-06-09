Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E6551F31CC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 03:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbgFIBSp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jun 2020 21:18:45 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:38761 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727054AbgFIBSm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jun 2020 21:18:42 -0400
X-UUID: beecd13be69e4e808ca06af73a51ec66-20200609
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=0WegPlvM9vUi/d04qilRhSbRo+qKS3G08/0Uft4NY9Y=;
        b=W0f2kTvtOYn4UFFLCR8XuwN+Wjr9Ce3Oxk1hSNvBRC2kQJY96fFPqQvAOr1dHEL8+3v+Po72OxsSQpaUb9z5EhkgvJE130yBNKTb69/5CI116rhDXoY9j/8+xt/G8jRGSo2N0X+qGZm8R3dgBPAFhzNVaB5gDBy54vk7tWYPQF0=;
X-UUID: beecd13be69e4e808ca06af73a51ec66-20200609
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chun-hung.wu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1490740505; Tue, 09 Jun 2020 09:18:34 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Jun 2020 09:18:32 +0800
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
Subject: [PATCH v6 0/4] mmc: mediatek: add mmc cqhci support
Date:   Tue, 9 Jun 2020 09:18:18 +0800
Message-ID: <1591665502-6573-1-git-send-email-chun-hung.wu@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: F4D6614A1A95732A3231291BAAF20B2BCD9D03A15DF698C063B4A42EA2E20AE42000:8
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
QWRkIEFja2VkLWJ5IGFuZCBtb3JlIG1haW50YWluZXJzDQoNCnY1IC0+IHY2Og0KICAtIE1vdmUg
Q1FFIGJpbmRpbmdzIGJhY2sgdG8gdmVuZG9yIGRyaXZlcg0KICAtIEFkZCBtdDY3NzkgbW1jIHN1
cHBvcnQgYXMgYW4gaW5kaXZpZHVhbCBwYXRjaA0KICAtIEVycm9yIGhhbmRsaW5nIGZvciBjcV9o
b3N0IGRldm1fa3phbGxvKCkNCg0KQ2h1bi1IdW5nIFd1ICg0KToNCiAgWzEvNF0gbW1jOiBtZWRp
YXRlazogYWRkIE1UNjc3OSBNTUMgZHJpdmVyIHN1cHBvcnQNCiAgWzIvNF0gbW1jOiBtZWRpYXRl
azogcmVmaW5lIG1zZGMgdGltZW91dCBhcGkNCiAgWzMvNF0gbW1jOiBtZWRpYXRlazogY29tbWFu
ZCBxdWV1ZSBzdXBwb3J0DQogIFs0LzRdIGR0LWJpbmRpbmdzOiBtbWM6IG1lZGlhdGVrOiBBZGQg
ZG9jdW1lbnQgZm9yIG10Njc3OQ0KDQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L21tYy9tdGstc2QudHh0IHwgICA0ICsNCiBkcml2ZXJzL21tYy9ob3N0L210ay1zZC5jICAgICAg
ICAgICAgICAgICAgICAgICAgfCAxNjQgKysrKysrKysrKysrKysrKysrKysrLS0NCiAyIGZpbGVz
IGNoYW5nZWQsIDE1OCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCg0KLS0gDQoxLjku
MQ0K

