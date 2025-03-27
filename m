Return-Path: <linux-arm-msm+bounces-52601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDC0A72CD7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 10:54:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD41D7A4F9A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 09:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9671820E319;
	Thu, 27 Mar 2025 09:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EcxNZifX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45E320DD64;
	Thu, 27 Mar 2025 09:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743069234; cv=none; b=uuKjSOfyD1+IAuC9lXrTKEAX6zYz1e6Fap1QanoOh79pLgPwuxpSPUhroCVzCsgH3YBGDBQPQJTFWdDS4Jdg2LnpCHFls9ggEvwsWShwWh9l350JBj7Mh9WMDxYjzX/sEUqNJpGmLcopwZ0HAwZwjTtUAvz1p+QEE+kYFmJFWuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743069234; c=relaxed/simple;
	bh=E5V4MroZU41ScshJJjzgvdoQpzlGjt7Er2/+b+Soexc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=BiXec46qodTZccrgRIHnL6RnHId+B0eIx6495ShiUCR0b7krbN7d+pWqgKrpMerUQNAa+BTcJcgvQjXpNQMHjUhJ8jtL6wOS1IyUwlKTtAGGAOn8hywLPlNyrb8VlpWQt5++2NxGTOkRsc6BPeuMB7szAcpZeeOxethDA+caWWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EcxNZifX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jH8k005989;
	Thu, 27 Mar 2025 09:53:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9X6qy7cVe6HXJbSmsHNMIwZj8GDMOKd8+vooTd4wSqk=; b=EcxNZifX2eRDQApk
	UAX2KtxBWZLtTWog84PPG5SxPrONk4xGO9s/Bi203uFytyjOGv8/piCFPcjbCRQV
	IvEnZLJKmbm5mbIr94kd0CbtmQQX8tebiaPpedc83rquaJpU4+o4aKeapyO4GTwa
	0waq3sOwoh6XdfC0hTsttz7BFRk/jjCNOo35iuUQsKtOEYGDTC4Zc80NyHTgABdc
	6GdP8VeEOux6NMwttTz9TpVFvr1NBjbdRJOp/BHn2PkT04aQRMD6x4YGuSkoqSaD
	lMDgHqZWpv3xdH3VHlPhYOLmPwjJlrIWEL5C6M0yAYLk+Kjj2QzUiNY/EzR35Dy1
	pmUN0w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45m7nf4tn9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 09:53:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52R9rl1S018998
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 09:53:47 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Mar
 2025 02:53:42 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Thu, 27 Mar 2025 15:22:24 +0530
Subject: [PATCH v3 04/18] clk: qcom: clk-alpha-pll: Add support for common
 PLL configuration function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250327-videocc-pll-multi-pd-voting-v3-4-895fafd62627@quicinc.com>
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
X-Proofpoint-ORIG-GUID: CWYqOqw0sE2easw6UBDAdKy7Y5TXowbq
X-Proofpoint-GUID: CWYqOqw0sE2easw6UBDAdKy7Y5TXowbq
X-Authority-Analysis: v=2.4 cv=IMMCChvG c=1 sm=1 tr=0 ts=67e5202c cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=OkzPHvWIQKC4Cz6QotEA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270066

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
 drivers/clk/qcom/clk-alpha-pll.c | 63 ++++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  3 ++
 2 files changed, 66 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index cec0afea8e446010f0d4140d4ef63121706dde47..8ee842254e6690e24469053cdbd99a9953987e40 100644
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
@@ -2960,3 +2962,64 @@ const struct clk_ops clk_alpha_pll_regera_ops = {
 	.set_rate = clk_zonda_pll_set_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_regera_ops);
+
+void qcom_clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap)
+{
+	const struct clk_init_data *init = pll->clkr.hw.init;
+	const char *name = init->name;
+
+	if (!pll->config || !pll->regs) {
+		pr_err("%s: missing pll config or regs\n", name);
+		return;
+	}
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
+		WARN(1, "%s: invalid pll type\n", name);
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


