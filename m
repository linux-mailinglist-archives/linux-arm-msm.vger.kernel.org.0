Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 150ED29D739
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Oct 2020 23:22:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732641AbgJ1WWU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Oct 2020 18:22:20 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:16407 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732591AbgJ1WV5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Oct 2020 18:21:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1603923716; x=1635459716;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pfQ6MZRDthoQwzVOs+bVYPvaewGWtODGQqJl3KL0200=;
  b=TyXws0NUaPQ9kKSREK4pK501VAaum/vmC1PNdyOzXEoYTmprCk4wOAMJ
   V+QVDTpScY7FvzO2ZV2uP7yhxfMHxeWQW3Y0XXGm5tdG5gKkXHdkKEMOZ
   GRXzSRuUhQcEqQg5MlGV8ejpJ5mmgJctuQmacyL4ios4V17BAgoKV0fzX
   72If0XytUQ6dDwt1wpbEzbjGHytZXncJkWVEF5fK+ug2i9wLy/zm6/KOU
   GV26Mef+9kt+0Q5gvMYzZsAjlo+P4edZEMOlrW3+k9iEytUmITH3vvqA5
   LyXrVrkL5AKHE1jZbl4xX7MmYwcXQ6x4Wg5ItgDV3FIFLi37WG8s/Zb85
   Q==;
IronPort-SDR: ODtPwuIEyDMPiZncUsUkzECVHLLjRHzNa4hnnZ5gDCm+yxrlhJD19h8tv3pDFtozK0/bwIKFhz
 4tRYvaqOpTjqz6X58qsTnjidRpZ3GtgiTRKfEeGE5dA5GrycbIwUW/Q3jejC3j75cg2douv+3K
 UuIlk1jOo+hpLxHyfWOCAHvP7Z3Ro2oUBzYCQNwNFN5tL2hdjCaCdCBf1yuZ2t1+ah6tCS8TN/
 50i+kqgsr7CS06odCCUO4SKEhPRIb84pUWQEDUbedN1NBKbBJ9EZzex28OlhzvsKii0d8tTpax
 gIw=
X-IronPort-AV: E=Sophos;i="5.77,425,1596470400"; 
   d="scan'208";a="150991890"
Received: from mail-bn8nam12lp2175.outbound.protection.outlook.com (HELO NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.175])
  by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2020 14:18:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Itz6eaOMmCHnKBa+EqO4XFGufktWrfAXe31NaB6Ij6C7xSRB2IB581gkzxPYa9FiSQJcAIIqTBoF5gN0X6WKk8aQgVZ21ppehvH5Bf0UnKTMF/Wr0EvIMAepHNFcvkcEa1mDRY5K+YrpQNBCPjHmNqk//3b5hG0Zdzw0SSvnN/ZnBeNIgUkESSrxkmh+HyC8WXKT0N8jAULNG5Q+tRkBQjsL7uC1OVEgQ070eveLbI/5ep45p9nnjW+RY57xY+exP5phH4xpi4L2dzZjdt4xiyk3s4pV5PQVep9MXIk7k43b/cAWsknhwAef2DPV5XMLNFn6ywlhJWGcGRKIcyfrnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pfQ6MZRDthoQwzVOs+bVYPvaewGWtODGQqJl3KL0200=;
 b=F6AJWVtVynYRraNg1Rg+h3Ycybh9lrQxT57yC5OW4Sl9dRQnOramJWXtCCHWXWpHzhTrSjuMCFmLWfRmYcUUGKCGoZsXbr+QDgu/ttU2qL9pp2ekJTIWT3KOVHF1wP5mRQoxSCC8WTmwYMmX903HOCxg4n6L4C4tsdqSojUnLhV3BpLTrtfm07rFiJh4Ayj0EvXTULQ1/RZevOtwfcw0R3KneHUnLU1H86cMOPAVDY7BtXgxCzjgRBfGPe+hnalL5/Qsyl6+n3OhRZl/0di8YwPa+SEsIO0tWIGPArFsvRRfP0bDw+Pg63rf/otRpertmoc70QIL65V/pFNX5SHfIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pfQ6MZRDthoQwzVOs+bVYPvaewGWtODGQqJl3KL0200=;
 b=L5/YscOxaYCoRNFcB1SxpMqnRpcKM0l4AfB8/rx1IVl+/TXhy3qhywoqTiZ7lwrLCSbRRsh5PQ3QruhuUd62FpnedgnIu57ygKVXnEBhV/sbMIk6DobjS06plyiiJr0H+YHbhoGQzB2idON1Lvy/cwNBzCs50r/+CC0lv8pBBOo=
Received: from BY5PR04MB6705.namprd04.prod.outlook.com (2603:10b6:a03:220::8)
 by BYAPR04MB4855.namprd04.prod.outlook.com (2603:10b6:a03:4f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 28 Oct
 2020 06:18:10 +0000
Received: from BY5PR04MB6705.namprd04.prod.outlook.com
 ([fe80::709c:ec54:b10b:2d90]) by BY5PR04MB6705.namprd04.prod.outlook.com
 ([fe80::709c:ec54:b10b:2d90%9]) with mapi id 15.20.3477.029; Wed, 28 Oct 2020
 06:18:10 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Asutosh Das <asutoshd@codeaurora.org>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
CC:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] ufs: qcom: Enable aggressive power collapse for
 ufs hba
Thread-Topic: [PATCH v2 2/2] ufs: qcom: Enable aggressive power collapse for
 ufs hba
Thread-Index: AQHWrJTiuVqcUW9G5kyfu8pY66aJRqmsit8g
Date:   Wed, 28 Oct 2020 06:18:10 +0000
Message-ID: <BY5PR04MB67059BD084CCDED6578642CAFC170@BY5PR04MB6705.namprd04.prod.outlook.com>
References: <52198e70bff750632740d78678a815256d697e43.1603825776.git.asutoshd@codeaurora.org>
 <1306284ab2215425ca0a3d9c802574cbd6d35ea7.1603825776.git.asutoshd@codeaurora.org>
In-Reply-To: <1306284ab2215425ca0a3d9c802574cbd6d35ea7.1603825776.git.asutoshd@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9e76ac9f-9c82-44af-b8df-08d87b093e94
x-ms-traffictypediagnostic: BYAPR04MB4855:
x-microsoft-antispam-prvs: <BYAPR04MB4855EB6638137C85C9C05AF5FC170@BYAPR04MB4855.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:590;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T+Fwx35oOJkuGd71IE4ZwR0DH0JJjALlNLMJ+Naxu8KRhFADjQvJ83cHwCMxCqu6JKFyOR9DNPnl4MUG4N30ZGQyBhClIWabbf6QTLsseh2l5l8dtVHbaH0ijGYZki9uPUmqMF3kfiS9+8qC8HMNflTxw6tzVqGs44DfUi7V4HsAV9K4o2BwgqFBj2xAnYVM0JTZnvipaccHmqkZt+oUrNBng4QGPxw7YFhDD8PngeIEXOfSxIQRoKjWGSXbShJlvRGXWyH7GbFBIBCY6LCDxPH3xZvey/ivLD6tPLnLYdHoo0rN3r1FJQTo3nTM8HIfaN14OVXHyaq0A2rabNrEUg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR04MB6705.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(186003)(26005)(6506007)(71200400001)(2906002)(8936002)(7416002)(9686003)(33656002)(8676002)(4326008)(316002)(110136005)(54906003)(7696005)(64756008)(55016002)(66556008)(66476007)(478600001)(66946007)(66446008)(86362001)(5660300002)(558084003)(76116006)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: aqfho+6PYSOjBehJ7SDIMr59b3d8s868f7HuolCoyz33DHyWVk22jKP9SDoEnQGuifsD9XIBlwOw//aTQosm4QsJ0VXJ4VicDrwuq7PtCoLf6sOdRUybqgBGogaouSGeajYfZNd+TQUECCXir4du25PzmrUOCV4vq2ojUGFbt3PiYWpVM5sPBr05hiQ48XFwEUZnGxx9oPDHYnZEksoW5y9GyAfRGkBtadVLIsE5SJPo9xZt3QQMcwXKF8tQlcJmmeWdJw0OArxpC+VE8Jy35PmK6p1ibsHBoDHwtQDdAix+GG/ydQDSHglSGgO5+79NgHOufyKuqrrMO7TYke6FabF/bDWotgdGtWZGxegQlS69oFFe1nJ+g5O7WBxT6oUr2Xhf5DVC35iLwzDV3g+qBeR04GrLdmy8rzvnscTFRuG3XI2+sp+KYE1ukSUGyw1ZVS1VpNhpVxQOit1I0pOT14zF98YabPxnNBvUajnDtxwDpGORtikfeqbuwHBoYJlNWxwusMIESONIKUmdnvfDIanKw8byQbmGAF+9apQDnwEBlv8cewp3Bpt9zJPq5scD+tGucmpqLguJFXekYOIsxofyttGwkf+6SM2CvL/AnGHXGhGsT1mBI6Ee4Zgd7r2GTBtAlfXsQnvyfEuvNrrd3A==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6705.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e76ac9f-9c82-44af-b8df-08d87b093e94
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2020 06:18:10.6606
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NcFZnIoK59xvMJwuEcrLj02nYjJwxOWz3NecFtsnrixWaNjpBRF5k0Z1QR9D+RcXFkVWNgdh3Ek4GjxD1dRE1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4855
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

>=20
> Enabling this capability to let hba power-collapse
> more often to save power.
>=20
> Reviewed-by: Can Guo <cang@codeaurora.org>
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
Reviewed-by: Avri Altman <avri.altman@wdc.com>
