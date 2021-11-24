Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5455645CF32
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 22:37:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350163AbhKXVka (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 16:40:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350267AbhKXVk0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 16:40:26 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4245EC06174A;
        Wed, 24 Nov 2021 13:37:16 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id fv9-20020a17090b0e8900b001a6a5ab1392so3941020pjb.1;
        Wed, 24 Nov 2021 13:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qT270TDVu3RNLCbEZIh136xM3BZd66vNcoUJgEjamV4=;
        b=Rnc90X9RwyHkbAznozL/QOsisKd66Ud1McZiJUMkhUarRCDAdk4cocqf2wn2tsaM49
         OYUyAnyg2y2UZi2dqC3ZBlLmIe0Wg+Xglq2CVnavdWUpDhLIj1+k7asGdlaEhBNtrGev
         4LN3G5sN4dFHTxHGz/KzfXbQ82t9nm5d/aaw98yAyhG5wdzq5xGn4iMYovY7lFKxN/Lb
         9I0A9A0apH+zpsuR8Jei02IOWkFm+Rh0nxBBQa6zFzMBHJJ8WfXEEzOw4AL9mCg0HCfH
         eBkjVSK3hRYfvOXXNEqSSyyfHFoCo5EKH+m139EN6Yagh9xcNLfp9/nI4k1lTlfDXJ7B
         OWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qT270TDVu3RNLCbEZIh136xM3BZd66vNcoUJgEjamV4=;
        b=77zgoHZHE76BKFr/ZuizMzbqQ/ZQAnxgLEbg01/zy9ohBAIld/TMnIdyWKLo0gE8ah
         GiBocR+Tyjw0InkDQZAabYShTIOZMmyc2GvtLVKKGqJ37wNR7iAkm9BY13efGWP9HLOA
         SlNFtdneZXAodiWdTLflaAb8O1QINE0LhKlmBE2Bl6oUxZEXs9EKz7QsFLhEjSTuQppz
         gYnesm8bHfnS/1rs3YbpLBuQD7M11+2so3wRjzvZkgQs67znyaE7fXH/idVW3AtekyeE
         1KDnYVL33TDTvjJRpMCERg8zmbSpsv63QLCHX9yD49zQ5WGM7/zg58LMsft5afOmZBTH
         aptQ==
X-Gm-Message-State: AOAM533Cna1d/TKDHg+jSU2cnsDtDFplTWC0wAyAkEo287NAcjhrp4g+
        wH5xrtCMxlws3okJW2XBbI4=
X-Google-Smtp-Source: ABdhPJxLykj61ao4WG+u/+cIoCuT4gWrgMpP7iO04TKNVHbS/1IFNkycMGeaXHB8V8SYdXK3Coit4w==
X-Received: by 2002:a17:90a:158f:: with SMTP id m15mr266293pja.200.1637789835783;
        Wed, 24 Nov 2021 13:37:15 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id c18sm654630pfl.201.2021.11.24.13.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 13:37:14 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Eric Anholt <eric@anholt.net>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/7] drm/msm/gpu: Name GMU bos
Date:   Wed, 24 Nov 2021 13:41:29 -0800
Message-Id: <20211124214151.1427022-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124214151.1427022-1-robdclark@gmail.com>
References: <20211124214151.1427022-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 71e52b2b2025..e1774ea342b1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1146,7 +1146,7 @@ static void a6xx_gmu_memory_free(struct a6xx_gmu *gmu)
 }
 
 static int a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu, struct a6xx_gmu_bo *bo,
-		size_t size, u64 iova)
+		size_t size, u64 iova, const char *name)
 {
 	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
 	struct drm_device *dev = a6xx_gpu->base.base.dev;
@@ -1181,6 +1181,8 @@ static int a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu, struct a6xx_gmu_bo *bo,
 	bo->virt = msm_gem_get_vaddr(bo->obj);
 	bo->size = size;
 
+	msm_gem_object_set_name(bo->obj, name);
+
 	return 0;
 }
 
@@ -1515,7 +1517,8 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	 */
 	gmu->dummy.size = SZ_4K;
 	if (adreno_is_a660_family(adreno_gpu)) {
-		ret = a6xx_gmu_memory_alloc(gmu, &gmu->debug, SZ_4K * 7, 0x60400000);
+		ret = a6xx_gmu_memory_alloc(gmu, &gmu->debug, SZ_4K * 7,
+					    0x60400000, "debug");
 		if (ret)
 			goto err_memory;
 
@@ -1523,23 +1526,24 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	}
 
 	/* Allocate memory for the GMU dummy page */
-	ret = a6xx_gmu_memory_alloc(gmu, &gmu->dummy, gmu->dummy.size, 0x60000000);
+	ret = a6xx_gmu_memory_alloc(gmu, &gmu->dummy, gmu->dummy.size,
+				    0x60000000, "dummy");
 	if (ret)
 		goto err_memory;
 
 	if (adreno_is_a650_family(adreno_gpu)) {
 		ret = a6xx_gmu_memory_alloc(gmu, &gmu->icache,
-			SZ_16M - SZ_16K, 0x04000);
+			SZ_16M - SZ_16K, 0x04000, "icache");
 		if (ret)
 			goto err_memory;
 	} else if (adreno_is_a640_family(adreno_gpu)) {
 		ret = a6xx_gmu_memory_alloc(gmu, &gmu->icache,
-			SZ_256K - SZ_16K, 0x04000);
+			SZ_256K - SZ_16K, 0x04000, "icache");
 		if (ret)
 			goto err_memory;
 
 		ret = a6xx_gmu_memory_alloc(gmu, &gmu->dcache,
-			SZ_256K - SZ_16K, 0x44000);
+			SZ_256K - SZ_16K, 0x44000, "dcache");
 		if (ret)
 			goto err_memory;
 	} else {
@@ -1547,18 +1551,18 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 		gmu->legacy = true;
 
 		/* Allocate memory for the GMU debug region */
-		ret = a6xx_gmu_memory_alloc(gmu, &gmu->debug, SZ_16K, 0);
+		ret = a6xx_gmu_memory_alloc(gmu, &gmu->debug, SZ_16K, 0, "debug");
 		if (ret)
 			goto err_memory;
 	}
 
 	/* Allocate memory for for the HFI queues */
-	ret = a6xx_gmu_memory_alloc(gmu, &gmu->hfi, SZ_16K, 0);
+	ret = a6xx_gmu_memory_alloc(gmu, &gmu->hfi, SZ_16K, 0, "hfi");
 	if (ret)
 		goto err_memory;
 
 	/* Allocate memory for the GMU log region */
-	ret = a6xx_gmu_memory_alloc(gmu, &gmu->log, SZ_4K, 0);
+	ret = a6xx_gmu_memory_alloc(gmu, &gmu->log, SZ_4K, 0, "log");
 	if (ret)
 		goto err_memory;
 
-- 
2.33.1

