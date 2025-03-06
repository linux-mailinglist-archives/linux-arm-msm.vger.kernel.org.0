Return-Path: <linux-arm-msm+bounces-50461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D492A54580
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 09:56:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33EF0188E86A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 08:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 933C5209F25;
	Thu,  6 Mar 2025 08:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IBvBmFvJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42DB209684;
	Thu,  6 Mar 2025 08:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741251373; cv=none; b=NgAgndO33idwYZsa816pBrOTysUWXY7mhaSkFnilQdc9/+TqBkLTIkVlktMGOY5rPv6wVN6gfe64mc9z6HcAUz9GV4uDjCgrz8SjIqA/MN6eB8oMESnjv11BpPnbGFUofQIULLK4Jx4Mt0Q5NMGj/WYNnaxg4SuVVVKDjeruOQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741251373; c=relaxed/simple;
	bh=mlC2PeBEF7Zh1hsbyxwYBv3nug0O8cerTjtF0CVZP8w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=e5oL/wIN9LuhzMbBFhQD7XvgJxL0mtbP1sZ3TnMmqAQcg8ZAXwiBgwBOqWdNIm01O7L0NF15dz/D4yg4oW1vR0gkJl8tv+rgTO9ChOuH3f3/DEVeMhQYkwpAdxIY649C8Y+v7gcU+9ahnhxW93mcfHa3Qr5nXAI68dgIPPiZA3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IBvBmFvJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5267mMAG005493;
	Thu, 6 Mar 2025 08:56:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bDBsOXWEXht33tomz9+FjXaQvq1y8yPfdc0pLtsj0mc=; b=IBvBmFvJhDqJmihC
	xNjxrSmMM+DyTYTgzgepBN+3huWxdZ4XYPKszlTT9/NUk5I9PP6FdZUuPy4pYbuN
	Gql585yCLOeAwzg+xw8ksqxJF9DSxwbd2MTj2bU8nVDMU3NdpH464luHegbN8KdA
	P9hG5NxawyWeurbi4z7fSiydGJS/5zGQuK/rT+EYpU9YzkYL4fprud+vNjgbOVBC
	kHZS7vrpgAFjjonVmRbuH4/fabFJQgIYyVlpHzUHPT8kKDxw8FxnEO0WzM77BUUz
	6NekkmgrzR5r7Qv8yFbN1c/gOrjghJOEL/T8/4IsJE+Q4488LFrCUANpDsuWxNLY
	s/f+3w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4577mx860v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 08:56:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5268u60x027901
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 08:56:06 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Mar 2025
 00:56:02 -0800
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Thu, 6 Mar 2025 14:25:35 +0530
Subject: [PATCH v2 3/8] clk: qcom: common: Manage rpm, configure PLLs & AON
 clks in really probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250306-videocc-pll-multi-pd-voting-v2-3-0cd00612bc0e@quicinc.com>
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
X-Proofpoint-GUID: Jxf1SCCsxuJC9l1M7bnrxGYXlGvOUjE7
X-Authority-Analysis: v=2.4 cv=cOIaskeN c=1 sm=1 tr=0 ts=67c96327 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=yLKRu0m9bsFlKXT4E7YA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Jxf1SCCsxuJC9l1M7bnrxGYXlGvOUjE7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_04,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060067

Add support for runtime power management, PLL configuration and enabling
critical clocks in qcom_cc_really_probe() to commonize the clock
controller probe.

The runtime power management is not required for all clock controllers,
hence handle the rpm based on use_rpm flag in clock controller descriptor.
Also the power domains need to be kept enabled during pll configuration,
hence attach all required power domains prior to calling get_sync() on the
device.

Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
 drivers/clk/qcom/common.c | 45 ++++++++++++++++++++++++++++++++++++---------
 drivers/clk/qcom/common.h | 16 ++++++++++++++++
 2 files changed, 52 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 74d062b5da0647f7f2bd8fd7a004ffdb1116c1ea..ce87f74fa51639ed270a0c56fff1cd2845885647 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -9,6 +9,7 @@
 #include <linux/platform_device.h>
 #include <linux/clk-provider.h>
 #include <linux/interconnect-clk.h>
+#include <linux/pm_runtime.h>
 #include <linux/reset-controller.h>
 #include <linux/of.h>
 
@@ -350,6 +351,7 @@ int qcom_cc_really_probe(struct device *dev,
 	struct clk_regmap **rclks = desc->clks;
 	size_t num_clk_hws = desc->num_clk_hws;
 	struct clk_hw **clk_hws = desc->clk_hws;
+	struct qcom_clk_cfg *clks_cfg = desc->clks_cfg;
 
 	cc = devm_kzalloc(dev, sizeof(*cc), GFP_KERNEL);
 	if (!cc)
@@ -359,6 +361,23 @@ int qcom_cc_really_probe(struct device *dev,
 	if (ret < 0 && ret != -EEXIST)
 		return ret;
 
+	if (desc->use_rpm) {
+		ret = devm_pm_runtime_enable(dev);
+		if (ret)
+			return ret;
+
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret)
+			return ret;
+	}
+
+	for (i = 0; i < desc->num_plls; i++)
+		qcom_cc_clk_pll_configure(desc->plls[i], regmap);
+
+	for (i = 0 ; i < desc->num_clks_cfg; i++)
+		regmap_update_bits(regmap, clks_cfg[i].offset,
+				   clks_cfg[i].mask, clks_cfg[i].mask);
+
 	reset = &cc->reset;
 	reset->rcdev.of_node = dev->of_node;
 	reset->rcdev.ops = &qcom_reset_ops;
@@ -369,23 +388,25 @@ int qcom_cc_really_probe(struct device *dev,
 
 	ret = devm_reset_controller_register(dev, &reset->rcdev);
 	if (ret)
-		return ret;
+		goto put_rpm;
 
 	if (desc->gdscs && desc->num_gdscs) {
 		scd = devm_kzalloc(dev, sizeof(*scd), GFP_KERNEL);
-		if (!scd)
-			return -ENOMEM;
+		if (!scd) {
+			ret = -ENOMEM;
+			goto put_rpm;
+		}
 		scd->dev = dev;
 		scd->scs = desc->gdscs;
 		scd->num = desc->num_gdscs;
 		scd->pd_list = cc->pd_list;
 		ret = gdsc_register(scd, &reset->rcdev, regmap);
 		if (ret)
-			return ret;
+			goto put_rpm;
 		ret = devm_add_action_or_reset(dev, qcom_cc_gdsc_unregister,
 					       scd);
 		if (ret)
-			return ret;
+			goto put_rpm;
 	}
 
 	cc->rclks = rclks;
@@ -396,7 +417,7 @@ int qcom_cc_really_probe(struct device *dev,
 	for (i = 0; i < num_clk_hws; i++) {
 		ret = devm_clk_hw_register(dev, clk_hws[i]);
 		if (ret)
-			return ret;
+			goto put_rpm;
 	}
 
 	for (i = 0; i < num_clks; i++) {
@@ -405,14 +426,20 @@ int qcom_cc_really_probe(struct device *dev,
 
 		ret = devm_clk_register_regmap(dev, rclks[i]);
 		if (ret)
-			return ret;
+			goto put_rpm;
 	}
 
 	ret = devm_of_clk_add_hw_provider(dev, qcom_cc_clk_hw_get, cc);
 	if (ret)
-		return ret;
+		goto put_rpm;
+
+	ret = qcom_cc_icc_register(dev, desc);
+
+put_rpm:
+	if (desc->use_rpm)
+		pm_runtime_put(dev);
 
-	return qcom_cc_icc_register(dev, desc);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(qcom_cc_really_probe);
 
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 2066c8937936235d7bd03ab3225d4b3f4fb08dd0..da27290b7da3ddc6d8ba1b064619e294bfcb686c 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -26,6 +26,17 @@ struct qcom_icc_hws_data {
 	int clk_id;
 };
 
+/**
+ * struct qcom_clk_cfg - To maintain list of clocks that needs to be
+ *                       kept ON or misc clock register settings
+ * @offset: address offset for clock register
+ * @mask: bit mask to indicate the bits to update
+ */
+struct qcom_clk_cfg {
+	unsigned int offset;
+	unsigned int mask;
+};
+
 struct qcom_cc_desc {
 	const struct regmap_config *config;
 	struct clk_regmap **clks;
@@ -39,6 +50,11 @@ struct qcom_cc_desc {
 	const struct qcom_icc_hws_data *icc_hws;
 	size_t num_icc_hws;
 	unsigned int icc_first_node_id;
+	struct qcom_clk_cfg *clks_cfg;
+	size_t num_clks_cfg;
+	struct clk_alpha_pll **plls;
+	size_t num_plls;
+	bool use_rpm;
 };
 
 /**

-- 
2.34.1


