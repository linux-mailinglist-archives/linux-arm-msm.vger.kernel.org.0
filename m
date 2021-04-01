Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82CA7350BE7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 03:25:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233286AbhDABYe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 21:24:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233028AbhDABYE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 21:24:04 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE3E9C061574;
        Wed, 31 Mar 2021 18:24:03 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id v23so152031ple.9;
        Wed, 31 Mar 2021 18:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zsCSqM7YP3RCVWsP5WM5Atj6TW8UyCzrw8pSRQkMoNc=;
        b=LMbTOJkEXOm6POeA3AvN2jWp+gm7OYjAEInVGJH/FBXpQgQexNOAfHPhPH1blrp+Hk
         QfxUXb88N0cw1YHrVpuNOlBjs2SQs4pfqX7CgsNyL9By5Yir/XkzzxoFPDLRzNQm9vXK
         G7MVU+v9lw15hwZfxLV87elkv2gpj0x9gDfnWfvf5F4/uRJw/U1dkjX19wm+/AXQlTnL
         wrj4qnT3SN83ShjI9YUEFf6qsgcElJh10iAodoEJZTbuRRBjrDvJUl/ihho7RDVa0uTx
         /R/efHGHsCCddrUS4tDSCMqDECdYvdrut1Z8vxKVtEV0ICXwwnnoijt7jWhtb2Fs/kW7
         z60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zsCSqM7YP3RCVWsP5WM5Atj6TW8UyCzrw8pSRQkMoNc=;
        b=ssx6aZSF1oji9opCRQin/IPHeZxzU5/HMo5Q+rgxUsd8WFg+BiE9pxQGcvRqAUkyjW
         3USiO3nknaMYVzm2Q/Mg3h9fJ+fYIchossL2T19t3eOnbW5MmRXTrQjD4yIAsxoJrDal
         wDDJsrV6dl3kKwBDzW1YSN1RAW2jlAbes3uVbMVf36aHfCEWh5zDNBuU/GP3ZNIi5dQv
         NSu8SHWr1sFXVR130uToKjbVMp1io1SppHnkEYjx+HX+l0AjYUFggH5dDtB+/F2pJZ6O
         0hH6tcDTvsG+T6/up7/CwAMiaQ7fUzWUDeYaqnmSLjnt3iVOc9GBEinSmFDBCFz8g0kG
         Y4FA==
X-Gm-Message-State: AOAM531i7a5Is2Wc11AW3G6zpnSsL4cD0d9uZGhtKT13gjMQqkXRUXSe
        6xYPx+4/We341OGgX7FJi7U=
X-Google-Smtp-Source: ABdhPJy+Ipg5FOivJlIvHzZ6cboe/AYEvu38Avnp5oGumsFN75ULhelm0LN9Knlc4dEZiTXcaaUkhg==
X-Received: by 2002:a17:90a:b293:: with SMTP id c19mr6227917pjr.193.1617240243491;
        Wed, 31 Mar 2021 18:24:03 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id y12sm3520619pfq.118.2021.03.31.18.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 18:24:02 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 4/4] drm/msm: Improved debugfs gem stats
Date:   Wed, 31 Mar 2021 18:27:21 -0700
Message-Id: <20210401012722.527712-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210401012722.527712-1-robdclark@gmail.com>
References: <20210331221630.488498-1-robdclark@gmail.com>
 <20210401012722.527712-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

The last patch lost the breakdown of active vs inactive GEM objects in
$debugfs/gem.  But we can add some better stats to summarize not just
active vs inactive, but also purgable/purged to make up for that.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/msm/msm_fb.c  |  3 ++-
 drivers/gpu/drm/msm/msm_gem.c | 31 ++++++++++++++++++++++++-------
 drivers/gpu/drm/msm/msm_gem.h | 11 ++++++++++-
 3 files changed, 36 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index d42f0665359a..91c0e493aed5 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -33,6 +33,7 @@ static const struct drm_framebuffer_funcs msm_framebuffer_funcs = {
 #ifdef CONFIG_DEBUG_FS
 void msm_framebuffer_describe(struct drm_framebuffer *fb, struct seq_file *m)
 {
+	struct msm_gem_stats stats = {};
 	int i, n = fb->format->num_planes;
 
 	seq_printf(m, "fb: %dx%d@%4.4s (%2d, ID:%d)\n",
@@ -42,7 +43,7 @@ void msm_framebuffer_describe(struct drm_framebuffer *fb, struct seq_file *m)
 	for (i = 0; i < n; i++) {
 		seq_printf(m, "   %d: offset=%d pitch=%d, obj: ",
 				i, fb->offsets[i], fb->pitches[i]);
-		msm_gem_describe(fb->obj[i], m);
+		msm_gem_describe(fb->obj[i], m, &stats);
 	}
 }
 #endif
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 7ca30e362222..2ecf7f1cef25 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -873,7 +873,8 @@ static void describe_fence(struct dma_fence *fence, const char *type,
 				fence->seqno);
 }
 
-void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
+void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
+		struct msm_gem_stats *stats)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct dma_resv *robj = obj->resv;
@@ -885,11 +886,23 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 
 	msm_gem_lock(obj);
 
+	stats->all.count++;
+	stats->all.size += obj->size;
+
+	if (is_active(msm_obj)) {
+		stats->active.count++;
+		stats->active.size += obj->size;
+	}
+
 	switch (msm_obj->madv) {
 	case __MSM_MADV_PURGED:
+		stats->purged.count++;
+		stats->purged.size += obj->size;
 		madv = " purged";
 		break;
 	case MSM_MADV_DONTNEED:
+		stats->purgable.count++;
+		stats->purgable.size += obj->size;
 		madv = " purgeable";
 		break;
 	case MSM_MADV_WILLNEED:
@@ -956,20 +969,24 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 
 void msm_gem_describe_objects(struct list_head *list, struct seq_file *m)
 {
+	struct msm_gem_stats stats = {};
 	struct msm_gem_object *msm_obj;
-	int count = 0;
-	size_t size = 0;
 
 	seq_puts(m, "   flags       id ref  offset   kaddr            size     madv      name\n");
 	list_for_each_entry(msm_obj, list, node) {
 		struct drm_gem_object *obj = &msm_obj->base;
 		seq_puts(m, "   ");
-		msm_gem_describe(obj, m);
-		count++;
-		size += obj->size;
+		msm_gem_describe(obj, m, &stats);
 	}
 
-	seq_printf(m, "Total %d objects, %zu bytes\n", count, size);
+	seq_printf(m, "Total:    %4d objects, %9zu bytes\n",
+			stats.all.count, stats.all.size);
+	seq_printf(m, "Active:   %4d objects, %9zu bytes\n",
+			stats.active.count, stats.active.size);
+	seq_printf(m, "Purgable: %4d objects, %9zu bytes\n",
+			stats.purgable.count, stats.purgable.size);
+	seq_printf(m, "Purged:   %4d objects, %9zu bytes\n",
+			stats.purged.count, stats.purged.size);
 }
 #endif
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index e6b28edb1db9..7c7d54bad189 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -158,7 +158,16 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 __printf(2, 3)
 void msm_gem_object_set_name(struct drm_gem_object *bo, const char *fmt, ...);
 #ifdef CONFIG_DEBUG_FS
-void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m);
+
+struct msm_gem_stats {
+	struct {
+		unsigned count;
+		size_t size;
+	} all, active, purgable, purged;
+};
+
+void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
+		struct msm_gem_stats *stats);
 void msm_gem_describe_objects(struct list_head *list, struct seq_file *m);
 #endif
 
-- 
2.30.2

