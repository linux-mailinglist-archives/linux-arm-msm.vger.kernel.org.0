Return-Path: <linux-arm-msm+bounces-21211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 671EB8D5D7B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 11:04:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 971EF1C233C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 09:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38FCC152526;
	Fri, 31 May 2024 09:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gzp2poZt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B464F13F44F;
	Fri, 31 May 2024 09:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717146231; cv=none; b=AvF4js9BWEIYgjZghuniyqWLBeBBSehcLiHFNj46iIcDUAHswBO7ebjMLb9AaAhTxx4F5F2TmqCMxsScxVUYvTKwnLMnBK9WR8XdceabeuzhlzF3ELKvOYlys0paODxQlY+lgJcEvi9o4sokVRqjAANgvgFlF5tTsW7WjW2zzaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717146231; c=relaxed/simple;
	bh=wxNW6z7NMS9DFxCEWZw3H3GRYJgRhv6OOg3sXgovGuY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s61BOA6cBNtIPLZjoagG8bqAEZU5wfUvgiUN06kNeip+gsYfl8VwFFQoco73xzl1H3p+xzj/G2yyRL5exGbkA3i6SjHonaJEEACtPJTDLq7ABWuUfBbYrksqtK3rrhtVD2j743GJ5BnaAzXhiLRWyoSJ4BLcheWGrpj8CPThbtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gzp2poZt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44UMGHij015857;
	Fri, 31 May 2024 09:03:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fR3hsnwbDYHR1FZHZGPD8zxE
	n3Pbd47k/kUVOuFNY9M=; b=gzp2poZtCiR2nkv2wLdKoQB/9Am3DZytNloPJKeg
	qslX+TON4QYYvCtwM155n/kLcocnOXTH3j7+3w0noy0ANjJQh0JwkgwanIG5Eees
	5xzDWIfDqF7eTeOO9JdMH4D+i8s2DEz8HTuDua4HgeTxIt77jnQhnvlkXXQx/Uwp
	yqkl85YKyN1pl98+Wa1QYSQIiIjdMl+WcugLr5MkwXz3B5Yads6mcju1NRx/O0df
	gWqAPRtgosM6eUgPm3ZmVeWu92ElbwhxiV98LPzxj3rt6tLHw3Hm9tWEUFi38Mxk
	RWjT1zuSO7fjnh6LwrW1m2xiXg41dyPoZQbsw1GXX80+rg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yf23ss674-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:03:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44V93jAE006706
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:03:45 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 31 May 2024 02:03:41 -0700
From: Taniya Das <quic_tdas@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_jkona@quicinc.com>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH 04/13] clk: qcom: gpucc-sa8775p: Remove the CLK_IS_CRITICAL and ALWAYS_ON flags
Date: Fri, 31 May 2024 14:32:40 +0530
Message-ID: <20240531090249.10293-5-quic_tdas@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240531090249.10293-1-quic_tdas@quicinc.com>
References: <20240531090249.10293-1-quic_tdas@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TS2Iehi0k31-km5LMMtLJizrVscDWAlv
X-Proofpoint-GUID: TS2Iehi0k31-km5LMMtLJizrVscDWAlv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_05,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 mlxlogscore=957 bulkscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310066

The gpu clocks and GDSC have been marked critical from the clock driver
which is not desired for functionality. Hence remove the CLK_IS_CRITICAL
and ALWAYS_ON flags.

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
2.17.1


