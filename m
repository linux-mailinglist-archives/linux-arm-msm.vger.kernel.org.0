Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F8EB3E36B3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Aug 2021 20:34:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229995AbhHGSeU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Aug 2021 14:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbhHGSeS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Aug 2021 14:34:18 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE0AFC0613CF;
        Sat,  7 Aug 2021 11:34:00 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id m10-20020a17090a34cab0290176b52c60ddso23054807pjf.4;
        Sat, 07 Aug 2021 11:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aoP+p68TDzQ/y913MRdpJPhaI7fxLtI+TCimpBmC6mc=;
        b=jxoaJLEPG/GijQHscHZ1UO+GmjWNhZDYhZJ6tBqPxEyAWLCkgQAPARNKxaiJfAIbFN
         G3aJmExrlZMaCs0I4eqtToTAjMMmUyg4f2R60722tib4vTNV9LSOcBVSHrqHX78A6qXA
         /JBAnotNOQ/2WOuzi+xPlqhuCwuXWRwPTNRS0A18QPLsXmqSw96wsl14iBuDl6reBH8l
         6jruuBhoGWkcShSOMB8PCy9lxGv0peIVQe15DwtR4nbyU5t0qbSg6JhlX8jIDwhi7mtQ
         kpa8q240f16/D5G+udjMcj1z2ElrZanF6ZK0u1psQzxtmagxfm75LoD8PUzFdAd8Bbxi
         XkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aoP+p68TDzQ/y913MRdpJPhaI7fxLtI+TCimpBmC6mc=;
        b=IJfv7HoCWqMIzRWHHO3JpEJTQwFpTJc+lMwgFsiSctM1Eaz7TX6FJnTHPFo6KDcscA
         W+ALSBTHySY/kagbu7X5Yk2z0vsToeOkjwy4wCdYhuX8xHWCB6r8e2mDumTBDaeQ24c2
         gkSIcunFjMww8YEz/86saNlR9OA8Ba0QjY0AlQDSsutu8gUnaPnAWBL/VotEpLXO6rOe
         T/7GNwfFCFmwXo4KI6gyuWFJmZfw+ohVb0SwI7OEYOGTh5A/lx6PnD6EXos+W8eCsaFY
         OHANyjBsH0x51CDEFS1p/xf3tXj+QX+MO3uhbWWxabRyFog49oOmSdBqOh5Kektu4OEl
         7PGQ==
X-Gm-Message-State: AOAM533Vt/4a584lkjyAyGR5RcAxcCYOlvdooBBVmNV5qRpNv+kVGl5/
        fu8Wqr8iAx+xhb06EcMVSE0=
X-Google-Smtp-Source: ABdhPJy8umXGJYYa0wi8FlFkcBof1/15lSb7sFcNmVyHD1zyogTPX6X+34Tx4r2heDTK/LqUmCsAtQ==
X-Received: by 2002:a17:90a:d245:: with SMTP id o5mr27625669pjw.105.1628361240572;
        Sat, 07 Aug 2021 11:34:00 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id p2sm15213588pfn.141.2021.08.07.11.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Aug 2021 11:33:59 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= 
        <ckoenig.leichtzumerken@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 3/5] drm/atomic-helper: Set fence deadline for vblank
Date:   Sat,  7 Aug 2021 11:37:57 -0700
Message-Id: <20210807183804.459850-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210807183804.459850-1-robdclark@gmail.com>
References: <20210807183804.459850-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

For an atomic commit updating a single CRTC (ie. a pageflip) calculate
the next vblank time, and inform the fence(s) of that deadline.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 36 +++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index bc3487964fb5..7caa2c3cc304 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1406,6 +1406,40 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_enables);
 
+/*
+ * For atomic updates which touch just a single CRTC, calculate the time of the
+ * next vblank, and inform all the fences of the of the deadline.
+ */
+static void set_fence_deadline(struct drm_device *dev,
+			       struct drm_atomic_state *state)
+{
+	struct drm_crtc *crtc, *wait_crtc = NULL;
+	struct drm_crtc_state *new_crtc_state;
+	struct drm_plane *plane;
+	struct drm_plane_state *new_plane_state;
+	ktime_t vbltime;
+	int i;
+
+	for_each_new_crtc_in_state (state, crtc, new_crtc_state, i) {
+		if (wait_crtc)
+			return;
+		wait_crtc = crtc;
+	}
+
+	/* If no CRTCs updated, then nothing to do: */
+	if (!wait_crtc)
+		return;
+
+	if (drm_crtc_next_vblank_time(wait_crtc, &vbltime))
+		return;
+
+	for_each_new_plane_in_state (state, plane, new_plane_state, i) {
+		if (!new_plane_state->fence)
+			continue;
+		dma_fence_set_deadline(new_plane_state->fence, vbltime);
+	}
+}
+
 /**
  * drm_atomic_helper_wait_for_fences - wait for fences stashed in plane state
  * @dev: DRM device
@@ -1435,6 +1469,8 @@ int drm_atomic_helper_wait_for_fences(struct drm_device *dev,
 	struct drm_plane_state *new_plane_state;
 	int i, ret;
 
+	set_fence_deadline(dev, state);
+
 	for_each_new_plane_in_state(state, plane, new_plane_state, i) {
 		if (!new_plane_state->fence)
 			continue;
-- 
2.31.1

