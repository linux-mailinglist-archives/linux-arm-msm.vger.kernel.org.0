Return-Path: <linux-arm-msm+bounces-27493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7006C9426D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 08:31:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A19E61C213D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 06:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C18D16B3AB;
	Wed, 31 Jul 2024 06:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jUQDh792"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0848A1667CD;
	Wed, 31 Jul 2024 06:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722407459; cv=none; b=SjYQ1d87q6ca1l1rmVAk/RNLRYVpVvxo8lqUzPHXn7AXm7tFROCDUGHxI7ntEU3Fej761XsFSkiGks18nq9gMnTokUhosbpynC+n3f+4NYVR/1LBbA19jvTHQdLOzTkBsxhS32ojzYNCapVfzjbmrhTjyquXgUIByYTzqO48wNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722407459; c=relaxed/simple;
	bh=ia7vSRaNioV5Oh16wH/XpLWPF9pDkl3Ir0CU0Pan9IY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GmytQO1WkVbyP8IC4RskR56tPkHqLQNGix03V3eJvPUFqPbtVGrj2IpKyU71/t0AfP6pgrfAsqIcVy1aNi6CwQVNkja3NYsvm1Uw9tIrASvbkojgLrljl1m8eDEX6PWUy08KpP5/79EgoGQraQezbphIIgMpPc1OsfFWV7x2/xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jUQDh792; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46UI2fRx016743;
	Wed, 31 Jul 2024 06:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9w1soTtCw/AtgiioiS0RjPKkz9ZK/UYzRAuQtY0n060=; b=jUQDh792p8YcwOGs
	AW9X1aikKc/Xdq4iHcF711Gj8ortOwgAbIrzdnfK4aFV9RaExQmulgWXKpYcvNQs
	RxG7lJD3KcpU44uSM2+MMmjT+pRjN6pzINvtGZWi0ccVpPnBTe+uSztixlDL7Co/
	9DUCWIF0Qv/+4iN5uyYcJeEQ1SRcucroZ4V/ZHTWNue93E5NK2EY1cWKLChA4ycx
	7TCHau9/aANTZEaGerllTDxjGBWFv2Fyb62juDD1wz5qs7g3b2n5fosB/51yS+BO
	CYUbdu5UXHRA4sFsBpmI7uE8M3rY+6brdplIYf3Eo8R9rTNpbJDChyZ05FvrqZQD
	fR/OYA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40msne9xyr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 06:30:25 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46V6UO7i001129
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 06:30:24 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 30 Jul 2024 23:30:18 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Stephen Boyd <sboyd@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        "Imran
 Shaik" <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, <stable@vger.kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>
Subject: [PATCH V3 3/8] clk: qcom: clk-alpha-pll: Fix zonda set_rate failure when PLL is disabled
Date: Wed, 31 Jul 2024 11:59:11 +0530
Message-ID: <20240731062916.2680823-4-quic_skakitap@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240731062916.2680823-1-quic_skakitap@quicinc.com>
References: <20240731062916.2680823-1-quic_skakitap@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: H5_yG8Ok-v6hcepuAUZVoGZInSJgVEUH
X-Proofpoint-ORIG-GUID: H5_yG8Ok-v6hcepuAUZVoGZInSJgVEUH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_03,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=897 priorityscore=1501 clxscore=1015
 spamscore=0 mlxscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407310047

Currently, clk_zonda_pll_set_rate polls for the PLL to lock even if the
PLL is disabled. However, if the PLL is disabled then LOCK_DET will
never assert and we'll return an error. There is no reason to poll
LOCK_DET if the PLL is already disabled, so skip polling in this case.

Fixes: f21b6bfecc27 ("clk: qcom: clk-alpha-pll: add support for zonda pll")
Cc: stable@vger.kernel.org
Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index eb5626095916..2ebeb277cb4d 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -2136,6 +2136,9 @@ static int clk_zonda_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
 	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
 
+	if (!clk_hw_is_enabled(hw))
+		return 0;
+
 	/* Wait before polling for the frequency latch */
 	udelay(5);
 
-- 
2.25.1


