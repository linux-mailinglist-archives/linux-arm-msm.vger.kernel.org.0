Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 534C33C7C60
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jul 2021 04:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237673AbhGNDCF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jul 2021 23:02:05 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:33560 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237559AbhGNDCE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jul 2021 23:02:04 -0400
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EA6D840259;
        Wed, 14 Jul 2021 02:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1626231554; bh=epE78WKt6ckDnZFTffL3KFQ2+vZUPFjSPldk2PDmHmM=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=GRhnwtKcVfmxQib1W+O6OXeKZQhAd16OFXY7DL1Mr4XQ6sWtKZkM3CR8p8rYzl5Uq
         azJ/035HeTMPPv5OzhAw8P53SGPsI6VfuCMEhsq4x4Am5mKMLFHuul7/HwJFjI7Q6S
         YU1CoOBEq50QzxIA0mg2RrHbiwPqhzvXaoSSy7dnvEoT8az1f2/8xYzRcOP7xw3yVX
         gmVupBoYANO4JoCFkQn5r+a51PDQZi0R7oSShRrB8sL24ROsNGtI8eWG1QKb7hjkcs
         +GhnUWJVRXO21t1tBbK744e95ReCnDMzTk2kevNZLXJSJcVzo9X7AWtAjQyhbPVr5A
         jNfmrCY7DpoQQ==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id E644FA0085;
        Wed, 14 Jul 2021 02:59:12 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5C3AF4016F;
        Wed, 14 Jul 2021 02:59:12 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="T3eJAS6h";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WjoPsq1r6ACToDIzpn4ZKWzlXSnbaAIPtVgMZ6u7CR/KpynhfCBRcdG+VDX5KlcudsbKCEFWWoO8BrPjpSHlKXd69LLDxt0f2bOtsEkOApFOKhRC/9dMLqMQBNSr3XJu2k461Ae75DvPKrRxPlOKM2lW/yFhrDRGGWIX1RCuYd/wFYwuWs5t5p9u6NdGcw4Rr7AJs6uT+ue0ooHYT0Z6RGIH3urvlYHMOlDJWLo4a3OpOL3lvw+HcTwa8BUWu9FucZjdlNamrcwsAEs8J6Q8krzPsa6vVbFUiZVsPgOvfXGES6ylPUVvPqoQLQ+IjeoiUDid+RjCO+zBqW3GUwS2pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=epE78WKt6ckDnZFTffL3KFQ2+vZUPFjSPldk2PDmHmM=;
 b=b2kmgOkXAi+jncS8UCj97i/z96uj8NUDLO78acOVtS6Y8XbaPjwWvjpv7abNe4NnHPp9HKaTC2XnjOu5WOZRUseIovh4tfTbu3rgSDtEel0BVLrCHqZk7dMF4Ssi3V3bZrQnhiIMC/e7/+YO/d92dbhfIlhD3V2oiUJeoqNowLPFUoi/s8kI1eHPQALr4VECtNTbnSHqcmbjI3V18BsKi4LCUEDboLumPDhLIyPlnf0zGeoOdvGMlzeGDxN11r3Ewf6Mm6yWwTWbi6wJXxzygPtH8YcpT7OpjZ8IY0f27osYYktLH0xR/iZFTa5bpoyND836CD3xEIYmBLxoX11IQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=epE78WKt6ckDnZFTffL3KFQ2+vZUPFjSPldk2PDmHmM=;
 b=T3eJAS6h/y//c0GZphpy1et19jvDXuAT/TPMhRoQUnLb728X+lzzTDUpkg9RSDEZLE50l7Mq4fe2lrvi9zd2Kn3x53qhMtNBkoAcF4+zp/CiZRxPz1taE027ESzaA23wae/NEBRIZWCugXKt6/cPPmEsEkLATOh2QO4gwJ06hXw=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB4725.namprd12.prod.outlook.com (2603:10b6:a03:a2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Wed, 14 Jul
 2021 02:59:10 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::1582:d559:a0db:29e4]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::1582:d559:a0db:29e4%5]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 02:59:10 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Wesley Cheng <wcheng@codeaurora.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "agross@kernel.org" <agross@kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "frowand.list@gmail.com" <frowand.list@gmail.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "jackp@codeaurora.org" <jackp@codeaurora.org>
Subject: Re: [PATCH v14 3/6] usb: dwc3: Resize TX FIFOs to meet EP bursting
 requirements
Thread-Topic: [PATCH v14 3/6] usb: dwc3: Resize TX FIFOs to meet EP bursting
 requirements
Thread-Index: AQHXdWvmr0dK2TF02kiXSnoLeHYyUatAA0oAgAHKTIA=
Date:   Wed, 14 Jul 2021 02:59:10 +0000
Message-ID: <0f8384bc-18a6-8ca5-c38b-6b5523c60a68@synopsys.com>
References: <1625908395-5498-1-git-send-email-wcheng@codeaurora.org>
 <1625908395-5498-4-git-send-email-wcheng@codeaurora.org>
 <b65463e9-3a8d-1ee5-3e26-09990aa8ec53@synopsys.com>
In-Reply-To: <b65463e9-3a8d-1ee5-3e26-09990aa8ec53@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: synopsys.com; dkim=none (message not signed)
 header.d=none;synopsys.com; dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ffb2a576-afac-4521-6b69-08d946735abe
x-ms-traffictypediagnostic: BYAPR12MB4725:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB4725E67781B6A10055CD448AAA139@BYAPR12MB4725.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KHakRoewBZQ2EyubQSPaeRlxsgSBs1Xp7XfBHyIHrhzu+J4luwRDb6FqkAA5nGWdFZr+DDN7bxH6E0lT10rBmWQcHLuvP68BqvSJ5M2i3HUCR9TusSPC0TbnuHGgbO3xEYXyfAIbuhxsH9Bom/rTD0m8q110yXjARSdazrZkb37Ro5ZACU9vzit6RhJgeSJeUwSXKV0gA9vFFhUkRAVF1FRUHMKVtAQC0H7Uibl1askBx4734ZFXT3M/fVPYF6DFKYf1ztWnMK06IfpfMSMeI8llv7Tf/nkE4GI3K20hrcsVH9EdjsI8O+7k8fnxykfryfz2v0S1EUyWQlXWU4i4EqCDvIvm/N4dPLWO4DDNaOcqtxsWxjskPgP8a2zLxteUpskT6NHoc8mrarZqMBwmNLYoZzm8i0aLPctPz6kMC0KPOfC1lD+0EGLRYBeGCpxXHYA8wRtah0XzQGN/BO6dM/oR8SUyokBXWmYqN/TI9T7obLd12GtQBhCoqDbyUYRxVgON7eJTGTmu7ljKozr3gXZ+3RNb1eEZPnK8kwWdrMN84EUbF6eRDX6Xu6OOTWhTrU6XX7bQELq3xKurpTyOmeegzf9ntsu1mG6zRkrQ6OI2OP4hsdXGLpS0Zv3KQNn9GLvQlOMeCEIHYwG+I8PIG+fszc4+5h2JspwalGEfEOQSCWba+Dn2PJqR2/218ZXgM10sSRC/hKnfT6l+A/ZvX/YziGNgHsmMY59vLvIaP/GV5IywB3sc/9kqhQ8RYcTz4R2T4aB4rkM9GP8JaMEzDQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(366004)(396003)(376002)(346002)(6506007)(8936002)(54906003)(110136005)(38100700002)(122000001)(7416002)(316002)(478600001)(31686004)(71200400001)(8676002)(86362001)(30864003)(31696002)(6486002)(186003)(5660300002)(6512007)(66946007)(66476007)(76116006)(2616005)(83380400001)(36756003)(26005)(64756008)(2906002)(4326008)(66446008)(66556008)(38070700004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UjNXRnBaanIrcHY2Qjl5VmF6ZnRqOVEwcXhwb05nUXlLemVmb0tOT3A5Slor?=
 =?utf-8?B?R3pwL1dlOWJwZFRYeWx2aW9OeGFhZGE4MlA2K0pKaUxVQnJhcnRZT1RsSmZz?=
 =?utf-8?B?eDBCUW5XMXBBeWQ2cFUzVVNkVmZHdmE4Zy9udk1aaWtnK3VpZktUTjE4THUv?=
 =?utf-8?B?V096Y25EOWZNdEFXbERzWjI2cWpkVkxxbzhjNzJLOFpHMG95dXBBN1dzeHhw?=
 =?utf-8?B?RWlTb3FWUEVCTlBxa244VGRQcWtMSElrQUtBdmlLbzRiL0hZRm96UEVyV3Q4?=
 =?utf-8?B?Z2lJUldJeDlZcHVrMmE4USs0UDkzVlAxdkVONG9QN1JsMmpaKzZhQ3kxMFpB?=
 =?utf-8?B?dUZLOER6ZFplNzQ0OTZaTG5PWUMxMFJPQnNGVFRpR1AwNWRJVlh2Z1lkb3h0?=
 =?utf-8?B?VGU2c1ZOZlFCZjFOK3VyYmkyMTFUU3kxZDBIa1pWK1RaN2dla0xNUVZHT2h6?=
 =?utf-8?B?MHRYeGIrR2IrN1JWaFBTMHJHeEpRODVkTEZ5cUZQQTIzZ2Z2N25oQmo5cmpC?=
 =?utf-8?B?TWU0WXk1SGVmeGZqYkY1R2U0TDB2cElSKzdUYTJ3amM1RnJKZWJ3OHE4T0pk?=
 =?utf-8?B?Wk5CdldFVGdFQUp0QXJqaDRTWTJpRzlmd3poWm9OWDJtYjdVWFpRUU1XMEJw?=
 =?utf-8?B?RE04ZFBRQmt4UDRwSjNKVWs2dDJPWkRRYlV5c0lheGlXU0xURXdIUmQ3TjNG?=
 =?utf-8?B?a1lPbnliT0xid1AxLy93TE81VlhUTGdwOTRpTFFpa0g0T2Z6WDhZVDJwSEQ0?=
 =?utf-8?B?SlFNbDFQVG5Va2VWL2lOeWlPTERwdTNxbTNUeVRlalREaWd4WTdaVjdkWTUv?=
 =?utf-8?B?V3JyZnVuNDVyVEVzT1Q3MkpGcFUwQVIxOS9PM0ZSVSt0T29lTWpxTGJWQTls?=
 =?utf-8?B?MkpjblBWZFB2UC82bU5aVGo1VUI1TzhiNkl6M2RrVXRrbHdDaWN2bnlKdlFw?=
 =?utf-8?B?alN3bnc3S21wUTZoa0w3NEdLNURHaW9IS1hiSVdpb0U2RUphb0VmdytSVFIz?=
 =?utf-8?B?czlZU0MrUWVHOElRSEZYWlc0enhILzBkalpYdngzT1BWWXgwUFo5VDgvR2dN?=
 =?utf-8?B?cEFSNXN5UkR0THBzZ1NuSk9kUW90YmtOZEhNYTFwS2c4T1BCc1E3ZUNBUUxz?=
 =?utf-8?B?VStscG5BVEMzcG10L3piQUJOL0xJd2dXUkR4RnBabzR1T2p4NDlXQzIvR09y?=
 =?utf-8?B?cXgvczRKNkpaaXhxeXUwYzRwL1NSeXV3ZGkyRlMwaDRaUlZGR0U2V2VJSW5Z?=
 =?utf-8?B?Vjg1MndmS1BLSm9YMG96Rk84TGVHdXNwajlkeXZEUXdsYUZLSnFrdGtreDk2?=
 =?utf-8?B?UmZ6cytaVE9CQ0ZZL0t3SzVjTHUwNnE1QUxKY25Id2JnbHFhYWpVQnR5U3VZ?=
 =?utf-8?B?a3dGbGtDM0ljalU3QzJTcmlNbW5jM25RazR6cHc3UHd1RWd4VEZkdDhRaXpI?=
 =?utf-8?B?ZFhZSzNpcHFnWVdqNmNzYjdwc0tMTEVLTEZmY1Njd0hGL0lEcEJHd3RhQTIy?=
 =?utf-8?B?ejNuc3duT01yeUdVeWxuMHRrbzhJcS9ETm84TzFTTGovSGNTUlMxejBTMmRE?=
 =?utf-8?B?blIyVVN5Y29qOVZkSTZRamZCUldoNnR5Wno0enZWSmVJT2xDMnM5QVE2OXU5?=
 =?utf-8?B?Um12RW51b1MwcXh5b1dnL0JsZ1Yvd1Vyb2hJSWZlT3kwZTRzempheUNiWGZQ?=
 =?utf-8?B?eGMwWmVWNmpjWUtvZkxQZnoxV0d3TWRxb29xUVZHbVF4cUszUllLV1owL3Bj?=
 =?utf-8?Q?imM0cB5tF8hsq+udXs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E7DC55B68C4E6442BB969C2F470FB659@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffb2a576-afac-4521-6b69-08d946735abe
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2021 02:59:10.6348
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WAKx+XU/Eqscu+XHlcPu9emLsuDEn1tedeON6b4QKdEPezZrK2D1Jn52qz9FpZf4rkT1Qi1E6iy5SCIxo20zeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4725
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

VGhpbmggTmd1eWVuIHdyb3RlOg0KPiBIaSwNCj4gDQo+IFdlc2xleSBDaGVuZyB3cm90ZToNCj4+
IFNvbWUgZGV2aWNlcyBoYXZlIFVTQiBjb21wb3NpdGlvbnMgd2hpY2ggbWF5IHJlcXVpcmUgbXVs
dGlwbGUgZW5kcG9pbnRzDQo+PiB0aGF0IHN1cHBvcnQgRVAgYnVyc3RpbmcuICBIVyBkZWZpbmVk
IFRYIEZJRk8gc2l6ZXMgbWF5IG5vdCBhbHdheXMgYmUNCj4+IHN1ZmZpY2llbnQgZm9yIHRoZXNl
IGNvbXBvc2l0aW9ucy4gIEJ5IHV0aWxpemluZyBmbGV4aWJsZSBUWCBGSUZPDQo+PiBhbGxvY2F0
aW9uLCB0aGlzIGFsbG93cyBmb3IgZW5kcG9pbnRzIHRvIHJlcXVlc3QgdGhlIHJlcXVpcmVkIEZJ
Rk8gZGVwdGggdG8NCj4+IGFjaGlldmUgaGlnaGVyIGJhbmR3aWR0aC4gIFdpdGggc29tZSBoaWdo
ZXIgYk1heEJ1cnN0IGNvbmZpZ3VyYXRpb25zLCB1c2luZw0KPj4gYSBsYXJnZXIgVFggRklGTyBz
aXplIHJlc3VsdHMgaW4gYmV0dGVyIFRYIHRocm91Z2hwdXQuDQo+Pg0KPj4gQnkgaW50cm9kdWNp
bmcgdGhlIGNoZWNrX2NvbmZpZygpIGNhbGxiYWNrLCB0aGUgcmVzaXppbmcgbG9naWMgY2FuIGZl
dGNoDQo+PiB0aGUgbWF4aW11bSBudW1iZXIgb2YgZW5kcG9pbnRzIHVzZWQgaW4gdGhlIFVTQiBj
b21wb3NpdGlvbiAoY2FuIGNvbnRhaW4NCj4+IG11bHRpcGxlIGNvbmZpZ3VyYXRpb25zKSwgd2hp
Y2ggaGVscHMgZW5zdXJlIHRoYXQgdGhlIHJlc2l6aW5nIGxvZ2ljIGNhbg0KPj4gZnVsZmlsbCB0
aGUgY29uZmlndXJhdGlvbihzKSwgb3IgcmV0dXJuIGFuIGVycm9yIHRvIHRoZSBnYWRnZXQgbGF5
ZXINCj4+IG90aGVyd2lzZSBkdXJpbmcgYmluZCB0aW1lLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6
IFdlc2xleSBDaGVuZyA8d2NoZW5nQGNvZGVhdXJvcmEub3JnPg0KPj4gLS0tDQo+PiAgZHJpdmVy
cy91c2IvZHdjMy9jb3JlLmMgICB8ICAxNSArKysNCj4+ICBkcml2ZXJzL3VzYi9kd2MzL2NvcmUu
aCAgIHwgIDE2ICsrKysNCj4+ICBkcml2ZXJzL3VzYi9kd2MzL2VwMC5jICAgIHwgICAyICsNCj4+
ICBkcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIHwgMjMyICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysNCj4+ICA0IGZpbGVzIGNoYW5nZWQsIDI2NSBpbnNlcnRp
b25zKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jIGIvZHJp
dmVycy91c2IvZHdjMy9jb3JlLmMNCj4+IGluZGV4IGJhNzRhZDcuLmIxOTRhZWNkIDEwMDY0NA0K
Pj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4+ICsrKyBiL2RyaXZlcnMvdXNiL2R3
YzMvY29yZS5jDQo+PiBAQCAtMTI2Nyw2ICsxMjY3LDcgQEAgc3RhdGljIHZvaWQgZHdjM19nZXRf
cHJvcGVydGllcyhzdHJ1Y3QgZHdjMyAqZHdjKQ0KPj4gIAl1OAkJCXJ4X21heF9idXJzdF9wcmQ7
DQo+PiAgCXU4CQkJdHhfdGhyX251bV9wa3RfcHJkOw0KPj4gIAl1OAkJCXR4X21heF9idXJzdF9w
cmQ7DQo+PiArCXU4CQkJdHhfZmlmb19yZXNpemVfbWF4X251bTsNCj4+ICAJY29uc3QgY2hhcgkJ
KnVzYl9wc3lfbmFtZTsNCj4+ICAJaW50CQkJcmV0Ow0KPj4gIA0KPj4gQEAgLTEyODIsNiArMTI4
MywxMyBAQCBzdGF0aWMgdm9pZCBkd2MzX2dldF9wcm9wZXJ0aWVzKHN0cnVjdCBkd2MzICpkd2Mp
DQo+PiAgCSAqLw0KPj4gIAloaXJkX3RocmVzaG9sZCA9IDEyOw0KPj4gIA0KPj4gKwkvKg0KPj4g
KwkgKiBkZWZhdWx0IHRvIGEgVFhGSUZPIHNpemUgbGFyZ2UgZW5vdWdoIHRvIGZpdCA2IG1heCBw
YWNrZXRzLiAgVGhpcw0KPj4gKwkgKiBhbGxvd3MgZm9yIHN5c3RlbXMgd2l0aCBsYXJnZXIgYnVz
IGxhdGVuY2llcyB0byBoYXZlIHNvbWUgaGVhZHJvb20NCj4+ICsJICogZm9yIGVuZHBvaW50cyB0
aGF0IGhhdmUgYSBsYXJnZSBiTWF4QnVyc3QgdmFsdWUuDQo+PiArCSAqLw0KPj4gKwl0eF9maWZv
X3Jlc2l6ZV9tYXhfbnVtID0gNjsNCj4+ICsNCj4+ICAJZHdjLT5tYXhpbXVtX3NwZWVkID0gdXNi
X2dldF9tYXhpbXVtX3NwZWVkKGRldik7DQo+PiAgCWR3Yy0+bWF4X3NzcF9yYXRlID0gdXNiX2dl
dF9tYXhpbXVtX3NzcF9yYXRlKGRldik7DQo+PiAgCWR3Yy0+ZHJfbW9kZSA9IHVzYl9nZXRfZHJf
bW9kZShkZXYpOw0KPj4gQEAgLTEzMjUsNiArMTMzMywxMSBAQCBzdGF0aWMgdm9pZCBkd2MzX2dl
dF9wcm9wZXJ0aWVzKHN0cnVjdCBkd2MzICpkd2MpDQo+PiAgCQkJCSZ0eF90aHJfbnVtX3BrdF9w
cmQpOw0KPj4gIAlkZXZpY2VfcHJvcGVydHlfcmVhZF91OChkZXYsICJzbnBzLHR4LW1heC1idXJz
dC1wcmQiLA0KPj4gIAkJCQkmdHhfbWF4X2J1cnN0X3ByZCk7DQo+PiArCWR3Yy0+ZG9fZmlmb19y
ZXNpemUgPSBkZXZpY2VfcHJvcGVydHlfcmVhZF9ib29sKGRldiwNCj4+ICsJCQkJCQkJInR4LWZp
Zm8tcmVzaXplIik7DQo+PiArCWlmIChkd2MtPmRvX2ZpZm9fcmVzaXplKQ0KPj4gKwkJZGV2aWNl
X3Byb3BlcnR5X3JlYWRfdTgoZGV2LCAidHgtZmlmby1tYXgtbnVtIiwNCj4+ICsJCQkJCSZ0eF9m
aWZvX3Jlc2l6ZV9tYXhfbnVtKTsNCj4gDQo+IFdoeSBpcyB0aGlzIGNoZWNrIGhlcmU/IFRoZSBk
d2MtPnR4X2ZpZm9fcmVzaXplX21heF9udW0gc2hvdWxkIHN0b3JlDQo+IHdoYXRldmVyIHByb3Bl
cnR5IHRoZSB1c2VyIHNldHMuIFdoZXRoZXIgdGhlIGRyaXZlciB3YW50cyB0byB1c2UgdGhpcw0K
PiBwcm9wZXJ0eSBzaG91bGQgZGVwZW5kIG9uICJkd2MtPmRvX2ZpZm9fcmVzaXplIi4gQWxzbyB3
aHkgZG9uJ3Qgd2UgaGF2ZQ0KPiAic25wcywiIHByZWZpeCB0byBiZSBjb25zaXN0ZW50IHdpdGgg
dGhlIG90aGVyIHByb3BlcnRpZXM/DQo+IA0KPiBDYW4gd2UgZW5mb3JjZSB0byBhIHNpbmdsZSBw
cm9wZXJ0eT8gSWYgdGhlIGRlc2lnbmVyIHdhbnRzIHRvIGVuYWJsZQ0KPiB0aGlzIGZlYXR1cmUs
IGhlL3NoZSBjYW4gdG8gcHJvdmlkZSB0aGUgdHgtZmlmby1tYXgtbnVtLiBUaGlzIHdvdWxkDQo+
IHNpbXBsaWZ5IHRoZSBkcml2ZXIgYSBiaXQuIFNpbmNlIHRoaXMgaXMgdG8gb3B0aW1pemUgZm9y
IHBlcmZvcm1hbmNlLA0KPiB0aGUgdXNlciBzaG91bGQga25vdy93YW50L3Rlc3QgdGhlIHNwZWNp
ZmljIHZhbHVlIGlmIHRoZXkgd2FudCB0byBzZXQNCj4gZm9yIHRoZWlyIHNldHVwIGFuZCBub3Qg
aG9waW5nIHRoYXQgdGhlIGRlZmF1bHQgc2V0dGluZyBub3QgYnJlYWsgdGhlaXINCj4gc2V0dXAu
IFNvIHdlIGNhbiByZW1vdmUgdGhlICJkb19maWZvX3Jlc2l6ZSIgcHJvcGVydHkgYW5kIGp1c3Qg
Y2hlY2sNCj4gd2hldGhlciB0eF9maWZvX3Jlc2l6ZV9tYXhfbnVtIGlzIHNldC4NCj4gDQo+PiAg
DQo+PiAgCWR3Yy0+ZGlzYWJsZV9zY3JhbWJsZV9xdWlyayA9IGRldmljZV9wcm9wZXJ0eV9yZWFk
X2Jvb2woZGV2LA0KPj4gIAkJCQkic25wcyxkaXNhYmxlX3NjcmFtYmxlX3F1aXJrIik7DQo+PiBA
QCAtMTM5MCw2ICsxNDAzLDggQEAgc3RhdGljIHZvaWQgZHdjM19nZXRfcHJvcGVydGllcyhzdHJ1
Y3QgZHdjMyAqZHdjKQ0KPj4gIAlkd2MtPnR4X21heF9idXJzdF9wcmQgPSB0eF9tYXhfYnVyc3Rf
cHJkOw0KPj4gIA0KPj4gIAlkd2MtPmltb2RfaW50ZXJ2YWwgPSAwOw0KPj4gKw0KPj4gKwlkd2Mt
PnR4X2ZpZm9fcmVzaXplX21heF9udW0gPSB0eF9maWZvX3Jlc2l6ZV9tYXhfbnVtOw0KPiANCj4g
U2VlIGNvbW1lbnQgYWJvdmUNCj4gDQo+PiAgfQ0KPj4gIA0KPj4gIC8qIGNoZWNrIHdoZXRoZXIg
dGhlIGNvcmUgc3VwcG9ydHMgSU1PRCAqLw0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3
YzMvY29yZS5oIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4+IGluZGV4IGRjY2RmMTMuLjcz
NWU5YmUgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPj4gKysrIGIv
ZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4+IEBAIC0xMDIzLDYgKzEwMjMsNyBAQCBzdHJ1Y3Qg
ZHdjM19zY3JhdGNocGFkX2FycmF5IHsNCj4+ICAgKiBAcnhfbWF4X2J1cnN0X3ByZDogbWF4IHBl
cmlvZGljIEVTUyByZWNlaXZlIGJ1cnN0IHNpemUNCj4+ICAgKiBAdHhfdGhyX251bV9wa3RfcHJk
OiBwZXJpb2RpYyBFU1MgdHJhbnNtaXQgcGFja2V0IGNvdW50DQo+PiAgICogQHR4X21heF9idXJz
dF9wcmQ6IG1heCBwZXJpb2RpYyBFU1MgdHJhbnNtaXQgYnVyc3Qgc2l6ZQ0KPj4gKyAqIEB0eF9m
aWZvX3Jlc2l6ZV9tYXhfbnVtOiBtYXggbnVtYmVyIG9mIGZpZm9zIGFsbG9jYXRlZCBkdXJpbmcg
dHhmaWZvIHJlc2l6ZQ0KPj4gICAqIEBoc3BoeV9pbnRlcmZhY2U6ICJ1dG1pIiBvciAidWxwaSIN
Cj4+ICAgKiBAY29ubmVjdGVkOiB0cnVlIHdoZW4gd2UncmUgY29ubmVjdGVkIHRvIGEgaG9zdCwg
ZmFsc2Ugb3RoZXJ3aXNlDQo+PiAgICogQGRlbGF5ZWRfc3RhdHVzOiB0cnVlIHdoZW4gZ2FkZ2V0
IGRyaXZlciBhc2tzIGZvciBkZWxheWVkIHN0YXR1cw0KPj4gQEAgLTEwMzcsNiArMTAzOCw3IEBA
IHN0cnVjdCBkd2MzX3NjcmF0Y2hwYWRfYXJyYXkgew0KPj4gICAqCTEJLSB1dG1pX2wxX3N1c3Bl
bmRfbg0KPj4gICAqIEBpc19mcGdhOiB0cnVlIHdoZW4gd2UgYXJlIHVzaW5nIHRoZSBGUEdBIGJv
YXJkDQo+PiAgICogQHBlbmRpbmdfZXZlbnRzOiB0cnVlIHdoZW4gd2UgaGF2ZSBwZW5kaW5nIElS
UXMgdG8gYmUgaGFuZGxlZA0KPj4gKyAqIEBkb19maWZvX3Jlc2l6ZTogdHJ1ZSB3aGVuIHR4Zmlm
byByZXNpemluZyBpcyBlbmFibGVkIGZvciBkd2MzIGVuZHBvaW50cw0KPj4gICAqIEBwdWxsdXBz
X2Nvbm5lY3RlZDogdHJ1ZSB3aGVuIFJ1bi9TdG9wIGJpdCBpcyBzZXQNCj4+ICAgKiBAc2V0dXBf
cGFja2V0X3BlbmRpbmc6IHRydWUgd2hlbiB0aGVyZSdzIGEgU2V0dXAgUGFja2V0IGluIEZJRk8u
IFdvcmthcm91bmQNCj4+ICAgKiBAdGhyZWVfc3RhZ2Vfc2V0dXA6IHNldCBpZiB3ZSBwZXJmb3Jt
IGEgdGhyZWUgcGhhc2Ugc2V0dXANCj4+IEBAIC0xMDc5LDYgKzEwODEsMTEgQEAgc3RydWN0IGR3
YzNfc2NyYXRjaHBhZF9hcnJheSB7DQo+PiAgICogQGRpc19zcGxpdF9xdWlyazogc2V0IHRvIGRp
c2FibGUgc3BsaXQgYm91bmRhcnkuDQo+PiAgICogQGltb2RfaW50ZXJ2YWw6IHNldCB0aGUgaW50
ZXJydXB0IG1vZGVyYXRpb24gaW50ZXJ2YWwgaW4gMjUwbnMNCj4+ICAgKgkJCWluY3JlbWVudHMg
b3IgMCB0byBkaXNhYmxlLg0KPj4gKyAqIEBtYXhfY2ZnX2VwczogY3VycmVudCBtYXggbnVtYmVy
IG9mIElOIGVwcyB1c2VkIGFjcm9zcyBhbGwgVVNCIGNvbmZpZ3MuDQo+PiArICogQGxhc3RfZmlm
b19kZXB0aDogbGFzdCBmaWZvIGRlcHRoIHVzZWQgdG8gZGV0ZXJtaW5lIG5leHQgZmlmbyByYW0g
c3RhcnQNCj4+ICsgKgkJICAgICBhZGRyZXNzLg0KPj4gKyAqIEBudW1fZXBfcmVzaXplZDogY2Fy
cmllcyB0aGUgY3VycmVudCBudW1iZXIgZW5kcG9pbnRzIHdoaWNoIGhhdmUgaGFkIGl0cyB0eA0K
Pj4gKyAqCQkgICAgZmlmbyByZXNpemVkLg0KPj4gICAqLw0KPj4gIHN0cnVjdCBkd2MzIHsNCj4+
ICAJc3RydWN0IHdvcmtfc3RydWN0CWRyZF93b3JrOw0KPj4gQEAgLTEyMzMsNiArMTI0MCw3IEBA
IHN0cnVjdCBkd2MzIHsNCj4+ICAJdTgJCQlyeF9tYXhfYnVyc3RfcHJkOw0KPj4gIAl1OAkJCXR4
X3Rocl9udW1fcGt0X3ByZDsNCj4+ICAJdTgJCQl0eF9tYXhfYnVyc3RfcHJkOw0KPj4gKwl1OAkJ
CXR4X2ZpZm9fcmVzaXplX21heF9udW07DQo+PiAgDQo+PiAgCWNvbnN0IGNoYXIJCSpoc3BoeV9p
bnRlcmZhY2U7DQo+PiAgDQo+PiBAQCAtMTI0Niw2ICsxMjU0LDcgQEAgc3RydWN0IGR3YzMgew0K
Pj4gIAl1bnNpZ25lZAkJaXNfdXRtaV9sMV9zdXNwZW5kOjE7DQo+PiAgCXVuc2lnbmVkCQlpc19m
cGdhOjE7DQo+PiAgCXVuc2lnbmVkCQlwZW5kaW5nX2V2ZW50czoxOw0KPj4gKwl1bnNpZ25lZAkJ
ZG9fZmlmb19yZXNpemU6MTsNCj4+ICAJdW5zaWduZWQJCXB1bGx1cHNfY29ubmVjdGVkOjE7DQo+
PiAgCXVuc2lnbmVkCQlzZXR1cF9wYWNrZXRfcGVuZGluZzoxOw0KPj4gIAl1bnNpZ25lZAkJdGhy
ZWVfc3RhZ2Vfc2V0dXA6MTsNCj4+IEBAIC0xMjgxLDYgKzEyOTAsMTAgQEAgc3RydWN0IGR3YzMg
ew0KPj4gIAl1bnNpZ25lZAkJZGlzX3NwbGl0X3F1aXJrOjE7DQo+PiAgDQo+PiAgCXUxNgkJCWlt
b2RfaW50ZXJ2YWw7DQo+PiArDQo+PiArCWludAkJCW1heF9jZmdfZXBzOw0KPj4gKwlpbnQJCQls
YXN0X2ZpZm9fZGVwdGg7DQo+PiArCWludAkJCW51bV9lcF9yZXNpemVkOw0KPj4gIH07DQo+PiAg
DQo+PiAgI2RlZmluZSBJTkNSWF9CVVJTVF9NT0RFIDANCj4+IEBAIC0xNTEyLDYgKzE1MjUsNyBA
QCBpbnQgZHdjM19zZW5kX2dhZGdldF9lcF9jbWQoc3RydWN0IGR3YzNfZXAgKmRlcCwgdW5zaWdu
ZWQgaW50IGNtZCwNCj4+ICAJCXN0cnVjdCBkd2MzX2dhZGdldF9lcF9jbWRfcGFyYW1zICpwYXJh
bXMpOw0KPj4gIGludCBkd2MzX3NlbmRfZ2FkZ2V0X2dlbmVyaWNfY29tbWFuZChzdHJ1Y3QgZHdj
MyAqZHdjLCB1bnNpZ25lZCBpbnQgY21kLA0KPj4gIAkJdTMyIHBhcmFtKTsNCj4+ICt2b2lkIGR3
YzNfZ2FkZ2V0X2NsZWFyX3R4X2ZpZm9zKHN0cnVjdCBkd2MzICpkd2MpOw0KPj4gICNlbHNlDQo+
PiAgc3RhdGljIGlubGluZSBpbnQgZHdjM19nYWRnZXRfaW5pdChzdHJ1Y3QgZHdjMyAqZHdjKQ0K
Pj4gIHsgcmV0dXJuIDA7IH0NCj4+IEBAIC0xNTMxLDYgKzE1NDUsOCBAQCBzdGF0aWMgaW5saW5l
IGludCBkd2MzX3NlbmRfZ2FkZ2V0X2VwX2NtZChzdHJ1Y3QgZHdjM19lcCAqZGVwLCB1bnNpZ25l
ZCBpbnQgY21kLA0KPj4gIHN0YXRpYyBpbmxpbmUgaW50IGR3YzNfc2VuZF9nYWRnZXRfZ2VuZXJp
Y19jb21tYW5kKHN0cnVjdCBkd2MzICpkd2MsDQo+PiAgCQlpbnQgY21kLCB1MzIgcGFyYW0pDQo+
PiAgeyByZXR1cm4gMDsgfQ0KPj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBkd2MzX2dhZGdldF9jbGVh
cl90eF9maWZvcyhzdHJ1Y3QgZHdjMyAqZHdjKQ0KPj4gK3sgfQ0KPj4gICNlbmRpZg0KPj4gIA0K
Pj4gICNpZiBJU19FTkFCTEVEKENPTkZJR19VU0JfRFdDM19EVUFMX1JPTEUpDQo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy91c2IvZHdjMy9lcDAuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZXAwLmMNCj4+
IGluZGV4IDNjZDI5NDIuLmQyOGQwODUgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3VzYi9kd2Mz
L2VwMC5jDQo+PiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2VwMC5jDQo+PiBAQCAtNjE5LDYgKzYx
OSw4IEBAIHN0YXRpYyBpbnQgZHdjM19lcDBfc2V0X2NvbmZpZyhzdHJ1Y3QgZHdjMyAqZHdjLCBz
dHJ1Y3QgdXNiX2N0cmxyZXF1ZXN0ICpjdHJsKQ0KPj4gIAkJcmV0dXJuIC1FSU5WQUw7DQo+PiAg
DQo+PiAgCWNhc2UgVVNCX1NUQVRFX0FERFJFU1M6DQo+PiArCQlkd2MzX2dhZGdldF9jbGVhcl90
eF9maWZvcyhkd2MpOw0KPj4gKw0KPj4gIAkJcmV0ID0gZHdjM19lcDBfZGVsZWdhdGVfcmVxKGR3
YywgY3RybCk7DQo+PiAgCQkvKiBpZiB0aGUgY2ZnIG1hdGNoZXMgYW5kIHRoZSBjZmcgaXMgbm9u
IHplcm8gKi8NCj4+ICAJCWlmIChjZmcgJiYgKCFyZXQgfHwgKHJldCA9PSBVU0JfR0FER0VUX0RF
TEFZRURfU1RBVFVTKSkpIHsNCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdl
dC5jIGIvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPj4gaW5kZXggYWY2ZDdmMS4uZTU2ZjFh
NiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4+ICsrKyBiL2Ry
aXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4+IEBAIC02MzIsNiArNjMyLDE4NyBAQCBzdGF0aWMg
dm9pZCBkd2MzX3N0b3BfYWN0aXZlX3RyYW5zZmVyKHN0cnVjdCBkd2MzX2VwICpkZXAsIGJvb2wg
Zm9yY2UsDQo+PiAgCQlib29sIGludGVycnVwdCk7DQo+PiAgDQo+PiAgLyoqDQo+PiArICogZHdj
M19nYWRnZXRfY2FsY190eF9maWZvX3NpemUgLSBjYWxjdWxhdGVzIHRoZSB0eGZpZm8gc2l6ZSB2
YWx1ZQ0KPj4gKyAqIEBkd2M6IHBvaW50ZXIgdG8gdGhlIERXQzMgY29udGV4dA0KPj4gKyAqIEBu
Zmlmb3M6IG51bWJlciBvZiBmaWZvcyB0byBjYWxjdWxhdGUgZm9yDQo+PiArICoNCj4+ICsgKiBD
YWxjdWxhdGVzIHRoZSBzaXplIHZhbHVlIGJhc2VkIG9uIHRoZSBlcXVhdGlvbiBiZWxvdzoNCj4+
ICsgKg0KPj4gKyAqIERXQzMgcmV2aXNpb24gMjgwQSBhbmQgcHJpb3I6DQo+PiArICogZmlmb19z
aXplID0gbXVsdCAqIChtYXhfcGFja2V0IC8gbWR3aWR0aCkgKyAxOw0KPj4gKyAqDQo+PiArICog
RFdDMyByZXZpc2lvbiAyOTBBIGFuZCBvbndhcmRzOg0KPj4gKyAqIGZpZm9fc2l6ZSA9IG11bHQg
KiAoKG1heF9wYWNrZXQgKyBtZHdpZHRoKS9tZHdpZHRoICsgMSkgKyAxDQo+PiArICoNCj4+ICsg
KiBUaGUgbWF4IHBhY2tldCBzaXplIGlzIHNldCB0byAxMDI0LCBhcyB0aGUgdHhmaWZvIHJlcXVp
cmVtZW50cyBtYWlubHkgYXBwbHkNCj4+ICsgKiB0byBzdXBlciBzcGVlZCBVU0IgdXNlIGNhc2Vz
LiAgSG93ZXZlciwgaXQgaXMgc2FmZSB0byBvdmVyZXN0aW1hdGUgdGhlIGZpZm8NCj4+ICsgKiBh
bGxvY2F0aW9ucyBmb3Igb3RoZXIgc2NlbmFyaW9zLCBpLmUuIGhpZ2ggc3BlZWQgVVNCLg0KPj4g
KyAqLw0KPj4gK3N0YXRpYyBpbnQgZHdjM19nYWRnZXRfY2FsY190eF9maWZvX3NpemUoc3RydWN0
IGR3YzMgKmR3YywgaW50IG11bHQpDQoNCiJtdWx0IiBzaG91bGQgYmUgIm5maWZvcyIganVzdCBh
cyBkb2N1bWVudGVkIGF0IHRoZSBzdGFydCBvZiB0aGUgZnVuY3Rpb24uDQoNCj4+ICt7DQo+PiAr
CWludCBtYXhfcGFja2V0ID0gMTAyNDsNCj4+ICsJaW50IGZpZm9fc2l6ZTsNCj4+ICsJaW50IG1k
d2lkdGg7DQo+PiArDQo+PiArCW1kd2lkdGggPSBkd2MzX21kd2lkdGgoZHdjKTsNCg0KZHdjM19t
ZHdpZHRoKCkgcmV0dXJucyB1MzIgdHlwZSwgY2FuIHdlIGtlZXAgaXQgY29uc2lzdGVudCBhbmQg
dXNlDQp1bnNpZ25lZCB0eXBlcyB3aGVyZSBpdCBtYWtlcyBzZW5zZT8gKHNhbWUgZm9yIGR3Yy0+
bWF4X2NmZ19lcHMsDQpsYXN0X2ZpZm9fZGVwdGgsIGFuZCBudW1fZXBfcmVzaXplZCkNCg0KQWxz
bywgbGV0J3MgaGF2ZSB0aGlzIGZ1bmN0aW9uIHJldHVybiB0eXBlIHUzMiB0b28uIFVzdWFsbHkg
aW50IGltcGxpZXMNCml0IG1heSByZXR1cm4gYW4gZXJyb3IgY29kZS4NCg0KPj4gKw0KPj4gKwkv
KiBNRFdJRFRIIGlzIHJlcHJlc2VudGVkIGluIGJpdHMsIHdlIG5lZWQgaXQgaW4gYnl0ZXMgKi8N
Cj4+ICsJbWR3aWR0aCA+Pj0gMzsNCg0KSXQncyB1bmxpa2VseSwgYnV0IGxldCdzIGNoZWNrIGlm
IG1kd2lkdGggaXMgbm90IDAuDQoNCj4+ICsNCj4+ICsJaWYgKERXQzNfVkVSX0lTX1BSSU9SKERX
QzMsIDI5MEEpKQ0KPj4gKwkJZmlmb19zaXplID0gbXVsdCAqIChtYXhfcGFja2V0IC8gbWR3aWR0
aCkgKyAxOw0KPj4gKwllbHNlDQo+PiArCQlmaWZvX3NpemUgPSBtdWx0ICogKChtYXhfcGFja2V0
ICsgbWR3aWR0aCkgLyBtZHdpZHRoKSArIDE7DQoNClBsZWFzZSBhZGQgYmxhbmsgbGluZSBoZXJl
Lg0KDQo+PiArCXJldHVybiBmaWZvX3NpemU7DQo+PiArfQ0KPj4gKw0KPj4gKy8qKg0KPj4gKyAq
IGR3YzNfZ2FkZ2V0X2NsZWFyX3R4X2ZpZm9fc2l6ZSAtIENsZWFycyB0eGZpZm8gYWxsb2NhdGlv
bg0KPj4gKyAqIEBkd2M6IHBvaW50ZXIgdG8gdGhlIERXQzMgY29udGV4dA0KPj4gKyAqDQo+PiAr
ICogSXRlcmF0ZXMgdGhyb3VnaCBhbGwgdGhlIGVuZHBvaW50IHJlZ2lzdGVycyBhbmQgY2xlYXJz
IHRoZSBwcmV2aW91cyB0eGZpZm8NCj4+ICsgKiBhbGxvY2F0aW9ucy4NCj4+ICsgKi8NCj4+ICt2
b2lkIGR3YzNfZ2FkZ2V0X2NsZWFyX3R4X2ZpZm9zKHN0cnVjdCBkd2MzICpkd2MpDQo+PiArew0K
Pj4gKwlzdHJ1Y3QgZHdjM19lcCAqZGVwOw0KPj4gKwlpbnQgZmlmb19kZXB0aDsNCj4+ICsJaW50
IHNpemU7DQo+PiArCWludCBudW07DQo+PiArDQo+PiArCWlmICghZHdjLT5kb19maWZvX3Jlc2l6
ZSkNCj4+ICsJCXJldHVybjsNCj4+ICsNCj4+ICsJLyogUmVhZCBlcDBJTiByZWxhdGVkIFRYRklG
TyBzaXplICovDQo+PiArCWRlcCA9IGR3Yy0+ZXBzWzFdOw0KPj4gKwlzaXplID0gZHdjM19yZWFk
bChkd2MtPnJlZ3MsIERXQzNfR1RYRklGT1NJWigwKSk7DQo+PiArCWlmIChEV0MzX0lQX0lTKERX
QzMpKQ0KPj4gKwkJZmlmb19kZXB0aCA9IERXQzNfR1RYRklGT1NJWl9UWEZERVAoc2l6ZSk7DQo+
PiArCWVsc2UNCj4+ICsJCWZpZm9fZGVwdGggPSBEV0MzMV9HVFhGSUZPU0laX1RYRkRFUChzaXpl
KTsNCj4+ICsNCj4+ICsJZHdjLT5sYXN0X2ZpZm9fZGVwdGggPSBmaWZvX2RlcHRoOw0KPj4gKwkv
KiBDbGVhciBleGlzdGluZyBUWEZJRk8gZm9yIGFsbCBJTiBlcHMgZXhjZXB0IGVwMCAqLw0KPj4g
Kwlmb3IgKG51bSA9IDM7IG51bSA8IG1pbl90KGludCwgZHdjLT5udW1fZXBzLCBEV0MzX0VORFBP
SU5UU19OVU0pOw0KPj4gKwkgICAgIG51bSArPSAyKSB7DQo+PiArCQlkZXAgPSBkd2MtPmVwc1tu
dW1dOw0KPj4gKwkJLyogRG9uJ3QgY2hhbmdlIFRYRlJBTU5VTSBvbiB1c2IzMSB2ZXJzaW9uICov
DQo+PiArCQlzaXplID0gRFdDM19JUF9JUyhEV0MzKSA/IDAgOg0KPj4gKwkJCWR3YzNfcmVhZGwo
ZHdjLT5yZWdzLCBEV0MzX0dUWEZJRk9TSVoobnVtID4+IDEpKSAmDQo+PiArCQkJCSAgIERXQzMx
X0dUWEZJRk9TSVpfVFhGUkFNTlVNOw0KPj4gKw0KPj4gKwkJZHdjM193cml0ZWwoZHdjLT5yZWdz
LCBEV0MzX0dUWEZJRk9TSVoobnVtID4+IDEpLCBzaXplKTsNCj4+ICsJfQ0KPj4gKwlkd2MtPm51
bV9lcF9yZXNpemVkID0gMDsNCj4+ICt9DQo+PiArDQo+PiArLyoNCj4+ICsgKiBkd2MzX2dhZGdl
dF9yZXNpemVfdHhfZmlmb3MgLSByZWFsbG9jYXRlIGZpZm8gc3BhY2VzIGZvciBjdXJyZW50IHVz
ZS1jYXNlDQo+PiArICogQGR3YzogcG9pbnRlciB0byBvdXIgY29udGV4dCBzdHJ1Y3R1cmUNCj4+
ICsgKg0KPj4gKyAqIFRoaXMgZnVuY3Rpb24gd2lsbCBhIGJlc3QgZWZmb3J0IEZJRk8gYWxsb2Nh
dGlvbiBpbiBvcmRlcg0KPj4gKyAqIHRvIGltcHJvdmUgRklGTyB1c2FnZSBhbmQgdGhyb3VnaHB1
dCwgd2hpbGUgc3RpbGwgYWxsb3dpbmcNCj4+ICsgKiB1cyB0byBlbmFibGUgYXMgbWFueSBlbmRw
b2ludHMgYXMgcG9zc2libGUuDQo+PiArICoNCj4+ICsgKiBLZWVwIGluIG1pbmQgdGhhdCB0aGlz
IG9wZXJhdGlvbiB3aWxsIGJlIGhpZ2hseSBkZXBlbmRlbnQNCj4+ICsgKiBvbiB0aGUgY29uZmln
dXJlZCBzaXplIGZvciBSQU0xIC0gd2hpY2ggY29udGFpbnMgVHhGaWZvIC0sDQo+PiArICogdGhl
IGFtb3VudCBvZiBlbmRwb2ludHMgZW5hYmxlZCBvbiBjb3JlQ29uc3VsdGFudCB0b29sLCBhbmQN
Cj4+ICsgKiB0aGUgd2lkdGggb2YgdGhlIE1hc3RlciBCdXMuDQo+PiArICoNCj4+ICsgKiBJbiBn
ZW5lcmFsLCBGSUZPIGRlcHRocyBhcmUgcmVwcmVzZW50ZWQgd2l0aCB0aGUgZm9sbG93aW5nIGVx
dWF0aW9uOg0KPj4gKyAqDQo+PiArICogZmlmb19zaXplID0gbXVsdCAqICgobWF4X3BhY2tldCAr
IG1kd2lkdGgpL21kd2lkdGggKyAxKSArIDENCj4+ICsgKg0KPj4gKyAqIEluIGNvbmp1bmN0aW9u
IHdpdGggZHdjM19nYWRnZXRfY2hlY2tfY29uZmlnKCksIHRoaXMgcmVzaXppbmcgbG9naWMgd2ls
bA0KPj4gKyAqIGVuc3VyZSB0aGF0IGFsbCBlbmRwb2ludHMgd2lsbCBoYXZlIGVub3VnaCBpbnRl
cm5hbCBtZW1vcnkgZm9yIG9uZSBtYXgNCj4+ICsgKiBwYWNrZXQgcGVyIGVuZHBvaW50Lg0KPj4g
KyAqLw0KPj4gK3N0YXRpYyBpbnQgZHdjM19nYWRnZXRfcmVzaXplX3R4X2ZpZm9zKHN0cnVjdCBk
d2MzX2VwICpkZXApDQo+PiArew0KPj4gKwlzdHJ1Y3QgZHdjMyAqZHdjID0gZGVwLT5kd2M7DQo+
PiArCWludCBmaWZvXzBfc3RhcnQ7DQo+PiArCWludCByYW0xX2RlcHRoOw0KPj4gKwlpbnQgZmlm
b19zaXplOw0KPj4gKwlpbnQgbWluX2RlcHRoOw0KPj4gKwlpbnQgbnVtX2luX2VwOw0KPj4gKwlp
bnQgcmVtYWluaW5nOw0KPj4gKwlpbnQgbnVtX2ZpZm9zID0gMTsNCj4+ICsJaW50IGZpZm87DQo+
PiArCWludCB0bXA7DQo+PiArDQo+PiArCWlmICghZHdjLT5kb19maWZvX3Jlc2l6ZSkNCj4+ICsJ
CXJldHVybiAwOw0KPj4gKw0KPj4gKwkvKiByZXNpemUgSU4gZW5kcG9pbnRzIGV4Y2VwdCBlcDAg
Ki8NCj4+ICsJaWYgKCF1c2JfZW5kcG9pbnRfZGlyX2luKGRlcC0+ZW5kcG9pbnQuZGVzYykgfHwg
ZGVwLT5udW1iZXIgPD0gMSkNCj4+ICsJCXJldHVybiAwOw0KPiANCj4+ICsNCj4+ICsJcmFtMV9k
ZXB0aCA9IERXQzNfUkFNMV9ERVBUSChkd2MtPmh3cGFyYW1zLmh3cGFyYW1zNyk7DQo+PiArDQo+
PiArCWlmICgoZGVwLT5lbmRwb2ludC5tYXhidXJzdCA+IDEgJiYNCj4+ICsJICAgICB1c2JfZW5k
cG9pbnRfeGZlcl9idWxrKGRlcC0+ZW5kcG9pbnQuZGVzYykpIHx8DQo+PiArCSAgICB1c2JfZW5k
cG9pbnRfeGZlcl9pc29jKGRlcC0+ZW5kcG9pbnQuZGVzYykpDQo+PiArCQludW1fZmlmb3MgPSAz
Ow0KPj4gKw0KPj4gKwlpZiAoZGVwLT5lbmRwb2ludC5tYXhidXJzdCA+IDYgJiYNCj4+ICsJICAg
IHVzYl9lbmRwb2ludF94ZmVyX2J1bGsoZGVwLT5lbmRwb2ludC5kZXNjKSAmJiBEV0MzX0lQX0lT
KERXQzMxKSkNCj4+ICsJCW51bV9maWZvcyA9IGR3Yy0+dHhfZmlmb19yZXNpemVfbWF4X251bTsN
Cj4gDQo+IFdoeSBvbmx5IGJ1bGs/IElzb2Mgc2hvdWxkIGJlIGF0IGxlYXN0IGVxdWFsIG9yIG1v
cmUgdGhhbiBidWxrLg0KPiBBbHNvLCBtYWtlIHRoaXMgYXBwbGljYWJsZSB0byBEV0NfdXNiMzIg
YWxzby4NCj4gDQo+PiArDQo+PiArCS8qIEZJRk8gc2l6ZSBmb3IgYSBzaW5nbGUgYnVmZmVyICov
DQo+PiArCWZpZm8gPSBkd2MzX2dhZGdldF9jYWxjX3R4X2ZpZm9fc2l6ZShkd2MsIDEpOw0KPj4g
Kw0KPj4gKwkvKiBDYWxjdWxhdGUgdGhlIG51bWJlciBvZiByZW1haW5pbmcgRVBzIHcvbyBhbnkg
RklGTyAqLw0KPj4gKwludW1faW5fZXAgPSBkd2MtPm1heF9jZmdfZXBzOw0KPj4gKwludW1faW5f
ZXAgLT0gZHdjLT5udW1fZXBfcmVzaXplZDsNCj4gDQo+IERvZXMgdGhpcyBjYWxjdWxhdGlvbiBh
Y2NvdW50IGZvciBtdWx0aXBsZSBhbHQtc2V0dGluZyBpbnRlcmZhY2VzPw0KPiANCj4+ICsNCj4+
ICsJLyogUmVzZXJ2ZSBhdCBsZWFzdCBvbmUgRklGTyBmb3IgdGhlIG51bWJlciBvZiBJTiBFUHMg
Ki8NCj4+ICsJbWluX2RlcHRoID0gbnVtX2luX2VwICogKGZpZm8gKyAxKTsNCj4+ICsJcmVtYWlu
aW5nID0gcmFtMV9kZXB0aCAtIG1pbl9kZXB0aCAtIGR3Yy0+bGFzdF9maWZvX2RlcHRoOw0KPj4g
KwlyZW1haW5pbmcgPSBtYXhfdChpbnQsIDAsIHJlbWFpbmluZyk7DQo+IA0KPiBBZGQgYmxhbmsg
bGluZQ0KPiANCj4+ICsJLyoNCj4+ICsJICogV2UndmUgYWxyZWFkeSByZXNlcnZlZCAxIEZJRk8g
cGVyIEVQLCBzbyBjaGVjayB3aGF0IHdlIGNhbiBmaXQgaW4NCj4+ICsJICogYWRkaXRpb24gdG8g
aXQuICBJZiB0aGVyZSBpcyBub3QgZW5vdWdoIHJlbWFpbmluZyBzcGFjZSwgYWxsb2NhdGUNCj4+
ICsJICogYWxsIHRoZSByZW1haW5pbmcgc3BhY2UgdG8gdGhlIEVQLg0KPj4gKwkgKi8NCj4+ICsJ
Zmlmb19zaXplID0gKG51bV9maWZvcyAtIDEpICogZmlmbzsNCj4+ICsJaWYgKHJlbWFpbmluZyA8
IGZpZm9fc2l6ZSkNCj4+ICsJCWZpZm9fc2l6ZSA9IHJlbWFpbmluZzsNCj4+ICsNCj4+ICsJZmlm
b19zaXplICs9IGZpZm87DQo+PiArCS8qIExhc3QgaW5jcmVtZW50IGFjY29yZGluZyB0byB0aGUg
VFggRklGTyBzaXplIGVxdWF0aW9uICovDQo+PiArCWZpZm9fc2l6ZSsrOw0KPj4gKw0KPj4gKwkv
KiBDaGVjayBpZiBUWEZJRk9zIHN0YXJ0IGF0IG5vbi16ZXJvIGFkZHIgKi8NCj4+ICsJdG1wID0g
ZHdjM19yZWFkbChkd2MtPnJlZ3MsIERXQzNfR1RYRklGT1NJWigwKSk7DQo+PiArCWZpZm9fMF9z
dGFydCA9IERXQzNfR1RYRklGT1NJWl9UWEZTVEFERFIodG1wKTsNCj4+ICsNCj4+ICsJZmlmb19z
aXplIHw9IChmaWZvXzBfc3RhcnQgKyAoZHdjLT5sYXN0X2ZpZm9fZGVwdGggPDwgMTYpKTsNCj4+
ICsJaWYgKERXQzNfSVBfSVMoRFdDMykpDQo+PiArCQlkd2MtPmxhc3RfZmlmb19kZXB0aCArPSBE
V0MzX0dUWEZJRk9TSVpfVFhGREVQKGZpZm9fc2l6ZSk7DQo+PiArCWVsc2UNCj4+ICsJCWR3Yy0+
bGFzdF9maWZvX2RlcHRoICs9IERXQzMxX0dUWEZJRk9TSVpfVFhGREVQKGZpZm9fc2l6ZSk7DQo+
PiArDQo+PiArCS8qIENoZWNrIGZpZm8gc2l6ZSBhbGxvY2F0aW9uIGRvZXNuJ3QgZXhjZWVkIGF2
YWlsYWJsZSBSQU0gc2l6ZS4gKi8NCj4+ICsJaWYgKGR3Yy0+bGFzdF9maWZvX2RlcHRoID49IHJh
bTFfZGVwdGgpIHsNCj4+ICsJCWRldl9lcnIoZHdjLT5kZXYsICJGaWZvc2l6ZSglZCkgPiBSQU0g
c2l6ZSglZCkgJXMgZGVwdGg6JWRcbiIsDQo+PiArCQkJZHdjLT5sYXN0X2ZpZm9fZGVwdGgsIHJh
bTFfZGVwdGgsDQo+PiArCQkJZGVwLT5lbmRwb2ludC5uYW1lLCBmaWZvX3NpemUpOw0KPj4gKwkJ
aWYgKERXQzNfSVBfSVMoRFdDMykpDQo+PiArCQkJZmlmb19zaXplID0gRFdDM19HVFhGSUZPU0la
X1RYRkRFUChmaWZvX3NpemUpOw0KPj4gKwkJZWxzZQ0KPj4gKwkJCWZpZm9fc2l6ZSA9IERXQzMx
X0dUWEZJRk9TSVpfVFhGREVQKGZpZm9fc2l6ZSk7DQo+PiArDQo+PiArCQlkd2MtPmxhc3RfZmlm
b19kZXB0aCAtPSBmaWZvX3NpemU7DQo+PiArCQlyZXR1cm4gLUVOT01FTTsNCj4+ICsJfQ0KPj4g
Kw0KPj4gKwlkd2MzX3dyaXRlbChkd2MtPnJlZ3MsIERXQzNfR1RYRklGT1NJWihkZXAtPm51bWJl
ciA+PiAxKSwgZmlmb19zaXplKTsNCj4+ICsJZHdjLT5udW1fZXBfcmVzaXplZCsrOw0KDQpJIHNl
ZSB0aGlzIG51bV9lcF9yZXNpemVkIGdldHMgaW5jcmVtZW50ZWQsIGJ1dCBJIGRvbid0IHNlZSB3
aGVyZSBpdA0KZ2V0cyBkZWNyZW1lbnRlZC4gUHJvYmFibHkgc2hvdWxkIGJlIGRvbmUgaW4gZXAg
ZGlzYWJsZS4gVGhpcyBkb2Vzbid0DQpzZWVtIHRvIGFjY291bnQgZm9yIG11bHRpcGxlIGFsdC1z
ZXR0aW5ncy4NCg0KPj4gKw0KPj4gKwlyZXR1cm4gMDsNCj4+ICt9DQo+PiArDQo+PiArLyoqDQo+
PiAgICogX19kd2MzX2dhZGdldF9lcF9lbmFibGUgLSBpbml0aWFsaXplcyBhIGh3IGVuZHBvaW50
DQo+PiAgICogQGRlcDogZW5kcG9pbnQgdG8gYmUgaW5pdGlhbGl6ZWQNCj4+ICAgKiBAYWN0aW9u
OiBvbmUgb2YgSU5JVCwgTU9ESUZZIG9yIFJFU1RPUkUNCj4+IEBAIC02NDgsNiArODI5LDEwIEBA
IHN0YXRpYyBpbnQgX19kd2MzX2dhZGdldF9lcF9lbmFibGUoc3RydWN0IGR3YzNfZXAgKmRlcCwg
dW5zaWduZWQgaW50IGFjdGlvbikNCj4+ICAJaW50CQkJcmV0Ow0KPj4gIA0KPj4gIAlpZiAoIShk
ZXAtPmZsYWdzICYgRFdDM19FUF9FTkFCTEVEKSkgew0KPj4gKwkJcmV0ID0gZHdjM19nYWRnZXRf
cmVzaXplX3R4X2ZpZm9zKGRlcCk7DQo+PiArCQlpZiAocmV0KQ0KPj4gKwkJCXJldHVybiByZXQ7
DQo+PiArDQo+PiAgCQlyZXQgPSBkd2MzX2dhZGdldF9zdGFydF9jb25maWcoZGVwKTsNCj4+ICAJ
CWlmIChyZXQpDQo+PiAgCQkJcmV0dXJuIHJldDsNCj4+IEBAIC0yNDk4LDYgKzI2ODMsNyBAQCBz
dGF0aWMgaW50IGR3YzNfZ2FkZ2V0X3N0b3Aoc3RydWN0IHVzYl9nYWRnZXQgKmcpDQo+PiAgDQo+
PiAgCXNwaW5fbG9ja19pcnFzYXZlKCZkd2MtPmxvY2ssIGZsYWdzKTsNCj4+ICAJZHdjLT5nYWRn
ZXRfZHJpdmVyCT0gTlVMTDsNCj4+ICsJZHdjLT5tYXhfY2ZnX2VwcyA9IDA7DQo+PiAgCXNwaW5f
dW5sb2NrX2lycXJlc3RvcmUoJmR3Yy0+bG9jaywgZmxhZ3MpOw0KPj4gIA0KPj4gIAlmcmVlX2ly
cShkd2MtPmlycV9nYWRnZXQsIGR3Yy0+ZXZfYnVmKTsNCj4+IEBAIC0yNTg1LDYgKzI3NzEsNTEg
QEAgc3RhdGljIGludCBkd2MzX2dhZGdldF92YnVzX2RyYXcoc3RydWN0IHVzYl9nYWRnZXQgKmcs
IHVuc2lnbmVkIGludCBtQSkNCj4+ICAJcmV0dXJuIHJldDsNCj4+ICB9DQo+PiAgDQo+PiArLyoq
DQo+PiArICogZHdjM19nYWRnZXRfY2hlY2tfY29uZmlnIC0gZW5zdXJlIGR3YzMgY2FuIHN1cHBv
cnQgdGhlIFVTQiBjb25maWd1cmF0aW9uDQo+PiArICogQGc6IHBvaW50ZXIgdG8gdGhlIFVTQiBn
YWRnZXQNCj4+ICsgKg0KPj4gKyAqIFVzZWQgdG8gcmVjb3JkIHRoZSBtYXhpbXVtIG51bWJlciBv
ZiBlbmRwb2ludHMgYmVpbmcgdXNlZCBpbiBhIFVTQiBjb21wb3NpdGUNCj4+ICsgKiBkZXZpY2Uu
IChhY3Jvc3MgYWxsIGNvbmZpZ3VyYXRpb25zKSAgVGhpcyBpcyB0byBiZSB1c2VkIGluIHRoZSBj
YWxjdWxhdGlvbg0KPj4gKyAqIG9mIHRoZSBUWEZJRk8gc2l6ZXMgd2hlbiByZXNpemluZyBpbnRl
cm5hbCBtZW1vcnkgZm9yIGluZGl2aWR1YWwgZW5kcG9pbnRzLg0KPj4gKyAqIEl0IHdpbGwgaGVs
cCBlbnN1cmVkIHRoYXQgdGhlIHJlc2l6aW5nIGxvZ2ljIHJlc2VydmVzIGVub3VnaCBzcGFjZSBm
b3IgYXQNCj4+ICsgKiBsZWFzdCBvbmUgbWF4IHBhY2tldC4NCj4+ICsgKi8NCj4+ICtzdGF0aWMg
aW50IGR3YzNfZ2FkZ2V0X2NoZWNrX2NvbmZpZyhzdHJ1Y3QgdXNiX2dhZGdldCAqZykNCj4+ICt7
DQo+PiArCXN0cnVjdCBkd2MzICpkd2MgPSBnYWRnZXRfdG9fZHdjKGcpOw0KPj4gKwlzdHJ1Y3Qg
dXNiX2VwICplcDsNCj4+ICsJaW50IGZpZm9fc2l6ZSA9IDA7DQo+PiArCWludCByYW0xX2RlcHRo
Ow0KPj4gKwlpbnQgZXBfbnVtID0gMDsNCj4+ICsNCj4+ICsJaWYgKCFkd2MtPmRvX2ZpZm9fcmVz
aXplKQ0KPj4gKwkJcmV0dXJuIDA7DQo+PiArDQo+PiArCWxpc3RfZm9yX2VhY2hfZW50cnkoZXAs
ICZnLT5lcF9saXN0LCBlcF9saXN0KSB7DQo+PiArCQkvKiBPbmx5IGludGVyZXN0ZWQgaW4gdGhl
IElOIGVuZHBvaW50cyAqLw0KPj4gKwkJaWYgKGVwLT5jbGFpbWVkICYmIChlcC0+YWRkcmVzcyAm
IFVTQl9ESVJfSU4pKQ0KPj4gKwkJCWVwX251bSsrOw0KPj4gKwl9DQo+PiArDQo+PiArCWlmIChl
cF9udW0gPD0gZHdjLT5tYXhfY2ZnX2VwcykNCj4+ICsJCXJldHVybiAwOw0KPj4gKw0KPj4gKwkv
KiBVcGRhdGUgdGhlIG1heCBudW1iZXIgb2YgZXBzIGluIHRoZSBjb21wb3NpdGlvbiAqLw0KPj4g
Kwlkd2MtPm1heF9jZmdfZXBzID0gZXBfbnVtOw0KPj4gKw0KPj4gKwlmaWZvX3NpemUgPSBkd2Mz
X2dhZGdldF9jYWxjX3R4X2ZpZm9fc2l6ZShkd2MsIGR3Yy0+bWF4X2NmZ19lcHMpOw0KPj4gKwkv
KiBCYXNlZCBvbiB0aGUgZXF1YXRpb24sIGluY3JlbWVudCBieSBvbmUgZm9yIGV2ZXJ5IGVwICov
DQo+PiArCWZpZm9fc2l6ZSArPSBkd2MtPm1heF9jZmdfZXBzOw0KPj4gKw0KPj4gKwkvKiBDaGVj
ayBpZiB3ZSBjYW4gZml0IGEgc2luZ2xlIGZpZm8gcGVyIGVuZHBvaW50ICovDQo+PiArCXJhbTFf
ZGVwdGggPSBEV0MzX1JBTTFfREVQVEgoZHdjLT5od3BhcmFtcy5od3BhcmFtczcpOw0KPj4gKwlp
ZiAoZmlmb19zaXplID4gcmFtMV9kZXB0aCkNCj4+ICsJCXJldHVybiAtRU5PTUVNOw0KDQpUaGlz
IHNlZW1zIGZyYWdpbGUuLi4gQ2FuIHdlIGZhbGwgYmFjayB0byB0aGUgZGVmYXVsdCBzZXR0aW5n
cyBpZiB0aGUgdHgNCmZpZm8gcmVzaXplIGRvZXNuJ3Qgd29yaz8gSSB0aGluayB0aGUgZnVuY3Rp
b24gd2lsbCBmYWlsIHRvIGJpbmQgaWYgdGhpcw0KZmFpbHMgcmlnaHQ/DQoNCj4+ICsNCj4+ICsJ
cmV0dXJuIDA7DQo+PiArfQ0KPj4gKw0KPj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdXNiX2dhZGdl
dF9vcHMgZHdjM19nYWRnZXRfb3BzID0gew0KPj4gIAkuZ2V0X2ZyYW1lCQk9IGR3YzNfZ2FkZ2V0
X2dldF9mcmFtZSwNCj4+ICAJLndha2V1cAkJCT0gZHdjM19nYWRnZXRfd2FrZXVwLA0KPj4gQEAg
LTI1OTYsNiArMjgyNyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdXNiX2dhZGdldF9vcHMgZHdj
M19nYWRnZXRfb3BzID0gew0KPj4gIAkudWRjX3NldF9zc3BfcmF0ZQk9IGR3YzNfZ2FkZ2V0X3Nl
dF9zc3BfcmF0ZSwNCj4+ICAJLmdldF9jb25maWdfcGFyYW1zCT0gZHdjM19nYWRnZXRfY29uZmln
X3BhcmFtcywNCj4+ICAJLnZidXNfZHJhdwkJPSBkd2MzX2dhZGdldF92YnVzX2RyYXcsDQo+PiAr
CS5jaGVja19jb25maWcJCT0gZHdjM19nYWRnZXRfY2hlY2tfY29uZmlnLA0KPj4gIH07DQo+PiAg
DQo+PiAgLyogLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gKi8NCj4+DQoNCkJSLA0KVGhpbmgNCg==
