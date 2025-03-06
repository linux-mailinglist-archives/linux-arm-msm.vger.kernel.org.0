Return-Path: <linux-arm-msm+bounces-50460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D24EA5457C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 09:56:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B935188EED6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 08:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770EC208989;
	Thu,  6 Mar 2025 08:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HAWXBxhM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FEE208987;
	Thu,  6 Mar 2025 08:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741251369; cv=none; b=byTB3XRmcQ6Txe9eh8zPfU7glEKI/MXj9Zk2oXO3CyA8KzYQ5I1Z1ovUNlFt77EeMK7CDlNIYCXz3V+vEWc9LPv6RYiMcdbbRGKFBImaHrR1TtQ55AIZaqKI5gkBYOVir+ieF0YBDLereSVOYiseNqFr8JaqsG7auWpOvTG5nFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741251369; c=relaxed/simple;
	bh=R3VPcORpQZX1bBPca0wFuHPEPShDh07/I45IuuEvPhk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=lKnokI7dfCZvPAU57yN3/RtbK7Bot4sITzi60pihzDCCJ4dlbfRL9gmNm8AAMLxFcGA3HFXZ6KMrSLHnPHdO6jvVUUrN/voh98rTsPYKeiW3undXSeY5GkYSZOqMZ8aNt8dBAvyjlMGPwuKv0H8EKC6BIKllm7MaKBHrX3T3YWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HAWXBxhM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5268sMOk023663;
	Thu, 6 Mar 2025 08:56:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+s+ynejqnMBSsldGN5039JK70eYCFopxob2A8fyIxD8=; b=HAWXBxhMVcneg6r2
	UT5lBZ73xop2AoqPgT5yszCURWy8DCIThxZt+Bh8QkCnXD2VrA95slOfhRwiueNZ
	LDkVuKEj4N6043w9yBCgBNeyA5AIZCVXU8j2cWmyIehYWZlzY3hDRAhUclx2rxXK
	7mq8icbwWaXY77IpXz67WO6nCseAzrzS9b4s3lZBRTAh1ctPcNKe8jV/Y01sOVzW
	wzfsqEgLXW/umXljQaIAJmI2RqaVHB+xo+qsFfxvamgSOkkUpZ6hO80ocL3PNS0V
	Gm8GkQMy8q7kLCDJfE/O5K4R62WxyuWTyrUkMaN8QN2Kke4pimrk5iAZBrHnwlLw
	H3pxXQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6t8e6q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 08:56:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5268u2Xo001119
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 08:56:02 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Mar 2025
 00:55:57 -0800
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Thu, 6 Mar 2025 14:25:34 +0530
Subject: [PATCH v2 2/8] clk: qcom: common: Add support to configure PLL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250306-videocc-pll-multi-pd-voting-v2-2-0cd00612bc0e@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=I/ufRMgg c=1 sm=1 tr=0 ts=67c96323 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=NxgP0f51J-hE8UgaI0YA:9 a=QEXdDO2ut3YA:10
 a=p3-mXJtgjkAcb_9NvCUt:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: LGsaAdJc1Ohh0QsxrKbZODVwb9kE8_zX
X-Proofpoint-ORIG-GUID: LGsaAdJc1Ohh0QsxrKbZODVwb9kE8_zX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_04,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060067

From: Taniya Das <quic_tdas@quicinc.com>

Integrate PLL configuration into clk_alpha_pll structure and add support
for qcom_cc_clk_alpha_pll_configure() function which can be used to
configure the clock controller PLLs from common core code.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
 drivers/clk/qcom/clk-alpha-pll.h |  2 ++
 drivers/clk/qcom/common.c        | 55 ++++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/common.h        |  1 +
 3 files changed, 58 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 79aca8525262211ae5295245427d4540abf1e09a..943320cdcd10a6c07fcd74dccb88be847dc086c2 100644
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
diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 9e3380fd718198c9fe63d7361615a91c3ecb3d60..74d062b5da0647f7f2bd8fd7a004ffdb1116c1ea 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -13,6 +13,7 @@
 #include <linux/of.h>
 
 #include "common.h"
+#include "clk-alpha-pll.h"
 #include "clk-rcg.h"
 #include "clk-regmap.h"
 #include "reset.h"
@@ -284,6 +285,60 @@ static int qcom_cc_icc_register(struct device *dev,
 						     desc->num_icc_hws, icd);
 }
 
+static void qcom_cc_clk_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap)
+{
+	if (!pll->config || !pll->regs)
+		return;
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
+		break;
+	}
+}
+
 int qcom_cc_really_probe(struct device *dev,
 			 const struct qcom_cc_desc *desc, struct regmap *regmap)
 {
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 7ace5d7f5836aa81431153ba92d8f14f2ffe8147..2066c8937936235d7bd03ab3225d4b3f4fb08dd0 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -18,6 +18,7 @@ struct clk_hw;
 #define PLL_BIAS_COUNT_MASK	0x3f
 #define PLL_VOTE_FSM_ENA	BIT(20)
 #define PLL_VOTE_FSM_RESET	BIT(21)
+#define GET_PLL_TYPE(pll)	((pll->regs - clk_alpha_pll_regs[0]) / PLL_OFF_MAX_REGS)
 
 struct qcom_icc_hws_data {
 	int master_id;

-- 
2.34.1


