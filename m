Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6001F3FE1A2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Sep 2021 20:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235904AbhIASB7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Sep 2021 14:01:59 -0400
Received: from rosenzweig.io ([138.197.143.207]:45308 "EHLO rosenzweig.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229560AbhIASB6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Sep 2021 14:01:58 -0400
X-Greylist: delayed 352 seconds by postgrey-1.27 at vger.kernel.org; Wed, 01 Sep 2021 14:01:58 EDT
From:   Alyssa Rosenzweig <alyssa@rosenzweig.io>
To:     dri-devel@lists.freedesktop.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Sandy Huang <hjc@rock-chips.com>,
        =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 3/5] drm/msm: Use common drm_fixed_16_16 helper
Date:   Wed,  1 Sep 2021 13:54:29 -0400
Message-Id: <20210901175431.14060-3-alyssa@rosenzweig.io>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210901175431.14060-1-alyssa@rosenzweig.io>
References: <20210901175431.14060-1-alyssa@rosenzweig.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Replace our open-coded FRAC_16_16 with the common drm_fixed_16_16
helper to reduce code duplication between drivers.

Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: linux-arm-msm@vger.kernel.org
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c  | 2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 8 ++++----
 drivers/gpu/drm/msm/msm_drv.h              | 3 +--
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index c989621209aa..fc9a9f544110 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -964,7 +964,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		crtc_state = drm_atomic_get_new_crtc_state(state,
 							   new_plane_state->crtc);
 
-	min_scale = FRAC_16_16(1, pdpu->pipe_sblk->maxupscale);
+	min_scale = drm_fixed_16_16(1, pdpu->pipe_sblk->maxupscale);
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  min_scale,
 						  pdpu->pipe_sblk->maxdwnscale << 16,
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index c6b69afcbac8..079b0662ee3c 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -199,8 +199,8 @@ static int mdp5_plane_atomic_check_with_state(struct drm_crtc_state *crtc_state,
 		return -ERANGE;
 	}
 
-	min_scale = FRAC_16_16(1, 8);
-	max_scale = FRAC_16_16(8, 1);
+	min_scale = drm_fixed_16_16(1, 8);
+	max_scale = drm_fixed_16_16(8, 1);
 
 	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
 						  min_scale, max_scale,
@@ -381,8 +381,8 @@ static int mdp5_plane_atomic_async_check(struct drm_plane *plane,
 	    plane->state->fb != new_plane_state->fb)
 		return -EINVAL;
 
-	min_scale = FRAC_16_16(1, 8);
-	max_scale = FRAC_16_16(8, 1);
+	min_scale = drm_fixed_16_16(1, 8);
+	max_scale = drm_fixed_16_16(8, 1);
 
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  min_scale, max_scale,
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 8b005d1ac899..b5aa94024a42 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -32,6 +32,7 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/msm_drm.h>
 #include <drm/drm_gem.h>
+#include <drm/drm_fixed.h>
 
 struct msm_kms;
 struct msm_gpu;
@@ -51,8 +52,6 @@ struct msm_disp_state;
 #define MAX_BRIDGES    8
 #define MAX_CONNECTORS 8
 
-#define FRAC_16_16(mult, div)    (((mult) << 16) / (div))
-
 struct msm_file_private {
 	rwlock_t queuelock;
 	struct list_head submitqueues;
-- 
2.30.2

