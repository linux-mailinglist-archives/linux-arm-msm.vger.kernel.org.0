Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF2AEAC06C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2019 21:24:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390821AbfIFTX5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Sep 2019 15:23:57 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:44854 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389101AbfIFTX4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Sep 2019 15:23:56 -0400
Received: by mail-io1-f67.google.com with SMTP id j4so15204969iog.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Sep 2019 12:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qJR50YCOwMbxx1IjK9E1aTef9wlkdKgnv5HqeQtRqcM=;
        b=Bh3hn4UsM6oE18036kSaGShJrvCWLn/X+uasTikKWSblJzZ9D3HytWD8cePVT+jBxI
         SauJZwWkx8MK5TGGh4tzAeDkM8I8BmZKf+CyrkmvJHZO5og0/PYIjGGi/eHS/rcd0rA+
         9OTdHEPG2ab+2LbxKYLIYh5tk2sfkLmZCpWso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qJR50YCOwMbxx1IjK9E1aTef9wlkdKgnv5HqeQtRqcM=;
        b=i5riYst64meNsiCB5Qij0Su7AB42+Y9XyXTb1BValWs4t3xg+t6J9E1sdtmQxtJvsT
         jcttU2Qf3Hff4ERWxyrNSJGkMKGZYfgbCpXCkoDUG0A8Akr987YiOf9C5/lsgizDCrA9
         MpzVvJr3hO/I3LrOwxfPM3LWSErIDYnkS8hWEnEiLn/VvC+jg6nDKS5//VOlA7t5fdeM
         s7mA5HdlcNeCE97wlA74F1vc6RU5/Jg3NRD6aoWkXlEOqZqK3ldptLKLF+WiRrujwVFe
         iCsShWD5to5CnEQKeC1QyDB3bDukuawH2vUTbObjSo51lF9sJ6PQ7G2CmsfPmxXXHZ1x
         JA2Q==
X-Gm-Message-State: APjAAAU71KvVSSyR0VbOyx78igVQbB+d1YFr4MTjGRbtpYVHjdJF5bTI
        EOy1jKmYF6T7kPBBLvOkZSKJUA==
X-Google-Smtp-Source: APXvYqy5hNKNaSbwjwB7JTrB3yYUGFNb3GXAP0vGF4wjv9mZrnUkKHMP9pVGLmuyHcBbkR/lMQ30uA==
X-Received: by 2002:a6b:fc02:: with SMTP id r2mr11259064ioh.15.1567797835630;
        Fri, 06 Sep 2019 12:23:55 -0700 (PDT)
Received: from ddavenport4.bld.corp.google.com ([2620:15c:183:0:92f:a80a:519d:f777])
        by smtp.gmail.com with ESMTPSA id h70sm10931804iof.48.2019.09.06.12.23.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 06 Sep 2019 12:23:55 -0700 (PDT)
From:   Drew Davenport <ddavenport@chromium.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Drew Davenport <ddavenport@chromium.org>,
        David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
        Jayant Shekhar <jshekhar@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Bruce Wang <bzwang@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexios Zavras <alexios.zavras@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 3/6] drm/msm/dpu: Remove unnecessary NULL checks
Date:   Fri,  6 Sep 2019 13:23:41 -0600
Message-Id: <20190906192344.223694-3-ddavenport@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190906192344.223694-1-ddavenport@chromium.org>
References: <20190906192344.223694-1-ddavenport@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

drm_device.dev_private is set to a non-NULL msm_drm_private
struct in msm_drm_init. Successful initialization of msm means
that dev_private is non-NULL so there is no need to check it
everywhere.

Signed-off-by: Drew Davenport <ddavenport@chromium.org>
---

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c     |  6 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c    |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 15 +++++----------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  2 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c |  3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c          | 16 +++-------------
 7 files changed, 14 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
index cdbea38b8697..17f917b718ce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
@@ -349,9 +349,6 @@ void dpu_core_irq_preinstall(struct dpu_kms *dpu_kms)
 	if (!dpu_kms->dev) {
 		DPU_ERROR("invalid drm device\n");
 		return;
-	} else if (!dpu_kms->dev->dev_private) {
-		DPU_ERROR("invalid device private\n");
-		return;
 	}
 	priv = dpu_kms->dev->dev_private;
 
@@ -385,9 +382,6 @@ void dpu_core_irq_uninstall(struct dpu_kms *dpu_kms)
 	if (!dpu_kms->dev) {
 		DPU_ERROR("invalid drm device\n");
 		return;
-	} else if (!dpu_kms->dev->dev_private) {
-		DPU_ERROR("invalid device private\n");
-		return;
 	}
 	priv = dpu_kms->dev->dev_private;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 09a49b59bb5b..094d74635fb7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -33,13 +33,13 @@ static struct dpu_kms *_dpu_crtc_get_kms(struct drm_crtc *crtc)
 {
 	struct msm_drm_private *priv;
 
-	if (!crtc->dev || !crtc->dev->dev_private) {
+	if (!crtc->dev) {
 		DPU_ERROR("invalid device\n");
 		return NULL;
 	}
 
 	priv = crtc->dev->dev_private;
-	if (!priv || !priv->kms) {
+	if (!priv->kms) {
 		DPU_ERROR("invalid kms\n");
 		return NULL;
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 2ece11262943..ead7d657097c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -694,7 +694,7 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
 	unsigned long flags;
 	bool release_bandwidth = false;
 
-	if (!crtc || !crtc->dev || !crtc->dev->dev_private || !crtc->state) {
+	if (!crtc || !crtc->dev || !crtc->state) {
 		DPU_ERROR("invalid crtc\n");
 		return;
 	}
@@ -766,7 +766,7 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
 	struct msm_drm_private *priv;
 	bool request_bandwidth;
 
-	if (!crtc || !crtc->dev || !crtc->dev->dev_private) {
+	if (!crtc || !crtc->dev) {
 		DPU_ERROR("invalid crtc\n");
 		return;
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 4d2cacd0ce3d..7b37d1eeeab5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -735,8 +735,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 	struct msm_drm_private *priv;
 	bool is_vid_mode = false;
 
-	if (!drm_enc || !drm_enc->dev || !drm_enc->dev->dev_private ||
-			!drm_enc->crtc) {
+	if (!drm_enc || !drm_enc->dev || !drm_enc->crtc) {
 		DPU_ERROR("invalid parameters\n");
 		return -EINVAL;
 	}
@@ -1092,7 +1091,7 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
 	struct msm_drm_private *priv;
 	struct dpu_kms *dpu_kms;
 
-	if (!drm_enc || !drm_enc->dev || !drm_enc->dev->dev_private) {
+	if (!drm_enc || !drm_enc->dev) {
 		DPU_ERROR("invalid parameters\n");
 		return;
 	}
@@ -1193,9 +1192,6 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 	} else if (!drm_enc->dev) {
 		DPU_ERROR("invalid dev\n");
 		return;
-	} else if (!drm_enc->dev->dev_private) {
-		DPU_ERROR("invalid dev_private\n");
-		return;
 	}
 
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
@@ -1734,8 +1730,7 @@ static void dpu_encoder_vsync_event_handler(struct timer_list *t)
 	struct msm_drm_private *priv;
 	struct msm_drm_thread *event_thread;
 
-	if (!drm_enc->dev || !drm_enc->dev->dev_private ||
-			!drm_enc->crtc) {
+	if (!drm_enc->dev || !drm_enc->crtc) {
 		DPU_ERROR("invalid parameters\n");
 		return;
 	}
@@ -1925,7 +1920,7 @@ static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
 
 	char name[DPU_NAME_SIZE];
 
-	if (!drm_enc->dev || !drm_enc->dev->dev_private) {
+	if (!drm_enc->dev) {
 		DPU_ERROR("invalid encoder or kms\n");
 		return -EINVAL;
 	}
@@ -2130,7 +2125,7 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
 	struct drm_encoder *drm_enc = &dpu_enc->base;
 	u32 event;
 
-	if (!drm_enc->dev || !drm_enc->dev->dev_private) {
+	if (!drm_enc->dev) {
 		DPU_ERROR("invalid parameters\n");
 		return;
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 2923b63d95fe..50fe1ed7095c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -373,7 +373,7 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
 	}
 
 	dpu_kms = phys_enc->dpu_kms;
-	if (!dpu_kms || !dpu_kms->dev || !dpu_kms->dev->dev_private) {
+	if (!dpu_kms || !dpu_kms->dev) {
 		DPU_ERROR("invalid device\n");
 		return;
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index b9c84fb4d4a1..bd333d957add 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -570,8 +570,7 @@ static void dpu_encoder_phys_vid_disable(struct dpu_encoder_phys *phys_enc)
 	unsigned long lock_flags;
 	int ret;
 
-	if (!phys_enc || !phys_enc->parent || !phys_enc->parent->dev ||
-			!phys_enc->parent->dev->dev_private) {
+	if (!phys_enc || !phys_enc->parent || !phys_enc->parent->dev) {
 		DPU_ERROR("invalid encoder/device\n");
 		return;
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 58b0485dc375..4a69d8ecf5e1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -72,7 +72,7 @@ static int _dpu_danger_signal_status(struct seq_file *s,
 	struct dpu_danger_safe_status status;
 	int i;
 
-	if (!kms->dev || !kms->dev->dev_private || !kms->hw_mdp) {
+	if (!kms->dev || !kms->hw_mdp) {
 		DPU_ERROR("invalid arg(s)\n");
 		return 0;
 	}
@@ -157,9 +157,6 @@ static int _dpu_debugfs_show_regset32(struct seq_file *s, void *data)
 		return 0;
 
 	priv = dev->dev_private;
-	if (!priv)
-		return 0;
-
 	base = dpu_kms->mmio + regset->offset;
 
 	/* insert padding spaces, if needed */
@@ -292,7 +289,7 @@ static void dpu_kms_prepare_commit(struct msm_kms *kms,
 	dpu_kms = to_dpu_kms(kms);
 	dev = dpu_kms->dev;
 
-	if (!dev || !dev->dev_private)
+	if (!dev)
 		return;
 	priv = dev->dev_private;
 
@@ -470,9 +467,6 @@ static void _dpu_kms_drm_obj_destroy(struct dpu_kms *dpu_kms)
 	} else if (!dpu_kms->dev) {
 		DPU_ERROR("invalid dev\n");
 		return;
-	} else if (!dpu_kms->dev->dev_private) {
-		DPU_ERROR("invalid dev_private\n");
-		return;
 	}
 	priv = dpu_kms->dev->dev_private;
 
@@ -809,10 +803,6 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	}
 
 	priv = dev->dev_private;
-	if (!priv) {
-		DPU_ERROR("invalid private data\n");
-		return rc;
-	}
 
 	atomic_set(&dpu_kms->bandwidth_ref, 0);
 
@@ -974,7 +964,7 @@ struct msm_kms *dpu_kms_init(struct drm_device *dev)
 	struct dpu_kms *dpu_kms;
 	int irq;
 
-	if (!dev || !dev->dev_private) {
+	if (!dev) {
 		DPU_ERROR("drm device node invalid\n");
 		return ERR_PTR(-EINVAL);
 	}
-- 
2.20.1

