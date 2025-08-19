Return-Path: <linux-arm-msm+bounces-69688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D363DB2BC67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 11:02:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81F856830A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 09:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F94E23E34C;
	Tue, 19 Aug 2025 09:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="HW9wI6zT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012043.outbound.protection.outlook.com [40.107.75.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994BB14EC73;
	Tue, 19 Aug 2025 09:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755594101; cv=fail; b=TXQpD/SSgFkKxb/FKvl7qBZf5YaqagelzarsOT7RENKa+tmkRBkWzjINJD1eW+cZTWJeIk58/SoylbMDMIz5v46iEU4KhmA2Q4N7hwyN403X6y8K8b3+DvJ6ZplHSq6XeG2xpYjRCOwoXtga47VodDwVAwfQnkZeZdavyQcUstE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755594101; c=relaxed/simple;
	bh=6l/OfMR3wRk0niCy/cJNdoX6txZJS41oV3g1IdvtMMA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Ce0nr29R1dHGrcoOamqNU6xDkCAJmBrhQUFLRG885k3d/RoJtGx9IBRhBGwb6e/849DxzMV8xlJQdNDV0QuoLd9pxq6Jf8tL4Z4lW2sTW3WQTfwisZvsEjry43CHpHOwMvn+1U2nbatxDj5YZkVCOiNZt+OPMe7lkWA6R8iZd0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=HW9wI6zT; arc=fail smtp.client-ip=40.107.75.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yyCMZEKkAdFCIMP4+HLWEYo4xwF5APao6WUvGY4NZP3L4qcbv4cMvFhpuGc7AfEg593eZU+21fCAao9spxpcIEvdXLYmzYEnw0s1vXEok1oGWoa+eNFqy4Ruf5q/VRaMlykQ22ANmSkkCG+5pL8RuGi4wWuwybMvYNQze/Xx/Lte5BBZbE3O5u+5isb8nrziLK1DtR8lt7+yWmS4hzaXv+6t4z0Tu2vPdQ0jBxzNf/LmEiX9/StNwAA72dkKvg9wSN/bZ6AkmEgB7NoChPfazIVHKZ44WXQuYE6Jn/Gf/TlFvc0k43THqkfi3Y8Y8xYaU7enpCLxOcVEoo3vpUWa8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSJJLtVGBQuXQSdFwDV06udCi6t01MQzAsLJCTZNcN4=;
 b=UiC07XsjhixWYpVQHJBGiQREhhAiO2zDaeQaxEUIVVvl2myOQGjrkSqkj+CQfIJrTgtY/nzzsqxUmRDvTyHn/bASH3BtN2JnZALlP5ljXaxvjPPi5UoX2k4qMGr7MIFFT/67cE7SffcJC7HsjUsExS83HI9sYxeMIlZJjGbtAHuR6eJYHPnUujGCTlkt3qVGbHB+0YYw6DM+ikgFtVBx/woZDL3WoZoTTDE6wo3rFyWbvjin9fVRxzrnNKMApfH7ktFmuDM8+p76Fckis5cqAb9jWAhvuLqIHL0WoMon3ptDTm+ZWgvJx6feLCBz4Zfe+TNlADy925UfJYW/mJRc3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSJJLtVGBQuXQSdFwDV06udCi6t01MQzAsLJCTZNcN4=;
 b=HW9wI6zTVunaM6PmJI752dqgorfipNt30LaU6H34VJtXk7LjKBwDd4w/Bpl19Y10JVuZkl9fOWsKkn8LYdh300w8rVTSWD7BrrZXJpMDn//PGz037Bdi6hzd8LBioApoq7qRbPVnQY14R9N1bnxWR6NqZaarVVWpmX96fr3UWkCecS02h9+EHUPU8k9m4u2uaY8WGbJkKibfZ6hLsciKJJjY4Mukuw8OIbRJ+FfLFAAXQzgKsUacP2gS2nnF+WIMp4XQ1RFUrOAQEBO6mCmctwB4Ven+zLInTnmYLS3MJUeAlQad/Kz2gHtJN2CSebLYem4qyV4cTTg8+/Y+MuZFPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 KL1PR06MB6345.apcprd06.prod.outlook.com (2603:1096:820:cf::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.24; Tue, 19 Aug 2025 09:01:36 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 09:01:36 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Qianfeng Rong <rongqianfeng@vivo.com>
Subject: [PATCH] usb: typec: qcom-pmic-typec: use kcalloc() instead of kzalloc()
Date: Tue, 19 Aug 2025 17:01:24 +0800
Message-Id: <20250819090125.540682-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR06CA0015.apcprd06.prod.outlook.com
 (2603:1096:404:42::27) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|KL1PR06MB6345:EE_
X-MS-Office365-Filtering-Correlation-Id: 60b85140-35c1-4c0f-8315-08dddeff00a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F91DKkk+TCk70BDwPOJjiQC4ZfdpdVPA8U5rb+LW+q2/9GuVoBG6cBpbfS5E?=
 =?us-ascii?Q?hNtKc5vDGXmYq4E4lT5i8yjkaEak8hq33ybvrqttYmvrat7mVMaqAem1lb6Q?=
 =?us-ascii?Q?uNj5STHJnw5NizC/GO6HASYRr31McuegDKJ7PMXFqDT5yfK+rdusVlgZM/zi?=
 =?us-ascii?Q?UPZ7vEV5Mwbavig8GdtGnKgooGJO+xghDakBvQs3dydip9K1jEmz6tYjj9X7?=
 =?us-ascii?Q?r2nrFfeUKnUHi13NPIjrZJBVHgg1szrDlWmBBxmRKEo9xrtIWh4M7T+7CbJ9?=
 =?us-ascii?Q?kV5Yf7EPOfhlhtprZo5SGp8yolFAW8FA3iLNB90voZz4BExWlkf5KLMl/QWh?=
 =?us-ascii?Q?7k3w++P++pe3Lv3388udLNQqv/pKojvK9r7jgJkMEgtm13w7ruDmkW7Cxyv5?=
 =?us-ascii?Q?z69hRFh50aYfG8dSHGdctEVKSI2U1eMQk3dDUAyMIriDWG6X1/uByM5Hy+Tj?=
 =?us-ascii?Q?VBC0nD6PgaPniHh0DP5gS06PpqIuB7PjGki3my9jaO4hNzDRyHOZKl9eDJBt?=
 =?us-ascii?Q?6cV6DXkt+ZPfT6fKcg8vaZ6IK6eWga80q/tn2j9w1jQyMGjJOGvQyeUoYH/n?=
 =?us-ascii?Q?NvumkMgnUdenM8D4lxbTK48UK2QvK900F8HME65R0uO+O4pHKwKmWcb5/yiN?=
 =?us-ascii?Q?8G67D0kHeTeGe4pCHXLMQPMXSHvXlM2UsKsA8wIK7tMHcXhlnSA2vzYl1jYi?=
 =?us-ascii?Q?p0YT5BkPt8b8uRMcIXR5tjBuDzvmjIY4ycp/rJcYWtN6SMXNHA8C4E0FXLVf?=
 =?us-ascii?Q?tQatkyTUSwT/pEGLV2l40SC5Y+vEqLhDJbyF4JFDDotZ4dABovAqdFHNsPJo?=
 =?us-ascii?Q?M0e8JC8FRd2Y0Y9A4uV2DTb+VOO3KpMOddeSvg2qon/CFhE3AVu4RMLVwPSv?=
 =?us-ascii?Q?3czZbfCPE3XiH41gNWzDE6uQLLIweILnT+cVnw5dQmcN7VpOh51qSIorDj1P?=
 =?us-ascii?Q?kUVkNtlmYs7lcpfB3xIkiHZ2trIb2UUKp6c1odFBwqGTBSrOdXFiq+n9F7Sd?=
 =?us-ascii?Q?UqoAgazbZlYWaq3unjNQG6CVEjcKAJ21YItnaC77tI4F/0IUadla/HmOZzQU?=
 =?us-ascii?Q?Y1tZ+wR42N66ZyMsPuQAPkvIw2DNjr/gcqjJ3pAyHRYkkbP8VfxRAwsYzyz4?=
 =?us-ascii?Q?ntv5m69PoX7o6aonCXQ021GnHf6f8y2T8lRuhYbKntMGUFTGXyAYSJxFJMpD?=
 =?us-ascii?Q?nthNn5YG/e6Ggpj6OeSWST/68vybef/H6rG65+u7cVDsrRoWJ5PszdxGMwci?=
 =?us-ascii?Q?F0oDikQ9n1swYJkzUDqDBRhCxrwsZ/o9xAkBxIDESRU/t9ELDlpJMLZK9oCx?=
 =?us-ascii?Q?gIUDv8BtmmUjiuQk0j55e5T8C2Q/cugQyS81d/XXEhaHts18v33tpqXjc9rM?=
 =?us-ascii?Q?6LpOp7YfCJU6+KgteOIHwyglEuxDjX9AMP+kOkGH0xw0CAqQRVyowSeKU1dh?=
 =?us-ascii?Q?NLcR2UDUuawlqwUTy81I0CKPz5oPr7FmgndngzCE7DTVBKOSCQtKzA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oAh7YBHidXGelTxklc7NnJH38QvD8ncJbHBzZ7gbsW6LmvXp3Hvx2eu61XGt?=
 =?us-ascii?Q?zLUOtotiztaLJuT7CA71ErZmNvbnCzPNLnBsf/jf4Oh8X/uhpPo5BQqiywqn?=
 =?us-ascii?Q?ejyErnd9BeFdH1iNpiqDVGTl1VF7nCvFlaJX2KxFZAXlK0GSVXKvuFAlBrVt?=
 =?us-ascii?Q?xnBGzemODUewkti+UtnR4jhMARpU3Nstj/NMQjl4yuA6bTI3G6tro7WvaRNz?=
 =?us-ascii?Q?c1XNkwN3M7Mdg6SKAFDlCjgWaay+m6kBfX845jgIDQmw6cWaEkgNU+PWQzaP?=
 =?us-ascii?Q?tgXk5Q9b51pzGTCZNgMy5+yj6qSlp57dl8Nl0/jVyjFa8CzsKz3T+U2tzDy+?=
 =?us-ascii?Q?VBEaNHzvBdGivsZBZj7QcgaJwWLf9oqgowyycxcIlSq5eDVDzGfnQ1flKTki?=
 =?us-ascii?Q?PDABCaP8S5rGAXXn3iSpV089iTCmU8f02vLq86i01GhnB6chXopOA36zoIAs?=
 =?us-ascii?Q?xzA9QZNDp3u/clDwv0IVl1bG+Z/1XAvc3p/3qCfRHnSMdXbJ/VlGiO5euQ3j?=
 =?us-ascii?Q?xAkfYOZD1FfGyUygw7AGBpjC/D3J/y/YckpvgQ2MUoakfEbLQVyUr7dbv5ex?=
 =?us-ascii?Q?Hn2QpPHW9iWXknNYXyRM0BzLlMT+18Pj2HTteMivSNjbz1ue0fxf0NNZPrch?=
 =?us-ascii?Q?LQG7gQ6Y+d5RqWvjW3nmM4tjg7j6bCGvYMfkpC5McdXii+BBMLemyJHreRCV?=
 =?us-ascii?Q?iAlkgwWawVy2EE9GpmPLI9LHC/iunnsubDgCnFukVx8wdPDnLSMlZn9AJRnD?=
 =?us-ascii?Q?UvGQaKrWp1KRVHzHpFgIFWv+TgTTEmOiUIQPR1/JR9JW/VJIDxm59Heu73zC?=
 =?us-ascii?Q?YpQvRoeYTFsaunUmkVx/BJAB7oihSUyjaPArHZeC44z3KN03dHyfA/bAVdXh?=
 =?us-ascii?Q?nG38HUB1ZJgsnzPIxJndcorGrCMZqzXhTzkGwqBG2dVx5EjK7/tiuCO8tmXF?=
 =?us-ascii?Q?1pQEgPMma6eI2NvlrsHXiVuFkq2EPbCOilo4g9wvYliJkhSTKaNE9v0ZG5Pg?=
 =?us-ascii?Q?Yu+gSwsQs/zcuhic0LIz6O1cWaayLFPZWtTA03C+hI86jETiT7BljUYObbOP?=
 =?us-ascii?Q?D1VQd3a4jMCAgF8PM1xUwvSlEjQ8SHEXgd/S6SquW/r2ifdfWdxa1YXDvMdH?=
 =?us-ascii?Q?Tqh5QOx+0p86sEII7h02IBIxujH10EyxUOaNULKtw0M/SnptiPrJ/qVYOrEn?=
 =?us-ascii?Q?lwmDtoN4BaCTzKRaWHW76eVRjvWGnVoDkFmkcbWz79oXKT1Lpzl8b9fXouMQ?=
 =?us-ascii?Q?pCl1Kb9NOQlcj1WIsxKMRD+28XWKqXS/q1pL2cakHoypgzki8RUa1lRh3Ql3?=
 =?us-ascii?Q?2MrHmbslC4WmshpAQv05otMjw5IoxxJnf49iVcMAEuChlaVCFwbk0ceJ9vdT?=
 =?us-ascii?Q?7Dqg4zZd058oMSBUjCiTV4/bkYcyrYF2Y7OYUreqBgf4Q+EpUSQvSrIVQiKb?=
 =?us-ascii?Q?91ELwT4Ga0kpn+8zmhsUBiDSupFoF6iYnL/erqMivi9B/WZxbEfLx7Ien8vQ?=
 =?us-ascii?Q?roT6lDevlVESwAB3tfUVH0pdUhCrTbjL7QwzPYf8OBqtRZKVoBRGF+IgBbUr?=
 =?us-ascii?Q?xcp4hxYyKe9TmeCIuYmzstyDgxvjrP/gDo86DYf1?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b85140-35c1-4c0f-8315-08dddeff00a4
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 09:01:36.7174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JWUVTlbMBAYXeQKLw2zXTj0THJzKkmR+4piLdrBXad349DcFHQ8T+r8dsheh8zc2R5VjgeweztYNfEB3QBJJog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6345

Replace devm_kzalloc() with devm_kcalloc() in qcom_pmic_typec_pdphy_probe()
and qcom_pmic_typec_port_probe() for safer memory allocation with built-in
overflow protection.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c | 2 +-
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
index 18303b34594b..c8b1463e6e8b 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
@@ -567,7 +567,7 @@ int qcom_pmic_typec_pdphy_probe(struct platform_device *pdev,
 	if (!res->nr_irqs || res->nr_irqs > PMIC_PDPHY_MAX_IRQS)
 		return -EINVAL;
 
-	irq_data = devm_kzalloc(dev, sizeof(*irq_data) * res->nr_irqs,
+	irq_data = devm_kcalloc(dev, res->nr_irqs, sizeof(*irq_data),
 				GFP_KERNEL);
 	if (!irq_data)
 		return -ENOMEM;
diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
index 4fc83dcfae64..8051eaa46991 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
@@ -713,7 +713,7 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
 	if (!res->nr_irqs || res->nr_irqs > PMIC_TYPEC_MAX_IRQS)
 		return -EINVAL;
 
-	irq_data = devm_kzalloc(dev, sizeof(*irq_data) * res->nr_irqs,
+	irq_data = devm_kcalloc(dev, res->nr_irqs, sizeof(*irq_data),
 				GFP_KERNEL);
 	if (!irq_data)
 		return -ENOMEM;
-- 
2.34.1


