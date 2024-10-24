Return-Path: <linux-arm-msm+bounces-35691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCD89AE6BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 15:36:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F287D1F271D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 13:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87FAB1FA246;
	Thu, 24 Oct 2024 13:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aTra7APL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DF61F5855;
	Thu, 24 Oct 2024 13:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729776723; cv=none; b=YTXG/4mHQSQ+rYsiIfV3/5xu0zT5m1PTNY7TDHPc01YZW6FU+v5MxZ+Gp0NCUwUzinyqXSL3BacvBuD1v1x2ihG2L4VK808tjeNWRNKLSw+V4SyGWnL52DI8l37uB3cuhVnHKsIk1uSFNLf5ZZmKQHJyuXB6AIGOqEI6CfoXAnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729776723; c=relaxed/simple;
	bh=gnaZBrHw6Y06sk/K4PEIIl9i/nErCdVqzLZNDCyk1uE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=qK/R/WvWgqJ6ov3hgGe8he1X8pTJaTljSkqGZ7xDRreTBR90dpBRMoNHJql/LxTtjvh19Z9Mo4foKJahwR8fyghRRNvJk9iI5PMFDB778gYd9hf311fmmOZn3k4b/s1DcKTN1Iw4i41du6vT1JWbNLHqUzYCkJc9rrWKG3gDimM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aTra7APL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49O9pJG6005091;
	Thu, 24 Oct 2024 13:31:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gZgrw86mYvz5SNMZxTklmU2+XSi1g6JxNhzC2L+S4Bc=; b=aTra7APLg+jk+e08
	FSXJvmlbe2ElFP+HgKN8NM4vct6jEnK8z9ThX6GYiqkl7M2k0hgwr0n/oHOay0/K
	EKqipMlMX5LMwscGcse9tO5XjmwaLV2tGr2Hmi8rYkaL4/w2e1rP8goJLhjD0hzl
	T1OKcpODbAMrujCvB8VObPueLvYWYS8Jv3ubiP1+195WNwCBjPy1FBDsRPz83TPv
	ML4HNwQcg8jub6SZOxgk+93pORP+VWnZGqDknTbJKkM+tMQJfMSkpp5tJLK0VssP
	X0I9/Ac/dVrtb6+VZ/G0JiRkNfHkP7uqjvMZvk5orzjm5H/bhv9XDw5WaEYzUfw9
	rdSzgg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em685rsv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 13:31:57 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49ODVtu0028781
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 13:31:55 GMT
Received: from hu-imrashai-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Oct 2024 06:31:51 -0700
From: Imran Shaik <quic_imrashai@quicinc.com>
Date: Thu, 24 Oct 2024 19:01:17 +0530
Subject: [PATCH v2 4/6] clk: qcom: Add support for Camera Clock Controller
 on QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241024-qcs8300-mm-patches-v2-4-76c905060d0a@quicinc.com>
References: <20241024-qcs8300-mm-patches-v2-0-76c905060d0a@quicinc.com>
In-Reply-To: <20241024-qcs8300-mm-patches-v2-0-76c905060d0a@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0f-_HXTP827mzry3xEjBannnfa4MKXRz
X-Proofpoint-GUID: 0f-_HXTP827mzry3xEjBannnfa4MKXRz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410240110

Add support to the QCS8300 Camera clock controller by extending
the SA8775P Camera clock controller, which is mostly identical
but QCS8300 has few additional clocks and few other differences.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
---
 drivers/clk/qcom/camcc-sa8775p.c | 99 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 95 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sa8775p.c b/drivers/clk/qcom/camcc-sa8775p.c
index c04801a5af35..0ef3c6015c34 100644
--- a/drivers/clk/qcom/camcc-sa8775p.c
+++ b/drivers/clk/qcom/camcc-sa8775p.c
@@ -1682,6 +1682,24 @@ static struct clk_branch cam_cc_sm_obs_clk = {
 	},
 };
 
+static struct clk_branch cam_cc_titan_top_accu_shift_clk = {
+	.halt_reg = 0x131f0,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x131f0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_titan_top_accu_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct gdsc cam_cc_titan_top_gdsc = {
 	.gdscr = 0x131bc,
 	.en_rest_wait_val = 0x2,
@@ -1776,6 +1794,7 @@ static struct clk_regmap *cam_cc_sa8775p_clocks[] = {
 	[CAM_CC_SLEEP_CLK_SRC] = &cam_cc_sleep_clk_src.clkr,
 	[CAM_CC_SLOW_AHB_CLK_SRC] = &cam_cc_slow_ahb_clk_src.clkr,
 	[CAM_CC_SM_OBS_CLK] = &cam_cc_sm_obs_clk.clkr,
+	[CAM_CC_TITAN_TOP_ACCU_SHIFT_CLK] = NULL,
 	[CAM_CC_XO_CLK_SRC] = &cam_cc_xo_clk_src.clkr,
 	[CAM_CC_QDSS_DEBUG_XO_CLK] = &cam_cc_qdss_debug_xo_clk.clkr,
 };
@@ -1812,6 +1831,7 @@ static struct qcom_cc_desc cam_cc_sa8775p_desc = {
 };
 
 static const struct of_device_id cam_cc_sa8775p_match_table[] = {
+	{ .compatible = "qcom,qcs8300-camcc" },
 	{ .compatible = "qcom,sa8775p-camcc" },
 	{ }
 };
@@ -1842,10 +1862,81 @@ static int cam_cc_sa8775p_probe(struct platform_device *pdev)
 	clk_lucid_evo_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_config);
 	clk_lucid_evo_pll_configure(&cam_cc_pll5, regmap, &cam_cc_pll5_config);
 
-	/* Keep some clocks always enabled */
-	qcom_branch_set_clk_en(regmap, 0x13194); /* CAM_CC_CAMNOC_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x131ec); /* CAM_CC_GDSC_CLK */
-	qcom_branch_set_clk_en(regmap, 0x13208); /* CAM_CC_SLEEP_CLK */
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,qcs8300-camcc")) {
+		cam_cc_camnoc_axi_clk_src.cmd_rcgr = 0x13154;
+		cam_cc_camnoc_axi_clk.halt_reg = 0x1316c;
+		cam_cc_camnoc_axi_clk.clkr.enable_reg = 0x1316c;
+		cam_cc_camnoc_dcd_xo_clk.halt_reg = 0x13174;
+		cam_cc_camnoc_dcd_xo_clk.clkr.enable_reg = 0x13174;
+
+		cam_cc_csi0phytimer_clk_src.cmd_rcgr = 0x15054;
+		cam_cc_csi1phytimer_clk_src.cmd_rcgr = 0x15078;
+		cam_cc_csi2phytimer_clk_src.cmd_rcgr = 0x15098;
+		cam_cc_csid_clk_src.cmd_rcgr = 0x13134;
+
+		cam_cc_mclk0_clk_src.cmd_rcgr = 0x15000;
+		cam_cc_mclk1_clk_src.cmd_rcgr = 0x1501c;
+		cam_cc_mclk2_clk_src.cmd_rcgr = 0x15038;
+
+		cam_cc_fast_ahb_clk_src.cmd_rcgr = 0x13104;
+		cam_cc_slow_ahb_clk_src.cmd_rcgr = 0x1311c;
+		cam_cc_xo_clk_src.cmd_rcgr = 0x131b8;
+		cam_cc_sleep_clk_src.cmd_rcgr = 0x131d4;
+
+		cam_cc_core_ahb_clk.halt_reg = 0x131b4;
+		cam_cc_core_ahb_clk.clkr.enable_reg = 0x131b4;
+
+		cam_cc_cpas_ahb_clk.halt_reg = 0x130f4;
+		cam_cc_cpas_ahb_clk.clkr.enable_reg = 0x130f4;
+		cam_cc_cpas_fast_ahb_clk.halt_reg = 0x130fc;
+		cam_cc_cpas_fast_ahb_clk.clkr.enable_reg = 0x130fc;
+
+		cam_cc_csi0phytimer_clk.halt_reg = 0x1506c;
+		cam_cc_csi0phytimer_clk.clkr.enable_reg = 0x1506c;
+		cam_cc_csi1phytimer_clk.halt_reg = 0x15090;
+		cam_cc_csi1phytimer_clk.clkr.enable_reg = 0x15090;
+		cam_cc_csi2phytimer_clk.halt_reg = 0x150b0;
+		cam_cc_csi2phytimer_clk.clkr.enable_reg = 0x150b0;
+		cam_cc_csid_clk.halt_reg = 0x1314c;
+		cam_cc_csid_clk.clkr.enable_reg = 0x1314c;
+		cam_cc_csid_csiphy_rx_clk.halt_reg = 0x15074;
+		cam_cc_csid_csiphy_rx_clk.clkr.enable_reg = 0x15074;
+		cam_cc_csiphy0_clk.halt_reg = 0x15070;
+		cam_cc_csiphy0_clk.clkr.enable_reg = 0x15070;
+		cam_cc_csiphy1_clk.halt_reg = 0x15094;
+		cam_cc_csiphy1_clk.clkr.enable_reg = 0x15094;
+		cam_cc_csiphy2_clk.halt_reg = 0x150b4;
+		cam_cc_csiphy2_clk.clkr.enable_reg = 0x150b4;
+
+		cam_cc_mclk0_clk.halt_reg = 0x15018;
+		cam_cc_mclk0_clk.clkr.enable_reg = 0x15018;
+		cam_cc_mclk1_clk.halt_reg = 0x15034;
+		cam_cc_mclk1_clk.clkr.enable_reg = 0x15034;
+		cam_cc_mclk2_clk.halt_reg = 0x15050;
+		cam_cc_mclk2_clk.clkr.enable_reg = 0x15050;
+
+		cam_cc_titan_top_gdsc.gdscr = 0x131a0;
+
+		cam_cc_sa8775p_clocks[CAM_CC_CCI_3_CLK] = NULL;
+		cam_cc_sa8775p_clocks[CAM_CC_CCI_3_CLK_SRC] = NULL;
+		cam_cc_sa8775p_clocks[CAM_CC_CSI3PHYTIMER_CLK] = NULL;
+		cam_cc_sa8775p_clocks[CAM_CC_CSI3PHYTIMER_CLK_SRC] = NULL;
+		cam_cc_sa8775p_clocks[CAM_CC_CSIPHY3_CLK] = NULL;
+		cam_cc_sa8775p_clocks[CAM_CC_MCLK3_CLK] = NULL;
+		cam_cc_sa8775p_clocks[CAM_CC_MCLK3_CLK_SRC] = NULL;
+		cam_cc_sa8775p_clocks[CAM_CC_TITAN_TOP_ACCU_SHIFT_CLK] =
+				&cam_cc_titan_top_accu_shift_clk.clkr;
+
+		/* Keep some clocks always enabled */
+		qcom_branch_set_clk_en(regmap, 0x13178); /* CAM_CC_CAMNOC_XO_CLK */
+		qcom_branch_set_clk_en(regmap, 0x131d0); /* CAM_CC_GDSC_CLK */
+		qcom_branch_set_clk_en(regmap, 0x131ec); /* CAM_CC_SLEEP_CLK */
+	} else {
+		/* Keep some clocks always enabled */
+		qcom_branch_set_clk_en(regmap, 0x13194); /* CAM_CC_CAMNOC_XO_CLK */
+		qcom_branch_set_clk_en(regmap, 0x131ec); /* CAM_CC_GDSC_CLK */
+		qcom_branch_set_clk_en(regmap, 0x13208); /* CAM_CC_SLEEP_CLK */
+	}
 
 	ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_sa8775p_desc, regmap);
 

-- 
2.25.1


