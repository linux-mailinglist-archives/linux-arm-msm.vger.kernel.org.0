Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 291D0397C9D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 00:44:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235049AbhFAWqR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Jun 2021 18:46:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235080AbhFAWqQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Jun 2021 18:46:16 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2F4BC06174A;
        Tue,  1 Jun 2021 15:44:32 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id jz2-20020a17090b14c2b0290162cf0b5a35so2290606pjb.5;
        Tue, 01 Jun 2021 15:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=isnUI9Z+Tpjtmf0oq/z8ATjisD/zxiV9leo9GMWh2Uc=;
        b=X5G9mBG4Y/eCuBrfzxz6UahNem6fINc+0Z169n9t+3K+MOijJ+V9i52HYOW8ft1Vgi
         2EMPVBwHA5k7FDGQQlP5koqyYWQTbqFy2sxadz9Vk0o1y4aXioQphzUbaqASqb94jIIi
         jZrGx02JSk4TIqhilRq3qlQFGQTLMviYSbA7NEET/dtfr5xxo4GqjQHDgXaXCmZgYCiR
         r5Dgn8tzzNv2n53vNMuix3iBEiJxIZ4hq/N7f2XwjHv6I5GngF5Q/lE9YYQO001fCQYP
         DTaeil1r2eV8DZCsVUZmC+k7nEi77HLnjZpTh/3XjSn8ZaXrUXwjXRQB/5k2R0AxCZZe
         ow4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=isnUI9Z+Tpjtmf0oq/z8ATjisD/zxiV9leo9GMWh2Uc=;
        b=nwqNXSGX1Yj0OWgNLFK0vhKRodwiOeRBrYGzPDmUQxPcoFy496ixK+2o9JchxqNidz
         gmQI0DmHaT9p/XlXmO/btS0IEN1sKEosLegmnweHG2bULrX0rdQHYe5Ye6VSiUxKHmm5
         AQ6SpcslRryI/pucWKy5/9ES+6xjlgcfZx39ff7wrODc1ZTLb7wAWXjpHpzBqtPCiO5h
         ue1EbARls5E5wRPrmn7hDS0Mww+F1RJiFQMLiwJ0HHB0O/KA9XcoC3zXT0NdfWz5WBuK
         hzVpf5yAFOuFGe1XX2Hk1JZxByqOhHWjPmFB5pHfNmwoK9SnintMmKWFf1AybD7UOOeI
         EhwQ==
X-Gm-Message-State: AOAM533xP8zNYBG9KdYzx7glHRsHwZuFfoBF3ReNaridFBRqMs7VaZBD
        Vl9M53pn8JqqK+XkRGzcv2g=
X-Google-Smtp-Source: ABdhPJxAwMQBE9H7tRRFvZO0yFNJxRhug6kXTBJYrI01XcGntlFa4d97Fhhxj7yroyQyi/v5KyReTA==
X-Received: by 2002:a17:902:904a:b029:101:af84:4f55 with SMTP id w10-20020a170902904ab0290101af844f55mr20473811plz.80.1622587472459;
        Tue, 01 Jun 2021 15:44:32 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id d15sm11785668pgu.84.2021.06.01.15.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 15:44:31 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Jordan Crouse <jordan@cosmicpenguin.net>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Zhenzhong Duan <zhenzhong.duan@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 5/6] drm/msm: Add crashdump support for stalled SMMU
Date:   Tue,  1 Jun 2021 15:47:24 -0700
Message-Id: <20210601224750.513996-7-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210601224750.513996-1-robdclark@gmail.com>
References: <20210601224750.513996-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

For collecting devcoredumps with the SMMU stalled after an iova fault,
we need to skip the parts of the GPU state which are normally collected
with the hw crashdumper, since with the SMMU stalled the hw would be
unable to write out the requested state to memory.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c       |  2 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c       |  2 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c       |  2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |  5 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h       |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 43 ++++++++++++++++-----
 drivers/gpu/drm/msm/msm_debugfs.c           |  2 +-
 drivers/gpu/drm/msm/msm_gpu.c               |  7 ++--
 drivers/gpu/drm/msm/msm_gpu.h               |  2 +-
 9 files changed, 47 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index bdc989183c64..d2c31fae64fd 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -434,7 +434,7 @@ static void a2xx_dump(struct msm_gpu *gpu)
 	adreno_dump(gpu);
 }
 
-static struct msm_gpu_state *a2xx_gpu_state_get(struct msm_gpu *gpu)
+static struct msm_gpu_state *a2xx_gpu_state_get(struct msm_gpu *gpu, bool stalled)
 {
 	struct msm_gpu_state *state = kzalloc(sizeof(*state), GFP_KERNEL);
 
diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index 4534633fe7cd..b1a6f87d74ef 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -464,7 +464,7 @@ static void a3xx_dump(struct msm_gpu *gpu)
 	adreno_dump(gpu);
 }
 
-static struct msm_gpu_state *a3xx_gpu_state_get(struct msm_gpu *gpu)
+static struct msm_gpu_state *a3xx_gpu_state_get(struct msm_gpu *gpu, bool stalled)
 {
 	struct msm_gpu_state *state = kzalloc(sizeof(*state), GFP_KERNEL);
 
diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index 82bebb40234d..22780a594d6f 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -549,7 +549,7 @@ static const unsigned int a405_registers[] = {
 	~0 /* sentinel */
 };
 
-static struct msm_gpu_state *a4xx_gpu_state_get(struct msm_gpu *gpu)
+static struct msm_gpu_state *a4xx_gpu_state_get(struct msm_gpu *gpu, bool stalled)
 {
 	struct msm_gpu_state *state = kzalloc(sizeof(*state), GFP_KERNEL);
 
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index a0eef5d9b89b..2e7714b1a17f 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1519,7 +1519,7 @@ static void a5xx_gpu_state_get_hlsq_regs(struct msm_gpu *gpu,
 	msm_gem_kernel_put(dumper.bo, gpu->aspace, true);
 }
 
-static struct msm_gpu_state *a5xx_gpu_state_get(struct msm_gpu *gpu)
+static struct msm_gpu_state *a5xx_gpu_state_get(struct msm_gpu *gpu, bool stalled)
 {
 	struct a5xx_gpu_state *a5xx_state = kzalloc(sizeof(*a5xx_state),
 			GFP_KERNEL);
@@ -1536,7 +1536,8 @@ static struct msm_gpu_state *a5xx_gpu_state_get(struct msm_gpu *gpu)
 	a5xx_state->base.rbbm_status = gpu_read(gpu, REG_A5XX_RBBM_STATUS);
 
 	/* Get the HLSQ regs with the help of the crashdumper */
-	a5xx_gpu_state_get_hlsq_regs(gpu, a5xx_state);
+	if (!stalled)
+		a5xx_gpu_state_get_hlsq_regs(gpu, a5xx_state);
 
 	a5xx_set_hwcg(gpu, true);
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index ce0610c5256f..e0f06ce4e1a9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -86,7 +86,7 @@ unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu);
 void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 		struct drm_printer *p);
 
-struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu);
+struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu, bool stalled);
 int a6xx_gpu_state_put(struct msm_gpu_state *state);
 
 #endif /* __A6XX_GPU_H__ */
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index c1699b4f9a89..d0af68a76c4f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -833,6 +833,21 @@ static void a6xx_get_registers(struct msm_gpu *gpu,
 				a6xx_state, &a6xx_vbif_reglist,
 				&a6xx_state->registers[index++]);
 
+	if (!dumper) {
+		/*
+		 * We can't use the crashdumper when the SMMU is stalled,
+		 * because the GPU has no memory access until we resume
+		 * translation (but we don't want to do that until after
+		 * we have captured as much useful GPU state as possible).
+		 * So instead collect registers via the CPU:
+		 */
+		for (i = 0; i < ARRAY_SIZE(a6xx_reglist); i++)
+			a6xx_get_ahb_gpu_registers(gpu,
+				a6xx_state, &a6xx_reglist[i],
+				&a6xx_state->registers[index++]);
+		return;
+	}
+
 	for (i = 0; i < ARRAY_SIZE(a6xx_reglist); i++)
 		a6xx_get_crashdumper_registers(gpu,
 			a6xx_state, &a6xx_reglist[i],
@@ -903,9 +918,9 @@ static void a6xx_get_indexed_registers(struct msm_gpu *gpu,
 	a6xx_state->nr_indexed_regs = count;
 }
 
-struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
+struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu, bool stalled)
 {
-	struct a6xx_crashdumper dumper = { 0 };
+	struct a6xx_crashdumper _dumper = { 0 }, *dumper = NULL;
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gpu_state *a6xx_state = kzalloc(sizeof(*a6xx_state),
@@ -928,14 +943,24 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
 	/* Get the banks of indexed registers */
 	a6xx_get_indexed_registers(gpu, a6xx_state);
 
-	/* Try to initialize the crashdumper */
-	if (!a6xx_crashdumper_init(gpu, &dumper)) {
-		a6xx_get_registers(gpu, a6xx_state, &dumper);
-		a6xx_get_shaders(gpu, a6xx_state, &dumper);
-		a6xx_get_clusters(gpu, a6xx_state, &dumper);
-		a6xx_get_dbgahb_clusters(gpu, a6xx_state, &dumper);
+	/*
+	 * Try to initialize the crashdumper, if we are not dumping state
+	 * with the SMMU stalled.  The crashdumper needs memory access to
+	 * write out GPU state, so we need to skip this when the SMMU is
+	 * stalled in response to an iova fault
+	 */
+	if (!stalled && !a6xx_crashdumper_init(gpu, &_dumper)) {
+		dumper = &_dumper;
+	}
+
+	a6xx_get_registers(gpu, a6xx_state, dumper);
+
+	if (dumper) {
+		a6xx_get_shaders(gpu, a6xx_state, dumper);
+		a6xx_get_clusters(gpu, a6xx_state, dumper);
+		a6xx_get_dbgahb_clusters(gpu, a6xx_state, dumper);
 
-		msm_gem_kernel_put(dumper.bo, gpu->aspace, true);
+		msm_gem_kernel_put(dumper->bo, gpu->aspace, true);
 	}
 
 	if (snapshot_debugbus)
diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 7a2b53d35e6b..90558e826934 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -77,7 +77,7 @@ static int msm_gpu_open(struct inode *inode, struct file *file)
 		goto free_priv;
 
 	pm_runtime_get_sync(&gpu->pdev->dev);
-	show_priv->state = gpu->funcs->gpu_state_get(gpu);
+	show_priv->state = gpu->funcs->gpu_state_get(gpu, false);
 	pm_runtime_put_sync(&gpu->pdev->dev);
 
 	mutex_unlock(&dev->struct_mutex);
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index fa7691cb4614..4d280bf446e6 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -381,7 +381,8 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 }
 
 static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
-		struct msm_gem_submit *submit, char *comm, char *cmd)
+		struct msm_gem_submit *submit, char *comm, char *cmd,
+		bool stalled)
 {
 	struct msm_gpu_state *state;
 
@@ -393,7 +394,7 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 	if (gpu->crashstate)
 		return;
 
-	state = gpu->funcs->gpu_state_get(gpu);
+	state = gpu->funcs->gpu_state_get(gpu, stalled);
 	if (IS_ERR_OR_NULL(state))
 		return;
 
@@ -519,7 +520,7 @@ static void recover_worker(struct kthread_work *work)
 
 	/* Record the crash state */
 	pm_runtime_get_sync(&gpu->pdev->dev);
-	msm_gpu_crashstate_capture(gpu, submit, comm, cmd);
+	msm_gpu_crashstate_capture(gpu, submit, comm, cmd, false);
 	pm_runtime_put_sync(&gpu->pdev->dev);
 
 	kfree(cmd);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 7a082a12d98f..c15e5fd675d2 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -60,7 +60,7 @@ struct msm_gpu_funcs {
 	void (*debugfs_init)(struct msm_gpu *gpu, struct drm_minor *minor);
 #endif
 	unsigned long (*gpu_busy)(struct msm_gpu *gpu);
-	struct msm_gpu_state *(*gpu_state_get)(struct msm_gpu *gpu);
+	struct msm_gpu_state *(*gpu_state_get)(struct msm_gpu *gpu, bool stalled);
 	int (*gpu_state_put)(struct msm_gpu_state *state);
 	unsigned long (*gpu_get_freq)(struct msm_gpu *gpu);
 	void (*gpu_set_freq)(struct msm_gpu *gpu, struct dev_pm_opp *opp);
-- 
2.31.1

