Return-Path: <linux-arm-msm+bounces-30907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC4496D95A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 14:51:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B2D71C258A5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 12:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4895719D8A3;
	Thu,  5 Sep 2024 12:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="djaMnaCr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAB319B3E4;
	Thu,  5 Sep 2024 12:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725540609; cv=none; b=GIx3SXPmqdLjg8l5eWs7utd4S3Zh+Ih2sQxLH8eFx+EOI5HmXUP95GxQCFv6qRvckAeBwcKPOzv/KAcXwZzjhOIW3Qt+E9HmMsZIRbTdvgSRTAEsyGnd8e68bdeqVWCnfxP1ieJKlvVRrEZtwZ6CRH17C97PT1KAejnKzVKplkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725540609; c=relaxed/simple;
	bh=qce84B5NvR44kujqZ9743ui8j6Mh4hdIIbcIDgaypKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LGM0cozJTmjk2XBqqCRZLJN57O8uxFtPPP+wrs2X/+qNQqnAEirciD6Mmar1+1aJ9tOmU1hRhqY/exyuzE93hUHWNpxj6RC+ddTim6mV6OT58b+yRqj5DU0WZbJIePh0kxEWERJiniIPdRULD4fPOF1dAB4o7GPhBzQxA7D34nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=djaMnaCr; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20688fbaeafso7672765ad.0;
        Thu, 05 Sep 2024 05:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725540607; x=1726145407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AbIcFL6KLZXMYP15JMSrziSxqWJs9UyvqU1aIaWK9pI=;
        b=djaMnaCr07blt2W7U3X487E2mGYs7/UaV3ypGBNsrvjPYlHOJdWtd8psb8a9dZ6kDB
         BmFgtTQjZ2WmHg5BnuMtmiS7DYQQnqQGM72CSkEJQPRovRiYcZQprKqSIj9SGJBKJYvQ
         Uew4Zy9s05b/bFz8EhzF6DirKjIDC1zza8jyOdfOUXBfH8NXXzIHnz78zfCTaT9EWvd/
         M4Dh1RRsr4u12ThtdteTwPHPancyA6CDRQGxOUKEFZ8rxWus6+2DXWQSTF2dIs8Gu02L
         PPeTZNj9XHeI/BVpzmVYnM2jGdsyjXbeYMQSK383ssaw4xKc1ZYJSQRtVtjgpUwUXiYF
         PJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725540607; x=1726145407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AbIcFL6KLZXMYP15JMSrziSxqWJs9UyvqU1aIaWK9pI=;
        b=aLiuDSt9C+qi8nJS0Yy5scgL0dBTbkIMwlQGk8uprlo+3eIV0QnU1D7SWOzPC6UQ8v
         zPqGQ6kJjWaK6IR/tQWswIr/q+O5YIACR6VHES6xqnyjGR1qUgYYA5e8NASYDsWGvpxs
         +xRjJrDCcxtaNYR17MIFAirKw+2MM16TM+5yv6k7GShiIVewIp5rcV6KMKdY5RCNff3s
         ZqGGGksJDSfyN+a8OZ4HIdz1IvBqCQGwZw8ZEhT/eb0i++LO0mE2/7vpvsELNpRtUgPq
         2iMjdVa9QQFDaunfi9Oc6kGcFq80fvDzzp3nzuyodgy/mxBvpyOsWnMhqSmcbxXwiXNq
         jCPA==
X-Forwarded-Encrypted: i=1; AJvYcCWO/fmkV8QNoiuv4e8R2jtWn70zyL4uScSMOdHmRVjGx6NjhBX4M9ZYjTnWes1ohe/vuojAgCJKHgK706c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTfWIlDTSBIkj0IddVLkd+/dcKHfYm3bplsRL66JSQUH0WX0k7
	y9p8laQh7ATt0Hj++Hp5lVNu8QSquWBhyv33K+MeeNlJ2HS3x6mB
X-Google-Smtp-Source: AGHT+IGWH67j9Ae4z1bWCKkTMqpdz15WdakR2Z0nl3EE0ssMBp8RIbo+r/JoS6LCLi9xCGkqsJVTDA==
X-Received: by 2002:a17:902:ecc3:b0:205:6a9b:7e3e with SMTP id d9443c01a7336-20584230d32mr143491935ad.56.1725540606654;
        Thu, 05 Sep 2024 05:50:06 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea38c91sm28345915ad.169.2024.09.05.05.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 05:50:05 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Ashish Mhetre <amhetre@nvidia.com>,
	Rob Clark <robdclark@chromium.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] Revert "iommu/io-pgtable-arm: Optimise non-coherent unmap"
Date: Thu,  5 Sep 2024 05:49:56 -0700
Message-ID: <20240905124956.84932-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

This reverts commit 85b715a334583488ad7fbd3001fe6fd617b7d4c0.

It was causing gpu smmu faults on x1e80100.

I _think_ what is causing this is the change in ordering of
__arm_lpae_clear_pte() (dma_sync_single_for_device() on the pgtable
memory) and io_pgtable_tlb_flush_walk().  I'm not entirely sure how
this patch is supposed to work correctly in the face of other
concurrent translations (to buffers unrelated to the one being
unmapped(), because after the io_pgtable_tlb_flush_walk() we can have
stale data read back into the tlb.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/iommu/io-pgtable-arm.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 16e51528772d..85261baa3a04 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -274,13 +274,13 @@ static void __arm_lpae_sync_pte(arm_lpae_iopte *ptep, int num_entries,
 				   sizeof(*ptep) * num_entries, DMA_TO_DEVICE);
 }
 
-static void __arm_lpae_clear_pte(arm_lpae_iopte *ptep, struct io_pgtable_cfg *cfg, int num_entries)
+static void __arm_lpae_clear_pte(arm_lpae_iopte *ptep, struct io_pgtable_cfg *cfg)
 {
-	for (int i = 0; i < num_entries; i++)
-		ptep[i] = 0;
 
-	if (!cfg->coherent_walk && num_entries)
-		__arm_lpae_sync_pte(ptep, num_entries, cfg);
+	*ptep = 0;
+
+	if (!cfg->coherent_walk)
+		__arm_lpae_sync_pte(ptep, 1, cfg);
 }
 
 static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
@@ -653,28 +653,25 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
 		max_entries = ARM_LPAE_PTES_PER_TABLE(data) - unmap_idx_start;
 		num_entries = min_t(int, pgcount, max_entries);
 
-		/* Find and handle non-leaf entries */
-		for (i = 0; i < num_entries; i++) {
-			pte = READ_ONCE(ptep[i]);
+		while (i < num_entries) {
+			pte = READ_ONCE(*ptep);
 			if (WARN_ON(!pte))
 				break;
 
-			if (!iopte_leaf(pte, lvl, iop->fmt)) {
-				__arm_lpae_clear_pte(&ptep[i], &iop->cfg, 1);
+			__arm_lpae_clear_pte(ptep, &iop->cfg);
 
+			if (!iopte_leaf(pte, lvl, iop->fmt)) {
 				/* Also flush any partial walks */
 				io_pgtable_tlb_flush_walk(iop, iova + i * size, size,
 							  ARM_LPAE_GRANULE(data));
 				__arm_lpae_free_pgtable(data, lvl + 1, iopte_deref(pte, data));
+			} else if (!iommu_iotlb_gather_queued(gather)) {
+				io_pgtable_tlb_add_page(iop, gather, iova + i * size, size);
 			}
-		}
 
-		/* Clear the remaining entries */
-		__arm_lpae_clear_pte(ptep, &iop->cfg, i);
-
-		if (gather && !iommu_iotlb_gather_queued(gather))
-			for (int j = 0; j < i; j++)
-				io_pgtable_tlb_add_page(iop, gather, iova + j * size, size);
+			ptep++;
+			i++;
+		}
 
 		return i * size;
 	} else if (iopte_leaf(pte, lvl, iop->fmt)) {
-- 
2.46.0


