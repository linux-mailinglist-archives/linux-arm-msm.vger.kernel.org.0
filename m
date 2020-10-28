Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B66F29D435
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Oct 2020 22:50:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbgJ1VuB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Oct 2020 17:50:01 -0400
Received: from mail-eopbgr1300073.outbound.protection.outlook.com ([40.107.130.73]:19017
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727978AbgJ1VuA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Oct 2020 17:50:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NXugg22pNcLb5WBfFLMwdIdz8CXoDPXU9tdoDD2OsZbI5CNehZRJ7+n2ndkRcBdDuqoOwRDLqRyqBZP3tFeMfUT139OAJKbWXoe6VAl38tSbuLyLOdWaOEErtX+itEgDNzv+zqEC04HsnfgPpCBrV6PcoGdOy/LSiru7ODsaTjBfZvVypVu1vyQxo1yU+ppJdsyMN+yC8B8YCfDRr/6nWccKJxa2V822voV6x/w5/2cq9vKF4by6PQtGUzPFxFv+zEMC2lcNjq7Tq3aBAbMxAe0+TeaBe36TA4JTGmcxcucBaCRQdtII1YCbBMLQZBy8qLH1jQMWo87OVV07dRke0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N5fNZ4Hm9C/FkARNoRqoHGurDbBPDFXwCqwHfp1EyQ8=;
 b=AutSrf4tGYleAnIhgTCDSxIcioq7Uv9nEp+xP0rEmNnRdlMaACHR4OzKUbzSCAIhIHkdjtpTgPZ59WIQtg9Byi3iDuZImXbAhBJIpvIrn/w5JgTnGc3vQN7Yj+r1VNoY4PycCgmPKSjlFpM0oFd3JEpBfapnNGDsd2lYWMquBPSo5z+Jk9EMXHrHkhABk8OXSPn8HecnYlkLIE3NVzwX/O2BNwKLMS0KRFuQ+xWePxuwIPUKgoeLF/KyTcPM+ZBfZKFZBkzbCo1mFzyUO8F6ftU+nsybOfiOOeQ+LAsvaJ9eh3K6Kr/Q5GcMXqmQPgUydJCWfDbbP+tsCZaWdVrCcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quectel.com; dmarc=pass action=none header.from=quectel.com;
 dkim=pass header.d=quectel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quectel.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N5fNZ4Hm9C/FkARNoRqoHGurDbBPDFXwCqwHfp1EyQ8=;
 b=PmKlZ3Ag8wzn7TqKN9BWAItXHFBgds1byhjSUKHzBvrsndL+p8jB6HDq1xTfE7oORO9rp3grvhcxuGNR9WLHBHryXmA8N2oWH7VylnWyeX1UBtEk7/6L2cQFY6/JIXDz10iOJAhWFeOUBjPTiOvDdJalQeZyN+Xmm0kh1V9MPMc=
Received: from HK2PR06MB3507.apcprd06.prod.outlook.com (2603:1096:202:3e::14)
 by HK0PR06MB3009.apcprd06.prod.outlook.com (2603:1096:203:8d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 28 Oct
 2020 01:18:27 +0000
Received: from HK2PR06MB3507.apcprd06.prod.outlook.com
 ([fe80::94f:c55a:f9c8:22f4]) by HK2PR06MB3507.apcprd06.prod.outlook.com
 ([fe80::94f:c55a:f9c8:22f4%5]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 01:18:27 +0000
From:   =?utf-8?B?Q2FybCBZaW4o5q635byg5oiQKQ==?= <carl.yin@quectel.com>
To:     Hemant Kumar <hemantk@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>
CC:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Naveen Kumar" <naveen.kumar@quectel.com>
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0hdIGJ1czogbWhpOiBjb3JlOiBJbnRyb2R1Y2Ugc3lz?=
 =?utf-8?Q?fs_ul_chan_id_for_mhi_chan_device?=
Thread-Topic: [PATCH] bus: mhi: core: Introduce sysfs ul chan id for mhi chan
 device
Thread-Index: AQHWrEWe5sWUVc1dA0qVowrSV1H0aqmrjNUAgAB/3QCAACPhIA==
Date:   Wed, 28 Oct 2020 01:18:27 +0000
Message-ID: <HK2PR06MB3507E92A9F5E24BC6FDA5FB586170@HK2PR06MB3507.apcprd06.prod.outlook.com>
References: <1cdcb3c25ef3781b3baa2d6943cea3ea@sslemail.net>
 <d041b002-7a2c-64be-f5bd-0988c3611503@codeaurora.org>
In-Reply-To: <d041b002-7a2c-64be-f5bd-0988c3611503@codeaurora.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=quectel.com;
x-originating-ip: [203.93.254.85]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8a32b1c5-d1ba-4bd2-cdc6-08d87adf5fb7
x-ms-traffictypediagnostic: HK0PR06MB3009:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR06MB3009D95125168A99E764A83C86170@HK0PR06MB3009.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ldhC4+SjjHsZrdHY6HpHkxp7x/BILaQ7YntecjsqAoD3usDzflrF/Z5hh5RI5Q/CmQbvDUaG1jik46wGx7oCE+mu2yhylFxIY2h7Fyn7TP4tnU82xaJXFsJMBgdjQTudcoA4mMzGXKNSF2YnpNh5xPJF/4DiGMyKleBvNdtIeFvVc97VR8T+8OEL4jENLYdPZa3ai2ndewVt9au6YJdk3TuI8foIYPQTQPGJdLQWCjbV2QKu4WeXCo1DwBQv5nPeWuO+CXqBtLDWTgoBlrYNx3rCq29m+d7BB556vu2/8POM3KMaF2AJBvcWiuF5K7u5
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK2PR06MB3507.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(366004)(376002)(396003)(39850400004)(224303003)(5660300002)(53546011)(66476007)(26005)(66446008)(66556008)(64756008)(478600001)(54906003)(76116006)(85182001)(66946007)(110136005)(316002)(186003)(8936002)(55016002)(7696005)(71200400001)(33656002)(2906002)(52536014)(4326008)(9686003)(86362001)(107886003)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: IWNNqcbYeBWLkN/fBThbxyNgLUpj73d6AQbjS5j3Q5xm23FQuYCJm9wsHadXarCKLK011sxNLVx1/A+Ag2Nn0OtzSQ1jOa1Yf9brycfV6bDd3RIRCiyzcfUD2x2MfB7Z4QXeb2Pb39Q47GRelQROzUnX1HFFrTuElgmJFTCVhJzhqyMtZ6wb8SS0Y9IaWIjytgbwZdi4El5zQrNhY6KTYEj3qppi/l4Xeqg+yat+eKsupJP9eapLWnRhi3H6f/y/TXkHFjgO2Wy/gxcbs6LAGP5QJXdj16gqARpJZztMEmUKTn7VqvsW++Ve2f2lzdXVR2dbtCh0KNR9txCLqe2DuN1EdKxDGZbn9QXrpnLELURcVsGOztJAmIPt9PBRraV3pIEbJsMqMNimdojr3MhKjkUrdKzqoozxalEh8BmUyzdOIiNpB4ypJgfTHIusRiiufVZQRTSkEKB+7spZH9ISnhPCXjguC+ybu9bNBWqKdhBZMnWSmlxsCSU6za6XrpkOd2I47Z6sOVq7zlQgGhgL8hlQw7JQVjCXh5qaavUp/dT0hsH+xgtTMYO1y8Vk5flqCSeFZGTtUj+TLP5vApslO+wTTTyZFFW3B1rjrHB7uK32vGxZEiiylaTIKZ0xf2VXi66bydqG3tXILjMZp7c8fA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quectel.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3507.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a32b1c5-d1ba-4bd2-cdc6-08d87adf5fb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2020 01:18:27.4212
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7730d043-e129-480c-b1ba-e5b6a9f476aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: svOIDDl1O8yjsvz232jfWBCjPsPaeST0ZTSlLAL5ppejZHHSJk+ewMcyoKbG8Vf5Lykf2//XvPLYEqvtABziHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB3009
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SGkgSmVmZmVyeSBhbmQgSGVtYW50Og0KDQpPbiBXZWRuZXNkYXksIE9jdG9iZXIgMjgsIDIwMjAg
Njo0NCBBTSwgaGVtYW50ayB3cm90ZToNCj4gT24gMTAvMjcvMjAgODowNiBBTSwgSmVmZnJleSBI
dWdvIHdyb3RlOg0KPiBIaSBDYXJsLA0KPiANCj4gT24gMTAvMjcvMjAgODowNiBBTSwgSmVmZnJl
eSBIdWdvIHdyb3RlOg0KPiA+IE9uIDEwLzI3LzIwMjAgMzo0MyBBTSwgY2FybC55aW5AcXVlY3Rl
bC5jb20gd3JvdGU6DQo+ID4+IEZyb206ICJjYXJsLnlpbiIgPGNhcmwueWluQHF1ZWN0ZWwuY29t
Pg0KPiA+Pg0KPiA+PiBVc2VyIHNwYWNlIHNvZnR3YXJlIGxpa2UgTW9kZW1NYW5hZ2VyIGNhbiBp
ZGVudGlmeSB0aGUgZnVuY3Rpb24gb2YNCj4gPj4gdGhlIG1oaSBjaGFuIGRldmljZSBieSB1bF9j
aGFuX2lkLg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBjYXJsLnlpbiA8Y2FybC55aW5AcXVl
Y3RlbC5jb20+DQo+ID4+IC0tLQ0KPiA+PiDCoCBEb2N1bWVudGF0aW9uL0FCSS9zdGFibGUvc3lz
ZnMtYnVzLW1oaSB8IDEwICsrKysrKysrKysNCj4gPj4gwqAgZHJpdmVycy9idXMvbWhpL2NvcmUv
aW5pdC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDE1ICsrKysrKysrKysrKysrKw0KPiA+PiDC
oCAyIGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKykNCj4gPj4NCj4gPj4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vQUJJL3N0YWJsZS9zeXNmcy1idXMtbWhpDQo+ID4+IGIvRG9jdW1l
bnRhdGlvbi9BQkkvc3RhYmxlL3N5c2ZzLWJ1cy1taGkNCj4gPj4gaW5kZXggZWNmZTc2Ni4uNmQ1
Mjc2OCAxMDA2NDQNCj4gPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9BQkkvc3RhYmxlL3N5c2ZzLWJ1
cy1taGkNCj4gPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9BQkkvc3RhYmxlL3N5c2ZzLWJ1cy1taGkN
Cj4gPj4gQEAgLTE5LDMgKzE5LDEzIEBAIERlc2NyaXB0aW9uOsKgwqDCoCBUaGUgZmlsZSBob2xk
cyB0aGUgT0VNIFBLIEhhc2gNCj4gPj4gdmFsdWUgb2YgdGhlIGVuZHBvaW50IGRldmljZQ0KPiA+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmVhZCB3aXRob3V0IGhhdmluZyB0aGUgZGV2aWNlIHBvd2Vy
IG9uIGF0IGxlYXN0IG9uY2UsIHRoZQ0KPiA+PiBmaWxlDQo+ID4+IMKgwqDCoMKgwqDCoMKgwqDC
oCB3aWxsIHJlYWQgYWxsIDAncy4NCj4gPj4gwqAgVXNlcnM6wqDCoMKgwqDCoMKgwqAgQW55IHVz
ZXJzcGFjZSBhcHBsaWNhdGlvbiBvciBjbGllbnRzIGludGVyZXN0ZWQgaW4NCj4gPj4gZGV2aWNl
IGluZm8uDQo+ID4+ICsNCj4gPj4gK1doYXQ6wqDCoMKgwqDCoMKgwqAgL3N5cy9idXMvbWhpL2Rl
dmljZXMvLi4uL3VsX2NoYW5faWQNCj4gPj4gK0RhdGU6wqDCoMKgwqDCoMKgwqAgTm92ZW1iZXIg
MjAyMA0KPiA+PiArS2VybmVsVmVyc2lvbjrCoMKgwqAgNS4xMA0KPiA+PiArQ29udGFjdDrCoMKg
wqAgQ2FybCBZaW4gPGNhcmwueWluQHF1ZWN0ZWwuY29tPg0KPiA+PiArRGVzY3JpcHRpb246wqDC
oMKgIFRoZSBmaWxlIGhvbGRzIHRoZSB1cGxpbmsgY2hhbiBpZCBvZiB0aGUgbWhpIGNoYW4NCj4g
Pj4gZGV2aWNlLg0KPiA+PiArwqDCoMKgwqDCoMKgwqAgVXNlciBzcGFjZSBzb2Z0d2FyZSBsaWtl
IE1vZGVtTWFuYWdlciBjYW4gaWRlbnRpZnkgdGhlDQo+ID4+IGZ1bmN0aW9uIG9mDQo+ID4+ICvC
oMKgwqDCoMKgwqDCoCB0aGUgbWhpIGNoYW4gZGV2aWNlLiBJZiB0aGUgbWhpIGRldmljZSBpcyBu
b3QgYSBjaGFuIGRldmljZSwNCj4gPj4gK8KgwqDCoMKgwqDCoMKgIGVnIG1oaSBjb250cm9sbGVy
IGRldmljZSwgdGhlIGZpbGUgcmVhZCAtMS4NCj4gPj4gK1VzZXJzOsKgwqDCoMKgwqDCoMKgIEFu
eSB1c2Vyc3BhY2UgYXBwbGljYXRpb24gb3IgY2xpZW50cyBpbnRlcmVzdGVkIGluDQo+ID4+IGRl
dmljZSBpbmZvLg0KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9idXMvbWhpL2NvcmUvaW5pdC5j
DQo+ID4+IGIvZHJpdmVycy9idXMvbWhpL2NvcmUvaW5pdC5jIGluZGV4IGM2YjQzZTkuLmFjNGFh
NWMgMTAwNjQ0DQo+ID4+IC0tLSBhL2RyaXZlcnMvYnVzL21oaS9jb3JlL2luaXQuYw0KPiA+PiAr
KysgYi9kcml2ZXJzL2J1cy9taGkvY29yZS9pbml0LmMNCj4gPj4gQEAgLTEwNSw5ICsxMDUsMjQg
QEAgc3RhdGljIHNzaXplX3Qgb2VtX3BrX2hhc2hfc2hvdyhzdHJ1Y3QgZGV2aWNlDQo+ID4+ICpk
ZXYsDQo+ID4+IMKgIH0NCj4gPj4gwqAgc3RhdGljIERFVklDRV9BVFRSX1JPKG9lbV9wa19oYXNo
KTsNCj4gPj4gK3N0YXRpYyBzc2l6ZV90IHVsX2NoYW5faWRfc2hvdyhzdHJ1Y3QgZGV2aWNlICpk
ZXYsDQo+ID4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRldmljZV9h
dHRyaWJ1dGUgKmF0dHIsDQo+ID4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2hh
ciAqYnVmKQ0KPiA+PiArew0KPiA+PiArwqDCoMKgIHN0cnVjdCBtaGlfZGV2aWNlICptaGlfZGV2
ID0gdG9fbWhpX2RldmljZShkZXYpOw0KPiA+PiArwqDCoMKgIGludCB1bF9jaGFuX2lkID0gLTE7
DQo+ID4+ICsNCj4gPj4gK8KgwqDCoCBpZiAobWhpX2Rldi0+dWxfY2hhbikNCj4gPj4gK8KgwqDC
oMKgwqDCoMKgIHVsX2NoYW5faWQgPSBtaGlfZGV2LT51bF9jaGFuX2lkOw0KPiA+PiArDQo+ID4+
ICvCoMKgwqAgcmV0dXJuIHNucHJpbnRmKGJ1ZiwgUEFHRV9TSVpFLCAiJWRcbiIsIHVsX2NoYW5f
aWQpOyB9IHN0YXRpYw0KPiA+PiArREVWSUNFX0FUVFJfUk8odWxfY2hhbl9pZCk7DQo+ID4+ICsN
Cj4gPj4gwqAgc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKm1oaV9kZXZfYXR0cnNbXSA9IHsNCj4g
Pj4gwqDCoMKgwqDCoCAmZGV2X2F0dHJfc2VyaWFsX251bWJlci5hdHRyLA0KPiA+PiDCoMKgwqDC
oMKgICZkZXZfYXR0cl9vZW1fcGtfaGFzaC5hdHRyLA0KPiA+PiArwqDCoMKgICZkZXZfYXR0cl91
bF9jaGFuX2lkLmF0dHIsDQo+ID4+IMKgwqDCoMKgwqAgTlVMTCwNCj4gPj4gwqAgfTsNCj4gPj4g
wqAgQVRUUklCVVRFX0dST1VQUyhtaGlfZGV2KTsNCj4gPj4NCj4gPg0KPiA+IE5BQ0sNCj4gPg0K
PiA+IENoYW5uZWwgSUQgaXMgYSBkZXZpY2Ugc3BlY2lmaWMgZGV0YWlsLsKgIFVzZXJzcGFjZSBz
aG91bGQgYmUgYmFzaW5nDQo+ID4gZGVjaXNpb25zIG9uIHRoZSBjaGFubmVsIG5hbWUuDQo+ID4N
Cj4gSSBhZ3JlZSB3aXRoIEplZmYsIHdoeSBkbyB5b3UgbmVlZCB0byBrbm93IHRoZSBjaGFubmVs
IGlkLCBpZiB5b3UgbmVlZCB0byBwb2xsIGZvcg0KPiBhbnkgZGV2aWNlIG5vZGUgdG8gZ2V0IGNy
ZWF0ZWQgeW91IGNhbiB0cnkgdG8gb3BlbiB0aGUgZGV2aWNlIG5vZGUgZnJvbSB1c2VyDQo+IHNw
YWNlIGFuZCB3YWl0IHVudGlsIHRoZSBkZXZpY2UgZ2V0cyBvcGVuZWQuDQo+IEFyZSB5b3UgdHJ5
aW5nIHRvIHdhaXQgZm9yIEVETCBjaGFubmVscyB0byBnZXQgc3RhcnRlZCB1c2luZyBVQ0kgPw0K
W2NhcmwueWluXSBJbiBteSBvcGluaW9uLCBtaGkgY2hhbiBpZCBpcyBzb21ldGhpbmcgbGlrZSAn
YkludGVyZmFjZU51bWJlcicgb2YgVVNCIGRldmljZS4NCkEgVVNCIGRldmljZSBhbmQgc2V2ZXJh
bCBVU0IgaW50ZXJmYWNlcywgYW5kIGEgbWhpIGRldmljZXMgaGF2ZSAxMjggbWhpIGNoYW5zLg0K
Q2hhbiBpZCBpcyBhIHBoeXNpY2FsIGF0dHJpYnV0ZSBvZiBvbmUgbWhpIGNoYW4uDQoNCk5leHQg
aXMgdGhlIHVkZXYgaW5mbyBvZiBvbmUgbWhpIGNoYW46DQojIHVkZXZhZG0gaW5mbyAtYSAvZGV2
L21oaV8wMDAwXDowM1w6MDAuMF9FREwNCiAgbG9va2luZyBhdCBwYXJlbnQgZGV2aWNlICcvZGV2
aWNlcy9wY2kwMDAwOjAwLzAwMDA6MDA6MWQuMC8wMDAwOjAzOjAwLjAvMDAwMDowMzowMC4wX0VE
TCc6DQogICAgS0VSTkVMUz09IjAwMDA6MDM6MDAuMF9FREwiDQogICAgU1VCU1lTVEVNUz09Im1o
aSINCiAgICBEUklWRVJTPT0ibWhpX3VjaSINCiAgICBBVFRSU3tzZXJpYWxfbnVtYmVyfT09IlNl
cmlhbCBOdW1iZXI6IDI2NDQ0ODExODIiDQogICAgQVRUUlN7dWxfY2hhbl9pZH09PSIzNCINCg0K
SWYgbm8gdWxfY2hhbl9pZCwgdGhlIHVkZXYgcnVsZXIgd2lsbCBiZSAnIEtFUk5FTD09IipfRURM
IiAnDQpXaXRoIHVsX2NoYW5faWQsIHRoZSB1ZGV2IHJ1bGVyIHdpbGwgYmUgJyBBVFRSU3t1bF9j
aGFuX2lkfT09IjM0IicNCkkgdGhpbmsgdGhlIGxhdHRlciBpcyBtb3JlIGJldHRlci4NCg0KPiAN
Cj4gVGhhbmtzLA0KPiBIZW1hbnQNCj4gLS0NCj4gVGhlIFF1YWxjb21tIElubm92YXRpb24gQ2Vu
dGVyLCBJbmMuIGlzIGEgbWVtYmVyIG9mIHRoZSBDb2RlIEF1cm9yYSBGb3J1bSwgYQ0KPiBMaW51
eCBGb3VuZGF0aW9uIENvbGxhYm9yYXRpdmUgUHJvamVjdA0K
