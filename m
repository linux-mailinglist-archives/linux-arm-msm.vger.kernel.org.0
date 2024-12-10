Return-Path: <linux-arm-msm+bounces-41344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E50A99EB715
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 17:52:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0066165D7F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 16:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC8DF2327A7;
	Tue, 10 Dec 2024 16:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BKnlBPMO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD59230D30;
	Tue, 10 Dec 2024 16:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733849508; cv=none; b=QPCelLWeEW9a7xGrCwWoyqRGJ1EgRPiT4K6uvFYByQiTlxnbWZtxslBpVJDM40TF2GsKvGO/6K5XfXLi8qlgLwb4oVeOmQ3nu/+3JHOZJE8Ium7FJDMOOUcvFDK+0b9FUwhPbo2WPLEPuzugIbBKsvY9CTNlbBfYNnNlZ07wRZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733849508; c=relaxed/simple;
	bh=HQjazjHoVqCC77TI+HmmJVcQ/ST4rzg2hFCio5lxu0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BdQQT9NisFERcUtG2uYyqew1d32W3UYpHfIfG78ZPfL0s2mpV7uG7xsPfAO74YeQR64LNYSTIA2eFxSaLlakRUnsfb5xo2IlqTbTog3z2AvgWNEMgjOWZ6nSB25cqrKNwEkK+IdbOndQhYAyl3ovvE9ubCqRqRKKvf9C2vc7KG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BKnlBPMO; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2166651f752so18714625ad.3;
        Tue, 10 Dec 2024 08:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733849506; x=1734454306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qXOH6pZZi9eL22B8MhhX9UUu8EkOGTpVPSjjBt9TTq4=;
        b=BKnlBPMORpIP18dP45usOKGLZi494snLFGzM9uRadp2/ByLF/0JqfhcEg+Fx2hw5+d
         4pv4eoTgKbn8L7fKTUG5gIOJyCRSC+YnYckpVUFupTEe5NlNklWOJc1MrimicXIHLhmK
         M3szq99QV4UtgK/TC9yJ2b5dXhldeRv8ThOWfJm0V2WuLNR0eRXfWzM49LOUib0XbaA2
         wtIKz5LiieQrlCkTjUKdbKaqBx00V47hSO5E54bUs9YizHM0lmdFdnuLRN5xf9cRwGmj
         47N8hanqSy3wu1e2LNklBzVPLLF+SXoMuyO2eGxBdBNxDjOgFRY2exmSxP78xjkA4XMq
         X21w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733849506; x=1734454306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qXOH6pZZi9eL22B8MhhX9UUu8EkOGTpVPSjjBt9TTq4=;
        b=UC/GEuva9xC9T6BC1a8TnkZ6FvZYw7GV0HYzElLRd9JSShPd0rqHQGZQVYfSis2owd
         v8htdHwkaCiLb8Dm8Qmwm4gpTsDSoGiE1x2YwwN3jCvZEy2aFDR3oncSMn7qN8Jjp3cj
         fPf70GlLzyjFk+8Y8bhSDrKgrgsn2F5ZARS6R5BhwJBdekV0cM5XZKWn2IsCBGTMsRL0
         yEnTiin462BaCWkiBv6DiNB7fetZwyb0irq1/37E7/kAOzn/xNgaQ0Nj5AuhEOLkJTkO
         ug7X+hr5IIzapdzCnLNxorVYUun4o8TwhM0tu+xrtg+hqfYwswHol4aOUoMsJqcRS8mF
         B0MQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHzs8JP6uwOAc6sLBkZczOl90vBD6Tnih354qXM5VCpV+rsuCIlhZIsbVFTLZfgD4cu1NhiAgwPH524ks=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW9UZr5Ho4YzUZipcLHH5HiTjNJQ3xj0fqkHatpclgcLACE+zq
	aHs67i2N78+bzuevSBkSHQIkcbkgeVANWUFfZJVisPmzkMearqDP
X-Gm-Gg: ASbGncsNUgKaWTxAWM4aAwbMsEK9R5fOJ+ITTxXY4o0tSoFoyLtyGlCnIbxQgiDFYAP
	tSp4/FQfjiK+pgTGRiVyfx9I32FC1PEiXybyppmWkyJTYU7mjY7flMCqXUepQOTL9Qhj63fk7Lt
	2RJ1ACalWeWgk/rDnpESzrCdmx0Z7X441G69h5cSkCC08wjuFvn+YPje7CwDxu5NYZSN6N02wvj
	CXEAk7ZP33d+73uVn1+Aw5DswWe9v9ZsT4uXHL8xQ8dWiYgq5BXGVkjZx9LJhIGUPz/6CldEFC0
	7g3jErc/g83+CfJ2jXBV5cTwkrli
X-Google-Smtp-Source: AGHT+IGzJ9YtJRIXUx2WRftwh52jZYFp+OAl8TSYa6XERyxw2e0dtG6AQ2EjYin88gd4uM+Xi+ABrA==
X-Received: by 2002:a17:902:e94d:b0:216:7761:cc48 with SMTP id d9443c01a7336-2167761cd20mr46263785ad.40.1733849506543;
        Tue, 10 Dec 2024 08:51:46 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8ef9fcdsm91889225ad.146.2024.12.10.08.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 08:51:46 -0800 (PST)
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
Subject: [PATCH v11 1/4] iommu/io-pgtable-arm: Make pgtable walker more generic
Date: Tue, 10 Dec 2024 08:51:19 -0800
Message-ID: <20241210165127.600817-2-robdclark@gmail.com>
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

We can re-use this basic pgtable walk logic in a few places.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/io-pgtable-arm.c | 67 ++++++++++++++++++++++------------
 1 file changed, 43 insertions(+), 24 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 0e67f1721a3d..7e9c0f8ae138 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -749,33 +749,33 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
 }
 
 struct io_pgtable_walk_data {
-	struct iommu_dirty_bitmap	*dirty;
+	struct io_pgtable		*iop;
+	void				*data;
+	int (*visit)(struct io_pgtable_walk_data *walk_data, int lvl,
+		     arm_lpae_iopte *ptep, size_t size);
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
 
-	if (iopte_leaf(pte, lvl, iop->fmt)) {
-		size_t size = ARM_LPAE_BLOCK_SIZE(lvl, data);
+	size_t size = ARM_LPAE_BLOCK_SIZE(lvl, data);
+	int ret = walk_data->visit(walk_data, lvl, ptep, size);
+	if (ret)
+		return ret;
 
-		if (iopte_writeable_dirty(pte)) {
-			iommu_dirty_bitmap_record(walk_data->dirty,
-						  walk_data->addr, size);
-			if (!(walk_data->flags & IOMMU_DIRTY_NO_CLEAR))
-				iopte_set_writeable_clean(ptep);
-		}
+	if (iopte_leaf(pte, lvl, iop->fmt)) {
 		walk_data->addr += size;
 		return 0;
 	}
@@ -784,13 +784,13 @@ static int io_pgtable_visit_dirty(struct arm_lpae_io_pgtable *data,
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
@@ -805,7 +805,7 @@ static int __arm_lpae_iopte_walk_dirty(struct arm_lpae_io_pgtable *data,
 
 	for (idx = ARM_LPAE_LVL_IDX(walk_data->addr, lvl, data);
 	     (idx < max_entries) && (walk_data->addr < walk_data->end); ++idx) {
-		ret = io_pgtable_visit_dirty(data, walk_data, ptep + idx, lvl);
+		ret = io_pgtable_visit(data, walk_data, ptep + idx, lvl);
 		if (ret)
 			return ret;
 	}
@@ -813,6 +813,23 @@ static int __arm_lpae_iopte_walk_dirty(struct arm_lpae_io_pgtable *data,
 	return 0;
 }
 
+static int visit_dirty(struct io_pgtable_walk_data *walk_data, int lvl,
+		       arm_lpae_iopte *ptep, size_t size)
+{
+	struct iommu_dirty_bitmap *dirty = walk_data->data;
+
+	if (!iopte_leaf(*ptep, lvl, walk_data->iop->fmt))
+		return 0;
+
+	if (iopte_writeable_dirty(*ptep)) {
+		iommu_dirty_bitmap_record(dirty, walk_data->addr, size);
+		if (!(walk_data->flags & IOMMU_DIRTY_NO_CLEAR))
+			iopte_set_writeable_clean(ptep);
+	}
+
+	return 0;
+}
+
 static int arm_lpae_read_and_clear_dirty(struct io_pgtable_ops *ops,
 					 unsigned long iova, size_t size,
 					 unsigned long flags,
@@ -821,7 +838,9 @@ static int arm_lpae_read_and_clear_dirty(struct io_pgtable_ops *ops,
 	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
 	struct io_pgtable_cfg *cfg = &data->iop.cfg;
 	struct io_pgtable_walk_data walk_data = {
-		.dirty = dirty,
+		.iop = &data->iop,
+		.data = dirty,
+		.visit = visit_dirty,
 		.flags = flags,
 		.addr = iova,
 		.end = iova + size,
@@ -836,7 +855,7 @@ static int arm_lpae_read_and_clear_dirty(struct io_pgtable_ops *ops,
 	if (data->iop.fmt != ARM_64_LPAE_S1)
 		return -EINVAL;
 
-	return __arm_lpae_iopte_walk_dirty(data, &walk_data, ptep, lvl);
+	return __arm_lpae_iopte_walk(data, &walk_data, ptep, lvl);
 }
 
 static void arm_lpae_restrict_pgsizes(struct io_pgtable_cfg *cfg)
-- 
2.47.1


