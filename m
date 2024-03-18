Return-Path: <linux-arm-msm+bounces-14323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EB687E336
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 06:37:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 374231C20C2A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 05:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C0D21360;
	Mon, 18 Mar 2024 05:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LnrmpCeP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10B021345;
	Mon, 18 Mar 2024 05:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710740229; cv=none; b=EXTGmVJqpCY9cqqPYqqVwGKhHQi5VRf65c4gVm8loGgCJmOL0aAemDgzvY2FrgNLoCrGc3xDnN+799MS8Jl/nnsVtPCuPkLGsOtlNjRRtF18lquMVOK74p5fLeD5RrIHHukaDg2gYcEFxaRbc6d+36iJt3PCso5nbojuastwZzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710740229; c=relaxed/simple;
	bh=2P/D0UAJXB++zbC/s5FYefsvMz6MzaeqHBHMusRoi44=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PtqM6gZXshbEIQ6eqTmO9sijTcX4r++zDnkoZJ+fbj5R0a4ZWis38eVkzHRdvb7CWpKyv9O7pTR0kAcE04e2HDr2EriKr6s3vZuK+NoLJZeJxoxcunaInBk/3Ams3aqx3idvx6aYVgKfSz3BRSQKIFD1QF8JN+Zzf0B1MR5BUhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LnrmpCeP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42I3SSNs025531;
	Mon, 18 Mar 2024 05:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=pSFtbrfAiZr3Lt5/2erP
	7rf2wnb7cO5ex5AEAl2ra1s=; b=LnrmpCePlwtBZ2k0iIzxeccvDPHjeAcVn7Fu
	cqmYlEhNAEPmTfeRfkSg6tLGM0kxS4YFZuklYwlld4SCHhLWKAhRKRT7zeL1CKs5
	64y0uuSAyHRbiScHFBLdIr/XZxIB+qQf2xQhpFCXA8QWP3krOjw8xII5bWkBMY1O
	L5cNjA2AfBduXOsr/mtW9+RB02oMGdQAClm0OewLmz+xgIEBZ6ToOhX3XJIuc7fR
	tMdn8O1hF7GvzR/i74x8oXw5LUvw7EGso3AGLKA1CmQkBu+UpRdJzFmMjhhioG5J
	uk36Ic8neM0A3FLtkpbwHR0QEfCIJeYbWhu8NVn1Zf0Ahg1JCw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wwxtb14hy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Mar 2024 05:37:02 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42I5b1tl014709
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Mar 2024 05:37:01 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 17 Mar 2024 22:36:57 -0700
From: Taniya Das <quic_tdas@quicinc.com>
To: Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?=
	<mturquette@baylibre.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Taniya Das <quic_tdas@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 4/8] clk: qcom: sc7280: Update the transition delay for GDSC
Date: Mon, 18 Mar 2024 11:05:51 +0530
Message-ID: <20240318053555.20405-5-quic_tdas@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240318053555.20405-1-quic_tdas@quicinc.com>
References: <20240318053555.20405-1-quic_tdas@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qTZ1NfWlq3RaqHcypOh-Kqr7D2i64LZw
X-Proofpoint-ORIG-GUID: qTZ1NfWlq3RaqHcypOh-Kqr7D2i64LZw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-17_12,2024-03-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 mlxlogscore=893
 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403140001
 definitions=main-2403180040

Update the GDSC default values of GDSC transition delay to avoid the
issues in the GDSC FSM state.

Fixes: fae7617bb142 ("clk: qcom: Add video clock controller driver for SC7280")
Fixes: 1daec8cfebc2 ("clk: qcom: camcc: Add camera clock controller driver for SC7280")
Fixes: a3cc092196ef ("clk: qcom: Add Global Clock controller (GCC) driver for SC7280")
Fixes: 3e0f01d6c7e7 ("clk: qcom: Add graphics clock controller driver for SC7280")
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


