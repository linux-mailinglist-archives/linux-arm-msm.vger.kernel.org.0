Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01CDA2FBA36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jan 2021 15:56:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391145AbhASOqN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jan 2021 09:46:13 -0500
Received: from mail-eopbgr20058.outbound.protection.outlook.com ([40.107.2.58]:12454
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2392017AbhASL5r (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jan 2021 06:57:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSWIleQwnhCEZ2p/PoXOyZkuXedHPu91kO19dkAz6G0=;
 b=Qdntlk3n2KEFYq3Be6YsUXJE516sYMsYvqRVQ0WkVbiQmXZp1UYhQ+MXgAnbC2bK5Lb9n0srG1UcQr+H+vYP7FD0/7HJwNnyutCrGAinMFYfbjR53uquPg9VByEwY1jXRIJPSwVS47UWgsmmG1R/Wmh98i/Cn/2UpRmfWa0RA64=
Received: from AM5P194CA0017.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::27)
 by PR3PR08MB5739.eurprd08.prod.outlook.com (2603:10a6:102:8e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Tue, 19 Jan
 2021 11:56:55 +0000
Received: from VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:8f:cafe::a3) by AM5P194CA0017.outlook.office365.com
 (2603:10a6:203:8f::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend
 Transport; Tue, 19 Jan 2021 11:56:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT021.mail.protection.outlook.com (10.152.18.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.12 via Frontend Transport; Tue, 19 Jan 2021 11:56:55 +0000
Received: ("Tessian outbound f362b81824dc:v71"); Tue, 19 Jan 2021 11:56:54 +0000
X-CR-MTA-TID: 64aa7808
Received: from a665fd549df4.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 76081B28-AADF-49A9-8096-44D2B2FFA83E.1;
        Tue, 19 Jan 2021 11:56:49 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a665fd549df4.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 19 Jan 2021 11:56:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZEBtdw5SnjrQSj/iQzKYxAZ+bf1wL8XNH4pJPbzJfrNp9GGGrXpne9EvQyWFZ/m83Ab8DUn3xhTr/t0aFyCpysukW7CUah2RBvBBEgghykqM9+d6ONAqVBvowLj6GlwTekkGdzs/puGfMa7iTr9J9hkAIWyBemi1YJPseF6/z24W9QDdthFriqVTffA7Z2MHdSFIxsFBhRA85bP01kWbkW1WuhRcYF2SRGRg3uUm+bOtNvP8hR2IqBYG2sV5UCz6bbEceo5TPAajRu4tgjTUxo10To0xLQQsxPi4duuZWRgPbRoqFi7pa9xMxKTf9NPbLUrgxIvNzZxQFFLOhU8QAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSWIleQwnhCEZ2p/PoXOyZkuXedHPu91kO19dkAz6G0=;
 b=a3sUABSVu84DDW/6XlnkSd1wI3nVw87CalTKMohIXp+KjV2vbeCVGl8DiAkVpSx8Dn25kWOEI4DqC/bADJNMlsXRMRBmxY0BcwMP+ZlDIwuGgB6Y+K2P1s8ocfTGMvgUGeqDshyl4wkCPjPvNYssnR/VJwvNXxIS69W/POJhMCXRgxmRlh6t8Q/a6gK+CVODI/QXzXhLRlxpk3swLpFXZ3sSGtzUkrROLxGot9DdiHBBlrCO84+DugSTs6BwAl63owsziD4UrP2DlZv+EzHJO9GfKvHP6eJ+tImS49WBXf+aQYkSTgIRyQxwMYf3D9xvTWx3sXaBM/w6KrwvjbomXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSWIleQwnhCEZ2p/PoXOyZkuXedHPu91kO19dkAz6G0=;
 b=Qdntlk3n2KEFYq3Be6YsUXJE516sYMsYvqRVQ0WkVbiQmXZp1UYhQ+MXgAnbC2bK5Lb9n0srG1UcQr+H+vYP7FD0/7HJwNnyutCrGAinMFYfbjR53uquPg9VByEwY1jXRIJPSwVS47UWgsmmG1R/Wmh98i/Cn/2UpRmfWa0RA64=
Received: from DB7PR08MB3355.eurprd08.prod.outlook.com (2603:10a6:5:18::18) by
 DB8PR08MB5516.eurprd08.prod.outlook.com (2603:10a6:10:f9::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11; Tue, 19 Jan 2021 11:56:45 +0000
Received: from DB7PR08MB3355.eurprd08.prod.outlook.com
 ([fe80::54aa:8448:7c5a:c39d]) by DB7PR08MB3355.eurprd08.prod.outlook.com
 ([fe80::54aa:8448:7c5a:c39d%7]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 11:56:45 +0000
From:   Al Grant <Al.Grant@arm.com>
To:     Suzuki Poulose <Suzuki.Poulose@arm.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
CC:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mike Leach <mike.leach@linaro.org>,
        "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Denis Nikitin <denik@chromium.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "leo.yan@linaro.org" <leo.yan@linaro.org>,
        "mnissler@google.com" <mnissler@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Mark Rutland <Mark.Rutland@arm.com>
Subject: RE: [PATCH] coresight: etm4x: Add config to exclude kernel mode
 tracing
Thread-Topic: [PATCH] coresight: etm4x: Add config to exclude kernel mode
 tracing
Thread-Index: AQHWovEvsWZ+JnYi7kC5fouEuMJbYqmY02mAgI/qOQCABawqAIAAlh2AgAAzA3CAABh0gIAAC+YAgAAK/1A=
Date:   Tue, 19 Jan 2021 11:56:44 +0000
Message-ID: <DB7PR08MB3355472BF00A47087E0130CA86A30@DB7PR08MB3355.eurprd08.prod.outlook.com>
References: <20201015124522.1876-1-saiprakash.ranjan@codeaurora.org>
 <20201015160257.GA1450102@xps15>
 <dd400fd7017a5d92b55880cf28378267@codeaurora.org>
 <20210118202354.GC464579@xps15>
 <32216e9fa5c9ffb9df1123792d40eafb@codeaurora.org>
 <DB7PR08MB3355E85C72492D4766F0BEFC86A30@DB7PR08MB3355.eurprd08.prod.outlook.com>
 <03b893801841f732a25072b4e62f8e0b@codeaurora.org>
 <de2487eb-ddb9-589a-8093-fae31235c884@arm.com>
In-Reply-To: <de2487eb-ddb9-589a-8093-fae31235c884@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: DC46597AA52C484E8A485E6204D0CA74.0
x-checkrecipientchecked: true
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [81.148.244.174]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ac267e80-5d4f-40be-ab8d-08d8bc715147
x-ms-traffictypediagnostic: DB8PR08MB5516:|PR3PR08MB5739:
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <PR3PR08MB5739272332A44C2B722FBE0D86A30@PR3PR08MB5739.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:538;OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: KNlrvIjHPGz1jPK/d75asmsdGrvkmSw/credFEVhatWJIWmm/jgUSUIG36nJPWDkzbJi5+i/PM8xKSD5+4US8A5gjz8WtjzWDmUvmAJFvBDdFkJuJgAoa4iG8nnfX7W7EVjsK16X8Ng0fTMv5rN4izunuTN/O70eRY5VtLqA4BFNJH3xR3Qagb8pmwmXK19wu4XhqB77gB66+Y99CZhH0gs6heA5HY/eJgMIP+PWA3+Z+iLhmmg+an+UnJobrW0FSq15clq4r/0T4NNZiA7us0J7wwptZ+4wPxYn9ngpCNAdNLZBeP3WV8gOP5UpBQ8Xwg6rxoj/Cbs2KL6mh0nVR9CFO3Kv7ZYur6y5sPyCI/0Enr/+nZyLA3ErXgB00AXdjpCUmOMXpSuFsJscTwF7se21uGYLoBTu1DmajBFLuOIDPLDdORJcrwbcVCfkfbUi
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3355.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(9686003)(66446008)(4001150100001)(76116006)(64756008)(186003)(66556008)(55016002)(66946007)(83380400001)(66476007)(26005)(8936002)(53546011)(33656002)(86362001)(6506007)(7696005)(316002)(110136005)(2906002)(4326008)(8676002)(71200400001)(52536014)(7416002)(478600001)(54906003)(5660300002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?MllPRGlKaGkrOVFteEVEaHlibUdERHJjbHN5Vjh5V3NNcjFMZXhISUV6OUti?=
 =?utf-8?B?MXBPeFlqZUVRSWJNRTdYQytGKy9JN0pBempHbkM0b3U4aXVWbmdIK0NNNERI?=
 =?utf-8?B?NUVwRHI0aTRxUDJCcit4dkV0czgzWERnYUROaEN2Mk8rdEowYXRzUjBoMzNh?=
 =?utf-8?B?aWhlMVJjelJ4TlFjNXcyUFhMd05sVmwrL29OQjVxMHpDcFNJdUhlZlBQc2ZJ?=
 =?utf-8?B?RUJuWVJTN2thYmEyNHhSbEtGTkVoQUpZdk0ySzc4S2xDK1BDSU1sU042ZDR1?=
 =?utf-8?B?TzJVN2tIdUxVY1B3T00xZUtVcUxQeldNby9FeUEvaXlFM1RJOFBIejRmdUVI?=
 =?utf-8?B?OUg4cnlIQ0tMdUhWbzNUZ1ZOK0k4QldUVVNzTStEM1pWRFBGV3kvaHN0Ukto?=
 =?utf-8?B?R2NoOEtUa2NQcDlDcCtETmdhQzVuZldtaXl2YVZBOG9hM3Q1ZUxmODA4Uml5?=
 =?utf-8?B?SlRiVEs4ZmcreS9LT1lkMjN4Q3JRZGtsVldLTjRyY2lYeUpOMlBKZWVCSmdi?=
 =?utf-8?B?TkZoVzFOZHZEVE01L05jZi94MStMVUtIWU1XbG5BVTZ3N2owcU1DdmJldFQw?=
 =?utf-8?B?Vko1MHdtL0cvM3MvYU5SaHZReFB0RWxwTlorUDlZcnJaY2dYemJHSENsTmsr?=
 =?utf-8?B?bE80MkplNmk0ZWxQTEtvcXd2SXVGOE9TR0hndlR0MkMveWxMZ0lvZEVEekNz?=
 =?utf-8?B?UFZ2eVFtN3hFTUNMeGVOQmJ6Q04zM0krdi9hdDBLc0FrN0JPY3NxYldCQW5J?=
 =?utf-8?B?NnpzYjBGMzBzVTVsNGNlMzF0Z21kRmxjL3BhcTBFYXVXUmdOQ09qSCtBcmxr?=
 =?utf-8?B?dEpQVDJDZ3BtaGRlTXZzQlBSUHZ1WkdEbkYrRmMzVXo1N3lMYlBmSmJZYlhW?=
 =?utf-8?B?MjFvZFBtWk1jLy9VZWN0SzhSTEd2U25IUG0zcmxJYk8zVDkrNFd3bHVwVDd1?=
 =?utf-8?B?a1o4UXJPK3FFZWdxd1N2M1ptWE11bWY5VWRVZHFTcEdTWWFZa0hEdlJKbEFt?=
 =?utf-8?B?Sy93YnBJZ1QremFLR0ROVGJnZjFXb0R3SmtvRG1hb1QrWFBKWURqTjhNejM2?=
 =?utf-8?B?ektUNjFROVBxM0xLK2I1NExJSXVQQm1BUnhzNmthNmxOczRDRmlHZEg2dExu?=
 =?utf-8?B?VU4xWUhCZWM1R0FLSlI0aG1nVVR6bkhDMEJlMnF6QjdsczVjWUtBcW16QTQy?=
 =?utf-8?B?YWJuaXdoWHlIcWpuZHU4czNDUFdGRlBVQnVxVDQ5NUZVVkI4Q20zNzQ4RUZW?=
 =?utf-8?B?OTVFSk1HMmlvakRHeFdQSHVwQ3BiTkprM1F2ZnEzdTNSYmhVNEFWSURXMVZj?=
 =?utf-8?Q?PzRByIYGKUijg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5516
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 13ad1983-1177-4892-9445-08d8bc714b33
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VVJ5ufgGbc7Os7wEiqDiO+Daom2hXpMBrNNnUcd8SDXD1v0Q6LWjxHZQcN0N79bpvzrSsGqLVa+8YSlx6BZ8qzusR8ozywm8NSWYjbxDY8V9kApNa+Lm9LR/5Py8lOQVLBqxT905ErkIcj0/zPutcpnUls2KEKnKL5MJzZaL/7tfoR4NknSc6DdbdZUYlGYVR2PwfaSFl6kmjkqGFTvDOmOQ00QPLYzSLzr9UmuZUI339/2mbCRB6rtzuS5smEtsyI8/YobkgupWuxChbvuxiiq3nU6zyld9tyWjK/yUVBeDkjNY2zoPfJrRFFSE508++EE4/gEPWMdy5s3wKG1OMnhl4O4R9XpN2uuVHf0iA6CA5lZXRLeBxDbpDK6OUmcys0PQ/WyTH+A3ttbwcPwli0ZYn102lrrRe4IWXRkHaTcAClMh6TbnZOt013/B9VFntgsJXJvjoJ7OZuooeVOqV+RajJiq8Hk5DhHSonPD8EE=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(136003)(396003)(46966006)(2906002)(82740400003)(8676002)(7696005)(82310400003)(70586007)(55016002)(54906003)(53546011)(4326008)(316002)(6506007)(186003)(47076005)(33656002)(26005)(110136005)(9686003)(5660300002)(356005)(70206006)(450100002)(4001150100001)(52536014)(336012)(478600001)(81166007)(8936002)(86362001)(83380400001)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 11:56:55.2053
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac267e80-5d4f-40be-ab8d-08d8bc715147
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5739
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PiBGcm9tOiBTdXp1a2kgSyBQb3Vsb3NlIDxzdXp1a2kucG91bG9zZUBhcm0uY29tPg0KPiBPbiAx
LzE5LzIxIDk6NTEgQU0sIFNhaSBQcmFrYXNoIFJhbmphbiB3cm90ZToNCj4gPiBIaSBBbCwNCj4g
Pg0KPiA+IE9uIDIwMjEtMDEtMTkgMTQ6MDYsIEFsIEdyYW50IHdyb3RlOg0KPiA+PiBIaSBTYWks
DQo+ID4+DQo+ID4+PiBGcm9tOiBzYWlwcmFrYXNoLnJhbmphbj1jb2RlYXVyb3JhLm9yZ0BtZy5j
b2RlYXVyb3JhLm9yZw0KPiA+Pj4gSGkgTWF0aGlldSwNCj4gPj4+DQo+ID4+PiBPbiAyMDIxLTAx
LTE5IDAxOjUzLCBNYXRoaWV1IFBvaXJpZXIgd3JvdGU6DQo+ID4+PiA+IE9uIEZyaSwgSmFuIDE1
LCAyMDIxIGF0IDExOjE2OjI0QU0gKzA1MzAsIFNhaSBQcmFrYXNoIFJhbmphbiB3cm90ZToNCj4g
Pj4+ID4+IEhlbGxvIE1hdGhpZXUsIFN1enVraQ0KPiA+Pj4gPj4NCj4gPj4+ID4+IE9uIDIwMjAt
MTAtMTUgMjE6MzIsIE1hdGhpZXUgUG9pcmllciB3cm90ZToNCj4gPj4+ID4+ID4gT24gVGh1LCBP
Y3QgMTUsIDIwMjAgYXQgMDY6MTU6MjJQTSArMDUzMCwgU2FpIFByYWthc2ggUmFuamFuIHdyb3Rl
Og0KPiA+Pj4gPj4gPiA+IE9uIHByb2R1Y3Rpb24gc3lzdGVtcyB3aXRoIEVUTXMgZW5hYmxlZCwg
aXQgaXMgcHJlZmVycmVkIHRvDQo+ID4+PiA+PiA+ID4gZXhjbHVkZSBrZXJuZWwgbW9kZShOUyBF
TDEpIHRyYWNpbmcgZm9yIHNlY3VyaXR5IGNvbmNlcm5zIGFuZA0KPiA+Pj4gPj4gPiA+IHN1cHBv
cnQgb25seSB1c2Vyc3BhY2UoTlMgRUwwKSB0cmFjaW5nLiBTbyBwcm92aWRlIGFuIG9wdGlvbg0K
PiA+Pj4gPj4gPiA+IHZpYSBrY29uZmlnIHRvIGV4Y2x1ZGUga2VybmVsIG1vZGUgdHJhY2luZyBp
ZiBpdCBpcyByZXF1aXJlZC4NCj4gPj4+ID4+ID4gPiBUaGlzIGNvbmZpZyBpcyBkaXNhYmxlZCBi
eSBkZWZhdWx0IGFuZCB3b3VsZCBub3QgYWZmZWN0IHRoZQ0KPiA+Pj4gPj4gPiA+IGN1cnJlbnQg
Y29uZmlndXJhdGlvbiB3aGljaCBoYXMgYm90aCBrZXJuZWwgYW5kIHVzZXJzcGFjZQ0KPiA+Pj4g
Pj4gPiA+IHRyYWNpbmcgZW5hYmxlZCBieSBkZWZhdWx0Lg0KPiA+Pj4gPj4gPiA+DQo+ID4+PiA+
PiA+DQo+ID4+PiA+PiA+IE9uZSByZXF1aXJlcyByb290IGFjY2VzcyAob3IgYmUgcGFydCBvZiBh
IHNwZWNpYWwgdHJhY2UgZ3JvdXApDQo+ID4+PiA+PiA+IHRvIGJlIGFibGUgdG8gdXNlIHRoZSBj
c19ldG0gUE1VLsKgIFdpdGggdGhpcyBraW5kIG9mIGVsZXZhdGVkDQo+ID4+PiA+PiA+IGFjY2Vz
cyByZXN0cmljdGluZyB0cmFjaW5nIGF0IEVMMSBwcm92aWRlcyBsaXR0bGUgaW4gdGVybXMgb2Yg
c2VjdXJpdHkuDQo+ID4+PiA+PiA+DQo+ID4+PiA+Pg0KPiA+Pj4gPj4gQXBhcnQgZnJvbSB0aGUg
Vk0gdXNlY2FzZSBkaXNjdXNzZWQsIEkgYW0gdG9sZCB0aGVyZSBhcmUgb3RoZXINCj4gPj4+ID4+
IHNlY3VyaXR5IGNvbmNlcm5zIGhlcmUgcmVnYXJkaW5nIG5lZWQgdG8gZXhjbHVkZSBrZXJuZWwg
bW9kZQ0KPiA+Pj4gPj4gdHJhY2luZyBldmVuIGZvciB0aGUgcHJpdmlsZWdlZCB1c2Vycy9yb290
LiBPbmUgc3VjaCBjYXNlIGJlaW5nDQo+ID4+PiA+PiB0aGUgYWJpbGl0eSB0byBhbmFseXplIGNy
eXB0b2dyYXBoaWMgY29kZSBleGVjdXRpb24gc2luY2UgRVRNcw0KPiA+Pj4gPj4gY2FuIHJlY29y
ZCBhbGwgYnJhbmNoIGluc3RydWN0aW9ucyBpbmNsdWRpbmcgdGltZXN0YW1wcyBpbiB0aGUNCj4g
Pj4+ID4+IGtlcm5lbCBhbmQgdGhlcmUgbWF5IGJlIG90aGVyIGNhc2VzIGFzIHdlbGwgd2hpY2gg
SSBtYXkgbm90IGJlDQo+ID4+PiA+PiBhd2FyZSBvZiBhbmQgaGVuY2UgaGF2ZSBhZGRlZCBEZW5p
cyBhbmQgTWF0dGlhcy4gUGxlYXNlIGxldCB1cw0KPiA+Pj4gPj4ga25vdyBpZiB5b3UgaGF2ZSBh
bnkgcXVlc3Rpb25zIGZ1cnRoZXIgcmVnYXJkaW5nIHRoaXMgbm90IGJlaW5nIGEgc2VjdXJpdHkN
Cj4gY29uY2Vybi4NCj4gPj4+ID4NCj4gPj4+ID4gRXZlbiBpZiB3ZSB3ZXJlIHRvIGFwcGx5IHRo
aXMgcGF0Y2ggdGhlcmUgYXJlIG1hbnkgd2F5cyB0bw0KPiA+Pj4gPiBjb21wcm9taXNlIGEgc3lz
dGVtIG9yIGdldCB0aGUga2VybmVsIHRvIHJldmVhbCBpbXBvcnRhbnQNCj4gPj4+ID4gaW5mb3Jt
YXRpb24gdXNpbmcgdGhlIHBlcmYgc3Vic3lzdGVtLsKgIEkgd291bGQgcGVyZmVyIHRvIHRhY2ts
ZQ0KPiA+Pj4gPiB0aGUgcHJvYmxlbSBhdCB0aGF0IGxldmVsIHJhdGhlciB0aGFuIGNvbmNlbnRy
YXRpbmcgb24gY29yZXNpZ2h0Lg0KPiA+Pj4gPg0KPiA+Pj4NCj4gPj4+IFNvcnJ5IGJ1dCBJIGRp
ZCBub3QgdW5kZXJzdGFuZCB5b3VyIHBvaW50LiBXZSBhcmUgdGFsa2luZyBhYm91dCB0aGUNCj4g
Pj4+IGNhcGFiaWxpdGllcyBvZiBjb3Jlc2lnaHQgZXRtIHRyYWNpbmcgd2hpY2ggaGFzIHRoZSBp
bnN0cnVjdGlvbiBsZXZlbCB0cmFjaW5nDQo+IGFuZCBhIGxvdCBtb3JlLg0KPiA+Pj4gUGVyZiBz
dWJzeXN0ZW0gaXMganVzdCB0aGUgZnJhbWV3b3JrIHVzZWQgZm9yIGl0Lg0KPiA+Pj4gSW4gb3Ro
ZXIgd29yZHMsIGl0cyBub3QgdGhlIHBlcmYgc3Vic3lzdGVtIHdoaWNoIGRvZXMgaW5zdHJ1Y3Rp
b24NCj4gPj4+IGxldmVsIHRyYWNpbmcsIGl0cyB0aGUgY29yZXNpZ2h0IGV0bS4gV2h5IHRoZSBw
ZXJmIHN1YnN5c3RlbSBzaG91bGQNCj4gPj4+IGJlIG1vZGlmaWVkIHRvIGxvY2tkb3duIGtlcm5l
bCBtb2RlPyBJZiB3ZSB3ZXJlIHRvIGxldCBwZXJmIGhhbmRsZQ0KPiA+Pj4gYWxsIHRoZSB0cmFj
ZSBmaWx0ZXJpbmcgZm9yIGRpZmZlcmVudCBleGNlcHRpb24gbGV2ZWxzLCB0aGVuIHdoeSBkbw0K
PiA+Pj4gd2UgbmVlZCB0aGUgcmVnaXN0ZXIgc2V0dGluZ3MgaW4gY29yZXNpZ2h0IGV0bSBkcml2
ZXIgdG8gZmlsdGVyIG91dA0KPiA+Pj4gTlMgRUwqIHRyYWNpbmc/IEFuZCBtb3JlIGltcG9ydGFu
dGx5LCBob3cgZG8geW91IHN1cHBvc2Ugd2UgaGFuZGxlIHN5c2ZzDQo+IG1vZGUgb2YgY29yZXNp
Z2h0IHRyYWNpbmcgd2l0aCBwZXJmIHN1YnN5c3RlbT8NCj4gPj4NCj4gPj4gWW91IGJvdGggaGF2
ZSBnb29kIHBvaW50cy4gTWF0aGlldSBpcyByaWdodCB0aGF0IHRoaXMgaXMgbm90IGENCj4gPj4g
Q29yZVNpZ2h0IGlzc3VlIHNwZWNpZmljYWxseSwgaXQgaXMgYSBtYXR0ZXIgb2Yga2VybmVsIHNl
Y3VyaXR5DQo+ID4+IHBvbGljeSwgYW5kIG90aGVyIGhhcmR3YXJlIHRyYWNpbmcgbWVjaGFuaXNt
cyBvdWdodCB0byBiZSB3aXRoaW4gaXRzDQo+ID4+IHNjb3BlLiBUaGVyZSBzaG91bGQgYmUgYSBn
ZW5lcmFsICJhbnRpIGtlcm5lbCBleGZpbHRyYXRpb24iIGNvbmZpZw0KPiA+PiB0aGF0IGFwcGxp
ZXMgdG8gYWxsIG1lY2hhbmlzbXMgd2l0aGluIGl0cyBzY29wZSwgYW5kIHdlJ2QgZGVmaW5pdGVs
eSBleHBlY3QNCj4gdGhhdCB0byBpbmNsdWRlIEludGVsIFBUIGFzIHdlbGwgYXMgRVRNLg0KPiA+
Pg0KPiA+DQo+ID4gSSBhZ3JlZSB3aXRoIHRoaXMgcGFydCB3aGVyZSB0aGVyZSBzaG91bGQgYmUg
YSBnZW5lcmljIGNvbmZpZyBmb3IgYWxsDQo+ID4gaGFyZHdhcmUgdHJhY2luZyBmYW1pbGllcyhh
dGxlYXN0IGZvciBJbnRlbCBQVCBhbmQgQVJNIENvcmVzaWdodCksDQo+ID4gU3V6dWtpIHN1Z2dl
c3RlZCB0aGF0IGFzIHdlbGwuIEkgYW0gdW5kZXIgdGhlIGltcHJlc3Npb24gdGhhdCBNYXRoaWV1
DQo+ID4gZGlkbid0IGxpa2UgYWRkaW5nIHN1Y2ggYSBjb25maWcgYW5kIHdhbnRlZCBwZXJmIHN1
YnN5c3RlbSB0byBoYW5kbGUNCj4gPiBpdCBzaW5jZSBpbml0aWFsIGRpc2N1c3Npb24gd2FzIGFy
b3VuZCB3aGV0aGVyIHJvb3QgY29tcHJvbWlzZSBtZWFudA0KPiA+IGV2ZXJ5dGhpbmcgaXMgbG9z
dCBhbHJlYWR5IGFuZCBzdWNoIGEga2NvbmZpZyB3b3VsZCBub3QgaGVscCwgYnV0DQo+ID4gTWF0
dGlhcyBhbHJlYWR5IGdhdmUgc29tZSBnb29kIGV4YW1wbGVzIHdoZXJlIHRoYXQgaXMgbm90IHRy
dWUuDQo+ID4NCj4gPj4gQSBrZXJuZWwgY29uZmlnIHRoYXQgZm9yY2VkIGV4Y2x1ZGVfa2VybmVs
IG9uIGFsbCBwZXJmIGV2ZW50cyB3b3VsZA0KPiA+PiBkZWFsIHdpdGggRVRNIGFuZCBQVCBpbiBv
bmUgcGxhY2UsIGJ1dCBtaXNzIHRoZSBzeXNmcyBpbnRlcmZhY2UgdG8gRVRNLg0KPiA+Pg0KPiA+
PiBPbiB0aGUgb3RoZXIgaGFuZCwgZG9pbmcgaXQgaW4gdGhlIEVUTSBkcml2ZXJzIHdvdWxkIGNv
dmVyIHRoZSBwZXJmDQo+ID4+IGFuZCBzeXNmcyBpbnRlcmZhY2VzIHRvIEVUTSwgYnV0IHdvdWxk
IG1pc3MgSW50ZWwgUFQuDQo+ID4+DQo+ID4+IFNvIEkgdGhpbmsgd2hhdCBpcyBuZWVkZWQgaXMg
YSBnZW5lcmFsIGNvbmZpZyBvcHRpb24gdGhhdCBpcyBib3RoDQo+ID4+IGltcGxlbWVudGVkIGlu
IHBlcmYgKGV4Y2x1ZGluZyBhbGwga2VybmVsIHRyYWNpbmcgZXZlbnRzKSBhbmQgYnkgYW55DQo+
ID4+IGRyaXZlcnMgdGhhdCBwcm92aWRlIGFuIGFsdGVybmF0aXZlIGludGVyZmFjZSB0byBoYXJk
d2FyZSB0cmFjaW5nIGV2ZW50cy4NCj4gPj4NCj4gPg0KPiA+IEkgYW0gZ29vZCB3aXRoIHRoaXMg
YXBwcm9hY2gsIG9uY2UgTWF0aGlldSBjb25maXJtcywgSSBjYW4gYWRkIGENCj4gPiBrZXJuZWwg
d2lkZSBrY29uZmlnIGFzIFN1enVraSBzdWdnZXN0ZWQgZWFybGllciBhbmQgbWFrZSBFVE17Myw0
fXggYXMNCj4gPiB0aGUgaW5pdGlhbCB1c2Vycy4gU29tZW9uZSBtb3JlIGZhbWlsaWFyIHdpdGgg
SW50ZWwgUFRzIGNhbiB0aGVuIG1ha2UNCj4gPiB1c2Ugb2YgdGhpcyBrY29uZmlnLg0KPiANCj4g
SW5zdGVhZCBvZiBhZGRpbmcgdGhlIHN1cHBvcnQgZm9yIGluZGl2aWR1YWwgZHJpdmVycywgeW91
IGNvdWxkIGhhbmRsZSB0aGlzIGluIHRoZQ0KPiBnZW5lcmljIHBlcmYgbGF5ZXIuIGUuZywgRmFp
bCBwZXJmX2V2ZW50IGNyZWF0ZSB3aXRoIGFuIGF0dHJpYnV0ZSB3aGljaCBhbGxvd3MNCj4ga2Vy
bmVsIHRyYWNpbmcgPw0KPiANCj4gaWYgKCFhdHRyLmV4Y2x1ZGVfa2VybmVsKQ0KPiAJcmV0dXJu
IC1FSU5WQUw7DQo+IA0KPiBPciBldmVuIGV4Y2x1ZGUgdGhlIGtlcm5lbCBzaWxlbnRseSBhbHdh
eXMuDQo+IA0KPiBUaGlzIGNvdWxkIGFsc28gYmUgbGltaXRlZCB0byBQTVVzIHdpdGggUEVSRl9Q
TVVfQ0FQX0lUUkFDRSwgaWYgeW91IHdhbnQgdG8NCj4gbGltaXQgdGhpcyB0byBQTVVzIHRoYXQg
aW5zdHJ1Y3Rpb24gbGV2ZWwgdHJhY2luZy4NCg0KVGhlIHN5c2ZzIGludGVyZmFjZSB0byBFVE0g
YWxzbyBuZWVkcyB0byBkZW55IGFjY2VzcyB0byBrZXJuZWwgdHJhY2UsIHNvIGl0J3MNCnNhZmVz
dCB0byBlbmZvcmNlIGl0IGluIHRoZSBkcml2ZXJzIGluIGFkZGl0aW9uIHRvIGFueSBlbmZvcmNl
bWVudCBkb25lIGluIHBlcmYuDQoNCkFsc28sIGZvcmNpbmcgZXhjbHVkZV9rZXJuZWwgb24gYWxs
IHBlcmYgZXZlbnRzIG1heSBiZSB0b28gc3Ryb25nLiBJbmNsdWRpbmcNCnRoZSBrZXJuZWwgaW4g
Y291bnRlZCBldmVudHMgZS5nLiBjYWNoZSBtaXNzZXMgY2FuIGhlbHAgdW5kZXJzdGFuZCB0aGUg
ZWZmZWN0DQpvZiBzeXN0ZW0gY2FsbHMgb24gcGVyZm9ybWFuY2UsIGFuZCBpc24ndCBhIGJpZyBz
aWRlIGNoYW5uZWwgY29tcGFyZWQgdG8NCnVzZXJzcGFjZSBldmVudCBjb3VudHMuIEl0IGRvZXNu
J3QgcmV2ZWFsIGRldGFpbGVkIHRpbWluZ3MgaW4gdGhlIHdheSB0cmFjZSBkb2VzLg0KDQpTbyB0
aGVyZSdzIGFuIGFyZ3VtZW50IGZvciBsb2NraW5nIG91dCBrZXJuZWwgdHJhY2Ugc3BlY2lmaWNh
bGx5IChFVE0gb3IgUFQNCm9uIHRoZSBrZXJuZWwpOyBvciBldmVuLCBmb3IgbG9ja2luZyBvdXQg
dGltZWQgdHJhY2Ugd2l0aCB0aW1lc3RhbXBzIGFuZA0KY3ljbGUgY291bnRzLCBhbmQgYWxsb3dp
bmcgdW50aW1lZCB0cmFjZS4gU28sIHRoYXQgY291bGQgYmUgZG9uZSBpbiBwZXJmLCB3aXRoDQph
IG1vcmUgc3BlY2lmaWMgdGVzdCBvbiB0aGUgdHlwZSBvZiBldmVudCwgYmVmb3JlIGl0IGZvcmNl
ZCBleGNsdWRlX2tlcm5lbC4NCg0KQWwNCg0KDQo+IA0KPiBTdXp1a2kNCg==
