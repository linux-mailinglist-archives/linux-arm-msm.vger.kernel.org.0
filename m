Return-Path: <linux-arm-msm+bounces-36884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B1B9BAD4E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 08:39:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D85C2282153
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 07:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 904591A3AA9;
	Mon,  4 Nov 2024 07:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SmR7tiK5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC711A38E3;
	Mon,  4 Nov 2024 07:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730705972; cv=none; b=S0TvWac4M0iVhSppo/iO6vYYYCMBW/MleIotT5WcMa5+nZtb4us1LLMdoiQVMs7tNMagrOrQbXIgvNad+4knQuAH0Ehs6jFMgfsbfbmZlCLGDq4xvBNo/FaWtjoNWONFyBXZ2bQBpGoKNMNCdWaaMqcIDBVaKkTua4PSmzpScEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730705972; c=relaxed/simple;
	bh=SzMpF7Dbrlk7iMh0r0nclSJ+N8MBSYmeU2rT52c7ekw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FrUVa4QAoz6vcbVoj8KtuZJFNP+sYemx5Iwk+XT/LpKd3eEzacnhwSaqTwQQX3iDhnu4NKq3mE7cT4TLeMU5ixK6HFjvGHX0BrK08tLz4zkToUxiNe06/SDDsLuwV03xM9b1vJqp7v/iNE7UuHDeU4LzuI3XB0gsrZfrrEU3sbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SmR7tiK5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A40bnLH000879;
	Mon, 4 Nov 2024 07:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WGx5twbPI13b1KIPnvRTXoJe1ze5zpid47xvY19BbyU=; b=SmR7tiK5nNFe3Fi5
	MQTVCTInZqCyEMD8BJHP1vZbTaFLu9giN/smpCjIIsa+DG0Fm3GlxwXTSWWW9KFt
	9ZTGwscoLx04zttrDFY9I5IsOBFSDwtvT33+Z1NTyuDNaRCoCaXbxY/6jzSFzvml
	E2vv/EazuQVaMIoli628l4umycun8eMAybIGHuFxaLeUk+u7UHgKRbFwzcuIgAaJ
	pGWeyCacKteSBaB+ZhRBdQ0FZ3ojrEgChJ31f3KEdkujdLgDiv4USdWEtr4NIdY2
	OxSy0KDxklVNfct2xUb5wDRBfYjsDCFrRZI1sRt+hBq7L6oErw5cXk0A71+D73nn
	f67fYw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd4ukdrb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 07:39:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A47dOWC025738
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Nov 2024 07:39:24 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 3 Nov 2024 23:39:21 -0800
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <conor@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: [PATCH v1 2/3] soc: qcom: llcc: Update configuration data for IPQ5424
Date: Mon, 4 Nov 2024 13:08:39 +0530
Message-ID: <20241104073840.3686674-3-quic_varada@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241104073840.3686674-1-quic_varada@quicinc.com>
References: <20241104073840.3686674-1-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EKWD8qrgUUyZkiTTaG7xc-4c3Vn4kS4v
X-Proofpoint-ORIG-GUID: EKWD8qrgUUyZkiTTaG7xc-4c3Vn4kS4v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=999 impostorscore=0 suspectscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040067

The 'broadcast' register space is present only in chipsets that
have multiple instances of LLCC IP. Since IPQ5424 has only one
instance, both the LLCC and LLCC_BROADCAST points to the same
register space.

Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
---
 drivers/soc/qcom/llcc-qcom.c | 60 +++++++++++++++++++++++++++++++++---
 1 file changed, 56 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index a470285f54a8..51dba8ec2183 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -152,6 +152,38 @@ enum llcc_reg_offset {
 	LLCC_COMMON_STATUS0,
 };
 
+static const struct llcc_slice_config ipq5424_data[] =  {
+	{
+		.usecase_id = LLCC_CPUSS,
+		.slice_id = 1,
+		.max_cap = 768,
+		.priority = 1,
+		.bonus_ways = 0xFFFF,
+		.retain_on_pc = 1,
+		.activate_on_init = 1,
+		.write_scid_cacheable_en = 1,
+		.stale_en = 1,
+		.stale_cap_en = 1,
+		.alloc_oneway_en = 1,
+		.ovcap_en = 1,
+		.ovcap_prio = 1,
+		.vict_prio = 1,
+	},
+	{
+		.usecase_id = LLCC_VIDSC0,
+		.slice_id = 2,
+		.max_cap = 256,
+		.priority = 2,
+		.fixed_size = 1,
+		.bonus_ways = 0xF000,
+		.retain_on_pc = 1,
+		.activate_on_init = 1,
+		.write_scid_cacheable_en = 1,
+		.stale_en = 1,
+		.stale_cap_en = 1,
+	},
+};
+
 static const struct llcc_slice_config sa8775p_data[] =  {
 	{
 		.usecase_id = LLCC_CPUSS,
@@ -2677,6 +2709,16 @@ static const struct qcom_llcc_config qdu1000_cfg[] = {
 	},
 };
 
+static const struct qcom_llcc_config ipq5424_cfg[] = {
+	{
+		.sct_data       = ipq5424_data,
+		.size           = ARRAY_SIZE(ipq5424_data),
+		.need_llcc_cfg  = true,
+		.reg_offset     = llcc_v2_1_reg_offset,
+		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
+	},
+};
+
 static const struct qcom_llcc_config sa8775p_cfg[] = {
 	{
 		.sct_data	= sa8775p_data,
@@ -2834,6 +2876,11 @@ static const struct qcom_sct_config qdu1000_cfgs = {
 	.num_config	= ARRAY_SIZE(qdu1000_cfg),
 };
 
+static const struct qcom_sct_config ipq5424_cfgs = {
+	.llcc_config	= ipq5424_cfg,
+	.num_config	= ARRAY_SIZE(ipq5424_cfg),
+};
+
 static const struct qcom_sct_config sa8775p_cfgs = {
 	.llcc_config	= sa8775p_cfg,
 	.num_config	= ARRAY_SIZE(sa8775p_cfg),
@@ -3410,10 +3457,14 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 		}
 	}
 
-	drv_data->bcast_regmap = qcom_llcc_init_mmio(pdev, i, "llcc_broadcast_base");
-	if (IS_ERR(drv_data->bcast_regmap)) {
-		ret = PTR_ERR(drv_data->bcast_regmap);
-		goto err;
+	if (num_banks == 1) {
+		drv_data->bcast_regmap = regmap;
+	} else {
+		drv_data->bcast_regmap = qcom_llcc_init_mmio(pdev, i, "llcc_broadcast_base");
+		if (IS_ERR(drv_data->bcast_regmap)) {
+			ret = PTR_ERR(drv_data->bcast_regmap);
+			goto err;
+		}
 	}
 
 	/* Extract version of the IP */
@@ -3485,6 +3536,7 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 
 static const struct of_device_id qcom_llcc_of_match[] = {
 	{ .compatible = "qcom,qdu1000-llcc", .data = &qdu1000_cfgs},
+	{ .compatible = "qcom,ipq5424-llcc", .data = &ipq5424_cfgs},
 	{ .compatible = "qcom,sa8775p-llcc", .data = &sa8775p_cfgs },
 	{ .compatible = "qcom,sc7180-llcc", .data = &sc7180_cfgs },
 	{ .compatible = "qcom,sc7280-llcc", .data = &sc7280_cfgs },
-- 
2.34.1


