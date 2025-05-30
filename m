Return-Path: <linux-arm-msm+bounces-59901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3D3AC902E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 15:28:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C3851883AC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 13:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1527231821;
	Fri, 30 May 2025 13:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="R+3eM1cj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC82822DA00;
	Fri, 30 May 2025 13:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748611339; cv=none; b=HjJhHaOGmwrUDkil6fGE7hbTRxWhMIJcGtO4tZnNSkk/k3CF1VtM1DuJJYrDdFiitoIFd0QSzAHPcVBJ8eyEiP3RCr47B4LiRyjN2WTWt7yR71IZZpN5CmVmm2lNkqaT895pd0VCNMtfUsrER+/B+0YzpPlbv/VzXXqQGugx5kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748611339; c=relaxed/simple;
	bh=/glXxVIUX3Lkvtyv1AnTEzXXTMaFApTASZOcFqF2dxk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=eNRviIO9lcJO2XzR3yQeNAKwNEgRU9kBm3BMlk4qhjVqF7rl3oFziOpTMrcCNdi7pgPqDfNVI4NNywdBBKriXZ0TsaCY2EbHdLb3gqiQeM0HcH2bg2e8ehNmty9iwU220YikvmXSyu/qcAa8eKfRGtunI+HkOPECP4tDTB3MLLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=R+3eM1cj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBLtcq006927;
	Fri, 30 May 2025 13:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oYRXORZtPZ/uF0d0fKcWvwiKsguVoi8Dv3KJNw2PjlI=; b=R+3eM1cjaTXI1doE
	NdTYKM2qNSYR4RfTcD9VUn2W3mBS6J0K0SG4CPS6ZBajCZv4QgqRlW0rJhgE026X
	3BhUk38bDMuOD6Gxm/U2CVJ+VkG8/nhFhY7tjK8IBMfzVJ7ec+cmk9TpNiFfrIri
	wHMqvRD0Kx+vNC0qVj4rIcKEJtPG0tKUmOz/C/IhL+JsjYUuj99zEepJEEalPb7m
	HXhHI6ORMFqHyEsURuV2HascguIIEXfrVNnwgOivkRqFmSTVXBYuTu/FeEclKm74
	6AEoFET4kHgwdBCLQGaE/gXuOlD8UG1PPDnTvPkWeXv/u1gWY2VJTbXSLK9iw5bX
	vskGrA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fqhamr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 13:22:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54UDMCrI015989
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 13:22:12 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 30 May
 2025 06:22:06 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Fri, 30 May 2025 18:50:57 +0530
Subject: [PATCH v5 12/18] clk: qcom: camcc-x1e80100: Move PLL & clk
 configuration to really probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250530-videocc-pll-multi-pd-voting-v5-12-02303b3a582d@quicinc.com>
References: <20250530-videocc-pll-multi-pd-voting-v5-0-02303b3a582d@quicinc.com>
In-Reply-To: <20250530-videocc-pll-multi-pd-voting-v5-0-02303b3a582d@quicinc.com>
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
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _gRiCBBgO-8FGM_iq4lt5_UWwnfn_T2E
X-Proofpoint-ORIG-GUID: _gRiCBBgO-8FGM_iq4lt5_UWwnfn_T2E
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=6839b105 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=ytWGrkJ68uyaVPSImB0A:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDExNiBTYWx0ZWRfX9y3fjOX15W7+
 oxGhsBQ3BYjQh6x7qnouuAyHOisXDf6OLWYNl5bQL/eP2DHcB69HKDtpRPcFstSPe35T5X5fwc/
 2EVYunzfpqm/lhgJYYE4FbKWM8UkB2r2biOlAQg+splZvVltrqsLLfSGs0f3PKsNB9AKXEwpde9
 Err+CdhI9IZKPi1c0cZo31s10W3gjUWN1RHW5ZpGYiwMutZFLvr4hQomkPfuF6zQnldKY/fEctV
 wOaaZfwi5/75TGt5VKZInBBC1piH4WB6htMAau7c3RtqtYMCSq9zLUB9aUYG01MAY1N9jB9Wh8j
 2Un/ONqVF5+uAymGIVQvHuyFGfiGfZOmp0Xa3lg5f+mP1bp4vi3z9Rm49SIF4o+3gv2frkK34dm
 cYw37inPV8KDzUMQkTF/GnO8aq8nqTlRSRFlsPvx2xCApdrCxDBioYJmkDw0iS8WlTWG6ntT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_05,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505300116

Camera PLLs on X1E80100 require both MMCX and MXC rails to be kept ON
to configure the PLLs properly. Hence move runtime power management,
PLL configuration and enabling critical clocks to qcom_cc_really_probe()
which ensures all required power domains are in enabled state before
configuring the PLLs or enabling the clocks.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # Dell Inspiron
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
 drivers/clk/qcom/camcc-x1e80100.c | 67 +++++++++++++++++++--------------------
 1 file changed, 32 insertions(+), 35 deletions(-)

diff --git a/drivers/clk/qcom/camcc-x1e80100.c b/drivers/clk/qcom/camcc-x1e80100.c
index b73524ae64b1b2b1ee94ceca88b5f3b46143f20b..cbcc1c9fcb341e51272f5595f574f9cb7ef2b52e 100644
--- a/drivers/clk/qcom/camcc-x1e80100.c
+++ b/drivers/clk/qcom/camcc-x1e80100.c
@@ -7,7 +7,6 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
@@ -67,6 +66,7 @@ static const struct alpha_pll_config cam_cc_pll0_config = {
 
 static struct clk_alpha_pll cam_cc_pll0 = {
 	.offset = 0x0,
+	.config = &cam_cc_pll0_config,
 	.vco_table = lucid_ole_vco,
 	.num_vco = ARRAY_SIZE(lucid_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
@@ -144,6 +144,7 @@ static const struct alpha_pll_config cam_cc_pll1_config = {
 
 static struct clk_alpha_pll cam_cc_pll1 = {
 	.offset = 0x1000,
+	.config = &cam_cc_pll1_config,
 	.vco_table = lucid_ole_vco,
 	.num_vco = ARRAY_SIZE(lucid_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
@@ -194,6 +195,7 @@ static const struct alpha_pll_config cam_cc_pll2_config = {
 
 static struct clk_alpha_pll cam_cc_pll2 = {
 	.offset = 0x2000,
+	.config = &cam_cc_pll2_config,
 	.vco_table = rivian_ole_vco,
 	.num_vco = ARRAY_SIZE(rivian_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_RIVIAN_EVO],
@@ -225,6 +227,7 @@ static const struct alpha_pll_config cam_cc_pll3_config = {
 
 static struct clk_alpha_pll cam_cc_pll3 = {
 	.offset = 0x3000,
+	.config = &cam_cc_pll3_config,
 	.vco_table = lucid_ole_vco,
 	.num_vco = ARRAY_SIZE(lucid_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
@@ -279,6 +282,7 @@ static const struct alpha_pll_config cam_cc_pll4_config = {
 
 static struct clk_alpha_pll cam_cc_pll4 = {
 	.offset = 0x4000,
+	.config = &cam_cc_pll4_config,
 	.vco_table = lucid_ole_vco,
 	.num_vco = ARRAY_SIZE(lucid_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
@@ -333,6 +337,7 @@ static const struct alpha_pll_config cam_cc_pll6_config = {
 
 static struct clk_alpha_pll cam_cc_pll6 = {
 	.offset = 0x6000,
+	.config = &cam_cc_pll6_config,
 	.vco_table = lucid_ole_vco,
 	.num_vco = ARRAY_SIZE(lucid_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
@@ -387,6 +392,7 @@ static const struct alpha_pll_config cam_cc_pll8_config = {
 
 static struct clk_alpha_pll cam_cc_pll8 = {
 	.offset = 0x8000,
+	.config = &cam_cc_pll8_config,
 	.vco_table = lucid_ole_vco,
 	.num_vco = ARRAY_SIZE(lucid_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
@@ -2418,6 +2424,21 @@ static const struct qcom_reset_map cam_cc_x1e80100_resets[] = {
 	[CAM_CC_SFE_0_BCR] = { 0x1327c },
 };
 
+static struct clk_alpha_pll *cam_cc_x1e80100_plls[] = {
+	&cam_cc_pll0,
+	&cam_cc_pll1,
+	&cam_cc_pll2,
+	&cam_cc_pll3,
+	&cam_cc_pll4,
+	&cam_cc_pll6,
+	&cam_cc_pll8,
+};
+
+static u32 cam_cc_x1e80100_critical_cbcrs[] = {
+	0x13a9c, /* CAM_CC_GDSC_CLK */
+	0x13ab8, /* CAM_CC_SLEEP_CLK */
+};
+
 static const struct regmap_config cam_cc_x1e80100_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -2426,6 +2447,13 @@ static const struct regmap_config cam_cc_x1e80100_regmap_config = {
 	.fast_io = true,
 };
 
+static struct qcom_cc_driver_data cam_cc_x1e80100_driver_data = {
+	.alpha_plls = cam_cc_x1e80100_plls,
+	.num_alpha_plls = ARRAY_SIZE(cam_cc_x1e80100_plls),
+	.clk_cbcrs = cam_cc_x1e80100_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(cam_cc_x1e80100_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc cam_cc_x1e80100_desc = {
 	.config = &cam_cc_x1e80100_regmap_config,
 	.clks = cam_cc_x1e80100_clocks,
@@ -2434,6 +2462,8 @@ static const struct qcom_cc_desc cam_cc_x1e80100_desc = {
 	.num_resets = ARRAY_SIZE(cam_cc_x1e80100_resets),
 	.gdscs = cam_cc_x1e80100_gdscs,
 	.num_gdscs = ARRAY_SIZE(cam_cc_x1e80100_gdscs),
+	.use_rpm = true,
+	.driver_data = &cam_cc_x1e80100_driver_data,
 };
 
 static const struct of_device_id cam_cc_x1e80100_match_table[] = {
@@ -2444,40 +2474,7 @@ MODULE_DEVICE_TABLE(of, cam_cc_x1e80100_match_table);
 
 static int cam_cc_x1e80100_probe(struct platform_device *pdev)
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
-	regmap = qcom_cc_map(pdev, &cam_cc_x1e80100_desc);
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
-	clk_lucid_ole_pll_configure(&cam_cc_pll6, regmap, &cam_cc_pll6_config);
-	clk_lucid_ole_pll_configure(&cam_cc_pll8, regmap, &cam_cc_pll8_config);
-
-	/* Keep clocks always enabled */
-	qcom_branch_set_clk_en(regmap, 0x13a9c); /* CAM_CC_GDSC_CLK */
-	qcom_branch_set_clk_en(regmap, 0x13ab8); /* CAM_CC_SLEEP_CLK */
-
-	ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_x1e80100_desc, regmap);
-
-	pm_runtime_put(&pdev->dev);
-
-	return ret;
+	return qcom_cc_probe(pdev, &cam_cc_x1e80100_desc);
 }
 
 static struct platform_driver cam_cc_x1e80100_driver = {

-- 
2.34.1


