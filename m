Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 633BB3B8B18
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jul 2021 02:14:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236730AbhGAAQa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Jun 2021 20:16:30 -0400
Received: from mail-co1nam11on2046.outbound.protection.outlook.com ([40.107.220.46]:8288
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236647AbhGAAQ3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Jun 2021 20:16:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aNMQqCZQmwCG8l9P1owqHvL4LGHmT0g3X3cfnJVq9sI7WsZc9TBM9BmgrJTRLERG6M8CWSccA7Qaf2do8ln5DtG8EjBB238g7qA07tfvhVxOsQSMyGSJypfoUB8D2PTcH3gpKCfiKWvDMo2YaKQVUnbVJTT1uYIsB/7k1HsRXrXRWLKYBcNNIqt7IAaZJizf1U4/bF/bbZWV8GlwjtHx2ut+1pPJVT54t9gKIm0VpN9bwzRu15SVDyPP5UHWGXyORyjhH68ffiLS3T8/H/juPMTY2NyNvGlbLPIxYf8M5VPk2QLDYqM5GCCCiOnugEKFxZosHE/qhpf165xenyW1Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5l5AQioJm1BmH9pt/dn0r7uzHHPUvpUWdOctbLAXkgU=;
 b=geXhweXVlKLGUE4tAnuxIOQP7tuIiISlr8sVi04QFZL1ZGLr3ZutBeHnhQDW929DUbMa808ECgTWHihYa/mVgNBuxxiMgUV7lm2fX/+VogJAGufiVppjpzOzLmN5ul2x8hRduGTQQz0nRJOgkerDjIQlhAN35ow97ZCekcChV3nua/c/uQeUyoWjmmO45rGc6K65+o7C30JIxAZpZozC69tuSaPG3CjLbgzZWvuicw1aCEctB5sqU3J/mVWhi44tIu5re/BBYEvhBEhY/w6CIhpyNLpcxicbF6DtQ2P7BQ9vJplHOoqzeiNVuwNBKhDKpwdrnD8RV5ZXtpfx8rpVNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5l5AQioJm1BmH9pt/dn0r7uzHHPUvpUWdOctbLAXkgU=;
 b=Lgu4e5QhwIl9qxN5Pi3pSM7ERY6UB5aaAE6MVYVrMbtlIlZM2oxORtawTRuLbAdpd9Nma1QOtIu/Wr4tN4vgGC8uxGpEqmcweVmn5VPdfrHbTzr272b91KEVAQ4ZYnhZ4XKNaMG7ZMQtEN10NYi8fYTtU20v5k0r2sTsKVVcDct1cJprqm3LlI0Q52pKybevuhOB8WaV7Ch8HuDQHNj3edttN3iaZsVOv5Jmi7UUbYpH5oKCHAyAXH375TasENt/DXGWj1+bsp75sk7Pyq4gzSyey98Pj+ScuTtUh5uUrhGsmNEEm1qB/8Hki7EYl2/u0ZJu0CxfMewcCksEd0PbEw==
Received: from BY5PR12MB3764.namprd12.prod.outlook.com (2603:10b6:a03:1ac::17)
 by BYAPR12MB2871.namprd12.prod.outlook.com (2603:10b6:a03:13d::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Thu, 1 Jul
 2021 00:13:05 +0000
Received: from BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::6c58:1598:e768:d45e]) by BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::6c58:1598:e768:d45e%7]) with mapi id 15.20.4264.026; Thu, 1 Jul 2021
 00:13:05 +0000
From:   Krishna Reddy <vdumpa@nvidia.com>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Will Deacon <will@kernel.org>
CC:     Amey Narkhede <ameynarkhede03@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Barry Song <song.bao.hua@hisilicon.com>,
        Zenghui Yu <yuzenghui@huawei.com>
Subject: RE: [PATCH] iommu/arm: Cleanup resources in case of probe error path
Thread-Topic: [PATCH] iommu/arm: Cleanup resources in case of probe error path
Thread-Index: AQHXXIXINkEoGo7tjUqUutYWqhTL+6sso1eAgAADMACAAA24AIAArT7g
Date:   Thu, 1 Jul 2021 00:13:04 +0000
Message-ID: <BY5PR12MB37645C97C01B1088122B5C7BB3009@BY5PR12MB3764.namprd12.prod.outlook.com>
References: <20210608164559.204023-1-ameynarkhede03@gmail.com>
        <CGME20210630124816eucas1p27563f0a456c0196e20937619aa2f8d26@eucas1p2.samsung.com>
        <26f6a765-37c8-d63a-a779-384f095d5770@samsung.com>
        <20210630125940.GA8515@willie-the-truck>
 <4e3b1685-323e-2a7e-3aae-7c21b28fc65f@samsung.com>
In-Reply-To: <4e3b1685-323e-2a7e-3aae-7c21b28fc65f@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: samsung.com; dkim=none (message not signed)
 header.d=none;samsung.com; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de297a68-45f8-44e0-6cbe-08d93c24ff59
x-ms-traffictypediagnostic: BYAPR12MB2871:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB28717D4427DCA2E03FD1FE07B3009@BYAPR12MB2871.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hn5ApSk1q9T8jVElKdL63nqRfOs9XCOwwKpoBDmr4VqEqgkB8/RC2rk5DvRfn+eBBSd6XTPP2M7lvJnoKDFhWOb4IGWskl7FaxbHUm+kp9+OajCmM96sDLi5iBBfwSLaA9jUusiQsZHutLPLOjSZRUtEUkiJ7Y5gTR4xCTdNtm5LyVTBYLVNHaXXjM0TaPnZAr0iVQaUCNswXsJ4L02U9hEFZt9jGBYCrkCJ5yzSMgNhE7cF0jdkl4TdCFIAWY5pGcYJ3M8cBaEQ2UduN42/TrtfKkWjb/4ZREsuL0plq7KIsV08dAH9IihUyQo2utx/5t5FcDHhELtf/Pa0qkc6p7RXN91fm06SAXZX3fF0GWkJ3qVSRCQ861whXl9XQh9RgBvXc7I0sw/prZ3nrIyXaf81pC431EIUN9741/dBwGOcXvzET0cX4Ho3w/Qv5GOg/5Ymuubw8YevN9vOzxJzIfPcw4i/4GsAurPOFo1Yk8WrREEDQpMMjeX5UcwT8Y8vhX4tCHfIC4uiwnRYAgzP6mQ/WkyW93lJ6X28fHOEHqjYABXkmNJU+EvawN6SMramChZbe2RfQ60hwfAblSIGaXakL1zjIUd4B9oDcpyRxPJzDg6ZHPfrDU4NDh0cYv4Z1tRiW2zTwDw8hr3hIgBN0Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB3764.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(54906003)(86362001)(122000001)(110136005)(38100700002)(8936002)(7416002)(71200400001)(2906002)(4326008)(4744005)(478600001)(316002)(5660300002)(186003)(33656002)(55016002)(9686003)(66446008)(6506007)(66476007)(64756008)(66556008)(26005)(83380400001)(7696005)(52536014)(8676002)(76116006)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VWJiN2FvVmwwN05EMjFuMkZGNHJQOEYxZ0dENVR4WXU2aFRTU0F5V1lIUTNR?=
 =?utf-8?B?V1VnVFhsbURFRDB5T092bXNtb1IrZXNTQS9XQ3UyYkk0RWxUaU5DWUFwc2Vv?=
 =?utf-8?B?K0lXRUNrb2YzeENVOFNMdmJJb2Qxa1FNN2o1V1A1YUFnT3JJODdFbDRsU25n?=
 =?utf-8?B?Zm41OGNxcFhEVG9DSUkzL2ZtUThIU3VCNnVyR2VwWWpNdkdsY2lUbXJKeWZB?=
 =?utf-8?B?MTJGZU9ONjBwQTJINXZaU1hpN3Nza0lPZUxVbERrakdvN2dLbnVhVzRlWXFn?=
 =?utf-8?B?VGQ1QlBBRndFN2JxSFpQdHBreG1VSkl1MXdEdFRuYVBMWk9Hc0NxSEU1NWFM?=
 =?utf-8?B?VFFEQTBJOEcrS1lQK1gzTS82ZUphYmFveWNsOUhpTGpVTklabzUrZE80N3VX?=
 =?utf-8?B?UmhOdGlqUStYN0xZL2RCakxSMVpBS2Q3VG00RmpIMGlUQzNxcDV1UW1MRXpx?=
 =?utf-8?B?R3ZSZVFDRFp4bnRTSXpsdVRnNm1BeU9lbXFmd2dFMzg1TDQxNDJZQ2dDWjQ3?=
 =?utf-8?B?K2VQaHE5U3lkdWp3TTdieWlvdmNwYkk1TEpFYi9RMng5bUpTNkZaUUd3WkpD?=
 =?utf-8?B?S0dXK1dxeEh5UnQ5bWpKcE1kTGJPbWJLY1pOOFkyNnpranprRnM1anFmNGtm?=
 =?utf-8?B?MGY0ckt2L0hGdTRTNDJlYTFmREgzb25oR0VBeHpzdmlEMWNuZzNaUFlNZEZM?=
 =?utf-8?B?NmVlY2c2d2ZPblhqSUFnMTJmZVRNNFpkNzVwZFEyNjVGNUFLWEd0bkpiN2Fh?=
 =?utf-8?B?dURVYXBHbGdlN3owZHhLNHo0dE5ad3p3NlljaFl0bXd2VlRTTnBlVUMrMXc1?=
 =?utf-8?B?WHR4a0JBK3F4SGNkV25GRXBYL1FjZitHRlBodnQ4VituQU1MMFdlalhaaE1y?=
 =?utf-8?B?Q2lzYXk4aTFXSElVcVBwUW9rZlBFVzVrODVFTXVPNFhpQXlCcFYxclhaVnRI?=
 =?utf-8?B?UEUveExOUjJlUzV5cFlkdXlXNnJGdE5Ca2ZLQTBVZWpGS21RVnMwbUFSWkhi?=
 =?utf-8?B?R0JyTzkxRDBKV0RNYXR2aWlJZFdSTlRvNXJkdlpHRDFCQlJQOFZjNlo5dDVG?=
 =?utf-8?B?OTRxS2xHWEtjRERnc1FOTnFhamE2Y080cE92dFBDd2NNSDcxWTFlSHZUTzcz?=
 =?utf-8?B?V1cwU0R3dzl3MmN6bHFNME4rbVBQNzcyT0V3dG5RTzFhRjV6UmFNUElkcDFM?=
 =?utf-8?B?eDQ4MjlNcCtoUTJUNkt6M3V5ZzRXam8wQWtWejBrV2V5UFZHT3o3NTdYVGpH?=
 =?utf-8?B?V3lEb3E5TCs1TGNmcG1hRnR0eDNEVVpLbllPVTAzVVh4OUpiTTVNMEYvdml2?=
 =?utf-8?B?aW5XR1JmZ1J6RVlRZmUvOStwYTN1Y2d5VTAyMS8rUVdxZnBBWS9STUV6Vk9L?=
 =?utf-8?B?TVRFaXhyeFpvRjdIOGFHc05oQTB4MTVIT2ZybnRJMWd5VmlMK0w1M3VCak5u?=
 =?utf-8?B?WDRpdE1UWUN6VEY5SHB4NmFzcE1BcStTbkpZcG5KdndFeTgwZ1JRb2hyQkx6?=
 =?utf-8?B?RGU3bnpRdHpiSDhVd1dDQTBmQ2xGQ0Z2TGsyYjBjQ2VGZzEzTUFjUUgxZnI5?=
 =?utf-8?B?NUwrS3U2T2RaUGl5RFRCdnlBaUt4Rm5za3k4d3F5eUtWNWpKOEdFK3BweUhq?=
 =?utf-8?B?VW0xTVdyZVMxdndXclMyOUtWYjA3dTZOU1pyNlVacGxobXFJMWp3SlhHRVN5?=
 =?utf-8?B?N2l0b0xXcVNwYjNkMktTZXI0YlpVd0tpb01zUkN1ejdCL1FYeE9jVmR6bmRB?=
 =?utf-8?Q?ueUX5pwCTFW0v9MXD7PS4sjZYlBmABpprBWUbJh?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3764.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de297a68-45f8-44e0-6cbe-08d93c24ff59
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2021 00:13:04.9755
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AYFnW4P3ZkG2L7sSf0R+BBnBznJ5Fm6UldUpdAaMkxEzzdDxyjNFFuj6ex5/S8DSa7uWgMla3uNPaacckAuvnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2871
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PiArDQo+ICtlcnJfcG1fZGlzYWJsZToNCj4gKyAgICAgICBwbV9ydW50aW1lX2Rpc2FibGUoZGV2
KTsNCj4gICAgICAgICAgcmV0dXJuIHJldDsNCj4gICB9DQoNClNob3VsZCBpdCBiZSBwbV9ydW50
aW1lX2ZvcmNlX3N1c3BlbmQoKT8gIHFjb21faW9tbXVfZGV2aWNlX3JlbW92ZSgpIGRvZXNuJ3Qg
dXNlIHBtX3J1bnRpbWVfZGlzYWJsZShkZXYpLg0KDQo4NzUgc3RhdGljIGludCBxY29tX2lvbW11
X2RldmljZV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCjg3NiB7DQouLi4N
Cjg4MSA+LS0tLS0tLXBtX3J1bnRpbWVfZm9yY2Vfc3VzcGVuZCgmcGRldi0+ZGV2KTsNCjg4MiA+
LS0tLS0tLXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIE5VTEwpOw0KODgzID4tLS0tLS0taW9t
bXVfZGV2aWNlX3N5c2ZzX3JlbW92ZSgmcWNvbV9pb21tdS0+aW9tbXUpOw0KODg0ID4tLS0tLS0t
aW9tbXVfZGV2aWNlX3VucmVnaXN0ZXIoJnFjb21faW9tbXUtPmlvbW11KTsNCi4uLg0KODg3IH0N
Cg0KLUtSDQoNCg==
