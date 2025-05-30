Return-Path: <linux-arm-msm+bounces-59896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCA6AC8FED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 15:23:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE94717D601
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 13:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B938122D4D7;
	Fri, 30 May 2025 13:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CKhwNhG6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63A822B8BD;
	Fri, 30 May 2025 13:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748611310; cv=none; b=GL11a6GRmcicJMval7NoQP5qlQ7B06TFCRWGS+5knernyUVW6H7PbWIfGLKTmEbsZHhY0g3pINvjN4y3YNDxJVrW0C29qdZRcFOKgvtUYxy2RmT/7DvHY5owuJ9GXnapePa8oXHGMJHw1sGti4mX6zSUZ8mVRbKTi6VGlxv8Qxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748611310; c=relaxed/simple;
	bh=YZvzpRaQfBYxxZnFFb/b1MtQvzpZMyyiBSpqVbIhWlU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=j6R+Hkf99lHnTja67qeNU1S8k8iySg8R4hYrSoHDwzvRX9v74KhQk4yyeqMjSqmwOPQVwExZUHC7IWvDnuVkyqmnsaXJTg2UQFwksHL13/LEm4Pu5VCsfDmLo3kJ4lRQx/fP+M9eDXrpLzOnTWjOSoY1DKQQJ2CTv503gaaMbvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CKhwNhG6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UAa1dq005273;
	Fri, 30 May 2025 13:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7BnG+mJofgAckwjf5ZAq+3s2O/GNBZ5D48CiXrCCSuY=; b=CKhwNhG6cdGXmfHS
	jZmScI6QKgZq0wKSueNeL1QlvdG9/OfWjgr8lIola58Za2y0fdZkyWL02FCyKZZB
	eZFEwDh1L+5z7I/dG0WnhXTI0enRh/uH87WP3cmwfGLBPwNVl3nD9rneyobJwYrg
	RUGzrwXWFYu8uQR+6K8rFTouTP122pkgNADvTUPNiDG2rcbVslZCp5GF1/Z4rtS8
	vh+fyPlyBArSWKd0SqMwO53HuneCbXRw7WHdYKblt9Z0JfNMdnhP52tXHDlRHKFU
	HHTxpJbFsOCB7KdydmO6rb+HNWKjAXpWOWjehVEeZulOMZ9rDQgKGX1GHTQM7snU
	0kgqqA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ek8xx8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 13:21:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54UDLgNJ031517
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 13:21:42 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 30 May
 2025 06:21:36 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Fri, 30 May 2025 18:50:52 +0530
Subject: [PATCH v5 07/18] clk: qcom: videocc-sm8450: Move PLL & clk
 configuration to really probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250530-videocc-pll-multi-pd-voting-v5-7-02303b3a582d@quicinc.com>
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
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=6839b0e7 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=NSTayzwvANHeSgS_AzkA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 2DKNznYdobWalRaP7BtO1k5458HRrwLw
X-Proofpoint-GUID: 2DKNznYdobWalRaP7BtO1k5458HRrwLw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDExNiBTYWx0ZWRfXzACy2aBDJJFU
 lG/kH0pZNaAEMCNPZiXWuheXOP7CXI6us5YZvVmtLdtPZyLtriimN9k4NGd70irTZ2EHIK0PWqr
 SHQPBlDqquTzWGUwx7aKVe6+Qg3z7swTt/8MsoGJPmbrXeLyURBJ4yZfNa73jIZvtvK+dspFZds
 GSBx9EeWD6yOqKbXmryWFHRFW2jYrRvPe3XRSam/SCBdsumLN4U/d86LqsuG5jkGgqaEb2e+fF0
 OxvhrYcLN/fYJr6KLSKHldYcavfD4+KYa1g+ZjWaVKAfbq4InX+0b01XJfbJE7jsHCunz4vs5+I
 e3VUzKDcIFLRiylqe936EXc6CCbaiBLZLwzAj7yUIBNGgwgnzVwhGNSEq/nBoPP14Y281DzMgNu
 Pd2HeKuOjHQjXvA8Pk9Tlj3vHOfF+4+JcjCIgnpK6ZmJrBh5HPPEDRs4M8+19JA4iUyXk4LP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_05,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300116

Video PLLs on SM8450/SM8475 require both MMCX and MXC rails to be kept ON
to configure the PLLs properly. Hence move runtime power management, PLL
configuration and enable critical clocks to qcom_cc_really_probe() which
ensures all required power domains are in enabled state before configuring
the PLLs or enabling the clocks.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
 drivers/clk/qcom/videocc-sm8450.c | 58 +++++++++++++++++----------------------
 1 file changed, 25 insertions(+), 33 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8450.c b/drivers/clk/qcom/videocc-sm8450.c
index 2e11dcffb6646d47b298c27ef68635a465dd728e..d53182f001262324d8f54b0c6a5e73541eb32190 100644
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
@@ -415,6 +427,13 @@ static const struct regmap_config video_cc_sm8450_regmap_config = {
 	.fast_io = true,
 };
 
+static struct qcom_cc_driver_data video_cc_sm8450_driver_data = {
+	.alpha_plls = video_cc_sm8450_plls,
+	.num_alpha_plls = ARRAY_SIZE(video_cc_sm8450_plls),
+	.clk_cbcrs = video_cc_sm8450_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(video_cc_sm8450_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc video_cc_sm8450_desc = {
 	.config = &video_cc_sm8450_regmap_config,
 	.clks = video_cc_sm8450_clocks,
@@ -423,6 +442,8 @@ static const struct qcom_cc_desc video_cc_sm8450_desc = {
 	.num_resets = ARRAY_SIZE(video_cc_sm8450_resets),
 	.gdscs = video_cc_sm8450_gdscs,
 	.num_gdscs = ARRAY_SIZE(video_cc_sm8450_gdscs),
+	.use_rpm = true,
+	.driver_data = &video_cc_sm8450_driver_data,
 };
 
 static const struct of_device_id video_cc_sm8450_match_table[] = {
@@ -434,23 +455,6 @@ MODULE_DEVICE_TABLE(of, video_cc_sm8450_match_table);
 
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
@@ -458,23 +462,11 @@ static int video_cc_sm8450_probe(struct platform_device *pdev)
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


