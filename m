Return-Path: <linux-arm-msm+bounces-59895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D47AC8FE7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 15:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD6DA7AA8D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 13:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAE9622F15E;
	Fri, 30 May 2025 13:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GjelcnDz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA7522F14C;
	Fri, 30 May 2025 13:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748611302; cv=none; b=nX7cw9mkHzfK+qieKjc+8gOE0oJ4E7ULo0WpdvajE+rSqo8AGcX8aS/4AYKuo9kdCnkpI4i5NIMFES1yOkrREkKrxCEAle1talDXyf50niUnOPctHD+ZZdvU32/CS1iYT8yKcOOoRrtdttR/SnYySzIiVQKO5lu6a0B/U66oWOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748611302; c=relaxed/simple;
	bh=3/Tkpnr2UNow+oonHEjZn3pZrTQrJI6myX3xRvMBPdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=dcChSFIjjFk38UblF4MNTMnqjky9urT6GrI/ILx27CwCIN+BNkFJGlA3/TrwcLCrJGkukVyejv+jFf6L84gcB7L7Xq4qwigQQftvJVraKRB6Dp5igzHj2t4Rn2/jwy8r1r/AVLGPsGViwm4wo6j/Y8Sd0/fo0qES9+lA7jZqXBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GjelcnDz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UAx8oc007161;
	Fri, 30 May 2025 13:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FR2Ul25WpwZfJgyJGx1dY87ef+IPYlueobZJqodE8bs=; b=GjelcnDz0vkgV/NU
	kXgW8rJJCp2FXx/7b4KJGYzi3YgMHbl0i4zb7yi4xxtn+M+wORsqWK6Zex2Zy07m
	PFH/ZenSmA+qDAaT9m+H4MjFeXahwg0j8IqmF2KldjM3SMbfc+r9JSvNJcO7nZDw
	DjyshWGZXsThsDSFDuoZWk5lhL+dSKu23ODE4iNZMSOwC/QzZrv9x+neTP62Kw+h
	XAeVYGJ6CuEAg/KDzcryMLskt/TiSeNflLAH4shhs5uiXeUWW4r4DJg9SqHl3jt0
	drzIbcNlmTC9PAd3rreQJ/DgjRcuXnALMdi/0mwrDCrD+hT5/XHvR0PWnkjrlLgn
	5eBSeg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fqhajg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 13:21:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54UDLaTV028006
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 13:21:36 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 30 May
 2025 06:21:30 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Fri, 30 May 2025 18:50:51 +0530
Subject: [PATCH v5 06/18] clk: qcom: common: Add support to configure clk
 regs in qcom_cc_really_probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250530-videocc-pll-multi-pd-voting-v5-6-02303b3a582d@quicinc.com>
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
X-Proofpoint-GUID: PrXf_ZJISfLsLtkYTt8F8SlGUbPXZ9sg
X-Proofpoint-ORIG-GUID: PrXf_ZJISfLsLtkYTt8F8SlGUbPXZ9sg
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=6839b0e1 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=VTlJxEOIkQDSKMlf4IcA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDExNiBTYWx0ZWRfX5eg9/X4qdKsp
 xuVY/5xZjtbK9g8WbRyfqCTszB8CUbkU5iq/j5UdWs7LI7Zw0x4hud2YLo0brl9t8vAr2A8LtY2
 xERaLONHd4+q/RgWFurIt55vusXgQRLjkXld/umc/54clV9FOwuRIsrSK9d24iBEsavyI1tRYO3
 Ru7LIl+HZbMwC//CmRXD1/51nYaIR+V6yITUCDzlq6t/I9nfObleM60T15icxlxunCIpBYXs4XA
 6iQyy4mNIBe8jz8CTNbA5nFOjHU7n1NivvXw7JA3hPToEwyqC0Yyv6gPo8jVM3adC06IiWVCWXb
 Rqu7iZO8pH9V0UBZOoCaozVgmcSjnAN6DviWSqrkMbHOxMOyHXQQXHnivM/QPIbiztqG4avhnYI
 iFi6yg3uoDAzSOhPeFxvHGkEz66yeb6cFbE67Lsx3yCCXF1pg8uZ41Haa1wQ0G+07/xnZQ6I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_05,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505300116

Add support to configure PLLS and clk registers in qcom_cc_really_probe().
This ensures all required power domains are enabled and kept ON by runtime
PM code in qcom_cc_really_probe() before configuring the PLLS or clock
registers.

Add support for qcom_cc_driver_data struct to maintain the clock
controllers PLLs and CBCRs data, and a pointer of it can be stored in
clock descriptor structure. If any clock controller driver requires to
program some additional misc register settings, it can register the
clk_regs_configure() callback in the driver data.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
 drivers/clk/qcom/common.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/common.h |  9 +++++++++
 2 files changed, 53 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 9cbf1c5296dad3ee5477a2f5a445488707663b9d..b3838d885db25f183979576e5c685c07dc6a7049 100644
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
@@ -285,6 +287,40 @@ static int qcom_cc_icc_register(struct device *dev,
 						     desc->num_icc_hws, icd);
 }
 
+static int qcom_cc_clk_pll_configure(const struct qcom_cc_driver_data *data,
+				     struct regmap *regmap)
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
+			return -EINVAL;
+		}
+
+		qcom_clk_alpha_pll_configure(pll, regmap);
+	}
+
+	return 0;
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
@@ -315,6 +351,14 @@ int qcom_cc_really_probe(struct device *dev,
 			return ret;
 	}
 
+	if (desc->driver_data) {
+		ret = qcom_cc_clk_pll_configure(desc->driver_data, regmap);
+		if (ret)
+			goto put_rpm;
+
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


