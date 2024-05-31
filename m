Return-Path: <linux-arm-msm+bounces-21239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 279508D5EEB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 11:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C5B5B22B79
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 09:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E694113DDC0;
	Fri, 31 May 2024 09:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hLqLShCh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C787C6EB;
	Fri, 31 May 2024 09:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717149132; cv=none; b=FUOnHaIMYS4RLVXA/5Hr/DXLzton4Xd1HaY1axyYP/VBsSYXhGV60JGY6+njA3dBjUw/tMN2XrUyBYBX1FsWAkkFvANTeKYDQplNxG+dMyMARUmG9RX7RYuLEyDZwkpRrBj/WzVN/f4A/e+gx2KHfkfW0lLC+Hb1UvGFEE4n/1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717149132; c=relaxed/simple;
	bh=fD7pcsCYMHmL/fnGtdeGAFT6+4sHmZwAWSFvZrWphWU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ldKTNTxfZbK54ZCPe+T3VNOLt+XrXUhnbxhGJBKJdmELFukwJOBbTnftCRHY1latuxUHCIpkvQGGtwuDMYlnwN6Rl7O6LtjanFdOVlpf/mYCuDM3LQNHYvp2N1eCw+ebqZ/lFNAEQVQU1pzqFo/HLg8AnlIOVwSsDcDcUCUDPc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hLqLShCh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V9TDPH012449;
	Fri, 31 May 2024 09:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UrEKz5uP5NleV9C2K/SWe0Xn
	kkr76va19TwD6VVECw0=; b=hLqLShChU2LVN5ZOAqfp5EIJ6i53palUL8UXixW4
	S4Sc7e23K/iAqLbUmB3EhRhr9PnWVIxl2p/Qqw6Rjs9qN3ZyE9EMzNBZoHG0I3tQ
	yrCCy6QnHIDBRuESJVGJSuGGbj3h31ES2+ph8gQqMdcfCpKOfx0KM9RY4pjcbMqr
	NWXpevZEtrSxopfm9DZhPDOw9UpxERfRtXADMUPn9FP5kDwQNWnfsSnm2GIxCdvA
	GAX8DLRmvXM17EB3t84XvTn94CmND7Gswqp3VrJ4YOYlZafGD4iDraUUc55BvX/a
	Smob9+3ktFu9Vfq1e3tl9GE0uhhwEgS7bACWIuAXXzcrEA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0qph5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:52:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44V9q24R003399
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:52:02 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 31 May 2024 02:51:59 -0700
From: Taniya Das <quic_tdas@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <quic_jkona@quicinc.com>, <quic_imrashai@quicinc.com>,
        Taniya Das
	<quic_tdas@quicinc.com>
Subject: [PATCH v3 1/3] clk: qcom: sc7280: Update the transition delay for GDSC
Date: Fri, 31 May 2024 15:21:40 +0530
Message-ID: <20240531095142.9688-2-quic_tdas@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240531095142.9688-1-quic_tdas@quicinc.com>
References: <20240531095142.9688-1-quic_tdas@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UIBpKpIrq24WwqAMIwTtY7D5hoRzH122
X-Proofpoint-ORIG-GUID: UIBpKpIrq24WwqAMIwTtY7D5hoRzH122
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_06,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=903 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310072

Add support to update the GDSC transition delay values to avoid
the GDSC FSM state stuck issues without which it could lead to GDSC
power on/off failures.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 drivers/clk/qcom/camcc-sc7280.c   | 19 +++++++++++++++++++
 drivers/clk/qcom/gcc-sc7280.c     | 10 ++++++++++
 drivers/clk/qcom/gpucc-sc7280.c   |  7 +++++++
 drivers/clk/qcom/videocc-sc7280.c |  7 +++++++
 4 files changed, 43 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sc7280.c b/drivers/clk/qcom/camcc-sc7280.c
index d89ddb2298e3..27bfb0f959c4 100644
--- a/drivers/clk/qcom/camcc-sc7280.c
+++ b/drivers/clk/qcom/camcc-sc7280.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/clk-provider.h>
@@ -2247,6 +2248,9 @@ static struct clk_branch cam_cc_sleep_clk = {
 
 static struct gdsc cam_cc_titan_top_gdsc = {
 	.gdscr = 0xc194,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "cam_cc_titan_top_gdsc",
 	},
@@ -2256,6 +2260,9 @@ static struct gdsc cam_cc_titan_top_gdsc = {
 
 static struct gdsc cam_cc_bps_gdsc = {
 	.gdscr = 0x7004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "cam_cc_bps_gdsc",
 	},
@@ -2265,6 +2272,9 @@ static struct gdsc cam_cc_bps_gdsc = {
 
 static struct gdsc cam_cc_ife_0_gdsc = {
 	.gdscr = 0xa004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "cam_cc_ife_0_gdsc",
 	},
@@ -2274,6 +2284,9 @@ static struct gdsc cam_cc_ife_0_gdsc = {
 
 static struct gdsc cam_cc_ife_1_gdsc = {
 	.gdscr = 0xb004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "cam_cc_ife_1_gdsc",
 	},
@@ -2283,6 +2296,9 @@ static struct gdsc cam_cc_ife_1_gdsc = {
 
 static struct gdsc cam_cc_ife_2_gdsc = {
 	.gdscr = 0xb070,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "cam_cc_ife_2_gdsc",
 	},
@@ -2292,6 +2308,9 @@ static struct gdsc cam_cc_ife_2_gdsc = {
 
 static struct gdsc cam_cc_ipe_0_gdsc = {
 	.gdscr = 0x8004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "cam_cc_ipe_0_gdsc",
 	},
diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
index f45a8318900c..c622cd9a9d24 100644
--- a/drivers/clk/qcom/gcc-sc7280.c
+++ b/drivers/clk/qcom/gcc-sc7280.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/clk-provider.h>
@@ -3094,6 +3095,9 @@ static struct clk_branch gcc_wpss_rscp_clk = {
 
 static struct gdsc gcc_pcie_0_gdsc = {
 	.gdscr = 0x6b004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "gcc_pcie_0_gdsc",
 	},
@@ -3112,6 +3116,9 @@ static struct gdsc gcc_pcie_1_gdsc = {
 
 static struct gdsc gcc_ufs_phy_gdsc = {
 	.gdscr = 0x77004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "gcc_ufs_phy_gdsc",
 	},
@@ -3121,6 +3128,9 @@ static struct gdsc gcc_ufs_phy_gdsc = {
 
 static struct gdsc gcc_usb30_prim_gdsc = {
 	.gdscr = 0xf004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "gcc_usb30_prim_gdsc",
 	},
diff --git a/drivers/clk/qcom/gpucc-sc7280.c b/drivers/clk/qcom/gpucc-sc7280.c
index 35b394feb68d..ebda57eac979 100644
--- a/drivers/clk/qcom/gpucc-sc7280.c
+++ b/drivers/clk/qcom/gpucc-sc7280.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/clk-provider.h>
@@ -379,6 +380,9 @@ static struct clk_branch gpu_cc_sleep_clk = {
 
 static struct gdsc cx_gdsc = {
 	.gdscr = 0x106c,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
 	.gds_hw_ctrl = 0x1540,
 	.pd = {
 		.name = "cx_gdsc",
@@ -389,6 +393,9 @@ static struct gdsc cx_gdsc = {
 
 static struct gdsc gx_gdsc = {
 	.gdscr = 0x100c,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
 	.clamp_io_ctrl = 0x1508,
 	.pd = {
 		.name = "gx_gdsc",
diff --git a/drivers/clk/qcom/videocc-sc7280.c b/drivers/clk/qcom/videocc-sc7280.c
index cdd59c6f60df..119a3ed6eb6a 100644
--- a/drivers/clk/qcom/videocc-sc7280.c
+++ b/drivers/clk/qcom/videocc-sc7280.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/clk-provider.h>
@@ -232,6 +233,9 @@ static struct clk_branch video_cc_venus_ahb_clk = {
 
 static struct gdsc mvs0_gdsc = {
 	.gdscr = 0x3004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
 	.pd = {
 		.name = "mvs0_gdsc",
 	},
@@ -241,6 +245,9 @@ static struct gdsc mvs0_gdsc = {
 
 static struct gdsc mvsc_gdsc = {
 	.gdscr = 0x2004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
 	.pd = {
 		.name = "mvsc_gdsc",
 	},
-- 
2.17.1


