Return-Path: <linux-arm-msm+bounces-69782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D042B2CA13
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 18:56:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6071A7AC9DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 16:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 096712C234B;
	Tue, 19 Aug 2025 16:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JxSHwHqc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F762D9491
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 16:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755622536; cv=none; b=UxLqDIrNXjvbScFpgQlCndaNJdbENpTn6yGOxk8k9mUamMnjd6uttVq0gRq8jkpl/4W9c19jgO4VuVwh5YFijDSxOBey7SASGdfrTxH6qkNXdLAxmV17ElX4j1awHhtExflEcdkxy8OWSa+jcUlmOWhkyLI1M1KQqfqTQn8grr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755622536; c=relaxed/simple;
	bh=dmKcJUIVtmS50+BiHAPFjw7rQIQKfyNOMW7Ww7Lx9J0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JgBdliu9QToLRj9EA1+jipGxJhIfiVVx02NwTh29cp/bqJZ2Ske6uym+bGx5gyr4wQ/gViLWmgfLKfkDoKQZ6FLQPoHmpjEzdzde4Vs8c8WFBkBsMlzUQZyeZL1N0v/hYX66EVMBv8LsdkvBrwwCj6vOK8bAfCj61dniX3WZlAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JxSHwHqc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90ac7007276
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 16:55:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	enByMTUq/WcM7Q767ZJgoe5KkDWAYvRUW6oJgwm1WBA=; b=JxSHwHqc4+2efYoc
	EHIXuGESYOwsOo/Jl1TlifpGh9z1Iw3sIS7onknR4rF3tPh4LaSQeAUBRXQ4WPh/
	XFavQP3SpykoCKEeFEUCPWOUgq9qF9SH+5LfPr1nyHLvTS1D3IwnTJXnDByz+N3w
	FChJ8grlQqtxNtkf1/tgmBZr0oBk3ISsFt2sKAUpErPnfKlOiInwkFAhe23dTPn2
	JV+vqzJ1H9umJ6ACs5TKMzF+gU0oHL3vNS4CYxaUPbe09OdpntwJTR5C0rKy4y6N
	oyLaXmNRzTcSpy0yaWCaw0E+lxRWkanym4dnQm+ePdtSHxwt3dj/6H4+RfvQ6A2T
	R1YNww==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj749cwp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 16:55:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-244581187c6so63787835ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:55:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755622534; x=1756227334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=enByMTUq/WcM7Q767ZJgoe5KkDWAYvRUW6oJgwm1WBA=;
        b=dSfc/mVcQiI7ZJUnrr9teHLHnodvVsKFVXhQNgT6r+G5CSd0y6tmB/Oivrfv1aulQp
         /gNEB69lLcikvQVZqBwCk2oOeDsx3HuZmZTyYWAx/uKNlTcePgmDPtAbzkmX+BIfEwH4
         XOQOOHAqST02spWvyO5lcDQpyG9mno/CKXAPjFNkSeSZfRp0sDr5JJ1D/f5guRZWV7Pv
         LWWjrENhdXBJ6oaPlQMjclo78Df1MCV7KgAduTBqiK/A6rwNOdNFmmckPhd5H5lXebDt
         C/49q4cLTpCzgaZvUyOpAxAVCDemi3xZGkaWoBQMmLthcGQdXgr+x+RuLZI5Jvpi9VNg
         Q78A==
X-Forwarded-Encrypted: i=1; AJvYcCVmG9kpZJ6g59e/ZjUR58ltXdyaGIrCWPiZ+6ZOE35RaU8ZkuVCdEZcGuGNFtD5zncBNr/WD4Np5afV51D2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4HjMMeaS3jYLOUzDyQnzk09hWLpvYmdm2RnSK+KqwpW2YuDpQ
	Hz69IBwSIBRh64rjhbz1ncDX4xr+fmxvORY4JC/ef6xFZJ38VyU9OTXyOfCXOpGtL4l2mhAa7/W
	TGvW+dUEKtf8gKVjGYNtinjT98H7DRVns7CyhRfvsOl4xg1Za9FO/TEnQAzDHl3KcVYtN
X-Gm-Gg: ASbGncu/N+ENORCan8LFvdHv9NfaMYVbgQ1tzUrwJ8D0CrCwYz9jtRA3H/vdDUi+kDJ
	LsI22d1yTUGA57kszGWeefG/6O9/HYGSZtiWisZoYym41DNlKEMUlm3glR3rSHiPx+ygCLlRe2y
	iewSis2QM6ihlg/y3nHjZwFmZle0YG93+GcGzWRuLhI1FuKFP+T++4qofpMNBURTbXDDPMTaPXN
	DpIi8Y8IFJnDYcKjeW5yFMbFFcupoteHKeTiIMG/l/GBNNeDBFRQat71ajZrfDHqt7JULAupG5J
	iBQJY67qQO3kMCnECfJC8q/ZkaE1VKJk8Mmtc6/fCkv8tUsAnuxV2DooJfpJN20dwnY=
X-Received: by 2002:a17:902:eccf:b0:240:934f:27ac with SMTP id d9443c01a7336-245e049d32fmr46953755ad.33.1755622533628;
        Tue, 19 Aug 2025 09:55:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHv9NKBhQZBU4DFDEN9fRVd2gjaOBSnMVLUa3PreZFrVrpWEGvKQExqyoAlrfKKQpanX5N+Og==
X-Received: by 2002:a17:902:eccf:b0:240:934f:27ac with SMTP id d9443c01a7336-245e049d32fmr46953325ad.33.1755622533162;
        Tue, 19 Aug 2025 09:55:33 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed33aa3esm2273885ad.24.2025.08.19.09.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 09:55:32 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 03/11] firmware: qcom_scm: Add a prep version of auth_and_reset function
Date: Tue, 19 Aug 2025 22:24:38 +0530
Message-ID: <20250819165447.4149674-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: h4IwNj0VFJwCjBD68R6gDlq2KZQPXvFG
X-Proofpoint-ORIG-GUID: h4IwNj0VFJwCjBD68R6gDlq2KZQPXvFG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfX0qVWfOmqExUs
 foE8iAFn4R4L6bbgJ90ma8VNfrgH8NMyGtpDK4WbprvgfyvTNyqFblIApzqPusHX+ZKC2iZXO5u
 STmoXioi8Tmbvc2Flaqxcl+40RhI/LxZY75tJJfFfp9wzA9K7Yt/d+/NSIJd5cjzlIO1X9D6Iz7
 UWwKVV+SsaUv9NjIagdX+t8MTuhpklsWpBmb0Q5DZpNRF+99kPWxnNNbB+EiHVlBh9TTEYIZoU2
 5BMi41LBaaO88HrsKcFFArvujriXY2fmaEDig/93CZd98F1Db5CVFni5Bjj5HeToEDnhwbDYyPV
 7kUwIIxGn+E9JfitPufq9hRtxGaLbuatqloSbGSj6f03PDj/XPEJmzUPcfpTJgt9T7DGkAqOv45
 t5de9z4l
X-Authority-Analysis: v=2.4 cv=MJtgmNZl c=1 sm=1 tr=0 ts=68a4ac86 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=xhUff6YxzY9YBBblk4UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160033

Qualcomm SoCs running with QHEE (Qualcomm Hypervisor Execution
Environment—a library present in the Gunyah hypervisor) utilize the
Peripheral Authentication Service (PAS) from TrustZone (TZ) firmware to
securely authenticate and reset remote processors via a sequence of SMC
calls such as qcom_scm_pas_init_image(), qcom_scm_pas_mem_setup(), and
qcom_scm_pas_auth_and_reset().

For memory passed to Qualcomm TrustZone, it must either be part of a
pool registered with TZ or be directly registered via SHMbridge SMC
calls.

When QHEE is present, PAS SMC calls from Linux running at EL1 are
trapped by QHEE (running at EL2), which then creates or retrieves memory
from the SHMbridge for both metadata and remoteproc carveout memory
before passing them to TZ. However, when the SoC runs with a
non-QHEE-based hypervisor, Linux must create the SHM bridge for both
metadata (before it is passed to TZ in qcom_scm_pas_init_image()) and
for remoteproc memory (before the call is made to TZ in
qcom_scm_pas_auth_and_reset()).

For auth_and_reset() call, first it need to register remoteproc carveout
memory with TZ via SHMbridge SMC call and then it can trigger
auth_and_reset SMC call and once the call returns, remoteproc carveout
memory can be deregisterd with TZ.

Add qcom_scm_pas_prepare_and_auth_reset() function which does prepare
the SHMbridge over carveout memory and call auth_and_reset SMC call.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 46 ++++++++++++++++++++++++++
 include/linux/firmware/qcom/qcom_scm.h |  2 ++
 2 files changed, 48 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 33187d4f4aef..9a5b34f5bacb 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -759,6 +759,52 @@ int qcom_scm_pas_auth_and_reset(u32 peripheral)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_pas_auth_and_reset);
 
+/**
+ * qcom_scm_pas_prepare_and_auth_reset() - Prepare, authenticate, and reset the remote processor
+ *
+ * @ctx:	Context saved during call to qcom_scm_pas_ctx_init()
+ *
+ * This function performs the necessary steps to prepare a PAS subsystem,
+ * authenticate it using the provided metadata, and initiate a reset sequence.
+ *
+ * It is typically used when Linux is in control setting up the IOMMU hardware
+ * for remote subsystem during secure firmware loading processes. The preparation
+ * step sets up shmbridge over the firmware memory before TrustZone access the
+ * firmware memory region for authentication. The authentication step verifies
+ * the integrity and authenticity of the firmware or configuration using secure
+ * metadata. Finally, the reset step ensures the subsystem starts in a clean and
+ * sane state.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_ctx *ctx)
+{
+	u64 handle;
+	int ret;
+
+	if (!ctx->has_iommu)
+		return qcom_scm_pas_auth_and_reset(ctx->peripheral);
+
+	/*
+	 * When Linux running at EL1, Gunyah(EL2) traps auth_and_reset call and creates
+	 * shmbridge on subsystem memory region before it passes the call to TrustZone
+	 * to authenticate it while when Linux runs at EL2, it needs to create shmbridge
+	 * before this call goes to TrustZone.
+	 */
+	ret = qcom_tzmem_shm_bridge_create(ctx->mem_phys, ctx->mem_size, &handle);
+	if (ret) {
+		dev_err(__scm->dev, "Failed to create shmbridge ret=%d %u\n",
+			ret, ctx->peripheral);
+		return ret;
+	}
+
+	ret = qcom_scm_pas_auth_and_reset(ctx->peripheral);
+	qcom_tzmem_shm_bridge_delete(handle);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(qcom_scm_pas_prepare_and_auth_reset);
+
 /**
  * qcom_scm_pas_shutdown() - Shut down the remote processor
  * @peripheral: peripheral id
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index b7eb206561a9..a31006fe49a9 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -79,6 +79,7 @@ struct qcom_scm_pas_ctx {
 	size_t mem_size;
 	struct qcom_scm_pas_metadata *metadata;
 	bool save_mdt_ctx;
+	bool has_iommu;
 };
 
 void *qcom_scm_pas_ctx_init(struct device *dev, u32 peripheral, phys_addr_t mem_phys,
@@ -87,6 +88,7 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 			    struct qcom_scm_pas_metadata *ctx);
 void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx);
 int qcom_scm_pas_mem_setup(u32 peripheral, phys_addr_t addr, phys_addr_t size);
+int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_ctx *ctx);
 int qcom_scm_pas_auth_and_reset(u32 peripheral);
 int qcom_scm_pas_shutdown(u32 peripheral);
 bool qcom_scm_pas_supported(u32 peripheral);
-- 
2.50.1


