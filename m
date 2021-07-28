Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BB283D95F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jul 2021 21:19:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbhG1TTg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 15:19:36 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:42205 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230444AbhG1TTg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 15:19:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1627499974; x=1659035974;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=C1o4d1S98tsrTfQvWlPtPDLfSro/+DkwfeoaXUkgGS4=;
  b=zggHR6Xo7iPCRO+zmIInIBxLNcxl+oKEAXyiIEAwcSzPN6cgRI4HF+HB
   9tuKV/avQ98ftxAhVEy6RawKQz6rFCslwyIZ9RiNSNMFMpbC9Kn+D/fYB
   Q2yp9eBRvH/87eoyGt1DlziH9ZMfi0En3UViGIQq1S3zPgBOfCIaOgS8Z
   9SkT5vDreCLKQg5Rg4oDy+NL7d2pGAcp4H3USa9i7pWuifQPicVzYMOSz
   dLSmAW92/auMdopyuHSsVrEn//qqR8LKB2vN7rR2eORiikBiaKEcTIPyM
   6IgkLiSe9LcEPWC/dgkM/tjlJiIJqCrtrNUeXkcaY9bzlljHs5rD06TtI
   g==;
IronPort-SDR: w2/58M6dsGMu/32XaUGX45/SasVrwRdJPTUsc9hlR00I8GYNSuYN2F7tKCQtPJVaoaCTo+XhOO
 KSADf2ex2bgAG6b7983rJFqQpflgyIM0c2nwAfHUuMX11m1tZ4jtmNo/I3cbMERGpt1BsB+VT1
 jfaCKWeKir8jbZYIUNOg1KDwH5ILsbkqgiKNAB6ppusUV6aGI48J0RyLe+Zwgcpzp5MPQUpRTr
 zvIlfmwS/G8u6IJpoO3xJTtQGg85lPSB8fjnB2xdKoVwyyLAS6sF4tquiC6iM+F6UBQEmllAJh
 X/txdH28+WcbWEBTtfHxEDM9
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; 
   d="scan'208";a="126305148"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Jul 2021 12:19:32 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 28 Jul 2021 12:19:31 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Wed, 28 Jul 2021 12:19:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TxYIxPtsTkTbE1YP7glHW5PK/vRBTn3208p4/9DonFRTrLQZZmFhDQB8HLKNeQpKzIItlJEhE07yFfwiqhc5JhKHLjoTuvi+bP2jYMBu3J3/DJDHLTmbRWE4sJVkRfT0ILaMTBiDstjKH+w57RPt+yB7WJb4KhiQLCG0bzY1bGdKg1AlznOzLKGhgnKUjKKGH2dEbffcqcdyCQfYFlky1JBlOpuToqhN1zdsuM7W6Dj1vQhn3OVUfDtIunYf8OZ13jirefJOwMuF9mg9YnUgcFg/uYklbG8giEhZJm4VfrklWR6+jKDDDjD44vx9kLy6bV14X5H1zAMWW/yv/W3ppA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1o4d1S98tsrTfQvWlPtPDLfSro/+DkwfeoaXUkgGS4=;
 b=mJI69q5IT3EP82imELNi22OARX3ixMeqUofupMCUP4nN+a9C3ZLE4KPn0M9sHNJdZT45OruUzj1XWfwEdIVdu1n17eduF8Gvgq+Dm0yQi6Nd5M+OgV7Ekt4HnhI0qdM4S7JEEAY19GrJTaxQMEwSusA50b/QzNllZPs3+Fj5bA9uXPckO+7L8f1wdbo+23SzliN7BG7IfmuUP6Myk3ShTVyABgzg48P2pPoLcNkVkQYXNhXO2b0Y20LPrmUzSKnqInlB/RXm8JWudXvvopKwrxdMPvdb7nvmtDEgU18qh/kg/tq9eIlbpWO06o/SRZmO4dAuMsUHmkzf+6B3QSSzZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1o4d1S98tsrTfQvWlPtPDLfSro/+DkwfeoaXUkgGS4=;
 b=eZRFtbaurf92tr8T1HHnZ7Yfx6U5ZcDNdsxNuBFUpxyeoHBQni1ky4JKbOA45f/o8HByKAn7RR1QGGhRf6WS0bkl1QN2yqw/6cRZhKLZ14Qw6OR+h0fkp9k26T4Yh9GbYxYEfNLOmHfRq8J+ELDiYiAoD23M3qDtDnzloRSY1UQ=
Received: from BY5PR11MB4007.namprd11.prod.outlook.com (2603:10b6:a03:189::28)
 by BYAPR11MB2919.namprd11.prod.outlook.com (2603:10b6:a03:8d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 28 Jul
 2021 19:19:30 +0000
Received: from BY5PR11MB4007.namprd11.prod.outlook.com
 ([fe80::e478:6b2c:f71e:65bf]) by BY5PR11MB4007.namprd11.prod.outlook.com
 ([fe80::e478:6b2c:f71e:65bf%5]) with mapi id 15.20.4373.018; Wed, 28 Jul 2021
 19:19:30 +0000
From:   <Dan.Sneddon@microchip.com>
To:     <sam@ravnborg.org>, <Dan.Sneddon@microchip.com>
CC:     <tzimmermann@suse.de>, <daniel@ffwll.ch>, <airlied@linux.ie>,
        <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
        <liviu.dudau@arm.com>, <brian.starkey@arm.com>,
        <bbrezillon@kernel.org>, <Nicolas.Ferre@microchip.com>,
        <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <stefan@agner.ch>, <alison.wang@nxp.com>,
        <patrik.r.jakobsson@gmail.com>, <anitha.chrisanthus@intel.com>,
        <robdclark@gmail.com>, <edmund.j.dea@intel.com>, <sean@poorly.run>,
        <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
        <kernel@pengutronix.de>, <jyri.sarha@iki.fi>, <tomba@kernel.org>,
        <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH 03/14] drm/atmel-hlcdc: Convert to Linux IRQ interfaces
Thread-Topic: [PATCH 03/14] drm/atmel-hlcdc: Convert to Linux IRQ interfaces
Thread-Index: AQHXg+V9u4IBzc/SHUWKaqikrAmiKw==
Date:   Wed, 28 Jul 2021 19:19:29 +0000
Message-ID: <dcc5cd1e-d0de-bdda-32f3-623b85085756@microchip.com>
References: <20210727182721.17981-1-tzimmermann@suse.de>
 <20210727182721.17981-4-tzimmermann@suse.de> <YQFi96yaYbTG4OO7@ravnborg.org>
 <e28b1a2f-015c-c81b-eb64-5323df9ed35d@microchip.com>
 <YQF7bKyeup8n3awU@ravnborg.org>
 <3d2f6b84-dd07-d925-a8b8-2bfd5fc736d9@microchip.com>
 <YQGdxtV0BGZ8VOpm@ravnborg.org>
 <2f04b986-6b41-62f9-1587-23818b841655@suse.de>
 <793514f6-0270-771b-fe36-f82edf4e5fd2@microchip.com>
 <YQGrMH36Udg3eKQY@ravnborg.org>
In-Reply-To: <YQGrMH36Udg3eKQY@ravnborg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ravnborg.org; dkim=none (message not signed)
 header.d=none;ravnborg.org; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 95afb5a5-b5b2-405b-3afa-08d951fc9fae
x-ms-traffictypediagnostic: BYAPR11MB2919:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB291981A2B6A6AFC90DD1F1B7E1EA9@BYAPR11MB2919.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z3SGOqPukzM0Ky/TxLvjuZ5C1fM9iIjivps8b538EaDyqXXEzUoau5eGnIwxkyFopqUkYQ7PpZ5G3fxVl5oUeJu4gC6SR+Bn33tDe5d8ZL6vYnCbwbisrMuUuyd0+XQCeyPnDH8HPu4+G7N1SK0WfIwZzdznRPf62L1OqK+QWdw0iF7T7uiXm+aYR62G1eYwKMMZ7mSZ/q7w5xGRG2ByCYOu16neMpQGLjx9eReIIBV0O8oFqR3iEBsmQBzecVNyV0Gk9F9fL8WsXito1XwtTAdgW0Ue9KfdtX6HAb2vzdd2GbMEnsBbRzvasyypQd/YYF3CFW7GQjuN57fhD1bNV0rlHNCpyqI2csw5gIZXpSKBYsv1iN2qNJ1t2MRG4uULO+9onhBY8mI3qnpNFSNfULPX/4UZ3q+hbOcPsDeyQTjBo+PTR43rKYHCfW+4BMs/cojkr+SK/VrNDF3a6RcGQcVIjvR6Ei+foOyokiik0KYGL/+2+QAtBE1nSfuHZQ2B0iq0QMLAkoN4Fh2uQ0EyXCejhxVGiOJAc7HZgNFqC1xYof8+jsoC5T9Wovoh4vJdvSLTfSRq43/Sf2oHIU5LETZYO0eKaTcIcJZWVvWTK7APweLHLOD9Aia3/udOpz3sNS8zZDtwu0urowIqNHDCa+FhfmzdNmt+TI2i3Og2IJ1DZp4O9gusunliToFFFTT5UYqk9p4Q+WZS46zWoOuxqkUPBhMBUivSWnaIkP2ONnW0IwMqcIxy7B1YmuKgbWambxdQhA927qFCp6Lo8YNf3Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4007.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(136003)(39860400002)(396003)(366004)(31686004)(6512007)(2906002)(5660300002)(83380400001)(66446008)(38070700005)(53546011)(26005)(7416002)(38100700002)(6506007)(8936002)(8676002)(186003)(122000001)(36756003)(66556008)(66476007)(64756008)(2616005)(76116006)(66946007)(31696002)(478600001)(54906003)(91956017)(6486002)(4326008)(71200400001)(316002)(110136005)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bGlRTzZTZ1NCVXV0RWtnRzhDRWxGWE0zczc3SVJ4OTlUTENZRC9JSjlZMWZ5?=
 =?utf-8?B?VW9KRURhUDEraUVXb3VLT25UTWtqd3NFRFNabjJqZzhXYzVhWkpycHlINmpx?=
 =?utf-8?B?MlIrSGt6WFo2NjdHZElQbFFEY04zMTgvbGdlZTNWMDlvaXFPdURWMU96WGNJ?=
 =?utf-8?B?RnZwMUhmWHlHeFlteEYzUnc4UWt1WCtGalRQdlBab1UvSXl1dHZ1YXQyYWQy?=
 =?utf-8?B?V3ZCZ2pOVjBEckpDR29pQ0ZBdDU5c0JrUTdBcEdUSnoxa3pNdHVReWVxWHN6?=
 =?utf-8?B?UjUwVWY0aGpjMm1TbnpqbWhrQ1p4OVhtUjlRU0EyZVpzblJybzR1NXdnV3Za?=
 =?utf-8?B?c0JlOHdiaU9BTHJHZkpMbk9Ub0hMNm9Ha0gvQWVNRG9hV3c4bWVibUV6bFBx?=
 =?utf-8?B?RGh1eHRBNjROWjM1Wmd4Q0RJMDdiUUpld1QyMkwwMDBQbEJhNTRMY3NjeEpZ?=
 =?utf-8?B?QXI5dndWa3FDcWhCWHNGSDN0NTZOYitFdzVxSi9oME1JNnp0Ny9BZ3h4Zkll?=
 =?utf-8?B?N055NU1uQkpZMU1JTmRPcU80ZDk3WDRsM2tWVWE5YVA3VnFscENqYTRtM3Vi?=
 =?utf-8?B?NHNpUFZHY25ZZ3k5Q1BldkVmc0VSL2lQRDNmZFVxSmlyelpaTzJMS1c4ZWRm?=
 =?utf-8?B?K3puUTVZd0EwN1pIWlkzbzhnUGI1UW9XbWlkaXo2MWd2enBwY1JTamN0dng0?=
 =?utf-8?B?N1dHRWNxbWVSQWw1aVVEbUFnYzUycmpiVmVPdUdrckhsZFZBVzNqd3FiYjBx?=
 =?utf-8?B?Y3hPYnUyWWlxeDZDR2hBRTd6Rm5QajZveGhTRE5sNFBMNnk3MGloUlBIRkZp?=
 =?utf-8?B?R0ptK1BIRDFzcENYYjZsM3lGWWJYQzV3czl0ekxGVXQxY2s5R1cxYmZpRGV2?=
 =?utf-8?B?K1V6QjYzT0pRWDhPYlBHdEMzWlU0Uzc4WERBNmQxbkdvMm5BOWxlWlZBQzZT?=
 =?utf-8?B?cU14UUg5UnlHc2VPb0laTk93WGNpT1NnLzVZNXBNRFBwTHM5Z3hNR2ZQem9V?=
 =?utf-8?B?dW42Z0NvRHNzTllkY2Y1dlc4TFJNbVdta2NpamtNSHN3L0d5OVg3Y2ZNWElp?=
 =?utf-8?B?QnRFd1gyR2tBK2g1NTRzditRVXhiVlRrd2ZaODFqSXpqbmJzVGU2VGNzSnk0?=
 =?utf-8?B?MUVYempoOEI3N0tiUGNaRDZEUXlUcjIyZ0x0M3A2MjFFc0hSaFRrVVJIYzJX?=
 =?utf-8?B?aWdKRktVS1ErVHZjMDk4cWFkTk9MZHRKZFgrVFBpbDFRSUlWdzNyNysyN3pm?=
 =?utf-8?B?UzFvblFTcm5pWkloTUN5L24zSUwxLzYvV3I5WmlkVFFiQmN4VGNVNnNKSUlw?=
 =?utf-8?B?Y09tRk9DZHE5RElQam1MNDVRdjNFSHFRYyszRUpqcWZDU000dlpuOG41bGxn?=
 =?utf-8?B?SjFaOStEVmV5aFN0cTZqcmZBelhnbXFkaXpuTFlkUDFYQVpmb1NNV3NRbEgv?=
 =?utf-8?B?blBZNVNhaW14aEhrb3pDK0d6UkMwNzRLQTJiNGo4c1hXNDArbjZ2MG9SZWdB?=
 =?utf-8?B?Z01QaUhpQkpob0tWMkFCam1tM0JJZFV0MUlYK1QwbjQ4OWt3Zi92WC90eHlk?=
 =?utf-8?B?ZjRQdUZiNHJZVnBBL20wQ3FmOUt0Nmc2a3NuTnlHaThqNHZvTnQ0OXBBM0w0?=
 =?utf-8?B?OFBYaDJZWTkyTGthUXhVMUxkT0hpMmFQUjNuQVF6b1NWMi9WRG0yQ1UxUkNO?=
 =?utf-8?B?SGZ5a3hrU2FoWEF5TWpiZS80WW5TeWJVakQxUUNWKzF0UUsvRFE4dDYvdnB6?=
 =?utf-8?Q?DR+cQrPI+pwRAQmf6FE5lvqnlmCTNbBFE4FE9yL?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0350634EC5E1D141907EE9EB5B3D0EFF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4007.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95afb5a5-b5b2-405b-3afa-08d951fc9fae
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2021 19:19:30.0151
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GxmLk8zoA4rh2z3e+eXCRTd48WqNrHxwVXB++WoRSgyv8hk/1qgIxkwTa3hd94kUzoD1VIVc7Txxd3J7rXGsfasqyYYU8TYoDJwxBGUDinQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2919
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SGkgU2FtLA0KT24gNy8yOC8yMSAxMjowOCBQTSwgU2FtIFJhdm5ib3JnIHdyb3RlOg0KPiBFWFRF
Uk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNz
IHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEhpIERhbiwNCj4gDQo+Pj4+DQo+
Pj4+IEp1c3QgdG8gYmUgc3VyZS4uLg0KPj4+PiBDYW4geW91IGNvbmZpcm0gdGhhdCB2Ymx0ZXN0
IGlzIHdvcmtpbmcgT0sgKmJlZm9yZSogdGhpcyBwYXRjaD8NCj4+Pg0KPj4+IFllcywgY2FuIHlv
dSBwbGVhc2UgdmVyaWZ5IHRoYXQgaXQgcmVncmVzc2VkLiBJZiBzbywgdGhpcyB3b3VsZCBtZWFu
DQo+Pj4gdGhhdCB0aGUgZHJpdmVyIG1pc3NlcyB2YmxhbmsgaW50ZXJydXB0cyB3aXRoIHRoZSBw
YXRjaCBhcHBsaWVkLg0KPj4NCj4+IFllcywgdW5mb3J0dW5hdGVseSB0aGUgdmJsdGVzdCB3b3Jr
cyBiZWZvcmUgdGhpcyBwYXRjaCwgYnV0IGZhaWxzIGFmdGVyDQo+PiB0aGlzIHBhdGNoIGlzIGFw
cGxpZWQuDQo+IA0KPiBJIHRoaW5rIEkgZ290IGl0IC0gd2UgbmVlZCB0byBzZXQgaXJxX2VuYWJs
ZWQgdG8gdHJ1ZS4NCj4gVGhlIGRvY3VtZW50YXRpb24gc2F5cyBzbzoNCj4gIg0KPiAgICAgICAg
ICAgKiBAaXJxX2VuYWJsZWQ6DQo+ICAgICAgICAgICAqDQo+ICAgICAgICAgICAqIEluZGljYXRl
cyB0aGF0IGludGVycnVwdCBoYW5kbGluZyBpcyBlbmFibGVkLCBzcGVjaWZpY2FsbHkgdmJsYW5r
DQo+ICAgICAgICAgICAqIGhhbmRsaW5nLiBEcml2ZXJzIHdoaWNoIGRvbid0IHVzZSBkcm1faXJx
X2luc3RhbGwoKSBuZWVkIHRvIHNldCB0aGlzDQo+ICAgICAgICAgICAqIHRvIHRydWUgbWFudWFs
bHkuDQo+ICINCj4gDQo+IENhbiB5b3UgdHJ5IHRvIGFkZCB0aGUgZm9sbG93aW5nIGxpbmU6DQo+
IA0KPiANCj4gK3N0YXRpYyBpbnQgYXRtZWxfaGxjZGNfZGNfaXJxX2luc3RhbGwoc3RydWN0IGRy
bV9kZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IGlycSkNCj4gK3sNCj4gKyAgICAgICBpbnQgcmV0
Ow0KPiArDQo+ICsgICAgICAgaWYgKGlycSA9PSBJUlFfTk9UQ09OTkVDVEVEKQ0KPiArICAgICAg
ICAgICAgICAgcmV0dXJuIC1FTk9UQ09OTjsNCj4gKw0KPiANCj4gICAgICAgICAgZGV2LT5pcnFf
ZW5hYmxlZCA9IHRydWU7ICAgICAgICAgICAgICAgIDw9IFRISVMgTElORQ0KPiANCj4gDQo+ICsg
ICAgICAgYXRtZWxfaGxjZGNfZGNfaXJxX2Rpc2FibGUoZGV2KTsNCj4gKw0KPiArICAgICAgIHJl
dCA9IHJlcXVlc3RfaXJxKGlycSwgYXRtZWxfaGxjZGNfZGNfaXJxX2hhbmRsZXIsIDAsIGRldi0+
ZHJpdmVyLT5uYW1lLCBkZXYpOw0KPiArICAgICAgIGlmIChyZXQpDQo+ICsgICAgICAgICAgICAg
ICByZXR1cm4gcmV0Ow0KPiANCj4gSSBob3BlIHRoaXMgZml4ZXMgaXQuDQoNCkl0IGRvZXMhICBX
aXRoIHRoZSBpcnFfZW5hYmxlZCBsaW5lIGFkZGVkIGV2ZXJ5dGhpbmcgaXMgbG9va2luZyBnb29k
Lg0KDQpCZXN0IFJlZ2FyZHMsDQpEYW4NCg0KPiANCj4gICAgICAgICAgU2FtDQo+IA0KDQo=
