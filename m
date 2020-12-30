Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5BB62E7A5B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Dec 2020 16:32:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbgL3PbO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Dec 2020 10:31:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbgL3PbN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Dec 2020 10:31:13 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28298C06179B;
        Wed, 30 Dec 2020 07:30:33 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id dk8so15759422edb.1;
        Wed, 30 Dec 2020 07:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GpHHXsZUYQJKAsXY+fqmwPRImq5uvJodDxQThHKttC8=;
        b=uHIwWiQAgZJcuQerW7aZxpUYvAFOTwmZvcXoZiU49CUjjuA1rz+nOdAJEHkixngy/d
         DsQZPLJV7kupiV7lpp0NWXiS703qBfxVdzMtFIzpHyEcr6u+PVS4o8Fg0v89I9ylqmy0
         GYL53UmVqN4xU3ZSbBLljt5TlDbhTuunuf7Czmz+s3yDW1p0XKcxRQM4ilaFq32NB2Qu
         NT1/sDY8saKYA0vLYexCb9SRLSKgXw3krKcevilTqBeDf7x2L0fUV3XaE/hFXBqOFcZA
         o1xR38gcWm29F7RUgOB8ozoWQzgae+yHxRe0HaHmA7vRDXgKo9sIJrr8kfyXlumRHzq5
         A5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GpHHXsZUYQJKAsXY+fqmwPRImq5uvJodDxQThHKttC8=;
        b=ts+0WL0Gr1RcD2yS73LpePtJ7m5DNbz+XWDy89TWQhlC5YbnKw6Tv9zIw44EMPtzc7
         u+dD7Q6HXeoVaiDjNY6Ts6rWrSj0KjN2WYbIgAxxL0FvS6okk24FSyLmgubuMqat04k/
         d+3dYi6aTO1VsIOxdpdPJ0sHOXhldu0VYcFndsgQYhmx1HkGmX1SmQltx8WLjGDjlUgs
         mpa2YoYkTrVBZfs5ELfPxMQrvIJwJc101CNx3TjUd32UpXo0VLxNE7NFSKzvqQ3o2rB8
         ITW4YFLV/xIP/riivJyXfP5srJWIhwlJteb4R5UQ7uXlk9YLawodAAzkRdZuh9ZoWI55
         MDEQ==
X-Gm-Message-State: AOAM531yWgFxT1+dpr4kbRcmzqLyhChz1Mtwvo8pDZoKAHR8DfmYKaY6
        EIzZOEPYXS5FALW2fdw7zbQ=
X-Google-Smtp-Source: ABdhPJw23n3T+Ct/p+WPbtT9gStbrEMVVfK/XXEV42wVlsRLVTv/eR7cudEWmcjCEz6apzplIZfyMw==
X-Received: by 2002:a50:b282:: with SMTP id p2mr52859676edd.210.1609342231950;
        Wed, 30 Dec 2020 07:30:31 -0800 (PST)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id bo20sm38664655edb.1.2020.12.30.07.30.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Dec 2020 07:30:31 -0800 (PST)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Akhil P Oommen <akhilpo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Wambui Karuga <wambui.karugax@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 2/2] drm/msm: Add modparam to allow vram carveout
Date:   Wed, 30 Dec 2020 17:29:43 +0200
Message-Id: <20201230152944.3635488-2-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201230152944.3635488-1-iskren.chernev@gmail.com>
References: <20201230152944.3635488-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Using the GPU with a VRAM Carveout is a security vulnerability.
Nevertheless it is sometimes required, especially when no IOMMU
implementation is available for a certain platform.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c      | 6 ++++--
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c      | 6 ++++--
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c      | 6 ++++--
 drivers/gpu/drm/msm/adreno/adreno_device.c | 4 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 1 +
 5 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index 7e82c41a85f1a..bdc989183c648 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -534,8 +534,10 @@ struct msm_gpu *a2xx_gpu_init(struct drm_device *dev)
 
 	if (!gpu->aspace) {
 		dev_err(dev->dev, "No memory protection without MMU\n");
-		ret = -ENXIO;
-		goto fail;
+		if (!allow_vram_carveout) {
+			ret = -ENXIO;
+			goto fail;
+		}
 	}
 
 	return gpu;
diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index 93da6683a8661..4534633fe7cdb 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -564,8 +564,10 @@ struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
 		 * implement a cmdstream validator.
 		 */
 		DRM_DEV_ERROR(dev->dev, "No memory protection without IOMMU\n");
-		ret = -ENXIO;
-		goto fail;
+		if (!allow_vram_carveout) {
+			ret = -ENXIO;
+			goto fail;
+		}
 	}
 
 	icc_path = devm_of_icc_get(&pdev->dev, "gfx-mem");
diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index c0be3a0f36b2c..82bebb40234de 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -692,8 +692,10 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
 		 * implement a cmdstream validator.
 		 */
 		DRM_DEV_ERROR(dev->dev, "No memory protection without IOMMU\n");
-		ret = -ENXIO;
-		goto fail;
+		if (!allow_vram_carveout) {
+			ret = -ENXIO;
+			goto fail;
+		}
 	}
 
 	icc_path = devm_of_icc_get(&pdev->dev, "gfx-mem");
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 87c8b033ad1a6..12e75ba360f95 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -18,6 +18,10 @@ bool snapshot_debugbus = false;
 MODULE_PARM_DESC(snapshot_debugbus, "Include debugbus sections in GPU devcoredump (if not fused off)");
 module_param_named(snapshot_debugbus, snapshot_debugbus, bool, 0600);
 
+bool allow_vram_carveout = false;
+MODULE_PARM_DESC(allow_vram_carveout, "Allow using VRAM Carveout, in place of IOMMU");
+module_param_named(allow_vram_carveout, allow_vram_carveout, bool, 0600);
+
 static const struct adreno_info gpulist[] = {
 	{
 		.rev   = ADRENO_REV(2, 0, 0, 0),
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index c3775f79525a7..fe5444a1482ae 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -18,6 +18,7 @@
 #include "adreno_pm4.xml.h"
 
 extern bool snapshot_debugbus;
+extern bool allow_vram_carveout;
 
 enum {
 	ADRENO_FW_PM4 = 0,
-- 
2.29.2

