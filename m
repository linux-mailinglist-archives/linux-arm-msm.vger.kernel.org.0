Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E6451B0DBE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2020 16:03:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729257AbgDTODr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Apr 2020 10:03:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728792AbgDTODr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Apr 2020 10:03:47 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0FADC061A0C
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 07:03:45 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id fb4so4666230qvb.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 07:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AL7hXb8H/qoBJbDBZohhbHzSXTKh5iAM3hIyFPRwuxM=;
        b=VbG3OkuzryiADo+SuBJMbjRhDLggqq8Z1nhcUstkpW0HmJY80ivSzoVD2bIoL6+c7I
         Uuz2QniB7Z5CqT94K3NPuYYbVgEk167cNocTu/UlsjOALbqUng7Q1NVdJibuQAanmatL
         DduIC6hLlqo28IdSPd0YwUcYBhPtHmyeb29iL7yLS77UHGjIR2tuLHes5h98hsDaEwQS
         /oKP9LDWnrAJD5oEEpwSKM6ofmER19wQeJE8eZQ42tTaJJFNsy4QFfd4A0MmR+8EvgXc
         1y9+4KleZ3lbmFCkeUINytrZV/azWgy2U9PJ4oZlHOt3Yae9ET3/FjlGOZJty3tL+svC
         NeJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AL7hXb8H/qoBJbDBZohhbHzSXTKh5iAM3hIyFPRwuxM=;
        b=eL4+4xoe15FH+//2n5jbCd2ZGOGpW8xBM9H2dZqHB95fzz5Qruwz7QmxB2pho7O3EH
         UZUMUUqpCF9xEVjiW+GuxYXEDcopzLwV9Kch23ppmBbWWs5ffXDRgM4G3E4IyBkkjdCV
         1Eo5Ev+vnyyNEuvLhzfcAuMtv6A1cBuQRKKNdEdrtfpKjsoSQSLm1XzYpETO9CTYn7o3
         HfI6D0jc2soR66eMvCNGx8jYqce080+Rbxdz5mYctr2ihjV5Z3NN+ECAkjefA0Mj1YNv
         YmTfqAjJb53E+J4Vc3e7pUqyZQx040IHONBkKWRagB5u+GhfJzGvGeWQDnTMu+vrsl+e
         K+Qg==
X-Gm-Message-State: AGi0PuZ/uL304sHnnZJPJO8fGJP9pPqBvGCigbJSxe+w9Hj7RuXBQ6R0
        Gskn2rpN/SGcqkRa3i2wewgx+w==
X-Google-Smtp-Source: APiQypJbBE+wFH9zAewo04smsE28aAKfYYfnbIhgn83376FC45tY9AalDkIrTnMLrKQ/dym8U3JM0Q==
X-Received: by 2002:a0c:f38d:: with SMTP id i13mr15276070qvk.187.1587391423430;
        Mon, 20 Apr 2020 07:03:43 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id t75sm609424qke.127.2020.04.20.07.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 07:03:42 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
        Sharat Masetty <smasetty@codeaurora.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/9] drm/msm/a6xx: allow allocating GMU memory with a fixed address
Date:   Mon, 20 Apr 2020 10:03:07 -0400
Message-Id: <20200420140313.7263-4-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200420140313.7263-1-jonathan@marek.ca>
References: <20200420140313.7263-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 748cd379065f..c6ecb3189ec5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -938,8 +938,8 @@ static void a6xx_gmu_memory_free(struct a6xx_gmu *gmu, struct a6xx_gmu_bo *bo)
 	kfree(bo);
 }
 
-static struct a6xx_gmu_bo *a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu,
-		size_t size)
+static struct a6xx_gmu_bo *
+a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu, size_t size, uint64_t iova)
 {
 	struct a6xx_gmu_bo *bo;
 	int ret, count, i;
@@ -964,13 +964,13 @@ static struct a6xx_gmu_bo *a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu,
 			goto err;
 	}
 
-	bo->iova = gmu->uncached_iova_base;
+	bo->iova = iova ?: gmu->uncached_iova_base;
 
 	for (i = 0; i < count; i++) {
 		ret = iommu_map(gmu->domain,
 			bo->iova + (PAGE_SIZE * i),
 			page_to_phys(bo->pages[i]), PAGE_SIZE,
-			IOMMU_READ | IOMMU_WRITE);
+			IOMMU_READ | IOMMU_WRITE | IOMMU_PRIV);
 
 		if (ret) {
 			DRM_DEV_ERROR(gmu->dev, "Unable to map GMU buffer object\n");
@@ -990,7 +990,8 @@ static struct a6xx_gmu_bo *a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu,
 		goto err;
 
 	/* Align future IOVA addresses on 1MB boundaries */
-	gmu->uncached_iova_base += ALIGN(size, SZ_1M);
+	if (!iova)
+		gmu->uncached_iova_base += ALIGN(size, SZ_1M);
 
 	return bo;
 
@@ -1331,12 +1332,12 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 		goto err_put_device;
 
 	/* Allocate memory for for the HFI queues */
-	gmu->hfi = a6xx_gmu_memory_alloc(gmu, SZ_16K);
+	gmu->hfi = a6xx_gmu_memory_alloc(gmu, SZ_16K, 0);
 	if (IS_ERR(gmu->hfi))
 		goto err_memory;
 
 	/* Allocate memory for the GMU debug region */
-	gmu->debug = a6xx_gmu_memory_alloc(gmu, SZ_16K);
+	gmu->debug = a6xx_gmu_memory_alloc(gmu, SZ_16K, 0);
 	if (IS_ERR(gmu->debug))
 		goto err_memory;
 
-- 
2.26.1

