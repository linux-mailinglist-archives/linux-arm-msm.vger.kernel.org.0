Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9784D250E85
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Aug 2020 04:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbgHYCEo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Aug 2020 22:04:44 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:48337 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725781AbgHYCEo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Aug 2020 22:04:44 -0400
X-UUID: f3eda44dd7d9449a9dbac3ed2a327111-20200825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=DVHRh1RBZU+BcDSktqxKWMvFtrCLwtkjiR8252F3Grw=;
        b=Dgjux9zIVCoQHL5kknP6I1URpOzRZFTSRQhUV2J4JMkiGHNp6QEZdgi34O8g6vbGQl74404uDyf9aqjqr9Sb0dlvr4sQp+LVotOxKgnHFVa96j80+wZvrUD7xXNSXRKVkdEzq1rv4F18UhY5wtv2tgVbWvj/VGPYR5jSuMJGa+4=;
X-UUID: f3eda44dd7d9449a9dbac3ed2a327111-20200825
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1259988992; Tue, 25 Aug 2020 10:04:39 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Aug 2020 10:04:36 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Aug 2020 10:04:36 +0800
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>
CC:     Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Bharat Gooty <bharat.gooty@broadcom.com>,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Subject: [PATCH 2/6] phy: phy-bcm-ns2-usbdrd: convert to readl_poll_timeout_atomic()
Date:   Tue, 25 Aug 2020 10:03:03 +0800
Message-ID: <1598320987-25518-2-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1598320987-25518-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1598320987-25518-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: EEC3529724919847FA126E25E02BCF7766E0E17551D1EF8D6C698E3376E31CD22000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

VXNlIHJlYWRsX3BvbGxfdGltZW91dF9hdG9taWMoKSB0byBzaW1wbGlmeSBjb2RlDQoNClNpZ25l
ZC1vZmYtYnk6IENodW5mZW5nIFl1biA8Y2h1bmZlbmcueXVuQG1lZGlhdGVrLmNvbT4NCi0tLQ0K
IGRyaXZlcnMvcGh5L2Jyb2FkY29tL3BoeS1iY20tbnMyLXVzYmRyZC5jIHwgMTMgKysrKy0tLS0t
LS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pDQoN
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3BoeS9icm9hZGNvbS9waHktYmNtLW5zMi11c2JkcmQuYyBi
L2RyaXZlcnMvcGh5L2Jyb2FkY29tL3BoeS1iY20tbnMyLXVzYmRyZC5jDQppbmRleCA1Mjc2MjU5
Li45NjMwYWMxIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9waHkvYnJvYWRjb20vcGh5LWJjbS1uczIt
dXNiZHJkLmMNCisrKyBiL2RyaXZlcnMvcGh5L2Jyb2FkY29tL3BoeS1iY20tbnMyLXVzYmRyZC5j
DQpAQCAtMTgsNiArMTgsNyBAQA0KICNpbmNsdWRlIDxsaW51eC9pbml0Lmg+DQogI2luY2x1ZGUg
PGxpbnV4L2ludGVycnVwdC5oPg0KICNpbmNsdWRlIDxsaW51eC9pby5oPg0KKyNpbmNsdWRlIDxs
aW51eC9pb3BvbGwuaD4NCiAjaW5jbHVkZSA8bGludXgvaXJxLmg+DQogI2luY2x1ZGUgPGxpbnV4
L21mZC9zeXNjb24uaD4NCiAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQpAQCAtODcsMTcgKzg4
LDExIEBAIHN0cnVjdCBuczJfcGh5X2RhdGEgew0KIHN0YXRpYyBpbmxpbmUgaW50IHBsbF9sb2Nr
X3N0YXQodTMyIHVzYl9yZWcsIGludCByZWdfbWFzaywNCiAJCQkJc3RydWN0IG5zMl9waHlfZHJp
dmVyICpkcml2ZXIpDQogew0KLQlpbnQgcmV0cnkgPSBQTExfTE9DS19SRVRSWTsNCiAJdTMyIHZh
bDsNCiANCi0JZG8gew0KLQkJdWRlbGF5KDEpOw0KLQkJdmFsID0gcmVhZGwoZHJpdmVyLT5pY2Zn
ZHJkX3JlZ3MgKyB1c2JfcmVnKTsNCi0JCWlmICh2YWwgJiByZWdfbWFzaykNCi0JCQlyZXR1cm4g
MDsNCi0JfSB3aGlsZSAoLS1yZXRyeSA+IDApOw0KLQ0KLQlyZXR1cm4gLUVCVVNZOw0KKwlyZXR1
cm4gcmVhZGxfcG9sbF90aW1lb3V0X2F0b21pYyhkcml2ZXItPmljZmdkcmRfcmVncyArIHVzYl9y
ZWcsDQorCQkJCQkgdmFsLCAodmFsICYgcmVnX21hc2spLCAxLA0KKwkJCQkJIFBMTF9MT0NLX1JF
VFJZKTsNCiB9DQogDQogc3RhdGljIGludCBuczJfZHJkX3BoeV9pbml0KHN0cnVjdCBwaHkgKnBo
eSkNCi0tIA0KMS45LjENCg==

