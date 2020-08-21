Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77B8C24CB49
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Aug 2020 05:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727817AbgHUDVt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Aug 2020 23:21:49 -0400
Received: from mail-mw2nam10on2080.outbound.protection.outlook.com ([40.107.94.80]:49633
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726844AbgHUDVq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Aug 2020 23:21:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D80M+ZyDvMt+J5JGgFLHr8eY8mMlEe4VA68saJKoV0OhkUvuuDQLl2ph0EebbCHYLEqpHVnFoMZlM4Zkdu9X4vNi9VPfy6jYfhMuP04YdckYFpwYteSSAQqTV+BL2SKLPIAid1pkuGLTAtZ8lYWZ4y+H1vIKCDyL5q296UDRlk/cLs1cBKYF1C+LS5s/HlsD+7rgUvB6FYtAJf71LfsldTL9rb2X2d9CZSkIbC/afhgtBdwCIHFjdJa2aluQBkexLPIayQmoMCtjb1Tz/9lQSX763h4dU9lTfKXKWQ4IzjlrrZRoDOsJS4EkLnCs4wjbwIshN81WsfZG3b6sIZ3ftg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcYlY+MZXJ4V+wb1pH/knpwMDRaWnhWfLgLTuQtDCVQ=;
 b=BJ+OEh9HBhofS/rzmWGJ3+NibhJsSByX0BgbtrL6L/H4BCETDkcv9CDy2Z2NbRLjqwYgUJUYy2R1lpTfPRwtmSLoekYDaXNgh2ml+Uf0PlXPDM7RXAuQPBXwP5j4kIoZppDcZpY5OfkrOQGDZm4IHwHw2SkCyTeotYYf8cfzVqwd3ZXcfnq9PR7GYR9rgSynZPhovhHQRCjyViuFM1UoQUR3ZsN7XizaINlEbjv0E+g3dSgbn2NjvLQ0Py7SJ4C21gPXO8wLXldkJA8xiXAEUnWwLldyKHUeVIzjFXtM10VcSmf3XUg7MuaAnF8xkhT8OCu+5u5VFwZOTOz97PLRDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcYlY+MZXJ4V+wb1pH/knpwMDRaWnhWfLgLTuQtDCVQ=;
 b=n860/gOtt1hkzL4+lyx07RG3oOSg8qXBgpSWM1yCNa6yJYD54tr83lgH1ZOuKXeXRGZUh9YoxaYApjVaYzD+Gq806SqeN+fGqLu5dezYNS5588zLW54VX8P5kM0RcuHcXCLzC5FBPAZjWPUFWVko2lLui2Q+C5XkoubTWbtjkQA=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17)
 by DM6PR03MB4617.namprd03.prod.outlook.com (2603:10b6:5:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Fri, 21 Aug
 2020 03:21:45 +0000
Received: from DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38]) by DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38%7]) with mapi id 15.20.3305.025; Fri, 21 Aug 2020
 03:21:45 +0000
Date:   Fri, 21 Aug 2020 11:19:43 +0800
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
Subject: [PATCH v2 14/15] regulator: stm32-booster: Fix W=1 build warning
 when CONFIG_OF=n
Message-ID: <20200821111943.29b2b4ca@xhacker.debian>
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
Received: from 255.255.255.255 (255.255.255.255) by TY2PR06CA0043.apcprd06.prod.outlook.com (2603:1096:404:2e::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 03:21:41 +0000
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7d13b40-1e3b-4b69-a632-08d8458154af
X-MS-TrafficTypeDiagnostic: DM6PR03MB4617:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4617799892F1018DCE72B569ED5B0@DM6PR03MB4617.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cNlgqu8nSziaPjO5oWhMYTFYuGvv3UjYZRJwdfoF743zMnAWVlGIlxrOvg12de837MvN3KH285SiZoPtIEif+9r7p0QlADodL+GrP7nkwT2F1pfmS6DmcKGeqylCF8HEbBiVsFQBgWUYBe8lESCWdDic7SHfNIWkvLUynVUVPZGTZ2OiLM6+YZkXPd0YUZ8xjfu2k9r84YZJ9D4DCF6i23BJWF6PjghB3Q5QwaqYE/4A89O07KbcSh0U5LqZ7lvsT2MrLZz/Xt71dTbrmGmVhU3fDzvVwCOQLf6z7pxql5+0Q6lCDd6WHUK2CHwo/sCv+yWbjWcuJ//8jpkS6gBVCj1VDS4KDiONtTvTtg07/dd00R2Gpn8SF4x30y22RRXY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4555.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(376002)(366004)(39860400002)(346002)(66946007)(478600001)(8936002)(1076003)(7416002)(66556008)(6486002)(52116002)(110011004)(9686003)(4326008)(66476007)(8676002)(5660300002)(86362001)(956004)(16576012)(186003)(316002)(4744005)(26005)(110136005)(2906002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: hYKuWuemDanxklUlMFInHQUMfvpaumbWJLep4qr1R53VO8B3FKZG56oFqVUwwl478JPmTGV0ehUUuPAhD+9/g61gYxfa71FfT3Ol3lwQ9xg23XtWZFq4i6JJWPCumO8bD8+NbH9+ewe4vGQTzaQf4XeF+LxJ3M2JpKC+86W3QHqFBWyQN9GcBJtcwfK6yuM1lAl+mUK9vpHd1n0G/hr+S9A3gVlhxd50NJkSGPBw5UrEiiiEzZABoEpPDDiOCk7IK2gR6V/HpAUIMlPX6NoRhin9thSMarfeM9HfWaB6UalqpnKBO76mMkNpkC45sCZdZN5D/3bhCZ39ysFYAeAlcH+ajCwz5PjaqyEe5E8Va4H8LPg59qqpzFSgINposM+uc/7DCmz0h2Bh5F54aBolmo58p+kQ9AA918rSEbCXi02XbRpM3yynz6ZuJ8DjSJDQVZQJUbYvRCiw4isJ+3jVLhZuEE5zWaq7CyLa+N7A8hWFUJK2YKNVTKXoBtDrnRh9liQ580Ud2t0qO0l2pUtXwCILlPnYL4ZyPeycfUW+2z4c65fEl+fRFPHyUJMuQTQoHyunXw4xlrH8a0srhPgEKt4Oao9mzqi7A6ILqhOeMm78gTpRSlobC2Xl6TZ/CU6WL+QziZMGvjwnvic0mpuTeA==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d13b40-1e3b-4b69-a632-08d8458154af
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 03:21:45.0408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2iEKwDzPqParMuoW460HE0jEgDbY9iqBh60q3xSqUI83u3lqI+9/hv0UpnGixd1hghWWk8pWff9SSfBev+tc5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4617
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix below warning when CONFIG_OF=3Dn:

drivers/regulator/stm32-booster.c:104:34: warning: =E2=80=98stm32_booster_o=
f_match=E2=80=99 defined but not used [-Wunused-const-variable=3D]
  104 | static const struct of_device_id stm32_booster_of_match[] =3D {
      |                                  ^~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 drivers/regulator/stm32-booster.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/stm32-booster.c b/drivers/regulator/stm32-bo=
oster.c
index 03f162ffd144..3136ea8a35d5 100644
--- a/drivers/regulator/stm32-booster.c
+++ b/drivers/regulator/stm32-booster.c
@@ -101,7 +101,7 @@ static int stm32_booster_probe(struct platform_device *=
pdev)
 	return 0;
 }
=20
-static const struct of_device_id stm32_booster_of_match[] =3D {
+static const struct of_device_id __maybe_unused stm32_booster_of_match[] =
=3D {
 	{
 		.compatible =3D "st,stm32h7-booster",
 		.data =3D (void *)&stm32h7_booster_desc
--=20
2.28.0

