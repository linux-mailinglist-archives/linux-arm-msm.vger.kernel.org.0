Return-Path: <linux-arm-msm+bounces-21208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC6F8D5D74
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 11:04:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B53E4286994
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 09:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 347D91369B9;
	Fri, 31 May 2024 09:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HEyENmjW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D18C15622E;
	Fri, 31 May 2024 09:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717146221; cv=none; b=dez7aEEGJof9VJ9mr1jqxqFTr/CoVTHg9z7UHVb3PjwrARrLJjXRX9DQca6Bdkl8tiktoMinJe9lfyIP60KEb/kHroTIRUq6z45REHl6wlH+phUZUEGXnByg10EwftEYHRJM1AhUtWuQlMvcLbaifPKBru5w3SN+g9arLYFZ2TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717146221; c=relaxed/simple;
	bh=Dwa/yudeZPPwe6Zd6U9MyUaQ4stDgnvNjRq39VmDKP0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sNYjEkaDLZJRa51wZNjwTSUCX6BN2l7TmagBCuVhwfDvvHp/s3ZT8sWBvMRckvtM3AV0mcRvKcFvPXDIr018+s4JQOHqUMlncrA1WyV04GPtKzBLdDI4XtEGPyf6fqcXIcww1xTtgP73z9X34MkmpgCEq6svTYisBgvldl7o7ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HEyENmjW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V7v6Yx006748;
	Fri, 31 May 2024 09:03:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/dd1lmapM45Z5cAG1ULGFgr6
	D8q0fHXCJw2lPgJf0eU=; b=HEyENmjWbcfvQu6tQju0XGNP0RX98Apu+U16yL6W
	bSWhPDamnrEyf0GNCaZEEW/yBv16RUQYH2SgNQ/W8J3RFWY36SyhINrZAXbiwYJ1
	NtL6ZsBtKY56i6PsUg92dKmz3hNJyNvO6rkKUOpj47U4KCxoltbtKivCkITQTdPU
	Kp/Kmj4yIDZB8ioD7hdgsoyhZVaaCifAN0HtmSJXTh/j9U4RssRYmD323/0eONlV
	OR5fhK2AstDee+jlVj7+Dm+OhTlJbei/csRL61iBiTH23CsztQt5UfqnN4BSLI0G
	EAm0r0Kzkxe4acP1QhqcLGbn/z72Rf4yi4b513RpQIoCbw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ybadxeg8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:03:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44V93Xib003397
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:03:33 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 31 May 2024 02:03:28 -0700
From: Taniya Das <quic_tdas@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_jkona@quicinc.com>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH 01/13] clk: qcom: gcc-sa8775p: Remove support for UFS hw ctl clocks
Date: Fri, 31 May 2024 14:32:37 +0530
Message-ID: <20240531090249.10293-2-quic_tdas@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240531090249.10293-1-quic_tdas@quicinc.com>
References: <20240531090249.10293-1-quic_tdas@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8a1eK-Bv6TvA0bbUcHj4rVgJdwdemc3N
X-Proofpoint-GUID: 8a1eK-Bv6TvA0bbUcHj4rVgJdwdemc3N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_05,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2405310066

The UFS hw ctl clocks are not being used on SA8775P, hence remove
support for the same.

Fixes: 08c51ceb12f7 ("clk: qcom: add the GCC driver for sa8775p")
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 drivers/clk/qcom/gcc-sa8775p.c | 111 +--------------------------------
 1 file changed, 2 insertions(+), 109 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sa8775p.c b/drivers/clk/qcom/gcc-sa8775p.c
index 5bcbfbf52cb9..7bb7aa3a7be5 100644
--- a/drivers/clk/qcom/gcc-sa8775p.c
+++ b/drivers/clk/qcom/gcc-sa8775p.c
@@ -1,14 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2021-2022, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2022, 2024, Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2023, Linaro Limited
  */
 
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
-#include <linux/err.h>
-#include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -1737,26 +1735,6 @@ static struct clk_branch gcc_aggre_ufs_phy_axi_clk = {
 	},
 };
 
-static struct clk_branch gcc_aggre_ufs_phy_axi_hw_ctl_clk = {
-	.halt_reg = 0x830d4,
-	.halt_check = BRANCH_HALT_VOTED,
-	.hwcg_reg = 0x830d4,
-	.hwcg_bit = 1,
-	.clkr = {
-		.enable_reg = 0x830d4,
-		.enable_mask = BIT(1),
-		.hw.init = &(const struct clk_init_data){
-			.name = "gcc_aggre_ufs_phy_axi_hw_ctl_clk",
-			.parent_hws = (const struct clk_hw*[]){
-				&gcc_ufs_phy_axi_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_aggre_usb2_prim_axi_clk = {
 	.halt_reg = 0x1c05c,
 	.halt_check = BRANCH_HALT_VOTED,
@@ -3809,26 +3787,6 @@ static struct clk_branch gcc_ufs_phy_axi_clk = {
 	},
 };
 
-static struct clk_branch gcc_ufs_phy_axi_hw_ctl_clk = {
-	.halt_reg = 0x83018,
-	.halt_check = BRANCH_HALT_VOTED,
-	.hwcg_reg = 0x83018,
-	.hwcg_bit = 1,
-	.clkr = {
-		.enable_reg = 0x83018,
-		.enable_mask = BIT(1),
-		.hw.init = &(const struct clk_init_data){
-			.name = "gcc_ufs_phy_axi_hw_ctl_clk",
-			.parent_hws = (const struct clk_hw*[]){
-				&gcc_ufs_phy_axi_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_ufs_phy_ice_core_clk = {
 	.halt_reg = 0x8306c,
 	.halt_check = BRANCH_HALT_VOTED,
@@ -3849,26 +3807,6 @@ static struct clk_branch gcc_ufs_phy_ice_core_clk = {
 	},
 };
 
-static struct clk_branch gcc_ufs_phy_ice_core_hw_ctl_clk = {
-	.halt_reg = 0x8306c,
-	.halt_check = BRANCH_HALT_VOTED,
-	.hwcg_reg = 0x8306c,
-	.hwcg_bit = 1,
-	.clkr = {
-		.enable_reg = 0x8306c,
-		.enable_mask = BIT(1),
-		.hw.init = &(const struct clk_init_data){
-			.name = "gcc_ufs_phy_ice_core_hw_ctl_clk",
-			.parent_hws = (const struct clk_hw*[]){
-				&gcc_ufs_phy_ice_core_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_ufs_phy_phy_aux_clk = {
 	.halt_reg = 0x830a4,
 	.halt_check = BRANCH_HALT_VOTED,
@@ -3889,26 +3827,6 @@ static struct clk_branch gcc_ufs_phy_phy_aux_clk = {
 	},
 };
 
-static struct clk_branch gcc_ufs_phy_phy_aux_hw_ctl_clk = {
-	.halt_reg = 0x830a4,
-	.halt_check = BRANCH_HALT_VOTED,
-	.hwcg_reg = 0x830a4,
-	.hwcg_bit = 1,
-	.clkr = {
-		.enable_reg = 0x830a4,
-		.enable_mask = BIT(1),
-		.hw.init = &(const struct clk_init_data){
-			.name = "gcc_ufs_phy_phy_aux_hw_ctl_clk",
-			.parent_hws = (const struct clk_hw*[]){
-				&gcc_ufs_phy_phy_aux_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_ufs_phy_rx_symbol_0_clk = {
 	.halt_reg = 0x83028,
 	.halt_check = BRANCH_HALT_DELAY,
@@ -3983,26 +3901,6 @@ static struct clk_branch gcc_ufs_phy_unipro_core_clk = {
 	},
 };
 
-static struct clk_branch gcc_ufs_phy_unipro_core_hw_ctl_clk = {
-	.halt_reg = 0x83064,
-	.halt_check = BRANCH_HALT_VOTED,
-	.hwcg_reg = 0x83064,
-	.hwcg_bit = 1,
-	.clkr = {
-		.enable_reg = 0x83064,
-		.enable_mask = BIT(1),
-		.hw.init = &(const struct clk_init_data){
-			.name = "gcc_ufs_phy_unipro_core_hw_ctl_clk",
-			.parent_hws = (const struct clk_hw*[]){
-				&gcc_ufs_phy_unipro_core_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_usb20_master_clk = {
 	.halt_reg = 0x1c018,
 	.halt_check = BRANCH_HALT,
@@ -4379,7 +4277,6 @@ static struct clk_regmap *gcc_sa8775p_clocks[] = {
 	[GCC_AGGRE_NOC_QUPV3_AXI_CLK] = &gcc_aggre_noc_qupv3_axi_clk.clkr,
 	[GCC_AGGRE_UFS_CARD_AXI_CLK] = &gcc_aggre_ufs_card_axi_clk.clkr,
 	[GCC_AGGRE_UFS_PHY_AXI_CLK] = &gcc_aggre_ufs_phy_axi_clk.clkr,
-	[GCC_AGGRE_UFS_PHY_AXI_HW_CTL_CLK] = &gcc_aggre_ufs_phy_axi_hw_ctl_clk.clkr,
 	[GCC_AGGRE_USB2_PRIM_AXI_CLK] = &gcc_aggre_usb2_prim_axi_clk.clkr,
 	[GCC_AGGRE_USB3_PRIM_AXI_CLK] = &gcc_aggre_usb3_prim_axi_clk.clkr,
 	[GCC_AGGRE_USB3_SEC_AXI_CLK] = &gcc_aggre_usb3_sec_axi_clk.clkr,
@@ -4569,13 +4466,10 @@ static struct clk_regmap *gcc_sa8775p_clocks[] = {
 	[GCC_UFS_PHY_AHB_CLK] = &gcc_ufs_phy_ahb_clk.clkr,
 	[GCC_UFS_PHY_AXI_CLK] = &gcc_ufs_phy_axi_clk.clkr,
 	[GCC_UFS_PHY_AXI_CLK_SRC] = &gcc_ufs_phy_axi_clk_src.clkr,
-	[GCC_UFS_PHY_AXI_HW_CTL_CLK] = &gcc_ufs_phy_axi_hw_ctl_clk.clkr,
 	[GCC_UFS_PHY_ICE_CORE_CLK] = &gcc_ufs_phy_ice_core_clk.clkr,
 	[GCC_UFS_PHY_ICE_CORE_CLK_SRC] = &gcc_ufs_phy_ice_core_clk_src.clkr,
-	[GCC_UFS_PHY_ICE_CORE_HW_CTL_CLK] = &gcc_ufs_phy_ice_core_hw_ctl_clk.clkr,
 	[GCC_UFS_PHY_PHY_AUX_CLK] = &gcc_ufs_phy_phy_aux_clk.clkr,
 	[GCC_UFS_PHY_PHY_AUX_CLK_SRC] = &gcc_ufs_phy_phy_aux_clk_src.clkr,
-	[GCC_UFS_PHY_PHY_AUX_HW_CTL_CLK] = &gcc_ufs_phy_phy_aux_hw_ctl_clk.clkr,
 	[GCC_UFS_PHY_RX_SYMBOL_0_CLK] = &gcc_ufs_phy_rx_symbol_0_clk.clkr,
 	[GCC_UFS_PHY_RX_SYMBOL_0_CLK_SRC] = &gcc_ufs_phy_rx_symbol_0_clk_src.clkr,
 	[GCC_UFS_PHY_RX_SYMBOL_1_CLK] = &gcc_ufs_phy_rx_symbol_1_clk.clkr,
@@ -4584,7 +4478,6 @@ static struct clk_regmap *gcc_sa8775p_clocks[] = {
 	[GCC_UFS_PHY_TX_SYMBOL_0_CLK_SRC] = &gcc_ufs_phy_tx_symbol_0_clk_src.clkr,
 	[GCC_UFS_PHY_UNIPRO_CORE_CLK] = &gcc_ufs_phy_unipro_core_clk.clkr,
 	[GCC_UFS_PHY_UNIPRO_CORE_CLK_SRC] = &gcc_ufs_phy_unipro_core_clk_src.clkr,
-	[GCC_UFS_PHY_UNIPRO_CORE_HW_CTL_CLK] = &gcc_ufs_phy_unipro_core_hw_ctl_clk.clkr,
 	[GCC_USB20_MASTER_CLK] = &gcc_usb20_master_clk.clkr,
 	[GCC_USB20_MASTER_CLK_SRC] = &gcc_usb20_master_clk_src.clkr,
 	[GCC_USB20_MOCK_UTMI_CLK] = &gcc_usb20_mock_utmi_clk.clkr,
-- 
2.17.1


