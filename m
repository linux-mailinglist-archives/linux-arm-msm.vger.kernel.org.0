Return-Path: <linux-arm-msm+bounces-29136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F390958D06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 19:18:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F22BCB234CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 17:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24D031C4632;
	Tue, 20 Aug 2024 17:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtQOrm8V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965D61C5789;
	Tue, 20 Aug 2024 17:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724174238; cv=none; b=GzTcRGDQAss06E4NiQFIrjMxd3OskuEC6XbMbBtqKtYvAtogqXAUH/RllqhbuXE1bLArBzEGY0p4L9U2/3cSUBhLQemVfdwXrk9896l3of2pNbKbh4fkiIqeWTVC49sUnw8iMTrZkebXcHeCON9CZCJn0PsUyc9JCcZafOrQnzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724174238; c=relaxed/simple;
	bh=+gseIl1zsUZZaTdCls9oXHT0YEdPWdsZsVsrwqAiYiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pK5Xt6wCYvtHZPvuCqAktNMb+iY0A8chZqrruISQ2yo3HCXuQQ8SUO7+HQ6R2ap3HxATaU4p5jTUvRopsGPTUdT0Nq0Levr7D15Fh/zWWqh+4xEWOwVqg5dMyILsJ7Dp+ms6Ves6Bv0UryLPUfASDK1mWM/YVbwfVO2Rw3NHN0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QtQOrm8V; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-202318c4f45so28803605ad.0;
        Tue, 20 Aug 2024 10:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724174236; x=1724779036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4fyhtVpDgygfT5fUkGsgqPbatgiu5TzPiPLAt109+iE=;
        b=QtQOrm8VTeHW76vs/DfNu/8L2ybLQ4XEoyjVFNAb1ci4SUBn4CyDAvaq0jAkWJhGnQ
         wG2iDR2g/WnbE2SIVpmc+ZEQZW97SQGvjrauisdSYj80A8UVxlWR3RgxR72dbtBN0L/J
         SzoMvgGoUFD4P8+zLTbcbEIrNCrn0hEaypIzWVHQX0yHCajkUouXhpIdxDeZpi4zEAVv
         kJXblAc2WO6C1cobb2dJuJQ68QC8ncZr69DyBXbZbEwtAVxNsH0/TMq5IVeLDP9UvVKC
         TPJp9bKLw6ycGC4ddEL3AGqzjr8gzcYKL+KB0l43jI0OG9g15/IK7HgdaXJJzUsmMyo4
         K5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724174236; x=1724779036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4fyhtVpDgygfT5fUkGsgqPbatgiu5TzPiPLAt109+iE=;
        b=XbTdt+4V3dlkg1uL77tx8eQs2dTkxosbRnKgxanq1xRmqegpPRGRCLMpgGDhFOflPN
         tNsC5ZujWtRFOxBW39HUlcTrNVQZPF4HLjOpiSeAnestRaZSRSHHhXlzoC0jGwMKrybY
         +kvrlGstEcTQIk4ztkfwFe4rTrA0QHvfFUaa9K81wuLiORoncvyKw5cmxDDPEUedwc2N
         4+5qlG6rF+2TAlaYGiVoZTHuJXoQ4Ia8kHWX9+bRjvaRflK+OCr80BUiU1gFzyd0/zOF
         Fx6rFX6lVFsSyWcaozETgz/CIRmyxr8G1/JJC3YcJiPNYC34/NionuQ+OtSOk/AGg/ua
         /e9w==
X-Forwarded-Encrypted: i=1; AJvYcCUjMbuV/ozv1iW5lz1WD+mUSu+awcihfFmw4EYAq7TzJpM3cwd8sXAayI/taAZwvYi0PgkHzmcG79P1f5o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhxn0dc1D+9arGQEloPs2pIg9HgVuTvPqV08SogVd9ehUdbzUn
	yWh3e1PEeXCYfmE/hxZTO8VOPT1hqqjUo91xv/SYKYiZC68neKmm
X-Google-Smtp-Source: AGHT+IG89nPNiTxJdoeWAd4I9+Nt1kCBeEpf+Ehrfj9fghEkvWbqdwi+s8kDEywa2ecTlYbOssqipA==
X-Received: by 2002:a17:902:e549:b0:202:671:e5bd with SMTP id d9443c01a7336-2020671f9b0mr167387315ad.42.1724174235653;
        Tue, 20 Aug 2024 10:17:15 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:bd02:d0ce:e791:dc08:a375])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f038b303sm80401575ad.192.2024.08.20.10.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 10:17:15 -0700 (PDT)
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
	Kevin Tian <kevin.tian@intel.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 3/4] iommu/io-pgtable-arm: Add way to debug pgtable walk
Date: Tue, 20 Aug 2024 10:16:46 -0700
Message-ID: <20240820171652.145673-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240820171652.145673-1-robdclark@gmail.com>
References: <20240820171652.145673-1-robdclark@gmail.com>
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
 drivers/iommu/io-pgtable-arm.c | 25 +++++++++++++++++++++++++
 include/linux/io-pgtable.h     | 15 +++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 5fa1274a665a..a666ee03de47 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -759,6 +759,30 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
 	return iopte_to_paddr(d.pte, data) | iova;
 }
 
+static int visit_pgtable_walk(struct io_pgtable_walk_data *walk_data, int lvl,
+			      arm_lpae_iopte pte, size_t size)
+{
+	struct arm_lpae_io_pgtable_walk_data *data = walk_data->data;
+	data->ptes[data->level++] = pte;
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
@@ -928,6 +952,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
 		.unmap_pages	= arm_lpae_unmap_pages,
 		.iova_to_phys	= arm_lpae_iova_to_phys,
 		.read_and_clear_dirty = arm_lpae_read_and_clear_dirty,
+		.pgtable_walk	= arm_lpae_pgtable_walk,
 	};
 
 	return data;
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index f9a81761bfce..76eabd890e6a 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -174,12 +174,26 @@ struct io_pgtable_cfg {
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
@@ -193,6 +207,7 @@ struct io_pgtable_ops {
 			      struct iommu_iotlb_gather *gather);
 	phys_addr_t (*iova_to_phys)(struct io_pgtable_ops *ops,
 				    unsigned long iova);
+	int (*pgtable_walk)(struct io_pgtable_ops *ops, unsigned long iova, void *wd);
 	int (*read_and_clear_dirty)(struct io_pgtable_ops *ops,
 				    unsigned long iova, size_t size,
 				    unsigned long flags,
-- 
2.46.0


