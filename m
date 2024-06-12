Return-Path: <linux-arm-msm+bounces-22424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF92905121
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 13:09:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2637A1C21355
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 11:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87CC416F8F9;
	Wed, 12 Jun 2024 11:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GTbOEvH3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA9C16F833;
	Wed, 12 Jun 2024 11:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718190542; cv=none; b=pXC7YHZJySqIFu2AUK1pF8yjkbl8tZHHDFxWwKrlDy/Fz+vXsmZpoPU3Cm8tg9C2IGvMgxp8pR+IVRVmgTGe3+S7LB3QNmUy0zvyqWg5a54wFiLE9MkygQpK7/9hRqZ1IfjKmo22HZYdlKdwjMrM1fL+qafYO33AkypG/8JgJ58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718190542; c=relaxed/simple;
	bh=xTyiOrtAYkbAZkU2p4OJDJdtuIQltTaR2y7DNAkotak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=HornIimWKh5neFoOj+QhZivUYvT3DxHaNytMHBDMDu9RtVcCvlgUNppRGVHuVnStKocZRox8n29dSHSBP0wYWbdD7hab4x1amPTHx2hNXbtgwIwC7E0BikkbxreAVt8toVlXoAZ0IEu8ssH+XObVcvLFZIXI5w2pgvciWO6vVkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GTbOEvH3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45C5JJGU000841;
	Wed, 12 Jun 2024 11:08:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qXMXwpncXOjVNupXBhndFReWB+6l0ip4JVC7wt9liEY=; b=GTbOEvH3RgnLqku2
	/DUXw+jD4PzpDVPsKi+Kn7miRk38Fkh1XkHI0ruryQFO5R8aDpa8emLGYrg7B6I3
	rArL/Fj5X1NITPFSKS7zIZQ4KG0BAfOul+wuETa0Xs03UqzbIr8M4WneMZRHc1+V
	SH42z7Q2+HD2JXhzsg81oiXRFssiEIkcN0e9kPW6VKeBPcqeCSwvQFlBBCOkIL42
	u4XppOGRzYBUSBAyF5uWdBZqVqJ0PLdOc7EMeubNMV7GjerpOhRBnqasKoVnf/20
	EevI/5YpQ9WOhKLUW18nVQQZQOYoVgqVzokaRVrhlcW4bf/08aueyaXuSgSM6AbQ
	TKBZOQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yphsaupjx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 11:08:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CB8uWw028808
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 11:08:56 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 12 Jun 2024 04:08:52 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Wed, 12 Jun 2024 16:38:24 +0530
Subject: [PATCH v2 4/6] clk: qcom: gpucc-sa8775p: Remove the
 CLK_IS_CRITICAL and ALWAYS_ON flags
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240612-sa8775p-v2-gcc-gpucc-fixes-v2-4-adcc756a23df@quicinc.com>
References: <20240612-sa8775p-v2-gcc-gpucc-fixes-v2-0-adcc756a23df@quicinc.com>
In-Reply-To: <20240612-sa8775p-v2-gcc-gpucc-fixes-v2-0-adcc756a23df@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        Shazad Hussain <quic_shazhuss@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_jkona@quicinc.com>,
        <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>
X-Mailer: b4 0.14-dev-f7c49
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: feG1E1QkwoFc5yHIgumct60YiZU206FO
X-Proofpoint-GUID: feG1E1QkwoFc5yHIgumct60YiZU206FO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_06,2024-06-12_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 adultscore=0 spamscore=0 mlxlogscore=943 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2406120081

The GPU clocks/GDSCs have been marked critical from the clock driver
but the GPU driver votes on these resources as per the HW requirement.
In the case where these clocks & GDSCs are left enabled, would have
power impact and also cause GPU stability/corruptions.
Fix the same by removing the CLK_IS_CRITICAL for clocks and ALWAYS_ON
flags for the GPU GDSCs.

Fixes: 0afa16afc36d ("clk: qcom: add the GPUCC driver for sa8775p")
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 drivers/clk/qcom/gpucc-sa8775p.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sa8775p.c b/drivers/clk/qcom/gpucc-sa8775p.c
index 1167c42da39d..f965babf4330 100644
--- a/drivers/clk/qcom/gpucc-sa8775p.c
+++ b/drivers/clk/qcom/gpucc-sa8775p.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2021-2022, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2022, 2024, Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2023, Linaro Limited
  */
 
@@ -280,7 +280,7 @@ static struct clk_branch gpu_cc_ahb_clk = {
 				&gpu_cc_hub_ahb_div_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -294,7 +294,6 @@ static struct clk_branch gpu_cc_cb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data){
 			.name = "gpu_cc_cb_clk",
-			.flags = CLK_IS_CRITICAL,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -312,7 +311,7 @@ static struct clk_branch gpu_cc_crc_ahb_clk = {
 				&gpu_cc_hub_ahb_div_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -330,7 +329,7 @@ static struct clk_branch gpu_cc_cx_ff_clk = {
 				&gpu_cc_ff_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -348,7 +347,7 @@ static struct clk_branch gpu_cc_cx_gmu_clk = {
 				&gpu_cc_gmu_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
-			.flags =  CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
+			.flags =  CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_aon_ops,
 		},
 	},
@@ -362,7 +361,6 @@ static struct clk_branch gpu_cc_cx_snoc_dvm_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data){
 			.name = "gpu_cc_cx_snoc_dvm_clk",
-			.flags = CLK_IS_CRITICAL,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -380,7 +378,7 @@ static struct clk_branch gpu_cc_cxo_aon_clk = {
 				&gpu_cc_xo_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -398,7 +396,7 @@ static struct clk_branch gpu_cc_cxo_clk = {
 				&gpu_cc_xo_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
-			.flags =  CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
+			.flags =  CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -416,7 +414,7 @@ static struct clk_branch gpu_cc_demet_clk = {
 				&gpu_cc_demet_div_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_aon_ops,
 		},
 	},
@@ -430,7 +428,6 @@ static struct clk_branch gpu_cc_hlos1_vote_gpu_smmu_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data){
 			.name = "gpu_cc_hlos1_vote_gpu_smmu_clk",
-			.flags = CLK_IS_CRITICAL,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -448,7 +445,7 @@ static struct clk_branch gpu_cc_hub_aon_clk = {
 				&gpu_cc_hub_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_aon_ops,
 		},
 	},
@@ -466,7 +463,7 @@ static struct clk_branch gpu_cc_hub_cx_int_clk = {
 				&gpu_cc_hub_cx_int_div_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
-			.flags =  CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
+			.flags =  CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_aon_ops,
 		},
 	},
@@ -480,7 +477,6 @@ static struct clk_branch gpu_cc_memnoc_gfx_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data){
 			.name = "gpu_cc_memnoc_gfx_clk",
-			.flags = CLK_IS_CRITICAL,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -494,7 +490,6 @@ static struct clk_branch gpu_cc_sleep_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data){
 			.name = "gpu_cc_sleep_clk",
-			.flags = CLK_IS_CRITICAL,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -533,7 +528,7 @@ static struct gdsc cx_gdsc = {
 		.name = "cx_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE | RETAIN_FF_ENABLE | ALWAYS_ON,
+	.flags = VOTABLE | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc gx_gdsc = {

-- 
2.45.2


