Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF531193476
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2020 00:19:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727430AbgCYXS7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Mar 2020 19:18:59 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:16884 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727389AbgCYXS7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Mar 2020 19:18:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1585178339; x=1616714339;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0+reXjAV3EtWXsBLTHBTnR+ZVZZfsQvG9OVC8cNvYtU=;
  b=MfqjZ5UJihy3Xdhah859c3Zh2M4h2UKK58HfjnKZyK4RQJDPxVAn98rc
   K4SQQfLIxtvBAwlKl0k2GDmCqi2AzewVtIztKippiGGSCkJekdUGDYSpV
   j4xln5HuTDl7NwMZEpt+mPvCkX6BytmU19R1BLIE8TMEdyw1l07yBx/Or
   wVbeWrg/LpwODoVaNRn1XwvBzK1L2SKqL73fb25iNYG82eYh55wcrpdpg
   d66HHw5bgRV+j4tRxloP0mYWaTjSZghxJE3mf7wWxVY0Si2Yx7sa0uieu
   lAAO3uaij2Rsmx6R6/W16D7Ci1cOOSmGZ5OMN2ovJOWDI3xfr2xaxCBpk
   A==;
IronPort-SDR: +FqglFFP8+gGQHRljK6LNPKVSjyTRVB5oiabW1ZOkUyCdp5d3nlQTBH22ZBD6Y0fvyyA+sM77J
 YwceFKakLEAHB4eGQVTOSm0mRhLHEmb3ilAT5l4HBz1fFInyeO2Vfj7AphcKmlgOy6I9kei+fm
 7GmnvlO9E7ZW0OxCCg65hEdJFIZazwCA0E5cSTNPtUPYXBvDeQOzDW7NRZgTQ+TSfZ20apmRiV
 Hka37XkVC3eAVYpji2h9ip/10Zqav2JAlhzc2zNI7qc/elsCtoOGfDmmtZwaPH8nmrL4y5FNw9
 5ro=
X-IronPort-AV: E=Sophos;i="5.72,306,1580745600"; 
   d="scan'208";a="134953996"
Received: from mail-bn7nam10lp2107.outbound.protection.outlook.com (HELO NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.107])
  by ob1.hgst.iphmx.com with ESMTP; 26 Mar 2020 07:18:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LrAXZcL/v6Pp9Fb8lIDXlBwY23Vf2LGFJaHeONWXRO3qIx8v4e/sq0kr1Pp8XB5X1CO/2PjNkDNqwlgBI8HCVYonurflQTUCyGIZvD8zv7oSo3Rh+54Xm34XT1pF+tj1c3M94wRU8zvjPaCmlKx9Sj/VCwLgzHkf6jKwXtBnMaTvlSunSro3/r5KsnqiqtimMTN1kumCDiJSzfTJ9PKok3Wkb6ZC0cQoWmJW7cBdySTJ7ZSJgenklPhq+YWy6qLk7+WWdNBHKHg89qp2Y8/xQXqnbOqbDytwJvOBQ+FEfijVj49gsJ8xq0S8e9TEmvkGBgO4t22JKgZc9gNRElD5qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNjE96yv2aEiyYl0C32OgA1WBC//0tbZvnTNf5AV9GM=;
 b=EokhjzKXxEikQQ2Du/HgIjtAU6uh3Ht8M0nd2bmKdm0aWd/DTdcEVfrsRdp0BFctOWNIb/YjrnNAMl0ROjo/sjPItS1Qz7VZ/Vl+64MMkLcmMfMDGjUYAAxQMcGF62ld80nWbyqFjZBjYvCsrTuihaUi9M0U73kHzn9heh6YZXTAEJvqHwSxoTO/gPS5T6iAFru03OQytZnVz0CGD6UgVGUbBLQY8hJC1qNxvUqyrfTzwZjSAhO3LYO0+dmv8o0Ix0wwA14hMauttaSRSHQf5wMRuWHRU1ZThn2xz0H7pWgAc9P20q+uD0Q9GqEUo63Hiu1MNUrWCvQBv/48GrAQfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNjE96yv2aEiyYl0C32OgA1WBC//0tbZvnTNf5AV9GM=;
 b=wYkzF3idWnAQ08p5jJBkgBhX8Hm9ebMnDoQFyAieCZir2J424bdeqc0gEFvgqF6+6Yqs5xwTVd0t+FT2RLkeFiut3B3ZT6FmLWJpVoJ8HtQgfeQ8+s7AHkCaI8ybnatbWnj5Z9eG9XFUuoBlXEFzmRpWWc3TcK0sM4RyDivQBXo=
Received: from SN6PR04MB4640.namprd04.prod.outlook.com (2603:10b6:805:a4::19)
 by SN6PR04MB4446.namprd04.prod.outlook.com (2603:10b6:805:3c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.15; Wed, 25 Mar
 2020 23:18:55 +0000
Received: from SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::3877:5e49:6cdd:c8b]) by SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::3877:5e49:6cdd:c8b%5]) with mapi id 15.20.2835.025; Wed, 25 Mar 2020
 23:18:55 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Asutosh Das <asutoshd@codeaurora.org>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
CC:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: RE: [PATCH v2 0/3] UFS Clock Scaling fixes and enhancements
Thread-Topic: [PATCH v2 0/3] UFS Clock Scaling fixes and enhancements
Thread-Index: AQHWAtNOUdJJ+4cVSkWM68cN4WzoUahZ8Hng
Date:   Wed, 25 Mar 2020 23:18:55 +0000
Message-ID: <SN6PR04MB4640E428E281A381725CE5E0FCCE0@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <cover.1585160616.git.asutoshd@codeaurora.org>
In-Reply-To: <cover.1585160616.git.asutoshd@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Avri.Altman@wdc.com; 
x-originating-ip: [2a00:a040:188:9241:9963:f968:2096:7a55]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 35291fd3-1adc-42f3-527b-08d7d112e3bf
x-ms-traffictypediagnostic: SN6PR04MB4446:
x-microsoft-antispam-prvs: <SN6PR04MB444635E60FDA1FAA80DB0319FCCE0@SN6PR04MB4446.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0353563E2B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(136003)(396003)(376002)(366004)(346002)(71200400001)(478600001)(66446008)(66476007)(52536014)(66556008)(186003)(64756008)(8936002)(2906002)(4744005)(33656002)(9686003)(316002)(55016002)(86362001)(5660300002)(81156014)(66946007)(81166006)(76116006)(7696005)(4326008)(110136005)(6506007)(8676002);DIR:OUT;SFP:1102;SCL:1;SRVR:SN6PR04MB4446;H:SN6PR04MB4640.namprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bWyyXVUShgjYFJB6JYe5p8kENWwyJq6TY3v6K/vNLqmC8wAKUQgoQHejVaMTkNOUSECCYhhU62mTuKlDVTO7T6tFknYUtDjNsf3cxAhbhnehquSjVhXmNMUluMi+Z2OZ94eukf4ooz5VR/a6FBkireoenba+GZo8uu1s2YFNflYYY8m9bEaHmNO6M18RT9iE3A6aZHm2wApPbBFWkCuBccGzNVuqxqww+A4Ul/xT1NLoWsyDytiq3qKnCBOSoMzZHhh/nQx4xkG/OyKbnVyVEvU/m3ob36OBkOzFiUZN4HeZdBcl4BR39+czWiZyX8/pphMTl6OMMPQ+2jLXs2e0NzJRnIsyQzRgNYt5QsUU+7+NSceBA+f5KfJSExqPpoC2Pct4UrnBkx6uWrSjknUpdRH9M2azwsIRHyATPgavhxAGgNZkTlSPPqGanKpRWtFH
x-ms-exchange-antispam-messagedata: UwEQUTJiAUhdsvJCC8A5hAhhqvOOTao6P14oZl7BF4xCjaNV6/MrTv3URaqTzSgsjUx+iXSKkVE9TxagyraoHTdIyXGr3zVBmz7JnQgE5WMdWdVt2Lybqowu1Mlct+MuPCiIPYVVu1EwtHsfzSsKkFtkyFau1IdP5RzMvfv2WCUzv0LkoUvzBY5WdQmerYxWCWpLrR8qLVT2WRZgCJr/Mg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35291fd3-1adc-42f3-527b-08d7d112e3bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2020 23:18:55.3803
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cPMuIxBuAn2Mk6D7MrziExDRpBltxf+o/nGn7/H2h3B1j7A7VqT06Xd1OhhsSeDYLOEQHEYBvlslWcVBfqwO9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4446
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Looks good to me.
Thanks,
Avri

>=20
>=20
> Enhancements to clock-scaling parameters.
> Few bug fixes to clock-scaling.
>=20
> Changes since v1:
> - Addressed comments of v1
>=20
> Asutosh Das (3):
>   scsi: ufshcd: Update the set frequency to devfreq
>   scsi: ufshcd: Let vendor override devfreq parameters
>   scsi: ufs-qcom: Override devfreq parameters
>=20
>  drivers/scsi/ufs/ufs-qcom.c | 25 +++++++++++++++++++++++++
>  drivers/scsi/ufs/ufshcd.c   | 32 ++++++++++++++++++++++++++++++--
>  drivers/scsi/ufs/ufshcd.h   | 12 ++++++++++++
>  3 files changed, 67 insertions(+), 2 deletions(-)
>=20
> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a
> Linux Foundation Collaborative Project.

