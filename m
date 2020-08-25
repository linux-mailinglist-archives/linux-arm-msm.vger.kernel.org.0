Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7948F250E91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Aug 2020 04:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbgHYCEt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Aug 2020 22:04:49 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:56765 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726104AbgHYCEp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Aug 2020 22:04:45 -0400
X-UUID: 023dae983f774649bc5811a5769503ad-20200825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=g1Itluz73PRMbaOGBVSexglNqPqxFWB0xKgwYbBMPYg=;
        b=nb+J7c7jcc1lPyFVO/xmQxH966HEPlQ/UojToYCuQIpgn2RX+2WBkMs+bB6sqoEn4g/+uH90XZeM8doyBpgLmYRKLtixDRgVW2EhuW3vXGuJs7TkJoVzOdRHjnmpFDsccNadD0xbViD9ElCDvZ988aYSqx1y51aI164O+vvVWgo=;
X-UUID: 023dae983f774649bc5811a5769503ad-20200825
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1799060717; Tue, 25 Aug 2020 10:04:40 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Aug 2020 10:04:31 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Aug 2020 10:04:33 +0800
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
Subject: [PATCH 1/6] phy: phy-bcm-ns-usb3: convert to readl_poll_timeout_atomic()
Date:   Tue, 25 Aug 2020 10:03:02 +0800
Message-ID: <1598320987-25518-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 3EA5F72587F0E7679915674B6362ACC1B90384DA174A992330AA4FB1FA65C9752000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

VXNlIHJlYWRsX3BvbGxfdGltZW91dF9hdG9taWMoKSB0byBzaW1wbGlmeSBjb2RlDQoNClNpZ25l
ZC1vZmYtYnk6IENodW5mZW5nIFl1biA8Y2h1bmZlbmcueXVuQG1lZGlhdGVrLmNvbT4NCi0tLQ0K
IGRyaXZlcnMvcGh5L2Jyb2FkY29tL3BoeS1iY20tbnMtdXNiMy5jIHwgMjIgKysrKysrKysrLS0t
LS0tLS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9u
cygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9waHkvYnJvYWRjb20vcGh5LWJjbS1ucy11c2Iz
LmMgYi9kcml2ZXJzL3BoeS9icm9hZGNvbS9waHktYmNtLW5zLXVzYjMuYw0KaW5kZXggMTRmNDVi
Yy4uNDdiMDI5ZiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvcGh5L2Jyb2FkY29tL3BoeS1iY20tbnMt
dXNiMy5jDQorKysgYi9kcml2ZXJzL3BoeS9icm9hZGNvbS9waHktYmNtLW5zLXVzYjMuYw0KQEAg
LTEzLDYgKzEzLDcgQEANCiAjaW5jbHVkZSA8bGludXgvYmNtYS9iY21hLmg+DQogI2luY2x1ZGUg
PGxpbnV4L2RlbGF5Lmg+DQogI2luY2x1ZGUgPGxpbnV4L2Vyci5oPg0KKyNpbmNsdWRlIDxsaW51
eC9pb3BvbGwuaD4NCiAjaW5jbHVkZSA8bGludXgvbWRpby5oPg0KICNpbmNsdWRlIDxsaW51eC9t
b2R1bGUuaD4NCiAjaW5jbHVkZSA8bGludXgvb2ZfYWRkcmVzcy5oPg0KQEAgLTI1OCwyOSArMjU5
LDI0IEBAIHN0YXRpYyBpbnQgYmNtX25zX3VzYjNfbWRpb19wcm9iZShzdHJ1Y3QgbWRpb19kZXZp
Y2UgKm1kaW9kZXYpDQogICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqLw0KIA0KIHN0YXRpYyBpbnQgYmNtX25zX3VzYjNfd2FpdF9yZWcoc3RydWN0IGJj
bV9uc191c2IzICp1c2IzLCB2b2lkIF9faW9tZW0gKmFkZHIsDQotCQkJCXUzMiBtYXNrLCB1MzIg
dmFsdWUsIHVuc2lnbmVkIGxvbmcgdGltZW91dCkNCisJCQkJdTMyIG1hc2ssIHUzMiB2YWx1ZSwg
aW50IHVzZWMpDQogew0KLQl1bnNpZ25lZCBsb25nIGRlYWRsaW5lID0gamlmZmllcyArIHRpbWVv
dXQ7DQogCXUzMiB2YWw7DQorCWludCByZXQ7DQogDQotCWRvIHsNCi0JCXZhbCA9IHJlYWRsKGFk
ZHIpOw0KLQkJaWYgKCh2YWwgJiBtYXNrKSA9PSB2YWx1ZSkNCi0JCQlyZXR1cm4gMDsNCi0JCWNw
dV9yZWxheCgpOw0KLQkJdWRlbGF5KDEwKTsNCi0JfSB3aGlsZSAoIXRpbWVfYWZ0ZXJfZXEoamlm
ZmllcywgZGVhZGxpbmUpKTsNCisJcmV0ID0gcmVhZGxfcG9sbF90aW1lb3V0X2F0b21pYyhhZGRy
LCB2YWwsICgodmFsICYgbWFzaykgPT0gdmFsdWUpLA0KKwkJCQkJMTAsIHVzZWMpOw0KKwlpZiAo
cmV0KQ0KKwkJZGV2X2Vycih1c2IzLT5kZXYsICJUaW1lb3V0IHdhaXRpbmcgZm9yIHJlZ2lzdGVy
ICVwXG4iLCBhZGRyKTsNCiANCi0JZGV2X2Vycih1c2IzLT5kZXYsICJUaW1lb3V0IHdhaXRpbmcg
Zm9yIHJlZ2lzdGVyICVwXG4iLCBhZGRyKTsNCi0NCi0JcmV0dXJuIC1FQlVTWTsNCisJcmV0dXJu
IHJldDsNCiB9DQogDQogc3RhdGljIGlubGluZSBpbnQgYmNtX25zX3VzYjNfbWlpX21uZ193YWl0
X2lkbGUoc3RydWN0IGJjbV9uc191c2IzICp1c2IzKQ0KIHsNCiAJcmV0dXJuIGJjbV9uc191c2Iz
X3dhaXRfcmVnKHVzYjMsIHVzYjMtPmNjYl9taWkgKyBCQ01BX0NDQl9NSUlfTU5HX0NUTCwNCiAJ
CQkJICAgIDB4MDEwMCwgMHgwMDAwLA0KLQkJCQkgICAgdXNlY3NfdG9famlmZmllcyhCQ01fTlNf
VVNCM19NSUlfTU5HX1RJTUVPVVRfVVMpKTsNCisJCQkJICAgIEJDTV9OU19VU0IzX01JSV9NTkdf
VElNRU9VVF9VUyk7DQogfQ0KIA0KIHN0YXRpYyBpbnQgYmNtX25zX3VzYjNfcGxhdGZvcm1fcGh5
X3dyaXRlKHN0cnVjdCBiY21fbnNfdXNiMyAqdXNiMywgdTE2IHJlZywNCi0tIA0KMS45LjENCg==

