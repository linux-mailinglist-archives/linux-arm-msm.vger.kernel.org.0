Return-Path: <linux-arm-msm+bounces-57952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A99B0AB753D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:10:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 440001BA5578
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E49528D84E;
	Wed, 14 May 2025 19:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Oo/UO+oH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798E628D840;
	Wed, 14 May 2025 19:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747249787; cv=none; b=AbwVhy7k4/mzIB3PnRV/PK/3znDWOp1ZCsWd1nK6hnD/O3JA6L+oHLoWh4wcI29z+vBshQNNoa8VYgBjPstlci5t3absxiwK9QanuWZzN3hhtaUFZa99SGJY6ChqJLXS6Xh9P+OClcO0uG5npVE52N6FecQK0GR0c7zbMvrpAqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747249787; c=relaxed/simple;
	bh=fijA/m0wXeRTzjRYawPTH7TrCng+6uTmKPAgbhxXl40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=huPH8voPU+LtXdSQGz+TCqmTkTJdQiuTBJwWQlQP/8bSI0i/sVQ4CzLeUUhkecpqII8rhJJqrb86ChX1+SutS6th2KcpjAV//IjIn0pAM3k8uFkco5JBvlhqkCN+ePkSloqBVQw3XB2S/9zMjNu4DTdo2402Pf7fzDFln84tdnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Oo/UO+oH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAvLSc003537;
	Wed, 14 May 2025 19:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3hDqBFirtb+0aPZKnxQjjdOV1Y0i2kXV8NVH8D+S45c=; b=Oo/UO+oHDC+5SrDQ
	ajb2T4R1NI8hG9f095caBbJWQwn4XzZp0F0/MpN+bB0NE4QVCs8lB5duLUejxnp2
	7R3VVrHdHFUoX9L0/LVBCqUYDyzXnc7jsqM4rzxrhp/8XuEgB+JzOWAD5WsbOXe+
	qE/KEdOGwq/YzaQv34cGdyjHAgTBK+32lJpfK5HkHbDEnuFK0WF3/+D5d976A2Gg
	9hlzCLp6jR1qP/mIUKWzpOtYRD5KWa4pbw4MaUJVQAcXpA/0D4iVX/RC3zEM4XAl
	vRODHA7zeL+S8SWXs1VUOgEqu0OSEghYStNng94KLr80zoanypm35ag1PFfACGr/
	pJBLSw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcrbrsy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 19:09:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54EJ9big010698
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 19:09:37 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 May
 2025 12:09:32 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Thu, 15 May 2025 00:38:49 +0530
Subject: [PATCH v4 04/18] clk: qcom: clk-alpha-pll: Add support for common
 PLL configuration function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250515-videocc-pll-multi-pd-voting-v4-4-571c63297d01@quicinc.com>
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hsVsd2wBbUruQc3XbC-lt2NNbyhc-IDt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NCBTYWx0ZWRfX4wPRNxf5U7tM
 JfPzhtvCN4/4ByWISywA68JTOZ1RFv+GtsqH33HH1JAOIWqGiIyPq4Djw6v67S2OuOSuItnn94A
 dEKPPGT6GnE/eYAdGhOP7IyIzFFA+O6WKF1AyWyHMjMWWqzImNWOxYrMzmqXQ60UovniDH5O4I4
 4GX4FRb4vYw9F4jBfVLR7UkfngMo+X4MJnlCTICkfxQ9rxQpyiDVUkaRh2AZ3vTKPZZIg7HUoJP
 52STJrfHQIXJuGpS9WebVAkEjS3Zihth3ceqd5NLIIDJ3pgt0MvZtN/6toUtef4VHZ6nMkHkj1E
 /Wa3Brvqnd0X1C7Pbf9mkqiyATtsd4oRnt0F8KhJNVThBEv3NO2digPsrXImY/jLpHtwdXTxxFk
 Gt7r6kbVsQrPX2QFx/J93k4UeO66NtdUCgaEA38eztcLOkopixvCaHf48r5s3v5gPivti9qg
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=6824ea72 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=JQl2qjEAfWPE5jP6FgYA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: hsVsd2wBbUruQc3XbC-lt2NNbyhc-IDt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140174

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


