Return-Path: <linux-arm-msm+bounces-27496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DAA9426E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 08:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4C2F1C241D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 06:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE2A616D324;
	Wed, 31 Jul 2024 06:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Kn6WOCID"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0FC446A1;
	Wed, 31 Jul 2024 06:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722407472; cv=none; b=iicO3xpJqn9aaUvaqwsV/V+s3dzTG8iCJhV/M/if+Jz+CgRgNtZo0tr9fdnmW3tzxjaUdFMNPylg6WGncdZJApM5jmZs+BJ/9UzganfSVmPbSch6KRzgsVT86ybslCC/sYG/OXZPSegFzYmMGST1gXYQB3yUjo+BmxgjY464qB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722407472; c=relaxed/simple;
	bh=iWA/TC4JJKondIWChJjbUhhRkc/1nMcPEk2mJ7mTfEM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M5mc0GYv8kN5FWE9pV4ULJmtXt4FTgAl0f9keYazN3YtEP5egVCf5ys3XBxXaCKaPPrUBRlvUosv72CAFvH0HcQF1JN2XQ/l/DoaXPzY6rVmFT+at35MrPpet6i7Hjf1TRH1L3bcpOs1cuaO95gW0gZL2PCG2KhiR1uw0zBYiSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Kn6WOCID; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46V52gVP029477;
	Wed, 31 Jul 2024 06:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k6Qv+TGHUE0st+LLzTgPvZJlZ6OQGigN7CBzZpL1jPU=; b=Kn6WOCIDX/0ognRR
	aJtZDreyFq1oweKtAGdHlRuWRvGK0LiAomTZzz4uxgLqBCf6WqykhdyQJul9ibQO
	9rYqVY4HGr1yJc/fixLhMQ7+VYqkr/zafzMXGFtnzPBXbdD51b6Hdzn2tg4MYkIT
	ES6WRypMuBfhjADNIww0SI7zyN/YWSZxPlLoOrfYYOFDKVI5w6MvAvUgmyg2B3Dc
	VrptldffhVtRxYZYHGc/QVquayInnBCi0r0LYSDCdWYhjcss39mouZe+Vzny4kqe
	WTT41WtMHPvNnusTvg04Pe793LfHY4qga/o0lzMv+VQZJ8h4NFV7JfPOur7TEkMk
	E8yMgg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40pw443c3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 06:30:38 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46V6UbYh027352
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 06:30:37 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 30 Jul 2024 23:30:31 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
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
        Jagadeesh Kona <quic_jkona@quicinc.com>, <stable@vger.kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>
Subject: [PATCH V3 5/8] clk: qcom: clk-alpha-pll: Add support for Regera PLL ops
Date: Wed, 31 Jul 2024 11:59:13 +0530
Message-ID: <20240731062916.2680823-6-quic_skakitap@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240731062916.2680823-1-quic_skakitap@quicinc.com>
References: <20240731062916.2680823-1-quic_skakitap@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tfzT8zAU5lMsHLW2l23zMLhlxJgLc9T7
X-Proofpoint-ORIG-GUID: tfzT8zAU5lMsHLW2l23zMLhlxJgLc9T7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_03,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407310047

From: Taniya Das <quic_tdas@quicinc.com>

Regera PLL ops are required to control the Regera PLL from clock
controller drivers, hence add the Regera PLL ops and configure
function.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 32 +++++++++++++++++++++++++++++++-
 drivers/clk/qcom/clk-alpha-pll.h |  5 +++++
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index ad9a84d521fc..2f620ccb41cb 100644
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
@@ -2676,3 +2676,33 @@ const struct clk_ops clk_alpha_pll_stromer_plus_ops = {
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
index df8f0fe15531..40e938b59c3e 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -23,6 +23,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_LUCID = CLK_ALPHA_PLL_TYPE_TRION,
 	CLK_ALPHA_PLL_TYPE_AGERA,
 	CLK_ALPHA_PLL_TYPE_ZONDA,
+	CLK_ALPHA_PLL_TYPE_REGERA = CLK_ALPHA_PLL_TYPE_ZONDA,
 	CLK_ALPHA_PLL_TYPE_ZONDA_OLE,
 	CLK_ALPHA_PLL_TYPE_LUCID_EVO,
 	CLK_ALPHA_PLL_TYPE_LUCID_OLE,
@@ -193,6 +194,8 @@ extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
 extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
 #define clk_alpha_pll_postdiv_rivian_evo_ops clk_alpha_pll_postdiv_fabia_ops
 
+extern const struct clk_ops clk_alpha_pll_regera_ops;
+
 void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config);
 void clk_huayra_2290_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
@@ -216,5 +219,7 @@ void clk_rivian_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regm
 				  const struct alpha_pll_config *config);
 void clk_stromer_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			       const struct alpha_pll_config *config);
+void clk_regera_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
+			     const struct alpha_pll_config *config);
 
 #endif
-- 
2.25.1


