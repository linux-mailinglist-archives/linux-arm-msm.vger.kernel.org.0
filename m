Return-Path: <linux-arm-msm+bounces-50462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 510C4A54583
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 09:56:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4A0616FAEB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 08:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3CBE209F4F;
	Thu,  6 Mar 2025 08:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kliz8Mk4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388EC209F49;
	Thu,  6 Mar 2025 08:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741251377; cv=none; b=mg18VFFDMY4tq681AB8kkmGnyz1uCajcDhZpDj3oSQyhmGZtBwLdseFdHKOhX13AfJcxaWxUD0RWEbbPETa7/mnUHcJoK/2/QG4AYXc/BfMdv9+3ayzYkVyouXsrTpQ1/0lmdrd9Qt5v5a2pCjjF3OjrqqlJj2Qp5QgOTBeEPxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741251377; c=relaxed/simple;
	bh=aty0P6iHWaWuvhQ0UixST56H47JI7p8GWmbabM+cK6Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=cpCmqmE4HO/tUZn98YlC2uipZlT9pllrTIj81U594Gfh0W/LrKE+OcyK9xo0uD8KZV8QvQz3k/6mzp6dkfCvTBlL8+Uzn3XwGKJxn3hgBQ6SwybBm31K5Ss4nIdyted2igo92EQx451/MC8DSG2yCOeVxpcFkcjyf5VBNsu3xbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kliz8Mk4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525LGt3R020903;
	Thu, 6 Mar 2025 08:56:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jCq4OFITcaa/upeBAzpVqStW05vMdiUebNNG2rlgMgw=; b=kliz8Mk45p6g9mHa
	smkVAFq/a7McSma8CdyyKAGEAbrV4w6Xg2HDUaOrBVPUe4cz89Jkegk4j1Op3gH1
	xbLwZHTER61qd0+pE2VjMegy3eRM4bO1BqLEgns5/Btd9QInTPJI93WRxaYx5GnT
	+cwoO1KYdbG9na5psaLHvEuYkbBHjOZ8IIUQIYyHDR7bs/bcRpX0ZDfTvBcPSz3R
	KXiGArfooJdzfZ5JTs3WHcpvwQXi+WHD0g6+FK1q/8feYSWk3v7bcfgGstlU3/S+
	UtST5Ob3rG+9T/4K72qAKDyeHZEBpvmQSiZKVnV1NWUjsScgyC7yFeOt6csgUDT/
	7doVHQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 456xcuhhpe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 08:56:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5268uBD9000677
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 08:56:11 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Mar 2025
 00:56:06 -0800
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Thu, 6 Mar 2025 14:25:36 +0530
Subject: [PATCH v2 4/8] clk: qcom: videocc-sm8450: Move PLL & clk
 configuration to really probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250306-videocc-pll-multi-pd-voting-v2-4-0cd00612bc0e@quicinc.com>
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
X-Proofpoint-ORIG-GUID: pwAdew6F0M43XswQoubtFsus9b5rNaNC
X-Proofpoint-GUID: pwAdew6F0M43XswQoubtFsus9b5rNaNC
X-Authority-Analysis: v=2.4 cv=eeXHf6EH c=1 sm=1 tr=0 ts=67c9632c cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=b1qG8djl-PuVWaYtoygA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_04,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060067

Video PLLs on SM8450/SM8475 require both MMCX and MXC rails to be kept ON
to configure the PLLs properly. Hence move the PLL configuration and
enable critical clocks to qcom_cc_really_probe() which ensures all
required power domains are in enabled state before configuring the PLLs
or enabling the clocks.

Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
 drivers/clk/qcom/videocc-sm8450.c | 49 ++++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 27 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8450.c b/drivers/clk/qcom/videocc-sm8450.c
index f26c7eccb62e7eb8dbd022e2f01fa496eb570b3f..73d65ff1f1a3dc07898e553a6e38d5ada82f566a 100644
--- a/drivers/clk/qcom/videocc-sm8450.c
+++ b/drivers/clk/qcom/videocc-sm8450.c
@@ -63,6 +63,7 @@ static const struct alpha_pll_config sm8475_video_cc_pll0_config = {
 
 static struct clk_alpha_pll video_cc_pll0 = {
 	.offset = 0x0,
+	.config = &video_cc_pll0_config,
 	.vco_table = lucid_evo_vco,
 	.num_vco = ARRAY_SIZE(lucid_evo_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
@@ -106,6 +107,7 @@ static const struct alpha_pll_config sm8475_video_cc_pll1_config = {
 
 static struct clk_alpha_pll video_cc_pll1 = {
 	.offset = 0x1000,
+	.config = &video_cc_pll1_config,
 	.vco_table = lucid_evo_vco,
 	.num_vco = ARRAY_SIZE(lucid_evo_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
@@ -407,6 +409,17 @@ static const struct qcom_reset_map video_cc_sm8450_resets[] = {
 	[VIDEO_CC_MVS1C_CLK_ARES] = { .reg = 0x808c, .bit = 2, .udelay = 1000 },
 };
 
+static struct clk_alpha_pll *video_cc_sm8450_plls[] = {
+	&video_cc_pll0,
+	&video_cc_pll1,
+};
+
+static struct qcom_clk_cfg video_cc_sm8450_clocks_cfg[] = {
+	{ .offset = 0x80e4, .mask = BIT(0) }, /* VIDEO_CC_AHB_CLK */
+	{ .offset = 0x8114, .mask = BIT(0) }, /* VIDEO_CC_XO_CLK */
+	{ .offset = 0x8130, .mask = BIT(0) }, /* VIDEO_CC_SLEEP_CLK */
+};
+
 static const struct regmap_config video_cc_sm8450_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -423,6 +436,11 @@ static struct qcom_cc_desc video_cc_sm8450_desc = {
 	.num_resets = ARRAY_SIZE(video_cc_sm8450_resets),
 	.gdscs = video_cc_sm8450_gdscs,
 	.num_gdscs = ARRAY_SIZE(video_cc_sm8450_gdscs),
+	.plls = video_cc_sm8450_plls,
+	.num_plls = ARRAY_SIZE(video_cc_sm8450_plls),
+	.clks_cfg = video_cc_sm8450_clocks_cfg,
+	.num_clks_cfg = ARRAY_SIZE(video_cc_sm8450_clocks_cfg),
+	.use_rpm = true,
 };
 
 static const struct of_device_id video_cc_sm8450_match_table[] = {
@@ -435,21 +453,10 @@ MODULE_DEVICE_TABLE(of, video_cc_sm8450_match_table);
 static int video_cc_sm8450_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap;
-	int ret;
-
-	ret = devm_pm_runtime_enable(&pdev->dev);
-	if (ret)
-		return ret;
-
-	ret = pm_runtime_resume_and_get(&pdev->dev);
-	if (ret)
-		return ret;
 
 	regmap = qcom_cc_map(pdev, &video_cc_sm8450_desc);
-	if (IS_ERR(regmap)) {
-		pm_runtime_put(&pdev->dev);
+	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
-	}
 
 	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8475-videocc")) {
 		/* Update VideoCC PLL0 */
@@ -458,23 +465,11 @@ static int video_cc_sm8450_probe(struct platform_device *pdev)
 		/* Update VideoCC PLL1 */
 		video_cc_pll1.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
 
-		clk_lucid_ole_pll_configure(&video_cc_pll0, regmap, &sm8475_video_cc_pll0_config);
-		clk_lucid_ole_pll_configure(&video_cc_pll1, regmap, &sm8475_video_cc_pll1_config);
-	} else {
-		clk_lucid_evo_pll_configure(&video_cc_pll0, regmap, &video_cc_pll0_config);
-		clk_lucid_evo_pll_configure(&video_cc_pll1, regmap, &video_cc_pll1_config);
+		video_cc_pll0.config = &sm8475_video_cc_pll0_config;
+		video_cc_pll1.config = &sm8475_video_cc_pll1_config;
 	}
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x80e4); /* VIDEO_CC_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x8130); /* VIDEO_CC_SLEEP_CLK */
-	qcom_branch_set_clk_en(regmap, 0x8114); /* VIDEO_CC_XO_CLK */
-
-	ret = qcom_cc_really_probe(&pdev->dev, &video_cc_sm8450_desc, regmap);
-
-	pm_runtime_put(&pdev->dev);
-
-	return ret;
+	return qcom_cc_really_probe(&pdev->dev, &video_cc_sm8450_desc, regmap);
 }
 
 static struct platform_driver video_cc_sm8450_driver = {

-- 
2.34.1


