Return-Path: <linux-arm-msm+bounces-44925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10774A0C3A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 22:27:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8F573A6E27
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 21:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F02DA1F9413;
	Mon, 13 Jan 2025 21:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JnSRyiI6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9151DA632;
	Mon, 13 Jan 2025 21:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736803612; cv=none; b=LED+dVcLDYYSLmJj//ReSuD+Y3n+hnDBXUIWutD+hH0/uFNyT9U7WQB+PSFGxbZhV0eot4Kqfa+5EZONJk5h5YCok/L9tA80Sd1ahu4VeKxo7zdbCEBblNigIWAdhMdxW9cpc5LS+PEP4jK74Sb+gRHMH1+CbvB+3lS8pZrFFhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736803612; c=relaxed/simple;
	bh=/w/rukyPw8pTdr1V1IMlMidmdVO0Tc772bRW5bTb2IU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=q6iGS4/M5gczmUxCJeoWnjsGxUdaqBs06O9l4K/WIhQEBdEeTEPi+j2GpIjqerlBQygaUu5OSmG6r7rQF/6xD7K84VT6GlGGMRzbQo1qwutxDQ2Ll7ZOuzpxpEv/RhRurKcQszE7Ho69c/TmRbIeTOekClfLNvKNPU3V3kwRwis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JnSRyiI6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DIinnG007916;
	Mon, 13 Jan 2025 21:26:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h36w9V8IDuqqNmYJNkiK4M8sgdw+qa5UFUlnamsw6N8=; b=JnSRyiI6Kp5Jrazy
	pAY+rquXuf6cM+zTiT+BeAW7qX8QKzEJlzruzeI+P2UOpD6Z6oOREWcgw5rAqh4b
	U14k5C5qRpqsj36gD/XeKVjOdSY27/96nLlbdMFmhq0FMwfUtfOQUTWCabnXjtu8
	uEL9H9XwXnRbA/7vq2ZLvzXPnWQ281YjtKLLYQtEtWp0CxRHXns9PZEjCfUn0hfS
	8Y+b16QznbW884ix2lcvKggp2Z6SXcY8vLHBt9DQDnFEh6Q7a7wsDG+C/tDpuwOp
	Wir9KvscnEtwuYYfHVH3Lfu/Z+V0Dt2MKyXtk2rx9Iqk0h4q3z0SQa3nxXjKVjfo
	iHdkDw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4458cn0b12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:26:47 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50DLQkjI001358
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:26:46 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 13:26:45 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Mon, 13 Jan 2025 13:26:42 -0800
Subject: [PATCH 3/4] soc: qcom: llcc-qcom: Add support for SM8750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250113-sm8750_llcc_master-v1-3-5389b92e2d7a@quicinc.com>
References: <20250113-sm8750_llcc_master-v1-0-5389b92e2d7a@quicinc.com>
In-Reply-To: <20250113-sm8750_llcc_master-v1-0-5389b92e2d7a@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736803604; l=5074;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=/w/rukyPw8pTdr1V1IMlMidmdVO0Tc772bRW5bTb2IU=;
 b=V4hG69l3XBnRKbK6KCghQ7iexiw/8sDwwzmWOp1S/wImCqcIGglPn8fhBaAkZUVAkMbAPWq/i
 PaKFkiBjpKVCfhnmijx2MYW0e8hpRNg7hBmmOJijyEALfbDGAWaEaNG
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9l9tLtQ_9dzocD5I5bz9S5tiwkPQqB9u
X-Proofpoint-GUID: 9l9tLtQ_9dzocD5I5bz9S5tiwkPQqB9u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1011 mlxlogscore=907 mlxscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130170

Add system cache table and configs for SM8750 SoCs.

Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 drivers/soc/qcom/llcc-qcom.c | 51 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 4379b5baa011aa850a2b65ec20b32519d9331be4..f4cb158e0cf9eb82147ee461f98d0e928e5759a0 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -2770,6 +2770,41 @@ static const struct llcc_slice_config qcs8300_data[] = {
 	},
 };
 
+static const struct llcc_slice_config sm8750_data[] = {
+	{LLCC_CPUSS,     1, 5120, 1, 0, 0xFFFFFFFF, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_MDMHPFX,  24, 1024, 5, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_VIDSC0,    2,  512, 4, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_AUDIO,    35,  512, 1, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_MDMHPGRW, 25, 1024, 5, 0, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_MODHW,    26, 1024, 1, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_CMPT,     34, 4096, 1, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_GPUHTW,   11,  512, 1, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_GPU,       9, 5632, 1, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_MMUHWT,   18,  768, 1, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_DISP,     16, 7168, 1, 1, 0xFFFFFFFF, 0, 2, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_VIDFW,    17,    0, 4, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_CAMFW,    20,    0, 4, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_MDMPNG,   27,  256, 5, 1, 0xF0000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_AUDHW,    22,  512, 1, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_CVP,       8,  800, 5, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0},
+	{LLCC_MODPE,    29,  256, 1, 1, 0xF0000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0},
+	{LLCC_WRCACHE,  31,  512, 1, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_CVPFW,    19,   64, 4, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_CMPTHCP,  15,  256, 4, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_LCPDARE,  30,  128, 5, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0},
+	{LLCC_AENPU,     3, 3072, 1, 1, 0xFFFFFFFF, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_ISLAND1,  12, 7936, 7, 1, 0, 0x7FFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_DISP_WB,  23,  512, 4, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_VIDVSP,    4,  256, 4, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_VIDDEC,    5, 6144, 4, 1, 0xFFFFFFFF, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0},
+	{LLCC_CAMOFE,   33, 6144, 4, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0},
+	{LLCC_CAMRTIP,  13, 1024, 4, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0},
+	{LLCC_CAMSRTIP, 14, 6144, 4, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0},
+	{LLCC_CAMRTRF,   7, 3584, 3, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0},
+	{LLCC_CAMSRTRF, 21, 6144, 1, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0},
+	{LLCC_CPUSSMPAM, 6, 2048, 1, 1, 0xFFFFFFFF, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+};
+
 static const struct llcc_slice_config qdu1000_data_2ch[] = {
 	{
 		.usecase_id = LLCC_MDMHPGRW,
@@ -3432,6 +3467,16 @@ static const struct qcom_llcc_config sm8650_cfg[] = {
 	},
 };
 
+static const struct qcom_llcc_config sm8750_cfg[] = {
+	{
+		.sct_data		= sm8750_data,
+		.size			= ARRAY_SIZE(sm8750_data),
+		.skip_llcc_cfg	= false,
+		.reg_offset		= llcc_v6_reg_offset,
+		.edac_reg_offset = &llcc_v6_edac_reg_offset,
+	},
+};
+
 static const struct qcom_llcc_config x1e80100_cfg[] = {
 	{
 		.sct_data	= x1e80100_data,
@@ -3542,6 +3587,11 @@ static const struct qcom_sct_config sm8650_cfgs = {
 	.num_config	= ARRAY_SIZE(sm8650_cfg),
 };
 
+static const struct qcom_sct_config sm8750_cfgs = {
+	.llcc_config	= sm8750_cfg,
+	.num_config	= ARRAY_SIZE(sm8750_cfg),
+};
+
 static const struct qcom_sct_config x1e80100_cfgs = {
 	.llcc_config	= x1e80100_cfg,
 	.num_config	= ARRAY_SIZE(x1e80100_cfg),
@@ -4306,6 +4356,7 @@ static const struct of_device_id qcom_llcc_of_match[] = {
 	{ .compatible = "qcom,sm8450-llcc", .data = &sm8450_cfgs },
 	{ .compatible = "qcom,sm8550-llcc", .data = &sm8550_cfgs },
 	{ .compatible = "qcom,sm8650-llcc", .data = &sm8650_cfgs },
+	{ .compatible = "qcom,sm8750-llcc", .data = &sm8750_cfgs },
 	{ .compatible = "qcom,x1e80100-llcc", .data = &x1e80100_cfgs },
 	{ }
 };

-- 
2.46.1


