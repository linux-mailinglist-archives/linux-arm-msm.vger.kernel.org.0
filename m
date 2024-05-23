Return-Path: <linux-arm-msm+bounces-20312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3006C8CD97B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 19:52:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EBC71F21D84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 17:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD6D781AD0;
	Thu, 23 May 2024 17:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YDHPR5te"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425DB7F496;
	Thu, 23 May 2024 17:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716486754; cv=none; b=EIEKhff9DbJT0dC9i76jvWqHBTeTTM2Js4kpkz+xVYl5GXltDB2ycTmUv+4wmIaa8GXmf0rcOh1atCu+dZYtVoCVLJxxAHZPnqkq0nWcZiKMXlD20JothP4G8KhVws378sI9hKu5BZXl0gvvGQEczK3SwGTsPaeK7PCcOBSWDvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716486754; c=relaxed/simple;
	bh=kISKM7grARDjVqkmmI4mRYiokLw9iJb/8Ywk3w14sJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qzoM9szujOqii6dI8EgKjMdw7bDu/207M7TbWM17AZNoyWNrsK6g5raQNA2NtUkpqYWyR49cNWFKD5eom77vsNqTQ83HlryRfbIoykoy2+l1j6Ati90ueYvUwMrJU0S9eaHxXKBg5gLCczbWm1RUFhnumvFlVV8FsqCmURip8YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YDHPR5te; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-681a49e6e86so1903a12.3;
        Thu, 23 May 2024 10:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716486752; x=1717091552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wABXq7eXvgE4oT9T1Y9/oyMqa6vAj39hBqoQ2M3pSr8=;
        b=YDHPR5teo4G0CIrvRNmPQcXd37BWw2mSErsxY4ff4L7cYEAXuCwmbAIB6LPvmKbhFG
         4MbojTOgRYV9zB+2g/sZjEIVA17xzGrw4JoZVi6hFgZ5oFUWg+d6BQY7JraNuI6Cld/u
         wio9suJAwOMDPM5AmmHp2X4kI9F/wf8LE+c4I3+cr4mxLVU7oZD7drrybXLZ/IWoi+bs
         VOQSQSq4rCIf366lBU8j31UhTpffqvZPu7rq2vZCH9Egxcv+ZQ0/cq7Fc8X/OUcRO+7B
         p6z080R7liqeE+SLORyjtD0jwNrJPlV2X/hElJX5VHjfR+G0QZgZ5KPhAY0jRhmyA30e
         gvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716486752; x=1717091552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wABXq7eXvgE4oT9T1Y9/oyMqa6vAj39hBqoQ2M3pSr8=;
        b=UNZoBpK/bsTCcR4AJEZ1RAHKctC5m7iPCuyTn9qLbinGZ09lmeGmvAM5QIy/WgFCfS
         1nkrD0ECHFcFEDab2WtBukP+sTP8eEvLnkBVj3VqgeXMPJGN+EWOl4e5iKDHIvyjg2XR
         1/6bAFMTCnlMeM2FqfVpTY2pSdbN+3BcdwYWeP4cE3gwpkmiV1vY+cAPxBh8NL7be8+K
         HqK0NFtd4M+9/j+TKJ8lrdf6c+th+8WbN3Txiehc2FVzo8DwO9Q0wmglevYOI4PRzsa3
         75Maz5IUOzrsBJKZN3hCwiZrcJ/YFmNauy6s4ox/PLmgo+4Ew9icpKo49Q+hvn/6XlRG
         1qRg==
X-Forwarded-Encrypted: i=1; AJvYcCUGju+kfL392ZohZSQDoWwMkrx+oHPG/NVJMQ2GLbsP9iiFtsR3/G0X0V6K3N/vTRMe/Je+mU5c4Lt/5LbNSaAuDOYhyGp3lpsI4o5C
X-Gm-Message-State: AOJu0Yz5wKEFEbW87TH8vvHovkEpJQof9nEFAnVjprGI5/vTh3iLCv5h
	fyRw4BrxjG2YoNSQ0B1VB7QQnnat7CuQ3OBfpptdEWX2x0/wraF0
X-Google-Smtp-Source: AGHT+IFBPjfPlLDxDBNEdpWCZ7OpFK84HiZnku+Zm5KcsQ3+xnkFTJMGfUhkA5lhqjC+tpNwMNZFoQ==
X-Received: by 2002:a17:902:e889:b0:1f3:4b2a:1ac8 with SMTP id d9443c01a7336-1f4486bd92cmr964985ad.13.1716486752590;
        Thu, 23 May 2024 10:52:32 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f326c0cec2sm31874455ad.174.2024.05.23.10.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 10:52:31 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Will Deacon <will@kernel.org>,
	Rob Clark <robdclark@chromium.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
	iommu@lists.linux.dev (open list:IOMMU SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 1/2] iommu/io-pgtable-arm: Add way to debug pgtable walk
Date: Thu, 23 May 2024 10:52:21 -0700
Message-ID: <20240523175227.117984-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240523175227.117984-1-robdclark@gmail.com>
References: <20240523175227.117984-1-robdclark@gmail.com>
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
 drivers/iommu/io-pgtable-arm.c | 51 ++++++++++++++++++++++++++++------
 include/linux/io-pgtable.h     |  4 +++
 2 files changed, 46 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index f7828a7aad41..f47a0e64bb35 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -693,17 +693,19 @@ static size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iov
 				data->start_level, ptep);
 }
 
-static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
-					 unsigned long iova)
+static int arm_lpae_pgtable_walk(struct io_pgtable_ops *ops, unsigned long iova,
+			int (*cb)(void *cb_data, void *pte, int level),
+			void *cb_data)
 {
 	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
 	arm_lpae_iopte pte, *ptep = data->pgd;
 	int lvl = data->start_level;
+	int ret;
 
 	do {
 		/* Valid IOPTE pointer? */
 		if (!ptep)
-			return 0;
+			return -EFAULT;
 
 		/* Grab the IOPTE we're interested in */
 		ptep += ARM_LPAE_LVL_IDX(iova, lvl, data);
@@ -711,22 +713,52 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
 
 		/* Valid entry? */
 		if (!pte)
-			return 0;
+			return -EFAULT;
+
+		ret = cb(cb_data, &pte, lvl);
+		if (ret)
+			return ret;
 
-		/* Leaf entry? */
+		/* Leaf entry?  If so, we've found the translation */
 		if (iopte_leaf(pte, lvl, data->iop.fmt))
-			goto found_translation;
+			return 0;
 
 		/* Take it to the next level */
 		ptep = iopte_deref(pte, data);
 	} while (++lvl < ARM_LPAE_MAX_LEVELS);
 
 	/* Ran out of page tables to walk */
+	return -EFAULT;
+}
+
+struct iova_to_phys_walk_data {
+	arm_lpae_iopte pte;
+	int level;
+};
+
+static int iova_to_phys_walk_cb(void *cb_data, void *pte, int level)
+{
+	struct iova_to_phys_walk_data *d = cb_data;
+
+	d->pte = *(arm_lpae_iopte *)pte;
+	d->level = level;
+
 	return 0;
+}
+
+static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
+					 unsigned long iova)
+{
+	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
+	struct iova_to_phys_walk_data d;
+	int ret;
+
+	ret = arm_lpae_pgtable_walk(ops, iova, iova_to_phys_walk_cb, &d);
+	if (ret)
+		return 0;
 
-found_translation:
-	iova &= (ARM_LPAE_BLOCK_SIZE(lvl, data) - 1);
-	return iopte_to_paddr(pte, data) | iova;
+	iova &= (ARM_LPAE_BLOCK_SIZE(d.level, data) - 1);
+	return iopte_to_paddr(d.pte, data) | iova;
 }
 
 static void arm_lpae_restrict_pgsizes(struct io_pgtable_cfg *cfg)
@@ -807,6 +839,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
 		.map_pages	= arm_lpae_map_pages,
 		.unmap_pages	= arm_lpae_unmap_pages,
 		.iova_to_phys	= arm_lpae_iova_to_phys,
+		.pgtable_walk	= arm_lpae_pgtable_walk,
 	};
 
 	return data;
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index 86cf1f7ae389..261b48af068a 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -177,6 +177,7 @@ struct io_pgtable_cfg {
  * @map_pages:    Map a physically contiguous range of pages of the same size.
  * @unmap_pages:  Unmap a range of virtually contiguous pages of the same size.
  * @iova_to_phys: Translate iova to physical address.
+ * @pgtable_walk: (optional) Perform a page table walk for a given iova.
  *
  * These functions map directly onto the iommu_ops member functions with
  * the same names.
@@ -190,6 +191,9 @@ struct io_pgtable_ops {
 			      struct iommu_iotlb_gather *gather);
 	phys_addr_t (*iova_to_phys)(struct io_pgtable_ops *ops,
 				    unsigned long iova);
+	int (*pgtable_walk)(struct io_pgtable_ops *ops, unsigned long iova,
+			    int (*cb)(void *cb_data, void *pte, int level),
+			    void *cb_data);
 	int (*read_and_clear_dirty)(struct io_pgtable_ops *ops,
 				    unsigned long iova, size_t size,
 				    unsigned long flags,
-- 
2.45.1


