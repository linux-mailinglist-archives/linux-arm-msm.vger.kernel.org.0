Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6A5A2938A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Oct 2020 11:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404968AbgJTJ5h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Oct 2020 05:57:37 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:47100 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2404885AbgJTJ5g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Oct 2020 05:57:36 -0400
X-UUID: 44250b962f4d45b0aa08c71c3f33d26e-20201020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=F8WnTljv3hNTWcc1qMKTEyBohllp3UNYpl8swfbVRfI=;
        b=msBE7gkkEU+CAXdvBuBpNki15RDzOt1omhs/KjRHOuMhoq11rkJqNI1Zp7j/H9eV/6MBdOZFqG6CKEqhaNsz0uY2EOzpgaeey/OroDfgT1rq5J85zAnShvMceXLetqBMpL085ZBZS2iH7GjfXIG68ku2IlXyqSW2TgjCrs/0Quo=;
X-UUID: 44250b962f4d45b0aa08c71c3f33d26e-20201020
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1910383176; Tue, 20 Oct 2020 17:57:26 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 20 Oct 2020 17:57:24 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Oct 2020 17:57:25 +0800
From:   Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: [PATCH v2 1/3] spmi: Add driver shutdown support
Date:   Tue, 20 Oct 2020 17:56:48 +0800
Message-ID: <1603187810-30481-2-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1603187810-30481-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1603187810-30481-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

QWRkIG5ldyBzaHV0ZG93bigpIG1ldGhvZC4gIFVzZSBpdCBpbiB0aGUgc3RhbmRhcmQgZHJpdmVy
IG1vZGVsIHN0eWxlLg0KDQpTaWduZWQtb2ZmLWJ5OiBIc2luLUhzaXVuZyBXYW5nIDxoc2luLWhz
aXVuZy53YW5nQG1lZGlhdGVrLmNvbT4NCi0tLQ0KIGRyaXZlcnMvc3BtaS9zcG1pLmMgIHwgOSAr
KysrKysrKysNCiBpbmNsdWRlL2xpbnV4L3NwbWkuaCB8IDEgKw0KIDIgZmlsZXMgY2hhbmdlZCwg
MTAgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcG1pL3NwbWkuYyBiL2Ry
aXZlcnMvc3BtaS9zcG1pLmMNCmluZGV4IGMxNmI2MGY2NDVhNC4uMTYxYTQ4Y2E0YWNjIDEwMDY0
NA0KLS0tIGEvZHJpdmVycy9zcG1pL3NwbWkuYw0KKysrIGIvZHJpdmVycy9zcG1pL3NwbWkuYw0K
QEAgLTM1Nyw2ICszNTcsMTQgQEAgc3RhdGljIGludCBzcG1pX2Rydl9yZW1vdmUoc3RydWN0IGRl
dmljZSAqZGV2KQ0KIAlyZXR1cm4gMDsNCiB9DQogDQorc3RhdGljIHZvaWQgc3BtaV9kcnZfc2h1
dGRvd24oc3RydWN0IGRldmljZSAqZGV2KQ0KK3sNCisJY29uc3Qgc3RydWN0IHNwbWlfZHJpdmVy
ICpzZHJ2ID0gdG9fc3BtaV9kcml2ZXIoZGV2LT5kcml2ZXIpOw0KKw0KKwlpZiAoc2RydiAmJiBz
ZHJ2LT5zaHV0ZG93bikNCisJCXNkcnYtPnNodXRkb3duKHRvX3NwbWlfZGV2aWNlKGRldikpOw0K
K30NCisNCiBzdGF0aWMgaW50IHNwbWlfZHJ2X3VldmVudChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0
cnVjdCBrb2JqX3VldmVudF9lbnYgKmVudikNCiB7DQogCWludCByZXQ7DQpAQCAtMzczLDYgKzM4
MSw3IEBAIHN0YXRpYyBzdHJ1Y3QgYnVzX3R5cGUgc3BtaV9idXNfdHlwZSA9IHsNCiAJLm1hdGNo
CQk9IHNwbWlfZGV2aWNlX21hdGNoLA0KIAkucHJvYmUJCT0gc3BtaV9kcnZfcHJvYmUsDQogCS5y
ZW1vdmUJCT0gc3BtaV9kcnZfcmVtb3ZlLA0KKwkuc2h1dGRvd24JPSBzcG1pX2Rydl9zaHV0ZG93
biwNCiAJLnVldmVudAkJPSBzcG1pX2Rydl91ZXZlbnQsDQogfTsNCiANCmRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L3NwbWkuaCBiL2luY2x1ZGUvbGludXgvc3BtaS5oDQppbmRleCAzOTRhM2Y2
OGJhZDUuLjcyOWJjYmY5ZjVhZCAxMDA2NDQNCi0tLSBhL2luY2x1ZGUvbGludXgvc3BtaS5oDQor
KysgYi9pbmNsdWRlL2xpbnV4L3NwbWkuaA0KQEAgLTEzOCw2ICsxMzgsNyBAQCBzdHJ1Y3Qgc3Bt
aV9kcml2ZXIgew0KIAlzdHJ1Y3QgZGV2aWNlX2RyaXZlciBkcml2ZXI7DQogCWludAkoKnByb2Jl
KShzdHJ1Y3Qgc3BtaV9kZXZpY2UgKnNkZXYpOw0KIAl2b2lkCSgqcmVtb3ZlKShzdHJ1Y3Qgc3Bt
aV9kZXZpY2UgKnNkZXYpOw0KKwl2b2lkCSgqc2h1dGRvd24pKHN0cnVjdCBzcG1pX2RldmljZSAq
c2Rldik7DQogfTsNCiANCiBzdGF0aWMgaW5saW5lIHN0cnVjdCBzcG1pX2RyaXZlciAqdG9fc3Bt
aV9kcml2ZXIoc3RydWN0IGRldmljZV9kcml2ZXIgKmQpDQotLSANCjIuMTguMA0K

