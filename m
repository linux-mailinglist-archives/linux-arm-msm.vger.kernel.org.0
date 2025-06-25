Return-Path: <linux-arm-msm+bounces-62546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F593AE8DDF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 21:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A862F1C25B74
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 19:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60EA62FA65C;
	Wed, 25 Jun 2025 18:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WtZf3CkK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DD72F94BE
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877958; cv=none; b=J8jpGJjG6zc4xrzm54E1MAFPBsWwzn2vdenUoLJ2actD+twY4nriKoLMt+pL+ueF4PWr9TU2jtTlCE9AVGeHbPtJoFLspdA6bMM/Iuz3Ee53VS9gKWKiuElodpjBWSEwGy0xCV9ycZ1c+XLmTPMIKg4goFp4VkXFt6iZ0BKA2sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877958; c=relaxed/simple;
	bh=vPu53PGWBpfPppllpl1iLj20es1VLGg4hj8SiJ/zrYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nLFD2EYRrlX7IzveadX+od8jOnUHbZTxiZzgt+bmWdCjs00Lw44Rh0jnDUrrZDMnQ6PFDCv3Hen/BH9DULjGA3P59JtJhYK+I8uO510SgMzmNMUP5k6FgXL+6q20LU7fbXKL3I7caXD7XRvnJyb21zayLtteXeBW1qsErS6/QIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WtZf3CkK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PB1pJR023006
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=49iUFarYqun
	NoIxPR8E20lSmIXKZAbaZ3WmH/nqkmuc=; b=WtZf3CkKNuQU97IvGeNFmcWXCY6
	y2l4y8KMgmNeiWDi0g8rGOrSkCzKn2ph/JxmTm7tL0MJ/qr4a+CkeUaZ4x+thjl3
	DLLAuPmFc9T+hc0c2jEUVcJeX3Nbd5qGNf/ioRPy0deT+qW2mOwvaNneFIRsvZqv
	V/hQv31Z0d/sAXbcJ+ZeEOfUQOBb/rylxj3dJY8xK14i/xGjgM23/tqYgWDNaJtl
	/PQR3mmLuMGbURcDyQzCDG0WKTXhKVoLurdai2h/Ip6rHKRHTC1b8ptbkpsh6IED
	Qmm6juVfCxYYyRiJPiYxmbFyPgrXA3THe7LRso6NbvuOi7q1mSCm+H9ikQg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fapq0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235e7550f7bso1591285ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877954; x=1751482754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=49iUFarYqunNoIxPR8E20lSmIXKZAbaZ3WmH/nqkmuc=;
        b=Q4pvSizkH9E4cxwLVksEPYdEys5Ge0VjAR6aIHgDz8buC68tiWW00BfjrBf1yowlvV
         yDJ69C1ATz7l+QbX3trQDMPvmBaRzEwlsgW4wbl6fGm6H4JaHmXIqXTYObpozyB07M7Z
         3KFfJRALYeMjK/vE2mAuXXMlzwGJlubMeP8wpIoqZ0V8j5ZlKY0FK/TcIqtYkq9eACVE
         FVAmCKZPvWNOYpRxzul93ZzrSiFRUX9Yb3Pu2GcJctmH+wkA/WrX56HOSMRgcBCjWXN4
         ScZu8SJO6AWIhAQX92gVZ2DPiKhuwQdZuX8WaUnZNlKqHnPeMp9lgY0tdfxt1/2zwxC+
         yP4w==
X-Gm-Message-State: AOJu0YyHoO0ZHHh70fB/IKYq6GWewIUttjhh8FITPlQMQKyWTkzjIjQk
	OCgFL54shzzO1tK6rqkpPjrHncXrL216IP80V6zBeaq7L6iLFglJf8FhbrmO21SyIKolrDTZDoT
	B63XRRHSQKzG6MNBKyfsSaP8DRjighoPyWnoOWDILkQfvPkKxAYqPdUL72jjZN61l8oAl
X-Gm-Gg: ASbGnctNiaU+xbSaWhlMG9ksPigbaB5/GiAW+ywNjlLJRNmWwxj1Dqw9xZgGfg85gFi
	ObANv90XmF7Hce19+mn8W1/6Gg/LieWLNP69Wiw5dVGLE7nOk+jkKE/paVh1d5mPTx8s4f1Xjff
	JaHfgGJvL67wNR/5spqdISm86WDBRQeyryckVE53NaTj0eaW5TIud0W4XXwrPHAwMweqpW/S3W5
	uhBhM3sImQ2EAKU6JFFPU+kcCK0NdbbHY5I+rqlz13wTPswYNDepq/jBFNjHP0V6R1PXFb7sEyp
	hlysTidNFIWGoSmmoCC7243M/MiVDJIQ
X-Received: by 2002:a17:903:1cb:b0:235:91a:4d with SMTP id d9443c01a7336-23824108cbdmr77909985ad.23.1750877953557;
        Wed, 25 Jun 2025 11:59:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFf3AcJpzfzjZQsgRmjwLAbbXRsrGhtl7AY0PDU2VAAi3sP12gUBwP1a3MTqSTUA/gKCDHVqw==
X-Received: by 2002:a17:903:1cb:b0:235:91a:4d with SMTP id d9443c01a7336-23824108cbdmr77909665ad.23.1750877953165;
        Wed, 25 Jun 2025 11:59:13 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83989besm144278745ad.38.2025.06.25.11.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:59:12 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 34/42] drm/msm: Split out map/unmap ops
Date: Wed, 25 Jun 2025 11:47:27 -0700
Message-ID: <20250625184918.124608-35-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MiBTYWx0ZWRfX4Ud80eYvV3SS
 iierxJCKNwa6GDBDz9k0bUuaOdRQPPD0GNmtPjhh6rPxWpHX6HWqkN1/YneLeHMRI6LwBL72SvZ
 +FTZrSsHzrY6O+H3LvkodCMH0pnDrpV9hz6drIs13f3Cef1wvT7YXa/8Q+8Gss3xPClHnqwK6F2
 iNgj6scSs7RnsuvFfFL+DIBpWJEeZS7iVs2FsdkuzPsbXXZA3ZM86/4amueMRxo6VJS0DLTFZkt
 ++Yzr7oM9NNT4e6dCETJA5X0ipCEuEvvayU/tWxBDxmGgNTU/y6JCRz1pav0RJVVMIZTBnAAUo5
 ssysn68kzgdu0hOoCXBFDa797qx23POoNDzb+CHUsQ4Vp2/zAOqeAPNF9be9K3HRDfd5mFNkVwc
 k9CAv6Gr2KGPW34uLU3aYrhf8LGDOPL5OyzbWlc/XbAQHcCr1eldv2Vla3+pgKcy9sFAdp8A
X-Proofpoint-ORIG-GUID: MmZ_o2fWLgeXOMPydqUTOLoHtGFT8WMd
X-Proofpoint-GUID: MmZ_o2fWLgeXOMPydqUTOLoHtGFT8WMd
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685c4703 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=xxbd-mT8tQbqgF3hF1cA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250142

From: Rob Clark <robdclark@chromium.org>

With async VM_BIND, the actual pgtable updates are deferred.
Synchronously, a list of map/unmap ops will be generated, but the
actual pgtable changes are deferred.  To support that, split out
op handlers and change the existing non-VM_BIND paths to use them.

Note in particular, the vma itself may already be destroyed/freed
by the time an UNMAP op runs (or even a MAP op if there is a later
queued UNMAP).  For this reason, the op handlers cannot reference
the vma pointer.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 63 +++++++++++++++++++++++++++----
 1 file changed, 56 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index cf37abb98235..76b79c122182 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -8,6 +8,34 @@
 #include "msm_gem.h"
 #include "msm_mmu.h"
 
+#define vm_dbg(fmt, ...) pr_debug("%s:%d: "fmt"\n", __func__, __LINE__, ##__VA_ARGS__)
+
+/**
+ * struct msm_vm_map_op - create new pgtable mapping
+ */
+struct msm_vm_map_op {
+	/** @iova: start address for mapping */
+	uint64_t iova;
+	/** @range: size of the region to map */
+	uint64_t range;
+	/** @offset: offset into @sgt to map */
+	uint64_t offset;
+	/** @sgt: pages to map, or NULL for a PRR mapping */
+	struct sg_table *sgt;
+	/** @prot: the mapping protection flags */
+	int prot;
+};
+
+/**
+ * struct msm_vm_unmap_op - unmap a range of pages from pgtable
+ */
+struct msm_vm_unmap_op {
+	/** @iova: start address for unmap */
+	uint64_t iova;
+	/** @range: size of region to unmap */
+	uint64_t range;
+};
+
 static void
 msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 {
@@ -21,18 +49,36 @@ msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 	kfree(vm);
 }
 
+static void
+vm_unmap_op(struct msm_gem_vm *vm, const struct msm_vm_unmap_op *op)
+{
+	vm_dbg("%p: %016llx %016llx", vm, op->iova, op->iova + op->range);
+
+	vm->mmu->funcs->unmap(vm->mmu, op->iova, op->range);
+}
+
+static int
+vm_map_op(struct msm_gem_vm *vm, const struct msm_vm_map_op *op)
+{
+	vm_dbg("%p: %016llx %016llx", vm, op->iova, op->iova + op->range);
+
+	return vm->mmu->funcs->map(vm->mmu, op->iova, op->sgt, op->offset,
+				   op->range, op->prot);
+}
+
 /* Actually unmap memory for the vma */
 void msm_gem_vma_unmap(struct drm_gpuva *vma)
 {
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
-	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
-	unsigned size = vma->va.range;
 
 	/* Don't do anything if the memory isn't mapped */
 	if (!msm_vma->mapped)
 		return;
 
-	vm->mmu->funcs->unmap(vm->mmu, vma->va.addr, size);
+	vm_unmap_op(to_msm_vm(vma->vm), &(struct msm_vm_unmap_op){
+		.iova = vma->va.addr,
+		.range = vma->va.range,
+	});
 
 	msm_vma->mapped = false;
 }
@@ -42,7 +88,6 @@ int
 msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt)
 {
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
-	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
 	int ret;
 
 	if (GEM_WARN_ON(!vma->va.addr))
@@ -62,9 +107,13 @@ msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt)
 	 * Revisit this if we can come up with a scheme to pre-alloc pages
 	 * for the pgtable in map/unmap ops.
 	 */
-	ret = vm->mmu->funcs->map(vm->mmu, vma->va.addr, sgt,
-				  vma->gem.offset, vma->va.range,
-				  prot);
+	ret = vm_map_op(to_msm_vm(vma->vm), &(struct msm_vm_map_op){
+		.iova = vma->va.addr,
+		.range = vma->va.range,
+		.offset = vma->gem.offset,
+		.sgt = sgt,
+		.prot = prot,
+	});
 	if (ret) {
 		msm_vma->mapped = false;
 	}
-- 
2.49.0


