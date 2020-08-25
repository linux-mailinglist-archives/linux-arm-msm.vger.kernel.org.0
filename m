Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAF52250E8A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Aug 2020 04:05:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbgHYCFB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Aug 2020 22:05:01 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:53690 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727003AbgHYCEw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Aug 2020 22:04:52 -0400
X-UUID: 9d8fa058bf2e4100bbae97ab31ee9267-20200825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Hg3xDnzPmtGQak8Ute3Rvxu6qZDbOpMb8i88ROzC9nY=;
        b=HYPJ0J6g95mPpceVWsOz8bFxMDCN2wz+ozXNLdpf1q8Nw3tiMCLH/Pd1eyjXUx7xbEhChB9lmIpE2qfH4XwpK/DNhlMMBsOH3pvO2thA87nSm8AIj6hXANOohTxXHo7KYETIugOLmaOAL1uvw7FJgjSQzUyicj97Mwg6rKW80u4=;
X-UUID: 9d8fa058bf2e4100bbae97ab31ee9267-20200825
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1183580573; Tue, 25 Aug 2020 10:04:45 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Aug 2020 10:04:41 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Aug 2020 10:04:42 +0800
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
Subject: [PATCH 5/6] phy: phy-pxa-28nm-hsic: convert to readl_poll_timeout()
Date:   Tue, 25 Aug 2020 10:03:06 +0800
Message-ID: <1598320987-25518-5-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1598320987-25518-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1598320987-25518-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 28FF1B787476A0B3AF2469E02C492C33A28A47D3B4816BF7035E5B68A61F09612000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

VXNlIHJlYWRsX3BvbGxfdGltZW91dCgpIHRvIHNpbXBsaWZ5IGNvZGUNCg0KU2lnbmVkLW9mZi1i
eTogQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPg0KLS0tDQogZHJpdmVy
cy9waHkvbWFydmVsbC9waHktcHhhLTI4bm0taHNpYy5jIHwgNDAgKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDIwIGRl
bGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9waHkvbWFydmVsbC9waHktcHhhLTI4
bm0taHNpYy5jIGIvZHJpdmVycy9waHkvbWFydmVsbC9waHktcHhhLTI4bm0taHNpYy5jDQppbmRl
eCBhZTgzNzBhLi4zMWI0M2QyIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9waHkvbWFydmVsbC9waHkt
cHhhLTI4bm0taHNpYy5jDQorKysgYi9kcml2ZXJzL3BoeS9tYXJ2ZWxsL3BoeS1weGEtMjhubS1o
c2ljLmMNCkBAIC0xMiw2ICsxMiw3IEBADQogI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4NCiAjaW5j
bHVkZSA8bGludXgvb2YuaD4NCiAjaW5jbHVkZSA8bGludXgvaW8uaD4NCisjaW5jbHVkZSA8bGlu
dXgvaW9wb2xsLmg+DQogI2luY2x1ZGUgPGxpbnV4L2Vyci5oPg0KICNpbmNsdWRlIDxsaW51eC9j
bGsuaD4NCiAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQpAQCAtNDQsMTUgKzQ1LDEyIEBAIHN0
cnVjdCBtdl9oc2ljX3BoeSB7DQogCXN0cnVjdCBjbGsJCSpjbGs7DQogfTsNCiANCi1zdGF0aWMg
Ym9vbCB3YWl0X2Zvcl9yZWcodm9pZCBfX2lvbWVtICpyZWcsIHUzMiBtYXNrLCB1bnNpZ25lZCBs
b25nIHRpbWVvdXQpDQorc3RhdGljIGludCB3YWl0X2Zvcl9yZWcodm9pZCBfX2lvbWVtICpyZWcs
IHUzMiBtYXNrLCB1MzIgbXMpDQogew0KLQl0aW1lb3V0ICs9IGppZmZpZXM7DQotCXdoaWxlICh0
aW1lX2lzX2FmdGVyX2VxX2ppZmZpZXModGltZW91dCkpIHsNCi0JCWlmICgocmVhZGwocmVnKSAm
IG1hc2spID09IG1hc2spDQotCQkJcmV0dXJuIHRydWU7DQotCQltc2xlZXAoMSk7DQotCX0NCi0J
cmV0dXJuIGZhbHNlOw0KKwl1MzIgdmFsOw0KKw0KKwlyZXR1cm4gcmVhZGxfcG9sbF90aW1lb3V0
KHJlZywgdmFsLCAoKHZhbCAmIG1hc2spID09IG1hc2spLA0KKwkJCQkgIDEwMDAsIDEwMDAgKiBt
cyk7DQogfQ0KIA0KIHN0YXRpYyBpbnQgbXZfaHNpY19waHlfaW5pdChzdHJ1Y3QgcGh5ICpwaHkp
DQpAQCAtNjAsNiArNTgsNyBAQCBzdGF0aWMgaW50IG12X2hzaWNfcGh5X2luaXQoc3RydWN0IHBo
eSAqcGh5KQ0KIAlzdHJ1Y3QgbXZfaHNpY19waHkgKm12X3BoeSA9IHBoeV9nZXRfZHJ2ZGF0YShw
aHkpOw0KIAlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2ID0gbXZfcGh5LT5wZGV2Ow0KIAl2
b2lkIF9faW9tZW0gKmJhc2UgPSBtdl9waHktPmJhc2U7DQorCWludCByZXQ7DQogDQogCWNsa19w
cmVwYXJlX2VuYWJsZShtdl9waHktPmNsayk7DQogDQpAQCAtNzUsMTQgKzc0LDE0IEBAIHN0YXRp
YyBpbnQgbXZfaHNpY19waHlfaW5pdChzdHJ1Y3QgcGh5ICpwaHkpDQogCQliYXNlICsgUEhZXzI4
Tk1fSFNJQ19QTExfQ1RSTDIpOw0KIA0KIAkvKiBNYWtlIHN1cmUgUEhZIFBMTCBpcyBsb2NrZWQg
Ki8NCi0JaWYgKCF3YWl0X2Zvcl9yZWcoYmFzZSArIFBIWV8yOE5NX0hTSUNfUExMX0NUUkwyLA0K
LQkgICAgUEhZXzI4Tk1fSFNJQ19IMlNfUExMX0xPQ0ssIEhaIC8gMTApKSB7DQorCXJldCA9IHdh
aXRfZm9yX3JlZyhiYXNlICsgUEhZXzI4Tk1fSFNJQ19QTExfQ1RSTDIsDQorCQkJICAgUEhZXzI4
Tk1fSFNJQ19IMlNfUExMX0xPQ0ssIDEwMCk7DQorCWlmIChyZXQpIHsNCiAJCWRldl9lcnIoJnBk
ZXYtPmRldiwgIkhTSUMgUEhZIFBMTCBub3QgbG9ja2VkIGFmdGVyIDEwMG1TLiIpOw0KIAkJY2xr
X2Rpc2FibGVfdW5wcmVwYXJlKG12X3BoeS0+Y2xrKTsNCi0JCXJldHVybiAtRVRJTUVET1VUOw0K
IAl9DQogDQotCXJldHVybiAwOw0KKwlyZXR1cm4gcmV0Ow0KIH0NCiANCiBzdGF0aWMgaW50IG12
X2hzaWNfcGh5X3Bvd2VyX29uKHN0cnVjdCBwaHkgKnBoeSkNCkBAIC05MSw2ICs5MCw3IEBAIHN0
YXRpYyBpbnQgbXZfaHNpY19waHlfcG93ZXJfb24oc3RydWN0IHBoeSAqcGh5KQ0KIAlzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2ID0gbXZfcGh5LT5wZGV2Ow0KIAl2b2lkIF9faW9tZW0gKmJh
c2UgPSBtdl9waHktPmJhc2U7DQogCXUzMiByZWc7DQorCWludCByZXQ7DQogDQogCXJlZyA9IHJl
YWRsKGJhc2UgKyBQSFlfMjhOTV9IU0lDX0NUUkwpOw0KIAkvKiBBdm9pZCBTRTAgc3RhdGUgd2hl
biByZXN1bWUgZm9yIHNvbWUgZGV2aWNlIHdpbGwgdGFrZSBpdCBhcyByZXNldCAqLw0KQEAgLTEw
OCwyMCArMTA4LDIwIEBAIHN0YXRpYyBpbnQgbXZfaHNpY19waHlfcG93ZXJfb24oc3RydWN0IHBo
eSAqcGh5KQ0KIAkgKi8NCiANCiAJLyogTWFrZSBzdXJlIFBIWSBDYWxpYnJhdGlvbiBpcyByZWFk
eSAqLw0KLQlpZiAoIXdhaXRfZm9yX3JlZyhiYXNlICsgUEhZXzI4Tk1fSFNJQ19JTVBDQUxfQ0FM
LA0KLQkgICAgUEhZXzI4Tk1fSFNJQ19IMlNfSU1QQ0FMX0RPTkUsIEhaIC8gMTApKSB7DQorCXJl
dCA9IHdhaXRfZm9yX3JlZyhiYXNlICsgUEhZXzI4Tk1fSFNJQ19JTVBDQUxfQ0FMLA0KKwkJCSAg
IFBIWV8yOE5NX0hTSUNfSDJTX0lNUENBTF9ET05FLCAxMDApOw0KKwlpZiAocmV0KSB7DQogCQlk
ZXZfd2FybigmcGRldi0+ZGV2LCAiSFNJQyBQSFkgUkVBRFkgbm90IHNldCBhZnRlciAxMDBtUy4i
KTsNCi0JCXJldHVybiAtRVRJTUVET1VUOw0KKwkJcmV0dXJuIHJldDsNCiAJfQ0KIA0KIAkvKiBX
YWl0aW5nIGZvciBIU0lDIGNvbm5lY3QgaW50Ki8NCi0JaWYgKCF3YWl0X2Zvcl9yZWcoYmFzZSAr
IFBIWV8yOE5NX0hTSUNfSU5ULA0KLQkgICAgUEhZXzI4Tk1fSFNJQ19DT05ORUNUX0lOVCwgSFog
LyA1KSkgew0KKwlyZXQgPSB3YWl0X2Zvcl9yZWcoYmFzZSArIFBIWV8yOE5NX0hTSUNfSU5ULA0K
KwkJCSAgIFBIWV8yOE5NX0hTSUNfQ09OTkVDVF9JTlQsIDIwMCk7DQorCWlmIChyZXQpDQogCQlk
ZXZfd2FybigmcGRldi0+ZGV2LCAiSFNJQyB3YWl0IGZvciBjb25uZWN0IGludGVycnVwdCB0aW1l
b3V0LiIpOw0KLQkJcmV0dXJuIC1FVElNRURPVVQ7DQotCX0NCiANCi0JcmV0dXJuIDA7DQorCXJl
dHVybiByZXQ7DQogfQ0KIA0KIHN0YXRpYyBpbnQgbXZfaHNpY19waHlfcG93ZXJfb2ZmKHN0cnVj
dCBwaHkgKnBoeSkNCi0tIA0KMS45LjENCg==

