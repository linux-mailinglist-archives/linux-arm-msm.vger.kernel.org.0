Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3F6C42FF3F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Oct 2021 01:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235967AbhJOX5P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Oct 2021 19:57:15 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:57776 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236194AbhJOX5O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Oct 2021 19:57:14 -0400
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 93D034606D;
        Fri, 15 Oct 2021 23:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1634342107; bh=gpXVzSoBKgMZB1Nuj84T+vJ4MSW1tknEYccs1e0lAJs=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=j6b3lro3REluSy6TFRhwzJm8WRo+u05k85+6Q9ljFZP/zaYR881xPVQvtHFUAy6X8
         bgt1HCjsK0c/b7BPXVmQHialKw+UYv5aUjrhzaugoK7ekf8nh7GOgE0ntQO//aDcQj
         gPiOr3WO8A2jh2XfJTKxEA1MRFMKpGfdCAaStUw/6P6NOQCe9xsqZNb+viKFqQ28aP
         O3gdaj3g+RAoykRlIn6msqEsdtTsoCRJVpfae+ZNPerX1N7NE+83GhFfE0ujlggfHu
         c+RQqGzqLZaA1klGBMeNPHpzNXDoSKXXoL42wIlGXzr3FPpRmw6P5ubFz+lpxE/X0D
         sJ+GFTSvK9v+g==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 1A018A00F9;
        Fri, 15 Oct 2021 23:55:06 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 473904006B;
        Fri, 15 Oct 2021 23:55:05 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="LzKHqMjV";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VNDa2HhXPxt0/gph34HbdDbBSe5AeEiHfqxFFS3WIOGMk2/xlV8c1xvrBZ7ascPiMTU0moNwMojjWgKILITpdARjEehPGi3pDHUJIcuMaezPsoxdI4Hvb5siiZlDMXGyivHmcYDBw02pV+TCjSp/4vxyMLcKRi4/NFTaIC0uGlfqEPK+ZWYSvbN7t57V9IYeTsLWE2OihmqYyCT9wwJ54uQ2bsAsZsuxo/orLpFd7y6vfxZ1G+LM4D08MxVKDJvdzKckYuCBNr57VhwGMRbbIw91lZogD1Czdk5Cfer2l84D49HpbBaOzn5Qu4ZMy+xLrf/5H0MJ1Qoz2QHb+j9TCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gpXVzSoBKgMZB1Nuj84T+vJ4MSW1tknEYccs1e0lAJs=;
 b=G+qhDfiJYP1z+Qexey0jv/K/JYQ+/rKmz2gv0LGMtE5mdj68Yvfz9QzfC13lfSfoiuXMYP68bzBK6AB3NrsuN1TiTrWD57hCyMjCtYVQZOcDSzFAk1bH85Ixg4EKhEi8/Q54QvPCnzQeFmE/G3oHJPpWqiemXCUSoHmM1/8JeiMzy3L3gk6AgBwOZ7UnWfgEJhpg5JpG7S46nHQcALO7G9HNNTqqMaMcN1aiOXByq79yK4mlp/kacDP0siMJqlJZM4NziOp0sffcjBHDYHC5xhUbUWssCn9ETK7MpBM5BVS/Kgjt0hczo+n2bcwt4QrZ4RfmRYZ1AA6ITdl7RLOvbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gpXVzSoBKgMZB1Nuj84T+vJ4MSW1tknEYccs1e0lAJs=;
 b=LzKHqMjVzz2Y938rUYvJIL1bJUWCszL59+0VrmkzRVp6e0PpxriV+65y3qLUzjbwaWKJzIV3bJtf6TkNDWgcsnCLr6NEmbY6c7RQJ4HwRa154Vppxs3UFPG/lkvPZ351mvShfNhoaXWISFqc/xchKWuVrrsN14wbYBMftxHq7Ik=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB3351.namprd12.prod.outlook.com (2603:10b6:a03:de::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 15 Oct
 2021 23:55:04 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::5865:4cfa:3e30:26d6]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::5865:4cfa:3e30:26d6%7]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 23:55:04 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Jack Pham <jackp@codeaurora.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Wesley Cheng <wcheng@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: gadget: Skip resizing EP's TX FIFO if already
 resized
Thread-Topic: [PATCH] usb: dwc3: gadget: Skip resizing EP's TX FIFO if already
 resized
Thread-Index: AQHXpVUbI6zrZuzuNkasP7SNAwlUbqucd/uAgAGWZYCAABurgIAEpB8AgCWYFoCACwyIgIABaFuAgAAaV4A=
Date:   Fri, 15 Oct 2021 23:55:04 +0000
Message-ID: <e2b81517-5f6d-8c56-f435-e736bf3ad94c@synopsys.com>
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
x-ms-office365-filtering-correlation-id: 048835d1-d18b-4b85-0fc6-08d99037358d
x-ms-traffictypediagnostic: BYAPR12MB3351:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3351260F02879EBEB22858D0AAB99@BYAPR12MB3351.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hYniAS2xgnpCtwCxcMMw9kaGyFVQ5gHrf0d/CfOSnnZRA31BN3mmlF4F26+BqYnQq9IuwF4q6/V/zJs8LBHeDEUNI0AtO9u3KMvJzp0ygajdrLfnfkPJEKdSONBIYB6iZO5NQTOj5lUVS2w9KwBISBFpnBRU/LUyUKqvNGXksPyXPU7jG8iN9EuoiHV134lrdNfALW3EFT4X5+EkukGKgo/jw3Jdf2YiVk3eUdFfOM15+z7Z+FyPZVLKysN1DbezfF4sJ6UlyjH2t/HC96NYcEHCOCUdONdwb5Kg22G0R4PxQ9JQfU3714Ovl51l0JoGHjtJfD7Hw5BWdnixYV5qbzrUnbYxBOr4oyVEnb4ucweFCkbVdiYUJ/Ya8nY6X2S5EcRwxVMgu/7qQtAohk9+2XWppGTEsRMxJXmI5SxRvOzA9aC/+n3aTSiP4w4ECSWoy1VO16cT62DIZF/UngZvHnjwwc0cD2n1ill9pYc5Udy7RO+LXh0M8fCnE2jjjMty2bYNvMg5BkArw5TqAgPuosVmeEQ//78htI3esaZqHx/SG+R/78PE90LEepDX7k2MApwzbwO9o6wFbwicwjRqvwfOt2EC9uDlGxfq0z4WTqkzgD7NNQWOPW6tjJHRVFIPZZ5XH1M2A7qN4WFHe1dH9Bdzy/gRVL/edHuFXjS6aAh+KbpC6LXGqsiy0ELQwAvuaktHxp8b+MmOcG4aaOlO5HfnN9kTZRUThFRCVlgvS+l7NHbNcMURswyfkhrTSRfYcdVdDPTzmOlvMtLZUC5uTw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(31696002)(83380400001)(8936002)(53546011)(122000001)(36756003)(31686004)(8676002)(38070700005)(4326008)(6512007)(54906003)(38100700002)(6506007)(110136005)(186003)(64756008)(66556008)(71200400001)(76116006)(66946007)(2906002)(66446008)(26005)(5660300002)(66476007)(86362001)(2616005)(316002)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QURKRXVyc0RWOWhUQzM4Y0VkMm02YzQyZmZwNTBFRnZ1M0RoVzNoTkU4UC9z?=
 =?utf-8?B?VmhmaFI3d0t0SXBrN0drcXZ1ZXpQc3R1d25xOEg2YkJSRDRGL3JmNU5Oc3BS?=
 =?utf-8?B?OWUrZkhjMUtiY0ZzbllZQ2pIa2xWOXNVY1NJdXp2cisvRWdTdzBJeTNJZU1m?=
 =?utf-8?B?TWJZcFU3WCtna05pY29oSGppZnRxOEg4eUkwaUI2dlBTN1pkazhySE9pdE9N?=
 =?utf-8?B?T3JvaEN5T1pUUFh1d014bVlwZ1NyYzBpdkpIMlBhQkRpQnVUYU1ScGxkOE02?=
 =?utf-8?B?UGhtSTZRdmZnN1lEdUMraGFnM0xodTE3eEk3Y0VzLzlmSTNscFNZV1c2Tjd4?=
 =?utf-8?B?bW42MytjU3M3TkdrVnkvSnlscHVpSWwyQTFRR2c5c3FhcDZnaUMxeDhxcEhL?=
 =?utf-8?B?VnVEb2VvNjF0NWNKU0UveHNPakxQdFc2VzQ0NUVzOFlmNXlFQnp2aFlhdXJt?=
 =?utf-8?B?WHY3amNOUFhvVTBINHBlbGFFUjRobGw3clBNYjRtZEtvdkdWb0pZVnRYS1Ja?=
 =?utf-8?B?VWhmY2xxc2VqTmkwbHREM1JXd2EvM2d0MG54d294RDJzV1JTbTJ0SVZlMmJO?=
 =?utf-8?B?cENEM0NDaWNNSEk2MjNxZU1PYUlpUnBCMDRjK2NZTUowRytoUW5GNzRIOTZH?=
 =?utf-8?B?TUh5RVBOMFZJRDI1T1Q0OXpKcWxsNU5wVStKeERPVUdOTlliT04vNzhXVUpD?=
 =?utf-8?B?Wk0zam9JZjBNK3o4Rkx0ZXdiZGJwUDZ0UG9kVjVFS1Q3S1cva0J1aDB6TVQ3?=
 =?utf-8?B?TU1TUEdVTU50ZEQvWG5oK01RSm9hOUJWRm81SDRNVEJjajRORmNZZDhwaXJa?=
 =?utf-8?B?dG11YWJYcVkrRjh1dGNSVDA0R1FINmhpT0thVTdPOTdxSnFmR1poWTFxZzVU?=
 =?utf-8?B?andqV0lPcGFXaTNkWlo2WElzeEJuWi91M1pLM1Z5eEsxc1c0am9Tbml3WWM4?=
 =?utf-8?B?N0d2U3dqT0FvZnR1bnh0cVdiMjRReXBpZE00UVlSbkg3RitkQ3FwY2QybnQy?=
 =?utf-8?B?YlVqSGNRM0kxR3FGS1ZKOURuTW9Vc3NTTWFKRjNUQWUwcHF3VU1WcnhWNWRQ?=
 =?utf-8?B?WjJ0b00xNU16VUJPRFVmNzNobXpySTNrUzdvVDEvN3gxbXcrM2FGL0RPMWQr?=
 =?utf-8?B?Rk9xRlFycUtOSkRsVGhUYzg2V1ZKS1BuNk14WEJTV2l0dmZhcXlYWEw5TnBT?=
 =?utf-8?B?RUYyUlYwSWlESi9IWUVVY2czTnZNeUQ3YzdIUlRmVnQyNjNzcmhMUVJPKzg5?=
 =?utf-8?B?eDhlWVlKWHhJazRLTkZ5aGYzT3VURzNGL2o5Yi9oNEdKYmxvV2dZN3c1UjF0?=
 =?utf-8?B?VC8zOFFKaHU3YnQ3cml3dDU2NmhHQnhMRzRGU1RDRU9KUk9TTjFPQ0JDalVC?=
 =?utf-8?B?VWljMFV6Uy82VDlBdHZWVG4vUm9DTEUwaURMWDV1OTNoSDRJMGRaeEhlakdM?=
 =?utf-8?B?aVU2eDd2TDdOUTdxbUd4T2dLeXRhUnpFRWhpSDUvSHNHRmlUNk5LR054ekxB?=
 =?utf-8?B?VjhSVnRvM1Q0Wkk3VlE1RittdFBIYXRpSkcvQXczNXpCQStERVlWSDZZSk0z?=
 =?utf-8?B?QmR6VDdoWkNMdlRNRk1jZGY3M0Z3UzlKVEdMSnBNYlE4dmltL05Db1ArbUVh?=
 =?utf-8?B?S3BLZElvM3ZlWW1zMWczZ0FId0E0ejc3WWRoaHJzMEdTUDUycjBFU2NaYU5S?=
 =?utf-8?B?aHVudHdhUTBGbkxnUk9CYVo4UC9NVXh4UDdwNUwvR2U4a2JKNVk0R1ZWaENw?=
 =?utf-8?Q?/EfieiVqO30P3ZN0Tc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <33F5DF4BEC63354ABF20B2C8052F3B79@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 048835d1-d18b-4b85-0fc6-08d99037358d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2021 23:55:04.3755
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F/BRHl4EKT0l5XW3lU0SsB0Uklo4EM8FCrE6a2fFqZLQkFZFfoTDSAblOtIzgk8ZK0DkonGTUpX0RtZrt3xpSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3351
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
