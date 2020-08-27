Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FAFB254266
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Aug 2020 11:33:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727793AbgH0JdN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Aug 2020 05:33:13 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:3989 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726826AbgH0JdM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Aug 2020 05:33:12 -0400
X-UUID: c92f2ad19b8e434ea14cd62c1dd6f4ac-20200827
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=GDw8qw5Cf2+oW80aLaeL2MYzA4FJZY4c7yqCaOQfvls=;
        b=oSqcIa3/yC/pN03AO49rxAvpF3Iu+dX+UCKbsCS9Cvu8rkfRhECq1oOur6YOZQrtn++ipnFFbUcx7R6cWUhsRdb+bVjKT8ytBFiM0CgLIF0gcxJS4yxm9iaZI2H4Ok8f6FaPwiJxPZPiW8EK34KGGwMO8iZk3gSBIJD9oRrabuI=;
X-UUID: c92f2ad19b8e434ea14cd62c1dd6f4ac-20200827
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chun-hung.wu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1959076118; Thu, 27 Aug 2020 17:33:07 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 Aug 2020 17:33:04 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 27 Aug 2020 17:33:05 +0800
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
Subject: [PATCH v1 0/2] mmc: cqhci: Add pre_enable() and post_disable() hook function
Date:   Thu, 27 Aug 2020 17:33:01 +0800
Message-ID: <1598520783-25250-1-git-send-email-chun-hung.wu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: CCF1C9EE5CC8277C1A06A622833D52EA4C4DF2634262C08F134094BB2ABF89472000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

VGhpcyBzZXJpZXMgcHJvdmlkZXMgTWVkaWFUZWsgY3FoY2kgaW1wbGVtZW50YXRpb25zIGFzIGJl
bG93Og0KICAtIEFkZCBjcWhjaV9ob3N0X29wcy0+cHJlX2VuYWJsZSgpIGFuZCBjcWhjaV9ob3N0
X29wcy0+cG9zdF9kaXNhYmxlKCkNCiAgLSBJbXBsZW1lbnQgTWVkaWFUZWsncyBob29rIGZ1bmN0
aW9ucw0KDQpDaHVuLUh1bmcgV3UgKDIpOg0KICBtbWM6IGNxaGNpOiBhZGQgbmV3IGNxaGNpX2hv
c3Rfb3BzIHByZV9lbmFibGUoKSBhbmQgcG9zdF9kaXNhYmxlKCkNCiAgbW1jOiBtZWRpYXRlazog
YWRkIHByZV9lbmFibGUoKSBhbmQgcG9zdF9kaXNhYmxlKCkgaG9vayBmdW5jdGlvbg0KDQogZHJp
dmVycy9tbWMvaG9zdC9jcWhjaS5jICB8ICAgIDYgKysrKysrDQogZHJpdmVycy9tbWMvaG9zdC9j
cWhjaS5oICB8ICAgIDIgKysNCiBkcml2ZXJzL21tYy9ob3N0L210ay1zZC5jIHwgICAyMiArKysr
KysrKysrKysrKysrKysrKysrDQogMyBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspDQoN
Ci0tIA0KMS43LjkuNQ0K

