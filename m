Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 542C82F2B1C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jan 2021 10:22:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390109AbhALJTU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jan 2021 04:19:20 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:59537 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729760AbhALJTT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jan 2021 04:19:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1610443158; x=1641979158;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=I4gsIRFhp/vj1NQ0SN4EjvIsymf1hoiTUYNrpEFhHSE=;
  b=cDU9E9KcObUTADY0y21YfIhB9eh+mFL6W4BYEDaGkhLfb7qx+GThqfK5
   HX32l9j3tR5JLEl/2oprsidDZryzl1WGSvUGDMsdORJnA4oGkO6MsYfeQ
   k6UVVbJgDIj1vFlkAbApCr2FBgVkt4vANG8elXumPTd0hLJnKN2VlFMZC
   DlmvZbnW1irGyoN351TgM8HobxhUkzalVavIN1jmOK7bVc8dJFsdW+lmw
   /ZM3dYTjMPjMGfpWYmLDH94UC3G6lxkRl97ObOEmO9peUfZjxk4ksYl5A
   /giMHQWUdJqud9N9VODCgH/pFQmTMregV8xDtn9p9qcM/mfOMiFDp7bP1
   Q==;
IronPort-SDR: hTMbHNsqOdp1RVSK6U191I3iLprbTxQErAtDvfjauFhew8uV51AsJ/YlwUWDi7r1IuV/NL1SOr
 5BN95qJaOM+J5Afhs4Tl9+vkpuLUjBU17Ny8XXgBmAMpLPTzAmPD9qKa+Uwjc1VZFSYCENOMam
 d7vBOKp9k6/tKEFEbpw96B5qG3wxB+rJNylnerfUOVKd561z3S0T3o7Xu15Yp90o9cZ4p1FXNR
 rwcgsUrNFsP0EMMyIp9JY8IDMZx/ofB8rwmpmBXQFQuMiyolIcsbjHUyZjcq200L1wt7BBu21A
 ksQ=
X-IronPort-AV: E=Sophos;i="5.79,341,1602518400"; 
   d="scan'208";a="157229439"
Received: from mail-cys01nam02lp2052.outbound.protection.outlook.com (HELO NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.52])
  by ob1.hgst.iphmx.com with ESMTP; 12 Jan 2021 17:18:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q9OuW8NOIQqpnWn3t+SBizELIygrT0HkEHuFkw0ECD5cZfd1cPrbxs5Ml+GqnbNB/rxyOzH9gWYTrRENlz1Ngb+iv29m/+ge8oZwV/TrZbksO2+4WsBZRrHEfEZ41HmN+pakKNdbboe05SNY451jY46C1j8nKDvbgDWFcoWAa6W+LjaPuQ9Si2jekek34428O/sTxuObqVrb4tVF7VKVUgoYIKY+veRxDrww3AWzyixueRGWTBxte6ZdXqgrhwaLMc18/m9sXO8lL+fWIPVDQl+/cZ/kV7iHA4iHnRoyMeOW9JHoHdrQIQbi6vmTg2yfYkF8d6IozkbJEUAM3SYx9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4gsIRFhp/vj1NQ0SN4EjvIsymf1hoiTUYNrpEFhHSE=;
 b=oRO2f5UYOrQ/WYTZ5J1Dp0ioQ+zrqjvnsCngZdTmbJMB2sePib+e9AIdPn764jnxh/hxxXYG0xqt/yScD8gz9OeraLbRKAu+drPQPLBDbbjteZlSP1DwY9r+SKyXYJVTY7Bgr8BbOqIow1qrbpMS6CppLgc+G5cR4rIRznR5cOMofR1u/aM2KISgTsbI+eTChpY+Ciznlqm5H0SP+AsTYeTPY9ebqX2qEdoh/rKGHqAuY5Wqjlc1F6Y5SyK2FQw4nvErCFEhpt4uQnN69wBr8PReMjyVR31gkb+4q/gxMtQ3mS4ZEJ0Amcoadv60TabI6kZQFiviiZlKS7JRT8LD1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4gsIRFhp/vj1NQ0SN4EjvIsymf1hoiTUYNrpEFhHSE=;
 b=VdFpHrDmMg3HrojZbhkwqi070nPzcOl5Or+CVA42jXjxIp9Ujwe+U5mFoJiQ6ZNdYMy+1PtDXqHmCCbeyyf3JFkJ+WPC92KquO0fy8ffmhU83HQCDDnsJHRqsM1kRp2J8RPHdvwSDEO711wJ8/kivYl9KA6fvkr6IN2zpZmkEJ4=
Received: from DM6PR04MB6575.namprd04.prod.outlook.com (2603:10b6:5:1b7::7) by
 DM6PR04MB4028.namprd04.prod.outlook.com (2603:10b6:5:b6::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6; Tue, 12 Jan 2021 09:18:11 +0000
Received: from DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::a564:c676:b866:34f6]) by DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::a564:c676:b866:34f6%8]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 09:18:11 +0000
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
CC:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v6 2/2] scsi: ufs-qcom: Fix ufs RST_n specs violation
Thread-Topic: [PATCH v6 2/2] scsi: ufs-qcom: Fix ufs RST_n specs violation
Thread-Index: AQHW5a1VqSTxhQcE7kq5uJoK6dWcpqojvCzg
Date:   Tue, 12 Jan 2021 09:18:11 +0000
Message-ID: <DM6PR04MB65750C9BC5EBBE2F6E268D04FCAA0@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <1610103385-45755-1-git-send-email-ziqichen@codeaurora.org>
 <1610103385-45755-3-git-send-email-ziqichen@codeaurora.org>
In-Reply-To: <1610103385-45755-3-git-send-email-ziqichen@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9311bf8d-be4d-463f-726e-08d8b6dafbb3
x-ms-traffictypediagnostic: DM6PR04MB4028:
x-microsoft-antispam-prvs: <DM6PR04MB40288AD5EEC128A67FF6C0BAFCAA0@DM6PR04MB4028.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1002;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TxXi3XpAyTrZa2FmWBbW5Z2+6ivY6483pzgs41fbNrkioDhAWOTDsvXGZw0jR+PID0QKnwPTy6Z2wQVIvm420mXJjTO+Vbm4WPJQnJaeyN/Kg78mElVc8w4ClxzmJcFrCvxGG2N71dX+0BGdOwO2K4W78g8HBakdKRYhZYH1lBm/64HsOCN3a12j9fBjkdbMUAHDn/nw72mNjVmJT/yrdn4mdfkoyhWACp4Oy+Lq+YMU9eQnwWEAcjrYj2W1MJ00m+QOwmLwDBXHZzXUq+cUHOZTJAoCnc5Gw7zBTTfg0uxsTGHZLtCz6Z+BrMeO8vUPUaNTVk2ef5fdFYgCIUXws4LEqxvDLiljKF9L6NcDcT5QRDBeKxmuCsd66eNsLaefudkf2AmWDytp8TbQl7nNLQO/R44RW3ngK5qXA3mj5t+06Tm/kczZNXZWSa9do/Wn
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB6575.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(55016002)(558084003)(9686003)(71200400001)(26005)(33656002)(76116006)(7416002)(64756008)(6506007)(4326008)(498600001)(66556008)(110136005)(2906002)(7696005)(921005)(186003)(5660300002)(8676002)(66946007)(52536014)(86362001)(66446008)(66476007)(54906003)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?0yUlWRSKao0xgFtAUbPwx4NmoKOIcsFfJFdtSr7UzWkRs6T71/Fe9009Vhsn?=
 =?us-ascii?Q?tSB7nAxKjDZjF3a2IKT+wbUjyeJ7FjfkPKySDxduoR9uZH6mwDEGZLl65mH8?=
 =?us-ascii?Q?KnFqUVn7pTmSeoswom0KvPAMMUgTxj7b8moj5a7r+R8jQV1uwDSVT3xWJsuQ?=
 =?us-ascii?Q?9IWMRuNOYfH9aPMHFZlAVJyHyglubBbi9g7/kU/vRSLSdX86LSv5cKBtr12A?=
 =?us-ascii?Q?QKPU/Fm0KMt3VRw6AtFEz3DmH/caj1n0ek2jNX2kLQGGjDLskCBS6fVQSAcG?=
 =?us-ascii?Q?MMFHCAwYouzrmfZ8B3lJR16Nk4iEWdfxakl5aFqBRaPmysjjWUy162NT710N?=
 =?us-ascii?Q?CSTTddw6J/PY70MfVRxKVaT9qz8DP26cteumAj5l5Wlcks6fktEenR2uVzHJ?=
 =?us-ascii?Q?cPEaYETDWUMgKz5eyCPIAaxDyHmEq48IPkHD5Xi/ppGCskT1/iPsitXvHriE?=
 =?us-ascii?Q?JzIuLUanm4DsAySgBSrZyyzdcp0wc6iYtweD1cTXkW7a/2W90lvLbgRTCwdP?=
 =?us-ascii?Q?5U8ZRF+TA3Gpk2F1k89x/2NAjy3N9DM7H3L3OcccfcjPpIfAebPHgv5j7JLF?=
 =?us-ascii?Q?AlyKqY1ith766SB2tj4h/oX8SuvJ41OWskOrts6jK1X2+Og+SuptYPv2GIWQ?=
 =?us-ascii?Q?329PQmg2WTmdTzPtELlrZc8lC7jsl2MBKLL1kziUCLfsIWZiRkSAVogHFPf/?=
 =?us-ascii?Q?rthFHlGhkv2LtPN7rP5QUTR3uFCON/I6H2UJTeKS3nv+VcgnhUSP74uLM8op?=
 =?us-ascii?Q?RO4tJC2xl2/UayatBi9ItcEmRjwD1oPvMRNz9e9/n8auGIwidn6V7IB3siXz?=
 =?us-ascii?Q?qlI91OoZ9MewO/mLy5FjnQUhGzRmT2/2TRrvcYWbEdE++mYvOCzBrTZPyflE?=
 =?us-ascii?Q?doQ7jVcdpmBi3jX0I9q79JvROL9vnmy86pizyj5v0bsl/y325KuPSI3IbkQh?=
 =?us-ascii?Q?hxeXRJqUYZkDgA1fUuDJbso43EpK6b1jGn8iN0UeKA8=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6575.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9311bf8d-be4d-463f-726e-08d8b6dafbb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2021 09:18:11.2841
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EyvKqU+Z4mZqs2JHui5EPYW6wzGqlU7rruqW1Q8BUZNH9cVrVqZTwI4HZJhhg2CW2vkfbT0Y8yUw4tBatH2pLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4028
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

>=20
>=20
> As per specs, e.g, JESD220E chapter 7.2, while powering
> off/on the ufs device, RST_n signal should be between
> VSS(Ground) and VCCQ/VCCQ2.
>=20
> Signed-off-by: Ziqi Chen <ziqichen@codeaurora.org>
Aked-by: Avri Altman <avri.altman@wdc.com>
