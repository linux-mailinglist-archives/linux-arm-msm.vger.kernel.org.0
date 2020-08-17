Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0431B2479DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 00:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729448AbgHQWEi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 18:04:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729409AbgHQWDP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 18:03:15 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBAD1C061343;
        Mon, 17 Aug 2020 15:03:14 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id ha11so8306643pjb.1;
        Mon, 17 Aug 2020 15:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VoyPgLas/EUNbQEYprU6PB/6pOwjqGOdvclKJYENFWw=;
        b=lj+Nh9g1Fq/xON7fwxuChAfJOTx6pH9nErfD/IK3WCKUggySkSqe0+krFy2k4RLa3m
         rM+h0ElOBHrlt6FS2cSGvE9jWG6jeyeBDUgPcmITY0VqS8kRxZOg335DYkg1oAWoel0Q
         +LAoiypyeupaVlutsZ+m5ISzx78hhGA4Mkmy7SPe4ZFIYk/f20x6k60xkrRx3z3HcgGp
         6b0x5sfZQ1W/2XY4aLl0J6PAC5OsfHlkF+IdAvOAQavegChIxMrkbhkEQaE8XLe4gx/P
         bTIBgCbC10yfukyXQExlbxeMt/frC5wXL0G88N0un+CAnkYwknoIt/4KcdDR8u8oZKG8
         rC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VoyPgLas/EUNbQEYprU6PB/6pOwjqGOdvclKJYENFWw=;
        b=kVD0l1Fy3EKqkWIsd2RtWiLbgTaKeh9GH50+jaT0hnyP0rbBmLnl4BglC5EgsWnKRw
         E8CLLDZgA+3NYoNq8M7bPf+a8ZDQiNPVoLpD5B1Xr9fuCD7PPyit2PHVThkJ8VIo0wZd
         dtWaVOP+SH92SMi/ORDfNBbZh2eueJFmmoJ5eHjzkTfDdJ4ZE5ZCF3mrQkd4ScWw8PsK
         XQPwRJ7oAAfEoF+lpMjb+FJSFX6B5NM31uOYPEtmaBe1d1AF2U6PhoH5MB4UfkeGWTNp
         +gSejsrBjgBUyJrrqzqH5+yfDqT11lWixPRYfM3LPxCPUOUvfPUP6SG2fjY96qa+AXoo
         FhqA==
X-Gm-Message-State: AOAM530AMwd+uh9kJK7CrEMm1EgPlzMVxujZ5UHxhQqsdxiL6Gb642SO
        MI2gEkRbIwaBzBQKk4I7gGc=
X-Google-Smtp-Source: ABdhPJwhXURO/k/X3Ef3oo89v7mRBW4D4QjKqxgVtsXicxqmnflfZ25dMk5hEf48tEb3uwJsfCEa/Q==
X-Received: by 2002:a17:90a:e292:: with SMTP id d18mr14374836pjz.181.1597701794026;
        Mon, 17 Aug 2020 15:03:14 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id y21sm6634279pgc.43.2020.08.17.15.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 15:03:13 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-msm@vger.kernel.org
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>, freedreno@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Brian Masney <masneyb@onstation.org>,
        Eric Anholt <eric@anholt.net>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 13/20] drm/msm: Set the global virtual address range from the IOMMU domain
Date:   Mon, 17 Aug 2020 15:01:38 -0700
Message-Id: <20200817220238.603465-14-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817220238.603465-1-robdclark@gmail.com>
References: <20200817220238.603465-1-robdclark@gmail.com>
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
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 13 +++++++++++--
 drivers/gpu/drm/msm/msm_iommu.c         |  7 +++++++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 533a34b4cce2..34e6242c1767 100644
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

