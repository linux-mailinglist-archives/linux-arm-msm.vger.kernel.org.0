Return-Path: <linux-arm-msm+bounces-52606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E784A72CFC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 10:57:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C0C1189C756
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 09:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E3120E309;
	Thu, 27 Mar 2025 09:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SVrvi8TF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64EE20D50C;
	Thu, 27 Mar 2025 09:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743069263; cv=none; b=tN6kpYIZVTSTfoaGpnEB/W0YBZGizp0S5KUZmxZLa14RWCm3zKcXiRzlD+uQVRU/wO67x3LkM5V8/u1/nkJhf4nzVETCuMsLCNPFDGeUq4vQDByOC1SlXYCwtxBGvhiciujTY1yXYHDPvfKVXy3hTpk9OQbZ1oTu/Rs3csVBYT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743069263; c=relaxed/simple;
	bh=iyxAgtEy2h1z6nnUWV2mQLRf0iHCyZ24qP9G/SW0C0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ifIhaHdUGR8qZ60VVBl56tzCsL/Q02D1gxtjRnYzP6awXbGU0lkzJtzJiKeSjc3wruFATrGX3Mxtf1jBCd76suYYHFOEL0B1WwAMQ59/3xiKYamzuoge1lGnH83I9qjPEB7LhlaW6yjZIXohO/yUuXX2e9EGvM8hHZMUqAQg64k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SVrvi8TF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jELW005949;
	Thu, 27 Mar 2025 09:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QlPCckvIMBEt8b0wOEnnRa5m+9Gpwopx9b8NViNwDTk=; b=SVrvi8TFyiad25Gb
	81+RHQifucuEBpxJ3yyvTZ7+3+8AFQzLj8umsflHEcQvNIZt2D3/ig1QQyOxEkJc
	s6IgeH9pabiwD07lo9KT9Ve29X0BJvcwJAgeoyZqZxN9evV8M2SKlHKldiyEMlI/
	dPvSD8u3AuvCoY6JF3+d19wEbwfj1Exz0fZBuok9y6OoKkepj2hpzrMIrAcUqmdT
	nerNtGMmDzg8ohV4YocZ0mcK7vh6QhTLJFMrRn+OkN8Qmy/ZP9tprb0kgyhaVjrt
	hwfnLtmTMwq7jiAy7JYeKdo2jvdHfTW9BcF8gHjR1o/t7YPs62iNBia19ng90Kgs
	/w/gkQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45m7nf4tpk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 09:54:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52R9sGrQ004162
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 09:54:16 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Mar
 2025 02:54:11 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Thu, 27 Mar 2025 15:22:29 +0530
Subject: [PATCH v3 09/18] clk: qcom: camcc-sm8450: Move PLL & clk
 configuration to really probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250327-videocc-pll-multi-pd-voting-v3-9-895fafd62627@quicinc.com>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
In-Reply-To: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Vladimir
 Zapolskiy" <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov
	<lumag@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: e2i4X4hi0BrwFDHbrPwj9Hq1QgxT-Gsu
X-Proofpoint-GUID: e2i4X4hi0BrwFDHbrPwj9Hq1QgxT-Gsu
X-Authority-Analysis: v=2.4 cv=IMMCChvG c=1 sm=1 tr=0 ts=67e52049 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=7AlUjsko3lxwCLkXNUgA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270066

Camera PLLs on SM8450/SM8475 require both MMCX and MXC rails to be
kept ON to configure the PLLs properly. Hence move runtime power
management, PLL configuration and enable critical clocks to
qcom_cc_really_probe() which ensures all required power domains are in
enabled state before configuring the PLLs or enabling the clocks.

This change also removes the modelling for cam_cc_gdsc_clk and keeps it
always ON from probe since using CLK_IS_CRITICAL will prevent the clock
controller associated power domains from collapsing due to clock framework
invoking clk_pm_runtime_get() during prepare.

Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
 drivers/clk/qcom/camcc-sm8450.c | 85 +++++++++++++++++++----------------------
 1 file changed, 40 insertions(+), 45 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sm8450.c b/drivers/clk/qcom/camcc-sm8450.c
index 08982737e4901c0703e19f8dd2d302e24748210c..8656379efa135475f807ab7d3e1b8c88f932d3a4 100644
--- a/drivers/clk/qcom/camcc-sm8450.c
+++ b/drivers/clk/qcom/camcc-sm8450.c
@@ -86,6 +86,7 @@ static const struct alpha_pll_config sm8475_cam_cc_pll0_config = {
 
 static struct clk_alpha_pll cam_cc_pll0 = {
 	.offset = 0x0,
+	.config = &cam_cc_pll0_config,
 	.vco_table = lucid_evo_vco,
 	.num_vco = ARRAY_SIZE(lucid_evo_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
@@ -191,6 +192,7 @@ static const struct alpha_pll_config sm8475_cam_cc_pll1_config = {
 
 static struct clk_alpha_pll cam_cc_pll1 = {
 	.offset = 0x1000,
+	.config = &cam_cc_pll1_config,
 	.vco_table = lucid_evo_vco,
 	.num_vco = ARRAY_SIZE(lucid_evo_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
@@ -257,6 +259,7 @@ static const struct alpha_pll_config sm8475_cam_cc_pll2_config = {
 
 static struct clk_alpha_pll cam_cc_pll2 = {
 	.offset = 0x2000,
+	.config = &cam_cc_pll2_config,
 	.vco_table = rivian_evo_vco,
 	.num_vco = ARRAY_SIZE(rivian_evo_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_RIVIAN_EVO],
@@ -296,6 +299,7 @@ static const struct alpha_pll_config sm8475_cam_cc_pll3_config = {
 
 static struct clk_alpha_pll cam_cc_pll3 = {
 	.offset = 0x3000,
+	.config = &cam_cc_pll3_config,
 	.vco_table = lucid_evo_vco,
 	.num_vco = ARRAY_SIZE(lucid_evo_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
@@ -368,6 +372,7 @@ static const struct alpha_pll_config sm8475_cam_cc_pll4_config = {
 
 static struct clk_alpha_pll cam_cc_pll4 = {
 	.offset = 0x4000,
+	.config = &cam_cc_pll4_config,
 	.vco_table = lucid_evo_vco,
 	.num_vco = ARRAY_SIZE(lucid_evo_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
@@ -440,6 +445,7 @@ static const struct alpha_pll_config sm8475_cam_cc_pll5_config = {
 
 static struct clk_alpha_pll cam_cc_pll5 = {
 	.offset = 0x5000,
+	.config = &cam_cc_pll5_config,
 	.vco_table = lucid_evo_vco,
 	.num_vco = ARRAY_SIZE(lucid_evo_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
@@ -512,6 +518,7 @@ static const struct alpha_pll_config sm8475_cam_cc_pll6_config = {
 
 static struct clk_alpha_pll cam_cc_pll6 = {
 	.offset = 0x6000,
+	.config = &cam_cc_pll6_config,
 	.vco_table = lucid_evo_vco,
 	.num_vco = ARRAY_SIZE(lucid_evo_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
@@ -584,6 +591,7 @@ static const struct alpha_pll_config sm8475_cam_cc_pll7_config = {
 
 static struct clk_alpha_pll cam_cc_pll7 = {
 	.offset = 0x7000,
+	.config = &cam_cc_pll7_config,
 	.vco_table = lucid_evo_vco,
 	.num_vco = ARRAY_SIZE(lucid_evo_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
@@ -656,6 +664,7 @@ static const struct alpha_pll_config sm8475_cam_cc_pll8_config = {
 
 static struct clk_alpha_pll cam_cc_pll8 = {
 	.offset = 0x8000,
+	.config = &cam_cc_pll8_config,
 	.vco_table = lucid_evo_vco,
 	.num_vco = ARRAY_SIZE(lucid_evo_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
@@ -1476,24 +1485,6 @@ static struct clk_rcg2 cam_cc_xo_clk_src = {
 	},
 };
 
-static struct clk_branch cam_cc_gdsc_clk = {
-	.halt_reg = 0x1320c,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x1320c,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "cam_cc_gdsc_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&cam_cc_xo_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch cam_cc_bps_ahb_clk = {
 	.halt_reg = 0x1004c,
 	.halt_check = BRANCH_HALT,
@@ -2819,7 +2810,6 @@ static struct clk_regmap *cam_cc_sm8450_clocks[] = {
 	[CAM_CC_CSIPHY4_CLK] = &cam_cc_csiphy4_clk.clkr,
 	[CAM_CC_CSIPHY5_CLK] = &cam_cc_csiphy5_clk.clkr,
 	[CAM_CC_FAST_AHB_CLK_SRC] = &cam_cc_fast_ahb_clk_src.clkr,
-	[CAM_CC_GDSC_CLK] = &cam_cc_gdsc_clk.clkr,
 	[CAM_CC_ICP_AHB_CLK] = &cam_cc_icp_ahb_clk.clkr,
 	[CAM_CC_ICP_CLK] = &cam_cc_icp_clk.clkr,
 	[CAM_CC_ICP_CLK_SRC] = &cam_cc_icp_clk_src.clkr,
@@ -2913,6 +2903,22 @@ static const struct qcom_reset_map cam_cc_sm8450_resets[] = {
 	[CAM_CC_SFE_1_BCR] = { 0x13094 },
 };
 
+static struct clk_alpha_pll *cam_cc_sm8450_plls[] = {
+	&cam_cc_pll0,
+	&cam_cc_pll1,
+	&cam_cc_pll2,
+	&cam_cc_pll3,
+	&cam_cc_pll4,
+	&cam_cc_pll5,
+	&cam_cc_pll6,
+	&cam_cc_pll7,
+	&cam_cc_pll8,
+};
+
+static u32 cam_cc_sm8450_critical_cbcrs[] = {
+	0x1320c, /* CAM_CC_GDSC_CLK */
+};
+
 static const struct regmap_config cam_cc_sm8450_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -3029,6 +3035,11 @@ static const struct qcom_cc_desc cam_cc_sm8450_desc = {
 	.num_resets = ARRAY_SIZE(cam_cc_sm8450_resets),
 	.gdscs = cam_cc_sm8450_gdscs,
 	.num_gdscs = ARRAY_SIZE(cam_cc_sm8450_gdscs),
+	.alpha_plls = cam_cc_sm8450_plls,
+	.num_alpha_plls = ARRAY_SIZE(cam_cc_sm8450_plls),
+	.clk_cbcrs = cam_cc_sm8450_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(cam_cc_sm8450_critical_cbcrs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id cam_cc_sm8450_match_table[] = {
@@ -3040,12 +3051,6 @@ MODULE_DEVICE_TABLE(of, cam_cc_sm8450_match_table);
 
 static int cam_cc_sm8450_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-
-	regmap = qcom_cc_map(pdev, &cam_cc_sm8450_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
 	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8475-camcc")) {
 		/* Update CAMCC PLL0 */
 		cam_cc_pll0.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
@@ -3092,28 +3097,18 @@ static int cam_cc_sm8450_probe(struct platform_device *pdev)
 		cam_cc_pll8_out_even.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
 		cam_cc_pll8_out_even.clkr.hw.init = &sm8475_cam_cc_pll8_out_even_init;
 
-		clk_lucid_ole_pll_configure(&cam_cc_pll0, regmap, &sm8475_cam_cc_pll0_config);
-		clk_lucid_ole_pll_configure(&cam_cc_pll1, regmap, &sm8475_cam_cc_pll1_config);
-		clk_rivian_evo_pll_configure(&cam_cc_pll2, regmap, &sm8475_cam_cc_pll2_config);
-		clk_lucid_ole_pll_configure(&cam_cc_pll3, regmap, &sm8475_cam_cc_pll3_config);
-		clk_lucid_ole_pll_configure(&cam_cc_pll4, regmap, &sm8475_cam_cc_pll4_config);
-		clk_lucid_ole_pll_configure(&cam_cc_pll5, regmap, &sm8475_cam_cc_pll5_config);
-		clk_lucid_ole_pll_configure(&cam_cc_pll6, regmap, &sm8475_cam_cc_pll6_config);
-		clk_lucid_ole_pll_configure(&cam_cc_pll7, regmap, &sm8475_cam_cc_pll7_config);
-		clk_lucid_ole_pll_configure(&cam_cc_pll8, regmap, &sm8475_cam_cc_pll8_config);
-	} else {
-		clk_lucid_evo_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
-		clk_lucid_evo_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config);
-		clk_rivian_evo_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_config);
-		clk_lucid_evo_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
-		clk_lucid_evo_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_config);
-		clk_lucid_evo_pll_configure(&cam_cc_pll5, regmap, &cam_cc_pll5_config);
-		clk_lucid_evo_pll_configure(&cam_cc_pll6, regmap, &cam_cc_pll6_config);
-		clk_lucid_evo_pll_configure(&cam_cc_pll7, regmap, &cam_cc_pll7_config);
-		clk_lucid_evo_pll_configure(&cam_cc_pll8, regmap, &cam_cc_pll8_config);
+		cam_cc_pll0.config = &sm8475_cam_cc_pll0_config;
+		cam_cc_pll1.config = &sm8475_cam_cc_pll1_config;
+		cam_cc_pll2.config = &sm8475_cam_cc_pll2_config;
+		cam_cc_pll3.config = &sm8475_cam_cc_pll3_config;
+		cam_cc_pll4.config = &sm8475_cam_cc_pll4_config;
+		cam_cc_pll5.config = &sm8475_cam_cc_pll5_config;
+		cam_cc_pll6.config = &sm8475_cam_cc_pll6_config;
+		cam_cc_pll7.config = &sm8475_cam_cc_pll7_config;
+		cam_cc_pll8.config = &sm8475_cam_cc_pll8_config;
 	}
 
-	return qcom_cc_really_probe(&pdev->dev, &cam_cc_sm8450_desc, regmap);
+	return qcom_cc_probe(pdev, &cam_cc_sm8450_desc);
 }
 
 static struct platform_driver cam_cc_sm8450_driver = {

-- 
2.34.1


