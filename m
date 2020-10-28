Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF7E29D384
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Oct 2020 22:44:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725838AbgJ1Voi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Oct 2020 17:44:38 -0400
Received: from mail-eopbgr1320080.outbound.protection.outlook.com ([40.107.132.80]:10400
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726026AbgJ1Vog (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Oct 2020 17:44:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SNKv/JGvjzukOL1SiASZJyv/4r9rBbVt/vgKKaqGzEPVoRjvgWTsmEqQ6r86r1F4A0wwjfBlqFePkHOesHdQcxU1zUsHug8SVitx1VEqowDsyjfBd+Bp4l9pdSaO3pxPb7+VWyfMwuPbEJIUZwtQMwd1Cw/xkEITAGgPDjTG7LuAgUbS77h+nMYKUh9+VwOmYSBuURL/hJxIEGH591GL+ICs74IYSfUz9azpJwTfJiUgmAX02bIaL+gwj08ZQkpHQK60DHEUSex+tC0ZQf8Rq15oB1ls/scH+ZAyXP7NyK+lGeJsCgRbdqsOhBHtS8zFu4Ymp7Mxwlhg7rXT9nlMTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MuXAES6Sq3zpWBUUFq/5BoxwqacUq1Ib/cfG87+unIw=;
 b=kjKHbXpb/TWiyGqPjDuNnYDnk8sLlDLt00TR8ftYXEsGcB+/JxXkuUASOEIdMwxmc7PmPfig09Y5mvTcCMHdwJAc7mbDkZe4j91ZiLRpt1d4s53XnA7KG/4m6ceAZPD7ZBV7D3ygTKlr49SW1s+CL1LP1VmCPZtcNbJ3nyL9jJ/ImOGOWiF5TQ29ssYxQXdmWXNNZffrZnoIQyGRUhqnYKsZhXn1Pk8r9JRe2jPVtKX4YHDUyOUfwUYu4KdQnwZPtdahZpSerCZLvwj59NTISzAKFXkgNuFkcWDC6BrEORe2b8d08gI4qLhv8MCB3St1MwP8uP6zM+P567B/Xa4Osg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quectel.com; dmarc=pass action=none header.from=quectel.com;
 dkim=pass header.d=quectel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quectel.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MuXAES6Sq3zpWBUUFq/5BoxwqacUq1Ib/cfG87+unIw=;
 b=W0o99FrLHxwdD3OCtts5SgzhJI9sp8Qj7ZpeARVchsteQW6WiT9eP2aHJUUBU5zcY40wuAI8xjTmcaafieqHqHq+coGVPeYR4d5+cpHMYcbKjvHet3ECYk5p2SS5i8sNyTmCZJXT73SRBOI046nbvmK0az941MIXYUGyjmba4q0=
Received: from HK2PR06MB3507.apcprd06.prod.outlook.com (2603:1096:202:3e::14)
 by HK2PR0601MB1875.apcprd06.prod.outlook.com (2603:1096:202:9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Wed, 28 Oct
 2020 02:03:48 +0000
Received: from HK2PR06MB3507.apcprd06.prod.outlook.com
 ([fe80::94f:c55a:f9c8:22f4]) by HK2PR06MB3507.apcprd06.prod.outlook.com
 ([fe80::94f:c55a:f9c8:22f4%5]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 02:03:48 +0000
From:   =?gb2312?B?Q2FybCBZaW4o0vPVxbPJKQ==?= <carl.yin@quectel.com>
To:     "bbhatt@codeaurora.org" <bbhatt@codeaurora.org>
CC:     "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "hemantk@codeaurora.org" <hemantk@codeaurora.org>,
        "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Naveen Kumar" <naveen.kumar@quectel.com>
Subject: =?gb2312?B?tPC4tDogW1BBVENIXSBidXM6IG1oaTogY29yZTogRml4IG51bGwgcG9pbnRl?=
 =?gb2312?Q?r_access?=
Thread-Topic: [PATCH] bus: mhi: core: Fix null pointer access
Thread-Index: AQHWrCKyt8Jj5Txhr0KdL/hEL5jjUqmsM7YAgAAPx0A=
Date:   Wed, 28 Oct 2020 02:03:48 +0000
Message-ID: <HK2PR06MB3507360AE3E2D14FA9DE90C286170@HK2PR06MB3507.apcprd06.prod.outlook.com>
References: <41058752035efde392e1c55d0fd5b58c@sslemail.net>
 <b3bf32de1f3580210ebad6c4b2c7a802@codeaurora.org>
In-Reply-To: <b3bf32de1f3580210ebad6c4b2c7a802@codeaurora.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=quectel.com;
x-originating-ip: [203.93.254.85]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c89fce90-0e7c-4977-52fa-08d87ae5b56c
x-ms-traffictypediagnostic: HK2PR0601MB1875:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK2PR0601MB1875871FBF7417C1B007748B86170@HK2PR0601MB1875.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:546;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rqtxl8If+YxiWNTh7U5/mIZlttFHgYGDgTAPMTjCERpgrywnaUe42fYPXiZWKLPsZ9of9ZTpXaPCA5Ez8s8YWjXIIxYpFZKAc7v6KBvrwAXYDdSFG048SVmeMLweNQZhhLY/W675lKuhpnkdcZPueENsl9y/NsAfE5jyfUct5J4RYsDc455qOMcz9MjDPto7jXFNTWvRzL5LyzDzxxLj2fqZMv9yYooJ5KF30UahXHanVhOCrwxIpALcAc0SwET6Ou6kTUaHDzNuMdN41VXUQo0K4hUITJUxO4oiS5MCdP43yTO2hKFqyAZX1HP1OSYgNX2vz4mFGPDZMluU4qXYqg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK2PR06MB3507.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(396003)(136003)(39850400004)(366004)(76116006)(26005)(5660300002)(66946007)(71200400001)(55016002)(66556008)(4326008)(66476007)(86362001)(9686003)(224303003)(186003)(316002)(33656002)(8936002)(478600001)(52536014)(2906002)(6916009)(85182001)(6506007)(53546011)(4001150100001)(107886003)(83380400001)(66446008)(64756008)(7696005)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: lO/kdepE3bPDCcvyKzAeklUH4mQ2p7JkV3Z29X1qBsy0Tmnxi/fNQ7q3is34ctAVBGt3cyTySYg/EtzmjgqnkBQtzf+iT4uixuLGPAxHgL2gRGTRmLdGkpfqCsddnVSY3FxiEgaAQqUMXgTvSL3KKsjQ71D3duJ1Fw9RamHLkNogroUsRGJpWobeka9UmLo+2ZHGbozSlYesxSLDbn3RY5xaUZhzzaaRZQN93gXi71/9Ah+sFQ/WXY8yXPkLYbqhCrqrTEcofZvPNKpXihC0JS/tD+4HUOOGcni44qwGUeN1pISGzZJ9+8AbjY/heru1yKfXKaPIFXmMc1ti/E/K08fHkmSeuy1u4BsCIShb88HGVCH8nYa2mnAi+R+GTCoiPd7gKOjPpkAIcxFGBfMTd9YjhgZY8jZfzcbgza+kwXPUDdsTDiycbh338sPtzXnuTlciywgkzFRPZHjZloORAzjS/Glf4cID5lLXyQnyO923epTq1BVKY5q++DDyk2/BLlvestygXM3jtQO6p/6CoTtE+VafxHL2A3A0qifMStRJA8qY52w4L8J0v0b9DL8BfSy8CC5plqY+w9v0aFYDDy5dkGjo+OqlqyrjnMiyib9X3FuUXQ4vE6MTdvzASI+6hztuyLkzC3woDBTPOdkcZA==
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3507.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c89fce90-0e7c-4977-52fa-08d87ae5b56c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2020 02:03:48.2300
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7730d043-e129-480c-b1ba-e5b6a9f476aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +22PTIFN9pIhL4sM4+LwYAFlCLRf/maZUc6uPDazO4usp3buozRT6T8fwf2vp+vTYuT167JKw4DxKHUhbg130w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0601MB1875
X-OriginatorOrg: quectel.com
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SGkgYmJoYXR0Og0KDQpPbiBXZWRuZXNkYXksIE9jdG9iZXIgMjgsIDIwMjAgOTowMiBBTSwgYmJo
YXR0IHdyb3RlOg0KDQo+IEhpIENhcmwsDQo+IA0KPiBZZXMgdGhpcyBjaGFuZ2UgaXMgbmVlZGVk
LiBHb29kIGNhdGNoLiBJIHJhbiBpbiB0byB0aGlzIGlzc3VlIGFzIHdlbGwgd2hlbiBhDQo+IGRl
dl9lcnIoKSBjYWxsIHdhcyBtYWRlIHdpdGggYSBiYWQgTUhJIGNvbmZpZ3VyYXRpb24uDQpbY2Fy
bC55aW5dIHllcywgSSBhbHNvIG1lZXQgdGhpcyBlcnJvciB3aXRoIGEgYmFkIE1ISSBjb25maWd1
cmF0aW9uLg0KPiANCj4gTWF5YmUgeW91IGNhbiBleHBsYWluIGEgbGl0dGxlIG1vcmUgaW4gdGhl
IGNvbW1pdCB0ZXh0IHN1YmplY3Q/DQo+IA0KPiBZb3UgY291bGQgc2F5LCAiRml4IG51bGwgcG9p
bnRlciBhY2Nlc3Mgd2hlbiBwYXJzaW5nIE1ISSBjb25maWd1cmF0aW9uIj8NCj4gDQo+IE9uIDIw
MjAtMTAtMjYgMjI6MzMsIGNhcmwueWluQHF1ZWN0ZWwuY29tIHdyb3RlOg0KPiA+IEZyb206IGNh
cmwgPGNhcmwueWluQHF1ZWN0ZWwuY29tPg0KPiA+DQo+ID4gZnVuY3Rpb24gcGFyc2VfZXZfY2Zn
IGFuZCBwYXJzZV9jaF9jZmcgYWNjZXNzIG1oaV9jbnRybC0+bWhpX2Rldg0KPiBGdW5jdGlvbnMg
cGFyc2VfZXZfY2ZnKCkgYW5kIHBhcnNlX2NoX2NmZygpDQo+ID4gYmVmb3JlIGl0IGlzIHNldCBp
biBmdW5jdGlvbiBtaGlfcmVnaXN0ZXJfY29udHJvbGxlciwNCj4gbWhpX3JlZ2lzdGVyX2NvbnRy
b2xsZXIoKQ0KPiA+IHVzZSBjbnRybF9kZXYgdG8gaW5zdGVhZCBtaGlfZGV2Lg0KPiB1c2UgY250
cmxfZGV2IGluc3RlYWQgb2YgbWhpX2Rldi4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IGNhcmwg
PGNhcmwueWluQHF1ZWN0ZWwuY29tPg0KPiBXaXRoIHRoZXNlIGNvbW1pdCB0ZXh0IHVwZGF0ZXMs
DQpbY2FybC55aW5dIHRoYW5rIGZvciB3b3JkcyBjb3JyZWN0aW9uLCBmb3IgbXkgbW90aGVyIGxh
bmd1YWdlIGlzIG5vdCBFbmdsaXNoLCANCnRoZXJlIGFyZSBsb3RzIG9mIHdvcmRzIHdyb25nIGlu
IHRoZSBjb21taXQuDQo+IA0KPiBSZXZpZXdlZC1ieTogQmhhdW1payBCaGF0dCA8YmJoYXR0QGNv
ZGVhdXJvcmEub3JnPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2J1cy9taGkvY29yZS9pbml0LmMg
fCA0ICsrLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2J1cy9taGkvY29yZS9pbml0LmMg
Yi9kcml2ZXJzL2J1cy9taGkvY29yZS9pbml0LmMNCj4gPiBpbmRleCAwZmZkZWJkZTguLmM2YjQz
ZTkwYiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2J1cy9taGkvY29yZS9pbml0LmMNCj4gPiAr
KysgYi9kcml2ZXJzL2J1cy9taGkvY29yZS9pbml0LmMNCj4gPiBAQCAtNjEwLDcgKzYxMCw3IEBA
IHN0YXRpYyBpbnQgcGFyc2VfZXZfY2ZnKHN0cnVjdCBtaGlfY29udHJvbGxlcg0KPiA+ICptaGlf
Y250cmwsICB7DQo+ID4gIAlzdHJ1Y3QgbWhpX2V2ZW50ICptaGlfZXZlbnQ7DQo+ID4gIAljb25z
dCBzdHJ1Y3QgbWhpX2V2ZW50X2NvbmZpZyAqZXZlbnRfY2ZnOw0KPiA+IC0Jc3RydWN0IGRldmlj
ZSAqZGV2ID0gJm1oaV9jbnRybC0+bWhpX2Rldi0+ZGV2Ow0KPiA+ICsJc3RydWN0IGRldmljZSAq
ZGV2ID0gbWhpX2NudHJsLT5jbnRybF9kZXY7DQo+ID4gIAlpbnQgaSwgbnVtOw0KPiA+DQo+ID4g
IAludW0gPSBjb25maWctPm51bV9ldmVudHM7DQo+ID4gQEAgLTY5Miw3ICs2OTIsNyBAQCBzdGF0
aWMgaW50IHBhcnNlX2NoX2NmZyhzdHJ1Y3QgbWhpX2NvbnRyb2xsZXINCj4gPiAqbWhpX2NudHJs
LA0KPiA+ICAJCQljb25zdCBzdHJ1Y3QgbWhpX2NvbnRyb2xsZXJfY29uZmlnICpjb25maWcpICB7
DQo+ID4gIAljb25zdCBzdHJ1Y3QgbWhpX2NoYW5uZWxfY29uZmlnICpjaF9jZmc7DQo+ID4gLQlz
dHJ1Y3QgZGV2aWNlICpkZXYgPSAmbWhpX2NudHJsLT5taGlfZGV2LT5kZXY7DQo+ID4gKwlzdHJ1
Y3QgZGV2aWNlICpkZXYgPSBtaGlfY250cmwtPmNudHJsX2RldjsNCj4gPiAgCWludCBpOw0KPiA+
ICAJdTMyIGNoYW47DQo+IA0KPiAtLQ0KPiBUaGUgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIs
IEluYy4gaXMgYSBtZW1iZXIgb2YgdGhlIENvZGUgQXVyb3JhIEZvcnVtLCBhDQo+IExpbnV4IEZv
dW5kYXRpb24gQ29sbGFib3JhdGl2ZSBQcm9qZWN0DQo=
