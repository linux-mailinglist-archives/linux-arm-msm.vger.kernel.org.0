Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 635632B3033
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Nov 2020 20:30:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbgKNT2g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 Nov 2020 14:28:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbgKNT2g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 Nov 2020 14:28:36 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06944C0613D1;
        Sat, 14 Nov 2020 11:28:36 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id s2so6115917plr.9;
        Sat, 14 Nov 2020 11:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bcNKe/onX36d4xFW2lvtFrnwC6y2tKCelaaYJA86BPE=;
        b=QqrU7Ij6kSjnsIh5ItWBED4TTHyJ4JAZb+100DLqno8upamEKgWNPOpRGmsVESkFgp
         wDBx2Qm6pssgIZTpQE5ml4GD1Bo4ZDorIFsLve24/S2IwJFjne27mpWBkSMSGA6B2oa0
         +EbZMXc3IX2jEgZ62D3vYKOFFIxO0onLaRKXDemrCFLHqWvXnIT5Dc4Cs/X42W5K68B8
         sR2CEL6iWCwD7Kb+D+0lbtYFDbGaJpBRTcZ+iXSJv3gmF5SGzbMrBb1CTRg3XvfDXB+A
         8vPmxDv2bHIlQS3eYw++W6SAapW5tImKqaM6TwQqJuZX1Spz05+VpP+DDOzAZ2zGthR+
         kbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bcNKe/onX36d4xFW2lvtFrnwC6y2tKCelaaYJA86BPE=;
        b=T6s1ujHG9dco52WsTYElzXr5ohDligCBwgzfohFVoLgZ4/eqZrVD5aszwVqXD7JHjg
         XSbwu4cw2+tBK+YZicHOS7J5AYimhlJvDWInDKoJz95wRSjZMNWiqotgcLPC8zWk6tey
         F/FeriQL5d1z9m0x5az8JMKPGbIYsQTOCWyus1nIHg6y3VrR7te+qvfNC9bkqlN/ZxZg
         5aBC+RmnkGtyX0gttgqNKX31DDNYx7tW9PlmLQBdK9w1tG2duRlPYFDiX7V74uOQvv8E
         1AAim7B7s5QRlyniybrPPLf7kDRWqTcBOpBgKECcqtDhKoZ46bXWNfAv+AgSF7jDBWqQ
         Atvg==
X-Gm-Message-State: AOAM532hB7fEp8sQRyBO4+SyFmqmW8zfo9OWuvBIZIvqYqgR9b4ZqcoS
        3UeKeGy066dLVV5j00OrMg9j2ypHBx0=
X-Google-Smtp-Source: ABdhPJzjHnH7nVWrBTKR9amjLPHBqTLTlwz9oXNlwf7v7SnZ+SQZxsWKqtf5m2Xz3zMFsbC4IS8iZw==
X-Received: by 2002:a17:90a:7343:: with SMTP id j3mr6839137pjs.51.1605382115491;
        Sat, 14 Nov 2020 11:28:35 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id 3sm13415786pfv.92.2020.11.14.11.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 11:28:34 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/3] drm/msm/shrinker: We can vmap shrink active_list too
Date:   Sat, 14 Nov 2020 11:30:09 -0800
Message-Id: <20201114193010.753355-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201114193010.753355-1-robdclark@gmail.com>
References: <20201114193010.753355-1-robdclark@gmail.com>
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

