Return-Path: <linux-arm-msm+bounces-55950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCFAA9FB18
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 22:57:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7EFC1A86E54
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 20:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6EDC210F65;
	Mon, 28 Apr 2025 20:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HsMDCAlh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D0720FAB1;
	Mon, 28 Apr 2025 20:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873799; cv=none; b=V5HqmU4eLs9vdqmDCye/o9BiVIURxB3TJevHKnXhuwrfp7wE48dxUKJAFZpl8o6FSeJpd1xRwIzCLDRD0zAj6D0/yJTLZQDQfT2QdUmS6tqCtvyKSKIEQmU1ZATZmTVD/i0pHOLkZxitTTh2+HYIJbNCNCeePm7hGT7I+/hut6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873799; c=relaxed/simple;
	bh=WfSpWbv819GCC7nVsEQ+oxTMo5aDH4FF4OdkHTDXtoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FzLI5nMtoMkRuEZPx3KeUTW086fOxAEhhoh4S/Uieid9uOQtgDlDxKx8o0pJvOruZWu0y6JWw+6GTrRuJjsoaWkhY7b6s1xwqInCH8nypTDy+SAxmSixZR7B/58D06Np2tm7YW/DkhHaxVbCAk4w2UGhArsi/J7Jp4LirsXXBLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HsMDCAlh; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7369ce5d323so4377629b3a.1;
        Mon, 28 Apr 2025 13:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745873797; x=1746478597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZWdv895QF2g5ZazrpGEqIZ+CNyMWOJKJzfuDlETcFA=;
        b=HsMDCAlhzdDB1bB1w+Smn3xf3ctAunSzMwZOGvQpC61T8slxm5I75zKX32/eUu+r/e
         WbvKnCgUihvCZi9RkydBP5ywtBUR6cV0cr94+p8buDgm+ZIbOFm9QEUYRTLcDYutNcD+
         zlbtQ0/ZCCfZsyjG+0G0MwL/DRln8X9m4F8faGgSmYbXpDeVmysagCQs6i1dVNWzv4RC
         qrhbS9gIKU9xwB7mL/pxqYIHAlE1hDi9mbRFQS6xNZ73FWrMtSb4RBCBFowsW8fE4uPC
         PR//dXZkrZ2lB7gH2dFbH6l/1dc6/KaEvyLLiPDoQaQI7iV0CpRqsJXf2JyfquczlSbv
         XZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873797; x=1746478597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ZWdv895QF2g5ZazrpGEqIZ+CNyMWOJKJzfuDlETcFA=;
        b=Qwf1/Xmu+6tRCQiSWrTSZhOrXlyLzEiDvlRVwUPWehmcmCESTf+MApSf3yGxdchIfd
         5eGmBFwdxqRnRJnTKMnoc4E8Ux0PDNRA5yJrJkWCxBFTLQUsENRaHn8Ry14nxKijLyah
         qcBddR4IFgk7kRbKPGVe7w2hpP82jo4ruhOQJjf/KhBPyjPQlbZj5XybbjuQ5YtNZVbW
         aC/yHapbWZGuXzwDkMLdORZhvH0ms7QlxYQEbX0tFVic/DA3/PjVaRcc+3Wif2yNKdm9
         Bq9xWNl7I0fvMTRUXrvTB+qRZorF1cG9TU6X+xk6i/Coo/E1jEWKV3xG9nvdbIglynL8
         0hjA==
X-Forwarded-Encrypted: i=1; AJvYcCXE6LTTBK0HK0/YNspEkyi5rZx3Q08eCE8d0XutBna6lAUNsgm0pLJENBInj3g12D7bq6iWpVgalX6An7zK@vger.kernel.org, AJvYcCXkIWw/sEK36v7sGcZKvWh2E0W98zmrHsjkwhUSoUoO6dn7s3CC1e4OYTQq5H42f2He9ZyUcnmaBQNPp6J1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8cT7+kZt7O6j0CDIV0hiXwOBFNdM5k2SMQqXmEIe8wBiRhPET
	8aab+bEVXFAOkuch7tzfOpc7BfWY6N/k//0yxYftQXzrjphL5mkm
X-Gm-Gg: ASbGncvZEWo0r9gRoO6hTj1ngy4FHOszVWK0Fx6mtZADxTE7bTzsKJYlBYA/8bWRVyC
	77LEWybKa11vsJOJ0/KXuyA5gvUrQw55j3r0xpPOylrjkPLvCfu9md0EkyPCgTcV1ijVUxT8/Vi
	TzTg1QcDw6o+NO9/UodiVw8lwwFWwHobBSZamTwdHLD5XgvvvcCtcJ1sbKWVBeCy+he3PNPQZnO
	tDSHq2MVHEcfid0LyR44DRqSKX2ic4PaDQrtgV7Dodtq4LT37Ax07Rv3131lTlJk7EeTCySvMbT
	RC31Kq1HYbRGyop1c7jTXtghiWndxhGoy8+LkTzhkDIuVPoVBESGzNNwvEJvBTde2Ke7lvBSNwC
	tfJU+NTDfLLhqA8LWSNTyYFiG3w==
X-Google-Smtp-Source: AGHT+IEiI0PIx8sG0Cs/BBXwMjUjK2HcinX0Gfd8jPjSIhMKMTJcc2LognCvLHlEUKydTsw79aws8Q==
X-Received: by 2002:a05:6a00:3927:b0:732:2923:b70f with SMTP id d2e1a72fcca58-740271689ffmr1632804b3a.11.1745873797293;
        Mon, 28 Apr 2025 13:56:37 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a9abf2sm8405360b3a.122.2025.04.28.13.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:56:36 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
	iommu@lists.linux.dev (open list:IOMMU SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 03/33] iommu/io-pgtable-arm: Add quirk to quiet WARN_ON()
Date: Mon, 28 Apr 2025 13:54:10 -0700
Message-ID: <20250428205619.227835-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428205619.227835-1-robdclark@gmail.com>
References: <20250428205619.227835-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

In situations where mapping/unmapping squence can be controlled by
userspace, attempting to map over a region that has not yet been
unmapped is an error.  But not something that should spam dmesg.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/iommu/io-pgtable-arm.c | 18 ++++++++++++------
 include/linux/io-pgtable.h     |  8 ++++++++
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index f27965caf6a1..99523505dac5 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -475,7 +475,7 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
 		cptep = iopte_deref(pte, data);
 	} else if (pte) {
 		/* We require an unmap first */
-		WARN_ON(!selftest_running);
+		WARN_ON(!selftest_running && !(cfg->quirks & IO_PGTABLE_QUIRK_NO_WARN_ON));
 		return -EEXIST;
 	}
 
@@ -649,8 +649,10 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
 	unmap_idx_start = ARM_LPAE_LVL_IDX(iova, lvl, data);
 	ptep += unmap_idx_start;
 	pte = READ_ONCE(*ptep);
-	if (WARN_ON(!pte))
-		return 0;
+	if (!pte) {
+		WARN_ON(!(data->iop.cfg.quirks & IO_PGTABLE_QUIRK_NO_WARN_ON));
+		return -ENOENT;
+	}
 
 	/* If the size matches this level, we're in the right place */
 	if (size == ARM_LPAE_BLOCK_SIZE(lvl, data)) {
@@ -660,8 +662,10 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
 		/* Find and handle non-leaf entries */
 		for (i = 0; i < num_entries; i++) {
 			pte = READ_ONCE(ptep[i]);
-			if (WARN_ON(!pte))
+			if (!pte) {
+				WARN_ON(!(data->iop.cfg.quirks & IO_PGTABLE_QUIRK_NO_WARN_ON));
 				break;
+			}
 
 			if (!iopte_leaf(pte, lvl, iop->fmt)) {
 				__arm_lpae_clear_pte(&ptep[i], &iop->cfg, 1);
@@ -976,7 +980,8 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
 	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS |
 			    IO_PGTABLE_QUIRK_ARM_TTBR1 |
 			    IO_PGTABLE_QUIRK_ARM_OUTER_WBWA |
-			    IO_PGTABLE_QUIRK_ARM_HD))
+			    IO_PGTABLE_QUIRK_ARM_HD |
+			    IO_PGTABLE_QUIRK_NO_WARN_ON))
 		return NULL;
 
 	data = arm_lpae_alloc_pgtable(cfg);
@@ -1079,7 +1084,8 @@ arm_64_lpae_alloc_pgtable_s2(struct io_pgtable_cfg *cfg, void *cookie)
 	struct arm_lpae_io_pgtable *data;
 	typeof(&cfg->arm_lpae_s2_cfg.vtcr) vtcr = &cfg->arm_lpae_s2_cfg.vtcr;
 
-	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_S2FWB))
+	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_S2FWB |
+			    IO_PGTABLE_QUIRK_NO_WARN_ON))
 		return NULL;
 
 	data = arm_lpae_alloc_pgtable(cfg);
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index bba2a51c87d2..639b8f4fb87d 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -88,6 +88,13 @@ struct io_pgtable_cfg {
 	 *
 	 * IO_PGTABLE_QUIRK_ARM_HD: Enables dirty tracking in stage 1 pagetable.
 	 * IO_PGTABLE_QUIRK_ARM_S2FWB: Use the FWB format for the MemAttrs bits
+	 *
+	 * IO_PGTABLE_QUIRK_NO_WARN_ON: Do not WARN_ON() on conflicting
+	 *	mappings, but silently return -EEXISTS.  Normally an attempt
+	 *	to map over an existing mapping would indicate some sort of
+	 *	kernel bug, which would justify the WARN_ON().  But for GPU
+	 *	drivers, this could be under control of userspace.  Which
+	 *	deserves an error return, but not to spam dmesg.
 	 */
 	#define IO_PGTABLE_QUIRK_ARM_NS			BIT(0)
 	#define IO_PGTABLE_QUIRK_NO_PERMS		BIT(1)
@@ -97,6 +104,7 @@ struct io_pgtable_cfg {
 	#define IO_PGTABLE_QUIRK_ARM_OUTER_WBWA		BIT(6)
 	#define IO_PGTABLE_QUIRK_ARM_HD			BIT(7)
 	#define IO_PGTABLE_QUIRK_ARM_S2FWB		BIT(8)
+	#define IO_PGTABLE_QUIRK_NO_WARN_ON		BIT(9)
 	unsigned long			quirks;
 	unsigned long			pgsize_bitmap;
 	unsigned int			ias;
-- 
2.49.0


