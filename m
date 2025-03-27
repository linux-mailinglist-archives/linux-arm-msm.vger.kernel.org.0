Return-Path: <linux-arm-msm+bounces-52603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 151F4A72CF1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 10:56:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34791189CEB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 09:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DD9120E00F;
	Thu, 27 Mar 2025 09:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bMI/hcbH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6CC20D50C;
	Thu, 27 Mar 2025 09:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743069246; cv=none; b=s0j43EvYQS0hBzUxnO2Xv9dh5KJuiGXNxEZK40JFCd0ThIlfhteEM/GjefTOsMPNPgkaHI8Fpy8tzn1qh4ZU9qJSiGGz2HWRuoocSvgUvy0cBLHzXSdZO4PTRAsxHGhj4NX98REE9ZvnIc3cJqjUsQhvx8x/WEvbIzAq6SNGQXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743069246; c=relaxed/simple;
	bh=BbdT+VS2aQhhlTcdaylJsI5mJSvaMzgR8V+K3HVdzBA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=EnLPQBlZMLLsIzkO8WIpKjKMKXiqcTzmADBDT1beGPm0WQurEayhOieMBb5WRpsfSovKrreVKVCUZXoNCSNp/YtGZjc7mv8BpnR35AX4Jxc36iPSUFTUOCyBxI6dF96sOYWP91X6Erm0yJmWvNPTB3C6mBnJtBqNupCm4bm5/uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bMI/hcbH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jGJf022939;
	Thu, 27 Mar 2025 09:54:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KHEe4Jo8oSWX427JYqNXFdmO3q7G/WUNb6A64+7siDY=; b=bMI/hcbHow3dNv6Q
	4xVHwPp+3RX2Suyw0TUq7i85oC6GyEhRS5M172/0E+Y0A+6nZ16qA+xWQxBits9i
	+va604jAdmSLfKb6Z+RvAsqoeThN93l/+74k0aEEiGBEdyRbQsetdHEDdGJCJ0qb
	sr62YuIX08AHZdn/mNvevpZ48TKvWYsOscnW+LEICT85hpf4wnf3Y+Wf4XYABaFc
	MEbFAfYcwS7NBHLjnjaUwYZZO6Xi7pAOUYMYC8isEV3QnymC1GQe9Rp8nr9KYjBn
	IP1p0RZ6h8CqvH/ZYqZRy9Y0ucNFiRPF2eVjPjM9FBs6tKolXKkCi4dkCwJz0DLc
	H+WfHg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mb9mv9xy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 09:54:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52R9rxY2019134
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 09:53:59 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Mar
 2025 02:53:53 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Thu, 27 Mar 2025 15:22:26 +0530
Subject: [PATCH v3 06/18] clk: qcom: common: Add support to configure clk
 regs in qcom_cc_really_probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250327-videocc-pll-multi-pd-voting-v3-6-895fafd62627@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=cs+bk04i c=1 sm=1 tr=0 ts=67e52038 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=VTlJxEOIkQDSKMlf4IcA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: pgFN-Ti0TQNH_A8gRJ41bIcNAXV98Rtd
X-Proofpoint-ORIG-GUID: pgFN-Ti0TQNH_A8gRJ41bIcNAXV98Rtd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270066

Add support to configure PLLS and clk registers in qcom_cc_really_probe().
This ensures all required power domains are enabled and kept ON by runtime
PM code in qcom_cc_really_probe() before configuring the PLLS or clock
registers.

Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
 drivers/clk/qcom/common.c | 28 ++++++++++++++++++++++++++++
 drivers/clk/qcom/common.h | 19 +++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 9cbf1c5296dad3ee5477a2f5a445488707663b9d..c4d980c6145834969fada14863360ee81c9aa251 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -14,6 +14,8 @@
 #include <linux/of.h>
 
 #include "common.h"
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
 #include "clk-rcg.h"
 #include "clk-regmap.h"
 #include "reset.h"
@@ -285,6 +287,29 @@ static int qcom_cc_icc_register(struct device *dev,
 						     desc->num_icc_hws, icd);
 }
 
+static void qcom_cc_clk_pll_configure(const struct qcom_cc_desc *desc,
+				      struct regmap *regmap)
+{
+	int i;
+
+	for (i = 0; i < desc->num_alpha_plls; i++)
+		qcom_clk_alpha_pll_configure(desc->alpha_plls[i], regmap);
+}
+
+static void qcom_cc_clk_regs_configure(const struct qcom_cc_desc *desc,
+				       struct regmap *regmap)
+{
+	struct qcom_clk_reg_setting *clk_regs = desc->clk_regs;
+	int i;
+
+	for (i = 0; i < desc->num_clk_cbcrs; i++)
+		qcom_branch_set_clk_en(regmap, desc->clk_cbcrs[i]);
+
+	for (i = 0 ; i < desc->num_clk_regs; i++)
+		regmap_update_bits(regmap, clk_regs[i].offset,
+				   clk_regs[i].mask, clk_regs[i].val);
+}
+
 int qcom_cc_really_probe(struct device *dev,
 			 const struct qcom_cc_desc *desc, struct regmap *regmap)
 {
@@ -315,6 +340,9 @@ int qcom_cc_really_probe(struct device *dev,
 			return ret;
 	}
 
+	qcom_cc_clk_pll_configure(desc, regmap);
+	qcom_cc_clk_regs_configure(desc, regmap);
+
 	reset = &cc->reset;
 	reset->rcdev.of_node = dev->of_node;
 	reset->rcdev.ops = &qcom_reset_ops;
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 9c10bc8c197cd7dfa25ccd245763ad6acb081523..01b1ae52f2dc580350409d6244578944cce571f0 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -25,6 +25,19 @@ struct qcom_icc_hws_data {
 	int clk_id;
 };
 
+/**
+ * struct qcom_clk_reg_setting - Represents miscellaneous clock register settings
+ * @offset: address offset for the clock register
+ * @mask: bit mask indicating the bits to be updated
+ * @val: Encoded value to be set within the specified bit mask
+ *       (e.g., if writing 7 to bits 4-7, mask = 0xF0 and val = 0x70)
+ */
+struct qcom_clk_reg_setting {
+	u32 offset;
+	u32 mask;
+	u32 val;
+};
+
 struct qcom_cc_desc {
 	const struct regmap_config *config;
 	struct clk_regmap **clks;
@@ -38,6 +51,12 @@ struct qcom_cc_desc {
 	const struct qcom_icc_hws_data *icc_hws;
 	size_t num_icc_hws;
 	unsigned int icc_first_node_id;
+	u32 *clk_cbcrs;
+	size_t num_clk_cbcrs;
+	struct clk_alpha_pll **alpha_plls;
+	size_t num_alpha_plls;
+	struct qcom_clk_reg_setting *clk_regs;
+	size_t num_clk_regs;
 	bool use_rpm;
 };
 

-- 
2.34.1


