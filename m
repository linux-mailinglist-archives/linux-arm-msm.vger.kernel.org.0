Return-Path: <linux-arm-msm+bounces-27494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7139426D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 08:31:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C98DE1F26309
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 06:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3272116D4F9;
	Wed, 31 Jul 2024 06:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cAITT1lH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BEB1667F6;
	Wed, 31 Jul 2024 06:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722407460; cv=none; b=D4693E6mKzYEmKU3aw+W747CyE+H9rV9XCSQkNPc7nNl5wgA1UC46FzK4CNKOE1019wv/ZfKqcN9+HlqrdbI1fY2x0J8LeFfr7xRNj7XmBLdy+xkXUa+M7GIXtntc/lQZC11g8k4kCs5/CT963abar+0kng7CxvCEHJQ9GlhqW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722407460; c=relaxed/simple;
	bh=rGCKqV6xaKzj9eqR3GpkN1p3hHlNKFkux7oirvK+5Uc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UUzf9/fywTScoNK51+O00H3VMo6GRPl2puxtWeOnfQTThtSsDkgvNLLyoiaPG/PY1uoRVbIpfIrk7ql+7tWwd/G//thH6lreKYl0bjanGnDD/rpUWtW3tjQ5utoyjfRw0c9gSMfBUpcLiBFE3gSeSwpKO0aTF35Ly2KShhnAXW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cAITT1lH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46UIO5a3030531;
	Wed, 31 Jul 2024 06:30:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UmDmHBQPBEPm//algwTTXuo82feZdRW0u1n/kqYYOMM=; b=cAITT1lHKWC337zZ
	FFr3gYfk14Z97ZjOI3zvDXZ305T6ekXe/AK8kehhldKR4Li5RFZV85INeCIV9Cb5
	ipG4B3gQZyEpcL9yVqLh6ywjS2tZliKoy8xQjch7VXggxSf43xVzNsF/meOEMKj3
	O7srNf5AGNCrmeIWfLz0TXaYUqdR9Mp6axtZy8/AmZ0IaosynoOX4+heEqH93qaA
	OYfeksAmoHxBEKfx8V4dhQC26UPfgdbVmyB2YGaAlwFubEYcUSQn3O4rNKrb8fnI
	5BV7PbY1CKh9/gdVvOVirJ62BARVifIloFW8xyxLWkKYUnDLO1USPsjIYV8ADUJC
	AEJcqw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40msne9y02-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 06:30:31 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46V6UUw7018873
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 06:30:30 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 30 Jul 2024 23:30:24 -0700
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
Subject: [PATCH V3 4/8] clk: qcom: clk-alpha-pll: Update set_rate for Zonda PLL
Date: Wed, 31 Jul 2024 11:59:12 +0530
Message-ID: <20240731062916.2680823-5-quic_skakitap@quicinc.com>
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
X-Proofpoint-GUID: 5PYNw_MloLGOli0vmw9XjDGMhvjr5jh9
X-Proofpoint-ORIG-GUID: 5PYNw_MloLGOli0vmw9XjDGMhvjr5jh9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_03,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1015
 spamscore=0 mlxscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407310047

The Zonda PLL has a 16 bit signed alpha and in the cases where the alpha
value is greater than 0.5, the L value needs to be adjusted accordingly.
Thus update the logic to handle the signed alpha val.

Fixes: f21b6bfecc27 ("clk: qcom: clk-alpha-pll: add support for zonda pll")
Cc: stable@vger.kernel.org
Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 2ebeb277cb4d..ad9a84d521fc 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -41,6 +41,7 @@
 #define PLL_USER_CTL(p)		((p)->offset + (p)->regs[PLL_OFF_USER_CTL])
 # define PLL_POST_DIV_SHIFT	8
 # define PLL_POST_DIV_MASK(p)	GENMASK((p)->width - 1, 0)
+# define PLL_ALPHA_MSB		BIT(15)
 # define PLL_ALPHA_EN		BIT(24)
 # define PLL_ALPHA_MODE		BIT(25)
 # define PLL_VCO_SHIFT		20
@@ -2117,6 +2118,18 @@ static void clk_zonda_pll_disable(struct clk_hw *hw)
 	regmap_write(regmap, PLL_OPMODE(pll), 0x0);
 }
 
+static void zonda_pll_adjust_l_val(unsigned long rate, unsigned long prate, u32 *l)
+{
+	u64 remainder, quotient;
+
+	quotient = rate;
+	remainder = do_div(quotient, prate);
+	*l = quotient;
+
+	if ((remainder * 2) / prate)
+		*l = *l + 1;
+}
+
 static int clk_zonda_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 				  unsigned long prate)
 {
@@ -2133,6 +2146,9 @@ static int clk_zonda_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (ret < 0)
 		return ret;
 
+	if (a & PLL_ALPHA_MSB)
+		zonda_pll_adjust_l_val(rate, prate, &l);
+
 	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
 	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
 
-- 
2.25.1


