Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D84E1B3A9A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 10:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbgDVIv7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 04:51:59 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:46703 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725786AbgDVIv6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 04:51:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1587545518; x=1619081518;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DVDukrs2kf6ItNIQMjd00Z/cOVOcw6iD5rzv6En0g/0=;
  b=dbza2RIfYC7UctK0LCGSmX96/zqSCbz2j9oTJQ0yI17zFJSKpLzN1PCX
   po9RnZxlMBOLOlqYfARsukZLXUn/5FEJaMuX6ddvjpQK8a4DIo7lp0XTT
   ttImU5MwXgXjxi5oxli5lJNcTVo2sQYAN+MA7ijfgfd9god6F6yEbl30m
   9SCHKxwVuXuMAAAZxCkO7DBbToklH+H1zfw2VtUto+VA1hRRzZb2nnqbC
   JzWuq5XYCStUEKXEhuguMmwLf1lNt4I+1pD8xVElzido2qqrHXGCiJYA3
   CVweHV7pZoGYz1MU9VsSlXlREQHqXTQmpM9D0PFXmE7OxHlaP9xoq8eDy
   A==;
IronPort-SDR: odtx96rlXjZtqyOJ++hiKr5JZ8uUR9Jk0GUW1gdd7+c2dE3HEXnY//D+Cv15FSPVt9JdOmEr8Z
 xEPCDZJG2184jVd5De3hS6M071p1mjR+eow63fzHpul4ZxDzXPiRRn92Qs9DDx3+qUODcvb57e
 oLsm/YMpHwHz0X8qS8fGCCz3nSNKe4ZUXBvRnnP682puo6jhQM9LAQhAy+FjzawaVJMqVDbe6l
 R3f0Q77aFWVDTgxnZ8C0FDhhGi4HX7LnH/jhhLMtShyg4b1me2gmzrBc3XOK9N0t7r+LWfZgkt
 DhM=
X-IronPort-AV: E=Sophos;i="5.72,413,1580745600"; 
   d="scan'208";a="135865812"
Received: from mail-bn7nam10lp2105.outbound.protection.outlook.com (HELO NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.105])
  by ob1.hgst.iphmx.com with ESMTP; 22 Apr 2020 16:51:56 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IkdFvhSlgvDWhMifGIfMi72hjXVoblNeWiLXK50Uw05yjdPo2Okdc3Qry9tR46yt+8N02El707uaCsi9+cT50EBcq3cA8hbjACB/3g1xoTFZhjogGxhJ4Z20JYPzSC8C1Q096IcClGjGkiMEXe5rdfRqY3dgp4U2xnKcQysHITIdLaZ2/yeObHglM+Q5vXUByE7AFCzXa3SH1ZyXX5Awq51Sv9GDDasY12pGlxDFFHv/yRrdqYZ/KSoRrSjPrxXqDpyzSZHEV92jpAyiMBss7syjC5Ickal4sC1TBYiCs9TsvhwkYv1WmDJRwTFLVR2pZRhX4z8FlV/R53pyPE/gqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EqJ8zWtcOM5z3bZKpelxrgsY6XBpQ40xW0Nkanwf89g=;
 b=L3/VHQxInIcNKbdFDt1SNv658xjgPQp22z0RK8+JzwrszhIULFiu2nvM51OJE8Xi9+e3zId/8tEAij1+xcUTKJHoBtj8EXFQN8cV3dAXuU4i8Qzh4Cs0IfLkrXNBisqRjn6aSk6+l5W7z6Ic9LuAEpC2bMIiX/0JSt6LIZHN89PtA6L3YiIPm1d0/sGV4ASpkPR3qSUezoRlCIwWc0eZSzWyovAOs8TyP4w/5OdmVQFTJe0oW9gDH/G7VzARS/db8rRy35Kaf7c5cDo/EBTLM1FNKwldQ9/eBA4Kd0skZT/6MDVB36FYLiJqwxEwXr6IEFeaaeqKZRywtAu4+AlMqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EqJ8zWtcOM5z3bZKpelxrgsY6XBpQ40xW0Nkanwf89g=;
 b=MwJ260r3msb2w62ExGo7RMXofIfhJ2rtFJs8HDbyMAM/XypDPbVumQVj79NhdRSm5BIPbdKMnwW/n+VV6Sa3Z6GhPBIAnW80DLjXrnE/o/AxLJhvl2Xqg6pq3XSc8VmRI0PGbjP8aVyoa2XkkBXYHuJVo08rfuF/29Vx5erKnBU=
Received: from SN6PR04MB4640.namprd04.prod.outlook.com (2603:10b6:805:a4::19)
 by SN6PR04MB3950.namprd04.prod.outlook.com (2603:10b6:805:48::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Wed, 22 Apr
 2020 08:51:56 +0000
Received: from SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::3877:5e49:6cdd:c8b]) by SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::3877:5e49:6cdd:c8b%5]) with mapi id 15.20.2937.012; Wed, 22 Apr 2020
 08:51:56 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Asutosh Das <asutoshd@codeaurora.org>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
CC:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 3/3] ufs-qcom: scsi: configure write booster type
Thread-Topic: [PATCH v2 3/3] ufs-qcom: scsi: configure write booster type
Thread-Index: AQHWGC/bc78fgk3F5UizGNPlurPhxaiE1aAA
Date:   Wed, 22 Apr 2020 08:51:55 +0000
Message-ID: <SN6PR04MB46405270EB2E9FEF579F1115FCD20@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <6519cd576299d5881129b0e48870a53a0afc7835.1587509578.git.asutoshd@codeaurora.org>
 <90ee50d5123e7ef4f04fba2ba281bb2e2e9ce1e5.1587509578.git.asutoshd@codeaurora.org>
In-Reply-To: <90ee50d5123e7ef4f04fba2ba281bb2e2e9ce1e5.1587509578.git.asutoshd@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Avri.Altman@wdc.com; 
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d6131f73-331d-4a48-8352-08d7e69a693e
x-ms-traffictypediagnostic: SN6PR04MB3950:
x-microsoft-antispam-prvs: <SN6PR04MB39509D6E01E2F7B081023759FCD20@SN6PR04MB3950.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 03818C953D
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4640.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(66476007)(26005)(5660300002)(110136005)(66446008)(66556008)(316002)(76116006)(54906003)(478600001)(7416002)(186003)(86362001)(52536014)(2906002)(7696005)(4326008)(64756008)(33656002)(9686003)(71200400001)(8676002)(81156014)(8936002)(55016002)(66946007)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mrEJtFr7mqwcFbuEnlVXLlGUAxWUn4ZaZli2F1a0/Y5XjIol2t/zgX4umD38JRL30dygeqiRCLRjqucihYVrhsh5PIO9pZw8uGFS5bfsLTelnnqiYxgayR4NRWRqg/QoQFgS1PyCM93geyuu3BE68ePQFXmLg1u+GQ+jkrCWJU0dmbJQh3GEJFQ7hwSXZvlGbiGcrcJmAeQ9Z5OvxVpAgm3z1sGKsp/o6AfZz40uqKdQ2IMF8I+Dk4Uxvjb61nkyeZFekIUCVBYDvS/f6p8+fuoYhAmXXDtiKivvHNFReClMKD1m79RJWe51DukWSjnM/0nt1qKEeIfyJTrEhkp5OrOKML/+Y/i5bUXDWEyjZ0clArUTAE5TL5CTR42gR1VuWujCzkNAiD36Mfk3aXUKK/c0wb3VpSkQfFzK9MOfT9245+ZZa3EE7yifm5SYcu2g
x-ms-exchange-antispam-messagedata: LU0UNxvBPY2NHE/CN8eMHLiEc20K9fHVA0jmJ9GVmJnVuGLa9fDRKkxvQ/I7lJWPHV9JgR0azWnhxEjFNCXZp1sOgF2Y3WpL7oHmWtS+tA3CVT6ahBOrxzRVFVgYz6Lc+XTY1fn3fSRmO8+sm0/d2A==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6131f73-331d-4a48-8352-08d7e69a693e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2020 08:51:55.9742
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nHoy4qCeG4dqnKRPuVXMSIePB75jwskoh2oeS6NwthEEQnTjY40KGGEni9ptKaiQumpxGhlGQ2IhIQK57fh9Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB3950
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

=20
>=20
> Configure the WriteBooster type to preserve user-space mode.
> This would ensure that no user-space capacity is reduced
> when write booster is enabled.
The above does no longer apply - leftover from previous patch?

Thanks,
Avri

> Enable WB for Qualcomm platform.
>=20
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
> ---
>  drivers/scsi/ufs/ufs-qcom.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
> index 19aa5c4..6e4000d 100644
> --- a/drivers/scsi/ufs/ufs-qcom.c
> +++ b/drivers/scsi/ufs/ufs-qcom.c
> @@ -1071,6 +1071,7 @@ static void ufs_qcom_set_caps(struct ufs_hba
> *hba)
>         hba->caps |=3D UFSHCD_CAP_CLK_GATING |
> UFSHCD_CAP_HIBERN8_WITH_CLK_GATING;
>         hba->caps |=3D UFSHCD_CAP_CLK_SCALING;
>         hba->caps |=3D UFSHCD_CAP_AUTO_BKOPS_SUSPEND;
> +       hba->caps |=3D UFSHCD_CAP_WB_EN;
>=20
>         if (host->hw_ver.major >=3D 0x2) {
>                 host->caps =3D UFS_QCOM_CAP_QUNIPRO |
> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a
> Linux Foundation Collaborative Project.

