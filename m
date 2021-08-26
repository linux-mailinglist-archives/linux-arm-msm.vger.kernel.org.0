Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DFC83F7FB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 03:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234655AbhHZBTY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Aug 2021 21:19:24 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:56596 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235699AbhHZBTS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Aug 2021 21:19:18 -0400
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B4290C360C;
        Thu, 26 Aug 2021 01:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1629940710; bh=XpbsVhDJ2V0+MIT8B8vXUIZoVjfPT+OTAHERmQEtydg=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=H96nCOPTqOnsHAEgD+z+rRkJSpGPgbkbfRD/b+EVwapvG4z7HBHbCIVe9NnwmJZkw
         2kuGvcja+3lOqKbkfVNhxPAv2K9DfFx3qMzKWM1e7sECiGrvetzjCOAoezvdK1jWlG
         QopCmTosUZu//I+SScxj9KBiB+4t5Pch2fhWXecSZCNmY+6Yqis/TUuIvM3QwS0Ui6
         ffZtufptihmrQXNh5TjlZe7Q8oxctmX1S+ZPqbf+YJrgEn5ncQ8AEG3rn0pfzGlvok
         OO8rB2NI9mgjqTEoeHvFFSt99Lz7IW8TWEru16XmiLecX+mdPTBeoBTc7x2H/QE0lV
         w5FVi1sCK8mNA==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id E097DA008A;
        Thu, 26 Aug 2021 01:18:27 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6E9DB800BD;
        Thu, 26 Aug 2021 01:18:25 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="Yam9oC02";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWMDm843ivQP7Bm85S/gVTdgGgEKulA6tQGzsZis8S9r5KizPe8NlyS8Fc7CwyCdHgF7PHyTqWHxbgJj1R3WAIEtSLqUOLdMKUvvOX6VMvqbFfeAX7YUqhYv9FXJoTkqE7406PJj1VHGYNJsSnD2AOTMcmSjH9+HwHt6Hn0mh5WaX58yORGrUEOOrI4cSdlZO/Qaq8VKjmZJyOizgCoaxXSoRxKbeujs5r6vly98582QJMPlw1dijlFJ7aZVTgn3RE4uN37inDJZ/kftjSWctZ6baP73EBTQeiEVn4+ErKPw/EdW0t9i1VWpIKC2HsHJsWG1VsAg3330l3GkCocltw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XpbsVhDJ2V0+MIT8B8vXUIZoVjfPT+OTAHERmQEtydg=;
 b=X7mZHKFiOVicx9CTYqV9aefw6BevEGJwDTW3p61ts4UVvqCXSrdeR+N4hIFP8XHsKBzxAOWlxVgtKSOL/dlEkcIZxZMPXxgViqXwAMIzuDMH9CbWnmT3cnWKE6FXybDV9IeuoAPFZAT5AiesmhyAeRAYNozbfTUYLvIyq+Qrvin6UNEclKClc1GDNFscTTvkrn4Z4TUGpyqxAYyH3fLniajkp/KSc2Lq98JjgQsQsPIaq+qFRWMmy55guhd6lDiMZm57CmsdwwGZwmaVZu3E4vwzE+1ZTvyUr1dt2JvV9xpDIkqeyjx0b8xIWMPIfpsjcf1GcGWVe6wMIGbf85grNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XpbsVhDJ2V0+MIT8B8vXUIZoVjfPT+OTAHERmQEtydg=;
 b=Yam9oC02y2qnZEUHcT8xdtw9AauxvzzcMnRuLgXCAnD01K68RriTlgQDUIvVgS8Z8syOu9cJMHVjkp/2QDQfWYiZNWe+P23fbzXXG37F/wagwT/vcYZsQCEfCIY4lBmacazNbvVYjneVOmNyznpcyoiyqjrp8S09hnzJTUtQDdg=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB3013.namprd12.prod.outlook.com (2603:10b6:a03:a9::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Thu, 26 Aug
 2021 01:18:21 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::508a:1772:de73:d89e]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::508a:1772:de73:d89e%4]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 01:18:21 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Ferry Toth <fntoth@gmail.com>,
        Pavel Hofman <pavel.hofman@ivitera.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "agross@kernel.org" <agross@kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "frowand.list@gmail.com" <frowand.list@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "jackp@codeaurora.org" <jackp@codeaurora.org>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>
Subject: Re: [PATCH v10 0/6] Re-introduce TX FIFO resize for larger EP
 bursting
Thread-Topic: [PATCH v10 0/6] Re-introduce TX FIFO resize for larger EP
 bursting
Thread-Index: AQHXY19XAZwi78yISkmpAHKEyem9Z6sYsRqAgAANNYCAAApZfoACgUQAgAUa4ICALydQAIAAzcQAgABJ21yAAjMkAIAAmKmAgAB83gCAAAkpgIAALyYAgADa2ICAIGneAIAAjDEAgAKqKYCAAWINgIAA1WGAgADOsQCAAA8PAIAEoCeAgAFDLoCAAAX7gIAAA9iAgAB5oQCAAHJZAIAAgVGAgAJaXgA=
Date:   Thu, 26 Aug 2021 01:18:20 +0000
Message-ID: <ff6d7385-a6d7-8920-dbe6-9018432392fa@synopsys.com>
References: <1623923899-16759-1-git-send-email-wcheng@codeaurora.org>
 <9dc6cd83-17b9-7075-0934-6b9d41b6875d@gmail.com> <87a6mbudvc.fsf@kernel.org>
 <6e8bb4ad-fe68-ad36-7416-2b8e10b6ae96@gmail.com> <877dhev68a.fsf@kernel.org>
 <cca69e90-b0ef-00b8-75d3-3bf959a93b45@gmail.com> <874kchvcq0.fsf@kernel.org>
 <e59f1201-2aa2-9075-1f94-a6ae7a046dc1@gmail.com> <8735raj766.fsf@kernel.org>
 <b3417c2c-613b-8ef6-2e2d-6e2cf9a5d5fd@gmail.com>
 <b3e820f0-9c94-7cba-a248-3b2ec5378ab0@gmail.com>
 <d298df65-417b-f318-9374-b463a15d8308@ivitera.com>
 <a7d7f0dd-dfbb-5eef-d1da-8cbdab5fc4a7@gmail.com>
 <c4e29ac0-1df1-3c64-1218-3687f07e7f77@ivitera.com>
 <1fb52c92-9319-c035-722f-695ab34723dd@gmail.com>
 <702c72cd-40e4-e641-797a-764e7e611afb@ivitera.com>
 <CAHp75VeZBLgf8YhEjdOV1Hva_dJh_=VHRGyVb=r44yh-9n+F4A@mail.gmail.com>
 <d1fb0ad5-e304-8864-a2e4-42d5f652a6a7@ivitera.com>
 <7ad8b755-1fa0-3be4-3f2e-a4d95858e450@synopsys.com>
 <c84135c3-c730-208b-dde8-916c7bde1d73@ivitera.com>
 <7ffab777-0f77-f949-f70f-7bf34c504381@gmail.com>
In-Reply-To: <7ffab777-0f77-f949-f70f-7bf34c504381@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cbb54c4a-5cca-47dd-5074-08d9682f64aa
x-ms-traffictypediagnostic: BYAPR12MB3013:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB30131171A78704BBD69E5AFAAAC79@BYAPR12MB3013.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BFRP/tSjeKiWWcRvKFvXUvTEZi3AxdOFHiWrj5MfXXBtLpYeGlKQiIk35sr+661EkGwR4PKF8P4rdwNVebHRYBjuAB8VHvsltaLwUIEnCYoNbyrp3IsFZO060gumsA/4CMOHdpv6wh0k9YgSYjymkNq1c6TtCXHsHIrahsAxHq2M34+gY3RVJzI9mMNntX8g9jNKOFPPzD+CBII5hhCOZDIaR5fGh1lF3VPR9ny+jY0qckax7YXmcw/No9FzERZvTBl4PhLoWXcy/71G8tR/5GvHXsx+S1kOOkJ9frNA3k7OpWiIF0UvRdxcSXVXY79qTm8cAJr5kBNn15pAGwZpFXjvL98L6tBwkzDPwfxyo+Yf2S9YrbYwazkDy47pzPAbO8ofppynywFdVjZjxWJE/9zG33HCqILtnb+r0XPZq025cLytO2b8qdTUSQX0/vfqAiT6mWI5i5jYxM92+4KgB9JvnscJQ3QMbI/UhuDrmGV3e/E2wgpf3NTPsbc9QOLx9GTMk4Oik2nJ6Dq0Sti0gEJF7ektZVERCfkxpNqMEnBMrA9Ikch0BFoMnECdMlO0mpkKC02sLQdP4hDCEuBqGglDft1DVtpCkfY/DlJDUMdm8clDyEmHehYkb4i2UoBc2sodU5jJaBUrN0KX65BkX9L0P8ZO35LVGEgaAxwD17X9AI9YprctSasY2nZNwpYKw1L6NqAI7mMT4AuYTm1cPF0DIwbftXC1dUf0njoYddnFLCZc2nGkQnfQi8Y85nU0nbgFI/MJXpY5NfHhA8WwcKTSTYKErCLb2wrcM+TO0/ZKxEidgoJiYXjypK2cGk7Fkg+3CFsYnQfE0dYb4G7KCQPVnUCvmCwmi9iJ6v9TwuS7AlnN3uyLkgVQhnKwmMCKDPqJsAKRk65tGZt+wgJYnQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(346002)(376002)(366004)(396003)(38070700005)(8936002)(66556008)(64756008)(66446008)(316002)(31696002)(122000001)(66476007)(86362001)(8676002)(6512007)(5660300002)(38100700002)(83380400001)(66946007)(76116006)(36756003)(966005)(2906002)(31686004)(26005)(186003)(4326008)(478600001)(54906003)(7416002)(110136005)(53546011)(6506007)(2616005)(6486002)(71200400001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UnNxTlBpTXFSdXE0YlE2bmU1SWJ4SkkxbWJSbFdpaXRLaG92RU50TE10Wm5F?=
 =?utf-8?B?SzlMRGlvZUVXWFhTeGpYb3Q3QTZVTmtVa0g3MUhJc2J0Vmt2VG8wdTd1RjZI?=
 =?utf-8?B?MFJ5OVQ4dWx3cWtPcHlQTVVNdmNmNCtLd2g1eG9TbWwzbWRuUzZYQU54Mm02?=
 =?utf-8?B?ek41R3BlVjFpakJ3RkV0aGhUTVVHU3dQcDFOci96SVRNQmcra2dyQlpRckhS?=
 =?utf-8?B?OEluSHcvUWttdUVINnFmc2JwR0dEVVJTdWdYYkMvMzk4Vy9yMlMrN0k1QUF1?=
 =?utf-8?B?RUc5N2hHeHdNQWFUdEhlZWpNYXcwUXRMdENWU2JvSE5zcHE5bE1NVHlhTC8x?=
 =?utf-8?B?NjJsY08rOWdqUDV4WTczTmFDWWFOa3RxUm1sL2F4MngwdDhSWUp6UkRCaytB?=
 =?utf-8?B?ZHJJZktlUk0zT3pKNUtQRmtXMWpwaCt2VFlVODFBbDFZb0pGKy92eEFLUEwy?=
 =?utf-8?B?M3Awa29DZVE0ekxvY1prN1JTcmc0elpBK0V6dVRpMk5lWjhwT2x4YTJQR1RZ?=
 =?utf-8?B?eXFkSnhRNHcybkhHUXZ3YUVWbHppUWE1dlUzVzdqUkUybG9KSkNyNzNPMTc2?=
 =?utf-8?B?b0JmMWxMaHA5c3ZCbXhIRDluZHp1TUZZTWY2QXI0OFdBU3Zjclh5LzdwZ3Rm?=
 =?utf-8?B?M1ErM2wwNlpBc1JZdUNHQkk2MzZvWWpKNlllbDRqWkNHbzNVMTF6QVprUDVJ?=
 =?utf-8?B?TnlUazk4YU1rWGNTc28reWlvem5VUVhrbzBVa2V4V2w5cC9Fd3NqellYU3FQ?=
 =?utf-8?B?Y1VkNzlzVUlCUHFyQzU0SnlkbzE1L0lrMHRFQ2gvMjJndFVPcFYyb3g0R2x6?=
 =?utf-8?B?ZU0rbXRpdWNmREltNk1jUFYyNkJwZ01ueFRQUUI1RDZuTDZwZFQwemZjeFNu?=
 =?utf-8?B?MUZrQm13Sm43VEdxOGFBQWYxMnVqbDNOL0xLNWk0aGlFdkUzbHhMbHY4ZjA2?=
 =?utf-8?B?U1NsYlYzSVNmcENWTGNLbmhJUnFjOGE4emZyN0JPN0lKeUl6UDJ4R1JaRnkv?=
 =?utf-8?B?YzZ0b1ZJekxQdjRSV0N2UHZlY1pRN2J6WXYzdVphSThMMGYvQSswWmZIVjV1?=
 =?utf-8?B?TmRCZXRRS0tXTUlaQ3hvSFFOQStOekk0Rjdtd09tTVZFbjlvUkM5QmYzSUhn?=
 =?utf-8?B?RUNpSmc4cEUrNy81SWI0ZlI2YS8waVlHY25pa3ZhZ0NOZ0pSRlJpS2I2RXN2?=
 =?utf-8?B?eDFYb0E4MUxkalZ1K0RtRVdDSVVrTkNqekZHSy8wZS82aWNBQnpXdmRWQVBJ?=
 =?utf-8?B?elBFK0o3bW1vYTZuSTNtWis4cGtQOE82VHNnclJvUGQyUGtXc3QvRGNWQm1F?=
 =?utf-8?B?YVR2MWk0SS9UNDZhcHBMZ1k2ZHNNcVVxbmlESWV3cGFsSHBKQS9qSkI5eHlm?=
 =?utf-8?B?UXViNzVDSlZwODErODVPL29ZOXovcVlxb2VLVFJiZ1BYQmZYWC9ySjBuQnpn?=
 =?utf-8?B?aFZpMWFPZEg4MlhQTUVZQXVRZEZoYmFMT0IxMFU5aXpNdk55SzBCckZJT2VS?=
 =?utf-8?B?YW1jUCtwbG9iWkdsOHdRRnYvM2VMbFRQaXA0NDVwRXhzUlUvQUJWcFJ3dHVw?=
 =?utf-8?B?MVJaWTM3Z3FmTFQwcWxpN3JxSm9UbExkSVcxWWx3cTZ4bXQwUjZyQ2xZVW9l?=
 =?utf-8?B?MlNLdTcybmNuN2lick5qOTNyU2dSNDZUclNsb3c5UElUVUVnNno2TTRoY2Rk?=
 =?utf-8?B?SkdKQnB2aU5NTjk1cG1NSUFmWjVxL0dpenZubVljMHFqS2V4aWJHeG1NelNF?=
 =?utf-8?Q?UF+EpQ+BFczfytvjWM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <32B7F324450F464CBB6377C7CD267D12@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbb54c4a-5cca-47dd-5074-08d9682f64aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2021 01:18:20.9921
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A6kUEJghRhXj8rA2xCSZXXrW6sfAgi8DrRc19hz40Lvx5QMAvt7mv0DrCRRWfHLFVARwjqQIQBjapY0VYkAN/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3013
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

RmVycnkgVG90aCB3cm90ZToNCj4gSGkNCj4gDQo+IE9wIDI0LTA4LTIwMjEgb20gMDc6Mzkgc2No
cmVlZiBQYXZlbCBIb2ZtYW46DQo+Pg0KPj4NCj4+IERuZSAyNC4gMDguIDIxIHYgMDo1MCBUaGlu
aCBOZ3V5ZW4gbmFwc2FsKGEpOg0KPj4+IFBhdmVsIEhvZm1hbiB3cm90ZToNCj4+Pj4NCj4+Pj4N
Cj4+Pj4gRG5lIDIzLiAwOC4gMjEgdiAxNzoyMSBBbmR5IFNoZXZjaGVua28gbmFwc2FsKGEpOg0K
Pj4+Pj4gT24gTW9uLCBBdWcgMjMsIDIwMjEgYXQgNTo1OSBQTSBQYXZlbCBIb2ZtYW4NCj4+Pj4+
IDxwYXZlbC5ob2ZtYW5AaXZpdGVyYS5jb20+IHdyb3RlOg0KPj4+Pj4+IERuZSAyMi4gMDguIDIx
IHYgMjE6NDMgRmVycnkgVG90aCBuYXBzYWwoYSk6DQo+Pj4+Pj4+IE9wIDE5LTA4LTIwMjEgb20g
MjM6MDQgc2NocmVlZiBQYXZlbCBIb2ZtYW46DQo+Pj4+Pj4+PiBEbmUgMTkuIDA4LiAyMSB2IDIy
OjEwIEZlcnJ5IFRvdGggbmFwc2FsKGEpOg0KPj4+Pj4+Pj4+IE9wIDE5LTA4LTIwMjEgb20gMDk6
NTEgc2NocmVlZiBQYXZlbCBIb2ZtYW46DQo+Pj4+Pj4+Pj4+IERuZSAxOC4gMDguIDIxIHYgMjE6
MDcgRmVycnkgVG90aCBuYXBzYWwoYSk6DQo+Pj4+Pj4+Pj4+PiBPcCAxOC0wOC0yMDIxIG9tIDAw
OjAwIHNjaHJlZWYgRmVycnkgVG90aDoNCj4+Pj4+DQo+Pj4+PiAuLi4NCj4+Pj4+DQo+Pj4+Pj4+
Pj4+PiBTbywgd2hlcmUgZG8gd2UgZ28gZnJvbSBoZXJlPw0KPj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+
PiBJIGtub3cgdGhlIHBhdGNoZXMgaGF2ZSBiZWVuIHRlc3RlZCBvbiBkd2MyIChieSBtZSBhbmQN
Cj4+Pj4+Pj4+Pj4gb3RoZXJzKS7CoCBJDQo+Pj4+Pj4+Pj4+IGRvIG5vdCBrbm93IGlmIFJ1c2xh
biBvciBKZXJvbWUgdGVzdGVkIHRoZW0gb24gZHdjMyBidXQgcHJvYmFibHkNCj4+Pj4+Pj4+Pj4g
bm90LiBSdXNsYW4gaGFzIHRhbGtlZCBhYm91dCBSUGkgKG15IGNhc2UgdG9vKSBhbmQNCj4+Pj4+
Pj4+Pj4gQmVhZ2xlYm9uZUJsYWNrLA0KPj4+Pj4+Pj4+PiBib3RoIHdpdGggZHdjMi4gUGVyaGFw
cyB0aGUgZHdjMiBiZWhhdmVzIGEgYml0IGRpZmZlcmVudGx5IHRoYW4NCj4+Pj4+Pj4+Pj4gZHdj
Mz8NCj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4gVGhlIHBhdGNoZXMgYWRkIGEgbmV3IEVQLUlOIGZv
ciBhc3luYyBmZWVkYmFjay4gSSBhbSBzb3JyeSBJIGhhdmUNCj4+Pj4+Pj4+Pj4gbm90IGZvbGxv
d2VkIHlvdXIgbG9uZyB0aHJlYWQgKGl0IHN0YXJ0ZWQgYXMgdW5yZWxhdGVkIHRvDQo+Pj4+Pj4+
Pj4+IHVhYykuIERvZXMNCj4+Pj4+Pj4+Pj4gdGhlIHByb2JsZW0gYXBwZWFyIHdpdGggZl91YWMx
IG9yIGZfdWFjMj8gUGxlYXNlIGhvdyBoYXZlIHlvdQ0KPj4+Pj4+Pj4+PiByZWFjaGVkIHRoZSBh
Ym92ZSBwcm9ibGVtPw0KPj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4gSSdtIHNvcnJ5IHRvby4gSSBmaXJz
dCBiZWxpZXZlZCB0aGUgaXNzdWUgd2FzIHJlbGF0ZWQgdG8gdGhlIHBhdGNoDQo+Pj4+Pj4+Pj4g
bWVudGlvbmVkIGluIHRoZSBzdWJqZWN0IGxpbmUuDQo+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+PiBUaGUg
cHJvYmxlbSBhcHBhZXJzIHdpdGggZl91YWMyLiBJIGJvc3QgRWRpc29uX0FyZHVpbm8gYm9hcmQg
aW4NCj4+Pj4+Pj4+PiBob3N0DQo+Pj4+Pj4+Pj4gbW9kZSAodGhlcmUgaXMgYSBzd2l0Y2ggYWxs
b3dpbmcgdG8gc2VsZWN0IGhvc3QvZGV2aWNlIG1vZGUpLiBXaGVuDQo+Pj4+Pj4+Pj4gZmxpcHBp
bmcgdGhlIHN3aXRjaCB0byBkZXZpY2UgbW9kZSB1ZGV2IHJ1biBhIHNjcmlwdDoNCj4+Pj4+Pj4+
PiBCdXQgYXMgSSBhbSB1c2luZyBjb25maWdmcyAoZXhjZXJwdCBmb2xsb3dzKSBhbmQganVzdCBk
aXNhYmxpbmcNCj4+Pj4+Pj4+PiB0aGUNCj4+Pj4+Pj4+PiBsYXN0IDIgbGluZSByZXNvbHZlcyB0
aGUgaXNzdWUsIEknbSBndWVzc2luZyB1YWMyIGlzIHRoZSBpc3N1ZS4gT3INCj4+Pj4+Pj4+PiBl
eGNlZWRpbmcgdGhlIGF2YWlsYWJsZSByZXNvdXJjZXMuDQo+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+PiAj
IENyZWF0ZSBkaXJlY3Rvcnkgc3RydWN0dXJlDQo+Pj4+Pj4+Pj4gbWtkaXIgIiR7R0FER0VUX0JB
U0VfRElSfSINCj4+Pj4+Pj4+PiBjZCAiJHtHQURHRVRfQkFTRV9ESVJ9Ig0KPj4+Pj4+Pj4+IG1r
ZGlyIC1wIGNvbmZpZ3MvYy4xL3N0cmluZ3MvMHg0MDkNCj4+Pj4+Pj4+PiBta2RpciAtcCBzdHJp
bmdzLzB4NDA5DQo+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+PiAjIFNlcmlhbCBkZXZpY2UNCj4+Pj4+Pj4+
PiBta2RpciBmdW5jdGlvbnMvZ3Nlci51c2IwDQo+Pj4+Pj4+Pj4gbG4gLXMgZnVuY3Rpb25zL2dz
ZXIudXNiMCBjb25maWdzL2MuMS8NCj4+Pj4+Pj4+PiAjIyMNCj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+
ICMgRXRoZXJuZXQgZGV2aWNlDQo+Pj4+Pj4+Pj4gbWtkaXIgZnVuY3Rpb25zL2VlbS51c2IwDQo+
Pj4+Pj4+Pj4gZWNobyAiJHtERVZfRVRIX0FERFJ9IiA+IGZ1bmN0aW9ucy9lZW0udXNiMC9kZXZf
YWRkcg0KPj4+Pj4+Pj4+IGVjaG8gIiR7SE9TVF9FVEhfQUREUn0iID4gZnVuY3Rpb25zL2VlbS51
c2IwL2hvc3RfYWRkcg0KPj4+Pj4+Pj4+IGxuIC1zIGZ1bmN0aW9ucy9lZW0udXNiMCBjb25maWdz
L2MuMS8NCj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+ICMgTWFzcyBTdG9yYWdlIGRldmljZQ0KPj4+Pj4+
Pj4+IG1rZGlyIGZ1bmN0aW9ucy9tYXNzX3N0b3JhZ2UudXNiMA0KPj4+Pj4+Pj4+IGVjaG8gMSA+
IGZ1bmN0aW9ucy9tYXNzX3N0b3JhZ2UudXNiMC9zdGFsbA0KPj4+Pj4+Pj4+IGVjaG8gMCA+IGZ1
bmN0aW9ucy9tYXNzX3N0b3JhZ2UudXNiMC9sdW4uMC9jZHJvbQ0KPj4+Pj4+Pj4+IGVjaG8gMCA+
IGZ1bmN0aW9ucy9tYXNzX3N0b3JhZ2UudXNiMC9sdW4uMC9ybw0KPj4+Pj4+Pj4+IGVjaG8gMCA+
IGZ1bmN0aW9ucy9tYXNzX3N0b3JhZ2UudXNiMC9sdW4uMC9ub2Z1YQ0KPj4+Pj4+Pj4+IGVjaG8g
IiR7VVNCRElTS30iID4gZnVuY3Rpb25zL21hc3Nfc3RvcmFnZS51c2IwL2x1bi4wL2ZpbGUNCj4+
Pj4+Pj4+PiBsbiAtcyBmdW5jdGlvbnMvbWFzc19zdG9yYWdlLnVzYjAgY29uZmlncy9jLjEvDQo+
Pj4+Pj4+Pj4NCj4+Pj4+Pj4+PiAjIFVBQzIgZGV2aWNlDQo+Pj4+Pj4+Pj4gbWtkaXIgZnVuY3Rp
b25zL3VhYzIudXNiMA0KPj4+Pj4+Pj4+IGxuIC1zIGZ1bmN0aW9ucy91YWMyLnVzYjAgY29uZmln
cy9jLjENCj4+Pj4+Pj4+PiAuLi4uDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gQXMgeW91IHNheSwgY291
bGQgcGVyaGFwcyB0aGUgcmVhc29uIGJlIHRoYXQgdGhlIGV4dHJhIEVQLUlODQo+Pj4+Pj4+PiBh
ZGRlZCBpbg0KPj4+Pj4+Pj4gdGhvc2UgcGF0Y2hlcyAocHJldmlvdXNseSAxLCBub3cgMiB3aXRo
IHRoZSBkZWZhdWx0IGNvbmZpZyB5b3UgdXNlKQ0KPj4+Pj4+Pj4gZXhjZWVkcyB5b3VyIEVQLUlO
IG1heCBjb3VudCBvciBhdmFpbGFibGUgZmlmb3Mgc29tZWhvdz/CoCBZb3UNCj4+Pj4+Pj4+IGhh
dmUgYQ0KPj4+Pj4+Pj4gbnVtYmVyIG9mIGZ1bmN0aW9ucyBpbml0aWFsaXplZC4gSWYgeW91IGNo
YW5nZSB0aGUgbG9hZCBvcmRlciBvZg0KPj4+Pj4+Pj4gdGhlDQo+Pj4+Pj4+PiBmdW5jdGlvbnMs
IGRvIHlvdSBnZXQgdGhlIGVycm9yIGxhdGVyIHdpdGggYSBkaWZmZXJlbnQgZnVuY3Rpb24/DQo+
Pj4+Pj4+PiBKdXN0DQo+Pj4+Pj4+PiBndWVzc2luZy4uLg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IFlv
dSBzaG91bGQgYmUgYWJsZSB0byBzd2l0Y2ggdGhlIGRlZmF1bHQgYXN5bmMgRVAtT1VUICh3aGlj
aA0KPj4+Pj4+Pj4gY29uZmlndXJlcyB0aGUgbmV3IGZlZWRiYWNrIEVQLUlOICkgdG8gYWRhcHRp
dmUgRVAtT1VUICh3aGljaA0KPj4+Pj4+Pj4gcmVxdWlyZXMNCj4+Pj4+Pj4+IG5vIGZlZWRiYWNr
IEVQKSB3aXRoIGNfc3luYz04IHBhcmFtZXRlciBvZiBmX3VhYzIuDQo+Pj4+Pj4+Pg0KPj4+Pj4+
Pj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29t
L2xpbnV4L3Y1LjE0LXJjNi9zb3VyY2UvZHJpdmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL2ZfdWFj
Mi5jKkw0N19fO0l3ISFBNEYyUjlHX3BnIUxCeVNyTV96Z01HVjB4LXpaN25TcnM1NHlKdzFHbG5w
VVZVVnhkUUU4UGVzelNNWjZPa0ZYOGxTb2lnd1JiV1F6TGNVJA0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+
DQo+Pj4+Pj4+PiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9lbGl4aXIuYm9v
dGxpbi5jb20vbGludXgvdjUuMTQtcmM2L3NvdXJjZS9kcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rp
b24vZl91YWMyLmMqTDgzMF9fO0l3ISFBNEYyUjlHX3BnIUxCeVNyTV96Z01HVjB4LXpaN25TcnM1
NHlKdzFHbG5wVVZVVnhkUUU4UGVzelNNWjZPa0ZYOGxTb2lnd1JmUDVUZFpDJA0KPj4+Pj4+Pj4N
Cj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9l
bGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMTQtcmM2L3NvdXJjZS9pbmNsdWRlL3VhcGkvbGlu
dXgvdXNiL2NoOS5oKkw0NTNfXztJdyEhQTRGMlI5R19wZyFMQnlTck1femdNR1YweC16WjduU3Jz
NTR5SncxR2xucFVWVVZ4ZFFFOFBlc3pTTVo2T2tGWDhsU29pZ3dSZWp6TWJXTyQNCj4+Pj4+Pj4+
DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gRG9lcyB0aGF0IGZpeCB0aGUgcHJvYmxlbT8NCj4+Pj4+Pj4N
Cj4+Pj4+Pj4gTm90IHN1cmUgaG93IHRvIGRvIHRoYXQuIERvIHlvdSBtZWFuIHRoZSBtb2R1bGUg
c2hvdWxkIGhhdmUgYQ0KPj4+Pj4+PiBwYXJhbWV0ZXINCj4+Pj4+Pj4gY2FsbGVkIGNfc3luYz8g
YG1vZGluZm9gIGxpc3Qgbm8gcGFyYW1ldGVycyBmb3IgdXNiX2ZfdWFjMi4NCj4+Pj4+Pg0KPj4+
Pj4+IFRob3NlIGFyZSBjb25maWdmcyBwYXJhbXMsIG5vdCBhdmFpbGFibGUgaW4gbW9kaW5mby4N
Cj4+Pj4+Pg0KPj4+Pj4+IEkgY2hlY2tlZCBhbmQgdGhlIHZhbHVlIGlzICJhZGFwdGl2ZSINCj4+
Pj4+PiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5j
b20vbGludXgvdjUuMTQtcmM3L3NvdXJjZS9kcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vZl91
YWMyLmMqTDEzMTJfXztJdyEhQTRGMlI5R19wZyFMQnlTck1femdNR1YweC16WjduU3JzNTR5Sncx
R2xucFVWVVZ4ZFFFOFBlc3pTTVo2T2tGWDhsU29pZ3dSVEVUY2JzTiQNCj4+Pj4+Pg0KPj4+Pj4N
Cj4+Pj4+DQo+Pj4+Pj4gSW4geW91ciBjb25maWdmcyBzY3JpcHQ6DQo+Pj4+Pg0KPj4+Pj4gS2Vy
bmVsIHNob3VsZG4ndCBjcmFzaCB3aXRoIGFueSBhdmFpbGFibGUgc2V0IG9mIGNvbmZpZ3VyYXRp
b24NCj4+Pj4+IHBhcmFtZXRlcnMsIHJpZ2h0PyBTbywgZXZlbiBpZiB0aGUgcGFyYW1ldGVyIHdv
dWxkIGZpeCB0aGUgY3Jhc2ggdGhlDQo+Pj4+PiBzZXJpZXMgaXMgYnVnZ3kgYW5kIGhhcyB0byBi
ZSByZXZlcnRlZCBpbiBteSBvcGluaW9uLg0KPj4+Pg0KPj4+PiBTdXJlLCBubyBwcm9ibGVtIHdp
dGggcmV2ZXJ0aW5nLiBJIGFtIGp1c3QgdHJ5aW5nIHRvIHN0YXJ0IHVwIHNvbWUNCj4+Pj4gdHJv
dWJsZXNob290aW5nLiBBIHJlc291cmNlIGV4aGF1c3Rpb24gd2FzIG1lbnRpb25lZCBoZXJlLCB0
aGF0J3Mgd2h5IEkNCj4+Pj4gc3VnZ2VzdGVkIGEgd2F5IHRvIHRlc3QgdGhlIHBhdGNoIHdpdGgg
dGhlIG9yaWdpbmFsIG51bWJlciBvZiBlbmRwb2ludHMNCj4+Pj4gYWxsb2NhdGVkLiBJIGRvIG5v
dCBnZXQgYW55IGNyYXNoZXMgb24gbXkgc2V0dXAgd2hpY2ggdXNlcyBmZXdlciBnYWRnZXQNCj4+
Pj4gZnVuY3Rpb25zLiBUaGF0J3Mgd2h5IEkgYXNrZWQgd2hhdCBoYXBwZW5zIGlmIHRoZSBmdW5j
dGlvbnMgbG9hZCBvcmRlcg0KPj4+PiBpcyBjaGFuZ2VkLiBJIGFtIGFmcmFpZCB0aGlzIHRocmVh
ZCBpcyBzbyBjb21wbGV4IHRoYXQgdGhlIGFjdHVhbA0KPj4+PiBwcm9ibGVtIGhhcyBiZWVuIGJ1
cnJpZWQgaW4gdGhlIGhpc3RvcnkuDQo+Pj4+DQo+Pj4NCj4+PiBBcyBJIHBvaW50ZWQgb3V0IHBy
ZXZpb3VzbHksIHRoZSBjcmFzaCBpcyBwcm9iYWJseSBiZWNhdXNlIG9mIGZfdWFjMg0KPj4+IHBy
ZW1hdHVyZWx5IGZyZWVpbmcgZmVlZGJhY2sgcmVxdWVzdCBiZWZvcmUgaXRzIGNvbXBsZXRpb24u
DQo+Pj4gdXNiX2VwX2RlcXVldWUoKSBpcyBhc3luY2hyb25vdXMuIGR3YzIoKSBtYXkgdHJlYXQg
aXQgYXMgYSBzeW5jaHJvbm91cw0KPj4+IGNhbGwgc28geW91IGRpZG4ndCBnZXQgYSBjcmFzaC4N
Cj4+DQo+PiBUaGFua3MgZm9yIHlvdXIgaGludCwgaXQgZ3JlYXRseSBoZWxwcy4NCj4+Pj4NCj4+
Pg0KPj4+IEknbSBub3Qgc3VyZSBob3cgZWFzeSBpdCBpcyBmb3IgeW91IHRvIG9idGFpbi90ZXN0
IGEgZGV2aWNlIHdpdGggZHdjMywNCj4+PiBidXQgaXQgd291bGQgYmUgZ3JlYXQgdG8gYWxzbyBo
YXZlIGl0IGFzIHBhcnQgb2YgeW91ciB0ZXN0aW5nIHN1aXRlLiA6KQ0KPj4NCj4+IENhbiB5b3Ug
cmVjb21tZW5kIGEgcmVhc29uYWJseSBwcmljZWQgZGV2aWNlIHdpdGggdmlhYmxlIGtlcm5lbA0K
Pj4gdXBkYXRlcyBmb3IgdGhlIHRlc3Rpbmc/IE9wdGlvbmFsbHkgd2l0aCBTUyB3aGljaCB5b3Ug
bWVudGlvbmVkIGxhc3QNCj4+IHRpbWU/IFRoYW5rcy4NCj4+DQo+IEVkaXNvbi1BcmR1aW5vIGtp
dCAybmQgaGFuZCB3aXRoIGRpc3BsYXkgb24gZWJheSB+JDEwMCA6LSkNCj4gDQoNCkZlcnJ5IGNh
biBjb3JyZWN0IG1lIGlmIEknbSB3cm9uZywgYnV0IEkgdGhpbmsgRWRpc29uLUFyZHVpbm8ga2l0
IG9ubHkNCnN1cHBvcnRzIHVwIHRvIGhpZ2hzcGVlZC4gUmVnYXJkbGVzcywgRWRpc29uLUFyZHVp
bm8gc2VlbXMgdG8gd29yayB3ZWxsDQp3aXRoIHRoZSBsYXRlc3QgTGludXgga2VybmVsLg0KDQpJ
IHNlZSB0aGF0IHRoZXJlIGFyZSB2YXJpb3VzIGRldmVsb3BtZW50IGtpdHMgd2l0aCByazMzOTkg
dGhhdCBzdXBwb3J0cw0KdXAgdG8gU3VwZXJTcGVlZCBhdCByZWFzb25hYmxlIHByaWNlLCBidXQg
SSB0aGluayB0aGV5IGFsbCByZXF1aXJlIHNvbWUNCmVmZm9ydCB0byBicmluZyB1cCB0byB0aGUg
bGF0ZXN0IExpbnV4IGtlcm5lbCBhbmQgaW4gZGV2aWNlIG1vZGUuDQoNCk1heWJlIEZlcnJ5L0Zl
bGlwZS9hbnlvbmUgY2FuIHByb3ZpZGUgbW9yZSByZWNvbW1lbmRhdGlvbnM/DQoNClRoYW5rcywN
ClRoaW5oDQo=
