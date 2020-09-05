Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1959725EA05
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Sep 2020 22:04:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728723AbgIEUE1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Sep 2020 16:04:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728743AbgIEUEY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Sep 2020 16:04:24 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F958C061244;
        Sat,  5 Sep 2020 13:04:24 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id 17so6470964pfw.9;
        Sat, 05 Sep 2020 13:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6Iw0dHrjTvuCQzC5e/gsNUQGkDUy9ocfveJcatBjwfs=;
        b=QjGHvXUXJ9nOFPLXCsSKoutaw8jE22c5npdiMT8+5I7EobBt6agwiN7rHYED3vK/9l
         R7iNxhwTEcVvZRKsF5b100zHVt8h+eF6TN4HcST2l2as/Z2Ezc02V8/N5ZoBWIbYYdoh
         TV77bcw5cLuGePbrP6NTNgGG7dNpcMgn338v6i5Unr0ThHS2LvAA/y2entZD1lr1kD/x
         pEOtDdGMn6hE8bDxaGm709UsmY2mIiUhpuRK//Fj+nBP0aDkIsK5ymgOTuvS5b06trvT
         5XZSFiNBDyWs9+waj326o+ude45/fYU+pfaPis4xi0H0yrJWn7FII3o+LBf1Sg8pj38f
         r+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6Iw0dHrjTvuCQzC5e/gsNUQGkDUy9ocfveJcatBjwfs=;
        b=Fd5MyRjdC7SjiM5aHb+UaQZdygS4u1jj0Fa/nXMVi0TH1Hl2gZCrRh6moB+bplFVtC
         Pjvu6WpzMSJnoNagbsp9a9lyIkZ0WZAKGUrZZzzMe7QHX0m4bFqIZvT7UD8SWP2vktqz
         RAf0J2RXHRA8TXSUjmn+4hBgoKPcTqRgyllKutEpj7RzhAdac7Mdd3omYzME9DvnF4FA
         hNKL7sbH5seHqakTM0IPTcJLh7ejoGVL/tU11lwbasphk4+VUcWJk+SQRwxNjUgJF9YZ
         vjMdc7OgcpB2WuJYuKlnb37rcOgo9/E50H2csR/VZiC5shpEJwb4Bwql2rrmLMEV8Z3s
         TssA==
X-Gm-Message-State: AOAM530Pq+BoGlQsfR9YhsKuvn+eSmiYXobLGpSVGE4zRhScOpuIuoyI
        VBRVeGmdcV8ItHGrXbZrbliWu5RNHeRtbWkdfNs=
X-Google-Smtp-Source: ABdhPJwA906n2s8az97kUmTej4LoK6ZyRxudC/BY/FsdmgjsN2Waiw224CFDRRMz5qg/zJr43MtwAQ==
X-Received: by 2002:aa7:93a8:0:b029:13c:1611:6534 with SMTP id x8-20020aa793a80000b029013c16116534mr12211051pff.6.1599336263849;
        Sat, 05 Sep 2020 13:04:23 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id 19sm8386881pjk.28.2020.09.05.13.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 13:04:22 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     iommu@lists.linux-foundation.org, dri-devel@lists.freedesktop.org,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Brian Masney <masneyb@onstation.org>,
        Fabio Estevam <festevam@gmail.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v17 07/20] drm/msm: Set the global virtual address range from the IOMMU domain
Date:   Sat,  5 Sep 2020 13:04:13 -0700
Message-Id: <20200905200454.240929-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200905200454.240929-1-robdclark@gmail.com>
References: <20200905200454.240929-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jordan Crouse <jcrouse@codeaurora.org>

Use the aperture settings from the IOMMU domain to set up the virtual
address range for the GPU. This allows us to transparently deal with
IOMMU side features (like split pagetables).

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 13 +++++++++++--
 drivers/gpu/drm/msm/msm_iommu.c         |  7 +++++++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index a712e1cfcba8..b703e5308b01 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -192,9 +192,18 @@ adreno_iommu_create_address_space(struct msm_gpu *gpu,
 	struct iommu_domain *iommu = iommu_domain_alloc(&platform_bus_type);
 	struct msm_mmu *mmu = msm_iommu_new(&pdev->dev, iommu);
 	struct msm_gem_address_space *aspace;
+	u64 start, size;
 
-	aspace = msm_gem_address_space_create(mmu, "gpu", SZ_16M,
-		0xffffffff - SZ_16M);
+	/*
+	 * Use the aperture start or SZ_16M, whichever is greater. This will
+	 * ensure that we align with the allocated pagetable range while still
+	 * allowing room in the lower 32 bits for GMEM and whatnot
+	 */
+	start = max_t(u64, SZ_16M, iommu->geometry.aperture_start);
+	size = iommu->geometry.aperture_end - start + 1;
+
+	aspace = msm_gem_address_space_create(mmu, "gpu",
+		start & GENMASK(48, 0), size);
 
 	if (IS_ERR(aspace) && !IS_ERR(mmu))
 		mmu->funcs->destroy(mmu);
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 3a381a9674c9..1b6635504069 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -36,6 +36,10 @@ static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
 	struct msm_iommu *iommu = to_msm_iommu(mmu);
 	size_t ret;
 
+	/* The arm-smmu driver expects the addresses to be sign extended */
+	if (iova & BIT_ULL(48))
+		iova |= GENMASK_ULL(63, 49);
+
 	ret = iommu_map_sg(iommu->domain, iova, sgt->sgl, sgt->nents, prot);
 	WARN_ON(!ret);
 
@@ -46,6 +50,9 @@ static int msm_iommu_unmap(struct msm_mmu *mmu, uint64_t iova, size_t len)
 {
 	struct msm_iommu *iommu = to_msm_iommu(mmu);
 
+	if (iova & BIT_ULL(48))
+		iova |= GENMASK_ULL(63, 49);
+
 	iommu_unmap(iommu->domain, iova, len);
 
 	return 0;
-- 
2.26.2

