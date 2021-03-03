Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9838132C164
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 01:02:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389130AbhCCVdp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Mar 2021 16:33:45 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:54582 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1449277AbhCCHTo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Mar 2021 02:19:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1614755983; x=1646291983;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jFOYEqUOOAnl/kpNcNpzWfTSVq4huD+CdsdbzSAz/Lo=;
  b=l1Q6zo/K/2jox6IT24XpeCbwLA0tzHeOWgI9HCz2XwehMqqb721K6y8D
   M1Jl9MCywld3KXRp9VnBoOiOhyZDaWeDGWn4W2D5pMktKsHbhK87XQ+pZ
   ZAZhuB/IzRnTA8Vk5TShCnAKLB53y+AoyZdTHWOW2Ndt8mnoN083YAHZc
   VpdvgMu+bPigQ/GDvZxWbddH29dfdrmgHg/mB9875GhMc9oeQSDD56Xyh
   jf3ZjPEAuujFnEnp5S0oeaHlTQhI0kdgh9mWpOBbswNFRbhSiRzgpMCkh
   NJpeYTOr0r9ZJ/HWcnEECaFms3XhFxgQZ7K1jNIYYRyCCb7Nf5Hv9gcZA
   A==;
IronPort-SDR: CY42w2rmYCAIHPoQSuCA28e00dKF92hEq8ziF1WJPfKZcYGhNEyvcN2AEKj1BtVsguKPLx0r3W
 xoxaSNwMKstcEjPONWauY2yYN4HwJtUHnDnXeq028W84cyYRFqVVZuHUPbuj7o3Z5zZ1YKmLQQ
 HDfopSYzdcBWWB/HzfgJHk/FvRiD8Oqp6ZpiM5ZRkwnS6cC3h+Hi3DRRMOMo5vUdkF6q76MNEz
 jVLk7OXdvPbmO5CKVtfyBDALWFDKrUscu5YXaNT8NXXnFMnqQySI6IiSKvj6T8RKNWPWN4EZP8
 kYY=
X-IronPort-AV: E=Sophos;i="5.81,219,1610380800"; 
   d="scan'208";a="161220462"
Received: from mail-sn1nam02lp2052.outbound.protection.outlook.com (HELO NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.52])
  by ob1.hgst.iphmx.com with ESMTP; 03 Mar 2021 15:18:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LKRIsF9d1wAPznnGj0Qji45aR5Uyjvx44ZHOvkIWKfFZhSBjX/yTidJkUG4wgPGKkqJNzjXez0ySIUEwkZdVfL8mifnNRNm+MVp26oXavthpgRPKYvZFFj0ZGia5rzag5CT3w6JV0rPwIX3iED7qWM+6aoSFOHqIA09A+NP7ROfacYdWmMZ6o7rV5ozxgP6zUMXkiglYpldRafy3PCxIp7lmav3D9NkZbuwzGoQcTBO7BCKy/ic6ofTfQor2VTK1/bp7eyxHKOPgaN+5C50RRuQx6do1mULziclerZMrqLwqYW04WPHsqS2slOSLElkFQDf4zSJ9/BKeb3f0u96Bgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGHC02C/c2A9biw8oqaOfs0Or4YxxSNiDbVSBxlTZdE=;
 b=UIdwaXZx7FMsGqmOG6KU67NUPoF7gqJoFybXtNYc7STkX1ZMGs7RvOZNk0iKqQl5C6CpNviaT62ENBtlOooAZLNY1f8ilS9l8HsN6ltKgvmHIb0BDAGoX+tO3GFHtJqAl0LPgTx7Ppt38VMztMHrtqjQP5kKX7TzjxyVeUMbv1U0YzTUHPh1Bo32bNxjKZibdGfz07JxbWaCyx+lHwt64suLSv1OzGLMkHx3qBIXfAzdyzUH3fDCcGf/gSQlUjE2LwuFQzkZt/x37zkhxOqP/JRqg27uXv4fK/FeizW10U91SHsIgK/vXq//9OWjpQymabynmdrMu0HgGSH1Yz7tCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGHC02C/c2A9biw8oqaOfs0Or4YxxSNiDbVSBxlTZdE=;
 b=EoBZ+XT2pv0n0c0RNpliTW+Tt/jWuEFngOYirazcxxxdaq5M/U5s/z4Xd/zCk97QbEl+FpYQkc/NjWk5Ns7Dn/vJNYb9JGZR4OffDeK9h9sfbCUvpy+KXi4sozkOJBHi5j/SRODkPxaKmgeTrXxGlpS4572N7wrVkXntsNc6aUU=
Received: from DM6PR04MB6575.namprd04.prod.outlook.com (2603:10b6:5:1b7::7) by
 DM5PR04MB0970.namprd04.prod.outlook.com (2603:10b6:4:47::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19; Wed, 3 Mar 2021 07:18:29 +0000
Received: from DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::e824:f31b:38cf:ef66]) by DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::e824:f31b:38cf:ef66%3]) with mapi id 15.20.3890.030; Wed, 3 Mar 2021
 07:18:29 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Can Guo <cang@codeaurora.org>
CC:     "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>,
        "nguyenb@codeaurora.org" <nguyenb@codeaurora.org>,
        "hongwus@codeaurora.org" <hongwus@codeaurora.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "kernel-team@android.com" <kernel-team@android.com>,
        Nitin Rawat <nitirawa@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 2/3] scsi: ufs-qcom: Disable interrupt in reset path
Thread-Topic: [PATCH v2 2/3] scsi: ufs-qcom: Disable interrupt in reset path
Thread-Index: AQHXCm8WN+YhHnByLUS9jf8kgHZH/KptpKGwgAQL7YCAADUxUA==
Date:   Wed, 3 Mar 2021 07:18:29 +0000
Message-ID: <DM6PR04MB65756A436EF1004976E183B3FC989@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <1614145010-36079-1-git-send-email-cang@codeaurora.org>
 <1614145010-36079-3-git-send-email-cang@codeaurora.org>
 <DM6PR04MB65753665BA9BF63ABF20656FFC9B9@DM6PR04MB6575.namprd04.prod.outlook.com>
 <96fbfe6fba7a7cd4d2d764186bb8650b@codeaurora.org>
In-Reply-To: <96fbfe6fba7a7cd4d2d764186bb8650b@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 904914db-84da-4e01-feee-08d8de148ba7
x-ms-traffictypediagnostic: DM5PR04MB0970:
x-microsoft-antispam-prvs: <DM5PR04MB0970ED452C25F8AF578085CFFC989@DM5PR04MB0970.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1122;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M3bqmIjxlnboofYLGl4FStcZCLVmPcydHgfkWsx2TQx2G4v+7tX+VdyKAaswn08rfNbc+ivwe7RodYxjVqIPFWGK8qI0VgstQ4EwF7SIeAik9uqyBwI8PKR0lqQo5yCIpka6q33f1FS1AAN5jW7JGuxXAW7Jf4sxUoGAVLgvkjcO5Ga/51Wl/Sh+XNjgaw2yGcRUGvbHMYVfqIXDYWlcUG79BcJyWziVGe6yWd7zgy0WIvYM82lWncNQw2UYxTUHk1iJM4YXqkXqu6u15c1n9jTpZu+sm0bVLVj9KPIE7ZsBLdurdEHT5JYAAu8HGMB75VA4k0mMRpLOMfcwUc5885gRMSqlTEROR+Il8nlRsdIN3YVOf0WHovRqeYqepscrhH4PbkytFOydUyBjTlHCsUAaLpp2+THrZKtGuGl/ZI4AsXvFN/eqQRjhQPqj7lnr72RRlDBchkZh7qUVrJgWEczCsuVbVqOyeR79yuIZx/mkBibLVU2Iw3EdL0vLij0ryiMdu91fkfhlezb517HhAw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB6575.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(376002)(366004)(136003)(71200400001)(54906003)(7416002)(26005)(6506007)(86362001)(52536014)(186003)(53546011)(8936002)(9686003)(2906002)(5660300002)(8676002)(55016002)(64756008)(7696005)(33656002)(6916009)(66476007)(4326008)(66446008)(316002)(478600001)(66946007)(76116006)(66556008)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ROQyXtLvxZy5VHGnkEEMj6WoWQC+5zc93FLBDL56wUlSYYwRDr0zydjNet/u?=
 =?us-ascii?Q?k0As3/vBAdeqWhXS0/ueCyVF7f0HdSTKjPtifiCbjiPenzWf+yHAu/QmX7kj?=
 =?us-ascii?Q?m7dcS6+beLi/tEfKHcalOuvJRESvLdwk/yuesEHEKYxmtBUYsBMfEU7H0izo?=
 =?us-ascii?Q?zjGIONw3iH65PnlHDwnfmWNNMTQmBc0h45y/3BZGVDqLWFcogKO5UFupy3/e?=
 =?us-ascii?Q?CYP2bRh54Pmnog9vyYiUlMj7nfaV6CZdwGf3B1EFJ/eXUjsZynoNDwzQlQ6U?=
 =?us-ascii?Q?b5e3XDqGnd/d4PYUWr3jT5zb2s9QIyokXvs8efzBIuyNePIE5Iw6BCGO6JQH?=
 =?us-ascii?Q?XXf/jXBqpu6gu1c8FTMbJu20IjyAGAdBvzGcoYzJH8Th/bHqMp5Ia798mff8?=
 =?us-ascii?Q?Bv1toYR9p/Rl8iwTnkL5sNjfiSF8kRHXkDtQ/zNgAVXQqrD2se0PA69j8tGf?=
 =?us-ascii?Q?agwu1prjyvNsvyx0BlrqtIqLo831DmZXtro1ATx+7QpS1Wqjkb3UJ7hsk5VJ?=
 =?us-ascii?Q?HDRqU1/XCzZhfTSjN2InNfCwdK6vvnq4Bp2U34COucJsBS6RLn+sWbrlPu8J?=
 =?us-ascii?Q?Yt3s0ra57QNPwTXoXhdiAIdCV/iJEdurfJmSKOEVwYOdi8vpNGACzOGZb6nO?=
 =?us-ascii?Q?oNFukBON1cofiSnLswctCu0edEweyjPJDNowdJaW6Vf+QoMOaRE4G27AkENe?=
 =?us-ascii?Q?FE7YIfXZKmRFhPZQ376H9K1wNFZMw1Pepdb8W0VxdpgygHzpV5qSRkDpNGBF?=
 =?us-ascii?Q?FgkLgbzCFMznnNyWKAJz0eu+ud3bXEeUYN6A3XDXKtIXNWHx6pwYu//7c/4T?=
 =?us-ascii?Q?wW65jsXtuZyRfhvLG8XdLvO9WbfwfQRF+32OK+dN1IVdjhJuQuhdZFF3kWwK?=
 =?us-ascii?Q?Vi9yB5/yzvK0IMaCW8QP4hWJ3fwbkzChSKMQSZ3EZayKfK6dCldw7S2AZksF?=
 =?us-ascii?Q?BVxrTAHlI9CtEijIZaTiYQ1cWX6F06eJz85VXUZidRRZf+IR2uqLZTKcIorD?=
 =?us-ascii?Q?qrK7E2Scb/vzGSmVzWuOUp9JtcUCBovgzkv2bf8rNxEDanT33r7G4eKHkZV0?=
 =?us-ascii?Q?f1dFrIusqxG2mme9ZZfU5x7y1edYY/1dziVvFBglMjxvsKaz27tET7G2u6LZ?=
 =?us-ascii?Q?i6T2NaZ7I7tIk99JgkStvgDBo7G2h56GOuFZHk14HzqJhWFeE3Gua3vKQV6q?=
 =?us-ascii?Q?k8FBBxOjZ8fBJR/XUE8gdxjwDUlRxu7TXIJuvp/C9A4m7Oi9u7ndqSsHpcLZ?=
 =?us-ascii?Q?cjLYSXLNv537ymZ82F7wAELZnqjEKLlGExOckyVovJkJ1RCkCFBpl5X3mL5Y?=
 =?us-ascii?Q?Z/6PHIoSpPNZCTxDDNI61Snv?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6575.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 904914db-84da-4e01-feee-08d8de148ba7
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2021 07:18:29.5196
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4n0Sne9eynFrcZOYIz0wCQm1C+Wwi1xBkWFmBHwkhDO3fePWhEPZLFmYvnNdj85ZrWncyXpijUncbO4WJICuZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0970
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

>=20
> On 2021-02-28 22:23, Avri Altman wrote:
> >>
> >> From: Nitin Rawat <nitirawa@codeaurora.org>
> >>
> >> Disable interrupt in reset path to flush pending IRQ handler in order
> >> to
> >> avoid possible NoC issues.
> >>
> >> Signed-off-by: Nitin Rawat <nitirawa@codeaurora.org>
> >> Signed-off-by: Can Guo <cang@codeaurora.org>
Reviewed-by: Avri Altman <avri.altman@wdc.com>


> >> ---
> >>  drivers/scsi/ufs/ufs-qcom.c | 10 ++++++++++
> >>  1 file changed, 10 insertions(+)
> >>
> >> diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
> >> index f97d7b0..a9dc8d7 100644
> >> --- a/drivers/scsi/ufs/ufs-qcom.c
> >> +++ b/drivers/scsi/ufs/ufs-qcom.c
> >> @@ -253,12 +253,17 @@ static int ufs_qcom_host_reset(struct ufs_hba
> >> *hba)
> >>  {
> >>         int ret =3D 0;
> >>         struct ufs_qcom_host *host =3D ufshcd_get_variant(hba);
> >> +       bool reenable_intr =3D false;
> >>
> >>         if (!host->core_reset) {
> >>                 dev_warn(hba->dev, "%s: reset control not set\n",
> >> __func__);
> >>                 goto out;
> >>         }
> >>
> >> +       reenable_intr =3D hba->is_irq_enabled;
> >> +       disable_irq(hba->irq);
> >> +       hba->is_irq_enabled =3D false;
> >> +
> >>         ret =3D reset_control_assert(host->core_reset);
> >>         if (ret) {
> >>                 dev_err(hba->dev, "%s: core_reset assert failed, err =
=3D
> >> %d\n",
> >> @@ -280,6 +285,11 @@ static int ufs_qcom_host_reset(struct ufs_hba
> >> *hba)
> >>
> >>         usleep_range(1000, 1100);
> >>
> >> +       if (reenable_intr) {
> >> +               enable_irq(hba->irq);
> >> +               hba->is_irq_enabled =3D true;
> >> +       }
> >> +
> > If in the future, you will enable UFSHCI_QUIRK_BROKEN_HCE on your
> > platform (currently only for Exynos),
> > Will this code still work?
>=20
> Yes, it still works.
>=20
> Thanks,
> Can Guo.
