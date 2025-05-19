Return-Path: <linux-arm-msm+bounces-58529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3940CABC6A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 20:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CFE0D7ABE4A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 18:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86CA28A3F8;
	Mon, 19 May 2025 17:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gwTpriB4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5E1289E3A;
	Mon, 19 May 2025 17:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747677500; cv=none; b=J0L8g0TuGUR8pC6Eh+nupZZmEtnp+ujBUp+xI9stlVv1HB4kMyNeVzD8Ty0oa1faGA/iVeStDOos6yJE5LWBNuZy7dUEmJmWUhkldha4A0h1J8SUHg3hSm+nXwzByJ5r6N81JtpHmHHBPbUKU7vhSJWVSdfBUOa7wbqeAPtbUqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747677500; c=relaxed/simple;
	bh=RlQo8YAghCDJm/SaXs8MaKXbZ2FsLwHEJSBVL5STJf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EUY0nwVz0wVnL9OPGXbbY6GE+PIZnQmaoklmtQn+4WXuhw98dKqTRSezcBOgRyYQ9Fcc7BfOALJDVodTo7R0ReXUKmJvsbgwgfyC8puFu8/Mgk73BrG93r2uf/wUahHOM50wdOVJgLqk3/pAI1dOwtwUXAjGRZsXdTeM+46/e3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gwTpriB4; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-232059c0b50so19328115ad.2;
        Mon, 19 May 2025 10:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747677498; x=1748282298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+D65lEByNc4LMsDIcZTWRQIukmgFnZvdvZtXU4eE4o=;
        b=gwTpriB4OOfH8+RSFRxHCozKjeE4QTgwn3tQxpJFwoHqWXXo2URQbEwaCDzHcZgVlS
         dt2yBbKdIaaQJHjWJvMxrGmfg6b7xCKtMjgsBT9KtqDiaikCE+IK3vO+zp8da9ghfQm3
         NLpdKzueXgU8h0DAyuL28QRoJZFBLnXhHB8TCyQ8T9Y8A8T3LT3xyzLskvqyYw26R+zm
         88b/8IrdWK0tOWtmYVawOVUi6mqqaTvkDl6oa0umJFLQF5xuapNmAp1wmW9hxsEApN1S
         N+tjGnr4dvP7+0679wFgDWI4PEt5OsbEsP6SfADVQwIjS+7IxhmydZrX+tEjT9UmlTbQ
         KDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747677498; x=1748282298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r+D65lEByNc4LMsDIcZTWRQIukmgFnZvdvZtXU4eE4o=;
        b=HROKYsWDZ4QK42MZuN00rR8kCggahcwFoPQITuyDJ3mEHnbPmx3/Z1siVjm1zAdAK6
         miIdgaSrv+FfD0lLmSXFa/X4dLW/+SCtkDzd374y1g3BiFeOOeCSXXejFgfzUaevsCHu
         YiWmPQX8gIsjhfvugcc8vzFZNZmeSCHImNTiiWUgcTR4BUU9ga2Ox7uik37a8LGqaI8l
         TUUqRFQyL/4i1a+cWcPY6iRpMPUT8LHGjEm2PJ0tq1i8F63SSDGSD8sUPPOmSTXBNEl7
         Z6CRujs5ydDDGRdtlEMo+CTWFU2hwVNEzmxs0FZoj+gDXpKpojug8oTpqBWQzfFhjnr+
         ourw==
X-Forwarded-Encrypted: i=1; AJvYcCV8iAV39sLwehIqz/TyzNBd2IQUS3vC4WmUFa7wea9qFBkBGpDErR9RyDHA7HeF1KNEBMDgTeGFEJJD/h6n@vger.kernel.org, AJvYcCVWcwCgZdwi+DE0fk+Y9QJZJHo5oQl1RFfuq1TCbQ9bcyPqeixfoL+YM+431Vcsmm5Q1ghEyWCSRpYtRGwg@vger.kernel.org
X-Gm-Message-State: AOJu0YwXuAPcT4AmPDIOoIWQbwfkLLCHM6wagECgPsVlbot2L5BfXI4b
	3ZxMGMyCd+xNVgYgZcKCE+u6rMvqtdQ66B0iGChIt5T+0MVm5qUEybsk
X-Gm-Gg: ASbGncu46Vk11n5h9s+QlQY6SZ2uAqDy0mYEitDBrHPmCuoLI6NibJcBY0u9qA7Sn2L
	6sRDsYsYLyPD4Bb0Oqvss3P32sfBdDNzBi/Uq8WBw7gkEQ108aHM2OXt9Al+LTof+x00yb0547V
	sXcN0N4U1okhnXTTEMviFGjoV/gR86PmMumMBvABvsKUNQCqWDmIJX8odC4egb9JpR8hdY9gZ+B
	6G3ydcEeSzibnhQbPtv7NtnvPflhx3WykwiLBKstt7QZGlHkHnsmB9r6mxPdwfSNe8RT3DlztT6
	Np6uT/AyVR3XKrIvNx5tQf6YuRWmTOHwHELpdAfeWB7rPzMDOy31KOGED6dfhfUV+MJ5nd3Cjms
	FLvV67JH1EgKiYUYfGjBzZFar+Q==
X-Google-Smtp-Source: AGHT+IFQcPSehL1xYQOTKUm0XOa2dBmJUhV+7tQ0TuiltDzL7TcBBkxmzlJzQ3pvrH4U2wsCD79HSw==
X-Received: by 2002:a17:902:ef4e:b0:225:ac99:ae08 with SMTP id d9443c01a7336-231de2e6bbfmr207857375ad.5.1747677498278;
        Mon, 19 May 2025 10:58:18 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ed5460sm62461485ad.241.2025.05.19.10.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:58:17 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 18/40] drm/msm: Add PRR support
Date: Mon, 19 May 2025 10:57:15 -0700
Message-ID: <20250519175755.13037-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519175755.13037-1-robdclark@gmail.com>
References: <20250519175348.11924-1-robdclark@gmail.com>
 <20250519175755.13037-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Add PRR (Partial Resident Region) is a bypass address which make GPU
writes go to /dev/null and reads return zero.  This is used to implement
vulkan sparse residency.

To support PRR/NULL mappings, we allocate a page to reserve a physical
address which we know will not be used as part of a GEM object, and
configure the SMMU to use this address for PRR/NULL mappings.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 ++++
 drivers/gpu/drm/msm/msm_iommu.c         | 62 ++++++++++++++++++++++++-
 include/uapi/drm/msm_drm.h              |  2 +
 3 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index f6624a246694..e24f627daf37 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -361,6 +361,13 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 	return 0;
 }
 
+static bool
+adreno_smmu_has_prr(struct msm_gpu *gpu)
+{
+	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(&gpu->pdev->dev);
+	return adreno_smmu && adreno_smmu->set_prr_addr;
+}
+
 int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		     uint32_t param, uint64_t *value, uint32_t *len)
 {
@@ -444,6 +451,9 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 	case MSM_PARAM_UCHE_TRAP_BASE:
 		*value = adreno_gpu->uche_trap_base;
 		return 0;
+	case MSM_PARAM_HAS_PRR:
+		*value = adreno_smmu_has_prr(gpu);
+		return 0;
 	default:
 		return UERR(EINVAL, drm, "%s: invalid param: %u", gpu->name, param);
 	}
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 2fd48e66bc98..756bd55ee94f 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -13,6 +13,7 @@ struct msm_iommu {
 	struct msm_mmu base;
 	struct iommu_domain *domain;
 	atomic_t pagetables;
+	struct page *prr_page;
 };
 
 #define to_msm_iommu(x) container_of(x, struct msm_iommu, base)
@@ -112,6 +113,36 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
 	return (size == 0) ? 0 : -EINVAL;
 }
 
+static int msm_iommu_pagetable_map_prr(struct msm_mmu *mmu, u64 iova, size_t len, int prot)
+{
+	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
+	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
+	struct msm_iommu *iommu = to_msm_iommu(pagetable->parent);
+	phys_addr_t phys = page_to_phys(iommu->prr_page);
+	u64 addr = iova;
+
+	while (len) {
+		size_t mapped = 0;
+		size_t size = PAGE_SIZE;
+		int ret;
+
+		ret = ops->map_pages(ops, addr, phys, size, 1, prot, GFP_KERNEL, &mapped);
+
+		/* map_pages could fail after mapping some of the pages,
+		 * so update the counters before error handling.
+		 */
+		addr += mapped;
+		len  -= mapped;
+
+		if (ret) {
+			msm_iommu_pagetable_unmap(mmu, iova, addr - iova);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
 				   struct sg_table *sgt, size_t off, size_t len,
 				   int prot)
@@ -122,6 +153,9 @@ static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
 	u64 addr = iova;
 	unsigned int i;
 
+	if (!sgt)
+		return msm_iommu_pagetable_map_prr(mmu, iova, len, prot);
+
 	for_each_sgtable_sg(sgt, sg, i) {
 		size_t size = sg->length;
 		phys_addr_t phys = sg_phys(sg);
@@ -177,9 +211,16 @@ static void msm_iommu_pagetable_destroy(struct msm_mmu *mmu)
 	 * If this is the last attached pagetable for the parent,
 	 * disable TTBR0 in the arm-smmu driver
 	 */
-	if (atomic_dec_return(&iommu->pagetables) == 0)
+	if (atomic_dec_return(&iommu->pagetables) == 0) {
 		adreno_smmu->set_ttbr0_cfg(adreno_smmu->cookie, NULL);
 
+		if (adreno_smmu->set_prr_bit) {
+			adreno_smmu->set_prr_bit(adreno_smmu->cookie, false);
+			__free_page(iommu->prr_page);
+			iommu->prr_page = NULL;
+		}
+	}
+
 	free_io_pgtable_ops(pagetable->pgtbl_ops);
 	kfree(pagetable);
 }
@@ -336,6 +377,25 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
 			kfree(pagetable);
 			return ERR_PTR(ret);
 		}
+
+		BUG_ON(iommu->prr_page);
+		if (adreno_smmu->set_prr_bit) {
+			/*
+			 * We need a zero'd page for two reasons:
+			 *
+			 * 1) Reserve a known physical address to use when
+			 *    mapping NULL / sparsely resident regions
+			 * 2) Read back zero
+			 *
+			 * It appears the hw drops writes to the PRR region
+			 * on the floor, but reads actually return whatever
+			 * is in the PRR page.
+			 */
+			iommu->prr_page = alloc_page(GFP_KERNEL | __GFP_ZERO);
+			adreno_smmu->set_prr_addr(adreno_smmu->cookie,
+						  page_to_phys(iommu->prr_page));
+			adreno_smmu->set_prr_bit(adreno_smmu->cookie, true);
+		}
 	}
 
 	/* Needed later for TLB flush */
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 2342cb90857e..5bc5e4526ccf 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -91,6 +91,8 @@ struct drm_msm_timespec {
 #define MSM_PARAM_UBWC_SWIZZLE 0x12 /* RO */
 #define MSM_PARAM_MACROTILE_MODE 0x13 /* RO */
 #define MSM_PARAM_UCHE_TRAP_BASE 0x14 /* RO */
+/* PRR (Partially Resident Region) is required for sparse residency: */
+#define MSM_PARAM_HAS_PRR    0x15  /* RO */
 
 /* For backwards compat.  The original support for preemption was based on
  * a single ring per priority level so # of priority levels equals the #
-- 
2.49.0


