Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6736305449
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 08:19:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232832AbhA0HTc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 02:19:32 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:33867 "EHLO
        esa5.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232950AbhA0HK3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 02:10:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611731428; x=1643267428;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uCa2GMUpKz+2S5SNgBMzR6fSnZ94mL+mmLlK+vjuzoU=;
  b=has3bIYH/2TZdw18nHGBKcTGIFXJKIFeFOBWfrT/qd3NlLksdVTGWgW5
   y7mvAcc6KPrCGeFdIoca4rtshQv4W5gY3TLB052DqWNlzWxsv1WQ3iU1s
   VUwqzEGLxMBronzgpTWvZEuIA9cnLObdGTOq5rJ4dahPAf7r6cJkvTIte
   a8oWNGed1Bd5Z/ZlL4ASpOI3B3Wa5ULhoLe6R2pe7CrZsCrAznwPMqqmI
   IB/LOPK8nBAWAhCUTwVl+xn/zOTujq4Kh+WNiS9teC4P+b82TrqR9n9it
   USBr7UgeadPxqPMAzGmzX+8ArWxklzHXQOob2LP9L/L+Xvs+zoXu5i7j5
   A==;
IronPort-SDR: /1a6EppGGM7pxwM3sWej5+Q8xiXtwywOyy12wrFJ4ssaBJVw2SO8jjLyNxeSvxrIUxzF9VChV2
 S73vWuEt9LjdPdtFIzAOs2gH3GdtbfwXAXZwe0ad2VNV+QKdXVyUN6R6+05U2cuQSp0TEiSIcY
 SD3PBHUG8c1nTHyG1/KbMiT9TgKJZwdCwA6aTJv8UvDysQ2qv+Z+86L/kAeyeTTXfXRyzQ+Ts9
 l7jBcux8Q0BdyJTa0Kle/2M0crK/Hc1jQx3MAGwOK72YEa+4AA/4xjvzsTy1/GnekHM/v1kLWG
 AxY=
X-IronPort-AV: E=Sophos;i="5.79,378,1602518400"; 
   d="scan'208";a="158424717"
Received: from mail-dm6nam10lp2106.outbound.protection.outlook.com (HELO NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.106])
  by ob1.hgst.iphmx.com with ESMTP; 27 Jan 2021 15:09:18 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYBLEYfEte6uTRqsmAlzzbZ2KE8M1dKHwSRO3DHNcmEjFcMTUhI9aQC3H5XKRV5pj01d7cacDt9NxKElb2zuiwtJeBBC56CQg88yJ4mcOwr0ahDF1ZDzqObep3yrH17Burwaq6K12IL+273KxvbtyPhArmFOuK03/qfPfaqbJXV8NlG06VOtpBmPyQdLOVO0nt9tQV9n5Ki1Kmkf12/36fyMISxr2IrrI9YEN8nEL3C06BZuC9+cLj0KMghM1qfeSie/gVVHWGykSUPwi7usYgwVwqp8t36GZ+T4LGBbq2O2QcSQAuLvMNoH3opDaPAe324pzQYsKN+xAPNs7fZ2dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uCa2GMUpKz+2S5SNgBMzR6fSnZ94mL+mmLlK+vjuzoU=;
 b=Po3gyslE8io4ilXT2/aGjf4qi/T7cLVcfZBJYp/NlvtRlW8MHjX8crXFMb4Kj3qKF2CL1HjRtrpS13X47VaEJoEDN22yIIkGeoRLPhJYg/G79gZLDzpGzFm5j9fJDh8WyX0UGBccRly1OcRfb4g2OvLRWkSgHWZVuwMlT6uyfXXiwRLwPy2CF5FIvlj1J8sBbxoLvSTsvwKeJ1oSLMFgFwFDH5JMU39tn52JdXX50gPWQ4TkDvs+XCCFgsNdvk0Q94qo7kX7IsAbp9rbLqXNp243nTR0X3adHZdfQ39oVz/UMRrfr/pY+/DiSKm+d9JLTSRXZlXlBWtdkrUsfjE6Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uCa2GMUpKz+2S5SNgBMzR6fSnZ94mL+mmLlK+vjuzoU=;
 b=gqcIijBq1cHZD/C8UJWBnYK8es8kzwkJeMihrCM5y6Gv6OzbIT07XU/comDrNA1Tp6z8FZ3NpjKpjLrX8CHZevZWpbWQB9oogDleI4KxdXBb4LDGWzCt4LzC0BjKiWAc4y6GJkzR8yU2danAdvXUuZwP+sOKMmI//cPdITsdGuo=
Received: from DM6PR04MB6575.namprd04.prod.outlook.com (2603:10b6:5:1b7::7) by
 DM5PR04MB0410.namprd04.prod.outlook.com (2603:10b6:3:a9::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.15; Wed, 27 Jan 2021 07:09:17 +0000
Received: from DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::a564:c676:b866:34f6]) by DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::a564:c676:b866:34f6%9]) with mapi id 15.20.3784.019; Wed, 27 Jan 2021
 07:09:17 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Asutosh Das <asutoshd@codeaurora.org>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
CC:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        "Bao D . Nguyen" <nguyenb@codeaurora.org>,
        FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>,
        Jens Axboe <axboe@kernel.dk>,
        "open list:BLOCK LAYER" <linux-block@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: RE: [RFC PATCH v1 1/2] block: bsg: resume scsi device before
 accessing
Thread-Topic: [RFC PATCH v1 1/2] block: bsg: resume scsi device before
 accessing
Thread-Index: AQHW9GS91lSjV2CWj0GEr0fs2ZDDFKo7DS1g
Date:   Wed, 27 Jan 2021 07:09:16 +0000
Message-ID: <DM6PR04MB6575D64869B24B4275D63503FCBB9@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <cover.1611719814.git.asutoshd@codeaurora.org>
 <c04a11a590628c2497cef113b0dfea781de90416.1611719814.git.asutoshd@codeaurora.org>
In-Reply-To: <c04a11a590628c2497cef113b0dfea781de90416.1611719814.git.asutoshd@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0ade7e32-c65d-467f-e571-08d8c29275cb
x-ms-traffictypediagnostic: DM5PR04MB0410:
x-microsoft-antispam-prvs: <DM5PR04MB0410BAF648D04705D1ACCAF9FCBB9@DM5PR04MB0410.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:199;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tF/nc2nIaIeKN/uyPQY0uP5MxsWNG1c/PQ4VBhcbsyuxiQiIZeEdi13G7t46LHpLB0PqduPF/teKWSCabizJeX2mSbElA7Mscp6eLmWjlbwSpXWNb696jSd9XSqo9aQNwWFc0DhHDOgt3f/Ir2J7HneFVi5CxM8CED6sPl3tR9w0ziXCdXv8h9jHp9/nZsFj6NZqvFFkXITjZzdstifufVslXKWqRN0YW/W0NnKlpnDcnZwEe26kAEtaP9MtHJC3VxTjLnqH/Kjsh8fwQTOfwDoR4bMmpgmr6oL7Y+awPdg/UG31LMKNvrqYyfCxgfhYFdgtKa1U4uk3r6sRNl/+7/L8dbiII2UqwaLjWUcpmOaflITELCP4swlgt8aRdwswH6Le3z6LUX98N4KxfDHQAg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB6575.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(6506007)(316002)(86362001)(8936002)(66946007)(64756008)(2906002)(478600001)(186003)(26005)(4326008)(76116006)(66446008)(66476007)(66556008)(7416002)(8676002)(83380400001)(52536014)(9686003)(5660300002)(55016002)(71200400001)(54906003)(7696005)(558084003)(110136005)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?WqWjZnJiBN9Iht47imiHr0zqAbq3VTZqfXGYFPJCWvIgQu64VVgYq3t4f2Nw?=
 =?us-ascii?Q?LCogH7T2rtUBvMXYUdQV/UjvgtjYQCICxmiD+ZGyI/VaFW4hT7fqAqpGaR0v?=
 =?us-ascii?Q?Q4qZ/FuH60BcUWSLfUlhkOUu4cbqsNtFzzi2XI4Ygo9mgBpjg60ZMknUKaq2?=
 =?us-ascii?Q?XiCq+oJ3N/Ks433RY+0FFAAY5nStJkbxEOeYMTZm9p+itNEdsHXjaEf3WmL9?=
 =?us-ascii?Q?/7AFNMvuCLVTGrmJaPUd4zg7J4D8jRJuZvctrqxJjT+LcPuKWg2ARCu65nlS?=
 =?us-ascii?Q?cJ7+1VmJRwCwL16bMWJtgr3nSQKJajo8oz87BD5CrZJnowyw81HDNAQrW2v1?=
 =?us-ascii?Q?hvh+gtujMIUbR/LKw2IWB9E/zdcmRdkOQeNpcEOt73Zrk/VuQ89d+v4FqTO3?=
 =?us-ascii?Q?bx43VqDYhmrimmmzCRtASxGmWtCtHn8wUDFc4EwgQO0cTT+Ds3xa1Zyj4EFr?=
 =?us-ascii?Q?vEClvF24UxEAysFlkyuGZuDnacuB275m4iAruW4V/M0b4K/jCLeO+vjNz19+?=
 =?us-ascii?Q?EgzzgQJy5WvOzPlzUq8SeHCAseHuj9HROv+pUjrFa07CMB6WDJqDc+gUYR/+?=
 =?us-ascii?Q?4HTzJKWCXlzCQYBQjhPUZUMFlm0odJz9daY2uQZvjSGr+6ilhAYqAWvC5xXP?=
 =?us-ascii?Q?2re+uTV7Ku/4IP0w+QoCLUM6nlHReyHgi9Q2wOa/Ey0ppuLWn6RE7ikqYjad?=
 =?us-ascii?Q?FHSHkzVCVaNawir5PmlXBle6CVXm5D7ZUPwy0WCcYypweQcERNlG2UnRdOnF?=
 =?us-ascii?Q?TIDbt2ehZWD2lt+N2Z5Ur3hETtAAIcEslgksZPrCwLNtiS8oBBaCfCwBoQci?=
 =?us-ascii?Q?APsoOke6NTvikw+Q+k4QtywFfTqJc4AjhWENzsq7wxHbZwGOTYMG8iECXjcC?=
 =?us-ascii?Q?0rJwdf6vZ+NAkNoaq7nHuepU8rZ+uyErQyouWBa5Sw9mnQDnasOJZ6ytS9AG?=
 =?us-ascii?Q?cxfV3+3NUi2L8HcfC6SgVS+iEEPfufIiMpZDPdTR9/wGDwDsOKtbOt62SXtO?=
 =?us-ascii?Q?V0bD4cwTHiCfgr/BH+uqyn9ZxTFMUZWAoBqpF0Brz19CQuqFlKDPZH8Y1ykf?=
 =?us-ascii?Q?DU6Ti0xr?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6575.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ade7e32-c65d-467f-e571-08d8c29275cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2021 07:09:16.9384
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D939hl67ltLeqPTRphTG+0bOsKG8AeCQEhTnk+IHXesF1MLqPZ24hOG9DwNOxwZU3rHYXwelXaLObvxlachRcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0410
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

>=20
> Resumes the scsi device before accessing it.
>=20
> Change-Id: I2929af60f2a92c89704a582fcdb285d35b429fde
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
> Signed-off-by: Can Guo <cang@codeaurora.org>
> Signed-off-by: Bao D. Nguyen <nguyenb@codeaurora.org>
Following this patch, is it possible to revert commit 74e5e468b664d?

Thanks,
Avri

