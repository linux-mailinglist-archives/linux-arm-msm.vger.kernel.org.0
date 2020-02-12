Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8A9115A921
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2020 13:26:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727732AbgBLM0i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 07:26:38 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:46075 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727007AbgBLM0h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 07:26:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1581510417; x=1613046417;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=edZB7X97/QDoU/x8PWct6XHMJKIt938rIjPWy4fCKZg=;
  b=NUzC2Jwbuh6oO/y3e+tk7ehKGQJaJRHeYPtaebamGM+/RFdgI6aNQSlU
   w+ohKqvu3OA9Yd1jYbv23nnOQZ1iSTy43R6X3gE9tDZQ59KQaukxzrHKD
   ELX4OaTgjF+kD0KPsO+kL1G55WosEPN0QeKjwSQ1xNwT8Jta0yE/+349v
   BPy2TwMzcaXHog39KBBnNIj+PXc6xSCeHDXAgKKN7xBxaIF/KC9Xxya93
   EiVIC+1PAiq65KJF1EoAgg+Ub7/wRDc5XSD3jFVBf/vFJtWUGtlMrzlg/
   P1cJWgqdlJcMydOZkWkYlkulbi03auRy0b6w+HK3cdxMxZQkk7lWK1tw6
   g==;
IronPort-SDR: IIl+Tp6vrysKn/S3cKgfDJ0jSNrwPLgedjawRY+HH29hL/+m8ReqcV+T7ArCfnSbRQwNq1ddve
 KaJFqA9pv7nbJ4MiWjun4xmyny5xz+7XspCh47/ONk/N/MS37D0RWNcDGI9YfZlExnm/1rxj8T
 0KCVrxC7hOXhw01KqrS3uyAPvtA1vSUvKYK2Ux6+SjpAZQjcmrlSjr40USP7MgxXTanhUJPJkI
 PKZhBX9JMhUkvcuBKSo4rxYDIgsta19b7JiuZOdQLMe/kgGV3wQ7wS45BpnBPd+36HzCYHpilh
 s00=
X-IronPort-AV: E=Sophos;i="5.70,428,1574092800"; 
   d="scan'208";a="231465233"
Received: from mail-bn7nam10lp2104.outbound.protection.outlook.com (HELO NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.104])
  by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2020 20:26:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CpDVFsenLBtbZCmW2cD223u0LkDTGd7Agw3xgBFrUChWOrsKYdwZAzgI9PtzSJ2f1q+nPzv1WFAk4ZyhxDr5Ortn6d6Mrx5X1KcTvG1tDAsgXrrE3n6o2eTle2fEHLwxFJdp1MrNsAUnrI+U3QfbLlltY1hUYiM3w4mxYLbPInQKsKJso04ZEfgva7UiurgTMFrwjXOXEmVDZjZ+n9av2eQmOFhNIdfUITXa7bwjzWEi+ofTDry6APOO9+0ni6I08fEXM/uwH1xw3XXiGSaSLynZD2o20RLnyhIL9lO4YYB/zG6ZWUMlYcF+HsHQpATCBw8//wp2UROu5X7gKUmcqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=edZB7X97/QDoU/x8PWct6XHMJKIt938rIjPWy4fCKZg=;
 b=f8qPSAViFG13W6phycZTthrZDsn2DiHx1QXwCs83R9wkP8DTkAfn52p0YT7UKeahUlaX6yQTpUGGc1nyJt+dFXZu29uOnM80D3NYs+pm33nNbxv32KH0Lhdocy6u4rhxmkaUueh7Q+BFLi4ZtVf/FxBkW8SJuJqMPt0Z5QdS0asLxVwXJZeFNB7Mfyps0QkOkhVkO7jp5dakhWxgGKNe1D+dnRdGUozZijgV/Ejpe3lQsVdH3rDSmWzNwYpKqjCnwqMEpJ4e0SYoNtY1PDjV7HCTdaAMCdqGGbdsOaKOdm00HLifK3oRQ+6SKlSofv0Fq89cCgk4szdTmMbYxqzIDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=edZB7X97/QDoU/x8PWct6XHMJKIt938rIjPWy4fCKZg=;
 b=zDDbfQdmZ/LoLyGdYQPspgRBVA7E3SC53OCiYpmN9D6kEaMWnJSVoIQtLFtYHp6V6jJT8Dz282W7f0lSVQE3NzH5sM+OBYBfUgO+bn/KlYexn1pdSay/IcUdOf92BQI1sOUWR7HC3oKGL1AspFUYPeoKX4zrBVzJTsvjeROKipc=
Received: from MN2PR04MB6991.namprd04.prod.outlook.com (10.186.144.209) by
 MN2PR04MB6430.namprd04.prod.outlook.com (52.132.170.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.24; Wed, 12 Feb 2020 12:26:34 +0000
Received: from MN2PR04MB6991.namprd04.prod.outlook.com
 ([fe80::3885:5fac:44af:5de7]) by MN2PR04MB6991.namprd04.prod.outlook.com
 ([fe80::3885:5fac:44af:5de7%7]) with mapi id 15.20.2707.030; Wed, 12 Feb 2020
 12:26:34 +0000
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
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pedro Sousa <sousa@synopsys.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1 2/2] scsi: ufs: Select INITIAL ADAPT type for HS Gear4
Thread-Topic: [PATCH v1 2/2] scsi: ufs: Select INITIAL ADAPT type for HS Gear4
Thread-Index: AQHV4WdtEUG2fhkxEky/U6KeRj9UX6gXfB2g
Date:   Wed, 12 Feb 2020 12:26:34 +0000
Message-ID: <MN2PR04MB699176BCCB6B900617C96303FC1B0@MN2PR04MB6991.namprd04.prod.outlook.com>
References: <1581485910-8307-1-git-send-email-cang@codeaurora.org>
 <1581485910-8307-3-git-send-email-cang@codeaurora.org>
In-Reply-To: <1581485910-8307-3-git-send-email-cang@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Avri.Altman@wdc.com; 
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b9dd74df-1e31-4ac3-a3d9-08d7afb6cc4f
x-ms-traffictypediagnostic: MN2PR04MB6430:
x-microsoft-antispam-prvs: <MN2PR04MB6430BEF0508A933235E16358FC1B0@MN2PR04MB6430.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 0311124FA9
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(366004)(39860400002)(376002)(396003)(346002)(199004)(189003)(86362001)(66446008)(76116006)(316002)(66476007)(8936002)(81166006)(66946007)(64756008)(6506007)(81156014)(186003)(26005)(8676002)(110136005)(52536014)(4326008)(5660300002)(54906003)(478600001)(66556008)(558084003)(2906002)(55016002)(71200400001)(7696005)(33656002)(9686003)(7416002);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR04MB6430;H:MN2PR04MB6991.namprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HTZfjWIjuUyktmzTTjhAguknLVcOGueCHserBJeuLVoMc8Mksy0O3Aie0yWlxKw2PEMeV39ls/hbac+ybiyUzHPjgAvQBLq46odaadelqm6djncWiPTsRFXqJ6NJWzLcHUjHMkZWOz89Ff7nFzA8tY+fahtqc8b7QVeeSYD/tegqGjtq3ucsifl/Ex9dibSovrFraMKRCsovxVAy4En+rwO9Se7LIp7SHSKUHvatChETPXVQ4GGYqzekfi0BnI12KqouhtMOa4cDpofljozMx3BjxViLRb5R8YrMl553+o9hcfk/RSdGcuFFAD8K/uBHq4IL8E87i+8r+LFLQqsxj3OdEO2NYQcAKX/8resmP6CtAPOAWJkj6RiNHiOgQBC13UEAwKx1hcsoTVqoOm7OLzmidmMetK63CVpqiwI+9w60f7TBlirLMS0LFHUSEs2S
x-ms-exchange-antispam-messagedata: mHxkg6fJkEDYYwzdiZUbLIaS3ywMBPEJpkMezsOkZNAaIWPRv6Zg2CLaOPP54aTvPKk7kJF3/yospoY1lCzkE7FITxcgxOsIByir7IDDyDv2YSaVT8pp0hERgJSU+NW5b0PHcdtGlIF45X3tWwIEcQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9dd74df-1e31-4ac3-a3d9-08d7afb6cc4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2020 12:26:34.1799
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N9Fg4x5CL/Q+jR6h9IwW6EEPx6/TZLrNXrcMBETQxbaZuza9CduTsrTVav8U2dsmpb3uymqhA4pl1Ow0xnG8Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6430
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

>=20
> ADAPT is added specifically for HS Gear4 mode only, select INITIAL ADAPT
> before do power mode change to G4 and select NO ADAPT before switch to
> non-G4 modes.
>=20
> Signed-off-by: Can Guo <cang@codeaurora.org>
Reviewed-by: Avri Altman <avri.altman@wdc.com>

Thanks,
Avri

