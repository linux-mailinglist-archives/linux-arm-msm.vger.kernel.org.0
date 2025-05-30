Return-Path: <linux-arm-msm+bounces-59894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 82139AC8FE5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 15:22:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E8C47A4140
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 13:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F44622DF9A;
	Fri, 30 May 2025 13:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BFGZ48XN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC6922DFA8;
	Fri, 30 May 2025 13:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748611297; cv=none; b=P7xoDudVquCJzP1ejoJP34z/HqARJYRFkGBlpotHypVaTegETD/wD4xiWDBcLJxKzy0zB2YWf3E+1MsYcvz05SwzSjzc+oXef8lywEw0ekXAZUGHHarpVkmlIKYj7pg6Dw/NLXIBk96oGWIJnU3l/UTK93xPCMO1JJWk/68jDWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748611297; c=relaxed/simple;
	bh=GICsiLwtYvu3vKq2zXF+7LF2O+jp9G56rqGxLZu0Pfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=O5cZ/4WSX8iTmfEX0sAx9J4VQ9r8kzAJZ87C/ofpcvvcelI6u/gqwlyrvML4nXKX3bkKX4OipFVyDvXVn7/WkwvAm88pKTUAH7byUMfvnN1xEv5Y9SBPvxTNpCUk7b4HA8vlIN5zYih5HzX5wVfRkJmZuxw8oxW7vX7MQnXRhPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BFGZ48XN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UB0Qo4006915;
	Fri, 30 May 2025 13:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ayDEDmtNoXelIlI/WBllE9+l7UojMxVKCZ0mV8SGS0g=; b=BFGZ48XN+tz8BMsH
	h6VZsJKc+CcB9K6RslSdAGikorqgMFeBSPa5dQ+c8CwkJCK1ssGfGsi3CzexN+5d
	Zs6ySIyogUtaVlJBMMZLL9isFcfDynNXqqDjBDvk4YfXCtLb2BHxggEo7zbzIVaq
	lc68EV0plkDKuehgEErzsvugXtOmR4YaOzJe2hNxWsvr0PQGVJmjgZ+fKHZIP+2n
	YD0Z9jLDFqianxllGyboYxovheUy5y1f3BiBk0v/lvnwt6HZWyVDXYJjjmWfRkdg
	2k5mieeuwPIwjVKQDZo1H9I1SHQhAfhfxCzyxt6j6gtPqcBuNKGdw63sQo+bjeqn
	/PLKsA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fqhaj5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 13:21:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54UDLUT3031371
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 13:21:30 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 30 May
 2025 06:21:24 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Fri, 30 May 2025 18:50:50 +0530
Subject: [PATCH v5 05/18] clk: qcom: common: Handle runtime power
 management in qcom_cc_really_probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250530-videocc-pll-multi-pd-voting-v5-5-02303b3a582d@quicinc.com>
References: <20250530-videocc-pll-multi-pd-voting-v5-0-02303b3a582d@quicinc.com>
In-Reply-To: <20250530-videocc-pll-multi-pd-voting-v5-0-02303b3a582d@quicinc.com>
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
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yD7yOlpCN-L8jg-mwplQONHc6Yt3ZCXz
X-Proofpoint-ORIG-GUID: yD7yOlpCN-L8jg-mwplQONHc6Yt3ZCXz
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=6839b0db cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EY_aa_sejuBYboou7r8A:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDExNiBTYWx0ZWRfX8kLPQN+M6i6F
 5uFA/CH6/GhghyC/vz4PGlwsZMZaWEka13O3cx+cyXTeLUJ0eG39q1CoasWuCXfxjExAP8dZyux
 Rpgx9n1hJJIwU96NCWzYDrggyQkof8ovNUFh9xpnUhiOcjVF4gEU92BJy61sNajz7epL3G9MX8m
 v6tZVPMXhoY/zXpxA0asLEoK+D6H1ZA0YQUAYIESlkpazOAjdy6drOr5Ai/yRrr6hVqgxcWl6A4
 6GLUc0mkMWZEagAslBJw9DfGsYk8Rq5OQfzETSHV1wyfHnWs+1Li7Z7nc883RKYr1HtVCOdLeuI
 z661BcKLeKY1DCEa1hqye3G0kKMwRFfqgp7ivHy44a5y6+dzGESYxymB8M93jskdPi/gViu73Vx
 qN9kTbb0MD07aCY4L+oFnwaAdfvVjo7oTstpPCh/HYq4JLH54lpbvWQe5dRKz0u/vwDidlzx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_05,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505300116

Add support for runtime power management in qcom_cc_really_probe() to
commonize it across all the clock controllers. The runtime power management
is not required for all clock controllers, hence handle the rpm based on
use_rpm flag in clock controller descriptor.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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


