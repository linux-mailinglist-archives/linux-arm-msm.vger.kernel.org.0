Return-Path: <linux-arm-msm+bounces-31386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 804339729C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 08:47:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1A131C21A89
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 06:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3093037143;
	Tue, 10 Sep 2024 06:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="P+PvEUfW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11011055.outbound.protection.outlook.com [52.101.129.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195DF4F218;
	Tue, 10 Sep 2024 06:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725950825; cv=fail; b=kNv0YtoeQsR+wsiRYXnf0V0Sy5YESO0dDMkux1hrQ7fvUucPHhX5+PxZ3wuY9EWqUTfgabYyg2hP14cIPFCv8Rgf0uOGhQNA5dw3NShFKMt6sdFfvA1mmZqKaAF9Ijd0HkdF0gpDzYNtaecNQLpeiVgVnyph2pjgpeE6HZIziwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725950825; c=relaxed/simple;
	bh=d/uj8jZAfRQsZBguCvA4x/Z8IKlgb0dguSaKbQFy+RA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Hr0+KrynMplqoJaEnRUZ68IQ8dAxqAbJM2p96TFln1ewfr40XTI8W3g4xZkqN7tmNfJ1SzmpuRf+F7bZTyREkJs/PsDe+xLQseSbvg1P4G+3Fqiiv/fdkMfmEoCdgKvIeX9jfM0NxrabcNOZxw4aShJuTpOaITKBs+Y7dYuPxQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=P+PvEUfW; arc=fail smtp.client-ip=52.101.129.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oEgwHI/0NUk75faVRRulFW7Z64QOMTH+9nnmrJfvHVQ1tZnccmv/KTCRV6O69/kJ8vLhwCGKId9bHczj9Sq48kCm+gl8qUsun70itwslMgr5A0V3DbzIG/lP6d5xQ1r9HKdIrE6lPbJoIp9Ltq+BTgbiQN7QkmJwv+Ssejjd9lqCL1tIWpl+U5HfyiE7Dlm+imxZx5VCq22MzSnj1+2zTI7daSAtGz+iCF6v5hYkWn3alO6Z58CFYbRJ1lReF6Vpbc7cR61c+AVTMGBrtQaBlp+sOsBEDgnvSTOJpzuhJ+m4kVPNvtU8vliZJo5SkjMerH026JI2fYs+wyuE5VZuJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Jfm8YBmj+kaC/UC2tdBSLoecFUucMQhY5QbwejugJY=;
 b=A7FNtOfzy46P909li9SKirkNjtkpTvPG6aQycJcjDUbeeD0UfHDeUMkBeNOyR8OeazaB1yfatAfoKwmWGhgsdtvkxblZ7rx49LDCZ41pQ9U5Q1Q2UEf3XfPb1Z/cEUDfRqy66WgMENwrxDsawVCOi0gtRJgTCvx9vxYEjLIRjQWWnCJiF9pFhxZhbBZviW3ERUyYXpgr9lOQzhvs2m10JDf/pNQsjRfWwiP3ha1+8XY8KlLePL7UaYKaxLnTluPsyaq4OGykTz1TQ+SeEO6kR00ttJjvDk3klVRM4IHlBmJ33+MObNx6dR+Y7KlRW8vAyoUZedVdQsA0fKtesTwodg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Jfm8YBmj+kaC/UC2tdBSLoecFUucMQhY5QbwejugJY=;
 b=P+PvEUfWBDlWkwC0peUeQlaLtSHtuyYpd+hCaWvg24fpMFLxAhsEOTHr/2p0uegGpHjHpLLmsSwdVxvqIg3Mqivgckvr3G3KpLgqnWg1GupC2m/BTDrb9Ssv9bENrcModOpCHI7QxazP91lGgT9N0Vph6lMxHsAntpLQTtNEkeU8QDHrtQk41/qOGF+TngNK6M0wHbdoUEOW01IqeBIubXQnirjMhGCp6m0/+5jvK3CB32afIf3sS01SrmSd57CXZH/p0oyUljE4pHDB9BHbb923eITkVGIjoh49jwe2vnZj5LFccpFQi9+tyC/3Ux4OD1JqIlEXgXh5yirOR8PIyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by OSQPR06MB7156.apcprd06.prod.outlook.com (2603:1096:604:293::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Tue, 10 Sep
 2024 06:46:56 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%6]) with mapi id 15.20.7939.022; Tue, 10 Sep 2024
 06:46:56 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1] regulator: Fix typos in the comment
Date: Tue, 10 Sep 2024 14:46:30 +0800
Message-Id: <20240910064631.3223441-1-yujiaoliang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0160.apcprd04.prod.outlook.com (2603:1096:4::22)
 To TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4461:EE_|OSQPR06MB7156:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a77ebc4-705e-4df9-e592-08dcd1645ca0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Wa5tPS8vfjc2yJlnGt9FBtBkLnGmiGWvnJ2QC0pS6PwO/zr6SDfM2T3zl6aY?=
 =?us-ascii?Q?z1ruo79ML+R+bcKl6i5YYwD6Mnxq5c7ELBS89cQ92sRHfQSv4kk0fintRhu+?=
 =?us-ascii?Q?/N7+ED5+lI/Qcs948Mk4vs/ENQ3C5talZrJ1inayM5OyXmyJbo9Omt8ufcpq?=
 =?us-ascii?Q?rs/QcuwHc95bL6IiAUKxk6A8sO7DNf3Obiobtj2ZYJWOQ+cerXE+tefcxixe?=
 =?us-ascii?Q?kZgWXhnVZMOc/Kxa8z0B6KuRi1ulb8Me22Mno1JE8p5ju8/VtWbsp3MEI6gD?=
 =?us-ascii?Q?xi9zfp5w4lk6oWsIfHANopnYJKuuMnP7d7T4++5gKA6gJbdZcAzQOMeZrT6z?=
 =?us-ascii?Q?A3HUxOidYiJ8+M+17BkFYxOqijrWqE4g018gpiC/NPTs0vzcuXwMFSd14qr7?=
 =?us-ascii?Q?b0xv5fZ2NmEBOIQgYzbzUVcnfRPNSnz6woDzE7vDpo7cTBOdrdmS/MrlHVWT?=
 =?us-ascii?Q?9H6cMHoxQzjxhT6V5xTxCWAr5TiJSl9ChBgle+Pooqapj1TQtVFIKmBh+omp?=
 =?us-ascii?Q?e/2kpP4CGLei2cB2mWTDYAx1YI4r8+sFOSU3xKag/uXMcIhiMCzToOyB7t1s?=
 =?us-ascii?Q?IVdxcmjolG4HTWPK+9YcykKQ2IS3jD770XrUPf4kL3PBpJnwignwg3yZKSLw?=
 =?us-ascii?Q?iREu2CPB3CVkqwFncHb86wq0LpCUCvAX7SuiPj9xrBWzeMNoYP2OqloNwWl2?=
 =?us-ascii?Q?nG2O1v5HZsukERrjv3NHxclXl3v6DcKHCJ1LVKSgxGWnr/tb3M+w4ixu2H/O?=
 =?us-ascii?Q?BEeFlsC3LRcCzOddUESuS7MWYnrNluCDGpEkezf7sdDBIpsaKv3+Lhm3rnrl?=
 =?us-ascii?Q?jkHOVacX7L8P6ktydmGPvyNzjBhmDFMxwikfG0LQmLX6ATV3P0uMaWbQ8JB6?=
 =?us-ascii?Q?TWJpasXCreBMszBsTbFPTGrknc+brAfqgTJga/2JQShv3OyWJVefCkPCfpPZ?=
 =?us-ascii?Q?eVPVaOjIfstnBvb9wpSJXthFzBQa7Xm0PZ2iyW29BwoyAS1u0YDDIVvB/xsi?=
 =?us-ascii?Q?SI3dlmlT/bhj0QTgBFhqWQ/Mc3HxWNrx5pLbWGB2kwnwf5AOb/+ooYHIfjBB?=
 =?us-ascii?Q?yp15Fh4NqFG+st/oQcsspkuOMXqHYEnyLDhfRNlLA+bTlpKF59CcAcyHznW9?=
 =?us-ascii?Q?Pva3ErKOKJjJKmvE6u3bKc8s6HU6qC0++Qe1T4hyTFYSt/kbW0ZpygiN7TxZ?=
 =?us-ascii?Q?6CNXqhPdHO90NknXtAIDTcniCXzM6Qe2+KrIwA6ALJ6yb1z+XxGdZKl2ZdXW?=
 =?us-ascii?Q?bUrmcDlVEmOCbr/wb54gdVCa2HwufCQ8mYD9bWbU6r2DsIj0HYPf109fxhXu?=
 =?us-ascii?Q?qd7eq3SPZN9SCz6ZsKh6kaKSefe6/j/bs0YtoJWCQ/b2HOF/KQH64kSIxAcd?=
 =?us-ascii?Q?SQchO4gbIIi8Z+sLI6MwygqIp9WDsGJbG0KncbGI8DIJi6wkRw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4461.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Zy9QETK5D3Vg/qnmt7TFVhxhifbdOXdjeuAIBttIsjoMxaf5Wy5XE8ZaqlHm?=
 =?us-ascii?Q?zerTT/2nusAJD+KsiHQY74dnoBot9kqtmrmM5pufB10IyaD6LXVoSGG4qU5i?=
 =?us-ascii?Q?wamTvxRbtgRAyr7sK3MbamF63rJ2WAT63BJjnS0f0vC5ldtww932UfZjhbNJ?=
 =?us-ascii?Q?Hath9+NstBjtTG/bt4JyYWRMi/47Toz44qCElXPoJFtO+6PdH2rXNbwFY8/9?=
 =?us-ascii?Q?bfVBMgpeeBFj+VynDVFqGjKmaDCycBePL9wa5/jQlklinXPLF6EV/0cpb3Xy?=
 =?us-ascii?Q?PmQjCYT6VDOLBoLpHrm18Op+JB2+sCdtVH9YgRIEM4vXG/9KpLtUXDMfcZbY?=
 =?us-ascii?Q?+4abiB644m0GlL/NZgbjPNQj88dY88eqB3u1QxHnDQM+79NS+5JQGkn7OUsQ?=
 =?us-ascii?Q?4qQ81MIfa0h8N87jQuHFVL012S+Y6095ardTZaDLGhQ0bXW+Qhvi+HNSd4Qw?=
 =?us-ascii?Q?q5DPcE1doG5icGBTSW4QORN61fPnJfUqcsW1+P3/b2J3yayCUfAdFG7E+FPZ?=
 =?us-ascii?Q?TVco8SRrdvTKqfMpra96KDsoNT1PtjkjgYmUBxgzuvi8f9i2szQPjsmgpeNW?=
 =?us-ascii?Q?uBbUBznunNBF5jMJED44iGX5JSQpBFm8kLur9e8LiI+QSUqRd8YDP5xRcPxN?=
 =?us-ascii?Q?MtzM4vAsXaFyPut9lnfTeOO/uznDqUXrBxK9fU4kiXsO94FrGU035p27nW96?=
 =?us-ascii?Q?zMv22HnHH605ei8eUAuLbLhO4ovmXiOR24hFMDzX1Ioa3J0OmoAYRvVjdIku?=
 =?us-ascii?Q?3VIhIjDjqLCAkpZmTwosiex0FVkkIpZMCwI+D1sdxBlEXeSr9DgcqgbRg5Ji?=
 =?us-ascii?Q?qKyh5z87KoKEV2G6BJwaF5lVRI4aBpWoMJ4KxxljvivvabsK7xeuYESHMB/8?=
 =?us-ascii?Q?pbwgVY3SPS4RMviwFi9X57g02Mz/dihuR2vn697E1BiVC/H/i0HshI4F3d9X?=
 =?us-ascii?Q?ilNOX5BDCFD09XxvaL2FQ06Vk3vbsvkDApH+opNFuJZDhq2Hwqwpkpn/TfVS?=
 =?us-ascii?Q?l+thnBzXEgbpTcY+cB0gzos+QB1RRNYwiKR3gcz15Na6iAakVDVZkC3Enoqu?=
 =?us-ascii?Q?G/bOS6RGVRJ8MCE11ewurhib2P22QZPbXcZ6SHTNbl64+4zWWZeICCVmBi9+?=
 =?us-ascii?Q?P2Uy6uQCEFu+Cm5lLGKbGsTF6V5UgJGFrkKJLR2GkjIScsYSDgP12i85ow/o?=
 =?us-ascii?Q?O4fduTY9sYOgoqeHTS/OxCkqdwvoQ7zwlxFGmHqBt5Wf2Ph4WmYQX0xa7npV?=
 =?us-ascii?Q?FonVi8wYQfwepT3Bq5s2pFChANun+0EP1SWMpQ+/Y3nyxrPL2tjnHN2NXaTL?=
 =?us-ascii?Q?wv4z9rYTVz1wgKa/U9aPWngI0C+9jzu/pGEN5282fCp9oMJiODkRwujxIg8Y?=
 =?us-ascii?Q?2mCnrDEowMyrXEXDf5QT1W95mvMI77BdtcfZZBWiNdLbPODV+K3mk/1ny8U+?=
 =?us-ascii?Q?1pg2YVvRQTbMnCWgXgZZUl9d6EwI1XdsyeHsQdCYsrUj/m1B92k4dZQhPO2E?=
 =?us-ascii?Q?k8M1M8mmbvpVwfQeZDsnA1CW8W/yoT/y4uuRvCXQDaDdu9EXHTZLzGFl6K+c?=
 =?us-ascii?Q?dd0ph8cADFZCXIHM3Xj42sPTukxH6G46i9oWICip?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a77ebc4-705e-4df9-e592-08dcd1645ca0
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 06:46:56.4230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LW/V2qBO6YKKodyjr1YusKTl9Zfo68PrOE3QbA+r7b4tSnlw04SSUi4ynwOe83GtrzzEirT6TPypVTrQh6ZX/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR06MB7156

Fixed some confusing typographical errors:
comptabile->compatible,
asignment->assignment,
Verison->Version,
meansurement->measurement,
offets->offsets.

Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
---
 drivers/regulator/da903x-regulator.c    | 2 +-
 drivers/regulator/da9063-regulator.c    | 2 +-
 drivers/regulator/fan53555.c            | 2 +-
 drivers/regulator/max5970-regulator.c   | 2 +-
 drivers/regulator/qcom_spmi-regulator.c | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/da903x-regulator.c b/drivers/regulator/da903x-regulator.c
index f79337079a45..2f85897183b3 100644
--- a/drivers/regulator/da903x-regulator.c
+++ b/drivers/regulator/da903x-regulator.c
@@ -61,7 +61,7 @@
 #define DA9034_MDTV2		(0x33)
 #define DA9034_MVRC		(0x34)
 
-/* DA9035 Registers. DA9034 Registers are comptabile to DA9035. */
+/* DA9035 Registers. DA9034 Registers are compatible to DA9035. */
 #define DA9035_OVER3		(0x12)
 #define DA9035_VCC2		(0x1f)
 #define DA9035_3DTV1		(0x2c)
diff --git a/drivers/regulator/da9063-regulator.c b/drivers/regulator/da9063-regulator.c
index 82bf321ae06f..e7dcfe40a278 100644
--- a/drivers/regulator/da9063-regulator.c
+++ b/drivers/regulator/da9063-regulator.c
@@ -133,7 +133,7 @@ struct da9063_regulator_info {
 	.suspend_vsel_reg = DA9063_REG_V##regl_name##_B, \
 	.mode = BFIELD(DA9063_REG_##regl_name##_CFG, DA9063_BUCK_MODE_MASK)
 
-/* Defines asignment of regulators info table to chip model */
+/* Defines assignment of regulators info table to chip model */
 struct da9063_dev_model {
 	const struct da9063_regulator_info	*regulator_info;
 	unsigned int				n_regulators;
diff --git a/drivers/regulator/fan53555.c b/drivers/regulator/fan53555.c
index 17c9bf204385..bd9447dac596 100644
--- a/drivers/regulator/fan53555.c
+++ b/drivers/regulator/fan53555.c
@@ -46,7 +46,7 @@
 /* VSEL bit definitions */
 #define VSEL_BUCK_EN		BIT(7)
 #define VSEL_MODE		BIT(6)
-/* Chip ID and Verison */
+/* Chip ID and Version */
 #define DIE_ID			0x0F	/* ID1 */
 #define DIE_REV			0x0F	/* ID2 */
 /* Control bit definitions */
diff --git a/drivers/regulator/max5970-regulator.c b/drivers/regulator/max5970-regulator.c
index 8bbcd983a74a..4a568b1b0107 100644
--- a/drivers/regulator/max5970-regulator.c
+++ b/drivers/regulator/max5970-regulator.c
@@ -70,7 +70,7 @@ static int max5970_read(struct device *dev, enum hwmon_sensor_types type,
 			 * millivolts) and then divide it by the maximum value of the 10-bit ADC.
 			 */
 			*val = (*val * ddata->irng) >> 10;
-			/* Convert the voltage meansurement across shunt resistor to current */
+			/* Convert the voltage measurement across shunt resistor to current */
 			*val = (*val * 1000) / ddata->shunt_micro_ohms;
 			return 0;
 		default:
diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
index 89657e8eea82..d66a0f61637e 100644
--- a/drivers/regulator/qcom_spmi-regulator.c
+++ b/drivers/regulator/qcom_spmi-regulator.c
@@ -245,7 +245,7 @@ enum spmi_saw3_registers {
 	SAW3_VERSION				= 0xFD0,
 };
 
-/* Used for indexing into ctrl_reg.  These are offets from 0x40 */
+/* Used for indexing into ctrl_reg.  These are offsets from 0x40 */
 enum spmi_common_control_register_index {
 	SPMI_COMMON_IDX_VOLTAGE_RANGE		= 0,
 	SPMI_COMMON_IDX_VOLTAGE_SET		= 1,
-- 
2.34.1


