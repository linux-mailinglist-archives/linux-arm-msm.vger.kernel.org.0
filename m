Return-Path: <linux-arm-msm+bounces-23573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F310B912464
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 13:49:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9109286CF4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 11:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 660AC176AC0;
	Fri, 21 Jun 2024 11:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bLZT9Zgr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6405176257;
	Fri, 21 Jun 2024 11:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718970489; cv=none; b=ktsxo0SBWfFXnEf8SrM96Vy69RXbDjwNzW2OcqluKxNYc1OetJVlalUZDyfA65XFJYG03h3/Uw6+pCukbSj4pr/l1k0A8KD0y0b0OZytU15LPc+/sUOfqS/N4tih1OCYlV+v/YHThNYsSEQEqxWLPr+31r3GgfSH+VMAaplpmuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718970489; c=relaxed/simple;
	bh=ygbFLeS48MFXuzmbuE8IrfD+K0cdCC1gPEzCAqoVfwc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wt716KMOni/0XZcdBAmlOEPtup7mX/UrAFz6ptSqlTaU/WKw+b/mhHXa6JWziXq6wdy/u8/YZ2UMvQgQnf1vQiX3L2zvnFvbQ/UA0Zc6Ornn5NXDFZcxfcwKYY1wXcFi1XFC7vcrAFZLX4RG1hoX80uIj9uU0VIoCTs75p0KDrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bLZT9Zgr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45L8i3oK021483;
	Fri, 21 Jun 2024 11:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wq1n9gyIzwAxVaQciP3YbNps3VVpeSllnFziyOsGGH4=; b=bLZT9ZgrbXN7EauK
	5E9rdjKKlYyw7bo90LvGTAf29Jac9VrPfDdM9w3knFm3o5YDsOr2wZNS8wJ5l6gH
	0ztbpFVJKpUfMDfylMuWbcbVP7QKzRk4UhNOmt+QJkmpv1hwr40hKSxnmn+pW4PI
	yt5VLr8V1E6dT4MZhDvQ4UzzUHTEmCxNpxXk9RWVi6P6rhWmXksc1v5kacUs8LpQ
	G9UfXp2WWYqMBf+5xOL2+TlIqAvwfiiw9NYoUWxFSwN5TS96OxeUBVrXld3kZAA5
	ayqdSk+N3xgwDdYYryXym8kt2cGVbewEWj1MUobc2nDxxn2SoCXj5Mcgn8GfiEFi
	H3XjyA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yw6920dwc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 11:47:27 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45LBlQYg030961
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 11:47:26 GMT
Received: from hu-gokulsri-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 21 Jun 2024 04:47:21 -0700
From: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
To: <sboyd@kernel.org>, <andersson@kernel.org>, <bjorn.andersson@linaro.org>,
        <david.brown@linaro.org>, <devicetree@vger.kernel.org>,
        <jassisinghbrar@gmail.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <mark.rutland@arm.com>,
        <mturquette@baylibre.com>, <ohad@wizery.com>, <robh@kernel.org>,
        <sricharan@codeaurora.org>
CC: <gokulsri@codeaurora.org>
Subject: [PATCH v9 1/8] remoteproc: qcom: Add PRNG proxy clock
Date: Fri, 21 Jun 2024 17:16:52 +0530
Message-ID: <20240621114659.2958170-2-quic_gokulsri@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621114659.2958170-1-quic_gokulsri@quicinc.com>
References: <20240621114659.2958170-1-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YJitBBiyyeJyZzxF1B5pcXmbbpEku6zu
X-Proofpoint-GUID: YJitBBiyyeJyZzxF1B5pcXmbbpEku6zu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_04,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 mlxscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406210087

PRNG clock is needed by the secure PIL, support for the same
is added in subsequent patches.

Signed-off-by: Nikhil Prakash V <quic_nprakash@quicinc.com>
Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 65 +++++++++++++++++++++--------
 1 file changed, 47 insertions(+), 18 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 94f68c919ee6..366b19cbd994 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -91,19 +91,6 @@ enum {
 	WCSS_QCS404,
 };
 
-struct wcss_data {
-	const char *firmware_name;
-	unsigned int crash_reason_smem;
-	u32 version;
-	bool aon_reset_required;
-	bool wcss_q6_reset_required;
-	const char *ssr_name;
-	const char *sysmon_name;
-	int ssctl_id;
-	const struct rproc_ops *ops;
-	bool requires_force_stop;
-};
-
 struct q6v5_wcss {
 	struct device *dev;
 
@@ -128,6 +115,7 @@ struct q6v5_wcss {
 	struct clk *qdsp6ss_xo_cbcr;
 	struct clk *qdsp6ss_core_gfmux;
 	struct clk *lcc_bcr_sleep;
+	struct clk *prng_clk;
 	struct regulator *cx_supply;
 	struct qcom_sysmon *sysmon;
 
@@ -151,6 +139,21 @@ struct q6v5_wcss {
 	struct qcom_rproc_ssr ssr_subdev;
 };
 
+struct wcss_data {
+	int (*init_clock)(struct q6v5_wcss *wcss);
+	int (*init_regulator)(struct q6v5_wcss *wcss);
+	const char *firmware_name;
+	unsigned int crash_reason_smem;
+	u32 version;
+	bool aon_reset_required;
+	bool wcss_q6_reset_required;
+	const char *ssr_name;
+	const char *sysmon_name;
+	int ssctl_id;
+	const struct rproc_ops *ops;
+	bool requires_force_stop;
+};
+
 static int q6v5_wcss_reset(struct q6v5_wcss *wcss)
 {
 	int ret;
@@ -240,6 +243,12 @@ static int q6v5_wcss_start(struct rproc *rproc)
 	struct q6v5_wcss *wcss = rproc->priv;
 	int ret;
 
+	ret = clk_prepare_enable(wcss->prng_clk);
+	if (ret) {
+		dev_err(wcss->dev, "prng clock enable failed\n");
+		return ret;
+	}
+
 	qcom_q6v5_prepare(&wcss->q6v5);
 
 	/* Release Q6 and WCSS reset */
@@ -733,6 +742,7 @@ static int q6v5_wcss_stop(struct rproc *rproc)
 			return ret;
 	}
 
+	clk_disable_unprepare(wcss->prng_clk);
 	qcom_q6v5_unprepare(&wcss->q6v5);
 
 	return 0;
@@ -899,7 +909,21 @@ static int q6v5_alloc_memory_region(struct q6v5_wcss *wcss)
 	return 0;
 }
 
-static int q6v5_wcss_init_clock(struct q6v5_wcss *wcss)
+static int ipq8074_init_clock(struct q6v5_wcss *wcss)
+{
+	int ret;
+
+	wcss->prng_clk = devm_clk_get(wcss->dev, "prng");
+	if (IS_ERR(wcss->prng_clk)) {
+		ret = PTR_ERR(wcss->prng_clk);
+		if (ret != -EPROBE_DEFER)
+			dev_err(wcss->dev, "Failed to get prng clock\n");
+		return ret;
+	}
+	return 0;
+}
+
+static int qcs404_init_clock(struct q6v5_wcss *wcss)
 {
 	int ret;
 
@@ -989,7 +1013,7 @@ static int q6v5_wcss_init_clock(struct q6v5_wcss *wcss)
 	return 0;
 }
 
-static int q6v5_wcss_init_regulator(struct q6v5_wcss *wcss)
+static int qcs404_init_regulator(struct q6v5_wcss *wcss)
 {
 	wcss->cx_supply = devm_regulator_get(wcss->dev, "cx");
 	if (IS_ERR(wcss->cx_supply))
@@ -1033,12 +1057,14 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	if (wcss->version == WCSS_QCS404) {
-		ret = q6v5_wcss_init_clock(wcss);
+	if (desc->init_clock) {
+		ret = desc->init_clock(wcss);
 		if (ret)
 			return ret;
+	}
 
-		ret = q6v5_wcss_init_regulator(wcss);
+	if (desc->init_regulator) {
+		ret = desc->init_regulator(wcss);
 		if (ret)
 			return ret;
 	}
@@ -1078,6 +1104,7 @@ static void q6v5_wcss_remove(struct platform_device *pdev)
 }
 
 static const struct wcss_data wcss_ipq8074_res_init = {
+	.init_clock = ipq8074_init_clock,
 	.firmware_name = "IPQ8074/q6_fw.mdt",
 	.crash_reason_smem = WCSS_CRASH_REASON,
 	.aon_reset_required = true,
@@ -1087,6 +1114,8 @@ static const struct wcss_data wcss_ipq8074_res_init = {
 };
 
 static const struct wcss_data wcss_qcs404_res_init = {
+	.init_clock = qcs404_init_clock,
+	.init_regulator = qcs404_init_regulator,
 	.crash_reason_smem = WCSS_CRASH_REASON,
 	.firmware_name = "wcnss.mdt",
 	.version = WCSS_QCS404,
-- 
2.34.1


