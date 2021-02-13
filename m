Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA0B631AE0C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Feb 2021 21:52:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbhBMUws (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Feb 2021 15:52:48 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:58001 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbhBMUwr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Feb 2021 15:52:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1613249566; x=1644785566;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2BGInrLIF/5COFifUcqDQv+cafWEb3jCeea0fzo8/mE=;
  b=rsnejavMbtAnVG9Ym6qMP7QB+UmwlSGzsqIE8EDwQVGMMwNNPmwIc4bl
   Wv/aqWTHHy76UrhoY4adeIFEBmOBEH/aHE7g9Jxuw+pNAqNG2gPU/8My3
   TuJxpq+NAdTFh38Dnd942zDylyxVIK3nmKNhQje4+NtYU5V/1K8u3XXoJ
   /NgPkDtm8etlFbFIh8WHC/QpoyFpwdYrdmKfzShx5U0x88iScA/4Ea8Bu
   iX+38vym5gzw4eD7tzTju5vpZFFPpAvU3GBGHCIhaZ8jHlh6TJoWkm0n/
   WshNFSpgO3zgUpy1lCd+8rcWZ+PhLPwJDzjGpOsXqgKyk+wGu6PnO0zAD
   w==;
IronPort-SDR: u6fqzqwjNYOPBxP9gU8pODTRoxGI4nDI62l/zRVWYBaban0eP2zwytCrHt9vpbo45V/5H+f7/R
 PQDY0i7ukSAy50sUKKm5OKt1wiJwHtCuzyDgvMQymzV9kBh/Dnx/PmQyyHSO+iqTlmaf9ogeVH
 bYdwD6MmtXNYbOE39OQopGB0PjMCg8ihDEL4WIKPTbRSnH94OGG6MtD1G63Xx5OmArl8a84OPY
 6qqK1XK0myiSrp8VJhyYTvaQZANNkKoVCDpiEIzjdVsteBxfka525QgPCp8sPIpHoXkuoocBxy
 04I=
X-IronPort-AV: E=Sophos;i="5.81,176,1610380800"; 
   d="scan'208";a="164384458"
Received: from mail-dm6nam10lp2105.outbound.protection.outlook.com (HELO NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.105])
  by ob1.hgst.iphmx.com with ESMTP; 14 Feb 2021 04:51:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CNYDyokmMHvKpvLkdLtEOzgeiJDKndaQVDKuRSoe9IkyXaNelSbCPCdsgEtf6ga5papSn+e/NNspvCFl5YOjKhSuNzvtIEqNQJptXlB2/52OxaGCtInKTVsxJW4TNCwO4qVJmQQiTpw1JQtooMO3EYnvYVz0ylkCHb2LArWmAkpUemk9xY6xac50bqnEVWaFuHjaEoO9+oqu+b0vDAOGZ8oJ0uh8JNK10R3A+XLMo4dbZ55H0jFC9X5dOL4t+ySU4kzLxZdNwfwVGmUZYf7Diwl84o4wLpepAQhapN5a0oq3pb4I6ZgeZXO/7+LyGomilwqag8LTyTRgSEQhdcukQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2BGInrLIF/5COFifUcqDQv+cafWEb3jCeea0fzo8/mE=;
 b=E/8/QLN6IXBLZfOnkijaLabVDlpcAnoqNjz2jKjOmova5DoWfKjyLEt/Z7p/vVVvURS+pNEWpugb/Noe5zw6sg7XEOKkUPJHNVBomYiy/QLFFP+ymEq/QMWDhKXSJgybVqf3TF29SG85xEjaGUo1wMTy0gJd0zKOIKCQXlhNwS8KpXfjPsi5WfCJnDEAPpg7xWubICJo+xw2aMGeWwC/pJDEUId4fnhXEoc3vceCC/B8izjWuGW+Fyu9XQtrNEBazmUJnWjLU87F+l1BZCk2BIF9gjohJD0z4q+XHyQ3XYtHM2en9GsSfn04V8Y0KAS5MGcLYjO5pDn9TYuxmduunA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2BGInrLIF/5COFifUcqDQv+cafWEb3jCeea0fzo8/mE=;
 b=hu3UXPdJchQOmYZyjik9bH/0B7Bqhn7PJ53WYG5waaari2HE88kX7GOrKEu04KsrgbvrwGTUxzPt2NCVwEK0yIKPaGrcajnfrt7r0vR6/nhL0JgGkp5GSlx9tY+tvArRA8Pm8QACq1gxWrJxSQjxkFuHehBu2mjZWq6ZlFu8Beg=
Received: from DM6PR04MB6575.namprd04.prod.outlook.com (2603:10b6:5:1b7::7) by
 DM5PR04MB1100.namprd04.prod.outlook.com (2603:10b6:4:46::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.29; Sat, 13 Feb 2021 20:51:38 +0000
Received: from DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::e824:f31b:38cf:ef66]) by DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::e824:f31b:38cf:ef66%4]) with mapi id 15.20.3846.035; Sat, 13 Feb 2021
 20:51:38 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Asutosh Das <asutoshd@codeaurora.org>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
CC:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
Subject: RE: [RFC PATCH v3 0/1] Enable power management for ufs wlun 
Thread-Topic: [RFC PATCH v3 0/1] Enable power management for ufs wlun 
Thread-Index: AQHXAKtK6bkpCHugCkOJOgXYFyz9BapWjQWA
Date:   Sat, 13 Feb 2021 20:51:38 +0000
Message-ID: <DM6PR04MB6575172ABC466BA0824743D5FC8A9@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <cover.1613070911.git.asutoshd@codeaurora.org>
In-Reply-To: <cover.1613070911.git.asutoshd@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [77.138.4.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f1c4c8aa-f3ee-4bbf-297b-08d8d06128a8
x-ms-traffictypediagnostic: DM5PR04MB1100:
x-microsoft-antispam-prvs: <DM5PR04MB110099DD78B13079AA4EB286FC8A9@DM5PR04MB1100.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8RBr/vPbAwZEmNNfxEq9IcLU7VCIxb9YndFtq6h6hpUjERFhx27qrfnUvb/bBCFwVUim8C3HMRg5K7IpjmJATdFigNFgETKlTTBarxO0wlVLr3kmGN/tCTqItQKdEazVoB7dUt685dlXA+y92yX9bB/uyxdmqqgNIwO617taH8MoTT8fJKHgEK6x1mN2upFcBB/P3OGDIF5E0I8vAml7ge7fe7PxFdIaRX0YwU2VfT2z/JjGIJbCTDwdC7fsVKvft3obhTdv39Gw6EzLe0YJIOZfFWgd0LQYRNdcXzsFB5bPiXvk9zXuzFkMkqAq/mVi2w+xmFMcEAcMaZMxBzBP2q1eBdx51+EqLyURO46dGFAOIjcCXcspQtPAKmdcNYc9LCvgKtjWv1m4PpD5Tl3vcfYS3FFRKHNSzZn9Olj4S93kwjlr12RKUuR8Z0jj8Gg4OTRdwVntzDWE4qgKbU1pM2lMEJW5aCQ80PPuWET/7YMOIMr7DXpSozHWy40zi9b1jtMmT5OwvOA1J4hp2Vftyg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB6575.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(396003)(376002)(39860400002)(186003)(55016002)(6506007)(54906003)(110136005)(26005)(316002)(76116006)(7696005)(66556008)(2906002)(66476007)(64756008)(66446008)(66946007)(4326008)(478600001)(86362001)(9686003)(83380400001)(33656002)(52536014)(8676002)(8936002)(4744005)(5660300002)(4743002)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?5vXfUUq1ZRm5Ua7tKihd0UjrXYCdLDJTRvphAkXm/uocy3B3SaP7YUqXK9UG?=
 =?us-ascii?Q?ZkSTFTUjPGnN3efANLSYUqpCUOc2PfJccpzfPHw++H0S3syYbWL06vkcBO5l?=
 =?us-ascii?Q?Aje6ab018HFrZ8VXkN09OV0frsHBnFlk0SCMNhJ7yZDdd3VvYU3Hpg57NmO9?=
 =?us-ascii?Q?GZ4RNmpv0rAGZx2hLRr5pMTRgijDt99OE7j8jFlEleV6XnPl/bOX+nInAYOR?=
 =?us-ascii?Q?RkDp6DL2OHymWUZpDHRPIcmuwmA2MR6lA71btcoH9FhKOck0O/Fi/+mHNG4K?=
 =?us-ascii?Q?8btw/XT9av1sR8qppzLTkhA/jEn0wvMa3+Vf4pYeHECP80Snfgf8kirVtiUL?=
 =?us-ascii?Q?1Ew3DdlM8PNE18GqsIkEcGdG4Bqg8l5cmhZ8464AHHGujXKRNWpdtT2/CX5S?=
 =?us-ascii?Q?pV+yj5zCy0euQW1QhiFxrts0CN4n4X8KW7OHGskw4DK9zpUGw8imiS1Fx3DU?=
 =?us-ascii?Q?Jm0it3rgTnN0lAIS504np+NFU2W0ZXy5ZK4OsvGDzlyaUZkfyTmDaR96KvKI?=
 =?us-ascii?Q?nofMzAglFg916/+snjrkcm/OLVng+kjWnYshLgsNmAfHz18Vgbg6Pp+/By69?=
 =?us-ascii?Q?g9AmP9ajz+ROMIRD8tyCgnAnyBqMRp8bsSYDMtilUNHE7LAOT069UadhjZYX?=
 =?us-ascii?Q?VMAf0SSitNlCXrUZp2f3NmQElebrw+40x3YuDmfHWp/y4LTC5dCRV1tuxcIL?=
 =?us-ascii?Q?6wnNmxYv9nE21aTFeddUpxPYtMEXubIEmGKIFNV70eYKHhcjBw+vfX+WFdoX?=
 =?us-ascii?Q?2pFikedPB98oqeVAhlOjP7cWznkJyKpd2Qoc7o4Hapypq040+1E8L899sgl7?=
 =?us-ascii?Q?Bj8jCFrfih/1jLPBb+mDXDFcNFE/KWM90I7OCUQiwIHmU19hyqxJ9qq4n/mW?=
 =?us-ascii?Q?VXBuoRZz1i6vtFyJ66Zmn0drhbKg7eGE8IWT0hMfFvTkI0zQ9cctx6dH/lMJ?=
 =?us-ascii?Q?S6iWcriFSZazU0FMgmWfHMnlhZCfwkegqatgTfMtDieFS/lXoS6oUEbF/o2Z?=
 =?us-ascii?Q?uTvuRmSLzwA3x1kOgjmoSfTpINsOvfkxOCdBN45ruHNP5DdEgmzmHdqEaUMr?=
 =?us-ascii?Q?ucMAkQeoYzGFz9p34nzXlYeC3J5vnOJobA4L177mmee0FO0EboNr5FOEO7o9?=
 =?us-ascii?Q?Prex2HsvvJ6GhIYiR+VYG3gevJO5X6J3CFRyGcfb4eNd5PGa/skJCQmKGS4n?=
 =?us-ascii?Q?LvRaizYBbTHStMIbHnjDfP7IpIlOHgriNwBw1xShZ38swdt0Mk8cBZJbUi6r?=
 =?us-ascii?Q?w1StYFtk7ItwoQb5l23gHWYIO1+BQMRtWvPxa2N240vchyP5F0UCFa3RGhrV?=
 =?us-ascii?Q?Gjg=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6575.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1c4c8aa-f3ee-4bbf-297b-08d8d06128a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2021 20:51:38.4991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hFCb6GtVz+xdzVNO29yZnsSW3/3xH3RfTVZvNC33ZNb+NEWSmdbEpw9dhI5lAtSHlBeBb6x74cSerlH8OCUmNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB1100
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

>=20
> This patch attempts to fix a deadlock in ufs while sending SSU.
> Recently, blk_queue_enter() added a check to not process requests if the
> queue is suspended. That leads to a resume of the associated device which
> is suspended. In ufs, that device is ufs device wlun and it's parent is
> ufs_hba. This resume tries to resume ufs device wlun which in turn tries
> to resume ufs_hba, which is already in the process of suspending, thus
> causing a deadlock.
>=20
> This patch takes care of:
> * Suspending the ufs device lun only after all other luns are suspended
ufs device lun -> ufs device wlun

