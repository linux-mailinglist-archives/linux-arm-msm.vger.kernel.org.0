Return-Path: <linux-arm-msm+bounces-57166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8AEAAE31F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 16:37:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A05A29A12FC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 14:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79E1B288C2C;
	Wed,  7 May 2025 14:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JDZqaIT/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3905288539;
	Wed,  7 May 2025 14:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746628202; cv=none; b=XxgE+K2bR3dD+PuzBWEmMpdq2gralnhg1Zom56XYiSPeq3oUgu12Kgi0YVy6wfZU9V7VB4zO8zsEq3xGbIaDxTzjP7QmubrzSoeEZ0f2VgbzVOshKWa4yR6uJNvS9Xf5bOk8BWCyMRUs0BxsdqoYHSaXyxhcGv09LuiXBJ3kujM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746628202; c=relaxed/simple;
	bh=Ysdv17ZrAFhu+Z8p5jVB7S0giJ890w/Ep7kXiVFvwEo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aFSF4tCfh+CpaQojcxLgLwOgCkRN4p2JpZ3xukpVvqmv2hJDTXAdPQTkLZ0z0ydJfQza5J6vu1m9YQ72sEr2XS7VJ54OAfDIgfQOVLwPIC6HeO/Gmhu9p+Z9LaD+VoT8J+F+SEuePfMzkvMij+22uLf16RGH4fOjPnX8utm0Su8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JDZqaIT/; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7403f3ece96so9209359b3a.0;
        Wed, 07 May 2025 07:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746628200; x=1747233000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tx2+qp5fUFaxyyKDyJusWn86x0QDSb7v4Cx5Hi7px0E=;
        b=JDZqaIT/SSggnh/bxU0VlteXn0FZDUGtMgYG11CwrJ8HqhtFNEL5UxGZIjcoyevFr2
         Yy3hSAg8cPgoB2vUo/cRfK7JdComaTIuV2vOhWb4QIPJ8MSIiUQr4V3XLqPxJTM+MOGJ
         inaVx1LewCkbIHzIutwOwsidEs/KCf1viUghQFsDhADX3Zk8qTMJIKI9yGc3KtXszR19
         aDad8umChSuHPrhb2X0E7aYGBYQw0f7jNIE7RFnDhZcQivZGVfRZ1AiP+559rc+ZmsMj
         5PCn6dTNC+30J1/JMWrDc309QkbtxAoTJthIVkdGSw9xWSnDFt7A8Tx8ukCMeDh+hNrH
         G/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746628200; x=1747233000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tx2+qp5fUFaxyyKDyJusWn86x0QDSb7v4Cx5Hi7px0E=;
        b=ustOAoCgUYf6td5s72jftYn8MkcLtt1aVmLyMIj5cjGqskfoJ0krlhr5Ls0FY5vd3S
         UDndIWRp5k02LsM2csAwYwBn1gmVahXEqUdlhcZI+PJlKOaHo0/RQZUKcoQNDlLxUr0E
         pX5BPuNVHep6M6UGoENGCOqwlwBNmNShXg9ZRQ307hq0T9q5r3OzWDcTJ28HUEq/TgK1
         CA7ryMOW6SnTSaI4fdAbm2opAvBAj2oXcfQ8UXF/uWA5CofDG5rWDAW9dOfIy/cPt+6s
         Ot+ETo/HzsTCTBc64ZLZaYPpmEdOS/lPg6IOR3Tvro6/IrD0Jcy2LdzxiMI7Lj6tD2kk
         LLCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdnsOv+n2KYOOcHhN2To7F8p9rjKMvcNKL9ChWQC8DqI23d7ulgs7XnH0JKaYjlP4eH5AwiodxMhSIIj4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAp9LHwjiRZcvBZv4m22H962625u0w6w9z/4o5M3bSaHLHBTD8
	k15ZxRJwNAz7AfzP8KI5zkaJJV4DMLpGgUZg1E1V29L8H2KhW4UX
X-Gm-Gg: ASbGncutZfGY4QMt2ZntVF+oChXaIBpvPhTTVQ1xysdSC7EbZevsCE5sacwxpyLD+55
	R6dxc1+PBjdaUTKkc7jVaYz1I19QrGl3QA3UKEg5YbH6VnBVXw/24luUG27e45WhFnyHlqSdl+O
	IOHvYuTCNaBrwr0ZRDCO+N7tkvliOOciPCFWyVnyeS+wXnu4Q8UtBWFFs7JgV1vsd3ktoqwEuwj
	5CgqC6ofqNlqPnRpf+0u8XCHA5yCDq7PKSoY1ZZKUceEyp+/wzcBONlwoUJIzmySbwCuFIG7gOa
	3ycoP4a0rBRMat1k+MvkERsD2HCTSWSJDYKnN2JDV768FDO9VoKgP4wNz8Q9p6QQHrtlSC9o+4l
	iGzJLyMeEln6Px7o=
X-Google-Smtp-Source: AGHT+IEfTnLrQfaILn2a1qg9FhcKbdkfEWk7UApwdzBZ8svWHw/KZHdECBQt/Ccuap4IqQpbIJLUkg==
X-Received: by 2002:a05:6a20:3950:b0:20b:a75e:fa32 with SMTP id adf61e73a8af0-2148d42d024mr5379907637.40.1746628199672;
        Wed, 07 May 2025 07:29:59 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fd2f96ec2sm5819027a12.13.2025.05.07.07.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:29:58 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Rob Clark <robdclark@chromium.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] iommu/io-pgtable-arm: Add quirk to quiet WARN_ON()
Date: Wed,  7 May 2025 07:29:51 -0700
Message-ID: <20250507142953.269300-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
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
---
Sending v2 stand-alone, since I'm not quite ready to send a new
iteration of the full VM_BIND series.  And with selftest_running
removed, I think this patch stands on it's own.  (And maybe there
is still time to sneak this in for v6.16, removing an iommu dep
for the VM_BIND series in v6.17?)

v2: Drop selftest_running and use IO_PGTABLE_QUIRK_NO_WARN_ON for
    the selftests

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


