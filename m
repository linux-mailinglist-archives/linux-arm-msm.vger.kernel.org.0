Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA555225505
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 02:42:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726815AbgGTAmy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Jul 2020 20:42:54 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:25789 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726589AbgGTAmx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Jul 2020 20:42:53 -0400
X-UUID: 71740d0373c747b1b0a120afd07c9dfc-20200720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=FypeGE6UvtMXhHWwD1QN+vD00gBfco5M6BU2XwHV0ug=;
        b=K3gENK/THXUo1RT8srlV/0fDtoKEBTclffO1iFUqfPFxvLOT34mtZqDFvk3Kw2RzDIQVxMM6zLXLRO0gFyBCO/W/293ktmjNVDjPFHuLZlOmxr0RVc6XeXkSSmn1CUb+NUfNWVDpASe5vv9TLSYv92CnfHCd/wDufSLyB2emO3E=;
X-UUID: 71740d0373c747b1b0a120afd07c9dfc-20200720
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chun-hung.wu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 479400831; Mon, 20 Jul 2020 08:42:46 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Jul 2020 08:42:44 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 20 Jul 2020 08:42:44 +0800
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
Subject: [PATCH v7 4/4] dt-bindings: mmc: mediatek: Add document for mt6779
Date:   Mon, 20 Jul 2020 08:42:39 +0800
Message-ID: <1595205759-5825-5-git-send-email-chun-hung.wu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1595205759-5825-1-git-send-email-chun-hung.wu@mediatek.com>
References: <1595205759-5825-1-git-send-email-chun-hung.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 2ECAA272D376629C3C5192F90C5E5541A611FE2C2A5196C433CF9380734F83EF2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

QWRkIGNvbXBhdGlibGUgbm9kZSBmb3IgbXQ2Nzc5IG1tYy4NCg0KU2lnbmVkLW9mZi1ieTogQ2h1
bi1IdW5nIFd1IDxjaHVuLWh1bmcud3VAbWVkaWF0ZWsuY29tPg0KLS0tDQogRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9tdGstc2QudHh0IHwgMSArDQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspDQoNCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbW1jL210ay1zZC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbW1jL210ay1zZC50eHQNCmluZGV4IDhhNTMyZjQuLjBjOWNmNmEgMTAwNjQ0DQotLS0g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL210ay1zZC50eHQNCisrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvbXRrLXNkLnR4dA0KQEAgLTEy
LDYgKzEyLDcgQEAgUmVxdWlyZWQgcHJvcGVydGllczoNCiAJIm1lZGlhdGVrLG10ODE3My1tbWMi
OiBmb3IgbW1jIGhvc3QgaXAgY29tcGF0aWJsZSB3aXRoIG10ODE3Mw0KIAkibWVkaWF0ZWssbXQ4
MTgzLW1tYyI6IGZvciBtbWMgaG9zdCBpcCBjb21wYXRpYmxlIHdpdGggbXQ4MTgzDQogCSJtZWRp
YXRlayxtdDg1MTYtbW1jIjogZm9yIG1tYyBob3N0IGlwIGNvbXBhdGlibGUgd2l0aCBtdDg1MTYN
CisJIm1lZGlhdGVrLG10Njc3OS1tbWMiOiBmb3IgbW1jIGhvc3QgaXAgY29tcGF0aWJsZSB3aXRo
IG10Njc3OQ0KIAkibWVkaWF0ZWssbXQyNzAxLW1tYyI6IGZvciBtbWMgaG9zdCBpcCBjb21wYXRp
YmxlIHdpdGggbXQyNzAxDQogCSJtZWRpYXRlayxtdDI3MTItbW1jIjogZm9yIG1tYyBob3N0IGlw
IGNvbXBhdGlibGUgd2l0aCBtdDI3MTINCiAJIm1lZGlhdGVrLG10NzYyMi1tbWMiOiBmb3IgTVQ3
NjIyIFNvQw0KLS0gDQoxLjkuMQ0K

