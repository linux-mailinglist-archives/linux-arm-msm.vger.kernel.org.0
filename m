Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0D8B192953
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2020 14:12:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727462AbgCYNLr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Mar 2020 09:11:47 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:36885 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727046AbgCYNLq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Mar 2020 09:11:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1585141906; x=1616677906;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FDC51crK+WHTeWFkvrvL7KOIBdWpmy0UOCp5jy9DUsg=;
  b=SVBAHiUxwM6X01k/07NHOiWrRcgongRP5dUFTHxdHTdMg3XfPbsJXluB
   d42qT/NciY/PQI9utkd/HpSq02oUx+5MNaQFq4SLlX/yeCjUCFWk1YAvy
   baxKwDFkM39V9RbZf/uyBkMglUYe+iSzLuH7NykMRJ4IZvr7Ke9Ty8sjH
   xbIfGTHswNKiUUpwg3v88DeyYX5Onkrbm9hoLBNg5UmU3arBzKvBrsFQ8
   bXttRdbZlGUZrXAKdA/oAbO5xbG7b1uuiUkqtKplS8tEZGC4H9I4GuVNJ
   enhwGcNTmE+L/ylXPooOQatRbv7oGqjI7FJfVU/afFD3LgrmfG7gRJnR2
   w==;
IronPort-SDR: ToonmeZMk17zCZcRpZxH9412S9/1bkBDuEdGblxxR8amMi8W3jYWbCngy6Uo5kaJ4XEvFHvYon
 oIkDcuW5G63+e55e8OLgANyPa8Vg3T3zlRiynS5HY9u0eSyQC3cGVkhYzQHdCO3o/gGeHyejy4
 HTsK06ueSaX/E1XlFsZVVKqCUlSbu8e8tO4hjlDUu1kd07QOPGP0DSez1ICT1La/LUMMyL4Bm4
 zKE2SNfi5qJYgSy7iSik1lTUEW+gOQILNdbPq5kR3yjfgzgO2DX0DEJ5VBXhb/JuEKaUz2H5FQ
 AO4=
X-IronPort-AV: E=Sophos;i="5.72,304,1580745600"; 
   d="scan'208";a="241957519"
Received: from mail-mw2nam10lp2105.outbound.protection.outlook.com (HELO NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.105])
  by ob1.hgst.iphmx.com with ESMTP; 25 Mar 2020 21:11:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jffhvkHZN1mr/ckmUvIDDv0JSJQsYdlMyPbJqOMAh0ZSY5pzagoBxT7iExt290vj/sM/Jhd0NhVVoBTAqL7mHx+MEc++/S2k0TZBTFUPw3FF0klzUUoCMERLXlwFoo8Go0QXaguI9OiyJwFcSkqa5beeHhERVuTT+11NHYCz+C7BdrXnxuQxbE6LMQ1UqRVnNPbKT/XPgR0IDsh+L9Fc2WhM19lYZZI38jkk2bC69i4dOo9rRFKW+qk0osppzSFKQlJr8dwS7RHByatkuXhW9K1HHdu3qLCFRYP3d1ZRj8U/pMhluygZKMPAQ39Qs5SPTsT10AXm0aBmO6WVES+YlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kirf1PV4v7F1gBF28u6yS8h/7eRuDj/+nTIpdBduBqg=;
 b=RWlEuSA/J11uryxHFcAJ15SouJjiECPoYSlQRNb7RheAxKXumoz7ydmXLV8LeDZHVB9hzigEhCnCwpkE0iC/RWWMwYx4dRMB/Pv2dS2hjG/UTabwOd1oi6dXA9B1SWaz3Q23omkntW6tev4j25RXqqSviyVAeQOwD0wd0U6qMK4k1nUc7RUjVs+HEpqAFOOvw4ldVUFwiqSOQpVXhXfg4GRR7WP8hAMQP13PXHs0SWPU1oIop+TJnMB7vsDOSwfC1vmMjJyyS73A10cBCljBrZ104w0lMwWNJzwuNlzcmiHWHeM6eCnUTrDRB8cEn8bHs4jEmZHS8eXZiIqlhGnQXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kirf1PV4v7F1gBF28u6yS8h/7eRuDj/+nTIpdBduBqg=;
 b=QC7bkM8unN+ytKohrvlQwXHjaXv+I+7CLJyPBCIUXFwHYlpAxapAymD2ydru4zWLlZV+zQDaklfQy4nTz/sImZOfJZqJidL6T3TkTnCkmiISKtdIWJ5fa6WoW3Ox+OmQ/tbewOKvec6CKB61gXiT1BYRuxLuaiSSpzptiaYEQSs=
Received: from SN6PR04MB4640.namprd04.prod.outlook.com (2603:10b6:805:a4::19)
 by SN6PR04MB4256.namprd04.prod.outlook.com (2603:10b6:805:31::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.18; Wed, 25 Mar
 2020 13:11:44 +0000
Received: from SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::3877:5e49:6cdd:c8b]) by SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::3877:5e49:6cdd:c8b%5]) with mapi id 15.20.2835.021; Wed, 25 Mar 2020
 13:11:44 +0000
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
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1 2/3] scsi: ufshcd: Let vendor override devfreq
 parameters
Thread-Topic: [PATCH v1 2/3] scsi: ufshcd: Let vendor override devfreq
 parameters
Thread-Index: AQHWAjldPSd/dS3CHkmV7T+0N6HIQKhZJ5xA
Date:   Wed, 25 Mar 2020 13:11:44 +0000
Message-ID: <SN6PR04MB46407C82C61441861C4628D6FCCE0@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <ebd9ea7d0ebb1884b15e4fe7e3e03460c1e3c52b.1585094538.git.asutoshd@codeaurora.org>
 <59a83a2dba7d7f2be4bd4af56267fee8d1c5bb7c.1585094538.git.asutoshd@codeaurora.org>
In-Reply-To: <59a83a2dba7d7f2be4bd4af56267fee8d1c5bb7c.1585094538.git.asutoshd@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Avri.Altman@wdc.com; 
x-originating-ip: [77.138.4.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2e95876f-6dba-415f-c5d0-08d7d0be10f3
x-ms-traffictypediagnostic: SN6PR04MB4256:
x-microsoft-antispam-prvs: <SN6PR04MB42563E46244DA348F41FE450FCCE0@SN6PR04MB4256.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0353563E2B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(316002)(54906003)(110136005)(9686003)(7416002)(55016002)(26005)(186003)(2906002)(33656002)(8936002)(71200400001)(86362001)(66446008)(5660300002)(66946007)(66476007)(7696005)(478600001)(66556008)(64756008)(6506007)(4326008)(52536014)(76116006)(8676002)(81156014)(81166006);DIR:OUT;SFP:1102;SCL:1;SRVR:SN6PR04MB4256;H:SN6PR04MB4640.namprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WkQqKrS8w65z592lb8AVjG/vURjgFYAH3a9IxZDgOYlbuyfLZAdAAZdIaF4NCuu/12k4yZvsCmuhdy7aCJaLCA1VJFLLyO2t6va05szhmSly/ckO4rrBO4VOdDHGfQCvcJg7nC6a9YVlZw+bY/E50xkFxJ9BoK85E+ARG/VTx2M8gig9uQ21l7giKfzg3BxacHR6k0kMLYtkSb7C7kEPrm65PcKYhvnm5bAGuJNP6swplDwkfhsxOjvVQvv4QEUv0P6YVrKs6pVzx2STgZJnrdf0Fl2VZ8p5xPHnTBvkluXY9dfOFiR75f1BzQcxjvFsE5kH0Ub4Ne974gLU9heG7PVGa8R9mFkpkEECtGLwJo3uaHcblayruoWQqGC1XL/wI9vo2m51TGcprpglNct+CQwb0HPAyPIR1OjaPzInoho8+aNDmYku/eVllluaER+g
x-ms-exchange-antispam-messagedata: 34WzmkHcFwG0I80iVrlgAKeMLfLt5V6Xmw/Sq5Ve3v4u4mT+isRQehUAKdWwMCMoYoi6UZCXydt9C9Vqt2y3GXjjLEAhpnlFHEG92KgTHonA0GAIdE/NE+VNSuMAFL6126w+diJSWnGJPluiU36G4g==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e95876f-6dba-415f-c5d0-08d7d0be10f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2020 13:11:44.2061
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mdRTXBGUjH9s6npdxQOxCl7KNbE9eh8g74zl0PavvXwkh8oSvZ6+L+46zL2moc6K/O47D2ENOAboJDDECc0LLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4256
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

>=20
>=20
> Vendor drivers may have a need to update the polling interval
> and thresholds.
> Provide a vops for vendor drivers to use.
>=20
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
> ---
>  drivers/scsi/ufs/ufshcd.c | 11 ++++++++++-
>  drivers/scsi/ufs/ufshcd.h | 12 ++++++++++++
>  2 files changed, 22 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index 4607bc6..7643ef5 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -1300,6 +1300,13 @@ static struct devfreq_dev_profile
> ufs_devfreq_profile =3D {
>         .get_dev_status =3D ufshcd_devfreq_get_dev_status,
>  };
>=20
> +#if IS_ENABLED(CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND)
> +static struct devfreq_simple_ondemand_data ufs_ondemand_data;
Might want to set default values here?


>  #include <asm/irq.h>
> @@ -327,6 +328,9 @@ struct ufs_hba_variant_ops {
>         void    (*dbg_register_dump)(struct ufs_hba *hba);
>         int     (*phy_initialization)(struct ufs_hba *);
>         void    (*device_reset)(struct ufs_hba *hba);
> +       void    (*config_scaling_param)(struct ufs_hba *hba,
> +                                       struct devfreq_dev_profile *profi=
le,
This is an excellent idea, because not only it allows you to edit the polli=
ng interval,
But you might want to replace the target and status handlers one day.=20

> +                                       void *data);
>  };


Thanks,
Avri
