Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98BC1267EF0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Sep 2020 11:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725921AbgIMJfu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 13 Sep 2020 05:35:50 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:6620 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725916AbgIMJfs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 13 Sep 2020 05:35:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1599989747; x=1631525747;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xWqjze8P1yDNb16w06XMv4ZuuurMW6tqzS973vPMU7k=;
  b=gJjA1N2FbO6U4jbmZCM074U+4iBiF8w5WsR7yCe62JJrsjvXUf6ZAPxl
   ModiSQGpdfexruFuVbt+jiw+A6ydimQN4JoeGVJB/wNax5N8PKGfhzro/
   qJ1j3wYlWvCvXcQLKr2Qxet7laZnvgIiFgnZTWfbLRvAdo7Zz4sNXkiXI
   EvWmt/99toZHGO1uf7VX0XE5ndAmbS0EVFgEc1UUMawaPTMKJ3nzkNI4T
   Q3oXz2FNxsP5Jx/aWpnMbpuSr6wK6MHV56XVAhjlZR7EZmg05z7VSgt4p
   VFhAo7/P/cKuGBN2Tcn8zQlUbAM2boZIcKByiGVz8fpp53FlbnuEL0GWR
   w==;
IronPort-SDR: MhtQmSb4khtZuqeZ9wVl8wMA1ucW13CVuIzsahB352l1owb3ojr1BdOcH1N7RIwjXGqhRu1wIQ
 5YHffyWPc9uLIWUXDI1r3magXRH9YdYfPMcnEBd3oF8XwU3ny3rgRQ8T+Q9J2HopIkxhQF1QPW
 6I1q80bwO4DDBufoyJMHyxKNTp56eYVzCKRSPM+qQoNneVNto/R2GzqiOT404oCmLFjE1ooWuJ
 0UJHHrmd5V0g+CCQwn5VD36JgA7jS91OTexFDgOJs5nSZHnkOTMcIHIeAwezCdjnBX3ddU/+kS
 9M8=
X-IronPort-AV: E=Sophos;i="5.76,421,1592841600"; 
   d="scan'208";a="256853735"
Received: from mail-dm6nam12lp2176.outbound.protection.outlook.com (HELO NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.176])
  by ob1.hgst.iphmx.com with ESMTP; 13 Sep 2020 17:35:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cUEuNyJT0QHkITKmf7ExzOs87f/CI2v6PcNWWOAIEDam6yjXfqgTuWnxwkPkbo1xVhfRNla8WcB0S8liQkq6f9Hm4XwFZpEMPQg7Dz3TtPnKm/3zPhR2rq+do0M3hrX0m4TIgTXVUPt6KTpXDmrPeNImjauJX8RPWjCK5q4OFGCzlCqfNZf0rDFsrE3CyvjxsEIcU5BKQu2d3qpW/Na7ZyQBJsRzskuBfjlOmKo9l67Rkxoopw2HraVj92uBbr5x4lUQPm+dz/Lv1sfy/otGg1wtgoUuuoQ4XECBJlGIpfBrZ6mIlSfFDpSguJxyvTOXUA8an9aMOJWHWYEaud54Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXr2TXZrdV/zMPURqeBC9Zx7IJSqY6eeYU/TnTYq0cQ=;
 b=LAsHsNFNgVjfHl9d6GvzWT1fNoqP22Wqo5E2QJWdJZan67V7mn4R0bbKvcNHokS7hy6g7+oqeKuMXnHYWbswuORMLB2e1GLf9ElvIacybBAP5kjzCM0IoJpph/Ra3PkbWz1hmp88sNMaqSGq0sl1QK6I4A11FfnmCCJL9FKwZTcPy+/pEE3rsbSDYFfwHlBUilQnGIvr31Mza4wBBlku1HzfuLAZoOMvG0P28ZU8jiFl/MLmu8oso8dc0VHzxS7puatOd5LrOpZStKsGq7yxlhVyQi6Os+mmHCl016I5HxFU4L7YxgSXLgxUCKIgejACOoGakpqVkeCsE9pkDN4YEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXr2TXZrdV/zMPURqeBC9Zx7IJSqY6eeYU/TnTYq0cQ=;
 b=zehPw2KGMLp8BWWYBqUkLeBjKoggASwgdqv3QbSSXZJKTW8v99tGNBu/ZnCaFxd6kyxia15wmY6iOcHz5cdO3kYL55y+nRHJgGiF35y6f4tyqPQSc9vXQvy1eDGR1HEbDseCCXDjFozd+hyA2I2T+CnZwEgqK5bogRgoxRpYtCw=
Received: from BY5PR04MB6705.namprd04.prod.outlook.com (2603:10b6:a03:220::8)
 by BYAPR04MB6069.namprd04.prod.outlook.com (2603:10b6:a03:ec::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Sun, 13 Sep
 2020 09:35:44 +0000
Received: from BY5PR04MB6705.namprd04.prod.outlook.com
 ([fe80::2c49:48e2:e9fb:d5a0]) by BY5PR04MB6705.namprd04.prod.outlook.com
 ([fe80::2c49:48e2:e9fb:d5a0%9]) with mapi id 15.20.3370.019; Sun, 13 Sep 2020
 09:35:43 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     "Bao D. Nguyen" <nguyenb@codeaurora.org>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
CC:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1 1/2] scsi: dt-bindings: ufs: Add vcc-voltage-level for
 UFS
Thread-Topic: [PATCH v1 1/2] scsi: dt-bindings: ufs: Add vcc-voltage-level for
 UFS
Thread-Index: AQHWgCVXOk5caVA7xEKoLZDnRIQ/FqlmYbkg
Date:   Sun, 13 Sep 2020 09:35:43 +0000
Message-ID: <BY5PR04MB670510941B91C0D394A23A68FC220@BY5PR04MB6705.namprd04.prod.outlook.com>
References: <cover.1598939393.git.nguyenb@codeaurora.org>
 <0a9d395dc38433501f9652a9236856d0ac840b77.1598939393.git.nguyenb@codeaurora.org>
In-Reply-To: <0a9d395dc38433501f9652a9236856d0ac840b77.1598939393.git.nguyenb@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d863c7df-ebbf-45b0-85ef-08d857c862ff
x-ms-traffictypediagnostic: BYAPR04MB6069:
x-microsoft-antispam-prvs: <BYAPR04MB606961293DBA4A02C158FF33FC220@BYAPR04MB6069.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g8IC4Ylo121CJnvpC5DuQ0yHzZDd4MBNxf2dq0u0JT3jPp8k/K1IgXH/atKd8r8m/zzH1ZR2jnXcM5tK0sYYQGbhm1qq/pSLDEeC5LTvQWTvWg6K2GjK5J+4U3eq3onXo796iij91B9g4YZdxdbA4PcRoIddmdJ3MxGDqIXPVfzDQXZKRKbZaj3ZUO5SM1HOK8bmi7TcnBnDYZi5nlh5LanNzWkhpFoosJ70Pxyo40pYFRZwzeRRct1O2VQWJuuruXLfYVTQAkLFhPVFHorV4V3axDpawjyOMXjGLkwIPrzSvLsirgaXO+CYNcdAUU9mIEzdi0Yt0eCORaVRzbWqQg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR04MB6705.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39850400004)(346002)(366004)(376002)(52536014)(8676002)(478600001)(2906002)(9686003)(55016002)(26005)(7416002)(316002)(86362001)(71200400001)(33656002)(186003)(64756008)(66556008)(66476007)(66946007)(4326008)(7696005)(76116006)(66446008)(5660300002)(6506007)(110136005)(54906003)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: TIb1DqVwcmJrLErUoWppu6nZ74Ox0okCDqp85gRM4inGGnRbTnIwXrI752Jd4HxDePXPFD69GP71VkEeFerG4CtoLbQzaX3IgOXYqjd+K+aLBBYVQ7HzKgxX53u2a8uLNwE0WQF0YULYPQ7yIcEwO21Pgtk8V/E8PEdQCjvq3xb6V6Dh9xP1jzSHyMIG76aybHlNxz/gkwq9zRLn9SdB0mut0hakH43ptuFx3D055TtMpotCnmK3dFyTsp1jjy+1nfqyIGdDF4XQmbGPTQz5o0VP0v8ed8BrUR9W6rRKdKNy7RCmfWtUCgPwdHDRzqg3rU93vkigy3G5l+/+VIW//EqRO+IZz4fhh3CAK75dQLeY96Ck3Jdo15qSreiCk1cfIhpl3LgZvU/Ci7PvBL5CPvVbRshVDFq0pw7OplkVgjoqgfW0PHuD8zt6ORJhJk2OeTh/WObWHZMn6VYRIJ8skvhkopqYFh8DXe63gIxUuHKp8TRdXZwu1gtmnvAQtwubwPwQoapee/RS+HIO7OMz1V1X7Q0VgMHu6F8rs6y/hlrXx+KLD4w2RX3dDd7ZL/sTNds3C7b8dwTZITonhX1H4KfzIf62oa6SZEqexXl0TS6k5pmHgP2VGb3aw54zv9OTTldybKE+ocuvE7cA6KZp+g==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6705.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d863c7df-ebbf-45b0-85ef-08d857c862ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2020 09:35:43.6604
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q2PjNJnu4lNLuv+wt0oY2LtA71/NKgAv0yEvmM9mXbJe1bPB4Q0ZckAERLmyVrgQ23r1MNGrB6SyOt2dKKbq1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB6069
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



>=20
>=20
> UFS's specifications supports a range of Vcc operating
> voltage levels. Add documentation for the UFS's Vcc voltage
> levels setting.
>=20
> Signed-off-by: Can Guo <cang@codeaurora.org>
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
> Signed-off-by: Bao D. Nguyen <nguyenb@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> index 415ccdd..7257b32 100644
> --- a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> +++ b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> @@ -23,6 +23,8 @@ Optional properties:
>                            with "phys" attribute, provides phandle to UFS=
 PHY node
>  - vdd-hba-supply        : phandle to UFS host controller supply regulato=
r node
>  - vcc-supply            : phandle to VCC supply regulator node
> +- vcc-voltage-level     : specifies voltage levels for VCC supply.
For ufs3.1+ devices

> +                          Should be specified in pairs (min, max), units=
 uV.
>  - vccq-supply           : phandle to VCCQ supply regulator node
>  - vccq2-supply          : phandle to VCCQ2 supply regulator node
>  - vcc-supply-1p8        : For embedded UFS devices, valid VCC range is 1=
.7-1.95V
> --
Why are you removing all other docs?
They are still relevant for non ufs3.1 devices.


