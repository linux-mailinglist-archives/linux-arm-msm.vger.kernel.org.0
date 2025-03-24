Return-Path: <linux-arm-msm+bounces-52406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB071A6E45E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 21:30:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF0AA18929F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 20:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7409A1D63C2;
	Mon, 24 Mar 2025 20:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IiQT4wyG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F731C7015;
	Mon, 24 Mar 2025 20:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742848190; cv=none; b=g4mjAegOJ5cs8PXmzjDwlCLvImCbpLYFUwt6j8IONuXJdAUa3mpBRBKrM4yJ1rpxk5qylN/fTb65tm44kiHyt2HvqDofG0NSsOpjaijKXl03JQpgwvnfPpE9L/Wfc5V4T7HZS4UzsSiTZa6kOB+aZzqvsN/ETnhCdSPRbZfxu7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742848190; c=relaxed/simple;
	bh=fLEpUfJeHpxpAvZkxc6PU5MiQdp2VKA0qQo+5/M0/JA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=TkSRa1y0W+RXF5mbk1ZfngS4ydsbI1ISB+qAkoL4lOBVh+I5gkgeGjVBnXnh9Cu9vYHocxt1ZmUDj5m0lE0OLhidt5i2z8UpDmmHiuqlNkIETc/zoh6tuxux4JL/MEJyz6dH6OxsMWXUuD3FEYOCClfIT5gsgYpGnJMAf9ZDhmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IiQT4wyG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52OCmHOI025259;
	Mon, 24 Mar 2025 20:29:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L9tkdqRS7hIkTHwmFchox6oub14Y4jco/ilPRWGTQhk=; b=IiQT4wyGn4xr42Fs
	HkAW2EGVfIqO9fnAiNVj389FiwnL1g7oYiUX8McMT27DcJH9zWwj+nSdA9cWRQ6g
	eWo1XHMawV9S+Ps2sxw1iKHuhWtH8pkjo3MOD3xte8tlUbRfySfoNJHyVNtIQjqB
	GFaTxyrhv4XAUWWwasZjz3tvK2+ruFXoiye/o0WmW6I/D8bgk9blphKcIctWSk+/
	Dx2OJbsdNdg2QrgfYJmP5EaMO+GoHJojSIBIIyyXzSRXiOKR+0X3F/H8HuBahH9j
	6WvE8fWwJsURcOaE93K9HN3npeNOp+yulOb6FvLmhcqw8KQVYbUjUIKvg/w3tdLD
	yNT7iQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45k7qj9565-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 20:29:44 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52OKTivD014482
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 20:29:44 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 24 Mar 2025 13:29:43 -0700
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Mon, 24 Mar 2025 13:29:39 -0700
Subject: [PATCH v3 3/4] soc: qcom: llcc-qcom: Add support for SM8750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250324-sm8750_llcc_master-v3-3-2afd5c0fdbde@quicinc.com>
References: <20250324-sm8750_llcc_master-v3-0-2afd5c0fdbde@quicinc.com>
In-Reply-To: <20250324-sm8750_llcc_master-v3-0-2afd5c0fdbde@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742848182; l=8496;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=fLEpUfJeHpxpAvZkxc6PU5MiQdp2VKA0qQo+5/M0/JA=;
 b=+aMGAPZrLvZmT91iRJdve5pKTnae0UJM/jL9ZQbnwmFuWWm6IUqK58TFDNkhp4lr+l1wucIs4
 8Z5f2ooHdKsB8v2qNXe+Sjje/eMM3IGUxFHAd57OVplIbsp+9ePlT0S
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vNvIFFinQgsOlDZKcHzk0IWjkWd5LCB9
X-Proofpoint-GUID: vNvIFFinQgsOlDZKcHzk0IWjkWd5LCB9
X-Authority-Analysis: v=2.4 cv=feOty1QF c=1 sm=1 tr=0 ts=67e1c0b8 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=3H110R4YSZwA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=zHNgQWnGFwCULUzyGxAA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_07,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 mlxlogscore=988 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240144

Add system cache table and configs for SM8750 SoCs.

Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 drivers/soc/qcom/llcc-qcom.c       | 272 +++++++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/llcc-qcom.h |   8 ++
 2 files changed, 280 insertions(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index cadf7e70ee03cd65d125276eccde5c9f0851e111..1b9eedf262a80f3eb0b5f7169473826baae53d34 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -2689,6 +2689,262 @@ static const struct llcc_slice_config sm8650_data[] = {
 	},
 };
 
+static const struct llcc_slice_config sm8750_data[] = {
+	{
+		.usecase_id = LLCC_CPUSS,
+		.slice_id = 1,
+		.max_cap = 5120,
+		.priority = 1,
+		.bonus_ways = 0xffffffff,
+		.activate_on_init = true,
+		.write_scid_en = true,
+	}, {
+		.usecase_id = LLCC_MDMHPFX,
+		.slice_id = 24,
+		.max_cap = 1024,
+		.priority = 5,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+	}, {
+		.usecase_id = LLCC_VIDSC0,
+		.slice_id = 2,
+		.max_cap = 512,
+		.priority = 4,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+	}, {
+		.usecase_id = LLCC_AUDIO,
+		.slice_id = 35,
+		.max_cap = 512,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+	}, {
+		.usecase_id = LLCC_MDMHPGRW,
+		.slice_id = 25,
+		.max_cap = 1024,
+		.priority = 5,
+		.bonus_ways = 0xffffffff,
+	}, {
+		.usecase_id = LLCC_MODHW,
+		.slice_id = 26,
+		.max_cap = 1024,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+	}, {
+		.usecase_id = LLCC_CMPT,
+		.slice_id = 34,
+		.max_cap = 4096,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+	}, {
+		.usecase_id = LLCC_GPUHTW,
+		.slice_id = 11,
+		.max_cap = 512,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+	}, {
+		.usecase_id = LLCC_GPU,
+		.slice_id = 9,
+		.max_cap = 5632,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+		.write_scid_en = true,
+		.write_scid_cacheable_en = true
+	}, {
+		.usecase_id = LLCC_MMUHWT,
+		.slice_id = 18,
+		.max_cap = 768,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+		.activate_on_init = true,
+	}, {
+		.usecase_id = LLCC_DISP,
+		.slice_id = 16,
+		.max_cap = 7168,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+		.cache_mode = 2,
+		.stale_en = true,
+	}, {
+		.usecase_id = LLCC_VIDFW,
+		.slice_id = 17,
+		.priority = 4,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+	}, {
+		.usecase_id = LLCC_CAMFW,
+		.slice_id = 20,
+		.priority = 4,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+	}, {
+		.usecase_id = LLCC_MDMPNG,
+		.slice_id = 27,
+		.max_cap = 256,
+		.priority = 5,
+		.fixed_size = true,
+		.bonus_ways = 0xf0000000,
+	}, {
+		.usecase_id = LLCC_AUDHW,
+		.slice_id = 22,
+		.max_cap = 512,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+	}, {
+		.usecase_id = LLCC_CVP,
+		.slice_id = 8,
+		.max_cap = 800,
+		.priority = 5,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_MODPE,
+		.slice_id = 29,
+		.max_cap = 256,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xf0000000,
+		.alloc_oneway_en = true,
+	}, {
+		.usecase_id = LLCC_WRCACHE,
+		.slice_id = 31,
+		.max_cap = 512,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+	}, {
+		.usecase_id = LLCC_CVPFW,
+		.slice_id = 19,
+		.max_cap = 64,
+		.priority = 4,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+	}, {
+		.usecase_id = LLCC_CMPTHCP,
+		.slice_id = 15,
+		.max_cap = 256,
+		.priority = 4,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+	}, {
+		.usecase_id = LLCC_LCPDARE,
+		.slice_id = 30,
+		.max_cap = 128,
+		.priority = 5,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+		.activate_on_init = true,
+		.alloc_oneway_en = true,
+	}, {
+		.usecase_id = LLCC_AENPU,
+		.slice_id = 3,
+		.max_cap = 3072,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+		.cache_mode = 2,
+	}, {
+		.usecase_id = LLCC_ISLAND1,
+		.slice_id = 12,
+		.max_cap = 7936,
+		.priority = 7,
+		.fixed_size = true,
+		.bonus_ways = 0x7fffffff,
+	}, {
+		.usecase_id = LLCC_DISP_WB,
+		.slice_id = 23,
+		.max_cap = 512,
+		.priority = 4,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+	}, {
+		.usecase_id = LLCC_VIDVSP,
+		.slice_id = 4,
+		.max_cap = 256,
+		.priority = 4,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+	}, {
+		.usecase_id = LLCC_VIDDEC,
+		.slice_id = 5,
+		.max_cap = 6144,
+		.priority = 4,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+		.cache_mode = 2,
+		.ovcap_prio = true,
+		.parent_slice_id = 33,
+	}, {
+		.usecase_id = LLCC_CAMOFE,
+		.slice_id = 33,
+		.max_cap = 6144,
+		.priority = 4,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+		.stale_en = true,
+		.ovcap_prio = true,
+		.parent_slice_id = 33,
+	}, {
+		.usecase_id = LLCC_CAMRTIP,
+		.slice_id = 13,
+		.max_cap = 1024,
+		.priority = 4,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+		.stale_en = true,
+		.ovcap_prio = true,
+		.parent_slice_id = 33,
+	}, {
+		.usecase_id = LLCC_CAMSRTIP,
+		.slice_id = 14,
+		.max_cap = 6144,
+		.priority = 4,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+		.stale_en = true,
+		.ovcap_prio = true,
+		.parent_slice_id = 33,
+	}, {
+		.usecase_id = LLCC_CAMRTRF,
+		.slice_id = 7,
+		.max_cap = 3584,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+		.stale_en = true,
+		.ovcap_prio = true,
+		.parent_slice_id = 33,
+	}, {
+		.usecase_id = LLCC_CAMSRTRF,
+		.slice_id = 21,
+		.max_cap = 6144,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+		.stale_en = true,
+		.ovcap_prio = true,
+		.parent_slice_id = 33,
+	}, {
+		.usecase_id = LLCC_CPUSSMPAM,
+		.slice_id = 6,
+		.max_cap = 2048,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+		.activate_on_init = true,
+		.write_scid_en = true,
+	},
+};
+
 static const struct llcc_slice_config qcs615_data[] = {
 	{
 		.usecase_id = LLCC_CPUSS,
@@ -3454,6 +3710,16 @@ static const struct qcom_llcc_config sm8650_cfg[] = {
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
@@ -3564,6 +3830,11 @@ static const struct qcom_sct_config sm8650_cfgs = {
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
@@ -4318,6 +4589,7 @@ static const struct of_device_id qcom_llcc_of_match[] = {
 	{ .compatible = "qcom,sm8450-llcc", .data = &sm8450_cfgs },
 	{ .compatible = "qcom,sm8550-llcc", .data = &sm8550_cfgs },
 	{ .compatible = "qcom,sm8650-llcc", .data = &sm8650_cfgs },
+	{ .compatible = "qcom,sm8750-llcc", .data = &sm8750_cfgs },
 	{ .compatible = "qcom,x1e80100-llcc", .data = &x1e80100_cfgs },
 	{ }
 };
diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
index 8e5d78fb4847a232ab17a66c2775552dcb287752..7a69210a250c4646b7fd6cf400995e35d3f00493 100644
--- a/include/linux/soc/qcom/llcc-qcom.h
+++ b/include/linux/soc/qcom/llcc-qcom.h
@@ -24,6 +24,7 @@
 #define LLCC_CMPTDMA     15
 #define LLCC_DISP        16
 #define LLCC_VIDFW       17
+#define LLCC_CAMFW       18
 #define LLCC_MDMHPFX     20
 #define LLCC_MDMPNG      21
 #define LLCC_AUDHW       22
@@ -67,6 +68,13 @@
 #define LLCC_EVCS_LEFT	 67
 #define LLCC_EVCS_RIGHT	 68
 #define LLCC_SPAD	 69
+#define LLCC_VIDDEC	 70
+#define LLCC_CAMOFE	 71
+#define LLCC_CAMRTIP	 72
+#define LLCC_CAMSRTIP	 73
+#define LLCC_CAMRTRF	 74
+#define LLCC_CAMSRTRF	 75
+#define LLCC_CPUSSMPAM	 89
 
 /**
  * struct llcc_slice_desc - Cache slice descriptor

-- 
2.48.1


