Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92C4623A15C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Aug 2020 10:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726585AbgHCI5q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Aug 2020 04:57:46 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:10775 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725806AbgHCI5m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Aug 2020 04:57:42 -0400
X-UUID: 84349119848348c5bae72a879c42f07b-20200803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=fPWsFbLSz9VhS0OLeT45kMuZ4kCWME6UPnLlJF67d3Y=;
        b=Qbx+M2M6uWZC3F69MI+vhimedN2Vthdf4CbtFLiar3B2zc+ioDYLEUNZnuMwoPJKC4apJUOJNSUQiUJSiEVspQvW4CsVqh4sHs74xaXDN72+mTjcI6hDZ9pZpKsN7oOc9Zj/5swq2eQex+xrNGkez0RDymoOOqjLxX7mIxGQ9tk=;
X-UUID: 84349119848348c5bae72a879c42f07b-20200803
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw01.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 494065863; Mon, 03 Aug 2020 16:57:38 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 16:57:35 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 3 Aug 2020 16:57:35 +0800
From:   Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     Liam Girdwood <lgirdwood@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <srv_heupstream@mediatek.com>
Subject: [PATCH 2/3] regulator: bindings: Add document for MT6315 regulator
Date:   Mon, 3 Aug 2020 16:57:26 +0800
Message-ID: <1596445047-2975-3-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1596445047-2975-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1596445047-2975-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

QWRkIGRldmljZSB0cmVlIGJpbmRpbmcgaW5mb3JtYXRpb24gZm9yIG10NjMxNSByZWd1bGF0b3Ig
ZHJpdmVyLg0KRXhhbXBsZSBiaW5kaW5ncyBmb3IgbXQ2MzE1IGFyZSBhZGRlZC4NCg0KU2lnbmVk
LW9mZi1ieTogSHNpbi1Ic2l1bmcgV2FuZyA8aHNpbi1oc2l1bmcud2FuZ0BtZWRpYXRlay5jb20+
DQotLS0NCiAuLi4vYmluZGluZ3MvcmVndWxhdG9yL210NjMxNS1yZWd1bGF0b3IudHh0ICAgICAg
ICB8IDQ1ICsrKysrKysrKysrKysrKysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgNDUgaW5zZXJ0
aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcmVndWxhdG9yL210NjMxNS1yZWd1bGF0b3IudHh0DQoNCmRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVndWxhdG9yL210NjMxNS1yZWd1bGF0b3Iu
dHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3JlZ3VsYXRvci9tdDYzMTUt
cmVndWxhdG9yLnR4dA0KbmV3IGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAuLjFjMTQ1
MzcNCi0tLSAvZGV2L251bGwNCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9yZWd1bGF0b3IvbXQ2MzE1LXJlZ3VsYXRvci50eHQNCkBAIC0wLDAgKzEsNDUgQEANCitNZWRp
YXRlayBNVDYzMTUgUmVndWxhdG9yDQorDQorUmVxdWlyZWQgcHJvcGVydGllczoNCistIGNvbXBh
dGlibGU6IE11c3QgYmUgb25lIG9mIHRoZSBmb2xsb3dpbmcuDQorCSJtZWRpYXRlayxtdDYzMTVf
My1yZWd1bGF0b3IiDQorCSJtZWRpYXRlayxtdDYzMTVfNi1yZWd1bGF0b3IiDQorCSJtZWRpYXRl
ayxtdDYzMTVfNy1yZWd1bGF0b3IiDQorLSByZWc6IFNQTUkgc2xhdmUgaWQuDQorLSByZWd1bGF0
b3JzOiBMaXN0IG9mIHJlZ3VsYXRvcnMgcHJvdmlkZWQgYnkgdGhpcyBjb250cm9sbGVyLg0KKyAg
VGhlIGRlZmluaXRpb24gZm9yIGVhY2ggb2YgdGhlc2Ugbm9kZXMgaXMgZGVmaW5lZCB1c2luZyB0
aGUgc3RhbmRhcmQgYmluZGluZw0KKyAgZm9yIHJlZ3VsYXRvcnMgYXQgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3JlZ3VsYXRvci9yZWd1bGF0b3IudHh0Lg0KKw0KK1RoZSB2YWxp
ZCBuYW1lcyBmb3IgcmVndWxhdG9ycyBhcmU6DQorQlVDSzoNCisgIHZidWNrMSwgdmJ1Y2szLCB2
YnVjazQNCisNCitFeGFtcGxlOg0KKwltdDYzMTVfMzogbXQ2MzE1QDMgew0KKwkJY29tcGF0aWJs
ZSA9ICJtZWRpYXRlayxtdDYzMTVfMy1yZWd1bGF0b3IiOw0KKwkJcmVnID0gPDB4MyAwIDB4YiAx
PjsNCisNCisJCW10NjMxNV8zX3ZidWNrMTogdmJ1Y2sxIHsNCisJCQlyZWd1bGF0b3ItY29tcGF0
aWJsZSA9ICJ2YnVjazEiOw0KKwkJCXJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDMwMDAwMD47
DQorCQkJcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MTE5Mzc1MD47DQorCQkJcmVndWxhdG9y
LWVuYWJsZS1yYW1wLWRlbGF5ID0gPDI1Nj47DQorCQkJcmVndWxhdG9yLWFsbG93ZWQtbW9kZXMg
PSA8MCAxIDIgND47DQorCQl9Ow0KKw0KKwkJbXQ2MzE1XzNfdmJ1Y2szOiB2YnVjazMgew0KKwkJ
CXJlZ3VsYXRvci1jb21wYXRpYmxlID0gInZidWNrMyI7DQorCQkJcmVndWxhdG9yLW1pbi1taWNy
b3ZvbHQgPSA8MzAwMDAwPjsNCisJCQlyZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDwxMTkzNzUw
PjsNCisJCQlyZWd1bGF0b3ItZW5hYmxlLXJhbXAtZGVsYXkgPSA8MjU2PjsNCisJCQlyZWd1bGF0
b3ItYWxsb3dlZC1tb2RlcyA9IDwwIDEgMiA0PjsNCisJCX07DQorDQorCQltdDYzMTVfM192YnVj
azM6IHZidWNrMyB7DQorCQkJcmVndWxhdG9yLWNvbXBhdGlibGUgPSAidmJ1Y2szIjsNCisJCQly
ZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwzMDAwMDA+Ow0KKwkJCXJlZ3VsYXRvci1tYXgtbWlj
cm92b2x0ID0gPDExOTM3NTA+Ow0KKwkJCXJlZ3VsYXRvci1lbmFibGUtcmFtcC1kZWxheSA9IDwy
NTY+Ow0KKwkJCXJlZ3VsYXRvci1hbGxvd2VkLW1vZGVzID0gPDAgMSAyIDQ+Ow0KKwkJfTsNCisJ
fTsNCi0tIA0KMi42LjQNCg==

