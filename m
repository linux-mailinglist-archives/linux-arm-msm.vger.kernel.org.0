Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3445E311FAC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Feb 2021 20:25:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbhBFTZc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Feb 2021 14:25:32 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:37082 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbhBFTZa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Feb 2021 14:25:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1612639529; x=1644175529;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=phdhSJGcKJbW2BzGc+t6H78uWeZG2DPNniAQJZN6az0=;
  b=gCPbWY95BmzNTEzRRg6OJ849kV8uMmSJJfuIyKExzgs3bZGOHFlMkdRn
   RlWhOc0igTFyvHm2U+MoBGWabOpTIRhSAL8rExRxq+rm4WVlixd8+lhpQ
   5i+mUjbzQHerInc8gVZBRw6l/ZApq7KAmFYgEWpZSv/PoIc/MY7aBlEUT
   4RYi+0+XXMJCQA0vaiduAEYX+09UNUujSG04eami1kewgczmFI5Dpa897
   Fl85m1gY/Ict95k5rujxfVLx3jfQVwAFq+Pp4wiDAVuvFpPCNlI4MqRAS
   mzwmlF4cMjJwNh2G+cdlV0rKAmSLYbKGhaHf81D4cIHLQIDrBgA0ilud1
   g==;
IronPort-SDR: /J6N6Mm05fCw9NHfZyj1IHpIfxu5lyySScC/b2D5PALhLm4eyKKlAb1nR7EkAg5XpAQffP7pNj
 4cMbP6caIytwbu+IvGHBqoq5navF1c12pW8/EPKoiQazmWSgBsSW34omdC4UdG+NK/1DoMPJKx
 C2hX69FZMpXjvPCVh+fhbj1yPMHIU8Az8BSFfOFSEwfjjeywR6Qf2cB26dUf+1FwSSth7lEUaa
 y7KFUG9Qx+JcVXgVj5bojPu8VAN4eQRYcYoSTnidg6oP2U/tTZB5/NEL6YwzWMrS0z5ZK1t1x4
 +iE=
X-IronPort-AV: E=Sophos;i="5.81,158,1610380800"; 
   d="scan'208";a="160529284"
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
  by ob1.hgst.iphmx.com with ESMTP; 07 Feb 2021 03:24:23 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qc2Ee1XhRErFYe4KgJOiojnvNdj6Qw3bQgFYx4ZbukIoFsBmBUI2aieiL86++UV3qLGqWiyiPBqOgN3Hr0nuFMOXrtfU8F+2fCQhwUa6EP+Ah+6ZUomEiAcl4RMDgrZbb9chp+No5xSA5a1ikYkpCjDjSriVmPHvPeIEc3F0EF3JV7YP9LR457NO63BWnJ73uw6VOXocqN8MrN9+tPYb1UQYpd17QdiO38vCf36VfpITHSL7YznMXObIQl3IGSZHKSjqavPEm7URx8t2jnQ9uerY3MN2pabQfUe7TPQ0xlrtpTkeC/zznAfPsl/R3Az9EIMZQp2kVnrEBoXA9rwLJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gD84gRlOd6pxi9XiX+dOlF9+EIouMYU5ZXCCIJgZSho=;
 b=nzxizY9cn8pZzH9xETl7bTEgyxwY5Qe4YCZGAQoprb0hE7Tn1U6Gz0ZAkHLiPcgicGPdAgthYzrPaCMjXbYcdLitdYu657LJBVKqrbutaxJWqeEGdYQf/zzb/kDCBp5p/j1WOulMVT1yRqAPt+wTjTy3kwQCFhC6rRAsykEJXHc2HXhtzEo6u5G4pvXNw8+L2sfA+KpP2dXe53K1/+ni6w2ctv7XBNERz8xNmKwl4zqbykkMLFwSnkNXw4hjM56+o0gmZGT89H6r+56JjrLfpSgiiL/Zf8mkdgD1mra4wSAFi91uI6mmAshFM8IDDD0aEVLczE/LCEUTbMc7ZrzOIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gD84gRlOd6pxi9XiX+dOlF9+EIouMYU5ZXCCIJgZSho=;
 b=zjpCPOMLS5dGVYGTAgBsNG/Zh2ukioCdUJ9TYEjh+CfCeQXTf5v5wSNIZBaQIhQhsIVkFgy0dVOarO2Ap+neyzdFAfWlFAEhmr/cgm/OS4pHuCY2TdQxufbO+zom73trmGsTt9nOtZyzMvbEO8IdwqHF88y/BkQBellsYGMfic8=
Received: from DM6PR04MB6575.namprd04.prod.outlook.com (2603:10b6:5:1b7::7) by
 DM6PR04MB6511.namprd04.prod.outlook.com (2603:10b6:5:1bf::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.23; Sat, 6 Feb 2021 19:24:22 +0000
Received: from DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::e824:f31b:38cf:ef66]) by DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::e824:f31b:38cf:ef66%3]) with mapi id 15.20.3805.033; Sat, 6 Feb 2021
 19:24:22 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Asutosh Das <asutoshd@codeaurora.org>
CC:     Alan Stern <stern@rowland.harvard.edu>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        Bart Van Assche <bvanassche@acm.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
Subject: RE: [RFC PATCH v2 0/2] Fix deadlock in ufs
Thread-Topic: [RFC PATCH v2 0/2] Fix deadlock in ufs
Thread-Index: AQHW+y62BDWX6X6k8kupYsmVqHFwfapIfw8AgACs1ECAAJC+AIABxuPw
Date:   Sat, 6 Feb 2021 19:24:22 +0000
Message-ID: <DM6PR04MB65759417507BA054F8CAE86AFCB19@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <cover.1611719814.git.asutoshd@codeaurora.org>
 <84a182cc-de9c-4d6d-2193-3a44e4c88c8b@codeaurora.org>
 <20210201214802.GB420232@rowland.harvard.edu>
 <20210202205245.GA8444@stor-presley.qualcomm.com>
 <20210202220536.GA464234@rowland.harvard.edu>
 <20210204001354.GD37557@stor-presley.qualcomm.com>
 <20210204194831.GA567391@rowland.harvard.edu>
 <20210204211424.GH37557@stor-presley.qualcomm.com>
 <DM6PR04MB6575692524202EC91E2A5480FCB29@DM6PR04MB6575.namprd04.prod.outlook.com>
 <20210205161102.GJ37557@stor-presley.qualcomm.com>
In-Reply-To: <20210205161102.GJ37557@stor-presley.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [77.138.4.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 86855be5-0606-4bf5-83e0-08d8cad4ced1
x-ms-traffictypediagnostic: DM6PR04MB6511:
x-microsoft-antispam-prvs: <DM6PR04MB6511AE44A48EE750E3FB5589FCB19@DM6PR04MB6511.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sH5lP0X180+5AGFsaoDzcG/vPNKgcZOOsFtWBW3VvaqW3CqnJZ+2DDHQ+Wke94xOU4/nElOKwLnrKq8KbbbwYpgbl53NMFhObPvkTBY8KFDh32Be0JKa5614Vnm3RC5a+ElxgztLRoMjKiuYrVVySqo2j83CkW8JtNMRL/ZxYWtRY6lgIxoPFCDbpaqTDDMI22fzuQKGbHy2FBQnrE8dLVNnchcj7OooP26Tka1Uh1necN9kNSPFrHEYfbwqn9tPeHjyj6038dZ6rheDMT92q+fr9YVYjXvwTwW8SeL8b6+aSHdx3otgd/cOzjg1jz/UL5smH9oPl1zPEEgDmfFF2iuI1JUWnMwvHaBIob6qCD9LuJ14QaLvM3LH8rSIb3+FP9BwT1vbQgnVRYBn5TNwNYG5MozQRhdVr1rxMlgKPPfT5tg5GotmZJZzyOVQZUtVRBQMAF3XDmzrS2nynlyGdhI8xt8zxOw7omjN/h7fQ58oxnoQ2PIbDYpehAnZ0Uz6l3eEJrzexZPvPucyH8MMYA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB6575.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(186003)(7696005)(4326008)(5660300002)(9686003)(6916009)(316002)(54906003)(76116006)(26005)(55016002)(64756008)(66946007)(33656002)(66446008)(66556008)(83380400001)(6506007)(478600001)(2906002)(71200400001)(86362001)(8936002)(66476007)(8676002)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ta41m2LxVlMJhEeI68PaLje7u3az9iwC+YYevd22hqNePIldVK9FuRBkSVhm?=
 =?us-ascii?Q?alKDkFPNJAmImcHVrd/lZMZbgDT9WCxq1rdro26bwS0UQ1o8ZicStcIu2hnG?=
 =?us-ascii?Q?UHPQO3dkippwmf076MDUyfeS+BCZ2Ndf2h0YGcTAjibVhUlYekTOg7P2ddAY?=
 =?us-ascii?Q?OOYahvE/7Ov7X+c/5cpjFmoDy19wAlA9jJbk6sYhIK0iPHLD6073hqUyKUuZ?=
 =?us-ascii?Q?zCfrG7TsqZuDJVfoT8iDcRKVJMvYOgPSuhwGy9m4KtWRdJqxRqWrJNNx83U6?=
 =?us-ascii?Q?vQGtUHi2lzB0ne8nCqrtGgKTVddWC6wshWUBkFsjupVkvdKyTi4VIJstma6x?=
 =?us-ascii?Q?brbny9FErlzAtOcTr21pgrkTbK25GdLrlUaoOduRrKyMLv6vP9DsRSHrgBdB?=
 =?us-ascii?Q?LyV/8xibZ6T0MpPsxQhis9i4cW22XebPHbP0YrP8DaM05VD3YIpWIpvu6XCy?=
 =?us-ascii?Q?ZOMRdTmAyVJUb/yzlqNWJj3Xt+APLqjdiijvBaBxzOhmZ7uL2Cgg50ZqwsTz?=
 =?us-ascii?Q?XLGpPnnD4SjpCXsFmISi6SKIc5DWn/5lDBqLhgBWTNmfXpSJ4sAKfI/AWJX4?=
 =?us-ascii?Q?2t/AkfHmNSY74s+PyaxjnAcTbi52yTBcQIR3MRR6sU8ZScMK+5jh8G1yPVx4?=
 =?us-ascii?Q?RD+rNjUwngWpX6HLCqLnRxea50ZQJZbJmGbBuYyMseETxrdFYS4oAlu3FE+g?=
 =?us-ascii?Q?NZM4CaiX69alp0I87px1IZYP9dBt9DwAzwZk8NukNnaxpECYuwI2TTZ8UXfK?=
 =?us-ascii?Q?l22AcStB5ZefbMkh79Xtu3byaV0Iuz8gQlnTBk2XZFUWG2r3cO0UlAKimVz3?=
 =?us-ascii?Q?ZBEcbHHTYA2BPxO9c9+KE1yYKxaBDrtYqcYsFDZpESzHsGb1xSAQ8mVQGUTl?=
 =?us-ascii?Q?fmLYwEnbYz/GTgIp/pOWikoLE3ZSu+i05/Ll+6cR/pBIZwgT9bF2kFFwJQXx?=
 =?us-ascii?Q?AAWdNaPPfINmOet5Wvfbx/snv1SPouKD/eLsNcKZS/yJUFut0GZVWAPYcWsY?=
 =?us-ascii?Q?rclwEeURqfivCn1HQxiGr9+7wfPYIrkeHd4fW9cn/pumeS/Trthh4BtkW8TD?=
 =?us-ascii?Q?HNOa19N6mBr52Q+ODThv9fLQuJKfbcVgEelCKLFUsk4zTiFE9QNaubv+MaI0?=
 =?us-ascii?Q?no6qjLL/pxkSIJeOKX+tNyhUPsyXRirj0HxKf+7DFy5Sv/pdDJxN/JTJEt+i?=
 =?us-ascii?Q?95wH8q1HtRjzwTOUPdbe24vsGblcqaDiIsu3d5mpRcKBXZPimCs2Mq12Uy8s?=
 =?us-ascii?Q?4uueW0gL78MryXtxwewljmqdkNm4jLyYz6Rpjn994FlU0ORC1nc22DK68/qM?=
 =?us-ascii?Q?Ggo=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6575.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86855be5-0606-4bf5-83e0-08d8cad4ced1
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2021 19:24:22.3624
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +l0gVamxCsmtsAR+sVRnm4fxhghZagRlSr829SjMEKwrzFXCORmz8QXZ0B80wXbb49CsX+nM89nIr3Zzgia9pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6511
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> >Regardless of your above proposal, as for the issues you were witnessing=
 with
> rpmb,
> >That started this RFC in the first place, and the whole clearing uac ser=
ies for
> that matter:
> > "In order to conduct FFU or RPMB operations, UFS needs to clear UNIT
> ATTENTION condition...."
> >
> >Functionally, This was already done for the device wlun, and only added =
the
> rpmb wlun.
> >
> >Now you are trying to solve stuff because the rpmb is not provisioned.
> >a) There should be no relation between response to request-sense command=
,
> > and if the key is programmed or not. And
> >b) rpmb is accessed from user-space.  If it is not provisioned, it shoul=
d
> processed the error (-7)
> >    and realize that by itself.  And also, It only makes sense that if n=
eeded,
> >    the access sequence will include  the request-sense command.
> >
> >Therefore, IMHO, just reverting Randall commit (1918651f2d7e) and fixing
> the user-space code
> >Should suffice.
> >
> >Thanks,
> >Avri
> >
> Hi Avri
>=20
> Thanks.
>=20
> I don't think reverting 1918651f2d7e would fix this.
>=20
> [   12.182750] ufshcd-qcom 1d84000.ufshc: ufshcd_suspend: Setting power
> mode
> [   12.190467] ufshcd-qcom 1d84000.ufshc: wlun_dev_clr_ua: 0 <-- uac wasn=
't
> sent
> [   12.196735] ufshcd-qcom 1d84000.ufshc: Sending ssu
> [   12.202412] scsi 0:0:0:49488: Queue rpm status b4 ssu: 2 <- sdev_ufs_d=
evice
> queue is suspended
> [   12.208613] ufshcd-qcom 1d84000.ufshc: Wait for resume - <-- deadlock!
>=20
> The issue is sending any command to any lun which is registered for blk
> runtime-pm in ufs host's suspend path would deadlock; since, it'd try to =
resume
> the ufs host in the same suspend calling sequence.
Did you managed to bisect the commit that caused the regression?
Is it in the series that Bart referred to?

Thanks,
Avri
