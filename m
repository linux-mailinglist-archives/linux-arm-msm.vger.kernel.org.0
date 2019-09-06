Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C032CAC075
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2019 21:24:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392804AbfIFTYC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Sep 2019 15:24:02 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:44865 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391120AbfIFTYA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Sep 2019 15:24:00 -0400
Received: by mail-io1-f68.google.com with SMTP id j4so15205324iog.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Sep 2019 12:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cLz5QC5EJYd9kp9XKMbuAGHR5fi2TN9ydlWG4VtkjSA=;
        b=NstWgQZ/kGHFe9FYzpcxJAoLl0QS/jip/BCw1gAy/CCYENThy4U6g23kiiYOQK/kVn
         0X/DbN0TY/m/cX9ji0Ncb6bMYIVtOngPXcAqvqX9CwryexCMz9JorS8jHwK2n7ME2PM9
         vaekQfgj4Sh0PBK63tRWpOfBmTafeNJfgrgvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cLz5QC5EJYd9kp9XKMbuAGHR5fi2TN9ydlWG4VtkjSA=;
        b=MSS+GwYsYgK6hpJnKaYwTjBcErISas57WxC0vWwSQbwdc/AU4qGuIJClPp2SAR5hd/
         jikvGthp1drrHI2mk1hHLIkjcTVA5jZMfgmCOPriYrAuUhKkiId+f/ieQgzzY0ZHDU14
         U09MgrrPY+bb8h2NjsMeBSjnkEolsA5LlApMGsSfy/q5EFYjD1QECn6yyCghAhHSrXRa
         RmSinq2ZPUiyEv+bU4mmzixzLlSFO2JrHSR5Cb2zGNcmpfea/6rvApm8wLRCezIz2ySc
         ZN1FCdnxSuTQKdBmcfytYTz9uNyRd1phESEOr9shQbeZLwqEVM0wG11QzyOdFRxdq2ad
         AKXA==
X-Gm-Message-State: APjAAAWoQmssXtQGeh6hAe3627cBrBPxQqrRgdpcV0Q0rl9Io6XQZR0s
        nHe7xKO3zGvppPNSDpa5XeYwmg==
X-Google-Smtp-Source: APXvYqxCifj8cFirPG/j36LsIQyAzJ2ccqGM/ZpMfWoiy9BssNUvOklUn/BM//2ijxdKxIj3Cl5Mxg==
X-Received: by 2002:a6b:d812:: with SMTP id y18mr2222166iob.73.1567797838855;
        Fri, 06 Sep 2019 12:23:58 -0700 (PDT)
Received: from ddavenport4.bld.corp.google.com ([2620:15c:183:0:92f:a80a:519d:f777])
        by smtp.gmail.com with ESMTPSA id h70sm10931804iof.48.2019.09.06.12.23.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 06 Sep 2019 12:23:58 -0700 (PDT)
From:   Drew Davenport <ddavenport@chromium.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Drew Davenport <ddavenport@chromium.org>,
        David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
        Bruce Wang <bzwang@chromium.org>,
        Allison Randal <allison@lohutok.net>,
        linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 6/6] drm/msm/dpu: Remove unnecessary NULL checks
Date:   Fri,  6 Sep 2019 13:23:44 -0600
Message-Id: <20190906192344.223694-6-ddavenport@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190906192344.223694-1-ddavenport@chromium.org>
References: <20190906192344.223694-1-ddavenport@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

dpu_kms.dev will never be NULL, so don't bother checking.

Signed-off-by: Drew Davenport <ddavenport@chromium.org>
---

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c  |  8 -----
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  4 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 30 +------------------
 3 files changed, 1 insertion(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
index a53517abf15c..283d5a48fd13 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
@@ -343,10 +343,6 @@ void dpu_core_irq_preinstall(struct dpu_kms *dpu_kms)
 	struct msm_drm_private *priv;
 	int i;
 
-	if (!dpu_kms->dev) {
-		DPU_ERROR("invalid drm device\n");
-		return;
-	}
 	priv = dpu_kms->dev->dev_private;
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
@@ -376,10 +372,6 @@ void dpu_core_irq_uninstall(struct dpu_kms *dpu_kms)
 	struct msm_drm_private *priv;
 	int i;
 
-	if (!dpu_kms->dev) {
-		DPU_ERROR("invalid drm device\n");
-		return;
-	}
 	priv = dpu_kms->dev->dev_private;
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 39fc39cd2439..d5532836b5b9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -373,10 +373,6 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
 	}
 
 	dpu_kms = phys_enc->dpu_kms;
-	if (!dpu_kms->dev) {
-		DPU_ERROR("invalid device\n");
-		return;
-	}
 	priv = dpu_kms->dev->dev_private;
 
 	/*
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 9d6429fa6229..fbb154d7c81c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -72,7 +72,7 @@ static int _dpu_danger_signal_status(struct seq_file *s,
 	struct dpu_danger_safe_status status;
 	int i;
 
-	if (!kms->dev || !kms->hw_mdp) {
+	if (!kms->hw_mdp) {
 		DPU_ERROR("invalid arg(s)\n");
 		return 0;
 	}
@@ -153,9 +153,6 @@ static int _dpu_debugfs_show_regset32(struct seq_file *s, void *data)
 		return 0;
 
 	dev = dpu_kms->dev;
-	if (!dev)
-		return 0;
-
 	priv = dev->dev_private;
 	base = dpu_kms->mmio + regset->offset;
 
@@ -288,9 +285,6 @@ static void dpu_kms_prepare_commit(struct msm_kms *kms,
 		return;
 	dpu_kms = to_dpu_kms(kms);
 	dev = dpu_kms->dev;
-
-	if (!dev)
-		return;
 	priv = dev->dev_private;
 
 	/* Call prepare_commit for all affected encoders */
@@ -461,10 +455,6 @@ static void _dpu_kms_drm_obj_destroy(struct dpu_kms *dpu_kms)
 	struct msm_drm_private *priv;
 	int i;
 
-	if (!dpu_kms->dev) {
-		DPU_ERROR("invalid dev\n");
-		return;
-	}
 	priv = dpu_kms->dev->dev_private;
 
 	for (i = 0; i < priv->num_crtcs; i++)
@@ -496,7 +486,6 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 
 	int primary_planes_idx = 0, cursor_planes_idx = 0, i, ret;
 	int max_crtc_count;
-
 	dev = dpu_kms->dev;
 	priv = dev->dev_private;
 	catalog = dpu_kms->catalog;
@@ -576,8 +565,6 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 	int i;
 
 	dev = dpu_kms->dev;
-	if (!dev)
-		return;
 
 	if (dpu_kms->hw_intr)
 		dpu_hw_intr_destroy(dpu_kms->hw_intr);
@@ -794,11 +781,6 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 
 	dpu_kms = to_dpu_kms(kms);
 	dev = dpu_kms->dev;
-	if (!dev) {
-		DPU_ERROR("invalid device\n");
-		return rc;
-	}
-
 	priv = dev->dev_private;
 
 	atomic_set(&dpu_kms->bandwidth_ref, 0);
@@ -1051,11 +1033,6 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
 	struct dss_module_power *mp = &dpu_kms->mp;
 
 	ddev = dpu_kms->dev;
-	if (!ddev) {
-		DPU_ERROR("invalid drm_device\n");
-		return rc;
-	}
-
 	rc = msm_dss_enable_clk(mp->clk_config, mp->num_clk, false);
 	if (rc)
 		DPU_ERROR("clock disable failed rc:%d\n", rc);
@@ -1073,11 +1050,6 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
 	struct dss_module_power *mp = &dpu_kms->mp;
 
 	ddev = dpu_kms->dev;
-	if (!ddev) {
-		DPU_ERROR("invalid drm_device\n");
-		return rc;
-	}
-
 	rc = msm_dss_enable_clk(mp->clk_config, mp->num_clk, true);
 	if (rc) {
 		DPU_ERROR("clock enable failed rc:%d\n", rc);
-- 
2.20.1

