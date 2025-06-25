Return-Path: <linux-arm-msm+bounces-62529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E49DAE8DB6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 21:02:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB2891BC453A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 19:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FA1B2EE5FD;
	Wed, 25 Jun 2025 18:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="daHX063X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEEF2ED87F
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877933; cv=none; b=ZeXf9yEAnAgrwZJG24K///q+t8KAw8OCSlKoW6GASGiX+K7ACTzJz5CxX9ghXjViysuO1nAD/p2ggGJ9KfTxE7sGbmfO4fJc9rHUklKrLIeVAoD53MOWtIXTOLySoV4t68mXu2QzsKn9LwT5gZl/f+mAv2UBZk6gTDw6SS0/El8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877933; c=relaxed/simple;
	bh=B9eE+MJ7+O1AN7BKJ5NQdswWxGPSuZQjmPfgsgUDJiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P6bgCZo20eDWkKF8/oPbpDi5gBk5lzbRwwVA+Gzxc5Ac2DijyQ3lzgwIdCv2hGcwpf+bde+WNam8M3cC9PgY3nuOyZoqX004iz7ZT70Vkat3jsR7NgDvO7Fo7QMYlkOfRK6V7fEZNjd+5TymL1YIL9v5jL9K2DdLeszlrsyxvS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=daHX063X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PA33as032470
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uUof/zDaOaC
	uzta8w72KM+mWpGInUe/M4USMZdkFuc4=; b=daHX063XX52gcUva/JWjgS2QGJI
	9b0MmNBvFM01Am+kUbi6KWt1Ncm8SkCzHVBxIJXDJQai6GZj5R+r645OHfYXMtCn
	KgcByb3qKPmCHmjMNe3C/JMncH+ESpnBsWkGP+VwhSwv7SyMB29U2OAUAhReK4Ry
	42jOUS9VcaKY59XlueARc2Gf8uL4Zz1enH/zr4yOPxrEvh6DaZMPIpSghNbUgzmw
	ykNJY2if+HX0YOrozk7n/fUE3UtqYFMXm3YYoPG1O59H03JW+Y0H8C4gjY31Qw2Y
	dzhpleiuKplqfDAKGpchfAI6MSq+0/yq21oOxVfpEUWRO33WKrzStxleRqA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm1ygyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:58:50 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-747ddba7c90so182477b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:58:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877929; x=1751482729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uUof/zDaOaCuzta8w72KM+mWpGInUe/M4USMZdkFuc4=;
        b=DoZ2K+K+3COoJW/47GNZ65heE0MIsngT+d4mIh+plRbgK5YLFN3dkV4lS3oMbhiGT8
         fP0/GXGXX8KiFZfYOkWRyeuzgIG0Pm1xP5qWNXghdagIs74KC6iKe2AH3V9UFZ2Bc9Vx
         uR9pQmpHFJDU6yyjLHOa1e9hlq9g40iBvfzx4mlr6G9vqXPzSm6rY80M+yUpJJ1V1TkD
         xmta73MHgsRZVRQ9ShzlRlmnOqapoKo6WbxCZmKdSvM4Y0+tn+HZevBvTWOdvARoEyo6
         C07BuT09P4z/E03+MrIu/7I2/wVFqXXgNqENvEqCKl/rYhbSCHwwhfEbzHkhH+mg4eZE
         XP/w==
X-Gm-Message-State: AOJu0YyPZDt3NM10GHfQiUwOg+Bqjl8xYMRSjy+MxrXv6/RTQSV0l2pN
	Bst1OVDzaDZNpZID3CH2OsRlr+cEFEEcgaoVZStb6zHLFESUOJt//1Mvrh/C/RvJnC7el0xICy/
	dvvkK/LlVQ8BnPUNEzT/aBj4Pslstj7OcOf7BwqnV/zC+Empmq/L1JCht5MYUjT41EyZ1m0QGPs
	tn
X-Gm-Gg: ASbGncsTjxKPTrPbIW4RLquQ/gZ1HYRlLBproBrzCnRjdMP5RlBzv9lWb4CApTUYuDo
	vUYIvX2AaEzjnax+KT6S9efhc5nj8cnt8SpcEOmSQSJZVWxI/G7IL/H2/vupPacbVAPMtVzjgr8
	iz/VH45w4zXR8xjLapBH+BTCTSW7xiv2OMGdPtuRTAWEz5Fki7qhzO3hWJGhqoEszyrhxL++omv
	t8aaHoYVh7eaeLCqOMtDDngl31Y+Y9FvFxTz5ZlIZ45yzbsQycDLsYgGHgn0WiE++nKddhjxkc/
	cswxlneQ0hg4O2FUEH4hnOvdSQP0YY3q
X-Received: by 2002:a05:6a00:3cd2:b0:736:51ab:7aed with SMTP id d2e1a72fcca58-74ad458d7b5mr6148088b3a.16.1750877928795;
        Wed, 25 Jun 2025 11:58:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdsEeiKThsDDj6JNuEy0m0GDad42QGwOQbpzwLriU0Lfc6EjO+iivd3VBI2GjbL4nRye7z/w==
X-Received: by 2002:a05:6a00:3cd2:b0:736:51ab:7aed with SMTP id d2e1a72fcca58-74ad458d7b5mr6148048b3a.16.1750877928325;
        Wed, 25 Jun 2025 11:58:48 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749b5e2145bsm5458283b3a.54.2025.06.25.11.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:58:47 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 17/42] drm/msm: Add mmu support for non-zero offset
Date: Wed, 25 Jun 2025 11:47:10 -0700
Message-ID: <20250625184918.124608-18-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685c46ea cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=SJjE8ph6EfIcxDFTuEgA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: EfmPZoKm5Nepcbg9UrjS_mufN-yhw8u7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MiBTYWx0ZWRfX/K2hzdtAERjd
 yhlMVNI64XAsG3WPGvCYIipbfiy5QIp+MCo9VgKj+qlYxMJxkZBDPQlYtDAMdD5JmnkrPwRgm2D
 K0e5EEHZ+jLTvVqaZDQHydsKdwYLthaJbyTBGvW3Kc2j5QAqRMNaHjOgvBGA7t0cvTWoOUo8vt5
 ZOU8wTLfRgV9B75eQjx+SjyfPtfS0xDoj5ePZYZkYkMePj4yLBQ/KkKzwWYykCi3t5pju12/Lc+
 B4Mhc65kkhLcG9nBt7zAbfmRZPgb3ypr8DWW+2+LZQ4eSw5FPVmyOxvwMq+rfnRYv8ukAvMXipD
 VTSdvxJNvV1bj0845okmep45KmQA6Rt19FTYnczhI/kiTBiFekoW3cBKby21t00cdfOxRU41PCF
 7UHqIaM7nFm7tNXPgMlMYO4qKAnJkaBN93kF+I4CGh51ssjZG/vZFojwLczvZKpDBiSvX82n
X-Proofpoint-ORIG-GUID: EfmPZoKm5Nepcbg9UrjS_mufN-yhw8u7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250142

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


