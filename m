Return-Path: <linux-arm-msm+bounces-36239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 724979B3CDB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 22:35:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C00E6B21282
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 21:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C88451EF0B7;
	Mon, 28 Oct 2024 21:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/Wtp4zT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86861EE009;
	Mon, 28 Oct 2024 21:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730151328; cv=none; b=Ea1axK3pI2mvwVi622GSSmott0alsD4YPd5jsjNjbNQlLVC43kHZUGw44u0Zl37NVODfZNPIPriklhhbJWbZHDQHIZsuuFLrDSizsKdzhwCcM1gkme8NbZ5cUXz3j5AUNL5zrSwtX5YV7esAKHUrHAW5GtP6Fjz0caO5JmCu7H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730151328; c=relaxed/simple;
	bh=+E+z/EOaiAO9EI4kie6YvvmAmAMMQ+x08UASzW5Rucg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fQWmc51mm+K+59uEmsCPB9aWlNKpH63kyJfC91R6+PowSfBCU/7uUOBmQdrNTGr8tu37Y4sYOEusZAMXnvGwHZBrseKO1jeqq7tdhe9p6PKYDNCIzry7/25fVO+egDwL9yUH59EDS4nt4VJI3s438YYzTikChHvwK2h2BhLf7ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/Wtp4zT; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7ea16c7759cso2246541a12.1;
        Mon, 28 Oct 2024 14:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730151326; x=1730756126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HG6V5IEjg5fR7H7zxvH/yThNTAfW1zJep5mmD3Nzp9E=;
        b=h/Wtp4zTxmXPlsbN54HrbExpTqRk7EQDC4jw2SL+OoVvpOqEHlT0MsQNTQhD20gqYn
         0kAwp+AQ8EUukYvT5v0BLyI+eY/Tf3mUKDQa+47WTThVWEpgVRDI9T409Y+F+xD4ixoD
         /GrT+zo+uthxn18LITYCkpSfwFjwNF154OwppG2QjqYItgRGj5B8sGH4jS7Hd/9nwFXs
         M03e/F1ZJpo5MR5FvE194b+BybcLzs+OJ2cqgT7/o+OWYR8swkqvlRSI+ucX1ox0Qhwo
         z5sYbQxaTMbv8JQGaw3njluoOQgQd4dfvP55OoStVgNaInUAvLtyhuBbQKVc1LhplgNG
         wgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730151326; x=1730756126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HG6V5IEjg5fR7H7zxvH/yThNTAfW1zJep5mmD3Nzp9E=;
        b=SLXnkvdAsvDlumxHP3u9TRZ4csOQiAi6gcHzMB9AB0zt2GPIMW4cE/vzlrv2J+IHgK
         wHMZhDeHM1t1o5fJooEBvw6LLcTxykvDn5mboGiBLCX8+awAf45eGKxPxaq/gHvJqm/B
         relnGWUFA6TshSa3AkJY5dDriYPgSTcNX8d0WTZGxDoyD71PsThUgdvpDZrBJzCH2AvA
         UibS2EiCv8Q8vnQ47KSzpmKgO/rAiFUz4f3eNWoJfTFREBuMG7HNalFSg4d1BUlUozg5
         Ic3GUZc3EYtQJbTrVp/x3OSBUbRCQ9jIZ/yttJCju8K/R5aflrUJcmVlhFbcxDpkPCAZ
         +LTA==
X-Forwarded-Encrypted: i=1; AJvYcCUAWq6DBQ2HJh3xt5m05kvwcVROt+mvojrLDbGX8Zgdo6wBAZvBWO6hRCxQAQm+11N0GIYzS1Mr8ziHSgg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0Q4W4yDDlRRsjF4Eoo1YjK2ueRe9H507Y6FPwO4uaorWpjc/1
	hZ7/1XQFjIsVQZjKxelzu9EpEN2eiBROgwN8DYnQBL+glN+LbdpN
X-Google-Smtp-Source: AGHT+IHYfTByDMFcPygEQ50HF0A5OEX5ytobSAKHJ4GmVG1OnJTN978gymeL5m5xxwFxhYlpGaAN7A==
X-Received: by 2002:a05:6a20:4499:b0:1d9:1a3b:85d4 with SMTP id adf61e73a8af0-1d9a83b5192mr14212818637.6.1730151325996;
        Mon, 28 Oct 2024 14:35:25 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057931a06sm6216898b3a.55.2024.10.28.14.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 14:35:25 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Rob Clark <robdclark@chromium.org>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v10 2/4] iommu/io-pgtable-arm: Re-use the pgtable walk for iova_to_phys
Date: Mon, 28 Oct 2024 14:31:38 -0700
Message-ID: <20241028213146.238941-3-robdclark@gmail.com>
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

Re-use the generic pgtable walk path.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/iommu/io-pgtable-arm.c | 74 +++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 7e9c0f8ae138..88b128c77893 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -712,42 +712,6 @@ static size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iov
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
 	struct io_pgtable		*iop;
 	void				*data;
@@ -763,6 +727,41 @@ static int __arm_lpae_iopte_walk(struct arm_lpae_io_pgtable *data,
 				 arm_lpae_iopte *ptep,
 				 int lvl);
 
+struct iova_to_phys_data {
+	arm_lpae_iopte pte;
+	int lvl;
+};
+
+static int visit_iova_to_phys(struct io_pgtable_walk_data *walk_data, int lvl,
+			      arm_lpae_iopte *ptep, size_t size)
+{
+	struct iova_to_phys_data *data = walk_data->data;
+	data->pte = *ptep;
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
@@ -780,8 +779,9 @@ static int io_pgtable_visit(struct arm_lpae_io_pgtable *data,
 		return 0;
 	}
 
-	if (WARN_ON(!iopte_table(pte, lvl)))
+	if (!iopte_table(pte, lvl)) {
 		return -EINVAL;
+	}
 
 	ptep = iopte_deref(pte, data);
 	return __arm_lpae_iopte_walk(data, walk_data, ptep, lvl + 1);
-- 
2.47.0


