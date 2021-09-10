Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2BEE4064FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Sep 2021 03:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235324AbhIJBQu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Sep 2021 21:16:50 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:60426 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232382AbhIJBQh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Sep 2021 21:16:37 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 306A040F2E;
        Fri, 10 Sep 2021 01:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1631236527; bh=aIBgyfBX0xFg0frNk0JhL2MdyrHeZqE/jzTaK92KlQw=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=XfssWU6uVGMFYHLrxqirQiNEtKQSARnJRN8QGqzxQZXD+RWdOyEUoDPk5LfypFObV
         UJHClKrU4r8c4U22m5Z/JEV4wVovMwRMRk6uqNx3Om9ebgNwfXM0/5kl5jvNdVDh4q
         47Tzjo8Dpxkf25G6zUaV/tIJ60YylQVj6wrxPJnMx5ksKfs7nooy4A7RQlZitcssl7
         CwaGNmpkvRGTJ/P+2egUt5WaRtEX/6XUkoGhhufl+qxDeDsvOHPRfJrvt1jctInNWG
         hP5ezTMcjCpAplMBTDhKe1xJe+g9ukUnqxBhJYnG2Nn2LmvVq/PzlkQwzFx0ANBO5w
         ZBNlCwmXaE47w==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 60157A009C;
        Fri, 10 Sep 2021 01:15:26 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 3C74B800BB;
        Fri, 10 Sep 2021 01:15:24 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="fnmhdIn7";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f7dko0rgxYgQ45dJCtX3U1hd7r4S+24GkS8NTVE3zjREpvpzEbDzE0qTc7MlCXIAAYJtc9ZKI0G9OF4yGDajxa2qmGE7Ga0ykHA9I00RkFCwXEMk5KlviCqU6/VI0caBPl092g1w1qT3JlWhDWcuuY83zB8Vwzwox0nDKJ3RCCpVDPnU16g29HgL8v0N4jCMLTFFugueesId/S+vBor9WKDha7pLEaJMIL+T1ceuBYQhDPXz2GcoWIBykY7pt6EYztKwnNrvVyTS/ASqnbErbWSTCBmU9MEBwRD1M0vzpCkKF+S178/Mjtc+B+uWru+09JDoUpdXMQ6EKlPEQa6d8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=aIBgyfBX0xFg0frNk0JhL2MdyrHeZqE/jzTaK92KlQw=;
 b=bEx2M/4Dq1IYH2FJijS8ZgheN/IGjaitgKK8JciBlFE+qrgrP1ZGpY4KseBloJbYnvjHDLagD3u8+RNBBbAjODhQA/5l0UW2lXDtDKloGfIuQhucWNrU9YPETO408OFyqVhIp6/n5cK1iW+nusaMccMjJlx0Se3RaWpGicM9nedEGRsk2EdcL4JpFdL7jHa65MIzMA89i/N8zKCHFqclSYltv3XlKAwfylgMI3h9/xNOLvBXDgjMfeLNpaeFfQTPoM/OwaBJVoIkxmWD2DyCTSHs6ojJZgI2s/aglCb5D+EAzNCjuul7NyH+TvjLswVJxYophV+PEU5L9v1PR4KkuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aIBgyfBX0xFg0frNk0JhL2MdyrHeZqE/jzTaK92KlQw=;
 b=fnmhdIn7GBPGDWHe/rCNIxXEOHdxIdAULpEnqTFGW1/a08dUEwawDTYFN0pcQ5ChY/dKWllX5EzIhYamJa0yoX4284Nc0cgyNRE4m9iFLCCwiMyaUXP0lMsHS6iL90fsK3dUnIt08HYyfgi3I6DTAhI36FqP+mmTrq4NxrPX49M=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB4051.namprd12.prod.outlook.com (2603:10b6:a03:20c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 01:15:22 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::508a:1772:de73:d89e]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::508a:1772:de73:d89e%4]) with mapi id 15.20.4500.016; Fri, 10 Sep 2021
 01:15:22 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Jack Pham <jackp@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Wesley Cheng <wcheng@codeaurora.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: gadget: Skip resizing EP's TX FIFO if already
 resized
Thread-Topic: [PATCH] usb: dwc3: gadget: Skip resizing EP's TX FIFO if already
 resized
Thread-Index: AQHXpVUbI6zrZuzuNkasP7SNAwlUbqucd/uA
Date:   Fri, 10 Sep 2021 01:15:22 +0000
Message-ID: <6a4bb7a9-2c63-5e1e-f4fc-a5bbc7aaa168@synopsys.com>
References: <20210909083120.15350-1-jackp@codeaurora.org>
In-Reply-To: <20210909083120.15350-1-jackp@codeaurora.org>
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
x-ms-office365-filtering-correlation-id: 79cc026b-2866-4d14-ae85-08d973f87642
x-ms-traffictypediagnostic: BY5PR12MB4051:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB4051D11397C02D8A44800F04AAD69@BY5PR12MB4051.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Xw3sExtb8y3reUjkq2+anJp1hn+NqlZi8Pfqj4yAFGDBWAah4FDQfn+8YVBhu+r+TtUO2j3JhlrTmb7F205BG75qF2MEnwKTT2B0GKZwlJHcBFWekhH8Fz8npXqloNK1HK1HdypZpE/vKPFagmYtllycILo/2xurlsdtWfc+IZsdasiudZX11XPVHn+pnlBncVP2I4BK3qPBiiLaFV64PvUgknK2wQJ2d8yW5JQ0M8IyyKQ28apmLhiX/FkeRJTzSFZKTlkMBRmT1ujvPjzuCUFXGnNEKH1KRcppjLagHqOhMwfJE7gF58zHi9+Cz2nS61SDoVRZiIYVQEbVKecxb7bZHEFdnOJ4R6ZvOeqdyz190mfz7iBhn5WJ11mNR6fPWnm0hLSfmx4GSZ9/vlfFiN4bIyZwMhbT5p3h1P1J/TRavPmuuqM/YKRCXelh4nEp8mJ6nZe8SYJk6wo2Vx3c2K2C9Xe3D6kdAleKPrFaKLhKFSGTn9M4dZFPp1Y/ArVWYH+g2NkbQPkO1hHGn9QaRWuwje6c+oIQcI8R442tBlmpwbZC8HRVKvRhENyvUWKDISGbLT9Sn1CUH+JytIJwpjhZrVnrZVdiW7Z4JT9BqAwBMKI9QLKG7OrHtCZuLuFoGxRCp/VXkubUOlVW5WG/piftKezZoIG4fr+2EM6DU/JTlGfro4/QPIybDoXOo49V0UYTpJ50NHUvVoy+JJtr1d586XI8+Gz/v8FwGuTcHSCLmSCzISH7TGppa7p8XLlZFnrdfJ7Y0Xwuh8ZNzGvCeccZNrIk9mxhyff8p7iQE7fmORqwQkBtVvkmPCSIk+WAUAk/0D6jLXdbZk9/5GWXrXNyD8HfRkhJcKM0QxKFWcXnQhogePMUCngd3xHPVSoLjFz9xJR4TgZj/Vp9SimnOg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(396003)(346002)(366004)(376002)(478600001)(86362001)(8676002)(122000001)(5660300002)(2616005)(38100700002)(31696002)(316002)(966005)(36756003)(54906003)(6512007)(8936002)(6486002)(71200400001)(4326008)(66556008)(110136005)(83380400001)(66446008)(64756008)(2906002)(26005)(66476007)(66946007)(76116006)(186003)(38070700005)(6506007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NVhJMTMxWHlwZnoxQ0tPTjg3a1hFSDcyZGQ1ZEpuZzFNVE5SdmVqRUJjdXNC?=
 =?utf-8?B?Y09QK1VOYzAvbVEwRkxwekYwSlJRY0NXdHFJZ2x3UHVIZEF3bnBicm5uY2Vz?=
 =?utf-8?B?ZE5vcW1SSmtqeU5wancxZU42UnBuQWl0bGd6NWFMR29XbEtDcWVZbGM4bkJs?=
 =?utf-8?B?VUtDKzNtTkU0OVFoRGQrUXVLYlRZSUNBVHdMREMvWG54MlZQN0ZIelQyWEJa?=
 =?utf-8?B?c2xJN2I1WDNOVkwxNjJFTnRIbnN4K2FWbmFtbjgxaEJqNUNYKytLMXR0cGlh?=
 =?utf-8?B?YS9rblV0L2VhYjM4a1BBcGNlYWxPSllrRGtIWmVRaXRic2d3UW9yWFBmRkVo?=
 =?utf-8?B?eHpsM3diOFVsVlljMzR6ckhzdzZJajlKR0IvZm1rOGFMd2xmWDhGQ2NIMzI2?=
 =?utf-8?B?QUQ1RHhzdkhIZTZwMTdaeDB4MWhMa3BhL1ZleEZFV01LL3h0SjhWa2xxMFpT?=
 =?utf-8?B?bVIzZnZ1QVJJZ1FiYXpVUGlKU0ZyNHJ6US9JTi8rTWl4MkJvR2ZJNFlxUGxm?=
 =?utf-8?B?YjQwRE44WkplSnk1QUcvZGxsNHdVMG5GdjA4RHRNL1doTm9tMVE1TWFUUlAw?=
 =?utf-8?B?S21yYm5FaW01TzhOekFTMm5BNXpYNjRzSHFoZnROU1FtNDJTTCtMaTBrc09j?=
 =?utf-8?B?dlFUZ3YwZkRycExmNkhraEY3NnlLZ3JsQ3ZJc3h4K0pxVDkvRjkwdkZCS005?=
 =?utf-8?B?Mm53MkJJOGRRWXZpVGFZRTQvRkVzakJ5aE9MdFJ0bjZXZ1JXRDdHZW5WRElM?=
 =?utf-8?B?bFRhTTk5b0g5WlVuK09sNGlrSllIaXgxYTkrZkpNSEs4MzRib3k3UmF1ZUVI?=
 =?utf-8?B?Slh5WWU1WElDbGZ3SzZzR0U1cVNLTzhDZlJJYmQxWGNjK0NPQmg4b0FvTGdX?=
 =?utf-8?B?eExvNXQvMTBQcGVrZHR4M0NWVFVsS1A0YjRMdllQNFJ1Smx5bHhJZWpoLzlC?=
 =?utf-8?B?Y0Fxdzg5NjBiU2RGd1hiWVppQU5NSkh3M0k0WG51RXpDaGVzWmFWR0dyeW1W?=
 =?utf-8?B?T0VWTGxjanozdDVHcElZWXZQM3libzZOWnRDQ2g3UW1pNTFaOS9Tb3RIY1A3?=
 =?utf-8?B?QTJ4ZGRKT1FXbW40Y3pPMm5FV0x6RVgwUWVNVnI0Q1loYWlHak90US9LeVQy?=
 =?utf-8?B?MnFqT214OFN6SGJXdUUvZGxDUHFJQSsrRUg5S2k0R2lPam1MZHRWT2t5N2Jk?=
 =?utf-8?B?YlNqeHNnTDdBMEliTmhnRVUrMlhlaXlodlpzcVo3T2lnYjlheGJ4czd2bENU?=
 =?utf-8?B?NXV5Yk9ZaXU3Y1NjVGcyVTVXbVB0VHBueGhwRmwrT1hYZ0U0aTFBUWwyaG8y?=
 =?utf-8?B?QytOdFFtdkZKY3JOM0xDeThjN0dwdisxZ05hQWFySm9EaERjQnlNNjVWSlJx?=
 =?utf-8?B?c1NYZXR2RWZiWVBVb0w4OUVxOG83YS9DdUxXZlQ0Um5scmdNWWl1N2JlWkQv?=
 =?utf-8?B?Rmt3bWE3Ym9uaG4rQWo0dC9zYWNZdEd6dGgzQlA1Uk1NTm1ESU5PREh5SG8w?=
 =?utf-8?B?MFkzVWdNdy96VU5lQnV0OTFZTjN3d0N2d0x0cHdPYlZ0dzNJdVdqc3UyVVMz?=
 =?utf-8?B?TGRRSEgzT2JtZW9saStXOGVIc01hbTVmemhocDlMTUtHZUdkaURJRGMvcVQr?=
 =?utf-8?B?azZMZHRtWVY0NjVBMXBuaW1XdnNnYUoxMkFIQS85Mm0rekhuU1VYMEIydTRp?=
 =?utf-8?B?RTU4U0tYSGJYZlBrTDZ6SGFWZDhFbml1NHptL3VsdEVGUExndTYvN0tHOG15?=
 =?utf-8?Q?dPdzULOmqG77w+ptkM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E87496BD4E2F71468C502868E7B50CF6@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79cc026b-2866-4d14-ae85-08d973f87642
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 01:15:22.1611
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h+/mtzJ2iQGMP2so1m1bUafq1tX09/I/i2Rx1tpE4FR74CMKDqAwIK0xe3W1AAVcmWGXSnzcJV+Fje9Rwfif9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4051
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SmFjayBQaGFtIHdyb3RlOg0KPiBTb21lIGZ1bmN0aW9ucyBtYXkgZHluYW1pY2FsbHkgZW5hYmxl
IGFuZCBkaXNhYmxlIHRoZWlyIGVuZHBvaW50cw0KPiByZWd1bGFybHkgdGhyb3VnaG91dCB0aGVp
ciBvcGVyYXRpb24sIHBhcnRpY3VsYXJseSB3aGVuIFNldCBJbnRlcmZhY2UNCj4gaXMgZW1wbG95
ZWQgdG8gc3dpdGNoIGJldHdlZW4gQWx0ZXJuYXRlIFNldHRpbmdzLiAgRm9yIGluc3RhbmNlIHRo
ZQ0KPiBVQUMyIGZ1bmN0aW9uIGhhcyBpdHMgcmVzcGVjdGl2ZSBlbmRwb2ludHMgZm9yIHBsYXli
YWNrICYgY2FwdHVyZQ0KPiBhc3NvY2lhdGVkIHdpdGggQWx0U2V0dGluZyAxLCBpbiB3aGljaCBj
YXNlIHRob3NlIGVuZHBvaW50cyB3b3VsZCBub3QNCj4gZ2V0IGVuYWJsZWQgdW50aWwgdGhlIGhv
c3QgYWN0aXZhdGVzIHRoZSBBbHRTZXR0aW5nLiAgQW5kIHRoZXkNCj4gY29udmVyc2VseSBiZWNv
bWUgZGlzYWJsZWQgd2hlbiB0aGUgaW50ZXJmYWNlcycgQWx0U2V0dGluZyAwIGlzDQo+IGNob3Nl
bi4NCj4gDQo+IFdpdGggdGhlIERXQzMgRklGTyByZXNpemluZyBhbGdvcml0aG0gcmVjZW50bHkg
YWRkZWQsIGV2ZXJ5DQo+IHVzYl9lcF9lbmFibGUoKSBjYWxsIHJlc3VsdHMgaW4gYSBjYWxsIHRv
IHJlc2l6ZSB0aGF0IEVQJ3MgVFhGSUZPLA0KPiBidXQgaWYgdGhlIHNhbWUgZW5kcG9pbnQgaXMg
ZW5hYmxlZCBhZ2FpbiBhbmQgYWdhaW4sIHRoaXMgaW5jb3JyZWN0bHkNCj4gbGVhZHMgdG8gRklG
TyBSQU0gYWxsb2NhdGlvbiBleGhhdXN0aW9uIGFzIHRoZSBtZWNoYW5pc20gZGlkIG5vdA0KPiBh
Y2NvdW50IGZvciB0aGUgcG9zc2liaWxpdHkgdGhhdCBlbmRwb2ludHMgY2FuIGJlIHJlLWVuYWJs
ZWQgbWFueQ0KPiB0aW1lcy4NCj4gDQo+IEV4YW1wbGUgbG9nIHNwbGF0Og0KPiANCj4gCWR3YzMg
YTYwMDAwMC5kd2MzOiBGaWZvc2l6ZSgzNzE3KSA+IFJBTSBzaXplKDM0NjIpIGVwM2luIGRlcHRo
OjIxNzk3MzEyNw0KPiAJY29uZmlnZnMtZ2FkZ2V0IGdhZGdldDogdV9hdWRpb19zdGFydF9jYXB0
dXJlOjUyMSBFcnJvciENCj4gCWR3YzMgYTYwMDAwMC5kd2MzOiByZXF1ZXN0IDAwMDAwMDAwMGJl
MTNlMTggd2FzIG5vdCBxdWV1ZWQgdG8gZXAzaW4NCj4gDQo+IFRoaXMgaXMgZWFzaWx5IGZpeGVk
IGJ5IGJhaWxpbmcgb3V0IG9mIGR3YzNfZ2FkZ2V0X3Jlc2l6ZV90eF9maWZvcygpDQo+IGlmIGFu
IGVuZHBvaW50IGlzIGFscmVhZHkgcmVzaXplZCwgYXZvaWRpbmcgdGhlIGNhbGN1bGF0aW9uIGVy
cm9yDQo+IHJlc3VsdGluZyBmcm9tIGFjY3VtdWxhdGluZyB0aGUgRVAncyBGSUZPIGRlcHRoIHJl
cGVhdGVkbHkuDQo+IA0KPiBGaXhlczogOWY2MDdhMzA5ZmJlOSAoInVzYjogZHdjMzogUmVzaXpl
IFRYIEZJRk9zIHRvIG1lZXQgRVAgYnVyc3RpbmcgcmVxdWlyZW1lbnRzIikNCj4gU2lnbmVkLW9m
Zi1ieTogSmFjayBQaGFtIDxqYWNrcEBjb2RlYXVyb3JhLm9yZz4NCj4gLS0tDQo+ICBkcml2ZXJz
L3VzYi9kd2MzL2dhZGdldC5jIHwgNCArKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyBiL2Ry
aXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gaW5kZXggODA0YjUwNTQ4MTYzLi5jNjQ3Yzc2ZDcz
NjEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gKysrIGIvZHJp
dmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPiBAQCAtNzQ3LDYgKzc0NywxMCBAQCBzdGF0aWMgaW50
IGR3YzNfZ2FkZ2V0X3Jlc2l6ZV90eF9maWZvcyhzdHJ1Y3QgZHdjM19lcCAqZGVwKQ0KPiAgCWlm
ICghdXNiX2VuZHBvaW50X2Rpcl9pbihkZXAtPmVuZHBvaW50LmRlc2MpIHx8IGRlcC0+bnVtYmVy
IDw9IDEpDQo+ICAJCXJldHVybiAwOw0KPiAgDQo+ICsJLyogYmFpbCBpZiBhbHJlYWR5IHJlc2l6
ZWQgKi8NCj4gKwlpZiAoZHdjM19yZWFkbChkd2MtPnJlZ3MsIERXQzNfR1RYRklGT1NJWihkZXAt
Pm51bWJlciA+PiAxKSkpDQo+ICsJCXJldHVybiAwOw0KPiArDQo+ICAJcmFtMV9kZXB0aCA9IERX
QzNfUkFNMV9ERVBUSChkd2MtPmh3cGFyYW1zLmh3cGFyYW1zNyk7DQo+ICANCj4gIAlpZiAoKGRl
cC0+ZW5kcG9pbnQubWF4YnVyc3QgPiAxICYmDQo+IA0KDQpUaGlzIHNlZW1zIGxpa2UgYSB3b3Jr
YXJvdW5kIG1vcmUgdGhhbiBhIGZpeC4gQXMgcHJldmlvdXNseSBwb2ludGVkIG91dCwNCnRoZXJl
IHdpbGwgYmUgcHJvYmxlbXMgd2hlbiB0aGVyZSBhcmUgbXVsdGlwbGUgYWx0ZXJuYXRlIHNldHRp
bmcNCmludGVyZmFjZSBbMl0uIElmIHdlJ3JlIGRvaW5nIHRoaXMgd2F5LCBhcmUgd2UgcHJvcGVy
bHkgYWxsb2NhdGluZyB0aGUNCmZpZm8gc2l6ZSBmb3IgdGhlIGFsdGVybmF0ZSBzZXR0aW5nIHRo
YXQgcmVxdWlyZXMgdGhlIG1vc3QgZmlmbyBzaXplIGFuZA0Kbm90IGp1c3QgdGhlIGZpcnN0IGFs
dC1zZXR0aW5nIDA/IEFsc28gZGlmZmVyZW50IGFsdC1zZXR0aW5nIGNhbiBoYXZlDQpkaWZmZXJl
bnQgZW5kcG9pbnRzLCB0aGUgbG9naWMgaGFuZGxpbmcgdGhpcyBtYXkgbm90IGJlIHNpbXBsZS4N
Cg0KVGhlcmUgYXJlIGEgZmV3IHJldmlldyBjb21tZW50cyBmb3IgV2VzbGV5LiBIb3BlZnVsbHkg
dGhleSBnZXQgcmVzb2x2ZWQNCmV2ZW50dWFsbHkuDQoNClsxXQ0KaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtdXNiL2I2NTQ2M2U5LTNhOGQtMWVlNS0zZTI2LTA5OTkwYWE4ZWM1M0BzeW5v
cHN5cy5jb20vDQoNClsyXQ0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtdXNiLzBmODM4
NGJjLTE4YTYtOGNhNS1jMzhiLTZiNTUyM2M2MGE2OEBzeW5vcHN5cy5jb20vDQoNClRoYW5rcywN
ClRoaW5oDQo=
