Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12F332933CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Oct 2020 06:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730459AbgJTEKr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Oct 2020 00:10:47 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:52500 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728339AbgJTEKr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Oct 2020 00:10:47 -0400
X-UUID: 3e2d6fcab1294f4da06361514eed91eb-20201020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=zp5jLGm63aQhYRoDx4NhNAPU064r5IJUGVEyCltzIJE=;
        b=kBvbM70DagvRjbW3mi7d0FSxDlN41jckXJgaVjydMg/NC46nnZNb9WLl3zsddtr9APmd9TsLj1puwWXnkCOwCRwodsYpcgpFg7DiqgVM18Xw+3TVp8eMl644PKOxyjXLV+RjlipXHvv9BlA9FREJqujStiC9R3PoivXB8bFeoFs=;
X-UUID: 3e2d6fcab1294f4da06361514eed91eb-20201020
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1822166561; Tue, 20 Oct 2020 12:00:22 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 20 Oct 2020 12:00:20 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Oct 2020 12:00:21 +0800
Message-ID: <1603166421.26597.1.camel@mtksdaap41>
Subject: Re: [PATCH v4 1/2] dt-bindings: spmi: document binding for the
 Mediatek SPMI controller
From:   Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Rob Herring <robh@kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Date:   Tue, 20 Oct 2020 12:00:21 +0800
In-Reply-To: <20201019195207.GA3499610@bogus>
References: <1602864634-23489-1-git-send-email-hsin-hsiung.wang@mediatek.com>
         <1602864634-23489-2-git-send-email-hsin-hsiung.wang@mediatek.com>
         <20201019195207.GA3499610@bogus>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SGksDQoNCk9uIE1vbiwgMjAyMC0xMC0xOSBhdCAxNDo1MiAtMDUwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6DQo+IE9uIFNhdCwgMTcgT2N0IDIwMjAgMDA6MTA6MzMgKzA4MDAsIEhzaW4tSHNpdW5nIFdh
bmcgd3JvdGU6DQo+ID4gVGhpcyBhZGRzIGRvY3VtZW50YXRpb24gZm9yIHRoZSBTUE1JIGNvbnRy
b2xsZXIgZm91bmQgb24gTWVkaWF0ZWsgU29Dcy4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBI
c2luLUhzaXVuZyBXYW5nIDxoc2luLWhzaXVuZy53YW5nQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0N
Cj4gPiAgLi4uL2JpbmRpbmdzL3NwbWkvbXRrLHNwbWktbXRrLXBtaWYueWFtbCAgICAgIHwgNzAg
KysrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNzAgaW5zZXJ0aW9ucygr
KQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3NwbWkvbXRrLHNwbWktbXRrLXBtaWYueWFtbA0KPiA+IA0KPiANCj4gDQo+IE15IGJvdCBm
b3VuZCBlcnJvcnMgcnVubmluZyAnbWFrZSBkdF9iaW5kaW5nX2NoZWNrJyBvbiB5b3VyIHBhdGNo
Og0KPiANCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwbWkvbXRrLHNwbWkt
bXRrLXBtaWYuZXhhbXBsZS5kdHM6MTk6MTg6IGZhdGFsIGVycm9yOiBkdC1iaW5kaW5ncy9jbG9j
ay9tdDgxOTItY2xrLmg6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkNCj4gICAgMTkgfCAgICAg
ICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9tdDgxOTItY2xrLmg+DQo+ICAgICAgIHwg
ICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fg0KPiBjb21w
aWxhdGlvbiB0ZXJtaW5hdGVkLg0KPiBtYWtlWzFdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUubGli
OjM0MjogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwbWkvbXRrLHNwbWktbXRr
LXBtaWYuZXhhbXBsZS5kdC55YW1sXSBFcnJvciAxDQo+IG1ha2VbMV06ICoqKiBXYWl0aW5nIGZv
ciB1bmZpbmlzaGVkIGpvYnMuLi4uDQo+IG1ha2U6ICoqKiBbTWFrZWZpbGU6MTM2NjogZHRfYmlu
ZGluZ19jaGVja10gRXJyb3IgMg0KPiANCj4gDQo+IFNlZSBodHRwczovL3BhdGNod29yay5vemxh
YnMub3JnL3BhdGNoLzEzODM0NDENCj4gDQo+IElmIHlvdSBhbHJlYWR5IHJhbiAnbWFrZSBkdF9i
aW5kaW5nX2NoZWNrJyBhbmQgZGlkbid0IHNlZSB0aGUgYWJvdmUNCj4gZXJyb3IocyksIHRoZW4g
bWFrZSBzdXJlIGR0LXNjaGVtYSBpcyB1cCB0byBkYXRlOg0KPiANCj4gcGlwMyBpbnN0YWxsIGdp
dCtodHRwczovL2dpdGh1Yi5jb20vZGV2aWNldHJlZS1vcmcvZHQtc2NoZW1hLmdpdEBtYXN0ZXIg
LS11cGdyYWRlDQo+IA0KPiBQbGVhc2UgY2hlY2sgYW5kIHJlLXN1Ym1pdC4NCj4gDQoNClNvcnJ5
LCBJIGRvbid0IGFkZCB0aGUgbmVjZXNzYXJ5IHNlcmllc1sxXSBpbnRvIHRoZSBjb21taXQgbWVz
c2FnZS4NCkkgd2lsbCB1cGRhdGUgaXQgaW4gdGhlIG5leHQgcGF0Y2gsIHRoYW5rcyBmb3IgdGhl
IHJldmlldy4NCg0KWzFdDQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGlu
dXgtbWVkaWF0ZWsvbGlzdC8/c2VyaWVzPTM0MjU5Mw0K

