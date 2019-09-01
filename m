Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CF9EA47DD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Sep 2019 08:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725306AbfIAGMT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 Sep 2019 02:12:19 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:30813 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725280AbfIAGMT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 Sep 2019 02:12:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1567318419; x=1598854419;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xDIrxnuXWQ5SQxL0XSqyl+/YK8l7jYoBkzAboLdB7VE=;
  b=JjvKZdJdQ8M70KkNNUXe7z9L0g+2ENjlfHK83FuZVJbdQRtSyo0X2dip
   G9cItrmGEFGIypUdUACCk02yUx++3kAclapu37c2tF8P5TxY4KRS+maye
   j8YK8G1CHX8PD1Z1ZpCLx0kEZrL6hGITidc0MrLTmccFHQUz6L1wzebIp
   iGEMkOVZ2KmZXMr1RpWHaC32nfhDJClmsFh7hMvV4nZXWtWTw1/4YdOYA
   cStbtbRYOhZCplPKZ/yrHUPFjbETTfr+mqxcHyJXDYdtmKUJ3YGy67NI5
   C2SNqZJD0hlY0JvW3X6H0Z0swoIZ+nFUXY1kSxUDsx878HvHZTikd0vgB
   Q==;
IronPort-SDR: nGWBAh5MvPz9/geSP9PqGbbiqwNG9pc6rlpJmR8AVUZRSgxDULt45PMrPxAOFOsseToHeGfMQr
 HVPBcWzpw4Ekq81lduDVsBRtUxRieX8rmHrdPVtgKUoEZbT7BEuE/qVeWM9TRt7/uQOf/RYNS4
 V7/Sh4abJXCfTc0DqasvClFr1swKcxYHSteSR0eymgzoai9kUC+3gf+hsMIRqCV4sIxAf6suVD
 AkaAzJc+qA2C2oFU+/h11DMtJ/z13Vr96upqA7jXxUURnwb5r/QYydme8OTWF1cK+XDdgIUlDM
 cSA=
X-IronPort-AV: E=Sophos;i="5.64,454,1559491200"; 
   d="scan'208";a="217681882"
Received: from mail-by2nam05lp2057.outbound.protection.outlook.com (HELO NAM05-BY2-obe.outbound.protection.outlook.com) ([104.47.50.57])
  by ob1.hgst.iphmx.com with ESMTP; 01 Sep 2019 14:13:37 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmBbrDU66ohPiPyqO2TMXdb4j3KGkSNg1tKIT/bq+RB6Ygz911IFx3UggpEiYEwwtViKJYlikk7zQD80WczlSkGg3gsOWKKnWzA62POYiFs+y17OsLgzeLCmbmpJMpNbNlQg1JfURg7dbTQsGSBDhY6+/k1C1CE1a4p2+hMKUfHjHPhC+vQmhdiQAdnA5MlrC5LciHyH+GwazAuJuSIixb6JPei2JnaLbLjPw1xzhG4gxDMuf2Rbvy63bfSHaZgEG23wZR6o0raCd1Uz7hhsGKqY4h6mKyU/C5mvRBqTveJC1quvXsrSkhR9UmRIUZLYpi+U0MIYfYewAqzT5VIsTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDIrxnuXWQ5SQxL0XSqyl+/YK8l7jYoBkzAboLdB7VE=;
 b=cBo8AUaqooVn42qE+fTpsK26MORCB/G1TpIJ54/uAVegkI56LOWSRDQ+LUDGobSIgJ3b2lpBzhV8sBCjoYxdFyMeOnQw4DT2Azz/aNeGiBmWYc1guYVctlP4ySAYQLh4UU8+jEoQHfDqGb+cWb1DrTglaxWDJWGWO1Nvrb+ZWazCU+/td4Byj8e7p6LGRg0osrpFiWFMxTZYLgcHaSby5eccwpzLtobvHO7BIe4uoHkma1aggqI4tXg4FOLWTKvtw7oXjQB/CwUrp2cV8TRxNfP+ZSjHgGKssS5TjNyuDvIkMFLIYczNdXUfL15kvgoJ/BFthPhRCeClx04pE1j9jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDIrxnuXWQ5SQxL0XSqyl+/YK8l7jYoBkzAboLdB7VE=;
 b=aaU/HoU0uUk9W/GiAFu6LjJjziGoeBIXX3XorH9/srTHcfS0mZ8hXWPAm/q2ucRH35pRh2v32QxtF5QSJQtrr+7JPW94kqAar9AAo3sSgZeqVejy2EqeB/3YSM4mriFdTQ6jQASqqvvVss9yd3R+sAf1A3tStJTc5c65T/6OgE4=
Received: from MN2PR04MB6991.namprd04.prod.outlook.com (10.186.144.209) by
 MN2PR04MB7038.namprd04.prod.outlook.com (10.186.146.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.21; Sun, 1 Sep 2019 06:12:15 +0000
Received: from MN2PR04MB6991.namprd04.prod.outlook.com
 ([fe80::9c2b:ac1b:67b8:f371]) by MN2PR04MB6991.namprd04.prod.outlook.com
 ([fe80::9c2b:ac1b:67b8:f371%2]) with mapi id 15.20.2220.021; Sun, 1 Sep 2019
 06:12:15 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
CC:     Bean Huo <beanhuo@micron.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: RE: [PATCH v4 0/3] Qualcomm UFS device reset support
Thread-Topic: [PATCH v4 0/3] Qualcomm UFS device reset support
Thread-Index: AQHVXdVcVndtIrqA7kuEICogWXBJSKcWW9dA
Date:   Sun, 1 Sep 2019 06:12:15 +0000
Message-ID: <MN2PR04MB699135203C45147049130AB6FCBF0@MN2PR04MB6991.namprd04.prod.outlook.com>
References: <20190828191756.24312-1-bjorn.andersson@linaro.org>
In-Reply-To: <20190828191756.24312-1-bjorn.andersson@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Avri.Altman@wdc.com; 
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b4f4c177-a8f8-433f-fbbf-08d72ea35615
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:MN2PR04MB7038;
x-ms-traffictypediagnostic: MN2PR04MB7038:
x-microsoft-antispam-prvs: <MN2PR04MB7038767175C3D7B6351513CEFCBF0@MN2PR04MB7038.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0147E151B5
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(376002)(39860400002)(346002)(366004)(396003)(199004)(189003)(66066001)(6436002)(55016002)(9686003)(53936002)(7416002)(6506007)(102836004)(4326008)(25786009)(7696005)(76176011)(26005)(186003)(33656002)(71200400001)(71190400001)(6246003)(52536014)(5660300002)(81156014)(81166006)(86362001)(305945005)(7736002)(8936002)(6116002)(3846002)(74316002)(478600001)(4744005)(99286004)(2906002)(14454004)(229853002)(5024004)(8676002)(446003)(256004)(54906003)(110136005)(316002)(64756008)(486006)(476003)(66556008)(66476007)(66946007)(76116006)(11346002)(66446008);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR04MB7038;H:MN2PR04MB6991.namprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vSw8AvMuxRtT+8s6+HCUKQRZFY8ao1Hizk4Beo4WkvXbhftWo405KIogPwvOndGQBUnChTN5QjdyN/ZMdaqd66tic98h1fGBfVLDJdis0YuFCQceEC3F62WsadklScs2195/nvjsM09YdYIm29KM08gRZUO5x2z5Y/AO0gOLMbWAejMul+xvYD1cXpMQFu7W6uqKXhIzooHJWunC1CNAzzuQBSa346YqMmbCWWnB2u0t/J3/IWv61OP4Jdd8rWa7SHq/5wKoCRnt3mo8ugzdPjQgiRypVi36c+EO31LQbCrYHJmLW7qQOjTmZ5lhEEImcGzkcuMPp0RDs0/aotpFei9l4CBUUKniCfHGosYr6Nvo+RPOJuSVrFBg7ouxTahe1APH3eenb6dHyh6YVo7K27nYGd3KWfoUQrw/P5vivOk=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4f4c177-a8f8-433f-fbbf-08d72ea35615
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2019 06:12:15.2951
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7dZr/LZQH02AkKyOLgNt2NrzREMcqPo38ohwiHgtTKaBD06ko/5pF0ED60W7VccugN9O6OmIw5XZ8LIjSZ8bgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB7038
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,=20
>=20
> This series adds a new ufs vops to allow platform specific methods for
> resetting an attached UFS device, then implements this for the
> Qualcomm driver.
> This reset seems to be necessary for the majority of Dragonboard845c
> devices.
>=20
> Bean requested in v3 that a software fallback mechanism, using
> UIC_CMD_DME_END_PT_RST. I have not been successful in validating
> that this
> works for me, so I'm postponing this effort and hoping we can add it
> incrementally at a later time.
This series looks good to me.
Yeah - We can add and test the uic command bail-out once this is accepted.

Thanks,
Avri
