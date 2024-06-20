Return-Path: <linux-arm-msm+bounces-23417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F465911000
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 20:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F14C61F21B44
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 18:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C59C61C6886;
	Thu, 20 Jun 2024 17:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHuR/vw0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131ED1C231E;
	Thu, 20 Jun 2024 17:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718906285; cv=none; b=u2UY/IQRVmK8DHdctBlXHdiyLzDRlKKmB81qBS3tN0lW7mEN3BrvKp6FHPJoSeqy1D3tD1L6dnYAYRtvR1LdIdUrPvuUspEoBpYKIZgg6F5S7Ch8J91nqPRaKNECF6nO/bv2z7OlJ/2CsOk2/pi9rf4qGpBGSSktqjOSJ/MJdUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718906285; c=relaxed/simple;
	bh=G8SsYV8VKhk+1kr8G6gSzRlXENvMiu+vYX15iq0TH0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PLChtDLWWHgwWu1QLR7jWpR/z68QZD3uCg7NR7FEDp2ivPp9U48uGI9VytDdZ2I133KZopKKMXTflGeKidk4WShJ0XNpW7+ARQireikVth6ZJQFnFfD0Zeda8pIP7x6wN2bqDhV4bXB848AaL0OlyFVwPbFYLhkqt9LUlexY6u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHuR/vw0; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-70601bcfddcso1160854b3a.3;
        Thu, 20 Jun 2024 10:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718906283; x=1719511083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=voUtFDbfyXxYSLuhMxY/5Es179PR05W0y6qbv62GFHo=;
        b=IHuR/vw0Yr3ip4W2ecHazBSDXEDQf67luVGyRA1rThf/BH5Pcp7+7bMg/G5S1dT8p8
         m/FU2PAqZ1iP8Iz9KaS3jBrELAvI1ElNLi8BDG3RHPXFYp4kH6c5YV6z1NBmeDCQyHVb
         qTRGK3Ow8gL30dSVq2vT3b+DHVFmQtWWMuYP9vogVPH9jZnk7h3vqZ/2UKu5J5K9FOrT
         KeFdMb3vyJ1W1w3GDR/51Guz8nAQFkGqepQDBgSUlvcROOlydyOQWwcBJbYaIHW/CXqC
         aRvok4dLGPGkT48z+4sawxUoXM5hTNizqMN8IQYxCAec9w1MYzVeJ7keJ2HSwsJGZoSl
         CI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906283; x=1719511083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=voUtFDbfyXxYSLuhMxY/5Es179PR05W0y6qbv62GFHo=;
        b=HU7uT9rK1XX0fjEmrhS0URDigtaRQbyFz0A0WBooptDVYThD/6qD3jYnjGvf/pDXA1
         YHNA7p72Oe57JU2hWQxDKujsgncUbJvtP0R9yagrNmU9wVjj9qznWZezOisrnr1Hg59K
         K9aXLOuDrovlPD0wCGvxDsLLtm1VxYJ7+6Og+oJsCmnZcbA4BriprXHLB8mGV5IJcAEp
         mOKWU2nLoddfC5f5D6NHq7dhdjDXVDzvQ5ZOYN27q/tApQQs7/172G0CrgM9zLusgKzf
         i1u++gcEdTKuUCECdMTfUfNRQ1G/VR2ZUcnHbtOaDWGO51k1PB/rIvIq2TOnV3hJ2Vw9
         v3Fw==
X-Forwarded-Encrypted: i=1; AJvYcCUgzj8cnlrVrUgXKhY0TYOykavtbGpXFSbBwX3hUUXCngewcrPWD2hrAqnilXJTmXyN8Z7L1C6XAL3Qkcb/dDb/YCddp9i46SNlW+Er/g==
X-Gm-Message-State: AOJu0YzZnMIp6RMgkgYppQKNCaxOrxu88DfvZUwF2ic2xLC2gQeRBtr0
	S0qT0K6ee8Fi6DakRu9Ovdq54vrD0WyTNpllJsKQ7P/idoqaMaGqqeVtTyvZnns=
X-Google-Smtp-Source: AGHT+IFuFY8WsrUaBevsclcxusM/Sc7ZvIAfPxrnCGbXlGrdTSyKJ0ahnS/qbGoRPvPpSuP7Wt6hDQ==
X-Received: by 2002:a05:6a00:4d07:b0:706:3514:2d6c with SMTP id d2e1a72fcca58-70635142dd9mr3899791b3a.29.1718906283409;
        Thu, 20 Jun 2024 10:58:03 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb6adb5sm12628100b3a.155.2024.06.20.10.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 10:58:02 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Bart Van Assche <bvanassche@acm.org>,
	Jan Kara <jack@suse.cz>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH v4 19/40] iommu: optimize subsystem by using atomic find_bit() API
Date: Thu, 20 Jun 2024 10:56:42 -0700
Message-ID: <20240620175703.605111-20-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240620175703.605111-1-yury.norov@gmail.com>
References: <20240620175703.605111-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify __arm_smmu_alloc_bitmap() and msm_iommu_alloc_ctx() by using
a dedicated API, and make them nice one-liner wrappers.

While here, refactor msm_iommu_attach_dev() and msm_iommu_alloc_ctx()
so that error codes don't mismatch.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.h | 11 +++--------
 drivers/iommu/msm_iommu.c             | 19 +++++--------------
 2 files changed, 8 insertions(+), 22 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 4765c6945c34..c74d0300b64b 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -15,6 +15,7 @@
 #include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/device.h>
+#include <linux/find_atomic.h>
 #include <linux/io-64-nonatomic-hi-lo.h>
 #include <linux/io-pgtable.h>
 #include <linux/iommu.h>
@@ -455,15 +456,9 @@ struct arm_smmu_impl {
 
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
index 989e0869d805..4299e6a5b2ec 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -9,6 +9,7 @@
 #include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/errno.h>
+#include <linux/find_atomic.h>
 #include <linux/io.h>
 #include <linux/io-pgtable.h>
 #include <linux/interrupt.h>
@@ -185,17 +186,9 @@ static const struct iommu_flush_ops msm_iommu_flush_ops = {
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
@@ -418,10 +411,8 @@ static int msm_iommu_attach_dev(struct iommu_domain *domain, struct device *dev)
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
2.43.0


