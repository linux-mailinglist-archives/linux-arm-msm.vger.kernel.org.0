Return-Path: <linux-arm-msm+bounces-67761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC07B1B137
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 11:36:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 311A618903F6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 09:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 096732750F2;
	Tue,  5 Aug 2025 09:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="UTozRZjo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013005.outbound.protection.outlook.com [52.101.83.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394B72701AE;
	Tue,  5 Aug 2025 09:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754386435; cv=fail; b=K4Sa0ed0qtjPG8QScAOofTtk6WJywJ/SFgzAfr8eJazMQmHQn3U8XhqR/oWxvUPR3Bx2huYJe28tLcSJV52Z6F3e50Gxc7rUZgN+CLKLBXB2f2iYK7lHLU2pqB0/8T/5HRH64xpZ7pUnjq/nKZYpM3gVkMI6Bk7xf7SBdxkAXOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754386435; c=relaxed/simple;
	bh=pXaSvlpIz96n9iNZcTH2shbPWD3C/Oh70aESvF8QrII=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kpwVJ16iskFdRkwwADRY8gmp9g1p069+ieLufFBzG/B+WFBmBDlUjz+ex6YRG1b88/YyghOJEKvTp+204XJ5fc3F+xroZbtc5qF8XvtszGDO9kZtU0afgRIhddtZaeMEOB9ZYTQkWB3/2XQ8ipDi8W7huJbCHmoWkdIitBY4czE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=UTozRZjo; arc=fail smtp.client-ip=52.101.83.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vfZVmBqh5NQv5GkV1Jn4hGun/qFgUOaoLNzfPh9tlLG/dk3ZmvHc0SHFan8bN+Y73MW1KwADJodWTxARr4FYC5vzmWI7U1r+U9Dgi7k2CF7ww+rdSzrvNhk+WGhRtzrdD/8ZNdONRVUQWx9PKpV8l3THT9wls65mGy5tBTjsYnJf4OkUcHOPiEp6s3ieceCP8EcS9qKLfz8U+t8outhgp6v0BlaWNrZ0ApwoKlMlGTrVjZAJrXoQmHsQK/+OkGuS7fUZ/tp+Kd6B8mqsQarsQMXYR6Mwj+Tg9AWiySXwh/HcRkwDhNdhPuW+7YamiJs4+HdU+xiJaaLzfkgSeptcxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGMbirp89aazaot/xWsU4XJB9+6UAMCWC7XBBvH68qo=;
 b=uAKKnUEzGpQRZvGz23TSSo4lKvitQKnCcHr0fW/5V2OmBnFSAYuKNG6a2PpQWXcieBPRVRmjeagEm+lLrhcaMf5+FGDFDJ/YfTfjJGX2y5qgvNWJAERSj2IlTKiMPSeU17lxtJMsrpmeMA19m2aH1wR/pFAXzCWb8mTLDVwl2dFiLXH0qGEEYCswm9tHMyLT4RyTbzWbRGPQw12Uy5jxXOXmI3eRLQeTqoAbXMwxOjw2Dyo9ef08ZGcNoZIgRIal/9igQYj/NSpnUab9VrrKS6JSQHtG0k2dMbHbbJZK3SHhbv468dTpgIyoDX7CCZsIkaDKA62PJtF8ndf5BsvpxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGMbirp89aazaot/xWsU4XJB9+6UAMCWC7XBBvH68qo=;
 b=UTozRZjopD0QjL9LlLrkbLmapJQZixpQl7OqGmz9Hhemi41hZRAQ27wfclL/xWpza/MNMIv1u4NrOOMxZ4BxJJ+Na1EtN5UUFB84ojMy4LeN8CPjBdUx2qlHzLpSydYQGIvWwNClyImlOtLVlwFmkMtojMMkd61CtPypeqL5KFQ=
Received: from AS4PR09CA0013.eurprd09.prod.outlook.com (2603:10a6:20b:5e0::19)
 by AM7PR02MB6306.eurprd02.prod.outlook.com (2603:10a6:20b:1c1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 09:33:50 +0000
Received: from AM3PEPF0000A791.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e0:cafe::3f) by AS4PR09CA0013.outlook.office365.com
 (2603:10a6:20b:5e0::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.21 via Frontend Transport; Tue,
 5 Aug 2025 09:33:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF0000A791.mail.protection.outlook.com (10.167.16.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Tue, 5 Aug 2025 09:33:50 +0000
Received: from pc52311-2249 (10.4.0.13) by se-mail01w.axis.com (10.20.40.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 5 Aug
 2025 11:33:37 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] usb: misc: eud: Remove error print for
 devm_add_action_or_reset()
User-Agent: a.out
Date: Tue, 5 Aug 2025 11:33:37 +0200
Message-ID: <pndo6sukt8u.a.out@axis.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A791:EE_|AM7PR02MB6306:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ca95757-a604-47cf-ad2e-08ddd4032f5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pdK9dDUg3moZ6kapeF848Rp9Z5U9D0Oormupmh3m3zwqqsTDwuPwF6WIj2Ka?=
 =?us-ascii?Q?mfOfWePwpu2Fgo5Wgqkf24crmMdlVdzUncSc2uQQj3rUqRlEnMicCdj6HW0u?=
 =?us-ascii?Q?FWAQXmiY4o3CfFWyt0QFFw2xQ5N0BqmRVlPsL95LSovJE8KLbCRDg/t+Hi5e?=
 =?us-ascii?Q?4c06OO/lsxyQyu8hyodTG5K0l4/a/nvr9DO9Df4bBeW66ixsD/32ZuRl9KiY?=
 =?us-ascii?Q?ECSGl9FZT0xwA/aFRp81saJyHJr8BvkYTE1jIL/jewLju1veM69UnBUj5DK1?=
 =?us-ascii?Q?gAaOMkD/SUR4s1XfhYIZTLF8IVEti9PD/WAWjM/P7N/lv805oeDzVl5a+iGg?=
 =?us-ascii?Q?sTcOP9XPGNZB4WNsEDlY0VvmSBG4W9jNdHYdQ85Fl77Jm3PSnxmGHBmy1yBc?=
 =?us-ascii?Q?FuEnKdSWS9atQXfu1N+6bSYAsywqH8F6HncpMoF9DiXAnHw0onVfXU7t/3T4?=
 =?us-ascii?Q?4uFZeFXiKOGWBxdtI7TSRzsVJ84BERiHVqx6N2mIlBTifJjGKTMTO/bQbl8b?=
 =?us-ascii?Q?/e3Ix+DLDtaT0VNZZVCjp6QPuB0yoW58KOAKcnJmpr50VjiY1nYPlvIOu20T?=
 =?us-ascii?Q?0tnqoQEuIuxH/h5i/ePwQB8xwiokBVPe6QJ6R5XgsEgn4/3n1HnsdKtwEf7m?=
 =?us-ascii?Q?GCuTXLDUFaorDynDnqUv8MYs9eeFuwp0+j8+zyS2+iMWAGDimmepZ4/W4RCX?=
 =?us-ascii?Q?dJ1trfjVVB5FF2hRT4TTE2IrBvajUBXHvtZTVatJbwJM1spIYzIGwJNxoKrn?=
 =?us-ascii?Q?kRyKuZYuDG0iOD0A71kObEmMPxHHVI3nzNikCj+CGoemQ/sBkSSje89xKBf8?=
 =?us-ascii?Q?Le7Zb2k66krAWqXbab4d9AV0KsgCTEh+JInu8lYHTfpFFst6a2D7ztZI2Poy?=
 =?us-ascii?Q?ufNqbkdL0shVST1hQ5dAU5JIQSq6ZrFWIVN5EbYrvywX+57ZUJmvouf4B59F?=
 =?us-ascii?Q?AkcSDodxBKz/xPd8R0OJc3uX2SEPi4pYbI9/d4+P0ExKc0d6uRMDMaXB3RM/?=
 =?us-ascii?Q?wk4dsWQ0BmZWKcLEmExfnxTruLAwy6fx5BgN6b20xD5e29MV6MICPLkL2T/x?=
 =?us-ascii?Q?hxYZS+DWr5qpqcssheNJECtgyF6PW8ZKoqNQ7JR8QMkawh41D5bpNB37GxYg?=
 =?us-ascii?Q?yLRBfFd5euMzP2IM/8BMuYrlB9/Duck6qwQ8c1Qy1GBq6JMMruFTrHH+Ra9R?=
 =?us-ascii?Q?hAvMjBQhxwi/XUckDnAI0lOUp/yTlUc5d9qbB1ODN/ZPgUwkQ2J/mppUjSwF?=
 =?us-ascii?Q?Fjteo217K5K6Txp+FgiC5g9Effl4bOF8TWMR3REMkLUEMBfcOm5Z4brNfYYz?=
 =?us-ascii?Q?fAyNwHeLkEjJcXxYrwOjQfQJqohx0JfmqgL/Ih72qM645vvf52PAWjiyYdQp?=
 =?us-ascii?Q?ymc8jHw6s8T0o8RpDyI3/ph4IrMSn+wozqrDvxRLht/9s2cyxsTfnIR9fmL9?=
 =?us-ascii?Q?rWDPggTPypGn2P7kohwvLmmult/qMa6MY3mbF+ItnFE+efhHt+pt+1aKMp13?=
 =?us-ascii?Q?R1jtq+VNoN3oT00RITtCINfDA+5BZwdDCXsl1ifOebKXNyNSRd22NIHDVg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 09:33:50.0780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca95757-a604-47cf-ad2e-08ddd4032f5e
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6306

When `devm_add_action_or_reset()` fails, it is due to a failed memory
allocation and will thus return `-ENOMEM`. `dev_err_probe()` doesn't do
anything when error is `-ENOMEM`. Therefore, remove the useless call to
`dev_err_probe()` when `devm_add_action_or_reset()` fails, and just
return the value instead.

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
Changes in v2:

* Split the patch to one seperate patch for each sub-system.

Link to v1: https://lore.kernel.org/all/pnd7c0s6ji2.fsf@axis.com/

 drivers/usb/misc/qcom_eud.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 83079c414b4f..67832790acad 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -193,8 +193,7 @@ static int eud_probe(struct platform_device *pdev)
 
 	ret = devm_add_action_or_reset(chip->dev, eud_role_switch_release, chip);
 	if (ret)
-		return dev_err_probe(chip->dev, ret,
-				"failed to add role switch release action\n");
+		return ret;
 
 	chip->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(chip->base))

base-commit: 260f6f4fda93c8485c8037865c941b42b9cba5d2
-- 
2.39.5


