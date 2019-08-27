Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61A4C9F586
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2019 23:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726025AbfH0Vu2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Aug 2019 17:50:28 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39368 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbfH0Vu2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Aug 2019 17:50:28 -0400
Received: by mail-pf1-f194.google.com with SMTP id y200so254795pfb.6;
        Tue, 27 Aug 2019 14:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=67dthvLQIGmCSZUHq7Jei20QPubBtL7HhTfOXNW4WF4=;
        b=PdWCJos9nCgYf48y4+FDxUsXgCJs0SoJCyz6LfvQHnW66BUzHK61PZHaDY3bppd2GJ
         dr0aA8y7gTEW3F+MKEuan0WF1/i+YQK6i+P4pZywA8ei5vk9yYmlSFLoBdQRnZoKi3O3
         CrQcbPdIUch4IJZIVmY3NKe8hVIsZ5jKxSHJUiESSJtg0bG4809kr6IFdrBOzClLa1BG
         xr2Ook6DljUEh74639WORy0FbK98x6otbneGK8WzOYTiGU/DBYZ2yZIKR6qbGGGFAnhi
         cvGEgi9+s59z1bVLXyOuNai/Da7lMiol1jcKrT5Dw3tTaboq2tOGSQVwIQTOmPhAF/g5
         2S2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=67dthvLQIGmCSZUHq7Jei20QPubBtL7HhTfOXNW4WF4=;
        b=O3/pg0399oQE/v6BMHo6k2qO27pszZWDfuSoqwhJkE9s7IFVrwMmQ2KEUQhIkI2y7V
         m/R3oj8QynJ0kTOXjk0iAAtBqVb9s/mZi94+LLJiCrsbljXaGtwthYR7CieHUzJ65aak
         AZmNtPYvNeHTPaw1HdcNs+srVHa29rk0sGRTcFeElCSu0XbIDSqT460QlA+J5HzR/0YT
         u4ms+IlcNvu8KWlZkrxWAPuF8iPd7ZUd3cFDbexdOg+7yNlKmkMJWRDmg2S+2y+rJiba
         IkVGrG/xd0osVrzr5Fdc9ccuNCQRbDDrs7Vndo+nHo6L2fmeJKMdXzf1IiR20N3wyMub
         tXXQ==
X-Gm-Message-State: APjAAAWAp4E91P1hf6mXH5x3NTDEMr0Qv9qmtI8f/sjDPoLTWqVSPBY7
        MQnfBKUPU4/MqewzHmCHhEU=
X-Google-Smtp-Source: APXvYqxHkejbaXK7Kp2PvkkIJ/I+Q6bqEUSOz7KEjQh1OwY9GdmCOPhSqgdGPccdIfOwie1SRCLHUw==
X-Received: by 2002:a63:2157:: with SMTP id s23mr538841pgm.167.1566942627035;
        Tue, 27 Aug 2019 14:50:27 -0700 (PDT)
Received: from localhost ([100.118.89.196])
        by smtp.gmail.com with ESMTPSA id d128sm291440pfa.42.2019.08.27.14.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 14:50:26 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Bruce Wang <bzwang@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Enrico Weigelt <info@metux.net>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 6/9] drm/msm: add kms->flush_commit()
Date:   Tue, 27 Aug 2019 14:33:36 -0700
Message-Id: <20190827213421.21917-7-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190827213421.21917-1-robdclark@gmail.com>
References: <20190827213421.21917-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Add ->flush_commit(crtc_mask).  Currently a no-op, but kms backends
should migrate writing flush registers to this hook, so we can decouple
pushing updates to hardware, and flushing the updates.

Once we add async commit support, the hw updates will be pushed down to
the hw synchronously, but flushing the updates will be deferred until as
close to vblank as possible, so that multiple updates can be combined in
a single frame.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  6 ++++
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  6 ++++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  6 ++++
 drivers/gpu/drm/msm/msm_atomic.c         |  9 ++++--
 drivers/gpu/drm/msm/msm_kms.h            | 40 ++++++++++++++++++++++--
 5 files changed, 63 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 606815e50625..efbf8fd343de 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -278,6 +278,11 @@ static void dpu_kms_prepare_commit(struct msm_kms *kms,
 	}
 }
 
+static void dpu_kms_flush_commit(struct msm_kms *kms, unsigned crtc_mask)
+{
+	/* TODO */
+}
+
 /*
  * Override the encoder enable since we need to setup the inline rotator and do
  * some crtc magic before enabling any bridge that might be present.
@@ -678,6 +683,7 @@ static const struct msm_kms_funcs kms_funcs = {
 	.irq_uninstall   = dpu_irq_uninstall,
 	.irq             = dpu_irq,
 	.prepare_commit  = dpu_kms_prepare_commit,
+	.flush_commit    = dpu_kms_flush_commit,
 	.commit          = dpu_kms_commit,
 	.wait_flush      = dpu_kms_wait_flush,
 	.complete_commit = dpu_kms_complete_commit,
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index a6a056df5878..78ce2c8a9a38 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -107,6 +107,11 @@ static void mdp4_prepare_commit(struct msm_kms *kms, struct drm_atomic_state *st
 		drm_crtc_vblank_get(crtc);
 }
 
+static void mdp4_flush_commit(struct msm_kms *kms, unsigned crtc_mask)
+{
+	/* TODO */
+}
+
 static void mdp4_wait_flush(struct msm_kms *kms, unsigned crtc_mask)
 {
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
@@ -178,6 +183,7 @@ static const struct mdp_kms_funcs kms_funcs = {
 		.enable_vblank   = mdp4_enable_vblank,
 		.disable_vblank  = mdp4_disable_vblank,
 		.prepare_commit  = mdp4_prepare_commit,
+		.flush_commit    = mdp4_flush_commit,
 		.wait_flush      = mdp4_wait_flush,
 		.complete_commit = mdp4_complete_commit,
 		.get_format      = mdp_get_format,
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 7a19526eef50..eff1b000258e 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -154,6 +154,11 @@ static void mdp5_prepare_commit(struct msm_kms *kms, struct drm_atomic_state *st
 		mdp5_smp_prepare_commit(mdp5_kms->smp, &global_state->smp);
 }
 
+static void mdp5_flush_commit(struct msm_kms *kms, unsigned crtc_mask)
+{
+	/* TODO */
+}
+
 static void mdp5_wait_flush(struct msm_kms *kms, unsigned crtc_mask)
 {
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
@@ -272,6 +277,7 @@ static const struct mdp_kms_funcs kms_funcs = {
 		.irq             = mdp5_irq,
 		.enable_vblank   = mdp5_enable_vblank,
 		.disable_vblank  = mdp5_disable_vblank,
+		.flush_commit    = mdp5_flush_commit,
 		.prepare_commit  = mdp5_prepare_commit,
 		.wait_flush      = mdp5_wait_flush,
 		.complete_commit = mdp5_complete_commit,
diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index bcb6d6144d4d..27369b020bee 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -54,16 +54,21 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 
 	kms->funcs->prepare_commit(kms, state);
 
+	/*
+	 * Push atomic updates down to hardware:
+	 */
 	drm_atomic_helper_commit_modeset_disables(dev, state);
-
 	drm_atomic_helper_commit_planes(dev, state, 0);
-
 	drm_atomic_helper_commit_modeset_enables(dev, state);
 
+	/*
+	 * Flush hardware updates:
+	 */
 	if (kms->funcs->commit) {
 		DRM_DEBUG_ATOMIC("triggering commit\n");
 		kms->funcs->commit(kms, state);
 	}
+	kms->funcs->flush_commit(kms, crtc_mask);
 
 	kms->funcs->wait_flush(kms, crtc_mask);
 	kms->funcs->complete_commit(kms, crtc_mask);
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index c56c54b698ec..55234f661382 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -30,12 +30,47 @@ struct msm_kms_funcs {
 	irqreturn_t (*irq)(struct msm_kms *kms);
 	int (*enable_vblank)(struct msm_kms *kms, struct drm_crtc *crtc);
 	void (*disable_vblank)(struct msm_kms *kms, struct drm_crtc *crtc);
-	/* modeset, bracketing atomic_commit(): */
+
+	/*
+	 * Atomic commit handling:
+	 */
+
+	/**
+	 * Prepare for atomic commit.  This is called after any previous
+	 * (async or otherwise) commit has completed.
+	 */
 	void (*prepare_commit)(struct msm_kms *kms, struct drm_atomic_state *state);
+
+	/**
+	 * Flush an atomic commit.  This is called after the hardware
+	 * updates have already been pushed down to effected planes/
+	 * crtcs/encoders/connectors.
+	 */
+	void (*flush_commit)(struct msm_kms *kms, unsigned crtc_mask);
+
+	/* TODO remove ->commit(), use ->flush_commit() instead: */
 	void (*commit)(struct msm_kms *kms, struct drm_atomic_state *state);
-	void (*complete_commit)(struct msm_kms *kms, unsigned crtc_mask);
+
+	/**
+	 * Wait for any in-progress flush to complete on the specified
+	 * crtcs.  This should not block if there is no in-progress
+	 * commit (ie. don't just wait for a vblank), as it will also
+	 * be called before ->prepare_commit() to ensure any potential
+	 * "async" commit has completed.
+	 */
 	void (*wait_flush)(struct msm_kms *kms, unsigned crtc_mask);
 
+	/**
+	 * Clean up are commit is completed.  This is called after
+	 * ->wait_flush(), to give the backend a chance to do any
+	 * post-commit cleanup.
+	 */
+	void (*complete_commit)(struct msm_kms *kms, unsigned crtc_mask);
+
+	/*
+	 * Format handling:
+	 */
+
 	/* get msm_format w/ optional format modifiers from drm_mode_fb_cmd2 */
 	const struct msm_format *(*get_format)(struct msm_kms *kms,
 					const uint32_t format,
@@ -45,6 +80,7 @@ struct msm_kms_funcs {
 			const struct msm_format *msm_fmt,
 			const struct drm_mode_fb_cmd2 *cmd,
 			struct drm_gem_object **bos);
+
 	/* misc: */
 	long (*round_pixclk)(struct msm_kms *kms, unsigned long rate,
 			struct drm_encoder *encoder);
-- 
2.21.0

