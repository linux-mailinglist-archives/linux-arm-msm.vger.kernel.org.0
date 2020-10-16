Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D74C290963
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Oct 2020 18:11:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409433AbgJPQKt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Oct 2020 12:10:49 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:40163 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2409118AbgJPQKt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Oct 2020 12:10:49 -0400
X-UUID: e423ee0deb694180b23291f61369b5e4-20201017
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vp5ObmKJhL5ZnMWJsZlM8Qc89TaLF/tgyfvaRsPjfoo=;
        b=QyuKzIAiXwYdEIGt31VdCTNUbT69K9unbaIlS9SjKwFagpW68hfnL3Y/uKzYMku37yUkbdkWHApfk1FbThzS/xQxSg8XCh/Dyd3JH5GRDJZFRyqqQ5bABkhF0O6uoxhorVvR/f4JewaG48p6eNBkxQfiqcNv2UuP0lVyG4RaULo=;
X-UUID: e423ee0deb694180b23291f61369b5e4-20201017
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1465763502; Sat, 17 Oct 2020 00:10:44 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Oct 2020 00:10:42 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 17 Oct 2020 00:10:42 +0800
From:   Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <srv_heupstream@mediatek.com>
Subject: [PATCH v4 1/2] dt-bindings: spmi: document binding for the Mediatek SPMI controller
Date:   Sat, 17 Oct 2020 00:10:33 +0800
Message-ID: <1602864634-23489-2-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1602864634-23489-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1602864634-23489-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

VGhpcyBhZGRzIGRvY3VtZW50YXRpb24gZm9yIHRoZSBTUE1JIGNvbnRyb2xsZXIgZm91bmQgb24g
TWVkaWF0ZWsgU29Dcy4NCg0KU2lnbmVkLW9mZi1ieTogSHNpbi1Ic2l1bmcgV2FuZyA8aHNpbi1o
c2l1bmcud2FuZ0BtZWRpYXRlay5jb20+DQotLS0NCiAuLi4vYmluZGluZ3Mvc3BtaS9tdGssc3Bt
aS1tdGstcG1pZi55YW1sICAgICAgfCA3MCArKysrKysrKysrKysrKysrKysrDQogMSBmaWxlIGNo
YW5nZWQsIDcwIGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwbWkvbXRrLHNwbWktbXRrLXBtaWYueWFtbA0KDQpkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwbWkvbXRrLHNwbWkt
bXRrLXBtaWYueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcG1pL210
ayxzcG1pLW10ay1wbWlmLnlhbWwNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAw
MDAwMDAuLjk5NDUyMDBhMzViMw0KLS0tIC9kZXYvbnVsbA0KKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3NwbWkvbXRrLHNwbWktbXRrLXBtaWYueWFtbA0KQEAgLTAsMCAr
MSw3MCBAQA0KKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIE9SIEJTRC0yLUNs
YXVzZSkNCislWUFNTCAxLjINCistLS0NCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hl
bWFzL3NwbWkvbXRrLHNwbWktbXRrLXBtaWYueWFtbCMNCiskc2NoZW1hOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCisNCit0aXRsZTogTWVkaWF0ZWsgU1BN
SSBDb250cm9sbGVyIERldmljZSBUcmVlIEJpbmRpbmdzDQorDQorbWFpbnRhaW5lcnM6DQorICAt
IEhzaW4tSHNpdW5nIFdhbmcgPGhzaW4taHNpdW5nLndhbmdAbWVkaWF0ZWsuY29tPg0KKw0KK2Rl
c2NyaXB0aW9uOiB8Kw0KKyAgT24gTWVkaWFUZWsgU29DcyB0aGUgUE1JQyBpcyBjb25uZWN0ZWQg
dmlhIFNQTUkgYW5kIHRoZSBjb250cm9sbGVyIGFsbG93cw0KKyAgZm9yIG11bHRpcGxlIFNvQ3Mg
dG8gY29udHJvbCBhIHNpbmdsZSBTUE1JIG1hc3Rlci4NCisNCitwcm9wZXJ0aWVzOg0KKyAgY29t
cGF0aWJsZToNCisgICAgY29uc3Q6IG1lZGlhdGVrLG10Njg3My1zcG1pDQorDQorICByZWc6DQor
ICAgIG1pbkl0ZW1zOiAyDQorICAgIG1heEl0ZW1zOiAyDQorDQorICByZWctbmFtZXM6DQorICAg
IGl0ZW1zOg0KKyAgICAgIC0gY29uc3Q6ICJwbWlmIg0KKyAgICAgIC0gY29uc3Q6ICJzcG1pbXN0
Ig0KKw0KKyAgY2xvY2tzOg0KKyAgICBtaW5JdGVtczogMw0KKyAgICBtYXhJdGVtczogMw0KKw0K
KyAgY2xvY2stbmFtZXM6DQorICAgIGl0ZW1zOg0KKyAgICAgIC0gY29uc3Q6ICJwbWlmX3N5c19j
ayINCisgICAgICAtIGNvbnN0OiAicG1pZl90bXJfY2siDQorICAgICAgLSBjb25zdDogInNwbWlt
c3RfY2xrX211eCINCisNCisgIGFzc2lnbmVkLWNsb2NrczoNCisgICAgbWF4SXRlbXM6IDENCisN
CisgIGFzc2lnbmVkLWNsb2NrLXBhcmVudHM6DQorICAgIG1heEl0ZW1zOiAxDQorDQorcmVxdWly
ZWQ6DQorICAtIGNvbXBhdGlibGUNCisgIC0gcmVnDQorICAtIHJlZy1uYW1lcw0KKyAgLSBjbG9j
a3MNCisgIC0gY2xvY2stbmFtZXMNCisNCitleGFtcGxlczoNCisgIC0gfA0KKyAgICAjaW5jbHVk
ZSA8ZHQtYmluZGluZ3MvY2xvY2svbXQ4MTkyLWNsay5oPg0KKw0KKyAgICBzcG1pOiBzcG1pQDEw
MDI3MDAwIHsNCisgICAgICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ2ODczLXNwbWkiOw0K
KyAgICAgICAgcmVnID0gPDAgMHgxMDAyNzAwMCAwIDB4MDAwZTAwPiwNCisgICAgICAgICAgICAg
IDwwIDB4MTAwMjkwMDAgMCAweDAwMDEwMD47DQorICAgICAgICByZWctbmFtZXMgPSAicG1pZiIs
ICJzcG1pbXN0IjsNCisgICAgICAgIGNsb2NrcyA9IDwmaW5mcmFjZmcgQ0xLX0lORlJBX1BNSUNf
QVA+LA0KKyAgICAgICAgICAgICAgICAgPCZpbmZyYWNmZyBDTEtfSU5GUkFfUE1JQ19UTVI+LA0K
KyAgICAgICAgICAgICAgICAgPCZ0b3Bja2dlbiBDTEtfVE9QX1NQTUlfTVNUX1NFTD47DQorICAg
ICAgICBjbG9jay1uYW1lcyA9ICJwbWlmX3N5c19jayIsDQorICAgICAgICAgICAgICAgICAgICAg
ICJwbWlmX3Rtcl9jayIsDQorICAgICAgICAgICAgICAgICAgICAgICJzcG1pbXN0X2Nsa19tdXgi
Ow0KKyAgICAgICAgYXNzaWduZWQtY2xvY2tzID0gPCZ0b3Bja2dlbiBDTEtfVE9QX1BXUkFQX1VM
UE9TQ19TRUw+Ow0KKyAgICAgICAgYXNzaWduZWQtY2xvY2stcGFyZW50cyA9IDwmdG9wY2tnZW4g
Q0xLX1RPUF9PU0NfRDEwPjsNCisgICAgfTsNCisuLi4NCi0tIA0KMi4xOC4wDQo=

