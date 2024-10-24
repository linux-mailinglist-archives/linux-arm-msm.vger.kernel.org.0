Return-Path: <linux-arm-msm+bounces-35689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C3B9AE6B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 15:36:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B8641F26BCC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 13:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B8C1F583F;
	Thu, 24 Oct 2024 13:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eHenJET5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC321EF928;
	Thu, 24 Oct 2024 13:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729776715; cv=none; b=BPPd4FSRa76m4d0TR9QYubKN02RVxgtFkYP4C39zd0KfUFkc4S0d2ih6GxzxUlWerRofo1ifpZQxrZ56z8OYm2e+P3dXwlHE4M9WxflNpQnNZd3BchgjM3DAoCjJN5HrHctCK6uHrO2r8Jac+cf2vCHQCkjEjrGU9EAkXSwhaUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729776715; c=relaxed/simple;
	bh=lxL4+ShEeB0aAqtdAu7aM+/JImXr3PIFw2XFqyYr3s4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=k/RY6u7P6OnqPShJENVaUGtQsLO5Nt10o/WTjlPYBrWXo9c6UepRZbVQ35DFnTGouX306gvMQRN9tGSyK7Nt20bGvLrKwGopbh5pUVNkc4jDIV1E1zes1500vDL9IqROvugf4LkXZAoWShv/SJZLyU7s6CK6wG8H3du+i/x08x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eHenJET5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OA3U8U027440;
	Thu, 24 Oct 2024 13:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	arXgYvBxFyTJWJevkLx19Bhn50Kerp9xnES/ZxAxfqY=; b=eHenJET5ak3UmlWd
	dq+hPbwiWUpbE51qaq2PUwAI/j+fnmlW29ISaSapQXM7xuGs+P90qEEs3TFS1k9r
	+HEVv1mMa00/KyoJlW4iKgColVNI1OdfNShH/IfTSepDs92th74aTCNWQeH2s/Jz
	VXY+yh/uKcBr7QzMmq8jQfi40ghm6wmYpfmVZd2Os0ZzXXw9HbSK4gSt47ODU8cR
	UMhjvIdybzr+sicdBajjK6nXkh8Qvvu1ggIZHzZo287OXqkPp1WAP03vT7L6LkRu
	2njgMGcxKTSWP9g+EA1ds0QCTOAI12y0AgVgjqlvmk1RVAsFzt0EdsAA0H1ejnIs
	nPWCEw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em41wr1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 13:31:48 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49ODVlq2023974
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 13:31:47 GMT
Received: from hu-imrashai-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Oct 2024 06:31:42 -0700
From: Imran Shaik <quic_imrashai@quicinc.com>
Date: Thu, 24 Oct 2024 19:01:15 +0530
Subject: [PATCH v2 2/6] clk: qcom: Add support for GPU Clock Controller on
 QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241024-qcs8300-mm-patches-v2-2-76c905060d0a@quicinc.com>
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
X-Proofpoint-GUID: 1Z0tubpg6QuJstPsm_m-C2Hy-v0nnzpy
X-Proofpoint-ORIG-GUID: 1Z0tubpg6QuJstPsm_m-C2Hy-v0nnzpy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410240110

Add support to the QCS8300 GPU clock controller by extending
the SA8775P GPU clock controller, which is mostly identical
but QCS8300 has few additional clocks and minor differences.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
---
 drivers/clk/qcom/gpucc-sa8775p.c | 47 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/clk/qcom/gpucc-sa8775p.c b/drivers/clk/qcom/gpucc-sa8775p.c
index f8a8ac343d70..99a8344b00db 100644
--- a/drivers/clk/qcom/gpucc-sa8775p.c
+++ b/drivers/clk/qcom/gpucc-sa8775p.c
@@ -317,6 +317,24 @@ static struct clk_branch gpu_cc_crc_ahb_clk = {
 	},
 };
 
+static struct clk_branch gpu_cc_cx_accu_shift_clk = {
+	.halt_reg = 0x95e8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x95e8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "gpu_cc_cx_accu_shift_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gpu_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gpu_cc_cx_ff_clk = {
 	.halt_reg = 0x914c,
 	.halt_check = BRANCH_HALT,
@@ -420,6 +438,24 @@ static struct clk_branch gpu_cc_demet_clk = {
 	},
 };
 
+static struct clk_branch gpu_cc_gx_accu_shift_clk = {
+	.halt_reg = 0x95e4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x95e4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "gpu_cc_gx_accu_shift_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gpu_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gpu_cc_hlos1_vote_gpu_smmu_clk = {
 	.halt_reg = 0x7000,
 	.halt_check = BRANCH_HALT_VOTED,
@@ -499,6 +535,7 @@ static struct clk_regmap *gpu_cc_sa8775p_clocks[] = {
 	[GPU_CC_AHB_CLK] = &gpu_cc_ahb_clk.clkr,
 	[GPU_CC_CB_CLK] = &gpu_cc_cb_clk.clkr,
 	[GPU_CC_CRC_AHB_CLK] = &gpu_cc_crc_ahb_clk.clkr,
+	[GPU_CC_CX_ACCU_SHIFT_CLK] = NULL,
 	[GPU_CC_CX_FF_CLK] = &gpu_cc_cx_ff_clk.clkr,
 	[GPU_CC_CX_GMU_CLK] = &gpu_cc_cx_gmu_clk.clkr,
 	[GPU_CC_CX_SNOC_DVM_CLK] = &gpu_cc_cx_snoc_dvm_clk.clkr,
@@ -508,6 +545,7 @@ static struct clk_regmap *gpu_cc_sa8775p_clocks[] = {
 	[GPU_CC_DEMET_DIV_CLK_SRC] = &gpu_cc_demet_div_clk_src.clkr,
 	[GPU_CC_FF_CLK_SRC] = &gpu_cc_ff_clk_src.clkr,
 	[GPU_CC_GMU_CLK_SRC] = &gpu_cc_gmu_clk_src.clkr,
+	[GPU_CC_GX_ACCU_SHIFT_CLK] = NULL,
 	[GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK] = &gpu_cc_hlos1_vote_gpu_smmu_clk.clkr,
 	[GPU_CC_HUB_AHB_DIV_CLK_SRC] = &gpu_cc_hub_ahb_div_clk_src.clkr,
 	[GPU_CC_HUB_AON_CLK] = &gpu_cc_hub_aon_clk.clkr,
@@ -583,6 +621,7 @@ static const struct qcom_cc_desc gpu_cc_sa8775p_desc = {
 };
 
 static const struct of_device_id gpu_cc_sa8775p_match_table[] = {
+	{ .compatible = "qcom,qcs8300-gpucc" },
 	{ .compatible = "qcom,sa8775p-gpucc" },
 	{ }
 };
@@ -596,6 +635,14 @@ static int gpu_cc_sa8775p_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,qcs8300-gpucc")) {
+		gpu_cc_pll0_config.l = 0x31;
+		gpu_cc_pll0_config.alpha = 0xe555;
+
+		gpu_cc_sa8775p_clocks[GPU_CC_CX_ACCU_SHIFT_CLK] = &gpu_cc_cx_accu_shift_clk.clkr;
+		gpu_cc_sa8775p_clocks[GPU_CC_GX_ACCU_SHIFT_CLK] = &gpu_cc_gx_accu_shift_clk.clkr;
+	}
+
 	clk_lucid_evo_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
 	clk_lucid_evo_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
 

-- 
2.25.1


