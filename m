Return-Path: <linux-arm-msm+bounces-54031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9447BA85E03
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 15:01:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0B9F189151B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 12:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8594A221FBF;
	Fri, 11 Apr 2025 12:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZGCkE/1C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1D2221FB9;
	Fri, 11 Apr 2025 12:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744376312; cv=none; b=nQUPAdOozLAGBSM9MmX4bCYo3wEqP3QB1k7Hc1whgOf6thweVWBlsVeiop1xccKJQECI9hXDOJ7b9fzWP2qZSSXBSLy6CyzcamFqbA1r1n6A3i0dJrbMVjctH3GRWqip1oaAhCj7UX0V0OKwtcss2BFD5vff2TqsaS1ZLu7AG4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744376312; c=relaxed/simple;
	bh=UBXVdU+mwdKEKr7nRgAk0oQD/NQermYNcM1njMWOuGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=qr7Bimz8i5NWzccRUKf3GVPmkUcsZ8Wyi+fu/M/e1R64ekvgInoubF0pugBkiIh0eCDQ7oikOW+XhL/LOVYQ0XTOxd48uA3t28lQSZoKqC+a8LlT5dWXIjXGF+/Pf2MlrUNPc/Je0tKVBsBJERa4Y/Ri7HabL2iQehlmn/v0/KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZGCkE/1C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5pd45016300;
	Fri, 11 Apr 2025 12:58:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CCgfr6HhIVueke1KggQCfog7M3xuOJ/eJAxQih1EjeU=; b=ZGCkE/1CMZw3yVo6
	4w3Vlre9zh0W1VhgBjYnVo1PMJJcv4H4k0otujStHZADK+j43Hk0ZyxnKh1XeUNa
	9W9Gk8BKzaj2j90XBuKrOV7SlQjD8e71EDzAYwV/qaRQlEpedc1SnAY0/QN8Rkfm
	vM+VI/9vRT18JfAwYrn8U2bm9xfUoozfM/W+XCUO2St5t0vyhfRb6qY0lvEvKgN8
	uuN1QgHfF7fC8Od2+78/mhkGahTlND4menDr7TtKvvZP/nwFu8khfqeQR+pVd8zr
	GkXH9jvOwEGTtOSTB65OmXsQBesj0HCxxuWJCKuMDJZgbVMNJYQAviTsI1GIMNXU
	yNVXlg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1t8b9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 12:58:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53BCwQ0a018124
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 12:58:26 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 11 Apr 2025 05:58:22 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Fri, 11 Apr 2025 20:58:11 +0800
Subject: [PATCH v2 2/4] clk: qcom: cmnpll: Add IPQ5424 SoC support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250411-qcom_ipq5424_cmnpll-v2-2-7252c192e078@quicinc.com>
References: <20250411-qcom_ipq5424_cmnpll-v2-0-7252c192e078@quicinc.com>
In-Reply-To: <20250411-qcom_ipq5424_cmnpll-v2-0-7252c192e078@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744376294; l=3800;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=UBXVdU+mwdKEKr7nRgAk0oQD/NQermYNcM1njMWOuGU=;
 b=UxUo9BHjNibrehXjS/rOZjc1QRTiRNQqNnjqfrADcZhRHwHOd+aSeo6q1/CxDO5CGJyFlkqBp
 3j+AkaOaYhjB5L/B+uZ9XBAOC0SaTIiEYzrckskV90XPGHtRhDeGimg
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zPtKEma1fogRzEWw6oZ-CBud6EoyWguo
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f911f3 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=12pe3R4uG_3c02tcYSEA:9 a=QEXdDO2ut3YA:10
 a=RVmHIydaz68A:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: zPtKEma1fogRzEWw6oZ-CBud6EoyWguo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110083

The CMN PLL in IPQ5424 SoC supplies the fixed clock to NSS at 300 MHZ
and to PPE at 375 MHZ. Other output clocks from CMN PLL on this SoC,
and their rates are same as IPQ9574.

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


