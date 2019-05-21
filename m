Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 318FD25541
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 18:14:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728789AbfEUQOx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 12:14:53 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:60466 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728957AbfEUQOx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 12:14:53 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 10B7A61AC3; Tue, 21 May 2019 16:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558455292;
        bh=9aXhSj9Phw8JHRWY+YFRT00OkAJ1xzvQFBspXjSWjck=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kSfTpCGV5/Wp1zq8aqxwfVSUQhQNycw78oAXl3Nanp8VBWkzHJOv9u9Eqdfu0ahqm
         HGYTUNNWxtv0G2zXp9tXjJ/Gq7QI7gEXiKVu/UxCdMJAnEq6Y9UsA04W8ziTZ1tYWz
         YlW92s8rbufrMB/tZhK6faEzczUe7iTct3dGEyCc=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2E48561A5C;
        Tue, 21 May 2019 16:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558455265;
        bh=9aXhSj9Phw8JHRWY+YFRT00OkAJ1xzvQFBspXjSWjck=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SVnDGffrzPDaouD/31loIWc92bGnmmbA4g62WezNnVT6esjiwklpM6/VbBxRNAKl6
         tPqzNybOhQem/ehtZUUG2Uv+o8bhn1mV+Jx/rFBeULrOuilrm1a0EwOsC1qYOmdobY
         gws1wRzfdfkVrxlfx3lemXB0NGJ/V/B53TTsen7k=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2E48561A5C
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
Subject: [PATCH v2 10/15] drm/msm: Add a helper function for a per-instance address space
Date:   Tue, 21 May 2019 10:13:58 -0600
Message-Id: <1558455243-32746-11-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558455243-32746-1-git-send-email-jcrouse@codeaurora.org>
References: <1558455243-32746-1-git-send-email-jcrouse@codeaurora.org>
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

