Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCE9828F2CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Oct 2020 14:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727845AbgJOM7U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Oct 2020 08:59:20 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:43774 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726121AbgJOM7R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Oct 2020 08:59:17 -0400
X-UUID: 29e54caaea214e3e820ff043186704ec-20201015
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=FLPCDUAskVZvAtsDNHb6TvCzZkL8/uiNYJKOELwOJe8=;
        b=OytQrD+TYHcHcEvIsoFkxMmwDUTsNn56+6hxSGFc2aLX7cu29kmdrhvEvhea8PSCxQoNzNDZoYSlixzQEInuYhgE4+VCY/0Rjk+2O26IoUA2xFbw9PYkUVC8x9edrycjkgo8yP0gdMEi+Vox5E3QLRZq5znXygXSqtNPBFJRxIg=;
X-UUID: 29e54caaea214e3e820ff043186704ec-20201015
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 780969323; Thu, 15 Oct 2020 20:59:11 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Oct 2020 20:59:09 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 15 Oct 2020 20:59:09 +0800
From:   Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <srv_heupstream@mediatek.com>
Subject: [PATCH v3 1/2] dt-bindings: spmi: document binding for the Mediatek SPMI controller
Date:   Thu, 15 Oct 2020 20:59:07 +0800
Message-ID: <1602766748-25490-2-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1602766748-25490-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1602766748-25490-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

VGhpcyBhZGRzIGRvY3VtZW50YXRpb24gZm9yIHRoZSBTUE1JIGNvbnRyb2xsZXIgZm91bmQgb24g
TWVkaWF0ZWsgU29Dcy4NCg0KU2lnbmVkLW9mZi1ieTogSHNpbi1Ic2l1bmcgV2FuZyA8aHNpbi1o
c2l1bmcud2FuZ0BtZWRpYXRlay5jb20+DQotLS0NCiAuLi4vYmluZGluZ3Mvc3BtaS9zcG1pLW10
ay1wbWlmLnlhbWwgICAgICAgICAgfCA3MSArKysrKysrKysrKysrKysrKysrDQogMSBmaWxlIGNo
YW5nZWQsIDcxIGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwbWkvc3BtaS1tdGstcG1pZi55YW1sDQoNCmRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BtaS9zcG1pLW10ay1wbWlm
LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BtaS9zcG1pLW10ay1w
bWlmLnlhbWwNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwMDAwMDAuLjM5NDU5
Y2EyZTBkYQ0KLS0tIC9kZXYvbnVsbA0KKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3NwbWkvc3BtaS1tdGstcG1pZi55YW1sDQpAQCAtMCwwICsxLDcxIEBADQorIyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKQ0KKyVZQU1MIDEu
Mg0KKy0tLQ0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvc3BtaS9zcG1pLW10
ay1wbWlmLnlhbWwjDQorJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1h
cy9jb3JlLnlhbWwjDQorDQordGl0bGU6IE1lZGlhdGVrIFNQTUkgQ29udHJvbGxlciBEZXZpY2Ug
VHJlZSBCaW5kaW5ncw0KKw0KK21haW50YWluZXJzOg0KKyAgLSBTdGVwaGVuIEJveWQgPHNib3lk
QGtlcm5lbC5vcmc+DQorICAtIE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5j
b20+DQorDQorZGVzY3JpcHRpb246IHwrDQorICBPbiBNZWRpYVRlayBTb0NzIHRoZSBQTUlDIGlz
IGNvbm5lY3RlZCB2aWEgU1BNSSBhbmQgdGhlIGNvbnRyb2xsZXIgYWxsb3dzDQorICBmb3IgbXVs
dGlwbGUgU29DcyB0byBjb250cm9sIGEgc2luZ2xlIFNQTUkgbWFzdGVyLg0KKw0KK3Byb3BlcnRp
ZXM6DQorICBjb21wYXRpYmxlOg0KKyAgICBjb25zdDogbWVkaWF0ZWssbXQ2ODczLXNwbWkNCisN
CisgIHJlZzoNCisgICAgbWluSXRlbXM6IDINCisgICAgbWF4SXRlbXM6IDINCisNCisgIHJlZy1u
YW1lczoNCisgICAgaXRlbXM6DQorICAgICAgLSBjb25zdDogInBtaWYiDQorICAgICAgLSBjb25z
dDogInNwbWltc3QiDQorDQorICBjbG9ja3M6DQorICAgIG1pbkl0ZW1zOiAzDQorICAgIG1heEl0
ZW1zOiAzDQorDQorICBjbG9jay1uYW1lczoNCisgICAgaXRlbXM6DQorICAgICAgLSBjb25zdDog
InBtaWZfc3lzX2NrIg0KKyAgICAgIC0gY29uc3Q6ICJwbWlmX3Rtcl9jayINCisgICAgICAtIGNv
bnN0OiAic3BtaW1zdF9jbGtfbXV4Ig0KKw0KKyAgYXNzaWduZWQtY2xvY2tzOg0KKyAgICBtYXhJ
dGVtczogMQ0KKw0KKyAgYXNzaWduZWQtY2xvY2stcGFyZW50czoNCisgICAgbWF4SXRlbXM6IDEN
CisNCityZXF1aXJlZDoNCisgIC0gY29tcGF0aWJsZQ0KKyAgLSByZWcNCisgIC0gcmVnLW5hbWVz
DQorICAtIGNsb2Nrcw0KKyAgLSBjbG9jay1uYW1lcw0KKw0KK2V4YW1wbGVzOg0KKyAgLSB8DQor
ICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9tdDgxOTItY2xrLmg+DQorDQorICAgIHNw
bWk6IHNwbWlAMTAwMjcwMDAgew0KKyAgICAgICAgY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDY4
NzMtc3BtaSI7DQorICAgICAgICByZWcgPSA8MCAweDEwMDI3MDAwIDAgMHgwMDBlMDA+LA0KKyAg
ICAgICAgICAgICAgPDAgMHgxMDAyOTAwMCAwIDB4MDAwMTAwPjsNCisgICAgICAgIHJlZy1uYW1l
cyA9ICJwbWlmIiwgInNwbWltc3QiOw0KKyAgICAgICAgY2xvY2tzID0gPCZpbmZyYWNmZyBDTEtf
SU5GUkFfUE1JQ19BUD4sDQorICAgICAgICAgICAgICAgICA8JmluZnJhY2ZnIENMS19JTkZSQV9Q
TUlDX1RNUj4sDQorICAgICAgICAgICAgICAgICA8JnRvcGNrZ2VuIENMS19UT1BfU1BNSV9NU1Rf
U0VMPjsNCisgICAgICAgIGNsb2NrLW5hbWVzID0gInBtaWZfc3lzX2NrIiwNCisgICAgICAgICAg
ICAgICAgICAgICAgInBtaWZfdG1yX2NrIiwNCisgICAgICAgICAgICAgICAgICAgICAgInNwbWlt
c3RfY2xrX211eCI7DQorICAgICAgICBhc3NpZ25lZC1jbG9ja3MgPSA8JnRvcGNrZ2VuIENMS19U
T1BfUFdSQVBfVUxQT1NDX1NFTD47DQorICAgICAgICBhc3NpZ25lZC1jbG9jay1wYXJlbnRzID0g
PCZ0b3Bja2dlbiBDTEtfVE9QX09TQ19EMTA+Ow0KKyAgICB9Ow0KKy4uLg0KLS0gDQoyLjE4LjAN
Cg==

