Return-Path: <linux-arm-msm+bounces-60388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29038ACF708
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 20:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BE3A3AF396
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 18:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99791280A5F;
	Thu,  5 Jun 2025 18:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PeKrppCO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C1127C16A
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 18:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148375; cv=none; b=ILnnYDT8ps6Sh+uG7nY1UDQmGX6mO04tbU4wy0klnIEuCi6KU86Msq4ZYyugr6lFF7MzaHztTz1860RxhmgVhnNkk2DLEoJ8aFInbSfcMKYX02UFzFDVrXr3ozo9kNwJYXdG3JyIxxC4h5Lqn8Ax3ERLhQAcvCTfUEpnM9v7+Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148375; c=relaxed/simple;
	bh=B9eE+MJ7+O1AN7BKJ5NQdswWxGPSuZQjmPfgsgUDJiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UZAmmq8J4s8YFfN048H91gT/FOLzOlbGL4QxxEdI6ITSp7y8q8fXsdfU3w80Qb/tlt6a/oYeEdGdVX6ph9kufAYW1zJH78cD0mahKShvGRuhkmqMaFJqP9ubmHRQws5nHv8RrzasEyYrt22//mSjatOZ98ZQJ+m5gQFvUrowv8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PeKrppCO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555GaJ9Q032471
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 18:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uUof/zDaOaC
	uzta8w72KM+mWpGInUe/M4USMZdkFuc4=; b=PeKrppCOxxNODy9F/tVq+FcFJi4
	dOkQ+mdt6SuviCpAZfONak5goTINH3OIVgMDyBgW5tePxyUhZqRZrt7VIWCfVclo
	+cs3HaOfNzEoLMUFyJajX/t9lJV1bkoydeC3i+UQSOUYhi24aPnWStfydborUC18
	VRzUSIODKewo+4TKb4VY2ASWLUx+niTc7i6LlcT2uuwWrbmDzpK5qJs6Ak2fNekG
	X2G0MglPizE/yy7BCh/h0eGTyMWdp7vKI2wMfg5tpxK0pzlctOnvEaGtPWux7FPu
	oBueTTZxM5un0eZXXHjvtQiyoGICDfkADqgOTQ40fbJob9y7AnPbAoS1LSw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471sfv17r3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 18:32:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23536f7c2d7so19120755ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 11:32:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148370; x=1749753170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uUof/zDaOaCuzta8w72KM+mWpGInUe/M4USMZdkFuc4=;
        b=PC0DyxyBbB+SZsnzJxF1x92yXyrdxNa/w13wBWJwQ8ZgLGedGxweyCqOggFt2T2WC/
         6fSkdx7xfY/UuTHxy/xSD4SMBlz2C0ZLBtpFXtZGRco+fWEOdSZzJJRWQqe+O5hpcZUi
         7KQ2r+Mp3CzInpxl34lD9lorSAuKX5QeQ4YknY1ZL4o9cgxkgZFLvqt45HdiQ8UciLQ8
         7LT7zT81Ach602r8NyI8JIoa/vHYBYM8p2jjI3LseyzOR2QpLtjXg+TVq3G+BFFjkcWz
         WYZmGemJ2GvUmbhm2IHreINr1N1/2c52OD52cOqpFPRBcU5hFaCzBz+z7hfvNqeKZQsF
         r9Fg==
X-Forwarded-Encrypted: i=1; AJvYcCWdSbsJu7lfdKaVqatJftSoUVwyjyfDQh7eMgzCZyFhEzH7JBMS7mzlOCqev7ccT6B2VUJ+tOd1VyiTe71/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4g2N5eZngfg3WweDnjH/TW157/HYs+lSu+budqeORQ6+zUEyp
	nC346btGbbW8G2ajSkRlO1h0bCuj8i5txzFlAk5EaFEGp3bKOQ1Q3xY5aH95LqPp5f7gVzEC+jG
	bTrMPSlted4ptWD1j5lPp72dxaWIVgZvgpu4fytxDSFadWZjjtIQnNU+0rEAzS4Mmb4Sq
X-Gm-Gg: ASbGncvj1lg33EJLH5DnY4MvfUKkJ02h3jXT+cj3DandmqDEdDTZ0IfALK2/k3CNlm/
	rBXEdm4oWIG7ztoExdkeWzeo+sPzEc7MfJMNoxb0WW6fAts8gSGNL6uwj7X+RFaB63dSu+v0vL2
	7TG4wpz/wnQ+j5ZVMzek3ou311rH9cU3A3on1Ee+41Ic2KkYrVSw8lzgMtgTKtSM/xKpxiZR3U0
	DLWPp8bpDxdi7o/w9FgSlsbFyHsAvKZz1duCEVbVmK129WQE5rsZETkZBBQrkyHp8OizkNPYISa
	V/YIckb9wjmgYckK6Xf+pUJJk6pSL8Fy
X-Received: by 2002:a17:902:e890:b0:235:1706:1fe7 with SMTP id d9443c01a7336-23601cf6b9amr6390105ad.4.1749148370467;
        Thu, 05 Jun 2025 11:32:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQnM4xAK6Q7sA9TaODreLehbG/7tDzSTuO9E5rA5DKAL+arxWePbEuiI6ffeNfHj2Qkxo12w==
X-Received: by 2002:a17:902:e890:b0:235:1706:1fe7 with SMTP id d9443c01a7336-23601cf6b9amr6389695ad.4.1749148370060;
        Thu, 05 Jun 2025 11:32:50 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd92c7sm122605935ad.62.2025.06.05.11.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:32:49 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 15/40] drm/msm: Add mmu support for non-zero offset
Date: Thu,  5 Jun 2025 11:29:00 -0700
Message-ID: <20250605183111.163594-16-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CY8I5Krl c=1 sm=1 tr=0 ts=6841e2d3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=SJjE8ph6EfIcxDFTuEgA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 2gARANM91p63xiD3wjhao4AsoYFxtcXT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX85g4bF/ZhGpf
 OoK9g825skLzY9QiClhKFiH5AUbdGkFerOjjA7At6ISbx3Y76ZLOPTq0DsTJK1yLBQOwiMv481S
 rTL0VUktace2u3UluPtNRieObGDzk2JiqBV5wIcBhKOPcPaLRrkHIE22hBqJMpWSHTOkGBhnM60
 Z3OZi8arFvPn/t+EJMHOHyvTOmN2so+TZBwSnlogtsWk+WLVeQ65GnFsmsyg8KTsqtKavLsdkYq
 MuQ/N8MMl5QreuCQMfu0UnHVSSRCLDr1XjxjiU/+epn7SmOHVpL5lmPE5O8DiZpQCB9YQ8GWkRP
 WiOQdW3qnWN6GIQBhpb5jO95cpJuUPFn2tmHOmeks0I3+P/4MpFIGTOBONHXwQNgKPET6dtQjNB
 I6Gpm7wqI+kTpOpIMhRwIGod7bTGqZzyft5yWIicUhRwxMCnQ0WSi5ia2Tjy68vHB8QiM85w
X-Proofpoint-GUID: 2gARANM91p63xiD3wjhao4AsoYFxtcXT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050165

From: Rob Clark <robdclark@chromium.org>

Only needs to be supported for iopgtables mmu, the other cases are
either only used for kernel managed mappings (where offset is always
zero) or devices which do not support sparse bindings.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a2xx_gpummu.c |  5 ++++-
 drivers/gpu/drm/msm/msm_gem.c            |  4 ++--
 drivers/gpu/drm/msm/msm_gem.h            |  4 ++--
 drivers/gpu/drm/msm/msm_gem_vma.c        | 13 +++++++------
 drivers/gpu/drm/msm/msm_iommu.c          | 22 ++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_mmu.h            |  2 +-
 6 files changed, 36 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
index 39641551eeb6..6124336af2ec 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
@@ -29,13 +29,16 @@ static void a2xx_gpummu_detach(struct msm_mmu *mmu)
 }
 
 static int a2xx_gpummu_map(struct msm_mmu *mmu, uint64_t iova,
-		struct sg_table *sgt, size_t len, int prot)
+			   struct sg_table *sgt, size_t off, size_t len,
+			   int prot)
 {
 	struct a2xx_gpummu *gpummu = to_a2xx_gpummu(mmu);
 	unsigned idx = (iova - GPUMMU_VA_START) / GPUMMU_PAGE_SIZE;
 	struct sg_dma_page_iter dma_iter;
 	unsigned prot_bits = 0;
 
+	WARN_ON(off != 0);
+
 	if (prot & IOMMU_WRITE)
 		prot_bits |= 1;
 	if (prot & IOMMU_READ)
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 09c40a7e04ac..194a15802a5f 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -457,7 +457,7 @@ static struct drm_gpuva *get_vma_locked(struct drm_gem_object *obj,
 	vma = lookup_vma(obj, vm);
 
 	if (!vma) {
-		vma = msm_gem_vma_new(vm, obj, range_start, range_end);
+		vma = msm_gem_vma_new(vm, obj, 0, range_start, range_end);
 	} else {
 		GEM_WARN_ON(vma->va.addr < range_start);
 		GEM_WARN_ON((vma->va.addr + obj->size) > range_end);
@@ -499,7 +499,7 @@ int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
 	if (IS_ERR(pages))
 		return PTR_ERR(pages);
 
-	return msm_gem_vma_map(vma, prot, msm_obj->sgt, obj->size);
+	return msm_gem_vma_map(vma, prot, msm_obj->sgt);
 }
 
 void msm_gem_unpin_locked(struct drm_gem_object *obj)
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 278ec34c31fc..2dd9a7f585f4 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -110,9 +110,9 @@ struct msm_gem_vma {
 
 struct drm_gpuva *
 msm_gem_vma_new(struct drm_gpuvm *vm, struct drm_gem_object *obj,
-		u64 range_start, u64 range_end);
+		u64 offset, u64 range_start, u64 range_end);
 void msm_gem_vma_purge(struct drm_gpuva *vma);
-int msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt, int size);
+int msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt);
 void msm_gem_vma_close(struct drm_gpuva *vma);
 
 struct msm_gem_object {
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index df8eb910ca31..ef0efd87e4a6 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -38,8 +38,7 @@ void msm_gem_vma_purge(struct drm_gpuva *vma)
 
 /* Map and pin vma: */
 int
-msm_gem_vma_map(struct drm_gpuva *vma, int prot,
-		struct sg_table *sgt, int size)
+msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt)
 {
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
 	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
@@ -62,8 +61,9 @@ msm_gem_vma_map(struct drm_gpuva *vma, int prot,
 	 * Revisit this if we can come up with a scheme to pre-alloc pages
 	 * for the pgtable in map/unmap ops.
 	 */
-	ret = vm->mmu->funcs->map(vm->mmu, vma->va.addr, sgt, size, prot);
-
+	ret = vm->mmu->funcs->map(vm->mmu, vma->va.addr, sgt,
+				  vma->gem.offset, vma->va.range,
+				  prot);
 	if (ret) {
 		msm_vma->mapped = false;
 	}
@@ -93,7 +93,7 @@ void msm_gem_vma_close(struct drm_gpuva *vma)
 /* Create a new vma and allocate an iova for it */
 struct drm_gpuva *
 msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
-		u64 range_start, u64 range_end)
+		u64 offset, u64 range_start, u64 range_end)
 {
 	struct msm_gem_vm *vm = to_msm_vm(gpuvm);
 	struct drm_gpuvm_bo *vm_bo;
@@ -107,6 +107,7 @@ msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
 		return ERR_PTR(-ENOMEM);
 
 	if (vm->managed) {
+		BUG_ON(offset != 0);
 		ret = drm_mm_insert_node_in_range(&vm->mm, &vma->node,
 						obj->size, PAGE_SIZE, 0,
 						range_start, range_end, 0);
@@ -120,7 +121,7 @@ msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
 
 	GEM_WARN_ON((range_end - range_start) > obj->size);
 
-	drm_gpuva_init(&vma->base, range_start, range_end - range_start, obj, 0);
+	drm_gpuva_init(&vma->base, range_start, range_end - range_start, obj, offset);
 	vma->mapped = false;
 
 	ret = drm_gpuva_insert(&vm->base, &vma->base);
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index e70088a91283..2fd48e66bc98 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -113,7 +113,8 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
 }
 
 static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
-		struct sg_table *sgt, size_t len, int prot)
+				   struct sg_table *sgt, size_t off, size_t len,
+				   int prot)
 {
 	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
 	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
@@ -125,6 +126,19 @@ static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
 		size_t size = sg->length;
 		phys_addr_t phys = sg_phys(sg);
 
+		if (!len)
+			break;
+
+		if (size <= off) {
+			off -= size;
+			continue;
+		}
+
+		phys += off;
+		size -= off;
+		size = min_t(size_t, size, len);
+		off = 0;
+
 		while (size) {
 			size_t pgsize, count, mapped = 0;
 			int ret;
@@ -140,6 +154,7 @@ static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
 			phys += mapped;
 			addr += mapped;
 			size -= mapped;
+			len  -= mapped;
 
 			if (ret) {
 				msm_iommu_pagetable_unmap(mmu, iova, addr - iova);
@@ -400,11 +415,14 @@ static void msm_iommu_detach(struct msm_mmu *mmu)
 }
 
 static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
-		struct sg_table *sgt, size_t len, int prot)
+			 struct sg_table *sgt, size_t off, size_t len,
+			 int prot)
 {
 	struct msm_iommu *iommu = to_msm_iommu(mmu);
 	size_t ret;
 
+	WARN_ON(off != 0);
+
 	/* The arm-smmu driver expects the addresses to be sign extended */
 	if (iova & BIT_ULL(48))
 		iova |= GENMASK_ULL(63, 49);
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index c33247e459d6..c874852b7331 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -12,7 +12,7 @@
 struct msm_mmu_funcs {
 	void (*detach)(struct msm_mmu *mmu);
 	int (*map)(struct msm_mmu *mmu, uint64_t iova, struct sg_table *sgt,
-			size_t len, int prot);
+			size_t off, size_t len, int prot);
 	int (*unmap)(struct msm_mmu *mmu, uint64_t iova, size_t len);
 	void (*destroy)(struct msm_mmu *mmu);
 	void (*resume_translation)(struct msm_mmu *mmu);
-- 
2.49.0


