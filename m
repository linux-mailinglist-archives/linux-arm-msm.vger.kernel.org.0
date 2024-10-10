Return-Path: <linux-arm-msm+bounces-33839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E0E998336
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 12:10:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3256228378E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 10:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD3831C1755;
	Thu, 10 Oct 2024 10:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ai0iFDgF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D731BE251;
	Thu, 10 Oct 2024 10:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728554985; cv=none; b=Z5w1ul52mLP2tMJca8F4OQjd46QsMcZJsq5bYtNvt8LnVIVwjFygunI+i2MatO1Hi0DT7QuFuZmElC2fQ6LHpmUjAMYw72fEP8MzqzEtGJfRzXizoCfPPcsSbwaeFcK2CWDMBsxFS0f+jA32HyD4SyKXo2lnr/TsnqwpwTqolg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728554985; c=relaxed/simple;
	bh=1devtUPHuNl3wWnbl3BrC/SkHddisfze/2kLWT0uMFA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=paxuT/lU0CrL8wGqz5S8SGskTa6RELGrkdbsbbR7d9IJhdTl7Zy3pe7Xpm3KdtLjvysREghKMTGlhPzcoAgXwyCbwY3PVtpkkF5au+kqZq8JnJylHS3mNnGYJJ4LKDcVH9V1xmzK/SLVKF1wvLK9v0hC4gMNXMUSs02fVTOwahk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ai0iFDgF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A1av7w029300;
	Thu, 10 Oct 2024 10:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R5OhkkmuVXJYEIOqzZ44+3xoVlPdSu7q/ZnNqPoHAEw=; b=Ai0iFDgFYRTwt6wW
	M8Ge7EAf/dCvxOVUGEkr6pgaDvt0lkmPgKJp6Jvz1SY00NBXompBo3fF6GIso64/
	q0VrSnS9tHzpTruR6oePG4YdO8kjCSjZh05GdW9EVmb4I4T7qCxbE0r84kK9t0QF
	ACpNk8UbFK1iDMmygDA1Dl3oQQf1FpnnJ5HvHw1CbX/v4OCMoGNQi8cJiTX8O/fR
	1aBvOilg4l9FGO85NTjZatvNIpbxpPRqIKpAdxhms9QBt1MqMaUvIr+gDTs7d98b
	YDdowedhnD3UKucjWXaYHTkfV7njgKBbQqXTruJ1k6hhrFZbdPo6MOdNIhkCUhHj
	PcVHrQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424x7s05gp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 10:09:35 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49AA9Y9h014634
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 10:09:34 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Oct 2024 03:09:30 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
Date: Thu, 10 Oct 2024 18:08:47 +0800
Subject: [PATCH v2 2/3] soc: qcom: llcc: Add LLCC configuration for the
 QCS8300 platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241010-qcs8300_llcc-v2-2-d4123a241db2@quicinc.com>
References: <20241010-qcs8300_llcc-v2-0-d4123a241db2@quicinc.com>
In-Reply-To: <20241010-qcs8300_llcc-v2-0-d4123a241db2@quicinc.com>
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
	<quic_jingyw@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728554962; l=3538;
 i=quic_jingyw@quicinc.com; s=20240910; h=from:subject:message-id;
 bh=1devtUPHuNl3wWnbl3BrC/SkHddisfze/2kLWT0uMFA=;
 b=KK4X+bDXIWDmad0t+o1yB9MhbVKEcEWvtOKZaGIN9KATF4UVRauCzibUUIx4hq8rLq36JO5jo
 V9nO6y1RYwfDOjgsm3cHu4ksCQRketQI7Ytt5J55qZORzp+0DpQhdLH
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=ZRP1KgWMhlXXWlSYLoO7TSfwKgt6ke8hw5xWcSY+wLQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OYnoeCuZ2qYEbT09m6SSCNBeQIpMSFRW
X-Proofpoint-ORIG-GUID: OYnoeCuZ2qYEbT09m6SSCNBeQIpMSFRW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410100067

Add LLCC configuration for the QCS8300 platform. There is an errata on
LB_CNT information on QCS8300 platform, override the value to get the
right number of banks.

Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
 drivers/soc/qcom/llcc-qcom.c | 72 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index a470285f54a8..d867b1596725 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -2225,6 +2225,56 @@ static const struct llcc_slice_config sm8650_data[] = {
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
@@ -2646,6 +2696,16 @@ static const u32 llcc_v2_1_reg_offset[] = {
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
@@ -2829,6 +2889,11 @@ static const struct qcom_llcc_config x1e80100_cfg[] = {
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
@@ -3391,6 +3456,12 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 	num_banks >>= LLCC_LB_CNT_SHIFT;
 	drv_data->num_banks = num_banks;
 
+	/* LB_CNT information is wrong on QCS8300, override the value */
+	if (of_device_is_compatible(dev->of_node, "qcom,qcs8300-llcc")) {
+		num_banks = 4;
+		drv_data->num_banks = 4;
+	}
+
 	drv_data->regmaps = devm_kcalloc(dev, num_banks, sizeof(*drv_data->regmaps), GFP_KERNEL);
 	if (!drv_data->regmaps) {
 		ret = -ENOMEM;
@@ -3484,6 +3555,7 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_llcc_of_match[] = {
+	{ .compatible = "qcom,qcs8300-llcc", .data = &qcs8300_cfgs},
 	{ .compatible = "qcom,qdu1000-llcc", .data = &qdu1000_cfgs},
 	{ .compatible = "qcom,sa8775p-llcc", .data = &sa8775p_cfgs },
 	{ .compatible = "qcom,sc7180-llcc", .data = &sc7180_cfgs },

-- 
2.25.1


