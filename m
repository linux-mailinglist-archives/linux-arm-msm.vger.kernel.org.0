Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73A51267EF3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Sep 2020 11:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725926AbgIMJhx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 13 Sep 2020 05:37:53 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:6767 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725916AbgIMJhv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 13 Sep 2020 05:37:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1599989869; x=1631525869;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Qtf3/10mWp24vngxwRMQPNLweWF6wwAOI3xgon+sbl8=;
  b=YO0ChkECKP91+qsidjC9GlqCPG4cLUh9BZufd80PitFnhj5RC9zkoFb0
   mfytc66qFCX7jBJqEarnCtH71jW6L2lkYPW+CfosbYI+pbMvUIQ7xd+Dg
   R2483z+h9T9v3AkMVyWvHwhW6lPPQQLgdgzjxq+Mi7vNLPJm02BI5n5rU
   9ORL+P9En8suTXuIjXm5zcbVlpwJ/N+RIsAaAkaRhIFhiQVM+s8/OB2Bo
   oxGgPcxOWlOYJ4hfoh1w4hoXOE+sE2pHs7nkKYxN80eBt1kX77qDMWtq5
   HNOtASigRk9x8Op/YK6IcHXZlvIJQXvntEzvNuh0/A7l4JytoUzzSzH2/
   A==;
IronPort-SDR: OcKyfRdoygl4NlbifNKphjrqF9eMTsc7HaAp4fx09KL1dKr3pPyN9mgrK0ISjazY6CE1Mm7hVH
 SYn0uYWJ3QAQG52Cy6ljEMzz0lrr31s0hIZOBB5JDrkKSNHTcrY9AQu6mx3jomngudeV697R72
 Rss2cUuGfUFQxNLFLEdu7d6o9MHv0sbvw9+3S1zJFnaxZMBayD8JyCgCkgX9T+rz0IVymfyuwo
 kKzojIByNYuiUb2SJk05P7i+xrhCPCGfBOfq9VNbmHK5ypi4Py3Etto6Wmo6WoXB9D/yrNnJIc
 Hpw=
X-IronPort-AV: E=Sophos;i="5.76,421,1592841600"; 
   d="scan'208";a="256853783"
Received: from mail-dm6nam12lp2177.outbound.protection.outlook.com (HELO NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.177])
  by ob1.hgst.iphmx.com with ESMTP; 13 Sep 2020 17:37:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nHfuTv7LE28GMdDLbObOMtPJJ8vwf+CzKJngKbQLe+U+r8onsTKfCex2MKPQQAB38DoW4W0ISpkFM5wes5G3+U80hqijAwz1EWxn6IshvNV+YcAA/4tawf2Ng6mFB9VGUNqE6BWA9JmWVwvEY6CAUT+TWtLKnpMmhgozv8uSGvvq3CED4FgbzFZ3IMSkz91jd9fRucISfFyNnuLLB+3SkWMeA/IRpFCTwTKYGywCb627uJDhso/CLXuYLSeIqMz+by4KS3WkfISw2EcXwYDRZHis+H6JMznjEYukX6m7aHPus2Dxwco0LoUDK24NjiPXtBYGGfa0XF9LoM7lGdb1Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vUni32VZeki/hYp3Vov8fLugtRuVdrckOBPnanLCpvU=;
 b=aYbxfrGz25lL0lnSFpkoRhunYf1n1n03fLYahh0nXjZsiOlUd++3gbpaojt2g7n5F9meBNr7koGOhpkMoStU7T5hvdV7PfGFeJFA90XsSByvlHNhFYAhluVuu3Jp35EfRNQFkTcWU3glmBVywYFTooK2qhbhi2IPXKLFsMfpHV5Oz4v8hyclIZrexhw6AR7v/3XN0c8YoUjkVcgMA5jwACWgAlO3Dbx9+AnmiXvPeE74RAiuQwG4Ood2boJr+7Kn3URIk6G7YEU0E2wCOVz0uvG/47e1iF7DvmoolsX8XYC7EFP6S88D5tuYMtxex//2aUZOcEapqPScYlwegAVt2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vUni32VZeki/hYp3Vov8fLugtRuVdrckOBPnanLCpvU=;
 b=UqfXCt3MCpFuC0lE9mTCMZ91qy4R/r0vLOR45SRdR4yTp9nkD6ZSlSk8dmMkokiefE2amznDtyGEJtztDXyIAsVReP+OXO2EpkXRQSUEXM6NDBrXtdqsZLffqGGhHqr6ToL3Y0oxoSaDB4zz60+WmqUPlb3bL7pCk9UsdD/YkdA=
Received: from BY5PR04MB6705.namprd04.prod.outlook.com (2603:10b6:a03:220::8)
 by BYAPR04MB6069.namprd04.prod.outlook.com (2603:10b6:a03:ec::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Sun, 13 Sep
 2020 09:37:47 +0000
Received: from BY5PR04MB6705.namprd04.prod.outlook.com
 ([fe80::2c49:48e2:e9fb:d5a0]) by BY5PR04MB6705.namprd04.prod.outlook.com
 ([fe80::2c49:48e2:e9fb:d5a0%9]) with mapi id 15.20.3370.019; Sun, 13 Sep 2020
 09:37:47 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     "Bao D. Nguyen" <nguyenb@codeaurora.org>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
CC:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        YueHaibing <yuehaibing@huawei.com>,
        Bean Huo <beanhuo@micron.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1 2/2] scsi: ufs: Support reading UFS's Vcc voltage from
 device tree
Thread-Topic: [PATCH v1 2/2] scsi: ufs: Support reading UFS's Vcc voltage from
 device tree
Thread-Index: AQHWgCVjnykcytgHNk6DNhNz/3ZIoalmYjdg
Date:   Sun, 13 Sep 2020 09:37:47 +0000
Message-ID: <BY5PR04MB67051C08A73119B554E4F352FC220@BY5PR04MB6705.namprd04.prod.outlook.com>
References: <cover.1598939393.git.nguyenb@codeaurora.org>
 <69db325a09d5c3fa7fc260db031b1e498b601c25.1598939393.git.nguyenb@codeaurora.org>
In-Reply-To: <69db325a09d5c3fa7fc260db031b1e498b601c25.1598939393.git.nguyenb@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3d0a0be7-6af0-47ed-f8e1-08d857c8aced
x-ms-traffictypediagnostic: BYAPR04MB6069:
x-microsoft-antispam-prvs: <BYAPR04MB6069A60F2AD60716E7269ACEFC220@BYAPR04MB6069.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1443;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T5BYmfAklosVPZk4QfJgNh86yKX/dxt+PGnPLEtvGm/jtWvdVn40ePthDN00vCpPT1k6XJi99jEkp7zRGwGNrKEvkQSbX7lXS/4Sqyw2rje1VRGGqX3TupP6T01V5TNJBBKc1WkZ7qgczzw9myEz8Vd2ftn0A9/4gIFl4JJLzdnhtlbciAIvfImZ3+vxdRhPZw+EkzyOlRJ8K8+xxc/4RWKmngyupLH7hDJgMMUrh7PkiVGYqdFFHV4q2uz0K7xp1rMEQ195Ro4NASfudo1LThPJS3Uxielj5dXRSGEx9c+AhwgGxgz9wa6PVLNV1/6KzwyxKLVCYzDCPP59EYNp8Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR04MB6705.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39850400004)(346002)(366004)(376002)(52536014)(8676002)(83380400001)(478600001)(2906002)(9686003)(55016002)(26005)(7416002)(316002)(86362001)(71200400001)(33656002)(186003)(64756008)(66556008)(66476007)(66946007)(4326008)(7696005)(76116006)(66446008)(5660300002)(6506007)(110136005)(54906003)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: zrMroOoUU3jmaq4nLamT/bA7xELBEqRJSG0XyJomDhJb7JrtkxQgNYdsFv6Lcx8CJ14X9+mixG7kkn4O9CNZ7nkbTwDJxglZl9UjaW2A78q/ZrlZ783/f1GB6OWQeJKMXP2cOk0542ulyyqDTmLVw60ENj7xuR6YxQ+v+ly8AzBePP7CksVDg9st/7LUQlkJ6uHFHcO4p9tL2RTQQ5mB/x8JdOuFm3EcJhxGtpgBvIL4g6HZRRqrHKEWhzal+2RVa/LLV3AjcAg7xJNZFXrmLDVug0fmIh7PUvdtpYoQ7zpMJ9pNloFHOjJtYgNuWDzJFBmqQk4Ag/sGfTtseRaJJKrrNFnwceaM5Y8IbYxBwT4Jo3RS+BvK/HGlHNroaUGWKhwWVKzFkjZpiRu2NxrEB8o1qSbWno20+4whRmKaJ0MuzwXIuF5S3qZHG0897DkiDInGqBa26LOmGTwxhhP+Obb+Q9NljdY8ky6n6P+2k60+yZzftiwR361R0sp/EWKymyoe+2OFuvR+O7KpXIOZ3GuF/YGkcyRWG/asCzgFa2DJSiT/KDJtmImRj0GPqQLLuAb8fpFZAoZd1li7mlSbwCqBrRquJWR15U5XHk3chk3i94YUS8/1Wb6j3FJFTIddmKk+foso3S9cOameWl++Pg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6705.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d0a0be7-6af0-47ed-f8e1-08d857c8aced
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2020 09:37:47.7615
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PoyPUXT1+u+10K4G0LoFqQVfafLyO41fjqmreVqoeiORT5fc3dRVZjUzlC5OiUBsvigjqVvhfv7vV5etpoxgMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB6069
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

=20
>=20
> The UFS specifications supports a range of Vcc operating voltage
> from 2.4-3.6V depending on the device and manufacturers.
> Allows selecting the UFS Vcc voltage level by setting the
> UFS's entry vcc-voltage-level in the device tree. If UFS's
> vcc-voltage-level setting is not found in the device tree,
> use default values provided by the driver.
>=20
> Signed-off-by: Can Guo <cang@codeaurora.org>
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
> Signed-off-by: Bao D. Nguyen <nguyenb@codeaurora.org>
> ---
>  drivers/scsi/ufs/ufshcd-pltfrm.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/scsi/ufs/ufshcd-pltfrm.c b/drivers/scsi/ufs/ufshcd-p=
ltfrm.c
> index 3db0af6..48f429c 100644
> --- a/drivers/scsi/ufs/ufshcd-pltfrm.c
> +++ b/drivers/scsi/ufs/ufshcd-pltfrm.c
> @@ -104,10 +104,11 @@ static int ufshcd_parse_clock_info(struct ufs_hba
> *hba)
>  static int ufshcd_populate_vreg(struct device *dev, const char *name,
>                 struct ufs_vreg **out_vreg)
>  {
> -       int ret =3D 0;
> +       int len, ret =3D 0;
>         char prop_name[MAX_PROP_SIZE];
>         struct ufs_vreg *vreg =3D NULL;
>         struct device_node *np =3D dev->of_node;
> +       const __be32 *prop;
>=20
>         if (!np) {
>                 dev_err(dev, "%s: non DT initialization\n", __func__);
> @@ -138,8 +139,16 @@ static int ufshcd_populate_vreg(struct device *dev,
> const char *name,
>                         vreg->min_uV =3D UFS_VREG_VCC_1P8_MIN_UV;
>                         vreg->max_uV =3D UFS_VREG_VCC_1P8_MAX_UV;
>                 } else {
> -                       vreg->min_uV =3D UFS_VREG_VCC_MIN_UV;
> -                       vreg->max_uV =3D UFS_VREG_VCC_MAX_UV;
> +                       prop =3D of_get_property(np, "vcc-voltage-level",=
 &len);
> +                       if (!prop || (len !=3D (2 * sizeof(__be32)))) {
> +                               dev_warn(dev, "%s vcc-voltage-level prope=
rty.\n",
> +                                       prop ? "invalid format" : "no");
> +                               vreg->min_uV =3D UFS_VREG_VCC_MIN_UV;
> +                               vreg->max_uV =3D UFS_VREG_VCC_MAX_UV;
> +                       } else {
> +                               vreg->min_uV =3D be32_to_cpup(&prop[0]);
> +                               vreg->max_uV =3D be32_to_cpup(&prop[1]);
> +                       }
>                 }
>         } else if (!strcmp(name, "vccq")) {
>                 vreg->min_uV =3D UFS_VREG_VCCQ_MIN_UV;
> --
Maybe instead call ufshcd_populate_vreg with the new name,
To not break the function flow, and just add another else if ?

