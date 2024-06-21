Return-Path: <linux-arm-msm+bounces-23572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2408891245E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 13:49:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB86D28684B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 11:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8789117624D;
	Fri, 21 Jun 2024 11:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="M1XetzfO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC647176247;
	Fri, 21 Jun 2024 11:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718970487; cv=none; b=B1559PuihoXUUF5eYi3gfXs3hf+6aiIWu2jSkOObc7gulCG1sZN6RPFDi5Ld2o69NhxpFWS6Oe1VCbXQysHMaao7DXGPeJQNs3QihVObLuW/D7bp3wkSclL6WUvaGTZguxVfzuDmeGecsU44VUr0i3ikY3QWkpJ09KoxmLjtG1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718970487; c=relaxed/simple;
	bh=zvGc58ccyADJgetNMjYgm6LN8SCo7mtkaB4iFgXDuc0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b9YDJcBsxUMwq/nNdO5/dv7EoWvJQhJhSu0wZZoZu1P60oruMzEZa4IcfMvtNK7azFYWL7vd5wDPxUkSlfRnDDqbNaoC2jnf+w844veF+eSboWOMhdf2dGgfQBiI3sSQDB6F27kdB+0DgOri5vFWPWHfO2C1oOY92ZlM1kI1Ap8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=M1XetzfO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45L6EOvZ018342;
	Fri, 21 Jun 2024 11:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qSQacwBI9G91sD2Ot03AI9BEzwb1sZ66RtVuCXqOlGI=; b=M1XetzfOlkUK/isk
	uUBXCQRGHVKfJvx9ZBB7bvrBJSKmEHSLz59glOfHGHhHP34B6ue430I0A9BYtApM
	YMXx/I1aT1+KnSVPhbCk1HWMXbS2lctnYCJEv25YEjlGRltvCXeKpL2EitZaJ3YB
	zka01cth6WGpw+hhpchBB5Ty7jVAk3ofG/3l8zuC74cUdm5jUXzpkEcaBODenuoo
	CTaNxbsdknOa4KghEXvgu1SV4e3cFxahwOG3E46Vs25FAt/S/0j1hegSLbBx82j/
	m2Hcp1eNMbPtN1lP5qtjSBMkASLKARnXO317vcCdf4F8RjH1BV5/NL65E5KCYI+p
	YTrT5w==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yvrm0aerb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 11:47:37 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45LBlawI031069
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 11:47:36 GMT
Received: from hu-gokulsri-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 21 Jun 2024 04:47:31 -0700
From: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
To: <sboyd@kernel.org>, <andersson@kernel.org>, <bjorn.andersson@linaro.org>,
        <david.brown@linaro.org>, <devicetree@vger.kernel.org>,
        <jassisinghbrar@gmail.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <mark.rutland@arm.com>,
        <mturquette@baylibre.com>, <ohad@wizery.com>, <robh@kernel.org>,
        <sricharan@codeaurora.org>
CC: <gokulsri@codeaurora.org>
Subject: [PATCH v9 3/8] remoteproc: qcom: Add support for split q6 + m3 wlan firmware
Date: Fri, 21 Jun 2024 17:16:54 +0530
Message-ID: <20240621114659.2958170-4-quic_gokulsri@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621114659.2958170-1-quic_gokulsri@quicinc.com>
References: <20240621114659.2958170-1-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zy03PCKkPvQLH4s5ACvFec2elXSRe8KZ
X-Proofpoint-GUID: zy03PCKkPvQLH4s5ACvFec2elXSRe8KZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_04,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406210087

IPQ8074 supports split firmware for q6 and m3 as well.
So add support for loading the m3 firmware before q6.
Now the drivers works fine for both split and unified
firmwares.

Signed-off-by: Nikhil Prakash V <quic_nprakash@quicinc.com>
Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 33 +++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index e45e79d80238..d8b79765d5c6 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -139,6 +139,7 @@ struct q6v5_wcss {
 	u32 version;
 	bool requires_force_stop;
 	bool need_mem_protection;
+	const char *m3_firmware_name;
 
 	struct qcom_rproc_glink glink_subdev;
 	struct qcom_rproc_ssr ssr_subdev;
@@ -147,7 +148,8 @@ struct q6v5_wcss {
 struct wcss_data {
 	int (*init_clock)(struct q6v5_wcss *wcss);
 	int (*init_regulator)(struct q6v5_wcss *wcss);
-	const char *firmware_name;
+	const char *q6_firmware_name;
+	const char *m3_firmware_name;
 	unsigned int crash_reason_smem;
 	u32 version;
 	bool aon_reset_required;
@@ -789,8 +791,29 @@ static void *q6v5_wcss_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *i
 static int q6v5_wcss_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct q6v5_wcss *wcss = rproc->priv;
+	const struct firmware *m3_fw;
 	int ret;
 
+	if (wcss->m3_firmware_name) {
+		ret = request_firmware(&m3_fw, wcss->m3_firmware_name,
+				       wcss->dev);
+		if (ret)
+			goto skip_m3;
+
+		ret = qcom_mdt_load_no_init(wcss->dev, m3_fw,
+					    wcss->m3_firmware_name, 0,
+					    wcss->mem_region, wcss->mem_phys,
+					    wcss->mem_size, &wcss->mem_reloc);
+
+		release_firmware(m3_fw);
+
+		if (ret) {
+			dev_err(wcss->dev, "can't load m3_fw.bXX\n");
+			return ret;
+		}
+	}
+
+skip_m3:
 	if (wcss->need_mem_protection)
 		ret = qcom_mdt_load(wcss->dev, fw, rproc->firmware,
 				    WCNSS_PAS_ID, wcss->mem_region,
@@ -1071,7 +1094,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 		return -EPROBE_DEFER;
 
 	rproc = devm_rproc_alloc(&pdev->dev, pdev->name, desc->ops,
-				 desc->firmware_name, sizeof(*wcss));
+				 desc->q6_firmware_name, sizeof(*wcss));
 	if (!rproc) {
 		dev_err(&pdev->dev, "failed to allocate rproc\n");
 		return -ENOMEM;
@@ -1084,6 +1107,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 	wcss->version = desc->version;
 	wcss->requires_force_stop = desc->requires_force_stop;
 	wcss->need_mem_protection = desc->need_mem_protection;
+	wcss->m3_firmware_name = desc->m3_firmware_name;
 
 	ret = q6v5_wcss_init_mmio(wcss, pdev);
 	if (ret)
@@ -1141,7 +1165,8 @@ static void q6v5_wcss_remove(struct platform_device *pdev)
 
 static const struct wcss_data wcss_ipq8074_res_init = {
 	.init_clock = ipq8074_init_clock,
-	.firmware_name = "IPQ8074/q6_fw.mdt",
+	.q6_firmware_name = "IPQ8074/q6_fw.mdt",
+	.m3_firmware_name = "IPQ8074/m3_fw.mdt",
 	.crash_reason_smem = WCSS_CRASH_REASON,
 	.aon_reset_required = true,
 	.wcss_q6_reset_required = true,
@@ -1154,7 +1179,7 @@ static const struct wcss_data wcss_qcs404_res_init = {
 	.init_clock = qcs404_init_clock,
 	.init_regulator = qcs404_init_regulator,
 	.crash_reason_smem = WCSS_CRASH_REASON,
-	.firmware_name = "wcnss.mdt",
+	.q6_firmware_name = "wcnss.mdt",
 	.version = WCSS_QCS404,
 	.aon_reset_required = false,
 	.wcss_q6_reset_required = false,
-- 
2.34.1


