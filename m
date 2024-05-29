Return-Path: <linux-arm-msm+bounces-20920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E25DA8D344A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 12:16:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57339B2269B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 10:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A2F617DE22;
	Wed, 29 May 2024 10:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="f1ManWd7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3AA17BB2F;
	Wed, 29 May 2024 10:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716977767; cv=none; b=kibb8eqfRofN4K/zurujdkbJ9JAzs3RDanm73Fg+Z9Y5jrG5jGeXAPnaFaalLmjhUMNAeRLgeBUeVa1WR8JoSQ2awQqENvkcbQOoXZc3bAkZLcH4xsXGARB7G1AhpAHgGQcWeCsWmFuIEuqKK54VUxdrjcSi508zJWUA19euLTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716977767; c=relaxed/simple;
	bh=vt66XCwuPa8bwPePqMyaFmKetrMf+SrA//BdM4hfEto=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h4KnyuUOxniF5DtkOry5pYkjpRRctFmeFot6PzhRIOridjd3RxXoxqOkoJN5ba+wtszM0kBZTHcAywdGLLjakfSc0kiS1lCe7nq2kxhND7gsZBC3LJnyJXSxK1YFbQct+nPp4QAhYGfmf532hXAZCwsPT1Z4k+mDq7Amxhnmu7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=f1ManWd7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44T4wxxj018858;
	Wed, 29 May 2024 10:16:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n2JjqOdf8t9u/34m0vQM1GNJ1s/4kQ7PdhzpU0y08w0=; b=f1ManWd7aFPFJD2i
	nT/8nTdxecxmaHr9eo0+F1WR1RYyV4KcfciSS+MLb2orFUZyswvHxNNgpwbVuMws
	maAKndQ1glHbdys4+u/jDdpHGJ5RKc/HUznoX9bXoHj5oRZeyE8GOf3J1SbuYuow
	SEs6fEr8E13iPwy0kbnIevAx/nLGUIAKJN3aj+3Gom1szN5XcwqcSFY/Vq7Y05EM
	OmSkVVEHmDpzRuh5a4UznvOQw/CYg2vgxH4lhqRgsBsk6iaUd41D79VmJKCUxd8G
	aagbdhxwzvLmVLTWFpqmhE6ZcVIGDOytqRSKvoGX9Sn84ZK2BoKQaQtGzTju4IbL
	+Lg6jQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ybadx8nv2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 10:16:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TAG0Uv009733
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 10:16:00 GMT
Received: from tengfan-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 29 May 2024 03:15:55 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
Subject: [PATCH 2/3] soc: qcom: llcc: Add llcc configuration support for the SA8775p platform
Date: Wed, 29 May 2024 18:15:33 +0800
Message-ID: <20240529101534.3166507-3-quic_tengfan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240529101534.3166507-1-quic_tengfan@quicinc.com>
References: <20240529101534.3166507-1-quic_tengfan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: L6sj-DSW9SAiffkQiQsFiJmg6dyBIMBn
X-Proofpoint-GUID: L6sj-DSW9SAiffkQiQsFiJmg6dyBIMBn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_06,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2405290068

Add llcc configuration support for the SA8775p platform.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 drivers/soc/qcom/llcc-qcom.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index cbef0dea1d5d..4379a5f8ddf3 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -150,6 +150,25 @@ enum llcc_reg_offset {
 	LLCC_COMMON_STATUS0,
 };
 
+static const struct llcc_slice_config sa8775p_data[] =  {
+	{LLCC_CPUSS,    1, 2048, 1, 0, 0x00FF, 0x0, 0, 0, 0, 1, 1, 0, 0},
+	{LLCC_VIDSC0,   2, 512, 3, 1, 0x00FF, 0x0, 0, 0, 0, 1, 0, 0, 0},
+	{LLCC_CPUSS1,   3, 1024, 1, 1, 0x00FF, 0x0, 0, 0, 0, 1, 0, 0, 0},
+	{LLCC_CPUHWT,   5, 512, 1, 1, 0x00FF, 0x0, 0, 0, 0, 1, 0, 0, 0},
+	{LLCC_AUDIO,    6, 1024, 1, 1, 0x00FF, 0x0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_CMPT,     10, 4096, 1, 1, 0x00FF, 0x0, 0, 0, 0, 1, 0, 0, 0},
+	{LLCC_GPUHTW,   11, 1024, 1, 1, 0x00FF, 0x0, 0, 0, 0, 1, 0, 0, 0},
+	{LLCC_GPU,      12, 1024, 1, 1, 0x00FF, 0x0, 0, 0, 0, 1, 0, 1, 0},
+	{LLCC_MMUHWT,   13, 1024, 1, 1, 0x00FF, 0x0, 0, 0, 0, 0, 1, 0, 0},
+	{LLCC_CMPTDMA,  15, 1024, 1, 1, 0x00FF, 0x0, 0, 0, 0, 1, 0, 0, 0},
+	{LLCC_DISP,     16, 4096, 2, 1, 0x00FF, 0x0, 0, 0, 0, 1, 0, 0, 0},
+	{LLCC_VIDFW,    17, 3072, 1, 0, 0x00FF, 0x0, 0, 0, 0, 1, 0, 0, 0},
+	{LLCC_AUDHW,    22, 1024, 1, 1, 0x00FF, 0x0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_CVP,      28, 256, 3, 1, 0x00FF, 0x0, 0, 0, 0, 1, 0, 0, 0},
+	{LLCC_APTCM,    30, 1024, 3, 1, 0x0, 0xF0, 1, 0, 0, 1, 0, 0, 0},
+	{LLCC_WRCACHE,    31, 512, 1, 1, 0x00FF, 0x0, 0, 0, 0, 0, 1, 0, 0},
+};
+
 static const struct llcc_slice_config sc7180_data[] =  {
 	{ LLCC_CPUSS,    1,  256, 1, 0, 0xf, 0x0, 0, 0, 0, 1, 1 },
 	{ LLCC_MDM,      8,  128, 1, 0, 0xf, 0x0, 0, 0, 0, 1, 0 },
@@ -552,6 +571,16 @@ static const struct qcom_llcc_config qdu1000_cfg[] = {
 	},
 };
 
+static const struct qcom_llcc_config sa8775p_cfg[] = {
+	{
+		.sct_data	= sa8775p_data,
+		.size		= ARRAY_SIZE(sa8775p_data),
+		.need_llcc_cfg	= true,
+		.reg_offset	= llcc_v2_1_reg_offset,
+		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
+	},
+};
+
 static const struct qcom_llcc_config sc7180_cfg[] = {
 	{
 		.sct_data	= sc7180_data,
@@ -698,6 +727,11 @@ static const struct qcom_sct_config qdu1000_cfgs = {
 	.num_config	= ARRAY_SIZE(qdu1000_cfg),
 };
 
+static const struct qcom_sct_config sa8775p_cfgs = {
+	.llcc_config	= sa8775p_cfg,
+	.num_config	= ARRAY_SIZE(sa8775p_cfg),
+};
+
 static const struct qcom_sct_config sc7180_cfgs = {
 	.llcc_config	= sc7180_cfg,
 	.num_config	= ARRAY_SIZE(sc7180_cfg),
@@ -1332,6 +1366,7 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 
 static const struct of_device_id qcom_llcc_of_match[] = {
 	{ .compatible = "qcom,qdu1000-llcc", .data = &qdu1000_cfgs},
+	{ .compatible = "qcom,sa8775p-llcc", .data = &sa8775p_cfgs },
 	{ .compatible = "qcom,sc7180-llcc", .data = &sc7180_cfgs },
 	{ .compatible = "qcom,sc7280-llcc", .data = &sc7280_cfgs },
 	{ .compatible = "qcom,sc8180x-llcc", .data = &sc8180x_cfgs },
-- 
2.25.1


