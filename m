Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3628D1F31D2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 03:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728413AbgFIBSv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jun 2020 21:18:51 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:50521 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727120AbgFIBSr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jun 2020 21:18:47 -0400
X-UUID: c68c26e1d6614cf58c8836bef8df5a78-20200609
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=MlT017aaENu7IxT7GzlmKqwJSNcaHtQP24npAMHnY/w=;
        b=Mi+7PYyLwW2wnCoVi/A/o0wUj7j1938+V+D/oDWp5wNq/3XUr6o31N6CcGVDdpZ/qV6QcOFEXys34MQdh3FpzyRxPWv1bccijlv7CUB/2K1REJhDOTGt1UaAZrXwnz2kdwyYxAFHucs3NlNhjMpLZeL6YJ7x7T1BkgGt+LPu8vc=;
X-UUID: c68c26e1d6614cf58c8836bef8df5a78-20200609
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <chun-hung.wu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 310561765; Tue, 09 Jun 2020 09:18:37 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Jun 2020 09:18:31 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 9 Jun 2020 09:18:35 +0800
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
Subject: [PATCH v6 4/4] dt-bindings: mmc: mediatek: Add document for mt6779
Date:   Tue, 9 Jun 2020 09:18:22 +0800
Message-ID: <1591665502-6573-5-git-send-email-chun-hung.wu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1591665502-6573-1-git-send-email-chun-hung.wu@mediatek.com>
References: <1591665502-6573-1-git-send-email-chun-hung.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: C861F003A88F87CF6BD6D01E1D90F95BA5E96B2D0FD4E3F4BE63A1ACD44F05D62000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

QWRkIGNvbXBhdGlibGUgbm9kZSBmb3IgbXQ2Nzc5IG1tYyBhbmQgSFcgY21kcSBzZWxlY3Rpb24N
Cm5vZGUgIm1lZGlhdGVrLGNxaGNpIi4NCg0KU2lnbmVkLW9mZi1ieTogQ2h1bi1IdW5nIFd1IDxj
aHVuLWh1bmcud3VAbWVkaWF0ZWsuY29tPg0KLS0tDQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21tYy9tdGstc2QudHh0IHwgNCArKysrDQogMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL21tYy9tdGstc2QudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21t
Yy9tdGstc2QudHh0DQppbmRleCA4YTUzMmY0Li5kNGQyMGI5IDEwMDY0NA0KLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9tdGstc2QudHh0DQorKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL210ay1zZC50eHQNCkBAIC0xMiw2ICsxMiw3
IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6DQogCSJtZWRpYXRlayxtdDgxNzMtbW1jIjogZm9yIG1t
YyBob3N0IGlwIGNvbXBhdGlibGUgd2l0aCBtdDgxNzMNCiAJIm1lZGlhdGVrLG10ODE4My1tbWMi
OiBmb3IgbW1jIGhvc3QgaXAgY29tcGF0aWJsZSB3aXRoIG10ODE4Mw0KIAkibWVkaWF0ZWssbXQ4
NTE2LW1tYyI6IGZvciBtbWMgaG9zdCBpcCBjb21wYXRpYmxlIHdpdGggbXQ4NTE2DQorCSJtZWRp
YXRlayxtdDY3NzktbW1jIjogZm9yIG1tYyBob3N0IGlwIGNvbXBhdGlibGUgd2l0aCBtdDY3NzkN
CiAJIm1lZGlhdGVrLG10MjcwMS1tbWMiOiBmb3IgbW1jIGhvc3QgaXAgY29tcGF0aWJsZSB3aXRo
IG10MjcwMQ0KIAkibWVkaWF0ZWssbXQyNzEyLW1tYyI6IGZvciBtbWMgaG9zdCBpcCBjb21wYXRp
YmxlIHdpdGggbXQyNzEyDQogCSJtZWRpYXRlayxtdDc2MjItbW1jIjogZm9yIE1UNzYyMiBTb0MN
CkBAIC00OSw2ICs1MCw5IEBAIE9wdGlvbmFsIHByb3BlcnRpZXM6DQogCQkgICAgIGVycm9yIGNh
dXNlZCBieSBzdG9wIGNsb2NrKGZpZm8gZnVsbCkNCiAJCSAgICAgVmFsaWQgcmFuZ2UgPSBbMDow
eDddLiBpZiBub3QgcHJlc2VudCwgZGVmYXVsdCB2YWx1ZSBpcyAwLg0KIAkJICAgICBhcHBsaWVk
IHRvIGNvbXBhdGlibGUgIm1lZGlhdGVrLG10MjcwMS1tbWMiLg0KKy0gbWVkaWF0ZWssY3FoY2k6
IEhXIGNtZHEgc2VsZWN0aW9uDQorCQkgIElmIHByZXNlbnQsIGh3IGNvbW1hbmQgcXVldWUgaXMg
ZW5hYmxlZC4NCisJCSAgSWYgbm90IHByZXNlbnQsIGh3IGNvbW1hbmQgcXVldWUgaXMgZGlzYWJs
ZWQuDQogDQogRXhhbXBsZXM6DQogbW1jMDogbW1jQDExMjMwMDAwIHsNCi0tIA0KMS45LjENCg==

