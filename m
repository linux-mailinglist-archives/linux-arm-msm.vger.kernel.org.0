Return-Path: <linux-arm-msm+bounces-36970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FAB9BBA3D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 17:22:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 104D3B2268F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 16:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A0E1C8FB4;
	Mon,  4 Nov 2024 16:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="M2sNi8d6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6C61C233A;
	Mon,  4 Nov 2024 16:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730737277; cv=none; b=UO6A7r3119WBN3rMT2wrbTtLHYAM+f5ymnZROf9Kk8i32p6bUZCOtZT+YkQKb3rfK3UZ8IxZREUWSvgTkkx3u4MAXl7eQQWhmBdM2KmsApTVgxaJKZIicidAOVQO3e0+tK66soxO82Zbl2WHVDuV1oLdE0MSoyXVkVk0kViJCR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730737277; c=relaxed/simple;
	bh=Lr4PRitGjGQbELUySbnnSjtDw1tCEvoHh2HFTC0YBWY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cM0PfmizhSXDM91ev4XHxUeZAtSVcwloky4MPnQteG/DQ3q35DBWOfSk7hmQLZnQB2muUioXkHNj87LsuNSVW20OtmnBo/b7qxBZpVVnT8xHSg2IOcFSIJEoluKwQFuzgbGqb/OvwPUTBLTHmfd8DdGZJVPvv6c8VN/WwlZ2+/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=M2sNi8d6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4Bu4xo028042;
	Mon, 4 Nov 2024 16:21:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mE+zsA0dfof
	LPatvzdz4DxvZViFB9gMdLdVaMceBJtA=; b=M2sNi8d6czYbEmUa1lj7wpk5yRN
	d9sjrYB0js8bBleN+WoTjtBfLNZgMBAujANU3ultoPLVbfbViWYthOtA/bwtqOS0
	+jzf3TFbbUwWPY8JW6gNGP3n5YsECnxTGJIDnjMyGG/6OX3VeVr9rqRMESBIqcxY
	Aw+1wW7oGZkQphK4f+nojKKru1wwtr/ziRn47Uc4Jvg8K9mQUSHKisvzgWtTJeu7
	FEAx9oxdzjr/iKmSdHf97BWYw3dZlcPELXGwON9nRkF/NqyhfcMoHS5szyc/5rsp
	VF274mls3G7FqkHzyzJPTCiUVoilvAcK9joF9xYpYu3CG0vHwYH77clti3w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42p5ye2y8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 16:21:00 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4GL0uV003698;
	Mon, 4 Nov 2024 16:21:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 42nd5m2srr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 16:20:59 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4A4GKtDD003631;
	Mon, 4 Nov 2024 16:20:59 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-uchalich-lv.qualcomm.com [10.81.89.1])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 4A4GKxb7003688
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 16:20:59 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 4184210)
	id 7E8FD641; Mon,  4 Nov 2024 08:20:59 -0800 (PST)
From: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Unnathi Chalicheemala <quic_uchalich@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@quicinc.com
Subject: [PATCH v3 2/2] firmware: qcom_scm: Support multiple waitq contexts
Date: Mon,  4 Nov 2024 08:20:56 -0800
Message-Id: <3fe8739458227081d43f00746fe527bc4f8fd8b5.1730735881.git.quic_uchalich@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730735881.git.quic_uchalich@quicinc.com>
References: <cover.1730735881.git.quic_uchalich@quicinc.com>
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
X-Proofpoint-ORIG-GUID: smGKiLN9Ug4JX3_UM7O_U7UHJ_fzyLQI
X-Proofpoint-GUID: smGKiLN9Ug4JX3_UM7O_U7UHJ_fzyLQI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040138

Currently, only a single waitqueue context exists, with waitqueue id zero.
Multi-waitqueue mechanism is added in firmware to support the case when
multiple VMs make SMC calls or single VM making multiple calls on same CPU.

When VMs make SMC call, firmware will allocate waitqueue context assuming
the SMC call to be a blocking call. SMC calls that cannot acquire resources
are returned to sleep in the calling VM. When resource is available, VM
will be notified to wake sleeping thread and resume SMC call.
SM8650 firmware can allocate two such waitq contexts so create these two
waitqueue contexts.

Unique waitqueue contexts are supported by a dynamically sized array where
each unique wq_ctx is associated with a struct completion variable for easy
lookup. To get the number of waitqueue contexts directly from firmware,
qcom_scm_query_waitq_cnt() is introduced. On older targets which support
only a single waitqueue, wq_cnt is set to 1 as SCM call for
query_waitq_cnt() is not implemented for single waitqueue case.

Signed-off-by: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
---
 drivers/firmware/qcom/qcom_scm.c | 75 ++++++++++++++++++++++----------
 1 file changed, 53 insertions(+), 22 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index ec1205474a3a..a93157917f79 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -47,7 +47,7 @@ struct qcom_scm {
 	struct clk *iface_clk;
 	struct clk *bus_clk;
 	struct icc_path *path;
-	struct completion waitq_comp;
+	struct completion *waitq;
 	struct reset_controller_dev reset;
 
 	/* control access to the interconnect path */
@@ -57,6 +57,7 @@ struct qcom_scm {
 	u64 dload_mode_addr;
 
 	struct qcom_tzmem_pool *mempool;
+	unsigned int wq_cnt;
 };
 
 struct qcom_scm_current_perm_info {
@@ -1854,6 +1855,26 @@ static int qcom_scm_fill_irq_fwspec_params(struct irq_fwspec *fwspec, u32 virq)
 	return 0;
 }
 
+static int qcom_scm_query_waitq_count(void)
+{
+	int ret;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_WAITQ,
+		.cmd = QCOM_SCM_WAITQ_GET_INFO,
+		.owner = ARM_SMCCC_OWNER_SIP
+	};
+	struct qcom_scm_res res;
+
+	if (!__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_WAITQ, QCOM_SCM_WAITQ_GET_INFO))
+		return 1;
+
+	ret = qcom_scm_call_atomic(__scm->dev, &desc, &res);
+	if (ret)
+		return ret;
+
+	return res.result[0] & GENMASK(7, 0);
+}
+
 static int qcom_scm_get_waitq_irq(void)
 {
 	int ret;
@@ -1880,42 +1901,40 @@ static int qcom_scm_get_waitq_irq(void)
 	return ret;
 }
 
-static int qcom_scm_assert_valid_wq_ctx(u32 wq_ctx)
+static struct completion *qcom_scm_get_completion(u32 wq_ctx)
 {
-	/* FW currently only supports a single wq_ctx (zero).
-	 * TODO: Update this logic to include dynamic allocation and lookup of
-	 * completion structs when FW supports more wq_ctx values.
-	 */
-	if (wq_ctx != 0) {
-		dev_err(__scm->dev, "Firmware unexpectedly passed non-zero wq_ctx\n");
-		return -EINVAL;
-	}
+	struct completion *wq;
 
-	return 0;
+	if (WARN_ON_ONCE((wq_ctx >= __scm->wq_cnt))
+			return ERR_PTR(-EINVAL);
+
+	wq = &__scm->waitq[wq_ctx];
+
+	return wq;
 }
 
 int qcom_scm_wait_for_wq_completion(u32 wq_ctx)
 {
-	int ret;
+	struct completion *wq;
 
-	ret = qcom_scm_assert_valid_wq_ctx(wq_ctx);
-	if (ret)
-		return ret;
+	wq = qcom_scm_get_completion(wq_ctx);
+	if (IS_ERR(wq))
+		return PTR_ERR(wq);
 
-	wait_for_completion(&__scm->waitq_comp);
+	wait_for_completion(wq);
 
 	return 0;
 }
 
 static int qcom_scm_waitq_wakeup(unsigned int wq_ctx)
 {
-	int ret;
+	struct completion *wq;
 
-	ret = qcom_scm_assert_valid_wq_ctx(wq_ctx);
-	if (ret)
-		return ret;
+	wq = qcom_scm_get_completion(wq_ctx);
+	if (IS_ERR(wq))
+		return PTR_ERR(wq);
 
-	complete(&__scm->waitq_comp);
+	complete(wq);
 
 	return 0;
 }
@@ -2001,7 +2020,19 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	init_completion(&scm->waitq_comp);
+	ret = qcom_scm_query_waitq_count();
+	if (ret < 0)
+		return ret;
+
+	scm->wq_cnt = ret;
+
+	scm->waitq = devm_kcalloc(&pdev->dev, scm->wq_cnt, sizeof(*scm->waitq), GFP_KERNEL);
+	if (!scm->waitq)
+		return -ENOMEM;
+
+	for (i = 0; i < scm->wq_cnt; i++)
+		init_completion(&scm->waitq[i]);
+
 	mutex_init(&scm->scm_bw_lock);
 
 	scm->path = devm_of_icc_get(&pdev->dev, NULL);
-- 
2.34.1


