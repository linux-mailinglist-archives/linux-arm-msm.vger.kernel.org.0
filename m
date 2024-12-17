Return-Path: <linux-arm-msm+bounces-42523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F939F4A10
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 12:39:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C600416BC66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 11:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAD9E1F03E7;
	Tue, 17 Dec 2024 11:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LS3FL8+g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D481F03E1;
	Tue, 17 Dec 2024 11:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734435577; cv=none; b=Zy5T/qZ7oHT+UL1LBG+ZSvLU2FX22qh21offVRQQRzzMxZN+EMH+VKBiV+IbIVCyxg25Nht10ilE6wxhc8g/eqSyPB/fWYfbWYAvJC4fKClakrJt+j1rfRG8gID3rhJ2jMlP7L1mE6hpM3C5Izfhal0dcJIhT8xFowJjHkM9UhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734435577; c=relaxed/simple;
	bh=J3hTH7BSE1ifAf3HHRp11r5cgHQHy9NmKpbwJynVpaM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Uvzionl+5cfyJSVulxJPwzhTgnqxr+bpZI3ylszkIVmutKOF7xOirnLj6GLPgYsuBRu0Z6y4SMk7kbb/MzwgDYLR7josjCHxxHihitwiWrOvmkZ8bWGlkYViRIwSGSKLLwiTa/Fqqau7nsCBVaoYajFo/qH5lamd55n6nDgfRvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LS3FL8+g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH95tnE026330;
	Tue, 17 Dec 2024 11:39:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2HyFXARHwDuRmvcrEElwvgi3J3nj9Nvn1fFlUWLou+Q=; b=LS3FL8+gmej9dxu5
	8QcRb4M3rChD41XjzkE+jrr69d8ph9DTFVn7Uj9x9cs3LjoIEsZdXol2pysY+F5f
	bUBlLwhwRzORzp6R4Drk5xXz8GUMV+K8ebeaRDlimu7tpJNoyu7LRT8daJewNkv9
	eyikXzrmQvs83zEf5EK0t4re+OTgp40MdmVHU6G1dBjAoGsGIHvg1mK1EUBvPzHM
	ZPO0SUI2b9HdVa668XBRnY2Z6tkn6hL0bXzvU0SMJZln+Tze2qHnSoM64NS5OqM/
	7CdwHzDgU8CJC5uAAmZTMMEd5EohU33omoZ822GZWLBYNfMRd6yBhPfMRU5WpKgj
	X9Gmgg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k6c8ge0m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 11:39:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BHBdUpd003193
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 11:39:30 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 03:39:26 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH v2 1/2] clk: qcom: ipq5424: remove apss_dbg clock
Date: Tue, 17 Dec 2024 17:09:08 +0530
Message-ID: <20241217113909.3522305-2-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217113909.3522305-1-quic_mmanikan@quicinc.com>
References: <20241217113909.3522305-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0EpE-YcMNLkisAtf7IDWNhE466Pl8DKQ
X-Proofpoint-ORIG-GUID: 0EpE-YcMNLkisAtf7IDWNhE466Pl8DKQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412170096

The gcc_apss_dbg clk is access protected by trust zone, and accessing
it results in a kernel crash. Therefore remove the gcc_apss_dbg_clk
from the gcc driver.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
Changes in V2:
	- Updated commit message.
	- Patch #2 from V1 has been moved to Patch #1 in V2 to enusre
	  it is bisecatble.

 drivers/clk/qcom/gcc-ipq5424.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq5424.c b/drivers/clk/qcom/gcc-ipq5424.c
index 88a7d5b2e751..5f42ac6c8cdc 100644
--- a/drivers/clk/qcom/gcc-ipq5424.c
+++ b/drivers/clk/qcom/gcc-ipq5424.c
@@ -1097,24 +1097,6 @@ static struct clk_branch gcc_adss_pwm_clk = {
 	},
 };
 
-static struct clk_branch gcc_apss_dbg_clk = {
-	.halt_reg = 0x2402c,
-	.halt_check = BRANCH_HALT_VOTED,
-	.clkr = {
-		.enable_reg = 0x2402c,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_apss_dbg_clk",
-			.parent_hws = (const struct clk_hw*[]) {
-				&gcc_qdss_dap_sync_clk_src.hw
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_cnoc_pcie0_1lane_s_clk = {
 	.halt_reg = 0x31088,
 	.halt_check = BRANCH_HALT,
@@ -2785,7 +2767,6 @@ static struct clk_branch gcc_pcie3_rchng_clk = {
 static struct clk_regmap *gcc_ipq5424_clocks[] = {
 	[GCC_ADSS_PWM_CLK] = &gcc_adss_pwm_clk.clkr,
 	[GCC_ADSS_PWM_CLK_SRC] = &gcc_adss_pwm_clk_src.clkr,
-	[GCC_APSS_DBG_CLK] = &gcc_apss_dbg_clk.clkr,
 	[GCC_CNOC_PCIE0_1LANE_S_CLK] = &gcc_cnoc_pcie0_1lane_s_clk.clkr,
 	[GCC_CNOC_PCIE1_1LANE_S_CLK] = &gcc_cnoc_pcie1_1lane_s_clk.clkr,
 	[GCC_CNOC_PCIE2_2LANE_S_CLK] = &gcc_cnoc_pcie2_2lane_s_clk.clkr,
-- 
2.34.1


