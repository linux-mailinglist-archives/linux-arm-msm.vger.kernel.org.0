Return-Path: <linux-arm-msm+bounces-63021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A9CAED0E4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 22:23:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0A741748B7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 20:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 423C9260588;
	Sun, 29 Jun 2025 20:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YGqPr19L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D493A241CA2
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228231; cv=none; b=NId/9rFLtI7SE4EPBKXn72P0rGUu+SDEi+kZ1rjBOSQUoHuzxihOOCunhobI9y/zFWh1sLszfiYsCKmlGWnW20NzH4gDzAFg6yADfdcbNLL2qZVd7gF7IMJ2a/6c+gLh9IUOY7B6olk0VntiunOw61rcveeW5oaM0DpURlFt8Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228231; c=relaxed/simple;
	bh=JsILLt2+b+xZrxxAbVvwrl1hB4+WAdrIOnzh9EnzXdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SufZSinQhY0ni/Kssh+suaPw34FZkl4CM4TI7bDuam8YpWmEXD8q1oBl1qIv2T5q44EIXhPkssEt0omWrlFSNqyUu1Xu0k3RievbZ85St4Yjmjnv/YRQS3qgXJ9/AYkXcsqSUNLfAeW2PpNDjrmZFwKzV0rEKGi8FBxNljYq1yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YGqPr19L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TDOS98008662
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iVk8CflO5KH
	TgfTqgOrc0graSmlaqzNMFTNHNE1Irm0=; b=YGqPr19LqEQYskNY19A0fgN+pGY
	SQ1TCcCIIE3g3ghDESZBH/zKFFDLPBkb39VDb+PbUGSl5lBISUtINubb4VHrqxnb
	Cm3OphjDwzdKNaNYI0ElfF7Ban45eBJ3elKQqJ7dUsnpvDl+5OZRzvN5Bs0s2r0C
	vs2BXbKc11xSxOoqm5nfhWZaz6zu12AXr6StYWJbOnvwRHTCmVqsydarGhJNZIX+
	twKSTtwWGgd37eceHZB1QW+o+zU5pAhVoucVENeNn3bU5PQZlXYVZlarpGcwCIF4
	0QBAjZIaMDXmiBjV3p0UUMdAdOHeC/IXIJ5urVtoXz3S4Y+xypdEWRE/wzQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7d9tpm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:17:07 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7494999de28so5636116b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 13:17:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228226; x=1751833026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iVk8CflO5KHTgfTqgOrc0graSmlaqzNMFTNHNE1Irm0=;
        b=iCsztgs588KoTAbSF1KgyRLyY+OZOMheLzYat7u+vrNGPgKocHH9uF/30uMdpc9iza
         UpaQTZ3pIvfK3tvA5xJMwy1ScvADEKz15hfd0mlERu6pKbyaJgeU3NFzDG9fIFmE8NyT
         kUc7ht8y9RDc5E6lAyCSu08TgBhjK6tpzDVF8Y362bwPReQF0t5Brf42q87Ge+XcRIEL
         GzcpN2940zlCGpP+eriofrHlUeEW4EtlHNhViJltD06IxKD+l5SljkvKJSTg7WQRBER5
         8p/frtAEPgTEpYCk8pZgjtA93001KrxFdC+pXYoIvaw84E/38bESul8OH46p63RZjMl1
         mkWg==
X-Gm-Message-State: AOJu0Yy0I9BjNh7aSWaBfIygpCkolM1aI+W4kzgc7xx3cEve42Oi+InQ
	A9+xRYNH9Job7+9BwaaiXssPNnzryJT1MI9xWeufYNRp2Lcxiq1J8hZez6sT8FUVKcogsemPX+x
	WXDFmihKmQwH60FZh5TkEgmpyCrXj2QbCzYId26LPLa1L9VUh0verlwrvRy5CQUy3yzWU4pm0qC
	cy
X-Gm-Gg: ASbGncvKVf8LPaawwarpj6Y7MOBSYOAVNnHCqKE9lKJD7Z9r2XgvZOn1NDnd5MqyZCB
	bWeUiHA7dSmnS6Mgr0ycUY9pM7QWuzfLd/jLv6LEcOGd7eTRZBrabKgF7rC4Ia5ukkl5YxqZ2so
	BVEgM9OQ97IoaVXU7czS/OQQZ2ppHOgUq2lFXs+XjccKvKOQBKRA00uvhTfcZKvOVujuoWM9FVw
	cjscP12lE616gVlClRgKCwOpFPGgrIVJtTzuu9aOQ9YN4LlWo5GtmmKj89ArGHiT3PhOFsz+Txp
	XijVXqNI6ubPhzuKsuNfeaYmDyGCpNYLSw==
X-Received: by 2002:a05:6a20:e68b:b0:1f5:889c:3cbd with SMTP id adf61e73a8af0-220a1837cecmr19838091637.35.1751228226148;
        Sun, 29 Jun 2025 13:17:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcrE7qywQHtGSXoLqU9TslvAYJaZLCyTG9TccAZbtf5Hzo86eqkFSE3GtcF3SgJ0I5Y+ZeBA==
X-Received: by 2002:a05:6a20:e68b:b0:1f5:889c:3cbd with SMTP id adf61e73a8af0-220a1837cecmr19838049637.35.1751228225682;
        Sun, 29 Jun 2025 13:17:05 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af58068b6sm7324343b3a.175.2025.06.29.13.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:17:05 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 33/42] drm/msm: Support pgtable preallocation
Date: Sun, 29 Jun 2025 13:13:16 -0700
Message-ID: <20250629201530.25775-34-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MSBTYWx0ZWRfX+FN+Jy/tO+Gb
 mXnJVaABrWMegV7cH+RrEcV58l/osiL/a1XLSwehquJ1yWMNtrdqTK6f7rhHNnie5YJmuNTfY9r
 lJEu7a515Usea6ED+Diph8B4FjDPle3OXulrA/ne/weLLhPWq8ZLqKc543n+haOTfuHPo6cVKSz
 zZvNcsYJxjxFksXY4TWW1rFUBG7jE8Rd7V/gskhNvqOJsC3jJaoaMHGoYmEvppGS1dWY/MqeSx3
 qxrwb39DoVnEDFFA1wrpwKXxMuN2G7bzg12uvVhk/ReX2UAaL3/UPnSR7g2g/FEkVVqYBDrr6hJ
 wZgxPOpbhsWmwjEUCJmO6xNe97WIYp656VJJwywqU/QxzUNsDOHpwV2agCnQgK2AVP410C2Dg75
 UV+Wg1JCe+x7BSFKBbJlTuM16suXOzByDg0eaQcI3+xj5tMAJ0aPAcUwENaZmB+VnwH0sM15
X-Proofpoint-GUID: OiwBppDX_cLnruU00CvLjV6_7SMN25xE
X-Authority-Analysis: v=2.4 cv=RrbFLDmK c=1 sm=1 tr=0 ts=68619f43 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=7CQSdrXTAAAA:8 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=FDPAursefL7ktZtO0vwA:9 a=OpyuDcXvxspvyRM73sMx:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: OiwBppDX_cLnruU00CvLjV6_7SMN25xE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290171

From: Rob Clark <robdclark@chromium.org>

Introduce a mechanism to count the worst case # of pages required in a
VM_BIND op.

Note that previously we would have had to somehow account for
allocations in unmap, when splitting a block.  This behavior was removed
in commit 33729a5fc0ca ("iommu/io-pgtable-arm: Remove split on unmap
behavior)"

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.h   |   1 +
 drivers/gpu/drm/msm/msm_iommu.c | 191 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_mmu.h   |  34 ++++++
 3 files changed, 225 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index af637409be39..f369a30a247c 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -7,6 +7,7 @@
 #ifndef __MSM_GEM_H__
 #define __MSM_GEM_H__
 
+#include "msm_mmu.h"
 #include <linux/kref.h>
 #include <linux/dma-resv.h>
 #include "drm/drm_exec.h"
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index bd67431cb25f..887c9023f8a2 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -6,6 +6,7 @@
 
 #include <linux/adreno-smmu-priv.h>
 #include <linux/io-pgtable.h>
+#include <linux/kmemleak.h>
 #include "msm_drv.h"
 #include "msm_mmu.h"
 
@@ -14,6 +15,8 @@ struct msm_iommu {
 	struct iommu_domain *domain;
 	atomic_t pagetables;
 	struct page *prr_page;
+
+	struct kmem_cache *pt_cache;
 };
 
 #define to_msm_iommu(x) container_of(x, struct msm_iommu, base)
@@ -27,6 +30,9 @@ struct msm_iommu_pagetable {
 	unsigned long pgsize_bitmap;	/* Bitmap of page sizes in use */
 	phys_addr_t ttbr;
 	u32 asid;
+
+	/** @root_page_table: Stores the root page table pointer. */
+	void *root_page_table;
 };
 static struct msm_iommu_pagetable *to_pagetable(struct msm_mmu *mmu)
 {
@@ -282,7 +288,145 @@ msm_iommu_pagetable_walk(struct msm_mmu *mmu, unsigned long iova, uint64_t ptes[
 	return 0;
 }
 
+static void
+msm_iommu_pagetable_prealloc_count(struct msm_mmu *mmu, struct msm_mmu_prealloc *p,
+				   uint64_t iova, size_t len)
+{
+	u64 pt_count;
+
+	/*
+	 * L1, L2 and L3 page tables.
+	 *
+	 * We could optimize L3 allocation by iterating over the sgt and merging
+	 * 2M contiguous blocks, but it's simpler to over-provision and return
+	 * the pages if they're not used.
+	 *
+	 * The first level descriptor (v8 / v7-lpae page table format) encodes
+	 * 30 bits of address.  The second level encodes 29.  For the 3rd it is
+	 * 39.
+	 *
+	 * https://developer.arm.com/documentation/ddi0406/c/System-Level-Architecture/Virtual-Memory-System-Architecture--VMSA-/Long-descriptor-translation-table-format/Long-descriptor-translation-table-format-descriptors?lang=en#BEIHEFFB
+	 */
+	pt_count = ((ALIGN(iova + len, 1ull << 39) - ALIGN_DOWN(iova, 1ull << 39)) >> 39) +
+		   ((ALIGN(iova + len, 1ull << 30) - ALIGN_DOWN(iova, 1ull << 30)) >> 30) +
+		   ((ALIGN(iova + len, 1ull << 21) - ALIGN_DOWN(iova, 1ull << 21)) >> 21);
+
+	p->count += pt_count;
+}
+
+static struct kmem_cache *
+get_pt_cache(struct msm_mmu *mmu)
+{
+	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
+	return to_msm_iommu(pagetable->parent)->pt_cache;
+}
+
+static int
+msm_iommu_pagetable_prealloc_allocate(struct msm_mmu *mmu, struct msm_mmu_prealloc *p)
+{
+	struct kmem_cache *pt_cache = get_pt_cache(mmu);
+	int ret;
+
+	p->pages = kvmalloc_array(p->count, sizeof(p->pages), GFP_KERNEL);
+	if (!p->pages)
+		return -ENOMEM;
+
+	ret = kmem_cache_alloc_bulk(pt_cache, GFP_KERNEL, p->count, p->pages);
+	if (ret != p->count) {
+		p->count = ret;
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static void
+msm_iommu_pagetable_prealloc_cleanup(struct msm_mmu *mmu, struct msm_mmu_prealloc *p)
+{
+	struct kmem_cache *pt_cache = get_pt_cache(mmu);
+	uint32_t remaining_pt_count = p->count - p->ptr;
+
+	kmem_cache_free_bulk(pt_cache, remaining_pt_count, &p->pages[p->ptr]);
+	kvfree(p->pages);
+}
+
+/**
+ * alloc_pt() - Custom page table allocator
+ * @cookie: Cookie passed at page table allocation time.
+ * @size: Size of the page table. This size should be fixed,
+ * and determined at creation time based on the granule size.
+ * @gfp: GFP flags.
+ *
+ * We want a custom allocator so we can use a cache for page table
+ * allocations and amortize the cost of the over-reservation that's
+ * done to allow asynchronous VM operations.
+ *
+ * Return: non-NULL on success, NULL if the allocation failed for any
+ * reason.
+ */
+static void *
+msm_iommu_pagetable_alloc_pt(void *cookie, size_t size, gfp_t gfp)
+{
+	struct msm_iommu_pagetable *pagetable = cookie;
+	struct msm_mmu_prealloc *p = pagetable->base.prealloc;
+	void *page;
+
+	/* Allocation of the root page table happening during init. */
+	if (unlikely(!pagetable->root_page_table)) {
+		struct page *p;
+
+		p = alloc_pages_node(dev_to_node(pagetable->iommu_dev),
+				     gfp | __GFP_ZERO, get_order(size));
+		page = p ? page_address(p) : NULL;
+		pagetable->root_page_table = page;
+		return page;
+	}
+
+	if (WARN_ON(!p) || WARN_ON(p->ptr >= p->count))
+		return NULL;
+
+	page = p->pages[p->ptr++];
+	memset(page, 0, size);
+
+	/*
+	 * Page table entries don't use virtual addresses, which trips out
+	 * kmemleak. kmemleak_alloc_phys() might work, but physical addresses
+	 * are mixed with other fields, and I fear kmemleak won't detect that
+	 * either.
+	 *
+	 * Let's just ignore memory passed to the page-table driver for now.
+	 */
+	kmemleak_ignore(page);
+
+	return page;
+}
+
+
+/**
+ * free_pt() - Custom page table free function
+ * @cookie: Cookie passed at page table allocation time.
+ * @data: Page table to free.
+ * @size: Size of the page table. This size should be fixed,
+ * and determined at creation time based on the granule size.
+ */
+static void
+msm_iommu_pagetable_free_pt(void *cookie, void *data, size_t size)
+{
+	struct msm_iommu_pagetable *pagetable = cookie;
+
+	if (unlikely(pagetable->root_page_table == data)) {
+		free_pages((unsigned long)data, get_order(size));
+		pagetable->root_page_table = NULL;
+		return;
+	}
+
+	kmem_cache_free(get_pt_cache(&pagetable->base), data);
+}
+
 static const struct msm_mmu_funcs pagetable_funcs = {
+		.prealloc_count = msm_iommu_pagetable_prealloc_count,
+		.prealloc_allocate = msm_iommu_pagetable_prealloc_allocate,
+		.prealloc_cleanup = msm_iommu_pagetable_prealloc_cleanup,
 		.map = msm_iommu_pagetable_map,
 		.unmap = msm_iommu_pagetable_unmap,
 		.destroy = msm_iommu_pagetable_destroy,
@@ -333,6 +477,17 @@ static const struct iommu_flush_ops tlb_ops = {
 static int msm_gpu_fault_handler(struct iommu_domain *domain, struct device *dev,
 		unsigned long iova, int flags, void *arg);
 
+static size_t get_tblsz(const struct io_pgtable_cfg *cfg)
+{
+	int pg_shift, bits_per_level;
+
+	pg_shift = __ffs(cfg->pgsize_bitmap);
+	/* arm_lpae_iopte is u64: */
+	bits_per_level = pg_shift - ilog2(sizeof(u64));
+
+	return sizeof(u64) << bits_per_level;
+}
+
 struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_managed)
 {
 	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(parent->dev);
@@ -369,8 +524,34 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_m
 
 	if (!kernel_managed) {
 		ttbr0_cfg.quirks |= IO_PGTABLE_QUIRK_NO_WARN;
+
+		/*
+		 * With userspace managed VM (aka VM_BIND), we need to pre-
+		 * allocate pages ahead of time for map/unmap operations,
+		 * handing them to io-pgtable via custom alloc/free ops as
+		 * needed:
+		 */
+		ttbr0_cfg.alloc = msm_iommu_pagetable_alloc_pt;
+		ttbr0_cfg.free  = msm_iommu_pagetable_free_pt;
+
+		/*
+		 * Restrict to single page granules.  Otherwise we may run
+		 * into a situation where userspace wants to unmap/remap
+		 * only a part of a larger block mapping, which is not
+		 * possible without unmapping the entire block.  Which in
+		 * turn could cause faults if the GPU is accessing other
+		 * parts of the block mapping.
+		 *
+		 * Note that prior to commit 33729a5fc0ca ("iommu/io-pgtable-arm:
+		 * Remove split on unmap behavior)" this was handled in
+		 * io-pgtable-arm.  But this apparently does not work
+		 * correctly on SMMUv3.
+		 */
+		WARN_ON(!(ttbr0_cfg.pgsize_bitmap & PAGE_SIZE));
+		ttbr0_cfg.pgsize_bitmap = PAGE_SIZE;
 	}
 
+	pagetable->iommu_dev = ttbr1_cfg->iommu_dev;
 	pagetable->pgtbl_ops = alloc_io_pgtable_ops(ARM_64_LPAE_S1,
 		&ttbr0_cfg, pagetable);
 
@@ -414,7 +595,6 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_m
 	/* Needed later for TLB flush */
 	pagetable->parent = parent;
 	pagetable->tlb = ttbr1_cfg->tlb;
-	pagetable->iommu_dev = ttbr1_cfg->iommu_dev;
 	pagetable->pgsize_bitmap = ttbr0_cfg.pgsize_bitmap;
 	pagetable->ttbr = ttbr0_cfg.arm_lpae_s1_cfg.ttbr;
 
@@ -510,6 +690,7 @@ static void msm_iommu_destroy(struct msm_mmu *mmu)
 {
 	struct msm_iommu *iommu = to_msm_iommu(mmu);
 	iommu_domain_free(iommu->domain);
+	kmem_cache_destroy(iommu->pt_cache);
 	kfree(iommu);
 }
 
@@ -583,6 +764,14 @@ struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsig
 		return mmu;
 
 	iommu = to_msm_iommu(mmu);
+	if (adreno_smmu && adreno_smmu->cookie) {
+		const struct io_pgtable_cfg *cfg =
+			adreno_smmu->get_ttbr1_cfg(adreno_smmu->cookie);
+		size_t tblsz = get_tblsz(cfg);
+
+		iommu->pt_cache =
+			kmem_cache_create("msm-mmu-pt", tblsz, tblsz, 0, NULL);
+	}
 	iommu_set_fault_handler(iommu->domain, msm_gpu_fault_handler, iommu);
 
 	/* Enable stall on iommu fault: */
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index 04dce0faaa3a..8915662fbd4d 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -9,8 +9,16 @@
 
 #include <linux/iommu.h>
 
+struct msm_mmu_prealloc;
+struct msm_mmu;
+struct msm_gpu;
+
 struct msm_mmu_funcs {
 	void (*detach)(struct msm_mmu *mmu);
+	void (*prealloc_count)(struct msm_mmu *mmu, struct msm_mmu_prealloc *p,
+			       uint64_t iova, size_t len);
+	int (*prealloc_allocate)(struct msm_mmu *mmu, struct msm_mmu_prealloc *p);
+	void (*prealloc_cleanup)(struct msm_mmu *mmu, struct msm_mmu_prealloc *p);
 	int (*map)(struct msm_mmu *mmu, uint64_t iova, struct sg_table *sgt,
 			size_t off, size_t len, int prot);
 	int (*unmap)(struct msm_mmu *mmu, uint64_t iova, size_t len);
@@ -24,12 +32,38 @@ enum msm_mmu_type {
 	MSM_MMU_IOMMU_PAGETABLE,
 };
 
+/**
+ * struct msm_mmu_prealloc - Tracking for pre-allocated pages for MMU updates.
+ */
+struct msm_mmu_prealloc {
+	/** @count: Number of pages reserved. */
+	uint32_t count;
+	/** @ptr: Index of first unused page in @pages */
+	uint32_t ptr;
+	/**
+	 * @pages: Array of pages preallocated for MMU table updates.
+	 *
+	 * After a VM operation, there might be free pages remaining in this
+	 * array (since the amount allocated is a worst-case).  These are
+	 * returned to the pt_cache at mmu->prealloc_cleanup().
+	 */
+	void **pages;
+};
+
 struct msm_mmu {
 	const struct msm_mmu_funcs *funcs;
 	struct device *dev;
 	int (*handler)(void *arg, unsigned long iova, int flags, void *data);
 	void *arg;
 	enum msm_mmu_type type;
+
+	/**
+	 * @prealloc: pre-allocated pages for pgtable
+	 *
+	 * Set while a VM_BIND job is running, serialized under
+	 * msm_gem_vm::mmu_lock.
+	 */
+	struct msm_mmu_prealloc *prealloc;
 };
 
 static inline void msm_mmu_init(struct msm_mmu *mmu, struct device *dev,
-- 
2.50.0


