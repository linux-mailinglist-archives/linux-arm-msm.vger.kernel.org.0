Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC1853B9B1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jun 2022 15:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233869AbiFBNas (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jun 2022 09:30:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235327AbiFBNar (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jun 2022 09:30:47 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE4D43A19D
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jun 2022 06:30:45 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id u26so7113423lfd.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jun 2022 06:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v91IrCQY8nnrccyMRUPiDKXQa+buLTv0bmArW5FNawU=;
        b=v3VRKO3YPnJ+JlL9a79rffhoMfopPenmzIMYtpr6Dk/qMuCgbdMP2Fv49bMOFya1oP
         SccHaU2eHURMEKcUX1XmrDMRefFCa8zWMEAd+vIx8SibJaqRCQisoJO3BpV+jCjqVzWb
         +DkvGlco8uzlzRIK5aLxQ+XAVBYE7HPlnb9baPfnL11wYscaf+tHBYUlFbCHHHPJmqbB
         6acjkY1cfbDHocBSWzyasCSARFFHqtcLtmiIqBrgvYCZVaBOH5RRHAkP796iledJBvj0
         gMtPV/VlAfIubp4IFe6I3c5BlF6x8NrzzxTzhLO5lNW6V2rW7/jHcY7OOL+7LuThdjoK
         Bh3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v91IrCQY8nnrccyMRUPiDKXQa+buLTv0bmArW5FNawU=;
        b=Dt0cW5tJGJ63lELPB7jy1Yf5ynNA1PB9nnqQq4Y0kvo59kV2T2PiZL99HilRB2bBRE
         IQT8WNkGhDTBDQG2inP5FV1t3rn2xq36DJ0bCjKW9oq4w7lMc8S/+L9fhltP3Pdzur16
         jZ6sNeFFFcD2eKnneu+HovswDQkr2lDS7+OQK1/uMTOgbuTfd4pDWRniEUKjOatFS7aA
         jsUSmCzIh40VBnzDzpL2dsY8rZ+1i5k5/7ZGPTOTza7ABl+NOKK4JVF5GeNIJ33g6TGy
         8WMZHMJk28Fpo1jlbVvNHPHhC/g6sumIJM6CkJe0e1dzAN88opFqgDAPXceWxqFYlpz/
         jDkw==
X-Gm-Message-State: AOAM532r19e29okl0qyCatFOWAasP3I/9wRnFzMuSW69q7NlOfKJQznM
        RqbOIVFAtI/JyZtFCyVY6oYVlA==
X-Google-Smtp-Source: ABdhPJzPuFOEI9U9XZuQ23M8N/z0usYfS9uEzVV6178/U+h6LQ6px27BXijD4JuPxnWPvmrrPu0M4w==
X-Received: by 2002:a05:6512:3401:b0:474:4322:9ac9 with SMTP id i1-20020a056512340100b0047443229ac9mr3546567lfr.346.1654176644054;
        Thu, 02 Jun 2022 06:30:44 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i20-20020a056512341400b0047255d211a2sm1025399lfr.209.2022.06.02.06.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 06:30:43 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Subject: [PATCH v2 4/7] drm/msm/dpu: change catalog->perf to be a const pointer
Date:   Thu,  2 Jun 2022 16:30:36 +0300
Message-Id: <20220602133039.1739490-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220602133039.1739490-1-dmitry.baryshkov@linaro.org>
References: <20220602133039.1739490-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change dpu_mdss_cfg::perf to be a const pointer rather than embedding
the dpu_perf_cfg struct into the struct dpu_mdss_cfg.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 20 +++++++++----------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 10 +++++-----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 16 +++++++--------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 18 ++++++++---------
 5 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index a7492dd6ed65..31767d0f7353 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -53,7 +53,7 @@ static u64 _dpu_core_perf_calc_bw(struct dpu_kms *kms,
 		crtc_plane_bw += pstate->plane_fetch_bw;
 	}
 
-	bw_factor = kms->catalog->perf.bw_inefficiency_factor;
+	bw_factor = kms->catalog->perf->bw_inefficiency_factor;
 	if (bw_factor) {
 		crtc_plane_bw *= bw_factor;
 		do_div(crtc_plane_bw, 100);
@@ -90,7 +90,7 @@ static u64 _dpu_core_perf_calc_clk(struct dpu_kms *kms,
 		crtc_clk = max(pstate->plane_clk, crtc_clk);
 	}
 
-	clk_factor = kms->catalog->perf.clk_inefficiency_factor;
+	clk_factor = kms->catalog->perf->clk_inefficiency_factor;
 	if (clk_factor) {
 		crtc_clk *= clk_factor;
 		do_div(crtc_clk, 100);
@@ -128,7 +128,7 @@ static void _dpu_core_perf_calc_crtc(struct dpu_kms *kms,
 		perf->core_clk_rate = kms->perf.fix_core_clk_rate;
 	} else {
 		perf->bw_ctl = _dpu_core_perf_calc_bw(kms, crtc);
-		perf->max_per_pipe_ib = kms->catalog->perf.min_dram_ib;
+		perf->max_per_pipe_ib = kms->catalog->perf->min_dram_ib;
 		perf->core_clk_rate = _dpu_core_perf_calc_clk(kms, crtc, state);
 	}
 
@@ -189,7 +189,7 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 		bw = DIV_ROUND_UP_ULL(bw_sum_of_intfs, 1000);
 		DRM_DEBUG_ATOMIC("calculated bandwidth=%uk\n", bw);
 
-		threshold = kms->catalog->perf.max_bw_high;
+		threshold = kms->catalog->perf->max_bw_high;
 
 		DRM_DEBUG_ATOMIC("final threshold bw limit = %d\n", threshold);
 
@@ -413,7 +413,7 @@ static ssize_t _dpu_core_perf_mode_write(struct file *file,
 		    const char __user *user_buf, size_t count, loff_t *ppos)
 {
 	struct dpu_core_perf *perf = file->private_data;
-	struct dpu_perf_cfg *cfg = &perf->catalog->perf;
+	const struct dpu_perf_cfg *cfg = perf->catalog->perf;
 	u32 perf_mode = 0;
 	int ret;
 
@@ -480,15 +480,15 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 	debugfs_create_u32("enable_bw_release", 0600, entry,
 			(u32 *)&perf->enable_bw_release);
 	debugfs_create_u32("threshold_low", 0600, entry,
-			(u32 *)&catalog->perf.max_bw_low);
+			(u32 *)&catalog->perf->max_bw_low);
 	debugfs_create_u32("threshold_high", 0600, entry,
-			(u32 *)&catalog->perf.max_bw_high);
+			(u32 *)&catalog->perf->max_bw_high);
 	debugfs_create_u32("min_core_ib", 0600, entry,
-			(u32 *)&catalog->perf.min_core_ib);
+			(u32 *)&catalog->perf->min_core_ib);
 	debugfs_create_u32("min_llcc_ib", 0600, entry,
-			(u32 *)&catalog->perf.min_llcc_ib);
+			(u32 *)&catalog->perf->min_llcc_ib);
 	debugfs_create_u32("min_dram_ib", 0600, entry,
-			(u32 *)&catalog->perf.min_dram_ib);
+			(u32 *)&catalog->perf->min_dram_ib);
 	debugfs_create_file("perf_mode", 0600, entry,
 			(u32 *)perf, &dpu_core_perf_mode_fops);
 	debugfs_create_u64("fix_core_clk_rate", 0600, entry,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 4829d1ce0cf8..1e4a4822fbf4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -104,7 +104,7 @@ static void dpu_encoder_phys_wb_set_qos(struct dpu_encoder_phys *phys_enc)
 	struct dpu_hw_wb *hw_wb;
 	struct dpu_hw_wb_qos_cfg qos_cfg;
 	struct dpu_mdss_cfg *catalog;
-	struct dpu_qos_lut_tbl *qos_lut_tb;
+	const struct dpu_qos_lut_tbl *qos_lut_tb;
 
 	if (!phys_enc || !phys_enc->dpu_kms || !phys_enc->dpu_kms->catalog) {
 		DPU_ERROR("invalid parameter(s)\n");
@@ -118,11 +118,11 @@ static void dpu_encoder_phys_wb_set_qos(struct dpu_encoder_phys *phys_enc)
 	memset(&qos_cfg, 0, sizeof(struct dpu_hw_wb_qos_cfg));
 	qos_cfg.danger_safe_en = true;
 	qos_cfg.danger_lut =
-		catalog->perf.danger_lut_tbl[DPU_QOS_LUT_USAGE_NRT];
+		catalog->perf->danger_lut_tbl[DPU_QOS_LUT_USAGE_NRT];
 
-	qos_cfg.safe_lut = catalog->perf.safe_lut_tbl[DPU_QOS_LUT_USAGE_NRT];
+	qos_cfg.safe_lut = catalog->perf->safe_lut_tbl[DPU_QOS_LUT_USAGE_NRT];
 
-	qos_lut_tb = &catalog->perf.qos_lut_tbl[DPU_QOS_LUT_USAGE_NRT];
+	qos_lut_tb = &catalog->perf->qos_lut_tbl[DPU_QOS_LUT_USAGE_NRT];
 	qos_cfg.creq_lut = _dpu_hw_get_qos_lut(qos_lut_tb, 0);
 
 	if (hw_wb->ops.setup_qos_lut)
@@ -166,7 +166,7 @@ static void dpu_encoder_phys_wb_setup_fb(struct dpu_encoder_phys *phys_enc,
 	if (hw_wb->ops.setup_cdp) {
 		memset(&cdp_cfg, 0, sizeof(struct dpu_hw_cdp_cfg));
 
-		cdp_cfg.enable = phys_enc->dpu_kms->catalog->perf.cdp_cfg
+		cdp_cfg.enable = phys_enc->dpu_kms->catalog->perf->cdp_cfg
 				[DPU_PERF_CDP_USAGE_NRT].wr_enable;
 		cdp_cfg.ubwc_meta_enable =
 				DPU_FORMAT_IS_UBWC(wb_cfg->dest.format);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 367279371e8d..a7040ca5da72 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1750,7 +1750,7 @@ static void msm8998_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.vbif_count = ARRAY_SIZE(msm8998_vbif),
 		.vbif = msm8998_vbif,
 		.reg_dma_count = 0,
-		.perf = msm8998_perf_data,
+		.perf = &msm8998_perf_data,
 		.mdss_irqs = IRQ_SM8250_MASK,
 	};
 }
@@ -1781,7 +1781,7 @@ static void sdm845_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.vbif = sdm845_vbif,
 		.reg_dma_count = 1,
 		.dma_cfg = sdm845_regdma,
-		.perf = sdm845_perf_data,
+		.perf = &sdm845_perf_data,
 		.mdss_irqs = IRQ_SDM845_MASK,
 	};
 }
@@ -1812,7 +1812,7 @@ static void sc7180_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.vbif = sdm845_vbif,
 		.reg_dma_count = 1,
 		.dma_cfg = sdm845_regdma,
-		.perf = sc7180_perf_data,
+		.perf = &sc7180_perf_data,
 		.mdss_irqs = IRQ_SC7180_MASK,
 	};
 }
@@ -1845,7 +1845,7 @@ static void sm8150_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.vbif = sdm845_vbif,
 		.reg_dma_count = 1,
 		.dma_cfg = sm8150_regdma,
-		.perf = sm8150_perf_data,
+		.perf = &sm8150_perf_data,
 		.mdss_irqs = IRQ_SDM845_MASK,
 	};
 }
@@ -1876,7 +1876,7 @@ static void sc8180x_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.vbif = sdm845_vbif,
 		.reg_dma_count = 1,
 		.dma_cfg = sm8150_regdma,
-		.perf = sc8180x_perf_data,
+		.perf = &sc8180x_perf_data,
 		.mdss_irqs = IRQ_SC8180X_MASK,
 	};
 }
@@ -1911,7 +1911,7 @@ static void sm8250_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.wb = sm8250_wb,
 		.reg_dma_count = 1,
 		.dma_cfg = sm8250_regdma,
-		.perf = sm8250_perf_data,
+		.perf = &sm8250_perf_data,
 		.mdss_irqs = IRQ_SM8250_MASK,
 	};
 }
@@ -1934,7 +1934,7 @@ static void sc7280_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.intf = sc7280_intf,
 		.vbif_count = ARRAY_SIZE(sdm845_vbif),
 		.vbif = sdm845_vbif,
-		.perf = sc7280_perf_data,
+		.perf = &sc7280_perf_data,
 		.mdss_irqs = IRQ_SC7280_MASK,
 	};
 }
@@ -1966,7 +1966,7 @@ static void qcm2290_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.vbif = sdm845_vbif,
 		.reg_dma_count = 1,
 		.dma_cfg = sdm845_regdma,
-		.perf = qcm2290_perf_data,
+		.perf = &qcm2290_perf_data,
 		.mdss_irqs = IRQ_SC7180_MASK,
 	};
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 4225f58d8f97..64ed96b2fa3d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -868,7 +868,7 @@ struct dpu_mdss_cfg {
 
 	/* Add additional block data structures here */
 
-	struct dpu_perf_cfg perf;
+	const struct dpu_perf_cfg *perf;
 	const struct dpu_format_extended *dma_formats;
 	const struct dpu_format_extended *cursor_formats;
 	const struct dpu_format_extended *vig_formats;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 9d2f0364d2c7..d8048b6862f9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -160,7 +160,7 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
 	vbp = mode->vtotal - mode->vsync_end;
 	vpw = mode->vsync_end - mode->vsync_start;
 	vfp = mode->vsync_start - mode->vdisplay;
-	hw_latency_lines =  dpu_kms->catalog->perf.min_prefill_lines;
+	hw_latency_lines =  dpu_kms->catalog->perf->min_prefill_lines;
 	scale_factor = src_height > dst_height ?
 		mult_frac(src_height, 1, dst_height) : 1;
 
@@ -309,7 +309,7 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
 	}
 
 	qos_lut = _dpu_hw_get_qos_lut(
-			&pdpu->catalog->perf.qos_lut_tbl[lut_usage], total_fl);
+			&pdpu->catalog->perf->qos_lut_tbl[lut_usage], total_fl);
 
 	trace_dpu_perf_set_qos_luts(pdpu->pipe - SSPP_VIG0,
 			(fmt) ? fmt->base.pixel_format : 0,
@@ -336,9 +336,9 @@ static void _dpu_plane_set_danger_lut(struct drm_plane *plane,
 	u32 danger_lut, safe_lut;
 
 	if (!pdpu->is_rt_pipe) {
-		danger_lut = pdpu->catalog->perf.danger_lut_tbl
+		danger_lut = pdpu->catalog->perf->danger_lut_tbl
 				[DPU_QOS_LUT_USAGE_NRT];
-		safe_lut = pdpu->catalog->perf.safe_lut_tbl
+		safe_lut = pdpu->catalog->perf->safe_lut_tbl
 				[DPU_QOS_LUT_USAGE_NRT];
 	} else {
 		fmt = dpu_get_dpu_format_ext(
@@ -346,14 +346,14 @@ static void _dpu_plane_set_danger_lut(struct drm_plane *plane,
 				fb->modifier);
 
 		if (fmt && DPU_FORMAT_IS_LINEAR(fmt)) {
-			danger_lut = pdpu->catalog->perf.danger_lut_tbl
+			danger_lut = pdpu->catalog->perf->danger_lut_tbl
 					[DPU_QOS_LUT_USAGE_LINEAR];
-			safe_lut = pdpu->catalog->perf.safe_lut_tbl
+			safe_lut = pdpu->catalog->perf->safe_lut_tbl
 					[DPU_QOS_LUT_USAGE_LINEAR];
 		} else {
-			danger_lut = pdpu->catalog->perf.danger_lut_tbl
+			danger_lut = pdpu->catalog->perf->danger_lut_tbl
 					[DPU_QOS_LUT_USAGE_MACROTILE];
-			safe_lut = pdpu->catalog->perf.safe_lut_tbl
+			safe_lut = pdpu->catalog->perf->safe_lut_tbl
 					[DPU_QOS_LUT_USAGE_MACROTILE];
 		}
 	}
@@ -1225,7 +1225,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 			memset(&cdp_cfg, 0, sizeof(struct dpu_hw_cdp_cfg));
 
-			cdp_cfg.enable = pdpu->catalog->perf.cdp_cfg
+			cdp_cfg.enable = pdpu->catalog->perf->cdp_cfg
 					[DPU_PERF_CDP_USAGE_RT].rd_enable;
 			cdp_cfg.ubwc_meta_enable =
 					DPU_FORMAT_IS_UBWC(fmt);
-- 
2.35.1

