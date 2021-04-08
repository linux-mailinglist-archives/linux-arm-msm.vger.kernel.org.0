Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C35D4357A8E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 04:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbhDHCu0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 22:50:26 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:48214 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229514AbhDHCu0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 22:50:26 -0400
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 30412C096A;
        Thu,  8 Apr 2021 02:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1617850209; bh=g+48cUWgOrZ/acngEkJV4zZR9svHl2rFKmqs8z1oglY=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=BYD568/8NyjSUVGsYr+/n7DU9IcmOjXVy64+1CmMuQO8/2U+Qz7o+E3vuBjUBO7P7
         FUp3GxlXiFFnfXz+hQ252GB/hW2vqrLVYlsrMXDQipLpFbG4Qm0EFW/s+U9U7NYPcD
         MEieKg6XxIN0HILm3Ms+K+uP9JY1vZnSM6lJBJ5t0HlLJdK12mmjAFKBiGLP9+rMbg
         dHWElDAzC/m+UKkNBrd9d1G9qg6iM+hvB1wcWgfo1828mW0PtG9+4FquumJ9eDKWLw
         gDfi8IIFwldfcQFSMfLXTwSa/hwxzNyb7PVpl4yHVIKGRPoidDUhunteCgfwRtvfCo
         To5TwDKIuxssg==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id CB58EA0077;
        Thu,  8 Apr 2021 02:50:05 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 94CA6400E5;
        Thu,  8 Apr 2021 02:50:03 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="FMNmhU6D";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hLr3fs2tAs2fG5idcBPBFjNR2bbVJS9W5V6wVlJ0gcSDZH6FfeLXiXsNcLrZMeFfwK1KPfjGLkE3hwSRT1OHXj1p+RrB/P0rck3jV4Mf0QqLFTiOlgcSvgjjgz+sZS+S1KRjZLZFQg47thkhhZCdfZblcshKxeujQihk/wzy6ML4zQAoLpnGStRVUfH81hExbrQeLgslPU+R4Vq+UkL6OyJ2zZf9pdYIB/GDiHgYImi2+zvaZUQJ63Oh4gFkwfN6gvBlxD1yDNIvQeCrrb+KW2hyWuSKeVFLufrVQGE3KHKpwhf0Hk57WbhgVzjFNfQcaH0QQcgeX6S7gF1EB9Qpzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+48cUWgOrZ/acngEkJV4zZR9svHl2rFKmqs8z1oglY=;
 b=mJOVFnUK7o5mjP7xcnwXUvVT0g5hgPNHr1rqjNPs966eGbAXmncX4K6NS1+OIVX04R2TdNYFx4107/8DOJpziFT7I/HEAuxgEQ6bZ/FuzlScYexC1NPVi5sGhtlVphQoVD/rGVpwfcEYZZoBKPysIlmpXbwx2jBcuBIu9DDZ1NCFr+/NfFXbzaR5iNezkQ7p2hakjTu+sVQ/YpKIKuguBWXsGapQy8p3F7u50awOcHs4+Ao3f0zFWvU7hysMeuhQF4ySL9i9hQzErMJ55iKmP+5tNKXLMHrUjn1QYj5y1JD0Wavz1KBuYz/cCN8ZJRBBoWIA3zcMwkSIbkvkbWFcaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+48cUWgOrZ/acngEkJV4zZR9svHl2rFKmqs8z1oglY=;
 b=FMNmhU6DNeQXOqQH7A9rjvK/eLQYn5MfSKLJEdsWa0goPaztLkCCVKJtP3jgewOuvbRzJ2ZdSZ9chzdwROiWnM+No2H5pt1fShq7U69VdpjM6dsZWKdsixOKSlm9YA2A7cR3YKfJwAvZyaULOLq/PP3DpTVyh90E//EagpBZMcw=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB3302.namprd12.prod.outlook.com (2603:10b6:a03:12f::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Thu, 8 Apr
 2021 02:50:01 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c%6]) with mapi id 15.20.4020.018; Thu, 8 Apr 2021
 02:50:01 +0000
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
Thread-Index: AQHW/eInRTRYpSizoUSSkIWQR33qw6qdm2uAgAuy5gCAAOnRAIAACFWAgAAHgAA=
Date:   Thu, 8 Apr 2021 02:50:01 +0000
Message-ID: <379f7e1a-35ce-511e-74d7-1e22451ad7a6@synopsys.com>
References: <8fc38cb73afd31269f1ea0c28e73604c53cebb17.1612764006.git.baruch@tkos.co.il>
 <f3042097-8569-5882-06db-ae56e05cac59@synopsys.com>
 <8cc9617dc62be17ac3a9420e7750b0ee@codeaurora.org>
 <4e5a3487-bae2-b21a-df90-80b5f0d170ba@synopsys.com>
 <20210408022309.GL904837@yoga>
In-Reply-To: <20210408022309.GL904837@yoga>
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
x-ms-office365-filtering-correlation-id: b18450a0-5942-410e-aef3-08d8fa39013e
x-ms-traffictypediagnostic: BYAPR12MB3302:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3302F5B313654896FB9F0700AA749@BYAPR12MB3302.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oDMABm/d5xBWSF99vFRTO9Oj9C+hiOfFYVUwN7DNFNCld8T7f9wFloXuoEe0An2wW7emQ0JE26nFO1AJL11vpkxW9sY+3FjyBCtFIknu7+DvdDvjX84lxmJq4y0DpCMbaPo3XCJe6DJpEbz6L0kE59nVhkBGXYymD3FGb0JrVm5I1QQRG0Jb3qDprHVRlhYF0Bj3s9AZhxyWUQ0fXHFrS/lMs3evN2v3lkwqwzvOVe2QMUgTWbZSyfOkykijpDwnino7Z6oOYpCjHNI6YgLzcyZ6vigQ5zEo2mswea52Z2DSuos0L7nL0122ImjLii5aJIGZOqR5gqw2AHgkrmYnPQMCMoI9BQS6ynGvgncxRWnHeC7qKV7zwqtOxSFq6fcZxOMumlCZY4IZFo62J9IbyluGoy5DUyfRPYq49N1gsOSgjXJKXjk5zJNferMkFfFtbGjSRh2Ldny35KU/UueFEMblT8hqM7uqfU1/igx4U00qBWt8OTcBvGvlUr6Oh7e+KPPlRg0hdfUkCyz/D9ciGRl4QORFpYVrkaDV2jg+y0J4wwL01489TRX6uxsGhP4sJciCyYzSM+VJ1KsLNh1uIS9kbOgA6peHIToFuO11Tb4diSrQCkvSdXh/eSovgcibDv6dr3KY4PUSCUYRs4uxlv+nO8lH38I3g4hhLLzT/DysC4nSb4sz1XKoLZ6+eOdIBDYCYvl7Y+AeIXETYURDpbPtESGadeJMGOh9IS3H7IA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(366004)(39860400002)(346002)(376002)(38100700001)(54906003)(36756003)(110136005)(86362001)(31686004)(5660300002)(6486002)(186003)(2616005)(64756008)(76116006)(71200400001)(8676002)(31696002)(8936002)(66946007)(66446008)(66476007)(66556008)(53546011)(4326008)(2906002)(26005)(83380400001)(6512007)(478600001)(6506007)(316002)(84040400003)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?UzNKZERMOHJNczFSVDZaZE1zcGZsSmFXL3lPb0NUVXZmdXJtUlZoRFlRK1lk?=
 =?utf-8?B?ZkZqV284TkNKL1hsOGc0UFdOWmQ4NlZ5QUxuVWZrNWdJaDFjWmc3ditUMHNz?=
 =?utf-8?B?aXZyYWNHMldvdGFHL29naDFJOVhjUW1ydEVxR015Y3hHTzR4T3ZETU80MlBO?=
 =?utf-8?B?OTcxVXFlTG5aVEtpVWxMQVArN0ExWGJpNTRZT2ZGU2pGaXZsRHRiTG95S1BC?=
 =?utf-8?B?Ylllck5JMm4vSFQ2WHJlTGE4ZGNEYWpzazhMZDRweHRZUmJwZVJpVlZMTTVn?=
 =?utf-8?B?Q1JGWHBsUjFTOStiRTZvbng2TlkyQnZtUDBNZXZSZlRndmkvRitnSktHcHp4?=
 =?utf-8?B?djZmUjF6b1VJUTFvN2NXelFDWFhWVnRjVnk3TXl0TWtENnhod2RlRDNObDJq?=
 =?utf-8?B?dkN2T1grb0xnaDU1K2hlcHlXODRkY0FsNi9xMmJvVnNEM2lMblZKdzExREl6?=
 =?utf-8?B?V0trRDNEWWRvRFlwc08xRzRvS2VMYmFrcnZLUjQ0YVpNZ1VNSjRpY2c4dndh?=
 =?utf-8?B?anRKc3l2ZklENm5NaHgzRm1IcnkyM1Z5bGo1bDNnSERVbTN6Unordm53TkNv?=
 =?utf-8?B?YXFEM0llM09jK3V2MldSbWc5SElTU2tOdFIybzNRMXhHQ09WUWVVQkdKUzhC?=
 =?utf-8?B?UW16R1F3NlRHODBkK0cwOWhzQXF0cjZ5ZWYrTjVyU1R6eXVuZGpEVXdxNWJm?=
 =?utf-8?B?UU9HZmlLWVg5OENKdjhGMHAvQzNDWkNJUFl1Qyt1Y2Q0ZG9VWDRZZ3RQTlNJ?=
 =?utf-8?B?R05zZ0hZZUVIL2hwV0N0Y2xQRzE5elJodzhJaTFSM3lHMWQzUTRWNzlzVE1q?=
 =?utf-8?B?R2dBU01LOE5TVWNiS2xzb3owYmtaNUMraUp1RzltSEhJb0p0MCtYbUdROUNl?=
 =?utf-8?B?UWNBMWc0OGNTMHFZSlZpSlV3a1VXeGFZWHJnVFA1cnlPc3dIZ2g5SFdmVzE5?=
 =?utf-8?B?eHpyQjJBd1VvSmQ0Q2xETFpoYXRMOGh6ZnRwL2FZV0ZjWFl5STJVR0M4WUNK?=
 =?utf-8?B?dWZFd3RLRjZaNk1wNForK0JBTWVKNUxSRmNIL3lxS1hzOUdKWEpFUXA4WW5V?=
 =?utf-8?B?RUdkNkUzYlZPV2cwUy8xamRIMXFWaU5telR0T1hIVVA3SGtBbkdIcUZoc3ZH?=
 =?utf-8?B?bGh1RWRuYUdrc3JKRzJkN1QzbXVvdFJTaHR1LzRXQXVObms5ZUR6dVdaTk5N?=
 =?utf-8?B?czNlVmJDVC9wNkpvWlFwU3hjMzllMldkWEVnR1lJRmNTOW0zRk1ZZDJ6TU9Z?=
 =?utf-8?B?N3ByVkVvV0xSL1JydzhGMXFtNWwzUGx6V3lUdkRrbkRscDVhNjkxZWVoM1kx?=
 =?utf-8?B?V29wbVRRUTFSR2NtRjNZUS9Yd1dkZTYyb1htL2oxVHBXOVFSME0wWi9xRXox?=
 =?utf-8?B?MElNTHNRZ3VtbDNER1JidnJuRGZhOEorL0ZHT3VtMnREM2Vlb0VoOC9WN3ht?=
 =?utf-8?B?NHEvYTJHWkxJbjR1ZGhwTXdGSDEraUl2RVgrTUdNb1JoR01Yd2llZzJvK09G?=
 =?utf-8?B?dUZSci9iYUNSU3JVVHNkOFZ5ZUpWdXA3N0MrYUR6d29Pbi9Fb1dSNzBjdWkv?=
 =?utf-8?B?UnZOZHVZbi9pVkdFTVI3VHJIS0xXMTkyWStsbjFKWFVLTU1FS3JHbHJyaDdo?=
 =?utf-8?B?UkhqbWZ2VDRUd1AyclVwQkVBb2szSHhZMkpLWFV6dURqN3RaVks4UHBjU095?=
 =?utf-8?B?bDFPZ3RORVFIbUhHU1BqTWF1T21BeVpYekVCOVJZRWpYRk9ZTE94VjcyYWM3?=
 =?utf-8?Q?210H7V1jk5emOLDVTY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <25E2601CC4CDE648BAEA99CD12D13719@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b18450a0-5942-410e-aef3-08d8fa39013e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2021 02:50:01.2581
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n6kxGwIlkH4nJbzLG5le3iS3O86ick0UNrNoz4N6e8wKWes3u5CSAMMROXB8y2nxzS+aBlhJlUqE0+XhYyX+MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3302
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qmpvcm4gQW5kZXJzc29uIHdyb3RlOg0KPiBPbiBXZWQgMDcgQXByIDIwOjUzIENEVCAyMDIxLCBU
aGluaCBOZ3V5ZW4gd3JvdGU6DQo+IA0KPj4gS2F0aGlyYXZhbiBUIHdyb3RlOg0KPj4+IE9uIDIw
MjEtMDMtMzEgMDY6NDcsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4+Pj4gQmFydWNoIFNpYWNoIHdy
b3RlOg0KPj4+Pj4gRnJvbTogQmFsYWppIFByYWthc2ggSiA8YmphZ2FkZWVAY29kZWF1cm9yYS5v
cmc+DQo+Pj4+Pg0KPj4+Pj4gRFdDX1VTQjNfR0ZMQURKIGFuZCBEV0NfVVNCM19HVUNUTCByZWdp
c3RlcnMgY29udGFpbiBvcHRpb25zDQo+Pj4+PiB0byBjb250cm9sIHRoZSBiZWhhdmlvciBvZiBj
b250cm9sbGVyIHdpdGggcmVzcGVjdCB0byBTT0YgYW5kIElUUC4NCj4+Pj4+IFRoZSByZXNldCB2
YWx1ZXMgb2YgdGhlc2UgcmVnaXN0ZXJzIGFyZSBhbGlnbmVkIGZvciAxOS4yIE1Ieg0KPj4+Pj4g
cmVmZXJlbmNlIGNsb2NrIHNvdXJjZS4gVGhpcyBjaGFuZ2Ugd2lsbCBhZGQgb3B0aW9uIHRvIG92
ZXJyaWRlDQo+Pj4+PiB0aGVzZSBzZXR0aW5ncyBmb3IgcmVmZXJlbmNlIGNsb2NrIG90aGVyIHRo
YW4gMTkuMiBNSHoNCj4+Pj4+DQo+Pj4+PiBUZXN0ZWQgb24gSVBRNjAxOCBTb0MgYmFzZWQgQ1Aw
MSBib2FyZCB3aXRoIDI0TUh6IHJlZmVyZW5jZSBjbG9jay4NCj4+Pj4+DQo+Pj4+PiBTaWduZWQt
b2ZmLWJ5OiBCYWxhamkgUHJha2FzaCBKIDxiamFnYWRlZUBjb2RlYXVyb3JhLm9yZz4NCj4+Pj4+
IFsgYmFydWNoOiBtZW50aW9uIHRlc3RlZCBoYXJkd2FyZSBdDQo+Pj4+PiBTaWduZWQtb2ZmLWJ5
OiBCYXJ1Y2ggU2lhY2ggPGJhcnVjaEB0a29zLmNvLmlsPg0KPj4+Pj4gLS0tDQo+Pj4+PiDCoC4u
Li9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9kd2MzLnR4dMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAg
NSArKw0KPj4+Pj4gwqBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuY8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNTIgKysrKysrKysrKysrKysrKysrKw0KPj4+Pj4g
wqBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHwgMTIgKysrKysNCj4+Pj4+IMKgMyBmaWxlcyBjaGFuZ2VkLCA2OSBpbnNl
cnRpb25zKCspDQo+Pj4+Pg0KPj4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy91c2IvZHdjMy50eHQNCj4+Pj4+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3VzYi9kd2MzLnR4dA0KPj4+Pj4gaW5kZXggMWFhZTJiNjE2MGMxLi40ZmZh
ODdiNjk3ZGMgMTAwNjQ0DQo+Pj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvdXNiL2R3YzMudHh0DQo+Pj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvdXNiL2R3YzMudHh0DQo+Pj4+PiBAQCAtODksNiArODksMTEgQEAgT3B0aW9uYWwg
cHJvcGVydGllczoNCj4+Pj4+IMKgIC0gc25wcyxxdWlyay1mcmFtZS1sZW5ndGgtYWRqdXN0bWVu
dDogVmFsdWUgZm9yIEdGTEFESl8zME1IWiBmaWVsZA0KPj4+Pj4gb2YgR0ZMQURKDQo+Pj4+PiDC
oMKgwqDCoCByZWdpc3RlciBmb3IgcG9zdC1zaWxpY29uIGZyYW1lIGxlbmd0aCBhZGp1c3RtZW50
IHdoZW4gdGhlDQo+Pj4+PiDCoMKgwqDCoCBmbGFkal8zMG1oel9zZGJuZCBzaWduYWwgaXMgaW52
YWxpZCBvciBpbmNvcnJlY3QuDQo+Pj4+PiArIC0gc25wcyxxdWlyay1yZWYtY2xvY2stYWRqdXN0
bWVudDogVmFsdWUgZm9yIEdGTEFESl9SRUZDTEtfKiBmaWVsZHMNCj4+Pj4+IG9mIEdGTEFESg0K
Pj4+Pj4gK8KgwqDCoCByZWdpc3RlciBmb3IgcmVmZXJlbmNlIGNsb2NrIG90aGVyIHRoYW4gMTku
MiBNSHogaXMgdXNlZC4NCj4+Pj4+ICsgLSBzbnBzLHF1aXJrLXJlZi1jbG9jay1wZXJpb2Q6IFZh
bHVlIGZvciBSRUZDTEtQRVIgZmlsZWQgb2YgR1VDVEwuDQo+Pj4+PiBUaGlzIGZpZWxkDQo+Pj4+
PiArwqDCoMKgIGluZGljYXRlcyBpbiB0ZXJtcyBvZiBuYW5vIHNlY29uZHMgdGhlIHBlcmlvZCBv
ZiByZWZfY2xrLiBUbw0KPj4+Pj4gY2FsY3VsYXRlIHRoZQ0KPj4+Pj4gK8KgwqDCoCBpZGVhbCB2
YWx1ZSwgUkVGQ0xLUEVSID0gKDEvcmVmX2NsayBpbiBIeikqMTBeOS4NCj4+Pj4NCj4+Pj4gV2h5
IGlzIHRoaXMgYSBxdWlyaz8gSXQncyBub3QgYSBxdWlyay4gVGhlIHVzZXIgY2FuIGluZm9ybSB0
aGUgcmVmX2Nsaw0KPj4+PiBwZXJpb2QgdG8gdGhlIGNvbnRyb2xsZXIgaGVyZS4NCj4+Pj4NCj4+
Pj4gVGhlIGRlZmF1bHQgdmFsdWUgZnJvbSBHVUNUTC5SRUZDTEtQRVIgaXMgYSB2YWx1ZSBmcm9t
IGNvcmVDb25zdWx0YW50DQo+Pj4+IHNldHRpbmcuIFRoZSBkZXNpZ25lciBrbm93cyB3aGF0IHBl
cmlvZCBpdCBzaG91bGQgYmUgYW5kIHNob3VsZCBwcm9wZXJseQ0KPj4+PiBzZXQgaXQgaWYgdGhl
IGRlZmF1bHQgaXMgbm90IGNvcnJlY3RseSBzZXQuDQo+Pj4NCj4+PiBUaGFua3MgVGhpbmggZm9y
IHlvdXIgaW5wdXRzLiBDYW4gd2UgaGF2ZSB0aGUgRFQgcHJvcGVydHkgZm9yIGJvdGggdGhlDQo+
Pj4gR1VDVEwuUkVGQ0xLUEVSIGFuZCBHRkxBREouUkVGQ0xLKiBmaWVsZHM/DQo+Pj4gU2luY2Ug
R0ZMQURKLlJFRkNMSyogZmllbGQgdmFsdWVzIGRlcml2ZWQgYmFzZWQgb24gdGhlIEdVQ1RMLlJF
RkNMS1BFUi4NCj4+PiBJbiBvdGhlciB3b3JkcywgYXJlIHlvdSBmaW5lIHdpdGggdGhlDQo+Pj4g
YXBwcm9hY2ggZm9sbG93ZWQgaGVyZT8gSWYgc28sIHdlIGNhbiB3b3JrIG9uIHRoZSBuaXRwaWNr
cyBhbmQgc2VuZCB0aGUgVjIuDQo+Pj4NCj4+PiBQbGVhc2UgbGV0IHVzIGtub3cgeW91ciB0aG91
Z2h0cyBvbiB0aGlzLg0KPj4+DQo+Pg0KPj4gSGkgS2F0aGlyYXZhbiwNCj4+DQo+PiBZZXMsIElN
TywgdXNpbmcgRFQgcHJvcGVydGllcyB3b3JrIGp1c3QgZmluZSB0byBpbmZvcm0gdGhlIGNvbnRy
b2xsZXIgaWYNCj4+IHRoZSBkZWZhdWx0IHNldHRpbmdzIGRvbid0IG1hdGNoIHRoZSBIVyBjb25m
aWd1cmF0aW9uLg0KPiANCj4gSSdtIG5vdCBhZ2FpbnN0IHVzaW5nIGEgc2VwYXJhdGUgRFQgcHJv
cGVydHkgaWYgdGhlIGluZm9ybWF0aW9uIGl0DQo+IHByb3ZpZGVzIGNhbid0IGJlIGRlcml2ZWQg
ZnJvbSB3aGF0J3MgYWxyZWFkeSB0aGVyZS4NCg0KVGhhdCdzIHRoZSBpc3N1ZS4gVGhhdCBpbmZv
cm1hdGlvbiBpcyBub3QgYXZhaWxhYmxlIGlmIGR3YzMgaXMgdXNpbmcgUENJDQpidXMuDQoNCj4g
DQo+PiBBcyBJIG1lbnRpb24gaW4NCj4+IHRoZSBzZXBhcmF0ZSBlbWFpbCB0aHJlYWQsIHVzaW5n
IGNsa19nZXRfcmF0ZSgpIGRvZXNuJ3QgbWFrZSBzZW5zZSBmb3INCj4+IFBDSSBkZXZpY2VzLg0K
Pj4NCj4gDQo+IEknbSBzb3JyeSwgY2FuIHlvdSBoZWxwIG1lIHVuZGVyc3RhbmQgd2h5IHRoaXMg
cmVsYXRlIHRvIFBDST8NCg0KSXQncyBiZWNhdXNlIHRoZSBjbG9jaydzIGF0dHJpYnV0ZXMgYXJl
IG5vdCBleHBvc2VkIGlmIHdlJ3JlIHVzaW5nIHRoZQ0KUENJIGJ1cy4gVGhlIGRyaXZlciBjYW5u
b3QgYWNjZXNzIHRoaXMgaW5mb3JtYXRpb24gdW5sZXNzIHRoZSB1c2VyDQpwcm92aWRlcyBpdCBp
biBzb21lIG90aGVyIHdheS4NCg0KPiANCj4+IFRoZSBzbnBzLHF1aXJrLXJlZi1jbG9jay1hZGp1
c3RtZW50IHByb3BlcnR5IHVwZGF0ZXMgbXVsdGlwbGUgZmllbGRzIG9mDQo+PiB0aGUgR0ZMQURK
IGFuZCBub3QganVzdCBHRkxBREpfUkVGQ0xLX0ZMQURKLiBJJ2Qgc3VnZ2VzdCB0byBzcGxpdCB0
aGVtDQo+PiB0byBkaWZmZXJlbnQgcHJvcGVydGllcyBmb3IgZGlmZmVyZW50IGZpZWxkcyBmb3Ig
Y2xhcml0eS4gSWYgdGhlIG90aGVyDQo+PiBmaWVsZHMgb2YgR0ZMQURKLlJFRkNMS18qIGFyZSBk
ZXJpdmVkIGJhc2VkIG9uIHRoZSBHVUNUTC5SRUZDTEtQRVINCj4+IGFjY29yZGluZyB0byB0aGUg
ZXhhbXBsZSBvZiB0aGUgcHJvZ3JhbW1pbmcgZ3VpZGUsIHRoZW4gZG8gdGhhdA0KPj4gY2FsY3Vs
YXRpb24gaW4gdGhlIGRyaXZlciBhcyBkZWZhdWx0Lg0KPiANCj4gSXQgc291bmRzIHRvIG1lIHRo
YXQgcmF0aGVyIHRoYW4gc2F5aW5nICJyZWZjbGsgaXMgWCBNSHoiIHlvdSBwcm9wb3NlIGENCj4g
c2V0IG9yIHByb3BlcnRpZXMgaW4gdGhlIGxpbmUgb2YgIndyaXRlIFgsIFksIFogdG8gdGhlc2Ug
cmVnaXN0ZXJzIiwNCj4gd2hpY2ggaXNuJ3Qgd2hhdCB3ZSB0eXBpY2FsbHkgcHV0IGluIERULg0K
DQpEaWZmZXJlbnQgZmllbGRzIG9mIHRoZSByZWdpc3RlciBjb250cm9sIGRpZmZlcmVudCBmZWF0
dXJlcyBhbmQgbm90IGp1c3QNCnRoZSAicmVmY2xrIGlzIFggTUh6Ii4NCg0KR1VDVEwgcmVnaXN0
ZXIgZmllbGQgUkVGQ0xLUEVSIGlzICJyZWZjbGsgaXMgWCBNSHoiDQoNCkdGTEFESiByZWdpc3Rl
ciBmaWVsZCBHRkxBREpfUkVGQ0xLX0xQTV9TRUwgZW5hYmxlcyBhIGZlYXR1cmUgdG8gdXNlDQpy
ZWZjbGsgdG8gdHJhY2sgU09GL0lUUCBjb3VudGVyDQoNCkdGTEFESiByZWdpc3RlciBmaWVsZCBH
RkxBREpfUkVGQ0xLX0ZMQURKIGRvIGFkanVzdG1lbnRzIHRvIHRoZSBmcmFtZQ0KbGVuZ3RoIHdo
ZW4gcnVubmluZyBvbiByZWZjbGsNCg0KR0ZMQURKIHJlZ2lzdGVyIGZpZWxkIEdGTEFESl9SRUZD
TEtfMjQwTUhaX0RFQ1IgaXMgYW5vdGhlciBhZGp1c3RtZW50DQpmb3IgMjQwTUh6DQoNCkdGTEFE
SiByZWdpc3RlciBmaWVsZCBHRkxBREpfUkVGQ0xLXzI0ME1IWkRFQ1JfUExTMSBpcyBhbm90aGVy
IGFkanVzdG1lbnQNCg0KTXkgc3VnZ2VzdGlvbiBpcyB0byBoYXZlIDIgRFQgcHJvcGVydGllczoN
CjEpIGZvciBHVUNUTC5SRUZDTEtQRVIgZm9yICJyZWZjbGsgaXMgWCBNSHoiIGJ1dCBpbiB0ZXJt
IG9mIHBlcmlvZCBucw0KMikgZm9yIEdGTEFESi5HRkxBREpfUkVGQ0xLX0xQTV9TRUwgdG8gZW5h
YmxlIGEgc3BlY2lmaWMgZmVhdHVyZSBvZiB0aGUNCmNvbnRyb2xsZXIuIFRoZSBvdGhlciBmaWVs
ZHMgb2YgR0ZMQURKIGNhbiBiZSBjYWxjdWxhdGVkIGFzIGRlZmF1bHQNCmFjY29yZGluZyB0byB0
aGUgcHJvZ3JhbW1pbmcgZ3VpZGUuDQoNCklzIGl0IHR5cGljYWwgdGhhdCB3ZSBjb21iaW5lIGRp
ZmZlcmVudCBmZWF0dXJlcyBpbiBhIHNpbmdsZSBEVA0KcHJvcGVydHk/IFdoaWNoIHdhcyB3aGF0
IHRoaXMgb3JpZ25hbCBwYXRjaCBkaWQgZm9yIEdGTEFESiByZWdpc3RlciB3aXRoDQp0aGUgZmll
bGRzIG1lbnRpb25lZCBhYm92ZS4NCg0KQlIsDQpUaGluaA0KDQo+IA0KPiBSZWdhcmRzLA0KPiBC
am9ybg0KPiANCj4+IEhvd2V2ZXIsIEknZCBzdWdnZXN0IHRvIGNyZWF0ZSBhDQo+PiBzZXBhcmF0
ZSBwcm9wZXJ0eSAobWF5YmUgInNucHMsdXNlLXJlZmNsay1mb3Itc29mLWl0cCI/KSB0byBzZWxl
Y3QNCj4+IEdGTEFESi5HRkxBREpfUkVGQ0xLX0xQTV9TRUwgb3IgR0NUTC5TT0ZJVFBTWU5DIGRl
cGVuZGluZyB3aGV0aGVyIHRoZQ0KPj4gY29udHJvbGxlciBpcyBvcGVyYXRpbmcgYXMgaG9zdCBv
ciBkZXZpY2UgbW9kZS4NCj4+IE5vdGUgdGhhdCB0aGlzIGZlYXR1cmUNCj4+IGlzIG9ubHkgYXZh
aWxhYmxlIGZvciBEV0NfdXNiMzIgYW5kIERXQ191c2IzMSB2MS44MGEgb3IgaGlnaGVyLiBJIG5l
ZWQNCj4+IHRvIGRvdWJsZSBjaGVjayBmb3IgRFdDX3VzYjMgSVAsIGJ1dCBJIGJlbGlldmUgaXQn
cyB2My4zMGEgb3IgaGlnaGVyLg0KPj4NCj4+IEJ0dywgd2UgZG9uJ3QgbmVlZCB0byBtZW50aW9u
IDE5LjIgTUh6IHNpbmNlIGl0J3MgdGhlIHNwZWNpZmljIGRlZmF1bHQNCj4+IGNvbmZpZ3VyYXRp
b24gb2YgeW91ciBzZXR1cC4gT3RoZXIgc2V0dXBzIG1heSBub3QgYmUgdGhlIHNhbWUuDQo+Pg0K
Pj4gQlIsDQo+PiBUaGluaA0KDQo=
