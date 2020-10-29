Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEE8729E739
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 10:26:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725948AbgJ2J0r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Oct 2020 05:26:47 -0400
Received: from mail-eopbgr1320051.outbound.protection.outlook.com ([40.107.132.51]:29120
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725819AbgJ2J0r (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Oct 2020 05:26:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iOqSz50CL5popHQDxZ7lnj/PI9txkcYpZlFx5LEAcfRM/19sgWvuywbFf6xcwyOXiiK7VXnSwRGJ4SdzNVc67qIAenpEe7j3F1W2aW/9dvUMeqVtjaeOzbEchdxm4QATErRyDYq7hOmeE3+jKnD4VJQrUtIZ97nRHp0rykRxyGhy2kJLhkSD2Hrq8yTgO2OakZYIEs6feMmGQASgUNNQbIcgWZ811vkAOlyX6WC5TDivwoWQnW0PahxusbZ7P//o7N4Sw+FyC3idwqY9bLDYsR/ilMNpTG4DQyIgzs6tVA4ZPcT71a995Meqe2rpn3qTuFk0KBYG9+7sVslS1MSSfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3SLRSHLCiGO/MWOpCiZ+4Grj5uckeduVuLlI+kyteC4=;
 b=nswhGDM+GBHoMLmt5PXoiIzMQ96jWBBV34EYACB+6ydr9jmXuD0YB9hROGElXcXD8LHQBk8gPnmddEOudOfv9sKZTroV047fqg2Ioe1rkh5TcEIXcdPymJfOGJYFK7/he2ioQdSKIqLP34JmbmqbOMB/8K2a0HK5vDXIz4iciCcUCto6VO2g8rGmQ+hoSpSNf0h+719YmXVXMAiUajzecAJjbYVIKOjSd+LVUH+ejmb3n8lzwT4MqphurySimqDL9MkNct2z2avbROfIyuGSIv9afnZ8Ujs1vRkQt0bXlfEbxvToKuQcI8FIAqzxVGMteExnmKx2gU4Tgs3CUaiYtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quectel.com; dmarc=pass action=none header.from=quectel.com;
 dkim=pass header.d=quectel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quectel.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3SLRSHLCiGO/MWOpCiZ+4Grj5uckeduVuLlI+kyteC4=;
 b=dp3XzqdndPczbb62lr+IkMQHZV1gm61Bq57M/VNMJY9aRiPmZCBhGrM3G32f2Eg3iN8fzcZw+CABxi3st8IGHQIMLiu7gh/dWYqyA/MpDkO4AeH1TohKmFPHplm90oNDCRHOIQfYK37/kUIWwOxIweE/W6/IoFjsLV1YOEi5yxI=
Received: from HK2PR06MB3507.apcprd06.prod.outlook.com (2603:1096:202:3e::14)
 by HK0PR06MB2321.apcprd06.prod.outlook.com (2603:1096:203:49::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Thu, 29 Oct
 2020 09:26:40 +0000
Received: from HK2PR06MB3507.apcprd06.prod.outlook.com
 ([fe80::94f:c55a:f9c8:22f4]) by HK2PR06MB3507.apcprd06.prod.outlook.com
 ([fe80::94f:c55a:f9c8:22f4%5]) with mapi id 15.20.3477.028; Thu, 29 Oct 2020
 09:26:40 +0000
From:   =?utf-8?B?Q2FybCBZaW4o5q635byg5oiQKQ==?= <carl.yin@quectel.com>
To:     Hemant Kumar <hemantk@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>
CC:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Naveen Kumar" <naveen.kumar@quectel.com>
Subject: RE: [PATCH] bus: mhi: core: Add support MHI EE FP for download
 firmware
Thread-Topic: [PATCH] bus: mhi: core: Add support MHI EE FP for download
 firmware
Thread-Index: Adat1ZdAEvLPADPdSySWSWi3QMcGKA==
Date:   Thu, 29 Oct 2020 09:26:40 +0000
Message-ID: <HK2PR06MB35078506D624FD03D699457E86140@HK2PR06MB3507.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=quectel.com;
x-originating-ip: [203.93.254.85]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b926a6ac-78ed-4e0f-168c-08d87becbe31
x-ms-traffictypediagnostic: HK0PR06MB2321:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR06MB2321A908E151B4A39D33923286140@HK0PR06MB2321.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K6AvK/XeViLXza5V+jNLtjjw+yY3mKezT9MB58g4BMmKAuqfTaJHYM/+XynXVVBlXjSugFH1GMbATAx0egI4yew1HP3O0Nv1Zm9PzLQJtauAaumISMriBiOdbIRIrYHNyEnSuObrV5dgdc2O1EVCkXjIj5n/LvJ9e3ptqej3+NxXYtywjMuu8r3zhuYuMYye//hyOwXeDNMdWBrs4lWPgUVe46j3fdpQSL2CfJDb9lRr+yL/77rMJ+To8B0J5syZykOHK4Q1GtDVNzRAiaiefgEcB1KxCNA1cAPM0KZM0z2/uqynJKKfYUqbe2opvklx8rHXVW7Ow3DNUwb0+W+7vA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK2PR06MB3507.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(346002)(396003)(39860400002)(366004)(33656002)(71200400001)(66556008)(110136005)(66946007)(66446008)(66476007)(76116006)(186003)(64756008)(8936002)(8676002)(52536014)(316002)(54906003)(107886003)(2906002)(7696005)(4326008)(83380400001)(478600001)(55016002)(5660300002)(86362001)(26005)(85182001)(6506007)(9686003)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: ktS7yBM4UHwNiUdvDmL8xcM//Y84AT1yxSncxkmJkCo2SaMUU2bAhsKCDFaJ2PWQspBPEpXwzN3qEiYCsCYqDVH40xgtLiE2/mePnwrzNBQJTYohcAzO3lom5I3eTeaxkw/fA1ZhNf6E8Gxa587Yis0iRrSMxSh18ETKYL2h/dxG2YJzI2J0nr4WDo6IsPA5JBTNuRZU83a4xD3FHhjRCE1InOhGBii+rkBXxC6flMHrfiQ+CsWOZRvbq9hyWOkSJX5KwT1Mr2cHflav/HvDTW15DI4W91jmcXfpVHsgENECQFjv9C5oWQC8shKv3wE35/q7BYa3AByZXM74G0y31gUqcC55mHj5A6G+a05bzRLVEgj/6H6zeQksa5zr0KxtLFUpMqMHWARFiB8xjFRhQz5Ulr8xtycEXGrCz6zZ/xAdNK8iOMTdhBQezJdPBZQCOh4nNdS97elRBOu38dliEPsyFEu4sIRryAFlnp4mzkNO+YZFO3uHlxF6mpARL9KytcWbDGZmQWiaRHk71m7Fp2pJtPm1/fVfn1NYuY8qUJEdeReVe9jde4DTMfELmZFFqpAhOmqM6he+C9KjnkmE6VrLLPGwwjMO0MsdKuoSsgRsrFsxqtYtbksqQPG3uqpf1h1O5r0Ul7N+1y6/nfDl7g==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quectel.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3507.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b926a6ac-78ed-4e0f-168c-08d87becbe31
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2020 09:26:40.4592
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7730d043-e129-480c-b1ba-e5b6a9f476aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n9APIB1oA7Zlssf7ppu2hQf/nfFXGx5ROPsnx9RPt+2VWBvfjygwD3bHFfpm1mF/q+gyU8JQZFCPNP4nypA16g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2321
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DQoNCk9uIE9jdG9iZXIgMjgsIDIwMjAgNzowMiBBTSwgaGVtYW50ayB3cm90ZToNCj4gSGkgSmVm
ZiwNCj4gDQo+IE9uIDEwLzI3LzIwIDg6MTEgQU0sIEplZmZyZXkgSHVnbyB3cm90ZToNCj4gPiBP
biAxMC8yNy8yMDIwIDM6NDMgQU0sIGNhcmwueWluQHF1ZWN0ZWwuY29tIHdyb3RlOg0KPiA+PiBG
cm9tOiAiY2FybC55aW4iIDxjYXJsLnlpbkBxdWVjdGVsLmNvbT4NCj4gPj4NCj4gPj4gTUhJIHd3
YW4gbW9kZW1zIHN1cHBvcnQgZG93bmxvYWQgZmlybXdhcmUgdG8gbmFuZCBvciBlbW1jIGJ5IGZp
cmVob3NlDQo+ID4+IHByb3RvY29sLCBwcm9jZXNzIGFzIG5leHQ6DQo+ID4+IDEuIHd3YW4gbW9k
ZW0gbm9ybWFsIGJvb3R1cCBhbmQgZW50ZXIgRUUgQU1TUywgY3JlYXRlIG1oaSBESUFHIGNoYW4N
Cj4gPj4gZGV2aWNlIDIuIHNlbmQgRURMIGNtZCB2aWEgRElBRyBjaGFuLCB0aGVuIG1vZGVtIGVu
dGVyIEVFIEVETCAzLg0KPiA+PiBib290LmMgZG93bmxvYWQgJ2ZpcmVob3NlL3Byb2dfZmlyZWhv
c2Vfc2R4NTUubWJuJyB2aWEgQkhJIGludGVyZmFjZQ0KPiA+PiA0LiBtb2RlbSBlbnRlciBFRSBG
UCwgYW5kIGNyZWF0ZSBtaGkgRURMIGNoYW4gZGV2aWNlIDUuIHVzZXIgc3BhY2UNCj4gPj4gdG9v
bCBkb3dubG9hZCBGVyB0byBtb2RlbSB2aWEgRURMIGNoYW4gYnkgZmlyZWhvc2UgcHJvdG9jb2wN
Cj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogY2FybC55aW4gPGNhcmwueWluQHF1ZWN0ZWwuY29t
Pg0KPiA+PiAtLS0NCj4gPj4gwqAgZHJpdmVycy9idXMvbWhpL2NvcmUvYm9vdC5jwqDCoMKgwqAg
fMKgIDQgKysrLQ0KPiA+PiDCoCBkcml2ZXJzL2J1cy9taGkvY29yZS9pbml0LmPCoMKgwqDCoCB8
wqAgMiArKw0KPiA+PiDCoCBkcml2ZXJzL2J1cy9taGkvY29yZS9pbnRlcm5hbC5oIHzCoCAxICsN
Cj4gPj4gwqAgZHJpdmVycy9idXMvbWhpL2NvcmUvbWFpbi5jwqDCoMKgwqAgfMKgIDMgKysrDQo+
ID4+IMKgIGRyaXZlcnMvYnVzL21oaS9jb3JlL3BtLmPCoMKgwqDCoMKgwqAgfCAxNiArKysrKysr
KysrKysrKystDQo+ID4+IMKgIGluY2x1ZGUvbGludXgvbWhpLmjCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfMKgIDQgKysrLQ0KPiA+PiDCoCA2IGZpbGVzIGNoYW5nZWQsIDI3IGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pDQo+ID4+DQo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2J1cy9t
aGkvY29yZS9ib290LmMNCj4gPj4gYi9kcml2ZXJzL2J1cy9taGkvY29yZS9ib290LmMgaW5kZXgg
MjQ0MjJmNS4uYWIzOWFkNiAxMDA2NDQNCj4gPj4gLS0tIGEvZHJpdmVycy9idXMvbWhpL2NvcmUv
Ym9vdC5jDQo+ID4+ICsrKyBiL2RyaXZlcnMvYnVzL21oaS9jb3JlL2Jvb3QuYw0KPiA+PiBAQCAt
NDYwLDggKzQ2MCwxMCBAQCB2b2lkIG1oaV9md19sb2FkX2hhbmRsZXIoc3RydWN0IG1oaV9jb250
cm9sbGVyDQo+ID4+ICptaGlfY250cmwpDQo+ID4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm47
DQo+ID4+IMKgwqDCoMKgwqAgfQ0KPiA+PiAtwqDCoMKgIGlmIChtaGlfY250cmwtPmVlID09IE1I
SV9FRV9FREwpDQo+ID4+ICvCoMKgwqAgaWYgKG1oaV9jbnRybC0+ZWUgPT0gTUhJX0VFX0VETCkg
ew0KPiA+PiArwqDCoMKgwqDCoMKgwqAgbWhpX3JlYWR5X3N0YXRlX3RyYW5zaXRpb24obWhpX2Nu
dHJsKTsNCj4gPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybjsNCj4gPj4gK8KgwqDCoCB9DQo+
ID4+IMKgwqDCoMKgwqAgd3JpdGVfbG9ja19pcnEoJm1oaV9jbnRybC0+cG1fbG9jayk7DQo+ID4+
IMKgwqDCoMKgwqAgbWhpX2NudHJsLT5kZXZfc3RhdGUgPSBNSElfU1RBVEVfUkVTRVQ7IGRpZmYg
LS1naXQNCj4gPj4gYS9kcml2ZXJzL2J1cy9taGkvY29yZS9pbml0LmMgYi9kcml2ZXJzL2J1cy9t
aGkvY29yZS9pbml0LmMgaW5kZXgNCj4gPj4gYWM0YWE1Yy4uOWMyYzJmMyAxMDA2NDQNCj4gPj4g
LS0tIGEvZHJpdmVycy9idXMvbWhpL2NvcmUvaW5pdC5jDQo+ID4+ICsrKyBiL2RyaXZlcnMvYnVz
L21oaS9jb3JlL2luaXQuYw0KPiA+PiBAQCAtMjYsNiArMjYsNyBAQCBjb25zdCBjaGFyICogY29u
c3QgbWhpX2VlX3N0cltNSElfRUVfTUFYXSA9IHsNCj4gPj4gwqDCoMKgwqDCoCBbTUhJX0VFX1dG
V10gPSAiV0ZXIiwNCj4gPj4gwqDCoMKgwqDCoCBbTUhJX0VFX1BUSFJVXSA9ICJQQVNTIFRIUlUi
LA0KPiA+PiDCoMKgwqDCoMKgIFtNSElfRUVfRURMXSA9ICJFREwiLA0KPiA+PiArwqDCoMKgIFtN
SElfRUVfRlBdID0gIkZQIiwNCj4gPj4gwqDCoMKgwqDCoCBbTUhJX0VFX0RJU0FCTEVfVFJBTlNJ
VElPTl0gPSAiRElTQUJMRSIsDQo+ID4+IMKgwqDCoMKgwqAgW01ISV9FRV9OT1RfU1VQUE9SVEVE
XSA9ICJOT1QgU1VQUE9SVEVEIiwNCj4gPj4gwqAgfTsNCj4gPj4gQEAgLTM1LDYgKzM2LDcgQEAg
Y29uc3QgY2hhciAqIGNvbnN0DQo+ID4+IGRldl9zdGF0ZV90cmFuX3N0cltERVZfU1RfVFJBTlNJ
VElPTl9NQVhdID0gew0KPiA+PiDCoMKgwqDCoMKgIFtERVZfU1RfVFJBTlNJVElPTl9SRUFEWV0g
PSAiUkVBRFkiLA0KPiA+PiDCoMKgwqDCoMKgIFtERVZfU1RfVFJBTlNJVElPTl9TQkxdID0gIlNC
TCIsDQo+ID4+IMKgwqDCoMKgwqAgW0RFVl9TVF9UUkFOU0lUSU9OX01JU1NJT05fTU9ERV0gPSAi
TUlTU0lPTl9NT0RFIiwNCj4gPj4gK8KgwqDCoCBbREVWX1NUX1RSQU5TSVRJT05fRlBdID0gIkZQ
IiwNCj4gPj4gwqDCoMKgwqDCoCBbREVWX1NUX1RSQU5TSVRJT05fU1lTX0VSUl0gPSAiU1lTX0VS
UiIsDQo+ID4+IMKgwqDCoMKgwqAgW0RFVl9TVF9UUkFOU0lUSU9OX0RJU0FCTEVdID0gIkRJU0FC
TEUiLA0KPiA+PiDCoCB9Ow0KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9idXMvbWhpL2NvcmUv
aW50ZXJuYWwuaA0KPiA+PiBiL2RyaXZlcnMvYnVzL21oaS9jb3JlL2ludGVybmFsLmggaW5kZXgg
NGFiZjBjZi4uNmFlODk3YSAxMDA2NDQNCj4gPj4gLS0tIGEvZHJpdmVycy9idXMvbWhpL2NvcmUv
aW50ZXJuYWwuaA0KPiA+PiArKysgYi9kcml2ZXJzL2J1cy9taGkvY29yZS9pbnRlcm5hbC5oDQo+
ID4+IEBAIC0zODYsNiArMzg2LDcgQEAgZW51bSBkZXZfc3RfdHJhbnNpdGlvbiB7DQo+ID4+IMKg
wqDCoMKgwqAgREVWX1NUX1RSQU5TSVRJT05fUkVBRFksDQo+ID4+IMKgwqDCoMKgwqAgREVWX1NU
X1RSQU5TSVRJT05fU0JMLA0KPiA+PiDCoMKgwqDCoMKgIERFVl9TVF9UUkFOU0lUSU9OX01JU1NJ
T05fTU9ERSwNCj4gPj4gK8KgwqDCoCBERVZfU1RfVFJBTlNJVElPTl9GUCwNCj4gPj4gwqDCoMKg
wqDCoCBERVZfU1RfVFJBTlNJVElPTl9TWVNfRVJSLA0KPiA+PiDCoMKgwqDCoMKgIERFVl9TVF9U
UkFOU0lUSU9OX0RJU0FCTEUsDQo+ID4+IMKgwqDCoMKgwqAgREVWX1NUX1RSQU5TSVRJT05fTUFY
LA0KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9idXMvbWhpL2NvcmUvbWFpbi5jDQo+ID4+IGIv
ZHJpdmVycy9idXMvbWhpL2NvcmUvbWFpbi5jIGluZGV4IDM5NTA3OTIuLmUzMDdiNTggMTAwNjQ0
DQo+ID4+IC0tLSBhL2RyaXZlcnMvYnVzL21oaS9jb3JlL21haW4uYw0KPiA+PiArKysgYi9kcml2
ZXJzL2J1cy9taGkvY29yZS9tYWluLmMNCj4gPj4gQEAgLTc4Miw2ICs3ODIsOSBAQCBpbnQgbWhp
X3Byb2Nlc3NfY3RybF9ldl9yaW5nKHN0cnVjdA0KPiA+PiBtaGlfY29udHJvbGxlciAqbWhpX2Nu
dHJsLA0KPiA+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjYXNlIE1ISV9FRV9TQkw6DQo+
ID4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3QgPSBERVZfU1RfVFJBTlNJ
VElPTl9TQkw7DQo+ID4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7
DQo+ID4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNhc2UgTUhJX0VFX0ZQOg0KPiA+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0ID0gREVWX1NUX1RSQU5TSVRJT05fRlA7DQo+
ID4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+ID4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGNhc2UgTUhJX0VFX1dGVzoNCj4gPj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgY2FzZSBNSElfRUVfQU1TUzoNCj4gPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzdCA9IERFVl9TVF9UUkFOU0lUSU9OX01JU1NJT05fTU9ERTsgZGlmZg0K
PiAtLWdpdA0KPiA+PiBhL2RyaXZlcnMvYnVzL21oaS9jb3JlL3BtLmMgYi9kcml2ZXJzL2J1cy9t
aGkvY29yZS9wbS5jIGluZGV4DQo+ID4+IDNkZTdiMTYuLjNjOTVhNWQgMTAwNjQ0DQo+ID4+IC0t
LSBhL2RyaXZlcnMvYnVzL21oaS9jb3JlL3BtLmMNCj4gPj4gKysrIGIvZHJpdmVycy9idXMvbWhp
L2NvcmUvcG0uYw0KPiA+PiBAQCAtNTYzLDcgKzU2MywxNSBAQCBzdGF0aWMgdm9pZCBtaGlfcG1f
ZGlzYWJsZV90cmFuc2l0aW9uKHN0cnVjdA0KPiA+PiBtaGlfY29udHJvbGxlciAqbWhpX2NudHJs
LA0KPiA+PiDCoMKgwqDCoMKgIH0NCj4gPj4gwqDCoMKgwqDCoCBpZiAoY3VyX3N0YXRlID09IE1I
SV9QTV9TWVNfRVJSX1BST0NFU1MpIHsNCj4gPj4gLcKgwqDCoMKgwqDCoMKgIG1oaV9yZWFkeV9z
dGF0ZV90cmFuc2l0aW9uKG1oaV9jbnRybCk7DQo+ID4+ICvCoMKgwqDCoMKgwqDCoCBpZiAobWhp
X2dldF9leGVjX2VudihtaGlfY250cmwpID09IE1ISV9FRV9FREwNCj4gPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgJiYgbWhpX2dldF9taGlfc3RhdGUobWhpX2NudHJsKSA9PSBNSElfU1RBVEVf
UkVTRVQpIHsNCj4gPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgd3JpdGVfbG9ja19pcnEoJm1o
aV9jbnRybC0+cG1fbG9jayk7DQo+ID4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGN1cl9zdGF0
ZSA9IG1oaV90cnlzZXRfcG1fc3RhdGUobWhpX2NudHJsLA0KPiBNSElfUE1fUE9SKTsNCj4gPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgd3JpdGVfdW5sb2NrX2lycSgmbWhpX2NudHJsLT5wbV9s
b2NrKTsNCj4gPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWhpX3F1ZXVlX3N0YXRlX3RyYW5z
aXRpb24obWhpX2NudHJsLA0KPiA+PiBERVZfU1RfVFJBTlNJVElPTl9QQkwpOw0KPiA+PiArwqDC
oMKgwqDCoMKgwqAgfSBlbHNlIHsNCj4gPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWhpX3Jl
YWR5X3N0YXRlX3RyYW5zaXRpb24obWhpX2NudHJsKTsNCj4gPj4gK8KgwqDCoMKgwqDCoMKgIH0N
Cj4gPj4gwqDCoMKgwqDCoCB9IGVsc2Ugew0KPiA+PiDCoMKgwqDCoMKgwqDCoMKgwqAgLyogTW92
ZSB0byBkaXNhYmxlIHN0YXRlICovDQo+ID4+IMKgwqDCoMKgwqDCoMKgwqDCoCB3cml0ZV9sb2Nr
X2lycSgmbWhpX2NudHJsLT5wbV9sb2NrKTsNCj4gPj4gQEAgLTY1OCw2ICs2NjYsMTIgQEAgdm9p
ZCBtaGlfcG1fc3Rfd29ya2VyKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykNCj4gPj4gwqDCoMKg
wqDCoMKgwqDCoMKgIGNhc2UgREVWX1NUX1RSQU5TSVRJT05fTUlTU0lPTl9NT0RFOg0KPiA+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtaGlfcG1fbWlzc2lvbl9tb2RlX3RyYW5zaXRpb24o
bWhpX2NudHJsKTsNCj4gPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+ID4+
ICvCoMKgwqDCoMKgwqDCoCBjYXNlIERFVl9TVF9UUkFOU0lUSU9OX0ZQOg0KPiA+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB3cml0ZV9sb2NrX2lycSgmbWhpX2NudHJsLT5wbV9sb2NrKTsNCj4g
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWhpX2NudHJsLT5lZSA9IE1ISV9FRV9GUDsNCj4g
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgd3JpdGVfdW5sb2NrX2lycSgmbWhpX2NudHJsLT5w
bV9sb2NrKTsNCj4gPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWhpX2NyZWF0ZV9kZXZpY2Vz
KG1oaV9jbnRybCk7DQo+ID4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOw0KPiA+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgY2FzZSBERVZfU1RfVFJBTlNJVElPTl9SRUFEWToNCj4gPj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWhpX3JlYWR5X3N0YXRlX3RyYW5zaXRpb24obWhpX2Nu
dHJsKTsNCj4gPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+ID4+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL2xpbnV4L21oaS5oIGIvaW5jbHVkZS9saW51eC9taGkuaCBpbmRleA0K
PiA+PiA2ZTExMjJjLi40NjIwYWY4IDEwMDY0NA0KPiA+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L21o
aS5oDQo+ID4+ICsrKyBiL2luY2x1ZGUvbGludXgvbWhpLmgNCj4gPj4gQEAgLTEyMCw2ICsxMjAs
NyBAQCBzdHJ1Y3QgbWhpX2xpbmtfaW5mbyB7DQo+ID4+IMKgwqAgKiBATUhJX0VFX1dGVzogV0xB
TiBmaXJtd2FyZSBtb2RlDQo+ID4+IMKgwqAgKiBATUhJX0VFX1BUSFJVOiBQYXNzdGhyb3VnaA0K
PiA+PiDCoMKgICogQE1ISV9FRV9FREw6IEVtYmVkZGVkIGRvd25sb2FkZXINCj4gPj4gKyAqIEBN
SElfRUVfRlAsIEZsYXNoIFByb2dyYW1tZXIgRW52aXJvbm1lbnQNCj4gPj4gwqDCoCAqLw0KPiA+
PiDCoCBlbnVtIG1oaV9lZV90eXBlIHsNCj4gPj4gwqDCoMKgwqDCoCBNSElfRUVfUEJMLA0KPiA+
PiBAQCAtMTI5LDcgKzEzMCw4IEBAIGVudW0gbWhpX2VlX3R5cGUgew0KPiA+PiDCoMKgwqDCoMKg
IE1ISV9FRV9XRlcsDQo+ID4+IMKgwqDCoMKgwqAgTUhJX0VFX1BUSFJVLA0KPiA+PiDCoMKgwqDC
oMKgIE1ISV9FRV9FREwsDQo+ID4+IC3CoMKgwqAgTUhJX0VFX01BWF9TVVBQT1JURUQgPSBNSElf
RUVfRURMLA0KPiA+PiArwqDCoMKgIE1ISV9FRV9GUCwNCj4gPj4gK8KgwqDCoCBNSElfRUVfTUFY
X1NVUFBPUlRFRCA9IE1ISV9FRV9GUCwNCj4gPj4gwqDCoMKgwqDCoCBNSElfRUVfRElTQUJMRV9U
UkFOU0lUSU9OLCAvKiBsb2NhbCBFRSwgbm90IHJlbGF0ZWQgdG8gbWhpIHNwZWMNCj4gPj4gKi8N
Cj4gPj4gwqDCoMKgwqDCoCBNSElfRUVfTk9UX1NVUFBPUlRFRCwNCj4gPj4gwqDCoMKgwqDCoCBN
SElfRUVfTUFYLA0KPiA+Pg0KPiA+DQo+ID4gVGhpcyBnZXRzIGEgTkFDSyBmcm9tIG1lLsKgIEkg
ZG9uJ3Qgc2VlIHRoZSBGUF9FRSB0aGF0IHRoaXMgcGF0Y2gNCj4gPiBpbnRyb2R1Y2VzIGRlZmlu
ZWQgaW4gdGhlIHNwZWMuwqAgV2hlcmUgZGlkIGl0IGNvbWUgZnJvbT8NCj4gPg0KPiBUaGVyZSBp
cyBpbmRlZWQgYSBGUCBFRSwgQkhJIHNwZWMgd2lsbCBiZSB1cGRhdGVkIHdpdGggdGhpcyBFRSBu
ZXh0IG1vbnRoLg0KPiANCj4gQmFzaWNhbGx5LCBvbmNlIGRldmljZSBnb2VzIHRvIEVETCwgZmxh
c2ggcHJvZ3JhbW1lciBpbWFnZSBpcyBkb3dubG9hZGVkIHVzaW5nDQo+IEJISSBwcm90b2NvbCAo
c2FtZSBhcyB3ZSBkb3dubG9hZCBTQkwgaW1hZ2UgdXNpbmcgQkhJIGZyb20gUEJMIGluIGN1cnJl
bnQgdXNlDQo+IGNhc2UpLiBPbmNlIGl0IGlzIGRvd25sb2FkZWQgaW50dmVjIHNlbmRzIEVFIGNo
YW5nZSBldmVudCBmb3IgRlAuIEFsc28gZXZlbnQgaXMNCj4gZ2VuZXJhdGVkIGZvciB0aGUgc2Ft
ZSB3aGljaCBpcyB1c2VkIHRvIGNyZWF0ZSBFREwgY2hhbm5lbHMgKDM0LCAzNSkgd2hpY2ggaXMN
Cj4gdXNlZCBieSBmbGFzaCBwcm9ncmFtbWVyIHRvIGZsYXNoIGltYWdlIGZvciBBTVNTLg0KPiAN
Cj4gID4+IDIuIHNlbmQgRURMIGNtZCB2aWEgRElBRyBjaGFuLCB0aGVuIG1vZGVtIGVudGVyIEVF
IEVETA0KPiAjMiBuZWVkcyB0byBiZSBkb25lIGluIGNsZWFuZXIgd2F5LiBGcm9tIEFNU1Mgd2hl
biBkaWFnIGNtZCBpcyBzZW50IHRvIHN3aXRjaA0KPiB0byBFREwsIGRldmljZSB3b3VsZCBzZW5k
IFNZU19FUlIgd2hpY2ggd2UgY2FuIHVzZSB0byBkbyBhIGNhbGwgYmFjayB0byBtaGkNCj4gY29u
dHJvbGxlciB0byBwZXJmb3JtIHBvd2VyIGRvd24gYW5kIHBvd2VyIHVwLiBJbnN0ZWFkIG9mIG1v
dmluZyBwbSBzdGF0ZSB0bw0KPiBQT1IgZnJvbSBkaXNhYmxlIHRyYW5zaXRpb24gOi0NCltjYXJs
Lnlpbl0gd2h5IEkgbmVlZCBtb3ZlIHBtX3N0YXRlIHRvIFBPUiwgaXQgaXMgYmVjYXVzZSBpZiBw
bV9zdGF0ZSBpcyBTWVNfRVJSLA0KCW1oaV9md19sb2FkX2hhbmRsZXIoKSB3aWxsIGJyZWFrLCBh
bmQgd2lsbCBub3QgZG93bmxvYWQgZWRsIGltYWdlIHRvIGRldmljZS4NCglXZSBjYW4gY2hhbmdl
IHBtLmMgYXMgbmV4dCwgYW5kIHJldmVydCB0aGUgY2hhbmdlIHRvIGJvb3QuYw0KICAgICBpZiAo
Y3VyX3N0YXRlID09IE1ISV9QTV9TWVNfRVJSX1BST0NFU1MpIHsNCgkJaWYgKG1oaV9nZXRfZXhl
Y19lbnYobWhpX2NudHJsKSA9PSBNSElfRUVfRURMDQogCQkJJiYgbWhpX2dldF9taGlfc3RhdGUo
bWhpX2NudHJsKSA9PSBNSElfU1RBVEVfUkVTRVQpIHsNCiAgICAgICAgICAgICAgd3JpdGVfbG9j
a19pcnEoJm1oaV9jbnRybC0+cG1fbG9jayk7DQogICAgICAgICAgICAgIG1oaV9jbnRybC0+ZWUg
PSBNSElfRUVfRURMOw0KICAgICAgICAgICAgICB3cml0ZV91bmxvY2tfaXJxKCZtaGlfY250cmwt
PnBtX2xvY2spOw0KICAgICAgICAgICAgICBtaGlfZndfbG9hZF9oYW5kbGVyKG1oaV9jbnRybCk7
DQogICAgICAgICAgfQ0KICAgICAgICAgIG1oaV9yZWFkeV9zdGF0ZV90cmFuc2l0aW9uKG1oaV9j
bnRybCk7DQogICAgICB9DQo+IA0KPiBAQCAtNTYzLDcgKzU2MywxNSBAQCBzdGF0aWMgdm9pZCBt
aGlfcG1fZGlzYWJsZV90cmFuc2l0aW9uKHN0cnVjdCAgPj4NCj4gbWhpX2NvbnRyb2xsZXIgKm1o
aV9jbnRybCwNCj4gID4+ICAgICAgIH0NCj4gID4+ICAgICAgIGlmIChjdXJfc3RhdGUgPT0gTUhJ
X1BNX1NZU19FUlJfUFJPQ0VTUykgew0KPiAgPj4gLSAgICAgICAgbWhpX3JlYWR5X3N0YXRlX3Ry
YW5zaXRpb24obWhpX2NudHJsKTsNCj4gID4+ICsgICAgICAgIGlmIChtaGlfZ2V0X2V4ZWNfZW52
KG1oaV9jbnRybCkgPT0gTUhJX0VFX0VETA0KPiAgPj4gKyAgICAgICAgICAgICYmIG1oaV9nZXRf
bWhpX3N0YXRlKG1oaV9jbnRybCkgPT0gTUhJX1NUQVRFX1JFU0VUKSB7DQo+ICA+PiArICAgICAg
ICAgICAgd3JpdGVfbG9ja19pcnEoJm1oaV9jbnRybC0+cG1fbG9jayk7DQo+ICA+PiArICAgICAg
ICAgICAgY3VyX3N0YXRlID0gbWhpX3RyeXNldF9wbV9zdGF0ZShtaGlfY250cmwsIE1ISV9QTV9Q
T1IpOw0KPiAgPj4gKyAgICAgICAgICAgIHdyaXRlX3VubG9ja19pcnEoJm1oaV9jbnRybC0+cG1f
bG9jayk7DQo+ICA+PiArICAgICAgICAgICAgbWhpX3F1ZXVlX3N0YXRlX3RyYW5zaXRpb24obWhp
X2NudHJsLA0KPiAgPj4gREVWX1NUX1RSQU5TSVRJT05fUEJMKTsNCj4gID4+ICsgICAgICAgIH0g
ZWxzZSB7DQo+ICA+PiArICAgICAgICAgICAgbWhpX3JlYWR5X3N0YXRlX3RyYW5zaXRpb24obWhp
X2NudHJsKTsNCj4gID4+ICsgICAgICAgIH0NCj4gDQo+IFRoYW5rcywNCj4gSGVtYW50DQo+IA0K
PiAtLQ0KPiBUaGUgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gaXMgYSBtZW1iZXIg
b2YgdGhlIENvZGUgQXVyb3JhIEZvcnVtLCBhDQo+IExpbnV4IEZvdW5kYXRpb24gQ29sbGFib3Jh
dGl2ZSBQcm9qZWN0DQo=
