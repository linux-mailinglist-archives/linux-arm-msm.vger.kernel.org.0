Return-Path: <linux-arm-msm+bounces-37124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 753DB9BE320
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 10:53:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01E711F232B6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 09:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42A791DD0F5;
	Wed,  6 Nov 2024 09:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VBg8hHBc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859CB1DD0E2;
	Wed,  6 Nov 2024 09:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730886754; cv=none; b=iK4lteFB6JVw+LRA3pnxKI+VBNZfraTQ1qMSdcxRRzybrjaNI1yxiETwPU0Wl8MMeLlQUUuwws3MbNRAC6mH4i8ONYMZ/UCOSyMULdADzfwyIV3SZ9vuLsVcAzpGAZolHQmaV5SZ6uzKS1N0apZKVwyd2CrCCXPTp06+pmTyI7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730886754; c=relaxed/simple;
	bh=iUX7MtMVc0x5OheIMcT8afGpNcv9r20voN1oicwtBhI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Z+kakqDKMOQwp78Ky99qhSG+X2xNmYdcMRmm6Usfb5sKu1mbY9WvzAchEZ6LMwPT3G6P/p+h1mbhumVm2Ijb1pQQUywVKWDzCDVTY56oP9DTKNhc0ymLh+9Ezy1o+t2gBGF3Utdtfma4uru+lGZxa8CPOCCx+HJdlEA2AqNbEN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VBg8hHBc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A67inFw005694;
	Wed, 6 Nov 2024 09:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A+frmmnTztCKisyCKDcXTVpBzKrdmNMXnJ/oEAvgt5k=; b=VBg8hHBcgFaaVFIf
	hiYvBa+j7mHv67/tgoiPUyxbNpUrtBk4xqr7KKW5/NOgsUQqBZiL494FDj1zyZkz
	C40N13Nf5wQLwM16AdtxrXO25aimCT3Lk4Hn6wX4itTnHXyW2dvk74RxNGOwjzrn
	E810TjsVXQsiZnV8qUO8DiPuRTEZNINpVbR0Q5V3aygxkE9qy+MopkeRNM3wYp9z
	61/qEPQ4//4gRQJ0Mww0PxEQy7hE7KreIc5WDd4mi51GpWym9Sos6D8DSMhzhnxC
	QIujP+4cIRC8rpxsyvyxbvokF2qTDCjF4FCR7ewMdHZRJXp+moZrf8dTJTLZ3AR1
	6gL2ag==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42qfdx3rb5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 09:52:28 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A69qSOG001561
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Nov 2024 09:52:28 GMT
Received: from hu-imrashai-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 6 Nov 2024 01:52:23 -0800
From: Imran Shaik <quic_imrashai@quicinc.com>
Date: Wed, 6 Nov 2024 15:21:57 +0530
Subject: [PATCH v3 2/6] clk: qcom: Add support for GPU Clock Controller on
 QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241106-qcs8300-mm-patches-v3-2-f611a8f87f15@quicinc.com>
References: <20241106-qcs8300-mm-patches-v3-0-f611a8f87f15@quicinc.com>
In-Reply-To: <20241106-qcs8300-mm-patches-v3-0-f611a8f87f15@quicinc.com>
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
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fxp6vxlsOonFPlji-A7zgjmI8sVqVnup
X-Proofpoint-ORIG-GUID: fxp6vxlsOonFPlji-A7zgjmI8sVqVnup
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411060080

Add support to the QCS8300 GPU clock controller by extending
the SA8775P GPU clock controller, which is mostly identical
but QCS8300 has few additional clocks and minor differences.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
---
 drivers/clk/qcom/gpucc-sa8775p.c | 49 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gpucc-sa8775p.c b/drivers/clk/qcom/gpucc-sa8775p.c
index f8a8ac343d70..78cad622cb5a 100644
--- a/drivers/clk/qcom/gpucc-sa8775p.c
+++ b/drivers/clk/qcom/gpucc-sa8775p.c
@@ -12,7 +12,7 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
-#include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
+#include <dt-bindings/clock/qcom,qcs8300-gpucc.h>
 
 #include "clk-alpha-pll.h"
 #include "clk-branch.h"
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


