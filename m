Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4E5831AE24
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Feb 2021 22:38:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbhBMVij (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Feb 2021 16:38:39 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:52925 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbhBMVii (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Feb 2021 16:38:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1613252317; x=1644788317;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hEthZFVgY/5JEaYISYodOeMEYOTIJbCZZkB6T8eWyJ4=;
  b=J7so7GvnTMy95uHBi906feF3R3d6zJjyOXDbFbZzDTrJA0Z0vmw82igb
   OkGzte2UQK/AZzm0E1eFFAp9Wyt2Nnlg+TnzcufcRxLQ8YOUjLjwYZ2br
   dYqYNATolD8cH5y7aQ5k5vZ5kFl/vrbmJ5R3qAYVXLEotUppOMJYbDpvQ
   leNQXQyMt6zs2EOxgVe4W0pRdIbDa+U2e7Bz2msb16wlL9c473LFKu4Rh
   fPd3Dm7UzMJJaoVwSYgcaIFfznKouEHnZBIb5NhbzmloURjo+cn6uVHx/
   qUbw8a+fi41rw9b+peHvptQ5po7uLkSSCEPRmpQ64+1BU5/nWUPHJk3xE
   A==;
IronPort-SDR: j5BPhZRLWmhZuqaCAkKMYGUBEhi3YdoSz2K/I8qfNWgRz0v92/b2qjZ4pfUm/pw+riMEWKFGU+
 sq5rUkG6zt+vTkJXCwjIt4eIkvh4wLQY6o2wGIapI0CltTZOE97VWkcvyqptIZL0EywkMxWWM+
 W3VuTXKBbBwU3sqc/OmT1x9hWH0CRmiH5/gYZXDFICYaNK5JbAMskHGjyAIKTZ8kfM9+A1WI9a
 kcZnOLdp8wpiWPlmZ9l/x2gMdVAkwaT5tqTHoLqQpUZ0KYqebJfVjiD+RPXeMhQZkYzsoLnQmH
 yhE=
X-IronPort-AV: E=Sophos;i="5.81,176,1610380800"; 
   d="scan'208";a="270413696"
Received: from mail-dm6nam10lp2104.outbound.protection.outlook.com (HELO NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.104])
  by ob1.hgst.iphmx.com with ESMTP; 14 Feb 2021 05:37:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2cEl/IoCfoPYt7q1Xgqf0FKpwD4RM4VSYbqHjeC8yQYoUn0hKlOd/sVlFbIFS0hYW8VeInQiYKh2cDc+SlY7SeYPjDOxylEEAPb2prKi9xgvPlEYj44ib+tLR+MsqMzZBPmQLuIQMHnyjdtQxU2IzgvPwQ2N5R9A8TwrIrFEzv1rEjNP07SNapD8hYR+fWAsLePx3XczWUeex07KGPaBQZOevKiADrIPSKeJj5tU2UJWjX8lQYIYJY7N/3ZiNMkqbjVJ6LTyYyA38ijWwz+ygm4+WqD5ku5PGBWxTdNisubZ67NIga/e32N6hlAzCO3uHeXSiS+dutPx2h4SYSbIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Qj5DCE0pUOZjKDPDb5CMm8xTEncaMtHTUzIsq0tIgE=;
 b=YoAN/Ek0yrkA2oRsWT6l7X6FK4o0pvJTzUs0QzfowZANxGiSlZuCwi0w1CHzmJT2EfuDGcDxv3LxyWtqML9PuToTXJ7E+DOBRfcerhPwjR9y/lGi2DdvnL1fKcLeoYzJ7P8TU+5sBnuJy8ThXrFWYGPPBpprpLnmGGpiH89dmNUmMrPcHxYY6mB/SlLBLISURsnIPOwVhWQimOM59oqNQnL00rprPzQ15NcBNYqg8Aj34Zj7mGGTjTVj8verCPaB1Mg2nQM1bfqi59/hnCocYrztw2X63ophZJ9t4RVMmkWBzCJ9U08lhVqEzItj3vfnxLVdnD4LbQWEuz2x4kR6gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Qj5DCE0pUOZjKDPDb5CMm8xTEncaMtHTUzIsq0tIgE=;
 b=JmNO1Yf64Tsu2oi0CtboiGKB5FQw9+wID+K1DqniNU7Oqg/ChAaqOtUBbGQimyCeJw13kosjsHUJgsd5P8A94jsI2YSy9ahyBGUw0mARN6gRnaKI/ce7D1VBjQeM5geBcsh5iyt6cSgX1KEnoF1VgnQm8p9bwRKU3EFyo/qusaY=
Received: from DM6PR04MB6575.namprd04.prod.outlook.com (2603:10b6:5:1b7::7) by
 DM6PR04MB6969.namprd04.prod.outlook.com (2603:10b6:5:240::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.26; Sat, 13 Feb 2021 21:37:29 +0000
Received: from DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::e824:f31b:38cf:ef66]) by DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::e824:f31b:38cf:ef66%4]) with mapi id 15.20.3846.035; Sat, 13 Feb 2021
 21:37:29 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Asutosh Das <asutoshd@codeaurora.org>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
CC:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Satya Tangirala <satyat@google.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: RE: [RFC PATCH v3 1/1] scsi: ufs: Enable power management for wlun
Thread-Topic: [RFC PATCH v3 1/1] scsi: ufs: Enable power management for wlun
Thread-Index: AQHXAKrEeNNZ6E03PU2kp7215n4xZKpWndRQ
Date:   Sat, 13 Feb 2021 21:37:29 +0000
Message-ID: <DM6PR04MB65758E0EBF4171FD6E1CF0CFFC8A9@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <cover.1613070911.git.asutoshd@codeaurora.org>
 <eed327cdace40d1e1d706da5b0fa64ea4ee99422.1613070912.git.asutoshd@codeaurora.org>
In-Reply-To: <eed327cdace40d1e1d706da5b0fa64ea4ee99422.1613070912.git.asutoshd@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [77.138.4.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0b213bbc-c11a-4336-7ca6-08d8d0679060
x-ms-traffictypediagnostic: DM6PR04MB6969:
x-microsoft-antispam-prvs: <DM6PR04MB696992B75E7DDE95FA59F54AFC8A9@DM6PR04MB6969.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dIuav81MSRWq/iZmwO7Fz+3K0jo458FGkA5dMzRjGnMC6SUr2UJhh8N5MNxZ7pf7rYpS7vnpdja5KvIlLbccn1ZuyLJrs5hblUNsxt96tFbOjk+O3GFBKZgvvThzejAJCCK2BwxzmXG8RenIjOeizc53RxaXoHHfhoUZN+BZ0KK+x8xQFXdSHKEk2cLKeuHIs8GIdenNSbh/fU+fguv0/WyweHrUdDWYELUgKak3qDZVFDPcxCjvAXbeODkI1x5r3lVJYGiOw2cNH/69qDL8Sj1qBa6v2cV4Qqr7zOycwcXeSOgndPhDcdJxBsKtcBnIqPnEhcRRl/NdUx8cQVhDTr3hM4c2b6UPTnHZXVCGaGh9ohDbFju7Ndd5PPYt2hzk3kZy7+ipKOaMtKS8rlng+Vu44kqM5HpEXVtIrafLHJOBVsk5p8E4KaMUKRTv74X8uEZgJXpqx4xnTWbT62CuK7or31IW7AjdRPz45xbOB8yeX/HuG324+OqFbEsJENq3P3guRrjqGnD8PXbFb5KeqA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB6575.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(7696005)(33656002)(54906003)(52536014)(5660300002)(71200400001)(4744005)(316002)(86362001)(110136005)(8936002)(7416002)(2906002)(478600001)(66476007)(64756008)(76116006)(55016002)(66946007)(66446008)(66556008)(4326008)(186003)(26005)(6506007)(9686003)(83380400001)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Uxzi2He4jsSQZlilRteHjdoVpr18NNFHX5l48tXGqSVaAnC43nFIgw2ftNMu?=
 =?us-ascii?Q?3Y94+uXNMFPVvpQz32oZ9WqbAGEf8btltANKBgtQtsAdnWqzzTsj0Xo7ncFg?=
 =?us-ascii?Q?S1FSv2qVeXhCNH+Gzz56uJpN73WmNBHyGPIuBhSEmjFzPDPrL6H7KtwzZug9?=
 =?us-ascii?Q?RmnEb3/C1F6Tau5KFyUu+1dTPel/QoPh+9OlR3Ry9FKcuDeIHCzLsj1x5GjR?=
 =?us-ascii?Q?GGlVAuu22RQof8Uv2hdqBgD9EVrnk3HJrZnelNcAmWta76m4Uv5i9ZFKHCB/?=
 =?us-ascii?Q?bk0IGz18Yff+Qx4hHLZzuFRBH4yliVX0S6Oyb3Qcvh7s4j00SFiqTvjSuKIf?=
 =?us-ascii?Q?hCx5Qu3V7FB9B0waZQlvwIQM8x47SznZyCPegqvw2/pSJWvzSBTnapICOdRX?=
 =?us-ascii?Q?JWuysAEdHsyt7GGR5dsBN3S2p3/KuhzJLKLkVwdGO17jwYYohK9ZsT+RI9du?=
 =?us-ascii?Q?/Mue0r0aTOAVCA6sPoJC6J2Go30ka6OC1HC3z/LijZR8Wc6vo0jx78VlvttB?=
 =?us-ascii?Q?BqsA440FCAPEPtznhLyxna1FI9aASEYGAGe/trLpnholzK9Gm24Bk+9I01C2?=
 =?us-ascii?Q?xOSGK9MAmcu1nI3w5riJ37cGDo/K2mB5e60FUwLJCAouGvt1pF+TxiUQNZOg?=
 =?us-ascii?Q?B8UrTlR28tToEoUROSGruWgm+GM7aAFjrUWh2eyc93BMU9jcMGWeFeEqYnJ/?=
 =?us-ascii?Q?KJgRd2VkxQvjZyHIF+Pz72t68uSF3q1jAMuXFSFXzQzKusgQaGOFuAUQC+E7?=
 =?us-ascii?Q?tLup43xksoCmcHq2ZIQoJ2gyKaRCravzGURoPr5Wp+2UC35eYarspiFwx2+J?=
 =?us-ascii?Q?oYWM8A4NWfByDOdWsEftS3m4Zepw2Efu8k7NdksQ/5Te2lqzcfHkSqwoPJtu?=
 =?us-ascii?Q?xIQTox9JlQfzE/GR4aMltc6+5z97T0Y8c6pTAFf5OvdA1kqrF/Xs7KELoO3q?=
 =?us-ascii?Q?xR+6b06j24YUStYncVkaHRfeTL5y1Vc0PfD3A24UfZ0Y+PZxnxWCdznLNapz?=
 =?us-ascii?Q?h7Jt5IxEogHINAIzi73PlJRHHiIBhzYZCh7p2h8h823ZJJGta8ANGQzxBfCy?=
 =?us-ascii?Q?9RrVITGisdD7l0sFHlj1OOujKEVveCCuZgpuWqlLqoU/wieKVmorQNNH1fqw?=
 =?us-ascii?Q?ZcCuobcdWIbLYCvwnEoCtHkHGv9K9aRJFXNarJCCiLLDoKnZd/jK05+GEZ40?=
 =?us-ascii?Q?KZ/tuhwm+xCcfBisTw093LjMv9M670QMaAFPHedz0bZ+czvi7ezrHn+qhi4q?=
 =?us-ascii?Q?dcw+U1FYzbIobvRTNfnUEKy8nzv4xu6+KTxHrKad9onDOOWhUsDWhSQ5WyfQ?=
 =?us-ascii?Q?eOM=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6575.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b213bbc-c11a-4336-7ca6-08d8d0679060
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2021 21:37:29.4719
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oPO67jXgGmakMZFEgfUy1M48bFziGpQ01vG6ASF4IxwTcUJmeoeXK/c6JxXtvBXnAxeX5M832I8kQq/15EZmGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6969
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> +       } else {
Is it possible to get here?
Scsi_scan_host is called only after successful add_wluns

> +               /* device wlun is probed */
> +               hba->luns_avail--;
> +       }
> +}
> +


>=20
>  /**
> @@ -7254,6 +7312,14 @@ static int ufshcd_scsi_add_wlus(struct ufs_hba
> *hba)
>                 goto out;
>         }
>         ufshcd_blk_pm_runtime_init(hba->sdev_ufs_device);
> +       /*
> +        * A pm_runtime_put_sync is invoked when this device enables
> blk_pm_runtime
> +        * & would suspend the device-wlun upon timer expiry.
> +        * But suspending device wlun _may_ put the ufs device in the pre=
-defined
> +        * low power mode (SSU <rpm_lvl>). Probing of other luns may fail=
 then.
> +        * Don't allow this suspend until all the luns have been probed.
Maybe add one more sentence: see pm_runtime_mark_last_busy in ufshcd_setup_=
links



> -       ufshcd_clear_ua_wluns(hba);
Are there any callers left to ufshcd_clear_ua_wluns?
Can it be removed?

> +       if (hba->wlun_dev_clr_ua)
> +               ufshcd_clear_ua_wlun(hba, UFS_UPIU_UFS_DEVICE_WLUN);
>=20
>         cmd[4] =3D pwr_mode << 4;
