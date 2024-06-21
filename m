Return-Path: <linux-arm-msm+bounces-23580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EEA9124B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 14:04:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E35D1F215AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 12:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4138717278D;
	Fri, 21 Jun 2024 12:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="l77PJ2i/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1D413777F;
	Fri, 21 Jun 2024 12:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718971488; cv=none; b=LtZwj7C/K/qjbVbqYgINg3TZ8kB3x1U5Bf0ZU7373qEB44ErV/stsfqfQ9+KaJiYb6vF0SoNjAsArtaHg2i+CKcyNaR6+m+FhdD+41MULaXXaE4TToTd/EXCKcd6p6NhqpNIUFYlPjTi3fRpXulTCbPu9yjcTTyI8E1S+vOPSAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718971488; c=relaxed/simple;
	bh=82xVG8itqX6/CQv8skskLFYKgV0Gy0s3TO2GamldpL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=qi28s/raV2xWSvwSvDJG5uq6KLQXK8u1hn51FfZz9ybfGPkkGFgxbxDn6H8EvpIaRKZu9HEXgi+vtOSHgyakg6GPQdCdnP8h/SQSm2xo+ST6aSR62lPzKowsHZzUQLTE1VgecQejTv7+sQ4rsciHXROvaH9JtKi2Ouex3aWASIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=l77PJ2i/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45L5SULj031113;
	Fri, 21 Jun 2024 12:04:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bZXK8KkGYAa1MTYRt0ZPLw
	zKRvDlI/gmzPM4+QpBHZU=; b=l77PJ2i/qu4SD8/EiMDZD6BYT8vyJm/AI9DXis
	azUe5Q38tf0MjtgHfQ5iZdSxdKWhouG+J1gbv8riLImsGNxVr0zLs4Z0Q5ti/mlz
	dfR0m3nto8y72gXcRQ7J1gv9LR3CJ0vUyXDqsXykNRN2Mrm8zxrn1ntnwprWNJXW
	2TVsMv1ZX/TP/5bMgbLZXwB2ZxCHUTV8s5o5enqiKhEgN9es/nZVpKSANOudCeTa
	2h+uomMQFtYCqRqO3kaMPxZrbqQoCIpVnnl9x0HA5NReuZ8p8qtSXdE9XEm9xCg+
	4aUaVFyGATZPKBYVNncK2ajAyhdQMCMAhV79qobqJpKBi6EA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yw3d494ym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 12:04:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45LC4eq7014027
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 12:04:40 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 21 Jun 2024 05:04:36 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Fri, 21 Jun 2024 17:34:23 +0530
Subject: [PATCH] clk: qcom: gpucc-sm8350: Park RCG's clk source at XO
 during disable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240621-sm8350-gpucc-fixes-v1-1-22db60c7c5d3@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAEZsdWYC/x3LTQqAIBBA4avErBswrYiuEi1MJ5tFPzgUgXj3p
 OXH4yUQikwCY5Ug0sPC51HQ1BW4zR6BkH0xaKVb1esGZR9MpzBct3O48kuCnTeLbb232igo4xX
 pD+Wb5pw/6Urq4WQAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Jonathan Marek
	<jonathan@marek.ca>,
        Robert Foss <rfoss@kernel.org>, Vinod Koul
	<vkoul@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>
CC: <quic_jkona@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>
X-Mailer: b4 0.14-dev-f7c49
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bGfFsmHvJKL_uOD2rTqj4QA98fksC9FZ
X-Proofpoint-ORIG-GUID: bGfFsmHvJKL_uOD2rTqj4QA98fksC9FZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_04,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1011
 mlxscore=0 adultscore=0 mlxlogscore=617 spamscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406210089

The RCG's clk src has to be parked at XO while disabling as per the
HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.

Fixes: 160758b05ab1 ("clk: qcom: add support for SM8350 GPUCC")
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 drivers/clk/qcom/gpucc-sm8350.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sm8350.c b/drivers/clk/qcom/gpucc-sm8350.c
index f6bb8244dd40..f3b6bdc24485 100644
--- a/drivers/clk/qcom/gpucc-sm8350.c
+++ b/drivers/clk/qcom/gpucc-sm8350.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
  * Copyright (c) 2022, Linaro Limited
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/clk.h>
@@ -147,7 +148,7 @@ static struct clk_rcg2 gpu_cc_gmu_clk_src = {
 		.parent_data = gpu_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -169,7 +170,7 @@ static struct clk_rcg2 gpu_cc_hub_clk_src = {
 		.parent_data = gpu_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 

---
base-commit: b992b79ca8bc336fa8e2c80990b5af80ed8f36fd
change-id: 20240621-sm8350-gpucc-fixes-5d3ba4dda230

Best regards,
-- 
Taniya Das <quic_tdas@quicinc.com>


