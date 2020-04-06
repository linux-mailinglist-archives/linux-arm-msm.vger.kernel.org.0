Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B380019F280
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2020 11:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbgDFJ2U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Apr 2020 05:28:20 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:34236 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726670AbgDFJ2U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Apr 2020 05:28:20 -0400
X-UUID: 3656757b538e40b09f487adb9db2799c-20200406
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Eb9PeHDUAD6Sk82KJ2hdDxB7g4C2DRSe1cr+DuQ+Mn4=;
        b=KGR+0bgKXMvM7qweK5tOETDijq2A0M6NHep2PzMwb/R2lqJzZBMKL8AAVZe8kFJJy7xdnxuumU6FMbt7Vr2MOZFuLS4tBBrCedqrVBAHTCl0RrHf4zCvSSilap1ceUVQxSYs7f9PfHWrjwOpcl8Y8TG6MAheFMzLPVgVryhQdsE=;
X-UUID: 3656757b538e40b09f487adb9db2799c-20200406
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chun-hung.wu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 80571671; Mon, 06 Apr 2020 17:28:03 +0800
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
Subject: [PATCH v4 0/5] mmc: mediatek: add mmc cqhci support
Date:   Mon, 6 Apr 2020 17:27:56 +0800
Message-ID: <1586165281-11888-1-git-send-email-chun-hung.wu@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 5837B5355725B33750F6938581113CF1D07BE672A4C9846C0BF9FD8664FE73292000:8
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
ZGFudCBob3N0IENRRSBiaW5kaW5ncyAoTGludXggV2FsbGVpaikNCg0KQ2h1bi1IdW5nIFd1ICg1
KToNCiAgWzEvNV0gbW1jOiBjb3JlOiBFeHRlbmQgbW1jX29mX3BhcnNlKCkgdG8gcGFyc2UgQ1FF
IGJpbmRpbmdzDQogIFsyLzVdIG1tYzogaG9zdDogUmVtb3ZlIHJlZHVuZGFudCBDUUUgYmluZGlu
Z3MNCiAgWzMvNV0gbW1jOiBtZWRpYXRlazogcmVmaW5lIG1zZGMgdGltZW91dCBhcGkNCiAgWzQv
NV0gbW1jOiBtZWRpYXRlazogY29tbWFuZCBxdWV1ZSBzdXBwb3J0DQogIFs1LzVdIGR0LWJpbmRp
bmdzOiBtbWM6IG1lZGlhdGVrOiBBZGQgZG9jdW1lbnQgZm9yIG10Njc3OQ0KDQogRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9tdGstc2QudHh0IHwgICAxICsNCiBkcml2ZXJz
L21tYy9jb3JlL2hvc3QuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDUgKw0KIGRyaXZl
cnMvbW1jL2hvc3QvbXRrLXNkLmMgICAgICAgICAgICAgICAgICAgICAgICB8IDE1MSArKysrKysr
KysrKysrKysrKysrKystLQ0KIGRyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktYnJjbXN0Yi5jICAgICAg
ICAgICAgICAgICB8ICAxMSArLQ0KIGRyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktbXNtLmMgICAgICAg
ICAgICAgICAgICAgICB8ICAgMyArLQ0KIGRyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktb2YtYXJhc2Fu
LmMgICAgICAgICAgICAgICB8ICAgMyAtDQogZHJpdmVycy9tbWMvaG9zdC9zZGhjaS10ZWdyYS5j
ICAgICAgICAgICAgICAgICAgIHwgICAyICstDQogNyBmaWxlcyBjaGFuZ2VkLCAxNTUgaW5zZXJ0
aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pDQoNCi0tIA0KMS45LjENCg==

