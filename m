Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AC21294519
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Oct 2020 00:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392105AbgJTWYc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Oct 2020 18:24:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390360AbgJTWYc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Oct 2020 18:24:32 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92DA8C0613CE;
        Tue, 20 Oct 2020 15:24:30 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id kk5so90256pjb.1;
        Tue, 20 Oct 2020 15:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OmjtnWyk38ZBX1D8MavpXL10VCl/FwBII1zAmAlKY9s=;
        b=Awop/oxHP1NDOcP0KnWp5FWHkrltx2DjbBqr7tobJcMxu4Ei7uqjExLbcyvm7SYfmD
         aTC06k45zMNEUfhCm2PQwnTAsv1vwHUXXzO5sYSFgyj00L1rnJB1dv9MQUUcMmlc94wB
         23UuqEnat7si/49sUfgx87zNuyahxeqf0gWGKX27jUpi0eDf2wj+eJWxv1W6O7qeji2N
         iy782NcFvHIrIR3HTQEXIr0RDMcFk+xzJt1oM599ZKmSniBgczX31zjhvC9itH9+imp4
         4Dz7so2eEpAvFfXxXVPWbn8aUJPALFL3sG8JebTcK4cIXCgdVCfnXYkUMG7elJqBd2pr
         axug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OmjtnWyk38ZBX1D8MavpXL10VCl/FwBII1zAmAlKY9s=;
        b=rM3ICxdaCUE8gILZw3EVpxgObrPJ0S7Ko1TuQOjM7E1FmRydq7WJiAJnUiNsSJ6H3G
         FxnIbyZuYwx3ZnRGRjYTERqXG6Tx1QkhJH4GvImMmUMcW6L8EYlEnJU831Y5MjwU11LX
         4CIhULfETG8gZ9OQ7rePSO9l3tf7a4RKbavIfw8KhfknTfzefLJZaaMHVdftKlEi/Oy/
         xap5YfYZbF8GCRYODK8pDskBn+KtTTm0aaw4gy0LjXMB3Dm7Qflh/iV26FsviaUOtZ6I
         lpXIW/gLIKBCZV5XdpBRUu4sXj718TKxtCa9VLV+pywAoGsHua9zTToDHalZpIeVgEe3
         MZyQ==
X-Gm-Message-State: AOAM531M9mJBWS2CWRb2zxzDcQgUfoiodO2FJRZo6Wq+2BM5oAIWcTIf
        Dh5SXgbmXHg5BFpWJE8K3u1iSk2VqJB6iw==
X-Google-Smtp-Source: ABdhPJxIXbNsMsSh0dWfqwmYT1q1f863Oej76OZAU7iVStwx6Wktb0HzU61GvcvkkulTBDT3epizqA==
X-Received: by 2002:a17:90a:6b0a:: with SMTP id v10mr237477pjj.141.1603232669947;
        Tue, 20 Oct 2020 15:24:29 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id c12sm147612pgd.57.2020.10.20.15.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 15:24:28 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/atomic: Drop per-CRTC locks in reverse order
Date:   Tue, 20 Oct 2020 15:26:00 -0700
Message-Id: <20201020222600.264876-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

lockdep dislikes seeing locks unwound in a non-nested fashion.

Fixes: 37c2016e3608 ("drm/msm: Fix race condition in msm driver with async layer updates")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_atomic.c |  2 +-
 drivers/gpu/drm/msm/msm_kms.h    |  4 ++++
 include/drm/drm_crtc.h           | 10 ++++++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index b03d6ab6b19b..6a326761dc4a 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -67,7 +67,7 @@ static void unlock_crtcs(struct msm_kms *kms, unsigned int crtc_mask)
 {
 	struct drm_crtc *crtc;
 
-	for_each_crtc_mask(kms->dev, crtc, crtc_mask)
+	for_each_crtc_mask_reverse(kms->dev, crtc, crtc_mask)
 		mutex_unlock(&kms->commit_lock[drm_crtc_index(crtc)]);
 }
 
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 8d3e626c9fee..d8151a89e163 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -211,4 +211,8 @@ int dpu_mdss_init(struct drm_device *dev);
 	drm_for_each_crtc(crtc, dev) \
 		for_each_if (drm_crtc_mask(crtc) & (crtc_mask))
 
+#define for_each_crtc_mask_reverse(dev, crtc, crtc_mask) \
+	drm_for_each_crtc_reverse(crtc, dev) \
+		for_each_if (drm_crtc_mask(crtc) & (crtc_mask))
+
 #endif /* __MSM_KMS_H__ */
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index dfdb04619b0d..25f5958f2882 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -1274,4 +1274,14 @@ static inline struct drm_crtc *drm_crtc_find(struct drm_device *dev,
 #define drm_for_each_crtc(crtc, dev) \
 	list_for_each_entry(crtc, &(dev)->mode_config.crtc_list, head)
 
+/**
+ * drm_for_each_crtc_reverse - iterate over all CRTCs in reverse order
+ * @crtc: a &struct drm_crtc as the loop cursor
+ * @dev: the &struct drm_device
+ *
+ * Iterate over all CRTCs of @dev.
+ */
+#define drm_for_each_crtc_reverse(crtc, dev) \
+	list_for_each_entry_reverse(crtc, &(dev)->mode_config.crtc_list, head)
+
 #endif /* __DRM_CRTC_H__ */
-- 
2.26.2

