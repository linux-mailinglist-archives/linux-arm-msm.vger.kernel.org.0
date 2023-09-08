Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8374D7980D5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Sep 2023 05:05:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237097AbjIHDFy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Sep 2023 23:05:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239071AbjIHDFu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Sep 2023 23:05:50 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 644891BF0
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Sep 2023 20:05:27 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-501b9f27eb2so3376599e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Sep 2023 20:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694142325; x=1694747125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5V2moM74QexHMbOp4cuuljBHqFyjYq89MsynficzNtY=;
        b=Bv//F+EKh5HEdj8/s9RgRF/NadtO7+ViiK8dP6gMhfVSw5REePyeZRci66ToXK45rX
         Okq0hxBTegm7tYTH2gAxn9jFa/e6MHqfm75C4ixU8yesmtgA/AmCy96m7wpdcIFH7j0S
         Bh/gfX6TYEOnNDIiwGhLLx7/zqFWrPaGCWpWeYEs8adHG+lmExU60u1gxaKew6Ok6YUl
         v6cea8qBOUnaSSIWilbusSX3Qevf9geMlU7CP4SqB282gbxCRIfJ22mIECBJQ2mi6mLK
         xYrdLiel3zSzuP9+rDHKaTLwP7sSr8vC3WpVmoP9x3vvD7WCh0VrGk8KBgEEOJ/Uk7pL
         2Tcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694142325; x=1694747125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5V2moM74QexHMbOp4cuuljBHqFyjYq89MsynficzNtY=;
        b=lFv6rzKkd/BBtDxNJPIhsFhDSFslpFZ4/q6rWheyggzQ9ldrIfVBur8mrMOcjp112D
         ITyElvgurGs/XpdLUE8yeKkG8faoGxc8A2xa/ZmOLFNw7sI1um0mjWPThW5mc5PNqF+v
         TKBBv+pUJ2V2DMPxGWP6yJDJg4R9aFwG8puupGDiKZmL1Kqgf3jLkLREpUTTp7DCuz1a
         mDG8VkenSbz63o0Hln+oNbrUUGNLMJtVKUnSCmPfRTUATkpi7BFlvm6tl4Gvg1e82J7H
         QEAADIfZt5Thq9MioQFTZgbNScGqiOoGlnjza93s6P+lQJc/hCdAxEJjQO2Wxnr0QkKR
         PfRA==
X-Gm-Message-State: AOJu0YyjA5msOxtvBBMPy9CLMBF2i6B6fPTWMheUyfgHDt9xdw3KyfxZ
        DEdTNcGkKOMOfj826piA4e4pWQ==
X-Google-Smtp-Source: AGHT+IEizXBa/7aXIZMWg4PlZaHGLsSORoT4AXZ2mHtzZvawmfP5hzaTVRaNUThXYIBeMJ3WZO2B0w==
X-Received: by 2002:a05:6512:12ca:b0:501:ca56:39d8 with SMTP id p10-20020a05651212ca00b00501ca5639d8mr1632545lfg.32.1694142325586;
        Thu, 07 Sep 2023 20:05:25 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z10-20020a2e8e8a000000b002b93d66b82asm128332ljk.112.2023.09.07.20.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 20:05:25 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 4/5] drm/msm/mdp5: migrate SMP dumping to using atomic_print_state
Date:   Fri,  8 Sep 2023 06:05:20 +0300
Message-Id: <20230908030521.236309-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230908030521.236309-1-dmitry.baryshkov@linaro.org>
References: <20230908030521.236309-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_FILL_THIS_FORM_SHORT autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Shared Memory Pool (SMP) state is a part of the MDP5's private
object state. Use existing infrastructure, atomic_print_state()
callback, to dump SMP state (which also makes it included into
debugfs/dri/N/state). This allows us to drop the custom debugfs file
too.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c |  2 --
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 46 ++++++------------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c | 12 ++-----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h |  4 ++-
 4 files changed, 15 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c
index 43443a435d59..b40ed3a847c8 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c
@@ -31,8 +31,6 @@ static void mdp5_irq_error_handler(struct mdp_irq *irq, uint32_t irqstatus)
 	if (dumpstate && __ratelimit(&rs)) {
 		struct drm_printer p = drm_info_printer(mdp5_kms->dev->dev);
 		drm_state_dump(mdp5_kms->dev, &p);
-		if (mdp5_kms->smp)
-			mdp5_smp_dump(mdp5_kms->smp, &p);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 92bf9d949d09..4d51a736d1d0 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -119,9 +119,19 @@ static void mdp5_global_destroy_state(struct drm_private_obj *obj,
 	kfree(mdp5_state);
 }
 
+static void mdp5_global_print_state(struct drm_printer *p,
+				    const struct drm_private_state *state)
+{
+	struct mdp5_global_state *mdp5_state = to_mdp5_global_state(state);
+
+	if (mdp5_state->mdp5_kms->smp)
+		mdp5_smp_dump(mdp5_state->mdp5_kms->smp, p, mdp5_state);
+}
+
 static const struct drm_private_state_funcs mdp5_global_state_funcs = {
 	.atomic_duplicate_state = mdp5_global_duplicate_state,
 	.atomic_destroy_state = mdp5_global_destroy_state,
+	.atomic_print_state = mdp5_global_print_state,
 };
 
 static int mdp5_global_obj_init(struct mdp5_kms *mdp5_kms)
@@ -226,39 +236,6 @@ static void mdp5_kms_destroy(struct msm_kms *kms)
 	mdp5_destroy(mdp5_kms);
 }
 
-#ifdef CONFIG_DEBUG_FS
-static int smp_show(struct seq_file *m, void *arg)
-{
-	struct drm_info_node *node = m->private;
-	struct drm_device *dev = node->minor->dev;
-	struct msm_drm_private *priv = dev->dev_private;
-	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
-	struct drm_printer p = drm_seq_file_printer(m);
-
-	if (!mdp5_kms->smp) {
-		drm_printf(&p, "no SMP pool\n");
-		return 0;
-	}
-
-	mdp5_smp_dump(mdp5_kms->smp, &p);
-
-	return 0;
-}
-
-static struct drm_info_list mdp5_debugfs_list[] = {
-		{"smp", smp_show },
-};
-
-static int mdp5_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
-{
-	drm_debugfs_create_files(mdp5_debugfs_list,
-				 ARRAY_SIZE(mdp5_debugfs_list),
-				 minor->debugfs_root, minor);
-
-	return 0;
-}
-#endif
-
 static const struct mdp_kms_funcs kms_funcs = {
 	.base = {
 		.hw_init         = mdp5_hw_init,
@@ -277,9 +254,6 @@ static const struct mdp_kms_funcs kms_funcs = {
 		.get_format      = mdp_get_format,
 		.set_split_display = mdp5_set_split_display,
 		.destroy         = mdp5_kms_destroy,
-#ifdef CONFIG_DEBUG_FS
-		.debugfs_init    = mdp5_kms_debugfs_init,
-#endif
 	},
 	.set_irqmask         = mdp5_set_irqmask,
 };
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
index 56a3063545ec..9a51fbf93cc4 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
@@ -325,22 +325,17 @@ void mdp5_smp_complete_commit(struct mdp5_smp *smp, struct mdp5_smp_state *state
 	state->released = 0;
 }
 
-void mdp5_smp_dump(struct mdp5_smp *smp, struct drm_printer *p)
+void mdp5_smp_dump(struct mdp5_smp *smp, struct drm_printer *p,
+		   struct mdp5_global_state *global_state)
 {
 	struct mdp5_kms *mdp5_kms = get_kms(smp);
 	struct mdp5_hw_pipe_state *hwpstate;
 	struct mdp5_smp_state *state;
-	struct mdp5_global_state *global_state;
 	int total = 0, i, j;
 
 	drm_printf(p, "name\tinuse\tplane\n");
 	drm_printf(p, "----\t-----\t-----\n");
 
-	if (drm_can_sleep())
-		drm_modeset_lock(&mdp5_kms->glob_state_lock, NULL);
-
-	global_state = mdp5_get_existing_global_state(mdp5_kms);
-
 	/* grab these *after* we hold the state_lock */
 	hwpstate = &global_state->hwpipe;
 	state = &global_state->smp;
@@ -365,9 +360,6 @@ void mdp5_smp_dump(struct mdp5_smp *smp, struct drm_printer *p)
 	drm_printf(p, "TOTAL:\t%d\t(of %d)\n", total, smp->blk_cnt);
 	drm_printf(p, "AVAIL:\t%d\n", smp->blk_cnt -
 			bitmap_weight(state->state, smp->blk_cnt));
-
-	if (drm_can_sleep())
-		drm_modeset_unlock(&mdp5_kms->glob_state_lock);
 }
 
 void mdp5_smp_destroy(struct mdp5_smp *smp)
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h
index ba5618e136c3..7a24c887760b 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h
@@ -70,7 +70,9 @@ struct mdp5_smp *mdp5_smp_init(struct mdp5_kms *mdp5_kms,
 		const struct mdp5_smp_block *cfg);
 void  mdp5_smp_destroy(struct mdp5_smp *smp);
 
-void mdp5_smp_dump(struct mdp5_smp *smp, struct drm_printer *p);
+struct mdp5_global_state;
+void mdp5_smp_dump(struct mdp5_smp *smp, struct drm_printer *p,
+		   struct mdp5_global_state *global_state);
 
 uint32_t mdp5_smp_calculate(struct mdp5_smp *smp,
 		const struct mdp_format *format,
-- 
2.39.2

