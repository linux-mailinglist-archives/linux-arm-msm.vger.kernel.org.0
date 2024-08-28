Return-Path: <linux-arm-msm+bounces-29704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE85A961CB9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 05:06:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A50742853C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 03:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE62145A0F;
	Wed, 28 Aug 2024 03:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dnlNCrAc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAF213E023;
	Wed, 28 Aug 2024 03:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724814346; cv=none; b=pgoAsJTkvnRwBp4/ia7YI+5IgKHMxkUzr5jUQV58rXgToDV/8HeiE9euarM3npb0/owChB3PEadDiGyTle29FJEQP5SjZ+/QgZHvh+c3dKk6fq0EFRF3BCj/kVI/1ofTtRK3khD7D2XBopkeuMXWbPQgE0M4L0zkAZCafCoNxyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724814346; c=relaxed/simple;
	bh=DEANYYUC732mJ6l1JPJ8NBjJnnuAALDmZ5WjJY7Fojo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K3/h7Kw5b9VkBKlM1oPRfNRjen3Mt6ILDhkP+momM1pjx3OYkgwFoaq6YqAOYuEFRzOFB0MUl8WzqupHXmZFMSH+GeAtsZd6STlpFa0vQfqBdMgnv3e3OYAjhSm1nGp1IkCMQWXTC0ii3Mrh92dZ8PvsAynRogWFTwjNGS0Ew5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dnlNCrAc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RLZugk001941;
	Wed, 28 Aug 2024 03:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M4F60F0rBoSpFONUEcy3jhOmQ1ejE4dsZxEVlIEgRFA=; b=dnlNCrAcORxpOjuE
	6OszrzSyOI9o3hXTsXHJ8UM+zp2GCoMvOR6S3hLdZjCPVpg48GRIppO4gs/hVR2B
	vCviEvLFwoH4FYLdBmo/8CMXoqcpimbziGSQnzWrgL0c6l+yebRwEIy2DTHg9tEn
	ONLELyRj+zbnruTdLnO5G586AFBdMVf6UE2/fs6wZsZpT5Jo+k44BlyGTKDgMEQi
	PVl6wh9YjJANwRXHc/TzY9BfJekNbCKja52Gc2e1WZlU/prLijHhElTNbcDfxkPX
	Yg8iEEiLrXz2gwxnIUw46ZCaLbTzKTHlIOBMphrEW1mnW6E+/wUaEPe8rW3o9ei7
	O2hgNg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puuggyu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 03:05:40 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47S35dGv022975
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 03:05:39 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 27 Aug 2024 20:05:35 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
To: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <andersson@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <mathieu.poirier@linaro.org>,
        <bartosz.golaszewski@linaro.or>, <quic_tingweiz@quicinc.com>,
        <quic_aiquny@quicinc.com>, <quic_tengfan@quicinc.com>
CC: <quic_jingyw@quicinc.com>, Xin Liu <quic_liuxin@quicinc.com>
Subject: [PATCH 2/2] remoteproc: qcom: pas: Add QCS8300 remoteproc support
Date: Wed, 28 Aug 2024 11:05:11 +0800
Message-ID: <20240828030511.443605-3-quic_jingyw@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240828030511.443605-1-quic_jingyw@quicinc.com>
References: <20240828030511.443605-1-quic_jingyw@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uWKYzc3QvKWref52gbduu0hKrUDHvB6k
X-Proofpoint-GUID: uWKYzc3QvKWref52gbduu0hKrUDHvB6k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_01,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280020

Add support for PIL loading on ADSP, CDSP and GPDSP on QCS8300
platform.

Co-developed-by: Xin Liu <quic_liuxin@quicinc.com>
Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 55 ++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ef82835e98a4..368aa9cc0051 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -857,6 +857,58 @@ static const struct adsp_data sdm845_adsp_resource_init = {
 	.ssctl_id = 0x14,
 };
 
+static const struct adsp_data qcs8300_adsp_resource = {
+	.crash_reason_smem = 423,
+	.firmware_name = "adsp.mdt",
+	.pas_id = 1,
+	.minidump_id = 5,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"lcx",
+		"lmx",
+		NULL
+	},
+	.load_state = "adsp",
+	.ssr_name = "lpass",
+	.sysmon_name = "adsp",
+	.ssctl_id = 0x14,
+};
+
+static const struct adsp_data qcs8300_cdsp_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp0.mdt",
+	.pas_id = 18,
+	.minidump_id = 7,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mxc",
+		"nsp0",
+		NULL
+	},
+	.load_state = "cdsp",
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+};
+
+static const struct adsp_data qcs8300_gpdsp_resource = {
+	.crash_reason_smem = 640,
+	.firmware_name = "gpdsp0.mdt",
+	.pas_id = 39,
+	.minidump_id = 21,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mxc",
+		NULL
+	},
+	.load_state = "gpdsp",
+	.ssr_name = "gpdsp",
+	.sysmon_name = "gpdsp",
+	.ssctl_id = 0x21,
+};
+
 static const struct adsp_data sm6350_adsp_resource = {
 	.crash_reason_smem = 423,
 	.firmware_name = "adsp.mdt",
@@ -1416,6 +1468,9 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,qcs404-adsp-pas", .data = &adsp_resource_init },
 	{ .compatible = "qcom,qcs404-cdsp-pas", .data = &cdsp_resource_init },
 	{ .compatible = "qcom,qcs404-wcss-pas", .data = &wcss_resource_init },
+	{ .compatible = "qcom,qcs8300-adsp-pas", .data = &qcs8300_adsp_resource},
+	{ .compatible = "qcom,qcs8300-cdsp-pas", .data = &qcs8300_cdsp_resource},
+	{ .compatible = "qcom,qcs8300-gpdsp-pas", .data = &qcs8300_gpdsp_resource},
 	{ .compatible = "qcom,sa8775p-adsp-pas", .data = &sa8775p_adsp_resource},
 	{ .compatible = "qcom,sa8775p-cdsp0-pas", .data = &sa8775p_cdsp0_resource},
 	{ .compatible = "qcom,sa8775p-cdsp1-pas", .data = &sa8775p_cdsp1_resource},
-- 
2.25.1


