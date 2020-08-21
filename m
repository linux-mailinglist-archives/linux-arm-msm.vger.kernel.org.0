Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7D5D24CB67
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Aug 2020 05:24:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727839AbgHUDY2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Aug 2020 23:24:28 -0400
Received: from mail-eopbgr680062.outbound.protection.outlook.com ([40.107.68.62]:48956
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727040AbgHUDY0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Aug 2020 23:24:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jfeBoEFgQ4B8LIRh+ieSJNRT+kbm6wxu4oJyish8Bd+4PiFFMp+bBT5ruyQgHy2SqQH2UdGsGUN4wBgvywiK/QRYLwLTb+vaOvkW4tlmdXJn1F/0UobNEjRpFFvrtIgFgvRTdllIgyeHgKliG9UFIMpX6CibtUQPosKD+jZNEfDYi/TSy19+qQhGXBUEBCqjr54kN03YghlHDruatuYMFprJaHCXV0bJ9WEMufZUKQkmeABR62GycvlYjK9BMpXvvia9+LGTeTXd8YC4hQWsYs+ZKVEOCUp7EUEe0nwREpho3Z5jmgbsgPMaHS6OcFF9IiN/x9O1S/nB1WSZ0z24Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kkw4dB9IiV+rPmNqEqYqojyEqT98ovuqVPXfXu2DO4s=;
 b=jxaUY7XaEmYAHoMX/jiRLUFPfhDV3nwripKhSIL0AfZrhCqkPOEqdQ7zHg045Wvw9d/D54FrJNwGLoWt+3B0q2bUvV+SXFirulQO2wua+Jku8ewiVnnov3dINGozY6Pp0KuzkfXHAx6oqirLGv8ThMDUWzCgvU1LBIGOPHjGT1632gsyMEkq5Z68avYnLfSIFtbNJtAHCHiHlW0hMiRm++1ZQUEv4Yl+No9jx7oXwqILlSVnakqQelHw9wCXAMOTtL4o/mu+ZAj9QN2pu31ZHBvIqwTGSz7wvSdJ+y+ZKs3hYdN/cD9d8jSUMbv1RvPzLxG4addCww1IX1v70vlMUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kkw4dB9IiV+rPmNqEqYqojyEqT98ovuqVPXfXu2DO4s=;
 b=GCO7bnB0esyx8QDS/IY5BZU5Au2IbzTJOAEIVWDYzPa5sbW2Dpi/Lo+nunok8DiwZbDIFskAmX7mKmDkWgP/PlgIKLdIQCKuXMKk8feJCIeD6OTaZnnYSBLiry4ff6r1Qcz+tkjGMrdbZJAXktmfelfpYRwzl1XTIGATcamZlpQ=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17)
 by DM6PR03MB5308.namprd03.prod.outlook.com (2603:10b6:5:242::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Fri, 21 Aug
 2020 03:24:24 +0000
Received: from DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38]) by DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38%7]) with mapi id 15.20.3305.025; Fri, 21 Aug 2020
 03:24:24 +0000
Date:   Fri, 21 Aug 2020 11:15:17 +0800
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
Subject: [PATCH v2 06/15] regulator: ltc3676: Fix W=1 build warning when
 CONFIG_OF=n
Message-ID: <20200821111517.59d7b8c8@xhacker.debian>
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
Received: from 255.255.255.255 (255.255.255.255) by TY2PR06CA0043.apcprd06.prod.outlook.com (2603:1096:404:2e::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 03:24:20 +0000
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 865f662f-d9a0-4557-3f59-08d84581b3a0
X-MS-TrafficTypeDiagnostic: DM6PR03MB5308:
X-Microsoft-Antispam-PRVS: <DM6PR03MB5308E2EC8620A24CE9D3A535ED5B0@DM6PR03MB5308.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ressFtiWj4+8J6YJ1onjoOuFbnZFpXN73jSNrzSaTXNLL8GhpF3tZC/SPzpAG/SIrlOhuLUT0/rdudBf2AL1XYShTkY14AXCPjr2wgs6sufa4ekmcHswxdXPYKfCCHIXgYOe/4lWA1B8uT4paVzeQuFbD5VoMQjjkpiEH1ij8hIM4hlP25g6GP9bf0BaBo+sPHq7AzzQxxMxnbE85xLCXU8/gGsTGVEJ67LE0iKWF8t9dmH2mt8RtnQkrRHsghCZDJVh0RxN79saTKhZR7srEduiPmm2R9s19AxHI9o/3IfpkIKsEaHxEo3KqKmBLHnZfHskjDZGBG9cNF4OP8LgeDK4zMj3SZnJ4auaxKvY4UeKzi++VkIN+hMntM0cagLh
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4555.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(39860400002)(346002)(396003)(136003)(9686003)(2906002)(478600001)(5660300002)(66556008)(66946007)(7416002)(316002)(83380400001)(16576012)(66476007)(110136005)(8676002)(86362001)(956004)(4744005)(4326008)(6486002)(6666004)(26005)(186003)(1076003)(110011004)(8936002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: RbWCFTrpf7KIR5gwaagEaoyIGxrVWbiLE4l9HL27NSqBGHHVprFRohREHVf/Do2xYm3DUkSRCprG6qDJb+t1sXwyxcpVAFtA9dcNhiI9zegdtrcB/9bZKLWHsij4GbntUt/ewr9InBBiyyFG8Qr2wRXfzB5I0ClFFMrHkwCAOlG6pIY4Stgju50fBa5svNfHKqwLg3iPf4liRqkgZZdKOmGMef0ukGSUacVGZ+gJ+XqE5sRGyXIA9YiHJn3DGEZa/CY10JkZLDB23RVpgu+lJHH8BDcy45q7Zg/Pe5Wesx9DT/iqo0n8JEUv9Nd5yIY3I7V6AO6XPFQ7SOujoLrCb+pQ3Ps6Qc0fpDwXCLrlQrvXnJ+EZMrrrF4PULKkMpXPGBC+LHXFs1i1aWOF6iKSeJ/H/FGybsK9LpfMcOpZu7FkIy1JC8tX0ghk9QX3oyvq/uaUlUGe6c/iy4O89ZwbbKThYi67v6HxiQo1tzit4jeLEcAGINWGiGdh5v0Ao4DBS2abqettNRtVB5JrCyzV17W4JuAosqguHZzjeJH/wWHJb4G08v73oR045O65bLHNOCddPGn6v5fH9o8dMD7Tyoeib6xq7tNGjp2HluovJbq/6jOG/K4u58hEXA2ZU+LPzyrxBb7fkuanA9EqThrmUQ==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 865f662f-d9a0-4557-3f59-08d84581b3a0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 03:24:24.4273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F1bhCaIHi4iGQBEnHnjAB0XfzYVUtSxHXAnYLeNpmfarj4JmvBtTRkRgmLJgqhUNudDN1unkhUO+19pTaPM/rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5308
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix below warning when CONFIG_OF=3Dn:

drivers/regulator/ltc3676.c:371:34: warning: =E2=80=98ltc3676_of_match=E2=
=80=99 defined but not used [-Wunused-const-variable=3D]
  371 | static const struct of_device_id ltc3676_of_match[] =3D {
      |                                  ^~~~~~~~~~~~~~~~

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 drivers/regulator/ltc3676.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/ltc3676.c b/drivers/regulator/ltc3676.c
index 093b3e4a6303..557727b54f0e 100644
--- a/drivers/regulator/ltc3676.c
+++ b/drivers/regulator/ltc3676.c
@@ -368,7 +368,7 @@ static const struct i2c_device_id ltc3676_i2c_id[] =3D =
{
 };
 MODULE_DEVICE_TABLE(i2c, ltc3676_i2c_id);
=20
-static const struct of_device_id ltc3676_of_match[] =3D {
+static const struct of_device_id __maybe_unused ltc3676_of_match[] =3D {
 	{ .compatible =3D "lltc,ltc3676" },
 	{ },
 };
--=20
2.28.0

