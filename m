Return-Path: <linux-arm-msm+bounces-111333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KJYGA5+QImoQaQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 11:02:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59313646A89
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 11:02:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=TDGVwybm;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=G6O43Jus;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111333-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111333-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cirrus.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DDE930315F2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 08:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C342495526;
	Fri,  5 Jun 2026 08:48:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3685147CC6A;
	Fri,  5 Jun 2026 08:48:57 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780649338; cv=fail; b=AzB8uBNvSTKwNdvS8QHI4ep8X8TA5Q0yLOIWzzbeCeLXUzTqgR1+JG9JTJsGByonqkkknUgeovrqalzMihzLI4kFz7hwdVxFN/vNHTD5XV8CI2iLJtx1xISVIkTtKs1Ug7kpnkPInElUFQqoMJaSZl3wdrRS9/2etbVYSltDdgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780649338; c=relaxed/simple;
	bh=VVw0xPribqJ531/S3pPXkcptpSTCk4kaIDaFK1OCI6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AgIPIKd0A30jYStvgiCGX7A3/M9cAH7otRCWP/cV5dn85/G14KV1F33+xSFZYfmyafi9dB1rKA8mxhPPFEVx1T2Q7QGBKBaxEfWPPHr5AaIywn6kCMPJruc6DMp/7nI7hbYY2M4QzUGTVVjJExpWxX/Lq8riJztKgThFeCXK8WI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=TDGVwybm; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=G6O43Jus; arc=fail smtp.client-ip=67.231.152.168
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6555iB1W3107326;
	Fri, 5 Jun 2026 03:48:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=8ZvFXSdjBe+rgq2x
	UbmAmnHKFUbnNIn5VnqeAxzMUXI=; b=TDGVwybmQs77o6hlpwAn80waHT2owr+5
	m8+jozIjXBJXCa3ljmGs9X8dzWptA5PJWhrAxDDQE7mHH9LWGp8TbhMsKl9RNVvs
	Ljk3KC4eOP2w+MQb3qjNgsXuLSaiYLiI9r0RtsbojO8r/NyJbLIgxcWnTYyTn6cT
	Qcd2nTVLEAwEEqvG6bPso4UxNGu9k06zxaoZoByt8JnAteDLP3EEyZFpF+bIP10D
	Et8TQPyfUQhN6LLYVRcZ60cY6AzVV5WPgIzgsBQaaqNK9NWn+JfjDlXsiik8QOlY
	yuNoCnJu/kF6ll97YdaE6Tfpu/qnSlrpUqagm0loGBpo4UjD1Hlffg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021143.outbound.protection.outlook.com [52.101.57.143])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ejrbram9q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Jun 2026 03:48:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dOdm4TenTWWfWlbbO8s6a3Awuxb1RrYp1Jj8/SUVrOzm8TFvmq0agpSqMQRzQv2xlCeJSGJ6sUxwLyM4f4mi7N4WgsWjPGeF80ieB+Yr8X4agCE7V+gNKbf9OUCDYZ4u2+INdSetIqsR/aYAyYK5BknkUwVnZ7E3/V7aVEJyJJeomxi66vPepLIv5IfPfhu19nk4MR6mFGDkMdGaXfHpVr3Le+TrgE4SEvJ8VKKiyXCMM94XpAg+GEwYHD4rHlfA9/Rz5PegJiF4iSlXNMHBIdzxSve8IwRI8RyEZ8JGlWxfQz3bt68b4hQwt/e28QpeiUHXz44YcWbW6RcMl5zMlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ZvFXSdjBe+rgq2xUbmAmnHKFUbnNIn5VnqeAxzMUXI=;
 b=cdyzqA2XceL/0UW8gRv4svOuIMfnxctCssCq6shPCjlaL4dx1+lMucgW6q+mw09HJ4O0K4dgAlidSImxDuuSnX0B03jD7PbdV9CulxqCvOTnUJHy5EFBqAS8CMcjb4bkfde8NjWaUhnTLVkyKs0rixvybNBQ9Eo1T37enO1aoIlo7T7bjCoJy0v4iG3EFskEke1jmfCbFUk3QsnVGW3WFiWp2Um4WbfMQaEsbeltTnqN2BrXQCdepOnC8PexG+hLI1o6pXLrrfpMnqxCRr4fUv85+xZIIvnbB8lYcMFEgbswJ2fk2xfhEU+jmZBjENl9UR2aUY8SbYx1fKwk78rNfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZvFXSdjBe+rgq2xUbmAmnHKFUbnNIn5VnqeAxzMUXI=;
 b=G6O43JusMi8OVZKzPAqDb9qZQcLGQ0PLWCBNYXa5rYw1VT4fNIHzijSj5m64Xi9FbTmlmSZvP0NM9Dw0r1DRW/cEb7CqlqgG6OC6JBbIuKRvZM5hLPbkzV4rk7EgeaHVoUvd6oV0M6YO6VNyCCmYNnT3s75g0pO3iHjg6+cWLV4=
Received: from PH7P221CA0005.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::22)
 by IA1PR19MB7711.namprd19.prod.outlook.com (2603:10b6:208:3d9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 08:48:17 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:510:32a:cafe::13) by PH7P221CA0005.outlook.office365.com
 (2603:10b6:510:32a::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.9 via Frontend Transport; Fri, 5
 Jun 2026 08:48:16 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Fri, 5 Jun 2026 08:48:15 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2949F406540;
	Fri,  5 Jun 2026 08:48:14 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id F131582024A;
	Fri,  5 Jun 2026 08:48:13 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        srini@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 00/10] Expand SoundWire enumeration helper coverage
Date: Fri,  5 Jun 2026 09:48:00 +0100
Message-ID: <20260605084810.1575539-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|IA1PR19MB7711:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ab424f48-3e68-4118-bb4e-08dec2df2f5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|61400799027|376014|7416014|13003099007|56012099006|18002099003|3023799007|16102099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	8r50JvMUZxGcqp7ukf441l0kRV8+QgmIqFSp2mMuzdXh3/kgbULrbozK8i2UVaWJrOSPilejpPTzv5EbK+pI4lc5oehAS5cG4X6DHRigNLfOilSHSmg5+4mYap6t2e7rc3kvZBzZ7c1AutpsZSV/xShEhrG8Vvz1nitPbrCqiickxZXFWx+NbIYE+ZSoiZLqmHaBFDX4KQI8xZBiUvE5ud6L2Riaq5/9tcFRHksQd7amTAhPg6bkLtVW74F9r6/49pWaXTtcta8wdJZFMUtO7hFcRTE8BBBDI9GaUB0smSKMAYhj9sAfEjRizB2VJ1YS6KeGoSSJg2YJbGWH3LIy57Y518q6qj7yd7bY3veL3nIz3PNxazbszgRtTq8hsvDAvz4MH2BVRsnLEi71ftJf7PwnD6wCmV5hGxuccL/fRigCoW7+RF3tYzXoyuJNPrjFErhnL6U2JA/oUGVZyqiWyHHP+9H9S2wlZarksOxCnA4e1oDW9lJpzRP64wzka7pKFZQ0nqyiCG88WdIzgkTDv4guuCuulmhTNGfwY7KXSJiNZDSRCBSDQh/sAkuZcVobrj/ckTAzvwuzKPir8V9FCmlcamDixzZEiNMQ6KevZzLmMfoSvz4X7238ejGAwSCnQY77N+dk+AzkRokTH5gc0a5RNC6gNt+0PFvuAngOngT9w4WfFlCjVE8ieVnKljzz6nlB2ypuDpQO70zJv7W/kB98rcIPhcKHRgvtv5pG9z0=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(61400799027)(376014)(7416014)(13003099007)(56012099006)(18002099003)(3023799007)(16102099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	j+EoyYohtASCZtaTTv8rwmjjyXliuqjH8FsDRHATx/9HuVYQ9P+GUdQzEH/Le8V2SFttiDO7aTx3XedY7JmC5q1PYfcU0sxzDUAFW/+Aq0KJGeaZO298AUzvkv8ZCOnHUtMWy7e4hbN+o9ybpdjWdigSbZfxfGheCp8n/JzQ6viB5PNVRxwxkohKqEsGXPn31aWvNsxvZzanv+qOPsx+ni0xNW7ptl6iR2ne1pPRzCMUf/Ja8tu4aBir9AmACpCH5vdpSthgCK40QdhQnEOjd0zIi551MfPA7OQNQklRAWe7JwpS9ZUP4v4gaDPRORjeJih8kzYSS+hN9nH60o5sk4rmGY79QeNpzVXI+GpACh4mOzABmvK4OtjSGIlYPvuY5HJ7r0kTX7uJcOfNhPTJgPTyj8vmMici4bvvEkieGp/Gus5EFyFY8gXY/YPtjT8E
X-Exchange-RoutingPolicyChecked:
	WdqENTYN1fSrWTRwu3hHmjkYtuF+I9v4IpFgZQOhoEkdxRv+/+aLv4XeLprEuUdpkVMxchcHwX64TwS4cya8C1jQm0MhQ8e4r4ciG7FCF+EPGgpXvZ3mMzj99sLq2TfcuTE3rYlimgYYVjkMBXv4DHqbTgaZH6R2HxqShh40RrXF8FjAPWH3fgs5ga7DebxtSLu0laK2z1v2+T4bjpsDIJLX5tj3tGV1M+Fn7QkFvR1kZ6aSGl+r18BNQT2WwqzwRJ1+arAIDXQaxZNP8Wv1YHs5gMoKHGyexw3Se/vB/wMCIaWwV3IMXRz5TJrwxi7tgElB8wZ0dxdDl7tSWZkGoQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 08:48:15.8401
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab424f48-3e68-4118-bb4e-08dec2df2f5d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB7711
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA4NCBTYWx0ZWRfX163rAAxuD/7G
 ikCjYlIUMgdocASpKI2sC2jw2pu1uUhWy+eoIiI5hMd6iauXy2cTHWZHOD1d5m3mD7EGlXxrAs4
 WsBCKOihl39W4LRWBciGVNTlVrh1BMt3ut8kS+ftcwko3l2ZfXVAI/xF6Y2ZPDAbeivV8kyM90i
 rbigMh/cA3jfgc+ULaLPVpBLVA+m1I1KTelmj5WbaVDiO5kfCBFDSF8+8rfDGUEEfKHyHxWZIUd
 d75giX6n7cb10jEIsTSsXLYiCennc18/mybanwcEbkTt45fyfxK9YeO9VYiuqQr5MoH/hn6o1a3
 mPmghaU031Q5sIA7WI5p7HYfjcGfaVg5uyKiK5zlwQau1nC1SibKKoj9mkCE8RuGua9bnzb0EPo
 RPLm3Bh9+mqDYLgshZPYySK6p3wsfBspYQ2UonHG1lZUlq0XEL+5sP+OOuyBbOzRhE2Xe29tCfz
 +cLLIdZlOcdObbij5Ng==
X-Authority-Analysis: v=2.4 cv=TZimcxQh c=1 sm=1 tr=0 ts=6a228d55 cx=c_pps
 a=pCScd9Md5F2Oib7HHR5gBQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=maTja8o1zyEAkiTaWhoA:9
X-Proofpoint-GUID: c96tgtnc21guJ648RFkJKB4c_tkSfzTC
X-Proofpoint-ORIG-GUID: c96tgtnc21guJ648RFkJKB4c_tkSfzTC
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linux.dev,linux.intel.com,realtek.com,kernel.org,vger.kernel.org,opensource.cirrus.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:vkoul@kernel.org,m:lee@kernel.org,m:lgirdwood@gmail.com,m:pierre-louis.bossart@linux.dev,m:yung-chuan.liao@linux.intel.com,m:peter.ujfalusi@linux.intel.com,m:oder_chiou@realtek.com,m:jack.yu@realtek.com,m:shumingf@realtek.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111333-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cirrus4.onmicrosoft.com:dkim,opensource.cirrus.com:from_mime,opensource.cirrus.com:mid,cirrus.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 59313646A89

The patch series in [1] added a new helper to remove common boiler plate
waiting for a device to enumerate on SoundWire, however, many devices
also wait for enumeration during probe. This series updates things to be
suitable such that we can call the same helper at probe time when the
unattach_request is not valid.

There is one final step outstanding which is to add a core helper
that waits for a device to drop off the bus. This is not include
in this series and should be the last step of this process.

Thanks,
Charles

[1] https://lore.kernel.org/linux-sound/20260512103022.1154645-1-ckeepax@opensource.cirrus.com/

Changes since v1:
 - Completely remove the attached flag from cs42l43

Charles Keepax (10):
  soundwire: Always wait for initialisation of unattached devices
  ASoC: wsa881x: Use new SoundWire enumeration helper
  mfd: cs42l43: Use new SoundWire enumeration helper
  ASoC: rt5682: Use new SoundWire enumeration helper
  ASoC: pm4125: Use new SoundWire enumeration helper
  ASoC: wcd937x: Use new SoundWire enumeration helper
  ASoC: wcd938x: Use new SoundWire enumeration helper
  ASoC: wcd939x: Use new SoundWire enumeration helper
  ASoC: SDCA: Use new SoundWire enumeration helper
  ASoC: cs35l56: Remove unnecessary conditionals waiting for enumeration

 drivers/mfd/cs42l43-i2c.c      |  2 --
 drivers/mfd/cs42l43-sdw.c      |  7 -----
 drivers/mfd/cs42l43.c          | 15 ++++------
 drivers/soundwire/bus.c        |  3 --
 include/linux/mfd/cs42l43.h    |  2 --
 sound/soc/codecs/cs35l56-sdw.c | 47 +++++++-----------------------
 sound/soc/codecs/cs35l56.h     |  1 -
 sound/soc/codecs/pm4125.c      | 11 ++-----
 sound/soc/codecs/rt5682.c      | 14 +++------
 sound/soc/codecs/wcd937x.c     | 11 ++-----
 sound/soc/codecs/wcd938x.c     | 11 ++-----
 sound/soc/codecs/wcd939x.c     | 11 ++-----
 sound/soc/codecs/wsa881x.c     | 10 +++----
 sound/soc/sdca/sdca_class.c    | 53 ++++------------------------------
 sound/soc/sdca/sdca_class.h    |  3 --
 15 files changed, 41 insertions(+), 160 deletions(-)

-- 
2.47.3


