Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52F91250E8B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Aug 2020 04:05:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbgHYCEu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Aug 2020 22:04:50 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:32601 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726828AbgHYCEt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Aug 2020 22:04:49 -0400
X-UUID: 844028df7fe74880b1268a499b1a961e-20200825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=FJjaeYDfj7zaJAqd4TVOuDNqHaL59TRiYSGWfzunuhk=;
        b=ChZ+3hCfveHcwZKGN7XULE1WViMVxpQ2l0v3FKmquAr8SwOElZJ0ZpLFzhaueG8vsGlOlcMX+QOP6jMzirkMvASBPSAcjuG6ptKimuEAb5jX+2iRlm4GwUlWTKl1DKa2Dc1S8cXkkf7C0lFYDyCdIvTKKWCUAbwAdDN3cYbrMuc=;
X-UUID: 844028df7fe74880b1268a499b1a961e-20200825
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 965857563; Tue, 25 Aug 2020 10:04:45 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Aug 2020 10:04:41 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Aug 2020 10:04:43 +0800
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
Subject: [PATCH 6/6] phy: phy-pxa-28nm-usb2: convert to readl_poll_timeout()
Date:   Tue, 25 Aug 2020 10:03:07 +0800
Message-ID: <1598320987-25518-6-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1598320987-25518-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1598320987-25518-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 4B7CA52755C8D266865A594E4B03F79BCD596B20C172F3EC76907D9CF8D018632000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

VXNlIHJlYWRsX3BvbGxfdGltZW91dCgpIHRvIHNpbXBsaWZ5IGNvZGUNCg0KU2lnbmVkLW9mZi1i
eTogQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPg0KLS0tDQogZHJpdmVy
cy9waHkvbWFydmVsbC9waHktcHhhLTI4bm0tdXNiMi5jIHwgMzMgKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDE4IGRl
bGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9waHkvbWFydmVsbC9waHktcHhhLTI4
bm0tdXNiMi5jIGIvZHJpdmVycy9waHkvbWFydmVsbC9waHktcHhhLTI4bm0tdXNiMi5jDQppbmRl
eCA5ZmQ4ODE3Li5hMTc1YWU5IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9waHkvbWFydmVsbC9waHkt
cHhhLTI4bm0tdXNiMi5jDQorKysgYi9kcml2ZXJzL3BoeS9tYXJ2ZWxsL3BoeS1weGEtMjhubS11
c2IyLmMNCkBAIC0xMyw2ICsxMyw3IEBADQogI2luY2x1ZGUgPGxpbnV4L29mLmg+DQogI2luY2x1
ZGUgPGxpbnV4L29mX2RldmljZS5oPg0KICNpbmNsdWRlIDxsaW51eC9pby5oPg0KKyNpbmNsdWRl
IDxsaW51eC9pb3BvbGwuaD4NCiAjaW5jbHVkZSA8bGludXgvZXJyLmg+DQogI2luY2x1ZGUgPGxp
bnV4L2Nsay5oPg0KICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCkBAIC0xMzgsMTUgKzEzOSwx
MiBAQCBzdHJ1Y3QgbXZfdXNiMl9waHkgew0KIAlzdHJ1Y3QgY2xrCQkqY2xrOw0KIH07DQogDQot
c3RhdGljIGJvb2wgd2FpdF9mb3JfcmVnKHZvaWQgX19pb21lbSAqcmVnLCB1MzIgbWFzaywgdW5z
aWduZWQgbG9uZyB0aW1lb3V0KQ0KK3N0YXRpYyBpbnQgd2FpdF9mb3JfcmVnKHZvaWQgX19pb21l
bSAqcmVnLCB1MzIgbWFzaywgdTMyIG1zKQ0KIHsNCi0JdGltZW91dCArPSBqaWZmaWVzOw0KLQl3
aGlsZSAodGltZV9pc19hZnRlcl9lcV9qaWZmaWVzKHRpbWVvdXQpKSB7DQotCQlpZiAoKHJlYWRs
KHJlZykgJiBtYXNrKSA9PSBtYXNrKQ0KLQkJCXJldHVybiB0cnVlOw0KLQkJbXNsZWVwKDEpOw0K
LQl9DQotCXJldHVybiBmYWxzZTsNCisJdTMyIHZhbDsNCisNCisJcmV0dXJuIHJlYWRsX3BvbGxf
dGltZW91dChyZWcsIHZhbCwgKCh2YWwgJiBtYXNrKSA9PSBtYXNrKSwNCisJCQkJICAgMTAwMCwg
MTAwMCAqIG1zKTsNCiB9DQogDQogc3RhdGljIGludCBtdl91c2IyX3BoeV8yOG5tX2luaXQoc3Ry
dWN0IHBoeSAqcGh5KQ0KQEAgLTIwOCwyNCArMjA2LDIzIEBAIHN0YXRpYyBpbnQgbXZfdXNiMl9w
aHlfMjhubV9pbml0KHN0cnVjdCBwaHkgKnBoeSkNCiAJICovDQogDQogCS8qIE1ha2Ugc3VyZSBQ
SFkgQ2FsaWJyYXRpb24gaXMgcmVhZHkgKi8NCi0JaWYgKCF3YWl0X2Zvcl9yZWcoYmFzZSArIFBI
WV8yOE5NX0NBTF9SRUcsDQotCSAgICBQSFlfMjhOTV9QTExfUExMQ0FMX0RPTkUgfCBQSFlfMjhO
TV9QTExfSU1QQ0FMX0RPTkUsDQotCSAgICBIWiAvIDEwKSkgew0KKwlyZXQgPSB3YWl0X2Zvcl9y
ZWcoYmFzZSArIFBIWV8yOE5NX0NBTF9SRUcsDQorCQkJICAgUEhZXzI4Tk1fUExMX1BMTENBTF9E
T05FIHwgUEhZXzI4Tk1fUExMX0lNUENBTF9ET05FLA0KKwkJCSAgIDEwMCk7DQorCWlmIChyZXQp
IHsNCiAJCWRldl93YXJuKCZwZGV2LT5kZXYsICJVU0IgUEhZIFBMTCBjYWxpYnJhdGUgbm90IGRv
bmUgYWZ0ZXIgMTAwbVMuIik7DQotCQlyZXQgPSAtRVRJTUVET1VUOw0KIAkJZ290byBlcnJfY2xr
Ow0KIAl9DQotCWlmICghd2FpdF9mb3JfcmVnKGJhc2UgKyBQSFlfMjhOTV9SWF9SRUcxLA0KLQkg
ICAgUEhZXzI4Tk1fUlhfU1FDQUxfRE9ORSwgSFogLyAxMCkpIHsNCisJcmV0ID0gd2FpdF9mb3Jf
cmVnKGJhc2UgKyBQSFlfMjhOTV9SWF9SRUcxLA0KKwkJCSAgIFBIWV8yOE5NX1JYX1NRQ0FMX0RP
TkUsIDEwMCk7DQorCWlmIChyZXQpIHsNCiAJCWRldl93YXJuKCZwZGV2LT5kZXYsICJVU0IgUEhZ
IFJYIFNRIGNhbGlicmF0ZSBub3QgZG9uZSBhZnRlciAxMDBtUy4iKTsNCi0JCXJldCA9IC1FVElN
RURPVVQ7DQogCQlnb3RvIGVycl9jbGs7DQogCX0NCiAJLyogTWFrZSBzdXJlIFBIWSBQTEwgaXMg
cmVhZHkgKi8NCi0JaWYgKCF3YWl0X2Zvcl9yZWcoYmFzZSArIFBIWV8yOE5NX1BMTF9SRUcwLA0K
LQkgICAgUEhZXzI4Tk1fUExMX1JFQURZLCBIWiAvIDEwKSkgew0KKwlyZXQgPSB3YWl0X2Zvcl9y
ZWcoYmFzZSArIFBIWV8yOE5NX1BMTF9SRUcwLCBQSFlfMjhOTV9QTExfUkVBRFksIDEwMCk7DQor
CWlmIChyZXQpIHsNCiAJCWRldl93YXJuKCZwZGV2LT5kZXYsICJQTExfUkVBRFkgbm90IHNldCBh
ZnRlciAxMDBtUy4iKTsNCi0JCXJldCA9IC1FVElNRURPVVQ7DQogCQlnb3RvIGVycl9jbGs7DQog
CX0NCiANCi0tIA0KMS45LjENCg==

