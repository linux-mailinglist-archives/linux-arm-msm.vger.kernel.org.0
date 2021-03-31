Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5708B350A08
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 00:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232763AbhCaWNk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 18:13:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232356AbhCaWNR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 18:13:17 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBE82C061574;
        Wed, 31 Mar 2021 15:13:16 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id x7-20020a17090a2b07b02900c0ea793940so1944368pjc.2;
        Wed, 31 Mar 2021 15:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r/twVewUEHRioHtwiz9JjKLdI4rytxuZV+JNSuxYf/A=;
        b=WwURcB28j30FEOBVX61hypudWbMEaSI0SPCjCFg3LEMQNSTJBpOJt0xXo9i7IJucYu
         uMr6ch5qdCs49e0SXlmOPiJkHgQV1lcWSvFjHLJC9xbb2yK0SFxwGtYdAlEzGRwwqt+L
         Slcj5HazN/XCIFbivaBdz3ahiYXcfM7VFod+nhVvf3CpzymOaEJoQbuAjESvyhx40vVX
         lC5opp8VoghrCd8/Mu5As/Lv6th9hRQjSxJMjv7fO1WGGciLzKiEg6fP3ZUj0XtjtcSG
         d4++1YQjxHvtXNaQpceIe+2dl2wyaEtMDMcM9UXesrTf50cIUPZXqOnhawQI3W4nNRbC
         g93Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r/twVewUEHRioHtwiz9JjKLdI4rytxuZV+JNSuxYf/A=;
        b=UiTlNCiVIPDLpuzodDVmwB/KG8qlsrtLi8fHwVkOfRbyGwlWKy7sr1YUhz/42ImgeA
         oY8Tlsmuths0tsl5fRxKh/vLwfvGpShy7K4jRTJCN4TTTK0auULAlIwuQ0ekTPziUG2w
         e/Z0Obc1VxX0ogGVAADheZicdJockQKg1bydXiv94FLHg2bFnf/sPwK50LXbWRPVGZko
         rjGQ4pt6upBusG9gKJZWyj5MCw5eIXH5wPC9lGM6J//GJm9RNnFbGRLs4GahtS3OyCWC
         GxHPbfC9Ba9XijG/WiyLDy1mlMN2ure9VthaKEnJEh/FL5TJTNLv+kOJNo3BpOSWqFzG
         LUYQ==
X-Gm-Message-State: AOAM533LwLWRm1klYMRL53WoAm3P+ddaUU+ABOCJR3suK9RFvyX/46kz
        7cN4tlagZT8kVV9rML0sikI=
X-Google-Smtp-Source: ABdhPJz7YvnCdiObstGy4frdYqsgQZf0N+9zQpN9bIuPBWCZbWrOD/8axN4t8KnNzU6hiZaBnEsRmQ==
X-Received: by 2002:a17:90b:4910:: with SMTP id kr16mr5481383pjb.26.1617228796563;
        Wed, 31 Mar 2021 15:13:16 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id c26sm3302052pfo.97.2021.03.31.15.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 15:13:15 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 4/4] drm/msm: Improved debugfs gem stats
Date:   Wed, 31 Mar 2021 15:16:29 -0700
Message-Id: <20210331221630.488498-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331221630.488498-1-robdclark@gmail.com>
References: <20210331221630.488498-1-robdclark@gmail.com>
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
---
 drivers/gpu/drm/msm/msm_fb.c  |  3 ++-
 drivers/gpu/drm/msm/msm_gem.c | 31 ++++++++++++++++++++++++-------
 drivers/gpu/drm/msm/msm_gem.h | 11 ++++++++++-
 3 files changed, 36 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index d42f0665359a..887172a10c9a 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -33,6 +33,7 @@ static const struct drm_framebuffer_funcs msm_framebuffer_funcs = {
 #ifdef CONFIG_DEBUG_FS
 void msm_framebuffer_describe(struct drm_framebuffer *fb, struct seq_file *m)
 {
+	struct msm_gem_stats stats = {{0}};
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
index c184ea68a6d0..a933ca5dc6df 100644
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
+	struct msm_gem_stats stats = {{0}};
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
index 49956196025e..43510ac070dd 100644
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

