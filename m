Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F00C68737B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 03:59:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbjBBC7d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Feb 2023 21:59:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231371AbjBBC7b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Feb 2023 21:59:31 -0500
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2106.outbound.protection.outlook.com [40.107.117.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB42A39B91;
        Wed,  1 Feb 2023 18:59:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DU7gUFgkMJDkBY2ZpMxKbdKHtWCvyVw1wFkO0mSqVxSHcPd7Avka6hz87s4kvO+c49XchoJg+cFSJ7gHEDdqiHWHuQ1i2HBkzhjA5OYqRt5YK3vq1OjVLNXyuXIAfSb5g4ihj86BQefvCQ37CNaKnLDKdAIu01xXcRTFDWjKR8ib5F/2zA+/wKkpOzyozqH4k1ZlW7yI2ko9KS+DAy8bCHtMysyjubiNMCxBRlOmoLmy3JdupcvHrIW3kKL/8Ji0I3TETsU1iGrp0/XgZBFRcQT0wND9wnn4ybV8UkbkyCLG23MlayJ1Q6k3qvvMlIUXmRLAvzQ7AoW2TonMpsYksw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwmYgmsvrXVf/ye8fcTFO0/kkTAM3I7aGPkv3SAs1w0=;
 b=Va9tgY7wUexHhx9/AMa6K+vgMusZCr5AgtAcufStaHuul9IZbmbbZGcZx0gKHxUNK+0A5Soy57Xpd2XGWNRHE8krYT6buEm2oAOtw5sJZmrMuvFSHGIIWRQXqKshnCx7pQa3G5sR/SWMdnb6NpHm9F2jwcjQpgigjfsd8ufNqRxibfBVEyz0d1umVtNk8EUxIO4g8A7+FqqKFdYZaWrdxN1YPHP5bwKxT9SUKSbmpY0kMnP7AkDhXLv5szCx/s7aG7AKc39ycG6U8s+auEeQdBQalUYUlTSjfQLZsXHeN4/8R38j708k8H/+bgf+c2+YY0Up49lddittl9q4GQt69A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwmYgmsvrXVf/ye8fcTFO0/kkTAM3I7aGPkv3SAs1w0=;
 b=zjdz91GTH3Zv9l0lUjneMtU2oZ/q4WWLy3kTC4u66qJ12lglC3WQlQWF3i0LRm1TFW+HJ8xnpTOdOtGj1NZlRl5FkoyytPrZDkbtW5iE9jV4EzTR9BAn/UORYawFjBeqqEOAVD2YlPJZUuVNHGPOae7BmVsLYsb3aIkQ1tSzS0xJXgWAlPaOTP3UvtMcZqJrnIApa5V/LaGXff4K0//fcf6kxLcStVFcgy3HaQso0xxqo3a7bUKg0c2etgnUtUmUT6y6CG7BS/9ukervD8LBIEOCQzbw36IiynII3SZQdP5K2jUcWPK9FUVld6aBXUWDYnz7IW+wwX1T8C49x03Vgg==
Received: from TY2PR06MB3213.apcprd06.prod.outlook.com (2603:1096:404:97::16)
 by SI2PR06MB3929.apcprd06.prod.outlook.com (2603:1096:4:f9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.7; Thu, 2 Feb
 2023 02:59:19 +0000
Received: from TY2PR06MB3213.apcprd06.prod.outlook.com
 ([fe80::b113:70f9:7dc9:543f]) by TY2PR06MB3213.apcprd06.prod.outlook.com
 ([fe80::b113:70f9:7dc9:543f%7]) with mapi id 15.20.6064.022; Thu, 2 Feb 2023
 02:59:19 +0000
From:   Neal Liu <neal_liu@aspeedtech.com>
To:     Andrew Jeffery <andrew@aj.id.au>
CC:     kbuild test robot <lkp@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-trace-kernel@vger.kernel.org" 
        <linux-trace-kernel@vger.kernel.org>
Subject: RE: [linux-next:master] BUILD REGRESSION
 66eee64b235411d512bed4d672c2d00683239daf
Thread-Topic: [linux-next:master] BUILD REGRESSION
 66eee64b235411d512bed4d672c2d00683239daf
Thread-Index: AQHZNqLYPleILitAVkyvMXcyMi0fNa669sTw
Date:   Thu, 2 Feb 2023 02:59:18 +0000
Message-ID: <TY2PR06MB321334CFD4ED1BD4AF97965380D69@TY2PR06MB3213.apcprd06.prod.outlook.com>
References: <63da97b5.3V1HSQEat507LFIr%lkp@intel.com>
 <76f4dea0-9a39-4238-a213-0167477f5d54@app.fastmail.com>
In-Reply-To: <76f4dea0-9a39-4238-a213-0167477f5d54@app.fastmail.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR06MB3213:EE_|SI2PR06MB3929:EE_
x-ms-office365-filtering-correlation-id: 0000665a-9487-4af9-31d1-08db04c97a6c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BKb/ldn1nm1OAwkJG1HF270esNNM7v92acGqv7wuSpZHAd2NtqCjUneNWbyPOoVEE7l/CfVix4kpFhjsdZUYMw0BxCqkcvbnaiiJY3Vq92r3RffwV/8r8wEjVeOcs+3wf/+8/U/imFn0UhlGrzUzsMGQFOD8gwSOrxHJYwXbFzk+KB6dM6Ehct5VjH3ypj9T2ICr8+oAqgUDRJ4pcJ8Wx6mXn6OzrGT6ck6RtUZYPT0XMKcqOHrdPjc2Q8U4q5tPfHyg8dMEG9nU7iDEadup0BZYynv5OWxCnwE5zYCf97BWz8hNnWVHMg6Za5ya411L8JD6IYc+0OyFJ2btp+iiAHJA9J1RqFvRPtuG5YrooLZZEpC018mKFSpYor1xd9d1CEzvSuXA6Oj9XFoNSSsBz+mmbfqRYdZGQhR053c3GuN6DdGTsuUBDDFLBuYeZRAVWsQEjwAQ6vCbNyLAJYdHHPvdrOPkck/Q6HewWlgindNTeajNXYQLwSoN2aCgnnUuO7M1RuMz4lxDPxHeZWq/653ltHLjLA6/YeMrdLrvy02ycEpH1kzPdCDjyRzOEa1ndIFFclmjlz9Rko5p0TMVSmNZaX21zTqWmEFT0J5lHOu20QcO4T8jHba/Ey/2uCNio+gfe9ugF8tB8itlAJYqqipMDlKt2txKDZwx/DSatVxmXdLJKO+2RvNtmBpaqmLcWGnugd03Mw55K3VgDnGatPcqtQuRiV8KMppU+PiVDVg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR06MB3213.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(346002)(376002)(396003)(39850400004)(366004)(451199018)(6916009)(8676002)(4326008)(41300700001)(64756008)(66446008)(66556008)(66946007)(66476007)(76116006)(86362001)(38070700005)(54906003)(8936002)(38100700002)(5660300002)(122000001)(7416002)(52536014)(33656002)(316002)(55016003)(9686003)(26005)(71200400001)(186003)(7696005)(2906002)(966005)(83380400001)(478600001)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ElUlFQ0BxtxBRmDV5JTfD1Yp/0OgzJIB1GxO0twWmXi+D82QwQ1wpiuurf3y?=
 =?us-ascii?Q?Pc5b2kgVDI0oVuvs6CEvgn7hqsDMTSC4xU5wGUB7YPWzG+xJhMrPtzDsbWTC?=
 =?us-ascii?Q?yCGjQ8Vu90sGEs7I2T/f0INspMZZWviH2AS27HNZtPtz7Zn7ex2bgnFRJ1TB?=
 =?us-ascii?Q?lvZO49JsU/BGUeq453+mk17NLB+F97FsE4L2FXf7mk+7uHQW6z3Ef8oD7Bdb?=
 =?us-ascii?Q?QpAh0m+V3IeVN/HBPv0Wvy3kLJiwKFVlN0HeweUSB5pBRwlAgpdhKQxWMQGm?=
 =?us-ascii?Q?/8R+Q1VUcl/+CuBt6rXrPg3THhtOoC2GFemU3BSQ/rJCo5eQFQB0iGWVO5by?=
 =?us-ascii?Q?DLXbjx+LqWDDMLg2MHa4nstjmJreDpo4B/3Pl79QdjL/TmfvOeEHAbNv56jz?=
 =?us-ascii?Q?3DMoKpOMWeffgjOPrOzYlXzE8SbHFHf9pAowEuvNVjvHwKrHGgXnKAEhDNHj?=
 =?us-ascii?Q?YeGE9VwEki9P44nTkpz8+xOLIm7IEy5t1uulZhDGBMRkCfZkRHiwqzoXBsfY?=
 =?us-ascii?Q?AVKGXPPsjNPRl/agfccuid9X/Dt5k+1VLYqlYKDyrGzi7nrkZz0/dn6DduHS?=
 =?us-ascii?Q?FBmHKEgJofTrrtPekwg1iPw+kwvXr/Bbian0zkMvKkfaClf4mCzuVMHiDg5S?=
 =?us-ascii?Q?P4JObLzkqxIgQchXq7+oDD5zLKSNehXGSQ+avDbws4S3zvyhwg/QlsnGVS0Z?=
 =?us-ascii?Q?c4JSmzPJDmIIBfDuaHMLjf1nPVKvDUTSnQUgoSkxNw6Bq4crJAE6Hk86vTTx?=
 =?us-ascii?Q?JguY04ozKr6KuqJ3KqajDoj7gQZlDeV2tDhXvevaBl0ECtz8PEz1GaJaiF3W?=
 =?us-ascii?Q?pf5sFMudFH2kgpQBqOvAZ7aWcB9kIpkDA/406yUI+kFp1rpLwqaoTztQ0MEw?=
 =?us-ascii?Q?jozUmq5DNG3ADAUnMV3JBEFTrkkAUiRAguBMp4FuhRqfMkn9J9vYdww7MZDT?=
 =?us-ascii?Q?hTueL2Mnz1GZSPd1tCpX9pUQdf/DCXpLGMnUeU1NaMeOOzpj1Z4+PWcZH04Z?=
 =?us-ascii?Q?J6vqsx2tfvgzCgoz6LyfSn9yI/qz86XOgpabKghDnjUQ8jo5f55kwL02Ppm6?=
 =?us-ascii?Q?yBVdbyDVfvOmTZav2t4Ue8lH/mSLgstylxZW+GTUG8ZfFvYg6msdhOMsJ+ZB?=
 =?us-ascii?Q?hw30U1hPsqkm2brR7a6GSt+tpuL7MTLIw3SY19yPi1oEo0fNVb01wOXAY7CV?=
 =?us-ascii?Q?d+ehLh+XS+2oD8Z3TrYbGnJZnbA/ve05ZGdgzwrIj+KiFK6o9tyJx3dYXTzq?=
 =?us-ascii?Q?eOFec54oIcQsdp6NdIFal8b1kyo7kpoPhyc1EGEvLjK/0+n/Il8f2BuNuSix?=
 =?us-ascii?Q?EsGahXMmYR4DPfY8J5LtkSMig0ECxriuwkEbbDzO3/g4plK2KdPAcjf9RChO?=
 =?us-ascii?Q?K0sCfrzCmQqm8SdIpPIHk2o4p6ophqjbIiGfiisf9CiVVLatzDCebPZrMgeP?=
 =?us-ascii?Q?ozKdP4XqxF/3K31B8QuDyYNdIjEoxp5ggGKbZ5tPiKp1fQCKm+WWJ3jekr6r?=
 =?us-ascii?Q?1ZAg/1hvC8KH1So8GHKBCKrfmqWYH9MQmlVVfKGbh0EO+LnlDIcaCA0lHtQY?=
 =?us-ascii?Q?bvQmhs/ue8o93QAceZtCQt4KSbhLaW9V4UA1ZPry?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR06MB3213.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0000665a-9487-4af9-31d1-08db04c97a6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2023 02:59:19.1437
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zi3FHqtDe6U3xsU9SGyghQmZl5G1QkFgVNgiBJgiosg03YiIbL4vAZtIRQdTTM4CbmblJjjWH635XwZsdReyPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB3929
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> Hi Neal,
>=20
> On Thu, 2 Feb 2023, at 03:17, kernel test robot wrote:
> > tree/branch:
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > master
> > branch HEAD: 66eee64b235411d512bed4d672c2d00683239daf  Add
> linux-next
> > specific files for 20230201
> >
> >
> > Unverified Error/Warning (likely false positive, please contact us if
> > interested):
> >
> > drivers/crypto/aspeed/aspeed-acry.c:295:37: sparse: sparse: incorrect
> > type in assignment (different base types)
> > drivers/crypto/aspeed/aspeed-acry.c:305:28: sparse: sparse: cast
> > removes address space '__iomem' of expression
> > drivers/crypto/aspeed/aspeed-acry.c:606:24: sparse: sparse: symbol
> > 'aspeed_acry_akcipher_algs' was not declared. Should it be static?
>=20
> Can you please look into these issues with the ACRY driver?
>=20
> Cheers,
>=20
> Andrew

I just send patch to fix the first 2 warnings, and the last one warning is =
already fixed by another patch.
[PATCH-next] crypto: aspeed: fix type warnings
https://patchwork.ozlabs.org/project/linux-aspeed/patch/20230119014859.1900=
136-1-yangyingliang@huawei.com/
Thanks

-Neal
