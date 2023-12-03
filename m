Return-Path: <linux-arm-msm+bounces-3066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEF4801FE1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 01:05:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC0BB1F2112D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 00:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 103F033CD;
	Sun,  3 Dec 2023 00:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VUo5hyzY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 778CC119
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Dec 2023 16:05:39 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50bba815f30so4536679e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Dec 2023 16:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701561938; x=1702166738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2wetDbrUp7wzaYT8YoqkILZjkdOZaiSrBcUzXNmocOY=;
        b=VUo5hyzYfw2dS0ZBXBC+KHJcssz2uazcbf9JELAqX7XgRYAv1bpQsiyitguq223ulU
         k45afYaAIJaywlT5YkFh2G7ROCtx6lKq2oFoNezHRFjqJ7B4aMLNNfnp2UjOGj5keIQo
         WCib9X59Qlob8QDmA1TY8gnBHOmGNo8qAyOAodxULkFHQfBJlSgvHtxGp2fbT9aJ4ynF
         bLuOmJ46dgmLJD12MxwXeG0VuAlhuikhW4Ok/L+t24W+dQbOTu7X2KzrXbWOq/Z+CUjd
         6uebXVmejqUcKGVYPAYc/KIKPyviVNFwVSKntYsR4zHxQV+6YDEpnLFd7Yn+xd4DhEsq
         +Hdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701561938; x=1702166738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2wetDbrUp7wzaYT8YoqkILZjkdOZaiSrBcUzXNmocOY=;
        b=uhe6vcMqGhDKsPW3esEFjCRQfMmL0lfrUk5Qv5vlKfA8h0r3EW7ce5sGXbHX11XU3Z
         PFu8hNHf7RdFdpwOHR5mkD9nGKkAHcJUFxTZ8KYu+LW0U5XTct+akiNHOQTBB4SzAZZf
         yyYhGVRYQnVH14lSxxGd/DXEeB9aTs+v1gtpGX8VNns1l4m+nxTKPDG1a354idG0+ZxM
         a1b6K40V5Fp5K9t5K++OewV71FTHrZawrJ4bC2a67U3JLNd6tcy2OIUF9t2exaXNRjDK
         qMG5UAqauiLs4scfE+yIu45I1z6/utPs6uALVvqSmjejCUulpNCDvemHL5VMSYp3LB0D
         JIgw==
X-Gm-Message-State: AOJu0Yz3zMJotSYl/eSqSmdfMZgX653uwpidv2KBfZf3EJiqSF0FJz24
	HsgIHA7uPENRQggY5CmcIssY0w==
X-Google-Smtp-Source: AGHT+IESMi4Mgc++6MpM8bxtFAp/InWMKWQpyiMp3iYt0NBXebRAcZmsAaZhn2GmXTCD2zsL9XK8hQ==
X-Received: by 2002:a05:6512:6c5:b0:50b:d944:bfcc with SMTP id u5-20020a05651206c500b0050bd944bfccmr1144212lff.142.1701561937829;
        Sat, 02 Dec 2023 16:05:37 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t2-20020a19ad02000000b0050bc5edfa45sm826273lfc.85.2023.12.02.16.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 16:05:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH RESEND 4/5] drm/msm/mdp5: migrate SMP dumping to using atomic_print_state
Date: Sun,  3 Dec 2023 03:05:31 +0300
Message-Id: <20231203000532.1290480-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203000532.1290480-1-dmitry.baryshkov@linaro.org>
References: <20231203000532.1290480-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
index ec933d597e20..cd46c2b0ec0c 100644
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
index b68682c1b5bc..ab5e3ba5aa2f 100644
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


