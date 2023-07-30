Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF45768300
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jul 2023 03:01:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjG3BBM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jul 2023 21:01:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbjG3BBL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jul 2023 21:01:11 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DE271BEB
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 18:01:10 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b962535808so52150301fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 18:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690678868; x=1691283668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zYk7sFCnTIUr3ScslaaaKroo3wLiuzkTgGZR1KjuiQ8=;
        b=eq64T2Dao/5/+KOqx7PvJrND/HfGtx/WYVygokM1jSScfATQ54vnhoYTD5VPckrNmw
         bSs7nGgcMzYbEtOqX+m7+Mn2WnqIANA258rpG6R+n1v//C7mj/LxggycaJ9QOy3daKFd
         3gQMY3VItOnuO2MCXGiUU7vz4NCyYaU/PD56xHeHLJMTCJzXanLo/dpQSBUzsunjjBvt
         Ce+frAP/hrRVFLRWkn8qjlFhp9IGdEpQMMf0AktF5tt6DxxZLgycJsvdT2nk8c60C2dt
         VLt9xdDqnrJCQE4tEGjddmcpaAOxcuR9Y8L0HssASoYTSG4/+HOpiIRi2hWy6VlAPSRU
         otSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690678868; x=1691283668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zYk7sFCnTIUr3ScslaaaKroo3wLiuzkTgGZR1KjuiQ8=;
        b=In+dgdtCz+pj8ZQHOAV97S7JNM+morEF/t7C2mJ+b02DrxVRWykHq+Bk9K9hwZnJyA
         aEfbrKerqNW7W/dDderbi2R+BrWWR4zIiJFqrli4tor/8b7Z7cuJwZMNv4bCsbzzgbdt
         0jSsqSu6xxfFo2ZUimR1K66uPSwF5UQ8Y8xlJDMw2bUw8ga2D1DuCi4eFngPFxrkUHAn
         MRS/Ae5kO1DHCRQJMAVL6c8wDvVK71GM0sqwEt5oiz7fhETcwxvs+sMayiT7X5QajFIN
         EEjJ+xRQ79xRUJDBrXoVUazuGvdw5m/CZbsQpL0EjS4uQ7k9e7v4aXcAGJhzFmKyfmSC
         oi/A==
X-Gm-Message-State: ABy/qLZbjbf2u1ez6Gk4/A2riVIXiA5ZMhDH+fI3YTiaCXS749YCdKjz
        6A8rNV8BhVByFzxpT8VuvdbC7w==
X-Google-Smtp-Source: APBJJlFG3dIjq53nQ7K6VqiUL7Lv1c8GKjkP/TnQizo7Cl8ARoHKdNS4k0eGZjOef5zlbef53YkgvA==
X-Received: by 2002:a2e:9050:0:b0:2b9:bf49:901b with SMTP id n16-20020a2e9050000000b002b9bf49901bmr4167134ljg.6.1690678868360;
        Sat, 29 Jul 2023 18:01:08 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 22-20020a05651c009600b002b9e501a6acsm169898ljq.3.2023.07.29.18.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 18:01:07 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v5 06/10] drm/msm/dpu: use dpu_perf_cfg in DPU core_perf code
Date:   Sun, 30 Jul 2023 04:00:58 +0300
Message-Id: <20230730010102.350713-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730010102.350713-1-dmitry.baryshkov@linaro.org>
References: <20230730010102.350713-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Simplify dpu_core_perf code by using only dpu_perf_cfg instead of using
full-featured catalog data.

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 73 ++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  2 +-
 3 files changed, 35 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 209e4fcca663..f9585d717902 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -33,11 +33,11 @@ enum dpu_perf_mode {
 
 /**
  * _dpu_core_perf_calc_bw() - to calculate BW per crtc
- * @kms:  pointer to the dpu_kms
+ * @perf_cfg: performance configuration
  * @crtc: pointer to a crtc
  * Return: returns aggregated BW for all planes in crtc.
  */
-static u64 _dpu_core_perf_calc_bw(struct dpu_kms *kms,
+static u64 _dpu_core_perf_calc_bw(const struct dpu_perf_cfg *perf_cfg,
 		struct drm_crtc *crtc)
 {
 	struct drm_plane *plane;
@@ -53,7 +53,7 @@ static u64 _dpu_core_perf_calc_bw(struct dpu_kms *kms,
 		crtc_plane_bw += pstate->plane_fetch_bw;
 	}
 
-	bw_factor = kms->catalog->perf->bw_inefficiency_factor;
+	bw_factor = perf_cfg->bw_inefficiency_factor;
 	if (bw_factor) {
 		crtc_plane_bw *= bw_factor;
 		do_div(crtc_plane_bw, 100);
@@ -64,12 +64,12 @@ static u64 _dpu_core_perf_calc_bw(struct dpu_kms *kms,
 
 /**
  * _dpu_core_perf_calc_clk() - to calculate clock per crtc
- * @kms:  pointer to the dpu_kms
+ * @perf_cfg: performance configuration
  * @crtc: pointer to a crtc
  * @state: pointer to a crtc state
  * Return: returns max clk for all planes in crtc.
  */
-static u64 _dpu_core_perf_calc_clk(struct dpu_kms *kms,
+static u64 _dpu_core_perf_calc_clk(const struct dpu_perf_cfg *perf_cfg,
 		struct drm_crtc *crtc, struct drm_crtc_state *state)
 {
 	struct drm_plane *plane;
@@ -90,7 +90,7 @@ static u64 _dpu_core_perf_calc_clk(struct dpu_kms *kms,
 		crtc_clk = max(pstate->plane_clk, crtc_clk);
 	}
 
-	clk_factor = kms->catalog->perf->clk_inefficiency_factor;
+	clk_factor = perf_cfg->clk_inefficiency_factor;
 	if (clk_factor) {
 		crtc_clk *= clk_factor;
 		do_div(crtc_clk, 100);
@@ -106,30 +106,32 @@ static struct dpu_kms *_dpu_crtc_get_kms(struct drm_crtc *crtc)
 	return to_dpu_kms(priv->kms);
 }
 
-static void _dpu_core_perf_calc_crtc(struct dpu_kms *kms,
-		struct drm_crtc *crtc,
-		struct drm_crtc_state *state,
-		struct dpu_core_perf_params *perf)
+static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
+				     struct drm_crtc *crtc,
+				     struct drm_crtc_state *state,
+				     struct dpu_core_perf_params *perf)
 {
-	if (!kms || !kms->catalog || !crtc || !state || !perf) {
+	const struct dpu_perf_cfg *perf_cfg = core_perf->perf_cfg;
+
+	if (!perf_cfg || !crtc || !state || !perf) {
 		DPU_ERROR("invalid parameters\n");
 		return;
 	}
 
 	memset(perf, 0, sizeof(struct dpu_core_perf_params));
 
-	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
+	if (core_perf->perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
 		perf->bw_ctl = 0;
 		perf->max_per_pipe_ib = 0;
 		perf->core_clk_rate = 0;
-	} else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
-		perf->bw_ctl = kms->perf.fix_core_ab_vote;
-		perf->max_per_pipe_ib = kms->perf.fix_core_ib_vote;
-		perf->core_clk_rate = kms->perf.fix_core_clk_rate;
+	} else if (core_perf->perf_tune.mode == DPU_PERF_MODE_FIXED) {
+		perf->bw_ctl = core_perf->fix_core_ab_vote;
+		perf->max_per_pipe_ib = core_perf->fix_core_ib_vote;
+		perf->core_clk_rate = core_perf->fix_core_clk_rate;
 	} else {
-		perf->bw_ctl = _dpu_core_perf_calc_bw(kms, crtc);
-		perf->max_per_pipe_ib = kms->catalog->perf->min_dram_ib;
-		perf->core_clk_rate = _dpu_core_perf_calc_clk(kms, crtc, state);
+		perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
+		perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
+		perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
 	}
 
 	DRM_DEBUG_ATOMIC(
@@ -154,10 +156,6 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 	}
 
 	kms = _dpu_crtc_get_kms(crtc);
-	if (!kms->catalog) {
-		DPU_ERROR("invalid parameters\n");
-		return 0;
-	}
 
 	/* we only need bandwidth check on real-time clients (interfaces) */
 	if (dpu_crtc_get_client_type(crtc) == NRT_CLIENT)
@@ -166,7 +164,7 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 	dpu_cstate = to_dpu_crtc_state(state);
 
 	/* obtain new values */
-	_dpu_core_perf_calc_crtc(kms, crtc, state, &dpu_cstate->new_perf);
+	_dpu_core_perf_calc_crtc(&kms->perf, crtc, state, &dpu_cstate->new_perf);
 
 	bw_sum_of_intfs = dpu_cstate->new_perf.bw_ctl;
 	curr_client_type = dpu_crtc_get_client_type(crtc);
@@ -189,7 +187,7 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 		bw = DIV_ROUND_UP_ULL(bw_sum_of_intfs, 1000);
 		DRM_DEBUG_ATOMIC("calculated bandwidth=%uk\n", bw);
 
-		threshold = kms->catalog->perf->max_bw_high;
+		threshold = kms->perf.perf_cfg->max_bw_high;
 
 		DRM_DEBUG_ATOMIC("final threshold bw limit = %d\n", threshold);
 
@@ -265,11 +263,6 @@ void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc)
 	}
 
 	kms = _dpu_crtc_get_kms(crtc);
-	if (!kms->catalog) {
-		DPU_ERROR("invalid kms\n");
-		return;
-	}
-
 	dpu_crtc = to_dpu_crtc(crtc);
 
 	if (atomic_dec_return(&kms->bandwidth_ref) > 0)
@@ -326,10 +319,6 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 	}
 
 	kms = _dpu_crtc_get_kms(crtc);
-	if (!kms->catalog) {
-		DPU_ERROR("invalid kms\n");
-		return -EINVAL;
-	}
 
 	dpu_crtc = to_dpu_crtc(crtc);
 	dpu_cstate = to_dpu_crtc_state(crtc->state);
@@ -461,7 +450,6 @@ static const struct file_operations dpu_core_perf_mode_fops = {
 int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 {
 	struct dpu_core_perf *perf = &dpu_kms->perf;
-	const struct dpu_mdss_cfg *catalog = perf->catalog;
 	struct dentry *entry;
 
 	entry = debugfs_create_dir("core_perf", parent);
@@ -473,15 +461,15 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 	debugfs_create_u32("enable_bw_release", 0600, entry,
 			(u32 *)&perf->enable_bw_release);
 	debugfs_create_u32("threshold_low", 0600, entry,
-			(u32 *)&catalog->perf->max_bw_low);
+			(u32 *)&perf->perf_cfg->max_bw_low);
 	debugfs_create_u32("threshold_high", 0600, entry,
-			(u32 *)&catalog->perf->max_bw_high);
+			(u32 *)&perf->perf_cfg->max_bw_high);
 	debugfs_create_u32("min_core_ib", 0600, entry,
-			(u32 *)&catalog->perf->min_core_ib);
+			(u32 *)&perf->perf_cfg->min_core_ib);
 	debugfs_create_u32("min_llcc_ib", 0600, entry,
-			(u32 *)&catalog->perf->min_llcc_ib);
+			(u32 *)&perf->perf_cfg->min_llcc_ib);
 	debugfs_create_u32("min_dram_ib", 0600, entry,
-			(u32 *)&catalog->perf->min_dram_ib);
+			(u32 *)&perf->perf_cfg->min_dram_ib);
 	debugfs_create_file("perf_mode", 0600, entry,
 			(u32 *)perf, &dpu_core_perf_mode_fops);
 	debugfs_create_u64("fix_core_clk_rate", 0600, entry,
@@ -504,17 +492,16 @@ void dpu_core_perf_destroy(struct dpu_core_perf *perf)
 
 	perf->max_core_clk_rate = 0;
 	perf->core_clk = NULL;
-	perf->catalog = NULL;
 	perf->dev = NULL;
 }
 
 int dpu_core_perf_init(struct dpu_core_perf *perf,
 		struct drm_device *dev,
-		const struct dpu_mdss_cfg *catalog,
+		const struct dpu_perf_cfg *perf_cfg,
 		struct clk *core_clk)
 {
 	perf->dev = dev;
-	perf->catalog = catalog;
+	perf->perf_cfg = perf_cfg;
 	perf->core_clk = core_clk;
 
 	perf->max_core_clk_rate = clk_get_rate(core_clk);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index c0097b67f9dd..f4b84e67138c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -38,7 +38,7 @@ struct dpu_core_perf_tune {
  * struct dpu_core_perf - definition of core performance context
  * @dev: Pointer to drm device
  * @debugfs_root: top level debug folder
- * @catalog: Pointer to catalog configuration
+ * @perf_cfg: Platform-specific performance configuration
  * @core_clk: Pointer to the core clock
  * @core_clk_rate: current core clock rate
  * @max_core_clk_rate: maximum allowable core clock rate
@@ -51,7 +51,7 @@ struct dpu_core_perf_tune {
 struct dpu_core_perf {
 	struct drm_device *dev;
 	struct dentry *debugfs_root;
-	const struct dpu_mdss_cfg *catalog;
+	const struct dpu_perf_cfg *perf_cfg;
 	struct clk *core_clk;
 	u64 core_clk_rate;
 	u64 max_core_clk_rate;
@@ -96,12 +96,12 @@ void dpu_core_perf_destroy(struct dpu_core_perf *perf);
  * dpu_core_perf_init - initialize the given core performance context
  * @perf: Pointer to core performance context
  * @dev: Pointer to drm device
- * @catalog: Pointer to catalog
+ * @perf_cfg: Pointer to platform performance configuration
  * @core_clk: pointer to core clock
  */
 int dpu_core_perf_init(struct dpu_core_perf *perf,
 		struct drm_device *dev,
-		const struct dpu_mdss_cfg *catalog,
+		const struct dpu_perf_cfg *perf_cfg,
 		struct clk *core_clk);
 
 struct dpu_kms;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index c1d06e19b237..074c032cd24e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1156,7 +1156,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		dpu_kms->hw_vbif[vbif->id] = hw;
 	}
 
-	rc = dpu_core_perf_init(&dpu_kms->perf, dev, dpu_kms->catalog,
+	rc = dpu_core_perf_init(&dpu_kms->perf, dev, dpu_kms->catalog->perf,
 			msm_clk_bulk_get_clock(dpu_kms->clocks, dpu_kms->num_clocks, "core"));
 	if (rc) {
 		DPU_ERROR("failed to init perf %d\n", rc);
-- 
2.39.2

