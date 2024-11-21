Return-Path: <linux-arm-msm+bounces-38600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B99599D472E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 06:20:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 09C7FB232F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 05:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D89941C9DC6;
	Thu, 21 Nov 2024 05:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZqTUML0N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA8D1C9B6F;
	Thu, 21 Nov 2024 05:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732166411; cv=none; b=Qe62kaDb+dMhjoHiKIx5jW6MHCOUouX7vzfyjq70qeYwF+PfAaNG+9ZtPaLrcfUlki+GaHFd94G15yKnhvmr1/uB8g+smrRKyFX2XezTDYnVbIs9qEjPJXV7W26Gr2Z9Zossz6I/V7CmOgFHzbVzWTQFZZOutvtEf08QSTBQ1uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732166411; c=relaxed/simple;
	bh=mxDQxeL8QW7TBhmZLzdurmwUOpXmIinBfq/IHe5OAIQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qCKydoVLpImagA4NIQLA+YzYez7yIXZRqZQbDXnD9NdmCHugNljBUaO9EOIPQQ/nPEhvcChoCV1vxMgZz7CNamGtXycXEyAHsrYd0BSU+AbjjIg21QmXwcXsbwb00KlO62f3Dc+CHFChAim1tRzSgRbmaeMwOJ2ZtgpMbi0xhYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZqTUML0N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKK6QOH005744;
	Thu, 21 Nov 2024 05:20:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yUN1cPPJcmDkYJ8zUxJbWw5oF5M92dTV0E/H58ZKF/w=; b=ZqTUML0NU6aITsJP
	ik8Ii8cFQiV4ujjLKvn8Z+wiAjjiIrigrxRvyXr2w0nKLRpI/eoucK7OicdyNjPK
	9pVyprvCFra5INqFy0QpELEHoZVOkGrvPAjViYaTZEGlY2zWrf6NpJ9nyCRZZ5La
	nXaE9FSzpakQmKTyjyKOZu0pSjS0/d29a0duf+DZ+MwjoHGyerxSZ0IQNRfQZwl5
	f4ihEnQNVyNz1/uHA9CmiTP50uK7cat87e669Gf5iM+YA9cFXQBaI/LMCNStiqc0
	s1ErVeg9qhLFqSmGvX9K+paWEvY7C22v+qvJTkoVhwTONGrm6vk10U41rqqpIwiC
	2Do35g==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y8036m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 05:20:06 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL5K55h031709
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 05:20:05 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 20 Nov 2024 21:20:02 -0800
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <conor@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: [PATCH v4 2/3] soc: qcom: llcc: Update configuration data for IPQ5424
Date: Thu, 21 Nov 2024 10:49:34 +0530
Message-ID: <20241121051935.1055222-3-quic_varada@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241121051935.1055222-1-quic_varada@quicinc.com>
References: <20241121051935.1055222-1-quic_varada@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 7Y5PWTUilYKVPv3zF-A7II7wNI44Y3bx
X-Proofpoint-GUID: 7Y5PWTUilYKVPv3zF-A7II7wNI44Y3bx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411210039

The 'broadcast' register space is present only in chipsets that
have multiple instances of LLCC IP. Since IPQ5424 has only one
instance, both the LLCC and LLCC_BROADCAST points to the same
register space.

Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
---
v4: Fix ipq5424-llcc placement according to the sort order

v3: Rebase to ToT
    Remove 'need_llcc_cfg = true'

v2: Use 'true/false' instead of '1/0' for boolean variables.
    Add 'no_broadcast_register' to qcom_llcc_config structure
    to identify SoC without LLCC_BROADCAST register space instead
    of using 'num_banks'.
---
 drivers/soc/qcom/llcc-qcom.c | 57 ++++++++++++++++++++++++++++++++++--
 1 file changed, 55 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 32c3bc887cef..2b832b730be7 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -142,6 +142,7 @@ struct qcom_llcc_config {
 	bool skip_llcc_cfg;
 	bool no_edac;
 	bool irq_configured;
+	bool no_broadcast_register;
 };
 
 struct qcom_sct_config {
@@ -154,6 +155,38 @@ enum llcc_reg_offset {
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
@@ -3185,6 +3218,16 @@ static const struct qcom_llcc_config qdu1000_cfg[] = {
 	},
 };
 
+static const struct qcom_llcc_config ipq5424_cfg[] = {
+	{
+		.sct_data       = ipq5424_data,
+		.size           = ARRAY_SIZE(ipq5424_data),
+		.reg_offset     = llcc_v2_1_reg_offset,
+		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
+		.no_broadcast_register = true,
+	},
+};
+
 static const struct qcom_llcc_config sa8775p_cfg[] = {
 	{
 		.sct_data	= sa8775p_data,
@@ -3360,6 +3403,11 @@ static const struct qcom_sct_config qdu1000_cfgs = {
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
@@ -3957,8 +4005,12 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 
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
@@ -4029,6 +4081,7 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_llcc_of_match[] = {
+	{ .compatible = "qcom,ipq5424-llcc", .data = &ipq5424_cfgs},
 	{ .compatible = "qcom,qcs615-llcc", .data = &qcs615_cfgs},
 	{ .compatible = "qcom,qcs8300-llcc", .data = &qcs8300_cfgs},
 	{ .compatible = "qcom,qdu1000-llcc", .data = &qdu1000_cfgs},
-- 
2.34.1


