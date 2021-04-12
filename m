Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E98135C4B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Apr 2021 13:09:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239560AbhDLLJS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Apr 2021 07:09:18 -0400
Received: from mail-eopbgr40084.outbound.protection.outlook.com ([40.107.4.84]:20096
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237520AbhDLLJS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Apr 2021 07:09:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XHdwNaMoBvwrqutsLvlsrfOwzMJcGKo9jcPxoQE8smttoeBL0G9ELYh/GsnnD7ipuDWDs+QVV0T05NUeaXfj5aphn0PmiKD+niYIkC+qn0YRzi0cluXgMpny1tL5ssNkG9y2Qu9eQMjvq7xTGputChHQXzm2gDgjOU0+ttHQgRYaABDo/pMf0bLQ1+6/GBOk09q5czo81cDbUCOL+aa01gVu9GUn922zZrZYdGN1GgdylOFITtTHyiFmwK+2V4osj2h6uYyZuW82fLiu7thVlNvf/0NQUQJ0oo/38ysrNfjwrMn7Mp+7BYbyFWNfEBPCIegM0jjjORO2HTjVPruIrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Kpi2XhbQK2oT6Fj43L0o6Z9xZUKQvpGLZI5MF/DbTI=;
 b=M14IfMZqVqwaVzfaCWEZLr6bq3hNMamzTMZD1Tm07Fc9Xa3ODHkxvBuudUTdoQmqI2KiWw/MKxBYgRbBP/g+X9jyKJ4+rO95oAI6+uQrhWw3GCWBv4zfAqBfT4x5eX5/gOd45n1hcolFzUfkoDO9n8Yd8Fmh91UyJwxvGmlZQMiREivonpoEslBW4hn1fkj4IJQumRElBtVdvQBRjEbvH69sfnmzywFiL5kdiFiO4aCZUe2kgxt/GlRPHBbEJ6BtI7MvtFU47NKikUKMan1p4KRWJTzw2jkVWN4gnn6qb3jxDbtDIuAtErxDwlC+sIC94oW4IWqBKpFwE8jRN+5C3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Kpi2XhbQK2oT6Fj43L0o6Z9xZUKQvpGLZI5MF/DbTI=;
 b=j7sCweMOfrjAA6+zEmXmLTunxJ0q/Df33z1NVRLuZLZrUb8K1u8StXagwdOD4d4Y61c90gYkRuagnR2o0B/7uGVDSg6EwBayYXq0JrgBrROdDCl7jLnYP65m1XJZvpIJh0lV+n3lA7uq4VMenbc8YQSRgvVAjUlxmt8duZP3h0Q=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2393.eurprd03.prod.outlook.com (2603:10a6:3:68::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.18; Mon, 12 Apr 2021 11:08:50 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f4d0:ee66:d5fb:9cdd]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f4d0:ee66:d5fb:9cdd%3]) with mapi id 15.20.3999.037; Mon, 12 Apr 2021
 11:08:50 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "Markus.Elfring@web.de" <Markus.Elfring@web.de>,
        "gurus@codeaurora.org" <gurus@codeaurora.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "subbaram@codeaurora.org" <subbaram@codeaurora.org>,
        "collinsd@codeaurora.org" <collinsd@codeaurora.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "joe@perches.com" <joe@perches.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "aghayal@codeaurora.org" <aghayal@codeaurora.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [RFC PATCH v3 1/3] regmap-irq: Extend sub-irq to support
 non-fixed reg strides
Thread-Topic: [RFC PATCH v3 1/3] regmap-irq: Extend sub-irq to support
 non-fixed reg strides
Thread-Index: AQHXL14Gt/XrcqP/XE63mg+1uH1omw==
Date:   Mon, 12 Apr 2021 11:08:49 +0000
Message-ID: <d78cefad64d528e7c894c153950e4b4d2a18b300.camel@fi.rohmeurope.com>
References: <cover.1615423027.git.gurus@codeaurora.org>
         <526562423eaa58b4075362083f561841f1d6956c.1615423027.git.gurus@codeaurora.org>
         <4abddb76d87a2e6e0d2ad98da0b8349251456158.camel@fi.rohmeurope.com>
In-Reply-To: <4abddb76d87a2e6e0d2ad98da0b8349251456158.camel@fi.rohmeurope.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: web.de; dkim=none (message not signed)
 header.d=none;web.de; dmarc=none action=none header.from=fi.rohmeurope.com;
x-originating-ip: [2001:14ba:16e2:8300::6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2290369b-3d52-4150-5c7e-08d8fda359e1
x-ms-traffictypediagnostic: HE1PR0301MB2393:
x-microsoft-antispam-prvs: <HE1PR0301MB23930584E765E7BC7D97F86FAD709@HE1PR0301MB2393.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BjEwXsercg4ejzViHTQZhGJDhFiVGeuVxadw7AtCLmnb+ObcIcvAEqzqyMu9d41zTLaO8GRinUKIdqCBlm8qmyXq/0fU8CqIU4HPmMq/H757SHaKLWYljSbxsS2L+IujJ05dWtvx3qJh4/pVEVAco7HiLn5yACFlJfOX9NRiJTc9AtP5k5KhE/1cH0mXlV9ppVWS2wmhID28ZvgzaimYXvXFZRHwX0FrXLriDq0ucAj3B9yr3qFq2TNOMVZWWzrn8CCDveX73JsOCP4kaB3Tu7CAeui4QWOmeHYAQcxjANwO4/ENKjJFEfw9qVoOu5FXrqNEialL2SNtBdYrmm1EhSiTqQ29dbTRM8u20M6QS6qqGZNZ4Tx4v8l4VGGhxhyxBnP3BdD2A/yVZs2p840eqBg7kAwDJmll3llVFM/FAMkswtFgTRgCmSCGHIKwisJRoLxXhAY6FnJyxmy3Qfh4eVNa8irY0aVMdCMBrQO/51ycndRQPITXo+NQ0iilplN67TlfXBrW5DSeswYnznh/gcMa/Znjzarmf0cFSSfgPjtLmJJLENMG5yvzqMqiwJlFCBeBIBPhvHjPIQ0w7bvlDFisVhDwilt1vlSnVBbHxOo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39850400004)(3450700001)(6512007)(8936002)(8676002)(54906003)(6486002)(71200400001)(316002)(66476007)(64756008)(110136005)(5660300002)(86362001)(2616005)(186003)(83380400001)(66946007)(2906002)(6506007)(7416002)(478600001)(38100700002)(4326008)(76116006)(66556008)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?Sy9BYmg4UW9yS2ZCaVVFWUI0TXcwL3V2T0xKSk5tNnMwbW1KMGFmYlhYL1U1?=
 =?utf-8?B?SHdVdkZUNDBFZDc4OFl4NXdTc3ZRL2ZaNlhSWjU0aHJ6T2MvN2I3d0pYNnhl?=
 =?utf-8?B?SGxPZWN3Qzl0TE45TEFXVUNrL3NndWltd3lyNWF3TUdRYnMvSHBFOGpMK0ZQ?=
 =?utf-8?B?c0lNdnR6ZlBmMlMzR3d0NzV6SlJFQ3ZVTUZvcCtUdTA3NzdTUVlJeUtyNDZa?=
 =?utf-8?B?NlRqQjduVGhWU2JXZjc2NEtXekc2Y21WN1FvUG9idk1wWjE3Q3EzejRGU2lT?=
 =?utf-8?B?VzRUS3ZSOVpab0dpODJSb0RvT1owelQ4UEtBdGlPbWdRNTZnRE41WUxXYXow?=
 =?utf-8?B?bndNOEVXUVVNbzZsMXBLWHRxUG45UkozelNiMjZBL1cxOUhsVXFVR0RNdFlB?=
 =?utf-8?B?ZFlURDg0VUhoSGpJS2JCaHpBQ3o0RVJOVllIKzN3MkNpL0UzNG1SdXlKYW1H?=
 =?utf-8?B?K0s3YndjNkczVWRzSXdrS3VnMEpMbi9CM3hHUTlsWlF0eWx5V3lwOFM3VjlJ?=
 =?utf-8?B?QWx2Q0xMVEFhNitDb0VTTFNhYjJzV1ZBakIzMWlGRVRDalkzTlNGUmJ4bXpI?=
 =?utf-8?B?clJ4Q3BLVStaOUVuQmlCZ010WlpPQlBpTjBMaURKQ0V2dGl2bWY0VnNRTUxG?=
 =?utf-8?B?V0dMUStJeWhKMDJnbUtoVlVTYVNTNjR6YnVTbmJkbTFSOUZ4T0kvQVY4ckdj?=
 =?utf-8?B?akJUdFlNVm5mT1pyb0doWDZjTmhBMUpTVTBxdTNTQWFCS0FuTlFNWlFzc01I?=
 =?utf-8?B?NU51M0RZdHdzMlBZSFBwbC9QQXdUQjMwelZCNiszaG1jOURrL0xORy8vNHhL?=
 =?utf-8?B?a1E3RFlwcXdmczRTdCtOWVpSZ1dGNko0ZWlibkJocURQb0Z3c2J3dzlPZ0Nt?=
 =?utf-8?B?RS9nNzd3RFpVV3hRK0FRS1hFcFE1Z1dNR3N2UXl6YW1rTVVKaHhtOW9lSllp?=
 =?utf-8?B?bHgrSVNMZDhEVkFxSS9TWVRlUU4yVVNJclkxVFVCSkdHdklFbVp3OVN5WDhY?=
 =?utf-8?B?dE5SaFozbW5FTDh4WkF4UnpKS3FnUklId21kWHJjTVNvN3MwSThMUFRPblU1?=
 =?utf-8?B?b3lhamtlbTRXcXVzZHpiLzdYMGJUM2FKWjUyTEdPOTV4UkZRQitCaHVyRlJk?=
 =?utf-8?B?eklPaVhEZmRqbXd6ZGRhR0ZqdEd4Vkk1ZHA0eVFRcnhiem5KQ2k4bkV2S0JU?=
 =?utf-8?B?c2k2M2NZdjIyK3VpUU15YjRZZlBzbEphbzlJV0RIeTBZcWlyMzR2LzFTbDR2?=
 =?utf-8?B?QkxCd1A0bmVnYXRjM0g3bUxqWWFmZVBBUWJWck83ZTFIekpvbUltM2NGOTlo?=
 =?utf-8?B?cW1Zc0VOaSsvUlFjNGdBTlJKM1FqNXRXUVlrZnNzZkF5NXJqUFJRdW41M3RU?=
 =?utf-8?B?dGJnNWVQaVdoWWowL0tEb3hPakZmNUJZMFIyK2ZYNjJrN3hIOTN5NFZCMnN5?=
 =?utf-8?B?cVphRGoxR1c1RWdCNXdaenRGL2R6d2lqSWo4d3ZnK1dxMEc1eGNNWTh2bU1m?=
 =?utf-8?B?M1B2aE1JMnJ4Z3lERnVxL1hDSHBuSGtSMGQ0ZWZSZTlCZUNaNzhmSWY4WTFq?=
 =?utf-8?B?QSs4eWNPakxxZ1I3L1RlTVo4Q05XdVJKbEVHQ3JjRVcvTzZLd0lqTUwydWxO?=
 =?utf-8?B?MWswQlVBSjc2TlkzVVJZYi9NaDFqQVBKTi9jZTNMUlV4aWtUdDU5VGVjMUdW?=
 =?utf-8?B?UGlzSVIvZVJHNS83a2hkaHVtemE4bGRIMnB4L2FDVjZqNWxxRSsxTkR2T1dQ?=
 =?utf-8?B?Z3JmK3BPQjc3UDZUKzJhUmtQTUtxNVdsUjlZZDFmSzBJd1pxendxT29qL1dM?=
 =?utf-8?Q?MY0UGMUAAe6UTG2dRqROjJSObCI47FA+VmTAw=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <BCEC16A10B53EA4287EA0385B3A0B4BB@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2290369b-3d52-4150-5c7e-08d8fda359e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2021 11:08:49.9984
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3EPVl0862eh9f7NM115Cs9wF+wXlu4ZWvaNzzzyib8H5Jg10oTRg+n5TZekVDjj596o+UZDj6h1SZloI9QlYzIM17fXZM2EC6ow4BQ23tAKx7TBsJgsuFhhOtfyqe5TT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2393
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SGksDQoNCk9uIE1vbiwgMjAyMS0wNC0xMiBhdCAwOTowNSArMDMwMCwgTWF0dGkgVmFpdHRpbmVu
IHdyb3RlOg0KPiBIaSBBbGwsDQo+IA0KPiBPbiBXZWQsIDIwMjEtMDMtMTAgYXQgMTY6MzkgLTA4
MDAsIEd1cnUgRGFzIFNyaW5hZ2VzaCB3cm90ZToNCj4gPiBRdWFsY29tbSdzIE1GRCBjaGlwcyBo
YXZlIGEgdG9wIGxldmVsIGludGVycnVwdCBzdGF0dXMgcmVnaXN0ZXIgYW5kDQo+ID4gc3ViLWly
cXMgKHBlcmlwaGVyYWxzKS4gIFdoZW4gYSBiaXQgaW4gdGhlIG1haW4gc3RhdHVzIHJlZ2lzdGVy
DQo+ID4gZ29lcw0KPiA+IGhpZ2gsIGl0IG1lYW5zIHRoYXQgdGhlIHBlcmlwaGVyYWwgY29ycmVz
cG9uZGluZyB0byB0aGF0IGJpdCBoYXMgYW4NCj4gPiB1bnNlcnZpY2VkIGludGVycnVwdC4gSWYg
dGhlIGJpdCBpcyBub3Qgc2V0LCB0aGlzIG1lYW5zIHRoYXQgdGhlDQo+ID4gY29ycmVzcG9uZGlu
ZyBwZXJpcGhlcmFsIGRvZXMgbm90Lg0KPiA+IA0KPiA+IENvbW1pdCBhMmQyMTg0OGQ5MjExZCAo
InJlZ21hcDogcmVnbWFwLWlycTogQWRkIG1haW4gc3RhdHVzDQo+ID4gcmVnaXN0ZXINCj4gPiBz
dXBwb3J0IikgaW50cm9kdWNlZCB0aGUgc3ViLWlycSBsb2dpYyB0aGF0IGlzIGN1cnJlbnRseSBh
cHBsaWVkDQo+ID4gb25seQ0KPiA+IHdoZW4gcmVhZGluZyBzdGF0dXMgcmVnaXN0ZXJzLCBidXQg
bm90IGZvciBhbnkgb3RoZXIgZnVuY3Rpb25zIGxpa2UNCj4gPiBhY2tpbmcNCj4gPiBvciBtYXNr
aW5nLiBFeHRlbmQgdGhlIHVzZSBvZiBzdWItaXJxIHRvIGFsbCBvdGhlciBmdW5jdGlvbnMsIHdp
dGgNCj4gPiB0d28NCj4gPiBjYXZlYXRzIHJlZ2FyZGluZyB0aGUgc3BlY2lmaWNhdGlvbiBvZiBv
ZmZzZXRzOg0KPiA+IA0KPiA+IC0gRWFjaCBtZW1iZXIgb2YgdGhlIHN1Yl9yZWdfb2Zmc2V0cyBh
cnJheSBzaG91bGQgYmUgb2YgbGVuZ3RoIDENCj4gPiAtIFRoZSBzcGVjaWZpZWQgb2Zmc2V0cyBz
aG91bGQgYmUgdGhlIHVuZXF1YWwgc3RyaWRlcyBmb3IgZWFjaCBzdWItDQo+ID4gaXJxDQo+ID4g
ICBkZXZpY2UuDQo+ID4gDQo+ID4gSW4gUUNPTSdzIGNhc2UsIGFsbCB0aGUgKl9iYXNlIHJlZ2lz
dGVycyBhcmUgdG8gYmUgY29uZmlndXJlZCB0bw0KPiA+IHRoZQ0KPiA+IGJhc2UgYWRkcmVzc2Vz
IG9mIHRoZSBmaXJzdCBzdWItaXJxIGdyb3VwLCB3aXRoIG9mZnNldHMgb2YgZWFjaA0KPiA+IHN1
YnNlcXVlbnQgZ3JvdXAgY2FsY3VsYXRlZCBhcyBhIGRpZmZlcmVuY2UgZnJvbSB0aGVzZSBhZGRy
ZXNzZXMuDQo+ID4gDQo+ID4gQ29udGludWluZyBmcm9tIHRoZSBleGFtcGxlIG1lbnRpb25lZCBp
biB0aGUgY292ZXIgbGV0dGVyOg0KPiA+IA0KPiA+IAkvKg0KPiA+IAkgKiBBZGRyZXNzIG9mIE1J
U0NfSU5UX01BU0sJCT0gMHgxMDExDQo+ID4gCSAqIEFkZHJlc3Mgb2YgVEVNUF9BTEFSTV9JTlRf
TUFTSwk9IDB4MjAxMQ0KPiA+IAkgKiBBZGRyZXNzIG9mIEdQSU8wMV9JTlRfTUFTSwkJPSAweDMw
MTENCj4gPiAJICoNCj4gPiAJICogQ2FsY3VsYXRlIG9mZnNldHMgYXM6DQo+ID4gCSAqIG9mZnNl
dF8wID0gMHgxMDExIC0gMHgxMDExID0gMCAgICAgICAodG8gYWNjZXNzIE1JU0Mncw0KPiA+IAkg
KiAJCQkJCSByZWdpc3RlcnMpDQo+ID4gCSAqIG9mZnNldF8xID0gMHgyMDExIC0gMHgxMDExID0g
MHgxMDAwDQo+ID4gCSAqIG9mZnNldF8yID0gMHgzMDExIC0gMHgxMDExID0gMHgyMDAwDQo+ID4g
CSAqLw0KPiA+IA0KPiA+IAlzdGF0aWMgdW5zaWduZWQgaW50IHN1Yl91bml0MF9vZmZzZXRzW10g
PSB7MH07DQo+ID4gCXN0YXRpYyB1bnNpZ25lZCBpbnQgc3ViX3VuaXQxX29mZnNldHNbXSA9IHsw
eDEwMDB9Ow0KPiA+IAlzdGF0aWMgdW5zaWduZWQgaW50IHN1Yl91bml0Ml9vZmZzZXRzW10gPSB7
MHgyMDAwfTsNCj4gPiANCj4gPiAJc3RhdGljIHN0cnVjdCByZWdtYXBfaXJxX3N1Yl9pcnFfbWFw
IGNoaXBfc3ViX2lycV9vZmZzZXRzW10gPSB7DQo+ID4gCQlSRUdNQVBfSVJRX01BSU5fUkVHX09G
RlNFVChzdWJfdW5pdDBfb2Zmc2V0cyksDQo+ID4gCQlSRUdNQVBfSVJRX01BSU5fUkVHX09GRlNF
VChzdWJfdW5pdDBfb2Zmc2V0cyksDQo+ID4gCQlSRUdNQVBfSVJRX01BSU5fUkVHX09GRlNFVChz
dWJfdW5pdDBfb2Zmc2V0cyksDQo+ID4gCX07DQo+ID4gDQo+ID4gCXN0YXRpYyBzdHJ1Y3QgcmVn
bWFwX2lycV9jaGlwIGNoaXBfaXJxX2NoaXAgPSB7DQo+ID4gCS0tLS0tLS0tODwtLS0tLS0tLQ0K
PiA+IAkubm90X2ZpeGVkX3N0cmlkZSA9IHRydWUsDQo+ID4gCS5tYXNrX2Jhc2UJICA9IE1JU0Nf
SU5UX01BU0ssDQo+ID4gCS50eXBlX2Jhc2UJICA9IE1JU0NfSU5UX1RZUEUsDQo+ID4gCS5hY2tf
YmFzZQkgID0gTUlTQ19JTlRfQUNLLA0KPiA+IAkuc3ViX3JlZ19vZmZzZXRzICA9IGNoaXBfc3Vi
X2lycV9vZmZzZXRzLA0KPiA+IAktLS0tLS0tLTg8LS0tLS0tLS0NCj4gPiAJfTsNCj4gPiANCj4g
PiBTaWduZWQtb2ZmLWJ5OiBHdXJ1IERhcyBTcmluYWdlc2ggPGd1cnVzQGNvZGVhdXJvcmEub3Jn
Pg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2Jhc2UvcmVnbWFwL3JlZ21hcC1pcnEuYyB8IDgxICsr
KysrKysrKysrKysrKysrKysrKysrKysrLS0NCj4gPiAtLS0tLS0tLS0tLS0NCj4gPiAgaW5jbHVk
ZS9saW51eC9yZWdtYXAuaCAgICAgICAgICAgfCAgNyArKysrDQo+ID4gIDIgZmlsZXMgY2hhbmdl
ZCwgNjAgaW5zZXJ0aW9ucygrKSwgMjggZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvYmFzZS9yZWdtYXAvcmVnbWFwLWlycS5jDQo+ID4gYi9kcml2ZXJzL2Jhc2Uv
cmVnbWFwL3JlZ21hcC1pcnEuYw0KPiA+IGluZGV4IDE5ZGI3NjQuLmUxZDhmYzllIDEwMDY0NA0K
PiA+IC0tLSBhL2RyaXZlcnMvYmFzZS9yZWdtYXAvcmVnbWFwLWlycS5jDQo+ID4gKysrIGIvZHJp
dmVycy9iYXNlL3JlZ21hcC9yZWdtYXAtaXJxLmMNCj4gPiBAQCAtNDUsNiArNDUsMjcgQEAgc3Ry
dWN0IHJlZ21hcF9pcnFfY2hpcF9kYXRhIHsNCj4gPiAgCWJvb2wgY2xlYXJfc3RhdHVzOjE7DQo+
ID4gIH07DQo+ID4gDQo+IA0KPiBTb3JyeSB0aGF0IEkgYW0gbGF0ZSB3aXRoIHRoZSAicmV2aWV3
IiBidXQgSSBvbmx5IG5vdyBub3RpY2VkIHRoaXMNCj4gY2hhbmdlIHdoZW4gSSB3YXMgZm9sbG93
aW5nIHRoZSByZWZlcmVuY2VzIGZyb20gUE04MDA4IFBNSUMgcGF0Y2gNCj4gbWFpbC4NCj4gDQo+
IA0KPiA+ICANCj4gPiArc3RhdGljIGludCBzdWJfaXJxX3JlZyhzdHJ1Y3QgcmVnbWFwX2lycV9j
aGlwX2RhdGEgKmRhdGEsDQo+ID4gKwkJICAgICAgIHVuc2lnbmVkIGludCBiYXNlX3JlZywgaW50
IGkpDQo+IA0KPiBEbyBJIHJlYWQgdGhpcyBjb3JyZWN0bHkgLSB0aGlzIGZ1bmN0aW9uIHNob3Vs
ZCBtYXAgdGhlIG1haW4gc3RhdHVzDQo+IGJpdA0KPiAoZ2l2ZW4gaW4gaSkgdG8gdGhlIChzdWIp
SVJRIHJlZ2lzdGVyLCByaWdodD8gSG93IGRvZXMgdGhpcyB3b3JrIGZvcg0KPiBjYXNlcyB3aGVy
ZSBvbmUgYml0IGNvcnJlc3BvbmRzIHRvIG1vcmUgdGhhbiBvbmUgc3ViLXJlZ2lzdGVyPyBPciBk
bw0KPiBJDQo+IG1pc3VuZGVyc3RhbmQgdGhlIHB1cnBvc2Ugb2YgdGhpcyBmdW5jdGlvbj8gKFRo
aXMgaXMgdGhlIGNhc2Ugd2l0aA0KPiBib3RoDQo+IHRoZSBCRDcwNTI4IGFuZCBCRDcxODI4KS4N
Cg0KSSBkaWQgc29tZSBxdWljayB0ZXN0IHdpdGggQkQ3MTgxNSB3aGljaCBJIGhhZCBhdCBob21l
LiBBbmQgaXQgc2VlbXMgdG8NCmJlIEkgZGlkIGluZGVlZCBtaXN1bmRlcnN0YW5kIHRoaXMgOikg
VGhpcyBpcyBub3QgZm9yIGNvbnZlcnRpbmcgdGhlDQptYWluLUlSUSBiaXRzIHRvIHN1Yi1pcnEg
cmVnaXN0ZXJzIC0gdGhpcyBpcyBmb3IgZ2V0dGluZyB0aGUgc3ViLUlSUQ0KcmVnaXN0ZXIgYWRk
cmVzcyBiYXNlZCBvbiB0aGUgJ3N1YiBJUlEgcmVnaXN0ZXIgaW5kZXgnLg0KDQpTbyBJIGRvIGFw
b2xvZ2l6ZSB0aGUgbm9pc2UsIGl0IHNlZW1zIGFsbCBpcyB3ZWxsIGFuZCBldmVyeXRoaW5nDQoo
ZXhjZXB0IG15IHNlbGYgY29uZmlkZW5jZSkga2VlcHMgd29ya2luZyBhcyBpdCBkaWQgOikNCg0K
VGhhbmtzIGZvciB0aGUgaW1wcm92ZW1lbnQgR3VydSBEYXMhDQoNCkJlc3QgUmVnYXJkcw0KCU1h
dHRpIFZhaXR0aW5lbg0KDQoNCg==
