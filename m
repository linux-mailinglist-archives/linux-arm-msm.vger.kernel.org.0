Return-Path: <linux-arm-msm+bounces-74299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D85CB8CF82
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 21:43:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B46821B20C3A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 19:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB222566D9;
	Sat, 20 Sep 2025 19:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZQgfrjHd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF89246796
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 19:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758397331; cv=none; b=twTKCQKHgQF+NPRjHKuV3bHZshSS+XKReAsN9B4TSlC9kln5ml8rCOnougqzCxhZDWjoBAksc5Xm5y+b0uC1vRKWsolmX95wchyMsg5Zc7lZtoxjX9cUGHCvX9yzLtoyN46ft7ePAw0XKjDJqqL+1IqaYOhhAFuU/uIoz3LN8QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758397331; c=relaxed/simple;
	bh=3Gsa1ygLvfww6X1LDJZ5+cyiNGAfoG3HUC9QPJkbdQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SSygDn9v0co/bujGUI9rGfO+fy1FhlrzxUZU4CCev1i1MMsxR6AitOwVlwkIcWMdPEADh/le1Vjm6rn7AxfQYEDTzIY2XUUUIQzeYpglO8ACIMY0lfhWI04WjLwsl1OZb0KUX1QtpcTPXNc0bnI1ieGvjnzaT2LcIAm0j6SeKQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZQgfrjHd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58KIt2o6022018
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 19:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bskQ4OXKVoPNLr7GyCp9XNvtiQakpOp32/gupE0+8EU=; b=ZQgfrjHdTv4ePWdm
	HvVYJWAjSYfvR3kKB4Dg4LEn5wtnX2O1irSXhx6r3u9SjZKD9e8goXbmKnEoVhVO
	W41PDx1n5k5Z1g942lecJTZIrM8ygayCwEVEzG0T2KWTdjKkZbltK5Q2KPNdGCQF
	kaBUYIb/Yrtuj7O5Mhj1FeNped9KxzcjMA5VYCfbIGB2ZQHGeDu5fTuM2UyOKAqv
	mNzMppLf4xZeUazvP11pLJ8xp8ASxkssYAtQoXt7fqB+bR4qQrVr3Ce0XOcqE+GX
	3vzSK2J+jfzFlAmWqbdtss6PUWoZF7Tr54pz20rvPx4/bOYdpTuwQOqH7cj+FFV7
	xrWS0w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k7ssa9c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 19:42:08 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77f2a990c55so93034b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 12:42:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758397327; x=1759002127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bskQ4OXKVoPNLr7GyCp9XNvtiQakpOp32/gupE0+8EU=;
        b=DQh/AR0kUbxaYIMTJy+JrqEVbID3erD6daM2CJCgRh1Gldy5FmNK9d5Sv9Mnk9K4J5
         f6UlaoUFO4Qs9xGp8k7QEJoMCnu90R9/+irjkFjbJtGcxNAnVW5xrQJDgoC7lGElcMzU
         fEqjnvC/wCPQNYjg4Maz0pc/rK+5sAT/K2nB3gW3cgbB+QvaXs/+DlXYBZUDp+JOUnzP
         pHIMd2KPcRmQZKDrXNEtX304ZRPFzS3Vjo9Rrsaoj06WpusTWFu5t/IBWScPpjg5FYbP
         /WmAkReAch9HUCf0vyY5plYUoInSh2OTEZh+0G6rni10T1ef1LW29PjhzI9RiaiGA2EY
         gBvA==
X-Gm-Message-State: AOJu0YyvL6fzEpiAGc9TNBVz9IY1sgvXBoP/yH9KIU7GhZMUlYbInNYP
	NcMUPtxdLrp/n2HvafH/Z4LbOFA8I7rCLhfd5HEOV4eacjiDr4CgZtDgTb0zSKuCzeaPoBAavSZ
	y54tM6116rilmvI5tWqMXroJv1DvO5Bg1qHRU8bB90CKf97Rd96gIwPW5bnsMxtD4mmDR
X-Gm-Gg: ASbGncs+YWdxxc0Dzcu91yV7MXFGBerW0OWm5XnmmGPzENJYA0dm7irEELsRAiV568Z
	cJN5JKFHZYJMKehqjhVfv/D9lXIYwgetnRGIDHoA6g5sv14dkyBzwo5cARGBMGAQChNSUT2ShLa
	kmN0bv1RkgCsHIH3MV4FcvRHeiGhFV/pALrrtEwyQMM6x8qPRywQ22glYx/wBW9MTCcFu6vXGt1
	uSK1zgbouc91TEw3/9ri5W7M2LHqDOKLyVs9/1Se6sRSb10UE1yppAMCtadVjiAWtD+RaBJrKC6
	l77itu6xbFj4oPFFkcEDQ2Zt7GB8OgAzzyAaz/36IeJW1+wgtQMXsm+SKJ9kllqS32w=
X-Received: by 2002:a05:6a00:4c9c:b0:77e:f6a5:aeac with SMTP id d2e1a72fcca58-77ef6a5af0emr5868365b3a.20.1758397327311;
        Sat, 20 Sep 2025 12:42:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHa1tWWdHEt3dXgK2dUyS1TDb58uyb8uRpjBv4fiZKR/hkx55ViaZnbeL/P7TkY4ouuDeBoRg==
X-Received: by 2002:a05:6a00:4c9c:b0:77e:f6a5:aeac with SMTP id d2e1a72fcca58-77ef6a5af0emr5868342b3a.20.1758397326841;
        Sat, 20 Sep 2025 12:42:06 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f2c8aa554sm143767b3a.34.2025.09.20.12.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 12:42:06 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Sun, 21 Sep 2025 01:11:04 +0530
Subject: [PATCH v3 06/12] firmware: qcom_scm: Add a prep version of
 auth_and_reset function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250921-kvm_rproc_pas-v3-6-458f09647920@oss.qualcomm.com>
References: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
In-Reply-To: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758397299; l=4811;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=3Gsa1ygLvfww6X1LDJZ5+cyiNGAfoG3HUC9QPJkbdQk=;
 b=2s5fYo+BSjHmtETnuObTh0Ex2K8m0KsNEMHhUVzQGULNNH8NRRRpYsHacSRvb2ac/K/njPOra
 nUo/2LAuZ64B4FPEJ16+DBY4Qk7nBiOyAuAZxfrQcAAe2Rf7AiXYOLD
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX7duk9Cv6y6Ld
 +At0TzhUPTCdmBt81WUSMTPM1ItYu9QkIeqsAMs0RDx7Ny5ZxVsvij0sjZIPrkPJLWpHEzKiva+
 ZDC1LqVnq9VFW6vV+5uqiOtkGsW0gE0fkBTLEP1W9yPgFcbf6s2fifbB15mRQEnKnctg65RrPJt
 9wtmWJgns8uveVHNR4lCemkbT8Rnr92WDSozuaIg07ZhEf0hDbYq0odschZGg8sG2nDeqQsd3kq
 InUravv+Wwa0JhhU1/QVeLBikYsnZDxdWUByTneOs7yi4V32msOvrI/PIp17lsjFSerpriyVR0s
 DKgtVlbiBZkjYQEt3J1rt+GMjN8Mqn5NQNsrnjAIjJXSBG59jT/XWa3VgE18d/qu2GuUMN8lgso
 Xhet+ogj
X-Proofpoint-ORIG-GUID: yUGd5y4FRrV6zvncj20by15rtMU-Jd6_
X-Authority-Analysis: v=2.4 cv=bvpMBFai c=1 sm=1 tr=0 ts=68cf0390 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=xhUff6YxzY9YBBblk4UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: yUGd5y4FRrV6zvncj20by15rtMU-Jd6_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_07,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

Qualcomm SoCs running with QHEE (Qualcomm Hypervisor Execution
Environment—a library present in the Gunyah hypervisor) utilize the
Peripheral Authentication Service (PAS) from TrustZone (TZ) firmware to
securely authenticate and reset remote processors via a sequence of SMC
calls such as qcom_scm_pas_init_image(), qcom_scm_pas_mem_setup(), and
qcom_scm_pas_auth_and_reset().

For memory passed to Qualcomm TrustZone, it must either be part of a
pool registered with TZ or be directly registered via SHMbridge SMC
calls. When QHEE is present, PAS SMC calls from Linux running at EL1 are
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
 drivers/firmware/qcom/qcom_scm.c       | 46 ++++++++++++++++++++++++++++++++++
 include/linux/firmware/qcom/qcom_scm.h |  2 ++
 2 files changed, 48 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 917341308873..7a86b27ea666 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -790,6 +790,52 @@ int qcom_scm_pas_auth_and_reset(u32 pas_id)
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
+ * It should be used when Linux is in control setting up the IOMMU hardware
+ * for remote subsystem during secure firmware loading processes. The preparation
+ * step sets up a shmbridge over the firmware memory before TrustZone accesses the
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
+		return qcom_scm_pas_auth_and_reset(ctx->pas_id);
+
+	/*
+	 * When Linux running at EL1, Gunyah(EL2) traps auth_and_reset call and creates
+	 * shmbridge on remote subsystem memory region before it passes the call to
+	 * TrustZone to authenticate it while when Linux runs at EL2, it needs to create
+	 * shmbridge before this call goes to TrustZone.
+	 */
+	ret = qcom_tzmem_shm_bridge_create(ctx->mem_phys, ctx->mem_size, &handle);
+	if (ret) {
+		dev_err(__scm->dev, "Failed to create shmbridge ret=%d %u\n",
+			ret, ctx->pas_id);
+		return ret;
+	}
+
+	ret = qcom_scm_pas_auth_and_reset(ctx->pas_id);
+	qcom_tzmem_shm_bridge_delete(handle);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(qcom_scm_pas_prepare_and_auth_reset);
+
 /**
  * qcom_scm_pas_shutdown() - Shut down the remote processor
  * @pas_id:	peripheral authentication service id
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index 9ca3218f0948..1774584ff5e3 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -78,6 +78,7 @@ struct qcom_scm_pas_ctx {
 	phys_addr_t mem_phys;
 	size_t mem_size;
 	struct qcom_scm_pas_metadata *metadata;
+	bool has_iommu;
 };
 
 void *qcom_scm_pas_ctx_init(struct device *dev, u32 pas_id, phys_addr_t mem_phys,
@@ -90,6 +91,7 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
 int qcom_scm_pas_auth_and_reset(u32 pas_id);
 int qcom_scm_pas_shutdown(u32 pas_id);
 bool qcom_scm_pas_supported(u32 pas_id);
+int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_ctx *ctx);
 
 int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);
 int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);

-- 
2.50.1


