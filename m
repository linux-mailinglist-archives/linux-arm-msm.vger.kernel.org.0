Return-Path: <linux-arm-msm+bounces-36974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAE29BBCBF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 19:02:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5017D1F21F5C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 18:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 040491CB533;
	Mon,  4 Nov 2024 18:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="H8FHttoM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9EB1632E4;
	Mon,  4 Nov 2024 18:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730743308; cv=none; b=KZClPmP3wIFImrlxgYMS9mLtlVFZbypL71PSp12vTNb4gpeGmmQ7SbaziIUX2AYDZnmfrPjqGEppePL/YF89S2U04P9rBcYQl0kOgqILD17OumZmBNAzgyjmXsEuvnJHbBJKcn1Y4xqlJz7bDzSYdw9BhgfE6mnjU2625J5R7kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730743308; c=relaxed/simple;
	bh=m6/fbTZEI8yEHQ9JL7M97NwJ/n//CAduzu0Ma3S/uhA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rtr5VHRChnR8ZtLWGufULdfpsxIHxT9JL6zZMv22DFiUO++62tYndmw9h3smYYw+stwqBtvzlQRovwzRFO6P/CODoNcrRWXb0zgAmeD1+E4H0ZuwR7Sf/e49OkxvpLGjkG53M8qBacpw/JL6RjmA79h67wfbFvzB+u6sOR9CiWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=H8FHttoM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4BxpRD023005;
	Mon, 4 Nov 2024 18:01:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BeXi20mKL95
	nKl1yd0np8hkCnAQ4nkyEQFZ3ZhTOhNA=; b=H8FHttoMdLNJQVaDAjy+/rEzyD6
	ArnXiIT+jmSU4cncc4plTR3fsEi4DlXuU2MpdDB09wLToPVGtmi3+X+3w9eS5rsO
	BPWelWGU9zgdYBv5TpqWElaQakzgDfxBLSpOkxd1zNpgzb1rHuzvBRW2nbwKVKtb
	+REcthvUyRYPdJ5UmwbFOsaCE5ZJpl4OucwrsOeAFBEQ/139bD5ttjMR+hiDNbYN
	djfq/u19/gIBLcC7hUVWDPn1fn1R8of0b69T7r6fUl3cpL9Ne2KdXOaWXGtkwfEo
	M+MW+bDfsqOc+ApXGN/TJgkiaX6bxFi8MQE4WDDxcgAt30RtTOrQHtwGA4w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ncyxw280-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 18:01:42 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4Hm14p028071;
	Mon, 4 Nov 2024 18:01:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 42nd5m3ggp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 18:01:41 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4A4Hx84e009558;
	Mon, 4 Nov 2024 18:01:41 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-uchalich-lv.qualcomm.com [10.81.89.1])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 4A4I1f91014663
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 18:01:41 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 4184210)
	id 24A31641; Mon,  4 Nov 2024 10:01:41 -0800 (PST)
From: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Unnathi Chalicheemala <quic_uchalich@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@quicinc.com
Subject: [PATCH v4 2/2] firmware: qcom_scm: Support multiple waitq contexts
Date: Mon,  4 Nov 2024 10:01:38 -0800
Message-Id: <4ff6a63a3e957ea768763b459e1e4ace5a10cf6b.1730742637.git.quic_uchalich@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730742637.git.quic_uchalich@quicinc.com>
References: <cover.1730742637.git.quic_uchalich@quicinc.com>
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
X-Proofpoint-ORIG-GUID: -l3Q7mx7uitxEJdXmabImB1WAS7-cw8d
X-Proofpoint-GUID: -l3Q7mx7uitxEJdXmabImB1WAS7-cw8d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040149

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
 drivers/firmware/qcom/qcom_scm.c | 76 +++++++++++++++++++++++---------
 1 file changed, 54 insertions(+), 22 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 4cffd0684b78..91c3f57ddf41 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -49,7 +49,7 @@ struct qcom_scm {
 	struct clk *iface_clk;
 	struct clk *bus_clk;
 	struct icc_path *path;
-	struct completion waitq_comp;
+	struct completion *waitq;
 	struct reset_controller_dev reset;
 
 	/* control access to the interconnect path */
@@ -59,6 +59,7 @@ struct qcom_scm {
 	u64 dload_mode_addr;
 
 	struct qcom_tzmem_pool *mempool;
+	unsigned int wq_cnt;
 };
 
 struct qcom_scm_current_perm_info {
@@ -1856,6 +1857,26 @@ static int qcom_scm_fill_irq_fwspec_params(struct irq_fwspec *fwspec, u32 virq)
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
@@ -1882,42 +1903,40 @@ static int qcom_scm_get_waitq_irq(void)
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
+	if (WARN_ON_ONCE(wq_ctx >= __scm->wq_cnt))
+		return ERR_PTR(-EINVAL);
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
@@ -1993,6 +2012,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	struct qcom_tzmem_pool_config pool_config;
 	struct qcom_scm *scm;
 	int irq, ret;
+	int i;
 
 	scm = devm_kzalloc(&pdev->dev, sizeof(*scm), GFP_KERNEL);
 	if (!scm)
@@ -2003,7 +2023,19 @@ static int qcom_scm_probe(struct platform_device *pdev)
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


