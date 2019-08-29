Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60CBEA21BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2019 19:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727234AbfH2RFN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Aug 2019 13:05:13 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39083 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727228AbfH2RFN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Aug 2019 13:05:13 -0400
Received: by mail-pl1-f194.google.com with SMTP id az1so886374plb.6;
        Thu, 29 Aug 2019 10:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KJ+Zzzg/BT0Z4lV6XBFZyA4SVr6nD/S4Ykc58u7f1HY=;
        b=hoiRwzhZ8yC0glRsYx8OKA2D7gniJCvUn4uSTYh7dXZmTRSX1O5R+RM9FOSm8k5JRK
         3MUyLjj4Q/AKY65B6cg5Wkq3OwxTpyTPNmK7AirQMYo9ruQOrRz+UcRHGuIGq2Xac6Pk
         H3lkqLB0jU5vZIpMpvWQ4atJVxUJ4M1hwv4Nq5p9U7IH6oaxclRg51C3QMCqvEr36kv0
         OZLstlIToyrnj0Tc96we/AQyfAUMZSy+56GQZRVSLTEho37U4OQOt4Ssnbe/LnCKHu+W
         ahiJ0nantpBs5S7pdkeJbTJmvENVEgDmqQ7B+KSx3j4IPts6HQwAB2yif0fwDsu+ydUa
         +YCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KJ+Zzzg/BT0Z4lV6XBFZyA4SVr6nD/S4Ykc58u7f1HY=;
        b=Hl3yhrMthXWIQTWNv1BSr6pvoTFBALu+HIZcbyBSIXAwJ6tjojXAyf4HZWJCwXT0zD
         FO4CsEKJ2QqCBbHKuFOGd/6oE0f0e5L2vbXGzVLq039OVaeqhRGcwROUYoeJLiJidkdM
         ImU8oQ1fQF3KKgRR4E4oOd40nsX+y7y5dyggxKmMwbg1cGR3v8jKsWdaUGbf8oqwOeIq
         7Z3XALB5qhT+qxQbWtpfR8U+ozS5YuXV7keXoD2pgOnXrM346sYZ/VHKqdox2o/EucVe
         wy1qqiNuN++5/gVKDQbwHz1LKWdX6YIujjKwOKeGEwQmfdqPXerqKHPQGDiEQtVKzDJL
         G+rw==
X-Gm-Message-State: APjAAAU1NwPMjUpCGdbxjvR7JeI5maiXpeXeeM7EOTjFw5nyad0gupT7
        OaR4O88avCUrvvwdyRS+TWA=
X-Google-Smtp-Source: APXvYqy0HUMQ/lLIBtRpsPb4C06Vll/9gXsYNofBL7JlC0ryq2z4f+molXGpG1T9pmUwR2ZqVFh/aw==
X-Received: by 2002:a17:902:a50a:: with SMTP id s10mr10968754plq.108.1567098312291;
        Thu, 29 Aug 2019 10:05:12 -0700 (PDT)
Received: from localhost ([100.118.89.196])
        by smtp.gmail.com with ESMTPSA id b30sm7682430pfr.117.2019.08.29.10.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 10:05:11 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Bruce Wang <bzwang@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 07/10] drm/msm: split power control from prepare/complete_commit
Date:   Thu, 29 Aug 2019 09:45:15 -0700
Message-Id: <20190829164601.11615-8-robdclark@gmail.com>
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

With atomic commit, ->prepare_commit() and ->complete_commit() may not
be evenly balanced (although ->complete_commit() will complete each
crtc that had been previously prepared).  So these will no longer be
a good place to enable/disable clocks needed for hw access.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 17 ++++++++++++++---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 19 ++++++++++++++-----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 20 ++++++++++++++------
 drivers/gpu/drm/msm/msm_atomic.c         |  2 ++
 drivers/gpu/drm/msm/msm_kms.h            | 10 ++++++++++
 5 files changed, 54 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index efbf8fd343de..d54741f3ad9f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -248,6 +248,18 @@ static void dpu_kms_disable_vblank(struct msm_kms *kms, struct drm_crtc *crtc)
 	dpu_crtc_vblank(crtc, false);
 }
 
+static void dpu_kms_enable_commit(struct msm_kms *kms)
+{
+	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
+	pm_runtime_get_sync(&dpu_kms->pdev->dev);
+}
+
+static void dpu_kms_disable_commit(struct msm_kms *kms)
+{
+	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
+	pm_runtime_put_sync(&dpu_kms->pdev->dev);
+}
+
 static void dpu_kms_prepare_commit(struct msm_kms *kms,
 		struct drm_atomic_state *state)
 {
@@ -267,7 +279,6 @@ static void dpu_kms_prepare_commit(struct msm_kms *kms,
 	if (!dev || !dev->dev_private)
 		return;
 	priv = dev->dev_private;
-	pm_runtime_get_sync(&dpu_kms->pdev->dev);
 
 	/* Call prepare_commit for all affected encoders */
 	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
@@ -335,8 +346,6 @@ static void dpu_kms_complete_commit(struct msm_kms *kms, unsigned crtc_mask)
 	for_each_crtc_mask(dpu_kms->dev, crtc, crtc_mask)
 		dpu_crtc_complete_commit(crtc);
 
-	pm_runtime_put_sync(&dpu_kms->pdev->dev);
-
 	DPU_ATRACE_END("kms_complete_commit");
 }
 
@@ -682,6 +691,8 @@ static const struct msm_kms_funcs kms_funcs = {
 	.irq_preinstall  = dpu_irq_preinstall,
 	.irq_uninstall   = dpu_irq_uninstall,
 	.irq             = dpu_irq,
+	.enable_commit   = dpu_kms_enable_commit,
+	.disable_commit  = dpu_kms_disable_commit,
 	.prepare_commit  = dpu_kms_prepare_commit,
 	.flush_commit    = dpu_kms_flush_commit,
 	.commit          = dpu_kms_commit,
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 78ce2c8a9a38..500e5b08c11f 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -93,15 +93,24 @@ static int mdp4_hw_init(struct msm_kms *kms)
 	return ret;
 }
 
-static void mdp4_prepare_commit(struct msm_kms *kms, struct drm_atomic_state *state)
+static void mdp4_enable_commit(struct msm_kms *kms)
+{
+	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
+	mdp4_enable(mdp4_kms);
+}
+
+static void mdp4_disable_commit(struct msm_kms *kms)
 {
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
+	mdp4_disable(mdp4_kms);
+}
+
+static void mdp4_prepare_commit(struct msm_kms *kms, struct drm_atomic_state *state)
+{
 	int i;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *crtc_state;
 
-	mdp4_enable(mdp4_kms);
-
 	/* see 119ecb7fd */
 	for_each_new_crtc_in_state(state, crtc, crtc_state, i)
 		drm_crtc_vblank_get(crtc);
@@ -129,8 +138,6 @@ static void mdp4_complete_commit(struct msm_kms *kms, unsigned crtc_mask)
 	/* see 119ecb7fd */
 	for_each_crtc_mask(mdp4_kms->dev, crtc, crtc_mask)
 		drm_crtc_vblank_put(crtc);
-
-	mdp4_disable(mdp4_kms);
 }
 
 static long mdp4_round_pixclk(struct msm_kms *kms, unsigned long rate,
@@ -182,6 +189,8 @@ static const struct mdp_kms_funcs kms_funcs = {
 		.irq             = mdp4_irq,
 		.enable_vblank   = mdp4_enable_vblank,
 		.disable_vblank  = mdp4_disable_vblank,
+		.enable_commit   = mdp4_enable_commit,
+		.disable_commit  = mdp4_disable_commit,
 		.prepare_commit  = mdp4_prepare_commit,
 		.flush_commit    = mdp4_flush_commit,
 		.wait_flush      = mdp4_wait_flush,
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index eff1b000258e..ba67bde1dbef 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -140,16 +140,25 @@ static int mdp5_global_obj_init(struct mdp5_kms *mdp5_kms)
 	return 0;
 }
 
+static void mdp5_enable_commit(struct msm_kms *kms)
+{
+	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
+	pm_runtime_get_sync(&mdp5_kms->pdev->dev);
+}
+
+static void mdp5_disable_commit(struct msm_kms *kms)
+{
+	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
+	pm_runtime_put_sync(&mdp5_kms->pdev->dev);
+}
+
 static void mdp5_prepare_commit(struct msm_kms *kms, struct drm_atomic_state *state)
 {
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
-	struct device *dev = &mdp5_kms->pdev->dev;
 	struct mdp5_global_state *global_state;
 
 	global_state = mdp5_get_existing_global_state(mdp5_kms);
 
-	pm_runtime_get_sync(dev);
-
 	if (mdp5_kms->smp)
 		mdp5_smp_prepare_commit(mdp5_kms->smp, &global_state->smp);
 }
@@ -171,15 +180,12 @@ static void mdp5_wait_flush(struct msm_kms *kms, unsigned crtc_mask)
 static void mdp5_complete_commit(struct msm_kms *kms, unsigned crtc_mask)
 {
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
-	struct device *dev = &mdp5_kms->pdev->dev;
 	struct mdp5_global_state *global_state;
 
 	global_state = mdp5_get_existing_global_state(mdp5_kms);
 
 	if (mdp5_kms->smp)
 		mdp5_smp_complete_commit(mdp5_kms->smp, &global_state->smp);
-
-	pm_runtime_put_sync(dev);
 }
 
 static long mdp5_round_pixclk(struct msm_kms *kms, unsigned long rate,
@@ -278,6 +284,8 @@ static const struct mdp_kms_funcs kms_funcs = {
 		.enable_vblank   = mdp5_enable_vblank,
 		.disable_vblank  = mdp5_disable_vblank,
 		.flush_commit    = mdp5_flush_commit,
+		.enable_commit   = mdp5_enable_commit,
+		.disable_commit  = mdp5_disable_commit,
 		.prepare_commit  = mdp5_prepare_commit,
 		.wait_flush      = mdp5_wait_flush,
 		.complete_commit = mdp5_complete_commit,
diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index e3537df848fa..614fb9c5bb58 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -52,6 +52,7 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 	struct msm_kms *kms = priv->kms;
 	unsigned crtc_mask = get_crtc_mask(state);
 
+	kms->funcs->enable_commit(kms);
 	kms->funcs->prepare_commit(kms, state);
 
 	/*
@@ -72,6 +73,7 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 
 	kms->funcs->wait_flush(kms, crtc_mask);
 	kms->funcs->complete_commit(kms, crtc_mask);
+	kms->funcs->disable_commit(kms);
 
 	drm_atomic_helper_commit_hw_done(state);
 
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index bb70c1758c72..811f5e2c2405 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -35,6 +35,16 @@ struct msm_kms_funcs {
 	 * Atomic commit handling:
 	 */
 
+	/**
+	 * Enable/disable power/clks needed for hw access done in other
+	 * commit related methods.
+	 *
+	 * If mdp4 is migrated to runpm, we could probably drop these
+	 * and use runpm directly.
+	 */
+	void (*enable_commit)(struct msm_kms *kms);
+	void (*disable_commit)(struct msm_kms *kms);
+
 	/**
 	 * Prepare for atomic commit.  This is called after any previous
 	 * (async or otherwise) commit has completed.
-- 
2.21.0

