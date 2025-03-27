Return-Path: <linux-arm-msm+bounces-52607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1ACA72D10
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 10:58:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C0DF17D41F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 09:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06A9211278;
	Thu, 27 Mar 2025 09:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fYpuRXik"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B755210F65;
	Thu, 27 Mar 2025 09:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743069269; cv=none; b=jLvj/7lz5oDbAWQkWNsMd3ytqbdGdhjE7+9/KzT608awFC26wzNBO52r2a3YKs4sbveSkiuhj5Si0OzhyOO2S2jqaq74BSZCY0vgFTbFSHVBzfgGKLl2smLNtSm1hR2pnwxlFRjqtXZz2O0DpZGVVoPrSv3CBBPQshqXWRE38pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743069269; c=relaxed/simple;
	bh=f4bA2o9M1Y4Nekg40jhbb60aYzz6qI20UjJiOy67kpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=tZVqJTwGaex20XQEohh29fhuqQgYDvS7JZJszddqmd0E9t5HBLrM42smtaN1ryr6lyoxze2roc3+fDSWdGhPObmm9GZ7TQ3BVQxJOrwZL3N12I4VkXneXXacZlBiaAj8UWEpuGarolq4C0SJuNYIt5r0mFh2SZK7HFtv62U0vrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fYpuRXik; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jam7025784;
	Thu, 27 Mar 2025 09:54:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GA0JUCEe2nv4PB87j3UMVWABCpJGZzbSbjM/+Ssb0IM=; b=fYpuRXikZ2dNd1TQ
	WyEzYpZzHoI+FrS9uA5WsruR53RA0ebT+5E90qDhyO02BkdAcVrFTKn2f+m2YzpQ
	tX6MSAFH+BSI8It0CIsNX+bOEd81FzqHGO2iph7lfD2YnlWKqYUufGrbYFie5CZ0
	+w5p/qS8ACeIUjZBvu/wFcTT3r8AmeMV25qyzc9xpQNDZjh3gg3tncBgXcg77azF
	7HrlZ1Nfw3cBfcyDJTeLKaDhYppUzfq4q+pv/qAk4y5RhgCEapFK9bDgy/q0CPWL
	eWSi4bkbyr10iCTbns4miiNeeOJo81mCFP1NvW0LOt69i558hLc7tSeIxJzXLaX9
	hLC80w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45n0nurnsv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 09:54:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52R9sMlT004811
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 09:54:22 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Mar
 2025 02:54:16 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Thu, 27 Mar 2025 15:22:30 +0530
Subject: [PATCH v3 10/18] clk: qcom: camcc-sm8550: Move PLL & clk
 configuration to really probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250327-videocc-pll-multi-pd-voting-v3-10-895fafd62627@quicinc.com>
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
X-Proofpoint-GUID: 8av0uudMmEy2fN7DwPFburOBO1TX_LsM
X-Authority-Analysis: v=2.4 cv=AcaxH2XG c=1 sm=1 tr=0 ts=67e5204f cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=QC_WrGKKIj8jWoRoFg0A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 8av0uudMmEy2fN7DwPFburOBO1TX_LsM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 impostorscore=0 malwarescore=0 bulkscore=0 mlxscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270066

Camera PLLs on SM8550 require both MMCX and MXC rails to be kept ON to
configure the PLLs properly. Hence move runtime power management, PLL
configuration and enabling critical clocks to qcom_cc_really_probe() which
ensures all required power domains are in enabled state before configuring
the PLLs or enabling the clocks.

Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
 drivers/clk/qcom/camcc-sm8550.c | 81 ++++++++++++++++++++---------------------
 1 file changed, 40 insertions(+), 41 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sm8550.c b/drivers/clk/qcom/camcc-sm8550.c
index 871155783c798fd9245d735642272eae2a2d3465..35158178a2ecba332f0079db3fe5c75b858724bc 100644
--- a/drivers/clk/qcom/camcc-sm8550.c
+++ b/drivers/clk/qcom/camcc-sm8550.c
@@ -7,7 +7,6 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,sm8550-camcc.h>
@@ -74,6 +73,7 @@ static const struct alpha_pll_config cam_cc_pll0_config = {
 
 static struct clk_alpha_pll cam_cc_pll0 = {
 	.offset = 0x0,
+	.config = &cam_cc_pll0_config,
 	.vco_table = lucid_ole_vco,
 	.num_vco = ARRAY_SIZE(lucid_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
@@ -151,6 +151,7 @@ static const struct alpha_pll_config cam_cc_pll1_config = {
 
 static struct clk_alpha_pll cam_cc_pll1 = {
 	.offset = 0x1000,
+	.config = &cam_cc_pll1_config,
 	.vco_table = lucid_ole_vco,
 	.num_vco = ARRAY_SIZE(lucid_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
@@ -201,6 +202,7 @@ static const struct alpha_pll_config cam_cc_pll2_config = {
 
 static struct clk_alpha_pll cam_cc_pll2 = {
 	.offset = 0x2000,
+	.config = &cam_cc_pll2_config,
 	.vco_table = rivian_ole_vco,
 	.num_vco = ARRAY_SIZE(rivian_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_RIVIAN_EVO],
@@ -232,6 +234,7 @@ static const struct alpha_pll_config cam_cc_pll3_config = {
 
 static struct clk_alpha_pll cam_cc_pll3 = {
 	.offset = 0x3000,
+	.config = &cam_cc_pll3_config,
 	.vco_table = lucid_ole_vco,
 	.num_vco = ARRAY_SIZE(lucid_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
@@ -286,6 +289,7 @@ static const struct alpha_pll_config cam_cc_pll4_config = {
 
 static struct clk_alpha_pll cam_cc_pll4 = {
 	.offset = 0x4000,
+	.config = &cam_cc_pll4_config,
 	.vco_table = lucid_ole_vco,
 	.num_vco = ARRAY_SIZE(lucid_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
@@ -340,6 +344,7 @@ static const struct alpha_pll_config cam_cc_pll5_config = {
 
 static struct clk_alpha_pll cam_cc_pll5 = {
 	.offset = 0x5000,
+	.config = &cam_cc_pll5_config,
 	.vco_table = lucid_ole_vco,
 	.num_vco = ARRAY_SIZE(lucid_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
@@ -394,6 +399,7 @@ static const struct alpha_pll_config cam_cc_pll6_config = {
 
 static struct clk_alpha_pll cam_cc_pll6 = {
 	.offset = 0x6000,
+	.config = &cam_cc_pll6_config,
 	.vco_table = lucid_ole_vco,
 	.num_vco = ARRAY_SIZE(lucid_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
@@ -448,6 +454,7 @@ static const struct alpha_pll_config cam_cc_pll7_config = {
 
 static struct clk_alpha_pll cam_cc_pll7 = {
 	.offset = 0x7000,
+	.config = &cam_cc_pll7_config,
 	.vco_table = lucid_ole_vco,
 	.num_vco = ARRAY_SIZE(lucid_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
@@ -502,6 +509,7 @@ static const struct alpha_pll_config cam_cc_pll8_config = {
 
 static struct clk_alpha_pll cam_cc_pll8 = {
 	.offset = 0x8000,
+	.config = &cam_cc_pll8_config,
 	.vco_table = lucid_ole_vco,
 	.num_vco = ARRAY_SIZE(lucid_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
@@ -556,6 +564,7 @@ static const struct alpha_pll_config cam_cc_pll9_config = {
 
 static struct clk_alpha_pll cam_cc_pll9 = {
 	.offset = 0x9000,
+	.config = &cam_cc_pll9_config,
 	.vco_table = lucid_ole_vco,
 	.num_vco = ARRAY_SIZE(lucid_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
@@ -610,6 +619,7 @@ static const struct alpha_pll_config cam_cc_pll10_config = {
 
 static struct clk_alpha_pll cam_cc_pll10 = {
 	.offset = 0xa000,
+	.config = &cam_cc_pll10_config,
 	.vco_table = lucid_ole_vco,
 	.num_vco = ARRAY_SIZE(lucid_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
@@ -664,6 +674,7 @@ static const struct alpha_pll_config cam_cc_pll11_config = {
 
 static struct clk_alpha_pll cam_cc_pll11 = {
 	.offset = 0xb000,
+	.config = &cam_cc_pll11_config,
 	.vco_table = lucid_ole_vco,
 	.num_vco = ARRAY_SIZE(lucid_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
@@ -718,6 +729,7 @@ static const struct alpha_pll_config cam_cc_pll12_config = {
 
 static struct clk_alpha_pll cam_cc_pll12 = {
 	.offset = 0xc000,
+	.config = &cam_cc_pll12_config,
 	.vco_table = lucid_ole_vco,
 	.num_vco = ARRAY_SIZE(lucid_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
@@ -3479,6 +3491,27 @@ static const struct qcom_reset_map cam_cc_sm8550_resets[] = {
 	[CAM_CC_SFE_1_BCR] = { 0x133dc },
 };
 
+static struct clk_alpha_pll *cam_cc_sm8550_plls[] = {
+	&cam_cc_pll0,
+	&cam_cc_pll1,
+	&cam_cc_pll2,
+	&cam_cc_pll3,
+	&cam_cc_pll4,
+	&cam_cc_pll5,
+	&cam_cc_pll6,
+	&cam_cc_pll7,
+	&cam_cc_pll8,
+	&cam_cc_pll9,
+	&cam_cc_pll10,
+	&cam_cc_pll11,
+	&cam_cc_pll12,
+};
+
+static u32 cam_cc_sm8550_critical_cbcrs[] = {
+	0x1419c, /* CAM_CC_GDSC_CLK */
+	0x142cc, /* CAM_CC_SLEEP_CLK */
+};
+
 static const struct regmap_config cam_cc_sm8550_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -3495,6 +3528,11 @@ static const struct qcom_cc_desc cam_cc_sm8550_desc = {
 	.num_resets = ARRAY_SIZE(cam_cc_sm8550_resets),
 	.gdscs = cam_cc_sm8550_gdscs,
 	.num_gdscs = ARRAY_SIZE(cam_cc_sm8550_gdscs),
+	.alpha_plls = cam_cc_sm8550_plls,
+	.num_alpha_plls = ARRAY_SIZE(cam_cc_sm8550_plls),
+	.clk_cbcrs = cam_cc_sm8550_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(cam_cc_sm8550_critical_cbcrs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id cam_cc_sm8550_match_table[] = {
@@ -3505,46 +3543,7 @@ MODULE_DEVICE_TABLE(of, cam_cc_sm8550_match_table);
 
 static int cam_cc_sm8550_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	ret = devm_pm_runtime_enable(&pdev->dev);
-	if (ret)
-		return ret;
-
-	ret = pm_runtime_resume_and_get(&pdev->dev);
-	if (ret)
-		return ret;
-
-	regmap = qcom_cc_map(pdev, &cam_cc_sm8550_desc);
-	if (IS_ERR(regmap)) {
-		pm_runtime_put(&pdev->dev);
-		return PTR_ERR(regmap);
-	}
-
-	clk_lucid_ole_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
-	clk_lucid_ole_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config);
-	clk_rivian_evo_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_config);
-	clk_lucid_ole_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
-	clk_lucid_ole_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_config);
-	clk_lucid_ole_pll_configure(&cam_cc_pll5, regmap, &cam_cc_pll5_config);
-	clk_lucid_ole_pll_configure(&cam_cc_pll6, regmap, &cam_cc_pll6_config);
-	clk_lucid_ole_pll_configure(&cam_cc_pll7, regmap, &cam_cc_pll7_config);
-	clk_lucid_ole_pll_configure(&cam_cc_pll8, regmap, &cam_cc_pll8_config);
-	clk_lucid_ole_pll_configure(&cam_cc_pll9, regmap, &cam_cc_pll9_config);
-	clk_lucid_ole_pll_configure(&cam_cc_pll10, regmap, &cam_cc_pll10_config);
-	clk_lucid_ole_pll_configure(&cam_cc_pll11, regmap, &cam_cc_pll11_config);
-	clk_lucid_ole_pll_configure(&cam_cc_pll12, regmap, &cam_cc_pll12_config);
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x1419c); /* CAM_CC_GDSC_CLK */
-	qcom_branch_set_clk_en(regmap, 0x142cc); /* CAM_CC_SLEEP_CLK */
-
-	ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_sm8550_desc, regmap);
-
-	pm_runtime_put(&pdev->dev);
-
-	return ret;
+	return qcom_cc_probe(pdev, &cam_cc_sm8550_desc);
 }
 
 static struct platform_driver cam_cc_sm8550_driver = {

-- 
2.34.1


