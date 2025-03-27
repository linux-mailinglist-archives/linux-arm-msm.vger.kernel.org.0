Return-Path: <linux-arm-msm+bounces-52605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC86DA72CFA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 10:56:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C1FA18943D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 09:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5055E20E034;
	Thu, 27 Mar 2025 09:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XYaXL307"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74B920D50C;
	Thu, 27 Mar 2025 09:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743069257; cv=none; b=icOdrb93/aUT5YBkZxntpc6NR4erTRagtp29aiU9quadaAl5ukPEXIzsjp2RYnq+3lBLmWrVL8lAiYQRUxAUg1qmuh/jW78j5hbwG8G7Rfjw3YL9CMGOYcVwUpLKsd5kzFTs7F+DOqG4Q1wf1p8sxtyi4Ph/mGSYytCghVDELrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743069257; c=relaxed/simple;
	bh=R7Gnd+bxbzVde7SxSezSnRcvBbcZp6IYHLfoWzVkLzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=aAxU3BYy0m6qQetL3jYc2Q1Sw/jcFeymbZPf8C1z6c45FsKnrHlhmvXPXc8lxx3KRh+TnCn+PCbMyowSDdL1md1WTnRgDs4S9Hs8X8LVl8009/bvhYT154ugYAxVTeF5dTfvyTuTjmtQA4wxY9Sp2ZVIiUC0ViMqMa1pAHmhwQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XYaXL307; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jD57012382;
	Thu, 27 Mar 2025 09:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u/iQftpVaR0H5CNn6gktRNx9G9U52B2pgdgQGa8uVJw=; b=XYaXL307fGiO6xG4
	kuNJOOilH5TrpqdmTNlbHJBCtAkax3QWggCTa+q2yFFldNJCHYk5IS7s9qKS31r5
	Sj6E0EFq4cEEprvSoslfp9MT2iEwOGWvqCqxLZEbHVA3fZLK2GxbRpHvqdczeE8c
	knWu3oG148kl5CL7Xa9tECchH3u1e4Rbhy2pHBsEKd+SuKKPHHLAlKsSByyRj88R
	6FpSYckDZfaxwOh34J2S5cNJgyXZVJmperVEzpy1aeOsUt0tK4+AF7oHv1nyHQwU
	FLXzpSiACCzeRAYOlGPInrF2LhD3ljyrPO1ciucCo+nNHLwpwDhc2x6++65LG7ea
	+H5OPg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mmutjfta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 09:54:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52R9sANQ020309
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 09:54:10 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Mar
 2025 02:54:05 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Thu, 27 Mar 2025 15:22:28 +0530
Subject: [PATCH v3 08/18] clk: qcom: videocc-sm8550: Move PLL & clk
 configuration to really probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250327-videocc-pll-multi-pd-voting-v3-8-895fafd62627@quicinc.com>
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
X-Proofpoint-ORIG-GUID: mMgNrtBZlftSiU_4vlRuI7swhteI4WZ2
X-Authority-Analysis: v=2.4 cv=MqlS63ae c=1 sm=1 tr=0 ts=67e52043 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=NSTayzwvANHeSgS_AzkA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: mMgNrtBZlftSiU_4vlRuI7swhteI4WZ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503270066

Video PLLs on SM8550/SM8650 require both MMCX and MXC rails to be kept ON
to configure the PLLs properly. Hence move runtime power management, PLL
configuration and enable critical clocks to qcom_cc_really_probe() which
ensures all required power domains are in enabled state before configuring
the PLLs or enabling the clocks.

Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
 drivers/clk/qcom/videocc-sm8550.c | 55 ++++++++++++++++-----------------------
 1 file changed, 22 insertions(+), 33 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8550.c b/drivers/clk/qcom/videocc-sm8550.c
index fcfe0cade6d0a95e749aabbc2af1174e5a70f0db..9c34ecc8ca5a042104956c48fd577b18929e6023 100644
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
@@ -527,6 +539,11 @@ static const struct qcom_cc_desc video_cc_sm8550_desc = {
 	.num_resets = ARRAY_SIZE(video_cc_sm8550_resets),
 	.gdscs = video_cc_sm8550_gdscs,
 	.num_gdscs = ARRAY_SIZE(video_cc_sm8550_gdscs),
+	.alpha_plls = video_cc_sm8550_plls,
+	.num_alpha_plls = ARRAY_SIZE(video_cc_sm8550_plls),
+	.clk_cbcrs = video_cc_sm8550_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(video_cc_sm8550_critical_cbcrs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id video_cc_sm8550_match_table[] = {
@@ -538,26 +555,7 @@ MODULE_DEVICE_TABLE(of, video_cc_sm8550_match_table);
 
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
@@ -569,21 +567,12 @@ static int video_cc_sm8550_probe(struct platform_device *pdev)
 		video_cc_sm8550_clocks[VIDEO_CC_MVS1_SHIFT_CLK] = &video_cc_mvs1_shift_clk.clkr;
 		video_cc_sm8550_clocks[VIDEO_CC_MVS1C_SHIFT_CLK] = &video_cc_mvs1c_shift_clk.clkr;
 		video_cc_sm8550_clocks[VIDEO_CC_XO_CLK_SRC] = &video_cc_xo_clk_src.clkr;
-	}
-
-	clk_lucid_ole_pll_configure(&video_cc_pll0, regmap, &video_cc_pll0_config);
-	clk_lucid_ole_pll_configure(&video_cc_pll1, regmap, &video_cc_pll1_config);
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x80f4); /* VIDEO_CC_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, sleep_clk_offset); /* VIDEO_CC_SLEEP_CLK */
-	qcom_branch_set_clk_en(regmap, 0x8124); /* VIDEO_CC_XO_CLK */
 
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


