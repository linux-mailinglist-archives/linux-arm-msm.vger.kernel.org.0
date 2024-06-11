Return-Path: <linux-arm-msm+bounces-22311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B2822903D9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 15:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66C161F24C7C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 13:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E90B17CA19;
	Tue, 11 Jun 2024 13:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cHz6+z82"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A3817CA13;
	Tue, 11 Jun 2024 13:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718113141; cv=none; b=qCy1NDcy+BN190yqkCvPJgFF3RBH5z3gFpQoCNAaZpM7By+6gsiMdd/ZQMd+ZSUVIKLj79rUV5v/hc1Dm7LDBl/z6hZiWmSSTRHFiXIF5CYuhRMzOw3jLav7OHkOZW/VHolriCPTsEMngVXnBaISe67HP6bOhb2pkf8Wb8ThayA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718113141; c=relaxed/simple;
	bh=8sPQFZTSB2yrnIdnQc+GIDziU78/L8MOuVKAI1KIt30=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XPcLGps0OWrdkFv5sqdw2NB9gSkX/n49gFClg7l/ic7lEiQgFqwdNucuJX6dKFjMhYZIZ/rntuAQR8V6jFR0pm1rQmsVohq5Wh8DgPXTOtxFk80xmaU0cAmIkmaly+MNP0mdgSfRgjUXrMPg0QH7rlTWgPOgcQEElLYeY5zvu28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cHz6+z82; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45B4bQWg030738;
	Tue, 11 Jun 2024 13:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uwg2nPAtovzEJcPR/iAln7nf9rw6MMGimGMwAc/Vbo4=; b=cHz6+z828PfheWWm
	XER8yvU49sWW/m7YiKaczDGCnbyzEP93BKDTXZZqOgBaCv3TuNuBFTV6FXgFfTFT
	fJuNcLVf6JwBgSZUV8t1kvQM4jgAlMRtmpiWljvIdxm4iopSZ5eiZHj8S8RMWop1
	MVzQ5KNIZOKzxGft4ozl/QnN+jrS0BvYQIReIzW7B6Plh54SmXwZZdlOLyT73f0+
	wggmTbQoa5rfsGp3yUBf9tnpbbHbvQTQI6XPRpmBAclx4DcvG/deEdVpEHCYJY74
	EqDWBVVvbek3Tdj2zuXVSZi8NRXE2EVkoclu0Xch/wqcwUhATBYToLsL+TCNxLWW
	n361Og==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yme8ry255-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 13:38:54 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45BDcrXO022598
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 13:38:53 GMT
Received: from hu-ajipan-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 11 Jun 2024 06:38:48 -0700
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
Subject: [PATCH V4 1/8] clk: qcom: clk-alpha-pll: Fix CAL_L_VAL override for LUCID EVO PLL
Date: Tue, 11 Jun 2024 19:07:45 +0530
Message-ID: <20240611133752.2192401-2-quic_ajipan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240611133752.2192401-1-quic_ajipan@quicinc.com>
References: <20240611133752.2192401-1-quic_ajipan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 8Y2NsPTIkWQUnvrqYCkOnmfmQ_ggO3go
X-Proofpoint-GUID: 8Y2NsPTIkWQUnvrqYCkOnmfmQ_ggO3go
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_07,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110099

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
index c51647e37df8..a538559caaa0 100644
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


