Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D631F327292
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Feb 2021 15:24:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbhB1OYe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 28 Feb 2021 09:24:34 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:7665 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229654AbhB1OYd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 28 Feb 2021 09:24:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1614522625; x=1646058625;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mV0D51tSugtYyEDJ+XJnBcLsdRBEAdjS8RUJmGvdrsI=;
  b=iXBf5XuzwhiELpnM7GqCMyL8PvIZRPy+UYg1ktMNEgqLgPm8ft82Yjxd
   O8+X+kDT3Np1wxjT7f9ovBcXuH7fiPCBPRWsL6JwT5h1SIFlZzgM+Kbss
   qlaj9rzFT7N0K736aZy0wpXC0NSQBUvlOFPbLexf4khKf6Lc1dJsGoN76
   Y8X2phMqbnLhjmsN9CLcWK5dtSMqJLLmBjs1oH6NTchqmCF3Dccqg2Jnj
   naYkqCPNNphmDnd1p4JO6yKYw4H5q2s7YPYqOyR6GL82gt2ziqiCcxR6j
   gEo2lzS46ITtqcGqoKSAynvK5Kzx80G/4WeH94bWsxj1IPZ7UlKpbG7dJ
   g==;
IronPort-SDR: 2SviPxMF/bjfXSy037VphZsx/5wJdTTozYAiMnWDIASDTgq6LHUFAo1IKQnKIHvMuneYkfRC0e
 GlYGRkoV4Z0SJ13ET5YNdlVBQYdZ6O4/VPZbEPJ0vJHGBpZA1L9ZVAaYO9tIAk/1NkuqBXiehg
 DTWUrY67b+1RaxI4bgr3QHSjFLtTL87T8PLHvGKA1NfQevxxzgoLdf+nX69y1nAMHibqnEZVox
 lvc6rxLOPeFpc+g6MG8dcCuLy8hPOjHBkC4z3pZkliAnoqGhWAXSBDVuhFvhB/+sN1umz+1pkL
 WBo=
X-IronPort-AV: E=Sophos;i="5.81,213,1610380800"; 
   d="scan'208";a="265255803"
Received: from mail-dm6nam11lp2168.outbound.protection.outlook.com (HELO NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.168])
  by ob1.hgst.iphmx.com with ESMTP; 28 Feb 2021 22:28:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B25/dvRCCPqyMabLpsxDIBuvDe9qtHtn+nSqGUootS+ogGF1BnWA5TmmhmeI/ieRj21ZxEAQmuVAOMh6CeHd/lGsamvLboiXhmDSBMlkNZVvDzoWjcFHSvz150IdGrdE0/AHlLMyWlRxiP7ifAG/XiHT+TKiFArfj/6xJVGyrz1xZDM4yvSfrVohnvm/3xrAhymZfkkzQ2+3zWToMnF/9Igydp9LOmJZXpD6FHMJx/lxK+4K7j1OfOYWhmLBD1n+/vZZV1TrUY/tcbGgOW5sx7xIHmUWbi02usBqzYC6e2zB/9E1qHRbXUpDLkga0kV54k3gqI0xPtGQIgH5hulg8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIZKKs8qott7djCaAeLfB2CPosalif0wTsG6nS4oDGs=;
 b=GyXf6Lv6LgKzinS8UnivAV3zdo1LuM7f8GoG6IvbZV09K4NhF5q2Skz1fRw3PtSI17DLBN8RPgL2BoOe6hdQ0VQguy3hIuzFvb5hrtpTIcXInPlYv8MZkkpz++h2lUHO1mh7KrBA+zOpWMOzctptpb+C0PPh9XuVuqBTCq0NMPnsznrKcQ/IrKD2432KzUHv7OK6TCK9B4soMSKeJtpGFURq9CDnmj4pjI0bFZBWXtzswb28tDd1RNbbEdh5GWI+GzulScoE0r8AlJANwv+IxRAcVsCyYTaXHfCjqafi7X8yINrV94/a7vALO8YMwEYTxX/fFgQtdVAUz8ukhgiGJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIZKKs8qott7djCaAeLfB2CPosalif0wTsG6nS4oDGs=;
 b=w9N5rBszaB/C4Xuur0Oe3xE/9+H3VeQrhCdGeYMgxY9/EW41IW99QXYNn2lAm+7zu/E9NAiCUoBGv8vPuGpqSSaxF/wZS18DpJn101CPEXl1GfG6LhmniMMLqlt8rkYhvFkUI17QaekZoj8jEeTLCYPyi2taVsG7d6Ha0EMUWX8=
Received: from DM6PR04MB6575.namprd04.prod.outlook.com (2603:10b6:5:1b7::7) by
 DM5PR04MB0973.namprd04.prod.outlook.com (2603:10b6:4:41::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19; Sun, 28 Feb 2021 14:23:23 +0000
Received: from DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::e824:f31b:38cf:ef66]) by DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::e824:f31b:38cf:ef66%3]) with mapi id 15.20.3890.028; Sun, 28 Feb 2021
 14:23:23 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Can Guo <cang@codeaurora.org>,
        "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>,
        "nguyenb@codeaurora.org" <nguyenb@codeaurora.org>,
        "hongwus@codeaurora.org" <hongwus@codeaurora.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "kernel-team@android.com" <kernel-team@android.com>
CC:     Nitin Rawat <nitirawa@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 2/3] scsi: ufs-qcom: Disable interrupt in reset path
Thread-Topic: [PATCH v2 2/3] scsi: ufs-qcom: Disable interrupt in reset path
Thread-Index: AQHXCm8WN+YhHnByLUS9jf8kgHZH/KptpKGw
Date:   Sun, 28 Feb 2021 14:23:22 +0000
Message-ID: <DM6PR04MB65753665BA9BF63ABF20656FFC9B9@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <1614145010-36079-1-git-send-email-cang@codeaurora.org>
 <1614145010-36079-3-git-send-email-cang@codeaurora.org>
In-Reply-To: <1614145010-36079-3-git-send-email-cang@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9a83c281-378c-4b9a-1cb6-08d8dbf467b8
x-ms-traffictypediagnostic: DM5PR04MB0973:
x-microsoft-antispam-prvs: <DM5PR04MB09730CEE8D2FBF149266C5B0FC9B9@DM5PR04MB0973.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:428;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gNEEKuClf2GvNNF4H1B0QC6Km/Hotymm/JlMLr2GlO2RKUwNWKpqzSZ+hZdh3GLh0phJVRN8DYgXo3SpGnksonKFAhwqvswgJVyil/R4flNoLpOEVYMgbOLR03bE0Lp7DElwUA8YQ8G0uO1hqoqMZ+jmnFatmRm5QEgJMjeyA+/DfTsv1JaevFy35T+NdwV91q8ME6g7tiERl2xuKsWGHP0spjXTcfT3+UjneKJGCNMgOUd5RAjxTiLGRVR6Ar/K0huX+c1eI9f3onSANSIr8P8sm5vdX2IVrCQuEmTAunFiZwMhe3b2j/HqY/e+GJENbKF4SlLJyYhN0kdG0KPMAyS8JdZsjSEVqqMchx7OJDAfKgXvBEzpmkBAUSqvKdug7TCv0FgV7RGC+uNbxar3esOS44STiK2gu698H5UNFeG28TtZYwHjvEwYRCxScTFSKmPdUHDsfN/7c71M8fKHlZa2oLrr7NWS+l0EIl4fnzqWtjHn5z00hCMYxc/GWTDxFL5ohbS5KOgNn8l4hoo39g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB6575.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39850400004)(366004)(346002)(136003)(66946007)(55016002)(76116006)(478600001)(66446008)(8676002)(66556008)(66476007)(83380400001)(2906002)(64756008)(186003)(6506007)(316002)(71200400001)(5660300002)(52536014)(110136005)(7416002)(54906003)(9686003)(33656002)(86362001)(7696005)(4326008)(26005)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?izBB6rg09BJ5Hn9F8YphDmo18VM/UndD3utHcvG5OE0eSKDmMYC6L8xbC25T?=
 =?us-ascii?Q?0DPlswzgUgjQOvSdMGz5f1Mafm4eN8JbqwyCN9++JuJ8xyuDW0uB5mnCyzF3?=
 =?us-ascii?Q?dQn5NNyj38cDedJe99K/uVaI4NEsPZd4yfOSfoED1SzvXMHJnf38+xl216O2?=
 =?us-ascii?Q?lT9kFvGA2rMT/A4jE+gwLbLsSrT62aM917tyXiFkI6ngbIU0WdPAOXwQhY09?=
 =?us-ascii?Q?My7cQpwbZ27UgeUC8GnAwrgLhCFReFkG/av0inmNHDeksD7eS2s3oDei7KBX?=
 =?us-ascii?Q?/H1CClCOPDs0rBq0kPXSx3smeQX+0ZN1GgT+VSZkVAkFgcEuOLnwhb+wJa51?=
 =?us-ascii?Q?zBTV98+MIE0CMx2gjAnAujwqD//T5ZynGzcNQz+u+j53wVl5Zh+cj25djQVz?=
 =?us-ascii?Q?Lg3tVxSzoeIGekWKxaFhXdyp6PDmcybq/KYMSCjOmSSyRUTaOFrvZuOL2etz?=
 =?us-ascii?Q?8uQSd6gczBW6lCg1uooWImw28rUniKQjnlxR5Gry5P38AAZhZ5dCfe3xkcPw?=
 =?us-ascii?Q?+JZiz50iGqSY46BdIc3WWj72O4M618VleCvT1W5TYTeBj/7CqZJiH2Ec+VOG?=
 =?us-ascii?Q?wZYBofnpYM82pEaH0ml3ZPTT0G8KGjfKk7Nw8Zk2RmjP/SwJbtPBsHxV9nI/?=
 =?us-ascii?Q?V999qXJx5114Vg0cv+8RQdYQX0xXSIuezkFY+lh5Xbdo2+jqW0McWNI1uWH9?=
 =?us-ascii?Q?S3sp/R8G6l1Edwa8/Q4irQsvvV3rhfUJun/L/2g4U7xhQxjakJ1dkl3looWO?=
 =?us-ascii?Q?KpN5bXQhTgfR6GPL2PCzlRJzDffuufSh6efYUR7LNL8dOVMPhCMstB9y7eLo?=
 =?us-ascii?Q?Il12AELY7kfe/ljgjU/mQnhTGYE51ORn3R9m36uTgTuJkNqHVsavjb1NTyUw?=
 =?us-ascii?Q?gUSeby1NhdErjh5ES5ifOD4LVKJpK9KcVoGZF6H62Q6ukpYdeHljxDNJ4gte?=
 =?us-ascii?Q?aK9NPHAgo71EP+cf4Ep2UHjqq/40NbIWjdgsahdwwWxGapNahmU8AX7l4lcI?=
 =?us-ascii?Q?GuI64ob8cCKzgQ9qBmhkAz6SAP07xKddO5TEZhIWc1Yox6xtbutHObyVQ/Pn?=
 =?us-ascii?Q?GlQ0vm8HTKrKGTaMHy5DFkUGOZHz33CAGiTfExHZlmvVy4UYYxbrauguDfMt?=
 =?us-ascii?Q?cm5ZcMCmU1PONKgi2MI+ic6YmFfW29TbNJgH1ur4i7EV7kPbHLC/FYfAjmd3?=
 =?us-ascii?Q?/OF0E+DKlcwiMTuy1mruu/hepQoRgVge/KWETDOdMNuTF3YgOU6cbqwqjzF2?=
 =?us-ascii?Q?ynGlXYOYj8t6Pyz66XDQFrRyiVa9JGXWDxqp9ks8mRRQbVPEaLZJ10Xb9T0h?=
 =?us-ascii?Q?GJuBRDI1FaqchtYBTs+hVE0p?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6575.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a83c281-378c-4b9a-1cb6-08d8dbf467b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2021 14:23:23.0382
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Vfpgm1DIxeANNegiZ+LpuBP1SWuJ62LMhaiZ1BFYbNY7w1zQkGgoBQZCS6HT4cXa3RChon/S7SamRlyBBQSxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0973
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

>=20
> From: Nitin Rawat <nitirawa@codeaurora.org>
>=20
> Disable interrupt in reset path to flush pending IRQ handler in order to
> avoid possible NoC issues.
>=20
> Signed-off-by: Nitin Rawat <nitirawa@codeaurora.org>
> Signed-off-by: Can Guo <cang@codeaurora.org>
> ---
>  drivers/scsi/ufs/ufs-qcom.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
> index f97d7b0..a9dc8d7 100644
> --- a/drivers/scsi/ufs/ufs-qcom.c
> +++ b/drivers/scsi/ufs/ufs-qcom.c
> @@ -253,12 +253,17 @@ static int ufs_qcom_host_reset(struct ufs_hba *hba)
>  {
>         int ret =3D 0;
>         struct ufs_qcom_host *host =3D ufshcd_get_variant(hba);
> +       bool reenable_intr =3D false;
>=20
>         if (!host->core_reset) {
>                 dev_warn(hba->dev, "%s: reset control not set\n", __func_=
_);
>                 goto out;
>         }
>=20
> +       reenable_intr =3D hba->is_irq_enabled;
> +       disable_irq(hba->irq);
> +       hba->is_irq_enabled =3D false;
> +
>         ret =3D reset_control_assert(host->core_reset);
>         if (ret) {
>                 dev_err(hba->dev, "%s: core_reset assert failed, err =3D =
%d\n",
> @@ -280,6 +285,11 @@ static int ufs_qcom_host_reset(struct ufs_hba *hba)
>=20
>         usleep_range(1000, 1100);
>=20
> +       if (reenable_intr) {
> +               enable_irq(hba->irq);
> +               hba->is_irq_enabled =3D true;
> +       }
> +
If in the future, you will enable UFSHCI_QUIRK_BROKEN_HCE on your platform =
(currently only for Exynos),
Will this code still work?
