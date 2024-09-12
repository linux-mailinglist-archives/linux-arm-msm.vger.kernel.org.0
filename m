Return-Path: <linux-arm-msm+bounces-31565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8D397621E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 09:05:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FCDD1C2326D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 07:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BBE019005A;
	Thu, 12 Sep 2024 07:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="DhA2LLAk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2071.outbound.protection.outlook.com [40.107.215.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C8818F2E1;
	Thu, 12 Sep 2024 07:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726124681; cv=fail; b=VD9H9PyUOST58ms3ZTa9Etlvfsx3dw32bqH6dx4Ocmleo67crKmuQ+ZkZSGqqf3ianiPQI2ZN/0KiOfx0KRHR+9Hrq1zPeAaSqwO3lA8K3PLcSfkERduaBlR+/3ohxyJADedY5m0YFSpDeaEihg6/PTAEpsb3d3aT6xVNCSSdIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726124681; c=relaxed/simple;
	bh=i+G+UDJAabar0RjYj4cglSmuWQ7/ZbPuucEA9fBnEiY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=h8toe0PXgJGNJi08RhwrSL67SWHhT//AAA3xitDMxU2BGLZHoTFpJgW5rVufHuveNukdpwA19dyHwEZ9r7Ibz5VyOXMK89mHgJHVKt7AN8FflJ/rf0pEENA+6gEf9xJhsu40tGqXnZxv2fq6zo8G8j5Aaqwn4chf1nxgrn1rxYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=DhA2LLAk; arc=fail smtp.client-ip=40.107.215.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w2QJGPuHlRHVrJayGpSzYOP8HFEgVfJV62KJOzPgIGo1xV2O4RXzXHoJaQwXdK26Pt0IJJWp72Gixh4L4+nqT2UnO658lfpgzXC5s3bGQWv7AN3p7pOTSs7dZefiQfc/o3CqokN+vDxJRTaD5gRv90A+/ONbvKtij7Hvzx9Kpqt2zk9UtvudASsvm5Ph13mwlfbMTowCFMlQWgLKBrucLfXMMRZvRkF0p3x21yteoT3FPtvdzOqGZkRdCKYlEnbqIJIiId+dKsb1LB8MLbNrATCSR2gR8bF6SeGOPVl3t34X0lyYLvqiGXrxjaBd+av1RfWm+z26M4Ko5tJMgg7TIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5NQlQdgc4Zd6VFl4w/E6BAaBmcKLOHVPnZc5nsNJC0=;
 b=LlFd53J9OaBB3oZPV++qe7Bdyychk/1s/LvcqaAoLMmhtGqcUc5i46cfD/1/PxxU1vOueL0Mt3jAHVNuf0fPmN8hsjbEsHFZQVxJVfIt0SeT4Zh8pkq/VkeWxXQyGrCD/JzuJRbUMg36StME2P0tq7X9WWMtK+W8DiuPczBViL6GiNza7OKN3Ugg9PPHeSD6UQd8tJBOAoT9LKYZmPBYcFiFipUmRnhTwXG+qEbRIdzD3GYG4MmF16twjXIns0zvNtM5IjdOUdHaapFsFMx6SoP1P5c8vmqfTHZwDZ6+XGy5BiZIAb9wYuR4e3rTyydBZi3ah6roXa6LPriNiquMrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5NQlQdgc4Zd6VFl4w/E6BAaBmcKLOHVPnZc5nsNJC0=;
 b=DhA2LLAkJRlIvAPRHQkM8FJKNaUwt+rNKJG6a6yJU1jRzCZ7QfDwXcQZeNK7sVC3B/InrPDAeVGxVNjK4Llvfk+P8mj7s3oranbPok2YkgWn6liZmUy5bykt4qRmuCyma2xNyGqE8zrzbvDGNKQFlSdp1ZhMYVaOKrVQREnKbD8E2gR9ESUy9D+RCGW204bi+QksSR024p/pYDl2vllNmqM5mqYKplmWghVPgex8fpMDDFDHlU1GP0QjXpyMTtXlCoC2Cde1JQpD8Ov3gmrCjtv8izyFzEISwjDq3vdGSzwk8+62+K98Z6omt8aroV+OwNyFrNpdTqnnvmfFC4xmEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com (2603:1096:101:e3::16)
 by PUZPR06MB5953.apcprd06.prod.outlook.com (2603:1096:301:110::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.18; Thu, 12 Sep
 2024 07:04:33 +0000
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce]) by SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce%3]) with mapi id 15.20.7962.016; Thu, 12 Sep 2024
 07:04:33 +0000
From: Shen Lichuan <shenlichuan@vivo.com>
To: robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	dmitry.baryshkov@linaro.org,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: sean@poorly.run,
	konradybcio@kernel.org,
	marijn.suijten@somainline.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com,
	Shen Lichuan <shenlichuan@vivo.com>
Subject: [PATCH v2] drm/msm: Fix some typos in comment
Date: Thu, 12 Sep 2024 15:04:20 +0800
Message-Id: <20240912070420.2891-1-shenlichuan@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0179.apcprd04.prod.outlook.com
 (2603:1096:4:14::17) To SEZPR06MB5899.apcprd06.prod.outlook.com
 (2603:1096:101:e3::16)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5899:EE_|PUZPR06MB5953:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c0d0e58-f619-454b-9793-08dcd2f92772
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ao/L91QmgsbuoWVduQAaNjGx8kViAbc2EXa6xLShNNlN0Po0NS8m0C4RMptM?=
 =?us-ascii?Q?kV9keRCi23dNh1aS9O29iUExJkw0VhUq35Yl9YPcct10TXxTmuGBH9ztVFvN?=
 =?us-ascii?Q?p4kadfS5TAU1Es3DE/c0KSbYEUag7Z5SdHISugCnfHPdCX6uUHnbz5LHEMZg?=
 =?us-ascii?Q?JWcnY47YRyN6EaYgkDjdETE/x+bGH/h8Lg1AhOU2Wd+nkCWiED6BUWY3ZiDF?=
 =?us-ascii?Q?/oomeciFZdEqXsFBVr6Fee2AoNsnhWkZC0d6c5k+ZNKQN+2qQYqzrhTTcuaM?=
 =?us-ascii?Q?EXCalo/oAThb/JLqLzkSCP4E1vhR+Fuc1F93HN+9H04cYGARGfXYzSCw5U3q?=
 =?us-ascii?Q?3JiNqlCMZa+neMDbNNt6nTZJp9JQT0/oB8hCUOWU0y4j1aVr5FfnWv/Pwcfy?=
 =?us-ascii?Q?j8KNQ7S5Rq98YYDHS+WPNL6Hgiod2kg9kLy6Y13KrIPk1BtvoB9fZAQMsZNQ?=
 =?us-ascii?Q?DdohNFtFeKkjjKDQkt/md+Kr9+c2iQgx9XpEwmLSE7WatWOBXNneJvRhhI4x?=
 =?us-ascii?Q?c2eYo1QJRIyrSRMTcBb6gAXtqKC5Umg++zhlra3sgoKfWo61MOprACg+AOXo?=
 =?us-ascii?Q?6C8n2/5/TN8urSwLqnapHS+bHwB/iRe2+RvNmi6PHBrszW7ZnWfZvIkNXBJB?=
 =?us-ascii?Q?PCXeN3k6sunt6vEn4zC9RbA26V+bpCe7oCOZEowBCX/RHeRge7+F3U9IAqVF?=
 =?us-ascii?Q?QEOGIDlES61Dbl/pDP/trmb5MNk9A7QPRbQmjjzse4vX0LTpQnNWIsjDr7fu?=
 =?us-ascii?Q?rQ4t70gfx/zS+6qzowz4P3WN8TQSl32XH6xozElRSc32+PLyFYCO4Fai1ri1?=
 =?us-ascii?Q?zBtrQkh5/G0odFznMqfwGKE0s/zWisWbwvGpg+QqNKt8SrjHURFrR3wh7T9O?=
 =?us-ascii?Q?50rmut//d/R9jcabBMAVwRG0dl49AGQJq0+8DE77eZ0EcJRb5SWmHc1lkfaH?=
 =?us-ascii?Q?fBZFjOEC+cbPmcu2oGcaiABqk24vEKMkwJqmPjEH1r1L12aqH04pxqDWxjQF?=
 =?us-ascii?Q?dEksX5AC0AQYquT9z2oiFM3W6XIGkWEeH/xEvAsbBMBTli2RW+fCFuDP25i0?=
 =?us-ascii?Q?IuUoW9mSRy1CevdDLmbGRhS8K8xTsNesx+1oveMVHzJtt6XSzKGLWCsu1UYb?=
 =?us-ascii?Q?v15Y6ogYHN8OHjj7q8m2bVKJbpJntcyxrJkkc3FWjz6ve4/8++UCx4Lvf2xM?=
 =?us-ascii?Q?kqDlAxxSM8YetrG5fS03S+nRhvPkA0d/aSl5U5rPg/YLhjQvAGlKseAkGKxu?=
 =?us-ascii?Q?Fp1ZSJvQx51AEM/o6esW+pL4ccggfUb+y0zxhM9CGTvHqmsuWSBHaLaU1JE+?=
 =?us-ascii?Q?3fNJ2czuxghzQGq/e/3H+SSWDivFiwe5MZtoWD0P/tRyMgYP6TBsfaVcZHX4?=
 =?us-ascii?Q?OfEh5PzkgSLRvXUJmASnKOOnOrcFJ8c/HYiw0Po35wTTQMPBDQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5899.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EV4NqTExTrXc7l7LS69/q+28IncjQ4HkNgwuzZlBbkVPUeKdufjvqhfsRZi6?=
 =?us-ascii?Q?Nn6ZCbHHiv0FY7anorQhFPWPk71M6yn3iLecEyjv6JUWezpvImUHBcoBYpyv?=
 =?us-ascii?Q?ayhTiOIYhZUXHgvcs+hCaeQ1OzN0eDoiIsl+kApvCuiYzfRVfESBqDEQHMOi?=
 =?us-ascii?Q?MtonoRiRvQf4pE5L8w0L92R8GXNwkrD57UMsdnpMnbrrgbevC/IrR6XDZ7Gz?=
 =?us-ascii?Q?A3kvvN/Mxv6iD0EvPkTmS9adVt4Ack1ndE7+VCICH/Ofzm1UoaX/dBc0VMd6?=
 =?us-ascii?Q?G7ujw+hmr48Tsa+z8KmRR1Q0R4bDAoP5uIZvFTwxThJ7RnHjYbDE9QMTATZw?=
 =?us-ascii?Q?LbEGuYVLMyM5YEyyLCEC5WUOAIK6oyoaTYFoReJwApCwOPVZR8DuQtIYzdSu?=
 =?us-ascii?Q?zgXXrSxMxxYi2mnzydBy+chSj0fsOXJgy7+cpOc66E6oaS21AsXv5g1OxVDF?=
 =?us-ascii?Q?xiBG96ntrBq0hq6hBKIqgnSNVhweIz6q+MMLWI52AsxReLMZU3PPCeiftbtk?=
 =?us-ascii?Q?4DhsvdKDFNxkuKJLWnKJuQGolEjfowW1SQYRleTfaPVUBrnupnuvTTfAQX88?=
 =?us-ascii?Q?bx2bQd/m5ypcoKjQyJCLTUdnsAz1BKPWk3y9K4wfrCIL50ydqDGHQAChIZEH?=
 =?us-ascii?Q?lPoA0tXe4Y9d/JoBuFaMsa1gEnuDcjkSUnZAfYSB41DpKs0fAtAR6oCDqRYs?=
 =?us-ascii?Q?my3+4pTpM1QwS9xO11QOoF1NeLbv98iyksquxdu0HEBvS/MMI8M5G89zC7eH?=
 =?us-ascii?Q?3MQAEqvsFTzydff2oIYTBZK8ReDczgW2QYWwkqstU2/PeoZ5O3lIxfzSWgN/?=
 =?us-ascii?Q?BcKz2Z6IyNTn6TI7GHEeEETutKYig4JMjyLqDOPThj8Dg417oIu7s9W2lec6?=
 =?us-ascii?Q?segJSEw6rdwGxatm0kgcdPswkZOKfWFRV3HiC64Alr0Iy9XiHy6ZoE71lLTA?=
 =?us-ascii?Q?uUHiLAW9alIr22MFS9mxZWaKQc/HddhAm5IgpJCPjNYKoKLdPHHJs3gBBr3l?=
 =?us-ascii?Q?PKdJxfC2lH5oELGRU6tK0ojKDLmoQ07mwDgoAEKRJA2IqvjEIH6+VoLpDhtT?=
 =?us-ascii?Q?7oenMHk/gi9/plgsHdSWJnZcW3wHQXNi7co66MmfcMl36sIFfLjeDGKVLBDF?=
 =?us-ascii?Q?LV8D3UoPLwsIAo3wq+gaX3bBMcl3peDXda129PSQByrYPb3ckwk1quxxoSeu?=
 =?us-ascii?Q?7MnJOEbl/xdkcIz4nC6/pyA8RGKE+Qv/xznFwGcqov+kG7LumZt1BYOxaCRM?=
 =?us-ascii?Q?pc3Brqe5Gie+RcFP08nC1mlKWwjmgf3il3jzMmmOf6mFO9sPdw+bCPLapjER?=
 =?us-ascii?Q?JXBBdJnIhnHirg+wq2uCuMK2l0JVuSh0An8EUa5P4BZzh4uzXKkY9MRprjwH?=
 =?us-ascii?Q?W+hL0YsznkjRDFvBYBXUCPcgURov4sMo+nvpsG1Rd3EsFvBp8LlN+cOJCgo1?=
 =?us-ascii?Q?Q/6z+Zs4s2R6j98fmSbOCyl+EbKRo6/NlDgIHFE+mHwF6vs6lJF8rQ7oSzks?=
 =?us-ascii?Q?pYogjo+WmEsiO8vHVM2fZlZpn1AknKKyopIWtoFusBYA/Es+SM2Lki4duelK?=
 =?us-ascii?Q?QMS1L8yLuMvTxg3HuoN5ztvC0ks5SGDnU+cLWnlu?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c0d0e58-f619-454b-9793-08dcd2f92772
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5899.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 07:04:33.2683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DrzbpyHK8/knY0k29Pgu/GM9a+b73vwIp17wk4fyjT7dD7TDuEZyGW1A40+HrNTcecBcWqrT0a/6snfQ1XnB6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5953

Fixed some spelling errors, the details are as follows:

-in the code comments:
	collpase->collapse
	firwmare->firmware
	everwhere->everywhere

Fixes: 2401a0084614 ("drm/msm: gpu: Add support for the GPMU")
Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
Fixes: f97decac5f4c ("drm/msm: Support multiple ringbuffers")
Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
---
v1 -> v2: 
* Changed subject prefix to "drm/msm: ".
* Added Fixes tag.
v1: https://lore.kernel.org/all/pd76zf55h3kjpmgiydiu4br35bwlzsey2losublklv4o4ta7ko@z3gzy2eec5qh/

 drivers/gpu/drm/msm/adreno/a5xx_power.c | 2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_power.c b/drivers/gpu/drm/msm/adreno/a5xx_power.c
index 7705f8010484..6b91e0bd1514 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_power.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_power.c
@@ -307,7 +307,7 @@ int a5xx_power_init(struct msm_gpu *gpu)
 	else if (adreno_is_a540(adreno_gpu))
 		a540_lm_setup(gpu);
 
-	/* Set up SP/TP power collpase */
+	/* Set up SP/TP power collapse */
 	a5xx_pc_init(gpu);
 
 	/* Start the GPMU */
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 465a4cd14a43..076be0473eb5 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -533,7 +533,7 @@ int adreno_load_fw(struct adreno_gpu *adreno_gpu)
 		if (!adreno_gpu->info->fw[i])
 			continue;
 
-		/* Skip loading GMU firwmare with GMU Wrapper */
+		/* Skip loading GMU firmware with GMU Wrapper */
 		if (adreno_has_gmu_wrapper(adreno_gpu) && i == ADRENO_FW_GMU)
 			continue;
 
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 9d6655f96f0c..c803556a8f64 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -64,7 +64,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 	char name[32];
 	int ret;
 
-	/* We assume everwhere that MSM_GPU_RINGBUFFER_SZ is a power of 2 */
+	/* We assume everywhere that MSM_GPU_RINGBUFFER_SZ is a power of 2 */
 	BUILD_BUG_ON(!is_power_of_2(MSM_GPU_RINGBUFFER_SZ));
 
 	ring = kzalloc(sizeof(*ring), GFP_KERNEL);
-- 
2.17.1


