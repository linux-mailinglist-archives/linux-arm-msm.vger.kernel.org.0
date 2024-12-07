Return-Path: <linux-arm-msm+bounces-40877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D1D9E80F3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 17:21:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9661B16694D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 16:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B601AAA10;
	Sat,  7 Dec 2024 16:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WDVeb6mI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7161A9B47;
	Sat,  7 Dec 2024 16:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733588297; cv=none; b=Z+fK4wyUBzdCooqK3ZJD9l7hY7HzbbRbojf5yvGj2IeZk+XqoRZkqaSfw/Icb1qu6THj7GX5yH9J553xdceEjZNKKGsRWCf2pVt3P6RgvxKQ4IppIM6MB7nxyamxDHbSymdJ69SkI1zw1vc4LVyw4FeMGJ3tvttY2F15V4qwbQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733588297; c=relaxed/simple;
	bh=5YKu2Xcnqr1yTk4U0g5Eg+ZDnKHzMYrwdeuzwe9cTqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vB6MGIjz0LjZRVIBUSF+82XTYmCP1ChnGRtnN1ha7Bb4z5qrKUt1cRo0q9xzXis2VRD9QqyBPrZRuwCLDgRYvd8A4mkL3CWXluUb31tmxJi8ikgYGORG42JTe/tuS+1MJCzmrhtqyyAt+546vLjfBGa5EgXJtr0oBRzNmU4Ta+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WDVeb6mI; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-724f42c1c38so2729572b3a.1;
        Sat, 07 Dec 2024 08:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733588295; x=1734193095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIPC3wN4RB22AtTIYzOFUGMqESGQ71MfkPRGJ75Lpqo=;
        b=WDVeb6mIEq2EJmdScEp+zmG+A7tidbsB2vaihnQyQCY8RvUw5lNnrgxRqHVRNP5ywE
         ZIPuzDM6kICyJjKkQxwbV4wz/BLYQxlx/deS5XzvkrkWWS++GLtRZzuaJqMbX17R6iex
         RXymy71FlYkbmMiGqDjul1GLkXW8korvFJmVhdD2uXuGKmbvQlHLZNQVR2gLJ1FgYIzZ
         kiVkH/kXU4N5hdnfhpNsTElzJ4R78Qo1AroHUDtaGDGxxZRggWaCSX3PQGogvOb2+fXi
         ft098UcbSQtzTLDFxZVbWkX9nL9bMBgWApvXP+iTUekLqaOCtj2yxf0MgBWxFHGSOxcU
         i56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733588295; x=1734193095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fIPC3wN4RB22AtTIYzOFUGMqESGQ71MfkPRGJ75Lpqo=;
        b=lYIO+mDUl/96WoSFbsItJg0vovmE4trwNmZqCcsBrwT6mzHDqfWHs46ZSTXq5h/tok
         E26qatizG+JtGmd1Rb/tHsNlysfExtfW9tNts+YSzeSneSPdUdSk5cKak1Nm5pAoBWPu
         zuFHKDsmb8NVhJLHuFuQ3sa7GZ1Tbd4JUtSHsJNch2YdmB4DWnUzuImadoWhuopSlP3o
         uQ+jGeCws0+d/LSH+yqyVRDSZ34zU8e0UyuaM3flzj4dVIilelpKhWyd0qtEc757rRru
         5785nS4/DvujR8qgX+NeplkxrBeNgNV09LF/RFR2e2ifdq8TSJ/D22s4vfJfiYYRrBJK
         8EZg==
X-Forwarded-Encrypted: i=1; AJvYcCW+7rxkxuXoMQHNnMvsqLtmxVKexI4NC34NY784d0pA+nRp/HJnumlQZjeiKB5lX0P83b7HqJ4BhoQIIdxp@vger.kernel.org, AJvYcCWk3xTyUlVuqHASC+6wghhthghMMJziWu+bVA9JMTY74Q5qpsK4q+RCbaBOCcekWUb/gz/EOBAVxwXTWsSN@vger.kernel.org
X-Gm-Message-State: AOJu0YybeFW2TlS3wupQh7I1ynEc4lih1buvRfVRER7q1Z1ejYUveei0
	vpT/IkZgMK0+Hi309ZaBKmB9fARvcAY/tA4YkMIFfhBwMbR3JRA3
X-Gm-Gg: ASbGncsXb9n0dVu41hDDGRvCZH9XOkcqQkOU6HVZ0Mi1XOXWyqESKytx3jj8HVKOXzn
	ortihN2E1n4D59OSJeuCoFd+Yp7Zfqg8SFpvwMJUqKT1UvPw+8jE5gP/TT41aS6lrBgJfzgmBNi
	ZRcde/rHxiLaOWKLw9NgE8glJY0z8YdRmXiebW/A5oNlGpg/HOI15yifHLtvLJpbGJ7t/B+v1fL
	HR61nrqSd9aM9REbCLRcsieFSDECSzvn1Jag0jF1IUTOHjq6Thu/7YrYkk3Fj7kkHEoWCtmDkc3
	NMD8YZqk
X-Google-Smtp-Source: AGHT+IFWDLy7ds21MKUC3Cq7AuB7/7Sndz2UK9nF/2GtDakUzwnVagIsycjTJ4PrKiaKXWcXS6yeyQ==
X-Received: by 2002:a05:6a20:9185:b0:1dc:7907:6d67 with SMTP id adf61e73a8af0-1e18717aed4mr13758619637.40.1733588294811;
        Sat, 07 Dec 2024 08:18:14 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd1568eadbsm4764479a12.12.2024.12.07.08.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 08:18:14 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [RFC 21/24] drm/msm: Add PRR support
Date: Sat,  7 Dec 2024 08:15:21 -0800
Message-ID: <20241207161651.410556-22-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241207161651.410556-1-robdclark@gmail.com>
References: <20241207161651.410556-1-robdclark@gmail.com>
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
index 90848852ee50..140b4e54bc96 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -308,6 +308,13 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
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
@@ -392,6 +399,9 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
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
index 41cb629e25f3..bb65be95f7db 100644
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
@@ -314,6 +355,25 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
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
index a7e48ee1dd95..48bc0374e2ae 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -115,6 +115,8 @@ struct drm_msm_timespec {
  * ioctl will throw -EPIPE.
  */
 #define MSM_PARAM_EN_VM_BIND 0x15  /* WO, once */
+/* PRR (Partially Resident Region) is required for sparse residency: */
+#define MSM_PARAM_HAS_PRR    0x16  /* RO */
 
 /* For backwards compat.  The original support for preemption was based on
  * a single ring per priority level so # of priority levels equals the #
-- 
2.47.1


