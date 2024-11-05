Return-Path: <linux-arm-msm+bounces-37041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1479BCA5D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 11:23:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 730A6B20E8E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 10:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FB701D31A9;
	Tue,  5 Nov 2024 10:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SrB4j727"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D541D2F7E;
	Tue,  5 Nov 2024 10:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730802173; cv=none; b=jHqpSWJkhIqi57dpcgQV+3kpWsuPqYeA4X/pVHOMZV46MTOBl22bUyQWF/EN/VSbKv7M8V3lpR69xWI2PWscPxcHSKm6amlWyH2HTnBcx3I2RoZ7KYpA7lyzQqhUwy+m/eyJfQOnfJT4xKScRWDUsOUKXmjLYqDAc6vbT2jgRlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730802173; c=relaxed/simple;
	bh=TCAWxjdBadmwdQz6is6QhIRgXQdq72aBEWkYk0hz4Fs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ezb36bBRS4wiOOg5tmu3yzOVqeHLW9gHSdRGyJQHhR/MZuzCv7/XacgO7WgNQzzrGOW+V+XZNP4lTepoDUhnVN8jjKBB4Ci3Q3u3+BE+lqRUZC0sV+0jek+sNpf/S7Be+19TkRPA9dDoVH64okmz8EGIwQ8pqwRhYmUvnzerBik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SrB4j727; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A59RSwr004939;
	Tue, 5 Nov 2024 10:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vdJNBON/18hGZw5h3hWFjAOi3I6GBwlp0jC/J7+cVMQ=; b=SrB4j727yLjAnXkO
	U55oi4tU5Lj290AljzTZH21EqRP/OpvndW5bhWLIhjpmGWS3dY40/T8IgWL6QXuh
	juXzxmkBlQvOu5PFJaN6yl1ZMGyy7kaV5jcXLXZnQBaC3eALvriWgllAc9mxp7Sh
	MmAKP4Zmf2A6YXVsqSxpMLG9AmwCKyp1V1AS8OjzC22cKMdGroDrgGHuKknz2PeC
	k/9jFQIKHsdah/lTeeHGB+g8OlzN+a7lYvZzchK7oUI1kSZBn78mKu4PqFgcbcVX
	3W/MWfdWYIbYZqapnK2b+R5hfN+S2PJioQ9DpLapKTPjwBaWTwy/HAK6JmniOgqu
	b6NLpA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ndc6y900-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 10:22:49 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A5AMmn9016785
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 10:22:48 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 5 Nov 2024 02:22:45 -0800
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <conor@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: [PATCH v2 2/3] soc: qcom: llcc: Update configuration data for IPQ5424
Date: Tue, 5 Nov 2024 15:52:09 +0530
Message-ID: <20241105102210.510025-3-quic_varada@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241105102210.510025-1-quic_varada@quicinc.com>
References: <20241105102210.510025-1-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: omhUrQ6ho3pcAR6bV8i0sDa1YyRTtWDW
X-Proofpoint-GUID: omhUrQ6ho3pcAR6bV8i0sDa1YyRTtWDW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 clxscore=1015 mlxscore=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050078

The 'broadcast' register space is present only in chipsets that
have multiple instances of LLCC IP. Since IPQ5424 has only one
instance, both the LLCC and LLCC_BROADCAST points to the same
register space.

Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
---
v2: Use 'true/false' instead of '1/0' for boolean variables.
    Add 'no_broadcast_register' to qcom_llcc_config structure
    to identify SoC without LLCC_BROADCAST register space instead
    of using 'num_banks'.
---
 drivers/soc/qcom/llcc-qcom.c | 58 ++++++++++++++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index a470285f54a8..f34d65fdd185 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -140,6 +140,7 @@ struct qcom_llcc_config {
 	bool need_llcc_cfg;
 	bool no_edac;
 	bool irq_configured;
+	bool no_broadcast_register;
 };
 
 struct qcom_sct_config {
@@ -152,6 +153,38 @@ enum llcc_reg_offset {
 	LLCC_COMMON_STATUS0,
 };
 
+static const struct llcc_slice_config ipq5424_data[] =  {
+	{
+		.usecase_id = LLCC_CPUSS,
+		.slice_id = 1,
+		.max_cap = 768,
+		.priority = 1,
+		.bonus_ways = 0xFFFF,
+		.retain_on_pc = true,
+		.activate_on_init = true,
+		.write_scid_cacheable_en = true,
+		.stale_en = true,
+		.stale_cap_en = true,
+		.alloc_oneway_en = true,
+		.ovcap_en = true,
+		.ovcap_prio = true,
+		.vict_prio = true,
+	},
+	{
+		.usecase_id = LLCC_VIDSC0,
+		.slice_id = 2,
+		.max_cap = 256,
+		.priority = 2,
+		.fixed_size = true,
+		.bonus_ways = 0xF000,
+		.retain_on_pc = true,
+		.activate_on_init = true,
+		.write_scid_cacheable_en = true,
+		.stale_en = true,
+		.stale_cap_en = true,
+	},
+};
+
 static const struct llcc_slice_config sa8775p_data[] =  {
 	{
 		.usecase_id = LLCC_CPUSS,
@@ -2677,6 +2710,17 @@ static const struct qcom_llcc_config qdu1000_cfg[] = {
 	},
 };
 
+static const struct qcom_llcc_config ipq5424_cfg[] = {
+	{
+		.sct_data       = ipq5424_data,
+		.size           = ARRAY_SIZE(ipq5424_data),
+		.need_llcc_cfg  = true,
+		.reg_offset     = llcc_v2_1_reg_offset,
+		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
+		.no_broadcast_register = true,
+	},
+};
+
 static const struct qcom_llcc_config sa8775p_cfg[] = {
 	{
 		.sct_data	= sa8775p_data,
@@ -2834,6 +2878,11 @@ static const struct qcom_sct_config qdu1000_cfgs = {
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
@@ -3412,8 +3461,12 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 
 	drv_data->bcast_regmap = qcom_llcc_init_mmio(pdev, i, "llcc_broadcast_base");
 	if (IS_ERR(drv_data->bcast_regmap)) {
-		ret = PTR_ERR(drv_data->bcast_regmap);
-		goto err;
+		if (cfg->no_broadcast_register) {
+			drv_data->bcast_regmap = regmap;
+		} else {
+			ret = PTR_ERR(drv_data->bcast_regmap);
+			goto err;
+		}
 	}
 
 	/* Extract version of the IP */
@@ -3485,6 +3538,7 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 
 static const struct of_device_id qcom_llcc_of_match[] = {
 	{ .compatible = "qcom,qdu1000-llcc", .data = &qdu1000_cfgs},
+	{ .compatible = "qcom,ipq5424-llcc", .data = &ipq5424_cfgs},
 	{ .compatible = "qcom,sa8775p-llcc", .data = &sa8775p_cfgs },
 	{ .compatible = "qcom,sc7180-llcc", .data = &sc7180_cfgs },
 	{ .compatible = "qcom,sc7280-llcc", .data = &sc7280_cfgs },
-- 
2.34.1


