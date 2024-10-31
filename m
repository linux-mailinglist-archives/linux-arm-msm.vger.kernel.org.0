Return-Path: <linux-arm-msm+bounces-36525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CADC9B751D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 08:15:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF9D91C21FB2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 07:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1086614E2C2;
	Thu, 31 Oct 2024 07:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EoBo47i8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FFD14AD1A;
	Thu, 31 Oct 2024 07:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730358915; cv=none; b=chZINbI3bwkk9fPKatHoZ9dPKw2c7XtIx+Ijwtbz47CSUGQAyDY2DTrlXEpJYbIlWnxECXkJpPY6C1X9AyxS6lBg1dT9JbHo0upsE50W0mDdYsdev2YzX6N4XcoIoFRjcldEv8f76p4cw9sbMI3dNmDIS/Bu228Ls+Uklk9bhW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730358915; c=relaxed/simple;
	bh=7e3MPp7XeIJLoQg0GT1afhoS0KwRJWUvKwV7ZAVH5yo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=IZ/ek+1SZ1h3o/p/j/K7rAcrcW8FSfNFoiiFjzj0M2B+E0sqyPH9ClDuogZij9oxFLAos5Dal6ijSLwgM2YGR5Ky+Aghm85AZHwsheB5p7dnfD0L8av9wXnMX5nAR2edFpuqq2XxZ6wPO4Kuu9LzrDPofKRX0rRW085BbN3mwvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EoBo47i8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49V0GhuU013849;
	Thu, 31 Oct 2024 07:15:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R/3k+ra19OlDltNaiN60nQGvjuxqjQCHMVy825COCAc=; b=EoBo47i8NMoZ1frP
	umIBVatp/QC/WSDf0Xj0sziUzSh0eD17QaepX9UDflQ3tbzBsMgT9O1Jkr/bTgra
	zz8RmxTN50jdXdigP0q8H4DYeKGJLmjMcvYipigurE8L63WG0/5jwOyB7rXYY1gB
	+hq1/9w90UXpqvl5Q7DF2vh+IMWEx1GanwX/dBWnJnWBNmlZXQstRTJXU9rwNQ93
	WNy5kNKy+W9vlAoPs6LY2DGwtdy4qaMGq2Y/v+PxmhsFsq7ieeeXnRmAokSOpS5D
	kLBx0Vn7l6thrF5PDUtz7MpvL5VbSLlQaSEdWzF/JDl30DIgn1/StBk0dypCKhwN
	ht4FlQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ky6r8w7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 07:15:10 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49V7F9KQ019456
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 07:15:09 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 31 Oct 2024 00:15:05 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
Date: Thu, 31 Oct 2024 15:14:37 +0800
Subject: [PATCH v3 2/3] soc: qcom: llcc: Add LLCC configuration for the
 QCS8300 platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241031-qcs8300_llcc-v3-2-bb56952cb83b@quicinc.com>
References: <20241031-qcs8300_llcc-v3-0-bb56952cb83b@quicinc.com>
In-Reply-To: <20241031-qcs8300_llcc-v3-0-bb56952cb83b@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>,
        Jingyi Wang
	<quic_jingyw@quicinc.com>,
        <20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com>,
        <20241026-sar2130p-llcc-v3-0-2a58fa1b4d12@linaro.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730358896; l=3064;
 i=quic_jingyw@quicinc.com; s=20240910; h=from:subject:message-id;
 bh=7e3MPp7XeIJLoQg0GT1afhoS0KwRJWUvKwV7ZAVH5yo=;
 b=z9/J2uI03XmkbbOqoXXQSeuitIAJFBVQbwxL0NrJmJs1rHFCuHt2OV/2FH1pT65AYnN9tuBfN
 ztSb2BSgdO3ARHNrbJn7d4tDmOmBSdSH6/K2tI/y5xBElfQq+ewzGQv
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=ZRP1KgWMhlXXWlSYLoO7TSfwKgt6ke8hw5xWcSY+wLQ=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HBUqpqRfjMBvrM8r8ezj0Rp6pXVGmTrG
X-Proofpoint-ORIG-GUID: HBUqpqRfjMBvrM8r8ezj0Rp6pXVGmTrG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 clxscore=1015 phishscore=0 mlxscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=965 lowpriorityscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410310052

Add LLCC configuration for the QCS8300 platform. There is an errata on
LB_CNT information on QCS8300 platform, hardcode num_banks to get the
correct value.

Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
 drivers/soc/qcom/llcc-qcom.c | 67 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 783545b22aaa..61b91939aae4 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -2629,6 +2629,56 @@ static const struct llcc_slice_config sm8650_data[] = {
 	},
 };
 
+static const struct llcc_slice_config qcs8300_data[] = {
+	{
+		.usecase_id = LLCC_GPUHTW,
+		.slice_id = 11,
+		.max_cap = 128,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xf,
+		.cache_mode = 0,
+		.retain_on_pc = true,
+	}, {
+		.usecase_id = LLCC_GPU,
+		.slice_id = 12,
+		.max_cap = 512,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xf,
+		.cache_mode = 0,
+		.retain_on_pc = true,
+		.write_scid_en = true,
+	}, {
+		.usecase_id = LLCC_MMUHWT,
+		.slice_id = 13,
+		.max_cap = 128,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xf,
+		.cache_mode = 0,
+		.activate_on_init = true,
+	}, {
+		.usecase_id = LLCC_ECC,
+		.slice_id = 26,
+		.max_cap = 256,
+		.priority = 3,
+		.fixed_size = true,
+		.bonus_ways = 0xf,
+		.cache_mode = 0,
+		.activate_on_init = true,
+	}, {
+		.usecase_id = LLCC_WRCACHE,
+		.slice_id = 31,
+		.max_cap = 128,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xf,
+		.cache_mode = 0,
+		.activate_on_init = true,
+	},
+};
+
 static const struct llcc_slice_config qdu1000_data_2ch[] = {
 	{
 		.usecase_id = LLCC_MDMHPGRW,
@@ -3050,6 +3100,17 @@ static const u32 llcc_v2_1_reg_offset[] = {
 	[LLCC_COMMON_STATUS0]	= 0x0003400c,
 };
 
+static const struct qcom_llcc_config qcs8300_cfg[] = {
+	{
+		.sct_data	= qcs8300_data,
+		.size		= ARRAY_SIZE(qcs8300_data),
+		.need_llcc_cfg	= true,
+		.reg_offset	= llcc_v2_1_reg_offset,
+		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
+		.num_banks	= 4,
+	},
+};
+
 static const struct qcom_llcc_config qdu1000_cfg[] = {
 	{
 		.sct_data       = qdu1000_data_8ch,
@@ -3257,6 +3318,11 @@ static const struct qcom_llcc_config x1e80100_cfg[] = {
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
@@ -3930,6 +3996,7 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_llcc_of_match[] = {
+	{ .compatible = "qcom,qcs8300-llcc", .data = &qcs8300_cfgs},
 	{ .compatible = "qcom,qdu1000-llcc", .data = &qdu1000_cfgs},
 	{ .compatible = "qcom,sa8775p-llcc", .data = &sa8775p_cfgs },
 	{ .compatible = "qcom,sar1130p-llcc", .data = &sar1130p_cfgs },

-- 
2.25.1


