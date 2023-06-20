Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20858736079
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 02:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbjFTAJC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 20:09:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbjFTAI7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 20:08:59 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 972DF1BB
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 17:08:56 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f883420152so564015e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 17:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687219735; x=1689811735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7+Ys2jMZCNjvprimo8B7tJ3fjUkHZ5G99obRlRRABtg=;
        b=i6FZwF8UvAO3+4sI/boRvi+N4VSS1ZB/pMfpCa8r6L2sG7i8LgQoL9zCxp/17flSMu
         uE3Fg2501qhL447QjI12jbXel4JJ0vcEftfOiwfPBs3eeHJjQOon1UXKhyZidhwa64Qr
         W1oT1zqTHi6r6F5w812/RH0OdXSLDDS2ueqI8KSV2LCkNn0alCwO168tQ1JNpopLPapB
         nFO2zK3X/WXVz7XkCkMQZIYBNKvUItJlIqsJOokgusg0nXWJycYS9hljHz0xfqQc8E+C
         obf1taR3P+sh4Ir2+nqB6yK5RAsfQyNjJIJ+JYWyMaOzit2QRujWK4Y8K1i9ud32lpRu
         PK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687219735; x=1689811735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7+Ys2jMZCNjvprimo8B7tJ3fjUkHZ5G99obRlRRABtg=;
        b=LU+GWSHIRbqaZLZVVQ/c9YsoOPh4poXGBUDK7WPv56ZmeTwAaew4XI1FzPkkOeqOfz
         GiSSG1aO4GDN4z9nmvyxqnFEepC29cDc/jUMhsYL5gyGTDKB800nSH2r5nySpyOdPW7+
         nVqWJ9Wv86ZccneTZC+/uqzIyySFJRqXcM4Kumln9tKur5hXRZfswE5QJWp9R58sCKRL
         MbwqXnMjRtHKQwrYPkAJ5CVtyIO8+Sk3gk6pz4RbZBDsRt/SNdsIkr1rRA8mxCxtqE1y
         +hEjR4+Lvev7+aCwc2Bt0BNuu1+kKfa3quOQBgdJTGpvPQY+vFQXEp2qBDtWP61u3Hv5
         gjRg==
X-Gm-Message-State: AC+VfDyOv9/qpd4T+8lV4Q90at1XuaoCjkXNRfdPA7cfGA7h67YEWOs8
        XAbZ0EKrTIr9uOguC7Ku3Ppdkg==
X-Google-Smtp-Source: ACHHUZ68uFRVXOFc7l95irXYWr7ddkTtb8g4rrtivuA0/d7lDEAmKUoWcM2q6nWwpKB0ad/aY7DA0g==
X-Received: by 2002:a19:7912:0:b0:4f4:dfd4:33e4 with SMTP id u18-20020a197912000000b004f4dfd433e4mr5265382lfc.51.1687219734827;
        Mon, 19 Jun 2023 17:08:54 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a6-20020a056512020600b004f869e46fd4sm128815lfo.100.2023.06.19.17.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 17:08:54 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 6/8] drm/msm/dpu: use dpu_perf_cfg in DPU core_perf code
Date:   Tue, 20 Jun 2023 03:08:44 +0300
Message-Id: <20230620000846.946925-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 52 ++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  8 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  2 +-
 3 files changed, 27 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 773e641eab28..78a7e3ea27a4 100644
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
@@ -92,20 +92,20 @@ static struct dpu_kms *_dpu_crtc_get_kms(struct drm_crtc *crtc)
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
 
 	memset(perf, 0, sizeof(struct dpu_core_perf_params));
 
-	perf->bw_ctl = _dpu_core_perf_calc_bw(kms, crtc);
-	perf->core_clk_rate = _dpu_core_perf_calc_clk(kms, crtc, state);
+	perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
+	perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
 
 	DRM_DEBUG_ATOMIC(
 		"crtc=%d clk_rate=%llu core_ab=%llu\n",
@@ -122,6 +122,7 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 	struct dpu_crtc_state *dpu_cstate;
 	struct drm_crtc *tmp_crtc;
 	struct dpu_kms *kms;
+	const struct dpu_perf_cfg *perf_cfg;
 
 	if (!crtc || !state) {
 		DPU_ERROR("invalid crtc\n");
@@ -129,10 +130,7 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 	}
 
 	kms = _dpu_crtc_get_kms(crtc);
-	if (!kms->catalog) {
-		DPU_ERROR("invalid parameters\n");
-		return 0;
-	}
+	perf_cfg = kms->perf.perf_cfg;
 
 	/* we only need bandwidth check on real-time clients (interfaces) */
 	if (dpu_crtc_get_client_type(crtc) == NRT_CLIENT)
@@ -141,7 +139,7 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 	dpu_cstate = to_dpu_crtc_state(state);
 
 	/* obtain new values */
-	_dpu_core_perf_calc_crtc(kms, crtc, state, &dpu_cstate->new_perf);
+	_dpu_core_perf_calc_crtc(perf_cfg, crtc, state, &dpu_cstate->new_perf);
 
 	bw_sum_of_intfs = dpu_cstate->new_perf.bw_ctl;
 	curr_client_type = dpu_crtc_get_client_type(crtc);
@@ -164,7 +162,7 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 		bw = DIV_ROUND_UP_ULL(bw_sum_of_intfs, 1000);
 		DRM_DEBUG_ATOMIC("calculated bandwidth=%uk\n", bw);
 
-		threshold = kms->catalog->perf->max_bw_high;
+		threshold = perf_cfg->max_bw_high;
 
 		DRM_DEBUG_ATOMIC("final threshold bw limit = %d\n", threshold);
 
@@ -212,7 +210,7 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
 
 	for (i = 0; i < kms->num_paths; i++)
-		icc_set_bw(kms->path[i], avg_bw, kms->catalog->perf->min_dram_ib);
+		icc_set_bw(kms->path[i], avg_bw, kms->perf.perf_cfg->min_dram_ib);
 
 	return ret;
 }
@@ -293,10 +291,6 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 	}
 
 	kms = _dpu_crtc_get_kms(crtc);
-	if (!kms->catalog) {
-		DPU_ERROR("invalid kms\n");
-		return -EINVAL;
-	}
 
 	dpu_crtc = to_dpu_crtc(crtc);
 	dpu_cstate = to_dpu_crtc_state(crtc->state);
@@ -375,7 +369,6 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 {
 	struct dpu_core_perf *perf = &dpu_kms->perf;
-	const struct dpu_mdss_cfg *catalog = perf->catalog;
 	struct dentry *entry;
 
 	entry = debugfs_create_dir("core_perf", parent);
@@ -387,15 +380,15 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
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
 
 	return 0;
 }
@@ -410,17 +403,16 @@ void dpu_core_perf_destroy(struct dpu_core_perf *perf)
 
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
index c29ec72984b8..e8a7916b6f71 100644
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
@@ -38,7 +38,7 @@ struct dpu_core_perf_params {
 struct dpu_core_perf {
 	struct drm_device *dev;
 	struct dentry *debugfs_root;
-	const struct dpu_mdss_cfg *catalog;
+	const struct dpu_perf_cfg *perf_cfg;
 	struct clk *core_clk;
 	u64 core_clk_rate;
 	u64 max_core_clk_rate;
@@ -79,12 +79,12 @@ void dpu_core_perf_destroy(struct dpu_core_perf *perf);
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

