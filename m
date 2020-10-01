Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D3CB27F6BA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Oct 2020 02:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731634AbgJAA2x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Sep 2020 20:28:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732123AbgJAA2v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Sep 2020 20:28:51 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C305BC0613D0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2020 17:28:51 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id z2so2934033qtv.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2020 17:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pWObr22ksvrhZ9O40b17Fzoa2hTSNXx9/SjTN9dVo8k=;
        b=yPNOx4GpQBiFPPh+PQdDvQWjS5Xz2iVEXS/BFhbrNYOuHP2QY3xw7QbruNjJZLDjeM
         ouFhttsr3QDwLIG3V/O6rmwdBXY03GT4Wxcnex65pVCB21YDO9o0MRqAJUBon8aCN1jI
         moZE26Gzled0QULso6fEHiKxMWdpnhxl3qhGXCiZtTtYkGTAJA30A9YxgHYAthQa5vC5
         1zsT80azDrfrk4mCG3IZWhrMZhiCqhQIl9n6vJIZsKCRFJujzCQRpqZDJShg3x7vIR/o
         MXHtfC7Xuv7rQOahaln6rZRdToz6gmRKXTN19/rlQoyRuMoV1EBi9lZtPwsYtHPfq1C3
         FGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pWObr22ksvrhZ9O40b17Fzoa2hTSNXx9/SjTN9dVo8k=;
        b=rVa+BPgHoEenGkqLSiDxO9oeKiqZ2PXZ6Ot6iCoV0r2z6xP9Jw8NVQG8zdZQZTIddK
         UsBmfT7TDniJeQOPaYHcdQg8QiEAlk0LtWBxA5qmHy5ot0N1CwY1btOMieeJmqtd6Ri6
         9gU7+Y6kEZL1EKKUhLNaQ/cN62AVRHRuQstQspvRLL/R4xRZnhZbuf1vKvuof1qim7iZ
         qSYow9efe00a58vmNqj/N8iI7Nw5NjpT60zj0L+8+rfzvwy3bescmOU8wQIuR5k/ZDTO
         51+TVuPvjVMe1qX09zfLOBiN8s/1ezUEXDVwZQynsH3TTIUZuBla21Vh/XfhmZN9PMfy
         8Mlg==
X-Gm-Message-State: AOAM530CClPRJECjCNrm63uWoLjUXUA+xYMrY3o6A6ztWZ6uMz/GMmeD
        S/AasXrB01ugwr4Bv3XK9tI2sQ==
X-Google-Smtp-Source: ABdhPJw1xbbmUE0uYgqAcoDIE0beNjdgLWS9VXi0OSqc4efGHwSsyirtn6p5iTR3hqYqwqkY0sdYfQ==
X-Received: by 2002:ac8:7b2b:: with SMTP id l11mr4900812qtu.126.1601512130987;
        Wed, 30 Sep 2020 17:28:50 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id 205sm3850908qki.118.2020.09.30.17.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 17:28:49 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sharat Masetty <smasetty@codeaurora.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/3] drm/msm: add MSM_BO_CACHED_COHERENT
Date:   Wed, 30 Sep 2020 20:27:04 -0400
Message-Id: <20201001002709.21361-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20201001002709.21361-1-jonathan@marek.ca>
References: <20201001002709.21361-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a new cache mode for creating coherent host-cached BOs.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
 drivers/gpu/drm/msm/msm_drv.h              | 1 +
 drivers/gpu/drm/msm/msm_gem.c              | 8 ++++++++
 include/uapi/drm/msm_drm.h                 | 5 ++---
 4 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 9eeb46bf2a5d..2aa707546254 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -410,6 +410,7 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 		config.rev.minor, config.rev.patchid);
 
 	priv->is_a2xx = config.rev.core == 2;
+	priv->has_cached_coherent = config.rev.core >= 6;
 
 	gpu = info->init(drm);
 	if (IS_ERR(gpu)) {
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 2c3225bc1794..6384844b1696 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -167,6 +167,7 @@ struct msm_drm_private {
 	struct msm_file_private *lastctx;
 	/* gpu is only set on open(), but we need this info earlier */
 	bool is_a2xx;
+	bool has_cached_coherent;
 
 	struct drm_fb_helper *fbdev;
 
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index b2f49152b4d4..ad9a627493ae 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -431,6 +431,9 @@ static int msm_gem_pin_iova(struct drm_gem_object *obj,
 	if (msm_obj->flags & MSM_BO_MAP_PRIV)
 		prot |= IOMMU_PRIV;
 
+	if (msm_obj->flags & MSM_BO_CACHED_COHERENT)
+		prot |= IOMMU_CACHE;
+
 	WARN_ON(!mutex_is_locked(&msm_obj->lock));
 
 	if (WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED))
@@ -998,6 +1001,7 @@ static int msm_gem_new_impl(struct drm_device *dev,
 		uint32_t size, uint32_t flags,
 		struct drm_gem_object **obj)
 {
+	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_gem_object *msm_obj;
 
 	switch (flags & MSM_BO_CACHE_MASK) {
@@ -1005,6 +1009,10 @@ static int msm_gem_new_impl(struct drm_device *dev,
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

