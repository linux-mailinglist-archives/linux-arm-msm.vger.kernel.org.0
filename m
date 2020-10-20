Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14CC12933D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Oct 2020 06:14:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729962AbgJTEOv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Oct 2020 00:14:51 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:58649 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729864AbgJTEOv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Oct 2020 00:14:51 -0400
X-UUID: 55dbc959f2024547948100cc806277d6-20201020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=xdhsTKWvOT25dyntXEsCjiRj2p554GKQn1cVdp+H27Y=;
        b=M9/QArr/Qy4voORa+X5T2jcMczENP1nHNVcuqRkfPQ06BzNvRnCSDesjnGFNVqUYeL0At9+SAba58B5cF1NDJ2C90xUGMISUGiComMZjQJVjtDN4DyHQDCuuDYb8T92mzOC9yA+4rfZEnr3Ytz8Dq19N0S1XNidVvXw5G1BTK0o=;
X-UUID: 55dbc959f2024547948100cc806277d6-20201020
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 669263551; Tue, 20 Oct 2020 12:04:28 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 20 Oct 2020 12:04:26 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Oct 2020 12:04:26 +0800
Message-ID: <1603166666.31677.1.camel@mtksdaap41>
Subject: Re: [PATCH v4 1/2] dt-bindings: spmi: document binding for the
 Mediatek SPMI controller
From:   Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Rob Herring <robh@kernel.org>
CC:     Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <srv_heupstream@mediatek.com>
Date:   Tue, 20 Oct 2020 12:04:26 +0800
In-Reply-To: <20201019195454.GB3499610@bogus>
References: <1602864634-23489-1-git-send-email-hsin-hsiung.wang@mediatek.com>
         <1602864634-23489-2-git-send-email-hsin-hsiung.wang@mediatek.com>
         <20201019195454.GB3499610@bogus>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SGksDQoNCk9uIE1vbiwgMjAyMC0xMC0xOSBhdCAxNDo1NCAtMDUwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6DQo+IE9uIFNhdCwgT2N0IDE3LCAyMDIwIGF0IDEyOjEwOjMzQU0gKzA4MDAsIEhzaW4tSHNp
dW5nIFdhbmcgd3JvdGU6DQo+ID4gVGhpcyBhZGRzIGRvY3VtZW50YXRpb24gZm9yIHRoZSBTUE1J
IGNvbnRyb2xsZXIgZm91bmQgb24gTWVkaWF0ZWsgU29Dcy4NCj4gPiANCj4gPiBTaWduZWQtb2Zm
LWJ5OiBIc2luLUhzaXVuZyBXYW5nIDxoc2luLWhzaXVuZy53YW5nQG1lZGlhdGVrLmNvbT4NCj4g
PiAtLS0NCj4gDQo+IElmIHlvdSBoYXZlIGEgZGVwZW5kZW5jeSBzdWNoIGFzIHRoZSBpbmNsdWRl
LCBwbGVhc2Ugbm90ZSBpdCBoZXJlLg0KPiANClNvcnJ5LCBJIGRvbid0IGFkZCB0aGUgbmVjZXNz
YXJ5IHBhdGNoc2V0WzFdIGludG8gdGhlIGNvbW1pdCBtZXNzYWdlLg0KSSB3aWxsIHVwZGF0ZSBp
dCBpbiB0aGUgbmV4dCBwYXRjaC4NCg0KWzFdDQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3Jn
L3Byb2plY3QvbGludXgtbWVkaWF0ZWsvbGlzdC8/c2VyaWVzPTM0MjU5Mw0KDQo+ID4gIC4uLi9i
aW5kaW5ncy9zcG1pL210ayxzcG1pLW10ay1wbWlmLnlhbWwgICAgICB8IDcwICsrKysrKysrKysr
KysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDcwIGluc2VydGlvbnMoKykNCj4gPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcG1pL210
ayxzcG1pLW10ay1wbWlmLnlhbWwNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwbWkvbXRrLHNwbWktbXRrLXBtaWYueWFtbCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcG1pL210ayxzcG1pLW10ay1wbWlmLnlhbWwN
Cj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uOTk0NTIw
MGEzNWIzDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9zcG1pL210ayxzcG1pLW10ay1wbWlmLnlhbWwNCj4gPiBAQCAtMCwwICsx
LDcwIEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIE9SIEJTRC0y
LUNsYXVzZSkNCj4gPiArJVlBTUwgMS4yDQo+ID4gKy0tLQ0KPiA+ICskaWQ6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9zY2hlbWFzL3NwbWkvbXRrLHNwbWktbXRrLXBtaWYueWFtbCMNCj4gPiArJHNj
aGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+ID4g
Kw0KPiA+ICt0aXRsZTogTWVkaWF0ZWsgU1BNSSBDb250cm9sbGVyIERldmljZSBUcmVlIEJpbmRp
bmdzDQo+ID4gKw0KPiA+ICttYWludGFpbmVyczoNCj4gPiArICAtIEhzaW4tSHNpdW5nIFdhbmcg
PGhzaW4taHNpdW5nLndhbmdAbWVkaWF0ZWsuY29tPg0KPiA+ICsNCj4gPiArZGVzY3JpcHRpb246
IHwrDQo+ID4gKyAgT24gTWVkaWFUZWsgU29DcyB0aGUgUE1JQyBpcyBjb25uZWN0ZWQgdmlhIFNQ
TUkgYW5kIHRoZSBjb250cm9sbGVyIGFsbG93cw0KPiA+ICsgIGZvciBtdWx0aXBsZSBTb0NzIHRv
IGNvbnRyb2wgYSBzaW5nbGUgU1BNSSBtYXN0ZXIuDQo+IA0KPiBOZWVkIGEgJHJlZiB0byBzcG1p
LnlhbWwuDQo+IA0KVGhhbmtzLCBJIHdpbGwgdXBkYXRlIGl0IGluIHRoZSBuZXh0IHBhdGNoLg0K
PiA+ICsNCj4gPiArcHJvcGVydGllczoNCj4gPiArICBjb21wYXRpYmxlOg0KPiA+ICsgICAgY29u
c3Q6IG1lZGlhdGVrLG10Njg3My1zcG1pDQo+ID4gKw0KPiA+ICsgIHJlZzoNCj4gPiArICAgIG1p
bkl0ZW1zOiAyDQo+ID4gKyAgICBtYXhJdGVtczogMg0KPiA+ICsNCj4gPiArICByZWctbmFtZXM6
DQo+ID4gKyAgICBpdGVtczoNCj4gPiArICAgICAgLSBjb25zdDogInBtaWYiDQo+ID4gKyAgICAg
IC0gY29uc3Q6ICJzcG1pbXN0Ig0KPiANCj4gRG9uJ3QgbmVlZCBxdW90ZXMNCj4gDQpUaGFua3Ms
IEkgd2lsbCB1cGRhdGUgaXQgaW4gdGhlIG5leHQgcGF0Y2guDQo+ID4gKw0KPiA+ICsgIGNsb2Nr
czoNCj4gPiArICAgIG1pbkl0ZW1zOiAzDQo+ID4gKyAgICBtYXhJdGVtczogMw0KPiA+ICsNCj4g
PiArICBjbG9jay1uYW1lczoNCj4gPiArICAgIGl0ZW1zOg0KPiA+ICsgICAgICAtIGNvbnN0OiAi
cG1pZl9zeXNfY2siDQo+ID4gKyAgICAgIC0gY29uc3Q6ICJwbWlmX3Rtcl9jayINCj4gPiArICAg
ICAgLSBjb25zdDogInNwbWltc3RfY2xrX211eCINCj4gPiArDQo+ID4gKyAgYXNzaWduZWQtY2xv
Y2tzOg0KPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiArDQo+ID4gKyAgYXNzaWduZWQtY2xvY2st
cGFyZW50czoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICtyZXF1aXJlZDoNCj4g
PiArICAtIGNvbXBhdGlibGUNCj4gPiArICAtIHJlZw0KPiA+ICsgIC0gcmVnLW5hbWVzDQo+ID4g
KyAgLSBjbG9ja3MNCj4gPiArICAtIGNsb2NrLW5hbWVzDQo+IA0KPiB1bmV2YWx1YXRlZFByb3Bl
cnRpZXM6IGZhbHNlDQo+IA0KVGhhbmtzLCBJIHdpbGwgdXBkYXRlIGl0IGluIHRoZSBuZXh0IHBh
dGNoLg0KPiA+ICsNCj4gPiArZXhhbXBsZXM6DQo+ID4gKyAgLSB8DQo+ID4gKyAgICAjaW5jbHVk
ZSA8ZHQtYmluZGluZ3MvY2xvY2svbXQ4MTkyLWNsay5oPg0KPiA+ICsNCj4gPiArICAgIHNwbWk6
IHNwbWlAMTAwMjcwMDAgew0KPiA+ICsgICAgICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ2
ODczLXNwbWkiOw0KPiA+ICsgICAgICAgIHJlZyA9IDwwIDB4MTAwMjcwMDAgMCAweDAwMGUwMD4s
DQo+ID4gKyAgICAgICAgICAgICAgPDAgMHgxMDAyOTAwMCAwIDB4MDAwMTAwPjsNCj4gPiArICAg
ICAgICByZWctbmFtZXMgPSAicG1pZiIsICJzcG1pbXN0IjsNCj4gPiArICAgICAgICBjbG9ja3Mg
PSA8JmluZnJhY2ZnIENMS19JTkZSQV9QTUlDX0FQPiwNCj4gPiArICAgICAgICAgICAgICAgICA8
JmluZnJhY2ZnIENMS19JTkZSQV9QTUlDX1RNUj4sDQo+ID4gKyAgICAgICAgICAgICAgICAgPCZ0
b3Bja2dlbiBDTEtfVE9QX1NQTUlfTVNUX1NFTD47DQo+ID4gKyAgICAgICAgY2xvY2stbmFtZXMg
PSAicG1pZl9zeXNfY2siLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgInBtaWZfdG1yX2Nr
IiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICJzcG1pbXN0X2Nsa19tdXgiOw0KPiA+ICsg
ICAgICAgIGFzc2lnbmVkLWNsb2NrcyA9IDwmdG9wY2tnZW4gQ0xLX1RPUF9QV1JBUF9VTFBPU0Nf
U0VMPjsNCj4gPiArICAgICAgICBhc3NpZ25lZC1jbG9jay1wYXJlbnRzID0gPCZ0b3Bja2dlbiBD
TEtfVE9QX09TQ19EMTA+Ow0KPiA+ICsgICAgfTsNCj4gPiArLi4uDQo+ID4gLS0gDQo+ID4gMi4x
OC4wDQoNCg==

