Return-Path: <linux-arm-msm+bounces-32263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E8B984326
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 12:08:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A32CB1C22719
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 10:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E73BD176242;
	Tue, 24 Sep 2024 10:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Y5M2m0xB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714F11741E8;
	Tue, 24 Sep 2024 10:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727172490; cv=none; b=NABupza5OWTaRjanqAl/HzkhL+kbHa3f8D2evZAdgbS7EYknN0re46x4rCHm2BeEUXS0ObHn64MI28SFrLp3X26pVS19cD0wIGJQjWLKb/KyumwYGCN3R7UYS3f016hhJs4z0BlKhThzmURwE9+FevwJOLJrRyDoOc6WNQfWYDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727172490; c=relaxed/simple;
	bh=M82rVUbBl7UcdLq4bwSBA0W24f2OkRmxnyIcRAb+/cM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=AJ66QAB/xMLsDBFj/QQFDJKRqsDh/lRdovjGowO5ssCI42YLBSkyYCtUhrU5CZ7vqR2L1XUvPqhFITWaHr4dcA6sELZUQ2MGeLhx2kaGc7b4cWrFs3NVUp4aPay1VO7f8wuK5gXHbOJNjJWzcDLdz1zI3EjfRD6i5/AlgpUnS84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Y5M2m0xB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48O9Cg7d009631;
	Tue, 24 Sep 2024 10:08:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sFnfXJUtf6d5DWHw5i6MiTOzelEImSYe1UluwOn3G+Y=; b=Y5M2m0xBKjJS7/Sn
	aBTRyS8PzZxeZCJF0hf/M4ykB+Bdx0OsWAsyNFlXLTjSZuS6cpR1NtC7PWT3IaGQ
	foEa7gKBLMXeUrzEO/NiWBBCYxH6ztSsb6/6LQ6Zf1Q74C95O9QyR2xbj6Z9LEvY
	QfSv8SJ3SWinu60AxH4ZprM+w+wJbO/qPXqcBZuPT4a9MR/2IlddybZVEhsLSJCC
	7VAwOPlP5V/zKvDRxI7VTEu0HJlkQPfuiy7kumUAlwxNElLSBIeki7HLjEN0xK5Y
	a814HY0qC640ZFERAjQVZQG6Ie1K3n8wlT9xpYOyhxro7Ai7oK5tYg4aUt6g9uE5
	ZdHNQg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sqe97x1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 10:08:07 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48OA86Gd004750
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 10:08:06 GMT
Received: from songxue-gv.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 24 Sep 2024 03:08:01 -0700
From: Song Xue <quic_songxue@quicinc.com>
Date: Tue, 24 Sep 2024 18:07:12 +0800
Subject: [PATCH 2/2] soc: qcom: llcc: Add configuration data for QCS615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240924-add_llcc_support_for_qcs615-v1-2-a9f3289760d3@quicinc.com>
References: <20240924-add_llcc_support_for_qcs615-v1-0-a9f3289760d3@quicinc.com>
In-Reply-To: <20240924-add_llcc_support_for_qcs615-v1-0-a9f3289760d3@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Song Xue
	<quic_songxue@quicinc.com>
X-Mailer: b4 0.15-dev-88a27
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727172476; l=2298;
 i=quic_songxue@quicinc.com; s=20240911; h=from:subject:message-id;
 bh=M82rVUbBl7UcdLq4bwSBA0W24f2OkRmxnyIcRAb+/cM=;
 b=Xhtf7CZGk5jCKZ9C19IDZyM8QeuHRNRemIE1r1GHOxv9g+gy7c+GVKB01V5SwaQZR28Ed4Y8T
 koCvh5LhBk7C84LjoaJ10Yx/kjlrfn2XD41HmmjUJevkGM+8RdVBYRe
X-Developer-Key: i=quic_songxue@quicinc.com; a=ed25519;
 pk=Z6tjs+BBbyg1kYqhBq0EfW2Pl/yZdOPXutG9TOVA1yc=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: a6r_wLm9eoTntWpGikPb-mTzW75ewB-T
X-Proofpoint-GUID: a6r_wLm9eoTntWpGikPb-mTzW75ewB-T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240071

Add LLCC configuration support for the QCS615 platform.

Signed-off-by: Song Xue <quic_songxue@quicinc.com>
---
 drivers/soc/qcom/llcc-qcom.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 8fa4ffd3a9b5921d95c20648048dcdfa20dde5db..11507eb3efff101e4f330e7f4282a31aa172369d 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -151,6 +151,13 @@ enum llcc_reg_offset {
 	LLCC_COMMON_STATUS0,
 };
 
+static const struct llcc_slice_config qcs615_data[] =  {
+	{ LLCC_CPUSS,    1,  128, 1, 0, 0xF, 0x0, 0, 0, 0, 0, 1, 1 },
+	{ LLCC_MDM,      8,  256, 0, 1, 0xF, 0x0, 0, 0, 0, 0, 1, 0 },
+	{ LLCC_GPUHTW,   11, 128, 1, 1, 0xF, 0x0, 0, 0, 0, 0, 1, 0 },
+	{ LLCC_GPU,      12, 128, 1, 0, 0xF, 0x0, 0, 0, 0, 0, 1, 0 },
+};
+
 static const struct llcc_slice_config sa8775p_data[] =  {
 	{LLCC_CPUSS,    1, 2048, 1, 0, 0x00FF, 0x0, 0, 0, 0, 1, 1, 0, 0},
 	{LLCC_VIDSC0,   2, 512, 3, 1, 0x00FF, 0x0, 0, 0, 0, 1, 0, 0, 0},
@@ -539,6 +546,16 @@ static const u32 llcc_v2_1_reg_offset[] = {
 	[LLCC_COMMON_STATUS0]	= 0x0003400c,
 };
 
+static const struct qcom_llcc_config qcs615_cfg[] = {
+	{
+		.sct_data	= qcs615_data,
+		.size		= ARRAY_SIZE(qcs615_data),
+		.need_llcc_cfg	= true,
+		.reg_offset	= llcc_v1_reg_offset,
+		.edac_reg_offset = &llcc_v1_edac_reg_offset,
+	},
+};
+
 static const struct qcom_llcc_config qdu1000_cfg[] = {
 	{
 		.sct_data       = qdu1000_data_8ch,
@@ -721,6 +738,11 @@ static const struct qcom_llcc_config x1e80100_cfg[] = {
 	},
 };
 
+static const struct qcom_sct_config qcs615_cfgs = {
+	.llcc_config	= qcs615_cfg,
+	.num_config	= ARRAY_SIZE(qcs615_cfg),
+};
+
 static const struct qcom_sct_config qdu1000_cfgs = {
 	.llcc_config	= qdu1000_cfg,
 	.num_config	= ARRAY_SIZE(qdu1000_cfg),
@@ -1375,6 +1397,7 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_llcc_of_match[] = {
+	{ .compatible = "qcom,qcs615-llcc", .data = &qcs615_cfgs },
 	{ .compatible = "qcom,qdu1000-llcc", .data = &qdu1000_cfgs},
 	{ .compatible = "qcom,sa8775p-llcc", .data = &sa8775p_cfgs },
 	{ .compatible = "qcom,sc7180-llcc", .data = &sc7180_cfgs },

-- 
2.25.1


