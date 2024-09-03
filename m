Return-Path: <linux-arm-msm+bounces-30460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F0E969399
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 08:23:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD9BFB23629
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 06:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6D331D54EB;
	Tue,  3 Sep 2024 06:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Pq6J/mqk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFCC1D173A;
	Tue,  3 Sep 2024 06:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725344535; cv=none; b=Fpf/6vFfsRLUd18j/qwpEKkAzbE+4zlYb7/dX7G1xuk24Ius5c6Faq8br1x4IWONZ40MTd3Zf/6/QfiHH6dd0MFkVMoIN6abjgKvKTzuw+VGscGG5a39doKyurEX5RLKFNF404UJJ1wD9L/e5FQH0G9oFZiRXlYfFyj+ffUu89Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725344535; c=relaxed/simple;
	bh=4ooSc8z/Zvu2qO49BvsP6kwomtfPjPo44k1t2bUTWEo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=OsIrD8To0WjS+QJT5usaBPR6NUMwxGulgSp/UuyFLcMDEoF1o+DtN7jUmWLzm7b4JtSGSRCoRuzM3YZkMCiWKHO/QPWY+Y7BXBG7hkuHwyVQ1WD+y/6SHkuEdSQ4a0y0FG9pIuLA1eZ/rDy2kvlW38bELRhy13RwdfbzXt/0uQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Pq6J/mqk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 482Lr3gu003208;
	Tue, 3 Sep 2024 06:22:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2racNi40TWyVqqJAsL9ChJG+TC3NC2eAEmxYTq1I4D4=; b=Pq6J/mqkW8W5Zc5G
	X6LUxnaEiDGbNftmMIhDH9htVUvUAIhlYJSPG3aQ8vWuK0f8dSm8hgOlHO8rq+Hz
	XrNrabhBIlbs/mja4sCoShJDRQQHziz4Su0Bj0q2NNN8xfl51Jx1+FPLjpyFAELo
	Rb5eW9boOjJIAyQmGWYeLKQdUH+9PTmN8ENUIaT/Lf5BtUjMM3b/e9de9inlgs10
	b1tQNv7y1xR0ocI3F9+iscQwSnlaQTvDk736//wVRUdNWbRdBkNyqhWWYQAekIjk
	nSlr9qUCehU3+gv7i9udYbAMF5xfxWrPubEoUBEbV9fv4lePPfYTi9jV0cVrU6PQ
	OkR/5Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41buj6xb85-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 06:22:03 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4836M2Bd012927
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 06:22:02 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 2 Sep 2024 23:21:59 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
Date: Tue, 3 Sep 2024 14:21:32 +0800
Subject: [PATCH 4/4] soc: qcom: llcc: Add llcc configuration support for
 the QCS8300 platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240903-qcs8300_llcc_driver-v1-4-228659bdf067@quicinc.com>
References: <20240903-qcs8300_llcc_driver-v1-0-228659bdf067@quicinc.com>
In-Reply-To: <20240903-qcs8300_llcc_driver-v1-0-228659bdf067@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Jingyi Wang <quic_jingyw@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725344509; l=2447;
 i=quic_jingyw@quicinc.com; s=20240829; h=from:subject:message-id;
 bh=4ooSc8z/Zvu2qO49BvsP6kwomtfPjPo44k1t2bUTWEo=;
 b=RXW4iJwjHB57fgGFjGFrP4KdRbfPiuzvrQeNTeNXSA5YXAY/hN/GaELArqZLbkuNWvVnSLht2
 sNIBZ5Nw4qxB9i9S9zq5+rvCQ0MD806bdjDP2BkbBn0IVyIuYtVIgkU
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=3tHAHZsIl3cClXtU9HGR1okpPOs9Xyy1M0jzHw6A/qs=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -2viYQwGphrDFULQm9o_GJsOwfv1SlUo
X-Proofpoint-GUID: -2viYQwGphrDFULQm9o_GJsOwfv1SlUo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-02_06,2024-09-02_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 mlxlogscore=999 impostorscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2409030049

Add llcc configuration support for the QCS8300 platform.

Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
 drivers/soc/qcom/llcc-qcom.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 3fb45e625d82..571fb6045f25 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -422,6 +422,14 @@ static const struct llcc_slice_config sm8650_data[] = {
 	{LLCC_VIDVSP,   28,  256, 3, 1, 0xFFFFFF, 0x0,      0, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
 };
 
+static struct llcc_slice_config qcs8300_data[] =  {
+	{LLCC_GPUHTW,   11, 128, 1, 1, 0x00F, 0x0, 0, 0, 0, 1, 0, 0, 0},
+	{LLCC_GPU,      12, 512, 1, 1, 0x00F, 0x0, 0, 0, 0, 1, 0, 1, 0},
+	{LLCC_MMUHWT,   13, 128, 1, 1, 0x00F, 0x0, 0, 0, 0, 0, 1, 0, 0},
+	{LLCC_ECC,      26, 256, 3, 1, 0x00F, 0x0, 0, 0, 0, 0, 1, 0, 0},
+	{LLCC_WRCACHE,	31, 128, 1, 1, 0x00F, 0x0, 0, 0, 0, 0, 1, 0, 0},
+};
+
 static const struct llcc_slice_config qdu1000_data_2ch[] = {
 	{ LLCC_MDMHPGRW, 7, 512, 1, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0, 0 },
 	{ LLCC_MODHW,    9, 256, 1, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0, 0 },
@@ -539,6 +547,16 @@ static const u32 llcc_v2_1_reg_offset[] = {
 	[LLCC_COMMON_STATUS0]	= 0x0003400c,
 };
 
+static const struct qcom_llcc_config qcs8300_cfg[] = {
+	{
+		.sct_data	= qcs8300_data,
+		.size		= ARRAY_SIZE(qcs8300_data),
+		.need_llcc_cfg	= true,
+		.reg_offset	= llcc_v2_1_reg_offset,
+		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
+	},
+};
+
 static const struct qcom_llcc_config qdu1000_cfg[] = {
 	{
 		.sct_data       = qdu1000_data_8ch,
@@ -721,6 +739,11 @@ static const struct qcom_llcc_config x1e80100_cfg[] = {
 	},
 };
 
+static const struct qcom_sct_config qcs8300_cfgs = {
+	.llcc_config	= qcs8300_cfg,
+	.num_config	= ARRAY_SIZE(qcs8300_cfg),
+};
+
 static const struct qcom_sct_config qdu1000_cfgs = {
 	.llcc_config	= qdu1000_cfg,
 	.num_config	= ARRAY_SIZE(qdu1000_cfg),
@@ -1380,6 +1403,7 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_llcc_of_match[] = {
+	{ .compatible = "qcom,qcs8300-llcc", .data = &qcs8300_cfgs},
 	{ .compatible = "qcom,qdu1000-llcc", .data = &qdu1000_cfgs},
 	{ .compatible = "qcom,sa8775p-llcc", .data = &sa8775p_cfgs },
 	{ .compatible = "qcom,sc7180-llcc", .data = &sc7180_cfgs },

-- 
2.25.1


