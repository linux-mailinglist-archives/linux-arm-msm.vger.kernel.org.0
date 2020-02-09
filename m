Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C61E115698E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2020 08:50:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbgBIHug (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 9 Feb 2020 02:50:36 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:33246 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725856AbgBIHug (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 9 Feb 2020 02:50:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1581234635; x=1612770635;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9EovPCHQgFMgtiLn0dTotYJMhY/RKxQbVnIJzGmQbQk=;
  b=f/75pZ2hDaBit6VlsjthgGq+yXWOocE9tXvXpnouL5EMiug4z705ZnUW
   t0KFsOJVuz8qwD7QRNNnKvkPLA/DgvUXCiXRi0kJMe8cBXwx9+hSTFXKh
   AmefcY/U8SQyt84yKMwMIhTXX5ai63s6AVLF6YbUOt1+4lg7M9JCdd4I9
   soluiQboCxTA7iL94A7GyiyErC9E1RW/UBMnDn/nqtpYpAv/jpKPvF3Og
   BaNucwKLrF8wwzEA1NO/yIAw4wA0yu++TBeZqYFZHU2Svymc24g25xafn
   Ev/Dt9Y1GxJKg9ws2jchEhJGCDZN8iPGq/gs/IhHhZxe7Q3iwPcFhkbeX
   w==;
IronPort-SDR: 3+NnqnWAOLPt2B0BJUrXE8tc51ERwTdndDDu3iyEy8Vxzbs+nUlCscHo3EE9pQ/DJh6GtbP3FU
 TTPgPaMk2KLe4EEUtev0bdA1WOnS9U1EbmV1RgYPyQZ1GuSQJ815Rv1i9IMRlZPL+8E7aucXVN
 luhHdhDNeEnvEH/TMuPIzywLTTQY5efTRvF4Y8gdlniXNSWZZ3KOPa3iBGXn0PJE2XARi79Ce4
 kRjwJrRCFaruUJYV9qk7uMzyZa6fwclsVF7MRejnuLyWOw1InOlmnCeu5e27IiO6aEKx99RsLr
 QL8=
X-IronPort-AV: E=Sophos;i="5.70,420,1574092800"; 
   d="scan'208";a="237436233"
Received: from mail-dm6nam11lp2174.outbound.protection.outlook.com (HELO NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.174])
  by ob1.hgst.iphmx.com with ESMTP; 09 Feb 2020 15:50:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dO0pr8oK9Iv3VhuM3b/MNutTCpNm1NBlOLQgbGOlUNOCv1eYhhyJSCWsxhF+x0suPtFV9NNV5h51osfb1nARkSeYcyqfWxW9/oZKW7/zIUxY56VjLW9YT/+hHgkPMOcD6ebJ2Tw/+QQiTUpF5mDKOifA4v4k3+cs295Xuv6BzbEEV283Oty9W7XFDYhLtRV5Qz7m/C4QukSx5mhR4KVOXNLJTYMAGxZt+rU/u04qiqjYFgsT3jWigcp5f9VZDkIGX9FpXBRAIO4RGOtQZh3EvyGdvnlgj8kZaoQ2PYJor7NAAljJzpkg8joEus/cHu+ky4vfrpOl+PWRgZ92JOdsSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0l3x3td+vuOzy5wu36tVcZO2csyog+ZORXMQMupDnGQ=;
 b=ldutdDPxDRZnN2at1QpFA8yHv1i46w6VUTYhfAwIPqNGJtfWqvB0O7cfvKLbbA1MJRQqJrnm0QKnC5hKENAIYKrnrvpT+TKtNCgMMLgmCntUKehdz1HGXfDOA6Fkx7GPgeGPfuZw7tSwY45lw6R+SCG4VZwu+izVrCXUXoSLan6BtoUDFO0CayaLb7krjVCTdeE/DhQ6NQJK0vSmA5iQbWsXxkIoIGni5RrVfFCf3Aw4gggwXI297pFIdh3q5hKLBxbQggnj1IHAN2D9Xh3magOQvzemArJJKHCzh8tYzhc29HBopsOQf3ttY/M8qGmh8agKC65B8H+Kx3nbR6ltiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0l3x3td+vuOzy5wu36tVcZO2csyog+ZORXMQMupDnGQ=;
 b=b/lGQRO+o+nfFKHK1iCQKgCOGuPYGb0PpokcTCfSSPEbit5uIov4YIf13ysK+ITqlglpUDFmJZoV4qrMb/YkDEso8fIUzzqwJ/DOK6xRbPph+cuEEN3FrO6O5eeTjMutAbfHFPI5bEIrH+0OSDAwodPVCoRUNP/fUYc/rQyWosA=
Received: from MN2PR04MB6991.namprd04.prod.outlook.com (10.186.144.209) by
 MN2PR04MB5726.namprd04.prod.outlook.com (20.179.21.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.24; Sun, 9 Feb 2020 07:50:32 +0000
Received: from MN2PR04MB6991.namprd04.prod.outlook.com
 ([fe80::3885:5fac:44af:5de7]) by MN2PR04MB6991.namprd04.prod.outlook.com
 ([fe80::3885:5fac:44af:5de7%7]) with mapi id 15.20.2707.028; Sun, 9 Feb 2020
 07:50:32 +0000
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
Thread-Index: AQHV3hngLx4qIs5w+EaBkLDgtR9Kj6gSfozQ
Date:   Sun, 9 Feb 2020 07:50:32 +0000
Message-ID: <MN2PR04MB69919924B3E161AC972E00D8FC1E0@MN2PR04MB6991.namprd04.prod.outlook.com>
References: <1581123030-12023-1-git-send-email-cang@codeaurora.org>
 <1581123030-12023-8-git-send-email-cang@codeaurora.org>
In-Reply-To: <1581123030-12023-8-git-send-email-cang@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Avri.Altman@wdc.com; 
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fe1e414a-8f5a-4b20-ccf2-08d7ad34bd72
x-ms-traffictypediagnostic: MN2PR04MB5726:
x-microsoft-antispam-prvs: <MN2PR04MB5726E873E956B4B730ABF5FAFC1E0@MN2PR04MB5726.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:561;
x-forefront-prvs: 0308EE423E
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(396003)(376002)(136003)(346002)(39860400002)(199004)(189003)(8676002)(6506007)(33656002)(478600001)(26005)(54906003)(110136005)(8936002)(316002)(558084003)(76116006)(66446008)(64756008)(66556008)(66476007)(66946007)(186003)(81156014)(81166006)(9686003)(86362001)(2906002)(71200400001)(55016002)(5660300002)(7416002)(52536014)(7696005)(4326008);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR04MB5726;H:MN2PR04MB6991.namprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2xmyv2LXnFoQ2LwE8kJOApb4USfRDkrnpQFLURCGAoxDAiKga4ZvQjQhyV7z2bvIgxL2VVB6vo4sCIiQRJwfztNM6+WOHM9bDrsk0EXPNFfNPheyD6SLOGCQid4wm6XDowu3CSfwsjnhDF9BiIrLS11rL3VlirU+pYlsr5LvW584GrrhnUXj2wi2PYgsrj8WzOVmN6/a6lJBD/J4ngXhx3s7TQRuZU6/62IHIuirF9D0/6nQ3N7N3hNuawlN4xsx4jqIoLiwVx3vRof7jf4TAXIGw1zdwyEXNaw3iPUCNMHVIGcdlvf86X6bNWGMdQQAGUGkqohilBSTqpXU447/dOPXG3rxmmhE2r+Wb9Qjsi7JIodulW3QFnDAOejJS+RbPAFLCXrNatFa/YvKHqtXmIu53/1MGCfatwPDldugfK2icQLe36Cxg/L1X7AOBI01
x-ms-exchange-antispam-messagedata: gZ4xtu4AZJzAjoQSQn2vFPZqbrT4d3ff/36TIcPqBeouthS7bFdvpBtXlKOC+vo7mWJ6CY66Dj45PPrDvT4pSuHcJIEnEdsnS8cedCVwahXChcl2xOiOWaG7MVI0P1VDT/uZLXb5yf3uHEKdU2LHDA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe1e414a-8f5a-4b20-ccf2-08d7ad34bd72
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2020 07:50:32.1888
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t1Yer6lvCLMdzIBiO2iK8soWKOnelvTten9EOS/yLXC/pUvoIjrlb5E6aIbOET0zXQWmRaWGome2mC29IKeG8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5726
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> +                               gating_wait +=3D 10;
> +                               usleep_range(gating_wait, gating_wait + 1=
0);
You didn't addressed Bjorn's comment concerning setting larger upper bound.

Thanks,
Avri
