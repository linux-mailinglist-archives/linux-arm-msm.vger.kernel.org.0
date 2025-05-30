Return-Path: <linux-arm-msm+bounces-59900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D9BAC8FFD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 15:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E25107ADB9E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 13:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3B01230BE6;
	Fri, 30 May 2025 13:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HE9VxQdc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E12230BDC;
	Fri, 30 May 2025 13:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748611333; cv=none; b=jL7ZNUj6vdfmxpmMtFy+Gnz/K2AMyknTpG18iJssEwI4iFJlezuevSfp4yxGOoGnJe9NbF+inrAys412APddcWkdqPiWPjKicBV/dikdPYYUQDtCyJ9WkDeMlSnANeFc8z0YCk2jcs0Uh0/RqoUcKXGZavs8RlEDrEUn5dXIm9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748611333; c=relaxed/simple;
	bh=27X5360gaJSz/+hHzqLtx2WVDiFdHYah7M/vMkGD0mc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=pN+aKy2qyEO4RfWynO9Wd2C5e+8GcY6hMsNPO9EA8gz65+8dqC/tUHYanQtrFOJrft8oABNGmd47A7hoq1EtejRWnI27gy+BQbQkBb0vWYSyz4+07Fx2S7o7TxBiwL9O9AD/+HmNcXO2gUWbPFI6MMO9lh+++mr2K1hRNuPUaoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HE9VxQdc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UAF7FL026952;
	Fri, 30 May 2025 13:22:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GuiD6plpNOfzmXwPocISp//9Wbe57p9Fas0hrQNHLrI=; b=HE9VxQdcFJT+T1Id
	EYEoeDs9qTOVCa645NzodFS04nVhpZcUqmAXBJJcBMw3Mm9TkOYq0Db6G7Qz9w5f
	d+rL6FNRY/P2KPICi6nu50P63iSQ7M0oSgRxJmGB6/GZ0TiKnnupfBvbn3WAXzRz
	fkVQFh7DIiRJm6zTUXCwdFtPRMnx0V4pPG+pQVNn+aeaB0zXkx/zrQhrTclbEs1z
	voO+SL/1l6YHleI/8u6KOn8nHB/HeVDzUP2r+ZhVe0tQJBMaTtDX0FSjoe7KybRi
	4hnvdmDWDOHcvWU/kx4weR9qBRr/5Pltx3lDTsMzGrnlLTBXJoQe6DNgkcjpdccr
	8dNYoQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46yarh0gku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 13:22:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54UDM60E015866
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 13:22:06 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 30 May
 2025 06:22:00 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Fri, 30 May 2025 18:50:56 +0530
Subject: [PATCH v5 11/18] clk: qcom: camcc-sm8650: Move PLL & clk
 configuration to really probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250530-videocc-pll-multi-pd-voting-v5-11-02303b3a582d@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDExNiBTYWx0ZWRfX4BvRZ7KXu2Vz
 uYwlLf/y1g61sylWWytQJdeyQoA/9bP5rDFCB33Ey3b7+KBI54bdqneY3OP49tWbjoQf3FFTaVb
 m3IGJRUDsYCAqqjA0JLZ3J8ww0rN/YMblsHCy7gYwGSQGTKSi+qUqtBQ5Tu8le9MeNyaNA5YUxh
 V4uxxrpuDzHZEK9qA3vcQhA2Rd6dDfFzE3QV8F+v4E/qTBsHpWMkoCWT+j55nVwXWeQ1IahvXC1
 +WEmgxqjV5w2O8FDSgqk484ElvIRmXVnZkpIrEvuOl/VULyxq3PsTEQRlJrWZCjq3oNXvZMHoZf
 7GK8/s8qcZhz6IQlBYKKsrSQiFMo6WoeM2P/H8tR+5ncsijp6W0e65bf+R8AHSahTXofbz4UjKx
 wN0FvmifxvlXRGAKGM+QnWmkGOmhDwOWYcfcPrSfDqzz2QGGleClRw2mC718BlSJtivyjHRd
X-Authority-Analysis: v=2.4 cv=EfHIQOmC c=1 sm=1 tr=0 ts=6839b0ff cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=s2paB303WvPZy8Ug-xUA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: B1InAR2O-SzLFYvP3UvP4Tza0VPVol-0
X-Proofpoint-ORIG-GUID: B1InAR2O-SzLFYvP3UvP4Tza0VPVol-0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_05,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505300116

Camera PLLs on SM8650 require both MMCX and MXC rails to be kept ON
to configure the PLLs properly. Hence move runtime power management,
PLL configuration and enabling critical clocks to qcom_cc_really_probe()
which ensures all required power domains are in enabled state before
configuring the PLLs or enabling the clocks.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
 drivers/clk/qcom/camcc-sm8650.c | 83 +++++++++++++++++++++--------------------
 1 file changed, 42 insertions(+), 41 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sm8650.c b/drivers/clk/qcom/camcc-sm8650.c
index 0ccd6de8ba78a3493f8f853a4330d2676b5743d4..8b388904f56fc3b3f77a43a09f735ace24b9fcf7 100644
--- a/drivers/clk/qcom/camcc-sm8650.c
+++ b/drivers/clk/qcom/camcc-sm8650.c
@@ -7,7 +7,6 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,sm8650-camcc.h>
@@ -72,6 +71,7 @@ static const struct alpha_pll_config cam_cc_pll0_config = {
 
 static struct clk_alpha_pll cam_cc_pll0 = {
 	.offset = 0x0,
+	.config = &cam_cc_pll0_config,
 	.vco_table = lucid_ole_vco,
 	.num_vco = ARRAY_SIZE(lucid_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
@@ -149,6 +149,7 @@ static const struct alpha_pll_config cam_cc_pll1_config = {
 
 static struct clk_alpha_pll cam_cc_pll1 = {
 	.offset = 0x1000,
+	.config = &cam_cc_pll1_config,
 	.vco_table = lucid_ole_vco,
 	.num_vco = ARRAY_SIZE(lucid_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
@@ -199,6 +200,7 @@ static const struct alpha_pll_config cam_cc_pll2_config = {
 
 static struct clk_alpha_pll cam_cc_pll2 = {
 	.offset = 0x2000,
+	.config = &cam_cc_pll2_config,
 	.vco_table = rivian_ole_vco,
 	.num_vco = ARRAY_SIZE(rivian_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_RIVIAN_EVO],
@@ -230,6 +232,7 @@ static const struct alpha_pll_config cam_cc_pll3_config = {
 
 static struct clk_alpha_pll cam_cc_pll3 = {
 	.offset = 0x3000,
+	.config = &cam_cc_pll3_config,
 	.vco_table = lucid_ole_vco,
 	.num_vco = ARRAY_SIZE(lucid_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
@@ -284,6 +287,7 @@ static const struct alpha_pll_config cam_cc_pll4_config = {
 
 static struct clk_alpha_pll cam_cc_pll4 = {
 	.offset = 0x4000,
+	.config = &cam_cc_pll4_config,
 	.vco_table = lucid_ole_vco,
 	.num_vco = ARRAY_SIZE(lucid_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
@@ -338,6 +342,7 @@ static const struct alpha_pll_config cam_cc_pll5_config = {
 
 static struct clk_alpha_pll cam_cc_pll5 = {
 	.offset = 0x5000,
+	.config = &cam_cc_pll5_config,
 	.vco_table = lucid_ole_vco,
 	.num_vco = ARRAY_SIZE(lucid_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
@@ -392,6 +397,7 @@ static const struct alpha_pll_config cam_cc_pll6_config = {
 
 static struct clk_alpha_pll cam_cc_pll6 = {
 	.offset = 0x6000,
+	.config = &cam_cc_pll6_config,
 	.vco_table = lucid_ole_vco,
 	.num_vco = ARRAY_SIZE(lucid_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
@@ -446,6 +452,7 @@ static const struct alpha_pll_config cam_cc_pll7_config = {
 
 static struct clk_alpha_pll cam_cc_pll7 = {
 	.offset = 0x7000,
+	.config = &cam_cc_pll7_config,
 	.vco_table = lucid_ole_vco,
 	.num_vco = ARRAY_SIZE(lucid_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
@@ -500,6 +507,7 @@ static const struct alpha_pll_config cam_cc_pll8_config = {
 
 static struct clk_alpha_pll cam_cc_pll8 = {
 	.offset = 0x8000,
+	.config = &cam_cc_pll8_config,
 	.vco_table = lucid_ole_vco,
 	.num_vco = ARRAY_SIZE(lucid_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
@@ -554,6 +562,7 @@ static const struct alpha_pll_config cam_cc_pll9_config = {
 
 static struct clk_alpha_pll cam_cc_pll9 = {
 	.offset = 0x9000,
+	.config = &cam_cc_pll9_config,
 	.vco_table = lucid_ole_vco,
 	.num_vco = ARRAY_SIZE(lucid_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
@@ -631,6 +640,7 @@ static const struct alpha_pll_config cam_cc_pll10_config = {
 
 static struct clk_alpha_pll cam_cc_pll10 = {
 	.offset = 0xa000,
+	.config = &cam_cc_pll10_config,
 	.vco_table = lucid_ole_vco,
 	.num_vco = ARRAY_SIZE(lucid_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
@@ -3509,6 +3519,27 @@ static const struct qcom_reset_map cam_cc_sm8650_resets[] = {
 	[CAM_CC_SFE_2_BCR] = { 0x130f4 },
 };
 
+static struct clk_alpha_pll *cam_cc_sm8650_plls[] = {
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
+};
+
+static u32 cam_cc_sm8650_critical_cbcrs[] = {
+	0x132ec, /* CAM_CC_GDSC_CLK */
+	0x13308, /* CAM_CC_SLEEP_CLK */
+	0x13314, /* CAM_CC_DRV_XO_CLK */
+	0x13318, /* CAM_CC_DRV_AHB_CLK */
+};
+
 static const struct regmap_config cam_cc_sm8650_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -3517,6 +3548,13 @@ static const struct regmap_config cam_cc_sm8650_regmap_config = {
 	.fast_io = true,
 };
 
+static struct qcom_cc_driver_data cam_cc_sm8650_driver_data = {
+	.alpha_plls = cam_cc_sm8650_plls,
+	.num_alpha_plls = ARRAY_SIZE(cam_cc_sm8650_plls),
+	.clk_cbcrs = cam_cc_sm8650_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(cam_cc_sm8650_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc cam_cc_sm8650_desc = {
 	.config = &cam_cc_sm8650_regmap_config,
 	.clks = cam_cc_sm8650_clocks,
@@ -3525,6 +3563,8 @@ static const struct qcom_cc_desc cam_cc_sm8650_desc = {
 	.num_resets = ARRAY_SIZE(cam_cc_sm8650_resets),
 	.gdscs = cam_cc_sm8650_gdscs,
 	.num_gdscs = ARRAY_SIZE(cam_cc_sm8650_gdscs),
+	.use_rpm = true,
+	.driver_data = &cam_cc_sm8650_driver_data,
 };
 
 static const struct of_device_id cam_cc_sm8650_match_table[] = {
@@ -3535,46 +3575,7 @@ MODULE_DEVICE_TABLE(of, cam_cc_sm8650_match_table);
 
 static int cam_cc_sm8650_probe(struct platform_device *pdev)
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
-	regmap = qcom_cc_map(pdev, &cam_cc_sm8650_desc);
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
-
-	/* Keep clocks always enabled */
-	qcom_branch_set_clk_en(regmap, 0x13318); /* CAM_CC_DRV_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x13314); /* CAM_CC_DRV_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x132ec); /* CAM_CC_GDSC_CLK */
-	qcom_branch_set_clk_en(regmap, 0x13308); /* CAM_CC_SLEEP_CLK */
-
-	ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_sm8650_desc, regmap);
-
-	pm_runtime_put(&pdev->dev);
-
-	return ret;
+	return qcom_cc_probe(pdev, &cam_cc_sm8650_desc);
 }
 
 static struct platform_driver cam_cc_sm8650_driver = {

-- 
2.34.1


