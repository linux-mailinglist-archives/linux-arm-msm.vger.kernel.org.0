Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AEF9266381
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 18:18:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbgIKQSJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 12:18:09 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:56162 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726551AbgIKQSG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 12:18:06 -0400
X-Greylist: delayed 526 seconds by postgrey-1.27 at vger.kernel.org; Fri, 11 Sep 2020 12:18:04 EDT
Received: from localhost.localdomain (80-110-125-173.cgn.dynamic.surfer.at [80.110.125.173])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 26A75C18F3;
        Fri, 11 Sep 2020 16:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1599840553; bh=beYe2pjCl3qn4jz1iKBarKru400MJtZulKL+2GMLrWU=;
        h=From:To:Cc:Subject:Date;
        b=Mn92EfctCWcVVDiCUTXOz6gLRQazMvjNTXVmfrrpKkoqyXGVWc7BGWA9BjORnwIJu
         Smz7pT2mpF6JqgYTBpYRX00fV4N5AkdeFSNa/HhXj7N9bnPCoUQ1wJju8nOpGvKrkG
         n79/Sq4UohDtR8UFI7hXyuMwjBIF0SA0N8clE4+M=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     freedreno@lists.freedesktop.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, Luca Weiss <luca@z3ntu.xyz>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Brian Masney <masneyb@onstation.org>,
        John Stultz <john.stultz@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/adreno: fix probe without iommu
Date:   Fri, 11 Sep 2020 18:08:53 +0200
Message-Id: <20200911160854.484114-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The function iommu_domain_alloc returns NULL on platforms without IOMMU
such as msm8974. This resulted in PTR_ERR(-ENODEV) being assigned to
gpu->aspace so the correct code path wasn't taken.

Fixes: ccac7ce373c1 ("drm/msm: Refactor address space initialization")
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 862dd35b27d3..6e8bef1a9ea2 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -189,10 +189,16 @@ struct msm_gem_address_space *
 adreno_iommu_create_address_space(struct msm_gpu *gpu,
 		struct platform_device *pdev)
 {
-	struct iommu_domain *iommu = iommu_domain_alloc(&platform_bus_type);
-	struct msm_mmu *mmu = msm_iommu_new(&pdev->dev, iommu);
+	struct iommu_domain *iommu;
+	struct msm_mmu *mmu;
 	struct msm_gem_address_space *aspace;
 
+	iommu = iommu_domain_alloc(&platform_bus_type);
+	if (!iommu)
+		return NULL;
+
+	mmu = msm_iommu_new(&pdev->dev, iommu);
+
 	aspace = msm_gem_address_space_create(mmu, "gpu", SZ_16M,
 		0xffffffff - SZ_16M);
 
-- 
2.28.0

