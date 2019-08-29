Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47A4BA2193
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2019 18:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727257AbfH2Q6Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Aug 2019 12:58:16 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:41702 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727228AbfH2Q6Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Aug 2019 12:58:16 -0400
Received: by mail-pf1-f194.google.com with SMTP id 196so2457750pfz.8;
        Thu, 29 Aug 2019 09:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z5aejNN4E3FY64F70srY3n8O/Ut3OzGCD0WkMFdFS6I=;
        b=aBpYN06l6/76eVPw7fSEzZciyB1u9/fZiB2W5QP2lCnBXQu7E69eWLMncU4rDGYF2L
         S1bR3fUgRrxFh3e1vh+3VIZna+6+2lkieoimv2QMQXDNUON2xrzSaQzotDdO6LBWF4ZW
         Hm+84pu9vZDfc3qWaakaQvq2/cYn5XdhKy8TUcXtgdsDgENt6/mNwzzcWyiAa92BuOQJ
         uqfSxYGvppplRaiuDtqW05qPFW5VNExZWRh948oXDPkax3e5gG0qh6d3NBc8KBrfoigt
         n4mLlU/UYtcAxWKgZfKQ2fgHlembWrQdXOFRYsu+Ah9jC31Ar362+9g6uPPaltFY40ob
         EOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z5aejNN4E3FY64F70srY3n8O/Ut3OzGCD0WkMFdFS6I=;
        b=EgMK4VvVDIUVTHzSjWVxtPKMghVITHEIxcVU0fMS5GF6d7TJDVyXaA+Ot8DtNB7b88
         JP+xeoo8sPMxPbJxIfl44lFfR+DU1mK1sCoW1NbabFkQcwV9is1+pIWWbiGtycdBboMq
         7aFO4Hf/YUb6V/M5s0wMiobN/nnVREEPOZU/wIOh2QWnM1Ek/7sQx2XpvhdXeSyhFqnd
         /reabPS7R9yLpvvwbW4rUh7UUhuYVid12Z5H7ZL1Y275yhdZyUof/MKyS3rZkXVQiPAK
         cLKTNcAFJoMOHMYHsGmUSx9bFxBhe0+HXaXEh+0Ma1M5YmsdTFxGgnGI4n21m1tuKOEu
         wQUw==
X-Gm-Message-State: APjAAAV1IzEsUFHqPwmrsYBqBcxQKUOGR/FJMtklNukPMazNSuO2cAwc
        /4+gXswFcT74lpFIE6pXxwjyZ6FjUSA=
X-Google-Smtp-Source: APXvYqzauw+4zVVk7qqFweOCykTcZcA/jk/ZMJD+m5r3MvOKjjoGBcmEPQREZAniKuS2eArDFPOEXQ==
X-Received: by 2002:a63:125c:: with SMTP id 28mr9193220pgs.255.1567097894959;
        Thu, 29 Aug 2019 09:58:14 -0700 (PDT)
Received: from localhost ([100.118.89.196])
        by smtp.gmail.com with ESMTPSA id j187sm3811303pfg.178.2019.08.29.09.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 09:58:14 -0700 (PDT)
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
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Enrico Weigelt <info@metux.net>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 04/10] drm/msm: add kms->wait_flush()
Date:   Thu, 29 Aug 2019 09:45:12 -0700
Message-Id: <20190829164601.11615-5-robdclark@gmail.com>
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

First step in re-working the atomic related internal API to prepare for
async updates pending.. ->wait_flush() is intended to block until there
is no in-progress flush.

A crtc_mask is used, rather than an atomic state object, as this will
later be used for async flush after the atomic state is destroyed.

This replaces ->wait_for_crtc_commit_done()

v2: update for review comments

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 11 ++++++-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 17 ++++++----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 17 ++++++----
 drivers/gpu/drm/msm/msm_atomic.c         | 42 ++++++++++--------------
 drivers/gpu/drm/msm/msm_kms.h            |  9 +++--
 5 files changed, 54 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 31454cc5d8c5..df421b986bc3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -388,6 +388,15 @@ static void dpu_kms_wait_for_commit_done(struct msm_kms *kms,
 	}
 }
 
+static void dpu_kms_wait_flush(struct msm_kms *kms, unsigned crtc_mask)
+{
+	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
+	struct drm_crtc *crtc;
+
+	for_each_crtc_mask(dpu_kms->dev, crtc, crtc_mask)
+		dpu_kms_wait_for_commit_done(kms, crtc);
+}
+
 static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 				    struct msm_drm_private *priv,
 				    struct dpu_kms *dpu_kms)
@@ -682,8 +691,8 @@ static const struct msm_kms_funcs kms_funcs = {
 	.irq             = dpu_irq,
 	.prepare_commit  = dpu_kms_prepare_commit,
 	.commit          = dpu_kms_commit,
+	.wait_flush      = dpu_kms_wait_flush,
 	.complete_commit = dpu_kms_complete_commit,
-	.wait_for_crtc_commit_done = dpu_kms_wait_for_commit_done,
 	.enable_vblank   = dpu_kms_enable_vblank,
 	.disable_vblank  = dpu_kms_disable_vblank,
 	.check_modified_format = dpu_format_check_modified_format,
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 7a9ab55b4608..32dcb1d7860c 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -107,6 +107,15 @@ static void mdp4_prepare_commit(struct msm_kms *kms, struct drm_atomic_state *st
 		drm_crtc_vblank_get(crtc);
 }
 
+static void mdp4_wait_flush(struct msm_kms *kms, unsigned crtc_mask)
+{
+	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
+	struct drm_crtc *crtc;
+
+	for_each_crtc_mask(mdp4_kms->dev, crtc, crtc_mask)
+		mdp4_crtc_wait_for_commit_done(crtc);
+}
+
 static void mdp4_complete_commit(struct msm_kms *kms, struct drm_atomic_state *state)
 {
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
@@ -123,12 +132,6 @@ static void mdp4_complete_commit(struct msm_kms *kms, struct drm_atomic_state *s
 	mdp4_disable(mdp4_kms);
 }
 
-static void mdp4_wait_for_crtc_commit_done(struct msm_kms *kms,
-						struct drm_crtc *crtc)
-{
-	mdp4_crtc_wait_for_commit_done(crtc);
-}
-
 static long mdp4_round_pixclk(struct msm_kms *kms, unsigned long rate,
 		struct drm_encoder *encoder)
 {
@@ -179,8 +182,8 @@ static const struct mdp_kms_funcs kms_funcs = {
 		.enable_vblank   = mdp4_enable_vblank,
 		.disable_vblank  = mdp4_disable_vblank,
 		.prepare_commit  = mdp4_prepare_commit,
+		.wait_flush      = mdp4_wait_flush,
 		.complete_commit = mdp4_complete_commit,
-		.wait_for_crtc_commit_done = mdp4_wait_for_crtc_commit_done,
 		.get_format      = mdp_get_format,
 		.round_pixclk    = mdp4_round_pixclk,
 		.destroy         = mdp4_destroy,
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 8bf5f3264dc9..440e000c8c3d 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -154,6 +154,15 @@ static void mdp5_prepare_commit(struct msm_kms *kms, struct drm_atomic_state *st
 		mdp5_smp_prepare_commit(mdp5_kms->smp, &global_state->smp);
 }
 
+static void mdp5_wait_flush(struct msm_kms *kms, unsigned crtc_mask)
+{
+	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
+	struct drm_crtc *crtc;
+
+	for_each_crtc_mask(mdp5_kms->dev, crtc, crtc_mask)
+		mdp5_crtc_wait_for_commit_done(crtc);
+}
+
 static void mdp5_complete_commit(struct msm_kms *kms, struct drm_atomic_state *state)
 {
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
@@ -170,12 +179,6 @@ static void mdp5_complete_commit(struct msm_kms *kms, struct drm_atomic_state *s
 	pm_runtime_put_sync(dev);
 }
 
-static void mdp5_wait_for_crtc_commit_done(struct msm_kms *kms,
-						struct drm_crtc *crtc)
-{
-	mdp5_crtc_wait_for_commit_done(crtc);
-}
-
 static long mdp5_round_pixclk(struct msm_kms *kms, unsigned long rate,
 		struct drm_encoder *encoder)
 {
@@ -272,8 +275,8 @@ static const struct mdp_kms_funcs kms_funcs = {
 		.enable_vblank   = mdp5_enable_vblank,
 		.disable_vblank  = mdp5_disable_vblank,
 		.prepare_commit  = mdp5_prepare_commit,
+		.wait_flush      = mdp5_wait_flush,
 		.complete_commit = mdp5_complete_commit,
-		.wait_for_crtc_commit_done = mdp5_wait_for_crtc_commit_done,
 		.get_format      = mdp_get_format,
 		.round_pixclk    = mdp5_round_pixclk,
 		.set_split_display = mdp5_set_split_display,
diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index e5aae1645933..4ca4b654c221 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -10,28 +10,6 @@
 #include "msm_gem.h"
 #include "msm_kms.h"
 
-static void msm_atomic_wait_for_commit_done(struct drm_device *dev,
-		struct drm_atomic_state *old_state)
-{
-	struct drm_crtc *crtc;
-	struct drm_crtc_state *new_crtc_state;
-	struct msm_drm_private *priv = old_state->dev->dev_private;
-	struct msm_kms *kms = priv->kms;
-	int i;
-
-	for_each_new_crtc_in_state(old_state, crtc, new_crtc_state, i) {
-		if (!new_crtc_state->active)
-			continue;
-
-		if (drm_crtc_vblank_get(crtc))
-			continue;
-
-		kms->funcs->wait_for_crtc_commit_done(kms, crtc);
-
-		drm_crtc_vblank_put(crtc);
-	}
-}
-
 int msm_atomic_prepare_fb(struct drm_plane *plane,
 			  struct drm_plane_state *new_state)
 {
@@ -51,11 +29,28 @@ int msm_atomic_prepare_fb(struct drm_plane *plane,
 	return msm_framebuffer_prepare(new_state->fb, kms->aspace);
 }
 
+/* Get bitmask of crtcs that will need to be flushed.  The bitmask
+ * can be used with for_each_crtc_mask() iterator, to iterate
+ * effected crtcs without needing to preserve the atomic state.
+ */
+static unsigned get_crtc_mask(struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *crtc_state;
+	struct drm_crtc *crtc;
+	unsigned i, mask = 0;
+
+	for_each_new_crtc_in_state(state, crtc, crtc_state, i)
+		mask |= drm_crtc_mask(crtc);
+
+	return mask;
+}
+
 void msm_atomic_commit_tail(struct drm_atomic_state *state)
 {
 	struct drm_device *dev = state->dev;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_kms *kms = priv->kms;
+	unsigned crtc_mask = get_crtc_mask(state);
 
 	kms->funcs->prepare_commit(kms, state);
 
@@ -70,8 +65,7 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 		kms->funcs->commit(kms, state);
 	}
 
-	msm_atomic_wait_for_commit_done(dev, state);
-
+	kms->funcs->wait_flush(kms, crtc_mask);
 	kms->funcs->complete_commit(kms, state);
 
 	drm_atomic_helper_commit_hw_done(state);
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index c7588a42635e..a112dfb36301 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -34,9 +34,8 @@ struct msm_kms_funcs {
 	void (*prepare_commit)(struct msm_kms *kms, struct drm_atomic_state *state);
 	void (*commit)(struct msm_kms *kms, struct drm_atomic_state *state);
 	void (*complete_commit)(struct msm_kms *kms, struct drm_atomic_state *state);
-	/* functions to wait for atomic commit completed on each CRTC */
-	void (*wait_for_crtc_commit_done)(struct msm_kms *kms,
-					struct drm_crtc *crtc);
+	void (*wait_flush)(struct msm_kms *kms, unsigned crtc_mask);
+
 	/* get msm_format w/ optional format modifiers from drm_mode_fb_cmd2 */
 	const struct msm_format *(*get_format)(struct msm_kms *kms,
 					const uint32_t format,
@@ -98,4 +97,8 @@ struct msm_mdss {
 int mdp5_mdss_init(struct drm_device *dev);
 int dpu_mdss_init(struct drm_device *dev);
 
+#define for_each_crtc_mask(dev, crtc, crtc_mask) \
+	drm_for_each_crtc(crtc, dev) \
+		for_each_if (drm_crtc_mask(crtc) & (crtc_mask))
+
 #endif /* __MSM_KMS_H__ */
-- 
2.21.0

