Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 602EA12CBBC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2019 02:50:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbfL3Buv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Dec 2019 20:50:51 -0500
Received: from mga18.intel.com ([134.134.136.126]:51787 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726343AbfL3Buv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Dec 2019 20:50:51 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Dec 2019 17:50:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,373,1571727600"; 
   d="scan'208";a="368490926"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
  by orsmga004.jf.intel.com with ESMTP; 29 Dec 2019 17:50:49 -0800
Received: from orsmsx126.amr.corp.intel.com (10.22.240.126) by
 ORSMSX103.amr.corp.intel.com (10.22.225.130) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 29 Dec 2019 17:50:49 -0800
Received: from ORSEDG001.ED.cps.intel.com (10.7.248.4) by
 ORSMSX126.amr.corp.intel.com (10.22.240.126) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 29 Dec 2019 17:50:48 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 29 Dec 2019 17:50:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQzLATR5zx9BUXMhXLYDHPdef8NM9hlawGx6sYvkgnB44mLPvkwW1Yye6NrcSzeT5WRH92QJmfRT0bY81d7SFj3XUPSAY3yHCGCsweXOT3S1d+0Be6QB/hESklXrqkRGJ2JUb6H3vSf9s8HTqEh3EI8jGchX97B96cp9eWyrgX1l43HA+At226mT3xpLOyADv6E2/3fMj4sJTQXeg058Y2sdIGwcV/lxz0mTAZGij+GxrVw3b5Vb6hw4IQFJ/kcqiIBBbwlUGAK8jWBy8WOHKKDU39kjQLUb4uW1upjZWJoK/rnXAg4cbp82Xya6L/GRAdnFJuVPx20YlSbYbZ2b9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+lJLhtt/qqZpigeguLEDJ6qryFV9CcRN73anMBuExE=;
 b=JaXDMwdnwU8J0oBAJ8QHTSDgtkch0BAhoPStI/Q3J4m5GYV6AzT0vm9XfCTI/i3nMXSWce95cCFdTJL/ET6mvT1AK90xMnzyTD/Z8cTzkUB53JXyCoi0lzh/ppvM8Psc3zR31SWH0mU6ADlqrjQdiyxCZybFIQnK2mXTS0tuty47l9S93tmnLzLLbuZHuM2PFYa9N8VS7e6l3xx+YGDx9iMz//kBBfd5CditbJyO7ghHcQ0zoo9GlezUKxE7VIElEckvjZHRbqCwxcjHusFG+9xeKskxccN04YbWWqOBsCfMAoL5A4cOKDIUSy2FvxEhRBYYjNGQDG2dTTgSUZy53w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+lJLhtt/qqZpigeguLEDJ6qryFV9CcRN73anMBuExE=;
 b=JHXrS7593UhmecQhcU7gUOiXON8dk/RNX5Qc88cvAcvk6A/3lYQjWO7Ub3XbyPBnpQm52v4pmFrcuC+aYy7NTAZWL/t/EPABuqI/HFIPYCP1Ud+3iFB9XGp60YBFnqfz2jGxHUYV4TDmNus+MqRycuqwzLSgFCBwoKFN1ChJWMQ=
Received: from MN2PR11MB4509.namprd11.prod.outlook.com (52.135.39.90) by
 MN2PR11MB4319.namprd11.prod.outlook.com (52.135.39.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.12; Mon, 30 Dec 2019 01:50:45 +0000
Received: from MN2PR11MB4509.namprd11.prod.outlook.com
 ([fe80::bd81:f020:90e3:a12d]) by MN2PR11MB4509.namprd11.prod.outlook.com
 ([fe80::bd81:f020:90e3:a12d%7]) with mapi id 15.20.2581.007; Mon, 30 Dec 2019
 01:50:45 +0000
From:   "Tan, Ley Foon" <ley.foon.tan@intel.com>
To:     Yangtao Li <tiny.windzz@gmail.com>,
        "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
        "nsaenzjulienne@suse.de" <nsaenzjulienne@suse.de>,
        "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
        "rjui@broadcom.com" <rjui@broadcom.com>,
        "sbranden@broadcom.com" <sbranden@broadcom.com>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "lftan@altera.com" <lftan@altera.com>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "agross@kernel.org" <agross@kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
        "alexandre.torgue@st.com" <alexandre.torgue@st.com>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-rpi-kernel@lists.infradead.org" 
        <linux-rpi-kernel@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "nios2-dev@lists.rocketboards.org" <nios2-dev@lists.rocketboards.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: RE: [PATCH 01/13] mailbox: altera: convert to
 devm_platform_ioremap_resource
Thread-Topic: [PATCH 01/13] mailbox: altera: convert to
 devm_platform_ioremap_resource
Thread-Index: AQHVva2whnaOIGPMX0aEmIdB08PS8KfR64MQ
Date:   Mon, 30 Dec 2019 01:50:45 +0000
Message-ID: <MN2PR11MB45099287D74F144546CBB6EBCC270@MN2PR11MB4509.namprd11.prod.outlook.com>
References: <20191228183538.26189-1-tiny.windzz@gmail.com>
In-Reply-To: <20191228183538.26189-1-tiny.windzz@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNDhlYjVmODgtZTY4MS00N2M2LThjNzYtYjc3NzcxZDgzOTgwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiXC9McG5xNXViNjV6YjhIazViUTluOXhWUU9Dc1wvbEx1Qm9mN0hzckNRU0lXVm12TElKYjByVTJPR2dVS1lQMU1jIn0=
dlp-reaction: no-action
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
x-ctpclassification: CTP_NT
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ley.foon.tan@intel.com; 
x-originating-ip: [192.198.147.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b023bb74-1957-4b54-c9e7-08d78ccaafb0
x-ms-traffictypediagnostic: MN2PR11MB4319:
x-microsoft-antispam-prvs: <MN2PR11MB4319A3F8288BA35A2C3EB031CC270@MN2PR11MB4319.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0267E514F9
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(396003)(39860400002)(376002)(346002)(136003)(189003)(13464003)(199004)(478600001)(33656002)(66446008)(66476007)(64756008)(66556008)(66946007)(76116006)(2906002)(9686003)(55016002)(8936002)(5660300002)(86362001)(7416002)(15650500001)(316002)(6506007)(53546011)(110136005)(71200400001)(52536014)(81166006)(8676002)(81156014)(186003)(26005)(7696005)(921003)(1121003);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR11MB4319;H:MN2PR11MB4509.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jsGOht3+EGlpKsRhoycM7Mq7y3wXCGVZANZa0mZ1lUtR6hkKs8e3TyTnHXPukk4gTeLrD6Vfhz2APLuPg4vK69lJw1HqfVgmR+axVdvWOg04lppLIs1+SwSuyx13ytXchRuRbcBmYfS6TUvvn91fvqgKl4bnfqKAksdoy9PvGZDHtORinH4Emsii3RdBwGjFO1rvNKszeIJXHfqVN82deuPCyiXQepc2fILT4C4ZmrMlD6gb9XtbwMlUOT61K0es/20QnyBOnXf9rZwMxaquxFG1kHxQR5kxktzee+P2fNqKEi/LE5XuF3nufpXYQGxcv9jhoUg5SZjiFNQBxZTBWK0TrvykoULtd03KlrvPj+3LVC67pn3MeoNGXR+zn8lW91+SPetOqPTn4bXVeoElTWG3WEOpakebp/IM7FEe6E9BbRpwSc0zzs9uPtyiMQRX8KTFYkwbWLGzyMQHukoNOi6eTKdQjdvZAuezZtZvWXa79pRcWCKhddLrjDZl2/W98xa7b43xZGzj7LYitjMu0A==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b023bb74-1957-4b54-c9e7-08d78ccaafb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2019 01:50:45.3846
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fIghy77mUpl/gKxYTN1UkmfWy990Rc4KaNBKn01oBw2ymw70L+2UR1Z9JtdhHzMxoeJYZz3+dvGV/j+eKphrPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4319
X-OriginatorOrg: intel.com
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



> -----Original Message-----
> From: Yangtao Li <tiny.windzz@gmail.com>
> Sent: Sunday, December 29, 2019 2:35 AM
> To: jassisinghbrar@gmail.com; nsaenzjulienne@suse.de;
> f.fainelli@gmail.com; rjui@broadcom.com; sbranden@broadcom.com; bcm-
> kernel-feedback-list@broadcom.com; lftan@altera.com;
> matthias.bgg@gmail.com; agross@kernel.org; bjorn.andersson@linaro.org;
> mcoquelin.stm32@gmail.com; alexandre.torgue@st.com;
> thierry.reding@gmail.com; jonathanh@nvidia.com; linux-
> kernel@vger.kernel.org; linux-rpi-kernel@lists.infradead.org; linux-arm-
> kernel@lists.infradead.org; nios2-dev@lists.rocketboards.org; linux-
> mediatek@lists.infradead.org; linux-arm-msm@vger.kernel.org; linux-
> stm32@st-md-mailman.stormreply.com; linux-tegra@vger.kernel.org
> Cc: Yangtao Li <tiny.windzz@gmail.com>
> Subject: [PATCH 01/13] mailbox: altera: convert to
> devm_platform_ioremap_resource
>=20
> Use devm_platform_ioremap_resource() to simplify code.
>=20
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>

Reviewed-by: Ley Foon Tan <ley.foon.tan@intel.com>

> ---
>  drivers/mailbox/mailbox-altera.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/drivers/mailbox/mailbox-altera.c b/drivers/mailbox/mailbox-
> altera.c
> index 75282666fb06..afb320e9d69c 100644
> --- a/drivers/mailbox/mailbox-altera.c
> +++ b/drivers/mailbox/mailbox-altera.c
> @@ -285,7 +285,6 @@ static const struct mbox_chan_ops altera_mbox_ops
> =3D {  static int altera_mbox_probe(struct platform_device *pdev)  {
>         struct altera_mbox *mbox;
> -       struct resource *regs;
>         struct mbox_chan *chans;
>         int ret;
>=20
> @@ -299,9 +298,7 @@ static int altera_mbox_probe(struct platform_device
> *pdev)
>         if (!chans)
>                 return -ENOMEM;
>=20
> -       regs =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -
> -       mbox->mbox_base =3D devm_ioremap_resource(&pdev->dev, regs);
> +       mbox->mbox_base =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(mbox->mbox_base))
>                 return PTR_ERR(mbox->mbox_base);
>=20
> --
> 2.17.1
>=20
>=20
> ________________________________
>=20
> Confidentiality Notice.
> This message may contain information that is confidential or otherwise
> protected from disclosure. If you are not the intended recipient, you are
> hereby notified that any use, disclosure, dissemination, distribution, or
> copying of this message, or any attachments, is strictly prohibited. If y=
ou
> have received this message in error, please advise the sender by reply e-=
mail,
> and delete the message and any attachments. Thank you.
