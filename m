Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAA7B3FF783
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Sep 2021 00:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347929AbhIBW74 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Sep 2021 18:59:56 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:40650 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1347813AbhIBW7z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Sep 2021 18:59:55 -0400
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 28A9F40AC3;
        Thu,  2 Sep 2021 22:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1630623537; bh=/Iu/+90qVmdJVsVLRsCApAMTrYZ3R89l/QWPWiBSM+8=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=a5GMWx3wt8Ks1LLKQM+gWKFqQ7/wiAOW4TQjcpQ6N/xaXZd/QWFiKKIldykOMfd8I
         GeJvEcZ6h7EnqQTDE9f1jSWjroNFu5k7vKVdzUnhmih8RCoCFUGJKQCzgXpax+cdUf
         7W+F8NCvmp0eTBaQ3KJA44E8eGHfa1pHD2vikEeq/L5jjMXQ8mTeynbMltm2Ru4Xxm
         9qGehVNy8jJsL/P5+Q3iT2O0NuPcBwpQBrqeiJ00TuP8Rea/gqp0hoa+eNG9HnxzFP
         JztgFd7hwVIJCPOO1g/OxR1Yp+8YzOjVaPcpE4W0V6gx4XcpCEKzXP6u4xDZxl/Cyq
         TsqNbMBWsAeLg==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id D9652A0084;
        Thu,  2 Sep 2021 22:58:53 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 761C2400CC;
        Thu,  2 Sep 2021 22:58:51 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="fJTVTW0w";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YegibBI//tg4JD75mDMCzZBvVOGleta4L9w1Fb6sqvnpA/4Rz9ZbZGc8PQIe3gfvxD55VkL7hsguSmdA8CKNOmcAEjCDmdsMChH31A0MkJ+ExYuPxhYvWVkRbLEs0UNr+5uF+8TDVyrktc7oCM7A8EAZ87sZHkKi3S0CY5rcc0LJqZ03rXWeVbwvVGneHop7ptt4ylKO4KzTv310b9cESO32XoM94Stq5bvkV7t3RQulWj5lD74CHqBf3ZX9AkhpwvoZtLWJxAsoEoKnd6rR/1xeEIJ6D7leSNoJdCKnL00X5wa0dybwGoqzaNHGC+Vlg+VJVSVzvbbKKfuXA3gbag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=/Iu/+90qVmdJVsVLRsCApAMTrYZ3R89l/QWPWiBSM+8=;
 b=FYtmQuGYfU9CC1WLvcQaIeIpeMdXyO4AxxS2BKwzPIOGR0ShLDeJ3orFet8zdbSnxDaMEMA8Mfjg109qRyaeNKjMfaJdhnTgPT1ZZ8ypK3Zga4vgNSYz9JA2A6APA8CAJyVL2lJ3M7XVRxmASivOS84P5Ay+zs8ATLVEd8Hbax6T08v7L6EMnymFuNxqymOP29kaVVhGp0S5UDU0sN2/JUsN28DrD5mN5FTrG23upsGvHDPxyXN3EEHWSCVXU3YC1qYQjCDo1aCaYQm6pWJEYhYUln25/FL22F6jl9QQrW2P5OA8pX+p62pVw2ZheshIoIf6MliGIBuEDg2Rzxc4lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Iu/+90qVmdJVsVLRsCApAMTrYZ3R89l/QWPWiBSM+8=;
 b=fJTVTW0wiVvaXy5O9/WPxapPpQrnnaM+/hpBo8z7BEiKxF6HTgRIIkevWG6+2mV4pewdZ1okZVbOQ2l2g5IVCiD2+gLHbrsYxxbMq/ijKkTtLkv5+kC24Wjl40hlIrnWcNrCNhSbBRmDhGz06hEFOhCN+K8mdXk9sCFzhwhu6Hg=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB4802.namprd12.prod.outlook.com (2603:10b6:a03:1fc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 22:58:49 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::508a:1772:de73:d89e]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::508a:1772:de73:d89e%4]) with mapi id 15.20.4478.021; Thu, 2 Sep 2021
 22:58:49 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Jack Pham <jackp@codeaurora.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ferry Toth <fntoth@gmail.com>, Felipe Balbi <balbi@kernel.org>,
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
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>
Subject: Re: [PATCH v10 0/6] Re-introduce TX FIFO resize for larger EP
 bursting
Thread-Topic: [PATCH v10 0/6] Re-introduce TX FIFO resize for larger EP
 bursting
Thread-Index: AQHXY19XAZwi78yISkmpAHKEyem9Z6sYsRqAgAANNYCAAApZfoACgUQAgAUa4ICALydQAIAAzcQAgABJ21yAAjMkAIAAmKmAgAB83gCAAAkpgIAALyYAgADa2ICAIGneAIAAjDEAgAKqKYCAAWINgIAA1WGAgADOsQCAAA8PAIAB9MEAgBKyVgCAAXlkAA==
Date:   Thu, 2 Sep 2021 22:58:48 +0000
Message-ID: <a80edf17-faf1-6ad4-7df7-a2e8d373d784@synopsys.com>
References: <cca69e90-b0ef-00b8-75d3-3bf959a93b45@gmail.com>
 <874kchvcq0.fsf@kernel.org> <e59f1201-2aa2-9075-1f94-a6ae7a046dc1@gmail.com>
 <8735raj766.fsf@kernel.org> <b3417c2c-613b-8ef6-2e2d-6e2cf9a5d5fd@gmail.com>
 <b3e820f0-9c94-7cba-a248-3b2ec5378ab0@gmail.com>
 <d298df65-417b-f318-9374-b463a15d8308@ivitera.com>
 <a7d7f0dd-dfbb-5eef-d1da-8cbdab5fc4a7@gmail.com>
 <c4e29ac0-1df1-3c64-1218-3687f07e7f77@ivitera.com>
 <60e57455-3768-ab1c-efad-b6a64e592b36@synopsys.com>
 <20210902002804.GA3500@jackp-linux.qualcomm.com>
In-Reply-To: <20210902002804.GA3500@jackp-linux.qualcomm.com>
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
x-ms-office365-filtering-correlation-id: 7b3b423a-f18a-4286-548c-08d96e6539d1
x-ms-traffictypediagnostic: BY5PR12MB4802:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB480211B2CC7C0C8A2D09A408AACE9@BY5PR12MB4802.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9dS7YfpHTPaX12yB38csSOKYtA36L/UX4heoFkjgcaRZZsvyLyT7w7VcvRp0Q73F16d1Z6cRCRjAoNJvyk93jgUgSUfJmwiggZxg9pYB4bxQl1rWOsmg6+sGFH6f0Ya96mSv0kUrQMfmIQlGoUsu82EQ7F8iTb3M92C/6Ta7hzTmW4DewxikQ89ynJZeWOF3rE4hi/jt9fBurg1ZkP4PgC7WGVt5CNFEXgA3VPBBzWru5Vddlv29PzEM1RtqS0N59Ge6wXo1DaWpR+W3ZM/iEJUMR/V2KR7Xr7zFJOuGd4B63RtULXIRSZeIHR5kmEsk0hqOV0yrbOhVFyCOeGwJV9cfw/5IJvhspNzApyck2L3nXspilHmvRUpLJJvbQNrIEZkENhzOxkmbe1oGwNpDlsxd56jE7XF3tiDxhphQJlGlPru7e3uk3rVaZCi++2xyx/jmlROu9xtEj7DGW6Csr/8/zkhRZyz/hg2YwU0D4KMpu3zxdD8+XOUoFgEY/Nyf4o77doM36b0PMzq1/HR6f5v69GPizoItgYmF9jRn8wfe6E6Xmw4NjyJc3p/YXMJNz0jOe0ePpiWKxbYrEDGU0B/v3Sjq4EMcIqFvYYNJFnb1KTBHgzzsnG1dDN6ySsTINPDWP3TG5twSmJY8w7xisDxvUl98qtp1hKyhG9vVXghbWs1d4R2pJLzQaEIPZTau1Ts6Dlgy/XSh9t99XE6HNWVufA7pGpbsnSuUmz6X4kPOfBFerP2t7puC513DqF/WSWWO8owp8rYJAi7XsxFaVw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(396003)(346002)(376002)(39860400002)(38100700002)(2906002)(6506007)(122000001)(26005)(186003)(38070700005)(478600001)(83380400001)(71200400001)(4744005)(66946007)(6512007)(110136005)(76116006)(4326008)(6486002)(8676002)(54906003)(8936002)(2616005)(7416002)(5660300002)(31686004)(86362001)(31696002)(66446008)(36756003)(66556008)(64756008)(316002)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eXQ1MHMrbHBvUUJtZm8rcjZVejRMcUYwM1l3QzVOdlRVR0lIN0xTUXhGcXY1?=
 =?utf-8?B?NWE3ZWhaQnEwbEZKSFVwS25FZkR1eDNqcjVjYXZvU0tXNkhNa21tMXR5bGJY?=
 =?utf-8?B?SWxoOGY5c0VZM25YcXJDRk1DMEtxNGs1Rkd1VC9OSlEzUTlXTkdsbmpXcGx4?=
 =?utf-8?B?cDNETzlQc1ErTVgvdVhvZHRxZlREOC9iOWp2aGJoVjdCTUNmd2UwaFFVeHJ3?=
 =?utf-8?B?NmJOVXpXUGJ3MWwwd3VZMUlUd2U0OTdwakkvY2lXU1FnMFd4a04rcGt2UXRW?=
 =?utf-8?B?V2lkM2ljaVFWU1l3ejNiR1N4TXU3ZDVacHZic1F1SXRGQ2plS2kvTU1LczAv?=
 =?utf-8?B?NFBFZ0tJUlJXL3lSUjJmNDBHVVFxNW92SHRWTGo5cUlQMFdZcFFFTnlvWEMv?=
 =?utf-8?B?a1lXOEFjdnZDMTIrL0Mzc205VEcxMGhhUTJ5OGhaM1FFenl5bzdIZzZvZ0pE?=
 =?utf-8?B?L1hpTDgvZ1pRbDBBMk1EQWdJYnB5VU43bzRiSGRFbDMyOG5WK1NMU05ZMUlp?=
 =?utf-8?B?MC9rNkY5cVNrY01pNFA4YzU2enlNSGZnMnVWaS9JRVRXeHlFb2pVQmVReS9H?=
 =?utf-8?B?MlBMT2FCTDdBYVdEU0V0WFJPYVk2bm5KYXpxRVMxdy9mWTVBR0tjMitiVThB?=
 =?utf-8?B?ZVk4VVV5RDFBcFVFSmFJcTlBN2o5V3ZYc0liSGZkOVVleGRlTGU3UnRKMWRP?=
 =?utf-8?B?YWtaVzFnMTc4ajVnSlkyenRSKzVUZHFKWVRjeVVzVVZjVWRRZENWdXczNUMx?=
 =?utf-8?B?UVRiM1lxL0E0OW9RTkxNd1lnUXJ5WENHYzBpa2ZvZFFOcmVvTWM4SGRadlVO?=
 =?utf-8?B?NXNFYTJLMDdubzRuUlJFVWxCMHFGZTByNGdoQ0pIdE9lcWhqS2tlc2VNbVV4?=
 =?utf-8?B?eXRQYmNrQlM3Y0xOd2xXZDQyYWVFem80TE8ySlVCNy9HdzhBaUJnM3BDOVFw?=
 =?utf-8?B?aGs2ak1sUmtwczNtbjg0RWVSTmJyOHc1MFo2cDBxTG04Rmk1Q29iblFrYnl4?=
 =?utf-8?B?bGJsZ2FxYzB0eC9YS1FiL0tLVGJGY29OdG1lK0JnQVQ3UEI3eUxpTmNGQUgw?=
 =?utf-8?B?N3hTZVY4dCtSYWE3M3p2Z21OS3laTHk5VUJqSTZ3QmkyblkvNk9uWDZmd2xK?=
 =?utf-8?B?SFhFQ0lCdjNhcFFSS3VJRm9pTDdZdzUwN28rNXcwUjg3VFFKT3Q3ZVo2Umgy?=
 =?utf-8?B?WFBlekhET2h2R2gwQWY3dGhmaSs0eVJsTzBleFpjN2kyaTZVM1F1Wms2SlV3?=
 =?utf-8?B?NXJBbjVYVG5XY0l5Tk14a1pSQS9JYjJNUzVuQ3Q2N09tbG9Bcmhvb3VvL0kr?=
 =?utf-8?B?TXlnTUlkdHA5QXQzekNDLzdBQnFNRGpyVm9WZ3Z4Z3BmU2NIOVVqZmVFS20r?=
 =?utf-8?B?UWZ3QzNtSitSS2g0Mi9TaGpGYS84dXB0M20yZG4wRzdVNENBU0R5Vyt1VUdh?=
 =?utf-8?B?VUdJdjRuVHZXSzFvTzRocWx1ck5PRDNUdVpPRVBjSmNGVDdNNVRNa1NBZ0JN?=
 =?utf-8?B?NkpNL2l5MDA2OTRlS296Z2dVOU4rSUNjWUtVVUhXb29rWmdOdG9HTTJEbUdo?=
 =?utf-8?B?ZUpEeWNCQVAvZThUSk5CWlNQeVVVQU8xL1gyTnJsZTI3d3cydFdXOVFwYVM2?=
 =?utf-8?B?RDJ4VDRGRngvTnIySS9nQlR2RFMwVmh3a0hEZmFBbCtwVHJubWE2akdIaFhu?=
 =?utf-8?B?VUdnN1FJZW5ZdTdoZHFCa0dEdmt5Tm91WUxVaElEa2VuVmE1SkltYzh2Y3I1?=
 =?utf-8?Q?jxbFbcf6Ff9vlRifkg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <292FD80C118ED6449BF659134E8E8716@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b3b423a-f18a-4286-548c-08d96e6539d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2021 22:58:48.9968
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FNrdJESeMBmgoy+ZtfgKCimnrHyg9JswgWIeC84x4pynDd9qxEbBn4t7i7f8mnsHpdWzcYlq/1oqRyGj+sFiBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4802
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SmFjayBQaGFtIHdyb3RlOg0KPiBIaSBUaGluaCwNCj4gDQo+IE9uIFNhdCwgQXVnIDIxLCAyMDIx
IGF0IDAyOjU3OjA3QU0gKzAwMDAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4+IEkgdG9vayBhIGxv
b2sgYXQgMjRmNzc5ZGFjOGYzICgidXNiOiBnYWRnZXQ6IGZfdWFjMi91X2F1ZGlvOiBhZGQNCj4+
IGZlZWRiYWNrIGVuZHBvaW50IHN1cHBvcnQiKSB0aGF0IEZlcnJ5IHJlcG9ydGVkIHRoZSBpc3N1
ZSBmcm9tDQo+PiBiaXNlY3Rpb24uIEkgc2VlIGF0IGxlYXN0IGEgY291cGxlIHByb2JsZW1zIGlu
IHRoZSBuZXcgVUFDMiBjaGFuZ2VzLg0KPj4NCj4+IDEpIHVzYl9lcF9kZXF1ZXVlKCkgaXMgYXN5
bmNocm9ub3VzLiBEb24ndCBmcmVlIHJlcXVlc3RzIGJlZm9yZSB0aGUNCj4+IGNvbnRyb2xsZXIg
ZHJpdmVyIGdpdmUgdGhlbSBiYWNrLg0KPj4NCj4+IDIpIERpZCB5b3UgdGVzdCB3aXRoIFN1cGVy
U3BlZWQ/IEkgZG9uJ3Qgc2VlIGNvbXBhbmlvbiBkZXNjcmlwdG9yLg0KPiANCj4gV2UgY2F1Z2h0
IHRoaXMgdG9vIHdoZW4gdGVzdGluZyBmX3VhYzIgaW4gU3VwZXJTcGVlZCBtb2RlLiAgSSBjYW4N
Cj4gcHJlcGFyZSBhIHBhdGNoLg0KPiANCg0KVGhhbmtzIGZvciB0aGUgdGVzdCBhbmQgdGhlIGZp
eC4NCg0KQlIsDQpUaGluaA0K
