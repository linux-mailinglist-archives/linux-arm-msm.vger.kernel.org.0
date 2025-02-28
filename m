Return-Path: <linux-arm-msm+bounces-49812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7AFA49106
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 06:40:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F204C1893B27
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 05:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2EB1C3F0A;
	Fri, 28 Feb 2025 05:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OQZF5Xkt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBDF1BEF9D
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 05:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740721111; cv=none; b=EUSqs25KVWHG74B2cPc6MB9P7b03WRvcQ8/rbKSvtl2OJMI9M2fMoM9WcNxgVSAZTV3Q++mgQlx2yd1WVg8D42PDU/LXFO5iy5ID5Ep5PNdJM6m46mTRcijtqJmQedMU2W+SW/hHwFuAEopufsnmhSKtMs2CVFrGGf51Ixk3mzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740721111; c=relaxed/simple;
	bh=HHrrkwtj5ofa2kSk2WmrBc/7ldJ3PC2orSkhFEhLe2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FJyKuEJsYQHkTbMQbzNnHsi78cdtTcC55pHbk1DhvZmqHceHPTLSSLc3QL46RL1gSV6U6dTwhsfzWmLsEgYgZ8wv3Ju1g4NnxplPHC4ur1GTU4tfpeMbMIrQqto0XZ2lKUqOdf7PS4b1lT54ehm2t+gnK4Z5IGlMoY4xxAwknQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OQZF5Xkt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RGspM1021539
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 05:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qW/8JvJiG1k4zN51CaWpEKCBFaqCsXOFtjlx7tcDEL8=; b=OQZF5Xkt58lxmnKF
	JLKZwqGsvzPHpifLbNddgwqBc3ypyLQ4dylwEWMuqeOR+njfYADouU+pVnsEe5w0
	GUEOLrGNovAidRwIS6WdNqi2qwQmBrHk/lsulxnhOb0/vUK1yTcs7tljLKsSXQlU
	bKLEZv8DUxJlcwYitWZORWBKoh+Sp77BSqT7KE1xxWVIR54hajf45f4tGV+TE32I
	MJ7i/2X7+i4Lrryw/jSqusQbTUUujNNo/dnSHeRw2ildFsuNgZ+zrej9E5oZI0Oi
	csjpuYyj0HElIXU8YMGpXuzhsVjGQBpU86t/rA/+eD/DpqIDCEVkT6p6LpFbJZ6L
	ErRlHA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prkr5ff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 05:38:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22356964533so22617095ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 21:38:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740721108; x=1741325908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qW/8JvJiG1k4zN51CaWpEKCBFaqCsXOFtjlx7tcDEL8=;
        b=Zq27oaAcJsY7jNy8sSwKBG+bca15f1nefdxFl40zlw4Ae/bfI4ZrZ4ufJ19D0UioMD
         zItYyAcRTj98DAtMoS2lqNm7RSEFKI8K+oUtJcB4vSO4vYsrua4DuLWfs72Nun1chs/H
         kM07ti1RXzhKJPPS4jBwazuY+GqRrlSgk2GiHxfJIsKaZYUjBef735qM2Z6BcMW65xM5
         aAe2nzA4pakdS+YZwkSS1SQoem+kaoDsvAd/1EmKtVbC3EAmSDMoQ/j1QLyBV7BkBUJn
         T0dwqXaX0KRGlSJt5nOwP14hf2FR0ws9zhgy6K6Zd82MQTtpE5UHYDGuLAMMxQSxmH03
         uoVw==
X-Gm-Message-State: AOJu0Yxv0ZFSDbY7Wy/SJMLjRCp+BWWMJP7EveyNWMQPLGf53q0+sVfa
	ZI3FKmkZpyMfgCRTlhPtOuX4eWT+gN771e3Nt1wwCeqXzbnT24qgN3gUHNeloByJY9wMPkrO/RE
	40KOu5MLH2JjYdT9Bphf8yTD1nqIyHRt0BaUCQca21zZozJ4WwBPt8t0DhGcDOXMFfm1c56dm
X-Gm-Gg: ASbGncv/yqGstwQ6kzSYb3tHEEOtnHzN8XYJRDMETB8SUqVom7AZaTYOo0ApbtSKdU9
	WbMfkS5mLF8DY3AEDcnncHFV3/tGo+s3qXm8YDiavUd2v//XmGm10A1gDlYJNVqs4qh8XimhGde
	r/vRdJsUBO6HtrLXgl1RD830ae5T45w2XDw3b+9mYdi+AE+2jhMiq/MiESKR+IHRn4cZcuiojiF
	Tt1lv7hCc3IWg+R3kmjqK93AP3n8DZofi0IbRIg3J5ChUz3lAlTuRrV88tD18djXEMbML4m80Vk
	Jm6spvOc+bR7+mfvMn0yGMHHRb6ENLwTYBIOeAAOy6w7GbnIg6LsoFxOGJwdl9j/ECx3kNYU7Y/
	1lGwdLE4=
X-Received: by 2002:a17:903:2307:b0:220:df73:b639 with SMTP id d9443c01a7336-2236924e723mr27714795ad.36.1740721107927;
        Thu, 27 Feb 2025 21:38:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxWluqMF7TpR3mYq+CiH3jFufYjAu/pL+jZBDA4FUQPoi7YoIIrYr5R0ZyK3F/2WP6kjWHPw==
X-Received: by 2002:a17:903:2307:b0:220:df73:b639 with SMTP id d9443c01a7336-2236924e723mr27714435ad.36.1740721107523;
        Thu, 27 Feb 2025 21:38:27 -0800 (PST)
Received: from hu-uchalich-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504dc86esm25058925ad.172.2025.02.27.21.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 21:38:27 -0800 (PST)
From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Date: Thu, 27 Feb 2025 21:38:17 -0800
Subject: [PATCH v5 2/2] firmware: qcom_scm: Support multiple waitq contexts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-multi_waitq_scm-v5-2-16984ea97edf@oss.qualcomm.com>
References: <20250227-multi_waitq_scm-v5-0-16984ea97edf@oss.qualcomm.com>
In-Reply-To: <20250227-multi_waitq_scm-v5-0-16984ea97edf@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740721104; l=4796;
 i=unnathi.chalicheemala@oss.qualcomm.com; s=20240514;
 h=from:subject:message-id; bh=HHrrkwtj5ofa2kSk2WmrBc/7ldJ3PC2orSkhFEhLe2I=;
 b=hkGqDQRe3FsMXPtieyo/XXAvwFSf4Jm1nNdWF/y23mjk4mwDydJ9jHdku2rjQUWvrYi00fHtA
 Sz9SnRlJnLUAwZvkEyL7nxE4o8CcGI4KCLxHrH5VzngJgD5/5P4CJ81
X-Developer-Key: i=unnathi.chalicheemala@oss.qualcomm.com; a=ed25519;
 pk=o+hVng49r5k2Gc/f9xiwzvR3y1q4kwLOASwo+cFowXI=
X-Proofpoint-GUID: HLZg_cWIgeyjLb2RaDgdIdUN3djUgmOi
X-Proofpoint-ORIG-GUID: HLZg_cWIgeyjLb2RaDgdIdUN3djUgmOi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_08,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 adultscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 clxscore=1011 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280038

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

Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 75 ++++++++++++++++++++++++++++------------
 1 file changed, 53 insertions(+), 22 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 1aa42685640da8a14191557896fbb49423697a10..ec139380ce5ba6d11f1023258e1d36edcf3d9d45 100644
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
@@ -2118,6 +2119,25 @@ static int qcom_scm_fill_irq_fwspec_params(struct irq_fwspec *fwspec, u32 virq)
 	return 0;
 }
 
+static int qcom_scm_query_waitq_count(struct qcom_scm *scm)
+{
+	int ret;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_WAITQ,
+		.cmd = QCOM_SCM_WAITQ_GET_INFO,
+		.owner = ARM_SMCCC_OWNER_SIP
+	};
+	struct qcom_scm_res res;
+
+	ret = qcom_scm_call_atomic(scm->dev, &desc, &res);
+	if (ret) {
+		dev_err(scm->dev, "Multi-waitqueue support unavailable\n");
+		return 1;
+	}
+
+	return res.result[0] & GENMASK(7, 0);
+}
+
 static int qcom_scm_get_waitq_irq(void)
 {
 	int ret;
@@ -2149,42 +2169,40 @@ static int qcom_scm_get_waitq_irq(void)
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
@@ -2260,6 +2278,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	struct qcom_tzmem_pool_config pool_config;
 	struct qcom_scm *scm;
 	int irq, ret;
+	int i;
 
 	scm = devm_kzalloc(&pdev->dev, sizeof(*scm), GFP_KERNEL);
 	if (!scm)
@@ -2270,7 +2289,19 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	init_completion(&scm->waitq_comp);
+	ret = qcom_scm_query_waitq_count(scm);
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


