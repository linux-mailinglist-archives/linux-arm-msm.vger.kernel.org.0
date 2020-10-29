Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2486E29E6F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 10:10:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725769AbgJ2JKI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Oct 2020 05:10:08 -0400
Received: from mail-eopbgr1320051.outbound.protection.outlook.com ([40.107.132.51]:51327
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725613AbgJ2JKH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Oct 2020 05:10:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ria6Du3dFtJHQ407IVzZq7BNrGeoBsCMImhsD8r2pvCe7UOIVnReiBKqGSXB8M3GQTypk0PN6yIhlem2FOaasYQEa0qzUUrOADbNkLqeAAFjK/rw3hiOXPMEqYDNKJp9tOryfPMMzeq+7BKi7TyCR86sLoQDF31kxR69DTfE1iqVxEk9ffP2wxpbUAoSx7vz/sxYwMAs2UHOVPdzRj9FhD8IhqqYNO+L220Hm24RUGRBGcxvAKjIdukke8RlMV0FJdt4A0sloI5ooRF6dUT6ow9BLTuwG8ENPe+77+z7tWrTNw0YChFQ7pSddTeBf4+fwEaA/eYWm5Ul3W8RNXQNVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XawSvbYUaLs3e6RceEJKkQuf5qRDVDRrMoYHEbdxHc=;
 b=Ti3r50QMER/4rYBuJM1ivgcShIkFKE4CpdfV5Bez9El1NQjPcRDqi6e0ua7PmGKnAZ4ubN4DAdlQNn4cyU4UoUtBPG45H6243Qq0N6NzWlDKQbzjwIeqnp2rcf2ggAMWVP3HqOjL0XO+FXvdXz2dsu055MhwSe9YdPCgzNhRLKugkk+ppMLfsagrgbE6SW3jbzglq5K4RJ94gsg/v5MHqz6O0HnfgeOe9ltjjmB/Hbs42xIHBXIsMXrk1MEARPaVwPU5Hs1yKoSGzOi7yhxd0kQcCkV4CtUOjnKX4VrxxWbzUkATfke1JTE984t7Z+pBxjQTkzn8B3PtcpYCzJ2OTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quectel.com; dmarc=pass action=none header.from=quectel.com;
 dkim=pass header.d=quectel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quectel.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XawSvbYUaLs3e6RceEJKkQuf5qRDVDRrMoYHEbdxHc=;
 b=GVfxiiIGU/kh2z2EXee+O66Gm0iFBjbXqD8fdYgKvMupbBr7EsF0K71HKOICt2rsLMr2ttvhCiaeSxky7qxY2z3xUBU5RM6pZ+D5DkSpcoJYk/68k8SddZqwM8L22WUCP+KwQ1vBcsRhJ4++Bv+QJ0nshfxXLC7Zq40AjsyrtYE=
Received: from HK2PR06MB3507.apcprd06.prod.outlook.com (2603:1096:202:3e::14)
 by HK2PR06MB3300.apcprd06.prod.outlook.com (2603:1096:202:34::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 29 Oct
 2020 09:09:59 +0000
Received: from HK2PR06MB3507.apcprd06.prod.outlook.com
 ([fe80::94f:c55a:f9c8:22f4]) by HK2PR06MB3507.apcprd06.prod.outlook.com
 ([fe80::94f:c55a:f9c8:22f4%5]) with mapi id 15.20.3477.028; Thu, 29 Oct 2020
 09:09:59 +0000
From:   =?utf-8?B?Q2FybCBZaW4o5q635byg5oiQKQ==?= <carl.yin@quectel.com>
To:     "bbhatt@codeaurora.org" <bbhatt@codeaurora.org>
CC:     Hemant Kumar <hemantk@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Naveen Kumar" <naveen.kumar@quectel.com>,
        "hemantk=codeaurora.org@codeaurora.org" 
        <hemantk=codeaurora.org@codeaurora.org>
Subject: RE: [PATCH] bus: mhi: core: Add support MHI EE FP for download
 firmware
Thread-Topic: [PATCH] bus: mhi: core: Add support MHI EE FP for download
 firmware
Thread-Index: Adatzo3ynGeZ0mjhRw+PX3SykZWXXA==
Date:   Thu, 29 Oct 2020 09:09:59 +0000
Message-ID: <HK2PR06MB3507EFC8A62B7F6ACA2BCB9486140@HK2PR06MB3507.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=quectel.com;
x-originating-ip: [203.93.254.85]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aff0076a-57f4-4748-0fe5-08d87bea6998
x-ms-traffictypediagnostic: HK2PR06MB3300:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK2PR06MB3300510E48804DA8DFD2671886140@HK2PR06MB3300.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yO3To35Cc0jgVG5lqKnpBuaX2DeJi5v3tE8IQZMLVi/35LM86Agrkp7uFMlvXxIWk1clVQRvdZ45anvfm0iCCTVEydecCvkiJhvuCB5x7URbTx0ntEvL/fyiWi1ktTIZzGMEOG3SvkAJs/+H74UFNnqivjM4iyLoV2iShitWLqLjN23ohBRLsudGXrEgp8z5Jty0kusjjTmNO5i2cUyL6iufmYV+YXcT0elqTeaSWJazZ4tW8CIo0I5I3MmM80fIwio/L9XrklGA5tfacrDsxyCOl2yeaEXVVh2UxgHiEBdfoTY4uP31rWKM0duAVsDj/R8K5lvnTkHzHDthwbxrmw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK2PR06MB3507.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(366004)(376002)(39860400002)(136003)(54906003)(26005)(8936002)(316002)(86362001)(85182001)(64756008)(478600001)(2906002)(8676002)(5660300002)(83380400001)(76116006)(53546011)(66946007)(66476007)(66446008)(66556008)(6506007)(30864003)(9686003)(55016002)(186003)(52536014)(33656002)(71200400001)(6916009)(7696005)(4001150100001)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: Fv9jryQKqe2KK7AC8K0bf/2LmYSz2fV/K9iC096iDMVME4qlKUhb9V0UczC4UhKvhe2pcbLSU1XTevmv8BD5sm7AFzAwguDEtRz+33fBKi8c7EcKt/DgeBZ4fvrzrgvivDlNVE/vHg6IuYsEwJ+jezioO7jFHitoa+s3x9cjeAGTLvN2+qyxKUDdb7uVgOwJX8RgMiUWUXnRcmlUyaiwsg7pZagekkw8BWfk7lKD3d2TFemz2vw7liCj8nuIAqOrJCvRuxEvmtzfLwBQnEldQOegMhIZ0lGQygcCZGjk1J+ddlXVm3H5ua873bc+2BlrhOBwgSvMpa6cmSpiCCRBU5+ngKM/hAhB76p83OF4+2zeBqIAa232A1SMPI0oYabk1nWglKJpMlt7eQvQ5+2gWpW3s/1tEpC0U0QzgeAx/hN4yXNngOIJmRBwoAf9E7r87R9E1HLFvcAH5sWc2PrEOaBRYdej1JrMVjvjdFticFzVqPit7pwj5OoJ8zGfmrvl+bBS9NaIpppmns7aumcUdjXewrOdMDCkgGz/QmnXpO4jzPblkvrZQm0mmCfmSLjFJ+Tq69zANw9INFYun2ylZ5t75r1ambtHKXv2N4OB6KBacFeJD6/fUtxlaM5mIhqMnTU3/zs6NFj9fmPHsFOhUA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quectel.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3507.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aff0076a-57f4-4748-0fe5-08d87bea6998
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2020 09:09:59.5912
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7730d043-e129-480c-b1ba-e5b6a9f476aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zj0oPksFYkqVsOkf/oVXLN9ZMnZxABqQah+pLMtwIPp5p3mKk4Xksis931AU6MzJJC7O+pUlp0ngApMHwbzBOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR06MB3300
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SGkgYmJoYXR0Og0KDQpPbiBPY3RvYmVyIDI5LCAyMDIwIDU6NDEgQU0sIGJiaGF0dCB3cm90ZToN
Cj4gT24gMjAyMC0xMC0yNyAxODo1NywgQ2FybCBZaW4gd3JvdGU6DQo+ID4gSGkgYmJoYXR0Og0K
PiA+DQo+ID4gT24gV2VkbmVzZGF5LCBPY3RvYmVyIDI4LCAyMDIwIDk6MzQgQU0sIGJiaGF0dCB3
cm90ZToNCj4gPj4gSGkgQ2FybCwNCj4gPj4gT24gMjAyMC0xMC0yNyAxNjowMSwgSGVtYW50IEt1
bWFyIHdyb3RlOg0KPiA+PiA+IEhpIEplZmYsDQo+ID4+ID4NCj4gPj4gPiBPbiAxMC8yNy8yMCA4
OjExIEFNLCBKZWZmcmV5IEh1Z28gd3JvdGU6DQo+ID4+ID4+IE9uIDEwLzI3LzIwMjAgMzo0MyBB
TSwgY2FybC55aW5AcXVlY3RlbC5jb20gd3JvdGU6DQo+ID4+ID4+PiBGcm9tOiAiY2FybC55aW4i
IDxjYXJsLnlpbkBxdWVjdGVsLmNvbT4NCj4gPj4gPj4+DQo+ID4+ID4+PiBNSEkgd3dhbiBtb2Rl
bXMgc3VwcG9ydCBkb3dubG9hZCBmaXJtd2FyZSB0byBuYW5kIG9yIGVtbWMgYnkNCj4gPj4gPj4+
IGZpcmVob3NlIHByb3RvY29sLCBwcm9jZXNzIGFzIG5leHQ6DQo+ID4+ID4+PiAxLiB3d2FuIG1v
ZGVtIG5vcm1hbCBib290dXAgYW5kIGVudGVyIEVFIEFNU1MsIGNyZWF0ZSBtaGkgRElBRw0KPiA+
PiA+Pj4gY2hhbiBkZXZpY2UgMi4gc2VuZCBFREwgY21kIHZpYSBESUFHIGNoYW4sIHRoZW4gbW9k
ZW0gZW50ZXIgRUUgRURMIDMuDQo+ID4+ID4+PiBib290LmMgZG93bmxvYWQgJ2ZpcmVob3NlL3By
b2dfZmlyZWhvc2Vfc2R4NTUubWJuJyB2aWEgQkhJDQo+ID4+ID4+PiBpbnRlcmZhY2UgNC4gbW9k
ZW0gZW50ZXIgRUUgRlAsIGFuZCBjcmVhdGUgbWhpIEVETCBjaGFuIGRldmljZSA1Lg0KPiA+PiA+
Pj4gdXNlciBzcGFjZSB0b29sIGRvd25sb2FkIEZXIHRvIG1vZGVtIHZpYSBFREwgY2hhbiBieSBm
aXJlaG9zZQ0KPiA+PiA+Pj4gcHJvdG9jb2wNCj4gPj4gPj4+DQo+ID4+ID4+PiBTaWduZWQtb2Zm
LWJ5OiBjYXJsLnlpbiA8Y2FybC55aW5AcXVlY3RlbC5jb20+DQo+ID4+ID4+PiAtLS0NCj4gPj4g
Pj4+IMKgIGRyaXZlcnMvYnVzL21oaS9jb3JlL2Jvb3QuY8KgwqDCoMKgIHzCoCA0ICsrKy0NCj4g
Pj4gPj4+IMKgIGRyaXZlcnMvYnVzL21oaS9jb3JlL2luaXQuY8KgwqDCoMKgIHzCoCAyICsrDQo+
ID4+ID4+PiDCoCBkcml2ZXJzL2J1cy9taGkvY29yZS9pbnRlcm5hbC5oIHzCoCAxICsNCj4gPj4g
Pj4+IMKgIGRyaXZlcnMvYnVzL21oaS9jb3JlL21haW4uY8KgwqDCoMKgIHzCoCAzICsrKw0KPiA+
PiA+Pj4gwqAgZHJpdmVycy9idXMvbWhpL2NvcmUvcG0uY8KgwqDCoMKgwqDCoCB8IDE2ICsrKysr
KysrKysrKysrKy0NCj4gPj4gPj4+IMKgIGluY2x1ZGUvbGludXgvbWhpLmjCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfMKgIDQgKysrLQ0KPiA+PiA+Pj4gwqAgNiBmaWxlcyBjaGFuZ2VkLCAyNyBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+PiA+Pj4NCj4gPj4gPj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2J1cy9taGkvY29yZS9ib290LmMNCj4gPj4gPj4+IGIvZHJpdmVycy9idXMv
bWhpL2NvcmUvYm9vdC5jIGluZGV4IDI0NDIyZjUuLmFiMzlhZDYgMTAwNjQ0DQo+ID4+ID4+PiAt
LS0gYS9kcml2ZXJzL2J1cy9taGkvY29yZS9ib290LmMNCj4gPj4gPj4+ICsrKyBiL2RyaXZlcnMv
YnVzL21oaS9jb3JlL2Jvb3QuYw0KPiA+PiA+Pj4gQEAgLTQ2MCw4ICs0NjAsMTAgQEAgdm9pZCBt
aGlfZndfbG9hZF9oYW5kbGVyKHN0cnVjdA0KPiA+PiA+Pj4gbWhpX2NvbnRyb2xsZXINCj4gPj4g
Pj4+ICptaGlfY250cmwpDQo+ID4+ID4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuOw0KPiA+
PiA+Pj4gwqDCoMKgwqDCoCB9DQo+ID4+ID4+PiAtwqDCoMKgIGlmIChtaGlfY250cmwtPmVlID09
IE1ISV9FRV9FREwpDQo+ID4+ID4+PiArwqDCoMKgIGlmIChtaGlfY250cmwtPmVlID09IE1ISV9F
RV9FREwpIHsNCj4gPj4gPj4+ICvCoMKgwqDCoMKgwqDCoCBtaGlfcmVhZHlfc3RhdGVfdHJhbnNp
dGlvbihtaGlfY250cmwpOw0KPiA+PiA+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybjsNCj4g
Pj4gPj4+ICvCoMKgwqAgfQ0KPiA+PiA+Pj4gwqDCoMKgwqDCoCB3cml0ZV9sb2NrX2lycSgmbWhp
X2NudHJsLT5wbV9sb2NrKTsNCj4gPj4gPj4+IMKgwqDCoMKgwqAgbWhpX2NudHJsLT5kZXZfc3Rh
dGUgPSBNSElfU1RBVEVfUkVTRVQ7IGRpZmYgLS1naXQNCj4gPj4gPj4+IGEvZHJpdmVycy9idXMv
bWhpL2NvcmUvaW5pdC5jIGIvZHJpdmVycy9idXMvbWhpL2NvcmUvaW5pdC5jIGluZGV4DQo+ID4+
ID4+PiBhYzRhYTVjLi45YzJjMmYzIDEwMDY0NA0KPiA+PiA+Pj4gLS0tIGEvZHJpdmVycy9idXMv
bWhpL2NvcmUvaW5pdC5jDQo+ID4+ID4+PiArKysgYi9kcml2ZXJzL2J1cy9taGkvY29yZS9pbml0
LmMNCj4gPj4gPj4+IEBAIC0yNiw2ICsyNiw3IEBAIGNvbnN0IGNoYXIgKiBjb25zdCBtaGlfZWVf
c3RyW01ISV9FRV9NQVhdID0gew0KPiA+PiA+Pj4gwqDCoMKgwqDCoCBbTUhJX0VFX1dGV10gPSAi
V0ZXIiwNCj4gPj4gPj4+IMKgwqDCoMKgwqAgW01ISV9FRV9QVEhSVV0gPSAiUEFTUyBUSFJVIiwN
Cj4gPj4gPj4+IMKgwqDCoMKgwqAgW01ISV9FRV9FRExdID0gIkVETCIsDQo+ID4+ID4+PiArwqDC
oMKgIFtNSElfRUVfRlBdID0gIkZQIiwNCj4gPj4gPj4+IMKgwqDCoMKgwqAgW01ISV9FRV9ESVNB
QkxFX1RSQU5TSVRJT05dID0gIkRJU0FCTEUiLA0KPiA+PiA+Pj4gwqDCoMKgwqDCoCBbTUhJX0VF
X05PVF9TVVBQT1JURURdID0gIk5PVCBTVVBQT1JURUQiLA0KPiA+PiA+Pj4gwqAgfTsNCj4gPj4g
Pj4+IEBAIC0zNSw2ICszNiw3IEBAIGNvbnN0IGNoYXIgKiBjb25zdA0KPiA+PiA+Pj4gZGV2X3N0
YXRlX3RyYW5fc3RyW0RFVl9TVF9UUkFOU0lUSU9OX01BWF0gPSB7DQo+ID4+ID4+PiDCoMKgwqDC
oMKgIFtERVZfU1RfVFJBTlNJVElPTl9SRUFEWV0gPSAiUkVBRFkiLA0KPiA+PiA+Pj4gwqDCoMKg
wqDCoCBbREVWX1NUX1RSQU5TSVRJT05fU0JMXSA9ICJTQkwiLA0KPiA+PiA+Pj4gwqDCoMKgwqDC
oCBbREVWX1NUX1RSQU5TSVRJT05fTUlTU0lPTl9NT0RFXSA9ICJNSVNTSU9OX01PREUiLA0KPiA+
PiA+Pj4gK8KgwqDCoCBbREVWX1NUX1RSQU5TSVRJT05fRlBdID0gIkZQIiwNCj4gPj4gTG9uZ2Vy
IGRlc2NyaXB0aW9uIGhlcmUgd291bGQgYmUgbmljZSAoRkxBU0ggUFJPR1JBTU1FUikuDQo+ID4g
W2NhcmwueWluXSB5ZXMsIGZvciBTRFgyNCBhbmQgU0RYNTUgY2hpcCwgJ0ZJUkVIT1NFIFBST0dS
QU1NRVInIGlzDQo+ID4gbW9yZSBiZXR0ZXIuDQo+IEkgYWdyZWUgd2l0aCBKZWZmLCBzaG91bGQg
YmUgZ2VuZXJpYy4NCj4gPj4NCj4gPj4gPj4+IMKgwqDCoMKgwqAgW0RFVl9TVF9UUkFOU0lUSU9O
X1NZU19FUlJdID0gIlNZU19FUlIiLA0KPiA+PiA+Pj4gwqDCoMKgwqDCoCBbREVWX1NUX1RSQU5T
SVRJT05fRElTQUJMRV0gPSAiRElTQUJMRSIsDQo+ID4+ID4+PiDCoCB9Ow0KPiA+PiA+Pj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvYnVzL21oaS9jb3JlL2ludGVybmFsLmgNCj4gPj4gPj4+IGIvZHJp
dmVycy9idXMvbWhpL2NvcmUvaW50ZXJuYWwuaCBpbmRleCA0YWJmMGNmLi42YWU4OTdhIDEwMDY0
NA0KPiA+PiA+Pj4gLS0tIGEvZHJpdmVycy9idXMvbWhpL2NvcmUvaW50ZXJuYWwuaA0KPiA+PiA+
Pj4gKysrIGIvZHJpdmVycy9idXMvbWhpL2NvcmUvaW50ZXJuYWwuaA0KPiA+PiA+Pj4gQEAgLTM4
Niw2ICszODYsNyBAQCBlbnVtIGRldl9zdF90cmFuc2l0aW9uIHsNCj4gPj4gPj4+IMKgwqDCoMKg
wqAgREVWX1NUX1RSQU5TSVRJT05fUkVBRFksDQo+ID4+ID4+PiDCoMKgwqDCoMKgIERFVl9TVF9U
UkFOU0lUSU9OX1NCTCwNCj4gPj4gPj4+IMKgwqDCoMKgwqAgREVWX1NUX1RSQU5TSVRJT05fTUlT
U0lPTl9NT0RFLA0KPiA+PiA+Pj4gK8KgwqDCoCBERVZfU1RfVFJBTlNJVElPTl9GUCwNCj4gPj4g
Pj4+IMKgwqDCoMKgwqAgREVWX1NUX1RSQU5TSVRJT05fU1lTX0VSUiwNCj4gPj4gPj4+IMKgwqDC
oMKgwqAgREVWX1NUX1RSQU5TSVRJT05fRElTQUJMRSwNCj4gPj4gPj4+IMKgwqDCoMKgwqAgREVW
X1NUX1RSQU5TSVRJT05fTUFYLA0KPiA+PiA+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYnVzL21o
aS9jb3JlL21haW4uYw0KPiA+PiA+Pj4gYi9kcml2ZXJzL2J1cy9taGkvY29yZS9tYWluLmMgaW5k
ZXggMzk1MDc5Mi4uZTMwN2I1OCAxMDA2NDQNCj4gPj4gPj4+IC0tLSBhL2RyaXZlcnMvYnVzL21o
aS9jb3JlL21haW4uYw0KPiA+PiA+Pj4gKysrIGIvZHJpdmVycy9idXMvbWhpL2NvcmUvbWFpbi5j
DQo+ID4+ID4+PiBAQCAtNzgyLDYgKzc4Miw5IEBAIGludCBtaGlfcHJvY2Vzc19jdHJsX2V2X3Jp
bmcoc3RydWN0DQo+ID4+ID4+PiBtaGlfY29udHJvbGxlciAqbWhpX2NudHJsLA0KPiA+PiA+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2FzZSBNSElfRUVfU0JMOg0KPiA+PiA+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdCA9IERFVl9TVF9UUkFOU0lUSU9OX1NC
TDsNCj4gPj4gPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+
ID4+ID4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjYXNlIE1ISV9FRV9GUDoNCj4gPj4gPj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3QgPSBERVZfU1RfVFJBTlNJVElPTl9G
UDsNCj4gPj4gPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+ID4+
ID4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjYXNlIE1ISV9FRV9XRlc6DQo+ID4+ID4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjYXNlIE1ISV9FRV9BTVNTOg0KPiA+PiA+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdCA9IERFVl9TVF9UUkFOU0lUSU9O
X01JU1NJT05fTU9ERTsNCj4gZGlmZg0KPiA+PiAtLWdpdA0KPiA+PiA+Pj4gYS9kcml2ZXJzL2J1
cy9taGkvY29yZS9wbS5jIGIvZHJpdmVycy9idXMvbWhpL2NvcmUvcG0uYyBpbmRleA0KPiA+PiA+
Pj4gM2RlN2IxNi4uM2M5NWE1ZCAxMDA2NDQNCj4gPj4gPj4+IC0tLSBhL2RyaXZlcnMvYnVzL21o
aS9jb3JlL3BtLmMNCj4gPj4gPj4+ICsrKyBiL2RyaXZlcnMvYnVzL21oaS9jb3JlL3BtLmMNCj4g
Pj4gPj4+IEBAIC01NjMsNyArNTYzLDE1IEBAIHN0YXRpYyB2b2lkIG1oaV9wbV9kaXNhYmxlX3Ry
YW5zaXRpb24oc3RydWN0DQo+ID4+ID4+PiBtaGlfY29udHJvbGxlciAqbWhpX2NudHJsLA0KPiA+
PiA+Pj4gwqDCoMKgwqDCoCB9DQo+ID4+ID4+PiDCoMKgwqDCoMKgIGlmIChjdXJfc3RhdGUgPT0g
TUhJX1BNX1NZU19FUlJfUFJPQ0VTUykgew0KPiA+PiA+Pj4gLcKgwqDCoMKgwqDCoMKgIG1oaV9y
ZWFkeV9zdGF0ZV90cmFuc2l0aW9uKG1oaV9jbnRybCk7DQo+ID4+ID4+PiArwqDCoMKgwqDCoMKg
wqAgaWYgKG1oaV9nZXRfZXhlY19lbnYobWhpX2NudHJsKSA9PSBNSElfRUVfRURMDQo+ID4+ID4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmJiBtaGlfZ2V0X21oaV9zdGF0ZShtaGlfY250cmwp
ID09DQo+IE1ISV9TVEFURV9SRVNFVCkNCj4gPj4gew0KPiA+PiA+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgd3JpdGVfbG9ja19pcnEoJm1oaV9jbnRybC0+cG1fbG9jayk7DQo+ID4+ID4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjdXJfc3RhdGUgPSBtaGlfdHJ5c2V0X3BtX3N0YXRlKG1o
aV9jbnRybCwNCj4gPj4gTUhJX1BNX1BPUik7DQo+ID4+ID4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB3cml0ZV91bmxvY2tfaXJxKCZtaGlfY250cmwtPnBtX2xvY2spOw0KPiA+PiA+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgbWhpX3F1ZXVlX3N0YXRlX3RyYW5zaXRpb24obWhpX2NudHJs
LA0KPiA+PiA+Pj4gREVWX1NUX1RSQU5TSVRJT05fUEJMKTsNCj4gPj4gPj4+ICvCoMKgwqDCoMKg
wqDCoCB9IGVsc2Ugew0KPiA+PiA+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWhpX3JlYWR5
X3N0YXRlX3RyYW5zaXRpb24obWhpX2NudHJsKTsNCj4gPj4gPj4+ICvCoMKgwqDCoMKgwqDCoCB9
DQo+ID4+ID4+PiDCoMKgwqDCoMKgIH0gZWxzZSB7DQo+ID4+ID4+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgLyogTW92ZSB0byBkaXNhYmxlIHN0YXRlICovDQo+ID4+ID4+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgd3JpdGVfbG9ja19pcnEoJm1oaV9jbnRybC0+cG1fbG9jayk7DQo+ID4+ID4+PiBAQCAtNjU4
LDYgKzY2NiwxMiBAQCB2b2lkIG1oaV9wbV9zdF93b3JrZXIoc3RydWN0IHdvcmtfc3RydWN0DQo+
ID4+ID4+PiAqd29yaykNCj4gPj4gPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBjYXNlIERFVl9TVF9U
UkFOU0lUSU9OX01JU1NJT05fTU9ERToNCj4gPj4gPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIG1oaV9wbV9taXNzaW9uX21vZGVfdHJhbnNpdGlvbihtaGlfY250cmwpOw0KPiA+PiA+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+ID4+ID4+PiArwqDCoMKgwqDCoMKg
wqAgY2FzZSBERVZfU1RfVFJBTlNJVElPTl9GUDoNCj4gPj4gPj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHdyaXRlX2xvY2tfaXJxKCZtaGlfY250cmwtPnBtX2xvY2spOw0KPiA+PiA+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgbWhpX2NudHJsLT5lZSA9IE1ISV9FRV9GUDsNCj4gPj4gPj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHdyaXRlX3VubG9ja19pcnEoJm1oaV9jbnRybC0+cG1f
bG9jayk7DQo+ID4+ID4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtaGlfY3JlYXRlX2Rldmlj
ZXMobWhpX2NudHJsKTsNCj4gPj4gPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOw0K
PiA+PiA+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNhc2UgREVWX1NUX1RSQU5TSVRJT05fUkVBRFk6
DQo+ID4+ID4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtaGlfcmVhZHlfc3RhdGVfdHJh
bnNpdGlvbihtaGlfY250cmwpOw0KPiA+PiA+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
YnJlYWs7DQo+ID4+ID4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9taGkuaCBiL2luY2x1
ZGUvbGludXgvbWhpLmggaW5kZXgNCj4gPj4gPj4+IDZlMTEyMmMuLjQ2MjBhZjggMTAwNjQ0DQo+
ID4+ID4+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L21oaS5oDQo+ID4+ID4+PiArKysgYi9pbmNsdWRl
L2xpbnV4L21oaS5oDQo+ID4+ID4+PiBAQCAtMTIwLDYgKzEyMCw3IEBAIHN0cnVjdCBtaGlfbGlu
a19pbmZvIHsNCj4gPj4gPj4+IMKgwqAgKiBATUhJX0VFX1dGVzogV0xBTiBmaXJtd2FyZSBtb2Rl
DQo+ID4+ID4+PiDCoMKgICogQE1ISV9FRV9QVEhSVTogUGFzc3Rocm91Z2gNCj4gPj4gPj4+IMKg
wqAgKiBATUhJX0VFX0VETDogRW1iZWRkZWQgZG93bmxvYWRlcg0KPiA+PiA+Pj4gKyAqIEBNSElf
RUVfRlAsIEZsYXNoIFByb2dyYW1tZXIgRW52aXJvbm1lbnQNCj4gPj4gPj4+IMKgwqAgKi8NCj4g
Pj4gPj4+IMKgIGVudW0gbWhpX2VlX3R5cGUgew0KPiA+PiA+Pj4gwqDCoMKgwqDCoCBNSElfRUVf
UEJMLA0KPiA+PiA+Pj4gQEAgLTEyOSw3ICsxMzAsOCBAQCBlbnVtIG1oaV9lZV90eXBlIHsNCj4g
Pj4gPj4+IMKgwqDCoMKgwqAgTUhJX0VFX1dGVywNCj4gPj4gPj4+IMKgwqDCoMKgwqAgTUhJX0VF
X1BUSFJVLA0KPiA+PiA+Pj4gwqDCoMKgwqDCoCBNSElfRUVfRURMLA0KPiA+PiA+Pj4gLcKgwqDC
oCBNSElfRUVfTUFYX1NVUFBPUlRFRCA9IE1ISV9FRV9FREwsDQo+ID4+ID4+PiArwqDCoMKgIE1I
SV9FRV9GUCwNCj4gPj4gPj4+ICvCoMKgwqAgTUhJX0VFX01BWF9TVVBQT1JURUQgPSBNSElfRUVf
RlAsDQo+ID4+ID4+PiDCoMKgwqDCoMKgIE1ISV9FRV9ESVNBQkxFX1RSQU5TSVRJT04sIC8qIGxv
Y2FsIEVFLCBub3QgcmVsYXRlZCB0byBtaGkNCj4gPj4gPj4+IHNwZWMgKi8NCj4gPj4gPj4+IMKg
wqDCoMKgwqAgTUhJX0VFX05PVF9TVVBQT1JURUQsDQo+ID4+ID4+PiDCoMKgwqDCoMKgIE1ISV9F
RV9NQVgsDQo+ID4+ID4+Pg0KPiA+PiA+Pg0KPiA+PiA+PiBUaGlzIGdldHMgYSBOQUNLIGZyb20g
bWUuwqAgSSBkb24ndCBzZWUgdGhlIEZQX0VFIHRoYXQgdGhpcyBwYXRjaA0KPiA+PiA+PiBpbnRy
b2R1Y2VzIGRlZmluZWQgaW4gdGhlIHNwZWMuwqAgV2hlcmUgZGlkIGl0IGNvbWUgZnJvbT8NCj4g
Pj4gPj4NCj4gPj4gPiBUaGVyZSBpcyBpbmRlZWQgYSBGUCBFRSwgQkhJIHNwZWMgd2lsbCBiZSB1
cGRhdGVkIHdpdGggdGhpcyBFRSBuZXh0DQo+ID4+ID4gbW9udGguDQo+ID4+ID4NCj4gPj4gPiBC
YXNpY2FsbHksIG9uY2UgZGV2aWNlIGdvZXMgdG8gRURMLCBmbGFzaCBwcm9ncmFtbWVyIGltYWdl
IGlzDQo+ID4+ID4gZG93bmxvYWRlZCB1c2luZyBCSEkgcHJvdG9jb2wgKHNhbWUgYXMgd2UgZG93
bmxvYWQgU0JMIGltYWdlIHVzaW5nDQo+ID4+ID4gQkhJIGZyb20gUEJMIGluIGN1cnJlbnQgdXNl
IGNhc2UpLiBPbmNlIGl0IGlzIGRvd25sb2FkZWQgaW50dmVjDQo+ID4+ID4gc2VuZHMgRUUgY2hh
bmdlIGV2ZW50IGZvciBGUC4gQWxzbyBldmVudCBpcyBnZW5lcmF0ZWQgZm9yIHRoZSBzYW1lDQo+
ID4+ID4gd2hpY2ggaXMgdXNlZCB0byBjcmVhdGUgRURMIGNoYW5uZWxzICgzNCwgMzUpIHdoaWNo
IGlzIHVzZWQgYnkNCj4gPj4gPiBmbGFzaCBwcm9ncmFtbWVyIHRvIGZsYXNoIGltYWdlIGZvciBB
TVNTLg0KPiA+PiA+DQo+ID4+ID4+PiAyLiBzZW5kIEVETCBjbWQgdmlhIERJQUcgY2hhbiwgdGhl
biBtb2RlbSBlbnRlciBFRSBFREwNCj4gPj4gPiAjMiBuZWVkcyB0byBiZSBkb25lIGluIGNsZWFu
ZXIgd2F5LiBGcm9tIEFNU1Mgd2hlbiBkaWFnIGNtZCBpcyBzZW50DQo+ID4+ID4gdG8gc3dpdGNo
IHRvIEVETCwgZGV2aWNlIHdvdWxkIHNlbmQgU1lTX0VSUiB3aGljaCB3ZSBjYW4gdXNlIHRvIGRv
DQo+ID4+ID4gYSBjYWxsIGJhY2sgdG8gbWhpIGNvbnRyb2xsZXIgdG8gcGVyZm9ybSBwb3dlciBk
b3duIGFuZCBwb3dlciB1cC4NCj4gPj4gPiBJbnN0ZWFkIG9mIG1vdmluZyBwbSBzdGF0ZSB0byBQ
T1IgZnJvbSBkaXNhYmxlIHRyYW5zaXRpb24gOi0NCj4gPj4gPg0KPiA+PiBUaGUgY2FsbGJhY2sg
dGhhdCBIZW1hbnQgcmVmZXJzIHRvIGlzIGZvciBNSElfQ0JfRkFUQUxfRVJST1IuIEl0DQo+ID4+
IHNob3VsZCBiZSBzZWVuIGJ5IHRoZSBjb250cm9sbGVyIG9uY2UgZGV2aWNlIGVudGVycyBFREwg
RUUgd2l0aCBNSEkNCj4gPj4gaW4gU1lTX0VSUk9SIHN0YXRlLg0KPiA+Pg0KPiA+PiBDYW4geW91
IGNvbmZpcm0geW91IHNlZSB0aGlzPyBJZiB5ZXMsIGl0IHNob3VsZCBiZSB1c2VkIHRvIHBvd2Vy
IGRvd24NCj4gPj4gYW5kIHBvd2VyIHVwIE1ISSB3aXRoIEVFIHNldCB0byBFREwuDQo+ID4gW2Nh
cmwueWluXSBmcm9tIEFNU1MgRUUgdG8gU0JMIEVFIG9yIEVETCBFRSwgSSB0aGluayBpdCBpcyBu
b3QgYQ0KPiA+IHJlYWxseSAnIEZBVEFMX0VSUk9SICcuDQo+ID4gSXQgaXMgYSBub3JtYWwgRUUg
c3RhdGUgY2hhbmdlLCBubyBuZWVkIHRvIHBvd2VyIGRvd24gYW5kIHBvd2VyIHVwDQo+ID4gZGV2
aWNlLg0KPiA+IFdoZW4gJyBGQVRBTF9FUlJPUiAnIG9jY3Vycywgd2UgY2FuIGdldCByZWFsbHkg
RUUgc3RhdGUgZnJvbSB0aGUgTUhJDQo+ID4gZGV2aWNlcy4NCj4gPiBUaGVuIGp1c3Qgc3RheSBo
ZXJlLCBsZXQgdGhlIHVzZXIgc3BhY2UgdG9vbHMgdG8gZGVjaWRlIGhvdyB0byBoYW5kbGUNCj4g
PiB0aGlzIG5ldyBFRS4NCj4gPg0KPiBXaHkgZG8geW91IHRoaW5rIGl0IGlzIGEgbm9ybWFsIEVF
IGNoYW5nZT8gRkFUQUwgRVJST1IgY2FsbGJhY2sgaXMgYSBtZWFucyB0bw0KPiBub3RpZnkgdGhl
IGNvbnRyb2xsZXIgdGhhdCB0aGUgZGV2aWNlIGlzIGJhY2sgdG8gb25lIG9mIHRoZSBQQkwgRUVz
IChQQkwvRURMLw0KPiBQVEhSVSkgYW5kIGEgY2xlYW4tdXAgbXVzdCBiZSBkb25lLiBIZW5jZSwg
dGhlIGVtcGhhc2lzIG9uIGRvaW5nIGFuIE1ISQ0KPiBwb3dlciBkb3duIGFuZCBwb3dlciB1cC4N
Cj4gDQo+IEJlY2F1c2UgYW55IG1vdmUgdG8gZnJvbSBBTVNTIC0+IFBCTCBpcyBlc3NlbnRpYWxs
eSB0cmVhdGVkIGFzIGEgcmVib290IG9mIHRoZQ0KPiBkZXZpY2UsIE1ISSBob3N0IHNob3VsZCBp
bnN0cnVjdCB0aGUgY29udHJvbGxlciB0byBkbyB0aGUgc2FtZSBmb3IgTUhJLg0KPiBPbmNlDQo+
IHRoZSBuZXh0IHBvd2VyIHVwIGhhcHBlbnMsIHlvdSBhcmUgZnJlZSB0byBsb2FkIHRoZSBFREwg
aW1hZ2UgYmVjYXVzZSBFRSB3aWxsDQo+IGJlIEVETCBpZiBtaGlfY250cmwtPmVkbF9pbWFnZSBp
cyBzZXQgYXMgJ2ZpcmVob3NlL3Byb2dfZmlyZWhvc2Vfc2R4NTUubWJuJy4NCj4gDQo+IFRoaXMg
aWYgY2hlY2sgaXMgbm90IGEgZ29vZCBpZGVhLiBJZiB5b3Ugd2FudCB0byBsb2FkIHRoZSBFREwg
aW1hZ2UsIGp1c3QgdXNlIHdoYXQNCj4gYWxyZWFkeSBleGlzdHMuDQpbY2FybC55aW5dIG1heWJl
IHdlIHNob3VsZCB0cmVhdCBFRSBFREwgc2FtZSBhcyBFRSBSRERNLA0KV2hlbiBlbnRlciBFREwv
UkRETSwganVzdCBuZWVkIHNlbGVjdCBhIHN1aXRhYmxlIHdheSB0byBkb3dubG9hZCBFREwvUkRE
TSBpbWFnZSB2aWFCSEllLCANCnRoZW4gbWhpIGRldmljZSB3aWxsIGF1dG8gcmVjb3ZlcnkgYW5k
IGVudGVyIG5vcm1hbCBzdGF0ZS4gZG8gbm90IG5lZWQgdG8gUG93ZXIgb24vb2ZmLiANCkkgZmlu
ZCB0aGUgZHJpdmVyIGhhbmRsZSBSRERNIGJ5IHRoaXMgd2F5Lg0KQW5vdGhlciB0aGluZywgd2hl
biBlbnRlciBFRSBFREwsIHdpbGwgbm90IGNhbGwgTUhJX0NCX0ZBVEFMX0VSUk9SDQoNCk5leHQg
aXMgbXkgbG9nOg0KWyAgMjEyLjQ0MTMzOF0gbWhpIDAwMDA6MDM6MDAuMDogUHJlcGFyaW5nIGNo
YW5uZWw6IDQNClsgIDIxMi40NTM4MjldIG1oaSAwMDAwOjAzOjAwLjA6IENoYW46IDQgc3VjY2Vz
c2Z1bGx5IG1vdmVkIHRvIHN0YXJ0IHN0YXRlDQpbICAyMTIuNDUzODM0XSBtaGkgMDAwMDowMzow
MC4wOiBQcmVwYXJpbmcgY2hhbm5lbDogNQ0KWyAgMjEyLjQ2Mzg3Ml0gbWhpIDAwMDA6MDM6MDAu
MDogQ2hhbjogNSBzdWNjZXNzZnVsbHkgbW92ZWQgdG8gc3RhcnQgc3RhdGUNClsgIDIxMi41NTU0
MTZdIG1oaSAwMDAwOjAzOjAwLjA6IGxvY2FsIGVlOkVETCBkZXZpY2UgZWU6QU1TUyBkZXZfc3Rh
dGU6U1lTX0VSUg0KWyAgMjEyLjU1NTQyNF0gQ1BVOiA4IFBJRDogNTMyIENvbW06IGlycS8xMjct
YmhpIFRhaW50ZWQ6IEcgICAgICAgICAgIE9FICAgICA1LjguMC0yMy1nZW5lcmljICMyNH4yMC4w
NC4xLVVidW50dQ0KWyAgMjEyLjU1NTQyNl0gSGFyZHdhcmUgbmFtZTogRGVsbCBJbmMuIE9wdGlQ
bGV4IDcwNjAvMEM5NlcxLCBCSU9TIDEuMi4yMiAxMS8wMS8yMDE4DQpbICAyMTIuNTU1NDI4XSBD
YWxsIFRyYWNlOg0KWyAgMjEyLjU1NTQ0Ml0gIGR1bXBfc3RhY2srMHg3NC8weDlhDQpbICAyMTIu
NTU1NDU0XSAgbWhpX2ludHZlY190aHJlYWRlZF9oYW5kbGVyLmNvbGQrMHg1LzB4MzYgW21oaV0g
IA0KWyAgMjEyLjU1NTQ5OV0gbWhpIDAwMDA6MDM6MDAuMDogU3lzdGVtIGVycm9yIGRldGVjdGVk
ICANClsgIDIxMi41NTU1MTldIG1oaSAwMDAwOjAzOjAwLjA6IEhhbmRsaW5nIHN0YXRlIHRyYW5z
aXRpb246IFNZU19FUlIgIA0KDQpGb3IgRUUgaXMgQU1TUywgc28gZG8gbm90IGNhbGwgTUhJX0NC
X0ZBVEFMX0VSUk9SLg0KaXMgY29kZSBCVUc/IG9yICdBTVNTLT5FREwnIGlzIG5vdCBmYXRhbCBl
cnJvcj8NCmlycXJldHVybl90IG1oaV9pbnR2ZWNfdGhyZWFkZWRfaGFuZGxlcihpbnQgaXJxX251
bWJlciwgdm9pZCAqcHJpdikNCnsNCi4uLg0KCWVlID0gbWhpX2NudHJsLT5lZTsNCgltaGlfY250
cmwtPmVlID0gbWhpX2dldF9leGVjX2VudihtaGlfY250cmwpOw0KCWRldl9kYmcoZGV2LCAibG9j
YWwgZWU6JXMgZGV2aWNlIGVlOiVzIGRldl9zdGF0ZTolc1xuIiwNCgkJVE9fTUhJX0VYRUNfU1RS
KG1oaV9jbnRybC0+ZWUpLCBUT19NSElfRVhFQ19TVFIoZWUpLA0KCQlUT19NSElfU1RBVEVfU1RS
KHN0YXRlKSk7DQouLi4NCglpZiAocG1fc3RhdGUgPT0gTUhJX1BNX1NZU19FUlJfREVURUNUKSB7
DQoJCXdha2VfdXBfYWxsKCZtaGlfY250cmwtPnN0YXRlX2V2ZW50KTsNCg0KCQkvKiBGb3IgZmF0
YWwgZXJyb3JzLCB3ZSBsZXQgY29udHJvbGxlciBkZWNpZGUgbmV4dCBzdGVwICovDQoJCWlmIChN
SElfSU5fUEJMKGVlKSkNCgkJCW1oaV9jbnRybC0+c3RhdHVzX2NiKG1oaV9jbnRybCwgTUhJX0NC
X0ZBVEFMX0VSUk9SKTsNCgkJZWxzZQ0KCQkJbWhpX3BtX3N5c19lcnJfaGFuZGxlcihtaGlfY250
cmwpOw0KCX0NCn0NCg0KDQo+ID4+DQo+ID4+IFRoaXMsIGFsb25nIHdpdGggdGhlIG1oaV9jbnRy
bC0+ZWRsX2ltYWdlIHNldCBmcm9tIHRoZSBjb250cm9sbGVyLA0KPiA+PiB3aWxsIHJlc3VsdCBp
biBNSEkgbG9hZGluZyB0aGUgRURMIGltYWdlIGZvciB5b3UuDQo+ID4+ID4gQEAgLTU2Myw3ICs1
NjMsMTUgQEAgc3RhdGljIHZvaWQgbWhpX3BtX2Rpc2FibGVfdHJhbnNpdGlvbihzdHJ1Y3QNCj4g
Pj4gPj4+IG1oaV9jb250cm9sbGVyICptaGlfY250cmwsDQo+ID4+ID4+PiAgICAgICB9DQo+ID4+
ID4+PiAgICAgICBpZiAoY3VyX3N0YXRlID09IE1ISV9QTV9TWVNfRVJSX1BST0NFU1MpIHsNCj4g
Pj4gPj4+IC0gICAgICAgIG1oaV9yZWFkeV9zdGF0ZV90cmFuc2l0aW9uKG1oaV9jbnRybCk7DQo+
ID4+ID4+PiArICAgICAgICBpZiAobWhpX2dldF9leGVjX2VudihtaGlfY250cmwpID09IE1ISV9F
RV9FREwNCj4gPj4gPj4+ICsgICAgICAgICAgICAmJiBtaGlfZ2V0X21oaV9zdGF0ZShtaGlfY250
cmwpID09IE1ISV9TVEFURV9SRVNFVCkNCj4gew0KPiA+PiA+Pj4gKyAgICAgICAgICAgIHdyaXRl
X2xvY2tfaXJxKCZtaGlfY250cmwtPnBtX2xvY2spOw0KPiA+PiA+Pj4gKyAgICAgICAgICAgIGN1
cl9zdGF0ZSA9IG1oaV90cnlzZXRfcG1fc3RhdGUobWhpX2NudHJsLA0KPiBNSElfUE1fUE9SKTsN
Cj4gPj4gPj4+ICsgICAgICAgICAgICB3cml0ZV91bmxvY2tfaXJxKCZtaGlfY250cmwtPnBtX2xv
Y2spOw0KPiA+PiA+Pj4gKyAgICAgICAgICAgIG1oaV9xdWV1ZV9zdGF0ZV90cmFuc2l0aW9uKG1o
aV9jbnRybCwNCj4gPj4gPj4+IERFVl9TVF9UUkFOU0lUSU9OX1BCTCk7DQo+ID4+ID4+PiArICAg
ICAgICB9IGVsc2Ugew0KPiA+PiA+Pj4gKyAgICAgICAgICAgIG1oaV9yZWFkeV9zdGF0ZV90cmFu
c2l0aW9uKG1oaV9jbnRybCk7DQo+ID4+ID4+PiArICAgICAgICB9DQo+ID4gW2NhcmwueWluXSBJ
IGFtIHdvcmtpbmcgb24gU0RYMjQgYW5kIFNEWDU1IGNoaXAsIG1heWJlIHRoZSBwcm9jZXNzIGlz
DQo+ID4gZGlmZmVyZW50IGZvcm0gTUhJIHdsYW4gY2hpcHM/DQo+ID4gRm9yIHRoZXNlIGNoaXBz
LCBTQkwgRUUgbWVhbnMgdGhlIGNoaXAgZW50ZXIgUkFNRFVNUCBzdGF0ZS4gbWhpIGRyaXZlcg0K
PiA+IGp1c3QgbmVlZCBleHBvcnQgU0FIQVJBIGNoYW4gdG8gdXNlciBzcGFjZSwgdGhlbiB1c2Vy
IHNwYWNlIHRvb2wgdG8NCj4gPiBjYXRjaCBSQUREVU1QLg0KPiA+DQo+ID4+ID4NCj4gPj4gPiBU
aGFua3MsDQo+ID4+ID4gSGVtYW50DQo+ID4+DQo+ID4+IFRoYW5rcywNCj4gPj4gQmhhdW1paw0K
PiA+PiAtLQ0KPiA+PiBUaGUgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gaXMgYSBt
ZW1iZXIgb2YgdGhlIENvZGUgQXVyb3JhDQo+ID4+IEZvcnVtLCBhIExpbnV4IEZvdW5kYXRpb24g
Q29sbGFib3JhdGl2ZSBQcm9qZWN0DQo+IA0KPiBUaGFua3MsDQo+IEJoYXVtaWsNCj4gLS0NCj4g
VGhlIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIGlzIGEgbWVtYmVyIG9mIHRoZSBD
b2RlIEF1cm9yYSBGb3J1bSwgYQ0KPiBMaW51eCBGb3VuZGF0aW9uIENvbGxhYm9yYXRpdmUgUHJv
amVjdA0K
