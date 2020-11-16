Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECE4E2B4E6B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Nov 2020 18:49:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387929AbgKPRrF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 12:47:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733124AbgKPRrE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 12:47:04 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7F08C0613CF;
        Mon, 16 Nov 2020 09:47:04 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id i8so1124820pfk.10;
        Mon, 16 Nov 2020 09:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bcNKe/onX36d4xFW2lvtFrnwC6y2tKCelaaYJA86BPE=;
        b=qXgQ97Btq4MYpx4N4xkEyfDI60eUkY5lBRDKlfkSAnpcboIvF4ZtrOXruiCyX4JK8r
         JbK/Beia5e8ZiBYP3yzJyAmoGZSxCx5TOevJFOP7sN6cCYEf7ggvTi8ED1fBvpbh+zr4
         OaXNVsjhip9qktxBkFVI2yXsC0Jpl26ZqFOeA6xik8FmUgK0xRIbDSch/4/9UQ213P0h
         umCzjmn4mwdHwVsSEhWvCh9VCr5f02j+WSjYn33QmgQUlymSJkZJi9xIQ3XgeNHVWQXd
         4e4xoKXk+FluuZc9TY4ISATinZFzLNSCl65DtShmI6nCjnmOvbuMtPUD5V6dc4ugThTR
         tDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bcNKe/onX36d4xFW2lvtFrnwC6y2tKCelaaYJA86BPE=;
        b=JvoIslVY7wB4LDL3sCTT/HQVsUt2BizvNgmvPfMnPzCIfqlvGVuPLfOYNqC6zGStIj
         m7q707GLNYPwuP4b5ugjldQS0PTLveSSTRtu2+dQX02cqLaK2qLItvuqb8C1En8OXt4t
         bIbFRoadoKP4+MCcTBX4P5EHfzKv7k11R9mXe6+JQEXOZitYym7QsP8AgKpT/+Xyjdiz
         PbK6S4KWWhejAZA10oPJufypcdbiY3yzF7PM6xOK+sE2B/ZjNKfkrflonBo6q7tRJytm
         VrabTapKFvJxm4KCxA551Sh7iX+0YKOeqmhmTCDf2L7vQoM54lEYiJGKSEjlkn5QMQnf
         0IQw==
X-Gm-Message-State: AOAM533Vt9HWHJnDxbcZf/il/Z8DLkEHonvAiaVBTqFofbb04JVxazF3
        VVoEajTrm1ZX7U3QdNeUb80=
X-Google-Smtp-Source: ABdhPJzTgDwy8OTh1DnkmcbyfHpJ5Y/+F55k5USXK5SBh+oT0x34EyD0BNRM4vkHDniT0kdUW/xVoA==
X-Received: by 2002:a63:1d12:: with SMTP id d18mr314741pgd.314.1605548824454;
        Mon, 16 Nov 2020 09:47:04 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id b5sm18698502pfr.193.2020.11.16.09.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 09:47:03 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/3] drm/msm/shrinker: We can vmap shrink active_list too
Date:   Mon, 16 Nov 2020 09:48:50 -0800
Message-Id: <20201116174851.878426-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201116174851.878426-1-robdclark@gmail.com>
References: <20201116174851.878426-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Just because a obj is active, if the vmap_count is zero, we can still
tear down the vmap.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 47 +++++++++++++++++++-------
 1 file changed, 35 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 6f4b1355725f..9d51c1eb808d 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -6,6 +6,7 @@
 
 #include "msm_drv.h"
 #include "msm_gem.h"
+#include "msm_gpu.h"
 #include "msm_gpu_trace.h"
 
 static unsigned long
@@ -61,17 +62,19 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 	return freed;
 }
 
-static int
-msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
+/* since we don't know any better, lets bail after a few
+ * and if necessary the shrinker will be invoked again.
+ * Seems better than unmapping *everything*
+ */
+static const int vmap_shrink_limit = 15;
+
+static unsigned
+vmap_shrink(struct list_head *mm_list)
 {
-	struct msm_drm_private *priv =
-		container_of(nb, struct msm_drm_private, vmap_notifier);
 	struct msm_gem_object *msm_obj;
 	unsigned unmapped = 0;
 
-	mutex_lock(&priv->mm_lock);
-
-	list_for_each_entry(msm_obj, &priv->inactive_list, mm_list) {
+	list_for_each_entry(msm_obj, mm_list, mm_list) {
 		if (!msm_gem_trylock(&msm_obj->base))
 			continue;
 		if (is_vunmapable(msm_obj)) {
@@ -80,11 +83,31 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
 		}
 		msm_gem_unlock(&msm_obj->base);
 
-		/* since we don't know any better, lets bail after a few
-		 * and if necessary the shrinker will be invoked again.
-		 * Seems better than unmapping *everything*
-		 */
-		if (++unmapped >= 15)
+		if (++unmapped >= vmap_shrink_limit)
+			break;
+	}
+
+	return unmapped;
+}
+
+static int
+msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
+{
+	struct msm_drm_private *priv =
+		container_of(nb, struct msm_drm_private, vmap_notifier);
+	struct list_head *mm_lists[] = {
+		&priv->inactive_list,
+		priv->gpu ? &priv->gpu->active_list : NULL,
+		NULL,
+	};
+	unsigned idx, unmapped = 0;
+
+	mutex_lock(&priv->mm_lock);
+
+	for (idx = 0; mm_lists[idx]; idx++) {
+		unmapped += vmap_shrink(mm_lists[idx]);
+
+		if (unmapped >= vmap_shrink_limit)
 			break;
 	}
 
-- 
2.28.0

