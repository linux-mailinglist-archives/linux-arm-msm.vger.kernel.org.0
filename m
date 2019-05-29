Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E4482E6BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2019 22:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbfE2Uzu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 May 2019 16:55:50 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:58594 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726944AbfE2Uzt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 May 2019 16:55:49 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id BE6CC619B4; Wed, 29 May 2019 20:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559163348;
        bh=9aXhSj9Phw8JHRWY+YFRT00OkAJ1xzvQFBspXjSWjck=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DlLTXI6D4ODG+V9UsMgaHCr2ZUr3pdKethOGTeAzd73+xCmiXfcfjSkiv6OjZqZgi
         Xfqfou1DZUy36SnkdB9GQttCDycxxsIhRXJjdn5f+F/p4AyhUsOmWS2ozWHwx7CDuZ
         0hCIaouti6i/zeMGlpHEWdu0sztaSAdwLCBQttKg=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4D0EB61893;
        Wed, 29 May 2019 20:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559163344;
        bh=9aXhSj9Phw8JHRWY+YFRT00OkAJ1xzvQFBspXjSWjck=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eJqexVeSyscsIpxCzkF0HmshEvM+QN0sglQoNcW7Z8aL5ZWCNKEB9oRW2iMbYgyXM
         9Y6D3h/4T6PzXLBdw4nEOiuLsTcEWER+bRD5EcrOLUOrOiwldI/HCkNwqkEjYaQHJZ
         zJtt+mbCrElkuDakahFKf/WM4Q05LYchCANkZQAY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4D0EB61893
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     jean-philippe.brucker@arm.com, linux-arm-msm@vger.kernel.org,
        hoegsberg@google.com, dianders@chromium.org,
        Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 12/16] drm/msm: Add a helper function for a per-instance address space
Date:   Wed, 29 May 2019 14:54:48 -0600
Message-Id: <1559163292-4792-13-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559163292-4792-1-git-send-email-jcrouse@codeaurora.org>
References: <1559163292-4792-1-git-send-email-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a helper function to create a GEM address space attached to
an iommu auxiliary domain for a per-instance pagetable.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/msm_drv.h     |  4 +++
 drivers/gpu/drm/msm/msm_gem_vma.c | 53 +++++++++++++++++++++++----------------
 2 files changed, 36 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index d9aa7ba..1d4b45a 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -262,6 +262,10 @@ struct msm_gem_address_space *
 msm_gem_address_space_create_a2xx(struct device *dev, struct msm_gpu *gpu,
 		const char *name, uint64_t va_start, uint64_t va_end);
 
+struct msm_gem_address_space *
+msm_gem_address_space_create_instance(struct device *dev, const char *name,
+		u64 va_start, u64 va_end);
+
 int msm_register_mmu(struct drm_device *dev, struct msm_mmu *mmu);
 void msm_unregister_mmu(struct drm_device *dev, struct msm_mmu *mmu);
 
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index fcf7a83..0ee11b4 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -136,14 +136,12 @@ int msm_gem_init_vma(struct msm_gem_address_space *aspace,
 	return 0;
 }
 
-
-struct msm_gem_address_space *
-msm_gem_address_space_create(struct device *dev, struct iommu_domain *domain,
-		const char *name)
+static struct msm_gem_address_space *
+msm_gem_address_space_new(struct msm_mmu *mmu, const char *name,
+		u64 va_start, u64 va_end)
 {
 	struct msm_gem_address_space *aspace;
-	u64 size = domain->geometry.aperture_end -
-		domain->geometry.aperture_start;
+	u64 size = va_end - va_start;
 
 	aspace = kzalloc(sizeof(*aspace), GFP_KERNEL);
 	if (!aspace)
@@ -151,10 +149,9 @@ msm_gem_address_space_create(struct device *dev, struct iommu_domain *domain,
 
 	spin_lock_init(&aspace->lock);
 	aspace->name = name;
-	aspace->mmu = msm_iommu_new(dev, domain);
+	aspace->mmu = mmu;
 
-	drm_mm_init(&aspace->mm, (domain->geometry.aperture_start >> PAGE_SHIFT),
-		size >> PAGE_SHIFT);
+	drm_mm_init(&aspace->mm, (va_start >> PAGE_SHIFT), size >> PAGE_SHIFT);
 
 	kref_init(&aspace->kref);
 
@@ -162,24 +159,38 @@ msm_gem_address_space_create(struct device *dev, struct iommu_domain *domain,
 }
 
 struct msm_gem_address_space *
+msm_gem_address_space_create(struct device *dev, struct iommu_domain *domain,
+		const char *name)
+{
+	struct msm_mmu *mmu = msm_iommu_new(dev, domain);
+
+	if (IS_ERR(mmu))
+		return ERR_CAST(mmu);
+
+	return msm_gem_address_space_new(mmu, name,
+		domain->geometry.aperture_start, domain->geometry.aperture_end);
+}
+
+struct msm_gem_address_space *
 msm_gem_address_space_create_a2xx(struct device *dev, struct msm_gpu *gpu,
 		const char *name, uint64_t va_start, uint64_t va_end)
 {
-	struct msm_gem_address_space *aspace;
-	u64 size = va_end - va_start;
+	struct msm_mmu *mmu = msm_gpummu_new(dev, gpu);
 
-	aspace = kzalloc(sizeof(*aspace), GFP_KERNEL);
-	if (!aspace)
-		return ERR_PTR(-ENOMEM);
+	if (IS_ERR(mmu))
+		return ERR_CAST(mmu);
 
-	spin_lock_init(&aspace->lock);
-	aspace->name = name;
-	aspace->mmu = msm_gpummu_new(dev, gpu);
+	return msm_gem_address_space_new(mmu, name, va_start, va_end);
+}
 
-	drm_mm_init(&aspace->mm, (va_start >> PAGE_SHIFT),
-		size >> PAGE_SHIFT);
+struct msm_gem_address_space *
+msm_gem_address_space_create_instance(struct device *dev, const char *name,
+		u64 va_start, u64 va_end)
+{
+	struct msm_mmu *mmu = msm_iommu_new_instance(dev);
 
-	kref_init(&aspace->kref);
+	if (IS_ERR(mmu))
+		return ERR_CAST(mmu);
 
-	return aspace;
+	return msm_gem_address_space_new(mmu, name, va_start, va_end);
 }
-- 
2.7.4

