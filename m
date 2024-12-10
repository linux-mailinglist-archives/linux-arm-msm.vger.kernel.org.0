Return-Path: <linux-arm-msm+bounces-41346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA0A9EB71D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 17:52:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27EF618836D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 16:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B181323278C;
	Tue, 10 Dec 2024 16:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N8K4ClAD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16405230D2C;
	Tue, 10 Dec 2024 16:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733849522; cv=none; b=IQ3in179Dh+Uai4zN+EmpQ15Y/ozIaUu+/+ydJXCGMfmPJh5nmIGS3JK+zEDA9CWd0mcGqDOzr1EUq5m43In4gflMWYSRAHLNg5o4dmKgtehPFP45cQNW58rYjy1jo1SZ7GlYkbI/++KcJZmo5AZa2wVUJ0bBLTk5IyVbbPPJQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733849522; c=relaxed/simple;
	bh=/euwcJ37lmgggUB2kgCU779rDOTrO1t4pPXCh1a2HCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KEvDQp3U117DtxxhdwygJi854ZvJbafe+3B0Q4eIgkyv9lOn7d9M938CPYOZloW90ja6/PK6AqyIDHbecb1o3HpXv9HkAfOHVyr35fSBPFjMcvOD/eR2dg1xfobWnL+NTfbyl2PzDh4suz60+7lc8b4pWiyivjoN6iErylS3NGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N8K4ClAD; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7273967f2f0so1884736b3a.1;
        Tue, 10 Dec 2024 08:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733849520; x=1734454320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KlC6t8gjI6tvzSf5j3uS4n/ZcFOyWrhFgx3uHy4obYw=;
        b=N8K4ClADbY8JSZTxiLmYnrKpOaqknjfcEStQ0XPXm0lpcArX+aUMZ9Ju6Q2o5edO25
         8UCcQeCYFJUZLSHLRKzihA0oydIFOsyYYaBaa5gDK1emRrFz91KkVeQ+RAoT5tjEHrUp
         k4U8VL6wzh5KMG/WEAU8jGlptH3hqene3x4t6Bjc4Rdx89ivMxSZ+KbNraFcSOP31Vts
         LOBd0vBMytpN6o6/eERVfiFhxVT2l1hG5YDYZO/woqN7//I6ZBoI8bVMAJqMtoDxvE6P
         IPm0aASottBnRWXhDjSuAG66epTwyEixTPwbJFGFRCAfXqIKHK6d9GdBSieKcTMSlu5q
         3EnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733849520; x=1734454320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KlC6t8gjI6tvzSf5j3uS4n/ZcFOyWrhFgx3uHy4obYw=;
        b=uC1k5bKIqeRHuqa50SHryuLQSWj1U9czbYhlGl1eelf+bD1Min2z5ZD7yie7Bwkyub
         6EMHn8nPippOdQZq8ksx82Muxco6y4DHAWtDwdDJuwDA5qlsiZF8GHZNkNyju//haDK/
         20XDxyjxwKKT1RiqNl3ump/GmlV1TSO9JmJ3e4h2MyCmIavA1vsyoaTz+sgZuhxjLvnc
         HshDNYlvMAXcLZoyTafbj4Zs0eVHD731orxjXR96E7eRjZwDpPfOjzgRocHjmTCrUbwE
         XhzEDHT4gQm/bzwZLOIw+3Js3jiQXkbnrj53Q/YEs+/wB80Y6z+eS4/HuBb3URAGs4qh
         SyGA==
X-Forwarded-Encrypted: i=1; AJvYcCV5OLCTs1PmpiQbIQiCZXX9DruqzZyR6AIg5fW2ttoetbb32NwoMqR6GjCnTTRD0nbCGgyadAiMzdQLUmM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMdqnbdcsmYK8OIThkzsxn+zcCsC6lbuAdsaPU1L0t28HcBhqI
	BJ9Z/zXhvITBgDl4JJaZdCla0iE9HrxYoQ3OFyn53rAHOq09Zzkw
X-Gm-Gg: ASbGncu9OTxp+oOFsAokZMwUWOUNLnfbExEYoEivUUkcsYLtql+NvYiMDN6xsmwHGKE
	k+xW6B2nPOEPDAppGpD07dB1wgSh75m2JbEz+yJ5FmomsigPwg32btNK2UG8uGVAhpOVC3EcbhU
	HtqILvrAyzQdVaEiNlp3SQO9kHJMyKhnzayt9INmqc94fokSwKG39GbOeNtXFFtb71N/SqN/80y
	YnHyHYSHSZ7aOpZlbxj+Hy1TGCl/RiA2A3oGSbwjtjkPg+ba37JKAtqXmklTIE1kjpbfHh5O4dd
	lPrO7gaq5p7T/Nt5in6qPohXvMAvoq4=
X-Google-Smtp-Source: AGHT+IH1n6c0fXB/5rusM6KflQSKemThS3VyuHQY8wT9jvY3JVEpZqXFRbfZPqjeknRfEZ0z87Krzw==
X-Received: by 2002:a05:6a00:c89:b0:725:f376:f4ff with SMTP id d2e1a72fcca58-7273cb14556mr7832493b3a.13.1733849520359;
        Tue, 10 Dec 2024 08:52:00 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7261829be9dsm3195343b3a.89.2024.12.10.08.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 08:51:59 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Mostafa Saleh <smostafa@google.com>,
	Will Deacon <will@kernel.org>,
	Rob Clark <robdclark@chromium.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v11 3/4] iommu/io-pgtable-arm: Add way to debug pgtable walk
Date: Tue, 10 Dec 2024 08:51:21 -0800
Message-ID: <20241210165127.600817-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241210165127.600817-1-robdclark@gmail.com>
References: <20241210165127.600817-1-robdclark@gmail.com>
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
 drivers/iommu/io-pgtable-arm.c | 26 ++++++++++++++++++++++++++
 include/linux/io-pgtable.h     | 15 +++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 88b128c77893..c51c48851f9f 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -762,6 +762,31 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
 	return iopte_to_paddr(d.pte, data) | iova;
 }
 
+static int visit_pgtable_walk(struct io_pgtable_walk_data *walk_data, int lvl,
+			      arm_lpae_iopte *ptep, size_t size)
+{
+	struct arm_lpae_io_pgtable_walk_data *data = walk_data->data;
+	data->ptes[lvl] = *ptep;
+	data->level = lvl + 1;
+	return 0;
+}
+
+static int arm_lpae_pgtable_walk(struct io_pgtable_ops *ops, unsigned long iova,
+				 void *wd)
+{
+	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
+	struct io_pgtable_walk_data walk_data = {
+		.data = wd,
+		.visit = visit_pgtable_walk,
+		.addr = iova,
+		.end = iova + 1,
+	};
+
+	((struct arm_lpae_io_pgtable_walk_data *)wd)->level = 0;
+
+	return __arm_lpae_iopte_walk(data, &walk_data, data->pgd, data->start_level);
+}
+
 static int io_pgtable_visit(struct arm_lpae_io_pgtable *data,
 			    struct io_pgtable_walk_data *walk_data,
 			    arm_lpae_iopte *ptep, int lvl)
@@ -937,6 +962,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
 		.unmap_pages	= arm_lpae_unmap_pages,
 		.iova_to_phys	= arm_lpae_iova_to_phys,
 		.read_and_clear_dirty = arm_lpae_read_and_clear_dirty,
+		.pgtable_walk	= arm_lpae_pgtable_walk,
 	};
 
 	return data;
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index b1ecfc3cd5bc..d7bfbf351975 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -178,12 +178,26 @@ struct io_pgtable_cfg {
 	};
 };
 
+/**
+ * struct arm_lpae_io_pgtable_walk_data - information from a pgtable walk
+ *
+ * @ptes:     The recorded PTE values from the walk
+ * @level:    The level of the last PTE
+ *
+ * @level also specifies the last valid index in @ptes
+ */
+struct arm_lpae_io_pgtable_walk_data {
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
@@ -197,6 +211,7 @@ struct io_pgtable_ops {
 			      struct iommu_iotlb_gather *gather);
 	phys_addr_t (*iova_to_phys)(struct io_pgtable_ops *ops,
 				    unsigned long iova);
+	int (*pgtable_walk)(struct io_pgtable_ops *ops, unsigned long iova, void *wd);
 	int (*read_and_clear_dirty)(struct io_pgtable_ops *ops,
 				    unsigned long iova, size_t size,
 				    unsigned long flags,
-- 
2.47.1


