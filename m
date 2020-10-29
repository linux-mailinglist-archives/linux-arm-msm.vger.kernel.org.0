Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A03F729E0BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 02:34:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729631AbgJ2BeP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Oct 2020 21:34:15 -0400
Received: from mail-eopbgr1320082.outbound.protection.outlook.com ([40.107.132.82]:60240
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729602AbgJ2Bd0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Oct 2020 21:33:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hs4qNNzi00cqslJ7BdEStgPVE7I0FYgJcN+Zenh8itxPyh8N0vBX5Blm5VfVrNTrMYVbqxgaxinU8EQjPkxKHmfoC7CP+eFZQMI60LcBGSI+qs8LRl6z5t12kXYViUWCaZfHggUlEeG8sDICVYaf1o/cbf8htYP+Qs7Fi7Y8JDF/PFpV6567nwWxV5TeAernnU9kogND8LQa9WSxR+mlft9w4TS/eUMh/LpT/Sh4vLXGu9cjunO7RiQrpsomYMakf9KXCBhY6NZHj7A7lHNeWu1XQRs/NoOL1Yt4FPeQoqLCTV8HCjlUdXIMXH1hCZfKuYok35xQgPqWUVRUxTj8kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUHwgn0vmlhXRzgTF0T+uBUj+1xpebh4Xox9Fu0YfZM=;
 b=RbtU2BqlkC8xt0Iz9bxk3b6UCzQlpEvS7O3MSI/m1s5WT9iierAvfrEcYCM0TBAVtqlgiKLKZ1Wmm2AK5AQt9PeVSHtgPmy8i2B4eMAaM0FLBRPot1gIEEqGSmD6wmqsKzlqKVseq7CuphEsGMDQndN62aIbR5cGm/mmYf3ksfDJdtbq1L/iMxglovEiD+pDGg3JRv5CGQmkGeVmw0cH61c/1561LLa6dBQRrgj7cjT6shisULEuajn/WQCBxPA6QdG4Tq+5KxHUjVauU5VYlR1pBpLXNgsEkXcTMeTbTJYt68N3/pPedLRBeho1aHbW4nBWKqNk/cuxC+2PRsQA6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quectel.com; dmarc=pass action=none header.from=quectel.com;
 dkim=pass header.d=quectel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quectel.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUHwgn0vmlhXRzgTF0T+uBUj+1xpebh4Xox9Fu0YfZM=;
 b=bscieDTfw/QGKT6r+dgqaQK2p3zvxYySYZZHW/V/TEN/drkRg/EvIwcr8tUuDKDeDAvXMcFV1o6gQCMYgjmuZNi/z4vosRLciLXgyaWfMDN1vFhxmxhy4n+Dd8OT0Oh6sakN35WB5zxu+XWbC6i4cZ9qYCAZLRxS9o3RAF7MzTk=
Received: from HK2PR06MB3507.apcprd06.prod.outlook.com (2603:1096:202:3e::14)
 by HK0PR06MB2929.apcprd06.prod.outlook.com (2603:1096:203:61::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.27; Thu, 29 Oct
 2020 01:33:20 +0000
Received: from HK2PR06MB3507.apcprd06.prod.outlook.com
 ([fe80::94f:c55a:f9c8:22f4]) by HK2PR06MB3507.apcprd06.prod.outlook.com
 ([fe80::94f:c55a:f9c8:22f4%5]) with mapi id 15.20.3477.028; Thu, 29 Oct 2020
 01:33:20 +0000
From:   =?utf-8?B?Q2FybCBZaW4o5q635byg5oiQKQ==?= <carl.yin@quectel.com>
To:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>
CC:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Naveen Kumar" <naveen.kumar@quectel.com>
Subject: =?utf-8?B?562U5aSNOiDnrZTlpI06IFtQQVRDSF0gYnVzOiBtaGk6IGNvcmU6IEludHJv?=
 =?utf-8?Q?duce_sysfs_ul_chan_id_for_mhi_chan_device?=
Thread-Topic: =?utf-8?B?562U5aSNOiBbUEFUQ0hdIGJ1czogbWhpOiBjb3JlOiBJbnRyb2R1Y2Ugc3lz?=
 =?utf-8?Q?fs_ul_chan_id_for_mhi_chan_device?=
Thread-Index: AQHWrEWe5sWUVc1dA0qVowrSV1H0aqmrjNUAgAB/3QCAACPhIIAA4QgAgAC7JLA=
Date:   Thu, 29 Oct 2020 01:33:20 +0000
Message-ID: <HK2PR06MB35071C83DBB6035E4E183CC286140@HK2PR06MB3507.apcprd06.prod.outlook.com>
References: <1cdcb3c25ef3781b3baa2d6943cea3ea@sslemail.net>
 <d041b002-7a2c-64be-f5bd-0988c3611503@codeaurora.org>
 <HK2PR06MB3507E92A9F5E24BC6FDA5FB586170@HK2PR06MB3507.apcprd06.prod.outlook.com>
 <ebd89efb-6927-20c6-765e-42a9ca9da211@codeaurora.org>
In-Reply-To: <ebd89efb-6927-20c6-765e-42a9ca9da211@codeaurora.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=quectel.com;
x-originating-ip: [203.93.254.85]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c3a1a451-0a54-4b51-af05-08d87baa9e2e
x-ms-traffictypediagnostic: HK0PR06MB2929:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR06MB292952ED539F67EF62D5937886140@HK0PR06MB2929.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0oZpqDqtN76jvbV+EKDMPIep401HX1DsvC3qelphR0UCCbzSxFyFn/lWX11eOA5XfhNinxUpj+RbJikK1mCDg+aP8F66GYWcvVW7KrzHVSMJtIlUucOxvvxoDToNddaJKut91almgVtOlcXtlQIhQ4Uyt/PGcitI8DZcpdJHLiCc/BELlKcoeq2Kidr8x61lK/Otvm1DkNHDQf4yoRuFQq9THiGZASfQqxgIhJODO574ifTUmzsz6Fxr1LcF60LpVwEONDIir5oUV6/3IyTGm7WMw/xdilAFcmXo2I3nB6ZUW8vjUoRHwC4Ia8BfZbS5
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK2PR06MB3507.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(376002)(396003)(366004)(39850400004)(64756008)(66446008)(6506007)(66476007)(53546011)(66556008)(26005)(7696005)(86362001)(224303003)(107886003)(5660300002)(8936002)(55016002)(52536014)(478600001)(76116006)(71200400001)(9686003)(186003)(316002)(54906003)(2906002)(4326008)(33656002)(110136005)(85182001)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: +l+24uxXE0zsUOGCx7OQs9dwOlGt9Sr7RzR803l+2YM3YBiRjZ2ppIoL2tspVMtLwckX++crWhOaINuDXAy7wnrLLfIXFcZqBW2im00/lcsw1FldPKnbcYciEyH1gjvrvMSLRADz0TaZaMTz/L5vf0++g2MZVMSRVhiIzVj6AjetsCY5U1hb9DcsoUmNQrY23IBcUMh9oAyS4N0I9f70y4HaU4XXV0+I8wJW809xuCuRW1gEzXRzCA57Cx4tOTC8FkFlPXTC4FHQM1P9jy8L9hVoqDBBguwQU1vxuao3y89nU+WC8lQdwOHs3xJG/rg+8s9LDTqYsTV8GkDE+hSKCE9733qPde/B8GsJ4BV96XwCxJ42LOw+BcHDIk480GzCpEP63xPuBZ0kLCeH6BI+edla0xDHyE1+4eVaNUKBOodty/X9YuReSQubE9051zXN8tbIs2zF7bpI5JMnCt0AmASGTQavNw8eTDYTMdEIKMy6ObLRQv3zVDwzXJO1HmaXCK6HuU8w+Mf1qzvY2zknF/+PcTtEPobglZXHiFDH4n4tv6L3sVRX+/e2lpIp5c8z8pz2nUFToQJKPYAZzG/17G7lTu4rOozYsCGleWdJmD5wMFPRIddSsGDIH4j+5og3Ng6z5n9qU1+yCy+h8gM+5w==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quectel.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3507.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a1a451-0a54-4b51-af05-08d87baa9e2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2020 01:33:20.0572
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7730d043-e129-480c-b1ba-e5b6a9f476aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yndCB2Z6lC14aZesTR0cCgQZ/jGRdX9ULvfmoWgON+M7wvjhdtLdG5CRoPRyzJj+s62o9DXsDzpmv5LGO9ahvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2929
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SGkgSmVmZnJleToNCg0KT24gT2N0b2JlciAyOCwgMjAyMCAxMDoxOCBQTSwgamh1Z28gd3JvdGU6
DQo+IE9uIDEwLzI3LzIwMjAgNzoxOCBQTSwgQ2FybCBZaW4o5q635byg5oiQKSB3cm90ZToNCj4g
PiBIaSBKZWZmZXJ5IGFuZCBIZW1hbnQ6DQo+ID4NCj4gPiBPbiBXZWRuZXNkYXksIE9jdG9iZXIg
MjgsIDIwMjAgNjo0NCBBTSwgaGVtYW50ayB3cm90ZToNCj4gPj4gT24gMTAvMjcvMjAgODowNiBB
TSwgSmVmZnJleSBIdWdvIHdyb3RlOg0KPiA+PiBIaSBDYXJsLA0KPiA+Pg0KPiA+PiBPbiAxMC8y
Ny8yMCA4OjA2IEFNLCBKZWZmcmV5IEh1Z28gd3JvdGU6DQo+ID4+PiBPbiAxMC8yNy8yMDIwIDM6
NDMgQU0sIGNhcmwueWluQHF1ZWN0ZWwuY29tIHdyb3RlOg0KPiA+Pj4+IEZyb206ICJjYXJsLnlp
biIgPGNhcmwueWluQHF1ZWN0ZWwuY29tPg0KPiA+Pj4+DQo+ID4+Pj4gVXNlciBzcGFjZSBzb2Z0
d2FyZSBsaWtlIE1vZGVtTWFuYWdlciBjYW4gaWRlbnRpZnkgdGhlIGZ1bmN0aW9uIG9mDQo+ID4+
Pj4gdGhlIG1oaSBjaGFuIGRldmljZSBieSB1bF9jaGFuX2lkLg0KPiA+Pj4+DQo+ID4+Pj4gU2ln
bmVkLW9mZi1ieTogY2FybC55aW4gPGNhcmwueWluQHF1ZWN0ZWwuY29tPg0KPiA+Pj4+IC0tLQ0K
PiA+Pj4+ICDCoCBEb2N1bWVudGF0aW9uL0FCSS9zdGFibGUvc3lzZnMtYnVzLW1oaSB8IDEwICsr
KysrKysrKysNCj4gPj4+PiAgwqAgZHJpdmVycy9idXMvbWhpL2NvcmUvaW5pdC5jwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8IDE1ICsrKysrKysrKysrKysrKw0KPiA+Pj4+ICDCoCAyIGZpbGVzIGNo
YW5nZWQsIDI1IGluc2VydGlvbnMoKykNCj4gPj4+Pg0KPiA+Pj4+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL0FCSS9zdGFibGUvc3lzZnMtYnVzLW1oaQ0KPiA+Pj4+IGIvRG9jdW1lbnRhdGlv
bi9BQkkvc3RhYmxlL3N5c2ZzLWJ1cy1taGkNCj4gPj4+PiBpbmRleCBlY2ZlNzY2Li42ZDUyNzY4
IDEwMDY0NA0KPiA+Pj4+IC0tLSBhL0RvY3VtZW50YXRpb24vQUJJL3N0YWJsZS9zeXNmcy1idXMt
bWhpDQo+ID4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9BQkkvc3RhYmxlL3N5c2ZzLWJ1cy1taGkN
Cj4gPj4+PiBAQCAtMTksMyArMTksMTMgQEAgRGVzY3JpcHRpb246wqDCoMKgIFRoZSBmaWxlIGhv
bGRzIHRoZSBPRU0gUEsgSGFzaA0KPiA+Pj4+IHZhbHVlIG9mIHRoZSBlbmRwb2ludCBkZXZpY2UN
Cj4gPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIHJlYWQgd2l0aG91dCBoYXZpbmcgdGhlIGRldmlj
ZSBwb3dlciBvbiBhdCBsZWFzdCBvbmNlLA0KPiA+Pj4+IHRoZSBmaWxlDQo+ID4+Pj4gIMKgwqDC
oMKgwqDCoMKgwqDCoCB3aWxsIHJlYWQgYWxsIDAncy4NCj4gPj4+PiAgwqAgVXNlcnM6wqDCoMKg
wqDCoMKgwqAgQW55IHVzZXJzcGFjZSBhcHBsaWNhdGlvbiBvciBjbGllbnRzIGludGVyZXN0ZWQg
aW4NCj4gPj4+PiBkZXZpY2UgaW5mby4NCj4gPj4+PiArDQo+ID4+Pj4gK1doYXQ6wqDCoMKgwqDC
oMKgwqAgL3N5cy9idXMvbWhpL2RldmljZXMvLi4uL3VsX2NoYW5faWQNCj4gPj4+PiArRGF0ZTrC
oMKgwqDCoMKgwqDCoCBOb3ZlbWJlciAyMDIwDQo+ID4+Pj4gK0tlcm5lbFZlcnNpb246wqDCoMKg
IDUuMTANCj4gPj4+PiArQ29udGFjdDrCoMKgwqAgQ2FybCBZaW4gPGNhcmwueWluQHF1ZWN0ZWwu
Y29tPg0KPiA+Pj4+ICtEZXNjcmlwdGlvbjrCoMKgwqAgVGhlIGZpbGUgaG9sZHMgdGhlIHVwbGlu
ayBjaGFuIGlkIG9mIHRoZSBtaGkgY2hhbg0KPiA+Pj4+IGRldmljZS4NCj4gPj4+PiArwqDCoMKg
wqDCoMKgwqAgVXNlciBzcGFjZSBzb2Z0d2FyZSBsaWtlIE1vZGVtTWFuYWdlciBjYW4gaWRlbnRp
ZnkgdGhlDQo+ID4+Pj4gZnVuY3Rpb24gb2YNCj4gPj4+PiArwqDCoMKgwqDCoMKgwqAgdGhlIG1o
aSBjaGFuIGRldmljZS4gSWYgdGhlIG1oaSBkZXZpY2UgaXMgbm90IGEgY2hhbg0KPiA+Pj4+ICtk
ZXZpY2UsDQo+ID4+Pj4gK8KgwqDCoMKgwqDCoMKgIGVnIG1oaSBjb250cm9sbGVyIGRldmljZSwg
dGhlIGZpbGUgcmVhZCAtMS4NCj4gPj4+PiArVXNlcnM6wqDCoMKgwqDCoMKgwqAgQW55IHVzZXJz
cGFjZSBhcHBsaWNhdGlvbiBvciBjbGllbnRzIGludGVyZXN0ZWQgaW4NCj4gPj4+PiBkZXZpY2Ug
aW5mby4NCj4gPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9idXMvbWhpL2NvcmUvaW5pdC5jDQo+
ID4+Pj4gYi9kcml2ZXJzL2J1cy9taGkvY29yZS9pbml0LmMgaW5kZXggYzZiNDNlOS4uYWM0YWE1
YyAxMDA2NDQNCj4gPj4+PiAtLS0gYS9kcml2ZXJzL2J1cy9taGkvY29yZS9pbml0LmMNCj4gPj4+
PiArKysgYi9kcml2ZXJzL2J1cy9taGkvY29yZS9pbml0LmMNCj4gPj4+PiBAQCAtMTA1LDkgKzEw
NSwyNCBAQCBzdGF0aWMgc3NpemVfdCBvZW1fcGtfaGFzaF9zaG93KHN0cnVjdCBkZXZpY2UNCj4g
Pj4+PiAqZGV2LA0KPiA+Pj4+ICDCoCB9DQo+ID4+Pj4gIMKgIHN0YXRpYyBERVZJQ0VfQVRUUl9S
TyhvZW1fcGtfaGFzaCk7DQo+ID4+Pj4gK3N0YXRpYyBzc2l6ZV90IHVsX2NoYW5faWRfc2hvdyhz
dHJ1Y3QgZGV2aWNlICpkZXYsDQo+ID4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwNCj4gPj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGNoYXIgKmJ1ZikNCj4gPj4+PiArew0KPiA+Pj4+ICvCoMKgwqAgc3Ry
dWN0IG1oaV9kZXZpY2UgKm1oaV9kZXYgPSB0b19taGlfZGV2aWNlKGRldik7DQo+ID4+Pj4gK8Kg
wqDCoCBpbnQgdWxfY2hhbl9pZCA9IC0xOw0KPiA+Pj4+ICsNCj4gPj4+PiArwqDCoMKgIGlmICht
aGlfZGV2LT51bF9jaGFuKQ0KPiA+Pj4+ICvCoMKgwqDCoMKgwqDCoCB1bF9jaGFuX2lkID0gbWhp
X2Rldi0+dWxfY2hhbl9pZDsNCj4gPj4+PiArDQo+ID4+Pj4gK8KgwqDCoCByZXR1cm4gc25wcmlu
dGYoYnVmLCBQQUdFX1NJWkUsICIlZFxuIiwgdWxfY2hhbl9pZCk7IH0gc3RhdGljDQo+ID4+Pj4g
K0RFVklDRV9BVFRSX1JPKHVsX2NoYW5faWQpOw0KPiA+Pj4+ICsNCj4gPj4+PiAgwqAgc3RhdGlj
IHN0cnVjdCBhdHRyaWJ1dGUgKm1oaV9kZXZfYXR0cnNbXSA9IHsNCj4gPj4+PiAgwqDCoMKgwqDC
oCAmZGV2X2F0dHJfc2VyaWFsX251bWJlci5hdHRyLA0KPiA+Pj4+ICDCoMKgwqDCoMKgICZkZXZf
YXR0cl9vZW1fcGtfaGFzaC5hdHRyLA0KPiA+Pj4+ICvCoMKgwqAgJmRldl9hdHRyX3VsX2NoYW5f
aWQuYXR0ciwNCj4gPj4+PiAgwqDCoMKgwqDCoCBOVUxMLA0KPiA+Pj4+ICDCoCB9Ow0KPiA+Pj4+
ICDCoCBBVFRSSUJVVEVfR1JPVVBTKG1oaV9kZXYpOw0KPiA+Pj4+DQo+ID4+Pg0KPiA+Pj4gTkFD
Sw0KPiA+Pj4NCj4gPj4+IENoYW5uZWwgSUQgaXMgYSBkZXZpY2Ugc3BlY2lmaWMgZGV0YWlsLsKg
IFVzZXJzcGFjZSBzaG91bGQgYmUgYmFzaW5nDQo+ID4+PiBkZWNpc2lvbnMgb24gdGhlIGNoYW5u
ZWwgbmFtZS4NCj4gPj4+DQo+ID4+IEkgYWdyZWUgd2l0aCBKZWZmLCB3aHkgZG8geW91IG5lZWQg
dG8ga25vdyB0aGUgY2hhbm5lbCBpZCwgaWYgeW91DQo+ID4+IG5lZWQgdG8gcG9sbCBmb3IgYW55
IGRldmljZSBub2RlIHRvIGdldCBjcmVhdGVkIHlvdSBjYW4gdHJ5IHRvIG9wZW4NCj4gPj4gdGhl
IGRldmljZSBub2RlIGZyb20gdXNlciBzcGFjZSBhbmQgd2FpdCB1bnRpbCB0aGUgZGV2aWNlIGdl
dHMgb3BlbmVkLg0KPiA+PiBBcmUgeW91IHRyeWluZyB0byB3YWl0IGZvciBFREwgY2hhbm5lbHMg
dG8gZ2V0IHN0YXJ0ZWQgdXNpbmcgVUNJID8NCj4gPiBbY2FybC55aW5dIEluIG15IG9waW5pb24s
IG1oaSBjaGFuIGlkIGlzIHNvbWV0aGluZyBsaWtlICdiSW50ZXJmYWNlTnVtYmVyJyBvZg0KPiBV
U0IgZGV2aWNlLg0KPiA+IEEgVVNCIGRldmljZSBhbmQgc2V2ZXJhbCBVU0IgaW50ZXJmYWNlcywg
YW5kIGEgbWhpIGRldmljZXMgaGF2ZSAxMjggbWhpDQo+IGNoYW5zLg0KPiA+IENoYW4gaWQgaXMg
YSBwaHlzaWNhbCBhdHRyaWJ1dGUgb2Ygb25lIG1oaSBjaGFuLg0KPiA+DQo+ID4gTmV4dCBpcyB0
aGUgdWRldiBpbmZvIG9mIG9uZSBtaGkgY2hhbjoNCj4gPiAjIHVkZXZhZG0gaW5mbyAtYSAvZGV2
L21oaV8wMDAwXDowM1w6MDAuMF9FREwNCj4gPiAgICBsb29raW5nIGF0IHBhcmVudCBkZXZpY2UN
Cj4gJy9kZXZpY2VzL3BjaTAwMDA6MDAvMDAwMDowMDoxZC4wLzAwMDA6MDM6MDAuMC8wMDAwOjAz
OjAwLjBfRURMJzoNCj4gPiAgICAgIEtFUk5FTFM9PSIwMDAwOjAzOjAwLjBfRURMIg0KPiA+ICAg
ICAgU1VCU1lTVEVNUz09Im1oaSINCj4gPiAgICAgIERSSVZFUlM9PSJtaGlfdWNpIg0KPiA+ICAg
ICAgQVRUUlN7c2VyaWFsX251bWJlcn09PSJTZXJpYWwgTnVtYmVyOiAyNjQ0NDgxMTgyIg0KPiA+
ICAgICAgQVRUUlN7dWxfY2hhbl9pZH09PSIzNCINCj4gPg0KPiA+IElmIG5vIHVsX2NoYW5faWQs
IHRoZSB1ZGV2IHJ1bGVyIHdpbGwgYmUgJyBLRVJORUw9PSIqX0VETCIgJw0KPiANCj4gSSBoYXZl
IHNldmVyYWwgdXNlY2FzZXMgd2hlcmUgdGhpcyB3b3JrcyBqdXN0IGZpbmUgdG9kYXkuDQo+IA0K
PiA+IFdpdGggdWxfY2hhbl9pZCwgdGhlIHVkZXYgcnVsZXIgd2lsbCBiZSAnIEFUVFJTe3VsX2No
YW5faWR9PT0iMzQiJw0KPiANCj4gVGhpcyBicmVha3Mgd2hlbiB0aGVyZSBpcyBzb21lIG5ldyBk
ZXZpY2UgdGhhdCBoYXMgdGhlIEVETCBjaGFubmVsIG9uIHNvbWUNCj4gZGlmZmVyZW50IGNoYW5f
aWQsIGxpa2UgNy4gIFRoZSBhYm92ZSBkb2VzIG5vdC4gIEFkZGl0aW9uYWxseSBpZiB0aGVyZSBp
cyBhDQo+IGRpZmZlcmVudCBkZXZpY2UgdGhhdCBpcyB1c2luZyBjaGFuX2lkIDM0IGZvciBhIGRp
ZmZlcmVudCBwdXJwb3NlLCBzYXkgRGlhZywgdGhlbg0KPiB5b3VyIHVkZXYgcnVsZSBhbHNvIGJy
ZWFrcy4NCj4gDQo+IFRoZSBuYW1lIG9mIHRoZSBjaGFubmVsIGlzIHRoZSBpbnRlcmZhY2UgdG8g
dGhlIGNoYW5uZWwuICBOb3QgdGhlIGNoYW5faWQuICBUaGlzDQo+IGhvbGRzIHRydWUgd2l0aGlu
IHRoZSBrZXJuZWwsIGFuZCBzaG91bGQgYmUgdGhlIHNhbWUgZm9yIHVzZXJzcGFjZS4gIEkgc3Rp
bGwNCj4gb3Bwb3NlIHRoaXMgY2hhbmdlLg0KW2NhcmwueWluXSBvaywgSSBhZ3JlZSB0aGF0IGNo
YW4gaWQgaXMgbm90IGEgZ29vZCBhbmQgbmVjZXNzYXJ5IGNob2ljZS4NCglNb2RlbU1hbmFnZXIg
YWxzbyB3b3JrIHdlbGwgd2l0aCAnIEtFUk5FTD09Im1oaV8qXzxjaGFuIG5hbWU+IicuDQo+IA0K
PiAtLQ0KPiBKZWZmcmV5IEh1Z28NCj4gUXVhbGNvbW0gVGVjaG5vbG9naWVzLCBJbmMuIGlzIGEg
bWVtYmVyIG9mIHRoZSBDb2RlIEF1cm9yYSBGb3J1bSwgYSBMaW51eA0KPiBGb3VuZGF0aW9uIENv
bGxhYm9yYXRpdmUgUHJvamVjdC4NCg==
