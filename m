Return-Path: <linux-arm-msm+bounces-36240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFCB9B3CDD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 22:36:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A95B281048
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 21:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB7651F4296;
	Mon, 28 Oct 2024 21:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Azpr6Wgd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5361F4267;
	Mon, 28 Oct 2024 21:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730151331; cv=none; b=NF4jSQL7UQRsgo9hc9EJs+LshsSWMmQroWPz3SalbBFHwcZ7xYf8d7WYrN9C6KdU/Lktedxah59awoyulNZuEk86iU4ElGhpa1uOnbB1ZRCa0NMyqHQmuS1gHqEyH53T0tMJ5vVU60zofv/LX+9baeZGsINx/zKFrA3U4wkuPB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730151331; c=relaxed/simple;
	bh=CC5DXv1pWsSCQKxatEBjAd9fJMcRefvmUAh3/PlXxlc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PLiAmM5Oomdyft82PDnWDpWc71P3RY0rINZC5dn+BZc1AgJyHyPoA++JmSw/Tqxl3m2rflglhurXM2343+hybA+C2Byn7wkR3QNxrA0l7VMgEkV6iqKKJxXWBSIftxyiZ+PIh44gU3+NYjDaJcqQJs4VeYj5frpxyYP2oThLDLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Azpr6Wgd; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71e625b00bcso3645926b3a.3;
        Mon, 28 Oct 2024 14:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730151329; x=1730756129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5JCDOT4G1vRDgamkQTQYoEg3xqOKYS4iUoOBpBdGUM=;
        b=Azpr6WgdJDObXRIye1to2pgHHww3FLapTjmAL9scPvfBV+xK4/whv7+mvDhtnZlgLQ
         JBBJZCwStKyQ7lYTc0mvPF2JlStEwJV8bRlCyu3jVFLeJuXkU0GLeX0ciAi+6Zqb7wxC
         paA3Cyca99gsrNVGp8PjV0gwo8m9sCxsxZpGR84AYCbNgZSiWLszi0cKzgWq9kXZykty
         oRuEZZALZ/GXrXBzVSr5OTzgAnpou4acQdikQ+Bwi1y83UpiwYDpIF9F3MschQH7gGu7
         4JshKXvAJOjgXPyK5DTVEpQPArg8FIOvcVTFp0ugLf7X9gx/5QXIhu2DxZRegumnPG+9
         tEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730151329; x=1730756129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U5JCDOT4G1vRDgamkQTQYoEg3xqOKYS4iUoOBpBdGUM=;
        b=A5ImeIH9Hon8AzN+BguyMqZFR35Wk2F0zSqGeUaGrjDR3kwxSWFIfMI2hEn9MMYcPO
         SmZwQJJDqkcrzLSMApSXrI7vho7Ya2ytH5+Lzlq2c+exAy1/miKzXyUPqjlRbF4loqMu
         5uRjboscv0oXMXG43Ir+Q/JhzDmRAEBOmUOBL7gPdkATdM37FFgLcbizClksC0Wi9Jhx
         cf1xCpPq4QmpO8D1dG6A0Ds56+Nqv8SD1/FsuwYk0cWjDSGBQVq2PHsxUvNS+2MQo9Ds
         QyefP/IT5x2EMHCviM4nk7/fu92tnAc7uBPKCKLPgQ5DBXoQ7wFUfYeUAe+H0skAvsl1
         sGFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXu6bikO/IenmqvjRtEHp/9Z2T16X/2HRUDMMOjzJqVoaczerlt7F5PitPEHQoG8vHFtamgMnQD3dKj3C0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUMOLl9Cq+V3N0g8qKI3ejAXICEV0qYFfnWQ7lINuW+3PyRcSJ
	RW5AZPUA4TF2sBnwfM+avVyBwoUpkhdqO/e4Ml1KyVVCdXiL1aRP
X-Google-Smtp-Source: AGHT+IGJ/vSmxwIqBeNVXBSzAWZP5g2tROL+0Y2wcPzndUVsioqMA6yobuvrQ/JZESgfajh0W3hfHw==
X-Received: by 2002:a05:6a00:230b:b0:71e:4cff:2654 with SMTP id d2e1a72fcca58-72062f86088mr14718581b3a.6.1730151329086;
        Mon, 28 Oct 2024 14:35:29 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7205791e4dasm6207770b3a.25.2024.10.28.14.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 14:35:28 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Rob Clark <robdclark@chromium.org>,
	Joerg Roedel <joro@8bytes.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Vasant Hegde <vasant.hegde@amd.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v10 3/4] iommu/io-pgtable-arm: Add way to debug pgtable walk
Date: Mon, 28 Oct 2024 14:31:39 -0700
Message-ID: <20241028213146.238941-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241028213146.238941-1-robdclark@gmail.com>
References: <20241028213146.238941-1-robdclark@gmail.com>
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
index 88b128c77893..6739e1fa54ec 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -762,6 +762,30 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
 	return iopte_to_paddr(d.pte, data) | iova;
 }
 
+static int visit_pgtable_walk(struct io_pgtable_walk_data *walk_data, int lvl,
+			      arm_lpae_iopte *ptep, size_t size)
+{
+	struct arm_lpae_io_pgtable_walk_data *data = walk_data->data;
+	data->ptes[data->level++] = *ptep;
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
@@ -937,6 +961,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
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
2.47.0


