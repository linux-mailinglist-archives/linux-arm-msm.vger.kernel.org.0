Return-Path: <linux-arm-msm+bounces-71674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED204B40B49
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 18:57:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8EE437AC6E6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 16:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B3733CEB7;
	Tue,  2 Sep 2025 16:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=semtech.com header.i=@semtech.com header.b="R/HjUtPA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=SemtechCorp.onmicrosoft.com header.i=@SemtechCorp.onmicrosoft.com header.b="r8zUZGk8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail1.bemta40.messagelabs.com (mail1.bemta40.messagelabs.com [67.219.247.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC8E33EAF3;
	Tue,  2 Sep 2025 16:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.219.247.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756832218; cv=fail; b=N7AjcrMhpVt6mN9Nt4SFmhD8CLr7F/hxsWnzCRqR/mFUr4NFv755XApE/uuPL8+uC3LScrDeUa1jT12pE0Yzk6T5K9S1GAZJ/prb7ul8PNvqIqibWrw9FUib5XuZIF7Eqgch9JNxmw22qvmlo3ICs8+DPjJR9//R9I6wZ3vWpcM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756832218; c=relaxed/simple;
	bh=UrzNuERjNIN4VPLLFJ1Sb7BMYWKze3yX1DMxfL7E1oc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=o1WKvDvopzbn7u2xwHL0VDXxRNAhHGlbsaG06c03rsyp8dP7BVzuvu30kDLTdL7v6U3dDMAGp+rtQFe6s0UCUflrQ4dyYzd8QAZfZfXNS1CX9dyVzDiy+o39lzONTVPW+YFu1Y1R3pLzfWq4sSwMOhUy8ItP7SaQA8rs1rcp+lU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=semtech.com; spf=pass smtp.mailfrom=semtech.com; dkim=pass (2048-bit key) header.d=semtech.com header.i=@semtech.com header.b=R/HjUtPA; dkim=fail (1024-bit key) header.d=SemtechCorp.onmicrosoft.com header.i=@SemtechCorp.onmicrosoft.com header.b=r8zUZGk8 reason="signature verification failed"; arc=fail smtp.client-ip=67.219.247.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=semtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=semtech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=semtech.com; s=k1;
	t=1756832214; i=@semtech.com;
	bh=L1QUH3q5oKS00cIH4fmjxCiSFjCCQX/LfLnYyvCrInw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=R/HjUtPArrtuA0CZbXaS7sx6Bba/iqSsYsx6R7PyHFNhuc+xXGzCCT3Mpl8qzw16d
	 f2E6d/gYA5091sgY1vSrLANG2NJexfqV4yLelYdglGT5CjGXRybR+J75b637P/S1Su
	 HdorsWFOUUeAngIUNgdHYZI/MmvmdpGsnX6gWA36Dp51d4Rye8tcYdqijWhaXmb4tH
	 utrSJVX08qdccVw+IbNtZZUOrCw3I6Phs/vQ95tspsbBih9XqwIcg3Yaz0bnhhJuvY
	 G6fCjWZShnnalNdHkVL5lvcU7UosLSWah9YzIsVHtUIhOFJ9jLaq7HPINWeSMKoaSm
	 nHfro0U4KTCiQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHJsWRWlGSWpSXmKPExsWikR3frntNcXu
  GwcfpzBYT959lt7i8aw6bA5PH501yAYxRrJl5SfkVCawZGzYdZS34zFPxf9NZlgbGL1xdjFwc
  jALLmCUWzZ3EBuEsZpW4sP0fC4QzjUnicdNZJhCHRWA7s8TL6wsYQRwhgcVMErP3fmCFcFYyS
  XzY+R+sTELgKKPEpc8TWSAyZxklbjX/Z4dwbjFKPDo0E8qZxCgxfcE5oAGcHGwCihKtX06D9Y
  sIXGKUOP5uKRNIgllAS+Ln45uMILawQKBE598NbCA2i4CqxJVFO8GaeQVMJR5NfgkWlxCQl1i
  8YzkzRFxQ4uTMJywQc+QlmrfOBosLCchKrJjQC1UfLPH40Fd2CFtS4trNC1C2rMTRs3NYIGxn
  ia8nVkLdIyFx8MULoDkcQHFfiUXvwiFK5CRO9Z5jgjlh58bbUK0hEv3LuqFG3uGX6P9RDAmjZ
  4wS8x9eZIRIyEi0X17AOoFRYxaSs2chOXsWktULGJlXMZoWpxaVpRbpGhroJRVlpmeU5CZm5u
  glVukm6ZUW66YmFpcY6qUnF+ilFhfrFVfmJuek6OWllmxiBCYVrg8RU3YwPj7RrH+IUZKDSUm
  UV+LKtgwhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKEry2ctszhASLUtNTK9Iyc4AJDiYtwcGjJMLL
  dASolbe4IDG3ODMdInWKUZfj+8GTe5mFWPLy81KlxHmZFIBmCIAUZZTmwY2AJdtLjLJSwryMD
  AwMQjwFqUW5mSWo8q8YxTkYlYR5H4NM4cnMK4Hb9AroCCagIxa+3wxyREkiQkqqgUlrjfenyJ
  Tk63uLJET+9hZ+3xz+3i5t+9YcDq5La/OUxKfV5Fw7Mn9qWtIMEZNvwZPFd+5dl9eZfzeBafu
  aNLd7nRdyd3TX9BQvlNxlJO1yQjHrsK26++wTn86aTLf7HdR5Neq6IXu0FI+orrTyR32dbysv
  nAn9I7XLZkvBm3O8B1lVnL99vcXtuSToCZPsnjnK1/5qJIlcmbIh29eSQ1R4Ru48nuVsLU6tm
  wLuv5+6d6HXVv6iKDMhob+/GI4ceOi7ur3y6a4N0bOt/ir81Crw7/rTMnnRyj1G05OfHlQzku
  EuXbxt9f9721/YHQjbarDEyb/8pJSia/2Sia6/FEKeNvz1epV6Wsq2oqzbTVGJpTgj0VCLuag
  4EQCq4s4nMQQAAA==
X-Env-Sender: zxue@semtech.com
X-Msg-Ref: server-3.tower-929.messagelabs.com!1756832213!32125!1
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received:
X-StarScan-Version: 9.118.2; banners=semtech.com,-,-
X-VirusChecked: Checked
Received: (qmail 20836 invoked from network); 2 Sep 2025 16:56:53 -0000
Received: from mail-dm3nam02on2135.outbound.protection.outlook.com (HELO NAM02-DM3-obe.outbound.protection.outlook.com) (40.107.95.135)
  by server-3.tower-929.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 2 Sep 2025 16:56:53 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zCIZtZlxRegDNFDHblXEXeOLCk2kFSYoSbHk6p8Ho/sAaS7BALcy/WV3dENaqCGo6uBE5yHalbDzjlSBTdfQ7bXRqSdzwvYqiNMFRiw6fWJtWogw0aGrbj8PAArtLH6cM7Bc6FqX9+TXncYKHT6EoViDMdkKJ2GOVluJspS+7Md4Zfj9tC7Do8c8K8FD47nndrJobLjgSU4JpcJsvRaEQhG13arGO8NY9s1UeB3/qm0PeCB450aDScKqEobgpaGyBJlhz/y/6RUt9mNNXxmiBG0jW0zJ53EgL6NB0wjOXLJ5SqXZS7KYP/u7dIKuDcSC+3nWPobDGhUl2wnb5+boxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hAIwUHMkEY4dp7YAVO/829FOMZlx+2CU9KcYXh2MonM=;
 b=JQC5InJtTgj8/JS4f9xr7UElj7pWf85pPwyTctTa3zNjoB2KlZ5pdPJmZzfnzRZOPJyTZUia//VaJX+bGspJO//cryO6q+pQbvB1NoaUmfg3bZ1yUK6bqDViNqOr549L7J+/qc13S/HA8ZWkXRVmixVyD62xRXyNA+rm/lhPLt7r0MTNqqsG5DtxlZ5o88hI59wuEAEe44BxDgSfBjjvd1BcNXIee6EL2yR0ST6VQ7keJd2BJyqfJOyj0BQ/tRjywGp6L3sdfIWPPHZ6Zi8EqQMZq+0StlRS5ID9dtF6G1GESIhBa/1IsHBWnU0NdqmnacD47oyMfsYXLMCo9mlUVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 38.104.251.66) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=semtech.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=semtech.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=SemtechCorp.onmicrosoft.com; s=selector1-SemtechCorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hAIwUHMkEY4dp7YAVO/829FOMZlx+2CU9KcYXh2MonM=;
 b=r8zUZGk8ZO64PsX1hf4AVtAa5DmXHs5Ix6LC7vAINqbnuifswZPL+FPXsTjbcMGtsJMxO9FDIAZIUaITpFX1WUFs8GmtiHwZ6hH2AhYYQYP9c/3dQI8D5hHUvyI82Hm1bzTCU/xMoOK7VaauUBdKiu1ZwOkSJLx2YHT4TscYcxY=
Received: from MW4PR03CA0125.namprd03.prod.outlook.com (2603:10b6:303:8c::10)
 by CH1PPF7119C8A35.namprd20.prod.outlook.com (2603:10b6:61f:fc00::694) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.29; Tue, 2 Sep
 2025 16:56:51 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:303:8c:cafe::a2) by MW4PR03CA0125.outlook.office365.com
 (2603:10b6:303:8c::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Tue,
 2 Sep 2025 16:56:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 38.104.251.66)
 smtp.mailfrom=semtech.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=semtech.com;
Received-SPF: Pass (protection.outlook.com: domain of semtech.com designates
 38.104.251.66 as permitted sender) receiver=protection.outlook.com;
 client-ip=38.104.251.66; helo=CA07RELAY1.semtech.com; pr=C
Received: from CA07RELAY1.semtech.com (38.104.251.66) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server id 15.20.9094.14 via Frontend Transport; Tue, 2 Sep 2025 16:56:50
 +0000
Received: from ca08gitmail.local ([10.23.50.249]) by CA07RELAY1.semtech.com with Microsoft SMTPSVC(10.0.20348.1);
	 Tue, 2 Sep 2025 12:56:49 -0400
From: Adam Xue <zxue@semtech.com>
To: mani@kernel.org,
	jeff.hugo@oss.qualcomm.com,
	quic_yabdulra@quicinc.com,
	chentao@kylinos.cn,
	quic_mattleun@quicinc.com,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: zxue@semtech.com,
	imocanu@semtech.com
Subject: [PATCH v1] bus: mhi: host: Fix potential kernel panic by calling dev_err
Date: Tue,  2 Sep 2025 09:56:35 -0700
Message-ID: <20250902165635.18951-1-zxue@semtech.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 02 Sep 2025 16:56:50.0055 (UTC) FILETIME=[9358D970:01DC1C2A]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|CH1PPF7119C8A35:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8e90619e-7852-4b0e-7f3c-08ddea41b629
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?a1DEtnVs3HUbRr2svf2+wgCI3mUwvESztP3CLHwQflII53K4Ez4vnhHI9Tu5?=
 =?us-ascii?Q?tp0nrb1iwZKjfh1OUsuRkcaHhAyZIUgd4z+byYIeLIHEgwfuuKyXtkAvzdUt?=
 =?us-ascii?Q?VThDkiu4DX3diFHK7i2Cof99VwD4Ew8rdiSuaQkQOUdUkrQB9NJMx3gg1qG6?=
 =?us-ascii?Q?c/xPBdnk7fG3u34ah4CPZsOd4FJmP5nQ72iTaB+a5ieHCkGR28n1kkW76zn8?=
 =?us-ascii?Q?qVKVn9SPHzlfWNwyMhYRLUE3cyknEqZODhkqWaAPy7eIyRXR+3UKlhzFW588?=
 =?us-ascii?Q?1sr7nVuHgEj9IQmyGURzE2s+adjZdZ+0RvrHykbkAe5PPibx10cNIUeRrvHO?=
 =?us-ascii?Q?skAgbchw1gM3SCf90BR0znWX73m4EbYofrZr/Xzoy4aja0lQrwQEyGahqoaD?=
 =?us-ascii?Q?iQC15wVw4MeeC0yIS1QkCOcwoglncv0pv1zgBOxd2vbV2D2x2R0/378ZS4zb?=
 =?us-ascii?Q?q042t1404qmrfTNBRx1hW6cQ7OhKzdsELSpWkZZZPiU6SvU2fLhDqJnwIY3d?=
 =?us-ascii?Q?/+oiZnvySXwmScwfFW8ydmW8Nq7eYgWaErXE4buCYl1OAzrdDsraf9dOxudT?=
 =?us-ascii?Q?tc7XrrLe7weU5bfeT/1RpMgWFXeozOXbk/je4R1mn9+xYX7yTYV7m6JQNXRF?=
 =?us-ascii?Q?0KXRziVpm9239z7etnqCEnC1XPHhh6J9HT0Zb4By3Hh5+OMirjvG0SofuOG/?=
 =?us-ascii?Q?3MBGI6cfUtHec2s9/en41rKUohKjZWJw6LoQQEtrR7AnRm2dhRM9+TC+uaWB?=
 =?us-ascii?Q?vFjm9Td+XuoFa1Sb0+/4d38j4nUjuF6h2DXOYyXhr2QhbVdD770EPcG3C50J?=
 =?us-ascii?Q?05FWifOavD0Jmd+NV6jhHHdbblSc4z9Hjii1ajm6rgtUMDujKcbVhVzP9ZL/?=
 =?us-ascii?Q?EFwbwYjE8El17XaxeofVWfbM0K7RstD+vzLz7Ps2UeNFKO9bh1r9Rja9Ew+X?=
 =?us-ascii?Q?oU0NzqGBFJSAkjFY1o2Ah4XUN/GAeLOb0YEN4pTCcUxa6LdOZ1StBkskOZI6?=
 =?us-ascii?Q?WPdF1uY3hNdbYhIOkCb1JbLR+NvLVerqcyJ2iQKQ5LQLZj9NvT0Ll8m3sLpc?=
 =?us-ascii?Q?wJw1Pm70rR41MWot0Ldwspxgta1x5kUDIUHtNh59TmQUSt84E7p6e3jdhfpl?=
 =?us-ascii?Q?Nrb5fRQYh44DC2Q7g5Gpt9xZwn3387/Ci8+EOm1O31+8096NwmbDJeNOgSCL?=
 =?us-ascii?Q?7I1OADuuJ01EHMnARAIV9WtqiU085k2AVe0JMUxDtO48tyYDwnlSQA+j5q3F?=
 =?us-ascii?Q?W+uK5w2ObYJk5cjxsGQcfj5mJp8ck2nR1k2/F1mLfPrUWwFEaFYqy+wqWzn1?=
 =?us-ascii?Q?vmNOsQE8voWiFC2AGN1RNLsy1p9yy+ymDQe8HTKSeMmHzbPYXa30Ja3y5adK?=
 =?us-ascii?Q?wLKSzs1K4cxuMcpfJJdKAmkXHW9vmEdpIyLCC9NWFelE3ooEUFTWAxX2KM7O?=
 =?us-ascii?Q?WfjTVo9b0mEiDpV8L6jV46p2/jEcQHfaaKHPK2idLzlhF67Jb4eMPaFMpzjJ?=
 =?us-ascii?Q?5BjxTVNCTGKiNpBGpPwK4/KS+5dFBWExpLsx?=
X-Forefront-Antispam-Report:
	CIP:38.104.251.66;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CA07RELAY1.semtech.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: semtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 16:56:50.4152
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e90619e-7852-4b0e-7f3c-08ddea41b629
X-MS-Exchange-CrossTenant-Id: b105310d-dc1a-4d6e-bf0d-b11c10c47b0f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=b105310d-dc1a-4d6e-bf0d-b11c10c47b0f;Ip=[38.104.251.66];Helo=[CA07RELAY1.semtech.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF7119C8A35

In mhi_init_irq_setup, the device pointer used for dev_err
was not initialized. Use the pointer from pci_dev instead.

Signed-off-by: Adam Xue <zxue@semtech.com>
---
 drivers/bus/mhi/host/init.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 13e7a55f54ff..93eddf302a49 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -18,6 +18,7 @@
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 #include <linux/wait.h>
+#include <linux/pci.h>
 #include "internal.h"
 
 #define CREATE_TRACE_POINTS
@@ -194,7 +195,7 @@ void mhi_deinit_free_irq(struct mhi_controller *mhi_cntrl)
 int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
 {
 	struct mhi_event *mhi_event = mhi_cntrl->mhi_event;
-	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
 	unsigned long irq_flags = IRQF_SHARED | IRQF_NO_SUSPEND;
 	int i, ret;
 
@@ -221,7 +222,7 @@ int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
 			continue;
 
 		if (mhi_event->irq >= mhi_cntrl->nr_irqs) {
-			dev_err(dev, "irq %d not available for event ring\n",
+			dev_err(&pdev->dev, "irq %d not available for event ring\n",
 				mhi_event->irq);
 			ret = -EINVAL;
 			goto error_request;
@@ -232,7 +233,7 @@ int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
 				  irq_flags,
 				  "mhi", mhi_event);
 		if (ret) {
-			dev_err(dev, "Error requesting irq:%d for ev:%d\n",
+			dev_err(&pdev->dev, "Error requesting irq:%d for ev:%d\n",
 				mhi_cntrl->irq[mhi_event->irq], i);
 			goto error_request;
 		}
-- 
2.43.0


To view our privacy policy, including the types of personal information we collect, process and share, and the rights and options you have in this respect, see www.semtech.com/legal.

