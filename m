Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A60594976F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jan 2022 02:54:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240739AbiAXByO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 23 Jan 2022 20:54:14 -0500
Received: from mga06.intel.com ([134.134.136.31]:20501 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240706AbiAXByN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 23 Jan 2022 20:54:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642989253; x=1674525253;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=84M7HeoIxv/91epM6lK+BRfbuXYxR6dGfA3sWedpn9Y=;
  b=IjnEJmGddrmmXWY369mqJBOSRqxESLp2uMP48j/xa6Y0AnYX794ebCu8
   PlzR/GiJwqCUijrWUIp+AH0cD3Ani3d27kAetAB0DMlMep2xXukFqQLkK
   cXTRjM29CiU752rn3SAw+C53UUB2WxbaWO/QyFPOkmaaUOQBG8ssv5Zw2
   +I7mOJnW8P1Y3u2oJJEThgvftzD+5s2ztZRnP2dsPHr7WljQ2Y+VS0rsu
   JVnAmtXjn5teCmOF2BXh4d7dgOamONxoNF82r/SEst+FP71SRARvy282S
   eJG+qzRe7Ozl0qjXmN3jCRsx05BBFArxyZDvMrRbo6NfHR2cJQOFcTg/3
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="306658404"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="306658404"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2022 17:54:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="627320385"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2022 17:54:12 -0800
From:   ira.weiny@intel.com
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Ira Weiny <ira.weiny@intel.com>, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH V2 1/7] drm/i915: Replace kmap() with kmap_local_page()
Date:   Sun, 23 Jan 2022 17:54:03 -0800
Message-Id: <20220124015409.807587-2-ira.weiny@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220124015409.807587-1-ira.weiny@intel.com>
References: <20220124015409.807587-1-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Ira Weiny <ira.weiny@intel.com>

kmap() is being deprecated and these usages are all local to the thread
so there is no reason kmap_local_page() can't be used.

Replace kmap() calls with kmap_local_page().

Signed-off-by: Ira Weiny <ira.weiny@intel.com>

---
Changes for V2:
	From Christoph Helwig
	Prefer the use of memcpy_*_page() where appropriate.
---
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          | 6 ++----
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 8 ++++----
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       | 4 ++--
 drivers/gpu/drm/i915/gt/shmem_utils.c              | 7 ++-----
 drivers/gpu/drm/i915/i915_gem.c                    | 8 ++++----
 drivers/gpu/drm/i915/i915_gpu_error.c              | 4 ++--
 6 files changed, 16 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index cc9fe258fba7..8d6983312cda 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -619,7 +619,7 @@ i915_gem_object_create_shmem_from_data(struct drm_i915_private *dev_priv,
 	do {
 		unsigned int len = min_t(typeof(size), size, PAGE_SIZE);
 		struct page *page;
-		void *pgdata, *vaddr;
+		void *pgdata;
 
 		err = pagecache_write_begin(file, file->f_mapping,
 					    offset, len, 0,
@@ -627,9 +627,7 @@ i915_gem_object_create_shmem_from_data(struct drm_i915_private *dev_priv,
 		if (err < 0)
 			goto fail;
 
-		vaddr = kmap(page);
-		memcpy(vaddr, data, len);
-		kunmap(page);
+		memcpy_to_page(page, 0, data, len);
 
 		err = pagecache_write_end(file, file->f_mapping,
 					  offset, len, len,
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index c6291429b00c..faf9f14e13eb 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -145,7 +145,7 @@ static int check_partial_mapping(struct drm_i915_gem_object *obj,
 	intel_gt_flush_ggtt_writes(to_gt(i915));
 
 	p = i915_gem_object_get_page(obj, offset >> PAGE_SHIFT);
-	cpu = kmap(p) + offset_in_page(offset);
+	cpu = kmap_local_page(p) + offset_in_page(offset);
 	drm_clflush_virt_range(cpu, sizeof(*cpu));
 	if (*cpu != (u32)page) {
 		pr_err("Partial view for %lu [%u] (offset=%llu, size=%u [%llu, row size %u], fence=%d, tiling=%d, stride=%d) misalignment, expected write to page (%llu + %u [0x%llx]) of 0x%x, found 0x%x\n",
@@ -163,7 +163,7 @@ static int check_partial_mapping(struct drm_i915_gem_object *obj,
 	}
 	*cpu = 0;
 	drm_clflush_virt_range(cpu, sizeof(*cpu));
-	kunmap(p);
+	kunmap_local(cpu);
 
 out:
 	__i915_vma_put(vma);
@@ -239,7 +239,7 @@ static int check_partial_mappings(struct drm_i915_gem_object *obj,
 		intel_gt_flush_ggtt_writes(to_gt(i915));
 
 		p = i915_gem_object_get_page(obj, offset >> PAGE_SHIFT);
-		cpu = kmap(p) + offset_in_page(offset);
+		cpu = kmap_local_page(p) + offset_in_page(offset);
 		drm_clflush_virt_range(cpu, sizeof(*cpu));
 		if (*cpu != (u32)page) {
 			pr_err("Partial view for %lu [%u] (offset=%llu, size=%u [%llu, row size %u], fence=%d, tiling=%d, stride=%d) misalignment, expected write to page (%llu + %u [0x%llx]) of 0x%x, found 0x%x\n",
@@ -257,7 +257,7 @@ static int check_partial_mappings(struct drm_i915_gem_object *obj,
 		}
 		*cpu = 0;
 		drm_clflush_virt_range(cpu, sizeof(*cpu));
-		kunmap(p);
+		kunmap_local(cpu);
 		if (err)
 			return err;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
index f8948de72036..743a414f86f3 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
@@ -743,7 +743,7 @@ static void swizzle_page(struct page *page)
 	char *vaddr;
 	int i;
 
-	vaddr = kmap(page);
+	vaddr = kmap_local_page(page);
 
 	for (i = 0; i < PAGE_SIZE; i += 128) {
 		memcpy(temp, &vaddr[i], 64);
@@ -751,7 +751,7 @@ static void swizzle_page(struct page *page)
 		memcpy(&vaddr[i + 64], temp, 64);
 	}
 
-	kunmap(page);
+	kunmap_local(vaddr);
 }
 
 /**
diff --git a/drivers/gpu/drm/i915/gt/shmem_utils.c b/drivers/gpu/drm/i915/gt/shmem_utils.c
index 0683b27a3890..d47f262d2f07 100644
--- a/drivers/gpu/drm/i915/gt/shmem_utils.c
+++ b/drivers/gpu/drm/i915/gt/shmem_utils.c
@@ -97,22 +97,19 @@ static int __shmem_rw(struct file *file, loff_t off,
 		unsigned int this =
 			min_t(size_t, PAGE_SIZE - offset_in_page(off), len);
 		struct page *page;
-		void *vaddr;
 
 		page = shmem_read_mapping_page_gfp(file->f_mapping, pfn,
 						   GFP_KERNEL);
 		if (IS_ERR(page))
 			return PTR_ERR(page);
 
-		vaddr = kmap(page);
 		if (write) {
-			memcpy(vaddr + offset_in_page(off), ptr, this);
+			memcpy_to_page(page, offset_in_page(off), ptr, this);
 			set_page_dirty(page);
 		} else {
-			memcpy(ptr, vaddr + offset_in_page(off), this);
+			memcpy_from_page(ptr, page, offset_in_page(off), this);
 		}
 		mark_page_accessed(page);
-		kunmap(page);
 		put_page(page);
 
 		len -= this;
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 915bf431f320..62ba61f31ad1 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -196,14 +196,14 @@ shmem_pread(struct page *page, int offset, int len, char __user *user_data,
 	char *vaddr;
 	int ret;
 
-	vaddr = kmap(page);
+	vaddr = kmap_local_page(page);
 
 	if (needs_clflush)
 		drm_clflush_virt_range(vaddr + offset, len);
 
 	ret = __copy_to_user(user_data, vaddr + offset, len);
 
-	kunmap(page);
+	kunmap_local(vaddr);
 
 	return ret ? -EFAULT : 0;
 }
@@ -618,7 +618,7 @@ shmem_pwrite(struct page *page, int offset, int len, char __user *user_data,
 	char *vaddr;
 	int ret;
 
-	vaddr = kmap(page);
+	vaddr = kmap_local_page(page);
 
 	if (needs_clflush_before)
 		drm_clflush_virt_range(vaddr + offset, len);
@@ -627,7 +627,7 @@ shmem_pwrite(struct page *page, int offset, int len, char __user *user_data,
 	if (!ret && needs_clflush_after)
 		drm_clflush_virt_range(vaddr + offset, len);
 
-	kunmap(page);
+	kunmap_local(vaddr);
 
 	return ret ? -EFAULT : 0;
 }
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 5ae812d60abe..e83821914703 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1093,9 +1093,9 @@ i915_vma_coredump_create(const struct intel_gt *gt,
 
 			drm_clflush_pages(&page, 1);
 
-			s = kmap(page);
+			s = kmap_local_page(page);
 			ret = compress_page(compress, s, dst, false);
-			kunmap(page);
+			kunmap_local(s);
 
 			drm_clflush_pages(&page, 1);
 
-- 
2.31.1

