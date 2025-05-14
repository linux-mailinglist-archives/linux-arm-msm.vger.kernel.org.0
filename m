Return-Path: <linux-arm-msm+bounces-57953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1EBAB7542
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:10:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30C491BA5A09
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D74BE28F518;
	Wed, 14 May 2025 19:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ei4how3U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1571228D857;
	Wed, 14 May 2025 19:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747249790; cv=none; b=n4+FtQazh6TxAGZi9dw5hNhCpY1zCoAumfAebQLM5M2wTur9RtsUsc3/DI38l/COkMNOadyTnSg/sKXiKq6lrFUtOod3yIWR+MtBqiPGt69hgjV2ubgjsVbVPJZQ03qc21pUQGLjCP9bGfqO4zp9i+7lB9+PqoZLXUiUZS5XzFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747249790; c=relaxed/simple;
	bh=b8JsRzUGzQRW3QHy5bOXQyarOcnyX708oehuWtDL1C4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=VTGNSoi53yxdZX/q7LCgQ7YSGvCkU9BKMUBekXjTgAmQbVgyJ7CorpMQzsVF0TavBXwCZU6x/K2XGI13sTi3+oyikX3pBtx4P1Idc/NV53grEUofhm6Nb6bvIU/4NxnsKwAT7x5yJGhK8CMjuaUxFZ+0Lt1/cQEcNPgNeGlbDx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ei4how3U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuvei015135;
	Wed, 14 May 2025 19:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8G09x5lPUXFbjiAUUYms7RYiSBTg286zfgAkBtb2zyk=; b=ei4how3UwUGBz2fg
	IewxzX1zSwrX8dKbzbUNz5utp1yawNXJK+RGNYNYRKJYvHLl7aQCrvwboIZ87Eho
	GCzSBjBUcHfQMT3QyyG7lCm+EkyeK+AEoZFO4h/UYMNg21cmA3l4/fM1D7YLiiwP
	x6R0MewMYuAbhjD/RXKjQoFQE5QRplmD40PwD/4ErS7BxkJa3jbE8KwVGwVhbvo7
	juyM/dIml0M+CBmYcbFeKMr2ec/xCQ5Xvruemdo3NmNJcjiol3A9f2usoDn4mhVg
	8WtQFQom7hKqR/xZzmWFjMIIqWRsTS0liPa1CImWfb9VB8mQ7IAQBsEYcP+vPhR+
	WwR/dA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr3q33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 19:09:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54EJ9hwZ028036
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 19:09:43 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 May
 2025 12:09:37 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Thu, 15 May 2025 00:38:50 +0530
Subject: [PATCH v4 05/18] clk: qcom: common: Handle runtime power
 management in qcom_cc_really_probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250515-videocc-pll-multi-pd-voting-v4-5-571c63297d01@quicinc.com>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Vladimir
 Zapolskiy" <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov
	<lumag@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rIYZ6fEwAuWGbC1LAnMRuEVJ9mqLYWmc
X-Authority-Analysis: v=2.4 cv=Auju3P9P c=1 sm=1 tr=0 ts=6824ea78 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=EY_aa_sejuBYboou7r8A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: rIYZ6fEwAuWGbC1LAnMRuEVJ9mqLYWmc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3MyBTYWx0ZWRfX/Jbt8WPS1j5r
 yrxmRfbBLeS9BIFRjhao1kBl5aZN9U+DVdDeVP2+j31laD+IIZe8ZZoIFtG66fAocxqWqHk957M
 Jtk8YgG1fRQtp+nNUp1nzawI3gaF1P1WpZQ1zDSsos4LPTc1Dlk7SS1O6JgeqogEdXxtYT+h8qv
 TPPSvwWdUKGq2UA6LUbPNYzS4Dtgd/+QEJxk1ehJ/8viKRy5MkhPJBNFn/gT6j0/ukaBWKzAZuG
 F+oUz+1tPVqz1dJOJ9BCaWgy5oYoYpomSQb9M1ewyu8KRwrrS4zxr9BbGj38uLgVz8mO5T/WgsV
 dt+QJJN6wdDoPMOhI3DDaV3l4LJwm1Iuc2LfP4R3EW0X7Ik/HxTiztIQ8sMtwaW9d2x7URAg0MG
 KuiHAMxwT3SJF6j13aGgzKgqOztn1OkeuRlQagnutfO2E9xSZKTYh2G5m0ASXnWtZSIyPhTu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140173

Add support for runtime power management in qcom_cc_really_probe() to
commonize it across all the clock controllers. The runtime power management
is not required for all clock controllers, hence handle the rpm based on
use_rpm flag in clock controller descriptor.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
 drivers/clk/qcom/common.c | 37 ++++++++++++++++++++++++++++---------
 drivers/clk/qcom/common.h |  1 +
 2 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 9e3380fd718198c9fe63d7361615a91c3ecb3d60..9cbf1c5296dad3ee5477a2f5a445488707663b9d 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -9,6 +9,7 @@
 #include <linux/platform_device.h>
 #include <linux/clk-provider.h>
 #include <linux/interconnect-clk.h>
+#include <linux/pm_runtime.h>
 #include <linux/reset-controller.h>
 #include <linux/of.h>
 
@@ -304,6 +305,16 @@ int qcom_cc_really_probe(struct device *dev,
 	if (ret < 0 && ret != -EEXIST)
 		return ret;
 
+	if (desc->use_rpm) {
+		ret = devm_pm_runtime_enable(dev);
+		if (ret)
+			return ret;
+
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret)
+			return ret;
+	}
+
 	reset = &cc->reset;
 	reset->rcdev.of_node = dev->of_node;
 	reset->rcdev.ops = &qcom_reset_ops;
@@ -314,23 +325,25 @@ int qcom_cc_really_probe(struct device *dev,
 
 	ret = devm_reset_controller_register(dev, &reset->rcdev);
 	if (ret)
-		return ret;
+		goto put_rpm;
 
 	if (desc->gdscs && desc->num_gdscs) {
 		scd = devm_kzalloc(dev, sizeof(*scd), GFP_KERNEL);
-		if (!scd)
-			return -ENOMEM;
+		if (!scd) {
+			ret = -ENOMEM;
+			goto put_rpm;
+		}
 		scd->dev = dev;
 		scd->scs = desc->gdscs;
 		scd->num = desc->num_gdscs;
 		scd->pd_list = cc->pd_list;
 		ret = gdsc_register(scd, &reset->rcdev, regmap);
 		if (ret)
-			return ret;
+			goto put_rpm;
 		ret = devm_add_action_or_reset(dev, qcom_cc_gdsc_unregister,
 					       scd);
 		if (ret)
-			return ret;
+			goto put_rpm;
 	}
 
 	cc->rclks = rclks;
@@ -341,7 +354,7 @@ int qcom_cc_really_probe(struct device *dev,
 	for (i = 0; i < num_clk_hws; i++) {
 		ret = devm_clk_hw_register(dev, clk_hws[i]);
 		if (ret)
-			return ret;
+			goto put_rpm;
 	}
 
 	for (i = 0; i < num_clks; i++) {
@@ -350,14 +363,20 @@ int qcom_cc_really_probe(struct device *dev,
 
 		ret = devm_clk_register_regmap(dev, rclks[i]);
 		if (ret)
-			return ret;
+			goto put_rpm;
 	}
 
 	ret = devm_of_clk_add_hw_provider(dev, qcom_cc_clk_hw_get, cc);
 	if (ret)
-		return ret;
+		goto put_rpm;
+
+	ret = qcom_cc_icc_register(dev, desc);
+
+put_rpm:
+	if (desc->use_rpm)
+		pm_runtime_put(dev);
 
-	return qcom_cc_icc_register(dev, desc);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(qcom_cc_really_probe);
 
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 7ace5d7f5836aa81431153ba92d8f14f2ffe8147..9c10bc8c197cd7dfa25ccd245763ad6acb081523 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -38,6 +38,7 @@ struct qcom_cc_desc {
 	const struct qcom_icc_hws_data *icc_hws;
 	size_t num_icc_hws;
 	unsigned int icc_first_node_id;
+	bool use_rpm;
 };
 
 /**

-- 
2.34.1


