Return-Path: <linux-arm-msm+bounces-58516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F24DCABC675
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 19:58:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72DBB7A2CA8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 17:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D9DE289E2D;
	Mon, 19 May 2025 17:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dxPsv+0K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B4A28982C;
	Mon, 19 May 2025 17:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747677268; cv=none; b=k1AW0BvLqCv6ZJFCGCgmkFVWYlwuHxISVydAUr7zhXyjAM+ffxzPqP97VsvHNHUElw/BYqEodvDAgnXWqOXqSCwGfwiTuIukzhSYH6Q2ovj2mw+SOSV8BcE0pwGdAMhe6ntosT5jxcHt4xy/Yl6C4sRW7IUgYItoLeKCxAx+CY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747677268; c=relaxed/simple;
	bh=/jfmZZExg+Wzp+4EZ6rojxHF6RgLrIAptiF8m9AlQpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KK6At6OEMeW6cStsUyPuVFS83i5GW4heK+obxRU27boSt54LNAmTJwGWeUVwtKFtdd4zpPwoZs0arLJFQTbrHBxFVYHdmknZwx542DcG8cbH22FTHol8sSxubjkhPso/sRvFgyZf3oCzN+h7gcQbwoKbQM+nRMgM/33bO/Mf3UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dxPsv+0K; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2321c38a948so19505165ad.2;
        Mon, 19 May 2025 10:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747677265; x=1748282065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXQcDRAe4EWVXNL5yTAKMixST4qgC4DZfdrTRe+HbCQ=;
        b=dxPsv+0Kjdz4woZEllfEaA4PU+mJQXUr1UMGceGRVwLKEKlpEKAKabFzJmxJ9DLmYz
         RNYb/zqvqOd9Srh1JuJvlOciBcDm3X6nrXfnksmIyb6kLmrLc8vv+pAdCWCXR4oxCEDO
         +lOQBiANVV50paN5NLc0AXR1yTFk+v2cSdxm1ok+FIqWBKMduEc7u1/Bl33fE0L2d/m7
         G/o/7aeegQfb5k0SiRte6SR+h2Ts7yAXpClveZHZsZ8pLO8D4VNsIDz5isQLsTyhyYse
         OCrNnRIm6R82McujNIpArc5O+3Uk3JlkmRpGcmQgeZ6XS0w0Mizptx2Xn3TF/uSHkOit
         h+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747677265; x=1748282065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kXQcDRAe4EWVXNL5yTAKMixST4qgC4DZfdrTRe+HbCQ=;
        b=b7Ii4WOFRqdmoHIOCUMPeb42COpIIRmMAYeycZsysoYlCDTEkkNPvqzqB+7DtQ7WDK
         8jb7E5mEGXtIRxozTbO9eVVJnKUuccxLmMybevCONgvpMmMqoZusodOlewSSxxyodicv
         93vkVfuQMdU3EUuxYtI0/AGlGCb9JSqZoO7/0D7zuevuxeQw5aq4Z33RsJ0Q7W4UfeRO
         TxVhTBje49VtDxsrJ/NQPVQ3cBE0itPt2GuhNsgoT7DmSLoC6TCYNWIazKQbIspCVJjd
         GN8y91DT5tp6LPvMGeYnEcgRKfTMca1SqWC3JMNG1GimQYOUn3TSYjc4MnZc2vqWfmN+
         2Fdg==
X-Forwarded-Encrypted: i=1; AJvYcCUtdziE8XAa/rZ6e2/lEkQAteOkhXZEwnmxFIDjhsCK699FOWyNX7EicTwVWtUl9CvzvEoP3X6x3oPV9J4a@vger.kernel.org, AJvYcCWHTLWrCoz+hTy92Yv+Ylfgwj5ntMvGN7I+fSEy6aWj+1ljx+XsdxHzeNZxhB8d273XrVio7fzcYFq4llNF@vger.kernel.org
X-Gm-Message-State: AOJu0Yysh/aSt/YAN2jf0R6RgCjCzg1Yw3XlfCUxMPHbP7hLmlkkMzOO
	aWPxD/wC8mL7vWEqg8VR0lq1Ohcr2lP5w7d/QdoSwGPs6kjhWAmf91bU
X-Gm-Gg: ASbGncsDYXhns+QVmQhk6dazRHQxfpi5Nypnu6pZoiYGNtKYO4/K2Pe4YI/q3XAe440
	03ppAh7fDQu56IZprvO3snKU5YtLVLttwZRqm6HRwUO4UECm2+Uj3Qz5AFP1NZoSn9HCwGiSTyK
	sKaXuRTK5d7SIEK8GokBzgUGDApcM006qCuOB3WIgiJz3u2O7VaM2V5tCF2iAGD7FgrQ4YBtWwq
	5gvVuXfHULC+kRllu0RWyU1GR6WQl+miqXCpv2iBI0n0MtPd2OvzoJLkdeNvDSBe5OjdlPbU9Iz
	5F5Xup2lc2xOgPYC18QDiyVr48IkSyhHHOVIVoFt8FQwaQLoaki3rhS9EEypGISYV3xkvpDt9S4
	FfpnY+Mhk0wMM7We0/2UWieTPFQ==
X-Google-Smtp-Source: AGHT+IH9o+jDU8SCOf6p2dYQ3xG9pg+wpXFHI4AQ16YbWVrsnqHFvIYpaqIH85X0Xd/j1VubslNPjQ==
X-Received: by 2002:a17:902:ea12:b0:231:c6d0:f784 with SMTP id d9443c01a7336-231de37623amr210055535ad.28.1747677264644;
        Mon, 19 May 2025 10:54:24 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9605csm62543565ad.123.2025.05.19.10.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:54:24 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
	iommu@lists.linux.dev (open list:IOMMU SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 05/40] iommu/io-pgtable-arm: Add quirk to quiet WARN_ON()
Date: Mon, 19 May 2025 10:51:28 -0700
Message-ID: <20250519175348.11924-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519175348.11924-1-robdclark@gmail.com>
References: <20250519175348.11924-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

In situations where mapping/unmapping sequence can be controlled by
userspace, attempting to map over a region that has not yet been
unmapped is an error.  But not something that should spam dmesg.

Now that there is a quirk, we can also drop the selftest_running
flag, and use the quirk instead for selftests.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Acked-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/iommu/io-pgtable-arm.c | 27 ++++++++++++++-------------
 include/linux/io-pgtable.h     |  8 ++++++++
 2 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index f27965caf6a1..a535d88f8943 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -253,8 +253,6 @@ static inline bool arm_lpae_concat_mandatory(struct io_pgtable_cfg *cfg,
 	       (data->start_level == 1) && (oas == 40);
 }
 
-static bool selftest_running = false;
-
 static dma_addr_t __arm_lpae_dma_addr(void *pages)
 {
 	return (dma_addr_t)virt_to_phys(pages);
@@ -373,7 +371,7 @@ static int arm_lpae_init_pte(struct arm_lpae_io_pgtable *data,
 	for (i = 0; i < num_entries; i++)
 		if (iopte_leaf(ptep[i], lvl, data->iop.fmt)) {
 			/* We require an unmap first */
-			WARN_ON(!selftest_running);
+			WARN_ON(!(data->iop.cfg.quirks & IO_PGTABLE_QUIRK_NO_WARN_ON));
 			return -EEXIST;
 		} else if (iopte_type(ptep[i]) == ARM_LPAE_PTE_TYPE_TABLE) {
 			/*
@@ -475,7 +473,7 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
 		cptep = iopte_deref(pte, data);
 	} else if (pte) {
 		/* We require an unmap first */
-		WARN_ON(!selftest_running);
+		WARN_ON(!(cfg->quirks & IO_PGTABLE_QUIRK_NO_WARN_ON));
 		return -EEXIST;
 	}
 
@@ -649,8 +647,10 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
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
@@ -660,8 +660,10 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
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
@@ -976,7 +978,8 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
 	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS |
 			    IO_PGTABLE_QUIRK_ARM_TTBR1 |
 			    IO_PGTABLE_QUIRK_ARM_OUTER_WBWA |
-			    IO_PGTABLE_QUIRK_ARM_HD))
+			    IO_PGTABLE_QUIRK_ARM_HD |
+			    IO_PGTABLE_QUIRK_NO_WARN_ON))
 		return NULL;
 
 	data = arm_lpae_alloc_pgtable(cfg);
@@ -1079,7 +1082,8 @@ arm_64_lpae_alloc_pgtable_s2(struct io_pgtable_cfg *cfg, void *cookie)
 	struct arm_lpae_io_pgtable *data;
 	typeof(&cfg->arm_lpae_s2_cfg.vtcr) vtcr = &cfg->arm_lpae_s2_cfg.vtcr;
 
-	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_S2FWB))
+	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_S2FWB |
+			    IO_PGTABLE_QUIRK_NO_WARN_ON))
 		return NULL;
 
 	data = arm_lpae_alloc_pgtable(cfg);
@@ -1320,7 +1324,6 @@ static void __init arm_lpae_dump_ops(struct io_pgtable_ops *ops)
 #define __FAIL(ops, i)	({						\
 		WARN(1, "selftest: test failed for fmt idx %d\n", (i));	\
 		arm_lpae_dump_ops(ops);					\
-		selftest_running = false;				\
 		-EFAULT;						\
 })
 
@@ -1336,8 +1339,6 @@ static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
 	size_t size, mapped;
 	struct io_pgtable_ops *ops;
 
-	selftest_running = true;
-
 	for (i = 0; i < ARRAY_SIZE(fmts); ++i) {
 		cfg_cookie = cfg;
 		ops = alloc_io_pgtable_ops(fmts[i], cfg, cfg);
@@ -1426,7 +1427,6 @@ static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
 		free_io_pgtable_ops(ops);
 	}
 
-	selftest_running = false;
 	return 0;
 }
 
@@ -1448,6 +1448,7 @@ static int __init arm_lpae_do_selftests(void)
 		.tlb = &dummy_tlb_ops,
 		.coherent_walk = true,
 		.iommu_dev = &dev,
+		.quirks = IO_PGTABLE_QUIRK_NO_WARN_ON,
 	};
 
 	/* __arm_lpae_alloc_pages() merely needs dev_to_node() to work */
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


