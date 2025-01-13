Return-Path: <linux-arm-msm+bounces-44896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80ADAA0BED0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 18:27:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D336A3A7E49
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 17:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 112331B6CE3;
	Mon, 13 Jan 2025 17:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hMrOgrIh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678BB1BC9FB;
	Mon, 13 Jan 2025 17:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736789246; cv=none; b=FB5/ou01CPpXd4f2NTdYNDgB1rCGCwyk7p9Hp0G58fg37Mzu4x6emKxpzMcxWrsBy2LFC6OnhUMzfLSzmu0TYFJ34XXKvL9ywak2YttIkM4RBrZ/bx8xeV9xHnSlRlWL3jRmyD5pz7t7yYT2PGu+LG/ZXgl8CBhrU6EjyuQqZwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736789246; c=relaxed/simple;
	bh=HIpx8tIyUeUiktE5qpUBLMxZIODyL/HI1NPvGvAW0Ik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=BhhP5MTN+dgNWAbiXZIy5xY5BKscRz7bO/X1TMYpMBhUOTW6fR4rG/qzNpKUnCuNcIXzyeYZnH2PcbTJC35akuLGQI4ibVbTWezYeVsKNAD+Nb+HYQB9yiL+TeQzVZWoPLLsX3T4xZz0MUCvu9l04BNlQPGQxj2qDN3zrsGqWoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hMrOgrIh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DEradH021672;
	Mon, 13 Jan 2025 17:27:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	svd1SlMhwGHsfhLVxeSaO3xOx4q+NIwu2y2C4YcIr4k=; b=hMrOgrIhrP2+qfk8
	vA+rGV1JKLc8s35T8vOLid2NczjLKL0ieBZ/SQLdrrg0iFLcnjArzHE52tPfYiy7
	au2WUHBQ1H6cMLWTwSfDbitvRuesO7LzRMqyUo57zFYB9CdJCowlCMrhrpEmUoMi
	i3LlA8oiYnm2mvMU27n9LWvpoXE7/izgwkKgO6AUL5KtvgUjoDL3ontCfZ/tf4F4
	Qo0swFlsB29Q5PS4gZxyyWsgI56y3u09eCuSR69DcBRrK15E70uDdKYEpCp8TDs/
	ldJfJsRoGfgpl3G2IKUUbsulyv+e/CHinatQiR6/YFbkaVx+0OmX0/E3kLJ3ZC2s
	Rmh0jg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44550agcbq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 17:27:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50DHRJjl018947
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 17:27:19 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 09:27:15 -0800
From: Taniya Das <quic_tdas@quicinc.com>
Date: Mon, 13 Jan 2025 22:57:05 +0530
Subject: [PATCH 2/3] clk: qcom: clk-alpha-pll: Add support to reconfigure
 PLL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250113-support-pll-reconfigure-v1-2-1fae6bc1062d@quicinc.com>
References: <20250113-support-pll-reconfigure-v1-0-1fae6bc1062d@quicinc.com>
In-Reply-To: <20250113-support-pll-reconfigure-v1-0-1fae6bc1062d@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Taniya Das <quic_tdas@quicinc.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: AK7x0Ji31-pGgO4-TpMEk6st-AGn9Lxm
X-Proofpoint-GUID: AK7x0Ji31-pGgO4-TpMEk6st-AGn9Lxm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501130140

During boot-up, there is a possibility that the PLL configuration might
be missed even after invoking pll_configure() from the clock controller
probe. This is often due to the PLL being connected to rail or rails
that are in an OFF state and current clock controller also cannot vote
on multiple rails. As a result, the PLL may be enabled with suboptimal
settings, leading to functional issues.

The PLL configuration, now part of clk_alpha_pll, can be reused to
reconfigure the PLL to a known good state before scaling for frequency.
The 'clk_alpha_pll_reconfigure()' can be updated to support more PLLs
in future.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 9a65d14acf71c97912664be4f6f78891cab4afa3..eb27c0992c7f9281dac4f2fc792084292c21a6c1 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -1750,6 +1750,26 @@ static int alpha_pll_lucid_prepare(struct clk_hw *hw)
 	return __alpha_pll_trion_prepare(hw, LUCID_PCAL_DONE);
 }
 
+#define GET_PLL_TYPE(pll)    ((pll->regs - clk_alpha_pll_regs[0]) / PLL_OFF_MAX_REGS)
+static void clk_alpha_pll_reconfigure(struct clk_alpha_pll *pll)
+{
+	if (!pll->config || !pll->regs)
+		return;
+
+	pr_debug("configuring the PLL again!\n");
+
+	switch (GET_PLL_TYPE(pll)) {
+	case CLK_ALPHA_PLL_TYPE_LUCID_OLE:
+		clk_lucid_ole_pll_configure(pll, pll->clkr.regmap, pll->config);
+		break;
+	case CLK_ALPHA_PLL_TYPE_LUCID_EVO:
+		clk_lucid_evo_pll_configure(pll, pll->clkr.regmap, pll->config);
+		break;
+	default:
+		break;
+	}
+}
+
 static int __alpha_pll_trion_set_rate(struct clk_hw *hw, unsigned long rate,
 				      unsigned long prate, u32 latch_bit, u32 latch_ack)
 {
@@ -1765,6 +1785,11 @@ static int __alpha_pll_trion_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (ret < 0)
 		return ret;
 
+	regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &val);
+	/* Check if the PLL is in good state to accept set rate requests. */
+	if (!(val & LUCID_EVO_PLL_L_VAL_MASK))
+		clk_alpha_pll_reconfigure(pll);
+
 	regmap_update_bits(pll->clkr.regmap, PLL_L_VAL(pll), LUCID_EVO_PLL_L_VAL_MASK,  l);
 	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
 
@@ -2372,6 +2397,11 @@ static int alpha_pll_lucid_evo_enable(struct clk_hw *hw)
 	if (trion_pll_is_enabled(pll, regmap))
 		return 0;
 
+	regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &val);
+	/* Check if the PLL is in good state to accept enable requests */
+	if (!(val & LUCID_EVO_PLL_L_VAL_MASK))
+		clk_alpha_pll_reconfigure(pll);
+
 	ret = regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
 	if (ret)
 		return ret;

-- 
2.45.2


