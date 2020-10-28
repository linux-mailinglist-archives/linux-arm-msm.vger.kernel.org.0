Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AD6129D724
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Oct 2020 23:22:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731965AbgJ1WVZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Oct 2020 18:21:25 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:16360 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731661AbgJ1WVS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Oct 2020 18:21:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1603923677; x=1635459677;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=F4Kj22dih+xJ64WFMR0YQ70w86ss6eci4Y+/IQoFkNk=;
  b=RMd2VlWWodztOI+NVSKzXVo/CCwMojP1m9tYD09/wUDp0qF7OamTOXWA
   VoO9xHjPGnOv2AjuNXrZwN7+wxwlHf23CzFYHAYNIFskBf5lbBG9xqhrM
   QktEwOgtd/0h+5kzpvbAt/o+vGURQjHXZjsllMKeq0RuK+rsQUwi3dZju
   YyZjbkcZKmnVyipafAd8M+njPhk5QljkgUS84V71ihfoL1S5tDLHRFPRk
   X8szQlEWZYP7FO1gMcRkkNW3wT25nnk0iSvMS79EeUYky+3WwHfXxa38B
   cFKcE5RYAwRiyDHrz7goW0Rf2K64TCIZEBye+saWgBQ4fFA6+LgVR/e3L
   g==;
IronPort-SDR: 1Zxrz0iOyKboVhtE7Cxs6roayZBak3I6lcfTt8FAM3LsQ4CFCguQWlymrhw9C3MDBMM4S7ADWf
 hJDpf+qq88ohSueaEk1iZikaBFvVLb/KZvT38MVfhI1PnZ775RYECBeeQjJUaHvNgfSU4q+LaM
 6k4AclbmW2DNvbMGBjd61xc4FxOllD1G9peQAcIc2is0n7x4HtZSvW8DaaqDykSMHUT9kzPVDj
 LlVKLdyyEvk/ceb9N+9VzVYSTDLp/QwQrV8GMyYdyTbImfkOFrGmXfM/M0WU9TZLiey/gRFCDE
 ZVg=
X-IronPort-AV: E=Sophos;i="5.77,425,1596470400"; 
   d="scan'208";a="150991861"
Received: from mail-bn8nam12lp2170.outbound.protection.outlook.com (HELO NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.170])
  by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2020 14:17:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RBb/CC6GhWEKozCa1WmAyDpvHbMm5VJgjCArAOsB4war0pijXP+iwub7TOeRqkybIYRlIfCXE9R2at2hXYzYdf1qfYIaEeB0pSfJYXPBf/OnDvqJRhYSEHKvAqLbFfo2/MLdHc3alE7xNygs3qbPEwBRpupTqBeRFXBva/0Ssj+H+WaxI1yaQuBzy8Njl76g3G5NvPyR/CIlj2JKhYvnDlYUQVafdFymZ5uvhOvl9msTWQ7aCh/HIsE9zfG/RktqNEQ+giyCF9NMW+ONxMJowqPZERA/uFPwHqqoQv2ocuhAezy3p8gixQ4yggqDXv0cEsrDTZeSUbXKhft13cIX8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4Kj22dih+xJ64WFMR0YQ70w86ss6eci4Y+/IQoFkNk=;
 b=GrPeIoQu8qjCuERI7TMLos31qoQRP3WAY+U9QXW9Z+5YSvFyjGZsbih7n5DCFScVunCg+62FL5am50iISmdoLxtGpDSnnbNIKwCXBAS/Q71anl5qnpWVSWEOIKUbAHlSWGocw2j18y4160roRDQPMJyvS3zjLtbQCHsrv69ceHii2uFa9XBVj1NuYDx+xBlmeerCJdHLefZU+QNyq/8awn1LFoe+kxQDEfYqQQnu1WErHnIdoQl5NuE7RKJXlYZFcjA6xek/kLiYnZU3ucY6k66VNHqUnOf//ZvbDa4khh7jRlga28YBGdCzsxhT8J9jp5kqDMphYgurqkLmhovgtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4Kj22dih+xJ64WFMR0YQ70w86ss6eci4Y+/IQoFkNk=;
 b=G4Jdmdv4gCzSNClcj2JxgSjUyvyiov1+IIVRtFCOx06gwZDO7WIlNKLEHtfuIvIYBklPnV2BRihg5SgxBwZGokkwZz/39xPlQ+5Qzd6il4BMTNBWeeMnGGZwhJMOKDl5aNyvqmjjhDd9lDN0yefw7arUEkmesR18cKQz4A8LBbw=
Received: from BY5PR04MB6705.namprd04.prod.outlook.com (2603:10b6:a03:220::8)
 by BYAPR04MB4855.namprd04.prod.outlook.com (2603:10b6:a03:4f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 28 Oct
 2020 06:17:28 +0000
Received: from BY5PR04MB6705.namprd04.prod.outlook.com
 ([fe80::709c:ec54:b10b:2d90]) by BY5PR04MB6705.namprd04.prod.outlook.com
 ([fe80::709c:ec54:b10b:2d90%9]) with mapi id 15.20.3477.029; Wed, 28 Oct 2020
 06:17:28 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Asutosh Das <asutoshd@codeaurora.org>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
CC:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Satya Tangirala <satyat@google.com>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Subject: RE: [PATCH v2 1/2] scsi: ufs: Put hba into LPM during clk gating
Thread-Topic: [PATCH v2 1/2] scsi: ufs: Put hba into LPM during clk gating
Thread-Index: AQHWrJTlfEKccjcPoESRicEUo250QamsiptQ
Date:   Wed, 28 Oct 2020 06:17:28 +0000
Message-ID: <BY5PR04MB67051A587A7A0EEB5F26C295FC170@BY5PR04MB6705.namprd04.prod.outlook.com>
References: <52198e70bff750632740d78678a815256d697e43.1603825776.git.asutoshd@codeaurora.org>
In-Reply-To: <52198e70bff750632740d78678a815256d697e43.1603825776.git.asutoshd@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f3c6f0fe-e163-4665-79d0-08d87b09256e
x-ms-traffictypediagnostic: BYAPR04MB4855:
x-microsoft-antispam-prvs: <BYAPR04MB4855FCA2CCF1ACFC2313A19DFC170@BYAPR04MB4855.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:364;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nqb0eYpc5k6u/xpbLkO49anhsMQ9gfZY2377bZmoBK64h9jTb/M1fpruoNU7R9AV9BjkgdABBuupiU8W1xYFBgDyJJ5sN8vPA8reLpsFbqobrw4c0tiCmXfgidHupTRLdoAzy5FsjwvXZ/mr6yhknCfFp+L/MD5zOXE4Yt9DPzG0KJcLGlHiA3MzrCXGNM5cbujXywjztYRPKGzJMyGuWUmcFQ49nbRK8IpeUdlDUefgnLK3zm5P+en/pMcGVEh4ZwKsenIhDXE4tRjg+QpU8IE/TatNb/TMt/6S1eBLdY8k5abyhdDlrWzYJ/OCL7tc6lbLwPX1fWGcRYIVFfUkJA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR04MB6705.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(186003)(26005)(6506007)(71200400001)(2906002)(8936002)(7416002)(9686003)(33656002)(8676002)(4326008)(316002)(110136005)(54906003)(7696005)(64756008)(55016002)(66556008)(66476007)(478600001)(83380400001)(66946007)(66446008)(86362001)(5660300002)(558084003)(76116006)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: XeZ0fnbpuCKxbxvrb5fq+tr6r2k2+cs2E/qtNQ8EVf1ofY0mtdvalnG9EqyyhLx8snkzl2+Nk6YO3LIhgCrbtwbELK20NBFwq1lmPe2C6xrG8EsGD6y8hP6zRovb5GkPuYZEZzT42sca1mwGQtSlUgr6vcb5oLJPznqES+XmyE0eiBWpi65rhcvXDkfS3AlInRVdj3fU5eEmM9Hen3a96JoS7EUpC9/yyVb+MTncgYUF25YpOi98B1wD/BUcnh3ZIbNpmZPXVDg40T+VLSqDP+x5kVI1VV+DxBgKzIScguQ0WMpsrRhThJXuyzhBskayGkxzT2+SUBZpNU3R8bsMH3FOWkaqaNqKOb7u+C/w1T4dl/2gPAfS3SNVCau0dQUMuivE2Ob6uAtv1YBlCpRxgB5Vsv+pyLcc0nf+Kybe58WtzjF85Y8UJ3OwcpElBGjDYfPuHQ+xHt6InRozuWYbSb0J3wxUe2EGXSM6KMnNt9Ucw0JbHH66Ysw0eZNGBEpxe6F1xm/hUoPKjomm5IvkDedznFQUGsn5obmkE1NWN0d+CcsrmSCR+hS6szRM9XBT23sUzXjWKm6ZK8MTRj7GmXzp0SQe4BIjamZWBb8308v7zMFpC6fUYsnVwyKEijseecwhRhcHyusJw92Au49z/g==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6705.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c6f0fe-e163-4665-79d0-08d87b09256e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2020 06:17:28.4032
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T/Nx4/pHQPcAkIghMJSv/JdMvRMCFXJd9e5ffxLLNPYvnsMdeZ8Qpoqbn3tybRhA+mhNclfOnilvSotu7bnQPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4855
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



>=20
>=20
> From: Can Guo <cang@codeaurora.org>
>=20
> During clock gating, after clocks are disabled,
> put hba into LPM to save more power.
>=20
> Acked-by: Stanley Chu <stanley.chu@mediatek.com>
> Signed-off-by: Can Guo <cang@codeaurora.org>
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
Reviewed-by: Avri Altman <avri.altman@wdc.com>
