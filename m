Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9B346B3304
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Mar 2023 01:57:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbjCJA5Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 19:57:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbjCJA5Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 19:57:24 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FD1E116C10
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 16:57:08 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id i28so4668698lfv.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 16:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678409827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ME36xo8h2UwUU7jlb1SqHPCKm45NbU+hrLYUoCQ1kb8=;
        b=GdfcOkUl7gS2LbP2an47qytZvEi11fRtW1RvHJZmh+fMSEzlMsLdo2P0cbnyfMMNte
         p3hMgUG0CE0ZYBTqZWmLy6Pj1F6hqI1JPSYRwz1V7aAOwT6fy7+HhASlgtUAdQIrmbep
         DIY1lRXmCEuWG5xPcBzaHEw8OLTxHbpK7U6H7axvxBWcHaz+kcExDTw+h+bcHI7g/Npz
         /Mm7xAjtE1fIpKCiXRFlCKOeSMjX++xMERVU7EHLhKWDPj66Mv1gxLPJ2J8Eab26L2uj
         gnEzE5zrbYnjU+8L0NAitFFfQMP+2jJRUKhG40m/smyytx1C50fupLuhLEt1VNSWwbJd
         iyDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678409827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ME36xo8h2UwUU7jlb1SqHPCKm45NbU+hrLYUoCQ1kb8=;
        b=U8YSLzP+oFm8fLnZMP9/sMFkPqkQfIT5GdF7J1FcCAY8QkN+3kRDknLQ9lfchOUZGi
         zb/lOq9rygIqexCPoetCWIxMJSmN2Xjwe6nbjgnCNzjqMHIklzGu/r67YrDsnAtBo5sk
         KHQaRaDrSdOSh9JxNouxnbzKqAP15DR9kqmb0CgHiqCOs9i9dolty5BHRQNqZowy+e8s
         6GjPAxwbD3oAzuhKX61hmJHyJ9tKZq9JpYYwAfgxQ6akzrr1DQBrKsEgaBsUv+CnYjuT
         /N9ADzGFhPyheWrkC5SKdFfr/IL0drxCMe64KJvrpOfwoZxL2vznRfKBNnnkBQv2nU1Q
         njAw==
X-Gm-Message-State: AO0yUKXO7hEluAvXRs6UCCYv7EewCh2YV5z3TqVQ4k0Vj6NmAW16/rtN
        Yr1JjwEI7KH0ppBKKBhMSQUJzQ==
X-Google-Smtp-Source: AK7set8FsTN6thK1jzoysIZBiH/mhd7wFqiiQG6bNO+VxC2ie/VWMiGRGYNLkTc1UplsZ41883KdiQ==
X-Received: by 2002:ac2:5a07:0:b0:4e8:11f8:b5ea with SMTP id q7-20020ac25a07000000b004e811f8b5eamr3772319lfn.10.1678409826846;
        Thu, 09 Mar 2023 16:57:06 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id m13-20020ac2428d000000b004d8540b947asm75280lfh.56.2023.03.09.16.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 16:57:06 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v5 01/32] drm/msm/dpu: rename struct dpu_hw_pipe(_cfg) to dpu_hw_sspp(_cfg)
Date:   Fri, 10 Mar 2023 02:56:33 +0200
Message-Id: <20230310005704.1332368-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
References: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

For all hardware blocks except SSPP the corresponding struct is named
after the block. Rename dpu_hw_pipe (SSPP structure) to dpu_hw_sspp.
Also rename struct dpu_hw_pipe_cfg to dpu_hw_sspp_cfg to follow this
change.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 49 +++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 53 +++++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 20 ++++----
 3 files changed, 62 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 4246ab0b3bee..3e65bfd65b62 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -136,7 +136,7 @@
 #define TS_CLK			19200000
 
 
-static int _sspp_subblk_offset(struct dpu_hw_pipe *ctx,
+static int _sspp_subblk_offset(struct dpu_hw_sspp *ctx,
 		int s_id,
 		u32 *idx)
 {
@@ -168,7 +168,7 @@ static int _sspp_subblk_offset(struct dpu_hw_pipe *ctx,
 	return rc;
 }
 
-static void dpu_hw_sspp_setup_multirect(struct dpu_hw_pipe *ctx,
+static void dpu_hw_sspp_setup_multirect(struct dpu_hw_sspp *ctx,
 		enum dpu_sspp_multirect_index index,
 		enum dpu_sspp_multirect_mode mode)
 {
@@ -197,7 +197,7 @@ static void dpu_hw_sspp_setup_multirect(struct dpu_hw_pipe *ctx,
 	DPU_REG_WRITE(&ctx->hw, SSPP_MULTIRECT_OPMODE + idx, mode_mask);
 }
 
-static void _sspp_setup_opmode(struct dpu_hw_pipe *ctx,
+static void _sspp_setup_opmode(struct dpu_hw_sspp *ctx,
 		u32 mask, u8 en)
 {
 	u32 idx;
@@ -218,7 +218,7 @@ static void _sspp_setup_opmode(struct dpu_hw_pipe *ctx,
 	DPU_REG_WRITE(&ctx->hw, SSPP_VIG_OP_MODE + idx, opmode);
 }
 
-static void _sspp_setup_csc10_opmode(struct dpu_hw_pipe *ctx,
+static void _sspp_setup_csc10_opmode(struct dpu_hw_sspp *ctx,
 		u32 mask, u8 en)
 {
 	u32 idx;
@@ -239,7 +239,7 @@ static void _sspp_setup_csc10_opmode(struct dpu_hw_pipe *ctx,
 /*
  * Setup source pixel format, flip,
  */
-static void dpu_hw_sspp_setup_format(struct dpu_hw_pipe *ctx,
+static void dpu_hw_sspp_setup_format(struct dpu_hw_sspp *ctx,
 		const struct dpu_format *fmt, u32 flags,
 		enum dpu_sspp_multirect_index rect_mode)
 {
@@ -360,7 +360,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_hw_pipe *ctx,
 	DPU_REG_WRITE(c, SSPP_UBWC_ERROR_STATUS + idx, BIT(31));
 }
 
-static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_pipe *ctx,
+static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
 		struct dpu_hw_pixel_ext *pe_ext)
 {
 	struct dpu_hw_blk_reg_map *c;
@@ -418,8 +418,8 @@ static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_pipe *ctx,
 			tot_req_pixels[3]);
 }
 
-static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_pipe *ctx,
-		struct dpu_hw_pipe_cfg *sspp,
+static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
+		struct dpu_hw_sspp_cfg *sspp,
 		void *scaler_cfg)
 {
 	u32 idx;
@@ -434,7 +434,7 @@ static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_pipe *ctx,
 			sspp->layout.format);
 }
 
-static u32 _dpu_hw_sspp_get_scaler3_ver(struct dpu_hw_pipe *ctx)
+static u32 _dpu_hw_sspp_get_scaler3_ver(struct dpu_hw_sspp *ctx)
 {
 	u32 idx;
 
@@ -447,8 +447,8 @@ static u32 _dpu_hw_sspp_get_scaler3_ver(struct dpu_hw_pipe *ctx)
 /*
  * dpu_hw_sspp_setup_rects()
  */
-static void dpu_hw_sspp_setup_rects(struct dpu_hw_pipe *ctx,
-		struct dpu_hw_pipe_cfg *cfg,
+static void dpu_hw_sspp_setup_rects(struct dpu_hw_sspp *ctx,
+		struct dpu_hw_sspp_cfg *cfg,
 		enum dpu_sspp_multirect_index rect_index)
 {
 	struct dpu_hw_blk_reg_map *c;
@@ -516,8 +516,8 @@ static void dpu_hw_sspp_setup_rects(struct dpu_hw_pipe *ctx,
 	DPU_REG_WRITE(c, SSPP_SRC_YSTRIDE1 + idx, ystride1);
 }
 
-static void dpu_hw_sspp_setup_sourceaddress(struct dpu_hw_pipe *ctx,
-		struct dpu_hw_pipe_cfg *cfg,
+static void dpu_hw_sspp_setup_sourceaddress(struct dpu_hw_sspp *ctx,
+		struct dpu_hw_sspp_cfg *cfg,
 		enum dpu_sspp_multirect_index rect_mode)
 {
 	int i;
@@ -543,7 +543,7 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_hw_pipe *ctx,
 	}
 }
 
-static void dpu_hw_sspp_setup_csc(struct dpu_hw_pipe *ctx,
+static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
 		const struct dpu_csc_cfg *data)
 {
 	u32 idx;
@@ -560,7 +560,7 @@ static void dpu_hw_sspp_setup_csc(struct dpu_hw_pipe *ctx,
 	dpu_hw_csc_setup(&ctx->hw, idx, data, csc10);
 }
 
-static void dpu_hw_sspp_setup_solidfill(struct dpu_hw_pipe *ctx, u32 color, enum
+static void dpu_hw_sspp_setup_solidfill(struct dpu_hw_sspp *ctx, u32 color, enum
 		dpu_sspp_multirect_index rect_index)
 {
 	u32 idx;
@@ -575,7 +575,7 @@ static void dpu_hw_sspp_setup_solidfill(struct dpu_hw_pipe *ctx, u32 color, enum
 				color);
 }
 
-static void dpu_hw_sspp_setup_danger_safe_lut(struct dpu_hw_pipe *ctx,
+static void dpu_hw_sspp_setup_danger_safe_lut(struct dpu_hw_sspp *ctx,
 			u32 danger_lut,
 			u32 safe_lut)
 {
@@ -588,7 +588,7 @@ static void dpu_hw_sspp_setup_danger_safe_lut(struct dpu_hw_pipe *ctx,
 	DPU_REG_WRITE(&ctx->hw, SSPP_SAFE_LUT + idx, safe_lut);
 }
 
-static void dpu_hw_sspp_setup_creq_lut(struct dpu_hw_pipe *ctx,
+static void dpu_hw_sspp_setup_creq_lut(struct dpu_hw_sspp *ctx,
 			u64 creq_lut)
 {
 	u32 idx;
@@ -605,7 +605,7 @@ static void dpu_hw_sspp_setup_creq_lut(struct dpu_hw_pipe *ctx,
 	}
 }
 
-static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_pipe *ctx,
+static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_sspp *ctx,
 		struct dpu_hw_pipe_qos_cfg *cfg)
 {
 	u32 idx;
@@ -630,7 +630,7 @@ static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_pipe *ctx,
 	DPU_REG_WRITE(&ctx->hw, SSPP_QOS_CTRL + idx, qos_ctrl);
 }
 
-static void dpu_hw_sspp_setup_cdp(struct dpu_hw_pipe *ctx,
+static void dpu_hw_sspp_setup_cdp(struct dpu_hw_sspp *ctx,
 		struct dpu_hw_cdp_cfg *cfg,
 		enum dpu_sspp_multirect_index index)
 {
@@ -661,7 +661,7 @@ static void dpu_hw_sspp_setup_cdp(struct dpu_hw_pipe *ctx,
 	DPU_REG_WRITE(&ctx->hw, cdp_cntl_offset, cdp_cntl);
 }
 
-static void _setup_layer_ops(struct dpu_hw_pipe *c,
+static void _setup_layer_ops(struct dpu_hw_sspp *c,
 		unsigned long features)
 {
 	if (test_bit(DPU_SSPP_SRC, &features)) {
@@ -699,7 +699,8 @@ static void _setup_layer_ops(struct dpu_hw_pipe *c,
 }
 
 #ifdef CONFIG_DEBUG_FS
-int _dpu_hw_sspp_init_debugfs(struct dpu_hw_pipe *hw_pipe, struct dpu_kms *kms, struct dentry *entry)
+int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
+			      struct dentry *entry)
 {
 	const struct dpu_sspp_cfg *cfg = hw_pipe->cap;
 	const struct dpu_sspp_sub_blks *sblk = cfg->sblk;
@@ -783,10 +784,10 @@ static const struct dpu_sspp_cfg *_sspp_offset(enum dpu_sspp sspp,
 	return ERR_PTR(-ENOMEM);
 }
 
-struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
+struct dpu_hw_sspp *dpu_hw_sspp_init(enum dpu_sspp idx,
 		void __iomem *addr, const struct dpu_mdss_cfg *catalog)
 {
-	struct dpu_hw_pipe *hw_pipe;
+	struct dpu_hw_sspp *hw_pipe;
 	const struct dpu_sspp_cfg *cfg;
 
 	if (!addr || !catalog)
@@ -812,7 +813,7 @@ struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
 	return hw_pipe;
 }
 
-void dpu_hw_sspp_destroy(struct dpu_hw_pipe *ctx)
+void dpu_hw_sspp_destroy(struct dpu_hw_sspp *ctx)
 {
 	kfree(ctx);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 0c95b7e64f6c..bbff908e6dbe 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -10,7 +10,7 @@
 #include "dpu_hw_util.h"
 #include "dpu_formats.h"
 
-struct dpu_hw_pipe;
+struct dpu_hw_sspp;
 
 /**
  * Flags
@@ -153,7 +153,7 @@ struct dpu_hw_pixel_ext {
 };
 
 /**
- * struct dpu_hw_pipe_cfg : Pipe description
+ * struct dpu_hw_sspp_cfg : SSPP configuration
  * @layout:    format layout information for programming buffer to hardware
  * @src_rect:  src ROI, caller takes into account the different operations
  *             such as decimation, flip etc to program this field
@@ -161,7 +161,7 @@ struct dpu_hw_pixel_ext {
  * @index:     index of the rectangle of SSPP
  * @mode:      parallel or time multiplex multirect mode
  */
-struct dpu_hw_pipe_cfg {
+struct dpu_hw_sspp_cfg {
 	struct dpu_hw_fmt_layout layout;
 	struct drm_rect src_rect;
 	struct drm_rect dst_rect;
@@ -214,7 +214,7 @@ struct dpu_hw_sspp_ops {
 	 * @flags: Extra flags for format config
 	 * @index: rectangle index in multirect
 	 */
-	void (*setup_format)(struct dpu_hw_pipe *ctx,
+	void (*setup_format)(struct dpu_hw_sspp *ctx,
 			const struct dpu_format *fmt, u32 flags,
 			enum dpu_sspp_multirect_index index);
 
@@ -224,8 +224,8 @@ struct dpu_hw_sspp_ops {
 	 * @cfg: Pointer to pipe config structure
 	 * @index: rectangle index in multirect
 	 */
-	void (*setup_rects)(struct dpu_hw_pipe *ctx,
-			struct dpu_hw_pipe_cfg *cfg,
+	void (*setup_rects)(struct dpu_hw_sspp *ctx,
+			struct dpu_hw_sspp_cfg *cfg,
 			enum dpu_sspp_multirect_index index);
 
 	/**
@@ -233,7 +233,7 @@ struct dpu_hw_sspp_ops {
 	 * @ctx: Pointer to pipe context
 	 * @pe_ext: Pointer to pixel ext settings
 	 */
-	void (*setup_pe)(struct dpu_hw_pipe *ctx,
+	void (*setup_pe)(struct dpu_hw_sspp *ctx,
 			struct dpu_hw_pixel_ext *pe_ext);
 
 	/**
@@ -242,8 +242,8 @@ struct dpu_hw_sspp_ops {
 	 * @cfg: Pointer to pipe config structure
 	 * @index: rectangle index in multirect
 	 */
-	void (*setup_sourceaddress)(struct dpu_hw_pipe *ctx,
-			struct dpu_hw_pipe_cfg *cfg,
+	void (*setup_sourceaddress)(struct dpu_hw_sspp *ctx,
+			struct dpu_hw_sspp_cfg *cfg,
 			enum dpu_sspp_multirect_index index);
 
 	/**
@@ -251,7 +251,7 @@ struct dpu_hw_sspp_ops {
 	 * @ctx: Pointer to pipe context
 	 * @data: Pointer to config structure
 	 */
-	void (*setup_csc)(struct dpu_hw_pipe *ctx, const struct dpu_csc_cfg *data);
+	void (*setup_csc)(struct dpu_hw_sspp *ctx, const struct dpu_csc_cfg *data);
 
 	/**
 	 * setup_solidfill - enable/disable colorfill
@@ -260,7 +260,7 @@ struct dpu_hw_sspp_ops {
 	 * @flags: Pipe flags
 	 * @index: rectangle index in multirect
 	 */
-	void (*setup_solidfill)(struct dpu_hw_pipe *ctx, u32 color,
+	void (*setup_solidfill)(struct dpu_hw_sspp *ctx, u32 color,
 			enum dpu_sspp_multirect_index index);
 
 	/**
@@ -270,7 +270,7 @@ struct dpu_hw_sspp_ops {
 	 * @mode: parallel fetch / time multiplex multirect mode
 	 */
 
-	void (*setup_multirect)(struct dpu_hw_pipe *ctx,
+	void (*setup_multirect)(struct dpu_hw_sspp *ctx,
 			enum dpu_sspp_multirect_index index,
 			enum dpu_sspp_multirect_mode mode);
 
@@ -279,7 +279,7 @@ struct dpu_hw_sspp_ops {
 	 * @ctx: Pointer to pipe context
 	 * @cfg: Pointer to config structure
 	 */
-	void (*setup_sharpening)(struct dpu_hw_pipe *ctx,
+	void (*setup_sharpening)(struct dpu_hw_sspp *ctx,
 			struct dpu_hw_sharp_cfg *cfg);
 
 	/**
@@ -289,7 +289,7 @@ struct dpu_hw_sspp_ops {
 	 * @safe_lut: LUT for generate safe level based on fill level
 	 *
 	 */
-	void (*setup_danger_safe_lut)(struct dpu_hw_pipe *ctx,
+	void (*setup_danger_safe_lut)(struct dpu_hw_sspp *ctx,
 			u32 danger_lut,
 			u32 safe_lut);
 
@@ -299,7 +299,7 @@ struct dpu_hw_sspp_ops {
 	 * @creq_lut: LUT for generate creq level based on fill level
 	 *
 	 */
-	void (*setup_creq_lut)(struct dpu_hw_pipe *ctx,
+	void (*setup_creq_lut)(struct dpu_hw_sspp *ctx,
 			u64 creq_lut);
 
 	/**
@@ -308,7 +308,7 @@ struct dpu_hw_sspp_ops {
 	 * @cfg: Pointer to pipe QoS configuration
 	 *
 	 */
-	void (*setup_qos_ctrl)(struct dpu_hw_pipe *ctx,
+	void (*setup_qos_ctrl)(struct dpu_hw_sspp *ctx,
 			struct dpu_hw_pipe_qos_cfg *cfg);
 
 	/**
@@ -316,7 +316,7 @@ struct dpu_hw_sspp_ops {
 	 * @ctx: Pointer to pipe context
 	 * @cfg: Pointer to histogram configuration
 	 */
-	void (*setup_histogram)(struct dpu_hw_pipe *ctx,
+	void (*setup_histogram)(struct dpu_hw_sspp *ctx,
 			void *cfg);
 
 	/**
@@ -325,15 +325,15 @@ struct dpu_hw_sspp_ops {
 	 * @pipe_cfg: Pointer to pipe configuration
 	 * @scaler_cfg: Pointer to scaler configuration
 	 */
-	void (*setup_scaler)(struct dpu_hw_pipe *ctx,
-		struct dpu_hw_pipe_cfg *pipe_cfg,
+	void (*setup_scaler)(struct dpu_hw_sspp *ctx,
+		struct dpu_hw_sspp_cfg *pipe_cfg,
 		void *scaler_cfg);
 
 	/**
 	 * get_scaler_ver - get scaler h/w version
 	 * @ctx: Pointer to pipe context
 	 */
-	u32 (*get_scaler_ver)(struct dpu_hw_pipe *ctx);
+	u32 (*get_scaler_ver)(struct dpu_hw_sspp *ctx);
 
 	/**
 	 * setup_cdp - setup client driven prefetch
@@ -341,13 +341,13 @@ struct dpu_hw_sspp_ops {
 	 * @cfg: Pointer to cdp configuration
 	 * @index: rectangle index in multirect
 	 */
-	void (*setup_cdp)(struct dpu_hw_pipe *ctx,
+	void (*setup_cdp)(struct dpu_hw_sspp *ctx,
 			struct dpu_hw_cdp_cfg *cfg,
 			enum dpu_sspp_multirect_index index);
 };
 
 /**
- * struct dpu_hw_pipe - pipe description
+ * struct dpu_hw_sspp - pipe description
  * @base: hardware block base structure
  * @hw: block hardware details
  * @catalog: back pointer to catalog
@@ -356,7 +356,7 @@ struct dpu_hw_sspp_ops {
  * @cap: pointer to layer_cfg
  * @ops: pointer to operations possible for this pipe
  */
-struct dpu_hw_pipe {
+struct dpu_hw_sspp {
 	struct dpu_hw_blk base;
 	struct dpu_hw_blk_reg_map hw;
 	const struct dpu_mdss_cfg *catalog;
@@ -378,7 +378,7 @@ struct dpu_kms;
  * @addr: Mapped register io address of MDP
  * @catalog : Pointer to mdss catalog data
  */
-struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
+struct dpu_hw_sspp *dpu_hw_sspp_init(enum dpu_sspp idx,
 		void __iomem *addr, const struct dpu_mdss_cfg *catalog);
 
 /**
@@ -386,10 +386,11 @@ struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
  * should be called during Hw pipe cleanup.
  * @ctx:  Pointer to SSPP driver context returned by dpu_hw_sspp_init
  */
-void dpu_hw_sspp_destroy(struct dpu_hw_pipe *ctx);
+void dpu_hw_sspp_destroy(struct dpu_hw_sspp *ctx);
 
 void dpu_debugfs_sspp_init(struct dpu_kms *dpu_kms, struct dentry *debugfs_root);
-int _dpu_hw_sspp_init_debugfs(struct dpu_hw_pipe *hw_pipe, struct dpu_kms *kms, struct dentry *entry);
+int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
+			      struct dentry *entry);
 
 #endif /*_DPU_HW_SSPP_H */
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index bfd5be89e8b8..5a4578ab62a6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -104,7 +104,7 @@ struct dpu_plane {
 
 	enum dpu_sspp pipe;
 
-	struct dpu_hw_pipe *pipe_hw;
+	struct dpu_hw_sspp *pipe_hw;
 	uint32_t color_fill;
 	bool is_error;
 	bool is_rt_pipe;
@@ -137,7 +137,7 @@ static struct dpu_kms *_dpu_plane_get_kms(struct drm_plane *plane)
  */
 static void _dpu_plane_calc_bw(struct drm_plane *plane,
 	struct drm_framebuffer *fb,
-	struct dpu_hw_pipe_cfg *pipe_cfg)
+	struct dpu_hw_sspp_cfg *pipe_cfg)
 {
 	struct dpu_plane_state *pstate;
 	struct drm_display_mode *mode;
@@ -192,7 +192,7 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
  * Result: Updates calculated clock in the plane state.
  * Clock equation: dst_w * v_total * fps * (src_h / dst_h)
  */
-static void _dpu_plane_calc_clk(struct drm_plane *plane, struct dpu_hw_pipe_cfg *pipe_cfg)
+static void _dpu_plane_calc_clk(struct drm_plane *plane, struct dpu_hw_sspp_cfg *pipe_cfg)
 {
 	struct dpu_plane_state *pstate;
 	struct drm_display_mode *mode;
@@ -276,7 +276,7 @@ static int _dpu_plane_calc_fill_level(struct drm_plane *plane,
  * @pipe_cfg:		Pointer to pipe configuration
  */
 static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
-		struct drm_framebuffer *fb, struct dpu_hw_pipe_cfg *pipe_cfg)
+		struct drm_framebuffer *fb, struct dpu_hw_sspp_cfg *pipe_cfg)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	const struct dpu_format *fmt = NULL;
@@ -419,7 +419,7 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
  * @pipe_cfg:		Pointer to pipe configuration
  */
 static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
-		struct drm_crtc *crtc, struct dpu_hw_pipe_cfg *pipe_cfg)
+		struct drm_crtc *crtc, struct dpu_hw_sspp_cfg *pipe_cfg)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_vbif_set_ot_params ot_params;
@@ -467,7 +467,7 @@ static void _dpu_plane_set_qos_remap(struct drm_plane *plane)
 
 static void _dpu_plane_set_scanout(struct drm_plane *plane,
 		struct dpu_plane_state *pstate,
-		struct dpu_hw_pipe_cfg *pipe_cfg,
+		struct dpu_hw_sspp_cfg *pipe_cfg,
 		struct drm_framebuffer *fb)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
@@ -635,7 +635,7 @@ static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_plane *pdpu, cons
 static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
 		struct dpu_plane_state *pstate,
 		const struct dpu_format *fmt, bool color_fill,
-		struct dpu_hw_pipe_cfg *pipe_cfg)
+		struct dpu_hw_sspp_cfg *pipe_cfg)
 {
 	const struct drm_format_info *info = drm_format_info(fmt->base.pixel_format);
 	struct dpu_hw_scaler3_cfg scaler3_cfg;
@@ -691,7 +691,7 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 	const struct dpu_format *fmt;
 	const struct drm_plane *plane = &pdpu->base;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
-	struct dpu_hw_pipe_cfg pipe_cfg;
+	struct dpu_hw_sspp_cfg pipe_cfg;
 
 	DPU_DEBUG_PLANE(pdpu, "\n");
 
@@ -1129,9 +1129,9 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	bool is_rt_pipe;
 	const struct dpu_format *fmt =
 		to_dpu_format(msm_framebuffer_format(fb));
-	struct dpu_hw_pipe_cfg pipe_cfg;
+	struct dpu_hw_sspp_cfg pipe_cfg;
 
-	memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
+	memset(&pipe_cfg, 0, sizeof(struct dpu_hw_sspp_cfg));
 
 	_dpu_plane_set_scanout(plane, pstate, &pipe_cfg, fb);
 
-- 
2.39.2

