Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5249D397C89
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 00:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234960AbhFAWpp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Jun 2021 18:45:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235026AbhFAWpp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Jun 2021 18:45:45 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33843C061574;
        Tue,  1 Jun 2021 15:44:03 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id u7so86880plq.4;
        Tue, 01 Jun 2021 15:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ruRmdj//+BrtUTRZyXXenuD+b8S/L8NONyW8idiiQuk=;
        b=EMdwsZSTRmbdaAwgPzgcCQmbs8aE7i+XuElyCLMn7Y3TEBrqO4WCoforpWgxe5sYOc
         qJH2JxYYGFTrBkxOHGO6gL8TOH5F4Sw6C06mD9ti55vXyBOds2H94fL7MFUD+Tge34R6
         Hl4xDjls+z76bjFv+vUxfT1sPVPktD5HBR2iqa043g+WNlXVlWAIAq+0W6JQ4p0Bm5YF
         KKJPYu2AvB/rME7CgbXOCZXoaCa/Yf07Xq+yQXKQWooJGfm1JwOmcfw7yr5a9gX0kgpq
         w0dxWZi7gpnOODJXbuM07huSN3T58CMxeyKbtcxp2zt4Rr0s2WAgtxH4vQ4Eh/UVqCg3
         trYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ruRmdj//+BrtUTRZyXXenuD+b8S/L8NONyW8idiiQuk=;
        b=q+ADm2S8a448OQ2pCxBrRTznOK20w35TMZBiy69bvAzi33STcNDMt7D4FFqjLlnHW+
         0D9zNOB0A+bs4cgHWQ3u1SFZo/rYYtKkjoO86EtJvC/PI0FVo48t3PWr09PNZZ+vi3Zk
         GeybgekzWQAL6RFVzM1Crs/JZu+2+0nugFLK4Xiiyhq5ZqL0e4HguPg0Ho0ts01QVvip
         mPbX5LZGmQ5ewGi0UbuVliMer1YkSygfOzkBbMvMEnvqIvrX7xvch6Sq2S0bO+/FtLDQ
         j8mKAf0NQO3+1LVmbItXDoWBuL6J1WPw1pb14fGdOCK3RO7B5giPBfV9YDKCz1+d1oAP
         A/0w==
X-Gm-Message-State: AOAM533zxBPRI1Df2ayLREjVg/iV6ZWwUGFuEbfXm5pr5JmnRgBSAdEz
        e5ikCFEWMr5ODAFwlSNAy30nDARpvHyAFQkb
X-Google-Smtp-Source: ABdhPJzama51EHM7KJmYpli36U1M9on/EbL4S0v1Vrd108FTqsV+I102EzB5U7shLTuhaKrbTz1lqQ==
X-Received: by 2002:a17:90b:1211:: with SMTP id gl17mr2229702pjb.49.1622587442661;
        Tue, 01 Jun 2021 15:44:02 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id o11sm2969037pjk.30.2021.06.01.15.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 15:44:01 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Jordan Crouse <jordan@cosmicpenguin.net>,
        Rob Clark <robdclark@chromium.org>,
        Stephen Boyd <sboyd@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Stephen Boyd <swboyd@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Qinglang Miao <miaoqinglang@huawei.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lee Jones <lee.jones@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/dpu: Delete bonkers code
Date:   Tue,  1 Jun 2021 15:47:19 -0700
Message-Id: <20210601224750.513996-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210601224750.513996-1-robdclark@gmail.com>
References: <20210601224750.513996-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

dpu_crtc_atomic_flush() was directly poking it's attached planes in a
code path that ended up in dpu_plane_atomic_update(), even if the plane
was not involved in the current atomic update.  While a bit dubious,
this worked before because plane->state would always point to something
valid.  But now using drm_atomic_get_new_plane_state() we could get a
NULL state pointer instead, leading to:

   [   20.873273] Call trace:
   [   20.875740]  dpu_plane_atomic_update+0x5c/0xed0
   [   20.880311]  dpu_plane_restore+0x40/0x88
   [   20.884266]  dpu_crtc_atomic_flush+0xf4/0x208
   [   20.888660]  drm_atomic_helper_commit_planes+0x150/0x238
   [   20.894014]  msm_atomic_commit_tail+0x1d4/0x7a0
   [   20.898579]  commit_tail+0xa4/0x168
   [   20.902102]  drm_atomic_helper_commit+0x164/0x178
   [   20.906841]  drm_atomic_commit+0x54/0x60
   [   20.910798]  drm_atomic_connector_commit_dpms+0x10c/0x118
   [   20.916236]  drm_mode_obj_set_property_ioctl+0x1e4/0x440
   [   20.921588]  drm_connector_property_set_ioctl+0x60/0x88
   [   20.926852]  drm_ioctl_kernel+0xd0/0x120
   [   20.930807]  drm_ioctl+0x21c/0x478
   [   20.934235]  __arm64_sys_ioctl+0xa8/0xe0
   [   20.938193]  invoke_syscall+0x64/0x130
   [   20.941977]  el0_svc_common.constprop.3+0x5c/0xe0
   [   20.946716]  do_el0_svc+0x80/0xa0
   [   20.950058]  el0_svc+0x20/0x30
   [   20.953145]  el0_sync_handler+0x88/0xb0
   [   20.957014]  el0_sync+0x13c/0x140

The reason for the codepath seems dubious, the atomic suspend/resume
heplers should handle the power-collapse case.  If not, the CRTC's
atomic_check() should be adding the planes to the atomic update.

Reported-by: Stephen Boyd <sboyd@kernel.org>
Reported-by: John Stultz <john.stultz@linaro.org>
Fixes: 37418bf14c13 drm: Use state helper instead of the plane state pointer
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 10 ----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 16 ----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  6 ------
 3 files changed, 32 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 7c29976be243..18bc76b7f1a3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -648,16 +648,6 @@ static void dpu_crtc_atomic_flush(struct drm_crtc *crtc,
 	if (unlikely(!cstate->num_mixers))
 		return;
 
-	/*
-	 * For planes without commit update, drm framework will not add
-	 * those planes to current state since hardware update is not
-	 * required. However, if those planes were power collapsed since
-	 * last commit cycle, driver has to restore the hardware state
-	 * of those planes explicitly here prior to plane flush.
-	 */
-	drm_atomic_crtc_for_each_plane(plane, crtc)
-		dpu_plane_restore(plane, state);
-
 	/* update performance setting before crtc kickoff */
 	dpu_core_perf_crtc_update(crtc, 1, false);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index df7f3d3afd8b..7a993547eb75 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1258,22 +1258,6 @@ static void dpu_plane_atomic_update(struct drm_plane *plane,
 	}
 }
 
-void dpu_plane_restore(struct drm_plane *plane, struct drm_atomic_state *state)
-{
-	struct dpu_plane *pdpu;
-
-	if (!plane || !plane->state) {
-		DPU_ERROR("invalid plane\n");
-		return;
-	}
-
-	pdpu = to_dpu_plane(plane);
-
-	DPU_DEBUG_PLANE(pdpu, "\n");
-
-	dpu_plane_atomic_update(plane, state);
-}
-
 static void dpu_plane_destroy(struct drm_plane *plane)
 {
 	struct dpu_plane *pdpu = plane ? to_dpu_plane(plane) : NULL;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 03b6365a750c..34e03ac05f4a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -84,12 +84,6 @@ bool is_dpu_plane_virtual(struct drm_plane *plane);
 void dpu_plane_get_ctl_flush(struct drm_plane *plane, struct dpu_hw_ctl *ctl,
 		u32 *flush_sspp);
 
-/**
- * dpu_plane_restore - restore hw state if previously power collapsed
- * @plane: Pointer to drm plane structure
- */
-void dpu_plane_restore(struct drm_plane *plane, struct drm_atomic_state *state);
-
 /**
  * dpu_plane_flush - final plane operations before commit flush
  * @plane: Pointer to drm plane structure
-- 
2.30.2

