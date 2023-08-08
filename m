Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43014773B67
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Aug 2023 17:50:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbjHHPuA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Aug 2023 11:50:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbjHHPsC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Aug 2023 11:48:02 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::60d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ED0244AC
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Aug 2023 08:41:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KOi3q6Myqxl9o7g43rk4Tz72fkfy8pHd8WztWqLzQ6xNmWKbrwr+9ts5NLnSDMLhuecN1gE0Tvyt5FjlmCOb0aiR50azvmSrMKTbbI4qQCr4jOCVmE06jl7VSt044Rr5pm3VGZTR0BLOdts18D3uqBmzP18A+BD/74l/U1x2Vna+qJE6NTHAYn4+eT1RKDKQ+jdrrHsSson4n1rSyjpR6ywZKD17aN1lfNGA/6pkPMkNNBODv8hA4LCwyE+1U3p+h7esZV1aiphi2LyR71+iy6YB6wamLEJoBUDFd7s/kIs3HrDQKxDLuCnNAj9lDenHo4P2gz9GZ10zuvjem1B7Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnelpG8v8QwAIkGcMwUmaDyrR5LVfThthyEFJqMoyTw=;
 b=RQ6Elqx69tJ/UpBH4dNwmKGvpOZzA0aITOQMTiSMEJcLiGco+Drku/UOPIjgRnavSi72PoAJBudWbBk+oKcQsKGmMCBT7CxzN6lAXyytErME6pNjR1UQ+oHvMol4BVwEbBpTLYPeaqlm/YrbklIoDlz9RsYolY1Qewa1AAfxrr7Yz9dF4sW9CVGKoHYqQAb19eYOZqSnci2ErmXgbsYBEg/iSXdxNdeaPZwAWal6/gLyZJR+en46nN7SFLyTpz47DwwRqMKdSACtr7/QNdnCntiE47pj71UZbxLT2hUPp3J7OJvOgQxr0k+QkrcWNFYfVbE5NqvB8089WhS5Zl7Wjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quectel.com; dmarc=pass action=none header.from=quectel.com;
 dkim=pass header.d=quectel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quectel.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnelpG8v8QwAIkGcMwUmaDyrR5LVfThthyEFJqMoyTw=;
 b=D7xp8BoLeIBSCsXnB7FhRvcx7ZAWYyU2CA7SCo5TuNHlhuxoEltkuMf1yErYwzg6/nZJ5ltNxlbH6GIuJdZi6tJKFlTkBC7RfZIjhTl6LygrwbM/a4mJWLNlxkD2atWSXB0zREJWVMzkHTxCVD0fUsFz/9CBcOXFMTFzhh08eFs=
Received: from TY0PR06MB5053.apcprd06.prod.outlook.com (2603:1096:400:1be::13)
 by SI2PR06MB5267.apcprd06.prod.outlook.com (2603:1096:4:1e6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Tue, 8 Aug
 2023 06:40:48 +0000
Received: from TY0PR06MB5053.apcprd06.prod.outlook.com
 ([fe80::c99a:8bdd:8dc0:bd76]) by TY0PR06MB5053.apcprd06.prod.outlook.com
 ([fe80::c99a:8bdd:8dc0:bd76%6]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 06:40:47 +0000
From:   =?utf-8?B?RHVrZSBYaW4o6L6b5a6J5paHKQ==?= <duke.xin@quectel.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?B?RHVrZSBYaW4o6L6b5a6J5paHKQ==?= <duke_xinanwen@163.com>
CC:     "loic.poulain@linaro.org" <loic.poulain@linaro.org>,
        "slark_xiao@163.com" <slark_xiao@163.com>,
        "fabio.porcedda@gmail.com" <fabio.porcedda@gmail.com>,
        "johan+linaro@kernel.org" <johan+linaro@kernel.org>,
        "bhelgaas@google.com" <bhelgaas@google.com>,
        "mhi@lists.linux.dev" <mhi@lists.linux.dev>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        =?utf-8?B?SmVycnkgTWVuZyjokpnmnbAp?= <jerry.meng@quectel.com>
Subject: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjJdIGJ1czogbWhpOiBob3N0OiBwY2lfZ2VuZXJp?=
 =?utf-8?Q?c:_Add_support_for_Lenovo_RM520N-GL?=
Thread-Topic: [PATCH v2] bus: mhi: host: pci_generic: Add support for Lenovo
 RM520N-GL
Thread-Index: AQHZyNwRrxgh0Fbq8UmfzcLR6An+NK/f8Y0AgAAB0TA=
Date:   Tue, 8 Aug 2023 06:40:47 +0000
Message-ID: <TY0PR06MB5053F9DD342DC9557D640305840DA@TY0PR06MB5053.apcprd06.prod.outlook.com>
References: <798f2e1bf279511ad3cfb8daa48b52198-8-23kernel.org@g.corp-email.com>
 <20230808062908.GB4990@thinkpad>
In-Reply-To: <20230808062908.GB4990@thinkpad>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quectel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR06MB5053:EE_|SI2PR06MB5267:EE_
x-ms-office365-filtering-correlation-id: b3ea5ec2-0390-41cd-7f37-08db97da6659
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: si6Y+eBUx1XFYwhaAQIJkcmK71jJ0AIi630n+hgBIAMEXCGKieKGme8uLRiM6taMw8jL/r0k0lln/hSwH1LXqeOhhoQpyGXR7hGKsfjBO3Q33e60nOzlh0q5sSXnnKZChUfy4/kBuX3wdAgIbdLR87X+SSylHMxiZMhZpCYCmzySdZ02MYajmtaQsDhDH1yAoidUdqVPTD8Yq85qMN4iX4rQtQ9c7zxOw8ed6bjhVttnozvkifAfb5NfWgWuAfVDKwdVqbRIDH9H+EUj1+0bvEm/r8yTYU7SQ3epfg8EHZOL4NhByuO7FhwsXZAMGv7mfOLQcsb6XO4O705ubTG2aegChnD8tgvzru+i29lbczGCyXxf5hGjdcajlFraIfJnbI9gZujrRxUGa31ds/WXKr3A9rks72G3biheCxUYnUb7FG+7DgCnTdgne3DrNTVJdvYBMuSa0/Kh0HjXznA5B4HF8yCu9oP/voQhRnxW1Dg4O3ZoMltVKBwRZFoGirz3vxJ6BGWEky1ddVLyR5tkv7Y7ZRk/R/DVbFRvfTZaMGZkaKc9Jvi49Jcirw6L00Hund8fZZYyC13WDbwihNGNkCuP/XtH4jQQ9flL+igPZnbObFNQob3tNzbVxRy1M33EwFidda0vvCIDRdUJau8J9Coe95UdI6gXnmllivlYT0yoaAbqUjuRGiUsJS0OLRUj
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR06MB5053.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(90021799007)(1800799003)(186006)(451199021)(90011799007)(52536014)(38070700005)(41300700001)(26005)(107886003)(2906002)(5660300002)(83380400001)(8936002)(55016003)(122000001)(86362001)(15974865002)(316002)(33656002)(7696005)(54906003)(110136005)(76116006)(478600001)(6506007)(66446008)(38100700002)(64756008)(66476007)(66556008)(71200400001)(66946007)(224303003)(9686003)(4326008)(85182001)(41533002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NmU3ZUJzQWlkQXQ3dXA0T2V4Q3B5Z1R4SFJsdVpjOGVXWjR1ZHA0QXMzUFk2?=
 =?utf-8?B?cThFQURtZGttZzluU0Z3b2VpWUtkNFFSRVNSa3BRckZURy9BQmRiU3MxdE1G?=
 =?utf-8?B?MjZGeGsrUXkyd2orYXYxZDNXWTdKU1JuN1A3dDZQakVVakJNVVZvbGpZdWlW?=
 =?utf-8?B?MTNxc1FmdU13MDliZlhoVUNlOGtNV2RLRzQrT2V3NHhTKzh1VnY2NlhQbVZv?=
 =?utf-8?B?ZjJ4dmtPZ0RUM1A0cGpIdXU5Z3N1Vyt3Rnh4SHhQajJ4RXl3MG9XSmxnNDZF?=
 =?utf-8?B?Q3dHS2lYNmRpaHZNRVJVeDlrUkNiRzR5dmFROXNWVWQycDMxK002QldaYjE5?=
 =?utf-8?B?R2NEYnQrSXNnMldkaENwYWFKM0YyTU1WaDR3RGhnb2JUZHhXanA1aXN1c2ZE?=
 =?utf-8?B?YkF6QlFuL0JZKzBSTXNtY3M2WEkrOHR6UjBXblplbndYTjVPR2xBOStxUmpH?=
 =?utf-8?B?ZEU0QW1nZGIzZjBZL1BrQitocXZIVWZYdFRKVzM5SVJqVHJ2eU5CNG5yMjBz?=
 =?utf-8?B?YnVEWHNWUEFvS2VVUzJCQlE4MDJuWFZ2M3YvQ2pxNFNBaWtRMU1idXNGK0Jj?=
 =?utf-8?B?UnlSYlNGbVNUZWUycDFCaFlxUFZ2eU1BaHkyUG9JMVFMZ2FsVHppZjE1TnlJ?=
 =?utf-8?B?YnkyRTNYME9ZN0xSZUNiT3AzWDJCRWt5QVdRdWtWektwL3RhMWwyKzZ0TnN6?=
 =?utf-8?B?VXhScmJ1L21XQS91WHlydGpaYk9BWjE5Z2tvZDJ6eitGMGljYTN4YXlxWWtt?=
 =?utf-8?B?c3plUDNhZnZza04zVVR5TmMyL2xwRktJK0xEZW5NRTRLaC9DOE5taHJJZWJl?=
 =?utf-8?B?dHFIaUZOaWxsYU93TXJvbzhxVHJLYW5aWXJZeVhreEZXVDZzTU10Lyt3VGgy?=
 =?utf-8?B?MWpWSjUzNE9LK0h4WGJiV0gvNm94d05nc3V4MHo1MEt4STArZE5QZnBOU1l6?=
 =?utf-8?B?ajVvZko2V1kyM0JQczFLUTdaVkdUMno3a0VzK2RCWTBkRjhqQ1MrdXJLRnJM?=
 =?utf-8?B?YjVSUFhsOUJvdkl2NG5ZTTNISi9oWURZWS9QTUdMOHphcHI1WEVLenM3QSs2?=
 =?utf-8?B?czRubitLTEhHMkVYZGxFNEJndGxyYUxldlBwMzhPUWM4MFhpRnB4cHhWdk43?=
 =?utf-8?B?eUZjNmcyWi9vVzhrNkR3a0c5amxrYVB3OE5JZ3prNjEwZjEvRlhKSWl6VHFy?=
 =?utf-8?B?MGNGZURiQ3VsRmRBdE93QUd5NXhzaGVuM0VjNEFrNk1VT1RmMTBqWHQ5Y1A0?=
 =?utf-8?B?SkkxcmQ2NTFWTWZGNTljbStlbHpubFNqdExOLzVwaDlkMk5ndnRmQ0RCaXVP?=
 =?utf-8?B?N1JRSU1Jb3RYNlYrOHNaeE9UMVltdG9oY3R3NHd4YVNhOXc3b2UyVThyQmtk?=
 =?utf-8?B?MFFjNW1kdkY5N1dFck9WNDByVUdXVFF2TXVDeC83MFVRSS9TSEV6a3VTUVR6?=
 =?utf-8?B?VmplMjlTaC9UU0RRQXVmU09UMUVtbHFRM2RxK3k5TVhqVDJhdSt5OEdrWXhP?=
 =?utf-8?B?RW1KZzBTTGoyZzVZMm56Q3NiYkhpaHE2Mlp3Zms3a2dHSlhIZkFCOHF2WEFQ?=
 =?utf-8?B?VnI0NEpocWpJOXNtRWNKbzVMNi9uRnRRMlEzWlhDQjZnVWk1R3VSUWJMeHZz?=
 =?utf-8?B?aFdEQkdlWWRBejh3eEljd2wrUXFDaG9HeDZSRnVqbFY1bWphbjhVT3RFOS9x?=
 =?utf-8?B?ZzBmT25YQVVZeU1yeEZIZlJSSENnaUpUVk0wQW9VeGVaMUFQMGpoK0piaU0w?=
 =?utf-8?B?bWlnSjJOUlFoRWdDdG1QVkF5M3V3eldaRjhmdGNSYUhibmtOZDZhSW94K1VW?=
 =?utf-8?B?RW4yUTE4VGh3alloL3lMUVEvbXBwVUVOR0d6SFRtVEVYYXJaN0lBaWJsWm5M?=
 =?utf-8?B?ejRrY0ZjSzQ3c2oyOUpyM2t3Rmp2TGZ2dVpxTDA4K2lCWkFmeVRIa1l6WGJK?=
 =?utf-8?B?WHA1Y21pQWdtWUM4RWxadVJLQ1h5QnIvNm1VQzNIYkt1cnduMUViQ2J5NEZr?=
 =?utf-8?B?ckdHeC9YZ3RWODVITXVuMWpxUk82c0IwSnl0ZDBVYldXUklHaUVad3FtVitu?=
 =?utf-8?B?TzZkV2U4UXcwUHRKRWNvbnhpcW9IQWVHeWZZd1ZONWlTR0pHcG9ER1BTRnpj?=
 =?utf-8?Q?NGDvWkDB2Rd+SVhgEXkwF8ZvU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quectel.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR06MB5053.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3ea5ec2-0390-41cd-7f37-08db97da6659
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 06:40:47.8281
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7730d043-e129-480c-b1ba-e5b6a9f476aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CCFMJeTSzQcfvn74r0Gz2OPndcxos+wTlslfaknz8g9tjsmS5lUztJuhrxWvUISNbdf1bJ8qfntVwbfKk1MAMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5267
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SGkgTWFuaQ0KDQpHb3QgaXQuICANCg0KVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgeW91ciBwYXRp
ZW50IHJldmlldy4gDQoNCg0K6L6b5a6J5paHICBEdWtlIFhpbiB8IFNvZnR3YXJlIERlcGFydG1l
bnQgSVggRW5naW5lZXIgfCBRdWVjdGVsIFdpcmVsZXNzIFNvbHV0aW9ucyBDby4sIEx0ZC4gDQog
ICAgICAgICAgICANCk1vYmlsZTogKzg2LTE1Mzc1NDU2MTgzIHwgRW1haWwgOiBEdWtlLnhpbkBx
dWVjdGVsLmNvbSAgfCBUZWw6ICs4Ni0wNTUxLTY1ODY5Mzg2LTg2MzINCldlYnNpdGU6IHd3dy5x
dWVjdGVsLmNvbSAgfCBRUTogNjAyNjU5MDcyIHwgV2VjaGF0OiAxNTM3NTQ1NjE4Mw0KDQpCdWls
ZGluZyAxLUMsIENoaW5hIFNwZWVjaCBWYWxsZXkgQXJlYSBBLCAzMzM1IFhpeW91IFJvYWQsIEhp
Z2gtdGVjaCBab25lLCBIZWZlaSwgQW5odWkgMjMwMDg4LCBDaGluYSAgICANCuWuieW+veecgeWQ
iOiCpeW4gumrmOaWsOWMuuS5oOWPi+i3rzMzMzXlj7fkuK3lm73vvIjlkIjogqXvvInlm73pmYXm
mbrog73or63pn7PkuqfkuJrlm61B5Yy6MeWPt+S4reivlealvCAyMzAwODgNCkhROiBCdWlsZGlu
ZyA1LCBTaGFuZ2hhaSBCdXNpbmVzcyBQYXJrIFBoYXNlIElJSSAoQXJlYSBCKSwgTm8uMTAxNiBU
aWFubGluIFJvYWQsIE1pbmhhbmcgRGlzdHJpY3QsIFNoYW5naGFpIDIwMDIzMywgQ2hpbmENCuaA
u+mDqO+8muS4iua1t+W4gumXteihjOWMuueUsOael+i3rzEwMTblj7fnp5HmioDnu7/mtLIz5pyf
77yIQuWMuu+8iTXlj7fmpbwgIDIwMDIzMw0KDQotLS0tLemCruS7tuWOn+S7ti0tLS0tDQrlj5Hk
u7bkuro6IE1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaUBrZXJuZWwub3JnPiANCuWPkemAgeaX
tumXtDogMjAyM+W5tDjmnIg45pelIDE0OjI5DQrmlLbku7bkuro6IER1a2UgWGluKOi+m+WuieaW
hykgPGR1a2VfeGluYW53ZW5AMTYzLmNvbT4NCuaKhOmAgTogbG9pYy5wb3VsYWluQGxpbmFyby5v
cmc7IHNsYXJrX3hpYW9AMTYzLmNvbTsgZmFiaW8ucG9yY2VkZGFAZ21haWwuY29tOyBqb2hhbits
aW5hcm9Aa2VybmVsLm9yZzsgYmhlbGdhYXNAZ29vZ2xlLmNvbTsgbWhpQGxpc3RzLmxpbnV4LmRl
djsgbGludXgtYXJtLW1zbUB2Z2VyLmtlcm5lbC5vcmc7IEplcnJ5IE1lbmco6JKZ5p2wKSA8amVy
cnkubWVuZ0BxdWVjdGVsLmNvbT47IER1a2UgWGluKOi+m+WuieaWhykgPGR1a2UueGluQHF1ZWN0
ZWwuY29tPg0K5Li76aKYOiBSZTogW1BBVENIIHYyXSBidXM6IG1oaTogaG9zdDogcGNpX2dlbmVy
aWM6IEFkZCBzdXBwb3J0IGZvciBMZW5vdm8gUk01MjBOLUdMDQoNCk9uIFN1biwgQXVnIDA2LCAy
MDIzIGF0IDA4OjA0OjU0UE0gLTA3MDAsIER1a2UgWGluKOi+m+WuieaWhykgd3JvdGU6DQo+IFRo
ZSBRdWVjdGVsIG5ldyBSTTUyME4tR0wgcHJvZHVjdCB3b3JrcyB3aXRoIHRoZSBRdWVjdGVsJ3Mg
ZXhpc3RpbmcgDQo+IFJNNTIwTi1HTCBtb2RlbSBzZXR0aW5ncy5CdXQgdGhpcyBvbmUgaXMgZGVz
aWduZWQgZm9yIGxlbm92byBsYXB0b3AgDQo+IHVzZWNhc2UsIGhlbmNlIFF1ZWN0ZWwgZ290IGEg
bmV3IFBJRC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IER1a2UgWGluKOi+m+WuieaWhykgPGR1a2Vf
eGluYW53ZW5AMTYzLmNvbT4NCg0KVHdlYWtlZCBjb21taXQgbWVzc2FnZSBhbmQgYXBwbGllZCB0
byBtaGktbmV4dCB3aXRoIG15IHJldmlld2VkLWJ5IHRhZy4gUGxlYXNlIGRvIG5vdCBhZGQgdGFn
cyBvbiB5b3VyIG93bi4NCg0KLSBNYW5pDQoNCj4gUmV2aWV3ZWQtYnk6IE1hbml2YW5uYW4gU2Fk
aGFzaXZhbSA8bWFuaUBrZXJuZWwub3JnPg0KPiAtLS0NCj4gQ2hhbmdlbG9nDQo+IA0KPiB2MSAt
PiB2Mg0KPiANCj4gKiBBZGp1c3RlZCBkZXNjcmlwdGlvbiBvZiBxdWVjdGVsIG1vZGVtIGFuZCBs
aW1pdCBjaGFyYWN0ZXIgbGVuZ3RoIHRvIDc1IGNoYXJhY3RlcnMuDQo+IC0tLQ0KPiAgZHJpdmVy
cy9idXMvbWhpL2hvc3QvcGNpX2dlbmVyaWMuYyB8IDMgKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9idXMvbWhpL2hvc3Qv
cGNpX2dlbmVyaWMuYyANCj4gYi9kcml2ZXJzL2J1cy9taGkvaG9zdC9wY2lfZ2VuZXJpYy5jDQo+
IGluZGV4IGZjZDgwYmM5Mjk3OC4uZTRmMmZiNjdkZmFmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2J1cy9taGkvaG9zdC9wY2lfZ2VuZXJpYy5jDQo+ICsrKyBiL2RyaXZlcnMvYnVzL21oaS9ob3N0
L3BjaV9nZW5lcmljLmMNCj4gQEAgLTYwNCw2ICs2MDQsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IHBjaV9kZXZpY2VfaWQgbWhpX3BjaV9pZF90YWJsZVtdID0gew0KPiAgCS8qIFJNNTIwTi1HTCAo
c2R4NngpLCBlU0lNICovDQo+ICAJeyBQQ0lfREVWSUNFKFBDSV9WRU5ET1JfSURfUVVFQ1RFTCwg
MHgxMDA0KSwNCj4gIAkJLmRyaXZlcl9kYXRhID0gKGtlcm5lbF91bG9uZ190KSAmbWhpX3F1ZWN0
ZWxfcm01eHhfaW5mbyB9LA0KPiArCS8qIFJNNTIwTi1HTCAoc2R4NngpLCBMZW5vdm8gdmFyaWFu
dCAqLw0KPiArCXsgUENJX0RFVklDRShQQ0lfVkVORE9SX0lEX1FVRUNURUwsIDB4MTAwNyksDQo+
ICsJCS5kcml2ZXJfZGF0YSA9IChrZXJuZWxfdWxvbmdfdCkgJm1oaV9xdWVjdGVsX3JtNXh4X2lu
Zm8gfSwNCj4gIAl7IFBDSV9ERVZJQ0UoUENJX1ZFTkRPUl9JRF9RVUVDVEVMLCAweDEwMGQpLCAv
KiBFTTE2MFItR0wgKHNkeDI0KSAqLw0KPiAgCQkuZHJpdmVyX2RhdGEgPSAoa2VybmVsX3Vsb25n
X3QpICZtaGlfcXVlY3RlbF9lbTF4eF9pbmZvIH0sDQo+ICAJeyBQQ0lfREVWSUNFKFBDSV9WRU5E
T1JfSURfUVVFQ1RFTCwgMHgyMDAxKSwgLyogRU0xMjBSLUdMIGZvciBGQ0NMIA0KPiAoc2R4MjQp
ICovDQo+IC0tDQo+IDIuMjUuMQ0KPiANCg0KLS0NCuCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCv
jSDgrprgrqTgrr7grprgrr/grrXgrq7gr40NCg==
