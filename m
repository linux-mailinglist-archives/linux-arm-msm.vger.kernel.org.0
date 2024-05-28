Return-Path: <linux-arm-msm+bounces-20726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C018D19F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 13:44:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 396121F23799
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 11:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A5916C87F;
	Tue, 28 May 2024 11:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ExPyb3w9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9BC16C69D;
	Tue, 28 May 2024 11:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716896645; cv=none; b=iAYO20wy+MWwE8kYpzeD7XKQRn4qN2qlNAEAiuUjIJ/kx9pLa3TeMZfFASpaGAroujW8CN+nCH4ZMzJ/MIkH3KFoipy+7DbtirKBgMgD/IhAHXvnI0YepiTKeAK25ohPhOWRsVU6vVxYSZAyMHffx+nr/QWH+eaU3SoagG6+yl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716896645; c=relaxed/simple;
	bh=M4W+oHkOeOhdlYM/2iz4WIkappOulaLKd7/7AQX4LQI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L6sqHqIATqk0wxM9wlBtNJwm8wxHw6sHFX0pu7qOx8X30SsZCiSDNrCJ7JJW998AK+9RuzcrwjbgdjdSPE6FDGGxJE2hFDoCgL0OGj8L/JSlhgkTez0liqnUD/6vdCmbk1WgPbleDoNpGl1BK1scXjU4TPYntD3tP8kGHzqZN/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ExPyb3w9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44SB8JBf001099;
	Tue, 28 May 2024 11:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vTGSCjZG91irllHjXXjKPaqTtQw3nVtYXZ6CCsqxeEQ=; b=ExPyb3w9kO7D2OrQ
	ZCG3pGZI/VhUpLY5jZ+ZdgCuCyRoUEIo3o6H0qRDE9Qk75mp+Q/cTo6o4f8rlMk0
	6mDNMYMNq2ZHana0OLXNuTsyFBvHOkXS5aqmHJnvZYWky1m1tSlrio88sgiqSj4x
	GUV9fChig1Q88W/9hDI+xeZ19QQK/Hk1B8BFJzD4yPHbcmhEyLAGdyHBZufYMLP5
	4ckibAV93V+Ull5SYKupcwmhRTkI0THpk4h/RhOZ+CmKZU9ughByD+B7a6jY3Ez9
	pR0gwfgKAgqOCstumTVhV6gdxWVxfJdQ2VPsFWM2GfUxgMcf/DBgpv/hvyDY8uGV
	ci3e3A==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yb9yj5xst-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 11:43:54 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44SBhrqt017753
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 11:43:53 GMT
Received: from hu-ajipan-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 28 May 2024 04:43:47 -0700
From: Ajit Pandey <quic_ajipan@quicinc.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>, <stable@vger.kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH V3 1/8] clk: qcom: clk-alpha-pll: Fix CAL_L_VAL override for LUCID EVO PLL
Date: Tue, 28 May 2024 17:12:47 +0530
Message-ID: <20240528114254.3147988-2-quic_ajipan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240528114254.3147988-1-quic_ajipan@quicinc.com>
References: <20240528114254.3147988-1-quic_ajipan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: e9rOfkIYaCVibs-vSjZcpNqKPptyukRX
X-Proofpoint-ORIG-GUID: e9rOfkIYaCVibs-vSjZcpNqKPptyukRX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_07,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 clxscore=1011 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405280087

In LUCID EVO PLL CAL_L_VAL and L_VAL bitfields are part of single
PLL_L_VAL register. Update for L_VAL bitfield values in PLL_L_VAL
register using regmap_write() API in __alpha_pll_trion_set_rate
callback will override LUCID EVO PLL initial configuration related
to PLL_CAL_L_VAL bit fields in PLL_L_VAL register.

Observed random PLL lock failures during PLL enable due to such
override in PLL calibration value. Use regmap_update_bits() with
L_VAL bitfield mask instead of regmap_write() API to update only
PLL_L_VAL bitfields in __alpha_pll_trion_set_rate callback.

Fixes: 260e36606a03 ("clk: qcom: clk-alpha-pll: add Lucid EVO PLL configuration interfaces")
Cc: stable@vger.kernel.org
Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index d4227909d1fe..62138ed3df88 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -1665,7 +1665,7 @@ static int __alpha_pll_trion_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (ret < 0)
 		return ret;
 
-	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
+	regmap_update_bits(pll->clkr.regmap, PLL_L_VAL(pll), LUCID_EVO_PLL_L_VAL_MASK,  l);
 	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
 
 	/* Latch the PLL input */
-- 
2.25.1


