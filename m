Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 418561F4EFA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2020 09:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbgFJHe4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Jun 2020 03:34:56 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:59402 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbgFJHez (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Jun 2020 03:34:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1591774495; x=1623310495;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=N5CXIw3xWn1Ix2yltxJ7Hr8UblV9lh9zBohLnjHWGQM=;
  b=FrGlLhyu/QumndkHWbjILS1ZLbB6WA559BZ9uubqJ8RmAmSLqcGjj3Sq
   iZO2tsV6bmqYBrFLzPUQVFVFpKqEIyvURUIy2XL98ERpivN1M9NrtKTjx
   3fwGk9yxnkFnfuey5pSw0Py7ytNufLYXCIoM0IWRFI2UyQZspII0Ckmh9
   lvM3w67et4VlrSMCJ+rzvDaccSm8rh1CcmdCWAH/kcS4xQyjRw+Y1yU6X
   G4RXFfPcVKUgLYnCfek5oBotR/5ZrRXCPHxAK9Lq12Kdgczff8xm9AfLy
   hq9cSqCcuauCTr5HPZOKhpr9DrD7s4J4p0LkYZ/iu8rjlVXMYQov6Q1LA
   w==;
IronPort-SDR: 46TabCsXLf9b4XiCgkfmLV43ZGG5meDQoR0TgeeiyvUkkL3lFATP48kFbDeyrHH3AsioNgQ7P7
 5ztG+8B/IhQLqHVYRkM9fRwyXrMJmi85oWIxXostnXa27TcamWO2vfDNfFtB7OrUgLv7YUBZyh
 xnIKsh4pgIcjqzZDZsdEniR+rvdp+SmuUBExCOT7Q63SUqoi10sSEhaZjvswcHaha7NbC9T4hJ
 hKoaAuAYc+bSFfmBliTfdEebTSWPPxHjecVfu0AQYoj3hQOejKQGZZeD3/pPgmqvVNlUXYeQvG
 WqM=
X-IronPort-AV: E=Sophos;i="5.73,495,1583164800"; 
   d="scan'208";a="143939706"
Received: from mail-dm6nam10lp2106.outbound.protection.outlook.com (HELO NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.106])
  by ob1.hgst.iphmx.com with ESMTP; 10 Jun 2020 15:34:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=acwEUu8MxnWeRzaFWq6gjSJ7LcB5M4NHIRaCpNkN6f9hjtFe0u3Bsmeasse4SldW9NAS3KD+hOGH/FHZzvqxx3uSX1ZhVlkaDkSK1z9EZalYusj2iELIAgqvdNjKZzMioX/mb+RijPaTKEk4mPSgJTv2tPyIT6wOpDVjDp2XAeGaFqSWrHa95TyXHX8FPaAso0ZjAxfumIgDVUgWz3ZeRwiHU9Wu+sEJdlzGmw5mJt4060/8BJvwiqP4zGP6zxkKNj+NihUlB+1fruIJk6LKrO6aVW7rnEMEfzkYdW+OTHmIVhGxu4LvjHuKj+sWc2qliCbndpFn3L8yyDS/S3rRUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGXf+uySg4ko877dxApbpmItVWknM+bentjV7R1WC04=;
 b=Jmdhqt0sJlk/1wTshvJD6Kk8Fx3NeTo7Z5BYoaNZcW1WnyX8redFIGcABciIVDh8ix0KzwwhjDCOYr/CIlc1VMNHUMHFnaaPNfbYOViFQA5YvCB76F6QltzmV0zT6BVeq+2KnlvIzZhuu1eD9hjshw6eWXqbQhp9dIFy0n7Imr/Mw/rC9OGWyM42ii4fNnsdy4bC+V4QrYz7Xo4BW51NRS4jVzP4icS2jgj8FKU9uI2kUzjn7ItDZLjIhh7ODfHLhrnNW3w1T5Gy7PBJ3TMtybAaz3Wd0RbZosDMJtLdxZ4cA+HdFZBvPah1V6yw6RiDsWqWBPdiKVsP10oujB0BKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGXf+uySg4ko877dxApbpmItVWknM+bentjV7R1WC04=;
 b=eEZoUdajMehUlqKkdig2sSIhtQqWFR3hg7y9qrt44mNfG5BvcLtZdBeocODLFZvULKCKXNYsE+xHSJ4Uo35xDxT1aXTmZcU/HoRasgPbr/1jC9oLR8FxzB804y4sOdWVZtxbT0JKaAUVRiAesLRXPalK+MJ+CEQkbAKhyjSAvZs=
Received: from SN6PR04MB4640.namprd04.prod.outlook.com (2603:10b6:805:a4::19)
 by SN6PR04MB4975.namprd04.prod.outlook.com (2603:10b6:805:95::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Wed, 10 Jun
 2020 07:34:50 +0000
Received: from SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::9cbe:995f:c25f:d288]) by SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::9cbe:995f:c25f:d288%6]) with mapi id 15.20.3088.018; Wed, 10 Jun 2020
 07:34:50 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
CC:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
        "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "amit.kucheria@linaro.org" <amit.kucheria@linaro.org>
Subject: RE: [PATCH] scsi: ufs: Bump supported UFS HCI version to 3.0
Thread-Topic: [PATCH] scsi: ufs: Bump supported UFS HCI version to 3.0
Thread-Index: AQHWOjp73RkpW0wiqU27t+oDWK+F76jRKFfqgABWPpA=
Date:   Wed, 10 Jun 2020 07:34:50 +0000
Message-ID: <SN6PR04MB4640E8474D9F9E57A6DE7C03FC830@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <20200604063559.18080-1-manivannan.sadhasivam@linaro.org>
 <yq1eeqnsln7.fsf@ca-mkp.ca.oracle.com>
In-Reply-To: <yq1eeqnsln7.fsf@ca-mkp.ca.oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d9735af1-821e-4934-e946-08d80d10c26c
x-ms-traffictypediagnostic: SN6PR04MB4975:
x-microsoft-antispam-prvs: <SN6PR04MB4975154313E6100FEFA37B41FC830@SN6PR04MB4975.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0430FA5CB7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: psAw+eY/67aBOeU/T/hsAKpM4y37uH9StYQHIL757iiB6rGdDmGZdvwH3JRKQ4lwkyG2UprqNcWkTrrm+V5XngS0ZOkkEuvm+jDC12vHZP/hf3n/0LGt5SOkmU4/N/XT6woHI88TIk/1YyHtCwsLIH4YKnrLqzxn/XibRhKpEtCo210/3uCzMrvNMJFUMvun406qH4/MSypExCYcRcVC39Ejgks97/SH8FjiiOdmnJMefWmzgJ5od/ARgd0KlPXosKRheMfdtzomfIo4O45acEfQZ5pDl+tqINPZ3Fs9hR37HvaE5YSbjX+bwVgMd0YWZc4HcbZvXlNykpTRKWeGNQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4640.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(8936002)(6506007)(54906003)(7696005)(316002)(86362001)(26005)(33656002)(4326008)(186003)(2906002)(52536014)(5660300002)(9686003)(83380400001)(8676002)(478600001)(76116006)(6916009)(55016002)(66446008)(66946007)(64756008)(66556008)(71200400001)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 75VbChQm4CXRt2nJl5//v164RFJSEOJnKMdDXwW30+eKFM7JwUqoicKieNVJwXq2q2ANBUFfK3z9bwysD8SIMmze8aiZEBfxhHMGfiSFp8RLAA6IulSeYTlvbodq9LBluP1DqrUqAWCD/cvVLiDiK116w558y2jzhYUb2fjRWeISadq4FAT+4jw7YUnFJVDeYcEbUPJndx8/YoiL1Ze1kjLIC8DzK0mio5Zz9A7VjfglJ3HhbBHC2beATqQb3fLi12/UUW/i67Yj2DanBghicmjNngggxnoqET1NuITEgHIP4bdgqXs2bWsff9qAouizC4Q9SSkJmTIppHuDr9NX3zV2rnyoXzKwJDDEc8QW+0huEjwBCB1yBJ7Ye2ZMqGxhIiLJqReap4WBUXOIOe7XkE2/TUfxbawi2490s7xX97SEwf9w2Enbhae3YJ7ESTJMzjR6AiRxnnCazoSSuQeawap33PwoxEq9r15SUG4/2jY=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9735af1-821e-4934-e946-08d80d10c26c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2020 07:34:50.4271
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7HfnVOUhv6Hi/0XC33VZRPDs7/Plf3jyB+FuGhhU8hUymk05vt692LQ6KuBzx8LX5nW8OQrq9LNHp4/EzuqosQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4975
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

>=20
> Avri: Please review!
>=20
> > UFS HCI 3.0 versions are being used in Qcom SM8250 based boards. Hence,
> > adding it to the list of supported versions.
> >
> > I don't have the exact information of the additional registers supporte=
d
> > in version 3.0. Hence the change just adds 0x300 to the list of support=
ed
> > versions to remove the below warning:
> >
> > "ufshcd-qcom 1d84000.ufshc: invalid UFS version 0x300"
> >
> > Signed-off-by: Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org>
Already Nacked by Christoph.
Thanks,
Avri

> > ---
> >  drivers/scsi/ufs/ufshci.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/scsi/ufs/ufshci.h b/drivers/scsi/ufs/ufshci.h
> > index c2961d37cc1c..f2ee81669b00 100644
> > --- a/drivers/scsi/ufs/ufshci.h
> > +++ b/drivers/scsi/ufs/ufshci.h
> > @@ -104,6 +104,7 @@ enum {
> >       UFSHCI_VERSION_11 =3D 0x00010100, /* 1.1 */
> >       UFSHCI_VERSION_20 =3D 0x00000200, /* 2.0 */
> >       UFSHCI_VERSION_21 =3D 0x00000210, /* 2.1 */
> > +     UFSHCI_VERSION_30 =3D 0x00000300, /* 3.0 */
> >  };
> >
> >  /*
>=20
> --
> Martin K. Petersen      Oracle Linux Engineering
