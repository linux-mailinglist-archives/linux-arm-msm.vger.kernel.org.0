Return-Path: <linux-arm-msm+bounces-22423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D87590511D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 13:09:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1587F1F23E7A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 11:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0FD016F299;
	Wed, 12 Jun 2024 11:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lsBX043i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA07816F274;
	Wed, 12 Jun 2024 11:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718190539; cv=none; b=hMGrqRpuYPHmXoHdII9NdQK9yDONHsixvIRMoIuTh01+jR1qUw9xsKz5u839BApjKC5tCVhLzYpPg5HhTl8Ko0fxtc8Uel1HDO69HXCJbZnzxHGqWQR6G68JejA+MQHOw+eDCxqEiOB0Vpuu9Z1pmT/XQh3/9WjHVftMRcXazQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718190539; c=relaxed/simple;
	bh=dTBLoDvQv3Mitenq3ekqAK27zDu65i4/aQ9wBXUCgXk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=t6ZULvvoM9xJrkAF04ThQwa1OCojUlEcDIlYP/Ksq6C2359UMhcDO1tcTWtPaeDTCL/zbbexDCQ2Ec3cEY6LmPrSeAttT8ftYdRGpj+qVEsBVjE7jCkcWYwqbHNc3JFLLebEp/zRxGMZjPpWaoDY2ouJfZ1lte4WvOL4aNhmwxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lsBX043i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45C21RF3008531;
	Wed, 12 Jun 2024 11:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	siR79LO1TaiPX/RxpLwWpR84LNb448D5vmckR+D0Jcs=; b=lsBX043iNB3FLA9A
	VPI1tPs6iZ/acZe02hXRnFM2kEfYRfKPDfldjcI7cmfhpY1H7YUpX1AsU9FYKPlF
	PruzuDp68jbUaIxnrA0WxXcFkZWxGckcwX5Hg2SZA4kNlKrb288ftzTwK8HZwDvM
	qgj+HvR3grcdGdXpvp0z8puGX6ScDLJvxz3NIZ9JVaN6meiYxkX/xXRUm0bLkebr
	ovskeIik5DjleoTSyFA+/YUJol79VafmVO3FPCkUUnKSkmzOOkNO9mOuIBlcF9XB
	9IWZZMF5PBqj0JBodm/H7XLIwqDhkLMLJvQvM+62/MLfF203jfAmMBdi0iNGua8v
	ryrnqA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ype914216-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 11:08:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CB8jBe008733
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 11:08:45 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 12 Jun 2024 04:08:41 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Wed, 12 Jun 2024 16:38:21 +0530
Subject: [PATCH v2 1/6] clk: qcom: gcc-sa8775p: Remove support for UFS hw
 ctl clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240612-sa8775p-v2-gcc-gpucc-fixes-v2-1-adcc756a23df@quicinc.com>
References: <20240612-sa8775p-v2-gcc-gpucc-fixes-v2-0-adcc756a23df@quicinc.com>
In-Reply-To: <20240612-sa8775p-v2-gcc-gpucc-fixes-v2-0-adcc756a23df@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        Shazad Hussain <quic_shazhuss@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_jkona@quicinc.com>,
        <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>
X-Mailer: b4 0.14-dev-f7c49
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9ciH1YCrTvdHvMZ8aCvutNfNjQ3_uDyv
X-Proofpoint-ORIG-GUID: 9ciH1YCrTvdHvMZ8aCvutNfNjQ3_uDyv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_06,2024-06-12_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406120081

The UFS hw ctl clocks are not used by any consumers on SA8775P,
and these clocks are not using the correct clock ops to manage the
hw ctl of the branch clock, hence remove these clocks.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 drivers/clk/qcom/gcc-sa8775p.c | 111 +----------------------------------------
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
2.45.2


