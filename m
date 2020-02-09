Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B741156992
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2020 08:58:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726016AbgBIH6G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 9 Feb 2020 02:58:06 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:32670 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbgBIH6G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 9 Feb 2020 02:58:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1581235085; x=1612771085;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4Iujqq8Vn+Oqsm+R+4gil+lqhgRY3iLc7az5MtABBLA=;
  b=G98nTkxjpCthrOXEl630RsIVWbSt6HyoFMnaY5ZEUFNG2eaMcQINIwTl
   L6kgS1tHBhjq7t8+b0AS4jk+nsoPXeQfkJSfMP+eOQhlw3At69/G5TBBB
   eCAMZ0KDcdXiQia/WwlDPoCtw9b6k+aSOwGy85T2uTBm08C1qKJvYWmG5
   XSjIQ8ipQly+yUXNu1x2Oflhn5rlrKZ7vcVt6srM5bqK97gwyn4i1lCDU
   yK3r79BpgW3I362sgxh1ocVybD3aRfDjar4YYQKCOYHj6Semv+5j9lqKE
   7j6sqYGW5k5//Xo26/tm+QYxqqRLX/pldOwlZKXYQXbN+gnzDfVsTYtTl
   g==;
IronPort-SDR: BK9qBFHSdwJAn3wjJgRoflX62PNB5/4dbTGCrGHbXdMxW0ZvDjGKj2mv4NbFWu9iHlR8ePwfmW
 CGBMerSbL5iwvKXaPz6J9KynArVZcDbVSacJ3GCoAUSABfplTDzZYICqlObYBxuN7zGShKpt3T
 i8BpHL+EwpJvI1MRYf6jFLWptnMzMXYifiI5hGRxf/cVvG+cjV+S0fwXWWwNvvxIT6khJxFTio
 zNt2AYVc5QUdW7hBBpezUuW1DENa5H+2UQPpVvPOjUjSQ9Y5yVU4fdfLlaUUuRMAEhP522RI8k
 Q/Q=
X-IronPort-AV: E=Sophos;i="5.70,420,1574092800"; 
   d="scan'208";a="237436362"
Received: from mail-dm6nam10lp2108.outbound.protection.outlook.com (HELO NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.108])
  by ob1.hgst.iphmx.com with ESMTP; 09 Feb 2020 15:58:03 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nkp8oRbO8UAyYrPw1BBoCImmIeyA21ZokcELUV6SLAO6xnwwgmIAwFrGbJoPlwrGGKTUA4W1y97yZNgQgMFu08Px82PsvL5dx8tDfihaCRCxmm/s8PNgdq3wEZZPnWWN9yQo4xIXYQYveQsnYsDobWK8cq5Jh1Jm9Z0Syutca6dQTagUkP4kfIRl3VWsvC5+nKO/eUQHOUfTtOs1QbChnVN9J1KwykF1w9NWINfm2dVviA4bOCVXvi+Gw7EcdhKJ3yo8emqKRCwsynePSegU5zGEuf1TFwLg+3pLWpq1o4Kor8OKWJ3UJBxgXYxxU0cSn9xHor7Bp/NNRCVqGQt8sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9w7SJyx+oUSvJE0DEb3npFGeon3b7MK1fFpNCIkp1Y=;
 b=YtpSGReXncEweW+FyB/5avvb8FBdsaiDnoyxP6Hon9G32NjwNS+JiBfiGOucDTr2tEbDwPP5MKyLkow32RM9OxMyOGRK5thA4sHGaHXnAPElQ0BRcLtpjBGeZl6IYNEl82TnfcuppmtxcnWnwbpY3cOfkQreipprIcq/LqAO+3q3w2dj29lW4oEZrOzlQmbb+tRKNXtmBeRHG3IuwWhz/5DWg24Ak5FFldgFxNHY6hSv4JcGKq0i8Ma8xE1K4kxVy1ogotP129lvbNE/CFkyx0D+qrtjfflg5BTVPsjC1nfdqsdjvsBMMKbzKQCZT0qpukm0BG35YmJy7Yyaw0uzQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9w7SJyx+oUSvJE0DEb3npFGeon3b7MK1fFpNCIkp1Y=;
 b=mOhLTXLqsK+Blywsk2LS4LDSTgeI1BHY3zXHmLgq0qmJ3hpdbVt7lz8sljZOFmihpCQ9WMCnSvVR4dK9GO9fghyrl2jlm9S0+lotU9QZlHqyvZDt0z686PywGYa+xKOs9v4nY5eDhpm9TwZDXu6ew0vq8W5zcGZ5TEhE6dxODGQ=
Received: from MN2PR04MB6991.namprd04.prod.outlook.com (10.186.144.209) by
 MN2PR04MB5951.namprd04.prod.outlook.com (20.179.21.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.25; Sun, 9 Feb 2020 07:58:02 +0000
Received: from MN2PR04MB6991.namprd04.prod.outlook.com
 ([fe80::3885:5fac:44af:5de7]) by MN2PR04MB6991.namprd04.prod.outlook.com
 ([fe80::3885:5fac:44af:5de7%7]) with mapi id 15.20.2707.028; Sun, 9 Feb 2020
 07:58:02 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Can Guo <cang@codeaurora.org>,
        "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>,
        "nguyenb@codeaurora.org" <nguyenb@codeaurora.org>,
        "hongwus@codeaurora.org" <hongwus@codeaurora.org>,
        "rnayak@codeaurora.org" <rnayak@codeaurora.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "kernel-team@android.com" <kernel-team@android.com>,
        "saravanak@google.com" <saravanak@google.com>,
        "salyzyn@google.com" <salyzyn@google.com>
CC:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 7/7] scsi: ufs-qcom: Delay specific time before gate ref
 clk
Thread-Topic: [PATCH 7/7] scsi: ufs-qcom: Delay specific time before gate ref
 clk
Thread-Index: AQHV3hngLx4qIs5w+EaBkLDgtR9Kj6gSfozQgAACZQA=
Date:   Sun, 9 Feb 2020 07:58:01 +0000
Message-ID: <MN2PR04MB69913D6DC1B7186872E51875FC1E0@MN2PR04MB6991.namprd04.prod.outlook.com>
References: <1581123030-12023-1-git-send-email-cang@codeaurora.org>
 <1581123030-12023-8-git-send-email-cang@codeaurora.org>
 <MN2PR04MB69919924B3E161AC972E00D8FC1E0@MN2PR04MB6991.namprd04.prod.outlook.com>
In-Reply-To: <MN2PR04MB69919924B3E161AC972E00D8FC1E0@MN2PR04MB6991.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Avri.Altman@wdc.com; 
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a3ad2a5c-1d02-416a-17cf-08d7ad35c984
x-ms-traffictypediagnostic: MN2PR04MB5951:
x-microsoft-antispam-prvs: <MN2PR04MB59518508EB58093D5724F436FC1E0@MN2PR04MB5951.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:747;
x-forefront-prvs: 0308EE423E
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(189003)(199004)(5660300002)(4326008)(558084003)(52536014)(76116006)(71200400001)(26005)(66946007)(66476007)(64756008)(66446008)(33656002)(9686003)(86362001)(6506007)(7416002)(66556008)(54906003)(110136005)(186003)(7696005)(2940100002)(2906002)(478600001)(55016002)(316002)(8936002)(8676002)(81156014)(81166006);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR04MB5951;H:MN2PR04MB6991.namprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9GTDQc2e+edht5CCWSP00hX3uNFiZoeFVvA7xSFXlSRR1xb/qlPpryiLYPIl8P93m7204oBBc+fNcfgftT6sGort4pngsggp5cgNXFbErdnmTFtuxkeuS6Gs9BV6JTuj+7QL49zdK2aY250VQf3O2pFJAIWpXZTR3Z5v9GmFN6+tXjCgEOdZdH2wEri9rD1z8MfQ1gAlug5qe1hWPXtarMLNnOyhgz7BnVtTaFqi8MEfyLVrxTiebD+xtUw1sI3dtuUmIiB1T4rJjSjceu9XEXVzOFDsVPyV95oYTR8vw2yq3qbwY8rR1oeYItOmqcNwP67GX/eJKendVRRibiPOM94gLsDUqWA+F7+V8XFHSuDOYL/1JDHShGObNgvIYN4PtMfOL+3nUSBi/fwaCMS9EZO44CaU2H5qndbnJWnqeT3MHniX8fvJaqZ64IWTSk52
x-ms-exchange-antispam-messagedata: z3lIPKvvkbbl9xeLlv0pzGF5C9YZondnIpeWTMY01fCV1g8iH91WXKZFwD8D2KWLSUPJWd+Ox5Nd2NXdZZ2kTWq27sDyGyqM9mTPueXnVXdbQ+sZzUcCwuDvxZ9CA1/NaroZO5YIO3plP8MKuG/J+w==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3ad2a5c-1d02-416a-17cf-08d7ad35c984
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2020 07:58:01.9813
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HLObjxf3Jr4EHFYv4wJGRBxhkgyPF31ygxG0yu4VeaCuA1GXz4PHWqKTP+WUiQzKsH2om2caNMWgtflo++F2kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5951
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

>=20
> > +                               gating_wait +=3D 10;
> > +                               usleep_range(gating_wait, gating_wait +=
 10);
> You didn't addressed Bjorn's comment concerning setting larger upper
> bound.

Sorry - you did.  Please ignore.
=20

