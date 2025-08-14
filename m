Return-Path: <linux-arm-msm+bounces-69254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E82A8B26987
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 16:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6506D3A1463
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 14:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4966F1487D1;
	Thu, 14 Aug 2025 14:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="kVRlOYRY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013068.outbound.protection.outlook.com [52.101.127.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827F72C1A2;
	Thu, 14 Aug 2025 14:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755181486; cv=fail; b=ur5b6Kb4KH7UHsxXuMQgLmk8OOKRsjX03Ro0wqmJKS6ENPwy5cNzJ4F5j1YzAzaNEA7Q8UcU8G5lf0417IunV0tAlalpYk69yNXTCjvq5qYJMcDlh3XLUtaOsfgpqO+WEGhImsUAGr+g5nA5qkXsRZDKYAkLNpPj9Pk2lR40YSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755181486; c=relaxed/simple;
	bh=thwpyrCR2ZfFubRDSHhDuhWP33Ozzgd1/dPnq6ocFq0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Ym4DwlO+sy/HN7FvZxnC9hf3dKLgFNL7e6qHpiLQ8XwRJ4PLU9c/WRZ/sUbAm/mgiDhSldDnl1wg5i7ZDZCVpJC8takOSzpbrUdki7FdChIpPtpJwz8fZ9B69o/3qK6X0LdTzNcHFMhvSCxT0o/kqVXa4F8+e+gHZV9/munjUTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=kVRlOYRY; arc=fail smtp.client-ip=52.101.127.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=edKRMFPUWklukt5TdvKFdeBWjnfcnS9Zfdg02/ZHzYBCB7EYcfxN83/BE361qK2KzJdMSLk6WGhAEjooltYY5udVbDnm1aH82W4ecFOBNpNvSQxv2D1ZbSx+diBp4rYfTw+yiFs8HgFdTKS1eJDuJOVM5lUpsuJG9sh9mNukK5MBZyZa3h5Z+OS3aHluunU69lcs8twc+DaWOUNi0PQZgoMMMIZThdb1s1cSHjmfvJT/nQbAe5Fwv+oIayQwdwmZMTOnukg/GX/AU++TFfMK5XM2OKrgbt6kWjlfh60tDkMv0h8MqNCMaYfRS9ZYFFCjEA8GiptV/r5EeLfD7rjr8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3QigpqVznx78hNNXnfAezyWIg1d61LslOov8evzCuE=;
 b=Gjo5rS8xMnTS90GFPmLFYCGZ/IZgnPBUwjvAxOn+58QUZJcBCtzCe1hkvAggS3nsQv804DFmk3+A5fyKorWtW+5+jFj8sVlUwS+8qrQvOEXdH+iOiRjbD9lnuNudb8X+SzlH3vZBIUzxMwhm2Sr92dCLLd3vNU29ovNyOsMumqa09c/iYuqzNMU8GhIjLhefB8fDiqynYqoE09msQoz+wR+8WcoueQFCW3n+8v9dquO/wSof+rqGQ10i1wc4VCNJjzkFkJrMr2AHLjt4HQ8+F3ccKN/lcLfIUmHs921kDThqNqF8EI3sWVpqBxvO0loMqxhk1mLf3/VOt7bsYprn6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3QigpqVznx78hNNXnfAezyWIg1d61LslOov8evzCuE=;
 b=kVRlOYRYt1VX+QImVfu9jjgFSbKF/30Qucq2ouUkyjG7XdymWSF1YWmJSniA4XVMGCy9EfYxMkRJwLFK2OmbGhPta0NDJsiUauykZDaVaO9ICw25Q6epXjVdMuGnCLY8mqp5oHJVqbny28KcL2Bc061NhEQSTB1w0p2mTBzijdtdXT6kfySiUg/h5T6lPVbjZgVc9SYt3v4e7GmCDVAx/NeJsNA5Vvxy9FmLhkJm8+VKaIrNKc53JzwxzEw1b+Zk8Br6YGypbIPFf5OmdvRR0v3vFtkpF+nPJzleGsyVqzT+vYOaj59Hs3c2A9qGwUvassSdySOIg4cniJHFo513PQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 KL1PR06MB6556.apcprd06.prod.outlook.com (2603:1096:820:f1::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.16; Thu, 14 Aug 2025 14:24:39 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 14:24:39 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Qianfeng Rong <rongqianfeng@vivo.com>
Subject: [PATCH] soundwire: Use min() to improve code
Date: Thu, 14 Aug 2025 22:24:28 +0800
Message-Id: <20250814142428.282639-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:3:17::34) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|KL1PR06MB6556:EE_
X-MS-Office365-Filtering-Correlation-Id: 65a6ecad-6539-4fbd-2f22-08dddb3e4dac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4ai11wXAkFrHQEjrWEmxtqIaLiPQoUwXE2ioF0ZlWXkNVqDHckSgkY6wxDCu?=
 =?us-ascii?Q?djHh5dPTXm5TdHvW1U8CNHn1F3Vxkh1DLQS4qSaKlyEiksZOldOvl776Rc1j?=
 =?us-ascii?Q?uJR+NNnWTr2usNuss1dP+v7gQjNTBG0F5/rspIuLAzUMMJBkaDzECZYwfUng?=
 =?us-ascii?Q?Um594/GbpDeIG6/TCfvs+aPgvwExu6ovyjn5u8j7Mo3ElWQ1rSGkO989A/++?=
 =?us-ascii?Q?PuDFXTz57qsdGdYpu44gO64T3x/cck2Df9B7NaY339wGPyjggWFwpWZ3WDOQ?=
 =?us-ascii?Q?IEvkSHEGbs/ls9todCXdzrbBUwhVdZuZSmkyGRFfGQA/j7DxwDTMOMU0zKHk?=
 =?us-ascii?Q?eCZU3b5DviuFp/tCgFha7EYQAfyLqXxY23AUe5IEctOK+UGvi14i9tFW8vRg?=
 =?us-ascii?Q?B2WESOnqWuHO9zcMzpzkJTUCQxNzfWkbkOUfJeAfu22pvpanxKlZ4RCHIUme?=
 =?us-ascii?Q?jaMDAjqPeDAu6RyZRp6tSlOsq54GIAxjmJWsjXCGTpejuUftOlDbo+CM1H30?=
 =?us-ascii?Q?LgXb4JmOz1iwnMvWZm/CpuU31qw8T5HuT6Gk3ZG5u1wNsL9qqn0XSlYgnRAu?=
 =?us-ascii?Q?1yCDxhFgqKLCb/xszOrO9GJ4C6CRGi29WqM8Csgi3B1oPmnWE83sKf16Lc5D?=
 =?us-ascii?Q?fjQaM3YE3Q7FGAad6Mo2RNYbEMfM6r+mbmlVZv1TG6WMDe+3CBN+W/rfGj4d?=
 =?us-ascii?Q?KuwDoONENGBRE+sEebRHKIIe7Jbw9N7GI7fc5GtdSAo91IrgZcIkPlN/HabH?=
 =?us-ascii?Q?eypXKQscxQlssIKvrxPRyUiEyW6eAGVxEkKVT6S3HusFh6PDxo/HscU0mKNH?=
 =?us-ascii?Q?PnEZMZ1cBZ4AI2yxzpA/78CxX7FbpU7EHs/O0Fvmixot7M6XXiQAiiKClugy?=
 =?us-ascii?Q?LtKE0Q7B1tJaNwl0D8s3zsjo/AYsJgaEGATAaVa8AWEnxsKe1oqLjqj6tbfp?=
 =?us-ascii?Q?qTqgtXkyEJ3TjN1kURKwCbwIzrcKvGimVdeyVZKGB7PZMLAhEXqAcUSicAI1?=
 =?us-ascii?Q?nkphtuHRyEHsjPsbYxmkOYsv203Zkgu3Ku8UeLzNEPx4DRYcvBq6WhBcfST/?=
 =?us-ascii?Q?6bB15oVF8rMcIgW16a3qfZdtU3q9RCbcRrox98t7JEBiX/T7jM0BriQ8QI6h?=
 =?us-ascii?Q?uDL27KjEJkTunDjffiw5adEKNXXloA2fyi7ddVPpSmJ0Rib0wWoSKM7XVn5g?=
 =?us-ascii?Q?s1n5VrZM90RB2eRW9mqkfzInTH8PSj+E+vZB/M1NYeQD/g1DLIg0u50OGPcj?=
 =?us-ascii?Q?hCZX7y81h5CBzdRV7mCoL4q5WrqiYwK6pA1PBx0HGvA12RVOlcG8hoSnU/ox?=
 =?us-ascii?Q?oAwT/1uWkHINeWStVtSROw1NyXLZeyrrRX0MqkR8K6DFVyaQ/+cSQrNQcCBA?=
 =?us-ascii?Q?qzuMkQUokhMdc6dR5q1t+W5pjqLc2Ggi6hicuiWNqu750Brbryt5D/47wJFR?=
 =?us-ascii?Q?HniwcxZLufeM1dgwQW7+W8GHdQsIIa6kiKeWZhgDs6hl3INSBouDaw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IbH40n6kYIMlz7AGGk7vprfQEHTyMyDHNyVyvbhITflYjkNsVtkL7u8ae4Y5?=
 =?us-ascii?Q?3S+K0B0v+u4wtWphWvsFBZwWY04UUy10E0ZA6dyv9P6bThhCqzuIIrdBt/p0?=
 =?us-ascii?Q?GkQmm8fySRbEkI+/0AdqXck4NrIiW5ftlwyslbmTwUnJssJb4W4JHAk0HFYw?=
 =?us-ascii?Q?ZqKB7iyX6oigoilBhHLIC6qWgUfg0GHbEEbLtYetnowNiXJxiRHHXWqwh3jN?=
 =?us-ascii?Q?x/fiRdDHdbwnWUkYL1jE9gKsAu32HqiPruBL4OEf2N/b+zpAKJA40t9OEB17?=
 =?us-ascii?Q?MBE9pR1FW2+SEAPNNLZMz4RMSOQ6hs1ZvdyL2PIemRQOPsICYOIP7/eKGEBz?=
 =?us-ascii?Q?KvjLRqVYdw4bAOaRF8ArHQsL7jEk90AxSMCLgSb3xjRoBZ7sJ4xzt0mZ3r8o?=
 =?us-ascii?Q?Joj9IFjqf2XUjXPXCZ311qc2UCCDA0eJBzOsZ0MDv2KOJ4mVPjIKVk4Xhxp6?=
 =?us-ascii?Q?u0Y3qF1fEtPEmHocRF+2CCUvRQymDd4FmgD7vI3SY25E1I36BLKSeTzunYvN?=
 =?us-ascii?Q?WxUP3pjcFLi1iJP8jmiOnuXc9yubowx4LPzADo3Uk0bxQ/066w2+fo7+LjgO?=
 =?us-ascii?Q?RTchhEWamDvtzvyCu4fyQ0qivpTdp5exUOyutV74WSOypvO1M6sQnANkJowO?=
 =?us-ascii?Q?lZgEmr2ZuN4Z1B67fsO/JlB059tFO5e2lrLdfs9mvPUzSSKsxTA7pgO6Sp8H?=
 =?us-ascii?Q?kBy+0nH122xrm6dY5BApe6cO2f8Ws1g1/RPvs0AmQIm9yYZq1+6+NdReBUMv?=
 =?us-ascii?Q?Mmswf2m9uEvE1EGkHjYktmIgkCB3r1bFgO4YZFo+QpMfWMjpscaHljtSLU5v?=
 =?us-ascii?Q?3/g4XKZHDqSQZaICAUZ4n/Y4RpSh425d7F1AGj7+wr93Qv7HJsNebqoQZAbp?=
 =?us-ascii?Q?MBX4/ZN3CsflEkyLx3mZy+vpNrnEvcr2q7wcd0EwejISeo2SVMl8vTX9SVFT?=
 =?us-ascii?Q?H9MehwLaVyPi2PmM4udzYDG3rQUDZXLUUt6ht4uPrDPg3OJnbuCjWKPNQqal?=
 =?us-ascii?Q?RcbpqUp2csdulZ03wstxo43rSIJhzO1rSrYSUYEjOSgZZIr7aunnufD+L2w2?=
 =?us-ascii?Q?ojEiVIVoD7B7tP0g7CRJlYHtUuwk713U3ySwpnn3kOJPgVkLTqzr4NflCPUJ?=
 =?us-ascii?Q?lf5QEMNCfRq8pK9bnp1tEFBmFlQLVi1p+Hjc4lJJDUyKRd4rc/p01VmY0TGo?=
 =?us-ascii?Q?R7NgCBOjQ5YZgY0x6z4/HVS/CUagI9Xgceb7M7JILPuSZ/wuhF/k4RiqXReg?=
 =?us-ascii?Q?26gBfx9fuX84+D4RjMQvJgADBH6yTgVNcK8CLDu2KMfWDP53VY3vxpbPYJ+p?=
 =?us-ascii?Q?HdNAtSQOzqIlzUIdFfQbx9F5CwKfpv7NQB4hsDZxA+WdL82LGV5Sk8Qo/eW8?=
 =?us-ascii?Q?XdlEVU9C6sXR8TA4trrlE4DSggupPReIbMx1NLI5Vd7RFL/HU3879/2hrU9P?=
 =?us-ascii?Q?oHclTqBHkzhFqg6sHAOcOoZefCXHepdXVMLbh9+HQ1TLrJzwI36jg9ro62O4?=
 =?us-ascii?Q?07rbefjRHCUUi9sxa6A/TLTxVSOVkZRfc90EjvIALuVQnBVZ8uAwVThiOrNR?=
 =?us-ascii?Q?2GtfrO2bnLRJI5xNNhc4qBfHp1FnAIoOkVR97CGA?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65a6ecad-6539-4fbd-2f22-08dddb3e4dac
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 14:24:39.5796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3HcXawn6FDt5kJsRNS37TpJELZUV9DN0nfX2Jy7zNMa/l+YhBAnOza3Kj8KqZKI3HjEFei8IwIcindW3h5JbgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6556

Use min() to reduce the code in qcom_swrm_xfer_msg() and improve its
readability.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 drivers/soundwire/qcom.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index bd2b293b44f2..5b3078220189 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -924,10 +924,7 @@ static enum sdw_command_response qcom_swrm_xfer_msg(struct sdw_bus *bus,
 
 	if (msg->flags == SDW_MSG_FLAG_READ) {
 		for (i = 0; i < msg->len;) {
-			if ((msg->len - i) < QCOM_SWRM_MAX_RD_LEN)
-				len = msg->len - i;
-			else
-				len = QCOM_SWRM_MAX_RD_LEN;
+			len = min(msg->len - i, QCOM_SWRM_MAX_RD_LEN);
 
 			ret = qcom_swrm_cmd_fifo_rd_cmd(ctrl, msg->dev_num,
 							msg->addr + i, len,
-- 
2.34.1


