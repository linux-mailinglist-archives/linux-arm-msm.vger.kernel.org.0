Return-Path: <linux-arm-msm+bounces-21238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F2B8D5EE8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 11:52:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3907282CAC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 09:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0AB213A25F;
	Fri, 31 May 2024 09:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kVcBqVu4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FF71CD35;
	Fri, 31 May 2024 09:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717149132; cv=none; b=akx1UR9vNmBOzywGqdGCk3YySAXhMIwuiE7zS5jSgMh61Echays5O9hwinlPo4gDwQkE3TJQRFiqHQt83RL9TAmSnv0fJQtEj5Jj71FV3ZOazUhNwCb7iiiycNGeIdsd1lOZj/wZSYYcbn0y8c/U6wpCCZcdsk4kVTm+dcvhJxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717149132; c=relaxed/simple;
	bh=6Gv7f3+SNjC+yNXhqTABahm34jzBn0mCyTDLLSHKNZQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mjfk26jRpyKcq3Yc/CvJX9byff2mV6p9XV7jQyAl9a3+q8Q+TCZYdBrDbKmLCz6+ifuAxJN8esvJc0TdMu/dIcr3uO38qGrvYpck0A2VOsnpO0+JHl+t5F1BBDebrWxOtMpsJJzVu0aEtbqc15JPvjMxPjQj2bHxOva9Abuj+ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kVcBqVu4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V711XT001099;
	Fri, 31 May 2024 09:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kyXDGJj6o6bzvppirB19pxmO
	CRyZJlkp8qSEQ/Gzbw4=; b=kVcBqVu49Zur+GkdhV8LuZCYXvuCDRVUBawS8LQc
	VdoD+s91sdEm1f8NN+26w06JcfO0NmqKz1rp7pBHelrF9x6FE8Q+Li4zYd/bBaL0
	XsNUkMJsVvon1IObXvLzwNJ24F0laFgu7MJrj4UDIBriZKGj6pViq0C01bNQgapO
	kQTeHP/uwFqwfDgDnGz1FE5ncG/dK2Co9SQyCgXerNa57Wg4Dl6MuRPUTxiRWhVL
	0GYVlq73PD23OmRr3oM/+xD/aUtSFpf4+vcB3yZIoANeEPEc2owdP7KQ5skvCuXL
	rrCIGiAJDczYfdkTRAntWHWAddtGjelaznj2hs7eXA/xxQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yb9yjen4f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:52:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44V9q6JI025002
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:52:06 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 31 May 2024 02:52:02 -0700
From: Taniya Das <quic_tdas@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <quic_jkona@quicinc.com>, <quic_imrashai@quicinc.com>,
        Taniya Das
	<quic_tdas@quicinc.com>
Subject: [PATCH v3 2/3] clk: qcom: gcc-sc7280: Update force mem core bit for UFS ICE clock
Date: Fri, 31 May 2024 15:21:41 +0530
Message-ID: <20240531095142.9688-3-quic_tdas@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240531095142.9688-1-quic_tdas@quicinc.com>
References: <20240531095142.9688-1-quic_tdas@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ltx8JukhXwhbDbzj-thoHzvCoCvArdCq
X-Proofpoint-ORIG-GUID: ltx8JukhXwhbDbzj-thoHzvCoCvArdCq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_06,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310073

Update the force mem core bit for UFS ICE clock to force the core on signal
to remain active during halt state of the clk. When retention bit of the
clock is set the memories of the subsystem will retain the logic across
power states.

Fixes: a3cc092196ef ("clk: qcom: Add Global Clock controller (GCC) driver for SC7280")
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 drivers/clk/qcom/gcc-sc7280.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
index c622cd9a9d24..b937d513b814 100644
--- a/drivers/clk/qcom/gcc-sc7280.c
+++ b/drivers/clk/qcom/gcc-sc7280.c
@@ -3473,6 +3473,9 @@ static int gcc_sc7280_probe(struct platform_device *pdev)
 	qcom_branch_set_clk_en(regmap, 0x71004);/* GCC_GPU_CFG_AHB_CLK */
 	regmap_update_bits(regmap, 0x7100C, BIT(13), BIT(13));
 
+	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
+	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
+
 	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
 			ARRAY_SIZE(gcc_dfs_clocks));
 	if (ret)
-- 
2.17.1


