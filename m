Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1D80259A1E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Sep 2020 18:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732213AbgIAQqt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 12:46:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732223AbgIAQqr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 12:46:47 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA57DC061244;
        Tue,  1 Sep 2020 09:46:46 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id l191so975832pgd.5;
        Tue, 01 Sep 2020 09:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WYTCQC7k5r6oYpQvFiV0f8NKzeE5fQRzSiH1SNa55g4=;
        b=jb+hIQo4YGVb49rppc+dz9dcrA81hb6Q9w9XfGZU/rRy8WtQYB/H8RhxPhMl8lqvhk
         CnBPmZFZbAvKQlYIDdQGuyQtrXI1jApM7UWplLCzVbN1kOCNwE7oE+6N8kOR6ZLtGfFB
         sknqzo82iFq43GlBXKj6Sp0t5wuqY3/XgCp7ppDbOyKD+z982LP5FC1AITsiBGUyw+fk
         KTczjYdilU1eyDT1SxjdLrKVuDjTJ0Ee0DLkZLdRnXdWKfeaIntbNUKsH4qq0U0TGpDk
         +TYEo7M7WXQHWrLSe6grt+buv5rj4jfYOqvKGlk0z6Hh3Tt5cvLwkjKy7cCz3GoeJYOP
         ACKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WYTCQC7k5r6oYpQvFiV0f8NKzeE5fQRzSiH1SNa55g4=;
        b=YUj4HUtKw9pETnF3n5WH1uYCSwIS4GoVbsGkbZdrrY9Um37TvWfzoBzkVsGJ1iuk7f
         qp3Zw2ih/J0YqoXvqgxhIMsp+Ob3KMHDZ+eAfzhFSo5YWTDPc4/Bwt6LAoL8RLuoVOoZ
         U99IfoTlMR6JtLchyXr0LTlsSc/IVVINi0StSDoIzpC99D5MXF2dMM/EiGRz/fR7CwX0
         yl2CF+KwaVkqemwnywXK7oSMFedkU0TMIUmqmJaqXuXJEp8SnvS6tQ4ZOwShNzyWHs9k
         8YVgwAlbMSfZ1V20VRbq71xrh9s2rqzcoCGyacUHO+iB7RSbP/19emgBI/QxoKaSnEX6
         UsxA==
X-Gm-Message-State: AOAM531ol9A5I3/XxIRmXhgjG+xDfYT23+xPp2PPMKKOo9QXBagOMywn
        UGxnSfSutEK/JMhk5Y1Bh/w=
X-Google-Smtp-Source: ABdhPJxdpDEnCgSW8zbZaOw6jGWCE36JSntOzr47h8AkVBEnCZ4Nk+OIeewO2v/DiaBr7gpt/Hcl+g==
X-Received: by 2002:a05:6a00:44:: with SMTP id i4mr2719453pfk.276.1598978806321;
        Tue, 01 Sep 2020 09:46:46 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id q5sm2509374pfu.16.2020.09.01.09.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 09:46:45 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-msm@vger.kernel.org, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
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
        Takashi Iwai <tiwai@suse.de>,
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v16 07/20] drm/msm: Set the global virtual address range from the IOMMU domain
Date:   Tue,  1 Sep 2020 09:46:24 -0700
Message-Id: <20200901164707.2645413-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200901164707.2645413-1-robdclark@gmail.com>
References: <20200901164707.2645413-1-robdclark@gmail.com>
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

