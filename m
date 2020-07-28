Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F2082304BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jul 2020 09:54:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728072AbgG1Hxq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jul 2020 03:53:46 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:41614 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727962AbgG1Hxo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jul 2020 03:53:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1595922823; x=1627458823;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oU9Z3Gg9K/Z//5uorPXkS15/0a3y53KaU97klfMCIts=;
  b=n3Kesn6rJds10U9L0noNDj0nIA9gpZM3Md5PyXXkN7IHX16ru7MHLWfM
   c5UYTQwvP0nisLJBvg136ES/OV5EW4t8OUk0B/PWiKEXA93aUG9M3Zuf2
   mWvME0EzipOB9UCMtmfZ2YVKq8FjnMtmCw0UbYXYjLAp52kbPVOhaEfXz
   wBZLZnD44GUQ2gh/Vv9Sy5KXJ3cwIzZ+H7S9trzW0YlcsTjc4wS4sIQ4G
   cKDP5YKyUEnctdfnicX1TG6fDW39YJmACTl4YlI4eRTgFT9D/0KDC4CI6
   XRAmYArrMmkQX/rlEXs22ckrQDK50/Ktt+hbrZeC/ub+tZapIqk/fBOuR
   Q==;
IronPort-SDR: fIr0L7QG3yaCRnvxQg/Mx6Q/IE50WieoWnMNSRQz8UpDp4UYzbcidiqGO2t8FIfCNQaG/Rdsfv
 3UapWYDcmBiztFlesj7hzaLBP5GxTrwiugr1unckcsFt9nrTOtY7hlrctjRxeVVaTkHvfAG1/6
 srNsodIdJZUX0VMveErHwLlOD4qZ+1/s9XDyfNJtvAUTrFOZBessJpF+XNEe+NF3dpA6NvKQz2
 YyKJ3oEKXXxqS/6FeystMjprfOywJFz0pAMaemU7rEpMTVvdEDchNfUaYSk1Q5+6RJ7zlinTbD
 W4o=
X-IronPort-AV: E=Sophos;i="5.75,405,1589212800"; 
   d="scan'208";a="143534148"
Received: from mail-bn8nam11lp2174.outbound.protection.outlook.com (HELO NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.174])
  by ob1.hgst.iphmx.com with ESMTP; 28 Jul 2020 15:53:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hsfshJ76Tos4dpBb2Tik8Psnw50IkssinFoYXvBDGBGlplce7yaaM8yDfO9NfA5f9yGUyKKo5t0ir9bkowVf3NCVmxihvNmpPy1Cky01cSCYc7xk+xu6per2GW7MSPqx03jm97TlOJdM4mxrQ+/kkFJsWDZugAcz7oUR6xPVYNg2Fz0n2DUCZH0XUYZxc/E4xj7ncHGI0ozEppsqQ9mj5Vxub/Gc0TxuQbIMUU0UStklwUFwTogxqJeF+DAD44fkMNyRMUPWrj7Kb8jAz8avZl43TtKyWnf0xSn/q1/Dur/inQJwSTYwH7w7LxqU9tr8NR7pYdjmPjneFLmH4vrY2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oU9Z3Gg9K/Z//5uorPXkS15/0a3y53KaU97klfMCIts=;
 b=loiKL7jRRLgrlLAGFxQMDxF9WionaE5mTQn42Wz+1XddNqoz1HSixTJ+oUMmcozyXnUQaoLzASAQ6d1eHQ5LcKhxk6ef5QO3K0HbcQycQxhIcXuPRYDvgjt8La6Ya1t1Mi5RVpz5yncUxScNAfTSQgYLdLuKPjcvewWkoE9MoT7JeTLVd5s7DzoWN8KMRZW9AlxjIkhnGDBOm+hMCxq/izQ8Y1wFP80r4awJCjEaE7Bk42u1pIRsHlmQpcUTcKP2ABnsW3IveiaZU5rZxRpNDM4qHc2vlftckq9KwxmegikdzyDlKbVQJvy6WresFhT+gg/h+t2kaClY2xhRyHsWxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oU9Z3Gg9K/Z//5uorPXkS15/0a3y53KaU97klfMCIts=;
 b=GsWS1ctUIvgQW31/rZfjW3b0NF+oAn0B/3FRrmD9Z1AtLOnymk9MwCse/rdZElNpDcAzdSadg9oVmknNSbPH71VGx79OLBHEBScbDb1Wfa4kOOIAxq+Z2TNTUjvs4BjWcZMvNnhdoHAZQ8D59hnCHAaJnf2MILO9yZlk9oI4aBc=
Received: from SN6PR04MB4640.namprd04.prod.outlook.com (2603:10b6:805:a4::19)
 by SN6PR04MB4638.namprd04.prod.outlook.com (2603:10b6:805:ab::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.25; Tue, 28 Jul
 2020 07:53:40 +0000
Received: from SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::1c80:dad0:4a83:2ef2]) by SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::1c80:dad0:4a83:2ef2%4]) with mapi id 15.20.3216.033; Tue, 28 Jul 2020
 07:53:39 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Can Guo <cang@codeaurora.org>,
        "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>,
        "nguyenb@codeaurora.org" <nguyenb@codeaurora.org>,
        "hongwus@codeaurora.org" <hongwus@codeaurora.org>,
        "rnayak@codeaurora.org" <rnayak@codeaurora.org>,
        "sh425.lee@samsung.com" <sh425.lee@samsung.com>,
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
Subject: RE: [PATCH v7 3/8] scsi: ufs-qcom: Remove testbus dump in
 ufs_qcom_dump_dbg_regs
Thread-Topic: [PATCH v7 3/8] scsi: ufs-qcom: Remove testbus dump in
 ufs_qcom_dump_dbg_regs
Thread-Index: AQHWZJw8tDsfFHqTOkWsg2EI4/HQvakcnwNg
Date:   Tue, 28 Jul 2020 07:53:39 +0000
Message-ID: <SN6PR04MB464084A3D22DD5546399A9F5FC730@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <1595912460-8860-1-git-send-email-cang@codeaurora.org>
 <1595912460-8860-4-git-send-email-cang@codeaurora.org>
In-Reply-To: <1595912460-8860-4-git-send-email-cang@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 66f00031-5575-4577-6e8a-08d832cb576a
x-ms-traffictypediagnostic: SN6PR04MB4638:
x-microsoft-antispam-prvs: <SN6PR04MB4638472AD0209EE9E29C523EFC730@SN6PR04MB4638.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:644;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N7Y37qKN2DnML8mJTVCuXz4+PFPpr99RdJlhltBQSy2thR/yd1/jR641RvomWHJ8DFhTzpw2KqOf5JdVnNzjYBezF9YKLN2jMOmNIcOdrg/nVUQPLNCoYp4+cEMZMwusWWMLCXGMsS63dJdjKf/qcPYiGCWSl0idIwvT7gBLuphFxkeLFjYox148VpNME43vbhqabFro/HJYvV/qqSyjIaq2qV6fo86zHU77MS07l84cebPJs7oqQEIv6LJV4gFgeYXkQF9xjFYtfBqcNiGa9ujLjK+cAnWIkXYyOlgcx4m7ThNJdGJsKMD0+mqRhiUtaML6dhrh7t0PXAVLEkzcf9pNIU1e2bdAx0BFOEUOG8LhTR6wAeWwYmXGNhXHzdLW
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4640.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39860400002)(396003)(346002)(366004)(376002)(66446008)(66946007)(86362001)(66556008)(64756008)(26005)(110136005)(8676002)(186003)(2906002)(33656002)(558084003)(478600001)(66476007)(4326008)(6506007)(76116006)(7696005)(9686003)(5660300002)(71200400001)(8936002)(7416002)(55016002)(54906003)(52536014)(316002)(921003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: bd9ioSIwlVm3DYunLgzVmyKngnK3FlnQXP8hjyoT3uw0R8JJIybc8E04BqIgf6NfDQo4fdNgk4p7ELTiaLIGC5lLy4WvJ2mV5eDOLg89WuavB+k+wTOVUodCiIHYMWHE19EFGjc0v7myv/ZpYbW1e3/IXdNrwSiNUQUxcXsIYUkNDhDBdR7z/sr/xHNK+6kt9WwVwoGdvje51TOc7tvdB68UOXo7Yer3BIm3BJmjm/ovYo0hjTOToO6civ8wSiuWipHE+m5rBtYmdisCatIelsttolJ9fS39oaP5VFITq5e/l3OGR6AoCqStKcUtEfKCqz5WxNzOPJdBfs+p0D8uF9TjOtE8JVhbUv5yvl/zHwlRUmhimR9dnsVsx60P15FlOaS02QB8TMWSkIh7+f95W4dTZ8R4gl49u6sEYR9CnJMLMvzVcGoRaE3RG1BZlAhOZCqFEcs7SW47/hgqqj0AGt+wNtTXjzyHt5BbBJuM0dcDZz9WjS4NRMQ03pTi64pW
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4640.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f00031-5575-4577-6e8a-08d832cb576a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2020 07:53:39.7498
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +KTnSxvzo1RrQBBKnUm4wPlqnoGPdRwRV1NxPg0OmmTS1UlGgtqfDXTyd7BEa9fj0jc43vMkNr+qVUoQin65RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4638
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

>=20
> Dumping testbus registers is heavy enough to cause stability issues
> sometime, just remove them as of now.
>=20
> Signed-off-by: Can Guo <cang@codeaurora.org>
Reviewed-by: Avri Altman <avri.altman@wdc.com>
