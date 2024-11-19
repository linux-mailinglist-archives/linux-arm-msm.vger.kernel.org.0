Return-Path: <linux-arm-msm+bounces-38278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9394F9D2014
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 07:09:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E34C1F22685
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 06:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C2915278E;
	Tue, 19 Nov 2024 06:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I47ybbHP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA29A150981;
	Tue, 19 Nov 2024 06:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731996572; cv=none; b=pNTtxcBouyVZz/VeLDS/a2cGksIRUVmwV3alArYtXqMreFxHEwOBc1B5L/Wk/mFS3ZB9WQVD7xe1XuUeiYMEMXBvz1Q+H+au03qu+y5ymttge2TdddNb5baHrKp9sHja5o5k61SyM59dJWW4EIwcZvqlT8QCCuFaTXC0w41GEqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731996572; c=relaxed/simple;
	bh=T9E5YqeIBssKyVdoHoE7HqTC54fjOPMvgHyYI22cLJ4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F1qcmneWnRwytzx9UOYEjyo09E6w/5JW7kEXZE2Ig9hXmANxKuhRsn1b098+EQ6+7NYJ4bnL0SIpuiduSrH+Am5BNO8MpylmszOHddVY0YJqPPiRRVP+qT9RhY3Vjk1e0wZlyUr0BlYMEp3+ztKWwpDq8Zcr5DVDAgm7ZNALIaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=I47ybbHP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIGGeCo026840;
	Tue, 19 Nov 2024 06:09:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XTWCuB3iL0+sCob/5oyOhTod8IHH1NSpv3PyoUwEz78=; b=I47ybbHPAaRNxdry
	4Ao38qaPcNtseC6uf07RrnlWKROZ/RtqUzLiEMHdvxD5gDasvjceoEo1LdoRGdP6
	L4dLmXqu+muLLQKRavtfDzfal3oRbULw/dbjVVjyt56ZgpDfndTWr7zLhrw8RfNg
	B0qEI89J/MSUSdM4/1ACX14eHNEhunjbQWXRv9QwQCaDzykMmNawQUd/Ev4gGi0/
	rd1YHm8eoSK9pEk2wAQ0y0GKNxUKFOAHoYmPXe/j1DO2fAko88a1rHA4YdZB4Qjo
	KB+0MNP/88zzxLE0Ji52FA/d6j3Rb8dJgUxuuqFN53Oz8HwR6i7XRz24e3UjcEcv
	Y+9F8Q==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y7smcr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 06:09:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJ68UZp015070
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 06:08:30 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 18 Nov 2024 22:08:20 -0800
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <conor@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: [PATCH v3 2/3] soc: qcom: llcc: Update configuration data for IPQ5424
Date: Tue, 19 Nov 2024 11:37:53 +0530
Message-ID: <20241119060754.3350320-3-quic_varada@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241119060754.3350320-1-quic_varada@quicinc.com>
References: <20241119060754.3350320-1-quic_varada@quicinc.com>
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
X-Proofpoint-ORIG-GUID: EMNVdjV25QU5Soat2YCXqReWiKEtJ-N4
X-Proofpoint-GUID: EMNVdjV25QU5Soat2YCXqReWiKEtJ-N4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411190044

The 'broadcast' register space is present only in chipsets that
have multiple instances of LLCC IP. Since IPQ5424 has only one
instance, both the LLCC and LLCC_BROADCAST points to the same
register space.

Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
---
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
index 32c3bc887cef..106f2619277a 100644
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
@@ -4032,6 +4084,7 @@ static const struct of_device_id qcom_llcc_of_match[] = {
 	{ .compatible = "qcom,qcs615-llcc", .data = &qcs615_cfgs},
 	{ .compatible = "qcom,qcs8300-llcc", .data = &qcs8300_cfgs},
 	{ .compatible = "qcom,qdu1000-llcc", .data = &qdu1000_cfgs},
+	{ .compatible = "qcom,ipq5424-llcc", .data = &ipq5424_cfgs},
 	{ .compatible = "qcom,sa8775p-llcc", .data = &sa8775p_cfgs },
 	{ .compatible = "qcom,sar1130p-llcc", .data = &sar1130p_cfgs },
 	{ .compatible = "qcom,sar2130p-llcc", .data = &sar2130p_cfgs },
-- 
2.34.1


