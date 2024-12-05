Return-Path: <linux-arm-msm+bounces-40436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFF99E4DB0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 07:41:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 240EC162A93
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 06:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A9DE1A8F69;
	Thu,  5 Dec 2024 06:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jz0vKuk7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAAD192B76;
	Thu,  5 Dec 2024 06:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733380887; cv=none; b=Ay63sIl9eSBZoNncXuSIkerXuPcX660q10aEEIoUfoppgj65i27t1kuc3teLCpc/f1Gdw2C1hIn2TxxyppAcZljcgKh97IFT3j9IAYNSAIpeYcvcRaCiHieX2yHtGKn+f3O0nNEptBfqklGBKGNUsEljLUvjEPHi+BBheTp/XLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733380887; c=relaxed/simple;
	bh=7y61Szbo0YZxuNPGNDdpdVPsSX+fxhyqqHTf4XyuW6o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pBCKyuWCWCxjkw5fi8i3l7cvAWDXecvp4WvLILQpjPDG2LZdaJ0pOb8TRPYgeq+rZCKSAS7R3OoKPIqF0sNbMhrgmL8PeNtYUCieCGAnfKjDgTWB4y0q89AxwjcM9E0Fqr2GmuiwUAW5rWJhVV1oPlIx93t3eDfSarEEhiH16vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jz0vKuk7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B56fLYo010466;
	Thu, 5 Dec 2024 06:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IwikryN/Ak1h1HjtAKPExiwApiVcG0AzLSv3BuQt7Tw=; b=jz0vKuk7Pp3pkHvO
	cn2giSeqn6KOjKb1McJl4PmRcaAeErLgTiUnbW6Fcl9XokortIjI9YfleiDbCD6g
	saN2Chc3SyolkhtpzEJ8yQ3NrjSGU73k+N6Ck2bhS8zFhegbSMWZ5v5j80It7dkr
	k7YdoWQnE6jy+2IfdOYktkPhvlP47Q642KdQD4Czg+kqZJ/MYANMI+3w/CtImvUs
	azBeXWWcNmOijcvixBXglaECs2wOySvTgefS4TuhQTuVB/aI2BAEiNiZPFPprzrg
	+OHcX0ty9frc5L0dYKdqEOinYU+msewefmnPk6MXx8nlvrjrt2D+5V5sj+q6wU2S
	peQbRg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439v7yxqsx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 06:41:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B56fBu1022434
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 06:41:11 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Dec 2024 22:41:07 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH 2/2] clk: qcom: ipq5424: remove apss_dbg clock
Date: Thu, 5 Dec 2024 12:10:37 +0530
Message-ID: <20241205064037.1960323-3-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241205064037.1960323-1-quic_mmanikan@quicinc.com>
References: <20241205064037.1960323-1-quic_mmanikan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: FAEEP8NQ_ew9VowwCYlRyb_5ozL2Ynlw
X-Proofpoint-GUID: FAEEP8NQ_ew9VowwCYlRyb_5ozL2Ynlw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 mlxlogscore=934 malwarescore=0
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050050

Since gcc_apss_dbg_clk has no consumers, the linux kernel will turn it
off. This causes a kernel crash because this clock is access protected
by trust zone. Therefore remove gcc_apss_dbg_clk from the gcc driver.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
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


