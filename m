Return-Path: <linux-arm-msm+bounces-59893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70798AC8FE1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 15:22:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3235217AD05
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 13:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA7E22ACDA;
	Fri, 30 May 2025 13:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VUxak2Z0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5219970830;
	Fri, 30 May 2025 13:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748611292; cv=none; b=Oi5jK56LdeaGvzbT1QWXZBEjPzLVb9htmvx+dJ3o278zMJmPg0+cOn+vH6uNTOXyLMHFEeUtjYIFPsRlUd/8/aVf0ndgnt3VYiHoGDrseByMiu5TYuNlNz8nabt1uL30mZ7ZAFDeGbnt1pCveJpFEI1BMwABzXHSCO8/OLCTPMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748611292; c=relaxed/simple;
	bh=DQB88d0R6OknmbKBS6TXDti7AVuUxAeQsId1Z7DZzjo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=R01RuFLKmddF5DzY1RC1h091WXLAEnqHvrbk+/8n1oyezOI4YOW54WO+9o8l3z8BXIsda0ZMYpPIP75Ghmdq6gWrC3G8RXQCMO8HDyTHE3URw9k6tXx1pnI5BICV38yYdrarDkjh3HQWfTbDVNkM0PIZAEaz/Q7LrEk1ndyqOJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VUxak2Z0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBdKOr023953;
	Fri, 30 May 2025 13:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oGJQT56DcsUAZjxCJdwiV+c2uiMAq40eaPuX7S02i2Y=; b=VUxak2Z0Qb0EIKBh
	n27SypN76FtQQOd6aQuXIbFDOTjLooI3DejCq8t7DV2htYR0Pfnp+VuboXoC8hn0
	c7GWE7aVjVv7P2MrIqzr+WvnOoF50ci5QpyPgLBi/vWOViZ1B43rttxXZ0A4cjFw
	rmr+DoC4K9nD7jYMIaU3k7dg1+9ykGYABk62akgjkKq7UrCTXzNZ26m8mM8krPXz
	r4h5o/x5q+FM2mU31xhgC3e17ZTUKCIFHJ9V38xjXVqMY8siWo+MSrhk7q2MqM66
	3S+rVKnlME98HUxzHz86ADMROQcwjLVjYYUki6H0kFLe5IiH8smfdc2rSwvV4w7Y
	ymVKXA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46x8d7dte4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 13:21:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54UDLOjU012017
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 13:21:24 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 30 May
 2025 06:21:18 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Fri, 30 May 2025 18:50:49 +0530
Subject: [PATCH v5 04/18] clk: qcom: clk-alpha-pll: Add support for common
 PLL configuration function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250530-videocc-pll-multi-pd-voting-v5-4-02303b3a582d@quicinc.com>
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
	<dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: f4fdO6qdbkn_ru8hNj7O0EfvzkyzOx6v
X-Proofpoint-ORIG-GUID: f4fdO6qdbkn_ru8hNj7O0EfvzkyzOx6v
X-Authority-Analysis: v=2.4 cv=X8pSKHTe c=1 sm=1 tr=0 ts=6839b0d5 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=JQl2qjEAfWPE5jP6FgYA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDExNiBTYWx0ZWRfXyh6AX1siuamb
 kW+1qUsO3xGuSHAkgCClIM/X1GAgTqVubiODBrA1frh0YVMw1G8cXxn4EPrtRxSMe4EfGEycvfc
 UAUGdA03W0pm9a+EGJ+92q3yc1fUX4b3OE3+T+CkdkaxDQA8XZoMc+I+8Ym2tbcKP9VDCc5Ddjq
 zuC0463r3K+JRF64lOQRjOraXlUz5UzwyGcg+s5jLN9cop8f8KiPOeH0OFjfHLD+iv3jdyB4ENl
 IY7wFxa5MPx/TlHDdKOOsGjG8v+eMmifXwXYceqFDWpB+G1DuLZ2m1aB7VN/njAfCGrW+gzYC2+
 t2WFGois9TgIArrZoQTTJDp4pT5WALd4H7FMlzkk1OCghSGCWNysuU2xR1u9NL3HHBFOl0hwnhz
 0970jAmAAcM9f9bCDLUi+3VdsN4WnA7X+llzC7rHI+Xv9am1jsH3hYtFh/26oLPh2fYZ+rdN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_05,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 adultscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300116

From: Taniya Das <quic_tdas@quicinc.com>

To properly configure the PLLs on recent chipsets, it often requires more
than one power domain to be kept ON. The support to enable multiple power
domains is being added in qcom_cc_really_probe() and PLLs should be
configured post all the required power domains are enabled.

Hence integrate PLL configuration into clk_alpha_pll structure and add
support for qcom_clk_alpha_pll_configure() function which can be called
from qcom_cc_really_probe() to configure the clock controller PLLs after
all required power domains are enabled.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 57 ++++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  3 +++
 2 files changed, 60 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index cec0afea8e446010f0d4140d4ef63121706dde47..d8e1cd1263317814da2d0414600988de4b87c56f 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -63,6 +63,8 @@
 #define PLL_OPMODE(p)		((p)->offset + (p)->regs[PLL_OFF_OPMODE])
 #define PLL_FRAC(p)		((p)->offset + (p)->regs[PLL_OFF_FRAC])
 
+#define GET_PLL_TYPE(pll)	(((pll)->regs - clk_alpha_pll_regs[0]) / PLL_OFF_MAX_REGS)
+
 const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 	[CLK_ALPHA_PLL_TYPE_DEFAULT] =  {
 		[PLL_OFF_L_VAL] = 0x04,
@@ -2960,3 +2962,58 @@ const struct clk_ops clk_alpha_pll_regera_ops = {
 	.set_rate = clk_zonda_pll_set_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_regera_ops);
+
+void qcom_clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap)
+{
+	const struct clk_init_data *init = pll->clkr.hw.init;
+
+	switch (GET_PLL_TYPE(pll)) {
+	case CLK_ALPHA_PLL_TYPE_LUCID_OLE:
+		clk_lucid_ole_pll_configure(pll, regmap, pll->config);
+		break;
+	case CLK_ALPHA_PLL_TYPE_LUCID_EVO:
+		clk_lucid_evo_pll_configure(pll, regmap, pll->config);
+		break;
+	case CLK_ALPHA_PLL_TYPE_TAYCAN_ELU:
+		clk_taycan_elu_pll_configure(pll, regmap, pll->config);
+		break;
+	case CLK_ALPHA_PLL_TYPE_RIVIAN_EVO:
+		clk_rivian_evo_pll_configure(pll, regmap, pll->config);
+		break;
+	case CLK_ALPHA_PLL_TYPE_TRION:
+		clk_trion_pll_configure(pll, regmap, pll->config);
+		break;
+	case CLK_ALPHA_PLL_TYPE_HUAYRA_2290:
+		clk_huayra_2290_pll_configure(pll, regmap, pll->config);
+		break;
+	case CLK_ALPHA_PLL_TYPE_FABIA:
+		clk_fabia_pll_configure(pll, regmap, pll->config);
+		break;
+	case CLK_ALPHA_PLL_TYPE_AGERA:
+		clk_agera_pll_configure(pll, regmap, pll->config);
+		break;
+	case CLK_ALPHA_PLL_TYPE_PONGO_ELU:
+		clk_pongo_elu_pll_configure(pll, regmap, pll->config);
+		break;
+	case CLK_ALPHA_PLL_TYPE_ZONDA:
+	case CLK_ALPHA_PLL_TYPE_ZONDA_OLE:
+		clk_zonda_pll_configure(pll, regmap, pll->config);
+		break;
+	case CLK_ALPHA_PLL_TYPE_STROMER:
+	case CLK_ALPHA_PLL_TYPE_STROMER_PLUS:
+		clk_stromer_pll_configure(pll, regmap, pll->config);
+		break;
+	case CLK_ALPHA_PLL_TYPE_DEFAULT:
+	case CLK_ALPHA_PLL_TYPE_DEFAULT_EVO:
+	case CLK_ALPHA_PLL_TYPE_HUAYRA:
+	case CLK_ALPHA_PLL_TYPE_HUAYRA_APSS:
+	case CLK_ALPHA_PLL_TYPE_BRAMMO:
+	case CLK_ALPHA_PLL_TYPE_BRAMMO_EVO:
+		clk_alpha_pll_configure(pll, regmap, pll->config);
+		break;
+	default:
+		WARN(1, "%s: invalid pll type\n", init->name);
+		break;
+	}
+}
+EXPORT_SYMBOL_GPL(qcom_clk_alpha_pll_configure);
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 79aca8525262211ae5295245427d4540abf1e09a..7f35aaa7a35d88411beb11fd2be5d5dd5bfbe066 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -81,6 +81,7 @@ struct pll_vco {
  * struct clk_alpha_pll - phase locked loop (PLL)
  * @offset: base address of registers
  * @regs: alpha pll register map (see @clk_alpha_pll_regs)
+ * @config: array of pll settings
  * @vco_table: array of VCO settings
  * @num_vco: number of VCO settings in @vco_table
  * @flags: bitmask to indicate features supported by the hardware
@@ -90,6 +91,7 @@ struct clk_alpha_pll {
 	u32 offset;
 	const u8 *regs;
 
+	const struct alpha_pll_config *config;
 	const struct pll_vco *vco_table;
 	size_t num_vco;
 #define SUPPORTS_OFFLINE_REQ		BIT(0)
@@ -237,5 +239,6 @@ void clk_stromer_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			       const struct alpha_pll_config *config);
 void clk_regera_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config);
+void qcom_clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap);
 
 #endif

-- 
2.34.1


