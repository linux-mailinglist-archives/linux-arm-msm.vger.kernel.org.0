Return-Path: <linux-arm-msm+bounces-24362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5400919957
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 22:44:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59CFB283F35
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 20:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4AED194A5B;
	Wed, 26 Jun 2024 20:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7v7/jKe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FF51946DF;
	Wed, 26 Jun 2024 20:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719434445; cv=none; b=bbrGO8qgODyswH9ODwis2M1EnxK3NDbvVnQPhb3vG/JIFNpxNm9D8rnuRVEUAmN/9Zlb87KCVZwjVnWcSNrRgn/RVMXdJF6mfnrPMfSACrLzb/+kAPEohwcM3jDRGn4jipcRm9DYuRy8ygTIqiyKyXs/3MiVlNf779JcxESRyl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719434445; c=relaxed/simple;
	bh=7ygJSLQfDdfbrZWFxTLGncJDB5G5YXZLoE2oO7GcnVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y30xSKZjG998KZpXu+KC6Qcdkt6zaRVQcrnLOKpZwutk5wiMj6XPmvG9IQZBFmY8oqZbLXxkW2pEsPe4YpQKgUAzzY6jXWt2Ax8idsI7vZPRI9QZULuYNGd6fz+CDbqUJdyvvtN25cQEGOq3snwVPL6RzDFowGtAddaF0RDPFT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S7v7/jKe; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2c7dff0f4e4so5681474a91.2;
        Wed, 26 Jun 2024 13:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719434443; x=1720039243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1ccrWAfm2+YAWyJm8Rli1gQgctwQczx9hjWBKBs/tM=;
        b=S7v7/jKeAes0aacoVC4qVtuWG9B1IdzRqx65L7Bw+X9digIbvf0nVNwqXi0pugAl89
         7O9ey0CbRnRFhTUBivj4Jy3LHxKKv1GLzlW2QLjpB4Nviogi+G+Q/ZnH+rpJFunpVNju
         q/ODTIkeKQ10GIzjv6iylZlPblbqWJ5bQk0Pekj4ZQOspbLiUnzP8LOdhe74TifpqQp6
         /yWOzzz4K12UuyDACo9JiEiVCGWse23i02JV7vpneLerOTco+t4WV119cZlou95u129A
         gsZse4yDoql+pjsQrrwWGH3tUsVuIBIya4TDvMkmS6FdRtjkJIDR9CMuKIy1NPOaPF1T
         7Jxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719434443; x=1720039243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l1ccrWAfm2+YAWyJm8Rli1gQgctwQczx9hjWBKBs/tM=;
        b=u+UHpXoIY6xpXnAvNT2xYjif2UFKENwJx88pp/kOINle+GXmFKR5QvEgVpUK0bwtoN
         DZZPSQvsrV4ywtzUX2KUNLj/7CAl/UKCKbb3DgaqwcddXFdwEchetphz/HSEP5W/6vkc
         y/9R2tP2Ltc4qKfscl1xeqZrY8H+Y/eh6ObgybeoDYYNFVY8dc5id4vHoEcJ7T3RCRD1
         0r1mSMz9dJDKj1Vd1TlsDlchF/hWIGHI7KNBja3pKRspdheho6p3zsTjXXW9NItFVJgK
         y2tXyYIMUH8PE5ZMv0eo6DQ+sZqadiJLTzxpxPkTf4KUWBR8z3od/9L8RJPC0ZY7fCPv
         HZvA==
X-Forwarded-Encrypted: i=1; AJvYcCVFDUod8Es4mvlAT2pTd/C1rw9spchiR4Nqy9rfsgyoR42TfJwlowyp9CtEer55bh71MaxXlcDVj1rY5fOqgCyd5jvsQHxEUpZg09mn
X-Gm-Message-State: AOJu0YyUWbC7ow9HZsdBpOO9ahoxOwkC3tB/WwkYw53A/tloPHRD1bOY
	aG8LJkJbXHgaFfAiKZw/6WD+9oRdeEDBwuApzF93yJY9vsMPtpsl
X-Google-Smtp-Source: AGHT+IHFbn9Mf226mkG84HxOEUEeVxy3S7mHjti4OIr1hTcwdtgFTCvCt4mnQxIt5on4rnPcSA7KNA==
X-Received: by 2002:a17:90a:5d93:b0:2c8:50c1:52ab with SMTP id 98e67ed59e1d1-2c86127e28amr9802564a91.8.1719434443268;
        Wed, 26 Jun 2024 13:40:43 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c8e2376e6asm1482166a91.2.2024.06.26.13.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 13:40:42 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Rob Clark <robdclark@chromium.org>,
	Joerg Roedel <joro@8bytes.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Steven Price <steven.price@arm.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 1/2] iommu/io-pgtable-arm: Add way to debug pgtable walk
Date: Wed, 26 Jun 2024 13:40:26 -0700
Message-ID: <20240626204033.255813-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240626204033.255813-1-robdclark@gmail.com>
References: <20240626204033.255813-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Add an io-pgtable method to walk the pgtable returning the raw PTEs that
would be traversed for a given iova access.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/iommu/io-pgtable-arm.c | 34 +++++++++++++++++++++++++---------
 include/linux/io-pgtable.h     | 16 ++++++++++++++++
 2 files changed, 41 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 3d23b924cec1..24bbfd9a8874 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -690,8 +690,8 @@ static size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iov
 				data->start_level, ptep);
 }
 
-static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
-					 unsigned long iova)
+static int arm_lpae_pgtable_walk(struct io_pgtable_ops *ops, unsigned long iova,
+				 struct io_pgtable_walk_data *wd)
 {
 	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
 	arm_lpae_iopte pte, *ptep = data->pgd;
@@ -700,7 +700,7 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
 	do {
 		/* Valid IOPTE pointer? */
 		if (!ptep)
-			return 0;
+			return -ENOENT;
 
 		/* Grab the IOPTE we're interested in */
 		ptep += ARM_LPAE_LVL_IDX(iova, lvl, data);
@@ -708,22 +708,37 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
 
 		/* Valid entry? */
 		if (!pte)
-			return 0;
+			return -ENOENT;
 
-		/* Leaf entry? */
+		wd->ptes[wd->level++] = pte;
+
+		/* Leaf entry?  If so, we've found the translation */
 		if (iopte_leaf(pte, lvl, data->iop.fmt))
-			goto found_translation;
+			return 0;
 
 		/* Take it to the next level */
 		ptep = iopte_deref(pte, data);
 	} while (++lvl < ARM_LPAE_MAX_LEVELS);
 
 	/* Ran out of page tables to walk */
-	return 0;
+	return -ENOENT;
+}
+
+static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
+					 unsigned long iova)
+{
+	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
+	struct io_pgtable_walk_data wd = {};
+	int ret, lvl;
+
+	ret = arm_lpae_pgtable_walk(ops, iova, &wd);
+	if (ret)
+		return 0;
+
+	lvl = wd.level + data->start_level;
 
-found_translation:
 	iova &= (ARM_LPAE_BLOCK_SIZE(lvl, data) - 1);
-	return iopte_to_paddr(pte, data) | iova;
+	return iopte_to_paddr(wd.ptes[wd.level - 1], data) | iova;
 }
 
 static void arm_lpae_restrict_pgsizes(struct io_pgtable_cfg *cfg)
@@ -804,6 +819,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
 		.map_pages	= arm_lpae_map_pages,
 		.unmap_pages	= arm_lpae_unmap_pages,
 		.iova_to_phys	= arm_lpae_iova_to_phys,
+		.pgtable_walk	= arm_lpae_pgtable_walk,
 	};
 
 	return data;
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index 86cf1f7ae389..4d696724c7da 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -171,12 +171,26 @@ struct io_pgtable_cfg {
 	};
 };
 
+/**
+ * struct io_pgtable_walk_data - information from a pgtable walk
+ *
+ * @ptes:     The recorded PTE values from the walk
+ * @level:    The level of the last PTE
+ *
+ * @level also specifies the last valid index in @ptes
+ */
+struct io_pgtable_walk_data {
+	u64 ptes[4];
+	int level;
+};
+
 /**
  * struct io_pgtable_ops - Page table manipulation API for IOMMU drivers.
  *
  * @map_pages:    Map a physically contiguous range of pages of the same size.
  * @unmap_pages:  Unmap a range of virtually contiguous pages of the same size.
  * @iova_to_phys: Translate iova to physical address.
+ * @pgtable_walk: (optional) Perform a page table walk for a given iova.
  *
  * These functions map directly onto the iommu_ops member functions with
  * the same names.
@@ -190,6 +204,8 @@ struct io_pgtable_ops {
 			      struct iommu_iotlb_gather *gather);
 	phys_addr_t (*iova_to_phys)(struct io_pgtable_ops *ops,
 				    unsigned long iova);
+	int (*pgtable_walk)(struct io_pgtable_ops *ops, unsigned long iova,
+			    struct io_pgtable_walk_data *wd);
 	int (*read_and_clear_dirty)(struct io_pgtable_ops *ops,
 				    unsigned long iova, size_t size,
 				    unsigned long flags,
-- 
2.45.2


