Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9FAC42FF20
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Oct 2021 01:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239096AbhJOXzG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Oct 2021 19:55:06 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:57678 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239015AbhJOXzF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Oct 2021 19:55:05 -0400
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D7A1F4606B;
        Fri, 15 Oct 2021 23:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1634341978; bh=gpXVzSoBKgMZB1Nuj84T+vJ4MSW1tknEYccs1e0lAJs=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=MHP0jI2NlxN2pwC4K9eaKxfez9OgrVpL9aiU7ek8umv+6oZS/3pS7CbPji3ac5AXs
         4Mu7ZwNglilxF0Q1Hy2kzMtPZB+N6ok9P9iL92xdQtMSWS+tlqUtjNvk0bCu76KtOD
         ITECYisjvNaNL7xMsMd4Q8C58LtMFHoMF9hUN7gMH+mMlqJeOSofEbClBJC3bZ/3IP
         tzGYPxtqj4PQPKOju3LhLweQlnAXxWiA/6jdw2ChN/xhK5rIaK+wWWVaYAIZneemz/
         afa+Zlz/mwUxldyCoBZa5z+2Oy9KV+Q7+yipzFyeSbNdawEHoiUqB/uBhG/zEkSLbX
         Xxsgj3BItffDg==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 51074A025A;
        Fri, 15 Oct 2021 23:52:57 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id BD3CA800E9;
        Fri, 15 Oct 2021 23:52:56 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="gPEkcK7l";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZsE9dFbaU50fhXBEVLb/F9LqlFuGx3zh+V03L2UN/X74SaYNUfzgLaB4BVAEsEnWr5tU9kPkVMQjRnvFeKtPrjoWZdaMyCw6c70WLE522a2i9q48K3G24ygJdPJLweK5VpU/k+pSk8mLMg9cBDFmCZRVjj9fFauhV95hEOsaZYDXEnCNTOyhVm77/sF2uywFRhX7mBmZwK+ZyKx4Lh4ffpjj4Fhxz/FK98H+iGrpvabjcUPLAxQ6GFJHNF8Ycfx0LH4Y0blmrXobp6eoo05jnZaxMGOUoW+tJ376Tpdj3PFRRBD0WXsCqoI3yMieY3TjFgiN6nNf7LynvwJzYE2Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gpXVzSoBKgMZB1Nuj84T+vJ4MSW1tknEYccs1e0lAJs=;
 b=ZsWL5y6D5A5IfbgrSCWP2hsd12weBhhmofh7xBEJae94jf55OhUHOt9gTHmXA3uWWnLIDSdAaswsy/ENClEqURo4KAxMA6PVVXrpQufYe86QTg/0Td29Goux2yWMs3gT6w3wPgdRhs7ikTAnesftGEQUrcb0WO1LDcFfbvzUh3rWf18BpSSajoetN8UZI50As8ACcbtJse+KTXU3mVm//AqOwtFTwZmUxxuDeZC9Gog72EyFteGnsY7NpIJyFsYnSKf+VIrg+pwWbKBUsna+mZIvvP/XuxSYoWH4l5kHVO4PS7++KGRqFyHUYXzmn1ismUZOvWKtZXBlFvIbxYHEYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gpXVzSoBKgMZB1Nuj84T+vJ4MSW1tknEYccs1e0lAJs=;
 b=gPEkcK7l5J29VqcP9miYplG6CTyp8zSx+pIT3MxPE+Jh5taLM3VbzdTQ3PDUK6jqc7VcqoEjw/0E4m3FmjbKs7PHWHAweNCrFgzAJDd+ND7pusNMUZ/iqkGSt2Xj9BXOMw+XGFj8L5msqpemmPNx9pW7c0Upg2ULvAfnETCYwiE=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB3048.namprd12.prod.outlook.com (2603:10b6:a03:ad::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Fri, 15 Oct
 2021 23:52:54 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::5865:4cfa:3e30:26d6]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::5865:4cfa:3e30:26d6%7]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 23:52:54 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Jack Pham <jackp@codeaurora.org>
CC:     Wesley Cheng <wcheng@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: gadget: Skip resizing EP's TX FIFO if already
 resized
Thread-Topic: [PATCH] usb: dwc3: gadget: Skip resizing EP's TX FIFO if already
 resized
Thread-Index: AQHXpVUbI6zrZuzuNkasP7SNAwlUbqucd/uAgAGWZYCAABurgIAEpB8AgCWYFoCACwyIgIABaFuAgAAZvIA=
Date:   Fri, 15 Oct 2021 23:52:53 +0000
Message-ID: <f3cec40b-a936-9963-43f6-2105d7fc08ec@synopsys.com>
References: <20210909083120.15350-1-jackp@codeaurora.org>
 <6a4bb7a9-2c63-5e1e-f4fc-a5bbc7aaa168@synopsys.com>
 <db0664a9-575f-1c6a-2efc-ec8372e2f1d4@codeaurora.org>
 <6538dd76-5dea-1e31-9459-657898be6d8f@synopsys.com>
 <926df659-7e31-9504-9752-a206f1eb8eaf@codeaurora.org>
 <56339fa2-e476-0f5b-9625-7016294e6be7@synopsys.com>
 <20211015005101.GA16586@jackp-linux.qualcomm.com>
 <9ecf98e9-0700-3a38-d056-5479f5188f4c@synopsys.com>
In-Reply-To: <9ecf98e9-0700-3a38-d056-5479f5188f4c@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none
 header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 360e1aa0-1223-4e36-bb97-08d99036e7c8
x-ms-traffictypediagnostic: BYAPR12MB3048:
x-microsoft-antispam-prvs: <BYAPR12MB3048A9D09DC8BFEA17CF6413AAB99@BYAPR12MB3048.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Tym+imeHKCzi8Xvx865fzKJqGa6m1c1fPM9bn8SMhI4NcOhSa6Sa03XxBiihRiAom32u+/Mn0UnJJs7AACUPukTFd2GbZGhjbQKTZe45csKqhFg4V9AQVTF1FJko+bSadUOgqH+B17AM2XCICfwWrQy8m4F2iarFu+PZa+g74kRexfI8OF4GOPfS9eqqJ6KYX/GKy3LaL8qp5Ho7nnYSsHhzimwDS9a7Ovm7jH/r5O7f0H+RV3ZMkVsROrWY+2SFUm5UQLKb0brQADaZUBou64Xk0I4HKBhKcZXle89k0IOcuDq+6QCgZp09sAO+vTEWfs5hCEmV/nJBi4jehFASeMcxqSfDTfV9UW9iAGfr0dg0Uzbz3+eRePGePyjnipjvHLiZ2lN+w8Du8ak1gmXG6zedckzn3XAyad3Cr5WtEMhG9vOrDSidt3PNgvm182CneXME2WkS299ZympqpfD0BfuPfoAvpJTir9ntrTR2uSPiVPkUoNVkVmG4eR7bB06lu4gNn+721yJ2xhElCY7Lnpyh4DpV3IpZ79YmOwX6Dy11rRRkJ7QVJDrFOaq6ln1yG64GUMAQ3me05vasGc7qcHf3SkdLFjAXGKWICVMQklR0ZaljKY49ANyZATR6mvS9M6H1kTmfiXX8L0acCa0kKh0vX0/s7STEUBM5LHMqlGyxdUHxym+vv7A/1uhMl+Mmd8ioKgqRRyfenYvSlv1v3X0xdXOfUt9k41gLd5dzpJJLkstwKoyLP1ooPPITmMCFbf0b1ZC7bAxmL6C1/DPudw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(2906002)(83380400001)(4326008)(2616005)(71200400001)(6506007)(8936002)(6916009)(5660300002)(31686004)(186003)(6486002)(54906003)(38100700002)(38070700005)(66946007)(66476007)(76116006)(66556008)(8676002)(26005)(6512007)(64756008)(36756003)(66446008)(53546011)(508600001)(122000001)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVV4R3YxRUF1Q21FUit4b2c2SEpBNWJ3dG1WaFZwZUJUK2JSMzJnV1FacWV5?=
 =?utf-8?B?N0VrdURBYTM3NHkzOEN3NFJSZ09MdFp0LysyLzRpdStEUVZDYUcyeEM4TFF6?=
 =?utf-8?B?akFiVVdoV2g4bWc1Qko3L3JyUnBRUUVYMjFTU1ptUUpnemNIVTNRdWo3MHFG?=
 =?utf-8?B?dmNyWUxrWk1CbW9TaldXQ2ZWcllYbXZNVHBEeWswUVI4L3J0cmpiWWpvZzZD?=
 =?utf-8?B?S3ZFaGFCb1ZvcC9XU1Bja0t5cWVmYTI2Rzlha09lMlNwQTRpQVhra2JHc1VB?=
 =?utf-8?B?dEtGdGJqZUJFYVFuMGNlczFZenBBay9kTVc4OFhQc0FRcVFTZVNHR3l5K2M4?=
 =?utf-8?B?bG51cjdIUHBiSXZrYXlDU2JoM0RZaXJWd1RKT01DWnRhMXRBbi93clFpZi9R?=
 =?utf-8?B?Q1JpRFl0bGJlSTRZUVQ3aTErRmhIdWExNkRuK2VVRG5haGV1UUwyNzFDV3Fi?=
 =?utf-8?B?b1ZNQm10b0dQVjdSYVQ4VEcvYTRxWHB0MWs5TWFOOVBhOXNGdEpIRE4vNWVh?=
 =?utf-8?B?ckZaY1RoU2lEM0ZoL1QxWWNseU40S3J3UnNuRExXaTI3RXhNM3NFZ3RLemV4?=
 =?utf-8?B?Qm5KTkRGZFI3aUtMU010bHNaYlhLKzdOWUREMTF5bVZDaDBIY1dXa1JQVTlo?=
 =?utf-8?B?MjluWDBsOHE4WDYxNHZDT2daUWRFSitKZDJ3QlFtR3ZvYjYwVVppdHNTTjhv?=
 =?utf-8?B?VERqZjFjcm00RkxVWi9RZE52QWVoTGJuelVUS2JLT05QS2JBZnhLZWtLL0RQ?=
 =?utf-8?B?SHVLWHdNMXRWUWpvZXFBUjRVM29kMmFxVmxkR2dXUnRoT1V0OFRvS09XQVRt?=
 =?utf-8?B?eWRMQ0wxUWZrWTRXR2F3bmdodm52aXhLM1hwQmZhc3YwbzlZMGpSeHVybWFB?=
 =?utf-8?B?QmVhcWE4QSttWlEwN045Z3VUNmVQRUYvWXN0OGdjeFFndW5qbE5RZ0FCMVQ3?=
 =?utf-8?B?eXp0T3E4ZTZTYXNCT1M2M1U1ZTgvZjlMVTV6MmhlU1FYUUgwOUxoemdaRUdF?=
 =?utf-8?B?Z21uaXJTeHpEVnQ4MEVZNTdoMnNKQXdsdjk4QWk5dFFycXRXeEdveW9WYVJN?=
 =?utf-8?B?dFo5NmRSejhrbGR4ZUg3WkxpV1l0ZWJnWjBOd2kzVDlhMi9Ea0tnRkZyL1hi?=
 =?utf-8?B?Y290U01GTm1rWGF1REJ1T25CNkRQTHhFdDNBMDFLZkpJTE51cSsrTUZxYWQv?=
 =?utf-8?B?ODNnUk15M2g1RnNCQUVlaDEyRU8zNjVzaVkzNGVvTlJUcFNPY2ZrYWs4MG8w?=
 =?utf-8?B?QVZJTXJwcCswbU9OV2VWQ2pQRnNqYVJBbnllTVBMYmU4RXlIcTZsc0xWZ0RG?=
 =?utf-8?B?SXNQTUYvaWg2R29tQzdudTUyb0ZTbWhpVEhob0piT2ZDa3huelRPczZxU2ZG?=
 =?utf-8?B?S3JCdWpqbEZEbkRlTVJla01Dakt4Z093bWk3NFFCcWllM21MaEdXNU5zNnNh?=
 =?utf-8?B?Yis0YnU4ejMvcVQ1by96dC9MUG5PZ1lTMDc5bFUvb2kyUVkyZWkySmRUVHRZ?=
 =?utf-8?B?OG9QM1ZSdEk0Q2tlWjg3UGxSYUcvTVkvTGJKdnRjS1NlZG1zc1hjUnZtb1B3?=
 =?utf-8?B?MUpvSUIrVnZ5akJKMWtZNWZhalppVHdJWGVaRkNZTS9GNVNtWm5KQkRXQXdK?=
 =?utf-8?B?NmlvekZWUUludVFoejR0MmtHNFdlN1NWdWhiVnJmM2NiSUl5NFlMUkNCeWFL?=
 =?utf-8?B?UnBUN0NFQnNUUVFiNnVxQStxbGZCcVp2OVBMeldFbVJZSllUNy9odUFwT0tn?=
 =?utf-8?Q?FtiPgoRRVOicJEd6tU=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2AAD948EFEDAD499C90DFB10FE3D909@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 360e1aa0-1223-4e36-bb97-08d99036e7c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2021 23:52:53.9912
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EkdPbgW6+w0Qa7qTsI81kjf8lb2C/C9YKUNQ5dG1dQYD8qkVeU3bAoGOYc1GFiNIGzoMW/Fhk7FCe98vRN6rkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3048
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

VGhpbmggTmd1eWVuIHdyb3RlOg0KPiBKYWNrIFBoYW0gd3JvdGU6DQo+PiBPbiBGcmksIE9jdCAw
OCwgMjAyMSBhdCAxMjowNzoyMEFNICswMDAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+Pj4gV2Vz
bGV5IENoZW5nIHdyb3RlOg0KPj4+Pg0KPj4+Pg0KPj4+PiBPbiA5LzEwLzIwMjEgODowOCBQTSwg
VGhpbmggTmd1eWVuIHdyb3RlOg0KPj4+Pj4gV2VzbGV5IENoZW5nIHdyb3RlOg0KPj4+Pj4+DQo+
Pj4+Pj4NCj4+Pj4+PiBPbiA5LzkvMjAyMSA2OjE1IFBNLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+
Pj4+Pj4+IEphY2sgUGhhbSB3cm90ZToNCj4+Pj4+Pj4+IFNvbWUgZnVuY3Rpb25zIG1heSBkeW5h
bWljYWxseSBlbmFibGUgYW5kIGRpc2FibGUgdGhlaXIgZW5kcG9pbnRzDQo+Pj4+Pj4+PiByZWd1
bGFybHkgdGhyb3VnaG91dCB0aGVpciBvcGVyYXRpb24sIHBhcnRpY3VsYXJseSB3aGVuIFNldCBJ
bnRlcmZhY2UNCj4+Pj4+Pj4+IGlzIGVtcGxveWVkIHRvIHN3aXRjaCBiZXR3ZWVuIEFsdGVybmF0
ZSBTZXR0aW5ncy4gIEZvciBpbnN0YW5jZSB0aGUNCj4+Pj4+Pj4+IFVBQzIgZnVuY3Rpb24gaGFz
IGl0cyByZXNwZWN0aXZlIGVuZHBvaW50cyBmb3IgcGxheWJhY2sgJiBjYXB0dXJlDQo+Pj4+Pj4+
PiBhc3NvY2lhdGVkIHdpdGggQWx0U2V0dGluZyAxLCBpbiB3aGljaCBjYXNlIHRob3NlIGVuZHBv
aW50cyB3b3VsZCBub3QNCj4+Pj4+Pj4+IGdldCBlbmFibGVkIHVudGlsIHRoZSBob3N0IGFjdGl2
YXRlcyB0aGUgQWx0U2V0dGluZy4gIEFuZCB0aGV5DQo+Pj4+Pj4+PiBjb252ZXJzZWx5IGJlY29t
ZSBkaXNhYmxlZCB3aGVuIHRoZSBpbnRlcmZhY2VzJyBBbHRTZXR0aW5nIDAgaXMNCj4+Pj4+Pj4+
IGNob3Nlbi4NCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBXaXRoIHRoZSBEV0MzIEZJRk8gcmVzaXppbmcg
YWxnb3JpdGhtIHJlY2VudGx5IGFkZGVkLCBldmVyeQ0KPj4+Pj4+Pj4gdXNiX2VwX2VuYWJsZSgp
IGNhbGwgcmVzdWx0cyBpbiBhIGNhbGwgdG8gcmVzaXplIHRoYXQgRVAncyBUWEZJRk8sDQo+Pj4+
Pj4+PiBidXQgaWYgdGhlIHNhbWUgZW5kcG9pbnQgaXMgZW5hYmxlZCBhZ2FpbiBhbmQgYWdhaW4s
IHRoaXMgaW5jb3JyZWN0bHkNCj4+Pj4+Pj4+IGxlYWRzIHRvIEZJRk8gUkFNIGFsbG9jYXRpb24g
ZXhoYXVzdGlvbiBhcyB0aGUgbWVjaGFuaXNtIGRpZCBub3QNCj4+Pj4+Pj4+IGFjY291bnQgZm9y
IHRoZSBwb3NzaWJpbGl0eSB0aGF0IGVuZHBvaW50cyBjYW4gYmUgcmUtZW5hYmxlZCBtYW55DQo+
Pj4+Pj4+PiB0aW1lcy4NCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBFeGFtcGxlIGxvZyBzcGxhdDoNCj4+
Pj4+Pj4+DQo+Pj4+Pj4+PiAJZHdjMyBhNjAwMDAwLmR3YzM6IEZpZm9zaXplKDM3MTcpID4gUkFN
IHNpemUoMzQ2MikgZXAzaW4gZGVwdGg6MjE3OTczMTI3DQo+Pj4+Pj4+PiAJY29uZmlnZnMtZ2Fk
Z2V0IGdhZGdldDogdV9hdWRpb19zdGFydF9jYXB0dXJlOjUyMSBFcnJvciENCj4+Pj4+Pj4+IAlk
d2MzIGE2MDAwMDAuZHdjMzogcmVxdWVzdCAwMDAwMDAwMDBiZTEzZTE4IHdhcyBub3QgcXVldWVk
IHRvIGVwM2luDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gVGhpcyBpcyBlYXNpbHkgZml4ZWQgYnkgYmFp
bGluZyBvdXQgb2YgZHdjM19nYWRnZXRfcmVzaXplX3R4X2ZpZm9zKCkNCj4+Pj4+Pj4+IGlmIGFu
IGVuZHBvaW50IGlzIGFscmVhZHkgcmVzaXplZCwgYXZvaWRpbmcgdGhlIGNhbGN1bGF0aW9uIGVy
cm9yDQo+Pj4+Pj4+PiByZXN1bHRpbmcgZnJvbSBhY2N1bXVsYXRpbmcgdGhlIEVQJ3MgRklGTyBk
ZXB0aCByZXBlYXRlZGx5Lg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IEZpeGVzOiA5ZjYwN2EzMDlmYmU5
ICgidXNiOiBkd2MzOiBSZXNpemUgVFggRklGT3MgdG8gbWVldCBFUCBidXJzdGluZyByZXF1aXJl
bWVudHMiKQ0KPj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogSmFjayBQaGFtIDxqYWNrcEBjb2RlYXVy
b3JhLm9yZz4NCj4+Pj4+Pj4+IC0tLQ0KPj4+Pj4+Pj4gIGRyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0
LmMgfCA0ICsrKysNCj4+Pj4+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQo+
Pj4+Pj4+Pg0KPj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMg
Yi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+Pj4+Pj4+PiBpbmRleCA4MDRiNTA1NDgxNjMu
LmM2NDdjNzZkNzM2MSAxMDA2NDQNCj4+Pj4+Pj4+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZ2Fk
Z2V0LmMNCj4+Pj4+Pj4+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4+Pj4+Pj4+
IEBAIC03NDcsNiArNzQ3LDEwIEBAIHN0YXRpYyBpbnQgZHdjM19nYWRnZXRfcmVzaXplX3R4X2Zp
Zm9zKHN0cnVjdCBkd2MzX2VwICpkZXApDQo+Pj4+Pj4+PiAgCWlmICghdXNiX2VuZHBvaW50X2Rp
cl9pbihkZXAtPmVuZHBvaW50LmRlc2MpIHx8IGRlcC0+bnVtYmVyIDw9IDEpDQo+Pj4+Pj4+PiAg
CQlyZXR1cm4gMDsNCj4+Pj4+Pj4+ICANCj4+Pj4+Pj4+ICsJLyogYmFpbCBpZiBhbHJlYWR5IHJl
c2l6ZWQgKi8NCj4+Pj4+Pj4+ICsJaWYgKGR3YzNfcmVhZGwoZHdjLT5yZWdzLCBEV0MzX0dUWEZJ
Rk9TSVooZGVwLT5udW1iZXIgPj4gMSkpKQ0KPj4+Pj4+Pj4gKwkJcmV0dXJuIDA7DQo+Pj4+Pj4+
PiArDQo+Pj4+Pj4+PiAgCXJhbTFfZGVwdGggPSBEV0MzX1JBTTFfREVQVEgoZHdjLT5od3BhcmFt
cy5od3BhcmFtczcpOw0KPj4+Pj4+Pj4gIA0KPj4+Pj4+Pj4gIAlpZiAoKGRlcC0+ZW5kcG9pbnQu
bWF4YnVyc3QgPiAxICYmDQo+Pj4+Pj4+Pg0KPj4+Pj4+DQo+Pj4+Pj4gSGkgVGhpbmgsDQo+Pj4+
Pj4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gVGhpcyBzZWVtcyBsaWtlIGEgd29ya2Fyb3VuZCBtb3JlIHRo
YW4gYSBmaXguIEFzIHByZXZpb3VzbHkgcG9pbnRlZCBvdXQsDQo+Pj4+Pj4+IHRoZXJlIHdpbGwg
YmUgcHJvYmxlbXMgd2hlbiB0aGVyZSBhcmUgbXVsdGlwbGUgYWx0ZXJuYXRlIHNldHRpbmcNCj4+
Pj4+Pj4gaW50ZXJmYWNlIFsyXS4gSWYgd2UncmUgZG9pbmcgdGhpcyB3YXksIGFyZSB3ZSBwcm9w
ZXJseSBhbGxvY2F0aW5nIHRoZQ0KPj4+Pj4+PiBmaWZvIHNpemUgZm9yIHRoZSBhbHRlcm5hdGUg
c2V0dGluZyB0aGF0IHJlcXVpcmVzIHRoZSBtb3N0IGZpZm8gc2l6ZSBhbmQNCj4+Pj4+Pj4gbm90
IGp1c3QgdGhlIGZpcnN0IGFsdC1zZXR0aW5nIDA/IEFsc28gZGlmZmVyZW50IGFsdC1zZXR0aW5n
IGNhbiBoYXZlDQo+Pj4+Pj4NCj4+Pj4+PiBFYWNoIGFsdCBpbnRlcmZhY2Ugd2lsbCBjYWxsIHVz
Yl9lcF9hdXRvY29uZmlnKCkgd2hpY2ggc2hvdWxkIGJlDQo+Pj4+Pj4gYXNzaWduZWQgZGlmZmVy
ZW50IGVuZHBvaW50IG51bWJlcnMuICBUaGlzIHdvdWxkIG1lYW4gdGhhdCBpZiBhbHQgaW50ZiMw
DQo+Pj4+Pj4gZ2V0cyBzZWxlY3RlZCwgYW5kIEVQIGlzIGVuYWJsZWQsIHRoZW4gd2Ugd2lsbCBy
ZXNpemUgdGhlIFRYRklGTyBhbmQgbWFwDQo+Pj4+Pj4gdGhhdCBGSUZPIHRvIHRoZSBwaHlzaWNh
bCBFUC4gIFRoZW4gd2hlbi9pZiB0aGUgaG9zdCByZXF1ZXN0cyB0aGUgb3RoZXINCj4+Pj4+PiBh
bHQgaW50ZiMxLCBhbmQgdGhhdCBjYWxscyBFUCBlbmFibGUsIHRoZW4gdGhlIGxvZ2ljIHdpbGwg
dGhlbiBhdHRlbXB0DQo+Pj4+Pj4gdG8gcmVzaXplIGJhc2VkIG9uIHRoZSBwYXJhbWV0ZXJzLCBh
bmQgYWdhaW4gbWFwIHRoYXQgRklGTyB0byB0aGUNCj4+Pj4+PiBwaHlzaWNhbCBFUC4gKHNpbmNl
IHdlIGNhbGwgYXV0b2NvbmZpZyBvbiBhbGwgaW50ZXJmYWNlcywgdGhleSBzaG91bGQgYmUNCj4+
Pj4+PiBhc3NpZ25lZCBkaWZmZXJlbnQgZW5kcG9pbnRzKQ0KPj4+Pg0KPj4+PiBIaSBUaGluaCwN
Cj4+Pj4NCj4+Pj4+DQo+Pj4+PiBUaGF0J3Mgbm90IHRydWUuIERpZmZlcmVudCBhbHQtc2V0dGlu
Z3Mgb2YgYW4gaW50ZXJmYWNlIGNhbiBzaGFyZQ0KPj4+Pj4gZW5kcG9pbnQgbnVtYmVycy4gVGhp
cyBpcyBvZnRlbiB0aGUgY2FzZSBmb3IgVUFTUCBkcml2ZXIgd2hlcmUNCj4+Pj4+IGFsdC1zZXR0
aW5nIDAgaXMgZm9yIEJPVCBwcm90b2NvbCBhbmQgYWx0LXNldHRpbmcgMSBpcyBVQVNQLiBXaGVu
IHdlDQo+Pj4+PiBzd2l0Y2ggYWx0LXNldHRpbmcsIHdlIGRpc2FibGUgdGhlIGN1cnJlbnQgZW5k
cG9pbnRzIGFuZCBlbmFibGUgdGhlDQo+Pj4+PiBvbGQvbmV3IG9uZXMuDQo+Pj4+Pg0KPj4+Pg0K
Pj4+PiBUaGFua3MgZm9yIHBvaW50aW5nIHRoYXQgdXNlIGNhc2Ugb3V0LiAgTWF5YmUgd2UgY2Fu
IGNvbnNpZGVyIHNlZWluZyBpZg0KPj4+PiB3ZSBjYW4gd2FsayB0aHJvdWdoIGFsbCBhbHRlcm5h
dGUgaW50ZXJmYWNlcyBmb3IgYSBwYXJ0aWN1bGFyIGZ1bmN0aW9uLA0KPj4+PiBhbmQgcmVzaXpl
IGZvciB0aGUgbGFyZ2VzdCBzZXR0aW5nPyAgVGhhdCBtaWdodCBiZSBhIHBvc3NpYmxlDQo+Pj4+
IGltcHJvdmVtZW50IG1hZGUgdG8gdGhlIGNoZWNrX2NvbmZpZygpIGZ1bmN0aW9uLiAgTGV0IG1l
IHN0YXJ0IG1ha2lnbg0KPj4+PiB0aGUgY2hhbmdlcyBmb3IgdGhpcyBhbmQgdmVyaWZ5aW5nIGl0
Lg0KPj4+Pg0KPj4+DQo+Pj4gVGhhbmtzIQ0KPj4+DQo+Pj4gQ3VycmVudGx5IHRoZSBnYWRnZXQg
Y29uZmlndXJlcyBlYXJseSBhbmQgaW5mb3JtcyB0aGUgZ2FkZ2V0IGRyaXZlciBvZg0KPj4+IGhv
dyBtYW55IGVuZHBvaW50cyBhcmUgYXZhaWxhYmxlLCB3aGljaCBkb2Vzbid0IGxlYXZlIG11Y2gg
cm9vbSBmb3IgdGhlDQo+Pj4gZ2FkZ2V0IHRvIGRvIG9wdGltaXphdGlvbi9yZWNvbmZpZ3VyYXRp
b24uDQo+Pj4NCj4+PiBJZiB0aGVyZSdzIGFuIG9wdGlvbiBmb3IgdGhlIGNvbXBvc2l0ZSBsYXll
ciB0byBpbmZvcm0gdGhlIGNvbnRyb2xsZXINCj4+PiBkcml2ZXIgb2YgdGhlIGVudGlyZSBjb25m
aWd1cmF0aW9uLCB0aGVuIHdlIGNhbiB0YWtlIGFkdmFudGFnZSBvZiBtb3JlDQo+Pj4gZHdjMyBj
b250cm9sbGVyIGNhcGFiaWxpdHkvZmxleGliaWxpdHkgKG5vdCBqdXN0IHJlc2l6aW5nIHR4Zmlm
bykuDQo+Pj4NCj4+Pj4+Pg0KPj4+Pj4+IEkgYWdyZWUgdGhhdCB0aGVyZSBpcyBjdXJyZW50bHkg
YSBsaW1pdGF0aW9uIGJlY2F1c2Ugd2UgYXJlIGdvaW5nIHRvDQo+Pj4+Pj4gcmVzZXJ2ZSBhdCBt
aW5pbXVtIDEgRklGTyBmb3IgQk9USCBhbHQgaW50ZXJmYWNlcywgZXZlbiB0aG91Z2ggdGhlcmUg
aXMNCj4+Pj4+PiBvbmx5IDEgaW50ZXJmYWNlIGFjdGl2ZSBhdCBhIHRpbWUuICBUaGUgbWlzc2lu
ZyBsb2dpYyB0aGF0IHdlIG1pZ2h0IGJlDQo+Pj4+Pj4gbWlzc2luZyBpcyBzZWVpbmcgaG93IHdl
IGNhbiByZS1wdXJwb3NlIHRoZSBGSUZPIHRoYXQgaXMgYmVpbmcgZGlzYWJsZWQuDQo+Pj4+Pj4g
IEhvd2V2ZXIsIEkgdGhpbmsgSmFjaydzIGZpeCBoZXJlIHdvdWxkIGJlIGFwcGxpY2FibGUgdG8g
dGhlIGltcHJvdmVtZW50DQo+Pj4+Pj4gaW4gbG9naWMgdG8gcmUtdXNlL3JlLWFzc2lnbiBGSUZP
IHNwYWNlIGFsbG9jYXRlZCBieSBkaXNhYmxlZCBFUHMgYWxzby4NCj4+Pj4+Pg0KPj4+Pj4NCj4+
Pj4+IEltcHJvdmVtZW50IGlzIGFsd2F5cyBncmVhdC4gSSBqdXN0IGhvcGUgd2UgZG9uJ3QganVz
dCBzdG9wIHdoZXJlIHdlIGFyZQ0KPj4+Pj4gbm93LiBTaW5jZSB5b3UncmUgd29ya2luZyBvbiB0
aGlzIGZlYXR1cmUgYXQgdGhlIG1vbWVudCwgaXQgd291bGQgYmUNCj4+Pj4+IGdvb2QgdG8gYWxz
byByZXNvbHZlIHNvbWUgb2YgdGhlIG91dHN0YW5kaW5nIGlzc3VlcyBhcyBKYWNrJ3MgZml4IHNl
ZW1zDQo+Pj4+PiB0byBiZSBpbmNvbXBsZXRlLg0KPj4+Pj4NCj4+Pj4NCj4+Pj4gSWYgd2UgaW1w
bGVtZW50IHRoZSBpbXByb3ZlbWVudCBtZW50aW9uZWQgYWJvdmUsIEkgdGhpbmsgSmFjaydzIGZp
eCB3aWxsDQo+Pj4+IGJlIGFwcGxpY2FibGUgdGhlcmUgYXMgd2VsbC4gIElmIHdlIHJlc2l6ZSBm
b3IgdGhlIGxhcmdlc3QgYWx0ZXJuYXRlDQo+Pj4+IGludGVyZmFjZSwgdGhlbiB0aGVyZSB3b3Vs
ZCBiZSBubyByZWFzb24gZm9yIHVzIHRvIHJlc2l6ZSBhZ2Fpbi4NCj4+Pj4NCj4+PiBBcyBsb25n
IGFzIHlvdSBoYXZlIHRoZSBhYm92ZSBhcyBwYXJ0IG9mIHlvdXIgcm9hZG1hcCwgSSBkb24ndCBt
aW5kDQo+Pj4gSmFjaydzIGZpeCBmb3Igbm93Lg0KPj4NCj4+IFRoYW5rcyBmb3IgeW91ciBpbnB1
dCBhcyBhbHdheXMgVGhpbmguICBEb2VzIHRoZSBwYXRjaCBzdGlsbCBsb29rIG9rIGluDQo+PiBp
dHMgY3VycmVudCBzdGF0ZT8gIExhc3QgdGltZSBJIGhhZCByZXNwb25kZWQgdG8gRmVsaXBlIHRo
YXQgSSB3b3VsZCB0cnkNCj4gDQo+IFRYIGVuZHBvaW50cyBzaG91bGQgaGF2ZSBub24temVybyBH
VFhGSUZPU0laLiBVc2luZyB0aGUgcmVnaXN0ZXIgYXMgYQ0KPiBmbGFnIHRvIGNoZWNrIHdoZXRo
ZXIgaXQncyBiZWVuIHJlc2l6ZWQgaXMgbm90IG9rLiBBbHNvLCB3aGF0IGhhcHBlbmVkDQo+IGFm
dGVyIHJlc2l6aW5nIHRoZSB0eGZpZm8/IERvIHlvdSByZXN0b3JlIGl0cyBwcmV2aW91cyBkZWZh
dWx0IHZhbHVlPw0KPiANCj4+IHRvIGVudGVydGFpbiBhZGRpbmcgYW4gZXhwbGljaXQgZmxhZyB0
byBrZWVwIHRyYWNrIG9mIHdoZXRoZXIgYW4gRVAgaGFkDQo+PiBiZWVuIHJlc2l6ZWQgeWV0IG9y
IG5vdC4gIFdoZW4gdHJ5aW5nIHRvIGltcGxlbWVudCB0aGlzIGFzIGFub3RoZXINCj4+IERXQzNf
RVBfKiBiaXQgZm9yIGRlcC0+ZmxhZ3Mgd2UnZCB0aGVuIG5lZWQgdG8gcmV0YWluIHRoaXMgZmxh
ZyBhY3Jvc3MNCj4+IGVwX2Rpc2FibGUvZW5hYmxlIGNhbGxzLCBzbyBpdCBsb29rcyBhIHRpbnkg
Yml0IGN1bWJlcnNvbWUgYmVjYXVzZQ0KPj4gZGVwLT5mbGFncyBpc24ndCBuZWF0bHkgMCBhbnlt
b3JlIDotUC4NCj4+DQo+PiBTbyBlcF9kaXNhYmxlKCkgd291bGQgbmVlZCB0byBsb29rIHNvbWV0
aGluZyBsaWtlIHRoaXM6DQo+Pg0KPj4gIHN0YXRpYyBpbnQgX19kd2MzX2dhZGdldF9lcF9kaXNh
YmxlKHN0cnVjdCBkd2MzX2VwICpkZXApDQo+PiAgew0KPj4gIC4uLg0KPj4gCWRlcC0+c3RyZWFt
X2NhcGFibGUgPSBmYWxzZTsNCj4+IAlkZXAtPnR5cGUgPSAwOw0KPj4gLQlkZXAtPmZsYWdzID0g
MDsNCj4+ICsJZGVwLT5mbGFncyAmPSBEV0MzX0VQX1RYRklGT19SRVNJWkVEOw0KPiANCj4gSSB0
aGluayB5b3UgbWVhbiB0aGlzPw0KPiBkZXAtPmZsYWdzICY9IH5EV0MzX0VQX1RYRklGT19SRVNJ
WkVEOw0KPiANCg0KbnZtLCBpZ25vcmUgdGhpcyBjb21tZW50LiBZb3VyIGludGVudGlvbiBpcw0K
ZGVwLT5mbGFncyAmPSBEV0MzX0VQX1RYRklGT19SRVNJWkVEOw0KDQpUaGluaA0K
