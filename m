Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9620E4074CC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Sep 2021 05:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235246AbhIKDKY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Sep 2021 23:10:24 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:33372 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231864AbhIKDKT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Sep 2021 23:10:19 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 81F33C042E;
        Sat, 11 Sep 2021 03:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1631329747; bh=Rx7SkIqNmWqJacF0O26kbMw0JyCkwWOlP5uz2rC/qGo=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=jV29BbcpJ7JJIlHtRIXTG0Awvsuy2NtcMbVmRiS4OtF1D7ZkCd7vvc2Tuq+VqTYJ1
         kRYbSna2N51zgvKyRjqmueuQQXXshZbF7LpvHLVyL2kHjCAwFzU36VJ4WbXblmKPLe
         EbXtk3TKlpVDs5AKYV58npszx79nA8TCCthmTUsTME4Klt29i7IddxkjmpcLLsiZBj
         uSHAb1uHt4XXR3BsQZPHiTuFCzYJQ8QUEX0Y7gis9SvJuCKe+w6Z7qU+ULOIsTJVh3
         c1Na3SH/EVJ9Cb0ywOXJnqi6x/AObmyXCqdkYtoPqnX7xNfFlY/CEExgaOqiJg2Llc
         wp0cWjDRMVJfw==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id D81F9A006F;
        Sat, 11 Sep 2021 03:09:06 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9C926802F0;
        Sat, 11 Sep 2021 03:09:05 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="iocDASRZ";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZ6wXYs9UYAucuyyMETO61sIoHcmz5eTVhuvOaby7p5W22ilXvlElxQYvWtdJC8zHKPChTn4Uo6N8odYHN7vAPPa5RHQyvGBS4L1xvCAeBUVuILg+5whmZLjVjtOSa5KvzmUFuZIi6avp35L8NYRHf5ps4CaCD4nkdhxlvoiH91UV4ZsbF2cICfIsIgPeylTdeedXdEkNZWAsk6M8MK05iPhT4BTUMmlSjpI8GhbCM4K+h3Jnua59LL/lqaDjX22icnuU0nB7tokuFQ6s6wpIDl3KpXq2LvJ+8OcNuUmr0Zzn5DthJwurgDaA5eJNJkGm11RmfKizrEB/wq2pY8FhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Rx7SkIqNmWqJacF0O26kbMw0JyCkwWOlP5uz2rC/qGo=;
 b=RJVioKFy0Mk9LnFhnUnXiWMrHcQfzOiJaZNyYvJQjwuqlqUbZMEO5qj8AtkenANzTA6tF+7mMEVEtnyTO3dRrwk1OfdDCJRjmMTpYBpWbQChY4BKeQ8X0RiYcX0whFCQozZvRWBbMdSp+dbl9Txa4mfi72I/u12HsNREBDsGboBl/XH5y4w6Cx4kGErS3vb8gB1hzsaxkPUzvvb6jtWX49hlfykykMeBE6F8qqeK3pEMnxqsN9/WMFxxRRKpY0dKDxsF1xjEmSxKgnno6tyhlqts7tYQYyAhWm9QqGGka7ehwKjr3LfxPkqKTefEci0GGPE3rqntGzPfziD60rxBKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rx7SkIqNmWqJacF0O26kbMw0JyCkwWOlP5uz2rC/qGo=;
 b=iocDASRZ30bm14dEpz6e+ezibEM+mVT/R7TcnEVW3DAMCEEuj62VmquMbVtM+QiUg8Vdb5yFRx8Ms3CjeM4klL11pcpJ8V+E2xmzFHQWjTV0gtKySI1/Jsh6qaChc/+fXt2rYyYMirDeGgK0KLwDovj/QWk9JMGFA72/EmCT3sY=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB4727.namprd12.prod.outlook.com (2603:10b6:a03:99::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Sat, 11 Sep
 2021 03:08:55 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::508a:1772:de73:d89e]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::508a:1772:de73:d89e%4]) with mapi id 15.20.4500.016; Sat, 11 Sep 2021
 03:08:55 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Wesley Cheng <wcheng@codeaurora.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Jack Pham <jackp@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: gadget: Skip resizing EP's TX FIFO if already
 resized
Thread-Topic: [PATCH] usb: dwc3: gadget: Skip resizing EP's TX FIFO if already
 resized
Thread-Index: AQHXpVUbI6zrZuzuNkasP7SNAwlUbqucd/uAgAGWZYCAABurgA==
Date:   Sat, 11 Sep 2021 03:08:55 +0000
Message-ID: <6538dd76-5dea-1e31-9459-657898be6d8f@synopsys.com>
References: <20210909083120.15350-1-jackp@codeaurora.org>
 <6a4bb7a9-2c63-5e1e-f4fc-a5bbc7aaa168@synopsys.com>
 <db0664a9-575f-1c6a-2efc-ec8372e2f1d4@codeaurora.org>
In-Reply-To: <db0664a9-575f-1c6a-2efc-ec8372e2f1d4@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none
 header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a152ed6-86aa-4d7a-ce79-08d974d17dd7
x-ms-traffictypediagnostic: BYAPR12MB4727:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB472730A3EC4DE38F42F96FDCAAD79@BYAPR12MB4727.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SndxH2UJeMfhjPDprFke9cz36OoTyy+MgKRwSO7lVNGqLUBSSjVJOG+j8nIFXy8OYg2JpAj4clbDGM7pq78rxJ+naUi2NUy6rGLz/7AD5aoMHYiVY1b5R3SEfl0wHaki6GoX7EnCCyfChaErPXS3IzoZNlTrW0NZfFlrjby9kQ9y/x0rfhYj3oq6mH50Dz7LPiFz6xc6xJakFhCCOHrfduj11m9KS6yTc/EHiaZDdxXdNDDNtrtkWT8Dr11OKA2Mthou8Fgs4ZtSS2OKBUgTwmNOm34lUmAEaZz29gojj6RSiMJrFtGxXqto+Ju9/FKlBI8kzddUU4bQ2BUto8xnhnfOeOhnasBPPClZq3eWIxC0gZj/YzvJCor6khOVw8TsHrnoConAh2Q79lLAWXHFaMhKqzlT0BXsO3C5AS+jr7YbZLYjWt2IRZVrcPtXQksUb06bdozq1I16E58Sb0THTxfpWb5/nT7t8yHJlKFkGlHrcYmdSrGRoujCt4EDlzBNOAlEVamSzIV15HdHXFDlWo/AIWAXXBYYWN5+3oDtn7hIcgeeRF+O2jG6YKShQ/qRyD62bo4Cb/GFgTkCdD1SUv0We0US7Q63ZUZP6Ywk10VPWMeYZ9BQl4mG3D/4M+W3ZwQhOKW249vINU/s6hv8umJ2XEubhzsgInthIfFOEzg25LUCsmiU+ZVIgK2aqbh53TJmuzlLT10k5/NS5keOnhhG5kI+PbvxIs3FhTSUJky4Nq/QL+TqqSCN7G6TEnX8jzUaAau5xXfiyD+3aKY34Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(396003)(376002)(39860400002)(136003)(53546011)(86362001)(6486002)(186003)(6512007)(8676002)(5660300002)(31696002)(478600001)(8936002)(2616005)(6506007)(4326008)(66556008)(31686004)(64756008)(2906002)(316002)(66476007)(110136005)(54906003)(36756003)(38100700002)(122000001)(76116006)(38070700005)(66446008)(26005)(71200400001)(83380400001)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TkFUSUFtM0pNUjVMQlVEMVpNR0V2NFhjeXVTVERmdnN5VHhaTU55S3A4YlND?=
 =?utf-8?B?TDJIK1Y3Z3R3dVdtVmFlRVVhMW1wZXdaN0VIYXV6SkVVVUJvQ1FxTnZMU0gw?=
 =?utf-8?B?R0FhR0FPQXRKK1pvUUVXeFJGenVFNkRWMGFMeHNYYVdvVzRiUVl6RUE1cDN2?=
 =?utf-8?B?NVUyVmVLdVpPbkNlV2VkQ0JaMlY4MFJBc1R6ZHdsM25VMldDV3RqN09TRFBK?=
 =?utf-8?B?d05Dc04rTlpMQmpTRGpRTndwVVkzNjlGTFBWZHc2UTlrS2NpVFdxYkRxRzFY?=
 =?utf-8?B?eE15QzE2NDgyU0NUKytianRRTUtXQTd5UWRyeXVRK29mblgxbHEvemNteXdO?=
 =?utf-8?B?RjFEenk2QVVpTGVkQXlRYVJ0ajEwWXM3bWFXck55dnhzOEVEeDUxd05FT2Fp?=
 =?utf-8?B?UWI2Ym1RempyMXlyLzIrVjlCUjZSMjBZdUZubFEzUzh4YVhQY3EvTE5Kdm9a?=
 =?utf-8?B?eVpIVGdod3EyV0tvUERSRkdvWEV3Mm9nSGN2WGhzNXR2QlpVdjZGa0pQY2Z6?=
 =?utf-8?B?Y2F6YWtpNU1TbnJvVWZ3ekJjeDBZSGdONXoyVVRyd2ZVZFBMVVJ2S1IwSlZy?=
 =?utf-8?B?YTBia0NRbnp6NjVRa05aeWJSZFVhS1NITFd1YUduZzh2Qk0ycWxya1dwWFBX?=
 =?utf-8?B?eU51UklzVTBVOHdZaHJQblg4bTB1UTFnend3eEk0c3FHZHlsU1hjYjdIdjQ1?=
 =?utf-8?B?bG5ReW1SNGRkUHQzK1dJTnplTkFSUHZsc002aFowYlNibXp4Y0g3bFNyMm8x?=
 =?utf-8?B?b2g3RFBiVUNxZlpiTklRQUN4Nk0vVEd6a0R1dmZCTVptNEFhMWZjUy9udTM4?=
 =?utf-8?B?WDRrVzcwVXRja0oyMHN4eVJRY2RDbHFPdGlKSU52dFdCSVV5T3hFZzA5Wjcv?=
 =?utf-8?B?Q1VPYk9QZFpVcFdzWWFPdHltUlNNNWNyN0E0Yk10Zlc0dzM4MzJndlc2T2tN?=
 =?utf-8?B?L1BhSW9MK2hpQW11MEY3SnRXcUwrWG5nWEpiZjNBMkRiRmZKRTVyc0pBWWJo?=
 =?utf-8?B?anNxanZFaWxmbzRSaFNiUEVxOGZJNG1vT3p6V1hXbHpyOGtVZzlxUjZaNkJW?=
 =?utf-8?B?SkRZRVRGODR1TG5zUE50Um1xWEQ3Zm01Zmw5aFVsQ05kQTBhVG9oUTRJYVJS?=
 =?utf-8?B?M004MFEvWG0vU210N21OT0lwRCtRSGhyUFNTcStIc3RGc09BQkptRU9BZ1Bv?=
 =?utf-8?B?YkJlcS9zMm93WHd4Z3FON0FkQkFqSE9taDhobnBVSGtDbW5QNFBZaHRRZE5T?=
 =?utf-8?B?Y0dBdVovWWExYXY1WEZkbHpVZjR6TTd0ZU56elNSNHF1c1A4SmE4SUhPRktU?=
 =?utf-8?B?akRIRkhVczVGaEFVT2JTbVd1T0d5UHg3L0FERUU0dXBEbk5mVVAvNStMN213?=
 =?utf-8?B?UUhON0EyQkhBc0wyZ2xiTnRFcmtHVVBkNjMxaEE0eHNXM1J5Q2laVnQwZ05O?=
 =?utf-8?B?YkJEd3lGZUtmejQwOUdhQTM2KzUxMlY1aXhwdVMveHBnakVuTmwyTWo0OE9T?=
 =?utf-8?B?S3FiQ05xQ3lGbEtHTWttT0w5VTl5Vk1QcFpKRFowbEh4WnJwZjdLYnVFWnhh?=
 =?utf-8?B?TmkrRDNGc2VtaFo3SjRkQXNQYzR6QzQ2bjdKSE9Zc2pmb2hoRkdEYzgvaUdB?=
 =?utf-8?B?VFcwWXV2azExcDRSMytHYVFvekdMM0J0ck82aitxZFo2U1pldXloeDJaZUNG?=
 =?utf-8?B?S0hwdjJ6a09uMDdyY0NUeUFVYk45RmZYV0Uzb1pPWXZnK2pYaHhyYUNmSXpy?=
 =?utf-8?Q?0+l8oLjQCMfrby4aOg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9E2D8FB359ED7E4CB610E350A884BA07@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a152ed6-86aa-4d7a-ce79-08d974d17dd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2021 03:08:55.7598
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YsCXBTR5kVJ3pLAPMl2pCzS5fHyy8jScJC/K5zTAQhiuVoIAn0oWsSoe/VFVIuZU+p6YHHLh5O4dpm2qJzwUkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4727
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

V2VzbGV5IENoZW5nIHdyb3RlOg0KPiANCj4gDQo+IE9uIDkvOS8yMDIxIDY6MTUgUE0sIFRoaW5o
IE5ndXllbiB3cm90ZToNCj4+IEphY2sgUGhhbSB3cm90ZToNCj4+PiBTb21lIGZ1bmN0aW9ucyBt
YXkgZHluYW1pY2FsbHkgZW5hYmxlIGFuZCBkaXNhYmxlIHRoZWlyIGVuZHBvaW50cw0KPj4+IHJl
Z3VsYXJseSB0aHJvdWdob3V0IHRoZWlyIG9wZXJhdGlvbiwgcGFydGljdWxhcmx5IHdoZW4gU2V0
IEludGVyZmFjZQ0KPj4+IGlzIGVtcGxveWVkIHRvIHN3aXRjaCBiZXR3ZWVuIEFsdGVybmF0ZSBT
ZXR0aW5ncy4gIEZvciBpbnN0YW5jZSB0aGUNCj4+PiBVQUMyIGZ1bmN0aW9uIGhhcyBpdHMgcmVz
cGVjdGl2ZSBlbmRwb2ludHMgZm9yIHBsYXliYWNrICYgY2FwdHVyZQ0KPj4+IGFzc29jaWF0ZWQg
d2l0aCBBbHRTZXR0aW5nIDEsIGluIHdoaWNoIGNhc2UgdGhvc2UgZW5kcG9pbnRzIHdvdWxkIG5v
dA0KPj4+IGdldCBlbmFibGVkIHVudGlsIHRoZSBob3N0IGFjdGl2YXRlcyB0aGUgQWx0U2V0dGlu
Zy4gIEFuZCB0aGV5DQo+Pj4gY29udmVyc2VseSBiZWNvbWUgZGlzYWJsZWQgd2hlbiB0aGUgaW50
ZXJmYWNlcycgQWx0U2V0dGluZyAwIGlzDQo+Pj4gY2hvc2VuLg0KPj4+DQo+Pj4gV2l0aCB0aGUg
RFdDMyBGSUZPIHJlc2l6aW5nIGFsZ29yaXRobSByZWNlbnRseSBhZGRlZCwgZXZlcnkNCj4+PiB1
c2JfZXBfZW5hYmxlKCkgY2FsbCByZXN1bHRzIGluIGEgY2FsbCB0byByZXNpemUgdGhhdCBFUCdz
IFRYRklGTywNCj4+PiBidXQgaWYgdGhlIHNhbWUgZW5kcG9pbnQgaXMgZW5hYmxlZCBhZ2FpbiBh
bmQgYWdhaW4sIHRoaXMgaW5jb3JyZWN0bHkNCj4+PiBsZWFkcyB0byBGSUZPIFJBTSBhbGxvY2F0
aW9uIGV4aGF1c3Rpb24gYXMgdGhlIG1lY2hhbmlzbSBkaWQgbm90DQo+Pj4gYWNjb3VudCBmb3Ig
dGhlIHBvc3NpYmlsaXR5IHRoYXQgZW5kcG9pbnRzIGNhbiBiZSByZS1lbmFibGVkIG1hbnkNCj4+
PiB0aW1lcy4NCj4+Pg0KPj4+IEV4YW1wbGUgbG9nIHNwbGF0Og0KPj4+DQo+Pj4gCWR3YzMgYTYw
MDAwMC5kd2MzOiBGaWZvc2l6ZSgzNzE3KSA+IFJBTSBzaXplKDM0NjIpIGVwM2luIGRlcHRoOjIx
Nzk3MzEyNw0KPj4+IAljb25maWdmcy1nYWRnZXQgZ2FkZ2V0OiB1X2F1ZGlvX3N0YXJ0X2NhcHR1
cmU6NTIxIEVycm9yIQ0KPj4+IAlkd2MzIGE2MDAwMDAuZHdjMzogcmVxdWVzdCAwMDAwMDAwMDBi
ZTEzZTE4IHdhcyBub3QgcXVldWVkIHRvIGVwM2luDQo+Pj4NCj4+PiBUaGlzIGlzIGVhc2lseSBm
aXhlZCBieSBiYWlsaW5nIG91dCBvZiBkd2MzX2dhZGdldF9yZXNpemVfdHhfZmlmb3MoKQ0KPj4+
IGlmIGFuIGVuZHBvaW50IGlzIGFscmVhZHkgcmVzaXplZCwgYXZvaWRpbmcgdGhlIGNhbGN1bGF0
aW9uIGVycm9yDQo+Pj4gcmVzdWx0aW5nIGZyb20gYWNjdW11bGF0aW5nIHRoZSBFUCdzIEZJRk8g
ZGVwdGggcmVwZWF0ZWRseS4NCj4+Pg0KPj4+IEZpeGVzOiA5ZjYwN2EzMDlmYmU5ICgidXNiOiBk
d2MzOiBSZXNpemUgVFggRklGT3MgdG8gbWVldCBFUCBidXJzdGluZyByZXF1aXJlbWVudHMiKQ0K
Pj4+IFNpZ25lZC1vZmYtYnk6IEphY2sgUGhhbSA8amFja3BAY29kZWF1cm9yYS5vcmc+DQo+Pj4g
LS0tDQo+Pj4gIGRyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgfCA0ICsrKysNCj4+PiAgMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dXNiL2R3YzMvZ2FkZ2V0LmMgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+Pj4gaW5kZXgg
ODA0YjUwNTQ4MTYzLi5jNjQ3Yzc2ZDczNjEgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy91c2Iv
ZHdjMy9nYWRnZXQuYw0KPj4+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4+PiBA
QCAtNzQ3LDYgKzc0NywxMCBAQCBzdGF0aWMgaW50IGR3YzNfZ2FkZ2V0X3Jlc2l6ZV90eF9maWZv
cyhzdHJ1Y3QgZHdjM19lcCAqZGVwKQ0KPj4+ICAJaWYgKCF1c2JfZW5kcG9pbnRfZGlyX2luKGRl
cC0+ZW5kcG9pbnQuZGVzYykgfHwgZGVwLT5udW1iZXIgPD0gMSkNCj4+PiAgCQlyZXR1cm4gMDsN
Cj4+PiAgDQo+Pj4gKwkvKiBiYWlsIGlmIGFscmVhZHkgcmVzaXplZCAqLw0KPj4+ICsJaWYgKGR3
YzNfcmVhZGwoZHdjLT5yZWdzLCBEV0MzX0dUWEZJRk9TSVooZGVwLT5udW1iZXIgPj4gMSkpKQ0K
Pj4+ICsJCXJldHVybiAwOw0KPj4+ICsNCj4+PiAgCXJhbTFfZGVwdGggPSBEV0MzX1JBTTFfREVQ
VEgoZHdjLT5od3BhcmFtcy5od3BhcmFtczcpOw0KPj4+ICANCj4+PiAgCWlmICgoZGVwLT5lbmRw
b2ludC5tYXhidXJzdCA+IDEgJiYNCj4+Pg0KPiANCj4gSGkgVGhpbmgsDQo+IA0KPj4NCj4+IFRo
aXMgc2VlbXMgbGlrZSBhIHdvcmthcm91bmQgbW9yZSB0aGFuIGEgZml4LiBBcyBwcmV2aW91c2x5
IHBvaW50ZWQgb3V0LA0KPj4gdGhlcmUgd2lsbCBiZSBwcm9ibGVtcyB3aGVuIHRoZXJlIGFyZSBt
dWx0aXBsZSBhbHRlcm5hdGUgc2V0dGluZw0KPj4gaW50ZXJmYWNlIFsyXS4gSWYgd2UncmUgZG9p
bmcgdGhpcyB3YXksIGFyZSB3ZSBwcm9wZXJseSBhbGxvY2F0aW5nIHRoZQ0KPj4gZmlmbyBzaXpl
IGZvciB0aGUgYWx0ZXJuYXRlIHNldHRpbmcgdGhhdCByZXF1aXJlcyB0aGUgbW9zdCBmaWZvIHNp
emUgYW5kDQo+PiBub3QganVzdCB0aGUgZmlyc3QgYWx0LXNldHRpbmcgMD8gQWxzbyBkaWZmZXJl
bnQgYWx0LXNldHRpbmcgY2FuIGhhdmUNCj4gDQo+IEVhY2ggYWx0IGludGVyZmFjZSB3aWxsIGNh
bGwgdXNiX2VwX2F1dG9jb25maWcoKSB3aGljaCBzaG91bGQgYmUNCj4gYXNzaWduZWQgZGlmZmVy
ZW50IGVuZHBvaW50IG51bWJlcnMuICBUaGlzIHdvdWxkIG1lYW4gdGhhdCBpZiBhbHQgaW50ZiMw
DQo+IGdldHMgc2VsZWN0ZWQsIGFuZCBFUCBpcyBlbmFibGVkLCB0aGVuIHdlIHdpbGwgcmVzaXpl
IHRoZSBUWEZJRk8gYW5kIG1hcA0KPiB0aGF0IEZJRk8gdG8gdGhlIHBoeXNpY2FsIEVQLiAgVGhl
biB3aGVuL2lmIHRoZSBob3N0IHJlcXVlc3RzIHRoZSBvdGhlcg0KPiBhbHQgaW50ZiMxLCBhbmQg
dGhhdCBjYWxscyBFUCBlbmFibGUsIHRoZW4gdGhlIGxvZ2ljIHdpbGwgdGhlbiBhdHRlbXB0DQo+
IHRvIHJlc2l6ZSBiYXNlZCBvbiB0aGUgcGFyYW1ldGVycywgYW5kIGFnYWluIG1hcCB0aGF0IEZJ
Rk8gdG8gdGhlDQo+IHBoeXNpY2FsIEVQLiAoc2luY2Ugd2UgY2FsbCBhdXRvY29uZmlnIG9uIGFs
bCBpbnRlcmZhY2VzLCB0aGV5IHNob3VsZCBiZQ0KPiBhc3NpZ25lZCBkaWZmZXJlbnQgZW5kcG9p
bnRzKQ0KDQpUaGF0J3Mgbm90IHRydWUuIERpZmZlcmVudCBhbHQtc2V0dGluZ3Mgb2YgYW4gaW50
ZXJmYWNlIGNhbiBzaGFyZQ0KZW5kcG9pbnQgbnVtYmVycy4gVGhpcyBpcyBvZnRlbiB0aGUgY2Fz
ZSBmb3IgVUFTUCBkcml2ZXIgd2hlcmUNCmFsdC1zZXR0aW5nIDAgaXMgZm9yIEJPVCBwcm90b2Nv
bCBhbmQgYWx0LXNldHRpbmcgMSBpcyBVQVNQLiBXaGVuIHdlDQpzd2l0Y2ggYWx0LXNldHRpbmcs
IHdlIGRpc2FibGUgdGhlIGN1cnJlbnQgZW5kcG9pbnRzIGFuZCBlbmFibGUgdGhlDQpvbGQvbmV3
IG9uZXMuDQoNCj4gDQo+IEkgYWdyZWUgdGhhdCB0aGVyZSBpcyBjdXJyZW50bHkgYSBsaW1pdGF0
aW9uIGJlY2F1c2Ugd2UgYXJlIGdvaW5nIHRvDQo+IHJlc2VydmUgYXQgbWluaW11bSAxIEZJRk8g
Zm9yIEJPVEggYWx0IGludGVyZmFjZXMsIGV2ZW4gdGhvdWdoIHRoZXJlIGlzDQo+IG9ubHkgMSBp
bnRlcmZhY2UgYWN0aXZlIGF0IGEgdGltZS4gIFRoZSBtaXNzaW5nIGxvZ2ljIHRoYXQgd2UgbWln
aHQgYmUNCj4gbWlzc2luZyBpcyBzZWVpbmcgaG93IHdlIGNhbiByZS1wdXJwb3NlIHRoZSBGSUZP
IHRoYXQgaXMgYmVpbmcgZGlzYWJsZWQuDQo+ICBIb3dldmVyLCBJIHRoaW5rIEphY2sncyBmaXgg
aGVyZSB3b3VsZCBiZSBhcHBsaWNhYmxlIHRvIHRoZSBpbXByb3ZlbWVudA0KPiBpbiBsb2dpYyB0
byByZS11c2UvcmUtYXNzaWduIEZJRk8gc3BhY2UgYWxsb2NhdGVkIGJ5IGRpc2FibGVkIEVQcyBh
bHNvLg0KPiANCg0KSW1wcm92ZW1lbnQgaXMgYWx3YXlzIGdyZWF0LiBJIGp1c3QgaG9wZSB3ZSBk
b24ndCBqdXN0IHN0b3Agd2hlcmUgd2UgYXJlDQpub3cuIFNpbmNlIHlvdSdyZSB3b3JraW5nIG9u
IHRoaXMgZmVhdHVyZSBhdCB0aGUgbW9tZW50LCBpdCB3b3VsZCBiZQ0KZ29vZCB0byBhbHNvIHJl
c29sdmUgc29tZSBvZiB0aGUgb3V0c3RhbmRpbmcgaXNzdWVzIGFzIEphY2sncyBmaXggc2VlbXMN
CnRvIGJlIGluY29tcGxldGUuDQoNCj4+IGRpZmZlcmVudCBlbmRwb2ludHMsIHRoZSBsb2dpYyBo
YW5kbGluZyB0aGlzIG1heSBub3QgYmUgc2ltcGxlLg0KPj4NCj4+IFRoZXJlIGFyZSBhIGZldyBy
ZXZpZXcgY29tbWVudHMgZm9yIFdlc2xleS4gSG9wZWZ1bGx5IHRoZXkgZ2V0IHJlc29sdmVkDQo+
PiBldmVudHVhbGx5Lg0KPiANCj4gQXMgbWVudGlvbmVkIGFib3ZlLCB0aGVyZSBpcyBhIGxvdCBv
ZiBjb25zaWRlcmF0aW9ucyB3ZSBuZWVkIHRvIG1ha2UNCj4gd2hlbiBsb29raW5nIGF0IHRoZSBh
bW91bnQgb2YgY29tYmluYXRpb25zIHRoYXQgY2FuIGJlIGRvbmUgZm9yIGEgVVNCDQo+IGNvbmZp
Z3VyYXRpb24uICBXZSBvYnZpb3VzbHkgd2FudCB0byBzZWUgaWYgd2UgY2FuIGZpbmQgYSB3YXkg
dG8NCj4gcmUtYWxsb2NhdGUgRklGTyBzcGFjZSwgYnV0IGl0IGdldHMgY29tcGxpY2F0ZWQgaWYg
d2UgcnVuIGludG8gYQ0KPiAiZnJhZ21lbnRlZCIgc2l0dWF0aW9uIHdoZXJlIHRoZSBSQU0gYXNz
b2NpYXRlZCB0byB0aGUgRVAgYmVpbmcNCj4gcmUtYWxsb2NhdGVkIGlzIGluIGJldHdlZW4gMiB0
aGF0IGFyZSBhY3RpdmUuDQo+IA0KDQpJJ2QgbGlrZSB0byBoYXZlIHRoaXMgZmVhdHVyZSBhZGRl
ZCwgYW5kIGl0IHdvdWxkIGJlIGdyZWF0IGlmIGl0IGNhbg0Kb3ZlcmNvbWUgc29tZSBvZiB0aGUg
Y3VycmVudCBsaW1pdGF0aW9ucy4gQXQgdGhlIG1vbWVudCwgaWYgdGhpcyBmZWF0dXJlDQppcyBl
bmFibGVkLCBpdCBtYXkgaW1wcm92ZSBzb21lIGFwcGxpY2F0aW9ucywgYnV0IGl0IG1heSBhbHNv
IGNhdXNlDQpyZWdyZXNzaW9uIGZvciBzb21lLiBBcyBJIG5vdGVkLCB0aGUgZml4IG1heSBub3Qg
YmUgc2ltcGxlLCBidXQgSSBob3BlDQp0aGlzIGZlYXR1cmUgY2FuIHdvcmsgZm9yIHZhcmlvdXMg
YXBwbGljYXRpb25zIGFuZCBub3QganVzdCBhIGxpbWl0ZWQgZmV3Lg0KDQpUaGFua3MsDQpUaGlu
aA0K
