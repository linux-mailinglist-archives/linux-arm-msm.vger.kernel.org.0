Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FB09FC20E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2019 10:03:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbfKNJDQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Nov 2019 04:03:16 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:10850 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbfKNJDQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Nov 2019 04:03:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1573722196; x=1605258196;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YI7Naci+p2YfOHAD6iPg72R22MCSYXBw1MF9ZIwgUwg=;
  b=V6kTyEY80+nAvTqJHGwpkKh+0elYxIXIGbiXjyrtoWRxdLAOeNTP02Hb
   mDn+6MwbXzc3fooZCVJSKRi+bMO4Axaey8NjtKPm16OGajrXMl8j4X/E0
   Y8JVDN2oObINQuMou2B0CF2Cg23AJmcAebAOz/jWCrKKOuCMnWsT+benE
   42lyxS8C9G4T2rJ8vBpyeAXAJAlXqlJRbOfqf/nnyamEG5tHFFtZ1D9um
   +Ljf0GfaAbs2fay2dLghPHWat9GScwODoLlxdhx0RHvk+W5PoYnLOQ/vZ
   Azw63UfuhZEmtzCCBzRTKMTdhMvZKsiYJSSukNMHf0Pws4SIm8BfrHkt6
   w==;
IronPort-SDR: 97pRY4qKgCbI1m7AjL66TEzIPR6RnIaMc4KnQkX+NAHKslzuhT10TXT5by3IRIGS53y/IWT3IA
 WTuFIG4emAUskbz0FKxoa47yTjhpKTBr3JTBNPiIfi8FLkrf4deJ6ga6fhHXKbyGPB3DN5rkOZ
 YpRbAJax2ivFhy82kfVYwFOV5d7HqAWdAyxT538IsFWRAAhNir0mjCiUnCVn8oX3CIBl5pB2ed
 6mmWb930BIDdVb6+sTa+rJD/whhqy8j+Uu8SlyeC0+au3g6nB1PW2pIs51qtW/yVhfcawONZ6m
 YSo=
X-IronPort-AV: E=Sophos;i="5.68,302,1569254400"; 
   d="scan'208";a="124622417"
Received: from mail-cys01nam02lp2053.outbound.protection.outlook.com (HELO NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.53])
  by ob1.hgst.iphmx.com with ESMTP; 14 Nov 2019 17:03:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RUdTIWb9xAPl/p+HAxDEbMW4vsqEM4HOtblZH7Ot28EL9xWZ5escNw2y2s5LWPYVjlBvIjcQmvWQYfx1VlBdWcGby6bKGGp8uw42BbcvHTBB2OEqceMxLQTjnAbtAmY36mWo4MoU+RXq0lLdR/8iPVKp2PAg7ODFPFryPX74UnvVL4v9/ZNocak25goaZ48NlP457V2/xhMNejOEgf2DSVJRp4wZ3ba5xMPb5BUPdrbmuW4O7ohGSxWIH9UEIPMW/CrxtJUrWjcE/SzUY+4xDz/7ZGi2ie/35hIWTltyLrUUB8QgmM+2U/R8SLjlqcDxUsTCvT8y0LMkvSeMf7JGSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33NIS4SwadOfOHjiM1Z/DaZ3caJFEsi0VElTGTCx7pQ=;
 b=H1jCVtEHb1AgsCVw+buXBtctknBEjR9smpydHkSeYi2sFQ3rho7Ydo+2XwbW0DIhUx2MnQknnqhj2/02ICMEspGLu+7TnkQFcDyfoEN6czCAigEXFYatZEoJuAoCUvbe2r8nE/qfjkHA3sJW+IDsWYfya2ojbeGBh4FtHfbjrsCGkZ0UjLRWiBHrnNhwndU1t5xi9aOBgkasG91AuTu7zJUefC2KLTCWYPyZF90auWtb159xNPP3YZYx3jGAUZYzpjRvkI4nyz3+hXT6RFI2xCK7jMsnK9kaFG5Oz4kXKe04Qo+nIj6xutyB4sAUAJRA1doBQiRSWuMi0sFYvIfj/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33NIS4SwadOfOHjiM1Z/DaZ3caJFEsi0VElTGTCx7pQ=;
 b=XuKaWGDn20KB3OumAEA+p5ky+ulWExrlPcS9c6RjrMXb2ZM9AQpB4iaY8pjlYVMRGpaiwTep9AviFqNld34YglJ9llve2TjDU6FkJv+5L8nmdpx40MDs43yyNZc5MlKlOqd8YJwUUjSAiGE0ZxdFEdXpMM8BWt9Bb2rTd7rhYqY=
Received: from MN2PR04MB6991.namprd04.prod.outlook.com (10.186.144.209) by
 MN2PR04MB7102.namprd04.prod.outlook.com (10.186.147.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Thu, 14 Nov 2019 09:03:13 +0000
Received: from MN2PR04MB6991.namprd04.prod.outlook.com
 ([fe80::5852:6199:7952:c2ce]) by MN2PR04MB6991.namprd04.prod.outlook.com
 ([fe80::5852:6199:7952:c2ce%7]) with mapi id 15.20.2430.027; Thu, 14 Nov 2019
 09:03:13 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Can Guo <cang@codeaurora.org>,
        "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>,
        "nguyenb@codeaurora.org" <nguyenb@codeaurora.org>,
        "rnayak@codeaurora.org" <rnayak@codeaurora.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "kernel-team@android.com" <kernel-team@android.com>,
        "saravanak@google.com" <saravanak@google.com>,
        "salyzyn@google.com" <salyzyn@google.com>
CC:     Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 2/7] scsi: ufs-qcom: Add reset control support for host
 controller
Thread-Topic: [PATCH v4 2/7] scsi: ufs-qcom: Add reset control support for
 host controller
Thread-Index: AQHVme4abyNW2mq0C0+96JxTUVeHeaeKX+vA
Date:   Thu, 14 Nov 2019 09:03:13 +0000
Message-ID: <MN2PR04MB69918A580EC558ECF3FB2748FC710@MN2PR04MB6991.namprd04.prod.outlook.com>
References: <1573627552-12615-1-git-send-email-cang@codeaurora.org>
 <1573627552-12615-3-git-send-email-cang@codeaurora.org>
In-Reply-To: <1573627552-12615-3-git-send-email-cang@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Avri.Altman@wdc.com; 
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 65f9a2fc-af30-4b61-b92e-08d768e17afd
x-ms-traffictypediagnostic: MN2PR04MB7102:
x-microsoft-antispam-prvs: <MN2PR04MB71020BED771A42CD7CBAB8C8FC710@MN2PR04MB7102.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:923;
x-forefront-prvs: 02213C82F8
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(396003)(366004)(39860400002)(136003)(376002)(189003)(199004)(33656002)(7416002)(26005)(7696005)(305945005)(229853002)(5660300002)(81166006)(81156014)(11346002)(74316002)(54906003)(446003)(6506007)(186003)(8936002)(102836004)(8676002)(110136005)(6436002)(52536014)(76176011)(55016002)(316002)(4744005)(76116006)(25786009)(2201001)(486006)(99286004)(6246003)(86362001)(66476007)(66556008)(66946007)(66446008)(64756008)(71190400001)(71200400001)(14454004)(66066001)(9686003)(7736002)(2906002)(3846002)(6116002)(478600001)(256004)(2501003)(476003)(4326008);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR04MB7102;H:MN2PR04MB6991.namprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yHA/Wwg5QM63z4ERi9/dg86MpZe2FRdL3NDwvFsiCMVXUnetQG1VpWAXMA2B4Aj6+mABhUgZK3GnlUsTeyhHdqKs/wtSHGIiGrueJ6UJ/v0WruOeQFN8CHBGibLObk7IwQZyAmP1UAekzN99oJea2P6df82n8b6ReKjax2Lk6LGlWwACDTpBvGk4PSYLkNPjO/5x0citRoa7Q3Ba/VZXyW/Tvj8ivFPNMgXkqUlTM3OXQ8MZdqz6ovpf7cfOEJStIGGE/KgT4IJpxxXnNugAP81vcBrK09FKvu3vC0hLQLWIYneaKlTLRFfG9MnXyGAtrvAv/ywT7R/MlXOo607piTSJDc7csEypk/DpwkAo5FivsFe53RoIv5rXr7PqBpeJTzenh/Xc+utS5OkclTZQte8Ke/h23wPK2tLLGIOQzGWCJh0f5qJOND41y1Ma9T4H
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65f9a2fc-af30-4b61-b92e-08d768e17afd
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2019 09:03:13.5278
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XcBJs8IkamHnYiOZLNwLnWhnjff0P4JsdN63AVcKfDVfM441ghZIU6HbeRpGgaS+5f9I/gfnyWRAX856vUzhnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB7102
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

>=20
>=20
> Add reset control for host controller so that host controller can be rese=
t as
> required in its power up sequence.
>=20
> Signed-off-by: Can Guo <cang@codeaurora.org>
> +       ret =3D reset_control_assert(host->core_reset);
> +       if (ret) {
> +               dev_err(hba->dev, "%s: core_reset assert failed, err =3D =
%d\n",
> +                                __func__, ret);
> +               goto out;
> +       }
> +
> +       /*
> +        * The hardware requirement for delay between assert/deassert
> +        * is at least 3-4 sleep clock (32.7KHz) cycles, which comes to
> +        * ~125us (4/32768). To be on the safe side add 200us delay.
> +        */
> +       usleep_range(200, 210);
Aren't you sleeping anyway in your reset_control_ops?

> +
> +       ret =3D reset_control_deassert(host->core_reset);
> +       if (ret)
> +               dev_err(hba->dev, "%s: core_reset deassert failed, err =
=3D %d\n",
> +                                __func__, ret);
> +
> +       usleep_range(1000, 1100);
ditto
