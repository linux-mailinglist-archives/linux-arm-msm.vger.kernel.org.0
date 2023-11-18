Return-Path: <linux-arm-msm+bounces-1068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CDE7F0091
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Nov 2023 16:52:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C66E1F22836
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Nov 2023 15:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D0AB18E07;
	Sat, 18 Nov 2023 15:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hlKddV1Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 754D719BD;
	Sat, 18 Nov 2023 07:51:36 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-5a7c011e113so33664547b3.1;
        Sat, 18 Nov 2023 07:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700322695; x=1700927495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V1XoIiNxFuF4VYuiH6Quz1F4aXv1fFJNE5bF8jDHsU4=;
        b=hlKddV1ZThbFGBIC3Mt4kcl4GyJ6WPC/E2l6MGw6iT0VsfvIkpHSIuiOarggBOOO0y
         Am+PaVm4CA4E5s/3Eb28ojrSfeCLeg3exTbaFqIcS3wE3TWSvztmHCy1FwSF/uyc9Ikm
         COrJMc9H+GWinvC8IFslYeXIr14KBnQcHzNgqwXx18LIupRp41+SG7x39nj74EyCM0Py
         4BhDe96uNH5lpWVXXArerd5A07PHBsiPoHf6eoUj23jqrHNdZIvauee3J41KhQKInOOW
         vI1QmI+H4ZPK6S660VXQDodbS9IF6yzvX2Oxp8v5nP90Hr+A8C5wt57TjtDtQAlTeguC
         2mKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700322695; x=1700927495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V1XoIiNxFuF4VYuiH6Quz1F4aXv1fFJNE5bF8jDHsU4=;
        b=eptNtO0BX6DJEuznzkoLGDykQeLE0tKOWtvJQDMGdPYefPYCIinjiBXQLf3i7s6H1f
         Gvln745/1tQZZ35MXbTW6Z0g6is2ekdvVEAvcZzDu8sYOP5PyJdkt1WgebhmBAMkMwwy
         AI6G7W24FuXTRySY0yNadt8Uk2hCkDki5mzlNKhjlj25qiC3k3SgoI8zngUWmeUo4rH/
         /hmNAwUySOKv0w735WXCJ+8zmmYjPpUYtXTBfILzQCDiUBFs7l8ZbhfvaDOgCsKO466u
         ASY339EhNmZ0wWDje725zYc53OZTx/wWzNdBYRLuH8UMFD2bpnxuJoRTii2k/AUgsSFI
         /n9A==
X-Gm-Message-State: AOJu0YxiA1/BXZyKiyQp5RhGISo5lhGwUcDLryN9K0onFfBmXZRrLuC+
	9L9AcrxuZ5zGmEopMP++FqtcCV8LLYGrgdvJ
X-Google-Smtp-Source: AGHT+IEY1WAEs4kNKd75UVdANlei8VDfd1gVdWYThj+rx1F0zxh+1GBN8rubfJYMqdp79r+pN+9YDQ==
X-Received: by 2002:a81:8447:0:b0:5a7:a81d:e410 with SMTP id u68-20020a818447000000b005a7a81de410mr3105570ywf.18.1700322695050;
        Sat, 18 Nov 2023 07:51:35 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:48a9:bd4c:868d:dc97])
        by smtp.gmail.com with ESMTPSA id h12-20020a816c0c000000b005c5a3f80239sm1158114ywc.88.2023.11.18.07.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 07:51:34 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Yury Norov <yury.norov@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Cc: Jan Kara <jack@suse.cz>,
	Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
	Matthew Wilcox <willy@infradead.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>,
	Alexey Klimov <klimov.linux@gmail.com>
Subject: [PATCH 17/34] iommu: use atomic find_bit() API where appropriate
Date: Sat, 18 Nov 2023 07:50:48 -0800
Message-Id: <20231118155105.25678-18-yury.norov@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231118155105.25678-1-yury.norov@gmail.com>
References: <20231118155105.25678-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix opencoded find_and_set_next_bit() in __arm_smmu_alloc_bitmap()
and msm_iommu_alloc_ctx(), and make them nice one-liner wrappers.

While here, refactor msm_iommu_attach_dev() and msm_iommu_alloc_ctx()
so that error codes don't mismatch.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.h | 10 ++--------
 drivers/iommu/msm_iommu.c             | 18 ++++--------------
 2 files changed, 6 insertions(+), 22 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 703fd5817ec1..004a4704ebf1 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -453,15 +453,9 @@ struct arm_smmu_impl {
 
 static inline int __arm_smmu_alloc_bitmap(unsigned long *map, int start, int end)
 {
-	int idx;
+	int idx = find_and_set_next_bit(map, end, start);
 
-	do {
-		idx = find_next_zero_bit(map, end, start);
-		if (idx == end)
-			return -ENOSPC;
-	} while (test_and_set_bit(idx, map));
-
-	return idx;
+	return idx < end ? idx : -ENOSPC;
 }
 
 static inline void __iomem *arm_smmu_page(struct arm_smmu_device *smmu, int n)
diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index f86af9815d6f..67124f4228b1 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -185,17 +185,9 @@ static const struct iommu_flush_ops msm_iommu_flush_ops = {
 	.tlb_add_page = __flush_iotlb_page,
 };
 
-static int msm_iommu_alloc_ctx(unsigned long *map, int start, int end)
+static int msm_iommu_alloc_ctx(struct msm_iommu_dev *iommu)
 {
-	int idx;
-
-	do {
-		idx = find_next_zero_bit(map, end, start);
-		if (idx == end)
-			return -ENOSPC;
-	} while (test_and_set_bit(idx, map));
-
-	return idx;
+	return find_and_set_bit(iommu->context_map, iommu->ncb);
 }
 
 static void msm_iommu_free_ctx(unsigned long *map, int idx)
@@ -418,10 +410,8 @@ static int msm_iommu_attach_dev(struct iommu_domain *domain, struct device *dev)
 					ret = -EEXIST;
 					goto fail;
 				}
-				master->num =
-					msm_iommu_alloc_ctx(iommu->context_map,
-							    0, iommu->ncb);
-				if (IS_ERR_VALUE(master->num)) {
+				master->num = msm_iommu_alloc_ctx(iommu);
+				if (master->num >= iommu->ncb) {
 					ret = -ENODEV;
 					goto fail;
 				}
-- 
2.39.2


