Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60921347B7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 16:01:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236397AbhCXPA7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 11:00:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236399AbhCXPAw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 11:00:52 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D725C061763
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:00:51 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id o10so32456166lfb.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YpnhVRI0osV9SLwEgj/UyBszU1XPTdC6tTCpmF9tbKM=;
        b=HWlQvpGixVBxwkNt6pBtJ6mbUfh/YAbJ+MzBAhMWUEo4o5lZ2Jhdd7qr+HDOHmI1kP
         2kJ7wiYRuMLi7k3vDyEnXWLc/OMCcs/hFR+bgSlOB+xeVFCHwtoVwh4ykYilPbVN9vrf
         NwuVMJW9V5V5jpActQ1Z5xibhrMwzLttFhSvcTOZ6Ynfi28aonouzOIouYQah/NkVI5U
         rvILbN3kME8QtPyzhr1U+wIffn9U8Bo2iMR9qpZSoI78tQyaLDmq4FLmoA84Hkr8a3tP
         7gOxdPlfxdCKHqSJfbtz0nNJ09XW+8BkYd+wpWhnnPTUCKghRzYKpLxuOnpP/TRGCPtb
         +Ncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YpnhVRI0osV9SLwEgj/UyBszU1XPTdC6tTCpmF9tbKM=;
        b=eVlNcZoORx6W71WvOl7yTsQigbBVy504SpHHBPmI8DkjMT1Y0jDC5V1irUq7xDK/++
         8GuGE4rg1Dhl3gkvM6XSqEBazEL7xE/iLhLxQSbTjlbc5hzu5dGkPh4y1ybSgARLkxN9
         NjOWaMEIfaRQLxFZFODCIWw0aP8B4A/rMxw0Hd33CbAqVN1tDv8DoeEcfq+Mun5yRGI9
         uC1WZNL0bnHG4lNfPt6Jp0rwP7j9tNC4LgUg/1OYbZjUxg6Z55bQy8glp6HFry31iRYn
         lyJWdHcFdHsYEtvv09eW2w6+7/59Q9ge8gevWPl0PFLWKSvMLw3jN3EUPgx/FslyPQxb
         WWHw==
X-Gm-Message-State: AOAM530yTRf0C6Rxyjzl+LHa6W3pJe9wnE2+m6SdolUyekP38VdOmg1I
        WBSqMFEGDVznLpbHk28u7m0R+A==
X-Google-Smtp-Source: ABdhPJx6b9nV38fgFZ/MVlcIKezTQfHW7bspK2gQBlEaUOryVyY07nU+8l2KDSeyGBrV2YdDvfM05Q==
X-Received: by 2002:ac2:491d:: with SMTP id n29mr2232810lfi.541.1616598049666;
        Wed, 24 Mar 2021 08:00:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p5sm252463lfe.154.2021.03.24.08.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:00:49 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 16/21] drm/msm/dpu: call hw_intf ops directly
Date:   Wed, 24 Mar 2021 18:00:19 +0300
Message-Id: <20210324150024.2768215-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
References: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Replace dpu_hw_intf callbacks with direct functions calls.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 28 +++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   | 28 ++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   | 49 +++++++++----------
 3 files changed, 38 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 868bb2f06125..e7a30246eb00 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -202,9 +202,6 @@ static void programmable_fetch_config(struct dpu_encoder_phys *phys_enc,
 	u32 vfp_fetch_start_vsync_counter = 0;
 	unsigned long lock_flags;
 
-	if (WARN_ON_ONCE(!phys_enc->hw_intf->ops.setup_prg_fetch))
-		return;
-
 	vfp_fetch_lines = programmable_fetch_get_num_lines(phys_enc, timing);
 	if (vfp_fetch_lines) {
 		vert_total = get_vertical_total(timing);
@@ -220,7 +217,7 @@ static void programmable_fetch_config(struct dpu_encoder_phys *phys_enc,
 		vfp_fetch_lines, vfp_fetch_start_vsync_counter);
 
 	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
-	phys_enc->hw_intf->ops.setup_prg_fetch(phys_enc->hw_intf, &f);
+	dpu_hw_intf_setup_prg_fetch(phys_enc->hw_intf, &f);
 	spin_unlock_irqrestore(phys_enc->enc_spinlock, lock_flags);
 }
 
@@ -253,10 +250,6 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 	}
 
 	mode = phys_enc->cached_mode;
-	if (!phys_enc->hw_intf->ops.setup_timing_gen) {
-		DPU_ERROR("timing engine setup is not supported\n");
-		return;
-	}
 
 	DPU_DEBUG_VIDENC(phys_enc, "enabling mode:\n");
 	drm_mode_debug_printmodeline(&mode);
@@ -287,13 +280,12 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 		intf_cfg.merge_3d = phys_enc->hw_pp->merge_3d->idx;
 
 	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
-	phys_enc->hw_intf->ops.setup_timing_gen(phys_enc->hw_intf,
+	dpu_hw_intf_setup_timing_engine(phys_enc->hw_intf,
 			&timing_params, fmt);
 	phys_enc->hw_ctl->ops.setup_intf_cfg(phys_enc->hw_ctl, &intf_cfg);
 
 	/* setup which pp blk will connect to this intf */
-	if (phys_enc->hw_intf->ops.bind_pingpong_blk)
-		phys_enc->hw_intf->ops.bind_pingpong_blk(
+	dpu_hw_intf_bind_pingpong_blk(
 				phys_enc->hw_intf,
 				true,
 				phys_enc->hw_pp->idx);
@@ -440,9 +432,6 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
 
 	DPU_DEBUG_VIDENC(phys_enc, "\n");
 
-	if (WARN_ON(!phys_enc->hw_intf->ops.enable_timing))
-		return;
-
 	dpu_encoder_helper_split_config(phys_enc, phys_enc->hw_intf->idx);
 
 	dpu_encoder_phys_vid_setup_timing_engine(phys_enc);
@@ -560,16 +549,13 @@ static void dpu_encoder_phys_vid_disable(struct dpu_encoder_phys *phys_enc)
 		return;
 	}
 
-	if (WARN_ON(!phys_enc->hw_intf->ops.enable_timing))
-		return;
-
 	if (phys_enc->enable_state == DPU_ENC_DISABLED) {
 		DPU_ERROR("already disabled\n");
 		return;
 	}
 
 	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
-	phys_enc->hw_intf->ops.enable_timing(phys_enc->hw_intf, 0);
+	dpu_hw_intf_enable_timing_engine(phys_enc->hw_intf, 0);
 	if (dpu_encoder_phys_vid_is_master(phys_enc))
 		dpu_encoder_phys_inc_pending(phys_enc);
 	spin_unlock_irqrestore(phys_enc->enc_spinlock, lock_flags);
@@ -608,7 +594,7 @@ static void dpu_encoder_phys_vid_handle_post_kickoff(
 		trace_dpu_enc_phys_vid_post_kickoff(DRMID(phys_enc->parent),
 				    phys_enc->hw_intf->idx - INTF_0);
 		spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
-		phys_enc->hw_intf->ops.enable_timing(phys_enc->hw_intf, 1);
+		dpu_hw_intf_enable_timing_engine(phys_enc->hw_intf, 1);
 		spin_unlock_irqrestore(phys_enc->enc_spinlock, lock_flags);
 		phys_enc->enable_state = DPU_ENC_ENABLED;
 	}
@@ -642,10 +628,10 @@ static int dpu_encoder_phys_vid_get_line_count(
 	if (!dpu_encoder_phys_vid_is_master(phys_enc))
 		return -EINVAL;
 
-	if (!phys_enc->hw_intf || !phys_enc->hw_intf->ops.get_line_count)
+	if (!phys_enc->hw_intf)
 		return -EINVAL;
 
-	return phys_enc->hw_intf->ops.get_line_count(phys_enc->hw_intf);
+	return dpu_hw_intf_get_line_count(phys_enc->hw_intf);
 }
 
 static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 8df75936d906..3988700dcc85 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -80,7 +80,7 @@ static const struct dpu_intf_cfg *_intf_offset(enum dpu_intf intf,
 	return ERR_PTR(-EINVAL);
 }
 
-static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
+void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 		const struct intf_timing_params *p,
 		const struct dpu_format *fmt)
 {
@@ -197,7 +197,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 	DPU_REG_WRITE(c, INTF_PANEL_FORMAT, panel_format);
 }
 
-static void dpu_hw_intf_enable_timing_engine(
+void dpu_hw_intf_enable_timing_engine(
 		struct dpu_hw_intf *intf,
 		u8 enable)
 {
@@ -206,7 +206,7 @@ static void dpu_hw_intf_enable_timing_engine(
 	DPU_REG_WRITE(c, INTF_TIMING_ENGINE_EN, enable != 0);
 }
 
-static void dpu_hw_intf_setup_prg_fetch(
+void dpu_hw_intf_setup_prg_fetch(
 		struct dpu_hw_intf *intf,
 		const struct intf_prog_fetch *fetch)
 {
@@ -230,7 +230,7 @@ static void dpu_hw_intf_setup_prg_fetch(
 	DPU_REG_WRITE(c, INTF_CONFIG, fetch_enable);
 }
 
-static void dpu_hw_intf_bind_pingpong_blk(
+void dpu_hw_intf_bind_pingpong_blk(
 		struct dpu_hw_intf *intf,
 		bool enable,
 		const enum dpu_pingpong pp)
@@ -238,6 +238,9 @@ static void dpu_hw_intf_bind_pingpong_blk(
 	struct dpu_hw_blk_reg_map *c = &intf->hw;
 	u32 mux_cfg;
 
+	if (!test_bit(DPU_INTF_INPUT_CTRL, &intf->cap->features))
+		return;
+
 	mux_cfg = DPU_REG_READ(c, INTF_MUX);
 	mux_cfg &= ~0xf;
 
@@ -249,7 +252,7 @@ static void dpu_hw_intf_bind_pingpong_blk(
 	DPU_REG_WRITE(c, INTF_MUX, mux_cfg);
 }
 
-static void dpu_hw_intf_get_status(
+void dpu_hw_intf_get_status(
 		struct dpu_hw_intf *intf,
 		struct intf_status *s)
 {
@@ -265,7 +268,7 @@ static void dpu_hw_intf_get_status(
 	}
 }
 
-static u32 dpu_hw_intf_get_line_count(struct dpu_hw_intf *intf)
+u32 dpu_hw_intf_get_line_count(struct dpu_hw_intf *intf)
 {
 	struct dpu_hw_blk_reg_map *c;
 
@@ -277,18 +280,6 @@ static u32 dpu_hw_intf_get_line_count(struct dpu_hw_intf *intf)
 	return DPU_REG_READ(c, INTF_LINE_COUNT);
 }
 
-static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
-		unsigned long cap)
-{
-	ops->setup_timing_gen = dpu_hw_intf_setup_timing_engine;
-	ops->setup_prg_fetch  = dpu_hw_intf_setup_prg_fetch;
-	ops->get_status = dpu_hw_intf_get_status;
-	ops->enable_timing = dpu_hw_intf_enable_timing_engine;
-	ops->get_line_count = dpu_hw_intf_get_line_count;
-	if (cap & BIT(DPU_INTF_INPUT_CTRL))
-		ops->bind_pingpong_blk = dpu_hw_intf_bind_pingpong_blk;
-}
-
 struct dpu_hw_intf *dpu_hw_intf_init(enum dpu_intf idx,
 		void __iomem *addr,
 		const struct dpu_mdss_cfg *m)
@@ -313,7 +304,6 @@ struct dpu_hw_intf *dpu_hw_intf_init(enum dpu_intf idx,
 	c->idx = idx;
 	c->cap = cfg;
 	c->mdss = m;
-	_setup_intf_ops(&c->ops, c->cap->features);
 
 	dpu_hw_blk_init(&c->base, DPU_HW_BLK_INTF, idx);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index 0ead64d3f63d..8661571fec67 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -44,37 +44,35 @@ struct intf_status {
 	u32 line_count;		/* current line count including blanking */
 };
 
-/**
- * struct dpu_hw_intf_ops : Interface to the interface Hw driver functions
+/*
  *  Assumption is these functions will be called after clocks are enabled
- * @ setup_timing_gen : programs the timing engine
- * @ setup_prog_fetch : enables/disables the programmable fetch logic
- * @ enable_timing: enable/disable timing engine
- * @ get_status: returns if timing engine is enabled or not
- * @ get_line_count: reads current vertical line counter
- * @bind_pingpong_blk: enable/disable the connection with pingpong which will
- *                     feed pixels to this interface
  */
-struct dpu_hw_intf_ops {
-	void (*setup_timing_gen)(struct dpu_hw_intf *intf,
-			const struct intf_timing_params *p,
-			const struct dpu_format *fmt);
 
-	void (*setup_prg_fetch)(struct dpu_hw_intf *intf,
-			const struct intf_prog_fetch *fetch);
+/* dpu_hw_intf_setup_timing_engine: programs the timing engine */
+void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
+		const struct intf_timing_params *p,
+		const struct dpu_format *fmt);
 
-	void (*enable_timing)(struct dpu_hw_intf *intf,
-			u8 enable);
+/* dpu_hw_intf_setup_prg_fetch : enables/disables the programmable fetch logic */
+void dpu_hw_intf_setup_prg_fetch(struct dpu_hw_intf *intf,
+		const struct intf_prog_fetch *fetch);
 
-	void (*get_status)(struct dpu_hw_intf *intf,
-			struct intf_status *status);
+/* dpu_hw_intf_enable_timing_engine: enable/disable timing engine */
+void dpu_hw_intf_enable_timing_engine(struct dpu_hw_intf *intf,
+		u8 enable);
 
-	u32 (*get_line_count)(struct dpu_hw_intf *intf);
+/* dpu_hw_intf_get_status: returns if timing engine is enabled or not */
+void dpu_hw_intf_get_status(struct dpu_hw_intf *intf,
+		struct intf_status *status);
 
-	void (*bind_pingpong_blk)(struct dpu_hw_intf *intf,
-			bool enable,
-			const enum dpu_pingpong pp);
-};
+/* dpu_hw_intf_get_line_count: reads current vertical line counter */
+u32 dpu_hw_intf_get_line_count(struct dpu_hw_intf *intf);
+
+/* dpu_hw_intf_bind_pingpong_blk: enable/disable the connection with pingpong
+ * which will feed pixels to this interface */
+void dpu_hw_intf_bind_pingpong_blk(struct dpu_hw_intf *intf,
+		bool enable,
+		const enum dpu_pingpong pp);
 
 struct dpu_hw_intf {
 	struct dpu_hw_blk base;
@@ -84,9 +82,6 @@ struct dpu_hw_intf {
 	enum dpu_intf idx;
 	const struct dpu_intf_cfg *cap;
 	const struct dpu_mdss_cfg *mdss;
-
-	/* ops */
-	struct dpu_hw_intf_ops ops;
 };
 
 /**
-- 
2.30.2

