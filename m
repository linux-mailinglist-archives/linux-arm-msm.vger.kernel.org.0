Return-Path: <linux-arm-msm+bounces-57956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12542AB754F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1EFE1BA5614
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC5A928DF3B;
	Wed, 14 May 2025 19:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QeIjmqln"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E771A28DF22;
	Wed, 14 May 2025 19:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747249809; cv=none; b=elnkK7KZS03k/E5li+e91Ki6rmRjTfOBz104UvWF9rT7I1ogpZjOm2UZUH0MhxecQQrCHxkn+/Vl2eyRYAmsEZ5LaC6rnqHKmvohCMneVY163xhilqr5i/VXUmZC5cTv1q82o8siWKtTzNdMttcGH4kwA8+wNJgnxYjSBdfGONs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747249809; c=relaxed/simple;
	bh=BdWXbsYeGUiWRtZJKld0edVN//MSLHq/XTBF7mhjf64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=XfbOB7KLfjRNuUlv/R1z876t83plDu4OJQF9BiHugzGavkTJpY7BUCnBop6EeF94Hi3OK2wpo4ROitekA5ZCYKHCpgIVFMbrS03L/fKNWExgTSnodpsEOfPwE75ogwUMhbHPMbRH7Co2nWU3ORejhSG32b7XL8s6okQHw9+WFc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QeIjmqln; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuoB9020356;
	Wed, 14 May 2025 19:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z065j1EIaWFGQ0Zqz4nwW5nwtLGRXZK+1mQFZlnl7SM=; b=QeIjmqlnQ98vHJcs
	jNdIAIKz+Io1wAmIngYXW5yHNPSwvS+5t5AW1inSFySmZH6AFaV3shaRX5Dw1158
	mmbIjQyKPtB7eOOPl4KeVu9g5ZyyDZk/UwtlemVIMxGqWWaplKuYQE+bGn6lYexK
	HefQrsgFa0Uf2GDOBM0OGnU/UK7plYEmwWcQ5RSOOwXYkTfT9KHSQFDwhNeYqx4S
	4CL8l6gFrOdhqef79uKcPbUNCv0lgA/YDs4NsyV7wJKWsNtSVC/aXbV3neg/5jXR
	rj63cF01sY7+DMrokCeDEURGimGiPIVkZg3XPU/B9cpaBskK1t0LQ86MLtY7fJxI
	Y7Tg0w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnkshw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 19:10:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54EJA14S030953
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 19:10:01 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 May
 2025 12:09:55 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Thu, 15 May 2025 00:38:53 +0530
Subject: [PATCH v4 08/18] clk: qcom: videocc-sm8550: Move PLL & clk
 configuration to really probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250515-videocc-pll-multi-pd-voting-v4-8-571c63297d01@quicinc.com>
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
X-Proofpoint-ORIG-GUID: uvHRytM-d6IxJ1UxNfIXrXTAo9aDBsR1
X-Authority-Analysis: v=2.4 cv=aIbwqa9m c=1 sm=1 tr=0 ts=6824ea8a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=NSTayzwvANHeSgS_AzkA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: uvHRytM-d6IxJ1UxNfIXrXTAo9aDBsR1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NCBTYWx0ZWRfXyj/Gm70U5HUk
 MPaen/tZzluAyRTElqkH8xNDETqecV3qFCdwBSKYJLHucX/Aqu0eK5whzSgZNt6IBj+xHgKSie/
 B2jltJQxOyRi6FEIzcXdF1khPCUrcl4h3d+HSr7N3NImCLWE+njpNrlVKlaxDailEBEG4W3OPKj
 oSmN0PtZMdlNCDY246mi0hvh1N+lGt65S8EK4IeQc9k9+0ROxJpXMcEhpdEByX1JWH9LD4qmJ4x
 e3c9mHqqdPpHxLh6YnVlHSMRAsU9r8ae/FT0ADm7JUgbvktnIz6PXqdCNntiJtNA5ej0xCuxCrZ
 /J2pqjMxIWZ48NtBwK9uEKolWde6OYp+xpMuLG4ETv5TBNnTmO/ZZhCGoERlMHtNInk0MEfdgXK
 8YmHjHu2AeH+Ge5JgFF4BUg5Knkv6IlNE2vuKSjNk5p4AXGOAS1LZ17OdmVMlhLktsxfnRei
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140174

Video PLLs on SM8550/SM8650 require both MMCX and MXC rails to be kept ON
to configure the PLLs properly. Hence move runtime power management, PLL
configuration and enable critical clocks to qcom_cc_really_probe() which
ensures all required power domains are in enabled state before configuring
the PLLs or enabling the clocks.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
 drivers/clk/qcom/videocc-sm8550.c | 59 +++++++++++++++++----------------------
 1 file changed, 26 insertions(+), 33 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8550.c b/drivers/clk/qcom/videocc-sm8550.c
index fcfe0cade6d0a95e749aabbc2af1174e5a70f0db..81a9ffe88273e348e9a5747dfacc9aa22263f465 100644
--- a/drivers/clk/qcom/videocc-sm8550.c
+++ b/drivers/clk/qcom/videocc-sm8550.c
@@ -7,7 +7,6 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,sm8650-videocc.h>
@@ -51,6 +50,7 @@ static struct alpha_pll_config video_cc_pll0_config = {
 
 static struct clk_alpha_pll video_cc_pll0 = {
 	.offset = 0x0,
+	.config = &video_cc_pll0_config,
 	.vco_table = lucid_ole_vco,
 	.num_vco = ARRAY_SIZE(lucid_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
@@ -82,6 +82,7 @@ static struct alpha_pll_config video_cc_pll1_config = {
 
 static struct clk_alpha_pll video_cc_pll1 = {
 	.offset = 0x1000,
+	.config = &video_cc_pll1_config,
 	.vco_table = lucid_ole_vco,
 	.num_vco = ARRAY_SIZE(lucid_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
@@ -511,6 +512,17 @@ static const struct qcom_reset_map video_cc_sm8550_resets[] = {
 	[VIDEO_CC_XO_CLK_ARES] = { .reg = 0x8124, .bit = 2, .udelay = 100 },
 };
 
+static struct clk_alpha_pll *video_cc_sm8550_plls[] = {
+	&video_cc_pll0,
+	&video_cc_pll1,
+};
+
+static u32 video_cc_sm8550_critical_cbcrs[] = {
+	0x80f4, /* VIDEO_CC_AHB_CLK */
+	0x8124, /* VIDEO_CC_XO_CLK */
+	0x8140, /* VIDEO_CC_SLEEP_CLK */
+};
+
 static const struct regmap_config video_cc_sm8550_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -519,6 +531,13 @@ static const struct regmap_config video_cc_sm8550_regmap_config = {
 	.fast_io = true,
 };
 
+static struct qcom_cc_driver_data video_cc_sm8550_driver_data = {
+	.alpha_plls = video_cc_sm8550_plls,
+	.num_alpha_plls = ARRAY_SIZE(video_cc_sm8550_plls),
+	.clk_cbcrs = video_cc_sm8550_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(video_cc_sm8550_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc video_cc_sm8550_desc = {
 	.config = &video_cc_sm8550_regmap_config,
 	.clks = video_cc_sm8550_clocks,
@@ -527,6 +546,8 @@ static const struct qcom_cc_desc video_cc_sm8550_desc = {
 	.num_resets = ARRAY_SIZE(video_cc_sm8550_resets),
 	.gdscs = video_cc_sm8550_gdscs,
 	.num_gdscs = ARRAY_SIZE(video_cc_sm8550_gdscs),
+	.use_rpm = true,
+	.driver_data = &video_cc_sm8550_driver_data,
 };
 
 static const struct of_device_id video_cc_sm8550_match_table[] = {
@@ -538,26 +559,7 @@ MODULE_DEVICE_TABLE(of, video_cc_sm8550_match_table);
 
 static int video_cc_sm8550_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-	u32 sleep_clk_offset = 0x8140;
-
-	ret = devm_pm_runtime_enable(&pdev->dev);
-	if (ret)
-		return ret;
-
-	ret = pm_runtime_resume_and_get(&pdev->dev);
-	if (ret)
-		return ret;
-
-	regmap = qcom_cc_map(pdev, &video_cc_sm8550_desc);
-	if (IS_ERR(regmap)) {
-		pm_runtime_put(&pdev->dev);
-		return PTR_ERR(regmap);
-	}
-
 	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8650-videocc")) {
-		sleep_clk_offset = 0x8150;
 		video_cc_pll0_config.l = 0x1e;
 		video_cc_pll0_config.alpha = 0xa000;
 		video_cc_pll1_config.l = 0x2b;
@@ -569,21 +571,12 @@ static int video_cc_sm8550_probe(struct platform_device *pdev)
 		video_cc_sm8550_clocks[VIDEO_CC_MVS1_SHIFT_CLK] = &video_cc_mvs1_shift_clk.clkr;
 		video_cc_sm8550_clocks[VIDEO_CC_MVS1C_SHIFT_CLK] = &video_cc_mvs1c_shift_clk.clkr;
 		video_cc_sm8550_clocks[VIDEO_CC_XO_CLK_SRC] = &video_cc_xo_clk_src.clkr;
-	}
-
-	clk_lucid_ole_pll_configure(&video_cc_pll0, regmap, &video_cc_pll0_config);
-	clk_lucid_ole_pll_configure(&video_cc_pll1, regmap, &video_cc_pll1_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x80f4); /* VIDEO_CC_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, sleep_clk_offset); /* VIDEO_CC_SLEEP_CLK */
-	qcom_branch_set_clk_en(regmap, 0x8124); /* VIDEO_CC_XO_CLK */
-
-	ret = qcom_cc_really_probe(&pdev->dev, &video_cc_sm8550_desc, regmap);
-
-	pm_runtime_put(&pdev->dev);
+		/* Sleep clock offset changed to 0x8150 on SM8650 */
+		video_cc_sm8550_critical_cbcrs[2] = 0x8150;
+	}
 
-	return ret;
+	return qcom_cc_probe(pdev, &video_cc_sm8550_desc);
 }
 
 static struct platform_driver video_cc_sm8550_driver = {

-- 
2.34.1


