Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 366CC35463F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Apr 2021 19:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239291AbhDERmj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 13:42:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239474AbhDERm3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 13:42:29 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93B3DC061794;
        Mon,  5 Apr 2021 10:42:21 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id y32so5382693pga.11;
        Mon, 05 Apr 2021 10:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7MWEztFYREaj4EaJg4EzCQLWGTSCEwCslvK3LYOeVzE=;
        b=HRjGZS1QILkvNMmvQmZn3S40Na/kBwIbA6WVXDpnPh/VerF7PjPRJvpl7/XN6W4A6M
         a6HWcvDmChgM4WL36FgQdBqTKbrpTyboqYE4Xmyqz2Pn6p/U2nwbYpYx4imr9/9Vt9Jo
         zGbSNQyGZlO4ootd5yQAv1i/dW4Z6+ljPnr9sODOK3Mw/0gywldqHIhPcpIMg74ctZA5
         SMR/IzvOskt2Jmcru/JsesJCc+kr7QGaxjRDXPGDMqcdYYygeTWfjbQtl/44xeaUv4mr
         yPI8790q3HzS5SHk29h+3MdFMPyGngH1C+67AN53DJzLb9x14igyzbSZX+k6UQ+hRhbT
         Ha5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7MWEztFYREaj4EaJg4EzCQLWGTSCEwCslvK3LYOeVzE=;
        b=b4bMdsSG+eC8VugbmpFuD8xaOi18ngLRVEK2oryn2qKS/gYzs2AgxVQyTMjHfjChwx
         dTYbg2JUw3wNgFh1OKti09S7qhrFqttQapqWXnS9/qUWzQDNzklLUYH7/D+/1Yv8ldiu
         L7BOm24fXveO0kxvwP/Bu77UlwboDDhJS0DrkCgRSUsVtyrdXRsd5jlkjhVKcqFCwmH6
         djyI2fMfZYIJs7gY7sA/ooDHmycXY1Z9IkLJ8wgs59sZkUQkqYEHZ7DBM+JAE1opR2XO
         tqyKQY9VPbIFrZJXMofEK9ff7BOW+PUxsdqKj4KUGfcZz/4IA71AbZNEBe52IIxDR3E6
         WRrQ==
X-Gm-Message-State: AOAM532Fnm+tHtZvsFIW0z/tB05MZhsC8ANd35d7YmwtqklFdpkehBqg
        0bS3hIgtYezfZvTAAsO88G8=
X-Google-Smtp-Source: ABdhPJxibT+j7asrrFr4/LyBfYOx3cjIw334LA6mEIfzkJ/SSj8fWZ8XoVuGuulT8c8TGoH9q2eLPg==
X-Received: by 2002:a65:68d3:: with SMTP id k19mr23989185pgt.44.1617644541208;
        Mon, 05 Apr 2021 10:42:21 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id b7sm2441194pgs.62.2021.04.05.10.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 10:42:19 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Jordan Crouse <jordan@cosmicpenguin.net>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 8/8] drm/msm: Support evicting GEM objects to swap
Date:   Mon,  5 Apr 2021 10:45:31 -0700
Message-Id: <20210405174532.1441497-9-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405174532.1441497-1-robdclark@gmail.com>
References: <20210405174532.1441497-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Now that tracking is wired up for potentially evictable GEM objects,
wire up shrinker and the remaining GEM bits for unpinning backing pages
of inactive objects.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c          | 23 ++++++++++++++++
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 37 +++++++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_gpu_trace.h    | 13 +++++++++
 3 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 163a1d30b5c9..2b731cf42294 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -759,6 +759,29 @@ void msm_gem_purge(struct drm_gem_object *obj)
 			0, (loff_t)-1);
 }
 
+/**
+ * Unpin the backing pages and make them available to be swapped out.
+ */
+void msm_gem_evict(struct drm_gem_object *obj)
+{
+	struct drm_device *dev = obj->dev;
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+
+	GEM_WARN_ON(!msm_gem_is_locked(obj));
+	GEM_WARN_ON(is_unevictable(msm_obj));
+	GEM_WARN_ON(!msm_obj->evictable);
+	GEM_WARN_ON(msm_obj->active_count);
+
+	/* Get rid of any iommu mapping(s): */
+	put_iova_spaces(obj, false);
+
+	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
+
+	put_pages(obj);
+
+	update_inactive(msm_obj);
+}
+
 void msm_gem_vunmap(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 38bf919f8508..52828028b9d4 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -9,12 +9,26 @@
 #include "msm_gpu.h"
 #include "msm_gpu_trace.h"
 
+bool enable_swap = true;
+MODULE_PARM_DESC(enable_swap, "Enable swappable GEM buffers");
+module_param(enable_swap, bool, 0600);
+
+static bool can_swap(void)
+{
+	return enable_swap && get_nr_swap_pages() > 0;
+}
+
 static unsigned long
 msm_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 {
 	struct msm_drm_private *priv =
 		container_of(shrinker, struct msm_drm_private, shrinker);
-	return priv->shrinkable_count;
+	unsigned count = priv->shrinkable_count;
+
+	if (can_swap())
+		count += priv->evictable_count;
+
+	return count;
 }
 
 static bool
@@ -32,6 +46,17 @@ purge(struct msm_gem_object *msm_obj)
 	return true;
 }
 
+static bool
+evict(struct msm_gem_object *msm_obj)
+{
+	if (is_unevictable(msm_obj))
+		return false;
+
+	msm_gem_evict(&msm_obj->base);
+
+	return true;
+}
+
 static unsigned long
 scan(struct msm_drm_private *priv, unsigned nr_to_scan, struct list_head *list,
 		bool (*shrink)(struct msm_gem_object *msm_obj))
@@ -104,6 +129,16 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 	if (freed > 0)
 		trace_msm_gem_purge(freed << PAGE_SHIFT);
 
+	if (can_swap() && freed < sc->nr_to_scan) {
+		int evicted = scan(priv, sc->nr_to_scan - freed,
+				&priv->inactive_willneed, evict);
+
+		if (evicted > 0)
+			trace_msm_gem_evict(evicted << PAGE_SHIFT);
+
+		freed += evicted;
+	}
+
 	return (freed > 0) ? freed : SHRINK_STOP;
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gpu_trace.h b/drivers/gpu/drm/msm/msm_gpu_trace.h
index 03e0c2536b94..ca0b08d7875b 100644
--- a/drivers/gpu/drm/msm/msm_gpu_trace.h
+++ b/drivers/gpu/drm/msm/msm_gpu_trace.h
@@ -128,6 +128,19 @@ TRACE_EVENT(msm_gem_purge,
 );
 
 
+TRACE_EVENT(msm_gem_evict,
+		TP_PROTO(u32 bytes),
+		TP_ARGS(bytes),
+		TP_STRUCT__entry(
+			__field(u32, bytes)
+			),
+		TP_fast_assign(
+			__entry->bytes = bytes;
+			),
+		TP_printk("Evicting %u bytes", __entry->bytes)
+);
+
+
 TRACE_EVENT(msm_gem_purge_vmaps,
 		TP_PROTO(u32 unmapped),
 		TP_ARGS(unmapped),
-- 
2.30.2

