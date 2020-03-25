Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C5C4192952
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2020 14:12:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727494AbgCYNLs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Mar 2020 09:11:48 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:36885 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727478AbgCYNLr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Mar 2020 09:11:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1585141907; x=1616677907;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=H08UkH0C5rr2yQbEUa8775RlakenB01JHp2XGMAEU78=;
  b=h5JMsB/HQbevDlDpTw5GfZPQH8FPiqGhVD5aTfjJKopmN9Ixw0CmyJNg
   2uusUS/b6ey+z3byQz2AH3Hhu2A1YcNKku6lgPd2XTBJ7oXU8YlNWjWZO
   nWWZQCIv+875AGe6HpnQycNuyTby7enwgn3b2OhJGfkbTSVx+Mr0df0zp
   hQ19IVg1fIrsCJE7AwVyIciwhrm07OuxLwuCDoWi+wpb0bDKbe52llZkV
   nHOXTEIukNeWnt8ZLY+3pJ5qrquoqKoywJlErxu9EBy9aQxKeKr9p3ACC
   ArM0s97zLwSjxX0tXKKBhTgVRg7H6/zI7rZ7U8uEPwJGAY5OJXmFSq2Bl
   Q==;
IronPort-SDR: duqK2d7hXFDy2JKYuurCNNiX1OCz0UhvA9uclN0YQQr8sBU2FJwg8n3wnJfWN4nivLgoQuGDLQ
 DtczPFwfq/xftu08+Cp0Ghgnt3yK72OBJktmFy7+UU701GtxI+LYA32dp8qK2ROPsrMev7HSct
 CBXa6w5nnD3JnWGNjMOKavCgBPS2jOzOkdZtAIp9GwAixXaV8s8Srr7xK69etZsA9XGjqqqIUu
 dZrEYOkQd9oONny08uFbCx1H4nwyt5IysSE29a+W9aCCx7M+ajBZzlxpotpCxweJppVm9bM1xp
 Nr4=
X-IronPort-AV: E=Sophos;i="5.72,304,1580745600"; 
   d="scan'208";a="241957520"
Received: from mail-mw2nam10lp2105.outbound.protection.outlook.com (HELO NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.105])
  by ob1.hgst.iphmx.com with ESMTP; 25 Mar 2020 21:11:46 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GtVUj/XNaRdX6y/N6Tu5QfrUE9twzpd/i7uTanb6xrDb65RmlxN6qu3PtIp7Ac7lkylGM++wKLlxtHprx3riN3uZUK6YgduHor3ZztUc44LpGXS8woXVDWz37vj26VaJSKwCIjW7FDT1kmNo1XxUTu5H7krWNHZJ35Noo+YegodXoCuvM75obgor18Es6x1CtyyLmRN5jEO+v/P1pn4BrTeK6ANwJWeFbL2YxxHmbhN8D9qVmtWfCpfcGobSuyt8BFbZehIVMBiOLfIpKgk8NUzwzpb+9gdqrOPP4IdR/SbV2b1d4bIkDhRZHl6RnXN67FXA0ioplv7SQ60rNIsbRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJvpsYnetPwmAV8lOaPO0PYOqDJ8PvdwAi/brb55a38=;
 b=HoJQp0fY+Tq4/Y2KVFaYt7WRBrTgzxcjbSr2KJ01gVNyvpZuCtZ8xFihhQqAaNQui0DXOpGAJ61/EJxFwl2sqy+nf8oidmErJRY+LP4CRDtl5gu48Q3w0U7wAI8oTE7MtoWKpnEYvqviwBoOS0JQFiBhTx5aVUQSdBg65IpYqt5FjCq4uptSiDCY42ijoDE3XVKeQ7TtlwQ/RYJWWGxzCj+DJIvUeg/wPHc8XOQroHhQJtFimL/qpIEQyV5OMQQspA8f3WX7xOkW2a/cICf08XJ9iPohCdLMVoyGVdbMZjnr5MSXlj5Dgpwb+cRiBSYjLwWn2Q0SNt9dKD6IfRzSyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJvpsYnetPwmAV8lOaPO0PYOqDJ8PvdwAi/brb55a38=;
 b=umBHwdGFu1OwvxqMzEDa+k1pRGJt+E1tE6y0XHX3nkYMvxfgkFyP/NlyWgQCAf559KBdmFi7K7hfWrc3Q7jRV3QF5qJo4ld+ayz2MmboE1RHM7s6zzLJ05tTIeHw+yfAbLN5jFZZSeNdZRZPc+RhM7f3uhRXYrPsuyEOXC50bt4=
Received: from SN6PR04MB4640.namprd04.prod.outlook.com (2603:10b6:805:a4::19)
 by SN6PR04MB4256.namprd04.prod.outlook.com (2603:10b6:805:31::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.18; Wed, 25 Mar
 2020 13:11:45 +0000
Received: from SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::3877:5e49:6cdd:c8b]) by SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::3877:5e49:6cdd:c8b%5]) with mapi id 15.20.2835.021; Wed, 25 Mar 2020
 13:11:45 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Asutosh Das <asutoshd@codeaurora.org>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
CC:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Venkat Gopalakrishnan <venkatg@codeaurora.org>,
        Tomas Winkler <tomas.winkler@intel.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1 1/3] scsi: ufshcd: Update the set frequency to devfreq
Thread-Topic: [PATCH v1 1/3] scsi: ufshcd: Update the set frequency to devfreq
Thread-Index: AQHWAjlXIDKoZPLTMUGmc3FvcFDjB6hZKlaQ
Date:   Wed, 25 Mar 2020 13:11:45 +0000
Message-ID: <SN6PR04MB4640BC23D0827886927D302AFCCE0@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <ebd9ea7d0ebb1884b15e4fe7e3e03460c1e3c52b.1585094538.git.asutoshd@codeaurora.org>
In-Reply-To: <ebd9ea7d0ebb1884b15e4fe7e3e03460c1e3c52b.1585094538.git.asutoshd@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Avri.Altman@wdc.com; 
x-originating-ip: [77.138.4.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f16877a7-6fc2-465f-4796-08d7d0be11a6
x-ms-traffictypediagnostic: SN6PR04MB4256:
x-microsoft-antispam-prvs: <SN6PR04MB4256BB8BB9565D2CF3FD07A6FCCE0@SN6PR04MB4256.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0353563E2B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(316002)(54906003)(110136005)(9686003)(7416002)(55016002)(26005)(186003)(2906002)(33656002)(8936002)(71200400001)(86362001)(66446008)(5660300002)(66946007)(66476007)(7696005)(478600001)(66556008)(64756008)(6506007)(4326008)(52536014)(76116006)(8676002)(15650500001)(81156014)(81166006);DIR:OUT;SFP:1102;SCL:1;SRVR:SN6PR04MB4256;H:SN6PR04MB4640.namprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eeAzLhreonMqBDRJlVNUFyCCs+xOW4xCD2a9oo5cB3fdY/W3UFndHcfkDsptW/Mkp+6hIv/XWAIehpql6gk56fEHzzHYzlvF8dcgJU3QCXeTSg4NgwyomAEZlPU1tuYvSCV0Dx0aJ6deXFZwgOAbniUV+t1Xy91adxJiTtvvkF/uR/Esw1u4UfAwOFn2mOtLDzxABB03Fo8Ynu6dKtC4yMMdBFVvma4Bqo6aidZjgVckHdTG9DElTXjfMfjbQPqIO2HiP8nMprLShEtpNtJ49hOjvHDbu9xdAixMf5aUpQ8L0qixxuJLTS1G5zlPWWnDSpR5ruyoSS4XBXXlriVWcCyEXe9EbaFhLbH5a5MBTBJFngpvykGI0oU3bbiT74D62FyzE1mDkzQsuKx9RtnxZ9PBqZv6cQGrzzaJyykcykzm0TEUil510TbehuEtLPsS
x-ms-exchange-antispam-messagedata: MbIZxz8JM+TNzFxHpdr7FMiOfdEmuOVaIcnydTPjC0Groez+ltttAjnPaNqgkCBNcdryc/Tayt5TOVY55oZI0HQdP5TqBI+e7qLic092v8yulcQQNYx0i2lxfqbsgwG6DWraOPR5FRtlH9wabKiP5g==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f16877a7-6fc2-465f-4796-08d7d0be11a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2020 13:11:45.3984
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iH3cr48bw/3AjRTYRmlnOvx1Z2OqgrpnWTaAuvu4det2N6hw6KOvdCLbszQMkjTIkzP/UV2g+ileKZRgDU9p/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4256
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

>=20
> Currently, the frequency that devfreq provides the
> driver to set always leads the clocks to be scaled up.
> Hence, round the clock-rate to the nearest frequency
> before deciding to scale.
>=20
> Also update the devfreq statistics of current frequency.
>=20
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
> ---
>  drivers/scsi/ufs/ufshcd.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index 2a2a63b..4607bc6 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -1187,6 +1187,9 @@ static int ufshcd_devfreq_target(struct device
> *dev,
>         if (!ufshcd_is_clkscaling_supported(hba))
>                 return -EINVAL;
>=20
> +       clki =3D list_first_entry(&hba->clk_list_head, struct ufs_clk_inf=
o, list);
> +       /* Override with the closest supported frequency */
> +       *freq =3D (unsigned long) clk_round_rate(clki->clk, *freq);
>         spin_lock_irqsave(hba->host->host_lock, irq_flags);
Please remind me what the spin lock is protecting here?

>         if (ufshcd_eh_in_progress(hba)) {
>                 spin_unlock_irqrestore(hba->host->host_lock, irq_flags);
> @@ -1201,8 +1204,13 @@ static int ufshcd_devfreq_target(struct device
> *dev,
>                 goto out;
>         }
>=20
> -       clki =3D list_first_entry(&hba->clk_list_head, struct ufs_clk_inf=
o, list);
> +       /* Decide based on the rounded-off frequency and update */
>         scale_up =3D (*freq =3D=3D clki->max_freq) ? true : false;
> +       if (scale_up)
> +               *freq =3D clki->max_freq;
This was already established 2 lines above ?

> +       else
> +               *freq =3D clki->min_freq;
> +       /* Update the frequency */
>         if (!ufshcd_is_devfreq_scaling_required(hba, scale_up)) {
>                 spin_unlock_irqrestore(hba->host->host_lock, irq_flags);
>                 ret =3D 0;
> @@ -1250,6 +1258,8 @@ static int ufshcd_devfreq_get_dev_status(struct
> device *dev,
>         struct ufs_hba *hba =3D dev_get_drvdata(dev);
>         struct ufs_clk_scaling *scaling =3D &hba->clk_scaling;
>         unsigned long flags;
> +       struct list_head *clk_list =3D &hba->clk_list_head;
> +       struct ufs_clk_info *clki;
>=20
>         if (!ufshcd_is_clkscaling_supported(hba))
>                 return -EINVAL;
> @@ -1260,6 +1270,8 @@ static int ufshcd_devfreq_get_dev_status(struct
> device *dev,
>         if (!scaling->window_start_t)
>                 goto start_window;
>=20
> +       clki =3D list_first_entry(clk_list, struct ufs_clk_info, list);
> +       stat->current_frequency =3D clki->curr_freq;
Is this a bug fix?
devfreq_simple_ondemand_func is trying to establish the busy period,
but also uses the frequency in its calculation - which I wasn't able to und=
erstand how.
Can you add a short comment why updating current_frequency is needed?


Thanks,
Avri
