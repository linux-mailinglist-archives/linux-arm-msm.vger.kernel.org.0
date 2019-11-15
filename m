Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F1C1FDAC1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 11:08:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbfKOKIX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 05:08:23 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:15348 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727022AbfKOKIW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 05:08:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1573812502; x=1605348502;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FNtF/gYkWWUwfXTFUgr5rytC1ey9Pebet5uw9paQ51c=;
  b=F5iL02nJuqMoRp6wrHhTAmN8FmL4MfO/ymNtMo4ZIRED/hF7p7pzxva2
   A9c8uyxSdjz07gY/FzkHQK5aFwwGMsFcUh/WAulYKOwzSakpWFfKjng5p
   M1PaEDyV7BNAd/FRGpI0KPt3pXVs2AZ6yOWoDdKaTHc9sUGNgbZ0uX+0I
   LRHJusoHpRCnMTWL+YdNY8CtwA2CBM4cMile8SlEPe3b64vcBRYuPSKNa
   Pcvmzq2Aqm9GYAwGRKW0w+cqzLfw3XbuVQ1WYntlqrr0/b6op86zJJ5di
   EL89pCuW5fSm81+EBw2f2EQdzHkOEQi2L4zwtRYI5ReF0NVlAmxzY4gig
   g==;
IronPort-SDR: wzQhptCjEsxt65SqngKLCOEPlIqvHhsF8RwdXkb+T7xA76DAT8vRvZEJH5vd1PKS38GVvcCAxM
 ylAA3tMKGQerL9ZXEzoBwS8LAUpWSiU6RM7+ySgnjFNRtUeTSgJdEZEwPZn9fqrrjop1ra1tOO
 YQkBEw73ZfdL4eVphGa+C27wWYh6qUevXcVF4xoO66zY7EHM/nzTB9Z9EYYQEH1t73gAO5cJCu
 Xkq5yzxym35yLK+fDvpT5UrWPQR80hXQsuivqNIeCWAvkP7isL+HnhVkBJsHj3IVOad1fUOo02
 jE4=
X-IronPort-AV: E=Sophos;i="5.68,308,1569254400"; 
   d="scan'208";a="230432784"
Received: from mail-co1nam04lp2052.outbound.protection.outlook.com (HELO NAM04-CO1-obe.outbound.protection.outlook.com) ([104.47.45.52])
  by ob1.hgst.iphmx.com with ESMTP; 15 Nov 2019 18:08:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hef6XaeiBZHqeRgd7ek5/6vbc7vVFWW3S9uuYUFzhWYr1VfRsHUHvOcVafQhagRzR/7wZhSaE6k4wn9LK8CmjZ6dDj/A9qCKns+u2v4M85OqhDGdzZ2FVlg9Fb0vQ0qn28CBgTvjV3G2Z+L87wyQvVqwPkWKL9oDJtfZDN7lniu+Y8gUGraO5cizeh4cT31YkCmt0d4AiagrcL1pgKM9EUi2Jk7t3KHsbSXXhDOD7Lzo/a5N+c5XBZILvAUUd1rbs9kIxhvEZWI2+AoWMgEqMxfUA5eFMMdL2JbzaD2WBYxeWFKof95FA69NeJCyQjTIaJdvVWvCWnkHEjZm/uMNnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNtF/gYkWWUwfXTFUgr5rytC1ey9Pebet5uw9paQ51c=;
 b=gsWnM4L0T5l4T/acBPytEPoIglWd6nxhv4pcygGv1ZQMqxpyep/nZ3bPA8LiCjVouA9UZC+gs6byOZRmnsdHAYe1EIscxid6pakJytbvsjxcqRpDMirT0FX4bgi+22f08Ph0n2KQ3cmLzHp1gqrYZVajbVERpjkwlPPqvM3PADYR/qRSfbyOf1GvIVtQFolgHEIblUOumnQ4LLC/H5qiKcXcQAbXS23f///e7qqKXWO+DYJOql+/k9N789w6gPjfZoo69ytVpSHXzgA8l1aFxUZV/5WDEZA3Vd2AfxGfi60Q2P1oB+beSlP24VbtNWkSJPGXLDB6DWAd1eaj607GbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNtF/gYkWWUwfXTFUgr5rytC1ey9Pebet5uw9paQ51c=;
 b=vTkZl/0S70P7+kNqk9f5w7V8PTBOQxDXq3UWMH6SssoPgwb/qbr8BDCDzoC+PGPNCCeEaKnKxUsuOu7qNlzOVpcv7bBkMPJ14iz/wKbabkNEQVWIeMpgZXLkjODnDiNdFXTQPBHdalx1EpeJqF3hYBksWKtPwdaN+4BwSBH01N8=
Received: from MN2PR04MB6991.namprd04.prod.outlook.com (10.186.144.209) by
 MN2PR04MB5648.namprd04.prod.outlook.com (20.179.23.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Fri, 15 Nov 2019 10:08:20 +0000
Received: from MN2PR04MB6991.namprd04.prod.outlook.com
 ([fe80::5852:6199:7952:c2ce]) by MN2PR04MB6991.namprd04.prod.outlook.com
 ([fe80::5852:6199:7952:c2ce%7]) with mapi id 15.20.2451.029; Fri, 15 Nov 2019
 10:08:19 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Can Guo <cang@codeaurora.org>,
        "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>,
        "nguyenb@codeaurora.org" <nguyenb@codeaurora.org>,
        "rnayak@codeaurora.org" <rnayak@codeaurora.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "kernel-team@android.com" <kernel-team@android.com>,
        "saravanak@google.com" <saravanak@google.com>,
        "salyzyn@google.com" <salyzyn@google.com>
CC:     Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 2/7] scsi: ufs-qcom: Add reset control support for host
 controller
Thread-Topic: [PATCH v5 2/7] scsi: ufs-qcom: Add reset control support for
 host controller
Thread-Index: AQHVm3tRycXhYztqnEKxVJjn2ZizD6eMAf6Q
Date:   Fri, 15 Nov 2019 10:08:19 +0000
Message-ID: <MN2PR04MB69914D9833C526A889134264FC700@MN2PR04MB6991.namprd04.prod.outlook.com>
References: <1573798172-20534-1-git-send-email-cang@codeaurora.org>
 <1573798172-20534-3-git-send-email-cang@codeaurora.org>
In-Reply-To: <1573798172-20534-3-git-send-email-cang@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Avri.Altman@wdc.com; 
x-originating-ip: [77.137.90.157]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c1da3fdc-3216-4a51-d4ea-08d769b3bdb9
x-ms-traffictypediagnostic: MN2PR04MB5648:
x-microsoft-antispam-prvs: <MN2PR04MB5648A05EFA2EB91EAF9E09E2FC700@MN2PR04MB5648.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 02229A4115
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(346002)(396003)(366004)(39860400002)(136003)(199004)(189003)(7696005)(66556008)(64756008)(66446008)(66946007)(2201001)(2501003)(14454004)(66476007)(6246003)(86362001)(478600001)(52536014)(25786009)(81166006)(81156014)(8936002)(8676002)(5660300002)(33656002)(4326008)(558084003)(7416002)(476003)(11346002)(316002)(486006)(76116006)(66066001)(6116002)(3846002)(2906002)(74316002)(446003)(305945005)(7736002)(6436002)(71200400001)(71190400001)(55016002)(256004)(54906003)(76176011)(9686003)(6506007)(102836004)(110136005)(186003)(26005)(99286004)(229853002);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR04MB5648;H:MN2PR04MB6991.namprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7MEJ7qUt+Yx/nJ3T8p3S0W1DOHIcraMnDEtFevbsTPN3XDQOmnhS+6OOMzKW38BBzhSp9Fx4RBDcfnCSx4Zg9YRmOoL0GlFRppWBtl5oFTgZzo1abMz5wpr3JIukHubbF17bi42P0PoCl5/M93Jn9qOdHgownqKOdVfi8O2UEWUvG92hL3ofxOIbIMNPs3sUMKQzK9ZnsVqPJxuswumJxwPXhvbx7A8EWeuwpdeJ4DJ1YmFcuk7jnJM1Z1kHPiWaYaVqSig0SL63KcF54gG7L4fcJbSJ8gx0PLDZE4SmKsDnjZ8TPM4wamDW36K3440OP347Zj/w/siypIfUIl7Ij1uuX/6EShAzQGl8bKpZFRGn6dqtcofSN9g1dy0rSyAxUvGU1rPK0Um750PyuNozGzZf2AdxLA+ER/BhszC2zGf4EXEz/U6oKd3thofheQYV
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1da3fdc-3216-4a51-d4ea-08d769b3bdb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2019 10:08:19.8095
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jtDg7796TSVPwUpe0o/ZpmLWWjn5niIMNkB0x+fDGMXLIglp7aWSdfMTQxS8HbllSaER1+UnI6Vzjj9FJICpWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5648
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


>=20
> Add reset control for host controller so that host controller can be rese=
t as
> required in its power up sequence.
>=20
> Signed-off-by: Can Guo <cang@codeaurora.org>
Reviewed-by: Avri Altman <avri.altman@wdc.com>
