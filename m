Return-Path: <linux-arm-msm+bounces-21326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C24E98D675A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 18:53:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A01D0B2AD54
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 16:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29572176AA5;
	Fri, 31 May 2024 16:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jYMjAkiE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926C916EC13;
	Fri, 31 May 2024 16:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717173949; cv=none; b=oVS59qkJgx8fm28EXM20EOw0DS89a96uG9iYrds6AUXJQA6NRV11C1zGHEK3L+TA1y6NlZK2sMfppDrr8yEy5QmKZ0mfNUz8o39gP07v3o7uXIDzbV48iSmDjXPgaOcL3ys09WkLeFykwqQn+uAQOBMk8R0t+Cj0pr3kw1dJbM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717173949; c=relaxed/simple;
	bh=RbZD+yLcpnxpV92stw1OCbes4Q2Jv462EV1AFbNOL+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U0zKX88ardJmmsgs7kbPnTsIV4I18+oWJFJ1tvEotW01HWjKRbHM1fyijVrS0MN/uiw0BwpRFOzMgfy82EuL2AS074YZNU7NeEqrJcQlp+JPVZ6quwRxmXtuvQBS8srQL0n/RRSgYmWR1n8h3+y6Ha5DWTMAvCtguZdzbc5Ou/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jYMjAkiE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V9phRw002576;
	Fri, 31 May 2024 16:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eNDpmhm785E
	cU5egj/ehOxxnGjFjG0onPE4C+tgm6l4=; b=jYMjAkiEGmgTLfSNKAB9BOi1Cve
	WUljA0hzcZqqRWhGnN1JGzYMOXZfpJCxBRJUp/SqSr6hTxJ2DnLWeOoPygnSkxOr
	XM6kxcKkxgPMqITnIdhH6Exffn5u7gA0Ghx/K4PZTkLnnwO/R4XlFQKLHVExphdp
	dOJPuaiIU93Q7Qp4CcBcgICXyXxRk5vv+w2ZMPJw14j/D2iZ6b5WDlyFmSI5WLcE
	dSUIJhtQJEYvZlGqRs/U7cdKPV0XF3GtzY8vpEouGUaZtCO+5HDHRO0G1PBc7cJr
	lpOWTaItWKekEubP2FCDS5JTlcz+L/5Zg0bQqixAc2qjMjZCLZrnCCwRJGg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfc9nh12f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 16:45:43 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 44VGjgQ1000508;
	Fri, 31 May 2024 16:45:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 3yfd4ta3av-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 16:45:42 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44VGYrIv019581;
	Fri, 31 May 2024 16:45:42 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-uchalich-lv.qualcomm.com [10.81.89.1])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 44VGjgLf000503
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 16:45:42 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 4184210)
	id 15FEC658; Fri, 31 May 2024 09:45:42 -0700 (PDT)
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
Subject: [PATCH v6 2/5] soc: qcom: llcc: Add regmap for Broadcast_AND region
Date: Fri, 31 May 2024 09:45:25 -0700
Message-Id: <9cf19928a67eaa577ae0f02de5bf86276be34ea2.1717014052.git.quic_uchalich@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717014052.git.quic_uchalich@quicinc.com>
References: <cover.1717014052.git.quic_uchalich@quicinc.com>
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
X-Proofpoint-ORIG-GUID: e7jeBZSQduZzXYqfjlXDgHiBfwWJzhp0
X-Proofpoint-GUID: e7jeBZSQduZzXYqfjlXDgHiBfwWJzhp0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_12,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 spamscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310127

Until SM8450, there was only one broadcast region (Broadcast_OR)
used to broadcast write and check for status bit 0.
From SM8450 onwards another broadcast region (Broadcast_AND) has been
added which checks for status bit 1. This hasn't been updated and
Broadcast_OR region was wrongly being used to check for status bit 1 all
along.

Hence define new regmap structure for Broadcast_AND region and initialize
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
index cbef0dea1d5d..668e0cb6a925 100644
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


