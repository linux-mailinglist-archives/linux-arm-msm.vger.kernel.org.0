Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4327269ED6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 08:51:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbgIOGvk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 02:51:40 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:30414 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726031AbgIOGvi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 02:51:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1600152698; x=1631688698;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WL7NAqeSAcRqZQ9vPRDEAV8AloD7B9bR8zgCnYRdtRA=;
  b=MRWoByS+nnyK9AXCNEpK1yw4/nkveQlYLuDNh7cmmY83zOtVicq39UCB
   a16hUxZewQO3Rj5LP74ZyMlQGGov+AXBS8Qc0gR13C7gof8dceOdGym8q
   9B9fakvi7BNuwMd/oviDTMfbb/NAivAbEBMQmWYGPXjvOJvHUFqix/+Fy
   KR83GvDdFjOGC3vFRIjU40FxmnwROCn4tX99uH2anKw4sKSq6EOx0Nenk
   Flr5Rf2ERVZSMusY3SARXSXO7KhNtrDEffNO9WP1Poe/18NvMW+cLr9VC
   fyq6OwGdpM3xcMwynyuoh+gvaCRZ6DW+tWE8SWkhziqcZ3FjsEeOL6Ucn
   g==;
IronPort-SDR: FAPiLLD4PBHEY41i+N7WTrcq8d/IjnhYYy8H+mHy3eyy8zxMxrgKB3v/1vmA9899LHdkHqtes+
 YsYwC0IFR7Disz0IYfINOt+uV0Fl3myhclqQCLFZkKQv9FDfxMmyZOMm2J/ZCGWi2XPr58hjos
 ZhbljWJmQb1zy1/l1POcZ6EUM1AmRERk9B6QP1xKWrCbXDvRxk3zs4jt3ghQZOHo+gqSYP/XJK
 6Ahsemso03EnrJW9vNfxNF371jHNJQ621M0oyWpP9rqkyZeuj4O+RhbWyvRP9n4WXbH7M4oTFh
 BZA=
X-IronPort-AV: E=Sophos;i="5.76,428,1592841600"; 
   d="scan'208";a="147312909"
Received: from mail-co1nam04lp2054.outbound.protection.outlook.com (HELO NAM04-CO1-obe.outbound.protection.outlook.com) ([104.47.45.54])
  by ob1.hgst.iphmx.com with ESMTP; 15 Sep 2020 14:51:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/1mneO4KDoJ4kK8b4esRhejb7HQNzwuT5enkWioETlxi8yeA38ov6wR87aUvkE1wfs/vm/InyWdnvPD0nuwfW5hvVwGigm+hf8UtAEONglCjq9azNEpB+Di+iOHkTBsY8KLfJfYTBaqZBsYZOnm2Tea+8Ip7opWbntVR4ElZiHiy0xrze2hsIt482ffYuiEcP4tm0gxkbJ2PAJwkOhwvc4fJKisK+w9aMtAdU3DIgUQwNz2Ia+m/cXKWuQOCWK64jPWqDZtmbaDmSgjxhRFYn80DmqA48g8JjeiqLwIzvgv2jz+sTAmrvBAeBObMJhaz5d3xPnK1ZFZ6ZtD3r+WAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tOGvVvWY5Y37EklkQTqz7tADHI32Pqm99AbuuSFWhJc=;
 b=Y+5R5YT+IeRH65jDKcDNSClyzq4I9WMA8mfyZpEUjJQZeoVn9ctpiyyw1ngUoPiBkGvbovJWFIsXSiy1+QNE57mM9EG3U+sK9N65wBEB6q3CNpaaiyI2M7J9xtIRLmBvwoc2+axwds7vs4a65JUgkqtXvKZIjh0oU7KINc/XdCoyab/ISuHNJS3EUZX4I2AAHERRVPiE1R+AdgUqKZLcnKt3VTGUUdhAbm8cFUztLhJrjY2AjZZr5t26IKasZsS5Y9GDl7ldYv7PPYZnOh57nd+miadAkDUCzumClz9WdpqaczkGmhD7lvKOIisnadB1Gp5o+U+KHlavyyKdOmwpbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tOGvVvWY5Y37EklkQTqz7tADHI32Pqm99AbuuSFWhJc=;
 b=MZ/BRqKywAigntV05jL+sXDdXz1QOvp18T+IhYs+SoeXlSji9ZPGwDQBOvQVHfP+MaHyNRFMjCNjlAJyRbeqCrt6dWMLWskh/WYYYB0TVqBx84t/FH9qd/Wzx5B3LaXWBnnZ3B6wGgGNfavTWJjT7oh3pkb9jM1z6gB7wbhpobY=
Received: from BY5PR04MB6705.namprd04.prod.outlook.com (2603:10b6:a03:220::8)
 by BYAPR04MB4950.namprd04.prod.outlook.com (2603:10b6:a03:4c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Tue, 15 Sep
 2020 06:51:35 +0000
Received: from BY5PR04MB6705.namprd04.prod.outlook.com
 ([fe80::2c49:48e2:e9fb:d5a0]) by BY5PR04MB6705.namprd04.prod.outlook.com
 ([fe80::2c49:48e2:e9fb:d5a0%9]) with mapi id 15.20.3391.011; Tue, 15 Sep 2020
 06:51:35 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     "nguyenb@codeaurora.org" <nguyenb@codeaurora.org>
CC:     "cang@codeaurora.org" <cang@codeaurora.org>,
        "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        YueHaibing <yuehaibing@huawei.com>,
        Bean Huo <beanhuo@micron.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1 2/2] scsi: ufs: Support reading UFS's Vcc voltage from
 device tree
Thread-Topic: [PATCH v1 2/2] scsi: ufs: Support reading UFS's Vcc voltage from
 device tree
Thread-Index: AQHWgCVjnykcytgHNk6DNhNz/3ZIoalmYjdggAIrSgCAAMrq0A==
Date:   Tue, 15 Sep 2020 06:51:35 +0000
Message-ID: <BY5PR04MB6705F57DAF788FAFDF71FFC4FC200@BY5PR04MB6705.namprd04.prod.outlook.com>
References: <cover.1598939393.git.nguyenb@codeaurora.org>
 <69db325a09d5c3fa7fc260db031b1e498b601c25.1598939393.git.nguyenb@codeaurora.org>
 <BY5PR04MB67051C08A73119B554E4F352FC220@BY5PR04MB6705.namprd04.prod.outlook.com>
 <170592eceb26da041f276cf4ca33aaf2@codeaurora.org>
In-Reply-To: <170592eceb26da041f276cf4ca33aaf2@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7fa99e00-ae52-404b-57e2-08d85943c9e2
x-ms-traffictypediagnostic: BYAPR04MB4950:
x-microsoft-antispam-prvs: <BYAPR04MB4950B81B0B968F463E454E49FC200@BYAPR04MB4950.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vXVSwBUqXcobhxYo39aISWVBtPSKjsvclALTOBhaYmw77KTKiQxBziPgTmI4pwTWuVzPHVsGQVi7WNk2T+JbqW99Ygc6ktPbEEPRCtZeMFc9gt/hTGwJMHym2lfi7mg37fMRqU5OAoOymUO+hdyf0ci8BSKg+H8oim7u+k67gVybmmNgfUlZNGVOAHJeShbgjspsOZ8tbKADKcvqJNgKFk2q8IXCoLClXIYb3HyxeKjjHM2vpsZoSvW2mskJnX6lcfWXdIgNQCwIi65auZmp7s7TBjAABer18iuemF+zVgtnxeis7/WbjLaWpSCoV0v+APDYoJf27ipeaaZqEgpaIw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR04MB6705.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(396003)(39860400002)(376002)(8936002)(86362001)(8676002)(5660300002)(316002)(4326008)(7416002)(54906003)(9686003)(186003)(26005)(7696005)(55016002)(6506007)(52536014)(478600001)(33656002)(71200400001)(66946007)(6916009)(66476007)(2906002)(76116006)(66446008)(64756008)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: J2gGt7t2NIFfMcnWa/P58Le1Fqjro/y8u7O3jUP5yYPrDWBsorm1RCcUJ+UFrFzsnfeowAHU55XS1bRLJrhBIxYfT/8M2pJwsPBZW2g4BxKLalaXd1mW5lP7t/+QieKKTf8ZzzVys2M6YMjhOB+E2I6m19Yme/lY+7y0yMzOADeG4U7pdm7q2K0H2kSsH+Dl3l9SY8Ahsd+1YWR2MUZt5nGBi1jMcDk0Yd9gPTofoZc/FqaB6UY3tf2fO6ywpWdMdfHlyPOlcGvUd7Nl33ReOc7zATYpa2BwjUzX7uIbgf4YjzhKnOT/+I+mIoiuO4Nn+neO+eoijCjFZsltu9K1Jobsy8L3wbsQWOp+JUVMSITqP1hPVnqPQySdJmC1KNVHyLUp+VJtWWOUdGHKkTkft1tmjBwmTszwxdLjrmq7h3K+V7tp/4AtO2a8tBnYwmKTuuVK4PnQUGYt3FgK0+ryEctQKp+2YwuFjTHi7EfpmNioI3NtymHEKVMDshVXlzeHGg6ot7BuiV3rywHVdX8BfAUAboezSftz/hcVnN28kacSAuGQePsc1fWJBy7RR2v1i+vrL49mj7jXmYkUz1vkP0frX2t2+n8nbq95D+WgRuaqhGRjSvXtKJWUIkxWk5iN9MkxN+JjRR92TfemPJwWOw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6705.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fa99e00-ae52-404b-57e2-08d85943c9e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2020 06:51:35.6545
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pHHSnPnANrBA4ftMmJSKvPXnAPEN5ozmhWDmwZI7CSeZGoY+EnuH8LIn+6cOEUYxrgAW3M8nZqBgiuMvYhSKdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4950
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> > Maybe instead call ufshcd_populate_vreg with the new name,
> > To not break the function flow, and just add another else if ?
> Could you please clarify your comments? Are you suggesting to create a
> new function?
> Thank you.
No, just call ufshcd_populate_vreg with the new name, e.g. something like:

diff --git a/drivers/scsi/ufs/ufshcd-pltfrm.c b/drivers/scsi/ufs/ufshcd-plt=
frm.c
index 3db0af6..9798d4c 100644
--- a/drivers/scsi/ufs/ufshcd-pltfrm.c
+++ b/drivers/scsi/ufs/ufshcd-pltfrm.c
@@ -141,6 +141,8 @@ static int ufshcd_populate_vreg(struct device *dev, con=
st char *name,
                        vreg->min_uV =3D UFS_VREG_VCC_MIN_UV;
                        vreg->max_uV =3D UFS_VREG_VCC_MAX_UV;
                }
+       } else if (!strcmp(name, "vcc-voltage-level")) {
+               /* add your changes here */
        } else if (!strcmp(name, "vccq")) {
                vreg->min_uV =3D UFS_VREG_VCCQ_MIN_UV;
                vreg->max_uV =3D UFS_VREG_VCCQ_MAX_UV;
@@ -177,8 +179,12 @@ static int ufshcd_parse_regulator_info(struct ufs_hba =
*hba)
                goto out;
=20
        err =3D ufshcd_populate_vreg(dev, "vcc", &info->vcc);
-       if (err)
-               goto out;
+       if (err) {
+               err =3D ufshcd_populate_vreg(dev, "vcc-voltage-level",
+                                          &info->vcc);
+               if (err)
+                       goto out;
+       }
=20
        err =3D ufshcd_populate_vreg(dev, "vccq", &info->vccq);
        if (err)
