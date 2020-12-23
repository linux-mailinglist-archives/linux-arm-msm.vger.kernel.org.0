Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBDD22E21B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Dec 2020 21:48:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729044AbgLWUqd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Dec 2020 15:46:33 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:52020 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728184AbgLWUqd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Dec 2020 15:46:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1608757479; x=1640293479;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=c5ysDp16XvIuu0wrLafp4DwyicttBpnJAOjfIFbV22w=;
  b=qQwXNDSLEH91mtlHYxkcEJaBALroCNF53cauIlVqNt6pYOztLJawKmx9
   GIv57/pReaWON4acgeHhO8lm+qJqX1zkSJvfwY1fCd4iTFM0lEvy/FlNe
   gwzpIjAbNXEkKAF7ZzFokpXLB3tSUlcf3Ovdh83G9y0mtYWPrYTA1gK3T
   DWPmiP3pt2uoYy+MC1O7qwosSP6ZnBe23vX+hpeJzNp7g3aJnxVdu6hhk
   cqW2lPSKrHvpWcb2r0ltdqtbzaP//aU9wJoJQi5P9Dv96ix3JI9+5N+VE
   tneVMYieAGTeg1GdoOShd/cRejJuXARX7wy6RBBA0v06NgRgbw28tHMSg
   w==;
IronPort-SDR: CHB/a6m0uEvFeflEVKq6ttsgV/QaqBQ61BQNXWJ/rp9EM6WUkIsWJB+gmndivwdLpn8f73VyjY
 3Ht2VfMadbR4ZuMHN3KtBth/yBZrdIAUpUOU3/ZMH9JE3Yx5vpUC/6xVCQWn6TK30sgrjumK+O
 cQyHT569SY4XVUT/yM1y/R7+KP1Fozl4fUs6bbXE6refOH7BAb7RoWqzWJ8kGmH+mCZRGsji/y
 9qClmC8RG8xVuQhWedqyHHyuYYYPb7ZLlavNgvOGcNT+va4gkmQDViV4Q4dBf6XWAIfiqgNl4T
 uLo=
X-IronPort-AV: E=Sophos;i="5.78,442,1599494400"; 
   d="scan'208";a="259740260"
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
  by ob1.hgst.iphmx.com with ESMTP; 24 Dec 2020 05:02:56 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GqD8vcLiYE+tYS9gT+lMOyJgtUlsC8tAtgilS4qq/DNLWuUOk786Gg9uxin/RSnvJrkyn2OMph6K3AeFz7xeom+MyGQJmU4jDyx0JHCyEo42V4gyAWL/4H8b93e3++F+RDirH92Gmq6DdM4zzcrGaQkUMNWkyqSRvG4I9cfuXfDE86Y9aIxdmKacHfs8zSamg0OeEwNUckgKvruxNMWI6/D68BtuCreRuxigW1T0k+p2Lx2uLWSoJGQ9jSsItkplT9RmxqmhR7WtXTIbhL0Ppvc0ylOqsiZnKNxTyXwmKcco5iuZFy60YCN4wjC+vIZVBqkFyvoQRtiXQn+3u9qppg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQvK9FKTlz2tMJu93E50dsEbzwNkqYmItw4Zd7S2LI4=;
 b=YnEw/Kj6nO/7jc8gPJd4hGNOF4pfIZqriO0Dqry7TXERNfzRxGDo8WQGe3vCZeHq1+rst4YVAhC81AYBm82z+hX7HT8MGLMdidpQvVDYSZ+XWV3tJVOLodDAwNCwmwOQJ70VGLXFDKV+JWiyuTAMuXCfeRBr8mzyv5exkPjRdMMkAuRik1pLvVnunmg0V+Me7XJCQfzTY+quk29W4KMp6UxwKkzmp5i51+z/8w6LMjVBdAjq0gMku/dWMrEXTAmZs4ntsobzBM13Gstb6xIks0/MgO9RUZBb1GhU+hhpgLPZEbns+OQ0uiud+/9aUv0S8eDcUmdXcOyET7/DvhyzYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQvK9FKTlz2tMJu93E50dsEbzwNkqYmItw4Zd7S2LI4=;
 b=coRLVxnnLbWdPSEe/pxkm1fq6jyZsOckzzmL5ZlDl10FTEVTMh130SFO/STEjW18hthVoAWATGtw8+3mCD+ozqJ4nMKz4IM6sFrddHdiSy+Bho0NKztnSdFRlPipXQ50DjWxDEYzBIp1SwmFihZWsU6v/OcdHyXV8RvOLNz6xZg=
Received: from DM6PR04MB6575.namprd04.prod.outlook.com (2603:10b6:5:1b7::7) by
 DM6PR04MB5673.namprd04.prod.outlook.com (2603:10b6:5:16a::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27; Wed, 23 Dec 2020 20:45:22 +0000
Received: from DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::a564:c676:b866:34f6]) by DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::a564:c676:b866:34f6%8]) with mapi id 15.20.3700.026; Wed, 23 Dec 2020
 20:45:22 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Ziqi Chen <ziqichen@codeaurora.org>,
        "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>,
        "nguyenb@codeaurora.org" <nguyenb@codeaurora.org>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "hongwus@codeaurora.org" <hongwus@codeaurora.org>,
        "rnayak@codeaurora.org" <rnayak@codeaurora.org>,
        "vinholikatti@gmail.com" <vinholikatti@gmail.com>,
        "jejb@linux.vnet.ibm.com" <jejb@linux.vnet.ibm.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "kernel-team@android.com" <kernel-team@android.com>,
        "saravanak@google.com" <saravanak@google.com>,
        "salyzyn@google.com" <salyzyn@google.com>,
        "kwmad.kim@samsung.com" <kwmad.kim@samsung.com>,
        "stanley.chu@mediatek.com" <stanley.chu@mediatek.com>
CC:     Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Bean Huo <beanhuo@micron.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Satya Tangirala <satyat@google.com>,
        "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..." 
        <linux-mediatek@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH RFC v4 1/1] scsi: ufs: Fix ufs power down/on specs
 violation
Thread-Topic: [PATCH RFC v4 1/1] scsi: ufs: Fix ufs power down/on specs
 violation
Thread-Index: AQHW2Gllg/EWmEMBPEKOS0xlcLh5tqoFIwog
Date:   Wed, 23 Dec 2020 20:45:22 +0000
Message-ID: <DM6PR04MB65751FC6D1ED61E569AC095EFCDE0@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <1608644981-46267-1-git-send-email-ziqichen@codeaurora.org>
In-Reply-To: <1608644981-46267-1-git-send-email-ziqichen@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 69ce4840-7535-4a82-36b6-08d8a783ab06
x-ms-traffictypediagnostic: DM6PR04MB5673:
x-microsoft-antispam-prvs: <DM6PR04MB5673B22EDC66D17A69F68246FCDE0@DM6PR04MB5673.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RtHsLbcB55IA7wYhrshXFv7C22Fdpty6nP7uZBgGWnUtR2Y6/83x87PzjSjzMSDyuVJ5NhjCNVEzXXEDPtinWJ69dcIvv6NU9cjOE6oACnv7O6fovgignvuvzuW4INQB7GEv0Nx+SUkpRvrGE264CCKRmXmoVT7a/B3u4tQkGRr/YJH2yUj6Q5ASnWaW1CND5BHtsgfe8kh1mr5tGMUx5Wm65SFRRTsOrl66paKNj1DLOJkGh+jWIa4N9RtIXSK9o6Vy4lOuN2/9RIFFCr4qE1YD0RkOInt/w6HORC5WqDOe/DGZcHohasmQ3TvpT/PsqAEChondf/rPoKpsvLLFpMHjrI0sWk+fUtSwtlxoRn4S7RZDyCSkGa+5rJFpXno7HXWqIdRftOS3RgFgYJFO/EaKlT2j0lU0WpRlX6Cw5a/58xbBynY5OICOHba33Dmy
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB6575.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(110136005)(54906003)(26005)(186003)(4326008)(71200400001)(55016002)(83380400001)(66556008)(66476007)(64756008)(66446008)(7416002)(8676002)(33656002)(5660300002)(52536014)(478600001)(316002)(8936002)(921005)(76116006)(9686003)(66946007)(86362001)(6506007)(2906002)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?mcYF6HAlLYk6HxJ6SYdztvjVUqKdIRogmUaR45r+x2sVqBNEOGvQRVuWRHOl?=
 =?us-ascii?Q?rKq6mJy3zCaTGbOh2FhTCuzNpY3w+8kgAU3WDcHfI/zMA796QvHo0YlzSSCV?=
 =?us-ascii?Q?ZDvNP/O3JGNhE/mUsYp6vQPYT7j1FfJiR3nB1/uCjmYVO7YwjhOkPxDRzAHl?=
 =?us-ascii?Q?RwLExBawx/A1XF/dvgMuCxHT0OMjiEc4CyAXDtzPGX3kOAx+tSHTp1/cDTm7?=
 =?us-ascii?Q?pORpFneVTa3H+e9ohAbKq+CZIxlhZThbZ/bJqC7roGUF+R5NjymVbc2Dz1X+?=
 =?us-ascii?Q?xYUGqDC8pJJKpTNFi/+mRyKZxfvLr1pFaUrNC37iBTjmQNUNVWcxOwo2DdHT?=
 =?us-ascii?Q?O+GIAUf1AoRW8/se0zhzeaNS1kiZFFSISr0r4LcO82HFIwfkZAKhg/DsNSRm?=
 =?us-ascii?Q?Msfu+DBTdu5z0n2akuUBWaHYkbxp6P5BDfJ1+HR9ER/Oj4ILxPAdmykkzNeA?=
 =?us-ascii?Q?4a4rDtxtL27+6sADPy1AgRP4we+/0WAMjSzKpi8elm7cpWvHCGx8GHyH3s1j?=
 =?us-ascii?Q?YlvswkXd8bp3d8zlQ1OeisiNlobP0YysDz0bJI7tlOFO6L9+5WmjuE4WdNt1?=
 =?us-ascii?Q?B7BzXSGAf2AOVbqJk97JfKNEWrNGQ5GcjkhgC+qtNl8sIBdk16NgmAbjrsts?=
 =?us-ascii?Q?SoNmGPVBosjCxETU9+VeswUXUzZXsZrXh5vbQkbLgtWBPbt+YB/vAULfxw2j?=
 =?us-ascii?Q?BZ7SNLUTkQc073XQwjuqtgu2UpxIpavBty4S8p6IQlvEzaBmSdRd7GpiC0bH?=
 =?us-ascii?Q?9Te6FWJZbzWrKYXv6NxHJlwkCVRMi+fsw847YJFj9vjgvTOMHXsIr8Qa6c+d?=
 =?us-ascii?Q?hFl+erm88TmS665muE1oVDCME1+cGociHEFqZqZtD0+M8k4huV4U9/W6IexD?=
 =?us-ascii?Q?6yEkjm9pxg31hy1Wg8Y0UVxOvyKaD+CECZssWSYaHyRZn+0cZwdfCZmxwDrD?=
 =?us-ascii?Q?ZxQ+nc/Qsh0OxQy+9JW+f2hhCKiBEr5jFNkCAn5JQyY=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6575.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69ce4840-7535-4a82-36b6-08d8a783ab06
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2020 20:45:22.3108
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /C7ke7H/I9VY+Rlv80w/QFNd5D4XcXLKzp8raDYyi2y+oYWeyO24c2uVoBg8Zc4JAsSCdrCw7YaEJkresWCVAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5673
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,
>=20
> As per specs, e.g, JESD220E chapter 7.2, while powering
> off/on the ufs device, RST_N signal and REF_CLK signal
> should be between VSS(Ground) and VCCQ/VCCQ2.
>=20
> To flexibly control device reset line, refactor the function
> ufschd_vops_device_reset(sturct ufs_hba *hba) to ufshcd_
> vops_device_reset(sturct ufs_hba *hba, bool asserted). The
> new parameter "bool asserted" is used to separate device reset
> line pulling down from pulling up.
Sorry for my late response.
Please allow few more days to consult internally about this.=20

>=20
> Cc: Kiwoong Kim <kwmad.kim@samsung.com>
> Cc: Stanley Chu <stanley.chu@mediatek.com>
> Signed-off-by: Ziqi Chen <ziqichen@codeaurora.org>


> -static int ufs_qcom_device_reset(struct ufs_hba *hba)
> +static int ufs_qcom_device_reset(struct ufs_hba *hba, bool asserted)
>  {
>         struct ufs_qcom_host *host =3D ufshcd_get_variant(hba);
>=20
> @@ -1417,15 +1418,20 @@ static int ufs_qcom_device_reset(struct ufs_hba
> *hba)
>         if (!host->device_reset)
>                 return -EOPNOTSUPP;
>=20
> -       /*
> -        * The UFS device shall detect reset pulses of 1us, sleep for 10u=
s to
> -        * be on the safe side.
> -        */
> -       gpiod_set_value_cansleep(host->device_reset, 1);
> -       usleep_range(10, 15);
> +       if (asserted) {
> +               gpiod_set_value_cansleep(host->device_reset, 1);
>=20
> -       gpiod_set_value_cansleep(host->device_reset, 0);
> -       usleep_range(10, 15);
> +               /*
> +                * The UFS device shall detect reset pulses of 1us, sleep=
 for 10us to
> +                * be on the safe side.
> +                */
> +               usleep_range(10, 15);
> +       } else {
> +               gpiod_set_value_cansleep(host->device_reset, 0);
> +
> +                /* Some devices may need time to respond to rst_n */
> +               usleep_range(10, 15);
Since sleep the same on assert/de-assert can move it outside the if-else cl=
ause?=20

> +       }
>=20
>         return 0;
>  }

All the below changes, in suspend/resume, deserves some references in your =
commit log,
And probably a separate patch.

Thanks,
Avri

> @@ -8686,8 +8696,6 @@ static int ufshcd_suspend(struct ufs_hba *hba,
> enum ufs_pm_op pm_op)
>         if (ret)
>                 goto set_dev_active;
>=20
> -       ufshcd_vreg_set_lpm(hba);
> -
>  disable_clks:
>         /*
>          * Call vendor specific suspend callback. As these callbacks may =
access
> @@ -8703,6 +8711,9 @@ static int ufshcd_suspend(struct ufs_hba *hba,
> enum ufs_pm_op pm_op)
>          */
>         ufshcd_disable_irq(hba);
>=20
> +       if (ufshcd_is_link_off(hba))
> +               ufshcd_vops_device_reset(hba, true);
> +
>         ufshcd_setup_clocks(hba, false);
>=20
>         if (ufshcd_is_clkgating_allowed(hba)) {
> @@ -8711,6 +8722,8 @@ static int ufshcd_suspend(struct ufs_hba *hba,
> enum ufs_pm_op pm_op)
>                                         hba->clk_gating.state);
>         }
>=20
> +       ufshcd_vreg_set_lpm(hba);
> +
>         /* Put the host controller in low power mode if possible */
>         ufshcd_hba_vreg_set_lpm(hba);
>         goto out;
> @@ -8778,18 +8791,19 @@ static int ufshcd_resume(struct ufs_hba *hba,
> enum ufs_pm_op pm_op)
>         old_link_state =3D hba->uic_link_state;
>=20
>         ufshcd_hba_vreg_set_hpm(hba);
> +
> +       ret =3D ufshcd_vreg_set_hpm(hba);
> +       if (ret)
> +               goto out;
> +
>         /* Make sure clocks are enabled before accessing controller */
>         ret =3D ufshcd_setup_clocks(hba, true);
>         if (ret)
> -               goto out;
> +               goto disable_vreg;
>=20
>         /* enable the host irq as host controller would be active soon */
>         ufshcd_enable_irq(hba);
>=20
> -       ret =3D ufshcd_vreg_set_hpm(hba);
> -       if (ret)
> -               goto disable_irq_and_vops_clks;
> -
>         /*
>          * Call vendor specific resume callback. As these callbacks may a=
ccess
>          * vendor specific host controller register space call them when =
the
> @@ -8797,7 +8811,7 @@ static int ufshcd_resume(struct ufs_hba *hba,
> enum ufs_pm_op pm_op)
>          */
>         ret =3D ufshcd_vops_resume(hba, pm_op);
>         if (ret)
> -               goto disable_vreg;
> +               goto disable_irq_and_vops_clks;
>=20
>         /* For DeepSleep, the only supported option is to have the link o=
ff */
>         WARN_ON(ufshcd_is_ufs_dev_deepsleep(hba) &&
> !ufshcd_is_link_off(hba));
> @@ -8864,8 +8878,6 @@ static int ufshcd_resume(struct ufs_hba *hba,
> enum ufs_pm_op pm_op)
>         ufshcd_link_state_transition(hba, old_link_state, 0);
>  vendor_suspend:
>         ufshcd_vops_suspend(hba, pm_op);
> -disable_vreg:
> -       ufshcd_vreg_set_lpm(hba);
>  disable_irq_and_vops_clks:
>         ufshcd_disable_irq(hba);
>         if (hba->clk_scaling.is_allowed)
> @@ -8876,6 +8888,8 @@ static int ufshcd_resume(struct ufs_hba *hba,
> enum ufs_pm_op pm_op)
>                 trace_ufshcd_clk_gating(dev_name(hba->dev),
>                                         hba->clk_gating.state);
>         }
> +disable_vreg:
> +       ufshcd_vreg_set_lpm(hba);
>  out:
>         hba->pm_op_in_progress =3D 0;
>         if (ret)
> diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
> index 9bb5f0e..d5fbaba 100644
> --- a/drivers/scsi/ufs/ufshcd.h
> +++ b/drivers/scsi/ufs/ufshcd.h
> @@ -319,7 +319,7 @@ struct ufs_pwr_mode_info {
>   * @resume: called during host controller PM callback
>   * @dbg_register_dump: used to dump controller debug information
>   * @phy_initialization: used to initialize phys
> - * @device_reset: called to issue a reset pulse on the UFS device
> + * @device_reset: called to assert or deassert device reset line
>   * @program_key: program or evict an inline encryption key
>   * @event_notify: called to notify important events
>   */
> @@ -350,7 +350,7 @@ struct ufs_hba_variant_ops {
>         int     (*resume)(struct ufs_hba *, enum ufs_pm_op);
>         void    (*dbg_register_dump)(struct ufs_hba *hba);
>         int     (*phy_initialization)(struct ufs_hba *);
> -       int     (*device_reset)(struct ufs_hba *hba);
> +       int     (*device_reset)(struct ufs_hba *hba, bool asserted);
>         void    (*config_scaling_param)(struct ufs_hba *hba,
>                                         struct devfreq_dev_profile *profi=
le,
>                                         void *data);
> @@ -1216,10 +1216,10 @@ static inline void
> ufshcd_vops_dbg_register_dump(struct ufs_hba *hba)
>                 hba->vops->dbg_register_dump(hba);
>  }
>=20
> -static inline int ufshcd_vops_device_reset(struct ufs_hba *hba)
> +static inline int ufshcd_vops_device_reset(struct ufs_hba *hba, bool
> asserted)
>  {
>         if (hba->vops && hba->vops->device_reset)
> -               return hba->vops->device_reset(hba);
> +               return hba->vops->device_reset(hba, asserted);
>=20
>         return -EOPNOTSUPP;
>  }
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
> Forum,
> a Linux Foundation Collaborative Project

