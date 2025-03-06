Return-Path: <linux-arm-msm+bounces-50463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BCBA54587
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 09:57:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A83291890D53
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 08:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C711520A5E1;
	Thu,  6 Mar 2025 08:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B8yQ10hF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B90220A5D7;
	Thu,  6 Mar 2025 08:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741251382; cv=none; b=LFX1zCdfvFwvM7+ScewWBG1ykLlEWPEVAWn1dv4+GPyFOt5V4ag9dLO8mbSjZ3h14NfndshGrg3HiaLsxg+zNgd1R2DbrE9hzi8+XE9vaePmeApE6eAueHqpkWpcLDGekD5Odh4CDJ3RzqgmNScKe+JM9Sld0RFuRGcPj0utuzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741251382; c=relaxed/simple;
	bh=o5gCBG0HH4MJt3pB9QB5qT4k2dh8xT4ltaEZlRUmo9s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=bXgxk9Z8j1y7t/UD5W/XWL/4zl7VtOPiTDXp7DzncRONK8kTQ6vgsrNJ/GV+bsj8/+lywaFWj8qAbB3SqjOnPYxFzg0KQDuTUokt90RajSW50Hiwgnez6RitA9lciikBA46mcSx2p3LN/CySoBu2uW1DaBxVXiSogCPXLNdd4rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B8yQ10hF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5267uJTp028581;
	Thu, 6 Mar 2025 08:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fr/Ntg7Ud3URnnoOciE2rAYV0TF7u2RLXJTW0bmCbv8=; b=B8yQ10hFeQ9yqz6Y
	IULru++6cu4/bquy9NaE88AqJ87uAl1I4376iLE4bg2jadIAwqWcIW2gcXsUA5oE
	TPvv7j/4IG7nTEnEIO68z1ua/BAInwihz8VC6HM3q7LlW2yYaSOgnCZqcQ+WqdNl
	aKdhmyxyx0/BlIWEMPZBcxBtE7WKtkpxBY2JOzNf5MrA+URmbWoRjh3U5NjeCY5G
	gy8ZZySr06uKIQdfnN218uj8bx1mq2oPcP0yjkhMvW1EXyxa+p0ZWErO/Bbr3kND
	oEKErrg+y/IfcgtvnTo8zxdLS7Pqn1RTPirDZChsd60OyzcQkV4DGGLgiKOMK/Gg
	InoMbw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4577rpg5cb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 08:56:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5268uGwC001486
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 08:56:16 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Mar 2025
 00:56:11 -0800
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Thu, 6 Mar 2025 14:25:37 +0530
Subject: [PATCH v2 5/8] clk: qcom: videocc-sm8550: Move PLL & clk
 configuration to really probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250306-videocc-pll-multi-pd-voting-v2-5-0cd00612bc0e@quicinc.com>
References: <20250306-videocc-pll-multi-pd-voting-v2-0-0cd00612bc0e@quicinc.com>
In-Reply-To: <20250306-videocc-pll-multi-pd-voting-v2-0-0cd00612bc0e@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EYQyQOmC c=1 sm=1 tr=0 ts=67c96331 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=b1qG8djl-PuVWaYtoygA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: pKzi_X7_xqd_s1vsb2jwLoZAZbEBL42o
X-Proofpoint-GUID: pKzi_X7_xqd_s1vsb2jwLoZAZbEBL42o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_04,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 suspectscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060067

Video PLLs on SM8550/SM8650 require both MMCX and MXC rails to be kept ON
to configure the PLLs properly. Hence move the PLL configuration and
enable critical clocks to qcom_cc_really_probe() which ensures all
required power domains are in enabled state before configuring the PLLs
or enabling the clocks.

Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
 drivers/clk/qcom/videocc-sm8550.c | 50 ++++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 27 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8550.c b/drivers/clk/qcom/videocc-sm8550.c
index 7c25a50cfa970dff55d701cb24bc3aa5924ca12d..a1076b5bc2759c0149fa00904c81064f3381254b 100644
--- a/drivers/clk/qcom/videocc-sm8550.c
+++ b/drivers/clk/qcom/videocc-sm8550.c
@@ -51,6 +51,7 @@ static struct alpha_pll_config video_cc_pll0_config = {
 
 static struct clk_alpha_pll video_cc_pll0 = {
 	.offset = 0x0,
+	.config = &video_cc_pll0_config,
 	.vco_table = lucid_ole_vco,
 	.num_vco = ARRAY_SIZE(lucid_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
@@ -82,6 +83,7 @@ static struct alpha_pll_config video_cc_pll1_config = {
 
 static struct clk_alpha_pll video_cc_pll1 = {
 	.offset = 0x1000,
+	.config = &video_cc_pll1_config,
 	.vco_table = lucid_ole_vco,
 	.num_vco = ARRAY_SIZE(lucid_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
@@ -511,6 +513,17 @@ static const struct qcom_reset_map video_cc_sm8550_resets[] = {
 	[VIDEO_CC_XO_CLK_ARES] = { .reg = 0x8124, .bit = 2, .udelay = 100 },
 };
 
+static struct clk_alpha_pll *video_cc_sm8550_plls[] = {
+	&video_cc_pll0,
+	&video_cc_pll1,
+};
+
+static struct qcom_clk_cfg video_cc_sm8550_clocks_cfg[] = {
+	{ .offset = 0x80f4, .mask = BIT(0) }, /* VIDEO_CC_AHB_CLK */
+	{ .offset = 0x8124, .mask = BIT(0) }, /* VIDEO_CC_XO_CLK */
+	{ .offset = 0x8140, .mask = BIT(0) }, /* VIDEO_CC_SLEEP_CLK */
+};
+
 static const struct regmap_config video_cc_sm8550_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -527,6 +540,11 @@ static struct qcom_cc_desc video_cc_sm8550_desc = {
 	.num_resets = ARRAY_SIZE(video_cc_sm8550_resets),
 	.gdscs = video_cc_sm8550_gdscs,
 	.num_gdscs = ARRAY_SIZE(video_cc_sm8550_gdscs),
+	.plls = video_cc_sm8550_plls,
+	.num_plls = ARRAY_SIZE(video_cc_sm8550_plls),
+	.clks_cfg = video_cc_sm8550_clocks_cfg,
+	.num_clks_cfg = ARRAY_SIZE(video_cc_sm8550_clocks_cfg),
+	.use_rpm = true,
 };
 
 static const struct of_device_id video_cc_sm8550_match_table[] = {
@@ -539,25 +557,12 @@ MODULE_DEVICE_TABLE(of, video_cc_sm8550_match_table);
 static int video_cc_sm8550_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap;
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
 
 	regmap = qcom_cc_map(pdev, &video_cc_sm8550_desc);
-	if (IS_ERR(regmap)) {
-		pm_runtime_put(&pdev->dev);
+	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
-	}
 
 	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8650-videocc")) {
-		sleep_clk_offset = 0x8150;
 		video_cc_pll0_config.l = 0x1e;
 		video_cc_pll0_config.alpha = 0xa000;
 		video_cc_pll1_config.l = 0x2b;
@@ -569,21 +574,12 @@ static int video_cc_sm8550_probe(struct platform_device *pdev)
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
+		video_cc_sm8550_clocks_cfg[2].offset = 0x8150;
+	}
 
-	return ret;
+	return qcom_cc_really_probe(&pdev->dev, &video_cc_sm8550_desc, regmap);
 }
 
 static struct platform_driver video_cc_sm8550_driver = {

-- 
2.34.1


