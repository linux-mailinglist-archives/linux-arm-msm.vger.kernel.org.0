Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F8A12A008C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 09:58:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725888AbgJ3I6t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Oct 2020 04:58:49 -0400
Received: from mail-eopbgr1300044.outbound.protection.outlook.com ([40.107.130.44]:11133
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725355AbgJ3I6t (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Oct 2020 04:58:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HnTKYDAJa21R4vkHtcnqh5dz6YMNweTwyiCWp597PwhUn3GQPUyiG8H+GBvLQfbrqlDmMSE+w5fXvBNleTW7LxIH1/usBPqPvwk+6i8C6EkNkFOAnx6ZeqxnIhNsg2IjvcASdXfkytZlOat6SkQg3vKExHZUo9Zp5bj/uG7sm/6t75NhlE9qRZc8HxhRaQxOWL2On3yXBeYNTMroFZ0QXsi6QZXbwDhgOABgyyfvXAmpo7ICshHxi2vqXAHS5+Uj3MKf4lhhroth5YTvow0sXTKBj5DjJzzApc7RdPA9lPdehblHjCPWGnes7T0kb8QNbflZDZGT8HY4xetg2tP43g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xWU5MdVIpy2wHzhz+mDTHlzCVyGhjoarVQGSahSlv9s=;
 b=Ey9P7JKvXPnfapBcgdqlnDqpTHuEIXuIYnXVP/9hDwkcnKy/MXMceY6BPbaOZkl9TsWyMpv0J7QaYABgnU+9SQixaADG6+pPzgtIYjdIO1rjGSPANBWc96h3ojAatsgdIMTDX9bRhnfnkz7mHnBX4nds+94cqtwFZh/6/GStkcq8veQfz940jAcRbfz5tRWqr3s+s/UbljoyuQJUgUlUPKTm2FLSgEgygKHVg1olYYMKdsNUkSMvxSAY0TtjrhAwuA+QJI6j3grZ1dYlICEKyp41+kqQJczQ4tTm90MLhIRjFcwRCAQSYB2FxpVR8Ff+Ev76fn/7YlV9I45ieEv4Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quectel.com; dmarc=pass action=none header.from=quectel.com;
 dkim=pass header.d=quectel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quectel.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xWU5MdVIpy2wHzhz+mDTHlzCVyGhjoarVQGSahSlv9s=;
 b=e4/BsniVxdqUNjbNi/dNsP6iOYHpG5S+QbjY389Xx8eq7IsIHwZjsG63A31vVapWR57S5k9YVnwCAuAjr27lhJNiHDPPSXyZ2YB8KqFymCsgVidxvjKtw094iajVhbvqCVxNoMXCt2VJyqi0wdtHShNeSI3jAHY8K6MjbZGRPy0=
Received: from HK2PR06MB3507.apcprd06.prod.outlook.com (2603:1096:202:3e::14)
 by HK0PR06MB2321.apcprd06.prod.outlook.com (2603:1096:203:49::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Fri, 30 Oct
 2020 08:58:41 +0000
Received: from HK2PR06MB3507.apcprd06.prod.outlook.com
 ([fe80::94f:c55a:f9c8:22f4]) by HK2PR06MB3507.apcprd06.prod.outlook.com
 ([fe80::94f:c55a:f9c8:22f4%5]) with mapi id 15.20.3499.028; Fri, 30 Oct 2020
 08:58:41 +0000
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
Thread-Index: AdaulqWtlRwV6/IoRGeWsh1iyKNO5w==
Date:   Fri, 30 Oct 2020 08:58:40 +0000
Message-ID: <HK2PR06MB3507308760F33A2A79C9506D86150@HK2PR06MB3507.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=quectel.com;
x-originating-ip: [203.93.254.84]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f26266e1-355f-4be6-24d0-08d87cb1ff88
x-ms-traffictypediagnostic: HK0PR06MB2321:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR06MB2321AD40673D20CB4DDF4E4E86150@HK0PR06MB2321.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F6GL2FaqxalA94vjJ6oXie2zmYY5eWyQEU6vz5vnPlzDWRv4jCi4f3fPrYr/Y53NvhznkESS75DCclo0egrJHYx3A+ZaFGgZ1JFFSWjp6N09y9E54G7Z3KEjnJGWsjbWWaA/oANTy4O4mzQspV7qcmi5IaOzfAOBzeFYoS1PNBeAOZINuj1PrReB736k88dWJ6uB2CcCLWqQ9QZ5GevaZirgqG+vOdTMgejzf6pQgUvXZX5OYzkvsoqLhaBHudupIQSeJtyXRepi3tZ1QgD30AEoZk0iygSg8sbNUFauNdQhT+GxsYnKJIU8MNJM/fjdtg+nTNS+9V7CplWIOOIVXg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK2PR06MB3507.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(136003)(396003)(39860400002)(366004)(71200400001)(186003)(66946007)(66446008)(66476007)(76116006)(83380400001)(54906003)(30864003)(52536014)(8936002)(8676002)(316002)(64756008)(4326008)(4001150100001)(66556008)(33656002)(2906002)(7696005)(478600001)(86362001)(55016002)(6916009)(5660300002)(26005)(85182001)(6506007)(53546011)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: ZOxiukeApPRFVpQH8h6i//XpdV1Fb8ut8qQbP/Ten2/E0HMlkytl4zg8nxqWTgrbshs4rhxrkKEvfH4lui4TDXZHIwSnwhnSplejX9Am7hTLftwQ7qeEzOLrLjetWxGZhjJEIobfI/kKGDP4y3/nCMm03VCUiVz0Rwrt6b6Hi1goLG9CUO8yArUnyGLZ8ssRqu1/PrzKUfomvItAeubLLVHJ+peRjsgcfpE4VAXMkh+pPRvbE4GSFeV9squubtyeG0ixYPFlhA/9YmIcii7QvclKlFvwNZUAT5YixW94MU47gsGe/IXMvkuSEcfIBU2mSsZE18z0BPlhqVNtFLHWVyyYXmgyBWKhBXOXJxuuG0QD4Xj+QddMeEfU9lbOdb8bKyCrRQ2U3RF5UfQVg+V3RQXRbeaZ+9GVhVAsyMEYkXF+Bc9B4Ww+xzFGax+fC9GWMmsXNMuT2/4DZGSsjQQqxhSH0CbwdT+94EnfOmi+n6L60zxWolAc/v3xqYQ7j/JQ67zqB7sG/sAU2w3ZyA+UpH8tOvFw5wKCHmaigPVIeGV1jnAdza8KS5mmzYDevyPYa+ZcupteUqJRb4IqPGmMHW69+KhVch+o/5Hr45Vi8hyNG33GczsGPuRGL95lIhdzuhzr0J2TD9ML3HYGVuq9Bg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quectel.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3507.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f26266e1-355f-4be6-24d0-08d87cb1ff88
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2020 08:58:40.9494
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7730d043-e129-480c-b1ba-e5b6a9f476aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f6oCPcuYNHNz0Nn1rVERVOzsGQw1UckQjgXEXbk2BkzbBGAGz6WnlNeZB9EtBJrYRhqRjGZngtQF/jkKlMVnVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2321
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SGkgYmJoYXR0Og0KDQpPbiBPY3RvYmVyIDMwLCAyMDIwIDI6MTYgQU0sIGJiaGF0dCB3cm90ZToN
Cg0KPiBPbiAyMDIwLTEwLTI5IDAyOjA5LCBDYXJsIFlpbiB3cm90ZToNCj4gPiBIaSBiYmhhdHQ6
DQo+ID4NCj4gPiBPbiBPY3RvYmVyIDI5LCAyMDIwIDU6NDEgQU0sIGJiaGF0dCB3cm90ZToNCj4g
Pj4gT24gMjAyMC0xMC0yNyAxODo1NywgQ2FybCBZaW4gd3JvdGU6DQo+ID4+ID4gSGkgYmJoYXR0
Og0KPiA+PiA+DQo+ID4+ID4gT24gV2VkbmVzZGF5LCBPY3RvYmVyIDI4LCAyMDIwIDk6MzQgQU0s
IGJiaGF0dCB3cm90ZToNCj4gPj4gPj4gSGkgQ2FybCwNCj4gPj4gPj4gT24gMjAyMC0xMC0yNyAx
NjowMSwgSGVtYW50IEt1bWFyIHdyb3RlOg0KPiA+PiA+PiA+IEhpIEplZmYsDQo+ID4+ID4+ID4N
Cj4gPj4gPj4gPiBPbiAxMC8yNy8yMCA4OjExIEFNLCBKZWZmcmV5IEh1Z28gd3JvdGU6DQo+ID4+
ID4+ID4+IE9uIDEwLzI3LzIwMjAgMzo0MyBBTSwgY2FybC55aW5AcXVlY3RlbC5jb20gd3JvdGU6
DQo+ID4+ID4+ID4+PiBGcm9tOiAiY2FybC55aW4iIDxjYXJsLnlpbkBxdWVjdGVsLmNvbT4NCj4g
Pj4gPj4gPj4+DQo+ID4+ID4+ID4+PiBNSEkgd3dhbiBtb2RlbXMgc3VwcG9ydCBkb3dubG9hZCBm
aXJtd2FyZSB0byBuYW5kIG9yIGVtbWMgYnkNCj4gPj4gPj4gPj4+IGZpcmVob3NlIHByb3RvY29s
LCBwcm9jZXNzIGFzIG5leHQ6DQo+ID4+ID4+ID4+PiAxLiB3d2FuIG1vZGVtIG5vcm1hbCBib290
dXAgYW5kIGVudGVyIEVFIEFNU1MsIGNyZWF0ZSBtaGkgRElBRw0KPiA+PiA+PiA+Pj4gY2hhbiBk
ZXZpY2UgMi4gc2VuZCBFREwgY21kIHZpYSBESUFHIGNoYW4sIHRoZW4gbW9kZW0gZW50ZXIgRUUg
RURMDQo+IDMuDQo+ID4+ID4+ID4+PiBib290LmMgZG93bmxvYWQgJ2ZpcmVob3NlL3Byb2dfZmly
ZWhvc2Vfc2R4NTUubWJuJyB2aWEgQkhJDQo+ID4+ID4+ID4+PiBpbnRlcmZhY2UgNC4gbW9kZW0g
ZW50ZXIgRUUgRlAsIGFuZCBjcmVhdGUgbWhpIEVETCBjaGFuIGRldmljZSA1Lg0KPiA+PiA+PiA+
Pj4gdXNlciBzcGFjZSB0b29sIGRvd25sb2FkIEZXIHRvIG1vZGVtIHZpYSBFREwgY2hhbiBieSBm
aXJlaG9zZQ0KPiA+PiA+PiA+Pj4gcHJvdG9jb2wNCj4gPj4gPj4gPj4+DQo+ID4+ID4+ID4+PiBT
aWduZWQtb2ZmLWJ5OiBjYXJsLnlpbiA8Y2FybC55aW5AcXVlY3RlbC5jb20+DQo+ID4+ID4+ID4+
PiAtLS0NCj4gPj4gPj4gPj4+IMKgIGRyaXZlcnMvYnVzL21oaS9jb3JlL2Jvb3QuY8KgwqDCoMKg
IHzCoCA0ICsrKy0NCj4gPj4gPj4gPj4+IMKgIGRyaXZlcnMvYnVzL21oaS9jb3JlL2luaXQuY8Kg
wqDCoMKgIHzCoCAyICsrDQo+ID4+ID4+ID4+PiDCoCBkcml2ZXJzL2J1cy9taGkvY29yZS9pbnRl
cm5hbC5oIHzCoCAxICsNCj4gPj4gPj4gPj4+IMKgIGRyaXZlcnMvYnVzL21oaS9jb3JlL21haW4u
Y8KgwqDCoMKgIHzCoCAzICsrKw0KPiA+PiA+PiA+Pj4gwqAgZHJpdmVycy9idXMvbWhpL2NvcmUv
cG0uY8KgwqDCoMKgwqDCoCB8IDE2ICsrKysrKysrKysrKysrKy0NCj4gPj4gPj4gPj4+IMKgIGlu
Y2x1ZGUvbGludXgvbWhpLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDQgKysrLQ0KPiA+
PiA+PiA+Pj4gwqAgNiBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQ0KPiA+PiA+PiA+Pj4NCj4gPj4gPj4gPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2J1cy9t
aGkvY29yZS9ib290LmMNCj4gPj4gPj4gPj4+IGIvZHJpdmVycy9idXMvbWhpL2NvcmUvYm9vdC5j
IGluZGV4IDI0NDIyZjUuLmFiMzlhZDYgMTAwNjQ0DQo+ID4+ID4+ID4+PiAtLS0gYS9kcml2ZXJz
L2J1cy9taGkvY29yZS9ib290LmMNCj4gPj4gPj4gPj4+ICsrKyBiL2RyaXZlcnMvYnVzL21oaS9j
b3JlL2Jvb3QuYw0KPiA+PiA+PiA+Pj4gQEAgLTQ2MCw4ICs0NjAsMTAgQEAgdm9pZCBtaGlfZndf
bG9hZF9oYW5kbGVyKHN0cnVjdA0KPiA+PiA+PiA+Pj4gbWhpX2NvbnRyb2xsZXINCj4gPj4gPj4g
Pj4+ICptaGlfY250cmwpDQo+ID4+ID4+ID4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuOw0K
PiA+PiA+PiA+Pj4gwqDCoMKgwqDCoCB9DQo+ID4+ID4+ID4+PiAtwqDCoMKgIGlmIChtaGlfY250
cmwtPmVlID09IE1ISV9FRV9FREwpDQo+ID4+ID4+ID4+PiArwqDCoMKgIGlmIChtaGlfY250cmwt
PmVlID09IE1ISV9FRV9FREwpIHsNCj4gPj4gPj4gPj4+ICvCoMKgwqDCoMKgwqDCoCBtaGlfcmVh
ZHlfc3RhdGVfdHJhbnNpdGlvbihtaGlfY250cmwpOw0KPiA+PiA+PiA+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybjsNCj4gPj4gPj4gPj4+ICvCoMKgwqAgfQ0KPiA+PiA+PiA+Pj4gwqDCoMKg
wqDCoCB3cml0ZV9sb2NrX2lycSgmbWhpX2NudHJsLT5wbV9sb2NrKTsNCj4gPj4gPj4gPj4+IMKg
wqDCoMKgwqAgbWhpX2NudHJsLT5kZXZfc3RhdGUgPSBNSElfU1RBVEVfUkVTRVQ7IGRpZmYgLS1n
aXQNCj4gPj4gPj4gPj4+IGEvZHJpdmVycy9idXMvbWhpL2NvcmUvaW5pdC5jIGIvZHJpdmVycy9i
dXMvbWhpL2NvcmUvaW5pdC5jDQo+ID4+ID4+ID4+PiBpbmRleA0KPiA+PiA+PiA+Pj4gYWM0YWE1
Yy4uOWMyYzJmMyAxMDA2NDQNCj4gPj4gPj4gPj4+IC0tLSBhL2RyaXZlcnMvYnVzL21oaS9jb3Jl
L2luaXQuYw0KPiA+PiA+PiA+Pj4gKysrIGIvZHJpdmVycy9idXMvbWhpL2NvcmUvaW5pdC5jDQo+
ID4+ID4+ID4+PiBAQCAtMjYsNiArMjYsNyBAQCBjb25zdCBjaGFyICogY29uc3QgbWhpX2VlX3N0
cltNSElfRUVfTUFYXSA9DQo+ID4+ID4+ID4+PiB7DQo+ID4+ID4+ID4+PiDCoMKgwqDCoMKgIFtN
SElfRUVfV0ZXXSA9ICJXRlciLA0KPiA+PiA+PiA+Pj4gwqDCoMKgwqDCoCBbTUhJX0VFX1BUSFJV
XSA9ICJQQVNTIFRIUlUiLA0KPiA+PiA+PiA+Pj4gwqDCoMKgwqDCoCBbTUhJX0VFX0VETF0gPSAi
RURMIiwNCj4gPj4gPj4gPj4+ICvCoMKgwqAgW01ISV9FRV9GUF0gPSAiRlAiLA0KPiA+PiA+PiA+
Pj4gwqDCoMKgwqDCoCBbTUhJX0VFX0RJU0FCTEVfVFJBTlNJVElPTl0gPSAiRElTQUJMRSIsDQo+
ID4+ID4+ID4+PiDCoMKgwqDCoMKgIFtNSElfRUVfTk9UX1NVUFBPUlRFRF0gPSAiTk9UIFNVUFBP
UlRFRCIsDQo+ID4+ID4+ID4+PiDCoCB9Ow0KPiA+PiA+PiA+Pj4gQEAgLTM1LDYgKzM2LDcgQEAg
Y29uc3QgY2hhciAqIGNvbnN0DQo+ID4+ID4+ID4+PiBkZXZfc3RhdGVfdHJhbl9zdHJbREVWX1NU
X1RSQU5TSVRJT05fTUFYXSA9IHsNCj4gPj4gPj4gPj4+IMKgwqDCoMKgwqAgW0RFVl9TVF9UUkFO
U0lUSU9OX1JFQURZXSA9ICJSRUFEWSIsDQo+ID4+ID4+ID4+PiDCoMKgwqDCoMKgIFtERVZfU1Rf
VFJBTlNJVElPTl9TQkxdID0gIlNCTCIsDQo+ID4+ID4+ID4+PiDCoMKgwqDCoMKgIFtERVZfU1Rf
VFJBTlNJVElPTl9NSVNTSU9OX01PREVdID0NCj4gIk1JU1NJT05fTU9ERSIsDQo+ID4+ID4+ID4+
PiArwqDCoMKgIFtERVZfU1RfVFJBTlNJVElPTl9GUF0gPSAiRlAiLA0KPiA+PiA+PiBMb25nZXIg
ZGVzY3JpcHRpb24gaGVyZSB3b3VsZCBiZSBuaWNlIChGTEFTSCBQUk9HUkFNTUVSKS4NCj4gPj4g
PiBbY2FybC55aW5dIHllcywgZm9yIFNEWDI0IGFuZCBTRFg1NSBjaGlwLCAnRklSRUhPU0UgUFJP
R1JBTU1FUicgaXMNCj4gPj4gPiBtb3JlIGJldHRlci4NCj4gPj4gSSBhZ3JlZSB3aXRoIEplZmYs
IHNob3VsZCBiZSBnZW5lcmljLg0KPiA+PiA+Pg0KPiA+PiA+PiA+Pj4gwqDCoMKgwqDCoCBbREVW
X1NUX1RSQU5TSVRJT05fU1lTX0VSUl0gPSAiU1lTX0VSUiIsDQo+ID4+ID4+ID4+PiDCoMKgwqDC
oMKgIFtERVZfU1RfVFJBTlNJVElPTl9ESVNBQkxFXSA9ICJESVNBQkxFIiwNCj4gPj4gPj4gPj4+
IMKgIH07DQo+ID4+ID4+ID4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9idXMvbWhpL2NvcmUvaW50
ZXJuYWwuaA0KPiA+PiA+PiA+Pj4gYi9kcml2ZXJzL2J1cy9taGkvY29yZS9pbnRlcm5hbC5oIGlu
ZGV4IDRhYmYwY2YuLjZhZTg5N2ENCj4gPj4gPj4gPj4+IDEwMDY0NA0KPiA+PiA+PiA+Pj4gLS0t
IGEvZHJpdmVycy9idXMvbWhpL2NvcmUvaW50ZXJuYWwuaA0KPiA+PiA+PiA+Pj4gKysrIGIvZHJp
dmVycy9idXMvbWhpL2NvcmUvaW50ZXJuYWwuaA0KPiA+PiA+PiA+Pj4gQEAgLTM4Niw2ICszODYs
NyBAQCBlbnVtIGRldl9zdF90cmFuc2l0aW9uIHsNCj4gPj4gPj4gPj4+IMKgwqDCoMKgwqAgREVW
X1NUX1RSQU5TSVRJT05fUkVBRFksDQo+ID4+ID4+ID4+PiDCoMKgwqDCoMKgIERFVl9TVF9UUkFO
U0lUSU9OX1NCTCwNCj4gPj4gPj4gPj4+IMKgwqDCoMKgwqAgREVWX1NUX1RSQU5TSVRJT05fTUlT
U0lPTl9NT0RFLA0KPiA+PiA+PiA+Pj4gK8KgwqDCoCBERVZfU1RfVFJBTlNJVElPTl9GUCwNCj4g
Pj4gPj4gPj4+IMKgwqDCoMKgwqAgREVWX1NUX1RSQU5TSVRJT05fU1lTX0VSUiwNCj4gPj4gPj4g
Pj4+IMKgwqDCoMKgwqAgREVWX1NUX1RSQU5TSVRJT05fRElTQUJMRSwNCj4gPj4gPj4gPj4+IMKg
wqDCoMKgwqAgREVWX1NUX1RSQU5TSVRJT05fTUFYLA0KPiA+PiA+PiA+Pj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvYnVzL21oaS9jb3JlL21haW4uYw0KPiA+PiA+PiA+Pj4gYi9kcml2ZXJzL2J1cy9t
aGkvY29yZS9tYWluLmMgaW5kZXggMzk1MDc5Mi4uZTMwN2I1OCAxMDA2NDQNCj4gPj4gPj4gPj4+
IC0tLSBhL2RyaXZlcnMvYnVzL21oaS9jb3JlL21haW4uYw0KPiA+PiA+PiA+Pj4gKysrIGIvZHJp
dmVycy9idXMvbWhpL2NvcmUvbWFpbi5jDQo+ID4+ID4+ID4+PiBAQCAtNzgyLDYgKzc4Miw5IEBA
IGludCBtaGlfcHJvY2Vzc19jdHJsX2V2X3Jpbmcoc3RydWN0DQo+ID4+ID4+ID4+PiBtaGlfY29u
dHJvbGxlciAqbWhpX2NudHJsLA0KPiA+PiA+PiA+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgY2FzZSBNSElfRUVfU0JMOg0KPiA+PiA+PiA+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBzdCA9IERFVl9TVF9UUkFOU0lUSU9OX1NCTDsNCj4gPj4gPj4gPj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+ID4+ID4+ID4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBjYXNlIE1ISV9FRV9GUDoNCj4gPj4gPj4gPj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgc3QgPSBERVZfU1RfVFJBTlNJVElPTl9GUDsNCj4gPj4gPj4g
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+ID4+ID4+ID4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjYXNlIE1ISV9FRV9XRlc6DQo+ID4+ID4+ID4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjYXNlIE1ISV9FRV9BTVNTOg0KPiA+PiA+PiA+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdCA9DQo+IERFVl9TVF9UUkFOU0lU
SU9OX01JU1NJT05fTU9ERTsNCj4gPj4gZGlmZg0KPiA+PiA+PiAtLWdpdA0KPiA+PiA+PiA+Pj4g
YS9kcml2ZXJzL2J1cy9taGkvY29yZS9wbS5jIGIvZHJpdmVycy9idXMvbWhpL2NvcmUvcG0uYyBp
bmRleA0KPiA+PiA+PiA+Pj4gM2RlN2IxNi4uM2M5NWE1ZCAxMDA2NDQNCj4gPj4gPj4gPj4+IC0t
LSBhL2RyaXZlcnMvYnVzL21oaS9jb3JlL3BtLmMNCj4gPj4gPj4gPj4+ICsrKyBiL2RyaXZlcnMv
YnVzL21oaS9jb3JlL3BtLmMNCj4gPj4gPj4gPj4+IEBAIC01NjMsNyArNTYzLDE1IEBAIHN0YXRp
YyB2b2lkDQo+ID4+ID4+ID4+PiBtaGlfcG1fZGlzYWJsZV90cmFuc2l0aW9uKHN0cnVjdCBtaGlf
Y29udHJvbGxlciAqbWhpX2NudHJsLA0KPiA+PiA+PiA+Pj4gwqDCoMKgwqDCoCB9DQo+ID4+ID4+
ID4+PiDCoMKgwqDCoMKgIGlmIChjdXJfc3RhdGUgPT0gTUhJX1BNX1NZU19FUlJfUFJPQ0VTUykg
ew0KPiA+PiA+PiA+Pj4gLcKgwqDCoMKgwqDCoMKgIG1oaV9yZWFkeV9zdGF0ZV90cmFuc2l0aW9u
KG1oaV9jbnRybCk7DQo+ID4+ID4+ID4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKG1oaV9nZXRfZXhl
Y19lbnYobWhpX2NudHJsKSA9PSBNSElfRUVfRURMDQo+ID4+ID4+ID4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAmJiBtaGlfZ2V0X21oaV9zdGF0ZShtaGlfY250cmwpID09DQo+ID4+IE1ISV9T
VEFURV9SRVNFVCkNCj4gPj4gPj4gew0KPiA+PiA+PiA+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgd3JpdGVfbG9ja19pcnEoJm1oaV9jbnRybC0+cG1fbG9jayk7DQo+ID4+ID4+ID4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBjdXJfc3RhdGUgPSBtaGlfdHJ5c2V0X3BtX3N0YXRlKG1oaV9j
bnRybCwNCj4gPj4gPj4gTUhJX1BNX1BPUik7DQo+ID4+ID4+ID4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB3cml0ZV91bmxvY2tfaXJxKCZtaGlfY250cmwtPnBtX2xvY2spOw0KPiA+PiA+PiA+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWhpX3F1ZXVlX3N0YXRlX3RyYW5zaXRpb24obWhp
X2NudHJsLA0KPiA+PiA+PiA+Pj4gREVWX1NUX1RSQU5TSVRJT05fUEJMKTsNCj4gPj4gPj4gPj4+
ICvCoMKgwqDCoMKgwqDCoCB9IGVsc2Ugew0KPiA+PiA+PiA+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgbWhpX3JlYWR5X3N0YXRlX3RyYW5zaXRpb24obWhpX2NudHJsKTsNCj4gPj4gPj4gPj4+
ICvCoMKgwqDCoMKgwqDCoCB9DQo+ID4+ID4+ID4+PiDCoMKgwqDCoMKgIH0gZWxzZSB7DQo+ID4+
ID4+ID4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgLyogTW92ZSB0byBkaXNhYmxlIHN0YXRlICovDQo+
ID4+ID4+ID4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgd3JpdGVfbG9ja19pcnEoJm1oaV9jbnRybC0+
cG1fbG9jayk7DQo+ID4+ID4+ID4+PiBAQCAtNjU4LDYgKzY2NiwxMiBAQCB2b2lkIG1oaV9wbV9z
dF93b3JrZXIoc3RydWN0IHdvcmtfc3RydWN0DQo+ID4+ID4+ID4+PiAqd29yaykNCj4gPj4gPj4g
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBjYXNlIERFVl9TVF9UUkFOU0lUSU9OX01JU1NJT05fTU9E
RToNCj4gPj4gPj4gPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1oaV9wbV9taXNzaW9u
X21vZGVfdHJhbnNpdGlvbihtaGlfY250cmwpOw0KPiA+PiA+PiA+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgYnJlYWs7DQo+ID4+ID4+ID4+PiArwqDCoMKgwqDCoMKgwqAgY2FzZSBERVZf
U1RfVFJBTlNJVElPTl9GUDoNCj4gPj4gPj4gPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHdy
aXRlX2xvY2tfaXJxKCZtaGlfY250cmwtPnBtX2xvY2spOw0KPiA+PiA+PiA+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgbWhpX2NudHJsLT5lZSA9IE1ISV9FRV9GUDsNCj4gPj4gPj4gPj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHdyaXRlX3VubG9ja19pcnEoJm1oaV9jbnRybC0+cG1fbG9j
ayk7DQo+ID4+ID4+ID4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtaGlfY3JlYXRlX2Rldmlj
ZXMobWhpX2NudHJsKTsNCj4gPj4gPj4gPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFr
Ow0KPiA+PiA+PiA+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNhc2UgREVWX1NUX1RSQU5TSVRJT05f
UkVBRFk6DQo+ID4+ID4+ID4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtaGlfcmVhZHlf
c3RhdGVfdHJhbnNpdGlvbihtaGlfY250cmwpOw0KPiA+PiA+PiA+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgYnJlYWs7DQo+ID4+ID4+ID4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51
eC9taGkuaCBiL2luY2x1ZGUvbGludXgvbWhpLmggaW5kZXgNCj4gPj4gPj4gPj4+IDZlMTEyMmMu
LjQ2MjBhZjggMTAwNjQ0DQo+ID4+ID4+ID4+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L21oaS5oDQo+
ID4+ID4+ID4+PiArKysgYi9pbmNsdWRlL2xpbnV4L21oaS5oDQo+ID4+ID4+ID4+PiBAQCAtMTIw
LDYgKzEyMCw3IEBAIHN0cnVjdCBtaGlfbGlua19pbmZvIHsNCj4gPj4gPj4gPj4+IMKgwqAgKiBA
TUhJX0VFX1dGVzogV0xBTiBmaXJtd2FyZSBtb2RlDQo+ID4+ID4+ID4+PiDCoMKgICogQE1ISV9F
RV9QVEhSVTogUGFzc3Rocm91Z2gNCj4gPj4gPj4gPj4+IMKgwqAgKiBATUhJX0VFX0VETDogRW1i
ZWRkZWQgZG93bmxvYWRlcg0KPiA+PiA+PiA+Pj4gKyAqIEBNSElfRUVfRlAsIEZsYXNoIFByb2dy
YW1tZXIgRW52aXJvbm1lbnQNCj4gPj4gPj4gPj4+IMKgwqAgKi8NCj4gPj4gPj4gPj4+IMKgIGVu
dW0gbWhpX2VlX3R5cGUgew0KPiA+PiA+PiA+Pj4gwqDCoMKgwqDCoCBNSElfRUVfUEJMLA0KPiA+
PiA+PiA+Pj4gQEAgLTEyOSw3ICsxMzAsOCBAQCBlbnVtIG1oaV9lZV90eXBlIHsNCj4gPj4gPj4g
Pj4+IMKgwqDCoMKgwqAgTUhJX0VFX1dGVywNCj4gPj4gPj4gPj4+IMKgwqDCoMKgwqAgTUhJX0VF
X1BUSFJVLA0KPiA+PiA+PiA+Pj4gwqDCoMKgwqDCoCBNSElfRUVfRURMLA0KPiA+PiA+PiA+Pj4g
LcKgwqDCoCBNSElfRUVfTUFYX1NVUFBPUlRFRCA9IE1ISV9FRV9FREwsDQo+ID4+ID4+ID4+PiAr
wqDCoMKgIE1ISV9FRV9GUCwNCj4gPj4gPj4gPj4+ICvCoMKgwqAgTUhJX0VFX01BWF9TVVBQT1JU
RUQgPSBNSElfRUVfRlAsDQo+ID4+ID4+ID4+PiDCoMKgwqDCoMKgIE1ISV9FRV9ESVNBQkxFX1RS
QU5TSVRJT04sIC8qIGxvY2FsIEVFLCBub3QgcmVsYXRlZCB0bw0KPiA+PiA+PiA+Pj4gbWhpIHNw
ZWMgKi8NCj4gPj4gPj4gPj4+IMKgwqDCoMKgwqAgTUhJX0VFX05PVF9TVVBQT1JURUQsDQo+ID4+
ID4+ID4+PiDCoMKgwqDCoMKgIE1ISV9FRV9NQVgsDQo+ID4+ID4+ID4+Pg0KPiA+PiA+PiA+Pg0K
PiA+PiA+PiA+PiBUaGlzIGdldHMgYSBOQUNLIGZyb20gbWUuwqAgSSBkb24ndCBzZWUgdGhlIEZQ
X0VFIHRoYXQgdGhpcw0KPiA+PiA+PiA+PiBwYXRjaCBpbnRyb2R1Y2VzIGRlZmluZWQgaW4gdGhl
IHNwZWMuwqAgV2hlcmUgZGlkIGl0IGNvbWUgZnJvbT8NCj4gPj4gPj4gPj4NCj4gPj4gPj4gPiBU
aGVyZSBpcyBpbmRlZWQgYSBGUCBFRSwgQkhJIHNwZWMgd2lsbCBiZSB1cGRhdGVkIHdpdGggdGhp
cyBFRQ0KPiA+PiA+PiA+IG5leHQgbW9udGguDQo+ID4+ID4+ID4NCj4gPj4gPj4gPiBCYXNpY2Fs
bHksIG9uY2UgZGV2aWNlIGdvZXMgdG8gRURMLCBmbGFzaCBwcm9ncmFtbWVyIGltYWdlIGlzDQo+
ID4+ID4+ID4gZG93bmxvYWRlZCB1c2luZyBCSEkgcHJvdG9jb2wgKHNhbWUgYXMgd2UgZG93bmxv
YWQgU0JMIGltYWdlDQo+ID4+ID4+ID4gdXNpbmcgQkhJIGZyb20gUEJMIGluIGN1cnJlbnQgdXNl
IGNhc2UpLiBPbmNlIGl0IGlzIGRvd25sb2FkZWQNCj4gPj4gPj4gPiBpbnR2ZWMgc2VuZHMgRUUg
Y2hhbmdlIGV2ZW50IGZvciBGUC4gQWxzbyBldmVudCBpcyBnZW5lcmF0ZWQgZm9yDQo+ID4+ID4+
ID4gdGhlIHNhbWUgd2hpY2ggaXMgdXNlZCB0byBjcmVhdGUgRURMIGNoYW5uZWxzICgzNCwgMzUp
IHdoaWNoIGlzDQo+ID4+ID4+ID4gdXNlZCBieSBmbGFzaCBwcm9ncmFtbWVyIHRvIGZsYXNoIGlt
YWdlIGZvciBBTVNTLg0KPiA+PiA+PiA+DQo+ID4+ID4+ID4+PiAyLiBzZW5kIEVETCBjbWQgdmlh
IERJQUcgY2hhbiwgdGhlbiBtb2RlbSBlbnRlciBFRSBFREwNCj4gPj4gPj4gPiAjMiBuZWVkcyB0
byBiZSBkb25lIGluIGNsZWFuZXIgd2F5LiBGcm9tIEFNU1Mgd2hlbiBkaWFnIGNtZCBpcw0KPiA+
PiA+PiA+IHNlbnQgdG8gc3dpdGNoIHRvIEVETCwgZGV2aWNlIHdvdWxkIHNlbmQgU1lTX0VSUiB3
aGljaCB3ZSBjYW4NCj4gPj4gPj4gPiB1c2UgdG8gZG8gYSBjYWxsIGJhY2sgdG8gbWhpIGNvbnRy
b2xsZXIgdG8gcGVyZm9ybSBwb3dlciBkb3duIGFuZCBwb3dlcg0KPiB1cC4NCj4gPj4gPj4gPiBJ
bnN0ZWFkIG9mIG1vdmluZyBwbSBzdGF0ZSB0byBQT1IgZnJvbSBkaXNhYmxlIHRyYW5zaXRpb24g
Oi0NCj4gPj4gPj4gPg0KPiA+PiA+PiBUaGUgY2FsbGJhY2sgdGhhdCBIZW1hbnQgcmVmZXJzIHRv
IGlzIGZvciBNSElfQ0JfRkFUQUxfRVJST1IuIEl0DQo+ID4+ID4+IHNob3VsZCBiZSBzZWVuIGJ5
IHRoZSBjb250cm9sbGVyIG9uY2UgZGV2aWNlIGVudGVycyBFREwgRUUgd2l0aA0KPiA+PiA+PiBN
SEkgaW4gU1lTX0VSUk9SIHN0YXRlLg0KPiA+PiA+Pg0KPiA+PiA+PiBDYW4geW91IGNvbmZpcm0g
eW91IHNlZSB0aGlzPyBJZiB5ZXMsIGl0IHNob3VsZCBiZSB1c2VkIHRvIHBvd2VyDQo+ID4+ID4+
IGRvd24gYW5kIHBvd2VyIHVwIE1ISSB3aXRoIEVFIHNldCB0byBFREwuDQo+ID4+ID4gW2Nhcmwu
eWluXSBmcm9tIEFNU1MgRUUgdG8gU0JMIEVFIG9yIEVETCBFRSwgSSB0aGluayBpdCBpcyBub3Qg
YQ0KPiA+PiA+IHJlYWxseSAnIEZBVEFMX0VSUk9SICcuDQo+ID4+ID4gSXQgaXMgYSBub3JtYWwg
RUUgc3RhdGUgY2hhbmdlLCBubyBuZWVkIHRvIHBvd2VyIGRvd24gYW5kIHBvd2VyIHVwDQo+ID4+
ID4gZGV2aWNlLg0KPiA+PiA+IFdoZW4gJyBGQVRBTF9FUlJPUiAnIG9jY3Vycywgd2UgY2FuIGdl
dCByZWFsbHkgRUUgc3RhdGUgZnJvbSB0aGUNCj4gPj4gPiBNSEkgZGV2aWNlcy4NCj4gPj4gPiBU
aGVuIGp1c3Qgc3RheSBoZXJlLCBsZXQgdGhlIHVzZXIgc3BhY2UgdG9vbHMgdG8gZGVjaWRlIGhv
dyB0bw0KPiA+PiA+IGhhbmRsZSB0aGlzIG5ldyBFRS4NCj4gPj4gPg0KPiA+PiBXaHkgZG8geW91
IHRoaW5rIGl0IGlzIGEgbm9ybWFsIEVFIGNoYW5nZT8gRkFUQUwgRVJST1IgY2FsbGJhY2sgaXMg
YQ0KPiA+PiBtZWFucyB0byBub3RpZnkgdGhlIGNvbnRyb2xsZXIgdGhhdCB0aGUgZGV2aWNlIGlz
IGJhY2sgdG8gb25lIG9mIHRoZQ0KPiA+PiBQQkwgRUVzIChQQkwvRURMLw0KPiA+PiBQVEhSVSkg
YW5kIGEgY2xlYW4tdXAgbXVzdCBiZSBkb25lLiBIZW5jZSwgdGhlIGVtcGhhc2lzIG9uIGRvaW5n
IGFuDQo+ID4+IE1ISSBwb3dlciBkb3duIGFuZCBwb3dlciB1cC4NCj4gPj4NCj4gPj4gQmVjYXVz
ZSBhbnkgbW92ZSB0byBmcm9tIEFNU1MgLT4gUEJMIGlzIGVzc2VudGlhbGx5IHRyZWF0ZWQgYXMg
YQ0KPiA+PiByZWJvb3Qgb2YgdGhlIGRldmljZSwgTUhJIGhvc3Qgc2hvdWxkIGluc3RydWN0IHRo
ZSBjb250cm9sbGVyIHRvIGRvDQo+ID4+IHRoZSBzYW1lIGZvciBNSEkuDQo+ID4+IE9uY2UNCj4g
Pj4gdGhlIG5leHQgcG93ZXIgdXAgaGFwcGVucywgeW91IGFyZSBmcmVlIHRvIGxvYWQgdGhlIEVE
TCBpbWFnZSBiZWNhdXNlDQo+ID4+IEVFIHdpbGwgYmUgRURMIGlmIG1oaV9jbnRybC0+ZWRsX2lt
YWdlIGlzIHNldCBhcw0KPiA+PiAnZmlyZWhvc2UvcHJvZ19maXJlaG9zZV9zZHg1NS5tYm4nLg0K
PiA+Pg0KPiA+PiBUaGlzIGlmIGNoZWNrIGlzIG5vdCBhIGdvb2QgaWRlYS4gSWYgeW91IHdhbnQg
dG8gbG9hZCB0aGUgRURMIGltYWdlLA0KPiA+PiBqdXN0IHVzZSB3aGF0IGFscmVhZHkgZXhpc3Rz
Lg0KPiA+IFtjYXJsLnlpbl0gbWF5YmUgd2Ugc2hvdWxkIHRyZWF0IEVFIEVETCBzYW1lIGFzIEVF
IFJERE0sIFdoZW4gZW50ZXINCj4gPiBFREwvUkRETSwganVzdCBuZWVkIHNlbGVjdCBhIHN1aXRh
YmxlIHdheSB0byBkb3dubG9hZCBFREwvUkRETSBpbWFnZQ0KPiA+IHZpYUJISWUsIHRoZW4gbWhp
IGRldmljZSB3aWxsIGF1dG8gcmVjb3ZlcnkgYW5kIGVudGVyIG5vcm1hbCBzdGF0ZS4gZG8NCj4g
PiBub3QgbmVlZCB0byBQb3dlciBvbi9vZmYuDQo+ID4gSSBmaW5kIHRoZSBkcml2ZXIgaGFuZGxl
IFJERE0gYnkgdGhpcyB3YXkuDQo+ID4gQW5vdGhlciB0aGluZywgd2hlbiBlbnRlciBFRSBFREws
IHdpbGwgbm90IGNhbGwgTUhJX0NCX0ZBVEFMX0VSUk9SDQo+ID4NCj4gPiBOZXh0IGlzIG15IGxv
ZzoNCj4gPiBbICAyMTIuNDQxMzM4XSBtaGkgMDAwMDowMzowMC4wOiBQcmVwYXJpbmcgY2hhbm5l
bDogNCBbICAyMTIuNDUzODI5XQ0KPiA+IG1oaSAwMDAwOjAzOjAwLjA6IENoYW46IDQgc3VjY2Vz
c2Z1bGx5IG1vdmVkIHRvIHN0YXJ0IHN0YXRlIFsNCj4gPiAyMTIuNDUzODM0XSBtaGkgMDAwMDow
MzowMC4wOiBQcmVwYXJpbmcgY2hhbm5lbDogNSBbICAyMTIuNDYzODcyXSBtaGkNCj4gPiAwMDAw
OjAzOjAwLjA6IENoYW46IDUgc3VjY2Vzc2Z1bGx5IG1vdmVkIHRvIHN0YXJ0IHN0YXRlIFsgIDIx
Mi41NTU0MTZdDQo+ID4gbWhpIDAwMDA6MDM6MDAuMDogbG9jYWwgZWU6RURMIGRldmljZSBlZTpB
TVNTIGRldl9zdGF0ZTpTWVNfRVJSIFsNCj4gPiAyMTIuNTU1NDI0XSBDUFU6IDggUElEOiA1MzIg
Q29tbTogaXJxLzEyNy1iaGkgVGFpbnRlZDogRw0KPiA+IE9FICAgICA1LjguMC0yMy1nZW5lcmlj
ICMyNH4yMC4wNC4xLVVidW50dQ0KPiA+IFsgIDIxMi41NTU0MjZdIEhhcmR3YXJlIG5hbWU6IERl
bGwgSW5jLiBPcHRpUGxleCA3MDYwLzBDOTZXMSwgQklPUw0KPiA+IDEuMi4yMiAxMS8wMS8yMDE4
DQo+ID4gWyAgMjEyLjU1NTQyOF0gQ2FsbCBUcmFjZToNCj4gPiBbICAyMTIuNTU1NDQyXSAgZHVt
cF9zdGFjaysweDc0LzB4OWENCj4gPiBbICAyMTIuNTU1NDU0XSAgbWhpX2ludHZlY190aHJlYWRl
ZF9oYW5kbGVyLmNvbGQrMHg1LzB4MzYgW21oaV0gWw0KPiA+IDIxMi41NTU0OTldIG1oaSAwMDAw
OjAzOjAwLjA6IFN5c3RlbSBlcnJvciBkZXRlY3RlZCBbICAyMTIuNTU1NTE5XSBtaGkNCj4gPiAw
MDAwOjAzOjAwLjA6IEhhbmRsaW5nIHN0YXRlIHRyYW5zaXRpb246IFNZU19FUlINCj4gPg0KPiA+
IEZvciBFRSBpcyBBTVNTLCBzbyBkbyBub3QgY2FsbCBNSElfQ0JfRkFUQUxfRVJST1IuDQo+ID4g
aXMgY29kZSBCVUc/IG9yICdBTVNTLT5FREwnIGlzIG5vdCBmYXRhbCBlcnJvcj8NCj4gPiBpcnFy
ZXR1cm5fdCBtaGlfaW50dmVjX3RocmVhZGVkX2hhbmRsZXIoaW50IGlycV9udW1iZXIsIHZvaWQg
KnByaXYpIHsNCj4gPiAuLi4NCj4gPiAJZWUgPSBtaGlfY250cmwtPmVlOw0KPiA+IAltaGlfY250
cmwtPmVlID0gbWhpX2dldF9leGVjX2VudihtaGlfY250cmwpOw0KPiA+IAlkZXZfZGJnKGRldiwg
ImxvY2FsIGVlOiVzIGRldmljZSBlZTolcyBkZXZfc3RhdGU6JXNcbiIsDQo+ID4gCQlUT19NSElf
RVhFQ19TVFIobWhpX2NudHJsLT5lZSksIFRPX01ISV9FWEVDX1NUUihlZSksDQo+ID4gCQlUT19N
SElfU1RBVEVfU1RSKHN0YXRlKSk7DQo+ID4gLi4uDQo+ID4gCWlmIChwbV9zdGF0ZSA9PSBNSElf
UE1fU1lTX0VSUl9ERVRFQ1QpIHsNCj4gPiAJCXdha2VfdXBfYWxsKCZtaGlfY250cmwtPnN0YXRl
X2V2ZW50KTsNCj4gPg0KPiA+IAkJLyogRm9yIGZhdGFsIGVycm9ycywgd2UgbGV0IGNvbnRyb2xs
ZXIgZGVjaWRlIG5leHQgc3RlcCAqLw0KPiA+IAkJaWYgKE1ISV9JTl9QQkwoZWUpKQ0KPiA+IAkJ
CW1oaV9jbnRybC0+c3RhdHVzX2NiKG1oaV9jbnRybCwgTUhJX0NCX0ZBVEFMX0VSUk9SKTsNCj4g
PiAJCWVsc2UNCj4gPiAJCQltaGlfcG1fc3lzX2Vycl9oYW5kbGVyKG1oaV9jbnRybCk7DQo+ID4g
CX0NCj4gPiB9DQo+ID4NCj4gPg0KPiBJIHNlZSBhIGJ1Zy4gSW4gdGhlIHByaW50LCBsb2NhbCBh
bmQgZGV2aWNlIEVFIGFyZSBzd2l0Y2hlZC4gU28gZGV2aWNlIGlzIGFjdHVhbGx5IGluDQo+IEVE
TCBFRSB3aGVuIHRoaXMgaW50ZXJydXB0IG9jY3VycyBhbmQgd2l0aCBkZXZpY2UgaW4gU1lTX0VS
Uiwgd2Ugc2hvdWxkIGNhbGwNCj4gc3RhdHVzX2NiIHdpdGggTUhJX0NCX0ZBVEFMX0VSUk9SLCBi
dXQgd2UgZG9uJ3QuDQo+IA0KPiBJbiBkcml2ZXJzL2J1cy9taGkvY29yZS9pbnRlcm5hbC5oOg0K
PiAjZGVmaW5lIE1ISV9JTl9QQkwoZWUpIChlZSA9PSBNSElfRUVfUEJMIHx8IGVlID09IE1ISV9F
RV9QVEhSVSB8fCBcDQo+IAkJCWVlID09IE1ISV9FRV9FREwpDQo+IA0KPiBXZSBoYXZlIHNvbWUg
Y2hhbmdlcyBjb21pbmcgaGVyZSwgYnV0IGZvciBub3cgeW91IG1heSB3YW50IHRvIGFkZCBhIHBh
dGNoIHRvDQo+IGZpeCBpdC4gVGhlIGNoZWNrIHNob3VsZCBiZSBpZiAoTUhJX0lOX1BCTChtaGlf
Y250cmwtPmVlKSksIHNvIHlvdXIgY29udHJvbGxlcg0KPiBnZXRzIHRoZSBjYWxsYmFjay4NCj4g
DQo+IElmIEVFIHdhcyBBTVNTIGFuZCBhIFNZU19FUlJPUiB3YXMgcmVjZWl2ZWQsIHdlIGV4cGVj
dCB0byBwcm9jZWVkIHdpdGggdGhlDQo+IGhhbmRsaW5nIG9mIG1oaV9wbV9zeXNfZXJyX2hhbmRs
ZXIobWhpX2NudHJsKSB3aGljaCBpcyB3aGF0IHlvdSBkbyBub3cgYW5kIGl0DQo+IGRvZXMgdGhl
IHJlcXVpcmVkIGNsZWFuLXVwLiBCdXQgd2l0aCBIZW1hbnQgYW5kIG15IHByb3Bvc2FsLCB3ZSBk
b24ndCBuZWVkDQo+IGFkZGl0aW9uYWwgaGFja3MvaWYgY2hlY2tzIGFuZCBleHRyYSBjb2RlIG92
ZXIgdGhlcmUgYWZ0ZXIgU1lTX0VSUiBwcm9jZXNzaW5nIGlzDQo+IGRvbmUsIHNvIHdlIGNhbiBh
dm9pZCB0aGF0IGFuZCBoYXZlIGNsZWFuIGNvZGUvYXBwcm9hY2guDQpbY2FybC55aW5dIEkgZm9s
bG93IHlvdXIgYWR2aWNlcywgYW5kIG5vdyBteSBmaXJlaG9zZSBmbGFzaCB0b29sIGNhbiB3b3Jr
Lg0KCVRoZSBFRSBzd2l0Y2ggaXMgIkFNU1MgLT4gRURMIC0+IEZQIiwgc28gSSBtb2RpZnkgbWhp
X3N5bmNfcG93ZXJfdXAoKSBhcyBuZXh0Og0KQEAgLTEwOTUsMTEgKzEwODcsMTcgQEAgaW50IG1o
aV9zeW5jX3Bvd2VyX3VwKHN0cnVjdCBtaGlfY29udHJvbGxlciAqbWhpX2NudHJsKQ0KICAgICAg
ICB3YWl0X2V2ZW50X3RpbWVvdXQobWhpX2NudHJsLT5zdGF0ZV9ldmVudCwNCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgIE1ISV9JTl9NSVNTSU9OX01PREUobWhpX2NudHJsLT5lZSkgfHwNCisg
ICAgICAgICAgICAgICAgICAgICAgICAgIG1oaV9jbnRybC0+ZWUgPT0gTUhJX0VFX0ZQIHx8DQog
ICAgICAgICAgICAgICAgICAgICAgICAgICBNSElfUE1fSU5fRVJST1JfU1RBVEUobWhpX2NudHJs
LT5wbV9zdGF0ZSksDQogICAgICAgICAgICAgICAgICAgICAgICAgICBtc2Vjc190b19qaWZmaWVz
KG1oaV9jbnRybC0+dGltZW91dF9tcykpOw0KIA0KLSAgICAgICByZXQgPSAoTUhJX0lOX01JU1NJ
T05fTU9ERShtaGlfY250cmwtPmVlKSkgPyAwIDogLUVUSU1FRE9VVDsNCisgICAgICAgaWYgKG1o
aV9jbnRybC0+ZWUgPT0gTUhJX0VFX0ZQKSB7DQorICAgICAgICAgICAgICAgbWhpX3F1ZXVlX3N0
YXRlX3RyYW5zaXRpb24obWhpX2NudHJsLCBERVZfU1RfVFJBTlNJVElPTl9SRUFEWSk7DQorICAg
ICAgIH0gZWxzZSB7DQorICAgICAgICAgICAgICAgcmV0ID0gKE1ISV9JTl9NSVNTSU9OX01PREUo
bWhpX2NudHJsLT5lZSkpID8gMCA6IC1FVElNRURPVVQ7DQorICAgICAgIH0NCisNCg0KPiANCj4g
SW4gUkRETSwgd2Ugd2FpdCBmb3IgZGV2aWNlIHRvIHNlbmQgdXMgdGhlIFJERE0gaW1hZ2UgYW5k
IHRoZW4gZG8gYW4gTUhJDQo+IHBvd2VyIGN5Y2xlLiBJbiBFREwsIGhvd2V2ZXIsIGhvc3QgbmVl
ZHMgdG8gc2VuZCB0aGUgaW1hZ2UgYW5kIHNpbmNlIHdlIGtub3cNCj4gRUUgd2VudCBmcm9tIEFN
U1MtPkVETCwgd2UgcHVzaCBFREwgaW1hZ2UgaW4gYW4gZXhpc3Rpbmcgd2F5IGFmdGVyIE1ISSBj
bGVhbg0KPiB1cC4NCj4gPj4gPj4NCj4gPj4gPj4gVGhpcywgYWxvbmcgd2l0aCB0aGUgbWhpX2Nu
dHJsLT5lZGxfaW1hZ2Ugc2V0IGZyb20gdGhlIGNvbnRyb2xsZXIsDQo+ID4+ID4+IHdpbGwgcmVz
dWx0IGluIE1ISSBsb2FkaW5nIHRoZSBFREwgaW1hZ2UgZm9yIHlvdS4NCj4gPj4gPj4gPiBAQCAt
NTYzLDcgKzU2MywxNSBAQCBzdGF0aWMgdm9pZA0KPiA+PiA+PiA+IG1oaV9wbV9kaXNhYmxlX3Ry
YW5zaXRpb24oc3RydWN0DQo+ID4+ID4+ID4+PiBtaGlfY29udHJvbGxlciAqbWhpX2NudHJsLA0K
PiA+PiA+PiA+Pj4gICAgICAgfQ0KPiA+PiA+PiA+Pj4gICAgICAgaWYgKGN1cl9zdGF0ZSA9PSBN
SElfUE1fU1lTX0VSUl9QUk9DRVNTKSB7DQo+ID4+ID4+ID4+PiAtICAgICAgICBtaGlfcmVhZHlf
c3RhdGVfdHJhbnNpdGlvbihtaGlfY250cmwpOw0KPiA+PiA+PiA+Pj4gKyAgICAgICAgaWYgKG1o
aV9nZXRfZXhlY19lbnYobWhpX2NudHJsKSA9PSBNSElfRUVfRURMDQo+ID4+ID4+ID4+PiArICAg
ICAgICAgICAgJiYgbWhpX2dldF9taGlfc3RhdGUobWhpX2NudHJsKSA9PQ0KPiA+PiA+PiA+Pj4g
KyBNSElfU1RBVEVfUkVTRVQpDQo+ID4+IHsNCj4gPj4gPj4gPj4+ICsgICAgICAgICAgICB3cml0
ZV9sb2NrX2lycSgmbWhpX2NudHJsLT5wbV9sb2NrKTsNCj4gPj4gPj4gPj4+ICsgICAgICAgICAg
ICBjdXJfc3RhdGUgPSBtaGlfdHJ5c2V0X3BtX3N0YXRlKG1oaV9jbnRybCwNCj4gPj4gTUhJX1BN
X1BPUik7DQo+ID4+ID4+ID4+PiArICAgICAgICAgICAgd3JpdGVfdW5sb2NrX2lycSgmbWhpX2Nu
dHJsLT5wbV9sb2NrKTsNCj4gPj4gPj4gPj4+ICsgICAgICAgICAgICBtaGlfcXVldWVfc3RhdGVf
dHJhbnNpdGlvbihtaGlfY250cmwsDQo+ID4+ID4+ID4+PiBERVZfU1RfVFJBTlNJVElPTl9QQkwp
Ow0KPiA+PiA+PiA+Pj4gKyAgICAgICAgfSBlbHNlIHsNCj4gPj4gPj4gPj4+ICsgICAgICAgICAg
ICBtaGlfcmVhZHlfc3RhdGVfdHJhbnNpdGlvbihtaGlfY250cmwpOw0KPiA+PiA+PiA+Pj4gKyAg
ICAgICAgfQ0KPiA+PiA+IFtjYXJsLnlpbl0gSSBhbSB3b3JraW5nIG9uIFNEWDI0IGFuZCBTRFg1
NSBjaGlwLCBtYXliZSB0aGUgcHJvY2Vzcw0KPiA+PiA+IGlzIGRpZmZlcmVudCBmb3JtIE1ISSB3
bGFuIGNoaXBzPw0KPiA+PiA+IEZvciB0aGVzZSBjaGlwcywgU0JMIEVFIG1lYW5zIHRoZSBjaGlw
IGVudGVyIFJBTURVTVAgc3RhdGUuIG1oaQ0KPiA+PiA+IGRyaXZlciBqdXN0IG5lZWQgZXhwb3J0
IFNBSEFSQSBjaGFuIHRvIHVzZXIgc3BhY2UsIHRoZW4gdXNlciBzcGFjZQ0KPiA+PiA+IHRvb2wg
dG8gY2F0Y2ggUkFERFVNUC4NCj4gPj4gPg0KPiA+PiA+PiA+DQo+ID4+ID4+ID4gVGhhbmtzLA0K
PiA+PiA+PiA+IEhlbWFudA0KPiA+PiA+Pg0KPiA+PiA+PiBUaGFua3MsDQo+ID4+ID4+IEJoYXVt
aWsNCj4gPj4gPj4gLS0NCj4gPj4gPj4gVGhlIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJ
bmMuIGlzIGEgbWVtYmVyIG9mIHRoZSBDb2RlDQo+ID4+ID4+IEF1cm9yYSBGb3J1bSwgYSBMaW51
eCBGb3VuZGF0aW9uIENvbGxhYm9yYXRpdmUgUHJvamVjdA0KPiA+Pg0KPiA+PiBUaGFua3MsDQo+
ID4+IEJoYXVtaWsNCj4gPj4gLS0NCj4gPj4gVGhlIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVy
LCBJbmMuIGlzIGEgbWVtYmVyIG9mIHRoZSBDb2RlIEF1cm9yYQ0KPiA+PiBGb3J1bSwgYSBMaW51
eCBGb3VuZGF0aW9uIENvbGxhYm9yYXRpdmUgUHJvamVjdA0KPiANCj4gVGhhbmtzLA0KPiBCaGF1
bWlrDQo+IC0tDQo+IFRoZSBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBpcyBhIG1l
bWJlciBvZiB0aGUgQ29kZSBBdXJvcmEgRm9ydW0sIGENCj4gTGludXggRm91bmRhdGlvbiBDb2xs
YWJvcmF0aXZlIFByb2plY3QNCg==
