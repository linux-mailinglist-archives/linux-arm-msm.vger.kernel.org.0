Return-Path: <linux-arm-msm+bounces-57957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A464AB7552
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:11:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC0404C82B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF602293759;
	Wed, 14 May 2025 19:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UNLzgjYZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24E728DF42;
	Wed, 14 May 2025 19:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747249814; cv=none; b=Yx2MjEIosJ+CORbDEAeQFcNlbxQx8gBCiMMmx8ObNi23O/UEfa7zDJJk5uHKoD7EXb1Yz/nu3uEY7LGRlCYFyBk1ZC6NeQ5bntI3LziG5pvq0xkQX8Ns2GCD/rFnsq47gwg1ZLng+DG1on5zdovr0yhxsfRw73i9bpRPAk3Y9BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747249814; c=relaxed/simple;
	bh=/ml+XWfG0QKoGvna08A24mwm88el+Aw+6fud39SwQ60=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=OozQg9BDIOho0Y4EW8rO33JvuU7GnhKVDZif6c/IESw5t9gMulPIWDliSy6H4/4P1Q0Af3rEAIRf1RmQpjzu0WMgOibLNWgK06d/eLdFr2AoDUhBwIcc07KanX/fMC8XbG0iCjf9Mh7OwZAarm+UTkh/zqc65+DF8ymmYy9PJfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UNLzgjYZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAueka004705;
	Wed, 14 May 2025 19:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DnwrO70MH5mJcj0+U0Me7CYHj/avLhvNkKuV6xshsdc=; b=UNLzgjYZOHYShIbb
	+rZCCXWr65Jb2NRkoPeutaBgc1EmusIUzDurm3lISnX2+bbb92O1KMFEvzfoNcC4
	L8pZrPbSKLfm+74iKgQ3wvt6QdSSqxZ3AEAdKROu4oKFapsYZU40BBGyvAMa/1H5
	JLchBruc1jFVB+KNMWqaSei7qvBIqToh98plgayUFrBdpSoOiNpiVMFb9ANGjLka
	zgCwHy07Dfiigxdk0Y8G8hJDDFtkJukSVgFfQMNc2SJ27nHz1Y5MC9Ef2DBH4fdn
	w+2Yz8HZJKFgRzLICUR3KnBhPcGsp49LAiFe8B67//hDZJpmtiJrMTg/6u/hG7EU
	8qQ25A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnut0p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 19:10:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54EJA7Yn031305
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 19:10:07 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 May
 2025 12:10:01 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Thu, 15 May 2025 00:38:54 +0530
Subject: [PATCH v4 09/18] clk: qcom: camcc-sm8450: Move PLL & clk
 configuration to really probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250515-videocc-pll-multi-pd-voting-v4-9-571c63297d01@quicinc.com>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ERzoEsrFqEQ5aVjH91wV5_mPKFt-qzXd
X-Proofpoint-ORIG-GUID: ERzoEsrFqEQ5aVjH91wV5_mPKFt-qzXd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NCBTYWx0ZWRfXz+LqQxeNBF1E
 5MWeUjlb+9sTfmkJ0DD+5JFUQS96qnTN0t6YxqlvspNh1Sm+lbgbyVfXLFpJuVuoyXNw0nX04Nc
 OnCGhE5m3L0G73T+QQha+nu0hcZnys/vWo4+iSNOeGgqjjDU1fthjo9gAxXS/DxvXBFn/xVs1WU
 7C4EuvqGv7BuwtNh6G4ET5IIZDfBRNKz2m14LiRLj24/2j2tFAkJPMb2IDPN87k6b23WZarliXs
 avslfX79bdUte4q67hVWKGKxqyvAfxBgK38bp5KcLklPTIgiVL3mHUsUCVSRe4OZeah+yi5li9I
 RrFCBe63lBSlEG7CdrFh9+QTNC7AqzdFvJAzuuZq3rA7r6LOxDmLc7H4uwI0yVj/BecJmp6Oce5
 xcPesS/87XwdK+jACyCUvDszvT/+vdkPvGMDIynzbsdeQU0TjdidiZvXcA1xqx0mRhSZa4OB
X-Authority-Analysis: v=2.4 cv=Gp9C+l1C c=1 sm=1 tr=0 ts=6824ea90 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=jl1wNc9uYJxH2fZ-HckA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140174

Camera PLLs on SM8450/SM8475 require both MMCX and MXC rails to be
kept ON to configure the PLLs properly. Hence move runtime power
management, PLL configuration and enable critical clocks to
qcom_cc_really_probe() which ensures all required power domains are in
enabled state before configuring the PLLs or enabling the clocks.

This change also removes the modelling for cam_cc_gdsc_clk and keeps it
always ON from probe since using CLK_IS_CRITICAL will prevent the clock
controller associated power domains from collapsing due to clock framework
invoking clk_pm_runtime_get() during prepare.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
 drivers/clk/qcom/camcc-sm8450.c | 89 ++++++++++++++++++++---------------------
 1 file changed, 44 insertions(+), 45 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sm8450.c b/drivers/clk/qcom/camcc-sm8450.c
index 08982737e4901c0703e19f8dd2d302e24748210c..4dd8be8cc9881c890d2e7c3a12f12816a9ab47dc 100644
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
@@ -3021,6 +3027,13 @@ static struct gdsc *cam_cc_sm8450_gdscs[] = {
 	[TITAN_TOP_GDSC] = &titan_top_gdsc,
 };
 
+static struct qcom_cc_driver_data cam_cc_sm8450_driver_data = {
+	.alpha_plls = cam_cc_sm8450_plls,
+	.num_alpha_plls = ARRAY_SIZE(cam_cc_sm8450_plls),
+	.clk_cbcrs = cam_cc_sm8450_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(cam_cc_sm8450_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc cam_cc_sm8450_desc = {
 	.config = &cam_cc_sm8450_regmap_config,
 	.clks = cam_cc_sm8450_clocks,
@@ -3029,6 +3042,8 @@ static const struct qcom_cc_desc cam_cc_sm8450_desc = {
 	.num_resets = ARRAY_SIZE(cam_cc_sm8450_resets),
 	.gdscs = cam_cc_sm8450_gdscs,
 	.num_gdscs = ARRAY_SIZE(cam_cc_sm8450_gdscs),
+	.use_rpm = true,
+	.driver_data = &cam_cc_sm8450_driver_data,
 };
 
 static const struct of_device_id cam_cc_sm8450_match_table[] = {
@@ -3040,12 +3055,6 @@ MODULE_DEVICE_TABLE(of, cam_cc_sm8450_match_table);
 
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
@@ -3092,28 +3101,18 @@ static int cam_cc_sm8450_probe(struct platform_device *pdev)
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


