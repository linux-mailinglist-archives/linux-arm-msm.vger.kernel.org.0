Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B0F1250E8D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Aug 2020 04:05:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbgHYCFI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Aug 2020 22:05:08 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:36775 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725781AbgHYCEv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Aug 2020 22:04:51 -0400
X-UUID: dc928efca924495dbc2265b27d8bb7a2-20200825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=21CT99gVNFEuuNYXRK1dReZRVbPZKir3/U3fY5f7SKg=;
        b=H0y3ntQs+Tf3K30zteeLvHNpGdMvpl8hXOIMwl5UOkwqgv2GlhSKNNH4vtus87SD92QR+2reT+ccxL3+Oi1KJMlXcBDhlGJTTH9F5cr3bR9f720nwgwGfjviNZFix4zkcE7wtT7iiRMw0vciqtOmAiTi556t5TMFTwgd2yQbD08=;
X-UUID: dc928efca924495dbc2265b27d8bb7a2-20200825
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1559288598; Tue, 25 Aug 2020 10:04:45 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Aug 2020 10:04:39 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Aug 2020 10:04:39 +0800
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
Subject: [PATCH 3/6] phy: phy-bcm-sr-usb: convert to readl_poll_timeout_atomic()
Date:   Tue, 25 Aug 2020 10:03:04 +0800
Message-ID: <1598320987-25518-3-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1598320987-25518-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1598320987-25518-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 588180CEE0623FA533389B0780B86B46F91CBD423006F5AC70031FD8AFAC5E452000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

VXNlIHJlYWRsX3BvbGxfdGltZW91dF9hdG9taWMoKSB0byBzaW1wbGlmeSBjb2RlDQoNClNpZ25l
ZC1vZmYtYnk6IENodW5mZW5nIFl1biA8Y2h1bmZlbmcueXVuQG1lZGlhdGVrLmNvbT4NCi0tLQ0K
IGRyaXZlcnMvcGh5L2Jyb2FkY29tL3BoeS1iY20tc3ItdXNiLmMgfCAxOSArKysrKysrKy0tLS0t
LS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0p
DQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BoeS9icm9hZGNvbS9waHktYmNtLXNyLXVzYi5jIGIv
ZHJpdmVycy9waHkvYnJvYWRjb20vcGh5LWJjbS1zci11c2IuYw0KaW5kZXggNzdjMDI1YS4uYzNl
OTlhZCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvcGh5L2Jyb2FkY29tL3BoeS1iY20tc3ItdXNiLmMN
CisrKyBiL2RyaXZlcnMvcGh5L2Jyb2FkY29tL3BoeS1iY20tc3ItdXNiLmMNCkBAIC01LDYgKzUs
NyBAQA0KIA0KICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPg0KICNpbmNsdWRlIDxsaW51eC9pby5o
Pg0KKyNpbmNsdWRlIDxsaW51eC9pb3BvbGwuaD4NCiAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+
DQogI2luY2x1ZGUgPGxpbnV4L29mLmg+DQogI2luY2x1ZGUgPGxpbnV4L3BoeS9waHkuaD4NCkBA
IC0xMDksMTkgKzExMCwxNSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgYmNtX3VzYl9yZWczMl9zZXRi
aXRzKHZvaWQgX19pb21lbSAqYWRkciwgdWludDMyX3Qgc2V0KQ0KIA0KIHN0YXRpYyBpbnQgYmNt
X3VzYl9wbGxfbG9ja19jaGVjayh2b2lkIF9faW9tZW0gKmFkZHIsIHUzMiBiaXQpDQogew0KLQlp
bnQgcmV0cnk7DQotCXUzMiByZF9kYXRhOw0KKwl1MzIgZGF0YTsNCisJaW50IHJldDsNCiANCi0J
cmV0cnkgPSBQTExfTE9DS19SRVRSWV9DT1VOVDsNCi0JZG8gew0KLQkJcmRfZGF0YSA9IHJlYWRs
KGFkZHIpOw0KLQkJaWYgKHJkX2RhdGEgJiBiaXQpDQotCQkJcmV0dXJuIDA7DQotCQl1ZGVsYXko
MSk7DQotCX0gd2hpbGUgKC0tcmV0cnkgPiAwKTsNCisJcmV0ID0gcmVhZGxfcG9sbF90aW1lb3V0
X2F0b21pYyhhZGRyLCBkYXRhLCAoZGF0YSAmIGJpdCksIDEsDQorCQkJCQlQTExfTE9DS19SRVRS
WV9DT1VOVCk7DQorCWlmIChyZXQpDQorCQlwcl9lcnIoIiVzOiBGQUlMXG4iLCBfX2Z1bmNfXyk7
DQogDQotCXByX2VycigiJXM6IEZBSUxcbiIsIF9fZnVuY19fKTsNCi0JcmV0dXJuIC1FVElNRURP
VVQ7DQorCXJldHVybiByZXQ7DQogfQ0KIA0KIHN0YXRpYyBpbnQgYmNtX3VzYl9zc19waHlfaW5p
dChzdHJ1Y3QgYmNtX3VzYl9waHlfY2ZnICpwaHlfY2ZnKQ0KLS0gDQoxLjkuMQ0K

