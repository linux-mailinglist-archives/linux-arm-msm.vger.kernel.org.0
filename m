Return-Path: <linux-arm-msm+bounces-21769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2BC8FCEFA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 15:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 217331F2A4E0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 13:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 450281A0DC5;
	Wed,  5 Jun 2024 12:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="K/ePe93G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F091A01C7;
	Wed,  5 Jun 2024 12:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717591585; cv=none; b=fgvB6dTBVoGtULQHJt0ml5SJbxG2MJkZgBgKQSM3h/w4AFXUeTJ/rCCChHvvRW+qrR9n2pgZ9YPEtTiojOMn+jkh+6XtgU68NBW7KbUxMMpSRCwaqeqrmzyoWtWMib4k1600OfXZZeOUG4M+4IH8yrtdQqYvFhWuu1AVPZoe6Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717591585; c=relaxed/simple;
	bh=lW4xEx7nM7aGeQ/vDtkt45qDavYbkdfHZQ6uiZaSdsQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i1uFLTNntNaJ0RoTtEfJHsE94QKohQMt41Xyla8F4Xe62nAumRhE65d2EhKHEzEe7F6lSwNfKsztx2SZSujRx7a/MENpAvXQqn7L6+DDb/onAlO+wluoXAfe6LObEhBZGJBglkVu8KZFC5NUkAVyra+DHY8dRKNBLKyOJcjJy8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=K/ePe93G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 455B1NnF031693;
	Wed, 5 Jun 2024 12:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iA/7vZq75GteQrEPIg0rOTHxrQhZIEpzFUjJVK7zFaQ=; b=K/ePe93GCJInkMAY
	6HS0Dta1jL/Gya2WzVPZ+urXFqYY2MwuKm+mJDcjN3miOLgXjfHX+d4xkRMaRVGF
	99B69Y5eOi9EOPjIstJBNyVDE8sSuPh4IF2msR5iJ4MpQ2qVFzEKyaTfaijCgLb9
	GvfXVoS1i8zecGKy7l79sfqJr/At1j1BEmbazyEeAqHNC6TexM1hudVjxIYYZjFg
	s3E0wT/H/BHZH3maI3/Kx/1RA60rlzCztweTBwRTkcKh5fywDWIaw0ZKjUA1CWhu
	pre+Bq5f0+S+Shbgc0LQWJbFzvI7RWmhLFL6n291K4pJIhpbldr+9dh5Ju3MoAZJ
	o0fQ4A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjk898tu1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 12:46:09 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 455Ck895025755
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Jun 2024 12:46:08 GMT
Received: from luoj-gv.qualcomm.com (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Jun 2024
 05:46:04 -0700
From: Luo Jie <quic_luoj@quicinc.com>
To: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <p.zabel@pengutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_srichara@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v15 3/4] clk: qcom: common: commonize qcom_cc_really_probe
Date: Wed, 5 Jun 2024 20:45:40 +0800
Message-ID: <20240605124541.2711467-4-quic_luoj@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240605124541.2711467-1-quic_luoj@quicinc.com>
References: <20240605124541.2711467-1-quic_luoj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FR34ArZj91J2mZ7EfUCW4hynxpMLRYBW
X-Proofpoint-ORIG-GUID: FR34ArZj91J2mZ7EfUCW4hynxpMLRYBW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 phishscore=0 mlxscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2406050096

The previous wrapper qcom_cc_really_probe takes the platform
device as parameter, which is limited to platform driver.

As for qca8k clock controller driver, which is registered as
the MDIO device, which also follows the qcom clock framework.

To commonize qcom_cc_really_probe, updating it to take the
struct device as parameter, so that the qcom_cc_really_probe
can be utilized by the previous platform device and the new
added MDIO device.

Also update the current clock controller drivers to take
&pdev->dev as parameter when calling qcom_cc_really_probe.

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 drivers/clk/qcom/apss-ipq6018.c        | 2 +-
 drivers/clk/qcom/camcc-sc7180.c        | 2 +-
 drivers/clk/qcom/camcc-sc7280.c        | 2 +-
 drivers/clk/qcom/camcc-sc8280xp.c      | 2 +-
 drivers/clk/qcom/camcc-sdm845.c        | 2 +-
 drivers/clk/qcom/camcc-sm6350.c        | 2 +-
 drivers/clk/qcom/camcc-sm7150.c        | 2 +-
 drivers/clk/qcom/camcc-sm8250.c        | 2 +-
 drivers/clk/qcom/camcc-sm8450.c        | 2 +-
 drivers/clk/qcom/camcc-sm8550.c        | 2 +-
 drivers/clk/qcom/camcc-x1e80100.c      | 2 +-
 drivers/clk/qcom/common.c              | 7 +++----
 drivers/clk/qcom/common.h              | 2 +-
 drivers/clk/qcom/dispcc-qcm2290.c      | 2 +-
 drivers/clk/qcom/dispcc-sc7180.c       | 2 +-
 drivers/clk/qcom/dispcc-sc7280.c       | 2 +-
 drivers/clk/qcom/dispcc-sc8280xp.c     | 2 +-
 drivers/clk/qcom/dispcc-sdm845.c       | 2 +-
 drivers/clk/qcom/dispcc-sm6115.c       | 2 +-
 drivers/clk/qcom/dispcc-sm6125.c       | 2 +-
 drivers/clk/qcom/dispcc-sm6350.c       | 2 +-
 drivers/clk/qcom/dispcc-sm6375.c       | 2 +-
 drivers/clk/qcom/dispcc-sm7150.c       | 2 +-
 drivers/clk/qcom/dispcc-sm8250.c       | 2 +-
 drivers/clk/qcom/dispcc-sm8450.c       | 2 +-
 drivers/clk/qcom/dispcc-sm8550.c       | 2 +-
 drivers/clk/qcom/dispcc-sm8650.c       | 2 +-
 drivers/clk/qcom/dispcc-x1e80100.c     | 2 +-
 drivers/clk/qcom/ecpricc-qdu1000.c     | 2 +-
 drivers/clk/qcom/gcc-ipq5018.c         | 2 +-
 drivers/clk/qcom/gcc-ipq6018.c         | 2 +-
 drivers/clk/qcom/gcc-ipq8074.c         | 2 +-
 drivers/clk/qcom/gcc-mdm9607.c         | 2 +-
 drivers/clk/qcom/gcc-mdm9615.c         | 2 +-
 drivers/clk/qcom/gcc-msm8917.c         | 2 +-
 drivers/clk/qcom/gcc-msm8939.c         | 2 +-
 drivers/clk/qcom/gcc-msm8953.c         | 2 +-
 drivers/clk/qcom/gcc-msm8976.c         | 2 +-
 drivers/clk/qcom/gcc-msm8996.c         | 2 +-
 drivers/clk/qcom/gcc-msm8998.c         | 2 +-
 drivers/clk/qcom/gcc-qcm2290.c         | 2 +-
 drivers/clk/qcom/gcc-qcs404.c          | 2 +-
 drivers/clk/qcom/gcc-qdu1000.c         | 2 +-
 drivers/clk/qcom/gcc-sa8775p.c         | 2 +-
 drivers/clk/qcom/gcc-sc7180.c          | 2 +-
 drivers/clk/qcom/gcc-sc7280.c          | 2 +-
 drivers/clk/qcom/gcc-sc8180x.c         | 2 +-
 drivers/clk/qcom/gcc-sc8280xp.c        | 2 +-
 drivers/clk/qcom/gcc-sdm660.c          | 2 +-
 drivers/clk/qcom/gcc-sdm845.c          | 2 +-
 drivers/clk/qcom/gcc-sdx55.c           | 2 +-
 drivers/clk/qcom/gcc-sdx65.c           | 2 +-
 drivers/clk/qcom/gcc-sdx75.c           | 2 +-
 drivers/clk/qcom/gcc-sm4450.c          | 2 +-
 drivers/clk/qcom/gcc-sm6115.c          | 2 +-
 drivers/clk/qcom/gcc-sm6125.c          | 2 +-
 drivers/clk/qcom/gcc-sm6350.c          | 2 +-
 drivers/clk/qcom/gcc-sm6375.c          | 2 +-
 drivers/clk/qcom/gcc-sm7150.c          | 2 +-
 drivers/clk/qcom/gcc-sm8150.c          | 2 +-
 drivers/clk/qcom/gcc-sm8250.c          | 2 +-
 drivers/clk/qcom/gcc-sm8350.c          | 2 +-
 drivers/clk/qcom/gcc-sm8450.c          | 2 +-
 drivers/clk/qcom/gcc-sm8550.c          | 2 +-
 drivers/clk/qcom/gcc-sm8650.c          | 2 +-
 drivers/clk/qcom/gcc-x1e80100.c        | 2 +-
 drivers/clk/qcom/gpucc-msm8998.c       | 2 +-
 drivers/clk/qcom/gpucc-sa8775p.c       | 2 +-
 drivers/clk/qcom/gpucc-sc7180.c        | 2 +-
 drivers/clk/qcom/gpucc-sc7280.c        | 2 +-
 drivers/clk/qcom/gpucc-sc8280xp.c      | 2 +-
 drivers/clk/qcom/gpucc-sdm660.c        | 2 +-
 drivers/clk/qcom/gpucc-sdm845.c        | 2 +-
 drivers/clk/qcom/gpucc-sm6115.c        | 2 +-
 drivers/clk/qcom/gpucc-sm6125.c        | 2 +-
 drivers/clk/qcom/gpucc-sm6350.c        | 2 +-
 drivers/clk/qcom/gpucc-sm6375.c        | 2 +-
 drivers/clk/qcom/gpucc-sm8150.c        | 2 +-
 drivers/clk/qcom/gpucc-sm8250.c        | 2 +-
 drivers/clk/qcom/gpucc-sm8350.c        | 2 +-
 drivers/clk/qcom/gpucc-sm8450.c        | 2 +-
 drivers/clk/qcom/gpucc-sm8550.c        | 2 +-
 drivers/clk/qcom/gpucc-sm8650.c        | 2 +-
 drivers/clk/qcom/gpucc-x1e80100.c      | 2 +-
 drivers/clk/qcom/lcc-ipq806x.c         | 2 +-
 drivers/clk/qcom/lcc-msm8960.c         | 2 +-
 drivers/clk/qcom/lpassaudiocc-sc7280.c | 4 ++--
 drivers/clk/qcom/lpasscorecc-sc7180.c  | 2 +-
 drivers/clk/qcom/lpasscorecc-sc7280.c  | 2 +-
 drivers/clk/qcom/mmcc-msm8960.c        | 2 +-
 drivers/clk/qcom/mmcc-msm8974.c        | 2 +-
 drivers/clk/qcom/mmcc-msm8994.c        | 2 +-
 drivers/clk/qcom/mmcc-msm8996.c        | 2 +-
 drivers/clk/qcom/mmcc-msm8998.c        | 2 +-
 drivers/clk/qcom/mmcc-sdm660.c         | 2 +-
 drivers/clk/qcom/tcsrcc-sm8550.c       | 2 +-
 drivers/clk/qcom/videocc-sc7180.c      | 2 +-
 drivers/clk/qcom/videocc-sc7280.c      | 2 +-
 drivers/clk/qcom/videocc-sdm845.c      | 2 +-
 drivers/clk/qcom/videocc-sm7150.c      | 2 +-
 drivers/clk/qcom/videocc-sm8150.c      | 2 +-
 drivers/clk/qcom/videocc-sm8250.c      | 2 +-
 drivers/clk/qcom/videocc-sm8350.c      | 2 +-
 drivers/clk/qcom/videocc-sm8450.c      | 2 +-
 drivers/clk/qcom/videocc-sm8550.c      | 2 +-
 105 files changed, 108 insertions(+), 109 deletions(-)

diff --git a/drivers/clk/qcom/apss-ipq6018.c b/drivers/clk/qcom/apss-ipq6018.c
index e6295b832686..c89d126ebac3 100644
--- a/drivers/clk/qcom/apss-ipq6018.c
+++ b/drivers/clk/qcom/apss-ipq6018.c
@@ -123,7 +123,7 @@ static int apss_ipq6018_probe(struct platform_device *pdev)
 	if (!regmap)
 		return -ENODEV;
 
-	ret = qcom_cc_really_probe(pdev, &apss_ipq6018_desc, regmap);
+	ret = qcom_cc_really_probe(&pdev->dev, &apss_ipq6018_desc, regmap);
 	if (ret)
 		return ret;
 
diff --git a/drivers/clk/qcom/camcc-sc7180.c b/drivers/clk/qcom/camcc-sc7180.c
index a78808b22b03..10e924cd533d 100644
--- a/drivers/clk/qcom/camcc-sc7180.c
+++ b/drivers/clk/qcom/camcc-sc7180.c
@@ -1680,7 +1680,7 @@ static int cam_cc_sc7180_probe(struct platform_device *pdev)
 	clk_agera_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_config);
 	clk_fabia_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
 
-	ret = qcom_cc_really_probe(pdev, &cam_cc_sc7180_desc, regmap);
+	ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_sc7180_desc, regmap);
 	pm_runtime_put(&pdev->dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to register CAM CC clocks\n");
diff --git a/drivers/clk/qcom/camcc-sc7280.c b/drivers/clk/qcom/camcc-sc7280.c
index da29d3b953ee..accd257632df 100644
--- a/drivers/clk/qcom/camcc-sc7280.c
+++ b/drivers/clk/qcom/camcc-sc7280.c
@@ -2481,7 +2481,7 @@ static int cam_cc_sc7280_probe(struct platform_device *pdev)
 	clk_lucid_pll_configure(&cam_cc_pll5, regmap, &cam_cc_pll5_config);
 	clk_lucid_pll_configure(&cam_cc_pll6, regmap, &cam_cc_pll6_config);
 
-	return qcom_cc_really_probe(pdev, &cam_cc_sc7280_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &cam_cc_sc7280_desc, regmap);
 }
 
 static struct platform_driver cam_cc_sc7280_driver = {
diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
index d8de924a878a..479964f91608 100644
--- a/drivers/clk/qcom/camcc-sc8280xp.c
+++ b/drivers/clk/qcom/camcc-sc8280xp.c
@@ -3034,7 +3034,7 @@ static int camcc_sc8280xp_probe(struct platform_device *pdev)
 	/* Keep some clocks always-on */
 	qcom_branch_set_clk_en(regmap, 0xc1e4); /* CAMCC_GDSC_CLK */
 
-	ret = qcom_cc_really_probe(pdev, &camcc_sc8280xp_desc, regmap);
+	ret = qcom_cc_really_probe(&pdev->dev, &camcc_sc8280xp_desc, regmap);
 	if (ret)
 		goto err_disable;
 
diff --git a/drivers/clk/qcom/camcc-sdm845.c b/drivers/clk/qcom/camcc-sdm845.c
index 8466d03e0d05..40022a10f8c0 100644
--- a/drivers/clk/qcom/camcc-sdm845.c
+++ b/drivers/clk/qcom/camcc-sdm845.c
@@ -1735,7 +1735,7 @@ static int cam_cc_sdm845_probe(struct platform_device *pdev)
 	cam_cc_pll_config.l = 0x14;
 	clk_fabia_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll_config);
 
-	return qcom_cc_really_probe(pdev, &cam_cc_sdm845_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &cam_cc_sdm845_desc, regmap);
 }
 
 static struct platform_driver cam_cc_sdm845_driver = {
diff --git a/drivers/clk/qcom/camcc-sm6350.c b/drivers/clk/qcom/camcc-sm6350.c
index c6fe684aa780..f6634cc8663e 100644
--- a/drivers/clk/qcom/camcc-sm6350.c
+++ b/drivers/clk/qcom/camcc-sm6350.c
@@ -1879,7 +1879,7 @@ static int camcc_sm6350_probe(struct platform_device *pdev)
 	clk_agera_pll_configure(&camcc_pll2, regmap, &camcc_pll2_config);
 	clk_fabia_pll_configure(&camcc_pll3, regmap, &camcc_pll3_config);
 
-	return qcom_cc_really_probe(pdev, &camcc_sm6350_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &camcc_sm6350_desc, regmap);
 }
 
 static struct platform_driver camcc_sm6350_driver = {
diff --git a/drivers/clk/qcom/camcc-sm7150.c b/drivers/clk/qcom/camcc-sm7150.c
index a81ce6ab8cd5..39033a6bb616 100644
--- a/drivers/clk/qcom/camcc-sm7150.c
+++ b/drivers/clk/qcom/camcc-sm7150.c
@@ -2044,7 +2044,7 @@ static int camcc_sm7150_probe(struct platform_device *pdev)
 	/* Keep some clocks always-on */
 	qcom_branch_set_clk_en(regmap, 0xc1a0); /* CAMCC_GDSC_CLK */
 
-	return qcom_cc_really_probe(pdev, &camcc_sm7150_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &camcc_sm7150_desc, regmap);
 }
 
 static struct platform_driver camcc_sm7150_driver = {
diff --git a/drivers/clk/qcom/camcc-sm8250.c b/drivers/clk/qcom/camcc-sm8250.c
index 96103eeda586..34d2f17520dc 100644
--- a/drivers/clk/qcom/camcc-sm8250.c
+++ b/drivers/clk/qcom/camcc-sm8250.c
@@ -2433,7 +2433,7 @@ static int cam_cc_sm8250_probe(struct platform_device *pdev)
 	clk_lucid_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
 	clk_lucid_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_config);
 
-	return qcom_cc_really_probe(pdev, &cam_cc_sm8250_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &cam_cc_sm8250_desc, regmap);
 }
 
 static struct platform_driver cam_cc_sm8250_driver = {
diff --git a/drivers/clk/qcom/camcc-sm8450.c b/drivers/clk/qcom/camcc-sm8450.c
index 51338a2884d2..26b78eed15ef 100644
--- a/drivers/clk/qcom/camcc-sm8450.c
+++ b/drivers/clk/qcom/camcc-sm8450.c
@@ -2839,7 +2839,7 @@ static int cam_cc_sm8450_probe(struct platform_device *pdev)
 	clk_lucid_evo_pll_configure(&cam_cc_pll7, regmap, &cam_cc_pll7_config);
 	clk_lucid_evo_pll_configure(&cam_cc_pll8, regmap, &cam_cc_pll8_config);
 
-	return qcom_cc_really_probe(pdev, &cam_cc_sm8450_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &cam_cc_sm8450_desc, regmap);
 }
 
 static struct platform_driver cam_cc_sm8450_driver = {
diff --git a/drivers/clk/qcom/camcc-sm8550.c b/drivers/clk/qcom/camcc-sm8550.c
index 1ef59a96f664..eac850bb690a 100644
--- a/drivers/clk/qcom/camcc-sm8550.c
+++ b/drivers/clk/qcom/camcc-sm8550.c
@@ -3540,7 +3540,7 @@ static int cam_cc_sm8550_probe(struct platform_device *pdev)
 	qcom_branch_set_clk_en(regmap, 0x1419c); /* CAM_CC_GDSC_CLK */
 	qcom_branch_set_clk_en(regmap, 0x142cc); /* CAM_CC_SLEEP_CLK */
 
-	ret = qcom_cc_really_probe(pdev, &cam_cc_sm8550_desc, regmap);
+	ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_sm8550_desc, regmap);
 
 	pm_runtime_put(&pdev->dev);
 
diff --git a/drivers/clk/qcom/camcc-x1e80100.c b/drivers/clk/qcom/camcc-x1e80100.c
index 46bb225906bf..85e76c7712ad 100644
--- a/drivers/clk/qcom/camcc-x1e80100.c
+++ b/drivers/clk/qcom/camcc-x1e80100.c
@@ -2466,7 +2466,7 @@ static int cam_cc_x1e80100_probe(struct platform_device *pdev)
 	qcom_branch_set_clk_en(regmap, 0x13a9c); /* CAM_CC_GDSC_CLK */
 	qcom_branch_set_clk_en(regmap, 0x13ab8); /* CAM_CC_SLEEP_CLK */
 
-	ret = qcom_cc_really_probe(pdev, &cam_cc_x1e80100_desc, regmap);
+	ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_x1e80100_desc, regmap);
 
 	pm_runtime_put(&pdev->dev);
 
diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 1e79f05d5226..c92e10c60322 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -252,11 +252,10 @@ static struct clk_hw *qcom_cc_clk_hw_get(struct of_phandle_args *clkspec,
 	return cc->rclks[idx] ? &cc->rclks[idx]->hw : NULL;
 }
 
-int qcom_cc_really_probe(struct platform_device *pdev,
+int qcom_cc_really_probe(struct device *dev,
 			 const struct qcom_cc_desc *desc, struct regmap *regmap)
 {
 	int i, ret;
-	struct device *dev = &pdev->dev;
 	struct qcom_reset_controller *reset;
 	struct qcom_cc *cc;
 	struct gdsc_desc *scd;
@@ -333,7 +332,7 @@ int qcom_cc_probe(struct platform_device *pdev, const struct qcom_cc_desc *desc)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	return qcom_cc_really_probe(pdev, desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, desc, regmap);
 }
 EXPORT_SYMBOL_GPL(qcom_cc_probe);
 
@@ -351,7 +350,7 @@ int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	return qcom_cc_really_probe(pdev, desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, desc, regmap);
 }
 EXPORT_SYMBOL_GPL(qcom_cc_probe_by_index);
 
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 2d4a8a837e6c..d048bdeeba10 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -60,7 +60,7 @@ extern int qcom_cc_register_sleep_clk(struct device *dev);
 
 extern struct regmap *qcom_cc_map(struct platform_device *pdev,
 				  const struct qcom_cc_desc *desc);
-extern int qcom_cc_really_probe(struct platform_device *pdev,
+extern int qcom_cc_really_probe(struct device *dev,
 				const struct qcom_cc_desc *desc,
 				struct regmap *regmap);
 extern int qcom_cc_probe(struct platform_device *pdev,
diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 654a10d53e5c..449ffea2295d 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -522,7 +522,7 @@ static int disp_cc_qcm2290_probe(struct platform_device *pdev)
 	/* Keep some clocks always-on */
 	qcom_branch_set_clk_en(regmap, 0x604c); /* DISP_CC_XO_CLK */
 
-	ret = qcom_cc_really_probe(pdev, &disp_cc_qcm2290_desc, regmap);
+	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_qcm2290_desc, regmap);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register DISP CC clocks\n");
 		return ret;
diff --git a/drivers/clk/qcom/dispcc-sc7180.c b/drivers/clk/qcom/dispcc-sc7180.c
index 38d7859981c7..4710247be530 100644
--- a/drivers/clk/qcom/dispcc-sc7180.c
+++ b/drivers/clk/qcom/dispcc-sc7180.c
@@ -713,7 +713,7 @@ static int disp_cc_sc7180_probe(struct platform_device *pdev)
 
 	clk_fabia_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll_config);
 
-	return qcom_cc_really_probe(pdev, &disp_cc_sc7180_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &disp_cc_sc7180_desc, regmap);
 }
 
 static struct platform_driver disp_cc_sc7180_driver = {
diff --git a/drivers/clk/qcom/dispcc-sc7280.c b/drivers/clk/qcom/dispcc-sc7280.c
index fbeb8fccb99a..db0745954894 100644
--- a/drivers/clk/qcom/dispcc-sc7280.c
+++ b/drivers/clk/qcom/dispcc-sc7280.c
@@ -881,7 +881,7 @@ static int disp_cc_sc7280_probe(struct platform_device *pdev)
 	/* Keep some clocks always-on */
 	qcom_branch_set_clk_en(regmap, 0x5008); /* DISP_CC_XO_CLK */
 
-	return qcom_cc_really_probe(pdev, &disp_cc_sc7280_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &disp_cc_sc7280_desc, regmap);
 }
 
 static struct platform_driver disp_cc_sc7280_driver = {
diff --git a/drivers/clk/qcom/dispcc-sc8280xp.c b/drivers/clk/qcom/dispcc-sc8280xp.c
index 91172f5b2f15..f1ca9ae0b33f 100644
--- a/drivers/clk/qcom/dispcc-sc8280xp.c
+++ b/drivers/clk/qcom/dispcc-sc8280xp.c
@@ -3172,7 +3172,7 @@ static int disp_cc_sc8280xp_probe(struct platform_device *pdev)
 	clk_lucid_pll_configure(clkr_to_alpha_clk_pll(desc->clks[DISP_CC_PLL1]), regmap, &disp_cc_pll1_config);
 	clk_lucid_pll_configure(clkr_to_alpha_clk_pll(desc->clks[DISP_CC_PLL2]), regmap, &disp_cc_pll2_config);
 
-	ret = qcom_cc_really_probe(pdev, desc, regmap);
+	ret = qcom_cc_really_probe(&pdev->dev, desc, regmap);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register display clock controller\n");
 		goto out_pm_runtime_put;
diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
index b84fdd17c3d8..e6139e8f74dc 100644
--- a/drivers/clk/qcom/dispcc-sdm845.c
+++ b/drivers/clk/qcom/dispcc-sdm845.c
@@ -863,7 +863,7 @@ static int disp_cc_sdm845_probe(struct platform_device *pdev)
 	/* Enable hardware clock gating for DSI and MDP clocks */
 	regmap_update_bits(regmap, 0x8000, 0x7f0, 0x7f0);
 
-	return qcom_cc_really_probe(pdev, &disp_cc_sdm845_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &disp_cc_sdm845_desc, regmap);
 }
 
 static struct platform_driver disp_cc_sdm845_driver = {
diff --git a/drivers/clk/qcom/dispcc-sm6115.c b/drivers/clk/qcom/dispcc-sm6115.c
index bd07f26af35a..939887f82ecc 100644
--- a/drivers/clk/qcom/dispcc-sm6115.c
+++ b/drivers/clk/qcom/dispcc-sm6115.c
@@ -586,7 +586,7 @@ static int disp_cc_sm6115_probe(struct platform_device *pdev)
 	/* Keep some clocks always-on */
 	qcom_branch_set_clk_en(regmap, 0x604c); /* DISP_CC_XO_CLK */
 
-	ret = qcom_cc_really_probe(pdev, &disp_cc_sm6115_desc, regmap);
+	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_sm6115_desc, regmap);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register DISP CC clocks\n");
 		return ret;
diff --git a/drivers/clk/qcom/dispcc-sm6125.c b/drivers/clk/qcom/dispcc-sm6125.c
index 85e07731cce2..51c7492816fb 100644
--- a/drivers/clk/qcom/dispcc-sm6125.c
+++ b/drivers/clk/qcom/dispcc-sm6125.c
@@ -682,7 +682,7 @@ static int disp_cc_sm6125_probe(struct platform_device *pdev)
 
 	clk_alpha_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
 
-	return qcom_cc_really_probe(pdev, &disp_cc_sm6125_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &disp_cc_sm6125_desc, regmap);
 }
 
 static struct platform_driver disp_cc_sm6125_driver = {
diff --git a/drivers/clk/qcom/dispcc-sm6350.c b/drivers/clk/qcom/dispcc-sm6350.c
index f712cbef9456..50facb36701a 100644
--- a/drivers/clk/qcom/dispcc-sm6350.c
+++ b/drivers/clk/qcom/dispcc-sm6350.c
@@ -761,7 +761,7 @@ static int disp_cc_sm6350_probe(struct platform_device *pdev)
 
 	clk_fabia_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
 
-	return qcom_cc_really_probe(pdev, &disp_cc_sm6350_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &disp_cc_sm6350_desc, regmap);
 }
 
 static struct platform_driver disp_cc_sm6350_driver = {
diff --git a/drivers/clk/qcom/dispcc-sm6375.c b/drivers/clk/qcom/dispcc-sm6375.c
index 2d42f85f184b..167dd369a794 100644
--- a/drivers/clk/qcom/dispcc-sm6375.c
+++ b/drivers/clk/qcom/dispcc-sm6375.c
@@ -583,7 +583,7 @@ static int disp_cc_sm6375_probe(struct platform_device *pdev)
 
 	clk_lucid_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
 
-	return qcom_cc_really_probe(pdev, &disp_cc_sm6375_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &disp_cc_sm6375_desc, regmap);
 }
 
 static struct platform_driver disp_cc_sm6375_driver = {
diff --git a/drivers/clk/qcom/dispcc-sm7150.c b/drivers/clk/qcom/dispcc-sm7150.c
index 5c8ae95b6763..d32bd7df1433 100644
--- a/drivers/clk/qcom/dispcc-sm7150.c
+++ b/drivers/clk/qcom/dispcc-sm7150.c
@@ -989,7 +989,7 @@ static int dispcc_sm7150_probe(struct platform_device *pdev)
 	/* Keep some clocks always-on */
 	qcom_branch_set_clk_en(regmap, 0x605c); /* DISPCC_XO_CLK */
 
-	return qcom_cc_really_probe(pdev, &dispcc_sm7150_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &dispcc_sm7150_desc, regmap);
 }
 
 static struct platform_driver dispcc_sm7150_driver = {
diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index 43307c8a342c..5a09009b7289 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -1366,7 +1366,7 @@ static int disp_cc_sm8250_probe(struct platform_device *pdev)
 	/* Keep some clocks always-on */
 	qcom_branch_set_clk_en(regmap, 0x605c); /* DISP_CC_XO_CLK */
 
-	ret = qcom_cc_really_probe(pdev, &disp_cc_sm8250_desc, regmap);
+	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_sm8250_desc, regmap);
 
 	pm_runtime_put(&pdev->dev);
 
diff --git a/drivers/clk/qcom/dispcc-sm8450.c b/drivers/clk/qcom/dispcc-sm8450.c
index 5d028871624e..d1d3f60789ee 100644
--- a/drivers/clk/qcom/dispcc-sm8450.c
+++ b/drivers/clk/qcom/dispcc-sm8450.c
@@ -1778,7 +1778,7 @@ static int disp_cc_sm8450_probe(struct platform_device *pdev)
 	/* Keep some clocks always-on */
 	qcom_branch_set_clk_en(regmap, 0xe05c); /* DISP_CC_XO_CLK */
 
-	ret = qcom_cc_really_probe(pdev, &disp_cc_sm8450_desc, regmap);
+	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_sm8450_desc, regmap);
 	if (ret)
 		goto err_put_rpm;
 
diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
index 88f9347ab77c..31ae46f180a5 100644
--- a/drivers/clk/qcom/dispcc-sm8550.c
+++ b/drivers/clk/qcom/dispcc-sm8550.c
@@ -1771,7 +1771,7 @@ static int disp_cc_sm8550_probe(struct platform_device *pdev)
 	/* Keep some clocks always-on */
 	qcom_branch_set_clk_en(regmap, 0xe054); /* DISP_CC_XO_CLK */
 
-	ret = qcom_cc_really_probe(pdev, &disp_cc_sm8550_desc, regmap);
+	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_sm8550_desc, regmap);
 	if (ret)
 		goto err_put_rpm;
 
diff --git a/drivers/clk/qcom/dispcc-sm8650.c b/drivers/clk/qcom/dispcc-sm8650.c
index c0e1ea63166b..c9d2751f5cb8 100644
--- a/drivers/clk/qcom/dispcc-sm8650.c
+++ b/drivers/clk/qcom/dispcc-sm8650.c
@@ -1768,7 +1768,7 @@ static int disp_cc_sm8650_probe(struct platform_device *pdev)
 	/* Keep some clocks always-on */
 	qcom_branch_set_clk_en(regmap, 0xe054); /* DISP_CC_XO_CLK */
 
-	ret = qcom_cc_really_probe(pdev, &disp_cc_sm8650_desc, regmap);
+	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_sm8650_desc, regmap);
 	if (ret)
 		goto err_put_rpm;
 
diff --git a/drivers/clk/qcom/dispcc-x1e80100.c b/drivers/clk/qcom/dispcc-x1e80100.c
index 0b2ee6456762..40069eba41f2 100644
--- a/drivers/clk/qcom/dispcc-x1e80100.c
+++ b/drivers/clk/qcom/dispcc-x1e80100.c
@@ -1680,7 +1680,7 @@ static int disp_cc_x1e80100_probe(struct platform_device *pdev)
 	qcom_branch_set_clk_en(regmap, 0xe074); /* DISP_CC_SLEEP_CLK */
 	qcom_branch_set_clk_en(regmap, 0xe054); /* DISP_CC_XO_CLK */
 
-	ret = qcom_cc_really_probe(pdev, &disp_cc_x1e80100_desc, regmap);
+	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_x1e80100_desc, regmap);
 	if (ret)
 		goto err_put_rpm;
 
diff --git a/drivers/clk/qcom/ecpricc-qdu1000.c b/drivers/clk/qcom/ecpricc-qdu1000.c
index c628054a7025..dbc11260479b 100644
--- a/drivers/clk/qcom/ecpricc-qdu1000.c
+++ b/drivers/clk/qcom/ecpricc-qdu1000.c
@@ -2439,7 +2439,7 @@ static int ecpri_cc_qdu1000_probe(struct platform_device *pdev)
 	clk_lucid_evo_pll_configure(&ecpri_cc_pll0, regmap, &ecpri_cc_pll0_config);
 	clk_lucid_evo_pll_configure(&ecpri_cc_pll1, regmap, &ecpri_cc_pll1_config);
 
-	return qcom_cc_really_probe(pdev, &ecpri_cc_qdu1000_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &ecpri_cc_qdu1000_desc, regmap);
 }
 
 static struct platform_driver ecpri_cc_qdu1000_driver = {
diff --git a/drivers/clk/qcom/gcc-ipq5018.c b/drivers/clk/qcom/gcc-ipq5018.c
index c1732d70e3a2..70f5dcb96700 100644
--- a/drivers/clk/qcom/gcc-ipq5018.c
+++ b/drivers/clk/qcom/gcc-ipq5018.c
@@ -3698,7 +3698,7 @@ static int gcc_ipq5018_probe(struct platform_device *pdev)
 
 	clk_alpha_pll_configure(&ubi32_pll_main, regmap, &ubi32_pll_config);
 
-	return qcom_cc_really_probe(pdev, &ipq5018_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &ipq5018_desc, regmap);
 }
 
 static struct platform_driver gcc_ipq5018_driver = {
diff --git a/drivers/clk/qcom/gcc-ipq6018.c b/drivers/clk/qcom/gcc-ipq6018.c
index 7e69de34c310..9e5885101366 100644
--- a/drivers/clk/qcom/gcc-ipq6018.c
+++ b/drivers/clk/qcom/gcc-ipq6018.c
@@ -4642,7 +4642,7 @@ static int gcc_ipq6018_probe(struct platform_device *pdev)
 	clk_alpha_pll_configure(&nss_crypto_pll_main, regmap,
 				&nss_crypto_pll_config);
 
-	return qcom_cc_really_probe(pdev, &gcc_ipq6018_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gcc_ipq6018_desc, regmap);
 }
 
 static struct platform_driver gcc_ipq6018_driver = {
diff --git a/drivers/clk/qcom/gcc-ipq8074.c b/drivers/clk/qcom/gcc-ipq8074.c
index d2be56c5892d..32fd01ef469a 100644
--- a/drivers/clk/qcom/gcc-ipq8074.c
+++ b/drivers/clk/qcom/gcc-ipq8074.c
@@ -4760,7 +4760,7 @@ static int gcc_ipq8074_probe(struct platform_device *pdev)
 	clk_alpha_pll_configure(&nss_crypto_pll_main, regmap,
 				&nss_crypto_pll_config);
 
-	return qcom_cc_really_probe(pdev, &gcc_ipq8074_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gcc_ipq8074_desc, regmap);
 }
 
 static struct platform_driver gcc_ipq8074_driver = {
diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index fb290e73ce94..6e6068b168e6 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -1604,7 +1604,7 @@ static int gcc_mdm9607_probe(struct platform_device *pdev)
 	/* Vote for GPLL0 to turn on. Needed by acpuclock. */
 	regmap_update_bits(regmap, 0x45000, BIT(0), BIT(0));
 
-	return qcom_cc_really_probe(pdev, &gcc_mdm9607_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gcc_mdm9607_desc, regmap);
 }
 
 static struct platform_driver gcc_mdm9607_driver = {
diff --git a/drivers/clk/qcom/gcc-mdm9615.c b/drivers/clk/qcom/gcc-mdm9615.c
index aec7c4a1d3de..33987b957737 100644
--- a/drivers/clk/qcom/gcc-mdm9615.c
+++ b/drivers/clk/qcom/gcc-mdm9615.c
@@ -1736,7 +1736,7 @@ static int gcc_mdm9615_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	return qcom_cc_really_probe(pdev, &gcc_mdm9615_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gcc_mdm9615_desc, regmap);
 }
 
 static struct platform_driver gcc_mdm9615_driver = {
diff --git a/drivers/clk/qcom/gcc-msm8917.c b/drivers/clk/qcom/gcc-msm8917.c
index f2b8729e4198..3e2a2ae2ee6e 100644
--- a/drivers/clk/qcom/gcc-msm8917.c
+++ b/drivers/clk/qcom/gcc-msm8917.c
@@ -3270,7 +3270,7 @@ static int gcc_msm8917_probe(struct platform_device *pdev)
 
 	clk_alpha_pll_configure(&gpll3_early, regmap, &gpll3_early_config);
 
-	return qcom_cc_really_probe(pdev, gcc_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, gcc_desc, regmap);
 }
 
 static const struct of_device_id gcc_msm8917_match_table[] = {
diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 7b9a3e99b589..7431c9a65044 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -4108,7 +4108,7 @@ static int gcc_msm8939_probe(struct platform_device *pdev)
 	clk_pll_configure_sr_hpm_lp(&gpll3, regmap, &gpll3_config, true);
 	clk_pll_configure_sr_hpm_lp(&gpll4, regmap, &gpll4_config, true);
 
-	return qcom_cc_really_probe(pdev, &gcc_msm8939_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gcc_msm8939_desc, regmap);
 }
 
 static struct platform_driver gcc_msm8939_driver = {
diff --git a/drivers/clk/qcom/gcc-msm8953.c b/drivers/clk/qcom/gcc-msm8953.c
index 7563bff58118..855a61966f3e 100644
--- a/drivers/clk/qcom/gcc-msm8953.c
+++ b/drivers/clk/qcom/gcc-msm8953.c
@@ -4220,7 +4220,7 @@ static int gcc_msm8953_probe(struct platform_device *pdev)
 
 	clk_alpha_pll_configure(&gpll3_early, regmap, &gpll3_early_config);
 
-	return qcom_cc_really_probe(pdev, &gcc_msm8953_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gcc_msm8953_desc, regmap);
 }
 
 static const struct of_device_id gcc_msm8953_match_table[] = {
diff --git a/drivers/clk/qcom/gcc-msm8976.c b/drivers/clk/qcom/gcc-msm8976.c
index 7fac0ca594aa..399f22033c29 100644
--- a/drivers/clk/qcom/gcc-msm8976.c
+++ b/drivers/clk/qcom/gcc-msm8976.c
@@ -4129,7 +4129,7 @@ static int gcc_msm8976_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return qcom_cc_really_probe(pdev, &gcc_msm8976_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gcc_msm8976_desc, regmap);
 }
 
 static struct platform_driver gcc_msm8976_driver = {
diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index e7b03a17514a..4fc667b94cf2 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -3620,7 +3620,7 @@ static int gcc_msm8996_probe(struct platform_device *pdev)
 	 */
 	regmap_update_bits(regmap, 0x52008, BIT(21), BIT(21));
 
-	return qcom_cc_really_probe(pdev, &gcc_msm8996_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gcc_msm8996_desc, regmap);
 }
 
 static struct platform_driver gcc_msm8996_driver = {
diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
index 5f8c87c1793f..90b66caba2cd 100644
--- a/drivers/clk/qcom/gcc-msm8998.c
+++ b/drivers/clk/qcom/gcc-msm8998.c
@@ -3292,7 +3292,7 @@ static int gcc_msm8998_probe(struct platform_device *pdev)
 	regmap_write(regmap, GCC_MMSS_MISC, 0x10003);
 	regmap_write(regmap, GCC_GPU_MISC, 0x10003);
 
-	return qcom_cc_really_probe(pdev, &gcc_msm8998_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gcc_msm8998_desc, regmap);
 }
 
 static const struct of_device_id gcc_msm8998_match_table[] = {
diff --git a/drivers/clk/qcom/gcc-qcm2290.c b/drivers/clk/qcom/gcc-qcm2290.c
index 48995e50c6bd..9a6703365e61 100644
--- a/drivers/clk/qcom/gcc-qcm2290.c
+++ b/drivers/clk/qcom/gcc-qcm2290.c
@@ -2994,7 +2994,7 @@ static int gcc_qcm2290_probe(struct platform_device *pdev)
 	clk_alpha_pll_configure(&gpll8, regmap, &gpll8_config);
 	clk_alpha_pll_configure(&gpll9, regmap, &gpll9_config);
 
-	return qcom_cc_really_probe(pdev, &gcc_qcm2290_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gcc_qcm2290_desc, regmap);
 }
 
 static struct platform_driver gcc_qcm2290_driver = {
diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index a39c4990b29d..c3cfd572e7c1 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -2824,7 +2824,7 @@ static int gcc_qcs404_probe(struct platform_device *pdev)
 
 	clk_alpha_pll_configure(&gpll3_out_main, regmap, &gpll3_config);
 
-	return qcom_cc_really_probe(pdev, &gcc_qcs404_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gcc_qcs404_desc, regmap);
 }
 
 static struct platform_driver gcc_qcs404_driver = {
diff --git a/drivers/clk/qcom/gcc-qdu1000.c b/drivers/clk/qcom/gcc-qdu1000.c
index 9f42d2601464..dbe9e9437939 100644
--- a/drivers/clk/qcom/gcc-qdu1000.c
+++ b/drivers/clk/qcom/gcc-qdu1000.c
@@ -2674,7 +2674,7 @@ static int gcc_qdu1000_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = qcom_cc_really_probe(pdev, &gcc_qdu1000_desc, regmap);
+	ret = qcom_cc_really_probe(&pdev->dev, &gcc_qdu1000_desc, regmap);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Failed to register GCC clocks\n");
 
diff --git a/drivers/clk/qcom/gcc-sa8775p.c b/drivers/clk/qcom/gcc-sa8775p.c
index 5bcbfbf52cb9..9f31ce4cea18 100644
--- a/drivers/clk/qcom/gcc-sa8775p.c
+++ b/drivers/clk/qcom/gcc-sa8775p.c
@@ -4753,7 +4753,7 @@ static int gcc_sa8775p_probe(struct platform_device *pdev)
 	qcom_branch_set_clk_en(regmap, 0x34004); /* GCC_VIDEO_AHB_CLK */
 	qcom_branch_set_clk_en(regmap, 0x34024); /* GCC_VIDEO_XO_CLK */
 
-	return qcom_cc_really_probe(pdev, &gcc_sa8775p_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gcc_sa8775p_desc, regmap);
 }
 
 static struct platform_driver gcc_sa8775p_driver = {
diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
index 6a5f785c0ced..4a49ad7a9e5b 100644
--- a/drivers/clk/qcom/gcc-sc7180.c
+++ b/drivers/clk/qcom/gcc-sc7180.c
@@ -2458,7 +2458,7 @@ static int gcc_sc7180_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return qcom_cc_really_probe(pdev, &gcc_sc7180_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gcc_sc7180_desc, regmap);
 }
 
 static struct platform_driver gcc_sc7180_driver = {
diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
index b937d513b814..4502926a2691 100644
--- a/drivers/clk/qcom/gcc-sc7280.c
+++ b/drivers/clk/qcom/gcc-sc7280.c
@@ -3481,7 +3481,7 @@ static int gcc_sc7280_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return qcom_cc_really_probe(pdev, &gcc_sc7280_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gcc_sc7280_desc, regmap);
 }
 
 static struct platform_driver gcc_sc7280_driver = {
diff --git a/drivers/clk/qcom/gcc-sc8180x.c b/drivers/clk/qcom/gcc-sc8180x.c
index ad905affd376..ad135bfa4c76 100644
--- a/drivers/clk/qcom/gcc-sc8180x.c
+++ b/drivers/clk/qcom/gcc-sc8180x.c
@@ -4623,7 +4623,7 @@ static int gcc_sc8180x_probe(struct platform_device *pdev)
 	regmap_update_bits(regmap, 0x4d110, 0x3, 0x3);
 	regmap_update_bits(regmap, 0x71028, 0x3, 0x3);
 
-	return qcom_cc_really_probe(pdev, &gcc_sc8180x_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gcc_sc8180x_desc, regmap);
 }
 
 static struct platform_driver gcc_sc8180x_driver = {
diff --git a/drivers/clk/qcom/gcc-sc8280xp.c b/drivers/clk/qcom/gcc-sc8280xp.c
index 082d7b5504eb..5f11760cf73f 100644
--- a/drivers/clk/qcom/gcc-sc8280xp.c
+++ b/drivers/clk/qcom/gcc-sc8280xp.c
@@ -7558,7 +7558,7 @@ static int gcc_sc8280xp_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_put_rpm;
 
-	ret = qcom_cc_really_probe(pdev, &gcc_sc8280xp_desc, regmap);
+	ret = qcom_cc_really_probe(&pdev->dev, &gcc_sc8280xp_desc, regmap);
 	if (ret)
 		goto err_put_rpm;
 
diff --git a/drivers/clk/qcom/gcc-sdm660.c b/drivers/clk/qcom/gcc-sdm660.c
index c4fe70871b6d..df79298a1a25 100644
--- a/drivers/clk/qcom/gcc-sdm660.c
+++ b/drivers/clk/qcom/gcc-sdm660.c
@@ -2474,7 +2474,7 @@ static int gcc_sdm660_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return qcom_cc_really_probe(pdev, &gcc_sdm660_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gcc_sdm660_desc, regmap);
 }
 
 static struct platform_driver gcc_sdm660_driver = {
diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
index ea4c3bf4fb9b..dc3aa7014c3e 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -4011,7 +4011,7 @@ static int gcc_sdm845_probe(struct platform_device *pdev)
 		return ret;
 
 	gcc_desc = of_device_get_match_data(&pdev->dev);
-	return qcom_cc_really_probe(pdev, gcc_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, gcc_desc, regmap);
 }
 
 static struct platform_driver gcc_sdm845_driver = {
diff --git a/drivers/clk/qcom/gcc-sdx55.c b/drivers/clk/qcom/gcc-sdx55.c
index 26279b8d321a..84c507656e8f 100644
--- a/drivers/clk/qcom/gcc-sdx55.c
+++ b/drivers/clk/qcom/gcc-sdx55.c
@@ -1616,7 +1616,7 @@ static int gcc_sdx55_probe(struct platform_device *pdev)
 	regmap_update_bits(regmap, 0x6d008, BIT(21), BIT(21)); /* GCC_CPUSS_AHB_CLK */
 	regmap_update_bits(regmap, 0x6d008, BIT(22), BIT(22)); /* GCC_CPUSS_GNOC_CLK */
 
-	return qcom_cc_really_probe(pdev, &gcc_sdx55_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gcc_sdx55_desc, regmap);
 }
 
 static struct platform_driver gcc_sdx55_driver = {
diff --git a/drivers/clk/qcom/gcc-sdx65.c b/drivers/clk/qcom/gcc-sdx65.c
index 8fde6463574b..fe297c606f97 100644
--- a/drivers/clk/qcom/gcc-sdx65.c
+++ b/drivers/clk/qcom/gcc-sdx65.c
@@ -1580,7 +1580,7 @@ static int gcc_sdx65_probe(struct platform_device *pdev)
 	regmap_update_bits(regmap, 0x6d008, BIT(21), BIT(21)); /* GCC_CPUSS_AHB_CLK */
 	regmap_update_bits(regmap, 0x6d008, BIT(22), BIT(22)); /* GCC_CPUSS_GNOC_CLK */
 
-	return qcom_cc_really_probe(pdev, &gcc_sdx65_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gcc_sdx65_desc, regmap);
 }
 
 static struct platform_driver gcc_sdx65_driver = {
diff --git a/drivers/clk/qcom/gcc-sdx75.c b/drivers/clk/qcom/gcc-sdx75.c
index c51338f08ef1..453a6bf8e878 100644
--- a/drivers/clk/qcom/gcc-sdx75.c
+++ b/drivers/clk/qcom/gcc-sdx75.c
@@ -2940,7 +2940,7 @@ static int gcc_sdx75_probe(struct platform_device *pdev)
 	qcom_branch_set_clk_en(regmap, 0x3e004); /* GCC_AHB_PCIE_LINK_CLK */
 	qcom_branch_set_clk_en(regmap, 0x3e008); /* GCC_XO_PCIE_LINK_CLK */
 
-	return qcom_cc_really_probe(pdev, &gcc_sdx75_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gcc_sdx75_desc, regmap);
 }
 
 static struct platform_driver gcc_sdx75_driver = {
diff --git a/drivers/clk/qcom/gcc-sm4450.c b/drivers/clk/qcom/gcc-sm4450.c
index 062e55e98156..e2d9e4691c5b 100644
--- a/drivers/clk/qcom/gcc-sm4450.c
+++ b/drivers/clk/qcom/gcc-sm4450.c
@@ -2861,7 +2861,7 @@ static int gcc_sm4450_probe(struct platform_device *pdev)
 
 	regmap_update_bits(regmap, 0x4201c, BIT(21), BIT(21));
 
-	return qcom_cc_really_probe(pdev, &gcc_sm4450_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gcc_sm4450_desc, regmap);
 }
 
 static struct platform_driver gcc_sm4450_driver = {
diff --git a/drivers/clk/qcom/gcc-sm6115.c b/drivers/clk/qcom/gcc-sm6115.c
index 167e344ad399..4c3804701e24 100644
--- a/drivers/clk/qcom/gcc-sm6115.c
+++ b/drivers/clk/qcom/gcc-sm6115.c
@@ -3513,7 +3513,7 @@ static int gcc_sm6115_probe(struct platform_device *pdev)
 	clk_alpha_pll_configure(&gpll10, regmap, &gpll10_config);
 	clk_alpha_pll_configure(&gpll11, regmap, &gpll11_config);
 
-	return qcom_cc_really_probe(pdev, &gcc_sm6115_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gcc_sm6115_desc, regmap);
 }
 
 static struct platform_driver gcc_sm6115_driver = {
diff --git a/drivers/clk/qcom/gcc-sm6125.c b/drivers/clk/qcom/gcc-sm6125.c
index da554efee2ce..07bb1e5c4a30 100644
--- a/drivers/clk/qcom/gcc-sm6125.c
+++ b/drivers/clk/qcom/gcc-sm6125.c
@@ -4161,7 +4161,7 @@ static int gcc_sm6125_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return qcom_cc_really_probe(pdev, &gcc_sm6125_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gcc_sm6125_desc, regmap);
 }
 
 static struct platform_driver gcc_sm6125_driver = {
diff --git a/drivers/clk/qcom/gcc-sm6350.c b/drivers/clk/qcom/gcc-sm6350.c
index 0559a33faf00..a811fad2aa27 100644
--- a/drivers/clk/qcom/gcc-sm6350.c
+++ b/drivers/clk/qcom/gcc-sm6350.c
@@ -2559,7 +2559,7 @@ static int gcc_sm6350_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return qcom_cc_really_probe(pdev, &gcc_sm6350_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gcc_sm6350_desc, regmap);
 }
 
 static struct platform_driver gcc_sm6350_driver = {
diff --git a/drivers/clk/qcom/gcc-sm6375.c b/drivers/clk/qcom/gcc-sm6375.c
index ac1ed2d728f9..f47dc2808095 100644
--- a/drivers/clk/qcom/gcc-sm6375.c
+++ b/drivers/clk/qcom/gcc-sm6375.c
@@ -3892,7 +3892,7 @@ static int gcc_sm6375_probe(struct platform_device *pdev)
 	clk_lucid_pll_configure(&gpll8, regmap, &gpll8_config);
 	clk_zonda_pll_configure(&gpll9, regmap, &gpll9_config);
 
-	return qcom_cc_really_probe(pdev, &gcc_sm6375_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gcc_sm6375_desc, regmap);
 }
 
 static struct platform_driver gcc_sm6375_driver = {
diff --git a/drivers/clk/qcom/gcc-sm7150.c b/drivers/clk/qcom/gcc-sm7150.c
index b0c50ebb86be..7eabaf0e1b57 100644
--- a/drivers/clk/qcom/gcc-sm7150.c
+++ b/drivers/clk/qcom/gcc-sm7150.c
@@ -3017,7 +3017,7 @@ static int gcc_sm7150_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return qcom_cc_really_probe(pdev, &gcc_sm7150_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gcc_sm7150_desc, regmap);
 }
 
 static struct platform_driver gcc_sm7150_driver = {
diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
index 1f748141d12c..cefceb780889 100644
--- a/drivers/clk/qcom/gcc-sm8150.c
+++ b/drivers/clk/qcom/gcc-sm8150.c
@@ -3797,7 +3797,7 @@ static int gcc_sm8150_probe(struct platform_device *pdev)
 	if (ret)
 		dev_err_probe(&pdev->dev, ret, "Failed to register with DFS!\n");
 
-	return qcom_cc_really_probe(pdev, &gcc_sm8150_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gcc_sm8150_desc, regmap);
 }
 
 static struct platform_driver gcc_sm8150_driver = {
diff --git a/drivers/clk/qcom/gcc-sm8250.c b/drivers/clk/qcom/gcc-sm8250.c
index e630bfa2d0c1..991cd8b8d597 100644
--- a/drivers/clk/qcom/gcc-sm8250.c
+++ b/drivers/clk/qcom/gcc-sm8250.c
@@ -3656,7 +3656,7 @@ static int gcc_sm8250_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return qcom_cc_really_probe(pdev, &gcc_sm8250_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gcc_sm8250_desc, regmap);
 }
 
 static struct platform_driver gcc_sm8250_driver = {
diff --git a/drivers/clk/qcom/gcc-sm8350.c b/drivers/clk/qcom/gcc-sm8350.c
index fc0402e8a2a7..2d94f3046b71 100644
--- a/drivers/clk/qcom/gcc-sm8350.c
+++ b/drivers/clk/qcom/gcc-sm8350.c
@@ -3822,7 +3822,7 @@ static int gcc_sm8350_probe(struct platform_device *pdev)
 	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
 	regmap_update_bits(regmap, gcc_ufs_phy_ice_core_clk.halt_reg, BIT(14), BIT(14));
 
-	return qcom_cc_really_probe(pdev, &gcc_sm8350_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gcc_sm8350_desc, regmap);
 }
 
 static struct platform_driver gcc_sm8350_driver = {
diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index e86c58bc5e48..639a9a955914 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -3289,7 +3289,7 @@ static int gcc_sm8450_probe(struct platform_device *pdev)
 	qcom_branch_set_clk_en(regmap, 0x42004); /* GCC_VIDEO_AHB_CLK */
 	qcom_branch_set_clk_en(regmap, 0x42028); /* GCC_VIDEO_XO_CLK */
 
-	return qcom_cc_really_probe(pdev, &gcc_sm8450_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gcc_sm8450_desc, regmap);
 }
 
 static struct platform_driver gcc_sm8450_driver = {
diff --git a/drivers/clk/qcom/gcc-sm8550.c b/drivers/clk/qcom/gcc-sm8550.c
index 26d7349e7642..7944ddb4b47d 100644
--- a/drivers/clk/qcom/gcc-sm8550.c
+++ b/drivers/clk/qcom/gcc-sm8550.c
@@ -3364,7 +3364,7 @@ static int gcc_sm8550_probe(struct platform_device *pdev)
 	/* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in sleep. */
 	regmap_write(regmap, 0x52024, 0x0);
 
-	return qcom_cc_really_probe(pdev, &gcc_sm8550_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gcc_sm8550_desc, regmap);
 }
 
 static struct platform_driver gcc_sm8550_driver = {
diff --git a/drivers/clk/qcom/gcc-sm8650.c b/drivers/clk/qcom/gcc-sm8650.c
index 9d1cbdf860fb..9bc19bea0c97 100644
--- a/drivers/clk/qcom/gcc-sm8650.c
+++ b/drivers/clk/qcom/gcc-sm8650.c
@@ -3822,7 +3822,7 @@ static int gcc_sm8650_probe(struct platform_device *pdev)
 	/* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in sleep. */
 	regmap_write(regmap, 0x52150, 0x0);
 
-	return qcom_cc_really_probe(pdev, &gcc_sm8650_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gcc_sm8650_desc, regmap);
 }
 
 static struct platform_driver gcc_sm8650_driver = {
diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
index 1404017be918..eb7e36ebd7ae 100644
--- a/drivers/clk/qcom/gcc-x1e80100.c
+++ b/drivers/clk/qcom/gcc-x1e80100.c
@@ -6781,7 +6781,7 @@ static int gcc_x1e80100_probe(struct platform_device *pdev)
 	/* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in sleep. */
 	regmap_write(regmap, 0x52224, 0x0);
 
-	return qcom_cc_really_probe(pdev, &gcc_x1e80100_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gcc_x1e80100_desc, regmap);
 }
 
 static struct platform_driver gcc_x1e80100_driver = {
diff --git a/drivers/clk/qcom/gpucc-msm8998.c b/drivers/clk/qcom/gpucc-msm8998.c
index 7b1cb44e31b2..9efeab2691ba 100644
--- a/drivers/clk/qcom/gpucc-msm8998.c
+++ b/drivers/clk/qcom/gpucc-msm8998.c
@@ -334,7 +334,7 @@ static int gpucc_msm8998_probe(struct platform_device *pdev)
 	/* tweak droop detector (GPUCC_GPU_DD_WRAP_CTRL) to reduce leakage */
 	regmap_write_bits(regmap, gfx3d_clk.clkr.enable_reg, BIT(0), BIT(0));
 
-	return qcom_cc_really_probe(pdev, &gpucc_msm8998_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gpucc_msm8998_desc, regmap);
 }
 
 static struct platform_driver gpucc_msm8998_driver = {
diff --git a/drivers/clk/qcom/gpucc-sa8775p.c b/drivers/clk/qcom/gpucc-sa8775p.c
index 1167c42da39d..ac7552b146c7 100644
--- a/drivers/clk/qcom/gpucc-sa8775p.c
+++ b/drivers/clk/qcom/gpucc-sa8775p.c
@@ -598,7 +598,7 @@ static int gpu_cc_sa8775p_probe(struct platform_device *pdev)
 	clk_lucid_evo_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
 	clk_lucid_evo_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
 
-	return qcom_cc_really_probe(pdev, &gpu_cc_sa8775p_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gpu_cc_sa8775p_desc, regmap);
 }
 
 static struct platform_driver gpu_cc_sa8775p_driver = {
diff --git a/drivers/clk/qcom/gpucc-sc7180.c b/drivers/clk/qcom/gpucc-sc7180.c
index 66f5b48cbf87..08f3983d016f 100644
--- a/drivers/clk/qcom/gpucc-sc7180.c
+++ b/drivers/clk/qcom/gpucc-sc7180.c
@@ -241,7 +241,7 @@ static int gpu_cc_sc7180_probe(struct platform_device *pdev)
 	value = 0xF << CX_GMU_CBCR_WAKE_SHIFT | 0xF << CX_GMU_CBCR_SLEEP_SHIFT;
 	regmap_update_bits(regmap, 0x1098, mask, value);
 
-	return qcom_cc_really_probe(pdev, &gpu_cc_sc7180_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gpu_cc_sc7180_desc, regmap);
 }
 
 static struct platform_driver gpu_cc_sc7180_driver = {
diff --git a/drivers/clk/qcom/gpucc-sc7280.c b/drivers/clk/qcom/gpucc-sc7280.c
index ebda57eac979..bd699a624517 100644
--- a/drivers/clk/qcom/gpucc-sc7280.c
+++ b/drivers/clk/qcom/gpucc-sc7280.c
@@ -469,7 +469,7 @@ static int gpu_cc_sc7280_probe(struct platform_device *pdev)
 	qcom_branch_set_clk_en(regmap, 0x1098); /* GPUCC_CX_GMU_CLK */
 	regmap_update_bits(regmap, 0x1098, BIT(13), BIT(13));
 
-	return qcom_cc_really_probe(pdev, &gpu_cc_sc7280_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gpu_cc_sc7280_desc, regmap);
 }
 
 static struct platform_driver gpu_cc_sc7280_driver = {
diff --git a/drivers/clk/qcom/gpucc-sc8280xp.c b/drivers/clk/qcom/gpucc-sc8280xp.c
index 3611d2d1823d..c96be61e3f47 100644
--- a/drivers/clk/qcom/gpucc-sc8280xp.c
+++ b/drivers/clk/qcom/gpucc-sc8280xp.c
@@ -449,7 +449,7 @@ static int gpu_cc_sc8280xp_probe(struct platform_device *pdev)
 	qcom_branch_set_clk_en(regmap, 0x1170); /* GPU_CC_CB_CLK */
 	qcom_branch_set_clk_en(regmap, 0x109c); /* GPU_CC_CXO_CLK */
 
-	ret = qcom_cc_really_probe(pdev, &gpu_cc_sc8280xp_desc, regmap);
+	ret = qcom_cc_really_probe(&pdev->dev, &gpu_cc_sc8280xp_desc, regmap);
 	pm_runtime_put(&pdev->dev);
 
 	return ret;
diff --git a/drivers/clk/qcom/gpucc-sdm660.c b/drivers/clk/qcom/gpucc-sdm660.c
index a52d98b7cf4c..3ae1b80e38d9 100644
--- a/drivers/clk/qcom/gpucc-sdm660.c
+++ b/drivers/clk/qcom/gpucc-sdm660.c
@@ -330,7 +330,7 @@ static int gpucc_sdm660_probe(struct platform_device *pdev)
 	gpu_pll_config.alpha_hi = 0x8a;
 	clk_alpha_pll_configure(&gpu_pll1_pll_out_main, regmap, &gpu_pll_config);
 
-	return qcom_cc_really_probe(pdev, &gpucc_sdm660_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gpucc_sdm660_desc, regmap);
 }
 
 static struct platform_driver gpucc_sdm660_driver = {
diff --git a/drivers/clk/qcom/gpucc-sdm845.c b/drivers/clk/qcom/gpucc-sdm845.c
index c87c3215dfe3..ef26690cf504 100644
--- a/drivers/clk/qcom/gpucc-sdm845.c
+++ b/drivers/clk/qcom/gpucc-sdm845.c
@@ -192,7 +192,7 @@ static int gpu_cc_sdm845_probe(struct platform_device *pdev)
 	value = 0xf << CX_GMU_CBCR_WAKE_SHIFT | 0xf << CX_GMU_CBCR_SLEEP_SHIFT;
 	regmap_update_bits(regmap, 0x1098, mask, value);
 
-	return qcom_cc_really_probe(pdev, &gpu_cc_sdm845_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gpu_cc_sdm845_desc, regmap);
 }
 
 static struct platform_driver gpu_cc_sdm845_driver = {
diff --git a/drivers/clk/qcom/gpucc-sm6115.c b/drivers/clk/qcom/gpucc-sm6115.c
index 9793dd9a2596..d43c86cf73a5 100644
--- a/drivers/clk/qcom/gpucc-sm6115.c
+++ b/drivers/clk/qcom/gpucc-sm6115.c
@@ -488,7 +488,7 @@ static int gpu_cc_sm6115_probe(struct platform_device *pdev)
 	qcom_branch_set_force_mem_core(regmap, gpu_cc_gx_gfx3d_clk, true);
 	qcom_branch_set_force_periph_on(regmap, gpu_cc_gx_gfx3d_clk, true);
 
-	return qcom_cc_really_probe(pdev, &gpu_cc_sm6115_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gpu_cc_sm6115_desc, regmap);
 }
 
 static struct platform_driver gpu_cc_sm6115_driver = {
diff --git a/drivers/clk/qcom/gpucc-sm6125.c b/drivers/clk/qcom/gpucc-sm6125.c
index b719a48fe706..ed6a6e505801 100644
--- a/drivers/clk/qcom/gpucc-sm6125.c
+++ b/drivers/clk/qcom/gpucc-sm6125.c
@@ -409,7 +409,7 @@ static int gpu_cc_sm6125_probe(struct platform_device *pdev)
 	qcom_branch_set_force_mem_core(regmap, gpu_cc_gx_gfx3d_clk, true);
 	qcom_branch_set_force_periph_on(regmap, gpu_cc_gx_gfx3d_clk, true);
 
-	return qcom_cc_really_probe(pdev, &gpu_cc_sm6125_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gpu_cc_sm6125_desc, regmap);
 }
 
 static struct platform_driver gpu_cc_sm6125_driver = {
diff --git a/drivers/clk/qcom/gpucc-sm6350.c b/drivers/clk/qcom/gpucc-sm6350.c
index 0bcbba2a2943..1e12ad8948db 100644
--- a/drivers/clk/qcom/gpucc-sm6350.c
+++ b/drivers/clk/qcom/gpucc-sm6350.c
@@ -502,7 +502,7 @@ static int gpu_cc_sm6350_probe(struct platform_device *pdev)
 	value = 0xF << CX_GMU_CBCR_WAKE_SHIFT | 0xF << CX_GMU_CBCR_SLEEP_SHIFT;
 	regmap_update_bits(regmap, 0x1098, mask, value);
 
-	return qcom_cc_really_probe(pdev, &gpu_cc_sm6350_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gpu_cc_sm6350_desc, regmap);
 }
 
 static struct platform_driver gpu_cc_sm6350_driver = {
diff --git a/drivers/clk/qcom/gpucc-sm6375.c b/drivers/clk/qcom/gpucc-sm6375.c
index 4e9a30a080d3..41f59024143e 100644
--- a/drivers/clk/qcom/gpucc-sm6375.c
+++ b/drivers/clk/qcom/gpucc-sm6375.c
@@ -455,7 +455,7 @@ static int gpucc_sm6375_probe(struct platform_device *pdev)
 	clk_lucid_pll_configure(&gpucc_pll0, regmap, &gpucc_pll0_config);
 	clk_lucid_pll_configure(&gpucc_pll1, regmap, &gpucc_pll1_config);
 
-	ret = qcom_cc_really_probe(pdev, &gpucc_sm6375_desc, regmap);
+	ret = qcom_cc_really_probe(&pdev->dev, &gpucc_sm6375_desc, regmap);
 	pm_runtime_put(&pdev->dev);
 
 	return ret;
diff --git a/drivers/clk/qcom/gpucc-sm8150.c b/drivers/clk/qcom/gpucc-sm8150.c
index 135601629cba..d711464a71b6 100644
--- a/drivers/clk/qcom/gpucc-sm8150.c
+++ b/drivers/clk/qcom/gpucc-sm8150.c
@@ -304,7 +304,7 @@ static int gpu_cc_sm8150_probe(struct platform_device *pdev)
 
 	clk_trion_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
 
-	return qcom_cc_really_probe(pdev, &gpu_cc_sm8150_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gpu_cc_sm8150_desc, regmap);
 }
 
 static struct platform_driver gpu_cc_sm8150_driver = {
diff --git a/drivers/clk/qcom/gpucc-sm8250.c b/drivers/clk/qcom/gpucc-sm8250.c
index 012bd1380f55..113b486a6d2f 100644
--- a/drivers/clk/qcom/gpucc-sm8250.c
+++ b/drivers/clk/qcom/gpucc-sm8250.c
@@ -320,7 +320,7 @@ static int gpu_cc_sm8250_probe(struct platform_device *pdev)
 	value = 0xf << CX_GMU_CBCR_WAKE_SHIFT | 0xf << CX_GMU_CBCR_SLEEP_SHIFT;
 	regmap_update_bits(regmap, 0x1098, mask, value);
 
-	return qcom_cc_really_probe(pdev, &gpu_cc_sm8250_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gpu_cc_sm8250_desc, regmap);
 }
 
 static struct platform_driver gpu_cc_sm8250_driver = {
diff --git a/drivers/clk/qcom/gpucc-sm8350.c b/drivers/clk/qcom/gpucc-sm8350.c
index 9437d316d145..f6bb8244dd40 100644
--- a/drivers/clk/qcom/gpucc-sm8350.c
+++ b/drivers/clk/qcom/gpucc-sm8350.c
@@ -604,7 +604,7 @@ static int gpu_cc_sm8350_probe(struct platform_device *pdev)
 	clk_lucid_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
 	clk_lucid_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
 
-	return qcom_cc_really_probe(pdev, &gpu_cc_sm8350_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gpu_cc_sm8350_desc, regmap);
 }
 
 static const struct of_device_id gpu_cc_sm8350_match_table[] = {
diff --git a/drivers/clk/qcom/gpucc-sm8450.c b/drivers/clk/qcom/gpucc-sm8450.c
index 7b329a803289..b3c5d6923cd2 100644
--- a/drivers/clk/qcom/gpucc-sm8450.c
+++ b/drivers/clk/qcom/gpucc-sm8450.c
@@ -751,7 +751,7 @@ static int gpu_cc_sm8450_probe(struct platform_device *pdev)
 	clk_lucid_evo_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
 	clk_lucid_evo_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
 
-	return qcom_cc_really_probe(pdev, &gpu_cc_sm8450_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gpu_cc_sm8450_desc, regmap);
 }
 
 static struct platform_driver gpu_cc_sm8450_driver = {
diff --git a/drivers/clk/qcom/gpucc-sm8550.c b/drivers/clk/qcom/gpucc-sm8550.c
index 4fc69c6026e5..7486edf56160 100644
--- a/drivers/clk/qcom/gpucc-sm8550.c
+++ b/drivers/clk/qcom/gpucc-sm8550.c
@@ -579,7 +579,7 @@ static int gpu_cc_sm8550_probe(struct platform_device *pdev)
 	qcom_branch_set_clk_en(regmap, 0x9004); /* GPU_CC_CXO_AON_CLK */
 	qcom_branch_set_clk_en(regmap, 0x900c); /* GPU_CC_DEMET_CLK */
 
-	return qcom_cc_really_probe(pdev, &gpu_cc_sm8550_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gpu_cc_sm8550_desc, regmap);
 }
 
 static struct platform_driver gpu_cc_sm8550_driver = {
diff --git a/drivers/clk/qcom/gpucc-sm8650.c b/drivers/clk/qcom/gpucc-sm8650.c
index c53306d3093f..f15aeecc512d 100644
--- a/drivers/clk/qcom/gpucc-sm8650.c
+++ b/drivers/clk/qcom/gpucc-sm8650.c
@@ -647,7 +647,7 @@ static int gpu_cc_sm8650_probe(struct platform_device *pdev)
 	clk_lucid_ole_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
 	clk_lucid_ole_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
 
-	return qcom_cc_really_probe(pdev, &gpu_cc_sm8650_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gpu_cc_sm8650_desc, regmap);
 }
 
 static struct platform_driver gpu_cc_sm8650_driver = {
diff --git a/drivers/clk/qcom/gpucc-x1e80100.c b/drivers/clk/qcom/gpucc-x1e80100.c
index b7e79d118d6e..2eec20dd0254 100644
--- a/drivers/clk/qcom/gpucc-x1e80100.c
+++ b/drivers/clk/qcom/gpucc-x1e80100.c
@@ -640,7 +640,7 @@ static int gpu_cc_x1e80100_probe(struct platform_device *pdev)
 	/* Keep clocks always enabled */
 	qcom_branch_set_clk_en(regmap, 0x93a4); /* GPU_CC_CB_CLK */
 
-	return qcom_cc_really_probe(pdev, &gpu_cc_x1e80100_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &gpu_cc_x1e80100_desc, regmap);
 }
 
 static struct platform_driver gpu_cc_x1e80100_driver = {
diff --git a/drivers/clk/qcom/lcc-ipq806x.c b/drivers/clk/qcom/lcc-ipq806x.c
index fa8cda63cf20..bf5320a43e8c 100644
--- a/drivers/clk/qcom/lcc-ipq806x.c
+++ b/drivers/clk/qcom/lcc-ipq806x.c
@@ -454,7 +454,7 @@ static int lcc_ipq806x_probe(struct platform_device *pdev)
 	/* Enable PLL4 source on the LPASS Primary PLL Mux */
 	regmap_write(regmap, 0xc4, 0x1);
 
-	return qcom_cc_really_probe(pdev, &lcc_ipq806x_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &lcc_ipq806x_desc, regmap);
 }
 
 static struct platform_driver lcc_ipq806x_driver = {
diff --git a/drivers/clk/qcom/lcc-msm8960.c b/drivers/clk/qcom/lcc-msm8960.c
index e725e7b9c456..d53bf315e9c3 100644
--- a/drivers/clk/qcom/lcc-msm8960.c
+++ b/drivers/clk/qcom/lcc-msm8960.c
@@ -481,7 +481,7 @@ static int lcc_msm8960_probe(struct platform_device *pdev)
 	/* Enable PLL4 source on the LPASS Primary PLL Mux */
 	regmap_write(regmap, 0xc4, 0x1);
 
-	return qcom_cc_really_probe(pdev, &lcc_msm8960_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &lcc_msm8960_desc, regmap);
 }
 
 static struct platform_driver lcc_msm8960_driver = {
diff --git a/drivers/clk/qcom/lpassaudiocc-sc7280.c b/drivers/clk/qcom/lpassaudiocc-sc7280.c
index c43d0b1af7f7..45e726477086 100644
--- a/drivers/clk/qcom/lpassaudiocc-sc7280.c
+++ b/drivers/clk/qcom/lpassaudiocc-sc7280.c
@@ -772,7 +772,7 @@ static int lpass_audio_cc_sc7280_probe(struct platform_device *pdev)
 	regmap_write(regmap, 0x4, 0x3b);
 	regmap_write(regmap, 0x8, 0xff05);
 
-	ret = qcom_cc_really_probe(pdev, &lpass_audio_cc_sc7280_desc, regmap);
+	ret = qcom_cc_really_probe(&pdev->dev, &lpass_audio_cc_sc7280_desc, regmap);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register LPASS AUDIO CC clocks\n");
 		goto exit;
@@ -847,7 +847,7 @@ static int lpass_aon_cc_sc7280_probe(struct platform_device *pdev)
 
 	clk_lucid_pll_configure(&lpass_aon_cc_pll, regmap, &lpass_aon_cc_pll_config);
 
-	ret = qcom_cc_really_probe(pdev, &lpass_aon_cc_sc7280_desc, regmap);
+	ret = qcom_cc_really_probe(&pdev->dev, &lpass_aon_cc_sc7280_desc, regmap);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register LPASS AON CC clocks\n");
 		goto exit;
diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
index 8ac72d26087e..726c6378752f 100644
--- a/drivers/clk/qcom/lpasscorecc-sc7180.c
+++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
@@ -411,7 +411,7 @@ static int lpass_core_cc_sc7180_probe(struct platform_device *pdev)
 	clk_fabia_pll_configure(&lpass_lpaaudio_dig_pll, regmap,
 				&lpass_lpaaudio_dig_pll_config);
 
-	ret = qcom_cc_really_probe(pdev, &lpass_core_cc_sc7180_desc, regmap);
+	ret = qcom_cc_really_probe(&pdev->dev, &lpass_core_cc_sc7180_desc, regmap);
 
 	pm_runtime_mark_last_busy(&pdev->dev);
 exit:
diff --git a/drivers/clk/qcom/lpasscorecc-sc7280.c b/drivers/clk/qcom/lpasscorecc-sc7280.c
index a2f1e6ad6da4..b0888cd2460b 100644
--- a/drivers/clk/qcom/lpasscorecc-sc7280.c
+++ b/drivers/clk/qcom/lpasscorecc-sc7280.c
@@ -406,7 +406,7 @@ static int lpass_core_cc_sc7280_probe(struct platform_device *pdev)
 
 	clk_lucid_pll_configure(&lpass_core_cc_dig_pll, regmap, &lpass_core_cc_dig_pll_config);
 
-	return qcom_cc_really_probe(pdev, &lpass_core_cc_sc7280_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &lpass_core_cc_sc7280_desc, regmap);
 }
 
 static struct platform_driver lpass_core_cc_sc7280_driver = {
diff --git a/drivers/clk/qcom/mmcc-msm8960.c b/drivers/clk/qcom/mmcc-msm8960.c
index 50638ab341ec..1061322534c4 100644
--- a/drivers/clk/qcom/mmcc-msm8960.c
+++ b/drivers/clk/qcom/mmcc-msm8960.c
@@ -3122,7 +3122,7 @@ static int mmcc_msm8960_probe(struct platform_device *pdev)
 
 	clk_pll_configure_sr(&pll15, regmap, &pll15_config, false);
 
-	return qcom_cc_really_probe(pdev, desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, desc, regmap);
 }
 
 static struct platform_driver mmcc_msm8960_driver = {
diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
index 36f460b78be2..d5bcb09ebd0c 100644
--- a/drivers/clk/qcom/mmcc-msm8974.c
+++ b/drivers/clk/qcom/mmcc-msm8974.c
@@ -2768,7 +2768,7 @@ static int mmcc_msm8974_probe(struct platform_device *pdev)
 		msm8226_clock_override();
 	}
 
-	return qcom_cc_really_probe(pdev, desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, desc, regmap);
 }
 
 static struct platform_driver mmcc_msm8974_driver = {
diff --git a/drivers/clk/qcom/mmcc-msm8994.c b/drivers/clk/qcom/mmcc-msm8994.c
index f19080cf715b..78e5083eaf0f 100644
--- a/drivers/clk/qcom/mmcc-msm8994.c
+++ b/drivers/clk/qcom/mmcc-msm8994.c
@@ -2602,7 +2602,7 @@ static int mmcc_msm8994_probe(struct platform_device *pdev)
 	clk_alpha_pll_configure(&mmpll3_early, regmap, &mmpll_p_config);
 	clk_alpha_pll_configure(&mmpll5_early, regmap, &mmpll_p_config);
 
-	return qcom_cc_really_probe(pdev, &mmcc_msm8994_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &mmcc_msm8994_desc, regmap);
 }
 
 static struct platform_driver mmcc_msm8994_driver = {
diff --git a/drivers/clk/qcom/mmcc-msm8996.c b/drivers/clk/qcom/mmcc-msm8996.c
index 92287d40c3a5..1a32c6eb8217 100644
--- a/drivers/clk/qcom/mmcc-msm8996.c
+++ b/drivers/clk/qcom/mmcc-msm8996.c
@@ -3626,7 +3626,7 @@ static int mmcc_msm8996_probe(struct platform_device *pdev)
 	/* Disable the NoC FSM for mmss_mmagic_cfg_ahb_clk */
 	regmap_update_bits(regmap, 0x5054, BIT(15), 0);
 
-	return qcom_cc_really_probe(pdev, &mmcc_msm8996_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &mmcc_msm8996_desc, regmap);
 }
 
 static struct platform_driver mmcc_msm8996_driver = {
diff --git a/drivers/clk/qcom/mmcc-msm8998.c b/drivers/clk/qcom/mmcc-msm8998.c
index 275fb3b71ede..5738445a8656 100644
--- a/drivers/clk/qcom/mmcc-msm8998.c
+++ b/drivers/clk/qcom/mmcc-msm8998.c
@@ -2866,7 +2866,7 @@ static int mmcc_msm8998_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	return qcom_cc_really_probe(pdev, &mmcc_msm8998_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &mmcc_msm8998_desc, regmap);
 }
 
 static struct platform_driver mmcc_msm8998_driver = {
diff --git a/drivers/clk/qcom/mmcc-sdm660.c b/drivers/clk/qcom/mmcc-sdm660.c
index 4b8380c2d648..98ba5b4518fb 100644
--- a/drivers/clk/qcom/mmcc-sdm660.c
+++ b/drivers/clk/qcom/mmcc-sdm660.c
@@ -2847,7 +2847,7 @@ static int mmcc_660_probe(struct platform_device *pdev)
 	clk_alpha_pll_configure(&mmpll8, regmap, &mmpll8_config);
 	clk_alpha_pll_configure(&mmpll10, regmap, &mmpll10_config);
 
-	return qcom_cc_really_probe(pdev, &mmcc_660_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &mmcc_660_desc, regmap);
 }
 
 static struct platform_driver mmcc_660_driver = {
diff --git a/drivers/clk/qcom/tcsrcc-sm8550.c b/drivers/clk/qcom/tcsrcc-sm8550.c
index 552a3eb1fd91..e5e8f2e82b94 100644
--- a/drivers/clk/qcom/tcsrcc-sm8550.c
+++ b/drivers/clk/qcom/tcsrcc-sm8550.c
@@ -166,7 +166,7 @@ static int tcsr_cc_sm8550_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	return qcom_cc_really_probe(pdev, &tcsr_cc_sm8550_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &tcsr_cc_sm8550_desc, regmap);
 }
 
 static struct platform_driver tcsr_cc_sm8550_driver = {
diff --git a/drivers/clk/qcom/videocc-sc7180.c b/drivers/clk/qcom/videocc-sc7180.c
index ae0f812f83e8..d7f845480396 100644
--- a/drivers/clk/qcom/videocc-sc7180.c
+++ b/drivers/clk/qcom/videocc-sc7180.c
@@ -226,7 +226,7 @@ static int video_cc_sc7180_probe(struct platform_device *pdev)
 	/* Keep VIDEO_CC_XO_CLK ALWAYS-ON */
 	regmap_update_bits(regmap, 0x984, 0x1, 0x1);
 
-	return qcom_cc_really_probe(pdev, &video_cc_sc7180_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &video_cc_sc7180_desc, regmap);
 }
 
 static struct platform_driver video_cc_sc7180_driver = {
diff --git a/drivers/clk/qcom/videocc-sc7280.c b/drivers/clk/qcom/videocc-sc7280.c
index 119a3ed6eb6a..317b325d6daf 100644
--- a/drivers/clk/qcom/videocc-sc7280.c
+++ b/drivers/clk/qcom/videocc-sc7280.c
@@ -305,7 +305,7 @@ static int video_cc_sc7280_probe(struct platform_device *pdev)
 
 	clk_lucid_pll_configure(&video_pll0, regmap, &video_pll0_config);
 
-	return qcom_cc_really_probe(pdev, &video_cc_sc7280_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &video_cc_sc7280_desc, regmap);
 }
 
 static struct platform_driver video_cc_sc7280_driver = {
diff --git a/drivers/clk/qcom/videocc-sdm845.c b/drivers/clk/qcom/videocc-sdm845.c
index 80095a283a86..f77a07779477 100644
--- a/drivers/clk/qcom/videocc-sdm845.c
+++ b/drivers/clk/qcom/videocc-sdm845.c
@@ -329,7 +329,7 @@ static int video_cc_sdm845_probe(struct platform_device *pdev)
 
 	clk_fabia_pll_configure(&video_pll0, regmap, &video_pll0_config);
 
-	return qcom_cc_really_probe(pdev, &video_cc_sdm845_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &video_cc_sdm845_desc, regmap);
 }
 
 static struct platform_driver video_cc_sdm845_driver = {
diff --git a/drivers/clk/qcom/videocc-sm7150.c b/drivers/clk/qcom/videocc-sm7150.c
index 64f6b03996fc..14ef7f561753 100644
--- a/drivers/clk/qcom/videocc-sm7150.c
+++ b/drivers/clk/qcom/videocc-sm7150.c
@@ -341,7 +341,7 @@ static int videocc_sm7150_probe(struct platform_device *pdev)
 	/* Keep some clocks always-on */
 	qcom_branch_set_clk_en(regmap, 0x984); /* VIDEOCC_XO_CLK */
 
-	return qcom_cc_really_probe(pdev, &videocc_sm7150_desc, regmap);
+	return qcom_cc_really_probe(&pdev->dev, &videocc_sm7150_desc, regmap);
 }
 
 static struct platform_driver videocc_sm7150_driver = {
diff --git a/drivers/clk/qcom/videocc-sm8150.c b/drivers/clk/qcom/videocc-sm8150.c
index 554631aa279b..daab3237eec1 100644
--- a/drivers/clk/qcom/videocc-sm8150.c
+++ b/drivers/clk/qcom/videocc-sm8150.c
@@ -262,7 +262,7 @@ static int video_cc_sm8150_probe(struct platform_device *pdev)
 	/* Keep VIDEO_CC_XO_CLK ALWAYS-ON */
 	regmap_update_bits(regmap, 0x984, 0x1, 0x1);
 
-	ret = qcom_cc_really_probe(pdev, &video_cc_sm8150_desc, regmap);
+	ret = qcom_cc_really_probe(&pdev->dev, &video_cc_sm8150_desc, regmap);
 
 	pm_runtime_put_sync(&pdev->dev);
 
diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
index 914eddd0ae15..d7e0c32284c1 100644
--- a/drivers/clk/qcom/videocc-sm8250.c
+++ b/drivers/clk/qcom/videocc-sm8250.c
@@ -387,7 +387,7 @@ static int video_cc_sm8250_probe(struct platform_device *pdev)
 	qcom_branch_set_clk_en(regmap, 0xe58); /* VIDEO_CC_AHB_CLK */
 	qcom_branch_set_clk_en(regmap, 0xeec); /* VIDEO_CC_XO_CLK */
 
-	ret = qcom_cc_really_probe(pdev, &video_cc_sm8250_desc, regmap);
+	ret = qcom_cc_really_probe(&pdev->dev, &video_cc_sm8250_desc, regmap);
 
 	pm_runtime_put(&pdev->dev);
 
diff --git a/drivers/clk/qcom/videocc-sm8350.c b/drivers/clk/qcom/videocc-sm8350.c
index f7aec28d4c87..5bd6fe3e1298 100644
--- a/drivers/clk/qcom/videocc-sm8350.c
+++ b/drivers/clk/qcom/videocc-sm8350.c
@@ -562,7 +562,7 @@ static int video_cc_sm8350_probe(struct platform_device *pdev)
 	qcom_branch_set_clk_en(regmap, 0xe58); /* VIDEO_CC_AHB_CLK */
 	qcom_branch_set_clk_en(regmap, video_cc_xo_clk_cbcr); /* VIDEO_CC_XO_CLK */
 
-	ret = qcom_cc_really_probe(pdev, &video_cc_sm8350_desc, regmap);
+	ret = qcom_cc_really_probe(&pdev->dev, &video_cc_sm8350_desc, regmap);
 	pm_runtime_put(&pdev->dev);
 
 	return ret;
diff --git a/drivers/clk/qcom/videocc-sm8450.c b/drivers/clk/qcom/videocc-sm8450.c
index 67df40f16423..ed9163d64244 100644
--- a/drivers/clk/qcom/videocc-sm8450.c
+++ b/drivers/clk/qcom/videocc-sm8450.c
@@ -428,7 +428,7 @@ static int video_cc_sm8450_probe(struct platform_device *pdev)
 	qcom_branch_set_clk_en(regmap, 0x8130); /* VIDEO_CC_SLEEP_CLK */
 	qcom_branch_set_clk_en(regmap, 0x8114); /* VIDEO_CC_XO_CLK */
 
-	ret = qcom_cc_really_probe(pdev, &video_cc_sm8450_desc, regmap);
+	ret = qcom_cc_really_probe(&pdev->dev, &video_cc_sm8450_desc, regmap);
 
 	pm_runtime_put(&pdev->dev);
 
diff --git a/drivers/clk/qcom/videocc-sm8550.c b/drivers/clk/qcom/videocc-sm8550.c
index d73f747d2474..4d36362db1d0 100644
--- a/drivers/clk/qcom/videocc-sm8550.c
+++ b/drivers/clk/qcom/videocc-sm8550.c
@@ -433,7 +433,7 @@ static int video_cc_sm8550_probe(struct platform_device *pdev)
 	qcom_branch_set_clk_en(regmap, 0x8140); /* VIDEO_CC_SLEEP_CLK */
 	qcom_branch_set_clk_en(regmap, 0x8124); /* VIDEO_CC_XO_CLK */
 
-	ret = qcom_cc_really_probe(pdev, &video_cc_sm8550_desc, regmap);
+	ret = qcom_cc_really_probe(&pdev->dev, &video_cc_sm8550_desc, regmap);
 
 	pm_runtime_put(&pdev->dev);
 
-- 
2.34.1


