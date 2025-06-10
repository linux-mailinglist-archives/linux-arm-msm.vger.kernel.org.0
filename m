Return-Path: <linux-arm-msm+bounces-60753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 781CDAD33B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 12:36:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F326C3ACEE7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 10:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6577728D8EF;
	Tue, 10 Jun 2025 10:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UhaFxhq0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990CA28D8CE;
	Tue, 10 Jun 2025 10:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749551743; cv=none; b=jujxJ7WIBcqzC7Vuj4pUqc3g5aBxQAeTPQ4TRK/CSyN5f/n1glpZouDSLe1mFcwWoBRFfaQRkkdLYtVLyZP8YpiO5U8dPS2R3sKrvs4x4h4KV41Zh9vdb9rQ5lU9nXpebnSBaZz5tFjHbBipZR8n1oNHv3nDK+p0TsIjOog6W0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749551743; c=relaxed/simple;
	bh=5CJlSque5bVxO7f7QllHaW6/mq6LwuMw9WyJ9FEbK78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=uR1vh6CgXY1qkpWNd1Ocy2onj1H9xxGLIPBsX9pyMj+SsagXOsK34nYrv6AZWYxXZwKRRnb1E0T/kHLv2ozkPxdQ85SBHhh0045AEub+MyyVjCrcEoXlqwBQjZyfiuwuO8oe2STwIIhokR7cRKEpAdGLh7528oMGOVLHCyUw03I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UhaFxhq0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A7vxG9013568;
	Tue, 10 Jun 2025 10:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3jZdw10dTyEg+5O6BcNWbdbLmEdWs08JgAGjmNeLD1I=; b=UhaFxhq0WYFXlX8Z
	K39EXa5S/hq+kHfHnSvnprIcm63/2mvnW8Lw5J52ISi+5vuF48LTWKtzB/Mok/th
	/UmitlbK3C8j/YhRV4Rksri1MOqylKR4Oi95XPiWyzfrPDLsB5b04fAago5m+JY8
	pomlqXuIwwyZKyIzBLKLU2iJ8hhXa9y4WcILsBG1TiVKWtEUcPY4P3XS0wjjXDiD
	jAvxcliZpksVGecRgZdXih6whalqGgF7koa8yJsKFVXTp5xkY5Vp5ibyoBw7xB1q
	CpmpDY1nJzYZ9v4o0h79x2b+vIQDRVhmsVjqRkL8IM2jCVSzXSBeg41JRJ11Xxx2
	LvzpzQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcgxw6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 10:35:37 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55AAZbx9011595
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 10:35:37 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Jun 2025 03:35:33 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Tue, 10 Jun 2025 18:35:19 +0800
Subject: [PATCH v3 2/4] clk: qcom: cmnpll: Add IPQ5424 SoC support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250610-qcom_ipq5424_cmnpll-v3-2-ceada8165645@quicinc.com>
References: <20250610-qcom_ipq5424_cmnpll-v3-0-ceada8165645@quicinc.com>
In-Reply-To: <20250610-qcom_ipq5424_cmnpll-v3-0-ceada8165645@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_suruchia@quicinc.com>,
        <quic_pavir@quicinc.com>, <quic_linchen@quicinc.com>,
        <quic_leiwei@quicinc.com>, Luo Jie <quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749551725; l=3843;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=5CJlSque5bVxO7f7QllHaW6/mq6LwuMw9WyJ9FEbK78=;
 b=Qg3XKSZSktV65fI4tNDgn8afQ9lK7bpco1Z4MG6cNL5KApiaSVPRpHZy4cOFedHB4CjBV+Dt5
 k81T0wONIWNAxocWDgkQzji+MxW1V9vsbxlH7aAGJfhEQmTBu/4oQ/1
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA4MiBTYWx0ZWRfX70oyBTagg7UG
 nUIe8Isq2vy4ecRXWVtm+KzrqKMu+Zjg/BMuEmV9f6DLKSdcT6K6kFNxcrss+xQdJuSAshL79Cz
 Zudj5PnryHk8EaRFWZjXGmfZcPxcTjkuFnPjc72GGOKefdNgshmOR22eWfza/j+3ySihqZKGm7X
 3DfDHQfj2aPBTWgmOeAhXmh/Dpk6eFJ4P5onh3zlW+Jj17u6iuro46aodLpvgaNNc/QXQevydwL
 rQpJs6MJp8qsZMZMPtvUfjznXayVjUQO0qWmY/PH7sv0vou8yDdLFnkpexL2bHOn7nKMntvTSI3
 VjMgbuyKv0qYxkMWd2okBaWQGFAmfC8S0VYZTvK1/wdWNNaAyLq9qR5h3Pzcq95FPDe5uQDNpNq
 /NGEtloYWHTLe0y09Wzibtel++LQg0MXHXItZFDvNR+4AEXNjNeC4oEsTdTwtpiDh7LHshDQ
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=68480a7a cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=S_Th_t9o068aLgcjpOcA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: t393E6SH0srGk2uRwe2f_yQiQUGaEGtx
X-Proofpoint-ORIG-GUID: t393E6SH0srGk2uRwe2f_yQiQUGaEGtx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100082

The CMN PLL in IPQ5424 SoC supplies the fixed clock to NSS at 300 MHZ
and to PPE at 375 MHZ. Other output clocks from CMN PLL on this SoC,
and their rates are same as IPQ9574.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 35 ++++++++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index 432d4c4b7aa6..b34d6faf67b8 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 /*
@@ -16,6 +16,10 @@
  * are supplied to GCC (24 MHZ as XO and 32 KHZ as sleep clock), and to PCS
  * with 31.25 MHZ.
  *
+ * On the IPQ5424 SoC, there is an output clock from CMN PLL to PPE at 375 MHZ,
+ * and an output clock to NSS (network subsystem) at 300 MHZ. The other output
+ * clocks from CMN PLL on IPQ5424 are the same as IPQ9574.
+ *
  *               +---------+
  *               |   GCC   |
  *               +--+---+--+
@@ -46,6 +50,7 @@
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
+#include <dt-bindings/clock/qcom,ipq5424-cmn-pll.h>
 
 #define CMN_PLL_REFCLK_SRC_SELECTION		0x28
 #define CMN_PLL_REFCLK_SRC_DIV			GENMASK(9, 8)
@@ -115,6 +120,20 @@ static const struct cmn_pll_fixed_output_clk ipq9574_output_clks[] = {
 	CLK_PLL_OUTPUT(ETH1_50MHZ_CLK, "eth1-50mhz", 50000000UL),
 	CLK_PLL_OUTPUT(ETH2_50MHZ_CLK, "eth2-50mhz", 50000000UL),
 	CLK_PLL_OUTPUT(ETH_25MHZ_CLK, "eth-25mhz", 25000000UL),
+	{ /* Sentinel */ }
+};
+
+static const struct cmn_pll_fixed_output_clk ipq5424_output_clks[] = {
+	CLK_PLL_OUTPUT(IPQ5424_XO_24MHZ_CLK, "xo-24mhz", 24000000UL),
+	CLK_PLL_OUTPUT(IPQ5424_SLEEP_32KHZ_CLK, "sleep-32khz", 32000UL),
+	CLK_PLL_OUTPUT(IPQ5424_PCS_31P25MHZ_CLK, "pcs-31p25mhz", 31250000UL),
+	CLK_PLL_OUTPUT(IPQ5424_NSS_300MHZ_CLK, "nss-300mhz", 300000000UL),
+	CLK_PLL_OUTPUT(IPQ5424_PPE_375MHZ_CLK, "ppe-375mhz", 375000000UL),
+	CLK_PLL_OUTPUT(IPQ5424_ETH0_50MHZ_CLK, "eth0-50mhz", 50000000UL),
+	CLK_PLL_OUTPUT(IPQ5424_ETH1_50MHZ_CLK, "eth1-50mhz", 50000000UL),
+	CLK_PLL_OUTPUT(IPQ5424_ETH2_50MHZ_CLK, "eth2-50mhz", 50000000UL),
+	CLK_PLL_OUTPUT(IPQ5424_ETH_25MHZ_CLK, "eth-25mhz", 25000000UL),
+	{ /* Sentinel */ }
 };
 
 /*
@@ -297,7 +316,7 @@ static struct clk_hw *ipq_cmn_pll_clk_hw_register(struct platform_device *pdev)
 
 static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 {
-	const struct cmn_pll_fixed_output_clk *fixed_clk;
+	const struct cmn_pll_fixed_output_clk *p, *fixed_clk;
 	struct clk_hw_onecell_data *hw_data;
 	struct device *dev = &pdev->dev;
 	struct clk_hw *cmn_pll_hw;
@@ -305,8 +324,13 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 	struct clk_hw *hw;
 	int ret, i;
 
-	fixed_clk = ipq9574_output_clks;
-	num_clks = ARRAY_SIZE(ipq9574_output_clks);
+	fixed_clk = device_get_match_data(dev);
+	if (!fixed_clk)
+		return -EINVAL;
+
+	num_clks = 0;
+	for (p = fixed_clk; p->name; p++)
+		num_clks++;
 
 	hw_data = devm_kzalloc(dev, struct_size(hw_data, hws, num_clks + 1),
 			       GFP_KERNEL);
@@ -415,7 +439,8 @@ static const struct dev_pm_ops ipq_cmn_pll_pm_ops = {
 };
 
 static const struct of_device_id ipq_cmn_pll_clk_ids[] = {
-	{ .compatible = "qcom,ipq9574-cmn-pll", },
+	{ .compatible = "qcom,ipq9574-cmn-pll", .data = &ipq9574_output_clks },
+	{ .compatible = "qcom,ipq5424-cmn-pll", .data = &ipq5424_output_clks },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ipq_cmn_pll_clk_ids);

-- 
2.34.1


