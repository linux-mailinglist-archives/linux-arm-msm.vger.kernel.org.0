Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C0231B3A8F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 10:49:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726030AbgDVIty (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 04:49:54 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:48602 "EHLO
        esa5.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725786AbgDVItx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 04:49:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1587545393; x=1619081393;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=p0ojkTVLX02nTYpWgbs6xsNmoOTOq/Jnur3yFYUmy4s=;
  b=hqlTQUX+dhXkZ65h3lJYnWSomk5BU4Hh+4wx2pw7qZzcvGsDvXfHhhhw
   sjMxCVD478sMbZiDDZ1GWsLhnpLNhAJ+vLIrFu6coYr9fV/piac3hTmHr
   8XOaoingcmt42As6Rmqj4iMVr6C5JDkLLMIOOdQbWF+iH8VLLxC8sINIA
   VLfRJk0RRMAW3E3PRkm73kYYUbkGP9Llc29pzTta3yqAyhR8I9Xq7AAUH
   hGVPHq4O5ie1aBj1s/avlV26wOIcAvCACnhY1CPImWe38+Y/z8uCa++VL
   0QKErH8sRF9TdSkEiQKEkxfJ2HLVcbOiPr3AoAxPIX5WK0R+qnXgedCC0
   A==;
IronPort-SDR: ZTVCEBeZ1uGeKudsLrXYzae3O9KjH4hcch0f79R+u0ko7AElHOs7IhqhVIWuFBP2hrJyXsPewo
 VmWZxaaGvVMymXhPDmS146UI2+yQHW8Trq4fvVwGBDeWkXmGVXHqTQdHlnE+tGAv5rcc8705rk
 VXlAYufeBHxDYVfhXvXFE4GpohWzqwvFTrF+s/DsdKzsxQssCwBZfN2fctTgj1SQgjOmVkXSrY
 7KCfMR29w4QCfu2jENLPaW96n8dio8T6uypKqPkQv8IyIufWcfWAOOFk7UqSCjyYOlwqoIMWXt
 5ys=
X-IronPort-AV: E=Sophos;i="5.72,413,1580745600"; 
   d="scan'208";a="136175923"
Received: from mail-bl2nam02lp2054.outbound.protection.outlook.com (HELO NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.54])
  by ob1.hgst.iphmx.com with ESMTP; 22 Apr 2020 16:49:52 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e2TxrTt5NowbaH/GxRnuY75McOulXUF2xITo+fp68vgOgfcVdl13mLdAvR3ZzpVKmbSBf5yw23mv8q0SZlmfdrPMjJbAfrHc3E01pd6QlZoQbzeo/Ks60fVLNuuQ+w+JqkhHk0vNDGTMOGrYOS0bV+ZBYps1SJc54KSDX26/61HmWHIGGHu8UgAuHr+oshvOMOy1pOSTf7siKIHvT1iMoGtX8uwaUpAA1+usIXhuEMYObMwrk5cFcpac57BTMFSratzZvPVsXyyGqLQOFqeM7ZtrxC86IWWNPNeZCxDggmwOCKcmd+Rrud21O3uYiXWsY8w4Axuhz8neJ8OI8Zs/KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0ojkTVLX02nTYpWgbs6xsNmoOTOq/Jnur3yFYUmy4s=;
 b=e7hfXwk+rt9ZozHaWhHGs7VBRnjXO4tBocthhjYlHfcoKDlN21ud0viXinDjhpQTs8LPFUuGFuihCQvxHJ0Y0E77uNLhnxtMc4qXX9eDaTIn5c72GO6T7DIer9gghbu/18l+B81Ucm0tkm1DvENaxN58H0jdwJUkSATH2d+Uf10uPIyXcgtz8cIV5nP7CZXMz9zHWqjRaZpBRf9ZI+6A69nf9Co7VV7oItD5aY/n0IgByps/NwePuCrL2R4RqB1YRg5h39Gb6ja1uZzzneEFi9XI9Zn2DONB1GfKkQnCjfoZVrERhs05rg/B0dSM59Qxb2m78HZj4ZQJfr0j5Y/OOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0ojkTVLX02nTYpWgbs6xsNmoOTOq/Jnur3yFYUmy4s=;
 b=ZAJnU38M/VfTnI1s9sEq+Py6Jb6fLtp5JdRhi59y57uxPJxPKH8YfnMIYGILqBttszN3dg8TJNYUSuyDBKuIBvnjmyUq++OKZggo8zApLCvtQ+CE7xoUSqbzrk+Lrscyxoc+s5RZFm5g02d5ATdD7B7HN9dSKuQEfhxDnjz2oX4=
Received: from SN6PR04MB4640.namprd04.prod.outlook.com (2603:10b6:805:a4::19)
 by SN6PR04MB3950.namprd04.prod.outlook.com (2603:10b6:805:48::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Wed, 22 Apr
 2020 08:49:50 +0000
Received: from SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::3877:5e49:6cdd:c8b]) by SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::3877:5e49:6cdd:c8b%5]) with mapi id 15.20.2937.012; Wed, 22 Apr 2020
 08:49:50 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Asutosh Das <asutoshd@codeaurora.org>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
CC:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Tomas Winkler <tomas.winkler@intel.com>,
        Nitin Rawat <nitirawa@codeaurora.org>,
        Bean Huo <beanhuo@micron.com>,
        Colin Ian King <colin.king@canonical.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 2/3] ufs: sysfs: add sysfs entries for write booster
Thread-Topic: [PATCH v2 2/3] ufs: sysfs: add sysfs entries for write booster
Thread-Index: AQHWGC/afrAYZGty30ygOkVIxWDEk6iE1WTg
Date:   Wed, 22 Apr 2020 08:49:50 +0000
Message-ID: <SN6PR04MB4640548C1D48B662C81D3807FCD20@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <6519cd576299d5881129b0e48870a53a0afc7835.1587509578.git.asutoshd@codeaurora.org>
 <0a55c6b7ebc37f5f98b568c529b76a2ef9c69758.1587509578.git.asutoshd@codeaurora.org>
In-Reply-To: <0a55c6b7ebc37f5f98b568c529b76a2ef9c69758.1587509578.git.asutoshd@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Avri.Altman@wdc.com; 
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 14d2f68a-458b-492d-14d5-08d7e69a1e5e
x-ms-traffictypediagnostic: SN6PR04MB3950:
x-microsoft-antispam-prvs: <SN6PR04MB395005E41FF13232881611E3FCD20@SN6PR04MB3950.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-forefront-prvs: 03818C953D
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4640.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(66476007)(26005)(5660300002)(110136005)(66446008)(66556008)(316002)(76116006)(54906003)(478600001)(7416002)(186003)(86362001)(558084003)(52536014)(2906002)(7696005)(4326008)(64756008)(33656002)(9686003)(71200400001)(8676002)(81156014)(8936002)(55016002)(66946007)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NaUODQnO+bicKNsmZ6qcrSrtLz2D8ZAejPVrtzBWhta/ZPTkGUquo3FaMU4xijnFLw8zNKUEqFhhETPtUm2QASl2Y14fTVl5t6YqXv/K+gHavjR/uWsH9306GYo5FYw2BPwONUPA3bfhhvL7zscfkzMCs7fgiQ5ZcMR7UpAy5EnGj1/sPOraaSqKxWGaEC6bEAy5Lu975H21bjNDMM8xlpVk3bpFtjV27pnkqsfLky9RRtFxbl8ZqTvQiF3w4kbkSDinC3UvEt1ZvQDpofXCHWGqyEcJBll3hr0VHOjgYtujQ5e6h0XQmM11zysMJIYS4NvjAcpZUR3SQf7xGN7d4grx0vwIX5LIG2TLNVJ5PnpVcKplU1OogTBNa9ztEGf3kMz2rwQajiLtTVR5/xauahZqOu3cENoU2br1aUKxgfblS0dtQuDVqLhukf/ySnUg
x-ms-exchange-antispam-messagedata: kjIAASamiNyYStO023C1kiHRsgQNZtaqYPhH++UaqRQJHtAmZA/dirPGayaoPUzDbgEx97/fbH8mJYrGaY5cKzwVgzqj+j+/HIwfAxdQC8IfHrQoNzJ1YBk6RJIKhJ4j/7CCsQyNW6cgFO3a0eA8bQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14d2f68a-458b-492d-14d5-08d7e69a1e5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2020 08:49:50.3339
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F+o2yQiF0OZsj2PdDPNJQTtLW+tdmwild5AQ7TWwHISgq5U8XsCAk/1/y78OgtUPWBWz7GbBdF2qYhcLM/VSkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB3950
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

=20
>=20
> Adds unit, device, geometry descriptor sysfs entries.
> Adds flags sysfs entries for write booster.
>=20
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
Reviewed-by: Avri Altman <avri.altman@wdc.com>
