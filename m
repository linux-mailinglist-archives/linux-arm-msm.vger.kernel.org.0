Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E6993A38E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jun 2021 02:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230083AbhFKAja (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Jun 2021 20:39:30 -0400
Received: from mail-bn8nam08on2078.outbound.protection.outlook.com ([40.107.100.78]:63424
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229578AbhFKAj0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Jun 2021 20:39:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gE0ccfk96/kVcJWQcj1rEgdHtyNSjDpaY8RGV1YNyDHzBsQieQFKfkOUl7rnyYZm9ccTeeYQWTb4Yk9oJ8Xn/M7ush+aLvBj+2kMC09qUWMTbze7sXHI+8WalCCYZf/+vL7Zu/yuH6+uFMLDl84B03gVuhSjMNNuWbXLtMDSOy4C2nUVJSvBWly67XEeZ49XHrYTLw8/qllz5cnAHBl2Jg4KbiTF9sJ0ATXoHo6vCD25RdRGfMHerfJfNalAGzE0Jumc2b81+wJWx+iD1xTycM3DlY9ZbViq9bbuV1z8rhWQSR1HvnNcUjg49ZYYnZMEaDHhPjvCHjwf/SsFsFqNAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GoiCu82qVBGBjCcV+qKodYol4zynnQNjwbimZNFDGXA=;
 b=dD76Zwz0afsTk4LvrJXiyvGAfdW1vqu+dOwWD0XiSSLHULWE0kj1aeoBSg3J6X0CYmY29/GcwRnhEyl1pNFMmx1w4gsgLcSfskLykY+iTZj61KZ9IXYElQDYwGKHBxYWOeYa4FOrAGpKPYck8EiOhQoObuZsse+oBZtffDAEL3vJ7dWPG/5n+SuXgnlLorSsVnBaTwXa4oT1M0tWVdaLUP7zYRsZobTmAkgzSrVtJJf6UTktmUAZBDuiZ3Hqau6yZwcW20A7pLRmfzzjrrJQ3qHZVuIz86AHqwGh6R4tOeuWxwiaxZtdcgCbwUVYsPv2xpcrcb4UdaoWBxxxelGScw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GoiCu82qVBGBjCcV+qKodYol4zynnQNjwbimZNFDGXA=;
 b=KVTsOgsshLFqP3b3mexwektolnJPLxFV+K/OORTJdC4KknXZzPs9DYpBgY70dVrYxFQq28HyjcVEf8tMXeMFUR1jKDNrBgIIPzRyWeVoqAKxMm+psGVNO61/FW9uNGQd1tVWfYzBDAM8wYPr8EkMS6AUx6+/lKzAarsyqdhp7plAj8ErqR798H08m3NJO0hGU/7+tIQJuj8p8bC/Gl93vkr1+bcVMSPB8aDko0oxV/zy7XIg8EUMG9GXFaPGIRB3AGHsnj3C0fSRrYbJZWqDXiBqAJ5mpIvoCHB5pBydLk8kYeYRKaaz7LXhOvXMQXfE1ntpPUlcTDBh/wPqCefetA==
Received: from BY5PR12MB3764.namprd12.prod.outlook.com (2603:10b6:a03:1ac::17)
 by BY5PR12MB4322.namprd12.prod.outlook.com (2603:10b6:a03:20a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Fri, 11 Jun
 2021 00:37:24 +0000
Received: from BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::d05:4bca:ea51:15af]) by BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::d05:4bca:ea51:15af%6]) with mapi id 15.20.4219.023; Fri, 11 Jun 2021
 00:37:24 +0000
From:   Krishna Reddy <vdumpa@nvidia.com>
To:     Robin Murphy <robin.murphy@arm.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
CC:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        Will Deacon <will@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Thierry Reding <treding@nvidia.com>
Subject: RE: [PATCH] iommu/io-pgtable-arm: Optimize partial walk flush for
 large scatter-gather list
Thread-Topic: [PATCH] iommu/io-pgtable-arm: Optimize partial walk flush for
 large scatter-gather list
Thread-Index: AQHXXT84btg0466hEE2rkvq94oyuZasMBHAAgACy+QCAAD6WAIAAB6mAgAAg2ACAAAWcgIAAPESAgACQdxA=
Date:   Fri, 11 Jun 2021 00:37:24 +0000
Message-ID: <BY5PR12MB37646698F37C00381EFF7C77B3349@BY5PR12MB3764.namprd12.prod.outlook.com>
References: <20210609145315.25750-1-saiprakash.ranjan@codeaurora.org>
 <dbcd394a-4d85-316c-5dd0-033546a66132@arm.com>
 <c600e9b2534d54082a5272b508a7985f@codeaurora.org>
 <35bfd245-45e2-8083-b620-330d6dbd7bd7@arm.com>
 <12067ffb8243b220cf03e83aaac3e823@codeaurora.org>
 <266f190e-99ae-9175-cf13-7a77730af389@arm.com>
 <dfdabcdec99a4c6e3bf2b3c5eebe067f@codeaurora.org>
 <61c69d23-324a-85d7-2458-dfff8df9280b@arm.com>
In-Reply-To: <61c69d23-324a-85d7-2458-dfff8df9280b@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a9f980b3-1c9d-4733-7fed-08d92c71152d
x-ms-traffictypediagnostic: BY5PR12MB4322:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB4322F52D979E48BFDE3E79F4B3349@BY5PR12MB4322.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XmsM6MIPMK5pMy21VxMzMEDd+965bLWFExJp+Gnsjbks3KLWIsEa9HUQQjTK1TypORsadL/lNT/ENnxH+64ccdRZV2+/FHGK2lCPjDytNmu4g2pVAGI9LrTwP5Z0QKdTYDRDjIsYTMRKMY9dL7etysxErywED4JaSgp0wEmNY/26FLKYN9WN1YsNLh/Rj2LmKYp4A5qwT5Z0WktrSUAMEcUU7f3+kA9Za/vIsAttVXEEtjcbsMTLXJAwgYPnftXn5geNS5v2saWciHqM8Fe7zF7axXta6kwm7MfLr6zjj2kN34HuDhUKJ8o+SOZPznlEv/HchcNURbJsCazYU3CeCpBRqprGloFLGiu87QHacAaAmdkAsaXcjdp7whFcHvEulFHMo8dzkJQPbjMolPYl3o3NuRQ7NKo3qnlwxUQnP5Cbp6hZAol+hsoymVkD8L82ufcXJwWRhC/oQXBT9DKPc3vAYkW1nFF8aKQM3uMU1vufZUNlwZM6/FB+rgwy9vH+FGv5ojOYgvwRUXdDnJJMZ6ttYPT68xQolNADch9Sgs16RgSTtqkSiXUWURBkBAVR5tGIbi8V+7q1rocvSZM56YnNHFCKraRJEMxzSKgmXxQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB3764.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(376002)(39860400002)(396003)(9686003)(7696005)(55016002)(66556008)(64756008)(66446008)(26005)(66476007)(86362001)(66946007)(2906002)(76116006)(478600001)(8936002)(8676002)(4326008)(110136005)(54906003)(107886003)(186003)(52536014)(38100700002)(6506007)(33656002)(83380400001)(316002)(122000001)(5660300002)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cWIvZ2Z0MGtBdG84R1p4RC9VdkJSZnQrOE0vVytZbjZqTU8yelBWemY3UU1i?=
 =?utf-8?B?T0ozVVp3OHRmcXB5RHNuOWNpYVRJcS9IWEN5Z1NYcnhKbEJ0MmVWUG50dC9p?=
 =?utf-8?B?RmoyZUhqOUcwVWhOMzYxOE1JVUp2cFIwSmthNlRwWnlPcGg3SnZoaTFYNUJv?=
 =?utf-8?B?amhVRFdSRVRqQ2dET2VURDcyVDZiMkJNeDgzOVdWeGE1VTBjcGFwbkN3dHQr?=
 =?utf-8?B?bGxva09LNnJ4R0VjeU9rZjRhSk1ybVo5SEVJTGg3ZXI2a1hUTXpPRFE1RUhn?=
 =?utf-8?B?Q1h5VXkxN01MOXAwM3pMQnJFNmdJZVRlS0UveCs3SDVWdXozZy9BUmFyL21L?=
 =?utf-8?B?aVN1ZEhPUjBWZnhHYjl2MG5sbllWZFlRQzRjWHpDZ1Z3NDNzNmV6OGdSbXJE?=
 =?utf-8?B?SlNyWGdleGxIcGswOEZZNkxiMjRaVVZWMzFiclNaTGJYYVpKRGFMaGh1djhl?=
 =?utf-8?B?N24zL200em9LTEdEQ2JZZlhZSG0xOW9FSHE1cmhuTXVwL01UNXJSTDVWRjJm?=
 =?utf-8?B?dWxjemtzY0FpclJmWTVsRE82eVpESkIyR0ZRODNES09qNTVGdEtGMXMvbU1u?=
 =?utf-8?B?K3doejVHeXA2bGZTaWR3eEluTU1IM1ZDQjhiMFA5VE5KY2RmRHc3YjRxWHpm?=
 =?utf-8?B?alQzcHdZVVNzT1ErclF3TmpkV3F1Y1ZWVDUyZklzR2RoL25SL3JUblpDSTVF?=
 =?utf-8?B?eW83NHJqcVdnMk56K1l4amZ0VkZCREZWeStDWHpaR0E5R2Z6YWtpd0dXOGNn?=
 =?utf-8?B?dmsydGIrUUthR1NPQmlKSG9sVGRkOVVwVlBiT0ZobWZoc29aR3JDZXpRaS94?=
 =?utf-8?B?WHdmWEJiVmtzVG5scUk4Qnc5Y2FOQlZTa3NGV1M3c3lPR2VRelV5Snk3THcw?=
 =?utf-8?B?S3FCNDR1NDNSWUZKWitMQXFCanZKTWtxYld5a2tFVEtraE5SVE40TDRVcGZR?=
 =?utf-8?B?SG9KS0Y2dk56NGErTy8xMTBicGdLcDVDd0t5SEQzUUR6QVpiVnQ5TytaL3Js?=
 =?utf-8?B?MGp1OU9SaTc5VDlyd042aGF1ZDFrek5VaEFnZkNtNVZkVllXVjJOTzJlQmdE?=
 =?utf-8?B?Y0UxcExBVmExbjhGNHh2RmExK3BpYk9RQlBxdUNWYmN4elZXMk4vK0Z1dzlU?=
 =?utf-8?B?ZTc5L0l5R0FtelJPUUI4enI3U3UwUzZBaEY3NjFvaWUzakhmRzRjQWpDNlBJ?=
 =?utf-8?B?NjhzODhWUVREYXM2L2ZwTlJXS05ScjdrU1RnbjdGWFdBWTJLWlQwTFp0a1pP?=
 =?utf-8?B?bUVVaE5zQlhSWEQyRjQremN4Z3Z6ajFjWXlqMzUzd1EzRy9jSUFBUHdoVEhM?=
 =?utf-8?B?UmVvb01kSTUyUFJjSTJKbnFHSTJwODAwSHY2SjFiR2FRWmh3NEZtQWFiRzhT?=
 =?utf-8?B?NS83UTFvVFA5MFljdlpTYkd0MW1iMUtibGhmWUhZSkFyVzJYS3QvN2ZpaXR4?=
 =?utf-8?B?Zy9KMjRxWURJZlVxSlhySnJQalR0OVBxOXNvWkpKaG1FSzhtWE0xKzRIOWRq?=
 =?utf-8?B?NG13bjA3SVRiSDJKUktRQkloaERjbW5CbCs0RWhQVzFqc2JIdzZTanhRUlhh?=
 =?utf-8?B?cU9JQmpBZmNoUXpZZlRPZk11ajlucTlIMzBRcW5vZ2ttL0lkV2FEeXRNcmFn?=
 =?utf-8?B?NHhWNjdvR0hWZkY4WXFrdjFheG9KbURjYlRkK1Zrd3dMb0Q3WVduOU5WbnZR?=
 =?utf-8?B?azhwOW9PMzgrc3FWbUdpMnVuOEJ3ZnY0QWxsYjRvWmVPZVV4aHlacTRQcFMz?=
 =?utf-8?Q?hOGm3cga1nkADt6atwRQApRsKb0/8HWaBRAjR5H?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3764.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f980b3-1c9d-4733-7fed-08d92c71152d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2021 00:37:24.5946
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Aqvr7hqEOUFVdljp8+bGkD8LmBcL3d4gbnYFFG8TH4NMMgYU3k+QnHawUQPAWvLhnOgryDRISqw2ceqZxFjbbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4322
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PiA+IE5vLCB0aGUgdW5tYXAgbGF0ZW5jeSBpcyBub3QganVzdCBpbiBzb21lIHRlc3QgY2FzZSB3
cml0dGVuLCB0aGUgaXNzdWUNCj4gPiBpcyB2ZXJ5IHJlYWwgYW5kIHdlIGhhdmUgd29ya2xvYWRz
IHdoZXJlIGNhbWVyYSBpcyByZXBvcnRpbmcgZnJhbWUNCj4gPiBkcm9wcyBiZWNhdXNlIG9mIHRo
aXMgdW5tYXAgbGF0ZW5jeSBpbiB0aGUgb3JkZXIgb2YgMTAwcyBvZiBtaWxsaXNlY29uZHMuDQo+
ID4gQW5kIGhhcmR3YXJlIHRlYW0gcmVjb21tZW5kcyB1c2luZyBBU0lEIGJhc2VkIGludmFsaWRh
dGlvbnMgZm9yDQo+ID4gYW55dGhpbmcgbGFyZ2VyIHRoYW4gMTI4IFRMQiBlbnRyaWVzLiBTbyB5
ZXMsIHdlIGhhdmUgdGFrZW4gbm90ZSBvZg0KPiA+IGltcGFjdHMgaGVyZSBiZWZvcmUgZ29pbmcg
dGhpcyB3YXkgYW5kIGhlbmNlIGZlZWwgbW9yZSBpbmNsaW5lZCB0bw0KPiA+IG1ha2UgdGhpcyBx
Y29tIHNwZWNpZmljIGlmIHJlcXVpcmVkLg0KDQpTZWVtcyBsaWtlIHRoZSByZWFsIGlzc3VlIGhl
cmUgaXMgbm90IHRoZSB1bm1hcCBBUEkgbGF0ZW5jeS4NCkl0IHNob3VsZCBiZSB0aGUgaGlnaCBu
dW1iZXIgb2YgYmFjayB0byBiYWNrIFNNTVUgVExCIGludmFsaWRhdGUgcmVnaXN0ZXIgd3JpdGVz
IHRoYXQgaXMgcmVzdWx0aW5nDQppbiBsb3dlciBJU08gQlcgdG8gQ2FtZXJhIGFuZCBvdmVyZmxv
dy4gSXNuJ3QgaXQ/DQpFdmVuIFRlZ3JhMTg2IFNvQyBoYXMgc2ltaWxhciBpc3N1ZSBhbmQgSFcg
dGVhbSByZWNvbW1lbmRlZCB0byByYXRlIGxpbWl0IHRoZSBudW1iZXIgb2YNCmJhY2sgdG8gYmFj
ayBTTU1VIHRsYiBpbnZhbGlkYXRlIHJlZ2lzdGVycyB3cml0ZXMuIFRoZSBzdWJzZXF1ZW50IFRl
Z3JhMTk0IFNvQyBoYXMgYSBkZWRpY2F0ZWQgU01NVSBmb3INCklTTyBjbGllbnRzIHRvIGF2b2lk
IHRoZSBpbXBhY3Qgb2YgVExCIGludmFsaWRhdGVzIGZyb20gTklTTyBjbGllbnRzIG9uIElTTyBC
Vy4NCg0KPj4gVGhpbmtpbmcgc29tZSBtb3JlLCBJDQo+PiB3b25kZXIgaWYgdGhlIFRlZ3JhIGZv
bGtzIG1pZ2h0IGhhdmUgYW4gb3BpbmlvbiB0byBhZGQgaGVyZSwgZ2l2ZW4gDQo+PiB0aGF0IHRo
ZWlyIG11bHRpcGxlLVNNTVUgc29sdXRpb24gd2FzIHNlZW1pbmdseSBhYm91dCB0cnlpbmcgdG8g
Z2V0IA0KPj4gZW5vdWdoIFRMQiBhbmQgcGFnZXRhYmxlIHdhbGsgYmFuZHdpZHRoIGluIHRoZSBm
aXJzdCBwbGFjZT8NCg0KV2hpbGUgaXQgaXMgZ29vZCB0byByZWR1Y2UgdGhlIG51bWJlciBvZiB0
bGIgcmVnaXN0ZXIgd3JpdGVzLCBGbHVzaGluZyBhbGwgVExCIGVudHJpZXMgYXQgY29udGV4dCBn
cmFudWxhcml0eSBhcmJpdHJhcmlseQ0KY2FuIGhhdmUgbmVnYXRpdmUgaW1wYWN0IG9uIGFjdGl2
ZSB0cmFmZmljIGFuZCBCVy4gSSBkb24ndCBoYXZlIG11Y2ggZGF0YSBvbiBwb3NzaWJsZSBpbXBh
Y3QgYXQgdGhpcyBwb2ludC4NCkNhbiB0aGUgZmx1c2hpbmcgYXQgY29udGV4dCBncmFudWxhcml0
eSBiZSBtYWRlIGEgcXVpcmsgdGhhbiBwZXJmb3JtaW5nIGl0IGFzIGRlZmF1bHQ/IA0KDQotS1IN
Cg0K
