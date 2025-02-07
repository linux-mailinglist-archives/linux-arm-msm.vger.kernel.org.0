Return-Path: <linux-arm-msm+bounces-47087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4ABA2BC7A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 08:41:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B12C16896A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 07:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80515233D91;
	Fri,  7 Feb 2025 07:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RvniQqwQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55A0233155;
	Fri,  7 Feb 2025 07:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738914037; cv=none; b=PRxRXy5bof8d2CDEZdTK3u/APeNGEGFARVP713r/AkB2tsTLmZ+G0BeA6d84ztwHw4DThejK1RD3utOPK+08Acj2LDGG5NCDwfc7U+qJk0crjP+QXrK+WgMAcPlP6u77EfNGRHqwAhEUczu2x7I5zEu6/5Nnt9artcjisbH6+YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738914037; c=relaxed/simple;
	bh=2gLB7yr41QYvYnpDTZKID0YV8//FeTXzKY61Yw5VNqc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BuLQO9YET54wcj8/6dICd9vLoac0eNPdq86mq+iQAoy+vq1zWER2HMZ03M5b0rJ3XZPJ6tn33hXnkG4LLmakScKTtoSy6lkbZAAa7fwRLGAriGxZWPS2GgdaM9nhrmsqOaNpU66XAB3xYMM4vZbp4yM74MV4GWHSE2WR33SFqME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RvniQqwQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5174L5SQ008908;
	Fri, 7 Feb 2025 07:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nKij6Xoat2KKpoBz/grLXgM/t2TwMlDNG53GGPnSZ9E=; b=RvniQqwQGxE2Ddt7
	sl09c4Y9qTWhRNdmGU+0B+1LHUKi5YO/Tc7yKbKVGf2pochgj57atxd+nAgrTIf+
	Yb/PrIYZVH+QBQPcyphjyOkCpbiPKISvSh4XYshe96S1GeifAAxXezUZte/ILhry
	Kc6e5fLLf19d0STxCIpagAoDIDYlROQIvwZANjcs2v1+Yvcmj6GuHzVNuAO5lnG7
	Ff0PRoYVArp+S9tqBDUZDXK5Yux/ZrLZEvmbPVlF7iacYnSrZPrQnAj6+Cg5degw
	Xltg77jVJpjIXSE1hTHFJ/WKGSPTeoMzaSpecf645+SS+1jeVecW9Gex70MpafMY
	CnVmdQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nb2m8ejm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 07:40:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5177e1d3003280
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 07:40:01 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Feb 2025 23:39:53 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <konradybcio@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
        <p.zabel@pengutronix.de>, <richardcochran@gmail.com>,
        <geert+renesas@glider.be>, <dmitry.baryshkov@linaro.org>,
        <arnd@arndb.de>, <nfraprado@collabora.com>,
        <biju.das.jz@bp.renesas.com>, <quic_tdas@quicinc.com>,
        <ebiggers@google.com>, <ardb@kernel.org>, <ross.burton@arm.com>,
        <quic_anusha@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <netdev@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH v9 2/6] clk: qcom: gcc-ipq9574: Add support for gpll0_out_aux clock
Date: Fri, 7 Feb 2025 13:09:22 +0530
Message-ID: <20250207073926.2735129-3-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207073926.2735129-1-quic_mmanikan@quicinc.com>
References: <20250207073926.2735129-1-quic_mmanikan@quicinc.com>
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
X-Proofpoint-GUID: Na5-363KAtf8kemnRZgMZKWYzY2mKy2J
X-Proofpoint-ORIG-GUID: Na5-363KAtf8kemnRZgMZKWYzY2mKy2J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_03,2025-02-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 mlxscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1011 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502070058

From: Devi Priya <quic_devipriy@quicinc.com>

Add support for gpll0_out_aux clock which acts as the parent for
certain networking subsystem (nss) clocks.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
Changes in V9:
	- Rebased on linux-next tip.

 drivers/clk/qcom/gcc-ipq9574.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq9574.c b/drivers/clk/qcom/gcc-ipq9574.c
index 6bb66a7e1fb6..6dc86e686de4 100644
--- a/drivers/clk/qcom/gcc-ipq9574.c
+++ b/drivers/clk/qcom/gcc-ipq9574.c
@@ -108,6 +108,20 @@ static struct clk_alpha_pll_postdiv gpll0 = {
 	},
 };
 
+static struct clk_alpha_pll_postdiv gpll0_out_aux = {
+	.offset = 0x20000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpll0_out_aux",
+		.parent_hws = (const struct clk_hw *[]) {
+			&gpll0_main.clkr.hw
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_ro_ops,
+	},
+};
+
 static struct clk_alpha_pll gpll4_main = {
 	.offset = 0x22000,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT_EVO],
@@ -3896,6 +3910,7 @@ static struct clk_regmap *gcc_ipq9574_clks[] = {
 	[GCC_PCIE1_PIPE_CLK] = &gcc_pcie1_pipe_clk.clkr,
 	[GCC_PCIE2_PIPE_CLK] = &gcc_pcie2_pipe_clk.clkr,
 	[GCC_PCIE3_PIPE_CLK] = &gcc_pcie3_pipe_clk.clkr,
+	[GPLL0_OUT_AUX] = &gpll0_out_aux.clkr,
 };
 
 static const struct qcom_reset_map gcc_ipq9574_resets[] = {
-- 
2.34.1


