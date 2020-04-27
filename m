Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 480791BB25B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2020 01:58:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbgD0X5e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Apr 2020 19:57:34 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:7418 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726509AbgD0X5Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Apr 2020 19:57:24 -0400
X-UUID: b87e21c10b074b3fb1a1c44fbcb711a6-20200428
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=+p2FpvDesOhvlsbH3Gp9SCnml3/2yorz5SLguxMgjUM=;
        b=RXJuqDN5TFsanR8YXnuQZvDcfwtNiZt8nyFo1lV8Xpp4inOHi2BJDw0CyrBxUk4WkGOSeEDAyor+Dcw1u3uq+uDgojBv7E7DTA+2tqfG841Jj802mep1N0Q18JN1oCjujeiqdWA0jU8p8DneqmvgxYCjXl0nll9Lfx4xRs/OM1g=;
X-UUID: b87e21c10b074b3fb1a1c44fbcb711a6-20200428
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <chun-hung.wu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 994598891; Tue, 28 Apr 2020 07:57:21 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkexhb02.mediatek.inc (172.21.101.103) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Apr 2020 07:57:14 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 28 Apr 2020 07:57:13 +0800
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
Subject: [PATCH v5 5/5] dt-bindings: mmc: mediatek: Add document for mt6779
Date:   Tue, 28 Apr 2020 07:56:08 +0800
Message-ID: <1588031768-23677-6-git-send-email-chun-hung.wu@mediatek.com>
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

QWRkIGNvbXBhdGlibGUgbm9kZSBmb3IgbXQ2Nzc5IG1tYw0KDQpTaWduZWQtb2ZmLWJ5OiBDaHVu
LUh1bmcgV3UgPGNodW4taHVuZy53dUBtZWRpYXRlay5jb20+DQpBY2tlZC1ieTogUm9iIEhlcnJp
bmcgPHJvYmhAa2VybmVsLm9yZz4NCi0tLQ0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tbWMvbXRrLXNkLnR4dCB8IDEgKw0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQ0KDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9t
dGstc2QudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9tdGstc2Qu
dHh0DQppbmRleCA4YTUzMmY0Li4wYzljZjZhIDEwMDY0NA0KLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9tdGstc2QudHh0DQorKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbW1jL210ay1zZC50eHQNCkBAIC0xMiw2ICsxMiw3IEBAIFJlcXVp
cmVkIHByb3BlcnRpZXM6DQogCSJtZWRpYXRlayxtdDgxNzMtbW1jIjogZm9yIG1tYyBob3N0IGlw
IGNvbXBhdGlibGUgd2l0aCBtdDgxNzMNCiAJIm1lZGlhdGVrLG10ODE4My1tbWMiOiBmb3IgbW1j
IGhvc3QgaXAgY29tcGF0aWJsZSB3aXRoIG10ODE4Mw0KIAkibWVkaWF0ZWssbXQ4NTE2LW1tYyI6
IGZvciBtbWMgaG9zdCBpcCBjb21wYXRpYmxlIHdpdGggbXQ4NTE2DQorCSJtZWRpYXRlayxtdDY3
NzktbW1jIjogZm9yIG1tYyBob3N0IGlwIGNvbXBhdGlibGUgd2l0aCBtdDY3NzkNCiAJIm1lZGlh
dGVrLG10MjcwMS1tbWMiOiBmb3IgbW1jIGhvc3QgaXAgY29tcGF0aWJsZSB3aXRoIG10MjcwMQ0K
IAkibWVkaWF0ZWssbXQyNzEyLW1tYyI6IGZvciBtbWMgaG9zdCBpcCBjb21wYXRpYmxlIHdpdGgg
bXQyNzEyDQogCSJtZWRpYXRlayxtdDc2MjItbW1jIjogZm9yIE1UNzYyMiBTb0MNCi0tIA0KMi42
LjQNCg==

