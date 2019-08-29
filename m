Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECFB5A21A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2019 19:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbfH2RCy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Aug 2019 13:02:54 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41863 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbfH2RCx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Aug 2019 13:02:53 -0400
Received: by mail-pg1-f194.google.com with SMTP id x15so1897049pgg.8;
        Thu, 29 Aug 2019 10:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R26A7eGC2bYAjlkhXeodHJW1qjZp52CqJHU1AmTfXXE=;
        b=G6TzcO1oHLR5eCdTHgCaBOKo2Fp3pDJMUAtLyG0R1ycSpuuC8Hhaskl8Cxb4qZBWOA
         yDOcB214tyJoKv3QfwrA5IM/2iUjRHwzSjqjt+UDTwJ4/2+onp9nfc0jVhD5R5i5SoDa
         4CbO3yM4r287zhFOkhonXRy+ho6zIp5uIUXjLm0fq8vK6N9yn5NkuPbbVxCLcrvpY/a9
         A97WrRKHJOmD8lYn0vP/4VM4w2INbQ0v/YA7XmOi9kQdCZ4+CJ8nnad/wCBl0HgqtGr5
         mHk47X9bORScmBNyYZhaYRJSaqGPUUVxFyss2iZLnSLv5CMuJq4ltXcbo4qHXo6FmSnN
         HPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R26A7eGC2bYAjlkhXeodHJW1qjZp52CqJHU1AmTfXXE=;
        b=jCS/SVLQlshCrI3ZZWhtqZxBTQMRTZF4axYBsKnu62dAsDA/RmGMjYkh8USZRjIEjZ
         /w1nPEd4PvPC3pK/ZwgjeBmydJT71WMhWOZCMtKh2SP1Lz9EEu90XF48fgIKice4yzYl
         oPIOuWOHLwIaLP9WMlWdIzLG6bvhVlMZn+KA+MwPcwRFrxh00t3Ahp5HiG/XtVdKxETX
         ix99rceFzwmEFZqmAYPYIEcDXcZM8djH6lvG2jo0aCbdl3OX+U7wHPSaCaSq6mmzDnNc
         T+u0OuhZvqM0i5Jt/G1FtbsBiBtzbm9XRN5dLjnYi0K/5UckffeU7brw1Tz7p2W78Bqu
         k0sA==
X-Gm-Message-State: APjAAAVIvMD5KC8OOBI80lh/+MuMlLoz7g0iy1YKtTpNfJNGR1oAJh8B
        Hq8P6M5QViouSGl4B2SfrZs=
X-Google-Smtp-Source: APXvYqy3STG5Ze6wEaR53HOLtRyehtHIPbBbwYcZJPDS5JBMwgbxUM2JnkDBkLyVtGng1zSbHJ7cvA==
X-Received: by 2002:a17:90a:1b0d:: with SMTP id q13mr11060679pjq.102.1567098172986;
        Thu, 29 Aug 2019 10:02:52 -0700 (PDT)
Received: from localhost ([100.118.89.196])
        by smtp.gmail.com with ESMTPSA id b123sm4398901pfg.64.2019.08.29.10.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 10:02:52 -0700 (PDT)
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
        Mamta Shukla <mamtashukla555@gmail.com>,
        Enrico Weigelt <info@metux.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Allison Randal <allison@lohutok.net>,
        Boris Brezillon <bbrezillon@kernel.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 06/10] drm/msm: add kms->flush_commit()
Date:   Thu, 29 Aug 2019 09:45:14 -0700
Message-Id: <20190829164601.11615-7-robdclark@gmail.com>
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
index bdcc92fbacb3..e3537df848fa 100644
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
index 10dd171b43f8..bb70c1758c72 100644
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

