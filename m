Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22C7B225501
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 02:42:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726646AbgGTAmw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Jul 2020 20:42:52 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:40906 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726312AbgGTAmv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Jul 2020 20:42:51 -0400
X-UUID: c46ce339d45c4d388c09cfcd1ab30a55-20200720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=FaqUdYxqi1XjkwCj1byDtXnVHu3nPZv58uEtqHctoQA=;
        b=nZRDTWr33CGvAhssr2lkL1TfnZATu1W6t085u7HJekr0LaK0WmyKwKNPP1RnchMIUrMjgzQvGzIQFa6WakMLsN4JEqLCGTCOo9hYBFJ6+EY2KYeDVfhaokteUr26JS8DHKG/IFf+EWpSd6xEYlhg27wXvRKY8J9TZ4ixeo96fz8=;
X-UUID: c46ce339d45c4d388c09cfcd1ab30a55-20200720
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <chun-hung.wu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 297892602; Mon, 20 Jul 2020 08:42:44 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Jul 2020 08:42:42 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 20 Jul 2020 08:42:42 +0800
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
Subject: [PATCH v7 0/4] mmc: mediatek: add mmc cqhci support
Date:   Mon, 20 Jul 2020 08:42:35 +0800
Message-ID: <1595205759-5825-1-git-send-email-chun-hung.wu@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 1F865C90232599EFD426CA02B8A9A03CDAD99D6D654D6106C365D8346E3413832000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

VGhpcyBzZXJpZXMgcHJvdmlkZXMgTWVkaWFUZWsgY3FoY2kgaW1wbGVtZW50YXRpb25zIGFzIGJl
bG93Og0KICAtIFJlZmluZSBtc2RjIHRpbWVvdXQgYXBpIHRvIHJlZHVjZSByZWR1bmRhbnQgY29k
ZQ0KICAtIE1lZGlhVGVrIGNvbW1hbmQgcXVldWUgc3VwcG9ydA0KICAtIGR0LWJpbmRpbmdzIGZv
ciBtdDY3NzkNCg0KdjEgLT4gdjI6DQogIC0gQWRkIG1vcmUgcGF0Y2ggZGV0YWlscyBpbiBjb21t
aXQgbWVzc2FnZQ0KICAtIFNlcGFyYXRlIG1zZGMgdGltZW91dCBhcGkgcmVmaW5lIHRvIGluZGl2
aWR1YWwgcGF0Y2gNCg0KdjIgLT4gdjM6DQogIC0gUmVtb3ZlIENSLUlkLCBDaGFuZ2UtSWQgYW5k
IEZlYXR1cmUgaW4gcGF0Y2hlcw0KICAtIEFkZCBTaWduZWQtb2ZmLWJ5IGluIHBhdGNoZXMNCg0K
djMgLT4gdjQ6DQogIC0gUmVmaW5lIENRRSBiaW5kaW5ncyBpbiBtbWNfb2ZfcGFyc2UgKFVsZiBI
YW5zc29uKQ0KICAtIFJlbW92ZSByZWR1bmRhbnQgaG9zdCBDUUUgYmluZGluZ3MgKExpbnV4IFdh
bGxlaWopDQoNCnY0IC0+IHY1Og0KICAtIEFkZCBBY2tlZC1ieSBhbmQgbW9yZSBtYWludGFpbmVy
cw0KDQp2NSAtPiB2NjoNCiAgLSBNb3ZlIENRRSBiaW5kaW5ncyBiYWNrIHRvIHZlbmRvciBkcml2
ZXINCiAgLSBBZGQgbXQ2Nzc5IG1tYyBzdXBwb3J0IGFzIGFuIGluZGl2aWR1YWwgcGF0Y2gNCiAg
LSBFcnJvciBoYW5kbGluZyBmb3IgY3FfaG9zdCBkZXZtX2t6YWxsbygpDQoNCnY2IC0+IHY3Og0K
ICAtIFNlbGVjdCBNTUNfQ1FIQ0kgZm9yIE1NQ19NVEsNCiAgLSBSZW1vdmUgdW5uZWNlc3Nhcnkg
b3B0aW9uIE1NQ19DUUhDSSBpbiBtdGstc2QuYw0KICAtIEFkZCBlcnJvciBoYW5kbGluZyBmb3Ig
Y3FoY2lfaW5pdCgpDQogIC0gVXNlIG5hdGl2ZSBjcWhjaSBkdC1iaW5kaW5ncyAnc3VwcG9ydHMt
Y3FlJw0KDQpDaHVuLUh1bmcgV3UgKDQpOg0KICBbMS80XSBtbWM6IG1lZGlhdGVrOiBhZGQgTVQ2
Nzc5IE1NQyBkcml2ZXIgc3VwcG9ydA0KICBbMi80XSBtbWM6IG1lZGlhdGVrOiByZWZpbmUgbXNk
YyB0aW1lb3V0IGFwaQ0KICBbMy80XSBtbWM6IG1lZGlhdGVrOiBjb21tYW5kIHF1ZXVlIHN1cHBv
cnQNCiAgWzQvNF0gZHQtYmluZGluZ3M6IG1tYzogbWVkaWF0ZWs6IEFkZCBkb2N1bWVudCBmb3Ig
bXQ2Nzc5DQoNCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL210ay1zZC50
eHQgfCAgIDEgKw0KIGRyaXZlcnMvbW1jL2hvc3QvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgMSArDQogZHJpdmVycy9tbWMvaG9zdC9tdGstc2QuYyAgICAgICAgICAgICAgICAg
ICAgICAgIHwgMTYwICsrKysrKysrKysrKysrKysrKysrKy0tDQogMyBmaWxlcyBjaGFuZ2VkLCAx
NTIgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQoNCi0tIA0KMS45LjENCg==

