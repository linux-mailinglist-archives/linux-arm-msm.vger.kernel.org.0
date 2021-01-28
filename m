Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 111503072E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jan 2021 10:40:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231723AbhA1Jgc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jan 2021 04:36:32 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:63047 "EHLO
        esa5.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231918AbhA1Je2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jan 2021 04:34:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611826468; x=1643362468;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8fAgOU+NYE698NXo/hgja6d5v0iTkXUEveSy8kFEWo0=;
  b=BfeYg7kRJ9JGGZ0JqYzHnnZyO73A0+WS10p3ca9er1w/kwNZsw7dp4ew
   JGKb7mS22VRvymCkK0jh2LwX55MB34hLS/bhZUzHyc/S9SlJeJjezpYIk
   XRiRooaNLCLSkXSfm0YZFKZrKn1dZSGOaf0TrL/2ekfgP7RvIcMTYiia7
   /NVsxMJ+qllvDJ5XGD1IeYoTbmR178l+0XYSEdya0ClnAPnQgiakMmezd
   IVq0cW1JcOifCbigXipeDFNXNweRxL2Xix1IsTLpVr9tkvo2eYGFdPSZC
   tmJbjSBRH5VXrxJKm5Tt3hVVL1R5cgeLBVsrt5utJznWvBHUj7SNwy/d4
   w==;
IronPort-SDR: PX8A1/7/nwKon3q2UDdmypxUjCZK5Sh3VbrSh7HT2TmmE/mKpta8G4dN/1iRyiatPO1Qw3/8By
 gbuYHW8CvjmgAIQE+fSCT14MngTIjt18IVa5s5TkkDoNwWERfj3gXoKKO+TI8PvflLXviRbz3x
 wdZzlyQ4uz5QN1vhuy3D0oCxjISfDMlTEHpDrWfyoIchGWgWaGSGct+zWAhQkJeeaBbuMb7Y/8
 oq2xTxgLlyThZSaqRD9SlX1wWAkyqVt6R5y9rLJVq1QON8qS3qAKhFOWx4GTKRfail0UuZbSHg
 KL0=
X-IronPort-AV: E=Sophos;i="5.79,382,1602518400"; 
   d="scan'208";a="158530082"
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
  by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 17:33:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1ViILimGCqX3GtFRo2UdrX8uhg1D3S1vHEAQXSE58kXqA+mTwZKEcvjIc5WEoZb/u3OcYnNWlym+H5FjbFX5jpAxeQwNPigDNwoNPm1oQFvgH8pvZwEix3aLpSJ3fVa8Sy7IaoSxsLI1aKQIkEmrcDQhlRLB6ifQGeS8dHsX7omogzvXEMqfdpAGRfO5QOpSODCKQCK1OYZ5GzjXWmNUKzOaE80OVEgNEhs2Es45Tix8MNJKN+JVhD7Bv9YeyIHtn/5QxQmPY3ESAsOdBu34aCu/xUUsNyNlp75ByQdfZuvsu1n3eBDc40LcBcdyv8v3V9rNx9EB0gqVFi8aCxdOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XH6sTqNkkaXJ9dfbC9hhTeF26q3a1jsAM++v+8TKrmY=;
 b=Mf42oxgUIj/dZBMPwcL9SB+a5/pKDqTv9OqsYzbw5nPxy1b3qRnH0dOsGCgNrrUgIfPVvbynTDbQTXelCj6SkuJr5OW9swfhaUxvk10EzydMfhFT2NBcRNYEHt5uPbDVAUQHPTi3tXc0D4kqn8D5/O2XAbss+XUfZqVp0gvRduqAYZDYUz03qDhyac6yH+DLJx9yUvJda/T1cEZ2cRFrpUL3r2ngKv/gxadzprJsT43u2lUibrMbYJKSX/PkpcxwaQACCkpL7zGI4cKBKFPOQ8pSnIbRCz8bncPxyK+SZFgjDJGHJpCjTiKHz+xy9f9rcbXASHHXi20KMTZUh/HKlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XH6sTqNkkaXJ9dfbC9hhTeF26q3a1jsAM++v+8TKrmY=;
 b=OXRm5Rd5yqNortZbnXCX/FX+6a95eTE5HcitIQ93mIDPA6C30lGtzs9bJA+1Y6FTHGloFFiiklEivLcD/nIl9nEC4IwI5koIMJIKKpRv7hDAE6iweUEdjbhuEDwk7KIBzhb/3DCb0jRoAPSmFoudx083Uq7pSRPl6Fz/lemffMk=
Received: from DM6PR04MB6575.namprd04.prod.outlook.com (2603:10b6:5:1b7::7) by
 DM6PR04MB6636.namprd04.prod.outlook.com (2603:10b6:5:24e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11; Thu, 28 Jan 2021 09:33:22 +0000
Received: from DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::e824:f31b:38cf:ef66]) by DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::e824:f31b:38cf:ef66%3]) with mapi id 15.20.3805.019; Thu, 28 Jan 2021
 09:33:21 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Asutosh Das <asutoshd@codeaurora.org>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
CC:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
Subject: RE: [RFC PATCH v2 0/2] Fix deadlock in ufs 
Thread-Topic: [RFC PATCH v2 0/2] Fix deadlock in ufs 
Thread-Index: AQHW9Vie+M7fx0e78UqvBAHwJWhHSw==
Date:   Thu, 28 Jan 2021 09:33:21 +0000
Message-ID: <DM6PR04MB657580F21E8474678D27D88FFCBA9@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <cover.1611719814.git.asutoshd@codeaurora.org>
In-Reply-To: <cover.1611719814.git.asutoshd@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8be84a20-dd8b-4557-cad8-08d8c36fc0dc
x-ms-traffictypediagnostic: DM6PR04MB6636:
x-microsoft-antispam-prvs: <DM6PR04MB663678EB08C6E47839913E8DFCBA9@DM6PR04MB6636.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:178;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u8FMnaUegWhIcXkDc5KwhggKd1ErBZsKZKbcjpk1Esdn1OdLL1VTntukIun2aRbPhgFxYroE8uPkcG/HdSIRTG98guYZUFKQSWtSxIWA2HNB0nj7xKKLLyGqf/6QqN+NQRKDuZxZGvXTB3pX2Z5h+AZNunK3crTh4bAlEl9inHxUYNb6FKGzg6hOqAbmBCCB2khfN2FV8DLg0UjNn0KIecGWk1OTQL25JUUWCGgMpULeLtCTMJEe7A4vNs3CQNKG4q/EOC8Pn0Mp9uqt5kbK11MJ5ntsZBHzrC8rY28//J6v146T3giqcBAZ0pV0Mx2SO4JLASwVDbYNPJahNuBh58PRVzJhR8XSz9gQbHI2OQpTx9U0/sOrOwp6ImllCFj5SK4p7umQg3dZeGAuQxeV0N0YH6EXVzZvvk/q/20Zsli6kLsUbHKz9YkQKi7hYkepIikB1Jc+GjNxzu1N3UBB1YoAdmCYSkOpPmn7eKcNbGhLyHoqeOdprbeCe6yqkEuFbMZJKZ2wNWEC1HEHXbUKQQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB6575.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(366004)(396003)(376002)(136003)(5660300002)(66556008)(66946007)(26005)(55016002)(52536014)(64756008)(8676002)(66446008)(2906002)(7696005)(4743002)(83380400001)(316002)(86362001)(4744005)(8936002)(54906003)(110136005)(478600001)(33656002)(66476007)(9686003)(76116006)(4326008)(71200400001)(186003)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?xYyEYnOTyWgBGuWmPc4nLBAL/He7kNZoAQMfIdIEcqhx3vNHwH6FGJDbUWGK?=
 =?us-ascii?Q?CPFrUWDLFQ74GGQfv4Q3CVWaqSkWkgx6K6Zc+d4D5EcTiIXieSKb2rXwWTe6?=
 =?us-ascii?Q?k/DgoF+nU9xj9MaczuYHNO5FhCvoILSnlplh3FlZN5YbCdV+iav3wBIyyq70?=
 =?us-ascii?Q?mx+lONinQ7fbMcCI58vNLkuLP/bzE1HkosDDrAN3A9byxCTEhhDQXz3OBHyk?=
 =?us-ascii?Q?LTCLwIsxLWKIFoUOH5uoBZADRiGB7rfWot4/GVUM+m6N9bG/wPm8wI5CFGzl?=
 =?us-ascii?Q?yTMIM6y0oNg0i/5cEAiMProtjz/o7USNp5owozWi9Zd1+cOoaxpC8UeZ/gX0?=
 =?us-ascii?Q?iO+2E39gsq2dLTX0bboIfFwf1synfpV45pW+/L9VINCXdGp6JHeVZ1nqaRhB?=
 =?us-ascii?Q?22hgDsOyhd2WWXLYAdaaWA+Cr0ZNBVU7pEyrKINGavqIRqv4lDIBJHZh1vao?=
 =?us-ascii?Q?ALGhV42JvLLLrkvaYtavLJUF2UwtFInY6AlqUut9zAjboAr2Q5lOy+Cs/AFp?=
 =?us-ascii?Q?yXtVntmOHr9ptQHVulkYSJuDy8TfaOHLSbo/fV75K51pJiQuuX9BiELQsyMZ?=
 =?us-ascii?Q?haDPtn8ICx+qJAcq1QZQ3/cnOXglecokZs08V623vphqnnNAhsh82mid7C7J?=
 =?us-ascii?Q?QEXSEByNew5s+V1NU6P0fii20EaQgpfcDsPqPU2HghBeu3xVTE1YbBElnPsa?=
 =?us-ascii?Q?0hG/Z+7/8OsVIe1Y86G9FYJnmLyR4PX0boRBsfh2plP2jnzqlxO83NMUwkD7?=
 =?us-ascii?Q?bxrkMfWBtt7FDuX235U52bLF9lkIvS/KsHRnflMpXXGTy4ohZESRxW98QiMZ?=
 =?us-ascii?Q?G00UylrX0UiwI8M+ZsHmUFV9f7WjqGfmCzyslHbsEsWuYhHsLa9Y8pQ2h7R4?=
 =?us-ascii?Q?XhYZwY7yFrMmB6G9bxDHgLEQdcm2YQg/Y1OTPspFfxNBN/Ke2ZR2IA+7Rx2/?=
 =?us-ascii?Q?1aC5mfT54C+KzxdR0GRc4i6l4joVnT1Mh+qopWMbR+BhcW2Xu6gDc7BXuC/l?=
 =?us-ascii?Q?VbOZkSZUO562ucPoyJbcSjUTKrcRZjc35DuryDFy810MJKvlE7iMZLN8IQ+S?=
 =?us-ascii?Q?2m5kLByZ?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6575.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8be84a20-dd8b-4557-cad8-08d8c36fc0dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2021 09:33:21.5992
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u3O8cAcirfUakGWbpACi1F5/ktWZCFZAcTf0AwFDy+1/A5IaaM4mADUk3aNL5jA+2gDESLVe3HdUIY18kl/Pvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6636
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,
Asking again:
Following your 1/2 patch, shouldn't this series revert commit 74e5e468b664d=
 as well?

Thanks,
Avri

> v1 -> v2
> Use pm_runtime_get/put APIs.
> Assuming that all bsg devices are scsi devices may break.
>=20
> This patchset attempts to fix a deadlock in ufs.
> This deadlock occurs because the ufs host driver tries to resume
> its child (wlun scsi device) to send SSU to it during its suspend.
>=20
> Asutosh Das (2):
>   block: bsg: resume scsi device before accessing
>   scsi: ufs: Fix deadlock while suspending ufs host
>=20
>  block/bsg.c               |  8 ++++++++
>  drivers/scsi/ufs/ufshcd.c | 18 ++----------------
>  2 files changed, 10 insertions(+), 16 deletions(-)
>=20
> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linu=
x
> Foundation Collaborative Project.

