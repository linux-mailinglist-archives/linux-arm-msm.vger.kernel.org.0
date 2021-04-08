Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA88357AD1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 05:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbhDHDjq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 23:39:46 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:49826 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229505AbhDHDjq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 23:39:46 -0400
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3B13EC0993;
        Thu,  8 Apr 2021 03:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1617853175; bh=+myh6Avif/UH+aSnrmBd4tb68TTZPjB8D4yNEAJCbYo=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=QTp5iZVV8U2AylAFCMoqaa+AOtr0FZeRkQjnW4pxqa+2KdZkhZYtiZbJ6mn9ZlLqB
         mRuD3ADTRhTRfmUuMhuIrKd1UvZAYiQubMvSJU0Im2DRVb+KRnY2R5hkOiNnT5eeSt
         i4NJf3UmRqA9wOwfpCXNmDGoGR2GAt9/QMuROj/il9fOXfz8RTIEoajXGIQyr7ohvF
         zx3LQ2gSbuQESLr2uDYh1EGhSFhdVJGufjOZaBjRvJo5YcNYz/d2N0K5QnmZ+fN6+z
         Njfam7CoelaYRb/GHcWOzrqzk1Jtqx1X5dwzOhxuUH6oZTDaTcJDOdm+Bd6wArxqfh
         bNiLemGmCb07A==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id ED603A0077;
        Thu,  8 Apr 2021 03:39:34 +0000 (UTC)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam08lp2171.outbound.protection.outlook.com [104.47.73.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7B726400E5;
        Thu,  8 Apr 2021 03:39:34 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="BkQ1qR+z";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dDOk4EM/ifOKlxaj8ESxC/EFHdm39M28YlmbG3g6h4Qitcfb1xTd9WAoBAN/jz9aPTz/mVJhyue75WiJTSoOOO61ui4jnpYStEwujIZMN+C/n7TtssuqrBEROaZ2iPIRAVC5m4ThkETZFUNkyzW1gbk7gW/bGzxR7QvOdtCJRtvsBrBBm0LyZa4KblY2PAwV5R/5Xi2nyLZQGRXH7zBXsYN5swZ7/7a4LHn0sWGR08Tks/cGi36Mltj6RGu8lRHLUUyqJn6qDaBF2ceBwhfEb4hgeJCGQLnc4SLdw1ze8U+Ce1LsJM67QM4YveQ5Wbj2m3AL0CGxNLgSx0+qJiYe2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+myh6Avif/UH+aSnrmBd4tb68TTZPjB8D4yNEAJCbYo=;
 b=U5+YKGcEIBCIEMC8jEzF1KSaX0vHyMh068AgAj9CIhksY4QItEq7tgPOnWMCN3ZyF0v4zjRqqO6oW66dz9G0nFZNKO0eHgcZ1/E8UbRvKdqpVmqUfcqJfyhBZJ5NEs6XI2MwIejddUehwSgzEb5k0WBHzn9ua7wKznRlTnEoap1X9NAliHZL4tXI0fBEcdZ6GxNOQF8nZAsFgUGSYvXtiR2H6Vgw916KlmGlJhvn+NyC7IzxrgwVnqhowdwIg/Qg7hV/Z3Js/yc93TvYMTbVHZKMUB0TibVm6VmNUGNhMni/Y3kNm9WtkbhW/CNgF2BQGl10W7wAir+1XVSMEcz2BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+myh6Avif/UH+aSnrmBd4tb68TTZPjB8D4yNEAJCbYo=;
 b=BkQ1qR+zeblzxV4BetiC1FCISKHBaqumkltnnSzBG2+XQK77JoFulo6EBtm8+VdsTdwYAfA9+W8y0evvqWRfAXbSahMORRDrwj/Nxczk0P/K9aizaXXllFDOJyHLcXAOzLv8EwWRp+Elw4iI9OYCNvk+8GgK+rCnpPFgAOsWdp4=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB2952.namprd12.prod.outlook.com (2603:10b6:a03:13b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Thu, 8 Apr
 2021 03:39:31 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c%6]) with mapi id 15.20.4020.018; Thu, 8 Apr 2021
 03:39:31 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Kathiravan T <kathirav@codeaurora.org>,
        Baruch Siach <baruch@tkos.co.il>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Balaji Prakash J <bjagadee@codeaurora.org>
Subject: Re: [PATCH] usb: dwc3: reference clock configuration
Thread-Topic: [PATCH] usb: dwc3: reference clock configuration
Thread-Index: AQHW/eInRTRYpSizoUSSkIWQR33qw6qdm2uAgAuy5gCAAOnRAIAACFWAgAAHgACAAAcagIAABrsA
Date:   Thu, 8 Apr 2021 03:39:31 +0000
Message-ID: <c797e9cb-cae6-c0b6-5714-169c2ad79d32@synopsys.com>
References: <8fc38cb73afd31269f1ea0c28e73604c53cebb17.1612764006.git.baruch@tkos.co.il>
 <f3042097-8569-5882-06db-ae56e05cac59@synopsys.com>
 <8cc9617dc62be17ac3a9420e7750b0ee@codeaurora.org>
 <4e5a3487-bae2-b21a-df90-80b5f0d170ba@synopsys.com>
 <20210408022309.GL904837@yoga>
 <379f7e1a-35ce-511e-74d7-1e22451ad7a6@synopsys.com>
 <YG51Ta6gYT1x9vXT@builder.lan>
In-Reply-To: <YG51Ta6gYT1x9vXT@builder.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f48ab412-fc46-4a37-3300-08d8fa3febb0
x-ms-traffictypediagnostic: BYAPR12MB2952:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB29528E0778A1A127903FB81BAA749@BYAPR12MB2952.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GQXrmG5CJqtslze1alJK2Zr2tEsTdoYrdu0/kgg5fc0NF9VH82XPHJ2yeeqUMAsXmQX1MQxI772b1ToiGOkZm9qnI9cRILO1w/uxcswSkgB5COmNhBDP+xwr9mZEiWxbAumAMJ24RQxA8OPNKgMAD133FPBa8upNT5Kvp73RYhyrQdysS+O90Li+XMv46V50PQqG4KkpkceBN5wSDAxuoTpbQxHjFTJlO0dlPOGUQg0vb6RWU4tCcIlA6KoS0a+ivQzzjXxLWzf4jH9eM0V9RaQj9QFFFdxcHStueVV/D/n8dupKGyvnnroz36j2SDOAY0re03zhIvKa2JweWHmyJvKcMe6m5RNPavlhXGLOXIEMQZKlgkknaK4xx/bxdF/TV2Lfiw1uofBdbfvkaP4L1+RKtFQg4PXvaSffyFSP/s+tlgKmfCsaj09ajQhrFQzHVHMvrDzHoZMqft1aSjN/Rp60ixXEnLvKNyUJPY7bZ6ZHbIKFA9sA0lO2cnDSg+KaUq4qMfrnQDujbBF3xTe9MckE55k2zG5q61aOhQ+Eip7KjRZMApr1ZseizrujCzHG43gB3Mnnq0rOKJ+5BHqPr/Pij8eAzvjUV1smdPWaN9ql91RD8zywm+dS+hmUFs67VFa/SF+3710FTgmkev8CbYzeYf4okIIdq0uYmi5suVg8fqIaedtBN7jPiPvWLlrR/8NiCHxeLhokN1mrfGm+5tDrJ2s3q9/KPvh8aDR7P/0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(39860400002)(346002)(366004)(396003)(8936002)(31696002)(38100700001)(53546011)(54906003)(31686004)(2906002)(6506007)(2616005)(83380400001)(76116006)(8676002)(5660300002)(6486002)(6512007)(36756003)(71200400001)(4326008)(84040400003)(26005)(66446008)(66556008)(64756008)(86362001)(66946007)(186003)(66476007)(110136005)(478600001)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?TFdmSVRNUDBtKy9QZHpTOHQ0TEg2Tks0MlBNUmhEeWI4b053ZkZ4TEEyV0RG?=
 =?utf-8?B?M1lRR1ZsOFRPOHBiODZ0NlVpK3BNdkErTHVRbEVTR2FXRzNwNGpkTTVMcXRI?=
 =?utf-8?B?QmphVGZYSktWWm9FblU4b1RrVlBRWFg1dVJ1S3lDbHFJOHhvTURGN3hmb2Fs?=
 =?utf-8?B?STI5YmpUUGdRbGpudUZqNTlZVVVtSDlIL2RCYUl3UTJwbGtqVnVUZzhPTHlH?=
 =?utf-8?B?VjN6NVF4V1VVQVM3RGh1TCswSGJwbk10OFhHdHNZaFV6cmFkYVdTODByNEox?=
 =?utf-8?B?MUk3d1JHSk12TC9IenFEaGFkTmpTbWl2bXhCVStMRWNjRldFeXFTMWxOdzVq?=
 =?utf-8?B?SkRmNE52Rm9sd1hnbzBacFl2VjFDeklnbHdmN09wOGFDUjBXZS9lTzgzOVVl?=
 =?utf-8?B?Y3gyL1lqK0tlamp2SG1pRDZwZEpURGlXdFE5Wk95ZkFiS0FyOFJxeXZPcWZK?=
 =?utf-8?B?cVp1Njk5MmQxRjVaTWJ2TDJENEp2bEFNL09rRmZGejVVTlJIWlNJKzRCRDJk?=
 =?utf-8?B?UlVNOXN2ekVtSWZicm5xMlIzSjFSYVFCMFV6OUJ0UkZGeGt5d29tREhNaXJS?=
 =?utf-8?B?V1d4YWxnRmxiYWtmcDhxQlhMYmNzN1hvRjdtS2xaZmVQM1JnNjkxRTMwTmZl?=
 =?utf-8?B?QmM5VndlWGJKSFpQa0RLUE10N1NlVVdoSnlESGMrZ2pwa0xrYXV0SFBJWkVx?=
 =?utf-8?B?ZkdvU0VNMDRvdU9NcS9yZVQrck15ampnS1BzYjZ4OVRHU0JIRCtOZTd5MWtq?=
 =?utf-8?B?TXdqNWxSMmhhcjhDbXA2ZVVkL0JGcy83a3dTNUNadDV0VmlpOHlxa3I1RDFs?=
 =?utf-8?B?M3ZSUEVrVlYvenZSS1Bydko5dWlwa2daeTFZdmxwNDNZT3psOG9HUGRTZ2h6?=
 =?utf-8?B?M3dQdlN1MXY5dGl4Z00rb2V3WWlEcllIU1pJdnpIQTdyK1JKSWxNMlpYRmJj?=
 =?utf-8?B?TzJzR2YraW96ZCthUG1iZHh1ODJiazdiaFJhc0hnZHVFNXR5U21MOTBTYWU1?=
 =?utf-8?B?djdBaHNMaU5URlFleXhMTmFhWlhpT3BkMVMyS0xWcjArcVMvZUdsTmowbmpT?=
 =?utf-8?B?MCtiYTNjT1lINXRkRUtmb05lcGFyTENZOHQ1SmZRbGltS2FoNjN0eUNyVktz?=
 =?utf-8?B?cHRBbWpIb1dpaGtpYmZYNDBYYWFLdktQMU5uTUd5Tm5ZY3Fnc3lzV0UwcG1N?=
 =?utf-8?B?bnhEdENUUmJScmJjc0xCSE1BZGR2dk83aG9CaEZjOVo4c0tvTlI3SXc4VVhX?=
 =?utf-8?B?cG5tbHFFQnNGcmFWYlpwNml2cnFFdjdLNTk2bThkMk9RVjd0UTc2YkFxdTVX?=
 =?utf-8?B?MlE4MDcvSVlWbVVTcXZ3TjEyQ2pOMEFBOXJSZkYrM2dhTFkrMEhZd0xnM3M5?=
 =?utf-8?B?b1UrQjBZRFNiWkQ5ZlNTb00raWtWUUMyNFFqTUloRDhWM1dZN3hPbUltQzdV?=
 =?utf-8?B?VUc2cEFiQUJnSW5XSUp5TlpLUDZ4allWb3VjVEtReVRMd2NXajViLzZIcUYx?=
 =?utf-8?B?UmM2UE5WbDNFa0JOMDJQVXNCQ2tTVHFOdEFaN2lKbVYyVFBqd3hiSmlJb0Fi?=
 =?utf-8?B?RGhjU0xxbHlOeVdGRlJWOVNBUGRzUGJpU0liQTltdnF1Q3lLVTJoOFRyby8v?=
 =?utf-8?B?RFZRQ1MyQlc5QnNiL2VYRDVrbjFva3dkWkt6RElsMFhzM2laWTVkZWF3T1pr?=
 =?utf-8?B?TE1CTW9KWE1JNlVhQk01ZVhDamdSTTMwc3c1cDBHSERCTWM5Q1YyQjdqRmhL?=
 =?utf-8?Q?xrMMaoARfaIyXvvLKg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <47635B6562333C40ABB4F2EEB132DE02@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f48ab412-fc46-4a37-3300-08d8fa3febb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2021 03:39:31.6102
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jxbe/qS/Fzy+zpbajzWC6LGqGk+MhvFT9QQ0kA4+Andj23zHBOE71s8ef1t/dJ1wvhXemRVrR6ovs3WzHDNq4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2952
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qmpvcm4gQW5kZXJzc29uIHdyb3RlOg0KPiBPbiBXZWQgMDcgQXByIDIxOjUwIENEVCAyMDIxLCBU
aGluaCBOZ3V5ZW4gd3JvdGU6DQo+IA0KPj4gQmpvcm4gQW5kZXJzc29uIHdyb3RlOg0KPj4+IE9u
IFdlZCAwNyBBcHIgMjA6NTMgQ0RUIDIwMjEsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4+Pg0KPj4+
PiBLYXRoaXJhdmFuIFQgd3JvdGU6DQo+Pj4+PiBPbiAyMDIxLTAzLTMxIDA2OjQ3LCBUaGluaCBO
Z3V5ZW4gd3JvdGU6DQo+Pj4+Pj4gQmFydWNoIFNpYWNoIHdyb3RlOg0KPj4+Pj4+PiBGcm9tOiBC
YWxhamkgUHJha2FzaCBKIDxiamFnYWRlZUBjb2RlYXVyb3JhLm9yZz4NCj4+Pj4+Pj4NCj4+Pj4+
Pj4gRFdDX1VTQjNfR0ZMQURKIGFuZCBEV0NfVVNCM19HVUNUTCByZWdpc3RlcnMgY29udGFpbiBv
cHRpb25zDQo+Pj4+Pj4+IHRvIGNvbnRyb2wgdGhlIGJlaGF2aW9yIG9mIGNvbnRyb2xsZXIgd2l0
aCByZXNwZWN0IHRvIFNPRiBhbmQgSVRQLg0KPj4+Pj4+PiBUaGUgcmVzZXQgdmFsdWVzIG9mIHRo
ZXNlIHJlZ2lzdGVycyBhcmUgYWxpZ25lZCBmb3IgMTkuMiBNSHoNCj4+Pj4+Pj4gcmVmZXJlbmNl
IGNsb2NrIHNvdXJjZS4gVGhpcyBjaGFuZ2Ugd2lsbCBhZGQgb3B0aW9uIHRvIG92ZXJyaWRlDQo+
Pj4+Pj4+IHRoZXNlIHNldHRpbmdzIGZvciByZWZlcmVuY2UgY2xvY2sgb3RoZXIgdGhhbiAxOS4y
IE1Ieg0KPj4+Pj4+Pg0KPj4+Pj4+PiBUZXN0ZWQgb24gSVBRNjAxOCBTb0MgYmFzZWQgQ1AwMSBi
b2FyZCB3aXRoIDI0TUh6IHJlZmVyZW5jZSBjbG9jay4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gU2lnbmVk
LW9mZi1ieTogQmFsYWppIFByYWthc2ggSiA8YmphZ2FkZWVAY29kZWF1cm9yYS5vcmc+DQo+Pj4+
Pj4+IFsgYmFydWNoOiBtZW50aW9uIHRlc3RlZCBoYXJkd2FyZSBdDQo+Pj4+Pj4+IFNpZ25lZC1v
ZmYtYnk6IEJhcnVjaCBTaWFjaCA8YmFydWNoQHRrb3MuY28uaWw+DQo+Pj4+Pj4+IC0tLQ0KPj4+
Pj4+PiDCoC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9kd2MzLnR4dMKgwqDCoMKgwqDCoMKg
wqDCoCB8wqAgNSArKw0KPj4+Pj4+PiDCoGRyaXZlcnMvdXNiL2R3YzMvY29yZS5jwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA1MiArKysrKysrKysrKysrKysr
KysrDQo+Pj4+Pj4+IMKgZHJpdmVycy91c2IvZHdjMy9jb3JlLmjCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEyICsrKysrDQo+Pj4+Pj4+IMKgMyBmaWxlcyBj
aGFuZ2VkLCA2OSBpbnNlcnRpb25zKCspDQo+Pj4+Pj4+DQo+Pj4+Pj4+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2R3YzMudHh0DQo+Pj4+Pj4+IGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9kd2MzLnR4dA0KPj4+Pj4+PiBp
bmRleCAxYWFlMmI2MTYwYzEuLjRmZmE4N2I2OTdkYyAxMDA2NDQNCj4+Pj4+Pj4gLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9kd2MzLnR4dA0KPj4+Pj4+PiArKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2R3YzMudHh0DQo+Pj4+Pj4+
IEBAIC04OSw2ICs4OSwxMSBAQCBPcHRpb25hbCBwcm9wZXJ0aWVzOg0KPj4+Pj4+PiDCoCAtIHNu
cHMscXVpcmstZnJhbWUtbGVuZ3RoLWFkanVzdG1lbnQ6IFZhbHVlIGZvciBHRkxBREpfMzBNSFog
ZmllbGQNCj4+Pj4+Pj4gb2YgR0ZMQURKDQo+Pj4+Pj4+IMKgwqDCoMKgIHJlZ2lzdGVyIGZvciBw
b3N0LXNpbGljb24gZnJhbWUgbGVuZ3RoIGFkanVzdG1lbnQgd2hlbiB0aGUNCj4+Pj4+Pj4gwqDC
oMKgwqAgZmxhZGpfMzBtaHpfc2RibmQgc2lnbmFsIGlzIGludmFsaWQgb3IgaW5jb3JyZWN0Lg0K
Pj4+Pj4+PiArIC0gc25wcyxxdWlyay1yZWYtY2xvY2stYWRqdXN0bWVudDogVmFsdWUgZm9yIEdG
TEFESl9SRUZDTEtfKiBmaWVsZHMNCj4+Pj4+Pj4gb2YgR0ZMQURKDQo+Pj4+Pj4+ICvCoMKgwqAg
cmVnaXN0ZXIgZm9yIHJlZmVyZW5jZSBjbG9jayBvdGhlciB0aGFuIDE5LjIgTUh6IGlzIHVzZWQu
DQo+Pj4+Pj4+ICsgLSBzbnBzLHF1aXJrLXJlZi1jbG9jay1wZXJpb2Q6IFZhbHVlIGZvciBSRUZD
TEtQRVIgZmlsZWQgb2YgR1VDVEwuDQo+Pj4+Pj4+IFRoaXMgZmllbGQNCj4+Pj4+Pj4gK8KgwqDC
oCBpbmRpY2F0ZXMgaW4gdGVybXMgb2YgbmFubyBzZWNvbmRzIHRoZSBwZXJpb2Qgb2YgcmVmX2Ns
ay4gVG8NCj4+Pj4+Pj4gY2FsY3VsYXRlIHRoZQ0KPj4+Pj4+PiArwqDCoMKgIGlkZWFsIHZhbHVl
LCBSRUZDTEtQRVIgPSAoMS9yZWZfY2xrIGluIEh6KSoxMF45Lg0KPj4+Pj4+DQo+Pj4+Pj4gV2h5
IGlzIHRoaXMgYSBxdWlyaz8gSXQncyBub3QgYSBxdWlyay4gVGhlIHVzZXIgY2FuIGluZm9ybSB0
aGUgcmVmX2Nsaw0KPj4+Pj4+IHBlcmlvZCB0byB0aGUgY29udHJvbGxlciBoZXJlLg0KPj4+Pj4+
DQo+Pj4+Pj4gVGhlIGRlZmF1bHQgdmFsdWUgZnJvbSBHVUNUTC5SRUZDTEtQRVIgaXMgYSB2YWx1
ZSBmcm9tIGNvcmVDb25zdWx0YW50DQo+Pj4+Pj4gc2V0dGluZy4gVGhlIGRlc2lnbmVyIGtub3dz
IHdoYXQgcGVyaW9kIGl0IHNob3VsZCBiZSBhbmQgc2hvdWxkIHByb3Blcmx5DQo+Pj4+Pj4gc2V0
IGl0IGlmIHRoZSBkZWZhdWx0IGlzIG5vdCBjb3JyZWN0bHkgc2V0Lg0KPj4+Pj4NCj4+Pj4+IFRo
YW5rcyBUaGluaCBmb3IgeW91ciBpbnB1dHMuIENhbiB3ZSBoYXZlIHRoZSBEVCBwcm9wZXJ0eSBm
b3IgYm90aCB0aGUNCj4+Pj4+IEdVQ1RMLlJFRkNMS1BFUiBhbmQgR0ZMQURKLlJFRkNMSyogZmll
bGRzPw0KPj4+Pj4gU2luY2UgR0ZMQURKLlJFRkNMSyogZmllbGQgdmFsdWVzIGRlcml2ZWQgYmFz
ZWQgb24gdGhlIEdVQ1RMLlJFRkNMS1BFUi4NCj4+Pj4+IEluIG90aGVyIHdvcmRzLCBhcmUgeW91
IGZpbmUgd2l0aCB0aGUNCj4+Pj4+IGFwcHJvYWNoIGZvbGxvd2VkIGhlcmU/IElmIHNvLCB3ZSBj
YW4gd29yayBvbiB0aGUgbml0cGlja3MgYW5kIHNlbmQgdGhlIFYyLg0KPj4+Pj4NCj4+Pj4+IFBs
ZWFzZSBsZXQgdXMga25vdyB5b3VyIHRob3VnaHRzIG9uIHRoaXMuDQo+Pj4+Pg0KPj4+Pg0KPj4+
PiBIaSBLYXRoaXJhdmFuLA0KPj4+Pg0KPj4+PiBZZXMsIElNTywgdXNpbmcgRFQgcHJvcGVydGll
cyB3b3JrIGp1c3QgZmluZSB0byBpbmZvcm0gdGhlIGNvbnRyb2xsZXIgaWYNCj4+Pj4gdGhlIGRl
ZmF1bHQgc2V0dGluZ3MgZG9uJ3QgbWF0Y2ggdGhlIEhXIGNvbmZpZ3VyYXRpb24uDQo+Pj4NCj4+
PiBJJ20gbm90IGFnYWluc3QgdXNpbmcgYSBzZXBhcmF0ZSBEVCBwcm9wZXJ0eSBpZiB0aGUgaW5m
b3JtYXRpb24gaXQNCj4+PiBwcm92aWRlcyBjYW4ndCBiZSBkZXJpdmVkIGZyb20gd2hhdCdzIGFs
cmVhZHkgdGhlcmUuDQo+Pg0KPj4gVGhhdCdzIHRoZSBpc3N1ZS4gVGhhdCBpbmZvcm1hdGlvbiBp
cyBub3QgYXZhaWxhYmxlIGlmIGR3YzMgaXMgdXNpbmcgUENJDQo+PiBidXMuDQo+Pg0KPj4+DQo+
Pj4+IEFzIEkgbWVudGlvbiBpbg0KPj4+PiB0aGUgc2VwYXJhdGUgZW1haWwgdGhyZWFkLCB1c2lu
ZyBjbGtfZ2V0X3JhdGUoKSBkb2Vzbid0IG1ha2Ugc2Vuc2UgZm9yDQo+Pj4+IFBDSSBkZXZpY2Vz
Lg0KPj4+Pg0KPj4+DQo+Pj4gSSdtIHNvcnJ5LCBjYW4geW91IGhlbHAgbWUgdW5kZXJzdGFuZCB3
aHkgdGhpcyByZWxhdGUgdG8gUENJPw0KPj4NCj4+IEl0J3MgYmVjYXVzZSB0aGUgY2xvY2sncyBh
dHRyaWJ1dGVzIGFyZSBub3QgZXhwb3NlZCBpZiB3ZSdyZSB1c2luZyB0aGUNCj4+IFBDSSBidXMu
IFRoZSBkcml2ZXIgY2Fubm90IGFjY2VzcyB0aGlzIGluZm9ybWF0aW9uIHVubGVzcyB0aGUgdXNl
cg0KPj4gcHJvdmlkZXMgaXQgaW4gc29tZSBvdGhlciB3YXkuDQo+Pg0KPiANCj4gU28gd2UgaGF2
ZSBhIERXQzMgY29udHJvbGxlciBvbiBhIFBDSSBidXMsIHNvbWVob3cgZGVzY3JpYmVkIGluIERU
LCBidXQNCj4gdGhlIHJlZmNsb2NrIGlzIGRlcml2ZWQgZnJvbSBzb21ldGhpbmcgdGhhdCdzIG5v
dCBkZXNjcmliZWQgYXMgYSBjbG9jaw0KPiBpbiB0aGUgT1M/DQo+IA0KDQpJdCdzIG5vdCBkZXNj
cmliZWQgaW4gRFQuIFdlIGNyZWF0ZSBhIHBsYXRmb3JtIGRldmljZSBpbiB0aGUgUENJIGdsdWUN
CmRyaXZlciBhbmQgcGFzcyBpbiBzcGVjaWZpYyBwcm9wZXJ0aWVzIGFzIGlmIGl0J3MgYSBwbGF0
Zm9ybSBkZXZpY2UuDQpGcm9tIHRoZSBQQ0kgZnVuY3Rpb24sIHdlIGhhdmUgbm8gY2x1ZSBvZiB0
aGUgcmVmY2xrLiBJdCBtYXkgYmUgYmV0dGVyDQppZiB0aGUgRFdDMyBkcml2ZXIgY2FuIGluaXRp
YWxpemUgYW5kIGRyaXZlIHRoZSBQQ0kgZnVuY3Rpb24gd2l0aG91dA0KY29udmVydGluZyBpdCB0
byBhIHBsYXRmb3JtIGRldmljZS4gSG93ZXZlciwgSSBkb24ndCBzZWUgdGhpcyB3aWxsDQpjaGFu
Z2UgYW55IHRpbWUgc29vbi4NCg0KQlIsDQpUaGluaA0KDQo=
