Return-Path: <linux-arm-msm+bounces-22422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C467190511B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 13:09:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73F67284FDE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 11:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36DC616F284;
	Wed, 12 Jun 2024 11:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HH6uSd5n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A935416F271;
	Wed, 12 Jun 2024 11:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718190539; cv=none; b=djl0QnWIQX+FlYR2NXMVGeU/b6FRgvBNIz5rU7mWDJQ0LGHbvPt6A4GqT/aeE/g7o5YTfhcJGtbcKOdIiibi2Wjp5mO0g5AZSrfim123lLFSMqv6nnD8DPPoBZ0nrUXt+Tg7MWS1eXJ5XkUs6JQ10fAHAaMJPrWsic3BuZLjR5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718190539; c=relaxed/simple;
	bh=sliZwJxjQao5XquzDu0xpE7kSbzND0qsY/ZJHqGXafc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=qMGwMwRJzEjlqj6LyOonkglksK/l4Dmi6wm8Du4rUxQXPVbN52wiGMBVHiIBnPBzWjfyS6rsH4xVAsSqg6a0XqFEED+mcuKVwKwgTPCc12g5ilz9GRiVXSgYekK0zkb+QkXU8M5TWfhlqyqo8uIgtfL6nuNnQ1+uqimyquL5t+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HH6uSd5n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45C8MYGl012668;
	Wed, 12 Jun 2024 11:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SSJx/Sr7DnRaSBJY+nWtI0nIRgqhv+a5yqpR3ZvQEgY=; b=HH6uSd5nrLxfG6BE
	mS/Uatk0ErBeT+HAXAtxxUI9RQMcXawyDfAbS3aF+j+DaoqgzhfYjxx5M4RDlRem
	f93vQWdfCSudxYn5aUH0a5VHrY+7M0uD57r8mcVuDju3hIVCUdTI7QWO/Mye6HSY
	8DuY27vh80LI2K+sZrR5aSdwYoQUp1d0vqUNdAAWB7rwI0EhCrS8U1chFqpJfDLW
	KxF0lCTyI0T5V4g6V2HN9HeZeIL3nn+3uOTVQd9XIeUrZ7V5NXB9xw0/HYUJXc3N
	AOVkBE8Ov5TveduzDNn5hUMNftlg4a7ny/WHEb+aroX9owXQ3GYA9Q2u7OR1Nwvk
	qw0Ndw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yq83wgdwm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 11:08:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CB8qnN028772
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 11:08:52 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 12 Jun 2024 04:08:48 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Wed, 12 Jun 2024 16:38:23 +0530
Subject: [PATCH v2 3/6] clk: qcom: gcc-sa8775p: Set FORCE_MEM_CORE_ON for
 gcc_ufs_phy_ice_core_clk
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240612-sa8775p-v2-gcc-gpucc-fixes-v2-3-adcc756a23df@quicinc.com>
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
X-Proofpoint-GUID: Wdq0Aqd8LK9KCE1rla1hjsaL5LjKfsIw
X-Proofpoint-ORIG-GUID: Wdq0Aqd8LK9KCE1rla1hjsaL5LjKfsIw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_06,2024-06-12_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120081

Update the force mem core bit for UFS ICE clock to force the core on
signal to remain active during halt state of the clk. If force mem
core bit of the clock is not set, the memories of the subsystem will
not retain the logic across power states.

Fixes: 08c51ceb12f7 ("clk: qcom: add the GCC driver for sa8775p")
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 drivers/clk/qcom/gcc-sa8775p.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sa8775p.c b/drivers/clk/qcom/gcc-sa8775p.c
index 71fa95f59a0a..23b5207dc606 100644
--- a/drivers/clk/qcom/gcc-sa8775p.c
+++ b/drivers/clk/qcom/gcc-sa8775p.c
@@ -4686,6 +4686,9 @@ static int gcc_sa8775p_probe(struct platform_device *pdev)
 	qcom_branch_set_clk_en(regmap, 0x34004); /* GCC_VIDEO_AHB_CLK */
 	qcom_branch_set_clk_en(regmap, 0x34024); /* GCC_VIDEO_XO_CLK */
 
+	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
+	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
+
 	return qcom_cc_really_probe(pdev, &gcc_sa8775p_desc, regmap);
 }
 

-- 
2.45.2


