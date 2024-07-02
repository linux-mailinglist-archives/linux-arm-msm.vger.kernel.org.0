Return-Path: <linux-arm-msm+bounces-24893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1625E9242D0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 17:51:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 397F21C21DC1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 15:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B4F61BB6AF;
	Tue,  2 Jul 2024 15:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="muwFFpjf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B1215D5B3;
	Tue,  2 Jul 2024 15:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719935498; cv=none; b=uuZ/xnKAHJYUuySyqe50rYzLbpYkuk4FdYqaJmzTb8de5utskotwdSUIIoATk/Ap8CG8nhfBktheno27QUziBymCEZ9iPiMKi0/dAxy1f6oDZH3i6rgkpfGDi3Vxheg/GB8r6N6vkimOGoAXsNnFGazEWT2xJfd74y9h+6Bsh1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719935498; c=relaxed/simple;
	bh=ZRb+9Qt6Jh0VSimGTZrxzMfqi99CU1SxKgKF+savIOM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=klsJGHeG6KpUpUDYblUY1tAcCl0jaECL66mRVJKAXu2MQKxpsvWQjVGjtT9BaB5OKBcbqwOotNOQZMVKrGrU68AyjxgQsnr8qKtTtIEOMtsDYbEUMnUKmrtTCQps208PIA6v9La9LeUEdkShVgRFJoD9A2HdFkTEQuYcB9yJJFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=muwFFpjf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 462CArdO030526;
	Tue, 2 Jul 2024 15:51:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/HTC+sE3DUrVUOlzm+gUTskjtN5zv337Mj45uxHwPTw=; b=muwFFpjfdNRUyd7q
	wTDLePFkMZQQqaOilM48NgFFLm24v5tZqvtMMGjR20bGJeY1wUm7ji1NNot9Gh3r
	WfLLZ6/5lomFcSM/3dyJNzGA9JixsjAbbcKAH5cKHX3Y14F22OGmur+DsqXm0KpA
	mOosRwRcQlXXb4D8trKd3T1BK4wNIpA/iwuLu6UzY4tV1QCgnZryqF/FpnipxfJL
	EeyxI5REPbgQII62dVUFrKqSKooaAL5OQ1ib572KOCzEMuwukVkfj6gIuf0yJSeC
	AjN7+E9C6ebSlYbMlflIEo/xKXT3m7u/r60hB3X0WS/K551wmj8x0xN5NU/s8uq3
	hXjlAw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 402ag2gvrh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jul 2024 15:51:10 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 462Fp9Ut001950
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Jul 2024 15:51:09 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 2 Jul 2024 08:51:04 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Date: Tue, 2 Jul 2024 21:20:41 +0530
Subject: [PATCH v2 3/6] clk: qcom: clk-alpha-pll: Add support for Regera
 PLL ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240702-camcc-support-sm8150-v2-3-4baf54ec7333@quicinc.com>
References: <20240702-camcc-support-sm8150-v2-0-4baf54ec7333@quicinc.com>
In-Reply-To: <20240702-camcc-support-sm8150-v2-0-4baf54ec7333@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Stephen Boyd <sboyd@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        "Imran
 Shaik" <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: mcFB6NAfAH1BTmecK94fALeuouMlCNkj
X-Proofpoint-GUID: mcFB6NAfAH1BTmecK94fALeuouMlCNkj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_11,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 malwarescore=0 phishscore=0 impostorscore=0 mlxlogscore=851 bulkscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407020117

From: Taniya Das <quic_tdas@quicinc.com>

Regera PLL ops are required to control the Regera PLL from clock
controller drivers, thus add support for the same.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 32 +++++++++++++++++++++++++++++++-
 drivers/clk/qcom/clk-alpha-pll.h |  5 +++++
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index d2bef078588f..afb7ab72c90d 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) 2015, 2018, The Linux Foundation. All rights reserved.
- * Copyright (c) 2021, 2023, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021, 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/kernel.h>
@@ -2605,3 +2605,33 @@ const struct clk_ops clk_alpha_pll_stromer_plus_ops = {
 	.set_rate = clk_alpha_pll_stromer_plus_set_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_stromer_plus_ops);
+
+void clk_regera_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
+			     const struct alpha_pll_config *config)
+{
+	clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), config->l);
+	clk_alpha_pll_write_config(regmap, PLL_ALPHA_VAL(pll), config->alpha);
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL(pll), config->config_ctl_val);
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U(pll), config->config_ctl_hi_val);
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U1(pll), config->config_ctl_hi1_val);
+	clk_alpha_pll_write_config(regmap, PLL_USER_CTL(pll), config->user_ctl_val);
+	clk_alpha_pll_write_config(regmap, PLL_USER_CTL_U(pll), config->user_ctl_hi_val);
+	clk_alpha_pll_write_config(regmap, PLL_USER_CTL_U1(pll), config->user_ctl_hi1_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL(pll), config->test_ctl_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U(pll), config->test_ctl_hi_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U1(pll), config->test_ctl_hi1_val);
+
+	/* Set operation mode to STANDBY */
+	regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
+}
+EXPORT_SYMBOL_GPL(clk_regera_pll_configure);
+
+const struct clk_ops clk_alpha_pll_regera_ops = {
+	.enable = clk_zonda_pll_enable,
+	.disable = clk_zonda_pll_disable,
+	.is_enabled = clk_alpha_pll_is_enabled,
+	.recalc_rate = clk_trion_pll_recalc_rate,
+	.round_rate = clk_alpha_pll_round_rate,
+	.set_rate = clk_zonda_pll_set_rate,
+};
+EXPORT_SYMBOL_GPL(clk_alpha_pll_regera_ops);
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index fb6d50263bb9..5bb0a07da53d 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -21,6 +21,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_LUCID = CLK_ALPHA_PLL_TYPE_TRION,
 	CLK_ALPHA_PLL_TYPE_AGERA,
 	CLK_ALPHA_PLL_TYPE_ZONDA,
+	CLK_ALPHA_PLL_TYPE_REGERA = CLK_ALPHA_PLL_TYPE_ZONDA,
 	CLK_ALPHA_PLL_TYPE_ZONDA_OLE,
 	CLK_ALPHA_PLL_TYPE_LUCID_EVO,
 	CLK_ALPHA_PLL_TYPE_LUCID_OLE,
@@ -189,6 +190,8 @@ extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
 extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
 #define clk_alpha_pll_postdiv_rivian_evo_ops clk_alpha_pll_postdiv_fabia_ops
 
+extern const struct clk_ops clk_alpha_pll_regera_ops;
+
 void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config);
 void clk_fabia_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
@@ -210,5 +213,7 @@ void clk_rivian_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regm
 				  const struct alpha_pll_config *config);
 void clk_stromer_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			       const struct alpha_pll_config *config);
+void clk_regera_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
+			     const struct alpha_pll_config *config);
 
 #endif

-- 
2.25.1


