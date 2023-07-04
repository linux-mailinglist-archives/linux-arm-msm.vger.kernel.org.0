Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D68B27474CD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 17:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231610AbjGDPEI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jul 2023 11:04:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231615AbjGDPEH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jul 2023 11:04:07 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2836110CA
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 08:04:05 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b6f9edac8dso9748661fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 08:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688483043; x=1691075043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HDgrNStW4Ac/FWj3/7ye1MA3iDkfpt5tbCAwpxZ603w=;
        b=pAtZpyLYqx8z8qmYXduzZPnwfOjxHBSj8AyIjexB7eOgefzmNdgR96/HcLGaQUuDZb
         FLamT+znK6e/ikJiLy80wgl38fzHqaZhJ2tX5O/Q1VF8h9l08j6aeDTIxv2Cv26OwOaz
         6pA20EDxUjGjISdqofh71TfF171YCbZJpGcSxRPNOQ5h9NTAbY9y4G4asFRU4nWeJcZi
         IKLosGwYi4YXmPibR8vtKFd0wVMnM+caCO3fEqq3nBk0CsTpzmut4mKpmURjBIM7zYeJ
         WcAxQYbVZFh6vtZXXt6X4N/OMN7ySnS2ruPga2LPZpQ4uXUUrDdt+BUAbHmu0c98Cs1V
         VEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688483043; x=1691075043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HDgrNStW4Ac/FWj3/7ye1MA3iDkfpt5tbCAwpxZ603w=;
        b=TabmMR+1BVfZVjrFAmMQwjs0j4jKwquqNLBi7gHsU4uQMs3cfNwHqbrBVUtKR9oMQh
         uVuvrIP9BWptZHgJHuSqdNtr6iDDMONVI7H/QrF3pqHTzdACHeikY465sTwFyqpioPlX
         C6wdKYfWXCq36ra02RwvYH8slFHv5fexATXE5m2jeTr+nFegr8bYNG3wnYqyaqHy035n
         mVRDErVVeJcqVrNUmYy7hzhn3vS5OFu3EtLhZ95Lm0IR+M4FSKChlPfMUiMGIhmNOulV
         C9kwxH8bpECPGKJwkv+fnXFLXno3oyenrgBnC9/9SK7BLK3FxtShynmCOQ57RyW/RLD1
         Z1eQ==
X-Gm-Message-State: ABy/qLZcXX4T5SHOgswrlPbxqZyVHjcZ6mHXTqO2LJTAJJ7vf+NwfaxH
        kwgy7oUqCFkml3Hi8h4093dpbg==
X-Google-Smtp-Source: APBJJlFB/plDqrxl3IkEcOmRFgWfHM5KSLpmaomd/brp3qmz9LIqpIplvn3Efk4d1pGvrjUH7RNiFw==
X-Received: by 2002:a2e:81d3:0:b0:2b6:ef5d:965c with SMTP id s19-20020a2e81d3000000b002b6ef5d965cmr3023199ljg.44.1688483043446;
        Tue, 04 Jul 2023 08:04:03 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j10-20020a2e850a000000b002b6ca539d92sm3337354lji.138.2023.07.04.08.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:04:03 -0700 (PDT)
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
Subject: [PATCH v2 10/14] drm/msm/dpu: use dpu_perf_cfg in DPU core_perf code
Date:   Tue,  4 Jul 2023 18:03:50 +0300
Message-Id: <20230704150354.159882-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230704150354.159882-1-dmitry.baryshkov@linaro.org>
References: <20230704150354.159882-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Simplify dpu_core_perf code by using only dpu_perf_cfg instead of using
full-featured catalog data.

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 58 +++++++------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  8 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  2 +-
 3 files changed, 27 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index f15efaaaf9fa..e9c7d398d9cb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -19,11 +19,11 @@
 
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
@@ -39,7 +39,7 @@ static u64 _dpu_core_perf_calc_bw(struct dpu_kms *kms,
 		crtc_plane_bw += pstate->plane_fetch_bw;
 	}
 
-	bw_factor = kms->catalog->perf->bw_inefficiency_factor;
+	bw_factor = perf_cfg->bw_inefficiency_factor;
 	if (bw_factor) {
 		crtc_plane_bw *= bw_factor;
 		do_div(crtc_plane_bw, 100);
@@ -50,12 +50,12 @@ static u64 _dpu_core_perf_calc_bw(struct dpu_kms *kms,
 
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
@@ -76,7 +76,7 @@ static u64 _dpu_core_perf_calc_clk(struct dpu_kms *kms,
 		crtc_clk = max(pstate->plane_clk, crtc_clk);
 	}
 
-	clk_factor = kms->catalog->perf->clk_inefficiency_factor;
+	clk_factor = perf_cfg->clk_inefficiency_factor;
 	if (clk_factor) {
 		crtc_clk *= clk_factor;
 		do_div(crtc_clk, 100);
@@ -92,18 +92,18 @@ static struct dpu_kms *_dpu_crtc_get_kms(struct drm_crtc *crtc)
 	return to_dpu_kms(priv->kms);
 }
 
-static void _dpu_core_perf_calc_crtc(struct dpu_kms *kms,
+static void _dpu_core_perf_calc_crtc(const struct dpu_perf_cfg *perf_cfg,
 		struct drm_crtc *crtc,
 		struct drm_crtc_state *state,
 		struct dpu_core_perf_params *perf)
 {
-	if (!kms || !kms->catalog || !crtc || !state || !perf) {
+	if (!perf_cfg || !crtc || !state || !perf) {
 		DPU_ERROR("invalid parameters\n");
 		return;
 	}
 
-	perf->bw_ctl = _dpu_core_perf_calc_bw(kms, crtc);
-	perf->core_clk_rate = _dpu_core_perf_calc_clk(kms, crtc, state);
+	perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
+	perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
 
 	DRM_DEBUG_ATOMIC(
 		"crtc=%d clk_rate=%llu core_ab=%llu\n",
@@ -120,6 +120,7 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 	struct dpu_crtc_state *dpu_cstate;
 	struct drm_crtc *tmp_crtc;
 	struct dpu_kms *kms;
+	const struct dpu_perf_cfg *perf_cfg;
 
 	if (!crtc || !state) {
 		DPU_ERROR("invalid crtc\n");
@@ -127,10 +128,7 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 	}
 
 	kms = _dpu_crtc_get_kms(crtc);
-	if (!kms->catalog) {
-		DPU_ERROR("invalid parameters\n");
-		return 0;
-	}
+	perf_cfg = kms->perf.perf_cfg;
 
 	/* we only need bandwidth check on real-time clients (interfaces) */
 	if (dpu_crtc_get_client_type(crtc) == NRT_CLIENT)
@@ -139,7 +137,7 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 	dpu_cstate = to_dpu_crtc_state(state);
 
 	/* obtain new values */
-	_dpu_core_perf_calc_crtc(kms, crtc, state, &dpu_cstate->new_perf);
+	_dpu_core_perf_calc_crtc(perf_cfg, crtc, state, &dpu_cstate->new_perf);
 
 	bw_sum_of_intfs = dpu_cstate->new_perf.bw_ctl;
 	curr_client_type = dpu_crtc_get_client_type(crtc);
@@ -162,7 +160,7 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 		bw = DIV_ROUND_UP_ULL(bw_sum_of_intfs, 1000);
 		DRM_DEBUG_ATOMIC("calculated bandwidth=%uk\n", bw);
 
-		threshold = kms->catalog->perf->max_bw_high;
+		threshold = perf_cfg->max_bw_high;
 
 		DRM_DEBUG_ATOMIC("final threshold bw limit = %d\n", threshold);
 
@@ -214,7 +212,7 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
 
 	avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
-	peak_bw = kms->catalog->perf->min_dram_ib;
+	peak_bw = kms->perf.perf_cfg->min_dram_ib;
 
 	if (kms->perf.fix_core_ab_vote)
 		avg_bw = kms->perf.fix_core_ab_vote;
@@ -248,12 +246,6 @@ void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc)
 		return;
 	}
 
-	kms = _dpu_crtc_get_kms(crtc);
-	if (!kms->catalog) {
-		DPU_ERROR("invalid kms\n");
-		return;
-	}
-
 	dpu_crtc = to_dpu_crtc(crtc);
 
 	if (atomic_dec_return(&kms->bandwidth_ref) > 0)
@@ -307,10 +299,6 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 	}
 
 	kms = _dpu_crtc_get_kms(crtc);
-	if (!kms->catalog) {
-		DPU_ERROR("invalid kms\n");
-		return -EINVAL;
-	}
 
 	dpu_crtc = to_dpu_crtc(crtc);
 	dpu_cstate = to_dpu_crtc_state(crtc->state);
@@ -391,7 +379,6 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 {
 	struct dpu_core_perf *perf = &dpu_kms->perf;
-	const struct dpu_mdss_cfg *catalog = perf->catalog;
 	struct dentry *entry;
 
 	entry = debugfs_create_dir("core_perf", parent);
@@ -403,15 +390,15 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
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
 	debugfs_create_u64("fix_core_clk_rate", 0600, entry,
 			&perf->fix_core_clk_rate);
 	debugfs_create_u64("fix_core_ib_vote", 0600, entry,
@@ -432,17 +419,16 @@ void dpu_core_perf_destroy(struct dpu_core_perf *perf)
 
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
index 0b8c527f489e..4490120d11d4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -28,7 +28,7 @@ struct dpu_core_perf_params {
  * struct dpu_core_perf - definition of core performance context
  * @dev: Pointer to drm device
  * @debugfs_root: top level debug folder
- * @catalog: Pointer to catalog configuration
+ * @perf_cfg: Platform-specific performance configuration
  * @core_clk: Pointer to the core clock
  * @core_clk_rate: current core clock rate
  * @max_core_clk_rate: maximum allowable core clock rate
@@ -40,7 +40,7 @@ struct dpu_core_perf_params {
 struct dpu_core_perf {
 	struct drm_device *dev;
 	struct dentry *debugfs_root;
-	const struct dpu_mdss_cfg *catalog;
+	const struct dpu_perf_cfg *perf_cfg;
 	struct clk *core_clk;
 	u64 core_clk_rate;
 	u64 max_core_clk_rate;
@@ -84,12 +84,12 @@ void dpu_core_perf_destroy(struct dpu_core_perf *perf);
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
index aa8499de1b9f..6e62606e32de 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1115,7 +1115,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		dpu_kms->hw_vbif[vbif->id] = hw;
 	}
 
-	rc = dpu_core_perf_init(&dpu_kms->perf, dev, dpu_kms->catalog,
+	rc = dpu_core_perf_init(&dpu_kms->perf, dev, dpu_kms->catalog->perf,
 			msm_clk_bulk_get_clock(dpu_kms->clocks, dpu_kms->num_clocks, "core"));
 	if (rc) {
 		DPU_ERROR("failed to init perf %d\n", rc);
-- 
2.39.2

