Return-Path: <linux-arm-msm+bounces-29072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AD39581BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 11:13:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86A031F217FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 09:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67A921891A4;
	Tue, 20 Aug 2024 09:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d39Qe7Bd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6504B4595B;
	Tue, 20 Aug 2024 09:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724145177; cv=none; b=b5KNel9hUrM8gp7WnGQHYXEO+cL1go3r/7XFjyeuMlgqXwDpyXALEpw9B3+8PhiZEmBNKC3VR4NswSIGSvvnmoyD3YfYAMVHj3PQjYpuV2V0ldT35QJpl4kzAssQWbsxeKmgJ8kq9rk1gT5hg6lqzVSG92ahNszQCbzSxq/Ypjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724145177; c=relaxed/simple;
	bh=wUpjMbBh8CdJRFEgB5pw5mJZ0hcZfnKMvYipWganCKo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=D6PsagmwMm88bA4u+9jbK+onri+QGIu92yrd4+dAqS5Lh38ofBCk95e1pKA9hhMpl6JT/o5tGvqs9ABpZxFB99vuvbzk/PbjKA/K8PNLSDUfIHJhryDSaQJEckeFJAiY5TbVl0DyPnfZ6/piVu+E+Uex94HL6Dr2RaVPyb0CtoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d39Qe7Bd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47K3cQv1003163;
	Tue, 20 Aug 2024 09:12:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Po3nzEL1wWi7hTzynC0PaR
	zPSgbZyTb8+5oPJvd9FAA=; b=d39Qe7BdnUQoL/B+ExNDyg6ddbNBJ/1EECnpE2
	nL3kR+CNqzENfsho7UtnuRqJLKADQyZ8JO58NJDY5W7qecpLzPDb3YR9/cG5tI+V
	wq8puj/1+YH4YCunEyCXOJMLYdHGzvbRl5ao90hEkBgmLTWX2u6M+yrTDRBo1MOF
	0qONbrNxxgCJ6E5MN+uvnbWAdF2Jk6iHUrUm47oD1JA5u3LjGdW8RV2fb0mKWOdD
	1S1y1CELwqbPVMlGX7cHOMABLdnmpQ3hUr8V1hO3hI2uWFOcVOqUPlQl1JCB8nov
	fku7DJjIxX501da5MurmtcA9EOt5x0Z9ss2ETWlhHQqJ/cuQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4145ywax4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 09:12:51 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47K9CowZ010600
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 09:12:50 GMT
Received: from hu-gokulsri-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 20 Aug 2024 02:12:48 -0700
From: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
To: <andersson@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_viswanat@quicinc.com>, <quic_varada@quicinc.com>,
        <quic_srichara@quicinc.com>
Subject: [PATCH V5 1/1] remoteproc: qcom: q6v5: Get crash reason from specific SMEM partition
Date: Tue, 20 Aug 2024 14:42:31 +0530
Message-ID: <20240820091231.445580-1-quic_gokulsri@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-ORIG-GUID: 8Cp-UG3NWriXazmmNfHt6h3U78qNEgSi
X-Proofpoint-GUID: 8Cp-UG3NWriXazmmNfHt6h3U78qNEgSi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-20_09,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 bulkscore=0 phishscore=0 mlxscore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408200067

From: Vignesh Viswanathan <quic_viswanat@quicinc.com>

q6v5 fatal and watchdog IRQ handlers always retrieves the crash reason
information from SMEM global partition (QCOM_SMEM_HOST_ANY).

For some targets like IPQ9574 and IPQ5332, crash reason information is
present in target specific partition due to which the crash reason is
not printed in the current implementation.

Add support to pass crash_reason_partition along with crash_reason_item
number in qcom_q6v5_init call and use the same to get the crash information
from SMEM in fatal and watchdog IRQ handlers.

While at it, rename all instances of "crash_reason_smem" with
"crash_reason_item" as this reflects the proper meaning.

Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
---

This change depends on WCSS secure PIL driver [1].

Changes in V5: Added changes to WCSS secure PIL driver.

Changes in V4: Rename all instances of crash_reason_smem to
crash_reason_item

Changes in V3: Updated commit message.

Changes in V2: Addressed comments in V1.

[1] https://patchwork.kernel.org/project/linux-arm-msm/cover/20240820085517.435566-1-quic_gokulsri@quicinc.com/

 drivers/remoteproc/qcom_q6v5.c          | 10 ++--
 drivers/remoteproc/qcom_q6v5.h          |  6 ++-
 drivers/remoteproc/qcom_q6v5_adsp.c     | 17 +++---
 drivers/remoteproc/qcom_q6v5_mss.c      |  5 +-
 drivers/remoteproc/qcom_q6v5_pas.c      | 69 +++++++++++++------------
 drivers/remoteproc/qcom_q6v5_wcss.c     | 12 +++--
 drivers/remoteproc/qcom_q6v5_wcss_sec.c |  3 +-
 7 files changed, 66 insertions(+), 56 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index 4ee5e67a9f03..4d801ba3c791 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -100,7 +100,7 @@ static irqreturn_t q6v5_wdog_interrupt(int irq, void *data)
 		return IRQ_HANDLED;
 	}
 
-	msg = qcom_smem_get(QCOM_SMEM_HOST_ANY, q6v5->crash_reason, &len);
+	msg = qcom_smem_get(q6v5->crash_reason_partition, q6v5->crash_reason_item, &len);
 	if (!IS_ERR(msg) && len > 0 && msg[0])
 		dev_err(q6v5->dev, "watchdog received: %s\n", msg);
 	else
@@ -121,7 +121,7 @@ static irqreturn_t q6v5_fatal_interrupt(int irq, void *data)
 	if (!q6v5->running)
 		return IRQ_HANDLED;
 
-	msg = qcom_smem_get(QCOM_SMEM_HOST_ANY, q6v5->crash_reason, &len);
+	msg = qcom_smem_get(q6v5->crash_reason_partition, q6v5->crash_reason_item, &len);
 	if (!IS_ERR(msg) && len > 0 && msg[0])
 		dev_err(q6v5->dev, "fatal error received: %s\n", msg);
 	else
@@ -244,14 +244,16 @@ EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
  * Return: 0 on success, negative errno on failure
  */
 int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
-		   struct rproc *rproc, int crash_reason, const char *load_state,
+		   struct rproc *rproc, int crash_reason_partition,
+		   int crash_reason_item, const char *load_state,
 		   void (*handover)(struct qcom_q6v5 *q6v5))
 {
 	int ret;
 
 	q6v5->rproc = rproc;
 	q6v5->dev = &pdev->dev;
-	q6v5->crash_reason = crash_reason;
+	q6v5->crash_reason_partition = crash_reason_partition;
+	q6v5->crash_reason_item = crash_reason_item;
 	q6v5->handover = handover;
 
 	init_completion(&q6v5->start_done);
diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
index 5a859c41896e..7cdfa21fd9e4 100644
--- a/drivers/remoteproc/qcom_q6v5.h
+++ b/drivers/remoteproc/qcom_q6v5.h
@@ -34,7 +34,8 @@ struct qcom_q6v5 {
 	struct completion start_done;
 	struct completion stop_done;
 
-	int crash_reason;
+	int crash_reason_partition;
+	int crash_reason_item;
 
 	bool running;
 
@@ -43,7 +44,8 @@ struct qcom_q6v5 {
 };
 
 int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
-		   struct rproc *rproc, int crash_reason, const char *load_state,
+		   struct rproc *rproc, int crash_reason_partition,
+		   int crash_reason_item, const char *load_state,
 		   void (*handover)(struct qcom_q6v5 *q6v5));
 void qcom_q6v5_deinit(struct qcom_q6v5 *q6v5);
 
diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 572dcb0f055b..174b0e213b12 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -60,7 +60,7 @@
 #define LPASS_EFUSE_Q6SS_EVB_SEL 0x0
 
 struct adsp_pil_data {
-	int crash_reason_smem;
+	int crash_reason_item;
 	const char *firmware_name;
 
 	const char *ssr_name;
@@ -97,7 +97,7 @@ struct qcom_adsp {
 	struct regmap *halt_map;
 	unsigned int halt_lpass;
 
-	int crash_reason_smem;
+	int crash_reason_item;
 	const char *info_name;
 
 	struct completion start_done;
@@ -721,8 +721,9 @@ static int adsp_probe(struct platform_device *pdev)
 	if (ret)
 		goto disable_pm;
 
-	ret = qcom_q6v5_init(&adsp->q6v5, pdev, rproc, desc->crash_reason_smem,
-			     desc->load_state, qcom_adsp_pil_handover);
+	ret = qcom_q6v5_init(&adsp->q6v5, pdev, rproc, QCOM_SMEM_HOST_ANY,
+			     desc->crash_reason_item, desc->load_state,
+			     qcom_adsp_pil_handover);
 	if (ret)
 		goto disable_pm;
 
@@ -764,7 +765,7 @@ static void adsp_remove(struct platform_device *pdev)
 }
 
 static const struct adsp_pil_data adsp_resource_init = {
-	.crash_reason_smem = 423,
+	.crash_reason_item = 423,
 	.firmware_name = "adsp.mdt",
 	.ssr_name = "lpass",
 	.sysmon_name = "adsp",
@@ -781,7 +782,7 @@ static const struct adsp_pil_data adsp_resource_init = {
 };
 
 static const struct adsp_pil_data adsp_sc7280_resource_init = {
-	.crash_reason_smem = 423,
+	.crash_reason_item = 423,
 	.firmware_name = "adsp.pbn",
 	.load_state = "adsp",
 	.ssr_name = "lpass",
@@ -796,7 +797,7 @@ static const struct adsp_pil_data adsp_sc7280_resource_init = {
 };
 
 static const struct adsp_pil_data cdsp_resource_init = {
-	.crash_reason_smem = 601,
+	.crash_reason_item = 601,
 	.firmware_name = "cdsp.mdt",
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
@@ -813,7 +814,7 @@ static const struct adsp_pil_data cdsp_resource_init = {
 };
 
 static const struct adsp_pil_data wpss_resource_init = {
-	.crash_reason_smem = 626,
+	.crash_reason_item = 626,
 	.firmware_name = "wpss.mdt",
 	.ssr_name = "wpss",
 	.sysmon_name = "wpss",
diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 2a42215ce8e0..bfa2a1966e83 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -26,6 +26,7 @@
 #include <linux/remoteproc.h>
 #include <linux/reset.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <linux/soc/qcom/smem.h>
 #include <linux/iopoll.h>
 #include <linux/slab.h>
 
@@ -2094,8 +2095,8 @@ static int q6v5_probe(struct platform_device *pdev)
 	qproc->need_mem_protection = desc->need_mem_protection;
 	qproc->has_mba_logs = desc->has_mba_logs;
 
-	ret = qcom_q6v5_init(&qproc->q6v5, pdev, rproc, MPSS_CRASH_REASON_SMEM, "modem",
-			     qcom_msa_handover);
+	ret = qcom_q6v5_init(&qproc->q6v5, pdev, rproc, QCOM_SMEM_HOST_ANY,
+			     MPSS_CRASH_REASON_SMEM, "modem", qcom_msa_handover);
 	if (ret)
 		goto detach_proxy_pds;
 
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 88e7b84f223c..ab34bcde7331 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -36,7 +36,7 @@
 #define MAX_ASSIGN_COUNT 3
 
 struct adsp_data {
-	int crash_reason_smem;
+	int crash_reason_item;
 	const char *firmware_name;
 	const char *dtb_firmware_name;
 	int pas_id;
@@ -81,7 +81,7 @@ struct qcom_adsp {
 	int dtb_pas_id;
 	int lite_pas_id;
 	unsigned int minidump_id;
-	int crash_reason_smem;
+	int crash_reason_item;
 	unsigned int smem_host_id;
 	bool decrypt_shutdown;
 	const char *info_name;
@@ -771,7 +771,8 @@ static int adsp_probe(struct platform_device *pdev)
 		goto free_rproc;
 	adsp->proxy_pd_count = ret;
 
-	ret = qcom_q6v5_init(&adsp->q6v5, pdev, rproc, desc->crash_reason_smem, desc->load_state,
+	ret = qcom_q6v5_init(&adsp->q6v5, pdev, rproc, QCOM_SMEM_HOST_ANY,
+			     desc->crash_reason_item, desc->load_state,
 			     qcom_pas_handover);
 	if (ret)
 		goto detach_proxy_pds;
@@ -820,7 +821,7 @@ static void adsp_remove(struct platform_device *pdev)
 }
 
 static const struct adsp_data adsp_resource_init = {
-	.crash_reason_smem = 423,
+	.crash_reason_item = 423,
 	.firmware_name = "adsp.mdt",
 	.pas_id = 1,
 	.auto_boot = true,
@@ -830,7 +831,7 @@ static const struct adsp_data adsp_resource_init = {
 };
 
 static const struct adsp_data sdm845_adsp_resource_init = {
-	.crash_reason_smem = 423,
+	.crash_reason_item = 423,
 	.firmware_name = "adsp.mdt",
 	.pas_id = 1,
 	.auto_boot = true,
@@ -841,7 +842,7 @@ static const struct adsp_data sdm845_adsp_resource_init = {
 };
 
 static const struct adsp_data sm6350_adsp_resource = {
-	.crash_reason_smem = 423,
+	.crash_reason_item = 423,
 	.firmware_name = "adsp.mdt",
 	.pas_id = 1,
 	.auto_boot = true,
@@ -857,7 +858,7 @@ static const struct adsp_data sm6350_adsp_resource = {
 };
 
 static const struct adsp_data sm6375_mpss_resource = {
-	.crash_reason_smem = 421,
+	.crash_reason_item = 421,
 	.firmware_name = "modem.mdt",
 	.pas_id = 4,
 	.minidump_id = 3,
@@ -872,7 +873,7 @@ static const struct adsp_data sm6375_mpss_resource = {
 };
 
 static const struct adsp_data sm8150_adsp_resource = {
-	.crash_reason_smem = 423,
+	.crash_reason_item = 423,
 	.firmware_name = "adsp.mdt",
 	.pas_id = 1,
 	.auto_boot = true,
@@ -887,7 +888,7 @@ static const struct adsp_data sm8150_adsp_resource = {
 };
 
 static const struct adsp_data sm8250_adsp_resource = {
-	.crash_reason_smem = 423,
+	.crash_reason_item = 423,
 	.firmware_name = "adsp.mdt",
 	.pas_id = 1,
 	.auto_boot = true,
@@ -903,7 +904,7 @@ static const struct adsp_data sm8250_adsp_resource = {
 };
 
 static const struct adsp_data sm8350_adsp_resource = {
-	.crash_reason_smem = 423,
+	.crash_reason_item = 423,
 	.firmware_name = "adsp.mdt",
 	.pas_id = 1,
 	.auto_boot = true,
@@ -919,7 +920,7 @@ static const struct adsp_data sm8350_adsp_resource = {
 };
 
 static const struct adsp_data msm8996_adsp_resource = {
-	.crash_reason_smem = 423,
+	.crash_reason_item = 423,
 	.firmware_name = "adsp.mdt",
 	.pas_id = 1,
 	.auto_boot = true,
@@ -933,7 +934,7 @@ static const struct adsp_data msm8996_adsp_resource = {
 };
 
 static const struct adsp_data cdsp_resource_init = {
-	.crash_reason_smem = 601,
+	.crash_reason_item = 601,
 	.firmware_name = "cdsp.mdt",
 	.pas_id = 18,
 	.auto_boot = true,
@@ -943,7 +944,7 @@ static const struct adsp_data cdsp_resource_init = {
 };
 
 static const struct adsp_data sdm845_cdsp_resource_init = {
-	.crash_reason_smem = 601,
+	.crash_reason_item = 601,
 	.firmware_name = "cdsp.mdt",
 	.pas_id = 18,
 	.auto_boot = true,
@@ -954,7 +955,7 @@ static const struct adsp_data sdm845_cdsp_resource_init = {
 };
 
 static const struct adsp_data sm6350_cdsp_resource = {
-	.crash_reason_smem = 601,
+	.crash_reason_item = 601,
 	.firmware_name = "cdsp.mdt",
 	.pas_id = 18,
 	.auto_boot = true,
@@ -970,7 +971,7 @@ static const struct adsp_data sm6350_cdsp_resource = {
 };
 
 static const struct adsp_data sm8150_cdsp_resource = {
-	.crash_reason_smem = 601,
+	.crash_reason_item = 601,
 	.firmware_name = "cdsp.mdt",
 	.pas_id = 18,
 	.auto_boot = true,
@@ -985,7 +986,7 @@ static const struct adsp_data sm8150_cdsp_resource = {
 };
 
 static const struct adsp_data sm8250_cdsp_resource = {
-	.crash_reason_smem = 601,
+	.crash_reason_item = 601,
 	.firmware_name = "cdsp.mdt",
 	.pas_id = 18,
 	.auto_boot = true,
@@ -1000,7 +1001,7 @@ static const struct adsp_data sm8250_cdsp_resource = {
 };
 
 static const struct adsp_data sc8280xp_nsp0_resource = {
-	.crash_reason_smem = 601,
+	.crash_reason_item = 601,
 	.firmware_name = "cdsp.mdt",
 	.pas_id = 18,
 	.auto_boot = true,
@@ -1014,7 +1015,7 @@ static const struct adsp_data sc8280xp_nsp0_resource = {
 };
 
 static const struct adsp_data sc8280xp_nsp1_resource = {
-	.crash_reason_smem = 633,
+	.crash_reason_item = 633,
 	.firmware_name = "cdsp.mdt",
 	.pas_id = 30,
 	.auto_boot = true,
@@ -1028,7 +1029,7 @@ static const struct adsp_data sc8280xp_nsp1_resource = {
 };
 
 static const struct adsp_data x1e80100_adsp_resource = {
-	.crash_reason_smem = 423,
+	.crash_reason_item = 423,
 	.firmware_name = "adsp.mdt",
 	.dtb_firmware_name = "adsp_dtb.mdt",
 	.pas_id = 1,
@@ -1048,7 +1049,7 @@ static const struct adsp_data x1e80100_adsp_resource = {
 };
 
 static const struct adsp_data x1e80100_cdsp_resource = {
-	.crash_reason_smem = 601,
+	.crash_reason_item = 601,
 	.firmware_name = "cdsp.mdt",
 	.dtb_firmware_name = "cdsp_dtb.mdt",
 	.pas_id = 18,
@@ -1068,7 +1069,7 @@ static const struct adsp_data x1e80100_cdsp_resource = {
 };
 
 static const struct adsp_data sm8350_cdsp_resource = {
-	.crash_reason_smem = 601,
+	.crash_reason_item = 601,
 	.firmware_name = "cdsp.mdt",
 	.pas_id = 18,
 	.auto_boot = true,
@@ -1084,7 +1085,7 @@ static const struct adsp_data sm8350_cdsp_resource = {
 };
 
 static const struct adsp_data mpss_resource_init = {
-	.crash_reason_smem = 421,
+	.crash_reason_item = 421,
 	.firmware_name = "modem.mdt",
 	.pas_id = 4,
 	.minidump_id = 3,
@@ -1101,7 +1102,7 @@ static const struct adsp_data mpss_resource_init = {
 };
 
 static const struct adsp_data sc8180x_mpss_resource = {
-	.crash_reason_smem = 421,
+	.crash_reason_item = 421,
 	.firmware_name = "modem.mdt",
 	.pas_id = 4,
 	.auto_boot = false,
@@ -1116,7 +1117,7 @@ static const struct adsp_data sc8180x_mpss_resource = {
 };
 
 static const struct adsp_data msm8996_slpi_resource_init = {
-	.crash_reason_smem = 424,
+	.crash_reason_item = 424,
 	.firmware_name = "slpi.mdt",
 	.pas_id = 12,
 	.auto_boot = true,
@@ -1130,7 +1131,7 @@ static const struct adsp_data msm8996_slpi_resource_init = {
 };
 
 static const struct adsp_data sdm845_slpi_resource_init = {
-	.crash_reason_smem = 424,
+	.crash_reason_item = 424,
 	.firmware_name = "slpi.mdt",
 	.pas_id = 12,
 	.auto_boot = true,
@@ -1146,7 +1147,7 @@ static const struct adsp_data sdm845_slpi_resource_init = {
 };
 
 static const struct adsp_data wcss_resource_init = {
-	.crash_reason_smem = 421,
+	.crash_reason_item = 421,
 	.firmware_name = "wcnss.mdt",
 	.pas_id = 6,
 	.auto_boot = true,
@@ -1156,7 +1157,7 @@ static const struct adsp_data wcss_resource_init = {
 };
 
 static const struct adsp_data sdx55_mpss_resource = {
-	.crash_reason_smem = 421,
+	.crash_reason_item = 421,
 	.firmware_name = "modem.mdt",
 	.pas_id = 4,
 	.auto_boot = true,
@@ -1171,7 +1172,7 @@ static const struct adsp_data sdx55_mpss_resource = {
 };
 
 static const struct adsp_data sm8450_mpss_resource = {
-	.crash_reason_smem = 421,
+	.crash_reason_item = 421,
 	.firmware_name = "modem.mdt",
 	.pas_id = 4,
 	.minidump_id = 3,
@@ -1189,7 +1190,7 @@ static const struct adsp_data sm8450_mpss_resource = {
 };
 
 static const struct adsp_data sm8550_adsp_resource = {
-	.crash_reason_smem = 423,
+	.crash_reason_item = 423,
 	.firmware_name = "adsp.mdt",
 	.dtb_firmware_name = "adsp_dtb.mdt",
 	.pas_id = 1,
@@ -1209,7 +1210,7 @@ static const struct adsp_data sm8550_adsp_resource = {
 };
 
 static const struct adsp_data sm8550_cdsp_resource = {
-	.crash_reason_smem = 601,
+	.crash_reason_item = 601,
 	.firmware_name = "cdsp.mdt",
 	.dtb_firmware_name = "cdsp_dtb.mdt",
 	.pas_id = 18,
@@ -1230,7 +1231,7 @@ static const struct adsp_data sm8550_cdsp_resource = {
 };
 
 static const struct adsp_data sm8550_mpss_resource = {
-	.crash_reason_smem = 421,
+	.crash_reason_item = 421,
 	.firmware_name = "modem.mdt",
 	.dtb_firmware_name = "modem_dtb.mdt",
 	.pas_id = 4,
@@ -1254,7 +1255,7 @@ static const struct adsp_data sm8550_mpss_resource = {
 };
 
 static const struct adsp_data sc7280_wpss_resource = {
-	.crash_reason_smem = 626,
+	.crash_reason_item = 626,
 	.firmware_name = "wpss.mdt",
 	.pas_id = 6,
 	.auto_boot = true,
@@ -1270,7 +1271,7 @@ static const struct adsp_data sc7280_wpss_resource = {
 };
 
 static const struct adsp_data sm8650_cdsp_resource = {
-	.crash_reason_smem = 601,
+	.crash_reason_item = 601,
 	.firmware_name = "cdsp.mdt",
 	.dtb_firmware_name = "cdsp_dtb.mdt",
 	.pas_id = 18,
@@ -1295,7 +1296,7 @@ static const struct adsp_data sm8650_cdsp_resource = {
 };
 
 static const struct adsp_data sm8650_mpss_resource = {
-	.crash_reason_smem = 421,
+	.crash_reason_item = 421,
 	.firmware_name = "modem.mdt",
 	.dtb_firmware_name = "modem_dtb.mdt",
 	.pas_id = 4,
diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index e913dabae992..fbde92714f06 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -18,6 +18,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <linux/soc/qcom/smem.h>
 #include "qcom_common.h"
 #include "qcom_pil_info.h"
 #include "qcom_q6v5.h"
@@ -93,7 +94,7 @@ enum {
 
 struct wcss_data {
 	const char *firmware_name;
-	unsigned int crash_reason_smem;
+	unsigned int crash_reason_item;
 	u32 version;
 	bool aon_reset_required;
 	bool wcss_q6_reset_required;
@@ -143,7 +144,7 @@ struct q6v5_wcss {
 	void *mem_region;
 	size_t mem_size;
 
-	unsigned int crash_reason_smem;
+	unsigned int crash_reason_item;
 	u32 version;
 	bool requires_force_stop;
 
@@ -1048,7 +1049,8 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = qcom_q6v5_init(&wcss->q6v5, pdev, rproc, desc->crash_reason_smem, NULL, NULL);
+	ret = qcom_q6v5_init(&wcss->q6v5, pdev, rproc, QCOM_SMEM_HOST_ANY,
+			     desc->crash_reason_item, NULL, NULL);
 	if (ret)
 		return ret;
 
@@ -1082,7 +1084,7 @@ static void q6v5_wcss_remove(struct platform_device *pdev)
 
 static const struct wcss_data wcss_ipq8074_res_init = {
 	.firmware_name = "IPQ8074/q6_fw.mdt",
-	.crash_reason_smem = WCSS_CRASH_REASON,
+	.crash_reason_item = WCSS_CRASH_REASON,
 	.aon_reset_required = true,
 	.wcss_q6_reset_required = true,
 	.ops = &q6v5_wcss_ipq8074_ops,
@@ -1090,7 +1092,7 @@ static const struct wcss_data wcss_ipq8074_res_init = {
 };
 
 static const struct wcss_data wcss_qcs404_res_init = {
-	.crash_reason_smem = WCSS_CRASH_REASON,
+	.crash_reason_item = WCSS_CRASH_REASON,
 	.firmware_name = "wcnss.mdt",
 	.version = WCSS_QCS404,
 	.aon_reset_required = false,
diff --git a/drivers/remoteproc/qcom_q6v5_wcss_sec.c b/drivers/remoteproc/qcom_q6v5_wcss_sec.c
index 8516e17521ea..b5ac3f52075f 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss_sec.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss_sec.c
@@ -26,6 +26,7 @@
 #include "remoteproc_internal.h"
 
 #define WCSS_CRASH_REASON		421
+#define WCSS_SMEM_HOST			1
 
 #define WCSS_PAS_ID			0x6
 #define MPD_WCSS_PAS_ID			0xD
@@ -268,7 +269,7 @@ static int wcss_sec_probe(struct platform_device *pdev)
 			goto free_rproc;
 	}
 
-	ret = qcom_q6v5_init(&wcss->q6, pdev, rproc,
+	ret = qcom_q6v5_init(&wcss->q6, pdev, rproc, WCSS_SMEM_HOST,
 			     WCSS_CRASH_REASON, NULL, NULL);
 	if (ret)
 		goto free_rproc;
-- 
2.34.1


