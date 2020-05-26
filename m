Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 201C91E1B31
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2020 08:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbgEZGZv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 May 2020 02:25:51 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:14433 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726746AbgEZGZu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 May 2020 02:25:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1590474350; x=1622010350;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZjTYbJhaz7ZrIxBSk0QPR2g0UfImYCc7hDMvFahCcaQ=;
  b=BeE/6/S6Mc3ZbqlZpW1nNyJQg9sML6V1TTxIBiu/QuMoMopMbz1pcVYI
   sjqJvjLgQDX7Ap7Gnf+OTmWXQ7txFnfwog7Gmnar8itQwaSks3+05Hf18
   JM3UKJGfYx1v/WOFDGrC26ZMWEwyNFKrVGyZAiKxPmH8Og9r/5o0mps+u
   wDshZX5Z9Ky8BP0Q5r8Vk3n3MjZZCNeIDsxk9IEc1mJkV4TIHcL3n3eJv
   Ga/Mya6xc3LAQCluomG8afka/vkmwpQ9BUKJhJFaAoHy1985VUgumg02F
   8CL04MnD5kqCSdLSr0jJs/mZkbnPPHvYVdHAT3rrCBCIE5RqlE1iMpgan
   A==;
IronPort-SDR: JcchQwdWs8GOtSSjcnqZI28ruHVDB15FUk8FjAli1OCU4YPy3XXaYrCRmV13Oo08d4p3cshNme
 RJ0nV/QcQTXC/Wj+Ud4OQdE/KZW/vkpj+OzRtvRDHpZn4FC7ZYvPNsZL47P+uMjiOjPDGw9Naz
 O4vy4W6UMH9xdpreCUFEZCZbWCEnuaHjOKu1sSWp/tl2lqFjKnUSjC+UOWhCIP6Ot13yZa5gs6
 HstRvL9qiklVv65zQ5k2sTSb61IOAYzwkDIkFd38mp+N3ASl1Sjw9WPKAbAbEATD9VCFEXi0Gd
 dG0=
X-IronPort-AV: E=Sophos;i="5.73,436,1583164800"; 
   d="scan'208";a="139937394"
Received: from mail-dm6nam12lp2177.outbound.protection.outlook.com (HELO NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.177])
  by ob1.hgst.iphmx.com with ESMTP; 26 May 2020 14:25:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9oPeWqtYxH98i7a++P+CRs/a95ciBT2kkxLrtAPdqOje2agDviLxVWw3J0JjkY41hT49hF38DjG/7XGXZcnpMd2vaie2dyBbOsD3YVBT/1Z+JqvipbRdStWy3jFd6Y2C3ebPXdFUywKfdOKa/+OAOlsvgFN1bOnFqnv/XLtaf9IPd0dewkOqire1JM3K2jyvHEQFNq8FxI0GL7wIKSia+fawv6iBpVLFeVc5U1dVg1forVM5GGVH8fkWmLK5z21bac3oeViXoncN+ceWS8kMR+DncPnNHBYCo3TgW9Zw4NPiIZ2G9ey0GmG0JgQ8aQknQmPV+LwoGIq4qnh0KsMOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZjTYbJhaz7ZrIxBSk0QPR2g0UfImYCc7hDMvFahCcaQ=;
 b=hq/X1c/NrHGl4BnKX8uphikLsM83ylYbZOuYgI9pmGLZb419SWdX1jfiJXq8oh7XkjMpr++6d6D9h7c9COMEPs40kIeIXtz3GvnHB+n7En0vpHl2oDwaYS6p6R/U4Io4WyGBnPy+ixjAORLA8HN591YL1uBXWGI1kIxLOXzEbGI1kCssLSQQ9ncH0x4fE97LPoWBKJJ2cSL6gxgjfBp0Xw4GSZ9vr+zcTyUS8aYnZCWO5RhZFgISRvjNwMi/pIdW3lEIckA+pRzvJdZhAxqFgv/aEAE/RxIvXJIo184ziW90CXxKP53puY0uByYgHRYvtnh6pnzOG+xuHjua21H3pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZjTYbJhaz7ZrIxBSk0QPR2g0UfImYCc7hDMvFahCcaQ=;
 b=xrV6ecI6nJTusFOejZHSVA/NDaLEr5632Du0Wuk1LNN0W1bfe8ZCkNlkFhPYtcrCUYnQ86Oa+VtLYnbuIrdyb05m3JMbgqSSwJ4CseiLyE3J0BGDj6Y+tTlpBcXCH8qe5ESggxVWiEJWbfFKaZKKhMZkaPK31xtQl3gYzwNbR3Y=
Received: from SN6PR04MB4640.namprd04.prod.outlook.com (2603:10b6:805:a4::19)
 by SN6PR04MB5183.namprd04.prod.outlook.com (2603:10b6:805:100::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Tue, 26 May
 2020 06:25:47 +0000
Received: from SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::9cbe:995f:c25f:d288]) by SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::9cbe:995f:c25f:d288%6]) with mapi id 15.20.3021.029; Tue, 26 May 2020
 06:25:47 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        "agross@kernel.org" <agross@kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
        "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "subhashj@codeaurora.org" <subhashj@codeaurora.org>,
        "venkatg@codeaurora.org" <venkatg@codeaurora.org>
CC:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] scsi: ufs-qcom: Fix scheduling while atomic issue
Thread-Topic: [PATCH] scsi: ufs-qcom: Fix scheduling while atomic issue
Thread-Index: AQHWMtThdTzSVukCQkS54I37yLAKy6i55qqQ
Date:   Tue, 26 May 2020 06:25:47 +0000
Message-ID: <SN6PR04MB4640A91499223A26A7460738FCB00@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <20200525204125.46171-1-jeffrey.l.hugo@gmail.com>
In-Reply-To: <20200525204125.46171-1-jeffrey.l.hugo@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8fbe3162-81fd-428f-7bfd-08d8013da0bc
x-ms-traffictypediagnostic: SN6PR04MB5183:
x-microsoft-antispam-prvs: <SN6PR04MB5183DE4E94726D8189F26285FCB00@SN6PR04MB5183.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 041517DFAB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PHuArq7FNPUWogPwRn+KF6cgRiLee3i5/qbM4O+Xn0w1RMn5KvcZYN9H/v/iokyUEdtMIaUJVvgVJS8BrsjbqmLPj78e0hgZW14M4EWrPtIbVO2ulXHnqpf2LEHyU+6IYZAmTk0DlvseXw9yXQRL5HQwjw1CFB7EGomJ0s63kJFO5a1mEGzhkFbxyhUIjkD8Ti/2GMqYdKgxree/P/YjSjrDWnqNrQG1S2vC5fsXSCOUJ1Z1K7aFvtnRtaHnKU+KHUUa2cdVE++0FvRwwHU+nrz8JHU1StJgtrdObn71a1eQyfztfmc5VhYq6Ssi0G7FAZuVBJZfCZSbjN7hZVwlHQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4640.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(64756008)(66946007)(54906003)(478600001)(66556008)(66476007)(9686003)(8936002)(55016002)(76116006)(4326008)(8676002)(66446008)(110136005)(316002)(7416002)(86362001)(2906002)(71200400001)(186003)(33656002)(4744005)(6506007)(5660300002)(26005)(7696005)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: /ZJqbGAf7Y/xPGiVSPKprGCptJBwtZ+aS2uFDVhudYyq9aoLHJyDb0qxbL3u+WDxBTTduDghDxpdVrTt1sv0OKz83hc74TCuBSwa0WFSgvcN1BN6NzCE74dk9qkI41NVEQZzo0disBHcF8QrOwHmA3MTi2aBOFr93sjrf1NJuE4CrUxkC/ZPUvAgojc0AtYLl+FGUSWERXroexwc/r3obqc9akvvdXlIZ3rzS2rIB6bgUZcKrgI0LXhnszC1Sbfj+HJTHphKWRcX5vPKY14wM3WmSLDeptvs73H7zbBJSGnIkyKAvIszb3wJIWpkHCtnRsUuLfZq/88vkUtLF2JOLO3vZxHHhghHXqrEbp/RCPuBLBwuHyGs7GuENUNczFn7F3a5XZ6l7dRYZlOlVrnlFgLK8FpZlz+62DIU2Mg07nngErEPCTIkhvkcCq7yKahu5PX6+voO3DLfg1CXU3VV4BMbuEOxGNqffRs0GUsGSls=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fbe3162-81fd-428f-7bfd-08d8013da0bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2020 06:25:47.2757
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BBkX5KvKMdJWuM+QAPqyDR/1r1/ouGgp/chsr6mNtC5K+sRtZ6ok25qKgr+EVC++YCaoCAdzDsVvSLX3QeuWBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB5183
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

=20
> ufs_qcom_dump_dbg_regs() uses usleep_range, a sleeping function, but can
> be called from atomic context in the following flow:
>=20
> ufshcd_intr -> ufshcd_sl_intr -> ufshcd_check_errors ->
> ufshcd_print_host_regs -> ufshcd_vops_dbg_register_dump ->
> ufs_qcom_dump_dbg_regs
>=20
> This causes a boot crash on the Lenovo Miix 630 when the interrupt is
> handled on the idle thread.
>=20
> Fix the issue by switching to udelay().
>=20
> Fixes: 9c46b8676271 ("scsi: ufs-qcom: dump additional testbus registers")
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Reviewed-by: Avri Altman <avri.altman@wdc.com>
