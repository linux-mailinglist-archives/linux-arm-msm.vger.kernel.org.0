Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04AF53EBCB6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Aug 2021 21:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233728AbhHMTwl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Aug 2021 15:52:41 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:54610 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230440AbhHMTwk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Aug 2021 15:52:40 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DD459C08E2;
        Fri, 13 Aug 2021 19:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1628884333; bh=KBcWWnPZpNM0AOKMbOXPgtoXjbBeekTvXETcZeu0K94=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Rld8al+Q/4iRnrX/ZtK+hmWgoktEKZBKOlIsZV6vL6Wt7/j6eqSVMdQS3LZTM8IEJ
         mHjHjDyoDsnEZjzzcns/RI2iEobVs5WjonrRwqNXProOSX+DYsT3fL4nJDOk7y6szl
         J6AO0F8kD5uJzSL1x5tvbIa+h8SkMdMj9yXxoefwXsgGbzimhARPCSlItZWmakKyQX
         M0CnByxfqZh9Zizu2pvfH8r3uINqxN3I5WUZRVO74oZpuSbMDj9c6C2prpI2Rke2YP
         BUltoDqnTPtWc0IFXOQpcUX8DHeJdY+KXgX79vvlNtfndPzo02knIiolatlZQe1Lm1
         J/0YdNFYC8hXA==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id C715DA00BD;
        Fri, 13 Aug 2021 19:52:08 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2046.outbound.protection.outlook.com [104.47.57.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 4521B40097;
        Fri, 13 Aug 2021 19:52:06 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="VLZkFlze";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+mJXKZu6FCXz0yudwI7nq8gipSGFX/Yor4MMAdA5vRTVeNckqU7KLS79FBpq1+XoUk0ywo86g4oWc/K3nNU0fq09Uo6y+8bCbUh9gJeTAWt39h9InHDu6Rcf3UU430GuSQekshMfzkPXUbkWUYs5/tEAVpgzDl53bxhIN7d9GWFOlEBPCH004H8ons7k3vIHuNxP7MBykIDVImMQHAldWYrb6lHC2tC6j0HH+DVcvsG1b61S1t0JfnkuGPP4dPuyThCfYFGJe3ccwmsgbFhC7j2ouuwTj13bF5fYjHFl1u7M0ZtRZxTRscLbbR145fueQYzLReQqPXvcyh7Pyp+AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBcWWnPZpNM0AOKMbOXPgtoXjbBeekTvXETcZeu0K94=;
 b=K3hmfJ0TDGJVqB1/NDES4oqRUJKa+jQhwWXaEmxAqBgUGk7UEYW0/PtMDCCwGg/lsqgJdHsyj9lW+3kgCqZ6HTnBOq9Y+kZE3LpUI8SmALtYWOVpgBbe7+b1Kl9e4U53XMRb6XA9wSL+0BhfIp8V3yp9zB7Id2Olu4e+YiKkXY8Tk85aX7/yU3g861LjKblN8jDx3EqGmWW9trEXPlLU5SxQOVxIJkYkw3Oy7v723qq6NFIMJ53BK7bRaxetcVEF38jOnrSY2H8EvVrxCJKKs+ox2RRX+uEDo21A3mZHIogLi69QC1Eom41goMvBdpho501XuZwD14ODcYvoH3ZSdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBcWWnPZpNM0AOKMbOXPgtoXjbBeekTvXETcZeu0K94=;
 b=VLZkFlzeiewWSa+4JJHNlzrMJpTCwJ6PkXYJbYjmCEY6p319lxIDGyASoxSMv9eB6HcZtz5D3HUSYuf+KN3kLMtSIHlelzaYBFxGH+zMg/eerMbu6iSwTD3Ru/LFdUN1IIxXh4BgjZsnBOWyzqatC6Q5EHZA4Y0eK/XCpaO1Xq4=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB2856.namprd12.prod.outlook.com (2603:10b6:a03:136::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Fri, 13 Aug
 2021 19:52:03 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::163:f142:621e:3db9]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::163:f142:621e:3db9%7]) with mapi id 15.20.4415.017; Fri, 13 Aug 2021
 19:52:03 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Rob Herring <robh@kernel.org>, Baruch Siach <baruch@tkos.co.il>
CC:     Felipe Balbi <balbi@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Balaji Prakash J <bjagadee@codeaurora.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 4/6] usb: dwc3: reference clock period configuration
Thread-Topic: [PATCH v2 4/6] usb: dwc3: reference clock period configuration
Thread-Index: AQHXiTnt/GO+HkNUgkeAoESR7uPeE6tjYusAgAAC7oCADljMAIAAKEUA
Date:   Fri, 13 Aug 2021 19:52:03 +0000
Message-ID: <53784e58-6da4-ad61-6b9e-46697fb3d695@synopsys.com>
References: <3d86f45004fe2fcbae0a2cd197df81a1fd076a1e.1628085910.git.baruch@tkos.co.il>
 <0e99e3d453547ad2a8f4541090a03f3c80b80332.1628085910.git.baruch@tkos.co.il>
 <87lf5h5mc2.fsf@kernel.org> <87v94lxpb0.fsf@tarshish>
 <YRarmizUtzIunV1P@robh.at.kernel.org>
In-Reply-To: <YRarmizUtzIunV1P@robh.at.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd02fe4a-0ea3-4768-a1e8-08d95e93d297
x-ms-traffictypediagnostic: BYAPR12MB2856:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2856BC88E6E834EE947AB25FAAFA9@BYAPR12MB2856.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j60QYvHuGMR3UiQb7xTKOMDjKMwhCKu2kDTlrsU3DEaM4JayzJqAiZKM/bs3UcneIWHL80VX1tzHbmgPQoWaAoFvuQSzlCYFudYAHSatf2qNZjdmnYaGgEqS8Jv5ix/kce8pa57J0Q/QlmVwrfm+3H0nRufrFg8mH6YB7d84sQdGjiK8SPuPJNY9DpoYRH7z6QBRcZ6Eyi+yzJsQgGn75mP+cnmFc4XRxp3FaInAZ095KwptyyVyA+S/eeariDc7fXdut+dy/QzFUkvilPAnaAzBy6vqYuz7g0mCoE1PgCe5Rc+jCwwYskZ6Dp2WayTO1ny9H3qx/+5GohDrbJzjQ4r9kl/x/D271nUZPyzZ4KI6oDNdDU7x6sWRjfJlMCN5ntVQDj1G9ejnFAL20XS1AHzLIWyt1suxSl6Kua1w7MceWPfLVMTwYdD4rzFcRVoC+2snv7zU8+FaiSl3jddHy7IvDODOTkFHjAaaJphLsdl5i8Ok2bX1zJ1RwpRYziRv4GoRD/qH9YeZFESzztDxrMV4eo55zmXtraGcqK1JmbhmBVfYFknuy8hZF05yHc7h+IYfKtLdbz9+cuCzydcmnZADel/NBHodE7xJDVyIaGEKTai5BKHwpMav4LJTLn8bb37c+CFRgBGoyJ6th5F5gmDrrgW3ZoeDeafbtK2Zp1SRdj91t+l76NMm9tyCs+0pAdAwNU41KUmrQ2K0QT1BX/ml42I/SHbkL9aH4E0VTJ/YbWyyN/oyvhCuSm36A/MkkHdbNiaPH5j5KmWGuuqQOddpmCUK/YzEDWhwvV45kKjT3L3x3nTSgk0ZhvySCPVbR3wX07Qk4FtTvu3w5DGH3pXHSkLVZGogLB6x8Vfq5s4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(39840400004)(346002)(366004)(376002)(396003)(136003)(54906003)(186003)(26005)(31686004)(86362001)(966005)(36756003)(478600001)(6506007)(38070700005)(7416002)(122000001)(110136005)(2906002)(2616005)(4326008)(5660300002)(6512007)(316002)(6486002)(64756008)(38100700002)(66446008)(76116006)(8676002)(66946007)(66476007)(31696002)(83380400001)(66556008)(71200400001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3JBTFYrZ1lzWnc0eWF5SnFISnQvT2UyOUpodFlaSmRLU05XVUZJZUtuZTVD?=
 =?utf-8?B?VG1ELzhER1UwbVlVN2NpalFaZXVLRnppL1ljMWpnbzA3QXJwU05nUUdUazF2?=
 =?utf-8?B?KzNHODhBckFQZHphMDF4RTY5ZnZNK3p4OG9xL3BKVlp4VldsaDJIZHZzdExa?=
 =?utf-8?B?SS9rcEdnc2F5cnRRbGtTVWlhM2VpRDg4R1JsbHdzZGFDQ3Jvb3RrMnRoNzBH?=
 =?utf-8?B?TlcvR3BpcVhkZEZ6ZUtxTFg0ZW43VzF0RWNCNkRjblFOdXF6dkV0U1c1eG5P?=
 =?utf-8?B?SXhYYUlSVDQvK1dIV2VUZHRXNnEyMWlINUVscWZTRTVjSzJjRGplZXdnTStr?=
 =?utf-8?B?cTZJbUluVlhqTFZaV2NnRC9kY2pqVXVnNjdZNVRUTWhWRU9JYjRaZlo1VVU1?=
 =?utf-8?B?c0dIVjVYa1pOQk4xb29xRnlZRWVXY1kwcmY4RHBSYzlzR3VTcDNWM2FiTTUy?=
 =?utf-8?B?Mkt5VWlQbmppa1dIVFFBOXpvZ1R2UFpaN1h6dnR5M2lOSDFCdVlEZHZpTWtQ?=
 =?utf-8?B?eTdZYTMxK01FUU9mVmVmeGJyb256Y0IrRjI5MTVleTVUWXdZaFRJV0J0L3ht?=
 =?utf-8?B?RjU0WFRrWi9LMXdGOWhzQlhCSjhlM0tOYlZXNEFMYUlvdnRyTE1QRlpZTHpP?=
 =?utf-8?B?YTZ5NjBqTUtnV3M2VU9WMnNXTWd3cVBnNElLU2h3SENTSzJtUWQrV1VmMGRs?=
 =?utf-8?B?YTZLaElJR3ZtWHZSQmZZQk5mZnp1MFhISXJzcGlSUWFWdnpJME56V2QxOEhS?=
 =?utf-8?B?WUlwdExGK25nbEY1eGJuRTN4R1FvSDRnOHlCWGF5SWpzWjZIQzArdVhJY01x?=
 =?utf-8?B?Y1pibTQ0bnQwUXdHc2xFZXkvd0E5SHdsRm1QUkNnQitHSjlTS0NZZ29KOFp4?=
 =?utf-8?B?MlBFNG5ra3kzcUxJOWEzNWtlZVN5U0drQ2xLTUg0K1R1eU9acjhQS2J3cWxw?=
 =?utf-8?B?ZEVVU0NPNHhWVEpBWW1XVlpZdHErRVdOYlN3dldlNWYvQVVtdm5SRHJGS3Ri?=
 =?utf-8?B?YldDUjF0N0Q2UzBsMVVjaUV0MTA2ZlB2VHBTb3NFNzRTc1F0NmhqRXJMZU1z?=
 =?utf-8?B?N0RwR3VpSDc0d1RtVE9NMklaUXNiOHp4MUpyaWNweE94Skl3Y3o1anU2ZE96?=
 =?utf-8?B?QWM2TC8rREdGK0dVa2M1QU9ONnR5bUNPc3VyN052YWczR1Jxc0NBMWVjV3Vu?=
 =?utf-8?B?czJMWFQ4aEl4cGdveHFpMmZXUWdid3FzLzgwbzQ2SCs3WVZER2NucGVKQ2xX?=
 =?utf-8?B?aGduNWNVUGU3a3JHSXJDM0dRdmllTUJ6eEVpR2ZZTDhDbm1IVGFqbGx4VWhG?=
 =?utf-8?B?aHNWN0dFbm5tVzJIdVhpeXR2TS9XZVVmRDc5ZGxNNk1VMEh4dmlWL25HaTFE?=
 =?utf-8?B?VEY2VEZuMHFjT3ZNSkhXRlhFM3VrYWtWNlJYOEY2Tk9CL0VHMEt0Si9oaGpC?=
 =?utf-8?B?Rmo1N1dlY0RmcHdnWTNuMFRtUk90am51V25ndzNRMm1CZWVPdjQ0ZFlqTzdw?=
 =?utf-8?B?T3BOb3lUWjhadDBzOWpUaCt5T3Rpd21jeTJVSzZlaGhRaytGbS84YUZoeUhn?=
 =?utf-8?B?RVFYNkpwY3BtdEZwc1BrdUE0Y0g1dnZ2STFkMWpQM1FTaU5kay81T1ZTbGty?=
 =?utf-8?B?V29RSDE4MkNEWmorWGhBMk5HTXNDUEJkcXhQTlVKbjR3Y2F2YThBV0JoUXZG?=
 =?utf-8?B?S3ZHVFhuYnFCQjRqeU1aVlJkWmYzZ0ZXck9WaWdFM21WSkU0NHMzVlJzbDFw?=
 =?utf-8?Q?oLFRnDEiCYuyuuIJA0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C69E55C220B476418F1D141FEBFBC3A0@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd02fe4a-0ea3-4768-a1e8-08d95e93d297
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2021 19:52:03.4532
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6uq/GMGI+/vLs4qiDVHeOApCJ6jkTlp73tBqzRESfOMyO/aZMo0bDfKDGdguu0KoX+mDlXgIZ/qWypQZc4Fhrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2856
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Um9iIEhlcnJpbmcgd3JvdGU6DQo+IE9uIFdlZCwgQXVnIDA0LCAyMDIxIGF0IDA1OjIyOjI3UE0g
KzAzMDAsIEJhcnVjaCBTaWFjaCB3cm90ZToNCj4+IEhpIEZlbGlwZSwNCj4+DQo+PiBPbiBXZWQs
IEF1ZyAwNCAyMDIxLCBGZWxpcGUgQmFsYmkgd3JvdGU6DQo+Pj4gQmFydWNoIFNpYWNoIDxiYXJ1
Y2hAdGtvcy5jby5pbD4gd3JpdGVzOg0KPj4+PiBAQCAtMTM3MSw2ICsxMzk4LDggQEAgc3RhdGlj
IHZvaWQgZHdjM19nZXRfcHJvcGVydGllcyhzdHJ1Y3QgZHdjMyAqZHdjKQ0KPj4+PiAgCQkJCSAg
ICAmZHdjLT5oc3BoeV9pbnRlcmZhY2UpOw0KPj4+PiAgCWRldmljZV9wcm9wZXJ0eV9yZWFkX3Uz
MihkZXYsICJzbnBzLHF1aXJrLWZyYW1lLWxlbmd0aC1hZGp1c3RtZW50IiwNCj4+Pj4gIAkJCQkg
JmR3Yy0+ZmxhZGopOw0KPj4+PiArCWRldmljZV9wcm9wZXJ0eV9yZWFkX3UzMihkZXYsICJzbnBz
LHJlZi1jbG9jay1wZXJpb2QiLA0KPj4+PiArCQkJCSAmZHdjLT5yZWZfY2xrX3Blcik7DQo+Pj4N
Cj4+PiBJIHdvbmRlciBpZiBpdCB3b3VsZCBtYWtlIG1vcmUgc2Vuc2UgdG8gcGFzcyBhbiBhY3R1
YWwgY2xvY2sgcmVmZXJlbmNlDQo+Pj4gaGVyZS4gSWYgdmFsaWQsIHRoZW4gcmVjb25maWd1cmUg
dGhlIHBlcmlvZCB0byB0aGUgdmFsdWUgcmV0dXJuZWQgYnkNCj4+PiBjbGtfZ2V0X3JhdGUoKS4g
SXQgd291bGQgYXZvaWQgeWV0IGFub3RoZXIgRFQgYmluZGluZy4gSWYgd2UgbWFrZSB0aGUNCj4+
PiBjbG9jayBvcHRpb25hbCwgdGhlbiB3ZSB3b24ndCBhZmZlY3QgYW55IG90aGVyIHBsYXRmb3Jt
cy4gVGhlIGNsb2NrDQo+Pj4gaXRzZWxmIGNvdWxkIGJlIGEgcmVndWxhciBmaXhlZCBjbG9jayBu
b2RlLg0KPj4NCj4+IFRoaW5oIE5ndXllbiBhc2tlZCB0byBhZGQgYSBkZWRpY2F0ZWQgRFQgcHJv
cGVydHkuIEhlIGV4cGxhaW5lZCB0aGF0DQo+PiBjbGtfZ2V0X3JhdGUoKSBkb2VzIG5vdCB3b3Jr
IGZvciBQQ0kgaG9zdGVkIGR3YzMuIFRoaXMgaXMgdGhlIG1vc3QNCj4+IGNvbXBsZXRlIHN1bW1h
cnkgb2YgdGhlIGRpc2N1c3Npb246DQo+Pg0KPj4gICBodHRwczovL3VybGRlZmVuc2UuY29tL3Yz
L19faHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci9jNzk3ZTljYi1jYWU2LWMwYjYtNTcxNC0xNjlj
MmFkNzlkMzJAc3lub3BzeXMuY29tX187ISFBNEYyUjlHX3BnIU5oNnJxcF9hT2Q4WEl2cUVMdkRS
UWU1b29aZjEzVVpLd21uOWxXY1JnZGJ5TUtwVE16TDhIYXNyQjFYMk9qdnVtbzhnJCANCj4gDQo+
IFBDSSBkZXZpY2VzIGNhbiBoYXZlIERUIG5vZGVzIHdpdGggY2xvY2sgcHJvcGVydGllcyB0b28u
IE9yIHVzZSB0aGUgDQo+IFZJRC9QSUQgdG8gaW5mZXIgdGhlIGZyZXF1ZW5jeS4gT3IgdXNlICdj
bG9jay1mcmVxdWVuY3knIHByb3BlcnR5Lg0KPiANCj4gSXQgYm9pbHMgZG93biB0byB3ZSBoYXZl
IGxvdHMgb2Ygc3RhbmRhcmQgcHJvcGVydGllcyBmb3IgY2xvY2tzIGFuZCANCj4gY2xvY2sgY29u
ZmlndXJhdGlvbiwgc28gY3VzdG9tIHByb3BlcnRpZXMgYXJlIGEgTkFLLg0KPiANCg0KRG8gd2Ug
aGF2ZSBEVCBub2RlIGZvciB0aGUgUENJIGRldmljZSBiZWZvcmUgZGlzY292ZXJpbmcgdGhlIGRl
dmljZSBmcm9tDQpQQ0kgYnVzIGVudW1lcmF0aW9uPyBJIGRvbid0IHRoaW5rIHdlIGNhbiBmaW5k
IHRoZSBjbG9jayBwcm9wZXJ0aWVzIGZyb20NCml0cyBjb25maWd1cmF0aW9uIHNwYWNlLiBGb3Ig
b3VyIEhBUFMgZGV2aWNlcywgd2UgY2FuJ3QgdXNlIFZJRC9QSUQgdG8NCmluZmVyIHRoZSBmcmVx
dWVuY3kgc2luY2Ugb3VyIHBoeSBhbmQgcmVmIGNsb2NrIG1heSBjaGFuZ2UuDQoNCkRvZXMgImNs
b2NrLWZyZXF1ZW5jeSIgbWVhbiByZWYgY2xvY2s/IElmIHNvLCBsZXQncyB1c2UgdGhhdD8NCg0K
VGhhbmtzLA0KVGhpbmgNCg==
