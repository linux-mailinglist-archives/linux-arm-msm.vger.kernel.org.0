Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3774B3BED91
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jul 2021 19:57:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbhGGR7p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jul 2021 13:59:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbhGGR7p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jul 2021 13:59:45 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDE12C061574;
        Wed,  7 Jul 2021 10:57:03 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id h1so1494581plf.6;
        Wed, 07 Jul 2021 10:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EDhXrajmnvxBxrJ/tYHc7nWHgq+rEYaq1EkVOV5AyYQ=;
        b=K2khLq4OTEQQLx+IefqPARZZ0in8JUgBl+N+kHWZvbaef66mRTR80CqMHgYeb37prT
         I0YBhD2jNeheaguaTL3j5zbpa0o/kDgIqZPSjky1YjTGLlslJp/Xx/+1brzrE1kWRhrF
         j25WA+aQMvXP/7MoKfWQfOYcJEojUfEaNalarvDer8VEQcyWBmTVVZdTr16fbT42IAWb
         ZAs5T9K75fcE6J+q4E9RMr6K2Kx4+Z/TGZXmTAI29d5F3O+4UxNicWCj/mmrSTDPoGPC
         UXaTesb7Pf1Mf+1q70s9a97C4Lm31z1hYf8EKi7j0IP7a5zm1FZRdh963cfQSvMJNYF0
         swTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EDhXrajmnvxBxrJ/tYHc7nWHgq+rEYaq1EkVOV5AyYQ=;
        b=NrZaEshiSu1vTApnDF1HwNgAXnnhPT6zL/DAXK9M/1pi47z1mu7XAhLGrAJAUPKW5t
         r7+jsQr19iW7T+4hpbthpWUopNjuwpnH1GID9jmTApQ/N3gRKO6vF3iaffPA5me3KNrz
         TufbzzCnEpHGU0kcr/QH5As3ndgHJqgqpUXJsW+7kJJWKSrzX2+lVh2+G+bLUc8GH7PD
         Hed1S9/6Qs0X8dZwnybDH+VmjjqRWlmzCL1i2vSQG8hC3ItOCJvYMwLCgrBqAmE0wPj1
         M7GQsFgtIzvDIUJmdDnPt+XJwTB6b5KqhQcPth9npdJTAmY350s7pUcYD5BNkV8BY3xr
         zEoA==
X-Gm-Message-State: AOAM532oNwtrX5P12o9FI85F5f/N+hMb67FKpTK8/TlSoQk4LZ59D3Id
        9NsTDAtfyc8OVQ7GB2Maj34=
X-Google-Smtp-Source: ABdhPJwyUkbBXi5+6LwZLmWlw9bcycvwzdyYCCOW+yQwnreaPS0KzZm8Xnwmsufrgm44jmz8uyxChw==
X-Received: by 2002:a17:902:e291:b029:129:c9cd:a3ce with SMTP id o17-20020a170902e291b0290129c9cda3cemr2307466plc.36.1625680623321;
        Wed, 07 Jul 2021 10:57:03 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id z1sm18063712pfn.126.2021.07.07.10.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 10:57:02 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Fix display fault handling
Date:   Wed,  7 Jul 2021 11:01:13 -0700
Message-Id: <20210707180113.840741-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

It turns out that when the display is enabled by the bootloader, we can
get some transient iommu faults from the display.  Which doesn't go over
too well when we install a fault handler that is gpu specific.  To avoid
this, defer installing the fault handler until we get around to setting
up per-process pgtables (which is adreno_smmu specific).  The arm-smmu
fallback error reporting is sufficient for reporting display related
faults (and in fact was all we had prior to f8f934c180f629bb927a04fd90d)

Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reported-by: Yassine Oudjana <y.oudjana@protonmail.com>
Fixes: 2a574cc05d38 ("drm/msm: Improve the a6xx page fault handler")
Signed-off-by: Rob Clark <robdclark@chromium.org>
Tested-by: John Stultz <john.stultz@linaro.org>
---
 drivers/gpu/drm/msm/msm_iommu.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index eed2a762e9dd..bcaddbba564d 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -142,6 +142,9 @@ static const struct iommu_flush_ops null_tlb_ops = {
 	.tlb_add_page = msm_iommu_tlb_add_page,
 };
 
+static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
+		unsigned long iova, int flags, void *arg);
+
 struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
 {
 	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(parent->dev);
@@ -157,6 +160,13 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
 	if (!ttbr1_cfg)
 		return ERR_PTR(-ENODEV);
 
+	/*
+	 * Defer setting the fault handler until we have a valid adreno_smmu
+	 * to avoid accidentially installing a GPU specific fault handler for
+	 * the display's iommu
+	 */
+	iommu_set_fault_handler(iommu->domain, msm_fault_handler, iommu);
+
 	pagetable = kzalloc(sizeof(*pagetable), GFP_KERNEL);
 	if (!pagetable)
 		return ERR_PTR(-ENOMEM);
@@ -300,7 +310,6 @@ struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain)
 
 	iommu->domain = domain;
 	msm_mmu_init(&iommu->base, dev, &funcs, MSM_MMU_IOMMU);
-	iommu_set_fault_handler(domain, msm_fault_handler, iommu);
 
 	atomic_set(&iommu->pagetables, 0);
 
-- 
2.31.1

