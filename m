Return-Path: <linux-arm-msm+bounces-28294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D83F94E613
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 07:15:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FEB51F21109
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 05:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F770152E17;
	Mon, 12 Aug 2024 05:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Lz/2rTC0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA1F14D435;
	Mon, 12 Aug 2024 05:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723439635; cv=none; b=u4PSFsn02hYWcHPSerbSL7zTjuCeq91uKjL9OLE0QInBSs5eZ4jS72KDlM1zZsDyQY0RI2NEv6eVd6fqsqlxL6HxoGdUXWmWq839u+W8kj4H5c6rivhdpU9eWYGE172b7KSFYjdp4pvg9WIJ/d8E1fcqlgVmXX9wQa1Y1uPh0aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723439635; c=relaxed/simple;
	bh=+ozNlupHTl8k0ESp4AcDXLd+8FVBo65xtqJOvwpgsCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=owk+DZVGw0wRUkCk+8ULOWjqm8ZHUbmGHLCmcTIc2KDkv9Y8GmqLWsRwx1l5FG0wgc7HqZ5CTLIyzlHXXLeB3R19Zo08gKDhsmw2teyFnWMsK401lamqfeNVCPOU0jzf2Nm+j0gDBoQFTvbacaiGc3ThX654voP0RuzhR/BDK+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Lz/2rTC0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47C2ZeL6026766;
	Mon, 12 Aug 2024 05:13:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D1DfvgNf4MpCHuCjhhNvMQ2NRBq7cglH6KJ5EPUiX9M=; b=Lz/2rTC0jHeQRo1Y
	FUJAVSmNvTgqNzWKCE9eZ5ASnPmAiMJMODtUhAvbSzoUMe9CAa3uzhTBdxfuKcvt
	U5aUGsSEa/ZZ7UcTeT3Ufk4dZQxRMDPnv7QTXXAhy+vB9mRkCdym/B4ERxHKg5U+
	JQVD/eOWMNUPUDLf2YUkoRa6YHXlMJxsgBQfg9mv8Aeh1QeJGQxkdCuwbLR1aePS
	vEs6JIg0JzwII1xx1/MrpMlxlVs4dl97pxKeztRcVu7+jH974PX/c6mokDYquCu3
	8M2xRk53bjlbGHzcW89mgbZd+xTrDLp50HX+H0WwlYMt53kP8+S/ipmML//4S72t
	VrVgAw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x1d4avhg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 05:13:49 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47C5Dmr7001699
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 05:13:48 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 11 Aug 2024 22:13:43 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Date: Mon, 12 Aug 2024 10:43:05 +0530
Subject: [PATCH v2 5/5] clk: qcom: gcc-sm8150: De-register
 gcc_cpuss_ahb_clk_src
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240812-gcc-sc8180x-fixes-v2-5-8b3eaa5fb856@quicinc.com>
References: <20240812-gcc-sc8180x-fixes-v2-0-8b3eaa5fb856@quicinc.com>
In-Reply-To: <20240812-gcc-sc8180x-fixes-v2-0-8b3eaa5fb856@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Taniya
 Das" <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <stable@vger.kernel.org>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pC8meQvDnRl76rB7LblFNIjrBgmR_70U
X-Proofpoint-GUID: pC8meQvDnRl76rB7LblFNIjrBgmR_70U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-11_25,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=753
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408120037

The branch clocks of gcc_cpuss_ahb_clk_src are marked critical
and hence these clocks vote on XO blocking the suspend.
De-register these clocks and its source as there is no rate
setting happening on them.

Fixes: 4433594bbe5d ("clk: qcom: gcc: Add global clock controller driver for SC8180x")
Cc: stable@vger.kernel.org
Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
 drivers/clk/qcom/gcc-sc8180x.c | 63 ------------------------------------------
 1 file changed, 63 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc8180x.c b/drivers/clk/qcom/gcc-sc8180x.c
index e85e75792ac3..199e66954bc2 100644
--- a/drivers/clk/qcom/gcc-sc8180x.c
+++ b/drivers/clk/qcom/gcc-sc8180x.c
@@ -277,28 +277,6 @@ static const struct clk_parent_data gcc_parents_8[] = {
 	{ .hw = &gpll0_out_even.clkr.hw },
 };
 
-static const struct freq_tbl ftbl_gcc_cpuss_ahb_clk_src[] = {
-	F(19200000, P_BI_TCXO, 1, 0, 0),
-	F(50000000, P_GPLL0_OUT_MAIN, 12, 0, 0),
-	F(100000000, P_GPLL0_OUT_MAIN, 6, 0, 0),
-	{ }
-};
-
-static struct clk_rcg2 gcc_cpuss_ahb_clk_src = {
-	.cmd_rcgr = 0x48014,
-	.mnd_width = 0,
-	.hid_width = 5,
-	.parent_map = gcc_parent_map_0,
-	.freq_tbl = ftbl_gcc_cpuss_ahb_clk_src,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "gcc_cpuss_ahb_clk_src",
-		.parent_data = gcc_parents_0,
-		.num_parents = ARRAY_SIZE(gcc_parents_0),
-		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
-	},
-};
-
 static const struct freq_tbl ftbl_gcc_emac_ptp_clk_src[] = {
 	F(19200000, P_BI_TCXO, 1, 0, 0),
 	F(50000000, P_GPLL0_OUT_EVEN, 6, 0, 0),
@@ -1656,25 +1634,6 @@ static struct clk_branch gcc_cfg_noc_usb3_sec_axi_clk = {
 	},
 };
 
-/* For CPUSS functionality the AHB clock needs to be left enabled */
-static struct clk_branch gcc_cpuss_ahb_clk = {
-	.halt_reg = 0x48000,
-	.halt_check = BRANCH_HALT_VOTED,
-	.clkr = {
-		.enable_reg = 0x52004,
-		.enable_mask = BIT(21),
-		.hw.init = &(struct clk_init_data){
-			.name = "gcc_cpuss_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]){
-				      &gcc_cpuss_ahb_clk_src.clkr.hw
-			},
-			.num_parents = 1,
-			.flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_cpuss_rbcpr_clk = {
 	.halt_reg = 0x48008,
 	.halt_check = BRANCH_HALT,
@@ -3207,25 +3166,6 @@ static struct clk_branch gcc_sdcc4_apps_clk = {
 	},
 };
 
-/* For CPUSS functionality the SYS NOC clock needs to be left enabled */
-static struct clk_branch gcc_sys_noc_cpuss_ahb_clk = {
-	.halt_reg = 0x4819c,
-	.halt_check = BRANCH_HALT_VOTED,
-	.clkr = {
-		.enable_reg = 0x52004,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gcc_sys_noc_cpuss_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]){
-				      &gcc_cpuss_ahb_clk_src.clkr.hw
-			},
-			.num_parents = 1,
-			.flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_tsif_ahb_clk = {
 	.halt_reg = 0x36004,
 	.halt_check = BRANCH_HALT,
@@ -4341,8 +4281,6 @@ static struct clk_regmap *gcc_sc8180x_clocks[] = {
 	[GCC_CFG_NOC_USB3_MP_AXI_CLK] = &gcc_cfg_noc_usb3_mp_axi_clk.clkr,
 	[GCC_CFG_NOC_USB3_PRIM_AXI_CLK] = &gcc_cfg_noc_usb3_prim_axi_clk.clkr,
 	[GCC_CFG_NOC_USB3_SEC_AXI_CLK] = &gcc_cfg_noc_usb3_sec_axi_clk.clkr,
-	[GCC_CPUSS_AHB_CLK] = &gcc_cpuss_ahb_clk.clkr,
-	[GCC_CPUSS_AHB_CLK_SRC] = &gcc_cpuss_ahb_clk_src.clkr,
 	[GCC_CPUSS_RBCPR_CLK] = &gcc_cpuss_rbcpr_clk.clkr,
 	[GCC_DDRSS_GPU_AXI_CLK] = &gcc_ddrss_gpu_axi_clk.clkr,
 	[GCC_DISP_HF_AXI_CLK] = &gcc_disp_hf_axi_clk.clkr,
@@ -4479,7 +4417,6 @@ static struct clk_regmap *gcc_sc8180x_clocks[] = {
 	[GCC_SDCC4_AHB_CLK] = &gcc_sdcc4_ahb_clk.clkr,
 	[GCC_SDCC4_APPS_CLK] = &gcc_sdcc4_apps_clk.clkr,
 	[GCC_SDCC4_APPS_CLK_SRC] = &gcc_sdcc4_apps_clk_src.clkr,
-	[GCC_SYS_NOC_CPUSS_AHB_CLK] = &gcc_sys_noc_cpuss_ahb_clk.clkr,
 	[GCC_TSIF_AHB_CLK] = &gcc_tsif_ahb_clk.clkr,
 	[GCC_TSIF_INACTIVITY_TIMERS_CLK] = &gcc_tsif_inactivity_timers_clk.clkr,
 	[GCC_TSIF_REF_CLK] = &gcc_tsif_ref_clk.clkr,

-- 
2.25.1


