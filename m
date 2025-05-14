Return-Path: <linux-arm-msm+bounces-57954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DA9AB7547
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:10:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 468E41BA5B6D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B25C72920AF;
	Wed, 14 May 2025 19:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="S/t+SwEr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEF328DB4F;
	Wed, 14 May 2025 19:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747249796; cv=none; b=HCyamjUyHoHtZLfd6eZWEwGY699wswhjLJ9lzkwFBlobapBwk+51UzYzDSjOWeLc2DnxNNY1fZRoO9AAsgFrrnItwH8xSOfCN50j+uYPMmv+AHord9BFzGPwNK2BtL9sXfQCLgGkgqZwv2f4BgotBV1Cs6Fc82NrOVJSESeVAh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747249796; c=relaxed/simple;
	bh=/D7ihJpizU1B9eJIvHO6MKXqTMAbQXlLacN8Hqh0ya0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Xd9SiPuh2SepeL8UhogWvSe0Mkna22F8+iPNOiDuFmwaxmrtPmgNZfkZ44POZV0KISsXN2GKFnztsyl73bHc6EGFskvLO+dFbfXwpBDCSO4Mx9/oTiNA8AHq+viEb2vshNWnyt8i2HSZYl5BoVW55AlxVh2E+jw1UacdQCTGs2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=S/t+SwEr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuxB7025434;
	Wed, 14 May 2025 19:09:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fw1JDyvUdpClRG6/G/+TC/Wtu4f8p/BBahXXL9HDbW0=; b=S/t+SwErTE1p3x4G
	msrIl+o8dvatSYNgWT9Iq9U9oA+9LNsVmbYjzqJvGBkpDosYmcGV+NHzfnZw6ARB
	SdV4uk8yGJZgVrz97+CjMjGpdJ2E1mEajJqtQMzSQ7gYPhE1rqAwDSNevs24UScf
	O2uqGP/OtZXwm20WQZexQJWQF5RAjkJpsJjRW3QBqxwEv/99T+79PwkFPBdv/zgG
	KG8gruXkPmCfZixSWoj6Q6dGwQwnLEZtnRKO79pHfVC28oEsJSxawAp02t9haUom
	xSLlNd3uE+tn7VY351AC/rFJZ72KTRyziRnR2wi3jwgSZvxbrQii2owI4yquzTwX
	OddhTg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbew3r4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 19:09:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54EJ9nPl030287
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 19:09:49 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 May
 2025 12:09:43 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Thu, 15 May 2025 00:38:51 +0530
Subject: [PATCH v4 06/18] clk: qcom: common: Add support to configure clk
 regs in qcom_cc_really_probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250515-videocc-pll-multi-pd-voting-v4-6-571c63297d01@quicinc.com>
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
X-Proofpoint-GUID: S_px0ft6E-bXeFT9pUj0qMoqPc4zXDae
X-Proofpoint-ORIG-GUID: S_px0ft6E-bXeFT9pUj0qMoqPc4zXDae
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NCBTYWx0ZWRfX3zU7xvEOgdiA
 nbitdFOTLSxVDlHeNQn6HP8QlczIfAZHvBHHmOesOeJ/uqgT6A3yf7muHup1dHC7AhaR2FUEgma
 fzlTjSs5VaCtlUDU7IAajIXaLrFu3WHpz/J8kOdd4b10HOPBoYADat+yMcOzWvW/5zngHwWKUMv
 Wr10okG03CPmQoN+uNsTyBKdsKYS5hpkeM//hUPXNh2vwGh0RSaz4Jc1JTcw+rMqHhi3JKmO8FZ
 pgxGbHgLrAxrSfQo5JhuhdadwptYoLUwOhNZBdSBVHfR9ejsz0CB4Niq3oSjYZYUrUz/aJRRRZK
 o/sobCXzOFGl/7f757KjXnyUMA94dfUtl6IK3O3OJnYlDcIZe9x9m+6huNn45dns2n6d5EwALds
 c7+iDA93hfVAjIOMVPM5T2PWxggz0P9uphqc9D08lfTNQqOYKULN6odCR2uqGJBObIHDionH
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=6824ea7e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=VTlJxEOIkQDSKMlf4IcA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140174

Add support to configure PLLS and clk registers in qcom_cc_really_probe().
This ensures all required power domains are enabled and kept ON by runtime
PM code in qcom_cc_really_probe() before configuring the PLLS or clock
registers.

Add support for qcom_cc_driver_data struct to maintain the clock
controllers PLLs and CBCRs data, and a pointer of it can be stored in
clock descriptor structure. If any clock controller driver requires to
program some additional misc register settings, it can register the
clk_regs_configure() callback in the driver data.

Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
 drivers/clk/qcom/common.c | 39 +++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/common.h |  9 +++++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 9cbf1c5296dad3ee5477a2f5a445488707663b9d..3b86d4953c3d90fd679ad38390279f0c1e37258f 100644
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
@@ -285,6 +287,38 @@ static int qcom_cc_icc_register(struct device *dev,
 						     desc->num_icc_hws, icd);
 }
 
+static void qcom_cc_clk_pll_configure(const struct qcom_cc_driver_data *data,
+				      struct regmap *regmap)
+{
+	const struct clk_init_data *init;
+	struct clk_alpha_pll *pll;
+	int i;
+
+	for (i = 0; i < data->num_alpha_plls; i++) {
+		pll = data->alpha_plls[i];
+		init = pll->clkr.hw.init;
+
+		if (!pll->config || !pll->regs) {
+			pr_err("%s: missing pll config or regs\n", init->name);
+			continue;
+		}
+
+		qcom_clk_alpha_pll_configure(pll, regmap);
+	}
+}
+
+static void qcom_cc_clk_regs_configure(struct device *dev, const struct qcom_cc_driver_data *data,
+				       struct regmap *regmap)
+{
+	int i;
+
+	for (i = 0; i < data->num_clk_cbcrs; i++)
+		qcom_branch_set_clk_en(regmap, data->clk_cbcrs[i]);
+
+	if (data->clk_regs_configure)
+		data->clk_regs_configure(dev, regmap);
+}
+
 int qcom_cc_really_probe(struct device *dev,
 			 const struct qcom_cc_desc *desc, struct regmap *regmap)
 {
@@ -315,6 +349,11 @@ int qcom_cc_really_probe(struct device *dev,
 			return ret;
 	}
 
+	if (desc->driver_data) {
+		qcom_cc_clk_pll_configure(desc->driver_data, regmap);
+		qcom_cc_clk_regs_configure(dev, desc->driver_data, regmap);
+	}
+
 	reset = &cc->reset;
 	reset->rcdev.of_node = dev->of_node;
 	reset->rcdev.ops = &qcom_reset_ops;
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 9c10bc8c197cd7dfa25ccd245763ad6acb081523..0f4b2d40c65cf94de694226f63ca30f4181d0ce5 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -25,6 +25,14 @@ struct qcom_icc_hws_data {
 	int clk_id;
 };
 
+struct qcom_cc_driver_data {
+	struct clk_alpha_pll **alpha_plls;
+	size_t num_alpha_plls;
+	u32 *clk_cbcrs;
+	size_t num_clk_cbcrs;
+	void (*clk_regs_configure)(struct device *dev, struct regmap *regmap);
+};
+
 struct qcom_cc_desc {
 	const struct regmap_config *config;
 	struct clk_regmap **clks;
@@ -39,6 +47,7 @@ struct qcom_cc_desc {
 	size_t num_icc_hws;
 	unsigned int icc_first_node_id;
 	bool use_rpm;
+	struct qcom_cc_driver_data *driver_data;
 };
 
 /**

-- 
2.34.1


