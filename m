Return-Path: <linux-arm-msm+bounces-32718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0084E98948F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Sep 2024 11:34:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC511281F0F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Sep 2024 09:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 727F213E023;
	Sun, 29 Sep 2024 09:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="cE+DdFn5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2052.outbound.protection.outlook.com [40.107.255.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE3013BC26;
	Sun, 29 Sep 2024 09:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727602484; cv=fail; b=FqIHZVjzhJ6FBu7GNkT/6l6H+CU4hOGptD5km/RcbbH+mJDlDsAhSVtwBA+UekTPxkBdktT/SVoavHopvLybGWk/NlAuaztF8NCcJdO4XLDfa6Eq3AOZ4oxMJx6AS0VlJMOIh7ZAY3GnNB7SV2eHNXPQjQyYNLZhUxgvlPXG67c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727602484; c=relaxed/simple;
	bh=YY6TJJB5VUIqry2FXWkpr0LOdEoJyEqcZTP1SbyZIhY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=rhQFnV6YcGFZZEQJwwgvit2WA5Q795BwuXHRg0SHWch2puunWGrLZJ9OTrW7CMZyoC20MeenQoANvaDf+XHK0wWCZtmNFd2OqwgUPP0XuZKtPqiMT+67t15fe94S+k1eFtj+nZnbYa7HBbD8ppWm/oZyqhCoWbdXQqLMlZNqEhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=cE+DdFn5; arc=fail smtp.client-ip=40.107.255.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GEA1TkvFD+r0/teis8iMjTEyLie89d2FQjpzlFu8wP9SWlNe5J/N01Yg2eCLBtDdvpyuHLZCEoe0jxBDxXP2X2dq8dRHUdsLb9IgJuqV4dt5nZ5PlAWT7MvTHlOc7sUrXt5RU1Y63eZ57I91ID2JdSh+fZjWPRdY0fDEBblPdlQlOkh05mQYJ9I8IF2hSydNvR+IFd1Hhno1Xe0iGOLLsk9tnWSyEVZA2FettgtVL1ENTZqNkq6JaavoDCBjApjgs7HE0xA3todyjjypBfNVUj1/puH7KIsAKKwCx6W6f1lKjNPSc0MpQxAzkwCRf7i122P6yFHymANxIvq1bGRiBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0dxrxpJS7t+TE633RoR+L6tOplE5LBNxwxcN8s/SCvA=;
 b=CHv7TaWMSsim+pYZgh089R5y7cPtE2Cor4Mqc3trG0Y8NPeM7CVB8RVCdYPMgyCPJc+M+BFwyKBlwG/DDZYBXqDlnM3INB3JmfTezGZV+N/3Bnd2tDIMmYlAjPrZ9J8ODSydDU9bkvJQbWHQrgxtPN1Zq9vP2rMS008i7zkGvzQRICymLtoyCPO1AfZk8t4faNaanR9FAlTm8fC6POHsZfr4QSCDXr1Uf+Ltx4xFQP2BRd4sM+9LJwCRPCVgojRm7RUZ3n/t17uxFPcQ00iKh1H+06d8IaS/AZjMnB2HGCKkzwzz9vPSAbBS/5Qr1jhivrK1czeb+S3Ia2BTiXNvHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0dxrxpJS7t+TE633RoR+L6tOplE5LBNxwxcN8s/SCvA=;
 b=cE+DdFn5wDdVdP/6xQ9fK/8myJURdo6hZNDZafzmt+hUj9HhAR1tnpfZgve27M3ROy8HMuSp6efbxGTWoTUIeq6w/g04tLaba6jJfbQ3uA3BSNV8kGCjNm8ZfhcwcDwU/yxWbHd2sDjdLgz1bMkUcXpPSIw0eazsCZduife1PgLX0pT8lIKRND85J8rhoHCorYTSFfbRhYKak+bz2X+NUFcKi1QuTNSX5uVn2iGHjvi6bi176tuGmjxnE5CIv2LzXlwSbv+Nyz7m6xS8JW+puvelnGyTGNR3J4RI+1rNfHIHovw64AMXtXXXS/R7Ylp5oke0xrZIRY4G4m3Bg7FCvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by SEYPR06MB5891.apcprd06.prod.outlook.com (2603:1096:101:d4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.25; Sun, 29 Sep
 2024 09:34:37 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%5]) with mapi id 15.20.8005.024; Sun, 29 Sep 2024
 09:34:36 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	imx@lists.linux.dev,
	s32@nxp.com,
	linux-arm-msm@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1] mmc: Fix typos in comments across various files
Date: Sun, 29 Sep 2024 17:34:18 +0800
Message-Id: <20240929093418.526901-1-yujiaoliang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0027.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::11) To TYZPR06MB4461.apcprd06.prod.outlook.com
 (2603:1096:400:82::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4461:EE_|SEYPR06MB5891:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c6e019b-523c-42d9-8c8c-08dce069eeec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VrTQG7zum8Zqf/BR7SGOhI/hJNcZp2DmxSCwlZOKvboeKCfZZSDHWFyOJ/Sl?=
 =?us-ascii?Q?7Jwn+XioqCa/x5D6M38gEmspxUA8AwLUkKJgHWvqPmDz6XJcsJCDFvOL2xZ4?=
 =?us-ascii?Q?GoLhjrAuRV9tyScEAkJYX0jpfGr8nCBBStBtFbD3p+AojVJ+P7bI7Qykheaj?=
 =?us-ascii?Q?uXhSLuPfOEId5YKqKa3me3GRciLNAH891GtC6zne31V0VR8ZfmZlH+43s3BV?=
 =?us-ascii?Q?zq37le6gctl/ThQrk0r7sVi6o06IHhxouN1RyncdIFjaKOORDslWV9PMlg0c?=
 =?us-ascii?Q?m9d95fVmpr9Gq8gmdct0y2o7NNo37frvPjQRBLaPha+zujVF0jHwhNUA0TxZ?=
 =?us-ascii?Q?6Tcx8HrZ4oKz6rljQz8f2Jwq0OcWIaOmNYmOBfwcNcTOZnocAsgwQOPTJazA?=
 =?us-ascii?Q?uH07JrrT3UnIzQiwHf3HBVi6xVw3DGQa+Kk0Ut6w5ungLJuMVKyAFNrxd3Ne?=
 =?us-ascii?Q?IwtFieK90x3sdWw5+sbFYExL9g4kPL8wVuu7voOVXCPNncaGa3K10QLBQ5mj?=
 =?us-ascii?Q?uT+1gMPYGDIvLu84P0J+XDlGQXsA6dWHBpZd4/QQaMOCcK52mvOIXhcquYh7?=
 =?us-ascii?Q?MujbdO8RTpT14+4zNg4s2mRocrcQ5Zl40w95FfOMEY1FrezERDBmgnPblQBs?=
 =?us-ascii?Q?a0gR3g5LdcJWE+p8zg2n4wpRJIPTGZMPuRk/d5XoBBJlG65mDERvvbCSY3is?=
 =?us-ascii?Q?SOsOjfu3hSoJ1d58obAjd9Osz18XU6B/1XhKnPxZHSOSW3le+d+z7GhVxa17?=
 =?us-ascii?Q?CcPkTXK0SGvXXfZOn1G/jGczSranM+x0TwwGBLfJdrl/PfZtpAdCoIkkUSMo?=
 =?us-ascii?Q?lDoR02SPST3PPVnWgYIkcvVihTaNSql6iANixpPURaCLU0xxQo+PdWQvVYHL?=
 =?us-ascii?Q?CLxD92S1Fa4Efnk8VljsTwSL7p+Uv8WDZa0kMxxry0sBF8SqKM4pNuAyeuEY?=
 =?us-ascii?Q?38b6yCTr+135Dyq0FFV3EbH4M+UaikzclnYqBOTFw1xB4Xueq4Az/zZm9/mG?=
 =?us-ascii?Q?h93OtGab866Bg2utheDzERLPQxzOOVnrSB5kDnJlI9vyNav+bUW5BRKF0bjo?=
 =?us-ascii?Q?dL27wBrn4eME83CRl36yfkK2zQ8RKpXJzN+sZ/j0rAIJKXACVr8jDjrd/6+Y?=
 =?us-ascii?Q?ewtgqkXFqZeGSuysfmFiRMjmhHaVUfBnozCukhVkJ7PByacLerRC7cN2q/Kf?=
 =?us-ascii?Q?DCKj+kRdUMPOQ3p+0PSju4RcyNYGdlMU92al9ZLcwq6e8iGKSi8CPUsKeaZU?=
 =?us-ascii?Q?987iz6fGcrlKn+gREbLjzYiAvFTzeOYRyyuUYvQQWK+6ddCTY/AImqGKfnd+?=
 =?us-ascii?Q?He6UHm3ApL78lEYjiBo0j6yoeG+mXX5P3wleRSkSOXD66+9NFsRsM4YJr81g?=
 =?us-ascii?Q?5UAD6/NPaVD0zV20rxy1eXFL2y4NKsIIkNBNIJr4+x6xUJyyPQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4461.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SpngrYx0TM75Z3/RNYyQlsoYYxe12od4XYiPlObY2gyBC9VMfD+O17AfJEQ7?=
 =?us-ascii?Q?yEX0QJcNmGr1vh/cfeAANaVmUQbYc9FzM5rvz8tXQ2BnF06ERJAIZMPTiPIH?=
 =?us-ascii?Q?LCWFdvBDbV3DqdV7bM4i0g/KTqNMJku8JB+gnJYq5jnb0Xi6+FzeUA54D9Zh?=
 =?us-ascii?Q?5J6ZuZSJJptsmZtdYqkuLDa26jPGvRykbbm5KHWNHWMTdAKBm5Da6HLg8Vvp?=
 =?us-ascii?Q?ajErj5sneKugBuD32xBeQC4R/FH0KigQ6mJeszcbROmpkE0L9iUsE5H6OFDK?=
 =?us-ascii?Q?erIboKGwqdrHaxaFu0H9iY/xBQUzoYk18Wy5bY1n88BouGtlsv1dK2W8GWp3?=
 =?us-ascii?Q?tntYU0es54onNa7TGPOQvWd/mNK1ZRMzrUEF9TuvwGRsVhCmnMHASHCAetMp?=
 =?us-ascii?Q?fBXVZRfdUEeDWOYeUXGmoN6p/QwQYKillTs4kjSJnv7vRWV7dFo11S1y4CKA?=
 =?us-ascii?Q?2uG6PBA2l7bWxGdLmJKkpM47NT/TkSf+j8AKmCTr8655Fqtvj/dNVHtsTVdn?=
 =?us-ascii?Q?s5IP4K/6yLvlYjO7VQp665E/CxiC0iy+G7hfy6UZ8F/hK8zpD+nR7J2yIbqv?=
 =?us-ascii?Q?Q15bJ8PR5C+y2KTJIXSknsdUM0p28KCYqZ9eEoh9BNFjM/NPKRi3dSg9Cx/F?=
 =?us-ascii?Q?lMJduBpTl+XmtmSAieIGQhhB+cRIb4EHshnbAW5G1uSa5sSFY1R0V0gcV574?=
 =?us-ascii?Q?n4aVuMYGkPtt2oTLla5Q4EqiJiv+uHf9ENozyea+aWEwiXPa+H/2JaQo1X9P?=
 =?us-ascii?Q?VxYNqRBleIujWO7NRdUzvJrzMIxT5hsJgNmO9QvxnthO48BRplCREItDT8PR?=
 =?us-ascii?Q?FcjEHm2m9LDPh3frlxCXIkjr8/YcFUfJRfwhcexKuhJ5WWS5QhNOOF7pEJFA?=
 =?us-ascii?Q?x3CDakdKFub21uVbUi2Qaakedi7kuixku64v/rkrU6q4Q8VA6CeLTUbZGcQH?=
 =?us-ascii?Q?PGF4B8i3hv4rfqRd3xBZ5lDLwAK8nqrHdlKFAZBErsJwZhJYsesY65iIHtXm?=
 =?us-ascii?Q?F/bB7BHNi4eUbOitT4vI0c8ZY+YnRReDiij+bqk2QivTHpWACNxy1e+F90o/?=
 =?us-ascii?Q?78MYl2y1rebV3hcJmLFBoM0t5uTbp3EnZxplLO/lVlTYU891BYwNk5JjAPip?=
 =?us-ascii?Q?zKlh90nAO+kXp//Hkjeg7pXluYF0dnz1t/RIfnxcRrfSX7tZ4xhk7zOTsCmg?=
 =?us-ascii?Q?HSNO5L+HabMXY8bCX474mxWPqWV/ik9YZsILRpLoohRw4FYoa/oGuIdFzVca?=
 =?us-ascii?Q?v/62Qr5icVhdezjQs2AxglUM8NWc3NlstMcLL6PBejrXuoekZ/5P3XiEYi+m?=
 =?us-ascii?Q?GWdonyCAG2OG8nd1HB538fpRshWaBlNZ+kBtUw7tMJYI567M0Y1yr2miXOYI?=
 =?us-ascii?Q?ZIhm+0qJpyb6dQiRAMwpGeH70jQIclTMhMZHBYlHytJRfCNrOwVhIcLVq9aU?=
 =?us-ascii?Q?Az71eQGH7/g6L569/5Ido5PIi8VxvK3IIlVeizG1G0P6QYCiFqi+L57H+xuB?=
 =?us-ascii?Q?yzSg7ggImAY2J7Czv07BXMlAfUhf9diZ5pTjYiD7iTT/1vaI4E9JcxbwZyP0?=
 =?us-ascii?Q?vbg5eTmAdlU3oR06VqJXIgAmsav4FAyrU+qtI0p4?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c6e019b-523c-42d9-8c8c-08dce069eeec
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2024 09:34:36.5898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bG8C25mJTcWFakqvfdnyjdD3rUI/Fs1HpO5qns9knbnQ38C7H/ehptM1VlBUz6TQtcDj1tSI8Kenq55sexqHrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5891

This patch corrects several typos in comments within the mmc/host
directory. No functional changes are introduced, only comment
improvements for better readability.

Detected using codespell.

Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
---
 drivers/mmc/host/atmel-mci.c       | 2 +-
 drivers/mmc/host/au1xmmc.c         | 2 +-
 drivers/mmc/host/cavium-octeon.c   | 2 +-
 drivers/mmc/host/dw_mmc.c          | 2 +-
 drivers/mmc/host/meson-gx-mmc.c    | 2 +-
 drivers/mmc/host/mmci.h            | 2 +-
 drivers/mmc/host/sdhci-esdhc-imx.c | 4 ++--
 drivers/mmc/host/sdhci-msm.c       | 2 +-
 8 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
index 6490df54a6f5..f444ca5dd154 100644
--- a/drivers/mmc/host/atmel-mci.c
+++ b/drivers/mmc/host/atmel-mci.c
@@ -860,7 +860,7 @@ static void atmci_send_stop_cmd(struct atmel_mci *host, struct mmc_data *data)
 }
 
 /*
- * Configure given PDC buffer taking care of alignement issues.
+ * Configure given PDC buffer taking care of alignment issues.
  * Update host->data_size and host->sg.
  */
 static void atmci_pdc_set_single_buf(struct atmel_mci *host,
diff --git a/drivers/mmc/host/au1xmmc.c b/drivers/mmc/host/au1xmmc.c
index 6e80bcb668ec..7393d2ea5e57 100644
--- a/drivers/mmc/host/au1xmmc.c
+++ b/drivers/mmc/host/au1xmmc.c
@@ -543,7 +543,7 @@ static void au1xmmc_cmd_complete(struct au1xmmc_host *host, u32 status)
 					cmd->resp[i] |= (r[i + 1] & 0xFF000000) >> 24;
 			}
 		} else {
-			/* Techincally, we should be getting all 48 bits of
+			/* Technically, we should be getting all 48 bits of
 			 * the response (SD_RESP1 + SD_RESP2), but because
 			 * our response omits the CRC, our data ends up
 			 * being shifted 8 bits to the right.  In this case,
diff --git a/drivers/mmc/host/cavium-octeon.c b/drivers/mmc/host/cavium-octeon.c
index 060ec4f4800f..d150d83b41ed 100644
--- a/drivers/mmc/host/cavium-octeon.c
+++ b/drivers/mmc/host/cavium-octeon.c
@@ -217,7 +217,7 @@ static int octeon_mmc_probe(struct platform_device *pdev)
 		return PTR_ERR(base);
 	host->dma_base = base;
 	/*
-	 * To keep the register addresses shared we intentionaly use
+	 * To keep the register addresses shared we intentionally use
 	 * a negative offset here, first register used on Octeon therefore
 	 * starts at 0x20 (MIO_EMM_DMA_CFG).
 	 */
diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
index 41e451235f63..aab1a8df6414 100644
--- a/drivers/mmc/host/dw_mmc.c
+++ b/drivers/mmc/host/dw_mmc.c
@@ -1182,7 +1182,7 @@ static void dw_mci_submit_data(struct dw_mci *host, struct mmc_data *data)
 		/*
 		 * Use the initial fifoth_val for PIO mode. If wm_algined
 		 * is set, we set watermark same as data size.
-		 * If next issued data may be transfered by DMA mode,
+		 * If next issued data may be transferred by DMA mode,
 		 * prev_blksz should be invalidated.
 		 */
 		if (host->wm_aligned)
diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index c7c067b9415a..e87d1c4b9dc1 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -879,7 +879,7 @@ static void meson_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
 	/*
 	 * The memory at the end of the controller used as bounce buffer for
 	 * the dram_access_quirk only accepts 32bit read/write access,
-	 * check the aligment and length of the data before starting the request.
+	 * check the alignment and length of the data before starting the request.
 	 */
 	if (host->dram_access_quirk && mrq->data) {
 		mrq->cmd->error = meson_mmc_validate_dram_access(mmc, mrq->data);
diff --git a/drivers/mmc/host/mmci.h b/drivers/mmc/host/mmci.h
index a5eb4ced4d5d..4d3647f9ec06 100644
--- a/drivers/mmc/host/mmci.h
+++ b/drivers/mmc/host/mmci.h
@@ -77,7 +77,7 @@
 #define MCI_CPSM_INTERRUPT	BIT(8)
 #define MCI_CPSM_PENDING	BIT(9)
 #define MCI_CPSM_ENABLE		BIT(10)
-/* Command register flag extenstions in the ST Micro versions */
+/* Command register flag extensions in the ST Micro versions */
 #define MCI_CPSM_ST_SDIO_SUSP		BIT(11)
 #define MCI_CPSM_ST_ENCMD_COMPL		BIT(12)
 #define MCI_CPSM_ST_NIEN		BIT(13)
diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index 8f0bc6dca2b0..2bfb86364441 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -1524,7 +1524,7 @@ static void sdhci_esdhc_imx_hwinit(struct sdhci_host *host)
 			writel(tmp, host->ioaddr + ESDHC_TUNING_CTRL);
 		} else if (imx_data->socdata->flags & ESDHC_FLAG_MAN_TUNING) {
 			/*
-			 * ESDHC_STD_TUNING_EN may be configed in bootloader
+			 * ESDHC_STD_TUNING_EN may be configured in bootloader
 			 * or ROM code, so clear this bit here to make sure
 			 * the manual tuning can work.
 			 */
@@ -1626,7 +1626,7 @@ sdhci_esdhc_imx_probe_dt(struct platform_device *pdev,
 
 	/*
 	 * If we have this property, then activate WP check.
-	 * Retrieveing and requesting the actual WP GPIO will happen
+	 * Retrieving and requesting the actual WP GPIO will happen
 	 * in the call to mmc_of_parse().
 	 */
 	if (of_property_read_bool(np, "wp-gpios"))
diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index e113b99a3eab..d6b3b343b031 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -2601,7 +2601,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	sdhci_msm_handle_pwr_irq(host, 0);
 
 	/*
-	 * Ensure that above writes are propogated before interrupt enablement
+	 * Ensure that above writes are propagated before interrupt enablement
 	 * in GIC.
 	 */
 	mb();
-- 
2.34.1


