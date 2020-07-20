Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AB0D22550F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 02:43:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726846AbgGTAmy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Jul 2020 20:42:54 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:43426 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726596AbgGTAmx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Jul 2020 20:42:53 -0400
X-UUID: f7892d90758046f4a2dcfa39cccf7045-20200720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=OMHVu4Vv9sCJUK0p044FX4mimvQ4OPPgAjHgDXynXG0=;
        b=fzU6c7HEQ19PHOYmU7BkHNObcmz68gw3bDI+TpvKI3KcNSaDDkDcgyRfCUUha5UY9BzVw0gWbk75cesW1YfEye1FBG5l42qXcMxlihRHR269EtLrHzr9aven4+FpbOqKjeCB4MV12xC6Jhpy8dC66LQxpinaEA0rHXEQmHtHn9o=;
X-UUID: f7892d90758046f4a2dcfa39cccf7045-20200720
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chun-hung.wu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1498844878; Mon, 20 Jul 2020 08:42:45 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Jul 2020 08:42:43 +0800
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
Subject: [PATCH v7 1/4] mmc: mediatek: add MT6779 MMC driver support
Date:   Mon, 20 Jul 2020 08:42:36 +0800
Message-ID: <1595205759-5825-2-git-send-email-chun-hung.wu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1595205759-5825-1-git-send-email-chun-hung.wu@mediatek.com>
References: <1595205759-5825-1-git-send-email-chun-hung.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: B6EBCB46A8EA91B71316FD7623CD65C69AAFCEB4EAB4B11A9B768E2F0E489B012000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

QWRkIG5ldyBjb2RlIHRvIHN1cHBvcnQgTVQ2Nzc5IG1tYyBkcml2ZXIuDQoNClNpZ25lZC1vZmYt
Ynk6IENodW4tSHVuZyBXdSA8Y2h1bi1odW5nLnd1QG1lZGlhdGVrLmNvbT4NCi0tLQ0KIGRyaXZl
cnMvbW1jL2hvc3QvbXRrLXNkLmMgfCAxMyArKysrKysrKysrKysrDQogMSBmaWxlIGNoYW5nZWQs
IDEzIGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbW1jL2hvc3QvbXRrLXNk
LmMgYi9kcml2ZXJzL21tYy9ob3N0L210ay1zZC5jDQppbmRleCAzOWU3ZmM1Li5lZDM3YTNjIDEw
MDY0NA0KLS0tIGEvZHJpdmVycy9tbWMvaG9zdC9tdGstc2QuYw0KKysrIGIvZHJpdmVycy9tbWMv
aG9zdC9tdGstc2QuYw0KQEAgLTUzOCw2ICs1MzgsMTggQEAgc3RydWN0IG1zZGNfaG9zdCB7DQog
CS51c2VfaW50ZXJuYWxfY2QgPSB0cnVlLA0KIH07DQogDQorc3RhdGljIGNvbnN0IHN0cnVjdCBt
dGtfbW1jX2NvbXBhdGlibGUgbXQ2Nzc5X2NvbXBhdCA9IHsNCisJLmNsa19kaXZfYml0cyA9IDEy
LA0KKwkuaHM0MDBfdHVuZSA9IGZhbHNlLA0KKwkucGFkX3R1bmVfcmVnID0gTVNEQ19QQURfVFVO
RTAsDQorCS5hc3luY19maWZvID0gdHJ1ZSwNCisJLmRhdGFfdHVuZSA9IHRydWUsDQorCS5idXN5
X2NoZWNrID0gdHJ1ZSwNCisJLnN0b3BfY2xrX2ZpeCA9IHRydWUsDQorCS5lbmhhbmNlX3J4ID0g
dHJ1ZSwNCisJLnN1cHBvcnRfNjRnID0gdHJ1ZSwNCit9Ow0KKw0KIHN0YXRpYyBjb25zdCBzdHJ1
Y3Qgb2ZfZGV2aWNlX2lkIG1zZGNfb2ZfaWRzW10gPSB7DQogCXsgLmNvbXBhdGlibGUgPSAibWVk
aWF0ZWssbXQ4MTM1LW1tYyIsIC5kYXRhID0gJm10ODEzNV9jb21wYXR9LA0KIAl7IC5jb21wYXRp
YmxlID0gIm1lZGlhdGVrLG10ODE3My1tbWMiLCAuZGF0YSA9ICZtdDgxNzNfY29tcGF0fSwNCkBA
IC01NDcsNiArNTU5LDcgQEAgc3RydWN0IG1zZGNfaG9zdCB7DQogCXsgLmNvbXBhdGlibGUgPSAi
bWVkaWF0ZWssbXQ3NjIyLW1tYyIsIC5kYXRhID0gJm10NzYyMl9jb21wYXR9LA0KIAl7IC5jb21w
YXRpYmxlID0gIm1lZGlhdGVrLG10ODUxNi1tbWMiLCAuZGF0YSA9ICZtdDg1MTZfY29tcGF0fSwN
CiAJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDc2MjAtbW1jIiwgLmRhdGEgPSAmbXQ3NjIw
X2NvbXBhdH0sDQorCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ2Nzc5LW1tYyIsIC5kYXRh
ID0gJm10Njc3OV9jb21wYXR9LA0KIAl7fQ0KIH07DQogTU9EVUxFX0RFVklDRV9UQUJMRShvZiwg
bXNkY19vZl9pZHMpOw0KLS0gDQoxLjkuMQ0K

