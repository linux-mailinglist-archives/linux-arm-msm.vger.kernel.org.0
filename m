Return-Path: <linux-arm-msm+bounces-52604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA8BA72CF5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 10:56:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D731189530E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 09:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76DEF20F08A;
	Thu, 27 Mar 2025 09:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gesjYa6r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D7A20D50C;
	Thu, 27 Mar 2025 09:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743069251; cv=none; b=W64GcmWUfSfARCSLSBAXVC9HLEfrbUvNiYFmZe5KfNnSui+jvO+I5SgluAYkM8e2LanDedTSDu8CWICwQysogJxM7Roxn3QLNzOKsMaZ6kXUN/UjcgyAV9HMFP9jbcKwK7QFgAF0UMLjMBA9rAWTDR/dVFe6Uzx1U1x0Wk3mL2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743069251; c=relaxed/simple;
	bh=n+yBW6XU+DvrGgW2oSPempC544Rm8Jj4C4Y3nyTou90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=kHjKyx/3MNYH8mqnjbmoJ4HgNdHp5s4AC3tFL39HJj0GwFeyud6+jEByxeoUkHPUuO4chYzDV5/el/kP1Cbr2tBm3XNV6/uLPtu9Bnrdas9MEzIjP9nAHTNBf9D/JaUSUzUY69RRRTFPn5K+6F//J8DLIRrZip45V9+7YuUUUYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gesjYa6r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jc5d011052;
	Thu, 27 Mar 2025 09:54:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JyxlTf89lZD3fi5MKVckAa1EUwAOLCn6eieTl49Zeyg=; b=gesjYa6rsAxN3EJa
	1L7sLbCrg+a3Jj3CqPNePY2NoY8goLHmEJvjCYMk9rkME1ry+yZAvXAdXTAoob9A
	9eGefQkf5m/O0QGGyEsc5jyHTGOFoqGsRK4W7Ol2GS5SwHWC3RXcZr2QdZxu87EE
	du0cAknOEe69REk0tBoiANRww7hhDUQRo8oYtGnQfnSibUDkdSaiaq/KL7qTiyWv
	QCCAV1cLGG4vCzB9iAtjd/OYMQHlPpauJBjgclLQri6Uh7NXWmNR6XSequ+moFhq
	wjszZZ79lNJZ20JHq/ITHPxZ3BhiBzlU/o2gkVtpbPhHYHWWclKMFRzaJGNMNTjn
	cqWWDg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmcyg4kx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 09:54:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52R9s59q019401
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 09:54:05 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Mar
 2025 02:53:59 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Thu, 27 Mar 2025 15:22:27 +0530
Subject: [PATCH v3 07/18] clk: qcom: videocc-sm8450: Move PLL & clk
 configuration to really probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250327-videocc-pll-multi-pd-voting-v3-7-895fafd62627@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=EZ3IQOmC c=1 sm=1 tr=0 ts=67e5203d cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=NSTayzwvANHeSgS_AzkA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Bkwoq_L-hcf_LHiCmZB_UA2MCHeFsI8B
X-Proofpoint-GUID: Bkwoq_L-hcf_LHiCmZB_UA2MCHeFsI8B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 spamscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270066

Video PLLs on SM8450/SM8475 require both MMCX and MXC rails to be kept ON
to configure the PLLs properly. Hence move runtime power management, PLL
configuration and enable critical clocks to qcom_cc_really_probe() which
ensures all required power domains are in enabled state before configuring
the PLLs or enabling the clocks.

Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
 drivers/clk/qcom/videocc-sm8450.c | 54 +++++++++++++++------------------------
 1 file changed, 21 insertions(+), 33 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8450.c b/drivers/clk/qcom/videocc-sm8450.c
index 2e11dcffb6646d47b298c27ef68635a465dd728e..50259374273d04dcf1486ea59915347340b6f2aa 100644
--- a/drivers/clk/qcom/videocc-sm8450.c
+++ b/drivers/clk/qcom/videocc-sm8450.c
@@ -7,7 +7,6 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,sm8450-videocc.h>
@@ -63,6 +62,7 @@ static const struct alpha_pll_config sm8475_video_cc_pll0_config = {
 
 static struct clk_alpha_pll video_cc_pll0 = {
 	.offset = 0x0,
+	.config = &video_cc_pll0_config,
 	.vco_table = lucid_evo_vco,
 	.num_vco = ARRAY_SIZE(lucid_evo_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
@@ -106,6 +106,7 @@ static const struct alpha_pll_config sm8475_video_cc_pll1_config = {
 
 static struct clk_alpha_pll video_cc_pll1 = {
 	.offset = 0x1000,
+	.config = &video_cc_pll1_config,
 	.vco_table = lucid_evo_vco,
 	.num_vco = ARRAY_SIZE(lucid_evo_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
@@ -407,6 +408,17 @@ static const struct qcom_reset_map video_cc_sm8450_resets[] = {
 	[VIDEO_CC_MVS1C_CLK_ARES] = { .reg = 0x808c, .bit = 2, .udelay = 1000 },
 };
 
+static struct clk_alpha_pll *video_cc_sm8450_plls[] = {
+	&video_cc_pll0,
+	&video_cc_pll1,
+};
+
+static u32 video_cc_sm8450_critical_cbcrs[] = {
+	0x80e4, /* VIDEO_CC_AHB_CLK */
+	0x8114, /* VIDEO_CC_XO_CLK */
+	0x8130, /* VIDEO_CC_SLEEP_CLK */
+};
+
 static const struct regmap_config video_cc_sm8450_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -423,6 +435,11 @@ static const struct qcom_cc_desc video_cc_sm8450_desc = {
 	.num_resets = ARRAY_SIZE(video_cc_sm8450_resets),
 	.gdscs = video_cc_sm8450_gdscs,
 	.num_gdscs = ARRAY_SIZE(video_cc_sm8450_gdscs),
+	.alpha_plls = video_cc_sm8450_plls,
+	.num_alpha_plls = ARRAY_SIZE(video_cc_sm8450_plls),
+	.clk_cbcrs = video_cc_sm8450_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(video_cc_sm8450_critical_cbcrs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id video_cc_sm8450_match_table[] = {
@@ -434,23 +451,6 @@ MODULE_DEVICE_TABLE(of, video_cc_sm8450_match_table);
 
 static int video_cc_sm8450_probe(struct platform_device *pdev)
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
-	regmap = qcom_cc_map(pdev, &video_cc_sm8450_desc);
-	if (IS_ERR(regmap)) {
-		pm_runtime_put(&pdev->dev);
-		return PTR_ERR(regmap);
-	}
-
 	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8475-videocc")) {
 		/* Update VideoCC PLL0 */
 		video_cc_pll0.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
@@ -458,23 +458,11 @@ static int video_cc_sm8450_probe(struct platform_device *pdev)
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
+	return qcom_cc_probe(pdev, &video_cc_sm8450_desc);
 }
 
 static struct platform_driver video_cc_sm8450_driver = {

-- 
2.34.1


