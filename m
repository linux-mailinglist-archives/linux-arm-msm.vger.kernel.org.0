Return-Path: <linux-arm-msm+bounces-20086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D80558CA394
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 23:00:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A6E5B21C41
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 21:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA128139D0C;
	Mon, 20 May 2024 21:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OhTcgxFz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526C81E48B;
	Mon, 20 May 2024 21:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716238829; cv=none; b=nWP9HyjaXyX1JKa0weuxkTrgz05FN1ZkfslzvxESJuPZ/eIL1RHkn2qSwDIs58tEy5CPoMZ8vLfUMPLXle7pCFfcZTxjfgvdp7XCTIqvEngwpkK05YNn3qTynyNKHys+NkKtR+RNZkUTK9/uJMFjwjs/RPfBR7UMkuoqcU6A/cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716238829; c=relaxed/simple;
	bh=QFlq0DXmtkTjW1Ku2vyCOjCe832OqT394crRAOfifu8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eUZWN7Viyn678MfJJOwfXsRfeA+4IuCgQWcG8OEbHDlbq3GlZhfsxcHXeuYl0giZAlngyK5M9vn89Ss2gq8f/RVAjZZyItrDDqRTqKYafiwvE8zFkfBa6yAiXyCihtmpvCdWxQ92mjLvWO24lnoXZjEZbnGCa8UbBtsmoJ1R4gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OhTcgxFz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44KCGReA031187;
	Mon, 20 May 2024 21:00:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=qcppdkim1; bh=djXFzQ2
	d0emsDYCFUwdXA11z4z5gEax25uReEAYLZ3g=; b=OhTcgxFzKsDmG3+pQot+u4Z
	FTIjnZqaaldKmnthXd8etIhjbRNqg6dEPVw2ICAnR8yWLEEIOvO6bN97Z/TQX5dP
	OHZWzQb8ea73Hloi7zKqiC3rgoiuSld+9xr9kEfdzZwuJuoj9vJTeKvpIebp7JcT
	9AOgT1Y3kF8RuqCWFwziC+FBcT56XFKzfrMPtkQZenySGx9hvlqeVkXyp1iqn685
	0mxzkHTk1Z+dIWNLFlzWNghTQXuWVgtaNTSqQfEq9FBAkp0QFaYIqDo2Gn/OB08j
	h8r2G4V/fgZCAfNpk9rQEaBL/zBQP3WjxGfqhGg2t6A5Ukphg3Nsmq+IH8+2Dvw=
	=
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6pqc45hp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 21:00:24 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 44KKwDpp004373;
	Mon, 20 May 2024 21:00:23 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 3y6ndmseh7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 21:00:23 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44KKtMuD032172;
	Mon, 20 May 2024 21:00:23 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-uchalich-lv.qualcomm.com [10.81.89.1])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 44KL0Nkv006635
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 21:00:23 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 4184210)
	id 4351EB08; Mon, 20 May 2024 14:00:21 -0700 (PDT)
From: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Unnathi Chalicheemala <quic_uchalich@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: [PATCH v5 2/5] soc: qcom: llcc: Add regmap for Broadcast_AND region
Date: Mon, 20 May 2024 14:00:14 -0700
Message-Id: <2c7654492ee436b41acddf2edc65d6722c3ad6aa.1716228054.git.quic_uchalich@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716228054.git.quic_uchalich@quicinc.com>
References: <cover.1716228054.git.quic_uchalich@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vjL-KeksJxdCbFLW5HtyEa6RzcAbP1rp
X-Proofpoint-GUID: vjL-KeksJxdCbFLW5HtyEa6RzcAbP1rp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-20_11,2024-05-17_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 suspectscore=0 mlxscore=0 clxscore=1011
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405200167

Define new regmap structure for Broadcast_AND region and initialize
this regmap when HW block version is greater than 4.1, otherwise
initialize as a NULL pointer for backwards compatibility.

Switch from broadcast_OR to broadcast_AND region (when defined in DT)
for checking status bit 1 as Broadcast_OR region checks only for bit 0.

Signed-off-by: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
Reviewed-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 drivers/soc/qcom/llcc-qcom.c       | 16 +++++++++++++++-
 include/linux/soc/qcom/llcc-qcom.h |  4 +++-
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index cbef0dea1d5d..5eac6aa567e7 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -821,6 +821,7 @@ EXPORT_SYMBOL_GPL(llcc_slice_putd);
 static int llcc_update_act_ctrl(u32 sid,
 				u32 act_ctrl_reg_val, u32 status)
 {
+	struct regmap *regmap;
 	u32 act_ctrl_reg;
 	u32 act_clear_reg;
 	u32 status_reg;
@@ -849,7 +850,8 @@ static int llcc_update_act_ctrl(u32 sid,
 		return ret;
 
 	if (drv_data->version >= LLCC_VERSION_4_1_0_0) {
-		ret = regmap_read_poll_timeout(drv_data->bcast_regmap, status_reg,
+		regmap = drv_data->bcast_and_regmap ?: drv_data->bcast_regmap;
+		ret = regmap_read_poll_timeout(regmap, status_reg,
 				      slice_status, (slice_status & ACT_COMPLETE),
 				      0, LLCC_STATUS_READ_DELAY);
 		if (ret)
@@ -1284,6 +1286,18 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 
 	drv_data->version = version;
 
+	/* Applicable only when drv_data->version >= 4.1 */
+	if (drv_data->version >= LLCC_VERSION_4_1_0_0) {
+		drv_data->bcast_and_regmap = qcom_llcc_init_mmio(pdev, i + 1, "llcc_broadcast_and_base");
+		if (IS_ERR(drv_data->bcast_and_regmap)) {
+			ret = PTR_ERR(drv_data->bcast_and_regmap);
+			if (ret == -EINVAL)
+				drv_data->bcast_and_regmap = NULL;
+			else
+				goto err;
+		}
+	}
+
 	llcc_cfg = cfg->sct_data;
 	sz = cfg->size;
 
diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
index 1a886666bbb6..9e9f528b1370 100644
--- a/include/linux/soc/qcom/llcc-qcom.h
+++ b/include/linux/soc/qcom/llcc-qcom.h
@@ -115,7 +115,8 @@ struct llcc_edac_reg_offset {
 /**
  * struct llcc_drv_data - Data associated with the llcc driver
  * @regmaps: regmaps associated with the llcc device
- * @bcast_regmap: regmap associated with llcc broadcast offset
+ * @bcast_regmap: regmap associated with llcc broadcast OR offset
+ * @bcast_and_regmap: regmap associated with llcc broadcast AND offset
  * @cfg: pointer to the data structure for slice configuration
  * @edac_reg_offset: Offset of the LLCC EDAC registers
  * @lock: mutex associated with each slice
@@ -129,6 +130,7 @@ struct llcc_edac_reg_offset {
 struct llcc_drv_data {
 	struct regmap **regmaps;
 	struct regmap *bcast_regmap;
+	struct regmap *bcast_and_regmap;
 	const struct llcc_slice_config *cfg;
 	const struct llcc_edac_reg_offset *edac_reg_offset;
 	struct mutex lock;
-- 
2.34.1


