Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E90362A9994
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Nov 2020 17:39:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbgKFQim (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Nov 2020 11:38:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbgKFQil (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Nov 2020 11:38:41 -0500
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F8DFC0613CF
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2020 08:38:41 -0800 (PST)
Received: by mail-qt1-x835.google.com with SMTP id r8so1156851qtp.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2020 08:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Had0NO1OldvzTy/dDlNqjQKg348W7mzmn4iytrp+oxQ=;
        b=V2hu9iyNpp0yTzPUT7lZKUqbQ/2x7YnQrzVGbvUYq0G+YcJWUjF+46gV0o+FK/26vh
         Of+wrlgjlYkaT8tcI+l5nUoGXhEa2KBdlM+gLZ405p3MpZvEd9PudSivUEQHFOj6j0xv
         P8B2COSOrzBfz3zjjmgGwg1qz/7Wapve74QEoonB1WE8heMk3w7+FtxTOU9mdOYh2uNE
         ybQ9GCudcd2dniJhSOpvTNqMoNPet99w7Hmj0mZ/uWjvTHWl86FGNSJru6/CIdHLSBqm
         Tn8Il+iZyn0quArnaZx5+oNFlrLjNu0UnY82RZDbMrVQPhVmbUE2jHx1UpOPkxr35yDW
         DTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Had0NO1OldvzTy/dDlNqjQKg348W7mzmn4iytrp+oxQ=;
        b=LLi4TAdHECwMfOFqpimY765+0xOqTsaO2Kr9TGMBdv0uUjBn1g1ErlHAI67+HESTBH
         j7uEnD0uKLezncpPmIfZnBRDGEQDqYTwENTK/zbzqdNVZP5snS5PlcrzxByHbcSrwdDt
         3IzopUDILvL7PoEw2LinEtx2kOVaYC3UblvS9PaMu2byV7qKY+AwvgpTWSqIkK9gBcg5
         zHVWSOwrMJXj4Q1Hs/I3svm/XzaCkonyNe4G1tvk0dVNLZmn2xIQJNlDGPByLK+I1K6v
         gJunD88AFYO6lVpbzbbC8JDh6Z6oatVrUPxC5JJHOs2A5WA8MuX7N4yQxfb79JQ5uwt0
         DVug==
X-Gm-Message-State: AOAM530S7ise/01isFMQcNOvIbIFkPQaIOfarzhtxPhcOQUwm+9dwzm4
        1ELxTE0lYjCtYaPU+VZIXb7Upw==
X-Google-Smtp-Source: ABdhPJyfJBGq5pbvY6DHwRd9vE1Q5GQnVMlutx1rNnL4Hh9g0+G/IzM1OxjFTx5xliniBDauqTkHDw==
X-Received: by 2002:ac8:7604:: with SMTP id t4mr2374834qtq.366.1604680720838;
        Fri, 06 Nov 2020 08:38:40 -0800 (PST)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id s3sm860000qkj.27.2020.11.06.08.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 08:38:40 -0800 (PST)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/5] drm/msm: add MSM_BO_CACHED_COHERENT
Date:   Fri,  6 Nov 2020 11:34:30 -0500
Message-Id: <20201106163437.30836-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20201106163437.30836-1-jonathan@marek.ca>
References: <20201106163437.30836-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a new cache mode for creating coherent host-cached BOs.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
 drivers/gpu/drm/msm/msm_drv.h              | 1 +
 drivers/gpu/drm/msm/msm_gem.c              | 8 ++++++++
 include/uapi/drm/msm_drm.h                 | 5 ++---
 4 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 58e03b20e1c7..21c9bc954f38 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -410,6 +410,7 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 		config.rev.minor, config.rev.patchid);
 
 	priv->is_a2xx = config.rev.core == 2;
+	priv->has_cached_coherent = config.rev.core >= 6;
 
 	gpu = info->init(drm);
 	if (IS_ERR(gpu)) {
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index f33281ac7913..22ebecb28349 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -168,6 +168,7 @@ struct msm_drm_private {
 	struct msm_file_private *lastctx;
 	/* gpu is only set on open(), but we need this info earlier */
 	bool is_a2xx;
+	bool has_cached_coherent;
 
 	struct drm_fb_helper *fbdev;
 
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 04be4cfcccc1..3d8254b5de16 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -420,6 +420,9 @@ static int msm_gem_pin_iova(struct drm_gem_object *obj,
 	if (msm_obj->flags & MSM_BO_MAP_PRIV)
 		prot |= IOMMU_PRIV;
 
+	if (msm_obj->flags & MSM_BO_CACHED_COHERENT)
+		prot |= IOMMU_CACHE;
+
 	WARN_ON(!mutex_is_locked(&msm_obj->lock));
 
 	if (WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED))
@@ -1004,6 +1007,7 @@ static int msm_gem_new_impl(struct drm_device *dev,
 		uint32_t size, uint32_t flags,
 		struct drm_gem_object **obj)
 {
+	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_gem_object *msm_obj;
 
 	switch (flags & MSM_BO_CACHE_MASK) {
@@ -1011,6 +1015,10 @@ static int msm_gem_new_impl(struct drm_device *dev,
 	case MSM_BO_CACHED:
 	case MSM_BO_WC:
 		break;
+	case MSM_BO_CACHED_COHERENT:
+		if (priv->has_cached_coherent)
+			break;
+		/* fallthrough */
 	default:
 		DRM_DEV_ERROR(dev->dev, "invalid cache flag: %x\n",
 				(flags & MSM_BO_CACHE_MASK));
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index a6c1f3eb2623..474497e8743a 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -94,12 +94,11 @@ struct drm_msm_param {
 #define MSM_BO_CACHED        0x00010000
 #define MSM_BO_WC            0x00020000
 #define MSM_BO_UNCACHED      0x00040000
+#define MSM_BO_CACHED_COHERENT 0x080000
 
 #define MSM_BO_FLAGS         (MSM_BO_SCANOUT | \
                               MSM_BO_GPU_READONLY | \
-                              MSM_BO_CACHED | \
-                              MSM_BO_WC | \
-                              MSM_BO_UNCACHED)
+                              MSM_BO_CACHE_MASK)
 
 struct drm_msm_gem_new {
 	__u64 size;           /* in */
-- 
2.26.1

