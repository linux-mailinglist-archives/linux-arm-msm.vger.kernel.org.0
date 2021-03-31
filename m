Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB93934F5A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 02:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbhCaAxP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Mar 2021 20:53:15 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:47078 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232789AbhCaAwy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Mar 2021 20:52:54 -0400
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 90E9D4019F;
        Wed, 31 Mar 2021 00:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1617151974; bh=8mq5JDBi9a5xlLiCQJ/qnwY6Cwzyml/bB9OzO8vG3CI=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=eKE7ZiQ40bnwuB/Mth3wMG7pM6h+rQyz9fFYtBjcxr0n9KY7ZmfHSUQAwZYIFWWY+
         h0zJM2mqAK+qQzzSLutFoAGwRXwXf7CtHIaxo1oz/7f9drhyNlOPtKYLxDQ7Tm33vq
         ROObSDrQ0s35o0VcH5rVI0m4BYoRUPzMhgahJQdP4RCLuQT8yMDPJ3EtN+mGjLEhyr
         n72KfZYf0U5mLhq/KTlJG7yMJ0HHXFzOpSYmy61E/+st5ip6IcMNBMBXCSFeTcXiEv
         bESKO7JByTJHmbT4MDQRm2Fx2WSQlZaSs85p/nkOFJYEBClhrWupMfvdGf8T8DUhMD
         OUD0/vujGxQ+A==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 898C1A005E;
        Wed, 31 Mar 2021 00:52:51 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id A975B400A1;
        Wed, 31 Mar 2021 00:52:49 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="Gnyg2jIB";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lm56uN9RjxM/E3u3/+toF6KAeU8uek44Ml7Iz0vr2Qy+BXRD7Fa3vrfqHiMfoP7CmeQARrv+AMzY/1MA14kzS7IWP7MOrVOkLLtN5BjVfRhUG+gR6qTH+SmW03bLxy0eB6WseMyxYuvmr+m2wvw2/qVlV7URIEMXDAFUZwJtJq24ckl/XLyczQYxUqB2nd6EZcVqSmYnT/HseZljtISHGVF/TWKCRgJX3aWLca1LK8hBrHjuuLtCcGpJLwAH+uIi3H0vZHruBf8bf5MRU/NFEtV4g8W8g74NaoNda93HsnYAkOsF2ErofgqZzBMwb/C0DXaSbF8ook/lokrm9G+/VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8mq5JDBi9a5xlLiCQJ/qnwY6Cwzyml/bB9OzO8vG3CI=;
 b=AHKhf2Ebae/0SHWVnZEo/st27Q1z5v2Iw1KLq9LihoH8REQSMBfZfFq01YIFPc6nZGslsvKcdqcSssQFn40u/WAIl8bQ31zq1BC9o3T2tQh8wEO4pwii/3Pui+RwifUxpXM6ipD1UogtEIqjSBikkxdjAwkHkOIqRP8/5JbbCg4QOhji8xR0kwmNp/nrl4a7M/eXhZPV7vrLHYZfrATh5MH0QCnQwgROUj+CWMZ9cP4QobfgU6NOTSX5gZyhuf4PsEWFPAacvKWRXn9wkfEeRLOrqPThmK+pouGiLInTYf6IxZeym/NwNrW+pD52OVrP1Jt033eKSDECeKlchPFLqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8mq5JDBi9a5xlLiCQJ/qnwY6Cwzyml/bB9OzO8vG3CI=;
 b=Gnyg2jIBUxEcMShULIj+dvYylJMv2l3JaR3S3ijASsvCXjA9W2lfDSumGj75he/K12W8yjUQXRPiJ7jzCVgG4ZMfST5NkTy7O9ekevbEcioorpr1Qnv/9kdcriwZuBrs7LlFRA/hwKTabjgbJ0qYCN06jYQKOBrPZxnEZ3FfT4A=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB3527.namprd12.prod.outlook.com (2603:10b6:a03:13c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Wed, 31 Mar
 2021 00:52:48 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c%6]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 00:52:48 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Jack Pham <jackp@codeaurora.org>,
        Kathiravan T <kathirav@codeaurora.org>
CC:     Baruch Siach <baruch@tkos.co.il>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Balaji Prakash J <bjagadee@codeaurora.org>,
        "kathirav=codeaurora.org@codeaurora.org" 
        <kathirav=codeaurora.org@codeaurora.org>
Subject: Re: [PATCH] usb: dwc3: reference clock configuration
Thread-Topic: [PATCH] usb: dwc3: reference clock configuration
Thread-Index: AQHW/eInRTRYpSizoUSSkIWQR33qw6pOk/6AgAJXEQCACJDIAIAPtEuAgCnfp4CACoTIgA==
Date:   Wed, 31 Mar 2021 00:52:48 +0000
Message-ID: <d5acb192-80b9-36f7-43f5-81f21c4e6ba0@synopsys.com>
References: <8fc38cb73afd31269f1ea0c28e73604c53cebb17.1612764006.git.baruch@tkos.co.il>
 <YCGCRQpqVNI2KZyi@builder.lan> <87sg64wj01.fsf@tarshish>
 <e1a05b5c6bf70e62b526a7a7d70b1a12@codeaurora.org>
 <e460e5afb0661b5867ee089b3efb0bc5@codeaurora.org>
 <20210324081457.GB17922@jackp-linux.qualcomm.com>
In-Reply-To: <20210324081457.GB17922@jackp-linux.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 61d31cbd-70db-4d0c-f67c-08d8f3df4ddc
x-ms-traffictypediagnostic: BYAPR12MB3527:
x-microsoft-antispam-prvs: <BYAPR12MB35279A6811340B96D8D48A00AA7C9@BYAPR12MB3527.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /thx+pb09lnFTBcU0CXzclLq5gIs1xin4ydWaAB3HfrZZNUj2lLaLgpszYszO2Tjtk2OGYy/Vn808ArEPKjt8xKi+drkUUlRmGVKG7Cgfs78yIhPZTQ4p/H0A+T+bIrcTPvnGlLuy7+Ei9J7C1uQzMt8XlBEenaTYybULAzpS5Lcg7LW0h6zC/q588k6VtUrdRYF8HlxEHN2GDHSQJmrXOu4STPQts9D3msNWiR5GWM+V9oQWrcDyvYaLC8hSJYpkApxfdhF+k1JkeGG0zzqF6GpEb1zvfqFqPUZH2c4JLtg9KRWgupQw4PiIyKl7U22WiQVjaIBS5nHeSs3qDhUqiNPYI6tyMlKAX9UGb8zdtiBIpIjufsHSNdWI7QPJuUhDBj62mTyWC2Zb0bmPs2iGz9h1Q+jbLbdj7zMLhqEYqdtoUhKdx8gdaWvcc8dZE4VxNwRTA6OjoGiGhftfHOYC6TgHog0rX3VKnoU+g7zg7YxUN1KucIDCykPn+YW2zFulIEpUmADHShBctoiFWpB0MxOouT6gq0/4ZeVfRgRGBBeUPoE9GwlU2Z5OH6xfszqbwb5zJFslq95pZ+cysNwV70ip3f/YuX+n5XeJjUqxZp7XUThqBCZig58vtcBQyvorerTASaKWVOEkj6VKcbv3v3YX7gWFqoekTbL353LQvyPqX8+X/+qKHokH/TXiCjas+UbBfdNQSYxUL+AhtCeVA1Q1cO/7IWLDn7AjIOkSM8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(346002)(39860400002)(136003)(376002)(8936002)(66946007)(6506007)(6512007)(31696002)(66556008)(71200400001)(83380400001)(66476007)(4326008)(53546011)(2616005)(8676002)(31686004)(110136005)(36756003)(26005)(316002)(7416002)(54906003)(478600001)(5660300002)(6486002)(186003)(2906002)(86362001)(38100700001)(76116006)(66446008)(64756008)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?MVlFM2t3NHlkVzRJV1V5WFhwbWlaaHBJeE1FUlhUM0o0SDFRdTJQd1RtTElu?=
 =?utf-8?B?Tk5jSVhOeE4zcm1UamwreHJBaEJ4Y0dnWDI1dk1LT0p5cDZQZHQvTDQ1NFIx?=
 =?utf-8?B?U2hlYXVaUHZZdWtnU2NLZ1ZTWnhaZ0VZUGRuMkIzUVRlb2ZleEFqazdQdkdD?=
 =?utf-8?B?Q2w0TVJGaVhsdmQ5YjNzejNtTGlRVDluWGV2Wi8zbEwyRHBoMGtTYSthUC91?=
 =?utf-8?B?U1ovLzhmeDVlN250UllTemdlbkpOeEdmdWFCZWNwRjhCT3h0SHd4dTFUUjZv?=
 =?utf-8?B?YjFFYW5VY0RvUHpTcjBtVlF4ekgvcnVQSFBoK2QxRXY0MFlzUG5ud0oxMDkv?=
 =?utf-8?B?WVh2azJTdnRpZDBNbW12RUwzY3VBSFp0bUQwM1p2SitYWEtYaWc2elhUeWhz?=
 =?utf-8?B?d3RlUVJkTmFzZ0I2RHJQY3B4TGFna0pWQlN6NnNrLzNucHVURVc0d0NCWmxX?=
 =?utf-8?B?UGpETjJQanlHZVRTMytXcFBBOVF1VlF0RDNvampxV2diSUQwUi9kZEhHUFlt?=
 =?utf-8?B?aitKUWtMeE8xcHN5Tm9hUUJFa2F2by9wYUNFSklIc1FwZmk2VjFnalREd3Rv?=
 =?utf-8?B?MWs3NVJiSE81UXVOWTQ4SXltSWFqNlllYjBna01qY3VzblRVOGQvenkvQzJZ?=
 =?utf-8?B?UnVVTG1ERy9GQVhHOWNGYUlRcXdTWjZNTHdHKzREVGJqQlY5blpPa0FKdzFo?=
 =?utf-8?B?YTV4Vm05SXprMjBzcDlJc1BwRmo5VFFOVUNLUlJJQjdHbW95RWlMbXhnMkha?=
 =?utf-8?B?S21zbm9laURCQW5DYkNoQ2tHVXhVUDJLQTFRKzhkYkFuVzRNaHBEVGcvUDdq?=
 =?utf-8?B?NVZFRkVvakQ0S2UyNkpjWjZVNHRwOHRFYlhHV3djOWI0d3kzbGx1OG04QWVH?=
 =?utf-8?B?UHRiK0d1STQ3dGxoMlJDOG5oSWNORVZOd1UzdUQ2aHNwdXMxYnFieXY4cE16?=
 =?utf-8?B?Y29leENVWHNjVTB5RnpKSXVvWnFPL21QZVZ3Ylg5blRaNXYrenc5TnZyV1Bi?=
 =?utf-8?B?MFlobUJGd1pqRnE3Q3hOTG9vTEVjZDhBSjh1N1JueVE4V2ZPZEk4cWhsTE44?=
 =?utf-8?B?RENkWER1K29GRlJOL25xdzk5N2MzMStjcEZreStFbGFWN3FZUlhhZ09OWlN0?=
 =?utf-8?B?SDJ3Uml0NHk5VWZwSnFGSUxMSmNKbWwxdDd6RHBVb2xCT2Fvck9rNVovME9G?=
 =?utf-8?B?WkNBTThDM2NQTmQzZzR6K25JRGJpeTg4UnVxRE95Smt3WEhKQVEzS3kwOGw0?=
 =?utf-8?B?OGRWblV0MlE3eTJMVjI1RFZEZjRWa1pUc3FzWjdqWVpwOUo2UERkbHpYUmw3?=
 =?utf-8?B?MUIwb0pEbkJmN3E2VFVINUU0Q0VqbHd5SDh1V3JtSXlJL0NET25IWWFGcURz?=
 =?utf-8?B?c1Q1eGF3dEZvTnZ2VUpobmFRdjJPNSs0WVlLL2dUcUFIbWFMQjBQeDVRSUFu?=
 =?utf-8?B?MkdpVXZ0Mkk4T0VwOHFBSFVucHFGZVlJZmUyZ2Y3d1FzdGVLbnpUTGkxQnp2?=
 =?utf-8?B?MXpzQTA5YkxqMHdEZUhjYmZMQjRud0RFc1E5a2dYeVFWOTNldjNFYVZUa0gy?=
 =?utf-8?B?SjZSM1FtR0VOQSt2N0RQSlBSZTFaU0lTQ2NCZVhoZThRdUhhQndhNkhhMWE3?=
 =?utf-8?B?cXFJQmlrNHNvdkNUeU1vL01wQWw2MEpOSGVGLzRjVmVPMzMzSUVLbWZULzdT?=
 =?utf-8?B?U1FqYzhrdFppeDN2elhxSlJtOVI5c0VWTXhQZ2ZvWUJRZ21VVG8vK2cvcjU4?=
 =?utf-8?Q?7D8VciwWiNkWwdJG+zzeC6AwK6wCNrND6uY2kvZ?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A680C58DF698949A86BEC523A487F6C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61d31cbd-70db-4d0c-f67c-08d8f3df4ddc
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2021 00:52:48.1139
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fyDcSaufGf4siuc0umRDHJmgpifqTSDgazZRbFmIb4q42vUnsndb9az/SUd8zJvoIkg8N4VMX1OhEdal2TorvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3527
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SmFjayBQaGFtIHdyb3RlOg0KPiBIaSBLYXRoaXJhdmFuLCBCYXJ1Y2gsDQo+IA0KPiBPbiBUaHUs
IEZlYiAyNSwgMjAyMSBhdCAxMDoxNzo0OVBNICswNTMwLCBLYXRoaXJhdmFuIFQgd3JvdGU6DQo+
PiBPbiAyMDIxLTAyLTE1IDIyOjI4LCBLYXRoaXJhdmFuIFQgd3JvdGU6DQo+Pj4gT24gMjAyMS0w
Mi0xMCAxMTo0MCwgQmFydWNoIFNpYWNoIHdyb3RlOg0KPj4+PiBIaSBCam9ybiwNCj4+Pj4NCj4+
Pj4gVGhhbmtzIGZvciB5b3VyIHJldmlldyBjb21tZW50cy4NCj4+Pj4NCj4+Pj4gT24gTW9uLCBG
ZWIgMDggMjAyMSwgQmpvcm4gQW5kZXJzc29uIHdyb3RlOg0KPj4+Pj4gT24gTW9uIDA4IEZlYiAw
MDowMCBDU1QgMjAyMSwgQmFydWNoIFNpYWNoIHdyb3RlOg0KPj4+Pj4+IEZyb206IEJhbGFqaSBQ
cmFrYXNoIEogPGJqYWdhZGVlQGNvZGVhdXJvcmEub3JnPg0KPj4+Pj4+DQo+Pj4+Pj4gRFdDX1VT
QjNfR0ZMQURKIGFuZCBEV0NfVVNCM19HVUNUTCByZWdpc3RlcnMgY29udGFpbiBvcHRpb25zDQo+
Pj4+Pj4gdG8gY29udHJvbCB0aGUgYmVoYXZpb3Igb2YgY29udHJvbGxlciB3aXRoIHJlc3BlY3Qg
dG8gU09GIGFuZCBJVFAuDQo+Pj4+Pj4gVGhlIHJlc2V0IHZhbHVlcyBvZiB0aGVzZSByZWdpc3Rl
cnMgYXJlIGFsaWduZWQgZm9yIDE5LjIgTUh6DQo+Pj4+Pj4gcmVmZXJlbmNlIGNsb2NrIHNvdXJj
ZS4gVGhpcyBjaGFuZ2Ugd2lsbCBhZGQgb3B0aW9uIHRvIG92ZXJyaWRlDQo+Pj4+Pj4gdGhlc2Ug
c2V0dGluZ3MgZm9yIHJlZmVyZW5jZSBjbG9jayBvdGhlciB0aGFuIDE5LjIgTUh6DQo+Pj4+Pj4N
Cj4+Pj4+PiBUZXN0ZWQgb24gSVBRNjAxOCBTb0MgYmFzZWQgQ1AwMSBib2FyZCB3aXRoIDI0TUh6
IHJlZmVyZW5jZSBjbG9jay4NCj4+Pj4+Pg0KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEJhbGFqaSBQ
cmFrYXNoIEogPGJqYWdhZGVlQGNvZGVhdXJvcmEub3JnPg0KPj4+Pj4+IFsgYmFydWNoOiBtZW50
aW9uIHRlc3RlZCBoYXJkd2FyZSBdDQo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQmFydWNoIFNpYWNo
IDxiYXJ1Y2hAdGtvcy5jby5pbD4NCj4+Pj4+PiAtLS0NCj4+Pj4+PiAgLi4uL2RldmljZXRyZWUv
YmluZGluZ3MvdXNiL2R3YzMudHh0ICAgICAgICAgIHwgIDUgKysNCj4+Pj4+PiAgZHJpdmVycy91
c2IvZHdjMy9jb3JlLmMgICAgICAgICAgICAgICAgICAgICAgIHwgNTINCj4+Pj4+PiArKysrKysr
KysrKysrKysrKysrDQo+Pj4+Pj4gIGRyaXZlcnMvdXNiL2R3YzMvY29yZS5oICAgICAgICAgICAg
ICAgICAgICAgICB8IDEyICsrKysrDQo+Pj4+Pj4gIDMgZmlsZXMgY2hhbmdlZCwgNjkgaW5zZXJ0
aW9ucygrKQ0KPj4+Pj4+DQo+Pj4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy91c2IvZHdjMy50eHQNCj4+Pj4+PiBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy91c2IvZHdjMy50eHQNCj4+Pj4+PiBpbmRleCAxYWFlMmI2MTYwYzEuLjRm
ZmE4N2I2OTdkYyAxMDA2NDQNCj4+Pj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvdXNiL2R3YzMudHh0DQo+Pj4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3VzYi9kd2MzLnR4dA0KPj4+Pj4+IEBAIC04OSw2ICs4OSwxMSBAQCBPcHRp
b25hbCBwcm9wZXJ0aWVzOg0KPj4+Pj4+ICAgLSBzbnBzLHF1aXJrLWZyYW1lLWxlbmd0aC1hZGp1
c3RtZW50OiBWYWx1ZSBmb3INCj4+Pj4+PiBHRkxBREpfMzBNSFogZmllbGQgb2YgR0ZMQURKDQo+
Pj4+Pj4gIAlyZWdpc3RlciBmb3IgcG9zdC1zaWxpY29uIGZyYW1lIGxlbmd0aCBhZGp1c3RtZW50
IHdoZW4gdGhlDQo+Pj4+Pj4gIAlmbGFkal8zMG1oel9zZGJuZCBzaWduYWwgaXMgaW52YWxpZCBv
ciBpbmNvcnJlY3QuDQo+Pj4+Pj4gKyAtIHNucHMscXVpcmstcmVmLWNsb2NrLWFkanVzdG1lbnQ6
IFZhbHVlIGZvcg0KPj4+Pj4+IEdGTEFESl9SRUZDTEtfKiBmaWVsZHMgb2YgR0ZMQURKDQo+Pj4+
Pj4gKwlyZWdpc3RlciBmb3IgcmVmZXJlbmNlIGNsb2NrIG90aGVyIHRoYW4gMTkuMiBNSHogaXMg
dXNlZC4NCj4+Pj4+DQo+Pj4+PiBXaGF0IGFyZSB0eXBpY2FsIHZhbHVlcyBmb3IgdGhpcyBwcm9w
ZXJ0eT8gV2hhdCB1bml0IGRvZXMgaXQNCj4+Pj4+IGhhdmU/IEhvdw0KPj4+Pj4gZG9lcyBpdCBh
Y3R1YWxseSByZWxhdGUgdG8gdGhlIGZyZXF1ZW5jeSBvZiB0aGUgcmVmZXJlbmNlIGNsb2NrPw0K
Pj4+Pg0KPj4+PiBEb3duc3RyZWFtIGNvZGVhdXJvcmEga2VybmVsIChmaWcgYnJhbmNoKSBzZXRz
IDB4QTg3RjAgZm9yIElQUTYwMTgNCj4+Pj4gKDI0TUh6IHJlZmVyZW5jZSBjbG9jayksIGFuZCAw
eDQ5NDU5IGZvciBJUFE1MDE4ICg2ME1IeikuIFNvIHRoaXMNCj4+Pj4gdmFsdWUNCj4+Pj4gYXBw
ZWFycyB0byBjb3JyZWxhdGVzIHdpdGggY2xvY2sgcmF0ZS4gSSBoYXZlIG5vIGFjY2VzcyB0byBE
V0MzDQo+Pj4+IGRvY3VtZW50YXRpb24uIEkgb25seSB0ZXN0ZWQgSVBRNjAxOCBoYXJkd2FyZS4N
Cj4+Pj4NCj4+Pg0KPj4+IEl0IHdpbGwgYmUgd3JpdHRlbiBhcyAoMHhBODdGMCA8PCA3KSByZXRh
aW5pbmcgdGhlIDAtNyBMU0IgdmFsdWUuDQo+Pj4gSSBjb3VsZCBzZWUsIEJJVCgyMykgb2YgR0ZM
QURKIHJlZ2lzdGVyIGVuYWJsZXMgdGhlIGZ1bmN0aW9uYWxpdHkgb2YNCj4+PiBydW5uaW5nIFNP
Ri9JVFAgY291bnRlcnMgYmFzZWQgb24gdGhlIHJlZmVyZW5jZSBjbG9jay4gU2luY2UgdGhpcyBi
aXQNCj4+PiBpcyBzZXQsIHdlIG5lZWQgdG8NCj4+PiBjb21wdXRlIHRoZSBvdGhlciBmaWVsZHMg
YXMgd2VsbCBpLmUuLCBmcm9tIDh0aCBiaXQgdG8gMzFzdCBiaXQuDQo+Pj4gRmluYWxseSBpdCBp
cyBkZXJpdmVkIHRvDQo+Pj4gMHhBODdGMCBmb3IgSVBRNjAxOC4NCj4+Pg0KPj4NCj4+IEJqb3Ju
IC8gQWxsLA0KPj4NCj4+IEFueSBjb21tZW50cyBvbiB0aGlzPyBQbGVhc2UgZG8gc3VnZ2VzdCBp
ZiB0aGlzIGNhbiBiZSBoYW5kbGVkIGluIGEgYmV0dGVyDQo+PiB3YXkuDQo+Pg0KPj4NCj4+Pg0K
Pj4+Pj4+ICsgLSBzbnBzLHF1aXJrLXJlZi1jbG9jay1wZXJpb2Q6IFZhbHVlIGZvciBSRUZDTEtQ
RVIgZmlsZWQNCj4+Pj4+PiBvZiBHVUNUTC4gVGhpcyBmaWVsZA0KPj4+Pj4+ICsJaW5kaWNhdGVz
IGluIHRlcm1zIG9mIG5hbm8gc2Vjb25kcyB0aGUgcGVyaW9kIG9mIHJlZl9jbGsuDQo+Pj4+Pj4g
VG8gY2FsY3VsYXRlIHRoZQ0KPj4+Pj4+ICsJaWRlYWwgdmFsdWUsIFJFRkNMS1BFUiA9ICgxL3Jl
Zl9jbGsgaW4gSHopKjEwXjkuDQo+Pj4+Pg0KPj4+Pj4gQ2FuJ3Qgd2UgbWFrZSB0aGUgZHdjMyBy
ZWZlcmVuY2UgdGhpcyBjbG9jayBhbmQgdXNlDQo+Pj4+PiBjbGtfZ2V0X3JhdGUoKSBhbmQNCj4+
Pj4+IHRoZW4gZG8gdGhpcyBtYXRoIGluIHRoZSBkcml2ZXI/DQo+Pj4+DQo+Pj4+IFRoaXMgaXMg
ZG9hYmxlLCBJIGJlbGlldmUuIFRob3VnaCBjdXJyZW50IGNvZGUgZG9lcyBub3QgaWRlbnRpZnkN
Cj4+Pj4gc3BlY2lmaWMgY2xvY2tzLCBhcyBmYXIgYXMgSSBjYW4gc2VlLg0KPiANCj4gSSBhZ3Jl
ZSBpdCBzaG91bGQgYmUgZG9hYmxlLiBMb29rcyBsaWtlIHByaW9yIHRvIDBkM2E5NzA4M2UwYyAo
InVzYjoNCj4gZHdjMzogUmV3b3JrIGNsb2NrIGluaXRpYWxpemF0aW9uIHRvIGJlIG1vcmUgZmxl
eGlibGUiKSB0aGUgY29yZSBkaWQNCj4gc3VwcG9ydCBzcGVjaWZpYyBjbG9ja3MgKCJyZWYiLCAi
YnVzX2Vhcmx5IiwgInN1c3BlbmQiKSwgYnV0IHdhcw0KPiBjaGFuZ2VkIHRvIHVzZSBhIHNpbXBs
ZXIgZGV2bV9jbGtfYnVsa19nZXRfYWxsKCkgY2FsbC4NCj4gDQo+Pj4gV2UgY2FuIG1lbnRpb24g
b25lIG1vcmUgY2xvY2socmVmKSBpbiB0aGUgVVNCIGRldmljZSBub2RlIGFuZCBkbyB0aGUNCj4+
PiBtYXRoIChOU0VDX1BFUl9TRUMgLyBjbGtfZ2V0X3JhdGUoKSkgaW4gZHdjMyBkcml2ZXIuDQo+
IA0KPiBZZWEsIGp1c3QgbmVlZCB0byBtYWtlIHN1cmUgInJlZiIgY2xrIGlzIHNwZWNpZmllZCBp
biB0aGUgRFQgbm9kZS4gVGhlbg0KPiBpbiB0aGUgZHJpdmVyIHlvdSBjYW4ganVzdCBpdGVyYXRl
IHRocm91Z2ggZHdjLT5jbGtzIGFuZCB0cnkgdG8gZmluZCBvbmUNCj4gd2l0aCAuaWQ9PSJyZWYi
LiBJZiBjbGtfZ2V0X3JhdGUoKSBzdWNjZWVkcyB0aGVuIHlvdSBjYW4gdXNlIHRoZSB2YWx1ZQ0K
PiB0byBjYWxjdWxhdGUgdGhlIEdVQ1RMLlJFRkNMS1BFUiBhbmQgR0ZMQURKIHJlZ2lzdGVyIGZp
ZWxkcy4NCj4gDQo+IE9yIHBlcmhhcHMgZXZlbiB1c2UgYSBsb29rdXAgdGFibGUsIHNpbmNlIGFj
Y29yZGluZyB0byB0aGUgRFdDMw0KPiBwcm9ncmFtbWluZyBndWlkZSBvbmx5IDYgcmVmY2xrIGZy
ZXF1ZW5jaWVzICgxNiwgMTcsIDE5LjIsIDIwLCAyNCwgMzkuNw0KPiBNSHopIGFyZSBzdXBwb3J0
ZWQgc28gdGhhdCBtaWdodCBiZSBzaW1wbGVyIHRoYW4gYSBmZXcgaW50ZWdlciBkaXZpZGUNCj4g
b3BlcmF0aW9ucyB0aGF0IHdvdWxkIG90aGVyd2lzZSBiZSByZXF1aXJlZC4NCj4gDQo+IEphY2sN
Cj4gDQoNCkhpLA0KDQpXaHkgbm90IGNyZWF0ZSB1c2UgYSBEVCBwcm9wZXJ0eSBpbnN0ZWFkPyBU
aGlzIHdpbGwgY29tcGxpY2F0ZSB0aGluZ3MNCmZvciBQQ0kgZGV2aWNlcy4gVGhlIGRlc2lnbmVy
IGtub3cgd2hhdCByZWZjbGsgZnJlcXVlbmNpZXMgaXQgaXMsIHdlDQpqdXN0IG5lZWQgdG8gaW5m
b3JtIHRoZSBjb250cm9sbGVyIHZpYSB0aGlzIHByb3BlcnR5IGluIG5hbm9zZWNvbmQuIEl0J3MN
Cm1vcmUgYWNjdXJhdGUgYW5kIHlvdSBkb24ndCBoYXZlIHRvIGFueSBjYWxjdWxhdGlvbiBvciB3
b3JyeSBhYm91dA0Kd2hldGhlciB0byBtYXRjaCB0aGUgInJlZiIgY2xvY2ssIG9yIHdvcnNlIGNy
ZWF0ZSBhIGR1bW15L2Zha2UgcmVmY2xrDQpmb3IgYSBQQ0kgZGV2aWNlIGp1c3QgdG8gaW5mb3Jt
IHRoZSBjb250cm9sbGVyIHRoaXMuDQoNCkJSLA0KVGhpbmgNCg==
