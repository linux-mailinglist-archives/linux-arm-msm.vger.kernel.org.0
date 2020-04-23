Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C0441B573C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2020 10:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726547AbgDWIaV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Apr 2020 04:30:21 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:3624 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbgDWIaV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Apr 2020 04:30:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1587630620; x=1619166620;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Sy5sPReWK+YXkr8gYodgYARY2x6WnqWPef2AtNqJ2ik=;
  b=iWUWkooLYQUyrMpsbngkYVGqVKofqPGufRR3GlRzYo1UR3t6Prth64/9
   dTawReaFrhp1X+raQmea6csmoMFpg/zBnOuUX3ScWP5MV1VvCF62GlgIx
   U2YEn/zToNfsSsX6Zky/t3PlarUFbA8eDYQ90A64FpfjNnzwZB2r4gsO5
   rkr9LdKe1GkUUSMT3FhjuzE8dCeFUMW69C0U2JW8MCQPRGeqg6u0YMGTi
   s6tJq1Gki4322ro7uQmHODlJTikl6Nd3aHtqay0MIuRDXXTUWr+iN//0z
   wVrhmDZtHTmz9PfuMVGwDyuosgMTTaijUkhDDwtcT5Q4OOsL0h8/zDlKD
   w==;
IronPort-SDR: CyiStv7WixoUP/DutPSq1bJNMCe53rvELxqYG0K/n7wrAQTjccIje04gihKcvO3XJriLt2M3GL
 BWrCHssuFyk1CiL/cK1JqZ2WCzDXew1hRcaiO3AHzYfyCkBJFykHel2rv9KoWlN3g94WkwDSGN
 /9zYIefLZ1zici/QTo1YFS39uk+HW2sBDb8mH+uKnHDi7LVbisElODr+jGk3oqO5BbOtFBBIFb
 Mm8GIrUPUoS9cSom8MmOJ7kY9VlwU862KyFK5tkyCvFicoZETn2Fgw3sQcaXr1qO7BidH3JWQQ
 5q0=
X-IronPort-AV: E=Sophos;i="5.73,306,1583164800"; 
   d="scan'208";a="140311717"
Received: from mail-co1nam11lp2175.outbound.protection.outlook.com (HELO NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.175])
  by ob1.hgst.iphmx.com with ESMTP; 23 Apr 2020 16:30:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FtBajpWerem9GJHP91wY/BBbk1lY0UmIT3nMQI4E2flotRMDukKqAI84nrm8ge9RCxoNH4nkmjIlpRi71RqTjmPeenCOUqX2bWkEsG19J7DEUr2nfBSf4LWSu1pd47IfvqnWX8z9fhGAU/hxTqcgT8PicT9iz6WHblz5sw8MjW2wAMo36uzs4GZ3P4/JpOo7x8HeXWG2NgrAJk99prIJ8pVgpDZbu9wjFITYWwkH0jBEBel456a1wrsZ+GuIAA4wRct1UwqPR/37Fj6s3z8PAHJ9+ZmvRaT1mqt6UC39ymC6+WJE3p/FkgoisV8Ns20V+dEgjEI2teSF1Rny8GYLDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8S05JhXeOJ1nWk7IWsOYG+Wixn9CymYOdItZRwT768=;
 b=bXmJPD72VsGVdvhOCffkDsfyNGXbMpUfWlIxeugl1AjfooQ4IERPxJjxmDLd3dt0hEOnAxiaPpA/M7cGe+ILWEWmaOG3c9A0RxPVIBNPfF10qi+Q24MT5fBThXAArhywf213cGpzlzI7+d+EHEelbDaWNjVFDzdnfufmwj1ASsjCP4RwdRNTJiNDmyGAvtbci44w4HV8rTreR4zR9ghwv5AMIzr/YIPle8w3CQuCgfLvQxK/4MNtmqpiAV3bRbv07eUM1H5kn90viEpkznFdMTv1LVZiVX2OhIFs5VMIqAYBPmBGj2qJolfQaCEiVbvh5RlXqxqlkCQvyjMKThBkOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8S05JhXeOJ1nWk7IWsOYG+Wixn9CymYOdItZRwT768=;
 b=iRHALg23+S950wFMEHWpP+ImrVAOIOXgLjb8NQo/mUsYVDtmwRtRfEqo1e4QW+8pBH6WWgtWWxl0i40nTsi/VTYavREVZjwJk/fWDoHLK5Sp+DWos9Fb3pEIGbYdz2h04rtVIlE9gXRTnbDxN1/LREnQ/sm4AmFAI8iTrnK2joE=
Received: from SN6PR04MB4640.namprd04.prod.outlook.com (2603:10b6:805:a4::19)
 by SN6PR04MB4975.namprd04.prod.outlook.com (2603:10b6:805:95::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Thu, 23 Apr
 2020 08:30:18 +0000
Received: from SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::3877:5e49:6cdd:c8b]) by SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::3877:5e49:6cdd:c8b%5]) with mapi id 15.20.2937.012; Thu, 23 Apr 2020
 08:30:18 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Asutosh Das <asutoshd@codeaurora.org>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
CC:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: RE: [PATCH v3 0/3] WriteBooster Feature Support 
Thread-Topic: [PATCH v3 0/3] WriteBooster Feature Support 
Thread-Index: AQHWGUlr4ghcvY4/XEil4SAh+bHwQQ==
Date:   Thu, 23 Apr 2020 08:30:18 +0000
Message-ID: <SN6PR04MB464010AD6356D306EBCE3E5FFCD30@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <cover.1586374414.git.asutoshd@codeaurora.org>
In-Reply-To: <cover.1586374414.git.asutoshd@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Avri.Altman@wdc.com; 
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 051a45d0-5ecf-4bf6-2fdc-08d7e7608e19
x-ms-traffictypediagnostic: SN6PR04MB4975:
x-microsoft-antispam-prvs: <SN6PR04MB49754ACFFE091A1475739C33FCD30@SN6PR04MB4975.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 03827AF76E
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4640.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(4636009)(346002)(376002)(366004)(39860400002)(396003)(136003)(86362001)(71200400001)(316002)(4743002)(7696005)(76116006)(478600001)(6506007)(52536014)(4326008)(55016002)(26005)(8936002)(186003)(66946007)(33656002)(9686003)(5660300002)(66476007)(81156014)(110136005)(2906002)(64756008)(66556008)(8676002)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4npKjbA7TAZheaL90CYz6cE1qzk4vs87TbHFZwXB9JbhhBdAyCp4BHkWujSLI5E5mGESjX0wZ/VBLMgaPvbSl5fIQzQsqEW0wQaUiP2+rRR8ZuTrcdpYlP1K5Pp4V8mq0fDg4l3HJRRDYgjHFMZusIvrO11an+AuIHg1SOq60+RV1YMKkl2iUWEwrftF+3NUYrXL59vn2AIr4YOve5X9et3++3yc2grBzVT3fxOK18Om+/sidUtSbP8IzkTuQAyQEs6vsOukcYBp60/VoGvoJcgcp918HA8hf8fKsqAx/z3a9kPkXi+EctcquKX38N9xOlCaxL396iSkMhqJTwX9vJnS7+BmSpgCpAHNNcmCmqE1RcdbJqULuUpQklyIe11mFtCGemCI2NKjUVfVfRnw0H9sLWQsqmnr782dg0KLDti5TIkvatQImngr4UljOByl
x-ms-exchange-antispam-messagedata: V7DLiLQ2mTwdK1K3lBgkbzkBAV6VbYNUw5l58IHCcRhFsKdRpeFJKsS1BZoK8ln5WAWuELcMdg4FFaTDEiO38KHOq3R6DRDDW3rX7ZgILm6D1O2XJsY3+dfA+rYzDOcq/kgXqB0JW6dulbbpTyNT9Q==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 051a45d0-5ecf-4bf6-2fdc-08d7e7608e19
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2020 08:30:18.2306
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MKT74dsAxPBfN0EsAFodg8RMnU4cRjOX54tjspGNxSybQhEjHYUSPgwaaRUSynCQvqOFJ/9NJGgvub1VC9Kd2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4975
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Looks good.
Reviewed-by: Avri Altman <avri.altman@wdc.com>

Thanks,
Avri

> v2 -> v3:
> - Addressed Comments on refactoring
> - Corrected the commit message
>=20
> v1 -> v2:
> - Refactor WriteBooster initialization, introduce ufshcd_wb_probe()
> - Refactor ufshcd_wb_keep_vcc_on() and introduce a new function
>   ufshcd_wb_presrv_usrspc_keep_vcc_on()
> - Get the WriteBooster configuration by reading
>   bWriteBoosterBufferPreserveUserSpaceEn
>=20
> RFC -> v1:
> - Added platform capability for WriteBooster
>=20
> RFC-:
> v1 -> v2:
> - Addressed comments on v1
>=20
> - Supports shared buffer mode only
>=20
> - Didn't use exception event as suggested.
>   The reason being while testing I saw that the WriteBooster
>   available buffer remains at 0x1 for a longer time if flush is
>   enabled all the time as compared to an event-based enablement.
>   This essentially means that writes go to the WriteBooster buffer
>   more. Spec says that the if flush is enabled, the device would
>   flush when it sees the command queue empty. So I guess that'd trigger
>   flush more than an event based approach.
>   Anyway the Vcc would be turned-off during system suspend, so flush
>   would stop anyway.
>   In this patchset, I never turn-off flush.
>   Hence the RFC.
>=20
> Asutosh Das (3):
>   scsi: ufs: add write booster feature support
>   ufs-qcom: scsi: configure write booster type
>   ufs: sysfs: add sysfs entries for write booster
>=20
>  drivers/scsi/ufs/ufs-qcom.c  |   8 ++
>  drivers/scsi/ufs/ufs-sysfs.c |  39 ++++++-
>  drivers/scsi/ufs/ufs.h       |  37 ++++++-
>  drivers/scsi/ufs/ufshcd.c    | 241
> ++++++++++++++++++++++++++++++++++++++++++-
>  drivers/scsi/ufs/ufshcd.h    |  43 ++++++++
>  5 files changed, 362 insertions(+), 6 deletions(-)
>=20
> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a
> Linux Foundation Collaborative Project.

