Return-Path: <linux-arm-msm+bounces-29135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D38958D03
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 19:17:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A9B71F2436D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 17:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD211C3F3C;
	Tue, 20 Aug 2024 17:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a9YBx/z5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B611C0DE4;
	Tue, 20 Aug 2024 17:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724174234; cv=none; b=Ur0d/SCQxwhc7HpgQzyJZRuBt7A1ManU3S8Ad9LSdTX+wd+MoKQ/Z4VuIyeNp+v6XD+KSwMHHeFZe7OKe8S5R4A2+EV/Sk+mKIN2I3TRJK2XuD0CE4/ioyupV4S5CC+JB18q/RrgIpIWB1lDgtm2sIg3O96LANDBRy97n/e9lVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724174234; c=relaxed/simple;
	bh=Jw5M9yB4qk/y8Z61fR27dXsfwJ+4Xe2LxgetVa5nwvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t7wjrf3RmPTNzqi1PdcSj0wS2fcbYidDF2e+j3hzz+cBpaH8m2iu/ivTs1Gjdqcc5aE+de7RSx9Gs7F5QmujvzUpYcMsKYqIesg13/o9alxJl3TR76XYpTBr5I3TISosnCC2fGKXPthif1uMaRuyWhsNK4qX3AWhkEFCrh2zBIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a9YBx/z5; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20219a0fe4dso29775645ad.2;
        Tue, 20 Aug 2024 10:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724174232; x=1724779032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I2hM9IXnWJCIXdGneHBR3ODZityq3OdYqAzA4dSYz3U=;
        b=a9YBx/z5NQqbJx6rZwBM+2yoaviktNd5gonYjjWkay6jer+K3p6Cog5mPBHYjL0eT0
         PurJi6y/4Cg8coKy/xQEU1Ckd3+CYMuyqL9YSZ/Qrmd4HOawl7Bx73cAM8GYTTnlIdR/
         3ocTkiw0fzy37eziGaFHZnzs+ltfw79a+9yC7cknCuoFEbYr/hfz27XOsQ31meX5juZC
         e4vVCAXt6wk9eIKpkUvc2TMTuSWcHYZWB5ypW+3vleCxIeGrXj71yUG6ntFGFTQDEKcb
         fQVtBKFl0zZM6Ra+tcGPlQHEK2h/ZeP2hsigVAYhjlw4mp+jO74/9fRBq+Qwcdg8whGh
         8QUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724174232; x=1724779032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I2hM9IXnWJCIXdGneHBR3ODZityq3OdYqAzA4dSYz3U=;
        b=m7MRh9XGqlaKN5xQ38TbcZtEiUJgmWi0wYfUZudPRmZzVoZ/HCgzK69xaJuahwPeMA
         LIgpvHyDlJcX2McWhQLWZRtCi1Z5JOmVBsS5C0ctKdea3Rsx41K7Eq2mW7/K8WmQ9UgQ
         szUdIVhUXhzOhUXFp1plES7SmE/VCzUUeYcrhAhbLz8ZeQ9iNQYfPu5tJzKjmomoao0M
         snM5+0dlPstvjLs0Vr/XMF+JbkoICh7oCcmkCcrg22MxBsT/rSvRVE1ELsUuoKqNVOeo
         ibkrgpCgxyMT4b3PhfY3K7BLvkxuLjSmla8jzivRm2tXqlr6kwiRBKDVglT+8e+GzXQ7
         IA3w==
X-Forwarded-Encrypted: i=1; AJvYcCVzWuPAHzBuDzbKZZgBeitZdwYFTLa9glPbv2/lJ9RC9EqJ1zwp6DdevALPDF0XO8ogkbm12RiF2DMHDjs+U1jFpIMq1HU8hTxtpqPa
X-Gm-Message-State: AOJu0YwSXc65gDNtcNa2amBts9bDI/Llz3/vTCirZk2+1yTttdS6jQwp
	I75fNP40f18pVXvDIcFRsYLZjGuAKh19xVSQo+C95yRev92uZfFI
X-Google-Smtp-Source: AGHT+IHS+4WBqpl7XNll/ytEzf6YHrvGP09TiR7krwtGsSYQlPFlo0KfVRx52A+btS5AqAL/na8UQw==
X-Received: by 2002:a17:902:db10:b0:1fb:4a57:7cba with SMTP id d9443c01a7336-2031512dbbbmr29303395ad.34.1724174232313;
        Tue, 20 Aug 2024 10:17:12 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:bd02:d0ce:e791:dc08:a375])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f0303285sm80066795ad.26.2024.08.20.10.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 10:17:11 -0700 (PDT)
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
Subject: [PATCH v7 2/4] iommu/io-pgtable-arm: Re-use the pgtable walk for iova_to_phys
Date: Tue, 20 Aug 2024 10:16:45 -0700
Message-ID: <20240820171652.145673-3-robdclark@gmail.com>
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

Re-use the generic pgtable walk path.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/iommu/io-pgtable-arm.c | 73 +++++++++++++++++-----------------
 1 file changed, 36 insertions(+), 37 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index b4bc358740e0..5fa1274a665a 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -710,42 +710,6 @@ static size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iov
 				data->start_level, ptep);
 }
 
-static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
-					 unsigned long iova)
-{
-	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
-	arm_lpae_iopte pte, *ptep = data->pgd;
-	int lvl = data->start_level;
-
-	do {
-		/* Valid IOPTE pointer? */
-		if (!ptep)
-			return 0;
-
-		/* Grab the IOPTE we're interested in */
-		ptep += ARM_LPAE_LVL_IDX(iova, lvl, data);
-		pte = READ_ONCE(*ptep);
-
-		/* Valid entry? */
-		if (!pte)
-			return 0;
-
-		/* Leaf entry? */
-		if (iopte_leaf(pte, lvl, data->iop.fmt))
-			goto found_translation;
-
-		/* Take it to the next level */
-		ptep = iopte_deref(pte, data);
-	} while (++lvl < ARM_LPAE_MAX_LEVELS);
-
-	/* Ran out of page tables to walk */
-	return 0;
-
-found_translation:
-	iova &= (ARM_LPAE_BLOCK_SIZE(lvl, data) - 1);
-	return iopte_to_paddr(pte, data) | iova;
-}
-
 struct io_pgtable_walk_data {
 	void				*data;
 	int (*visit)(struct io_pgtable_walk_data *walk_data, int lvl,
@@ -760,6 +724,41 @@ static int __arm_lpae_iopte_walk(struct arm_lpae_io_pgtable *data,
 				 arm_lpae_iopte *ptep,
 				 int lvl);
 
+struct iova_to_phys_data {
+	arm_lpae_iopte pte;
+	int lvl;
+};
+
+static int visit_iova_to_phys(struct io_pgtable_walk_data *walk_data, int lvl,
+			      arm_lpae_iopte pte, size_t size)
+{
+	struct iova_to_phys_data *data = walk_data->data;
+	data->pte = pte;
+	data->lvl = lvl;
+	return 0;
+}
+
+static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
+					 unsigned long iova)
+{
+	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
+	struct iova_to_phys_data d;
+	struct io_pgtable_walk_data walk_data = {
+		.data = &d,
+		.visit = visit_iova_to_phys,
+		.addr = iova,
+		.end = iova + 1,
+	};
+	int ret;
+
+	ret = __arm_lpae_iopte_walk(data, &walk_data, data->pgd, data->start_level);
+	if (ret)
+		return 0;
+
+	iova &= (ARM_LPAE_BLOCK_SIZE(d.lvl, data) - 1);
+	return iopte_to_paddr(d.pte, data) | iova;
+}
+
 static int io_pgtable_visit(struct arm_lpae_io_pgtable *data,
 			    struct io_pgtable_walk_data *walk_data,
 			    arm_lpae_iopte *ptep, int lvl)
@@ -776,7 +775,7 @@ static int io_pgtable_visit(struct arm_lpae_io_pgtable *data,
 		return 0;
 	}
 
-	if (WARN_ON(!iopte_table(pte, lvl)))
+	if (WARN_ON(!iopte_table(pte, lvl) && !selftest_running))
 		return -EINVAL;
 
 	ptep = iopte_deref(pte, data);
-- 
2.46.0


