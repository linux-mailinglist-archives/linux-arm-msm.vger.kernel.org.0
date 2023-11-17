Return-Path: <linux-arm-msm+bounces-878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 275207EEF49
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 10:54:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 585E61C20905
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 09:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7142171BB;
	Fri, 17 Nov 2023 09:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bhVD9+yd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7F04A7;
	Fri, 17 Nov 2023 01:53:55 -0800 (PST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AH9JwBu001772;
	Fri, 17 Nov 2023 09:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=2RBmfYe9752QvQFKGNFw82xPadoOTPvqkZQK867U7RQ=;
 b=bhVD9+ydVJFVBI7DZ+Bw4AL+E0vepM1Sxa6itc/CpQCu020yJc5fx5c4QNC0MSxOaCbm
 paZv1k0tvso917JB+dNcuPPwgzgTCWieNO2lI00tGZMyBmsBet0jPMQZ0t69xF9e0xB7
 oOqhdQKNrquGem0nmv8Kts+OCp9PjvkeuybFn8um7aGsDaCxyJ9lXWKsGfkxIas7m0UM
 vjUM/xecK/B8dtcDOdiI5H7/crJQL439Z0nlbwHb9x/rCJj/oMyTqJJdKkjft27DHRcX
 ZZ0uhaddo+8S12eT4K2CQFySUTSJvhXMUPyyZaA/7CPhL//YmMTtVXd1JpBY7jJO/oI6 /w== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ue5exr24a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 09:53:52 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AH9roqt029711
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 09:53:50 GMT
Received: from blr-ubuntu-87.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Fri, 17 Nov 2023 01:53:45 -0800
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC: <agross@kernel.org>, <conor+dt@kernel.org>, <quic_rjendra@quicinc.com>,
        <abel.vesa@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_tsoni@quicinc.com>, <neil.armstrong@linaro.org>,
        Sibi Sankar
	<quic_sibis@quicinc.com>
Subject: [PATCH V2 2/2] soc: qcom: llcc: Add configuration data for X1E80100
Date: Fri, 17 Nov 2023 15:23:15 +0530
Message-ID: <20231117095315.2087-3-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231117095315.2087-1-quic_sibis@quicinc.com>
References: <20231117095315.2087-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Z8ndNW82CwFzc241jl3xzlncZsb07qS5
X-Proofpoint-ORIG-GUID: Z8ndNW82CwFzc241jl3xzlncZsb07qS5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_07,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311170072

From: Rajendra Nayak <quic_rjendra@quicinc.com>

Add LLCC configuration data for X1E80100 SoC.

Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
Co-developed-by: Sibi Sankar <quic_sibis@quicinc.com>
Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---

v2:
* Update the part number from sc8380xp to x1e80100.
* Pickup Rbs.

 drivers/soc/qcom/llcc-qcom.c | 39 ++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 674abd0d6700..bc83cefae403 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -392,6 +392,29 @@ static const struct llcc_slice_config qdu1000_data_8ch[] = {
 	{ LLCC_WRCACHE, 31, 512,  1, 1, 0x3,   0x0, 0, 0, 0, 0, 1, 0, 0 },
 };
 
+static const struct llcc_slice_config x1e80100_data[] = {
+	{LLCC_CPUSS,	 1, 6144, 1, 1, 0xFFF, 0x0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_VIDSC0,	 2,  512, 3, 1, 0xFFF, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_AUDIO,	 6, 3072, 1, 1, 0xFFF, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_CMPT,     10, 6144, 1, 1, 0xFFF, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_GPUHTW,   11, 1024, 1, 1, 0xFFF, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_GPU,       9, 4096, 1, 1, 0xFFF, 0x0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_MMUHWT,   18,  512, 1, 1, 0xFFF, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_AUDHW,    22, 1024, 1, 1, 0xFFF, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_CVP,       8,  512, 3, 1, 0xFFF, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_WRCACHE,  31,  512, 1, 1, 0xFFF, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_CAMEXP1,   7, 3072, 2, 1, 0xFFF, 0x0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_LCPDARE,  30,  512, 3, 1, 0xFFF, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_AENPU,     3, 3072, 1, 1, 0xFFF, 0x0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_ISLAND1,  12,  512, 7, 1,   0x1, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_ISLAND2,  13,  512, 7, 1,   0x2, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_ISLAND3,  14,  512, 7, 1,   0x3, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_ISLAND4,  15,  512, 7, 1,   0x4, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_CAMEXP2,  19, 3072, 3, 1, 0xFFF, 0x0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_CAMEXP3,  20, 3072, 3, 1, 0xFFF, 0x0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_CAMEXP4,  21, 3072, 3, 1, 0xFFF, 0x0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+};
+
 static const struct llcc_edac_reg_offset llcc_v1_edac_reg_offset = {
 	.trp_ecc_error_status0 = 0x20344,
 	.trp_ecc_error_status1 = 0x20348,
@@ -610,6 +633,16 @@ static const struct qcom_llcc_config sm8550_cfg[] = {
 	},
 };
 
+static const struct qcom_llcc_config x1e80100_cfg[] = {
+	{
+		.sct_data	= x1e80100_data,
+		.size		= ARRAY_SIZE(x1e80100_data),
+		.need_llcc_cfg	= true,
+		.reg_offset	= llcc_v2_1_reg_offset,
+		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
+	},
+};
+
 static const struct qcom_sct_config qdu1000_cfgs = {
 	.llcc_config	= qdu1000_cfg,
 	.num_config	= ARRAY_SIZE(qdu1000_cfg),
@@ -675,6 +708,11 @@ static const struct qcom_sct_config sm8550_cfgs = {
 	.num_config	= ARRAY_SIZE(sm8550_cfg),
 };
 
+static const struct qcom_sct_config x1e80100_cfgs = {
+	.llcc_config	= x1e80100_cfg,
+	.num_config	= ARRAY_SIZE(x1e80100_cfg),
+};
+
 static struct llcc_drv_data *drv_data = (void *) -EPROBE_DEFER;
 
 /**
@@ -1249,6 +1287,7 @@ static const struct of_device_id qcom_llcc_of_match[] = {
 	{ .compatible = "qcom,sm8350-llcc", .data = &sm8350_cfgs },
 	{ .compatible = "qcom,sm8450-llcc", .data = &sm8450_cfgs },
 	{ .compatible = "qcom,sm8550-llcc", .data = &sm8550_cfgs },
+	{ .compatible = "qcom,x1e80100-llcc", .data = &x1e80100_cfgs },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_llcc_of_match);
-- 
2.17.1


