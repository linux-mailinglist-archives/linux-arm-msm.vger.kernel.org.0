Return-Path: <linux-arm-msm+bounces-33781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FF3997D78
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 08:39:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C62111C230B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 06:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DE421B0109;
	Thu, 10 Oct 2024 06:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F8Gl6vXL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06DB1A4E70;
	Thu, 10 Oct 2024 06:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728542371; cv=none; b=ldlc/WIzwpcsWWtz3Ai6Olm0S20UohYbXB5NcrLm6L7aJvYEyGBSFiK+uEi9pSO97cxIj0mox3Trc5Cs0ueYepsZI1tbqzoT2qgpi9rsiIdiJ8UvwQ2lCqdL5vd5pyQgdNTlK2og7kKIi1lR2r7D4hMP1mgrkxuP4lAXzOBpvAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728542371; c=relaxed/simple;
	bh=t2ACQLeshRvb78xLPQ6LJeesmOpr30HiZoM3f7n/5+E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Y1j6+9Z2sy9pAgbWhOmLuDO2KrVM0zLakCNU5Wq5v5tdLyAjDdA/otxgKMqkqZouqaIghKThctqK5702+RIQanoUwWUlwIv7mOc0s/VenLnucsAYhbsd6dcJUFTi8q2qwab28mxwSBmeEZVNGhfPL6bk/BlXsGAOWXWzOTckpak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F8Gl6vXL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A1cqtn029507;
	Thu, 10 Oct 2024 06:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9LSjW72loJMXVUAFNiqbxL485PUaQA935T6aBJpGXmI=; b=F8Gl6vXLqTVRIRmT
	tFNbqXrQGUwYLikEdewMkxzzO+I9FM6XnMkTJUcIcD9cwt+b1UkBlKI/j5iYK7ub
	DWZGf5v2DsQkyK8WPqNITnwgnyVM1dMt1ItCn8H/kDFN50Yonck8ukZKqe/4J/xZ
	OcgSEQtXrWtKzJo1IuE4jhpIOVOafk+E9eVzuNN1+F86nWWK3MxqFeD1TNgxtYQb
	gPzz6CmB1URnOVcLPuXUL9b72kNs0Z/0pFT18z7FcKtXkeQkOEaTRjPrAHZu0xK1
	xZGPBmMD5g+ssIIyJdqALsuC3kSHwJAxOp9u9AMoDygFPKaKuiTS95uY/P7/gpDt
	vRMlqA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 425c8qvuh3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 06:39:26 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49A6dPA3003645
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 06:39:25 GMT
Received: from songxue-gv.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 9 Oct 2024 23:39:19 -0700
From: Song Xue <quic_songxue@quicinc.com>
Date: Thu, 10 Oct 2024 14:38:40 +0800
Subject: [PATCH v2 2/2] soc: qcom: llcc: Add configuration data for QCS615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241010-add_llcc_support_for_qcs615-v2-2-044432450a75@quicinc.com>
References: <20241010-add_llcc_support_for_qcs615-v2-0-044432450a75@quicinc.com>
In-Reply-To: <20241010-add_llcc_support_for_qcs615-v2-0-044432450a75@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728542354; l=2739;
 i=quic_songxue@quicinc.com; s=20240911; h=from:subject:message-id;
 bh=t2ACQLeshRvb78xLPQ6LJeesmOpr30HiZoM3f7n/5+E=;
 b=KgbhkRTqQQKECJ+n10aXds5Ruifk95HgGecA1qBAY58QJo7fw07N1q2xO87CtJ9B3ZkNVdgNq
 bE8Tz3O7kPJDAEuUEisPeAl1WM5xm1nRdx+kKjuFqvOLTSU3vgBtA/R
X-Developer-Key: i=quic_songxue@quicinc.com; a=ed25519;
 pk=Z6tjs+BBbyg1kYqhBq0EfW2Pl/yZdOPXutG9TOVA1yc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vrKDx-A-1xrcED925gX-3duts8ZfmaUX
X-Proofpoint-ORIG-GUID: vrKDx-A-1xrcED925gX-3duts8ZfmaUX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410100042

Add LLCC configuration support for the QCS615 platform.

Signed-off-by: Song Xue <quic_songxue@quicinc.com>
---
 drivers/soc/qcom/llcc-qcom.c | 55 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index a470285f54a875bf2262aac7b0f84ed8fd028ef1..3dcbad0c662d3e4458044c168ed619d31b2b57be 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -2225,6 +2225,45 @@ static const struct llcc_slice_config sm8650_data[] = {
 	},
 };
 
+static const struct llcc_slice_config qcs615_data[] = {
+	{
+		.usecase_id = LLCC_CPUSS,
+		.slice_id = 1,
+		.max_cap = 128,
+		.priority = 1,
+		.bonus_ways = 0xf,
+		.cache_mode = 0,
+		.activate_on_init = true,
+		.write_scid_en = true,
+	}, {
+		.usecase_id = LLCC_MDM,
+		.slice_id = 8,
+		.max_cap = 256,
+		.priority = 0,
+		.fixed_size = true,
+		.bonus_ways = 0xf,
+		.cache_mode = 0,
+		.activate_on_init = true,
+	}, {
+		.usecase_id = LLCC_GPUHTW,
+		.slice_id = 11,
+		.max_cap = 128,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xf,
+		.cache_mode = 0,
+		.activate_on_init = true,
+	}, {
+		.usecase_id = LLCC_GPU,
+		.slice_id = 12,
+		.max_cap = 128,
+		.priority = 1,
+		.bonus_ways = 0xf,
+		.cache_mode = 0,
+		.activate_on_init = true,
+	},
+};
+
 static const struct llcc_slice_config qdu1000_data_2ch[] = {
 	{
 		.usecase_id = LLCC_MDMHPGRW,
@@ -2646,6 +2685,16 @@ static const u32 llcc_v2_1_reg_offset[] = {
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
@@ -2829,6 +2878,11 @@ static const struct qcom_llcc_config x1e80100_cfg[] = {
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
@@ -3484,6 +3538,7 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_llcc_of_match[] = {
+	{ .compatible = "qcom,qcs615-llcc", .data = &qcs615_cfgs},
 	{ .compatible = "qcom,qdu1000-llcc", .data = &qdu1000_cfgs},
 	{ .compatible = "qcom,sa8775p-llcc", .data = &sa8775p_cfgs },
 	{ .compatible = "qcom,sc7180-llcc", .data = &sc7180_cfgs },

-- 
2.25.1


