Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14C0524CB55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Aug 2020 05:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727901AbgHUDW2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Aug 2020 23:22:28 -0400
Received: from mail-mw2nam10on2083.outbound.protection.outlook.com ([40.107.94.83]:42081
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727888AbgHUDW0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Aug 2020 23:22:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GOA4VSPKU1ktgNDwkaZQfKIX10GTQInIDanr1eGJ2nzJlZHLA/VPALTgYRC/273Gf29GlKNjty1aK3bTh0tTIlNhHj+z94Xa2ERKEnV/ObyZ108SsBXMuh9YyaKzl+tsDscrV2NLsw/czEPosl+MPzmGz266U/cRqeAThINULOQvEQy5ndjhfuLBKsHWPo3XO6T4DS6LbYGNI3phUY4iawUSd85FLuEJTmEICh6ojauoYA3MYSZiTUGw3/d5e8pAZdb68VTucUgRDgSt1qVxxnOIKzHl/dQvcqOhWPciRP/I6+E2ta8aZKK4AxorfNnryWJutlOBgzqiC0yeLBLoFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+KFooVM9k3BXdfBcjsr9k3COPM2XXtXOyUae9hfhpww=;
 b=RxUlQyhN8Fvwc/yu8E4TMlUlt3LPzmIR8qYVAG+he9qTI/eee6b6vwkLOcowpqVhhAG0/tlysp4fsFBscSRCP/NjvRfLv3hmi4bO8a7RW2esDfADfdvYF73GO7brG784c44yiUKjjEUWY5xGsisULZbciKvb3b8RmtP43gZFNZooxsBGDD0/xpWojJq36DxowOEaUjZ9c0MhfjTgLvyBtkwqGw2UJir5easlhCV5pD8P+HsRiQojx/ZyNU2cqnkavpEa1eLxwrr3/j6pPrbbtxStqH30BTSnug3j9KOXv6g7XKxxh061MInf2HtSJPyPQpn98eNYK351JHRChaU3SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+KFooVM9k3BXdfBcjsr9k3COPM2XXtXOyUae9hfhpww=;
 b=h7BDphG3HmHaTsAM+U2LsrIL47TMxUpoFXEVzk4cfKX3RXc6Cbv1g+9+hMrBrcZEHxCq91jtxyGE2BKPidYWALYLNb736jCWphT4edu7Ym0IzPZJUWNJCHgDQQ2dSTRqbRaOKXMXHFbo24aFDob8GKA620l8wVa03R0dAp8G0FE=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17)
 by DM6PR03MB4617.namprd03.prod.outlook.com (2603:10b6:5:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Fri, 21 Aug
 2020 03:22:24 +0000
Received: from DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38]) by DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38%7]) with mapi id 15.20.3305.025; Fri, 21 Aug 2020
 03:22:24 +0000
Date:   Fri, 21 Aug 2020 11:14:03 +0800
From:   Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Icenowy Zheng <icenowy@aosc.io>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 04/15] regulator: fixed: Fix W=1 build warnings when
 CONFIG_OF=n
Message-ID: <20200821111403.3e8b58a3@xhacker.debian>
In-Reply-To: <20200821111135.0b958d3a@xhacker.debian>
References: <20200821111135.0b958d3a@xhacker.debian>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: TY2PR06CA0043.apcprd06.prod.outlook.com
 (2603:1096:404:2e::31) To DM6PR03MB4555.namprd03.prod.outlook.com
 (2603:10b6:5:102::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by TY2PR06CA0043.apcprd06.prod.outlook.com (2603:1096:404:2e::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 03:22:20 +0000
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17f285f0-c33c-4833-955a-08d845816c54
X-MS-TrafficTypeDiagnostic: DM6PR03MB4617:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4617B3AD52316BAE39445505ED5B0@DM6PR03MB4617.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:530;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NgbT0wyE3/QKJES+Qiw70MKAkf5Ksx/ZtCNb4kuBJGjYqtfMaPHSLsCPUAs747lsotaM89yIleT0TfZlJGYkXgRLll31Aj5CBl27v0WRwLqvb8yb16cg1vONXiNNd5qVafi7ZJDf95+77Q6ruJaFtslWJpKuJjoELxMGivn1hKHEd0l0TDs/QzYN1E+5ISk9Q72jhhjuRB/ta75e3k5doci4/V8IbTuDbyM3+bhXxFgfSqU4wq+qhjJr4WK1yC5mNp3QkhIoWjZZxX95mgeOSQZkTYweehlRXWjkUcq8JdiH74YaCtQBhXE4qOIIRloW0AAba5hj9NabakBH4ddiy6ytPgwvfKQ5DMAaw+EwwF13uVGqIQhuH2fjWbNo5qpk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4555.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(376002)(366004)(39860400002)(346002)(66946007)(478600001)(8936002)(1076003)(7416002)(66556008)(6486002)(52116002)(110011004)(9686003)(4326008)(66476007)(8676002)(6666004)(5660300002)(86362001)(956004)(16576012)(186003)(316002)(26005)(110136005)(2906002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: AU5iz4Xi3lCSfGJR/zbir2YV7p8OyXCgy86bUeEvsBLM1KRedcllnH0xO01tdp1nRedztZO9mdIb7Iuii5i2G61t+ZULOIgBMrhyGos2Sb9dJnE4jVECoX6C1Z6Ujt1HTm66Lj5xV7CMMD9UJkfb1igDo4rFgyyps+N5KvhE9+0fpSyaj8jWW9FAkTFH2jnaWACTs5Hp0RzS908+yg5S2ekaHSnwamx/AyYOsL1rdQhldiXDPwLLN7DFc0lySI29rjV1dWapj8ct5DAPq3SkPQFP38ghjOk/KeQXHwu9rWoVelIKJ3zrpfTJHG66rnwlfjEDuFKKjCkN/AJqTpHYEMwFtglj75bbBc9InRuyqeEktN7Rb/m1PywGZX6XJXU96fmTsJxkYEgr2kyxxSIcfuNsfWW3Xa5KIjeTJcZRSio6ivYsfgwu/nUAvbP6W95UrFgh9qaS+5m8VPjMtQZghUp7zhssFqt+33EtAkdbJGe+WzxAxDsaJ0uLDWXHZN4SCV5HFoUWp/VCTiVOcRq3QIrimBnRKUYJdDTvEhLG8Q2wYA7z8NxG2u2YuGScr4Sn8QOgSmMcj/s7DGdtqsbwwznjE5eS5mex0lTIN/HYwRqqdj1tibHeS7AL6aWNwXd5jAs9r3x6O4IA7eP3Yfos2w==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f285f0-c33c-4833-955a-08d845816c54
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 03:22:24.8562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LhYPbqWDQf/J9BXAJRZUpzEL+9rw7XlUyEDvGeH+9v1lN4FuHv6IztGPon3MyhCABntKqjYZMzkf1yqmKlRDDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4617
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix below warnings when CONFIG_OF=3Dn:

drivers/regulator/fixed.c:48:36: warning: =E2=80=98fixed_clkenable_data=E2=
=80=99 defined but not used [-Wunused-const-variable=3D]
   48 | static const struct fixed_dev_type fixed_clkenable_data =3D {
      |                                    ^~~~~~~~~~~~~~~~~~~~
drivers/regulator/fixed.c:44:36: warning: =E2=80=98fixed_voltage_data=E2=80=
=99 defined but not used [-Wunused-const-variable=3D]
   44 | static const struct fixed_dev_type fixed_voltage_data =3D {
      |                                    ^~~~~~~~~~~~~~~~~~

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 drivers/regulator/fixed.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/regulator/fixed.c b/drivers/regulator/fixed.c
index 142a70a89153..5a03fd86ad0a 100644
--- a/drivers/regulator/fixed.c
+++ b/drivers/regulator/fixed.c
@@ -41,14 +41,6 @@ struct fixed_dev_type {
 	bool has_enable_clock;
 };
=20
-static const struct fixed_dev_type fixed_voltage_data =3D {
-	.has_enable_clock =3D false,
-};
-
-static const struct fixed_dev_type fixed_clkenable_data =3D {
-	.has_enable_clock =3D true,
-};
-
 static int reg_clock_enable(struct regulator_dev *rdev)
 {
 	struct fixed_voltage_data *priv =3D rdev_get_drvdata(rdev);
@@ -260,6 +252,14 @@ static int reg_fixed_voltage_probe(struct platform_dev=
ice *pdev)
 }
=20
 #if defined(CONFIG_OF)
+static const struct fixed_dev_type fixed_voltage_data =3D {
+	.has_enable_clock =3D false,
+};
+
+static const struct fixed_dev_type fixed_clkenable_data =3D {
+	.has_enable_clock =3D true,
+};
+
 static const struct of_device_id fixed_of_match[] =3D {
 	{
 		.compatible =3D "regulator-fixed",
--=20
2.28.0

