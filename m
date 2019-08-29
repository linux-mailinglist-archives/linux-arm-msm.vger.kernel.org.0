Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 039BEA219E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2019 19:00:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbfH2RAg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Aug 2019 13:00:36 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:32999 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726739AbfH2RAf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Aug 2019 13:00:35 -0400
Received: by mail-pl1-f195.google.com with SMTP id go14so1860553plb.0;
        Thu, 29 Aug 2019 10:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uquriDyhlxAbnfKJvxkybcpJQRi8vxW4q+WdlTyFE5k=;
        b=LOe3bWaYxipP0kob30Z3s6pcPHxp5m6w+1yxtOKjg8E+DYQikwB4ca3BFfPWApA0DP
         1YFLQRvOClJmYuCNNtfNAHD/qZZmYHC/hftG2+rlLMQyxbzfAFc1YDoSLi2BZUhcUpp9
         ZIniDFHcqEtMpcSbgw+l9pqXYoMdkFXWn+Tvk579K4pD7RqKkYcU7FWjk5IgVLdPICjk
         8ClAIz5r0Mc8fi/13uTwlvJlJY9v/K1ZOXoaLJzoTd+kj+TD7NAOeNcIOjnp7yItUQXk
         hGHYZvWJCrJnDBn9vt8LrxzktAFDAYoVZVShSAF6mNqfLo/9X0/y/DcEDwD+wrOSkBuE
         T3dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uquriDyhlxAbnfKJvxkybcpJQRi8vxW4q+WdlTyFE5k=;
        b=Rq0R/tzEAMOQcl96w6VzoYSgQ+d5YA/kw9yHSkiKONSJqZQTUea+fzIN9iLbLZreHU
         b++Ri3njqC9xElKL/6Ard7btY/Mb1zh3+wL6I5P0UXdtcDjHv3G1AHYduzk9nliUw1VQ
         GPV6AWUC66V+NiUjE+XO+msireap6eu4eOd7mdQ9jjmPRoXkUDDX/NQLimBk5N6iN0+M
         OlOKiMa8cIeIER0DSBuFY9SFLKzMOtiNjIEBVUqUEgWlpO1aOXiOG4wgx+yjEX/ysEb7
         6unwMJGwlcR0idSr0VgVODBQW043bvE4qlnqy4Igv3wk642B0lBYtmHjVZVZSVRqDOxJ
         6SQQ==
X-Gm-Message-State: APjAAAUPw0cTAgkVOA2cyJYfEsxVuDBwO04VOa2t4Rmy1cJMe0MPePAY
        NBBiVoKNJWGylZ7oaRsvuLU=
X-Google-Smtp-Source: APXvYqxAnrLFeMGIhiWA91fkl659rsATQ7w8XzZTY6m4Q4ULVXZCUNKXQA3/x7uI/lZqlfwFoNjXOw==
X-Received: by 2002:a17:902:758a:: with SMTP id j10mr3328543pll.233.1567098034455;
        Thu, 29 Aug 2019 10:00:34 -0700 (PDT)
Received: from localhost ([100.118.89.196])
        by smtp.gmail.com with ESMTPSA id a12sm2868798pgv.48.2019.08.29.10.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 10:00:33 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Bruce Wang <bzwang@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Allison Randal <allison@lohutok.net>,
        Enrico Weigelt <info@metux.net>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Boris Brezillon <bbrezillon@kernel.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 05/10] drm/msm: convert kms->complete_commit() to crtc_mask
Date:   Thu, 29 Aug 2019 09:45:13 -0700
Message-Id: <20190829164601.11615-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829164601.11615-1-robdclark@gmail.com>
References: <20190829164601.11615-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Prep work for async commits, in which case this will be called after we
no longer have the atomic state object.

This drops some wait_for_vblanks(), but those should be unnecessary, as
we call this after waiting for flush to complete.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c |  7 +------
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h |  4 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 20 ++++----------------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  8 ++------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  4 +---
 drivers/gpu/drm/msm/msm_atomic.c         |  2 +-
 drivers/gpu/drm/msm/msm_kms.h            |  2 +-
 7 files changed, 11 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index e7354aef9805..31debd31ab8c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -389,13 +389,8 @@ static void dpu_crtc_frame_event_cb(void *data, u32 event)
 	kthread_queue_work(&priv->event_thread[crtc_id].worker, &fevent->work);
 }
 
-void dpu_crtc_complete_commit(struct drm_crtc *crtc,
-		struct drm_crtc_state *old_state)
+void dpu_crtc_complete_commit(struct drm_crtc *crtc)
 {
-	if (!crtc || !crtc->state) {
-		DPU_ERROR("invalid crtc\n");
-		return;
-	}
 	trace_dpu_crtc_complete_commit(DRMID(crtc));
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index 10f78459f6c2..5174e86124cc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -244,10 +244,8 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc);
 /**
  * dpu_crtc_complete_commit - callback signalling completion of current commit
  * @crtc: Pointer to drm crtc object
- * @old_state: Pointer to drm crtc old state object
  */
-void dpu_crtc_complete_commit(struct drm_crtc *crtc,
-		struct drm_crtc_state *old_state);
+void dpu_crtc_complete_commit(struct drm_crtc *crtc);
 
 /**
  * dpu_crtc_init - create a new crtc object
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index df421b986bc3..606815e50625 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -320,27 +320,15 @@ static void dpu_kms_commit(struct msm_kms *kms, struct drm_atomic_state *state)
 	}
 }
 
-static void dpu_kms_complete_commit(struct msm_kms *kms,
-		struct drm_atomic_state *old_state)
+static void dpu_kms_complete_commit(struct msm_kms *kms, unsigned crtc_mask)
 {
-	struct dpu_kms *dpu_kms;
-	struct msm_drm_private *priv;
+	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
 	struct drm_crtc *crtc;
-	struct drm_crtc_state *old_crtc_state;
-	int i;
-
-	if (!kms || !old_state)
-		return;
-	dpu_kms = to_dpu_kms(kms);
-
-	if (!dpu_kms->dev || !dpu_kms->dev->dev_private)
-		return;
-	priv = dpu_kms->dev->dev_private;
 
 	DPU_ATRACE_BEGIN("kms_complete_commit");
 
-	for_each_old_crtc_in_state(old_state, crtc, old_crtc_state, i)
-		dpu_crtc_complete_commit(crtc, old_crtc_state);
+	for_each_crtc_mask(dpu_kms->dev, crtc, crtc_mask)
+		dpu_crtc_complete_commit(crtc);
 
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 32dcb1d7860c..a6a056df5878 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -116,17 +116,13 @@ static void mdp4_wait_flush(struct msm_kms *kms, unsigned crtc_mask)
 		mdp4_crtc_wait_for_commit_done(crtc);
 }
 
-static void mdp4_complete_commit(struct msm_kms *kms, struct drm_atomic_state *state)
+static void mdp4_complete_commit(struct msm_kms *kms, unsigned crtc_mask)
 {
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
-	int i;
 	struct drm_crtc *crtc;
-	struct drm_crtc_state *crtc_state;
-
-	drm_atomic_helper_wait_for_vblanks(mdp4_kms->dev, state);
 
 	/* see 119ecb7fd */
-	for_each_new_crtc_in_state(state, crtc, crtc_state, i)
+	for_each_crtc_mask(mdp4_kms->dev, crtc, crtc_mask)
 		drm_crtc_vblank_put(crtc);
 
 	mdp4_disable(mdp4_kms);
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 440e000c8c3d..7a19526eef50 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -163,14 +163,12 @@ static void mdp5_wait_flush(struct msm_kms *kms, unsigned crtc_mask)
 		mdp5_crtc_wait_for_commit_done(crtc);
 }
 
-static void mdp5_complete_commit(struct msm_kms *kms, struct drm_atomic_state *state)
+static void mdp5_complete_commit(struct msm_kms *kms, unsigned crtc_mask)
 {
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
 	struct device *dev = &mdp5_kms->pdev->dev;
 	struct mdp5_global_state *global_state;
 
-	drm_atomic_helper_wait_for_vblanks(mdp5_kms->dev, state);
-
 	global_state = mdp5_get_existing_global_state(mdp5_kms);
 
 	if (mdp5_kms->smp)
diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index 4ca4b654c221..bdcc92fbacb3 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -66,7 +66,7 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 	}
 
 	kms->funcs->wait_flush(kms, crtc_mask);
-	kms->funcs->complete_commit(kms, state);
+	kms->funcs->complete_commit(kms, crtc_mask);
 
 	drm_atomic_helper_commit_hw_done(state);
 
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index a112dfb36301..10dd171b43f8 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -33,7 +33,7 @@ struct msm_kms_funcs {
 	/* modeset, bracketing atomic_commit(): */
 	void (*prepare_commit)(struct msm_kms *kms, struct drm_atomic_state *state);
 	void (*commit)(struct msm_kms *kms, struct drm_atomic_state *state);
-	void (*complete_commit)(struct msm_kms *kms, struct drm_atomic_state *state);
+	void (*complete_commit)(struct msm_kms *kms, unsigned crtc_mask);
 	void (*wait_flush)(struct msm_kms *kms, unsigned crtc_mask);
 
 	/* get msm_format w/ optional format modifiers from drm_mode_fb_cmd2 */
-- 
2.21.0

