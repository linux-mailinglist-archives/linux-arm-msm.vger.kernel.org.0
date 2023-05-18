Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12FB5708B6A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 00:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbjERWWp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 May 2023 18:22:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230273AbjERWWo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 May 2023 18:22:44 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 299921A2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 15:22:43 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2ab3e8f4efeso2262171fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 15:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684448561; x=1687040561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPcCMM9+m/0oHbYpF4Qkr7vZG/8FKEHFgnQB0u/qhng=;
        b=zzk+0J7j8eaneitjNnmCS0VlXA2x+1N2FBXfdAUH/S9pzles7VTeq037pVpcJYVgG0
         S5HyNHlwB8Ha7kjFSenbe/mH3XyABvpZPF5qtIbyDdVPWGbnY2s5skyiOccj4hC043b7
         4KdRGP7HbozARC/wbwYGIZCYlwhqYljwnNN8fscZBZRmFo+X9QHek2onc1GH693Qfyc5
         gjOeA3sKVu2Q8f5sUzeC6o74dt1MOrzCoPjoh72vyJ+sRRXWc/CtPLHdas2en6vxaaHD
         kYN84iy2Qle0iDJbJ9klXclo3EvYFD/fjwocpTvfwO27x7Eotv9jC83z5iZoxNnDog/b
         zyeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684448561; x=1687040561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPcCMM9+m/0oHbYpF4Qkr7vZG/8FKEHFgnQB0u/qhng=;
        b=CuBZINcsv0Sz7/XM65DQN+06HN3rS5zZq5b7H00J+VqI2rruRgf9c036szsKtGi42e
         w0aMhIcTq2xZSYylo8GvjGZ2BxXQbXLNayodpH42898tzglDTsal1x9rxVNZ9cHV8lRz
         WAxQY4tURihCtf8nItkkl4exSeGXIEVmU5QypbGjWvUOWXuihfTfZiQfYVLutmQ/U37f
         4XEC6t17cagTx+2QAUJwRKaO5x3BOAS9qOcU8r6/ksgqDFlFgWEROlMTL/8c/UPq3KLS
         CJRY/mmNqI8kzjif9wbDNkdJb6eQamKZCE4F82U3nxHkp8JJb1WGbar0oVKR0nYJ6SFb
         aXew==
X-Gm-Message-State: AC+VfDxcoSy7gRFI9ylw9ExKUnntbiXLsz3N5wKcAngSQeThVqFPo7xi
        FDPhVkuZEfSK0BDFQ6Kt3jX/yQ==
X-Google-Smtp-Source: ACHHUZ5mZ0JOlrkyHUMiyT8YeLll5JC1WPCJVvYrejaXj3XCVq9eQQ/K5/Et5Nl5NP6SElH6yQOQ5Q==
X-Received: by 2002:a05:6512:118a:b0:4f3:8225:fadf with SMTP id g10-20020a056512118a00b004f38225fadfmr232330lfr.12.1684448561501;
        Thu, 18 May 2023 15:22:41 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o18-20020ac24352000000b004ec7c0f2178sm383860lfl.63.2023.05.18.15.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 15:22:40 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Jeykumar Sankaran <quic_jeykumar@quicinc.com>
Subject: [PATCH v3 2/9] drm/msm/dpu: simplify CDP programming
Date:   Fri, 19 May 2023 01:22:31 +0300
Message-Id: <20230518222238.3815293-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230518222238.3815293-1-dmitry.baryshkov@linaro.org>
References: <20230518222238.3815293-1-dmitry.baryshkov@linaro.org>
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

Get rid of intermediatory configuration structure and defines. Pass the
format and the enablement bit directly to the new helper. The
WB_CDP_CNTL register ignores BIT(2), so we can write it for both SSPP
and WB CDP settings.

Reviewed-by: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 17 ++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 17 ++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   | 14 ++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   | 21 +++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   | 19 +++--------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     | 19 ++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h     | 11 ++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 16 +++-----------
 8 files changed, 45 insertions(+), 89 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index bac4aa807b4b..e7b65f6f53d6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -140,7 +140,6 @@ static void dpu_encoder_phys_wb_setup_fb(struct dpu_encoder_phys *phys_enc,
 	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys_enc);
 	struct dpu_hw_wb *hw_wb;
 	struct dpu_hw_wb_cfg *wb_cfg;
-	struct dpu_hw_cdp_cfg cdp_cfg;
 
 	if (!phys_enc || !phys_enc->dpu_kms || !phys_enc->dpu_kms->catalog) {
 		DPU_ERROR("invalid encoder\n");
@@ -163,18 +162,10 @@ static void dpu_encoder_phys_wb_setup_fb(struct dpu_encoder_phys *phys_enc,
 		hw_wb->ops.setup_outformat(hw_wb, wb_cfg);
 
 	if (hw_wb->ops.setup_cdp) {
-		memset(&cdp_cfg, 0, sizeof(struct dpu_hw_cdp_cfg));
-
-		cdp_cfg.enable = phys_enc->dpu_kms->catalog->perf->cdp_cfg
-				[DPU_PERF_CDP_USAGE_NRT].wr_enable;
-		cdp_cfg.ubwc_meta_enable =
-				DPU_FORMAT_IS_UBWC(wb_cfg->dest.format);
-		cdp_cfg.tile_amortize_enable =
-				DPU_FORMAT_IS_UBWC(wb_cfg->dest.format) ||
-				DPU_FORMAT_IS_TILE(wb_cfg->dest.format);
-		cdp_cfg.preload_ahead = DPU_WB_CDP_PRELOAD_AHEAD_64;
-
-		hw_wb->ops.setup_cdp(hw_wb, &cdp_cfg);
+		const struct dpu_perf_cfg *perf = phys_enc->dpu_kms->catalog->perf;
+
+		hw_wb->ops.setup_cdp(hw_wb, wb_cfg->dest.format,
+				     perf->cdp_cfg[DPU_PERF_CDP_USAGE_NRT].wr_enable);
 	}
 
 	if (hw_wb->ops.setup_outaddress)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 08098880b7d5..78d928065b7b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -590,13 +590,13 @@ static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_sspp *ctx,
 }
 
 static void dpu_hw_sspp_setup_cdp(struct dpu_sw_pipe *pipe,
-		struct dpu_hw_cdp_cfg *cfg)
+				  const struct dpu_format *fmt,
+				  bool enable)
 {
 	struct dpu_hw_sspp *ctx = pipe->sspp;
-	u32 cdp_cntl = 0;
 	u32 cdp_cntl_offset = 0;
 
-	if (!ctx || !cfg)
+	if (!ctx)
 		return;
 
 	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
@@ -605,16 +605,7 @@ static void dpu_hw_sspp_setup_cdp(struct dpu_sw_pipe *pipe,
 	else
 		cdp_cntl_offset = SSPP_CDP_CNTL_REC1;
 
-	if (cfg->enable)
-		cdp_cntl |= BIT(0);
-	if (cfg->ubwc_meta_enable)
-		cdp_cntl |= BIT(1);
-	if (cfg->tile_amortize_enable)
-		cdp_cntl |= BIT(2);
-	if (cfg->preload_ahead == DPU_SSPP_CDP_PRELOAD_AHEAD_64)
-		cdp_cntl |= BIT(3);
-
-	DPU_REG_WRITE(&ctx->hw, cdp_cntl_offset, cdp_cntl);
+	dpu_setup_cdp(&ctx->hw, cdp_cntl_offset, fmt, enable);
 }
 
 static void _setup_layer_ops(struct dpu_hw_sspp *c,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 7a8d11ba618d..86bf4b2cda77 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -177,14 +177,6 @@ struct dpu_hw_pipe_qos_cfg {
 	bool danger_safe_en;
 };
 
-/**
- * enum CDP preload ahead address size
- */
-enum {
-	DPU_SSPP_CDP_PRELOAD_AHEAD_32,
-	DPU_SSPP_CDP_PRELOAD_AHEAD_64
-};
-
 /**
  * struct dpu_hw_pipe_ts_cfg - traffic shaper configuration
  * @size: size to prefill in bytes, or zero to disable
@@ -331,10 +323,12 @@ struct dpu_hw_sspp_ops {
 	/**
 	 * setup_cdp - setup client driven prefetch
 	 * @pipe: Pointer to software pipe context
-	 * @cfg: Pointer to cdp configuration
+	 * @fmt: format used by the sw pipe
+	 * @enable: whether the CDP should be enabled for this pipe
 	 */
 	void (*setup_cdp)(struct dpu_sw_pipe *pipe,
-			  struct dpu_hw_cdp_cfg *cfg);
+			  const struct dpu_format *fmt,
+			  bool enable);
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
index 8062228eada6..95d20b9a3f2f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
@@ -494,3 +494,24 @@ int dpu_hw_collect_misr(struct dpu_hw_blk_reg_map *c,
 
 	return 0;
 }
+
+#define CDP_ENABLE		BIT(0)
+#define CDP_UBWC_META_ENABLE	BIT(1)
+#define CDP_TILE_AMORTIZE_ENABLE BIT(2)
+#define CDP_PRELOAD_AHEAD_64	BIT(3)
+
+void dpu_setup_cdp(struct dpu_hw_blk_reg_map *c, u32 offset,
+		   const struct dpu_format *fmt, bool enable)
+{
+	u32 cdp_cntl = CDP_PRELOAD_AHEAD_64;
+
+	if (enable)
+		cdp_cntl |= CDP_ENABLE;
+	if (DPU_FORMAT_IS_UBWC(fmt))
+		cdp_cntl |= CDP_UBWC_META_ENABLE;
+	if (DPU_FORMAT_IS_UBWC(fmt) ||
+	    DPU_FORMAT_IS_TILE(fmt))
+		cdp_cntl |= CDP_TILE_AMORTIZE_ENABLE;
+
+	DPU_REG_WRITE(c, offset, cdp_cntl);
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index 27f4c39e35ab..dc6e3b795aef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -305,22 +305,6 @@ struct dpu_drm_scaler_v2 {
 	struct dpu_drm_de_v1 de;
 };
 
-/**
- * struct dpu_hw_cdp_cfg : CDP configuration
- * @enable: true to enable CDP
- * @ubwc_meta_enable: true to enable ubwc metadata preload
- * @tile_amortize_enable: true to enable amortization control for tile format
- * @preload_ahead: number of request to preload ahead
- *	DPU_*_CDP_PRELOAD_AHEAD_32,
- *	DPU_*_CDP_PRELOAD_AHEAD_64
- */
-struct dpu_hw_cdp_cfg {
-	bool enable;
-	bool ubwc_meta_enable;
-	bool tile_amortize_enable;
-	u32 preload_ahead;
-};
-
 u32 *dpu_hw_util_get_log_mask_ptr(void);
 
 void dpu_reg_write(struct dpu_hw_blk_reg_map *c,
@@ -346,6 +330,9 @@ void dpu_hw_csc_setup(struct dpu_hw_blk_reg_map  *c,
 		u32 csc_reg_off,
 		const struct dpu_csc_cfg *data, bool csc10);
 
+void dpu_setup_cdp(struct dpu_hw_blk_reg_map *c, u32 offset,
+		   const struct dpu_format *fmt, bool enable);
+
 u64 _dpu_hw_get_qos_lut(const struct dpu_qos_lut_tbl *tbl,
 		u32 total_fl);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index 4834866d72fd..a6de4b82a188 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -164,24 +164,13 @@ static void dpu_hw_wb_setup_qos_lut(struct dpu_hw_wb *ctx,
 }
 
 static void dpu_hw_wb_setup_cdp(struct dpu_hw_wb *ctx,
-		struct dpu_hw_cdp_cfg *cfg)
+				const struct dpu_format *fmt,
+				bool enable)
 {
-	struct dpu_hw_blk_reg_map *c;
-	u32 cdp_cntl = 0;
-
-	if (!ctx || !cfg)
+	if (!ctx)
 		return;
 
-	c = &ctx->hw;
-
-	if (cfg->enable)
-		cdp_cntl |= BIT(0);
-	if (cfg->ubwc_meta_enable)
-		cdp_cntl |= BIT(1);
-	if (cfg->preload_ahead == DPU_WB_CDP_PRELOAD_AHEAD_64)
-		cdp_cntl |= BIT(3);
-
-	DPU_REG_WRITE(c, WB_CDP_CNTL, cdp_cntl);
+	dpu_setup_cdp(&ctx->hw, WB_CDP_CNTL, fmt, enable);
 }
 
 static void dpu_hw_wb_bind_pingpong_blk(
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
index e4f85409c624..ab3541856258 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
@@ -21,14 +21,6 @@ struct dpu_hw_wb_cfg {
 	struct drm_rect crop;
 };
 
-/**
- * enum CDP preload ahead address size
- */
-enum {
-	DPU_WB_CDP_PRELOAD_AHEAD_32,
-	DPU_WB_CDP_PRELOAD_AHEAD_64
-};
-
 /**
  * struct dpu_hw_wb_qos_cfg : Writeback pipe QoS configuration
  * @danger_lut: LUT for generate danger level based on fill level
@@ -67,7 +59,8 @@ struct dpu_hw_wb_ops {
 			struct dpu_hw_wb_qos_cfg *cfg);
 
 	void (*setup_cdp)(struct dpu_hw_wb *ctx,
-			struct dpu_hw_cdp_cfg *cfg);
+			  const struct dpu_format *fmt,
+			  bool enable);
 
 	void (*bind_pingpong_blk)(struct dpu_hw_wb *ctx,
 			bool enable, const enum dpu_pingpong pp);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 14b5cfe30611..3b210320ea62 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1116,20 +1116,10 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
 		pipe->sspp->ops.setup_format(pipe, fmt, src_flags);
 
 		if (pipe->sspp->ops.setup_cdp) {
-			struct dpu_hw_cdp_cfg cdp_cfg;
+			const struct dpu_perf_cfg *perf = pdpu->catalog->perf;
 
-			memset(&cdp_cfg, 0, sizeof(struct dpu_hw_cdp_cfg));
-
-			cdp_cfg.enable = pdpu->catalog->perf->cdp_cfg
-					[DPU_PERF_CDP_USAGE_RT].rd_enable;
-			cdp_cfg.ubwc_meta_enable =
-					DPU_FORMAT_IS_UBWC(fmt);
-			cdp_cfg.tile_amortize_enable =
-					DPU_FORMAT_IS_UBWC(fmt) ||
-					DPU_FORMAT_IS_TILE(fmt);
-			cdp_cfg.preload_ahead = DPU_SSPP_CDP_PRELOAD_AHEAD_64;
-
-			pipe->sspp->ops.setup_cdp(pipe, &cdp_cfg);
+			pipe->sspp->ops.setup_cdp(pipe, fmt,
+						  perf->cdp_cfg[DPU_PERF_CDP_USAGE_RT].rd_enable);
 		}
 	}
 
-- 
2.39.2

