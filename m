Return-Path: <linux-arm-msm+bounces-29326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 774BA95C5E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 08:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECC921F2474F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 06:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 654C413AA36;
	Fri, 23 Aug 2024 06:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="MwrwEPl2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2087.outbound.protection.outlook.com [40.107.117.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB48D13AA2A;
	Fri, 23 Aug 2024 06:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724396162; cv=fail; b=LGDb/8c1mVXv1Qj8Psq9tulJC/QQsqTI4ir4zZi9yMXf5iqk1SaNj3yDUOrfji/Pc6SM5d4wAH0W7aMxEqKVD372DwZr3zGEZSJA/8LTIN0tRh8UWkAz576Urjf11W7X8/JfphhgFmZ6DqKf5bZngbkwK7it+MwRy1D3S0txZY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724396162; c=relaxed/simple;
	bh=2fBt1wLJStTDUYf36LgJtbdmUGSojBnqTyVhUBmor7g=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=udeaztGPp4RnSdI+EQR7jpwGNKPpSVTJjLgOGeehiYwtI+gc6TNjQnisroqh+svgwc/CZcFMljdjsuFgjOf0BOagH4/tLVZtWDvkQIIbjpIyMFowjE49lXxWTL/W/aA5kdv7ZDQhwB7s1oQE7o0rvRl89EXJOzZz/4Bf37sOhk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=MwrwEPl2; arc=fail smtp.client-ip=40.107.117.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rj1Hkdcra+wL6lavZ55M8SgDVwwdV4eY/rEiJ+1vhK+Hro22OVxWUoi8JijGlgfB+HZ1FRzY6MRkJMuUq+y3x/1w6OVqN7dYEz1itE65mVEiXt5/r6TIU7NCIKlK0HjV5OD9SBtHIk0RwcDSaKrRzDJqXcLzaX93Lqie6tOrkwsUr4Rt3TglCWFp0vM9HaJCj16SxI64O7uVDDEzpBZpqAmzFPYFH2w/f6Iqlv8f6+XonDoPdnz+ZlFnpXJJg6IqDe4SEKrqrtXYp/48E7npznQwUOg88SJAsPODhffDFidN9tmwLTfmT1MteWZCiCq0l2xvioqVaIL4mMIldVBZhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vw/eBL1UTLGApzPSklvib9k9xXv6w6GutVCavh7AbFk=;
 b=sIsmO0/g4RrDMqgN7Xp3oCr/G16NJPzAylcVPCJx++k1KiD/Kb7oAp6d3tgzWTRyGSIc2rXM1MjOfo9mYDHwmrfoCtXPYxUJB1MPWtBDrxVvKHspovcqfGZG+fIr1IPBzmqTzdgCVnXzP6aOOyfCdGYoiZl+2AiOQWNFs6ctxtIjGyTshuogGE3GSSmOCJbGmDVUKhkHvYvJEPOH003Dr3s0xzbNjOTo8fV6yRZoBeYi8ijJWw1tHR9Szbt8xOLjrKs0elmXW8NJAbOOjblh6JmhhvY6JY5gsGlLfXssLvAiLp5hZ3hfv6JOctq34ittavG3pmc0ysG8QME88FIctA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vw/eBL1UTLGApzPSklvib9k9xXv6w6GutVCavh7AbFk=;
 b=MwrwEPl2N3oJUR3pM1xOLDx5YtMJ4nv5/EBZ4HCKeO2ndrzmDsxkVwQ8Fjja4dBfZpZNVLw9YcD87NAI/zNZLok0o1PvlLSL2BCI8hoiXJ+Bu/ZFGfYCJ2bLPsvxbkyrjLodadMJq9iYY1EohHVHghcRzIHJ5Xv2CtZy20gyejMQPrjny1lSMeZ4QCmXS2e/r6o6fx23svkVER0HHdupFmkHhzNQds1yPNrExQ3z77/qqWWNEGyWmnM8wHFHOQM6955XmzH7OHaDAesvVHWyGp4kwZe9NnwCoGs6htaESbNsEas3rrpDBroOdP5n4lumKwjnla3ykSZ4w704Os6HCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5724.apcprd06.prod.outlook.com (2603:1096:301:f4::9)
 by TYSPR06MB6389.apcprd06.prod.outlook.com (2603:1096:400:42b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Fri, 23 Aug
 2024 06:55:58 +0000
Received: from PUZPR06MB5724.apcprd06.prod.outlook.com
 ([fe80::459b:70d3:1f01:e1d6]) by PUZPR06MB5724.apcprd06.prod.outlook.com
 ([fe80::459b:70d3:1f01:e1d6%3]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 06:55:58 +0000
From: Yuesong Li <liyuesong@vivo.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com,
	Yuesong Li <liyuesong@vivo.com>
Subject: [PATCH v1] remoteproc:qcom:wcss:Remove double assignment in q6v5_wcss_probe()
Date: Fri, 23 Aug 2024 14:55:46 +0800
Message-Id: <20240823065546.3371378-1-liyuesong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::36)
 To PUZPR06MB5724.apcprd06.prod.outlook.com (2603:1096:301:f4::9)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5724:EE_|TYSPR06MB6389:EE_
X-MS-Office365-Filtering-Correlation-Id: 4217579c-c342-4042-dcbc-08dcc340a40c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C8/IJWqL8Sgfnil/JkHIcP3Jwrj7s3TOLfU3JwBKMLkhXpisBv/w+MVFBz1r?=
 =?us-ascii?Q?hC9kTixYaAAslJMkSI+1/0ym3NKlLaxVwHv82AAv52umn3fh6PQHJH/NqHtG?=
 =?us-ascii?Q?OQcz5LnbIIVNPaSE1Kc9ajaJRl2ywxJzwpJQHrStkdmNsEyGFnLYxLlsyf6s?=
 =?us-ascii?Q?K3tytbPn/UGNW0RvqB7ilSqlGIzNpT9+GBi3ORAyZEvVJbZLGUk/GDO8VONZ?=
 =?us-ascii?Q?vU64JgXgiSkSqZQzwsXj9LpN0K71vvd39Q+gPCAna7C11Oli4f5xhmLt46gt?=
 =?us-ascii?Q?9J1hwu5yk3ApHmmfKyVFEc3gmsMOMbmEqtCZD3EijVTM9sLSQsxPPtNkLevR?=
 =?us-ascii?Q?rYmbB1ftD4jXNwJczrBKY+JdTWzpXwlwGkhRda09M/d8AMVItEP1znzqQGvo?=
 =?us-ascii?Q?QJOowsIOE2nV8LVAQAPBbYY9n1kEWa2Z6C0/cCvXqHiY+pizhuYrBkVgORkh?=
 =?us-ascii?Q?ysUzYaPTb2hYpbFHYkhPQJSTIk1XqYRxqPC9CXALOvJsBwO/Za/iXRVUiwn8?=
 =?us-ascii?Q?URX4dKUghhJBUOE7PsBTXO9y/7XsVXMZDmy+bift8zBlvvotES9nWjoGZD0X?=
 =?us-ascii?Q?lE0Um4Us7tTvqgyXrADiTZdsOa/mAvU3GFBrX6bObnv0XsOgxym2Mo2wluOi?=
 =?us-ascii?Q?LZLzPdHPmgBjxX3iy44MzOSeivBhecHGQKrdebPKHVRw/KEfKFZ38ffBlYq+?=
 =?us-ascii?Q?kSCkaAxxJXk16EzT6/3UtTUxtKvW8xH9UjpRCV+LXopQOZvgeI7opBrjZRo5?=
 =?us-ascii?Q?892sP6BGpOlaZCKRpLrFSbB5k/h+XtNjKN/tY2i491l8yKLQk3Owre8qNQs3?=
 =?us-ascii?Q?qmVloGrPeP6h+k4xO8qPqjWh/vMCD85ji09dxdnggEPPJ8Ww2D4e7qhqWELW?=
 =?us-ascii?Q?pmfcsopWXCJGX4hYeD16jqT2RbMxtO6yQCLPrMv9BHj6y2OhfGHpAuFFPv4D?=
 =?us-ascii?Q?S6wc6MBBCZPWcw2HqEH2zlkWRKgPCSgaQ+LbyrOBZsw2MwjBvL1XRfuAF0IK?=
 =?us-ascii?Q?7mFk2i/s5ZNbOxvYUE+w62anK2gaYZgl9htVy64YuHw5BdukSP51f4OTMZR5?=
 =?us-ascii?Q?oaqWT7kieGsExLtGckGhAet+cMBaJOpCbG7MbTo+yDcV3lgkC2DO6MO8jMIu?=
 =?us-ascii?Q?DPMCjio0p/PBTE4EfbYdxzfcLCSf7iGSolBZkQM+4ni7V8newJGV+tL54f/6?=
 =?us-ascii?Q?yJ63QRXoevFKhAWFnnRGenYhXoanqSycxlosQZYCrOaYA/XCaFw8YmKpWOcI?=
 =?us-ascii?Q?CI0YqOx0oBAk0FlqqFRLKPDBzf5HQOJ3RQ4fHd3IsfqwUGVGD9gnJ2aUVBy+?=
 =?us-ascii?Q?ov8koXDtjenT7Ia1NbfimGXyCyiWL+BDl1S/Cfm017GsWD9bmfTablu6zZjQ?=
 =?us-ascii?Q?58qQBygZknEaXgpYlA5KtvhHVOqky6o1RF2YX7pv8hHf8n7Tmw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5724.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DPChK3tXFn3WyK8+SnL0YOBDjkmFBqN8b4qfi2icuCKgMvuDaDL89Rx2Qh50?=
 =?us-ascii?Q?o7YouassxAFhktrIZaLYAx+6xV1HIDPQ46uSEpihL6X77aCu9zqlvoaJxxto?=
 =?us-ascii?Q?lenNxqLP9GmvyBGX/oXosgBh6zYLnDnthJJFT0eREOpvHiffmqaeLR3HCUMK?=
 =?us-ascii?Q?5ZjyGlZdzRsn8KiiYLSXsLsUa7k8r7JWWB/HSAepEocHQE10RoPVZAt+JhwB?=
 =?us-ascii?Q?tREgvWdWfUP/FBy9vIMqu7dXI5YWzZU/Xo8mKcWsr3mKR0qSQ3anC/1+JuQm?=
 =?us-ascii?Q?1lkneWT8JANvNX6UTOBYw/74J6/GnGm7h0S2t4R/+tA15YiVrFeTBDn35fDS?=
 =?us-ascii?Q?BnyuImZciNdb2oHDiSKKFP2bd8VgYiI3ZjNNYDwvpeJKUHXtUS6sxuLUeKuA?=
 =?us-ascii?Q?qyRdPYxG7ZbZbnTjmsrLU91VwmOpwWgRV8KnHuXxjqpcyI4QsU5m5iJAUHv9?=
 =?us-ascii?Q?pE32hXSRXVvWanVcD4LzncsJ80Yl6x9dJvgI50miIIUX4IF3Fw9IzfY/Vs/U?=
 =?us-ascii?Q?09674gNvKcRCm+JhtOMdQd0npzCwQYsHoiBH1d2ELHD08IoMbPzhtcrf9hg2?=
 =?us-ascii?Q?CkMQXpDME0JQ+FrjONf6tKstlThcBez01yO/zbA9+IJvMNXQs9YFApWsSNLI?=
 =?us-ascii?Q?o9y4VRWC5FhquDs8fm3gr00quvWRODJ4HVXWA4SwZUAuoVfMaHfxjmTL27FL?=
 =?us-ascii?Q?1mb7q8M7dRFM++hAvNJ7E+SUBTPWmqf8yVZV18YLizEZ802xScooAlthAY9K?=
 =?us-ascii?Q?/d909YVxfEFSfHHTrKMxi7IKU2Q8F3bEe+J7LKNMz+yUIX3BEiXJD1/0F4iV?=
 =?us-ascii?Q?UbOl39IvtoFkzdLm08+iZnvRx/zdlOjtSRYLuqsm2dDR36aXJ3bySuXTRtVm?=
 =?us-ascii?Q?s2G616tSxaHRPynVVs8mF27esO0jajGr4CkltcHelD51dFGrXDo3ft/2xtMZ?=
 =?us-ascii?Q?U2KIoANeLqIYmZMCqrdg4hjsEbRnWqjS5Q1li+v+JcWApZMykj1t6L4Z5JcH?=
 =?us-ascii?Q?9mo8NL6LJg/G1pPmt0mDyzp+UjIbV0N7vqWbDqhSEaOfFX09Owu2YfVGpywG?=
 =?us-ascii?Q?BJp62DI5aUF7/n+u7m0/pJ2pcYWoMMJcCVBju+4fOkeO36o2sYD8pITep0oT?=
 =?us-ascii?Q?//GFKmD1yK+/9HJaiwJaIvuQBwUOK82/VXZ0lyfzg7YPgdQW6EBc31mx1+90?=
 =?us-ascii?Q?wulUABme3HT9UrQ33qpccB0g21ouQB4QV29W9veMHQQxQc6QG71rOesoiUQT?=
 =?us-ascii?Q?gwx9693A3Q2H2tnGuY0FVQd8i+yJiJr6krezNZzPDEa+ZkGvXd7jmfRc232G?=
 =?us-ascii?Q?jJSThSEWh5gbUM7eCEFmfhx0oD7WY2QkM/9RY7MTlPnbRGQYw05rO0M3uvmn?=
 =?us-ascii?Q?GHhIm3XzeDQKMxqwm5HRblpYKaDA+O/QRq/+MnWSVJ13ZM4T/KiwYA3eHBan?=
 =?us-ascii?Q?vspMGVoowv/LFOVeA0GhOLXnz9e2M2r2NSZSTr5Ko22RDKK/MK7nzisEIa9w?=
 =?us-ascii?Q?TBPCZ7mSdwIB18ZNkK74GLxpGZ3DhnsyKqM4PUvwXiSoVOAk6e65BlLCdo6U?=
 =?us-ascii?Q?xHfmcgvnhr11c+IccLDTf7FXoAoAnddOCTMT9SGB?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4217579c-c342-4042-dcbc-08dcc340a40c
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5724.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 06:55:57.9480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LYYU4AZ1fIxMApKhfdxofBpM1cTvGK01hYEQPeQSIM4RXQs2xr10vdFSBlayB0rVoN6yf/+EJfV3YhGTEdzJpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6389

cocci report a double assignment warning.'wcss->version' was assigned
twice in 'q6v5_wcss_probe()'.

Signed-off-by: Yuesong Li <liyuesong@vivo.com>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index e913dabae992..9d4e8cfddbec 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -1021,7 +1021,6 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 
 	wcss = rproc->priv;
 	wcss->dev = &pdev->dev;
-	wcss->version = desc->version;
 
 	wcss->version = desc->version;
 	wcss->requires_force_stop = desc->requires_force_stop;
-- 
2.34.1


