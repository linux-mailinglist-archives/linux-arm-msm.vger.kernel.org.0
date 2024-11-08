Return-Path: <linux-arm-msm+bounces-37313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6F49C1520
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 05:10:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B28011F20C37
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 04:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66EA11C4609;
	Fri,  8 Nov 2024 04:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ul2UqJ3m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1117194A60;
	Fri,  8 Nov 2024 04:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731039025; cv=none; b=XreWlhWR7j2qTM1t1UAaGgF/vCDWnqACqU+xnQKiYrp6/ONiqQl5AY3tM67GygTAPj11UXxgMuGTCLQjdiXs4E24o+mhXy5AiaHjO2+lDuwVdPC5Fv3S6jHoF8RePZQam0bzDWaL7FQqK27JXTrwuACOmrIrErJofQsEdymB0Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731039025; c=relaxed/simple;
	bh=GBYR2rwAZ/fcmTkrJuLv2dlgXocNN7CSdSUiJcz7R3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=I9D0kV5ISp9cbO0cczAzL0adbcUZN2IdwVa2CIhDkFSRdCKr3iAfO5izF6rxs0OhvfP08Mf5yD6grAUz5xfmVzXRp7fK+yXvjkkRJQVS8gVvaUJeQJuLg+IkenqgW2kjEbElOayZ4os8k+HeJ/Vf+YMytTXcZJoNJGFBsYsGZOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ul2UqJ3m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7MbFiE013697;
	Fri, 8 Nov 2024 04:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GTUrSO2GwD0wlXBfs9YEdNmQOPZl17wSO98HZKhanj4=; b=Ul2UqJ3mZPLidEUp
	XXDLuyA4aHI0D9vGD+1Zx+NAeXfgXjN4NQFu7MMG5Apcy1uKkwS9IPF6Af61OzZt
	xI7f1N93wDTWn0OL4Eixdvb4h8zfi3tFfb+galsMwo9tJH7cRTZVzVYEJd9Q7Rqy
	XxxZzoJzfuqhpwD9lHyLv36mOw2c4nOYyyDb8gnrk6LvJK3acZUdKCbJ0vTdaCay
	WwnAmP/r+RuoHlVZlFS7Ir/CzmQSkUvaMK29KfjoTufQjb6pQ3FBUE01AB3sCBQJ
	sl1yBgXl5ZSZTLZmQuX089xyp0s29fYtn4xYO6iOoWyyzg9LplTC8RiKfMvHDGdZ
	6Hojkw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42s6gjgks0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Nov 2024 04:09:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A849kFr016751
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Nov 2024 04:09:46 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 7 Nov 2024 20:09:41 -0800
From: Taniya Das <quic_tdas@quicinc.com>
Date: Fri, 8 Nov 2024 09:39:18 +0530
Subject: [PATCH v3 01/11] clk: qcom: Update the support for alpha mode
 configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241108-qcs615-mm-clockcontroller-v3-1-7d3b2d235fdf@quicinc.com>
References: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
In-Reply-To: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Abhishek Sahu
	<absahu@codeaurora.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Gabor Juhos
	<j4g8y7@gmail.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8FuyhXSH1dFbx4Whwb1OZhxKsDsqNmOJ
X-Proofpoint-ORIG-GUID: 8FuyhXSH1dFbx4Whwb1OZhxKsDsqNmOJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411080034

The alpha_en_mask and alpha_mode_mask must be applied within the
clk_alpha_pll_configure() function to ensure proper configuration of
the alpha mode of the PLL.

Fixes: c45ae598fc16 ("clk: qcom: support for alpha mode configuration")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Gabor Juhos <j4g8y7@gmail.com>
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index f9105443d7dbb104e3cb091e59f43df25999f8b3..03cc7aa092480bfdd9eaa986d44f0545944b3b89 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -421,6 +421,8 @@ void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 	mask |= config->pre_div_mask;
 	mask |= config->post_div_mask;
 	mask |= config->vco_mask;
+	mask |= config->alpha_en_mask;
+	mask |= config->alpha_mode_mask;
 
 	regmap_update_bits(regmap, PLL_USER_CTL(pll), mask, val);
 

-- 
2.45.2


