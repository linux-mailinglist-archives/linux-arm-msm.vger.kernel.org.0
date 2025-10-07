Return-Path: <linux-arm-msm+bounces-76247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 009B1BC22D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 18:52:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 23E774F78CA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 16:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF792EA479;
	Tue,  7 Oct 2025 16:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CqyvaS5I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0C02EA472
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 16:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759855789; cv=none; b=KRKv12yl0ITmJECrE1KjBhiIfk0fpIYkcY9tyNR27zBlWfD+vvKi/pMIbSwjim1BiolbO5KThDcThMoUa4atAGk6/42kX5VSf2h+8YWnTr0OxUc/Z/MZoINjKyrIMCLN0VzDEnmupLB0BAs+gGL2UvnnA7w3lv1K4zkekGKu0jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759855789; c=relaxed/simple;
	bh=oWTaYDIHWxGCuXUjmnVaLEeHiedaBpOucW5kwkMTyCw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pyrYLfpDskQ5R+tXbng/h/zejZC1i5/HGNe7YKJbRAPPX+c3ewKtEdXCC0r9gIAKSgYmd1t+kcCZFd7R1YcH/KMTIl6XyIL8NcSFGySyFhrSU5DA2CikUyFGqdfYYXmhbgxD+naFFHsNO6+1ovPZ6+48fziA2yBUJzXjMaMEZNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CqyvaS5I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ETNV4022588
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 16:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aUu8WD7nX9eVSZCgmTq1YC/wSP3aZ4PdQ0Bix6GmPyA=; b=CqyvaS5IgONkJHBp
	3l1eKRpOmym+YRhToqJaSRIaiHES7SMkxxavqwqi3i/sfgZEykSyL7agnRGAkdRN
	hVP6/qzYyPg/bZk6uqJaSkP3Vy+c2g9OvVhHmqXBH+XYBZkbD17OqzGN2/xS6hSb
	bJeMEqFIs/VwpTB6XJRKgDpOdi5Q/xY07GQkOjXUwbm8QYN3tqse1uFT0QufJT5M
	2TAdHfRTkS4jQq+Tgv2BQJR7A9H89cC9ipDXh9q/UvERh3Wddb7/QkXbezhgV+Ee
	G610oiAaW0s7ZbMacWoQCJcBF3AgsGfOvr6InfQFw9jkEXlrCdRpJGRtkbSP7m51
	HGULzA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49junu7y81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 16:49:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-28973df6a90so63999715ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 09:49:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759855785; x=1760460585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aUu8WD7nX9eVSZCgmTq1YC/wSP3aZ4PdQ0Bix6GmPyA=;
        b=ES5QQp7HtNL2ihaN9jqosj9yPqo+SUDZwABRv98dyfKmYpod+pXy49iGqRNJLSUJM7
         yo764MerncgfPlg+xf80ZlOpRoOwud2C2DiPgcpEL7YhP2ZrkEx1Bm1KWfxotz3Swpj5
         w13uS5HiYnxqQwmronOnEuDRfWgc52Xez0WbSnS228oAWl+eCyK1qN84ezaatrsubXyi
         KB6aK2Bvy+lrRm3YWoZkSQbyw5AQhAdtromxbxdbPuNfZ/jUFJ4TZOkTHKpzMjCsa01J
         z+5TLiv8oUa7HO02hruL9/XK6bcjmDpVL0Uh0ZYN7p/UoHTQmuxfFXuh6XFC4HmuczbA
         OLnQ==
X-Gm-Message-State: AOJu0YxQp3krs7+3Nzjyoqz39/v08K4On4+y0uwYvc7tTakzc6ZEpUW8
	wf9ZdiUr75pkddOiJFCFvEcU6foF8qI2MB3gFkKMY+l2ajBW48wbYbtEkeuZidr9sB4FI8PXaCd
	YwTojX8TI2s07uCFuK8BRZf9tVgGyWqOwTcO+ZtuZJzaFArbfLV9zu4FsUL2YIcGwKUns
X-Gm-Gg: ASbGncvDoHt6ClEG6dfaIjwojjmymgGsTdXGLCAb1GR1anEJS5cx/sVwBFdcDNiavN7
	5zTF3hwdc9SxaOaRwOJb4bnAa86xweqUkt3WOksoAl7bQW0IM3+sCJP6TcdJQ8RDyOMcrtT+Fth
	vBNYH+KX7n3gxbypLn50cmZ5Y+ZXrfutIEM/k1Tf2ekzKPQugxFKpLbyOxabzJldq0THa4W7XE+
	oZzmFPaFEaX55q4eo9CQdKmGbk6TvD8ODBA4KX1rX5VrM2s5l1vSIOeVidkYFdyjzbizenHcrFJ
	hTKS+7iWL9NN9qOvHtuuxPhIvjnrnzkn6XPcSC17S1wdugGs3m4X2uZcPvOWEN8PcB1OnXIT
X-Received: by 2002:a17:903:fa6:b0:269:8d1b:40c3 with SMTP id d9443c01a7336-29027356614mr5087345ad.12.1759855785145;
        Tue, 07 Oct 2025 09:49:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6Ybw6YVfYOiF7s+0txo+89nrsnawRu9WwH/ew3lNckv8aZ72hikTmzhHBXHd65gi8Et7gOw==
X-Received: by 2002:a17:903:fa6:b0:269:8d1b:40c3 with SMTP id d9443c01a7336-29027356614mr5086995ad.12.1759855784572;
        Tue, 07 Oct 2025 09:49:44 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1261e2sm171990825ad.38.2025.10.07.09.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 09:49:44 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Tue, 07 Oct 2025 22:18:53 +0530
Subject: [PATCH v4 08/12] firmware: qcom_scm: Add SHM bridge handling for
 PAS when running without QHEE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-kvm_rprocv4_next-20251007-v4-8-de841623af3c@oss.qualcomm.com>
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
In-Reply-To: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759855751; l=3703;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=oWTaYDIHWxGCuXUjmnVaLEeHiedaBpOucW5kwkMTyCw=;
 b=nOUmGRDSIg/vR9mIJSpZ4kZ6unVX4GkzMpWq93BUsBl7mCtWgBmbnjUwMFEWkJQCGWJ5MiXFY
 UW6PFwU1PYRDFsDptXHZH4fI8oAkCQSilXJjpWQ2hmwGQafrOStxf2e
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: CqElYK8X9W9i9-XD0-2H9piCrpfbteuM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMyBTYWx0ZWRfX7Alxtxm8kOU8
 6vAmpK7P9H1QOUPcFWFYvwxHpD8aNwQ8y8ElmBXxDaXS6TFdTM809BrhTfiPfRTyhewHMHBIyHs
 zeHBCSHePp+Fv3hYBkKvQ+1Pqf0dMsqZ2M3qqvIBRoj342qSxvvsb98so/oN/9h16MsgoWfDkej
 +WZGfBonwHOzAyoj1jHXmvRi3USVh/KgyVG3hpnt6gxESEgRttVCA6kActCmU5/ogaegV49mB2X
 TcVJTXaLTW8wOGNC/LhLlCZTvPXa21g6gxC9slWhIDU2v1l1IupoJPy1ez2e95eJVIxgkSkXfRR
 sQQPDN+u/wWlwSNdzl5tC4u4SIsGqiCNPtuFnc6sZftKVBh51V6asrKQPvdtg+GInQLM7pDF4rU
 h6Hx7m4mRGQCXrUmBAR5x7j4abJ0nw==
X-Authority-Analysis: v=2.4 cv=CbIFJbrl c=1 sm=1 tr=0 ts=68e544aa cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=foeKZLzp1bqqI__vITkA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: CqElYK8X9W9i9-XD0-2H9piCrpfbteuM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040023

On SoCs running with a non-Gunyah-based hypervisor, Linux must take
responsibility for creating the SHM bridge both for metadata (before
calling qcom_scm_pas_init_image()) and for remoteproc memory (before
calling qcom_scm_pas_auth_and_reset()). We have taken care the things
required for qcom_scm_pas_auth_and_reset().

Lets put these awareness of above conditions into
qcom_scm_pas_init_image() and qcom_scm_pas_metadata_release().

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 44 +++++++++++++++++++++++++++++++---
 include/linux/firmware/qcom/qcom_scm.h |  5 +++-
 2 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index b8626897c8a7..75811ba64c8f 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -643,6 +643,35 @@ static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys, void *me
 	return ret;
 }
 
+static int qcom_scm_pas_prep_and_init_image(struct qcom_scm_pas_context *ctx,
+					    const void *metadata, size_t size)
+{
+	struct qcom_scm_pas_metadata *mdt_ctx;
+	struct qcom_scm_res res;
+	phys_addr_t mdata_phys;
+	void *mdata_buf;
+	int ret;
+
+	mdt_ctx = ctx->metadata;
+	mdata_buf = qcom_tzmem_alloc(__scm->mempool, size, GFP_KERNEL);
+	if (!mdata_buf)
+		return -ENOMEM;
+
+	memcpy(mdata_buf, metadata, size);
+	mdata_phys = qcom_tzmem_to_phys(mdata_buf);
+
+	ret = __qcom_scm_pas_init_image(ctx->pas_id, mdata_phys, mdata_buf, size, &res);
+	if (ret < 0 || !mdt_ctx) {
+		qcom_tzmem_free(mdata_buf);
+	} else if (mdt_ctx) {
+		mdt_ctx->ptr = mdata_buf;
+		mdt_ctx->addr.phys_addr = mdata_phys;
+		mdt_ctx->size = size;
+	}
+
+	return ret ? : res.result[0];
+}
+
 /**
  * qcom_scm_pas_init_image() - Initialize peripheral authentication service
  *			       state machine for a given peripheral, using the
@@ -669,6 +698,9 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 	void *mdata_buf;
 	int ret;
 
+	if (ctx && ctx->has_iommu)
+		return qcom_scm_pas_prep_and_init_image(ctx, metadata, size);
+
 	/*
 	 * During the scm call memory protection will be enabled for the meta
 	 * data blob, so make sure it's physically contiguous, 4K aligned and
@@ -694,7 +726,7 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 	} else if (ctx && ctx->metadata) {
 		mdt_ctx = ctx->metadata;
 		mdt_ctx->ptr = mdata_buf;
-		mdt_ctx->phys = mdata_phys;
+		mdt_ctx->addr.dma_addr = mdata_phys;
 		mdt_ctx->size = size;
 	}
 
@@ -714,9 +746,15 @@ void qcom_scm_pas_metadata_release(struct qcom_scm_pas_context *ctx)
 	if (!mdt_ctx->ptr)
 		return;
 
-	dma_free_coherent(__scm->dev, mdt_ctx->size, mdt_ctx->ptr, mdt_ctx->phys);
+	if (ctx->has_iommu) {
+		qcom_tzmem_free(mdt_ctx->ptr);
+		mdt_ctx->addr.phys_addr = 0;
+	} else {
+		dma_free_coherent(__scm->dev, mdt_ctx->size, mdt_ctx->ptr,
+				  mdt_ctx->addr.dma_addr);
+		mdt_ctx->addr.dma_addr = 0;
+	}
 	mdt_ctx->ptr = NULL;
-	mdt_ctx->phys = 0;
 	mdt_ctx->size = 0;
 }
 EXPORT_SYMBOL_GPL(qcom_scm_pas_metadata_release);
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index d6e7a6c9583d..edb2cccee9af 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -68,7 +68,10 @@ int qcom_scm_set_remote_state(u32 state, u32 id);
 
 struct qcom_scm_pas_metadata {
 	void *ptr;
-	dma_addr_t phys;
+	union {
+		dma_addr_t dma_addr;
+		phys_addr_t phys_addr;
+	} addr;
 	ssize_t size;
 };
 

-- 
2.50.1


