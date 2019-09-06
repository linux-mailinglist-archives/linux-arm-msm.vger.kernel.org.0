Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FEC4AC07F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2019 21:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393262AbfIFTYT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Sep 2019 15:24:19 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:34521 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390263AbfIFTX7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Sep 2019 15:23:59 -0400
Received: by mail-io1-f65.google.com with SMTP id s21so15291813ioa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Sep 2019 12:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3Y04QnjYU5dJNrZssW/fqqEItLo+91e3CGDIJ1aD7PM=;
        b=NLZLAm6VsmD2KIJSboAW7bdf1CLhAbOAzv1bOsD/9BWTa31MLOaEYpevUNHRd4Nkeh
         wSE8T5fq2iEzPzoDmb3K+tXS4x7NlHuCZX+fIr2tK3inGdI6hyvNdSwDNCgFEFdwOtHA
         0IWPyIcC/3j6cp7bIwei94+YwSaRUDkDqb0g0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3Y04QnjYU5dJNrZssW/fqqEItLo+91e3CGDIJ1aD7PM=;
        b=Biqd7p8ktAHGoLU1sLzUQWeXFvXG9uExwGJl/M8MyoHZTWYUiADF2EcvkSQB893iUY
         OretEUhyPli6HVsdS0vSsI6hGPDDOD5NVIfrAsDjsWzFZKAy8CM6N8tqDDTHIkHQd0O2
         8yHbZoABSP0pnX2vQi55VLVS8+54Z3ONS5i0PqRfUliRrkxo/MS+BguKhrkPO6cifLQu
         r5kbVeEBiykAjsAQGpnDTV+LBnMZL3sqXu7usJCxsgBsqHSk+b85xZLxqke71ExKItBg
         It/3Nqofh3nlgrVZDxxRsslWfv//pnTe+VL6CIhmqlJ2E/noWOb2v2b13Xlp1vkYuLaC
         I82Q==
X-Gm-Message-State: APjAAAWRTf/bRx+H/A+78oxmnQNV8V5TCPKEZi7HoocTVdK2oBiePVGB
        p29QTi50r1BiPjab2RcnqukISA==
X-Google-Smtp-Source: APXvYqyBbtoo1o0fe5WO0n2dN8F0Smtrfi9xLASw+PgMwTpy9LBoyvwyJFyzoel+FarZsdy/gyoIhw==
X-Received: by 2002:a02:cf10:: with SMTP id q16mr11453526jar.89.1567797837840;
        Fri, 06 Sep 2019 12:23:57 -0700 (PDT)
Received: from ddavenport4.bld.corp.google.com ([2620:15c:183:0:92f:a80a:519d:f777])
        by smtp.gmail.com with ESMTPSA id h70sm10931804iof.48.2019.09.06.12.23.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 06 Sep 2019 12:23:57 -0700 (PDT)
From:   Drew Davenport <ddavenport@chromium.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Drew Davenport <ddavenport@chromium.org>,
        David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
        Jayant Shekhar <jshekhar@codeaurora.org>,
        Bruce Wang <bzwang@chromium.org>,
        Allison Randal <allison@lohutok.net>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Fritz Koenig <frkoenig@google.com>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 5/6] drm/msm/dpu: Remove unnecessary NULL checks
Date:   Fri,  6 Sep 2019 13:23:43 -0600
Message-Id: <20190906192344.223694-5-ddavenport@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190906192344.223694-1-ddavenport@chromium.org>
References: <20190906192344.223694-1-ddavenport@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

msm_drm_private.kms will only be NULL in the dummy headless case, so
there is no need to check it in the dpu display driver.

Signed-off-by: Drew Davenport <ddavenport@chromium.org>
---

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c  | 23 ++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 12 +++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 14 ++---------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  2 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  5 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c      |  6 +----
 7 files changed, 19 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
index 17f917b718ce..a53517abf15c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
@@ -55,8 +55,7 @@ static void dpu_core_irq_callback_handler(void *arg, int irq_idx)
 int dpu_core_irq_idx_lookup(struct dpu_kms *dpu_kms,
 		enum dpu_intr_type intr_type, u32 instance_idx)
 {
-	if (!dpu_kms || !dpu_kms->hw_intr ||
-			!dpu_kms->hw_intr->ops.irq_idx_lookup)
+	if (!dpu_kms->hw_intr || !dpu_kms->hw_intr->ops.irq_idx_lookup)
 		return -EINVAL;
 
 	return dpu_kms->hw_intr->ops.irq_idx_lookup(intr_type,
@@ -73,7 +72,7 @@ static int _dpu_core_irq_enable(struct dpu_kms *dpu_kms, int irq_idx)
 	unsigned long irq_flags;
 	int ret = 0, enable_count;
 
-	if (!dpu_kms || !dpu_kms->hw_intr ||
+	if (!dpu_kms->hw_intr ||
 			!dpu_kms->irq_obj.enable_counts ||
 			!dpu_kms->irq_obj.irq_counts) {
 		DPU_ERROR("invalid params\n");
@@ -114,7 +113,7 @@ int dpu_core_irq_enable(struct dpu_kms *dpu_kms, int *irq_idxs, u32 irq_count)
 {
 	int i, ret = 0, counts;
 
-	if (!dpu_kms || !irq_idxs || !irq_count) {
+	if (!irq_idxs || !irq_count) {
 		DPU_ERROR("invalid params\n");
 		return -EINVAL;
 	}
@@ -138,7 +137,7 @@ static int _dpu_core_irq_disable(struct dpu_kms *dpu_kms, int irq_idx)
 {
 	int ret = 0, enable_count;
 
-	if (!dpu_kms || !dpu_kms->hw_intr || !dpu_kms->irq_obj.enable_counts) {
+	if (!dpu_kms->hw_intr || !dpu_kms->irq_obj.enable_counts) {
 		DPU_ERROR("invalid params\n");
 		return -EINVAL;
 	}
@@ -169,7 +168,7 @@ int dpu_core_irq_disable(struct dpu_kms *dpu_kms, int *irq_idxs, u32 irq_count)
 {
 	int i, ret = 0, counts;
 
-	if (!dpu_kms || !irq_idxs || !irq_count) {
+	if (!irq_idxs || !irq_count) {
 		DPU_ERROR("invalid params\n");
 		return -EINVAL;
 	}
@@ -186,7 +185,7 @@ int dpu_core_irq_disable(struct dpu_kms *dpu_kms, int *irq_idxs, u32 irq_count)
 
 u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx, bool clear)
 {
-	if (!dpu_kms || !dpu_kms->hw_intr ||
+	if (!dpu_kms->hw_intr ||
 			!dpu_kms->hw_intr->ops.get_interrupt_status)
 		return 0;
 
@@ -205,7 +204,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 {
 	unsigned long irq_flags;
 
-	if (!dpu_kms || !dpu_kms->irq_obj.irq_cb_tbl) {
+	if (!dpu_kms->irq_obj.irq_cb_tbl) {
 		DPU_ERROR("invalid params\n");
 		return -EINVAL;
 	}
@@ -240,7 +239,7 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx,
 {
 	unsigned long irq_flags;
 
-	if (!dpu_kms || !dpu_kms->irq_obj.irq_cb_tbl) {
+	if (!dpu_kms->irq_obj.irq_cb_tbl) {
 		DPU_ERROR("invalid params\n");
 		return -EINVAL;
 	}
@@ -274,8 +273,7 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx,
 
 static void dpu_clear_all_irqs(struct dpu_kms *dpu_kms)
 {
-	if (!dpu_kms || !dpu_kms->hw_intr ||
-			!dpu_kms->hw_intr->ops.clear_all_irqs)
+	if (!dpu_kms->hw_intr || !dpu_kms->hw_intr->ops.clear_all_irqs)
 		return;
 
 	dpu_kms->hw_intr->ops.clear_all_irqs(dpu_kms->hw_intr);
@@ -283,8 +281,7 @@ static void dpu_clear_all_irqs(struct dpu_kms *dpu_kms)
 
 static void dpu_disable_all_irqs(struct dpu_kms *dpu_kms)
 {
-	if (!dpu_kms || !dpu_kms->hw_intr ||
-			!dpu_kms->hw_intr->ops.disable_all_irqs)
+	if (!dpu_kms->hw_intr || !dpu_kms->hw_intr->ops.disable_all_irqs)
 		return;
 
 	dpu_kms->hw_intr->ops.disable_all_irqs(dpu_kms->hw_intr);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 839887a3a80c..e96843010dff 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -32,13 +32,7 @@ enum dpu_perf_mode {
 static struct dpu_kms *_dpu_crtc_get_kms(struct drm_crtc *crtc)
 {
 	struct msm_drm_private *priv;
-
 	priv = crtc->dev->dev_private;
-	if (!priv->kms) {
-		DPU_ERROR("invalid kms\n");
-		return NULL;
-	}
-
 	return to_dpu_kms(priv->kms);
 }
 
@@ -111,7 +105,7 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 	}
 
 	kms = _dpu_crtc_get_kms(crtc);
-	if (!kms || !kms->catalog) {
+	if (!kms->catalog) {
 		DPU_ERROR("invalid parameters\n");
 		return 0;
 	}
@@ -219,7 +213,7 @@ void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc)
 	}
 
 	kms = _dpu_crtc_get_kms(crtc);
-	if (!kms || !kms->catalog) {
+	if (!kms->catalog) {
 		DPU_ERROR("invalid kms\n");
 		return;
 	}
@@ -292,7 +286,7 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 	}
 
 	kms = _dpu_crtc_get_kms(crtc);
-	if (!kms || !kms->catalog) {
+	if (!kms->catalog) {
 		DPU_ERROR("invalid kms\n");
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 7b37d1eeeab5..85e7bacbce42 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -645,11 +645,6 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 	priv = drm_enc->dev->dev_private;
 
 	dpu_kms = to_dpu_kms(priv->kms);
-	if (!dpu_kms) {
-		DPU_ERROR("invalid dpu_kms\n");
-		return;
-	}
-
 	hw_mdptop = dpu_kms->hw_mdp;
 	if (!hw_mdptop) {
 		DPU_ERROR("invalid mdptop\n");
@@ -1098,10 +1093,6 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
 
 	priv = drm_enc->dev->dev_private;
 	dpu_kms = to_dpu_kms(priv->kms);
-	if (!dpu_kms) {
-		DPU_ERROR("invalid dpu_kms\n");
-		return;
-	}
 
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 	if (!dpu_enc || !dpu_enc->cur_master) {
@@ -2032,9 +2023,8 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 	enum dpu_intf_type intf_type;
 	struct dpu_enc_phys_init_params phys_params;
 
-	if (!dpu_enc || !dpu_kms) {
-		DPU_ERROR("invalid arg(s), enc %d kms %d\n",
-				dpu_enc != 0, dpu_kms != 0);
+	if (!dpu_enc) {
+		DPU_ERROR("invalid arg(s), enc %d\n", dpu_enc != 0);
 		return -EINVAL;
 	}
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 50fe1ed7095c..39fc39cd2439 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -373,7 +373,7 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
 	}
 
 	dpu_kms = phys_enc->dpu_kms;
-	if (!dpu_kms || !dpu_kms->dev) {
+	if (!dpu_kms->dev) {
 		DPU_ERROR("invalid device\n");
 		return;
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index bd333d957add..15d21d7ec304 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -374,7 +374,7 @@ static void dpu_encoder_phys_vid_mode_set(
 		struct drm_display_mode *mode,
 		struct drm_display_mode *adj_mode)
 {
-	if (!phys_enc || !phys_enc->dpu_kms) {
+	if (!phys_enc) {
 		DPU_ERROR("invalid encoder/kms\n");
 		return;
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 4a69d8ecf5e1..9d6429fa6229 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -461,10 +461,7 @@ static void _dpu_kms_drm_obj_destroy(struct dpu_kms *dpu_kms)
 	struct msm_drm_private *priv;
 	int i;
 
-	if (!dpu_kms) {
-		DPU_ERROR("invalid dpu_kms\n");
-		return;
-	} else if (!dpu_kms->dev) {
+	if (!dpu_kms->dev) {
 		DPU_ERROR("invalid dev\n");
 		return;
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
index 8d24b79fd400..991f4c8f8a12 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
@@ -154,10 +154,6 @@ void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
 	u32 ot_lim;
 	int ret, i;
 
-	if (!dpu_kms) {
-		DPU_ERROR("invalid arguments\n");
-		return;
-	}
 	mdp = dpu_kms->hw_mdp;
 
 	for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
@@ -214,7 +210,7 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 	const struct dpu_vbif_qos_tbl *qos_tbl;
 	int i;
 
-	if (!dpu_kms || !params || !dpu_kms->hw_mdp) {
+	if (!params || !dpu_kms->hw_mdp) {
 		DPU_ERROR("invalid arguments\n");
 		return;
 	}
-- 
2.20.1

