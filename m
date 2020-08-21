Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDF2624D17E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Aug 2020 11:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728101AbgHUJbL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Aug 2020 05:31:11 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:3227 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725965AbgHUJbK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Aug 2020 05:31:10 -0400
X-UUID: f4295ce883d44d24b6e236211704ced1-20200821
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=CzHYYkmPwpQ2AhKcg65BgQbtfesFRKYUwxvX0kNJpAM=;
        b=Z+vwNJnJh0nwVwgVSj9g3M3ZE4gowtox6pVfQ0ckqWPUsVnD4KV0yh/WUHGQy/YhXvKEc3j14+9COxECsIA3O1JfHuHkCSwj8L4CHyVTbeRrvH422yeC0HO8664hFof6UTwRjn9MqkCt9ZhLHZGExE+Wv6CsMPSy2jmDwH62hAA=;
X-UUID: f4295ce883d44d24b6e236211704ced1-20200821
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 113662065; Fri, 21 Aug 2020 17:31:05 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 21 Aug 2020 17:31:02 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 21 Aug 2020 17:31:02 +0800
From:   Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <srv_heupstream@mediatek.com>
Subject: [PATCH 1/2] dt-bindings: spmi: document binding for the Mediatek SPMI controller
Date:   Fri, 21 Aug 2020 17:30:59 +0800
Message-ID: <1598002260-12724-2-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1598002260-12724-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1598002260-12724-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

VGhpcyBhZGRzIGRvY3VtZW50YXRpb24gZm9yIHRoZSBTUE1JIGNvbnRyb2xsZXIgZm91bmQgb24g
TWVkaWF0ZWsgU29Dcy4NCg0KU2lnbmVkLW9mZi1ieTogSHNpbi1Ic2l1bmcgV2FuZyA8aHNpbi1o
c2l1bmcud2FuZ0BtZWRpYXRlay5jb20+DQotLS0NCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9z
cG1pL3NwbWktbXRrLXBtaWYudHh0ICAgICB8IDMzICsrKysrKysrKysrKysrKysrKysrKysNCiAx
IGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BtaS9zcG1pLW10ay1wbWlmLnR4dA0KDQpk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwbWkvc3BtaS1t
dGstcG1pZi50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BtaS9zcG1p
LW10ay1wbWlmLnR4dA0KbmV3IGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAuLjc1YTBl
ZWINCi0tLSAvZGV2L251bGwNCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9zcG1pL3NwbWktbXRrLXBtaWYudHh0DQpAQCAtMCwwICsxLDMzIEBADQorTWVkaWF0ZWsgU1BN
SSBDb250cm9sbGVyDQorDQorVGhpcyBkb2N1bWVudCBkZXNjcmliZXMgdGhlIGJpbmRpbmcgZm9y
IHRoZSBNZWRpYVRlayBTUE1JIGNvbnRyb2xsZXIuDQorDQorT24gTWVkaWFUZWsgU29DcyB0aGUg
UE1JQyBpcyBjb25uZWN0ZWQgdmlhIFNQTUkgYW5kIHRoZSBjb250cm9sbGVyIGFsbG93cw0KK2Zv
ciBtdWx0aXBsZSBTb0NzIHRvIGNvbnRyb2wgYSBzaW5nbGUgU1BNSSBtYXN0ZXIuDQorDQorUmVx
dWlyZWQgcHJvcGVydGllczoNCistIGNvbXBhdGlibGUgOiAibWVkaWF0ZWssbXQ2ODczLXNwbWki
Lg0KKy0gcmVnLW5hbWVzICA6IG11c3QgY29udGFpbjoNCisgICAgICJwbWlmIiAtIHBtaWYgcmVn
aXN0ZXJzDQorICAgICAic3BtaW1zdCIgLSBzcG1pIGNvbnRyb2xsZXIgcmVnaXN0ZXJzDQorLSBy
ZWc6IE11c3QgY29udGFpbiBhbiBlbnRyeSBmb3IgZWFjaCBlbnRyeSBpbiByZWctbmFtZXMuDQor
LSBjbG9jay1uYW1lczogTXVzdCBpbmNsdWRlIHRoZSBmb2xsb3dpbmcgZW50cmllczoNCisgICJw
bWlmX3N5c19jayI6IHBtaWYgc3lzdGVtIGNsb2NrDQorICAicG1pZl90bXJfY2siOiBwbWlmIHRp
bWVyIGNsb2NrDQorICAic3BtaW1zdF9jbGtfbXV4Ijogc3BtaSBtYXN0ZXIgY2xrIG11eA0KKy0g
Y2xvY2tzOiBNdXN0IGNvbnRhaW4gYW4gZW50cnkgZm9yIGVhY2ggZW50cnkgaW4gY2xvY2stbmFt
ZXMuDQorDQorRXhhbXBsZToNCisNCisJc3BtaTogc3BtaUAxMDAyNzAwMCB7DQorCQljb21wYXRp
YmxlID0gIm1lZGlhdGVrLG10Njg3My1zcG1pIjsNCisJCXJlZyA9IDwwIDB4MTAwMjcwMDAgMCAw
eDAwMGUwMD4sDQorCQkgICAgICA8MCAweDEwMDI5MDAwIDAgMHgwMDAxMDA+Ow0KKwkJcmVnLW5h
bWVzID0gInBtaWYiLCAic3BtaW1zdCI7DQorCQljbG9ja3MgPSA8JmluZnJhY2ZnIENMS19JTkZS
QV9QTUlDX0FQPiwNCisJCQkgPCZpbmZyYWNmZyBDTEtfSU5GUkFfUE1JQ19UTVI+LA0KKwkJCSA8
JnRvcGNrZ2VuIENMS19UT1BfU1BNSV9NU1RfU0VMPjsNCisJCWNsb2NrLW5hbWVzID0gInBtaWZf
c3lzX2NrIiwNCisJCQkgICAgICAicG1pZl90bXJfY2siLA0KKwkJCSAgICAgICJzcG1pbXN0X2Ns
a19tdXgiOw0KKwl9Ow0KLS0gDQoyLjYuNA0K

