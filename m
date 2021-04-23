Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75D56369AC2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Apr 2021 21:12:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243839AbhDWTM5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Apr 2021 15:12:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243809AbhDWTM4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Apr 2021 15:12:56 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3716DC061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 12:12:19 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id s5so41908584qkj.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 12:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ISaGQqIyXJuhKuzVxpoTcs8C/mq7EiQzHJb8rdBgzn0=;
        b=ovPFosPvCHBDD1TWjcy6/UJR+yBG0R3HQfY1u1P/9v2GdJxMdB7rKLzZRXgc37jqCC
         GX9NnlpRE+U+iZroT3oqxnUtbJ/KuqDn/g0uil7jdJaPzw1uyMIK1Yw5TZJ75f//TTre
         bdQ5lmxcq6GEzes5votv+/bA0c0fpa2xud0wAG0+EwZaMxFGuThIVTZ4tSGntPTJ692s
         qQgp/TzV5TU849eCrsllgLmBk2f2wVfdPe0TL3DYbtWbXQX4A/LSilpt0Cpl9ACALf5B
         FSa7YOqw61D4lv1ehSvy8nid1FG761IpeXp4SzsDnYSzFyfSdtsiZ+R0HNsytE3XaUad
         VrYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ISaGQqIyXJuhKuzVxpoTcs8C/mq7EiQzHJb8rdBgzn0=;
        b=OkX4C3u1VbwwoUiIbUJ4QgTx1kv3xFYkbaUGXa96IjQyLph8zYA9p+RfGHZOF10XRY
         AzEzT1YydjIayb+dLEzbVSc7X+fCm8NukZkZIQ4Vi0XrJCaYQWg37ZXrddTJM/1qzh+1
         8uvWjLTdRLKIPntIMfMfXi/8P5yfCFkQHu27Ns3lpybkdsg+yy1/pmy4hdg01vCxX2At
         T+VBHHTZxIZn9MosAN6EL+hLGyEr81TLYVVh5KIDOYb5gDFmS7HN1EW6RQ/LWqnyjtxx
         Qtxf4ULVsT07R++64w3jG9z+sN1sMrL51Tc4EUbZ62Pt0g8Em4qu5DwNwX59ZCUHTq6T
         MGFA==
X-Gm-Message-State: AOAM533U/0Tsc2A+EotAuU1zYXLk0GDSxEpmyhdFGvbQq9YscQp6g/LK
        3WrfFmCpuAiZGrXcCWPFHVSwng==
X-Google-Smtp-Source: ABdhPJy63UlT2ZhqACWkfUUPk+162zeqT+nIscL8hbRkSSk/AyKazhBNgIonRwuDlSAd8gbKVPAnzg==
X-Received: by 2002:a05:620a:243:: with SMTP id q3mr5781843qkn.160.1619205138472;
        Fri, 23 Apr 2021 12:12:18 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id a22sm4834630qtp.80.2021.04.23.12.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 12:12:18 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 4/5] drm/msm: add MSM_BO_CACHED_COHERENT
Date:   Fri, 23 Apr 2021 15:08:20 -0400
Message-Id: <20210423190833.25319-5-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210423190833.25319-1-jonathan@marek.ca>
References: <20210423190833.25319-1-jonathan@marek.ca>
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
 drivers/gpu/drm/msm/msm_drv.c              | 3 ++-
 drivers/gpu/drm/msm/msm_drv.h              | 1 +
 drivers/gpu/drm/msm/msm_gem.c              | 8 ++++++++
 include/uapi/drm/msm_drm.h                 | 5 ++---
 5 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 9770fd81c614..155c10ffda6e 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -469,6 +469,7 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 		config.rev.minor, config.rev.patchid);
 
 	priv->is_a2xx = config.rev.core == 2;
+	priv->has_cached_coherent = config.rev.core >= 6;
 
 	gpu = info->init(drm);
 	if (IS_ERR(gpu)) {
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index a63e969e5efb..7576a987dccc 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -40,9 +40,10 @@
  * - 1.5.0 - Add SUBMITQUERY_QUERY ioctl
  * - 1.6.0 - Syncobj support
  * - 1.7.0 - Add MSM_PARAM_SUSPENDS to access suspend count
+ * - 1.8.0 - Add MSM_BO_CACHED_COHERENT for supported GPUs (a6xx)
  */
 #define MSM_VERSION_MAJOR	1
-#define MSM_VERSION_MINOR	7
+#define MSM_VERSION_MINOR	8
 #define MSM_VERSION_PATCHLEVEL	0
 
 static const struct drm_mode_config_funcs mode_config_funcs = {
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index ea78154c3c24..ffc9092b87b2 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -168,6 +168,7 @@ struct msm_drm_private {
 	struct msm_file_private *lastctx;
 	/* gpu is only set on open(), but we need this info earlier */
 	bool is_a2xx;
+	bool has_cached_coherent;
 
 	struct drm_fb_helper *fbdev;
 
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 0f58937be0a9..2e92e80009c8 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -433,6 +433,9 @@ static int msm_gem_pin_iova(struct drm_gem_object *obj,
 	if (msm_obj->flags & MSM_BO_MAP_PRIV)
 		prot |= IOMMU_PRIV;
 
+	if (msm_obj->flags & MSM_BO_CACHED_COHERENT)
+		prot |= IOMMU_CACHE;
+
 	GEM_WARN_ON(!msm_gem_is_locked(obj));
 
 	if (GEM_WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED))
@@ -1144,6 +1147,7 @@ static int msm_gem_new_impl(struct drm_device *dev,
 		uint32_t size, uint32_t flags,
 		struct drm_gem_object **obj)
 {
+	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_gem_object *msm_obj;
 
 	switch (flags & MSM_BO_CACHE_MASK) {
@@ -1151,6 +1155,10 @@ static int msm_gem_new_impl(struct drm_device *dev,
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
index 5596d7c37f9e..a92d90a6d96f 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -95,12 +95,11 @@ struct drm_msm_param {
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

