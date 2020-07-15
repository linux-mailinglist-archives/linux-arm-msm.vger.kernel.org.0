Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07C61221440
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2020 20:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbgGOS3U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jul 2020 14:29:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbgGOS3U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jul 2020 14:29:20 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60CE4C061755;
        Wed, 15 Jul 2020 11:29:20 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id k5so2720192plk.13;
        Wed, 15 Jul 2020 11:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cTHMoWxuC8w1paGifv5pZHHfVqj2NNnMRc8mdaDgfNM=;
        b=rSyq+FJwOxcy7wXjjN1EbiekaEoDwTBrJMnpQurVf3auyEt8FLqYrRwd+7lKOq0eOr
         yFrMl4lfwjCxZNLhOJ73xfdq7WoGmsYX41Brpyq1iDJKWb+AayW4kh/K+FThlZ0DfpcD
         ARPZR+we2nYgeM6lUPR3fyDpg8zgYeny19xEEZnpThmE6J/ZxBiQ7N6dngnabDbsnhRD
         FDBJ74IEgu+VagTTd37ErS2+W+Mpg8iFaQXS3h7lSiU/uHXBQWP1kEHEjzg8avB2wdey
         0dkm8vRBa8dJxa6q5Le+dPnH4KQceX08iy3ZJ0z0OU2LFKVsrCcqII//LYATFK7/BfKz
         YJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cTHMoWxuC8w1paGifv5pZHHfVqj2NNnMRc8mdaDgfNM=;
        b=aFaMPMyo6Z8ciP1ELEiA3zy1MS8ihJqoMi1KGF8p1Ae3Xg/nr2IMdSaJRzxe+yK+ET
         QLjHlL/7Y8M25NLvmCYGF4DiHWfcacyp87160MmehbMZPShJ9HiNipTR6+qxsrHNdylc
         r3x1D/7nPQu2k/DPwc8Ad+FImgPS++kBiOtke9LT2LhiGUMeDozFtyq6w2YeKDs+HFcN
         KA2M9G+KkoCbIU1Gs0r5XcIjlY+Utn3U7LnuWUJE6+E1r3uSoldpsu5dAmc54aak4uIX
         7xe+dp+cQcAI5dSgRWLbgCAv1JmqtrGCoMX1CbXWBCdslXdYamVa6iAdEj2dLrFtTcAo
         IpPw==
X-Gm-Message-State: AOAM533ELhYE5xKxk+IsPjB9PUXnw0N/8KRS5CuKXsn0rAYARcqKXyJs
        mt1eVCZJVri7jp+7/ceOs1CPDr+b5Zc=
X-Google-Smtp-Source: ABdhPJxgfhE3RxJz0+1WiENjPR8mSPZEIkPnPBEoCOHbbNI54IOtVMmPO88njHhf81D67XRp77uXJw==
X-Received: by 2002:a17:90b:1907:: with SMTP id mp7mr897633pjb.220.1594837758818;
        Wed, 15 Jul 2020 11:29:18 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id w71sm2674075pfd.6.2020.07.15.11.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 11:29:17 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        John Stultz <john.stultz@linaro.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/adreno: fix gpu probe if no interconnect-names
Date:   Wed, 15 Jul 2020 11:29:53 -0700
Message-Id: <20200715182955.3081774-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

If there is no interconnect-names, but there is an interconnects
property, then of_icc_get(dev, "gfx-mem"); would return an error
rather than NULL.

Also, if there is no interconnect-names property, there will never
be a ocmem path.  But of_icc_get(dev, "ocmem") would return -EINVAL
instead of -ENODATA.  Just don't bother trying in this case.

Fixes: 8e29fb37b301 ("drm/msm: handle for EPROBE_DEFER for of_icc_get")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 0527e85184e1..c4ac998b90c8 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -979,6 +979,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	struct adreno_platform_config *config = dev->platform_data;
 	struct msm_gpu_config adreno_gpu_config  = { 0 };
 	struct msm_gpu *gpu = &adreno_gpu->base;
+	bool has_interconnect_names = true;
 	int ret;
 
 	adreno_gpu->funcs = funcs;
@@ -1005,12 +1006,13 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	/* Check for an interconnect path for the bus */
 	gpu->icc_path = of_icc_get(dev, "gfx-mem");
-	if (!gpu->icc_path) {
+	if (IS_ERR_OR_NULL(gpu->icc_path)) {
 		/*
 		 * Keep compatbility with device trees that don't have an
 		 * interconnect-names property.
 		 */
 		gpu->icc_path = of_icc_get(dev, NULL);
+		has_interconnect_names = false;
 	}
 	if (IS_ERR(gpu->icc_path)) {
 		ret = PTR_ERR(gpu->icc_path);
@@ -1018,7 +1020,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		return ret;
 	}
 
-	gpu->ocmem_icc_path = of_icc_get(dev, "ocmem");
+	if (has_interconnect_names)
+		gpu->ocmem_icc_path = of_icc_get(dev, "ocmem");
+
 	if (IS_ERR(gpu->ocmem_icc_path)) {
 		ret = PTR_ERR(gpu->ocmem_icc_path);
 		gpu->ocmem_icc_path = NULL;
-- 
2.26.2

