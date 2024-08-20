Return-Path: <linux-arm-msm+bounces-29134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D71958D01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 19:17:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A31BB225E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 17:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20FCE1C0DF8;
	Tue, 20 Aug 2024 17:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PB+qoEYr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9985D18C92C;
	Tue, 20 Aug 2024 17:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724174232; cv=none; b=MqmpwaGQK5DCq9P7H7m96xJIXQTDrbFyAy1AcmMpzDBMz+OSsqjudcPL6O6cwUAywbeiNOEQAg5/K2ossIN866U+RMnVin1VjDNedHqc4UzuLaEI1jxXG2G2SQKRWtd5vsV+KBnfbp37ZJb3Z6XsWc4IsFNArnhMvvYpoOsnyEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724174232; c=relaxed/simple;
	bh=gsNmqsqpWlkSnSqqXuWBaAR43/2v0PTTdbTVqGv4gw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BnlgzJLW1qvIKpRA7qVqZ8DksHbvHPHzodBIu6fYi+k1mqN8YMtS+VY/A+fI4csSGL75YDwsy3OYRKHKV0EsXWaFjyM+blwFoSiN2D//jW4EmoqhQ/uIUnxe1BSt9tCVHwbKepNj1jjImLdm8nK98BnJlPKr/P6MbZCk68IDea4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PB+qoEYr; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-70d1c655141so3748036b3a.1;
        Tue, 20 Aug 2024 10:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724174230; x=1724779030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3n/7p2U9ieS4fxPWTOeYgrS5HGZLrK9VdS3pHhqiNE0=;
        b=PB+qoEYr8O0GUEvZecLg/iDN7lXw7mdEQZKe1tn0OuDOK3zniP/fBpimYqq+TAlmnn
         rhuSZKyvI2kidx8GuIrePxOyUCKYAe5nk/7aSahs0cLv68DqSZMBYEMZ5lftLbZQOmc6
         ykns5yHBwVIEBUsz8LP+2Ft7NiW5cKa+FlZWlF+eZfG2ceTf9tQkNcOXfRqatAOoInjh
         HwzLebZem9QB1tb8BL3j5BOvFoTe1lfn3+UG6iJbVTIWuKtm2ePnOp+FOp/Qh8Kfhim8
         pwo/wATcKPdFbzfBIpOJ1YQM8ubdzL/KMS1yShXFJrBGpJ0whxQGkmWu3Nf/kpHFTSl+
         dmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724174230; x=1724779030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3n/7p2U9ieS4fxPWTOeYgrS5HGZLrK9VdS3pHhqiNE0=;
        b=tc9hAAx2Jj0v8dlAvNRfq21nSFsBbvg9+4WZGu+b8nAl+fxndDpR87AcCoXb8sf2/o
         PIw9QRZuxa0x1t+nC75iXWqwJkBR4bnkOGv0P0Ev4mV6INBCuv/wuWCnzm3gXoNVpD9y
         RxHzyvPnmViSVoZ1KpX03Cghv8xynypac/o2R0P0d3AHrNsFfi8fggSxtHOdEaRpctIY
         RJ+D9B+M2ivyH9Psy+xky50iib9w4EONFeXbD22c2J14RX2uLCe+O23cOLdUt2eI09j3
         VXY4GTQSZf58PoOTyBRf/Kamv/8KtN06xWb7JwYrrorTX1IYtOgO3BsZN0oZuXlgAfbc
         jcLg==
X-Forwarded-Encrypted: i=1; AJvYcCWEiD+c8ixQB+t2kPizIPi4xB3vsGc21fpzWjcejHWRafVIBzv20npu9+/UMRYeS/MPzGdvCMH61td2OJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6N777ppdgtbz/PZmbw4+/BwU5NDMwbyp8ckMuNRS9W14rPwqh
	HN66FMt4cqXc29wjtk5bBRH8+7Da/wfNbDWz0mHEyPMdLs4IiL20
X-Google-Smtp-Source: AGHT+IGN8V4SYWFCRpzsemtnMPx/Ae6udueJVGLrFDaSeEfYPszwWWE/tbOvS5tDdOuR5xJpXoGzfQ==
X-Received: by 2002:a05:6a20:6f87:b0:1c4:dfa7:d3ce with SMTP id adf61e73a8af0-1cad7f954b6mr103988637.17.1724174229744;
        Tue, 20 Aug 2024 10:17:09 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:bd02:d0ce:e791:dc08:a375])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f0379031sm80590295ad.159.2024.08.20.10.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 10:17:09 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Mostafa Saleh <smostafa@google.com>,
	Will Deacon <will@kernel.org>,
	Rob Clark <robdclark@chromium.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 1/4] iommu/io-pgtable-arm: Make pgtable walker more generic
Date: Tue, 20 Aug 2024 10:16:44 -0700
Message-ID: <20240820171652.145673-2-robdclark@gmail.com>
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

We can re-use this basic pgtable walk logic in a few places.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/iommu/io-pgtable-arm.c | 59 +++++++++++++++++++++-------------
 1 file changed, 36 insertions(+), 23 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index f5d9fd1f45bf..b4bc358740e0 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -747,33 +747,31 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
 }
 
 struct io_pgtable_walk_data {
-	struct iommu_dirty_bitmap	*dirty;
+	void				*data;
+	int (*visit)(struct io_pgtable_walk_data *walk_data, int lvl,
+		     arm_lpae_iopte pte, size_t size);
 	unsigned long			flags;
 	u64				addr;
 	const u64			end;
 };
 
-static int __arm_lpae_iopte_walk_dirty(struct arm_lpae_io_pgtable *data,
-				       struct io_pgtable_walk_data *walk_data,
-				       arm_lpae_iopte *ptep,
-				       int lvl);
+static int __arm_lpae_iopte_walk(struct arm_lpae_io_pgtable *data,
+				 struct io_pgtable_walk_data *walk_data,
+				 arm_lpae_iopte *ptep,
+				 int lvl);
 
-static int io_pgtable_visit_dirty(struct arm_lpae_io_pgtable *data,
-				  struct io_pgtable_walk_data *walk_data,
-				  arm_lpae_iopte *ptep, int lvl)
+static int io_pgtable_visit(struct arm_lpae_io_pgtable *data,
+			    struct io_pgtable_walk_data *walk_data,
+			    arm_lpae_iopte *ptep, int lvl)
 {
 	struct io_pgtable *iop = &data->iop;
 	arm_lpae_iopte pte = READ_ONCE(*ptep);
 
 	if (iopte_leaf(pte, lvl, iop->fmt)) {
 		size_t size = ARM_LPAE_BLOCK_SIZE(lvl, data);
-
-		if (iopte_writeable_dirty(pte)) {
-			iommu_dirty_bitmap_record(walk_data->dirty,
-						  walk_data->addr, size);
-			if (!(walk_data->flags & IOMMU_DIRTY_NO_CLEAR))
-				iopte_set_writeable_clean(ptep);
-		}
+		int ret = walk_data->visit(walk_data, lvl, pte, size);
+		if (ret)
+			return ret;
 		walk_data->addr += size;
 		return 0;
 	}
@@ -782,13 +780,13 @@ static int io_pgtable_visit_dirty(struct arm_lpae_io_pgtable *data,
 		return -EINVAL;
 
 	ptep = iopte_deref(pte, data);
-	return __arm_lpae_iopte_walk_dirty(data, walk_data, ptep, lvl + 1);
+	return __arm_lpae_iopte_walk(data, walk_data, ptep, lvl + 1);
 }
 
-static int __arm_lpae_iopte_walk_dirty(struct arm_lpae_io_pgtable *data,
-				       struct io_pgtable_walk_data *walk_data,
-				       arm_lpae_iopte *ptep,
-				       int lvl)
+static int __arm_lpae_iopte_walk(struct arm_lpae_io_pgtable *data,
+				 struct io_pgtable_walk_data *walk_data,
+				 arm_lpae_iopte *ptep,
+				 int lvl)
 {
 	u32 idx;
 	int max_entries, ret;
@@ -803,7 +801,7 @@ static int __arm_lpae_iopte_walk_dirty(struct arm_lpae_io_pgtable *data,
 
 	for (idx = ARM_LPAE_LVL_IDX(walk_data->addr, lvl, data);
 	     (idx < max_entries) && (walk_data->addr < walk_data->end); ++idx) {
-		ret = io_pgtable_visit_dirty(data, walk_data, ptep + idx, lvl);
+		ret = io_pgtable_visit(data, walk_data, ptep + idx, lvl);
 		if (ret)
 			return ret;
 	}
@@ -811,6 +809,20 @@ static int __arm_lpae_iopte_walk_dirty(struct arm_lpae_io_pgtable *data,
 	return 0;
 }
 
+static int visit_dirty(struct io_pgtable_walk_data *walk_data, int lvl,
+		       arm_lpae_iopte pte, size_t size)
+{
+	struct iommu_dirty_bitmap *dirty = walk_data->data;
+
+	if (iopte_writeable_dirty(pte)) {
+		iommu_dirty_bitmap_record(dirty, walk_data->addr, size);
+		if (!(walk_data->flags & IOMMU_DIRTY_NO_CLEAR))
+			iopte_set_writeable_clean(&pte);
+	}
+
+	return 0;
+}
+
 static int arm_lpae_read_and_clear_dirty(struct io_pgtable_ops *ops,
 					 unsigned long iova, size_t size,
 					 unsigned long flags,
@@ -819,7 +831,8 @@ static int arm_lpae_read_and_clear_dirty(struct io_pgtable_ops *ops,
 	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
 	struct io_pgtable_cfg *cfg = &data->iop.cfg;
 	struct io_pgtable_walk_data walk_data = {
-		.dirty = dirty,
+		.data = dirty,
+		.visit = visit_dirty,
 		.flags = flags,
 		.addr = iova,
 		.end = iova + size,
@@ -834,7 +847,7 @@ static int arm_lpae_read_and_clear_dirty(struct io_pgtable_ops *ops,
 	if (data->iop.fmt != ARM_64_LPAE_S1)
 		return -EINVAL;
 
-	return __arm_lpae_iopte_walk_dirty(data, &walk_data, ptep, lvl);
+	return __arm_lpae_iopte_walk(data, &walk_data, ptep, lvl);
 }
 
 static void arm_lpae_restrict_pgsizes(struct io_pgtable_cfg *cfg)
-- 
2.46.0


