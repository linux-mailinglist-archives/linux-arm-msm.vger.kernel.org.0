Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 673A2194AF6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2020 22:53:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgCZVx3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Mar 2020 17:53:29 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:24847 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbgCZVx3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Mar 2020 17:53:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1585259609; x=1616795609;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uXNBn+5beXvL99IhE5jX2SK0fQL3LYwVO0J1I84yEiQ=;
  b=MEuLsA0af5skvRNI+B3RzSgheMLiMpcAe6gjUYx7B7wXV3O4f8NVVxrM
   mS+8l3RypvFdxOUza4bCzH3uKRsjjsst2LU+hgE8DgIBl+1Be8mDqL3j2
   BGYuFMrF0mVDwaBxqfEGc4AuE2+e8ihUXM7vg7n6aSs1jnX9F9bM5hx+Z
   jbL2kDJ2TAghWSwrGQYZQmj/sWqt8dwNpZ5zI31LjnyYQPlHNGFpIHPI3
   IN9/AXEHg57u3YetKKpeEDuB+Jy3GdCcR8TFILEQPTgBNf9mPEdlQ8vB1
   kbPP6H1MnjUaETYeRzi9xGsuCjoBO5J33ZRvnKC1XWhWaeSMNGoHG5mdD
   Q==;
IronPort-SDR: WrmIxYxTTNx1VNUjeEGW2bkzuh2xYG074ZqgFvc5V8aAM+yQqI676em4LSoxx6UT7zj4anBsJE
 CI6oLBiwrqmDwqbFDTq36YOn4OtmaPer/Rw/n1V7Dx/92rxdsBrqTAHbB48rO/emYAgpdPOi1j
 Xdfb83GEIfgLExDskCZyNol3/ArVRNMVUYfIg1eBVu7yVDDdZZvhisIIfMKmgNaflqkjxIMwD2
 9kBcvijEe8NhAdCALr3rXlVHfKuh258dnCv72osiA6Jss8HPckOzLm25t8ZSvYaope7cvoHDMd
 S4o=
X-IronPort-AV: E=Sophos;i="5.72,309,1580745600"; 
   d="scan'208";a="137994724"
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
  by ob1.hgst.iphmx.com with ESMTP; 27 Mar 2020 05:53:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R2/Yuyz9H4VHAOei78iI1ZuarhsM47myj4y9awCL/VsSd+VBz5qDCCeR/fjrB3x+5+zXx3byc7ia9vfhhfqWrhWJ3xg84LA2YfyBVlOHo2BHDy5FwrX6cP4Zvd+CDbk9tTorzGP/DTz1wUpqgO6cisc6F+poPxCZN3qS4gD1yR03Dnh4ghEbiIQImW6+OnyU2maD/J43hEgLpK47VCmY/c9gd6vF1C1StFND5ljVwSHftMUT/j5ANR7b7Rcc/gs43Mv68j9kbzGn/IRSwHGduBit6XcArFYn6zjg/l7CqfAS8d4Cdgj23IED6F43FkKoXNslrMOgUavTl4SeolhErg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ahZ7av1DLM0iQa+vWEvAua7WrFszKXAYnVexQt2qw5s=;
 b=UbBrxBbrp8cym+YEGysiVglPP3RVe1XOT12uEewjuvXckEAGa6mTNahlyah+zINc+hMkTVYOJlnPC/iRB+sYSnGMODYpgEyaiyhbPo0ZsqC8V/ynSn6zZLjLR/7naQ+8x5j/Wmb94OPlBVmtOoOcYC7YvllHxMS/i6Iv/jJ8ofAU5mfoMIa3v9wSqEyKnnEQLedNvyP7IGeVwVUHdHCn6ikyxgvaNO9++K87pRPp6ADIO6wV/a457rMUceUif7vz3o8CwHRqf0ZlF9QavkI0JtbGI/Aq+pyC2yq30OTFv/20zjvXwqozOfGOPiMZ+W6M3WY968HdRZi2Y3emlFxxxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ahZ7av1DLM0iQa+vWEvAua7WrFszKXAYnVexQt2qw5s=;
 b=ajM53H4qCKDTPHlXFl50i1DE/vlq8ZbfwAc4d5sfWmTNNx2Q8BOc6IKWhqkqoF2mAzXksQc3zENZqhLhJE8Rm7cKJrmTzkY1ePZaqInZ3KSYMdre2bD4/8dMgngb+7XiRnni6vE6eQ/Lpmeepm0hnv0srLckbi/btaT0bqZfTDk=
Received: from SN6PR04MB4640.namprd04.prod.outlook.com (2603:10b6:805:a4::19)
 by SN6PR04MB5117.namprd04.prod.outlook.com (2603:10b6:805:93::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20; Thu, 26 Mar
 2020 21:53:25 +0000
Received: from SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::3877:5e49:6cdd:c8b]) by SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::3877:5e49:6cdd:c8b%5]) with mapi id 15.20.2835.025; Thu, 26 Mar 2020
 21:53:25 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Asutosh Das <asutoshd@codeaurora.org>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
CC:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: RE: [<RFC RESEND PATCH v2> 0/3] WriteBooster Feature Support 
Thread-Topic: [<RFC RESEND PATCH v2> 0/3] WriteBooster Feature Support 
Thread-Index: AQHV/xwNYV0VnkXEJ0CJzjUTzOr6yKhbIwhA
Date:   Thu, 26 Mar 2020 21:53:25 +0000
Message-ID: <SN6PR04MB46401B509D68CAE9C4828B0FFCCF0@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <cover.1584752043.git.asutoshd@codeaurora.org>
In-Reply-To: <cover.1584752043.git.asutoshd@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Avri.Altman@wdc.com; 
x-originating-ip: [2a00:a040:188:9054:bd2c:16c:d1ed:9a1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ba9fff60-7477-4810-2227-08d7d1d01c41
x-ms-traffictypediagnostic: SN6PR04MB5117:
x-microsoft-antispam-prvs: <SN6PR04MB5117FFD3F02080B8A3634EDFFCCF0@SN6PR04MB5117.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0354B4BED2
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4640.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(4636009)(346002)(396003)(39850400004)(376002)(136003)(366004)(2906002)(66446008)(33656002)(186003)(4326008)(9686003)(55016002)(8936002)(64756008)(66556008)(66476007)(76116006)(316002)(52536014)(478600001)(6506007)(81166006)(66946007)(110136005)(81156014)(86362001)(8676002)(5660300002)(4743002)(7696005)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4xOuIuCoFM/0e7dSqbVGikcLTB3naFzS3hbiDqvzsspIIeOL3yGN94ehA5qlfJbTudovnp+RjbUoBOUoo2lThNAzBqUT63Vh/YqlLpwEwfGgaWzkXt2FnleGSt/cOQ4RU/ZI1ds3Rfg6SoemZ3O9BPdcscIOZqsTu5dqbVpoMwIQh9Ka2eSV7S0dueD1FTHkcsqTDXol/QdawLgLsocN3JsPAWzlA62V8+vX5uFmI8+16K1cUPV1cyFxU0xMJJZ2TJM/P+rPXNbdE2VPdN1HOY+VOycY74EPwvyMQxTT/jHEGb1yokmw/vw46wtbgLQuz+Rx/3JBz3bAr2S2vU22ZUEnXP1cncjp2pl7OrTL9Ul2IIAHIgQcc450YxQWVXIG2aLFe8TbvE4H72GnZ7gCtbZrCRWvUue8b5SVBtM0gRx6jS0NQYhTHULGNSo6IMUB
x-ms-exchange-antispam-messagedata: Y92P1Grdxm45Z7+9AGh5vtPrG1mR4Mv/AfwS7IhZq+bv8BnRECv789VEOQlesSQS83X5KkS7aSjnj3C+tlEeVE/rCktRDZAoRTb54lczcjdOfQww7wbd3bL5aJoOw75NlOvFZl58tPVQgE/kKlylYvbtkQupWQ0fc3SMrCMIrcPItLn04SshfNBjJRLNVAeW3A+5YXRC0GiOlvMTXddvyQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba9fff60-7477-4810-2227-08d7d1d01c41
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2020 21:53:25.2170
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 79CWDDXXCZO1RYnxGaSLfng/sIuqPcpxHYEMEHC+pkrDF+vhF/kipykZgmZoTY6CD9JG3RvsqU4tvRs17DvfPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB5117
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,
The code looks good to me and I encourage you to submit your patches.
I just want to make some general remarks:
 - The way you use the clock scaling to set WB on/off, is IMO, an elegant d=
esign choice.
 - You should add a platform capability for WB
 - As for setting user space configuration options - I think you've got it =
wrong.
   You should read it from  bSupportedWriteBoosterBufferUserSpaceReductionT=
ypes
   (offset 0x55 in the device descriptor).
   This is a configurable parameter that the chipset vendor control and can=
 set during provisioning.
 - I agree with your approach toward flush during runtime suspend (keep-vcc=
-on):
    it is the host's interest to assist the device with some extra idle tim=
e if needed for WB flush.
    This way you will assure consistent write performance.

Thanks,
Avri

>=20
>=20
> Still a RFC patch, because I'm still expecting some comments
> on the design.
>=20
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
>  drivers/scsi/ufs/ufs-qcom.c  |   7 ++
>  drivers/scsi/ufs/ufs-sysfs.c |  39 ++++++-
>  drivers/scsi/ufs/ufs.h       |  37 ++++++-
>  drivers/scsi/ufs/ufshcd.c    | 238
> ++++++++++++++++++++++++++++++++++++++++++-
>  drivers/scsi/ufs/ufshcd.h    |   9 ++
>  5 files changed, 324 insertions(+), 6 deletions(-)
>=20
> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a
> Linux Foundation Collaborative Project.

