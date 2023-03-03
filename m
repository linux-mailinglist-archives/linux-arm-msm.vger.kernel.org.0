Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82C576A97C4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Mar 2023 13:57:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbjCCM5m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Mar 2023 07:57:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230202AbjCCM5h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Mar 2023 07:57:37 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 737955D759
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Mar 2023 04:57:36 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id f18so3486551lfa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Mar 2023 04:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9A1yItHnVjLCkkrvFzWKL06/fFB2ivnHBT1T8+CFDyw=;
        b=xbxrvsOkzIw03vahzMVnFgrAiNG03hz4xm5x35R7zqOTwii/e2yfGfFZ1nQ8IX61On
         haxbqq+XIdlIs+OesTEgsYGMxDvLXSfW8TeLRTQgAgqsweTssYU/0n4AtuVCbppo/D4p
         ibtyxCRDtZKounDxCsICb3HYfbKLqSBpVcSbeQJYPMS1Ewy5HBh0qoe9KDlL1yxD3KiS
         iu9wu/V0UfEjB8b7DaUx8jPbcqMhEgHugA5eg8K5gM5hTL15PKmutgNY03XMPcJytAh1
         /CdQ2t/JcFrc4yBwIbYtVXrUlS/Y01btPJtGZCOr5EYeFOQiihGkSf6HZkAms3DTJ32B
         GyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9A1yItHnVjLCkkrvFzWKL06/fFB2ivnHBT1T8+CFDyw=;
        b=OM+RAjv+Lxr74FyjoPF/jvIN9X4A0Szg5/8yZnAqqfwqlHpTJ+h/SbxWd6W4Lqs9Bw
         qyuCz6ldsZaJWnu68peZAnkRAO2cBeQpToUB2DeHWA9B7dlq8+6rHguIX/xFDnRBHIgH
         qAHiKkAnhQwdFmWhie4yg/ZwYH4gBlhUYs++rJiigKRIYsOx9OuOUHA3QMbRc7HfC5rZ
         7D25MZmobcClpmXgYT5PXPz6wHVnCOtJaYejFbmiiNINW2oVoIsb+xQcBnFJgQS2emVu
         xqFHCPpZMtHYksMNJYcDyUt2C8pVwUid0r1J+7BQKXUGkxrlaAPhClbsQ4UXJiyJ3NW1
         FVCQ==
X-Gm-Message-State: AO0yUKVABqo8+9ZmTmOoX4hiHtO63sqg3mnFA1o504c1Nmiz71JMHFi0
        BpIaRbr6VfibNkcfwd61yGsfIw==
X-Google-Smtp-Source: AK7set8g/kqyvEXCyvR2PxYUe5gbKQWbvA5Akn5KRCCA55My42Qpr8IJrGg5kuOclpvBYaqf/bC7Rw==
X-Received: by 2002:ac2:5a19:0:b0:4b5:43ef:a555 with SMTP id q25-20020ac25a19000000b004b543efa555mr476219lfn.69.1677848254839;
        Fri, 03 Mar 2023 04:57:34 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c5-20020ac25305000000b004cf07a0051csm379266lfh.228.2023.03.03.04.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 04:57:34 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v4 13/30] drm/msm/dpu: rename dpu_hw_sspp_cfg to dpu_sw_pipe_cfg
Date:   Fri,  3 Mar 2023 14:57:08 +0200
Message-Id: <20230303125725.3695011-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303125725.3695011-1-dmitry.baryshkov@linaro.org>
References: <20230303125725.3695011-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As struct dpu_hw_sspp_cfg describes only the source and destination
rectangles, it is a software pipe configuration now. Rename it
accordingly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 16 ++++++++--------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index e87c6377f315..6e5b62f3276f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -447,7 +447,7 @@ static u32 _dpu_hw_sspp_get_scaler3_ver(struct dpu_hw_sspp *ctx)
  * dpu_hw_sspp_setup_rects()
  */
 static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
-		struct dpu_hw_sspp_cfg *cfg)
+		struct dpu_sw_pipe_cfg *cfg)
 {
 	struct dpu_hw_sspp *ctx = pipe->sspp;
 	struct dpu_hw_blk_reg_map *c;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 100d8e06c90d..e73d6ac863ad 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -153,12 +153,12 @@ struct dpu_hw_pixel_ext {
 };
 
 /**
- * struct dpu_hw_sspp_cfg : SSPP configuration
+ * struct dpu_sw_pipe_cfg : software pipe configuration
  * @src_rect:  src ROI, caller takes into account the different operations
  *             such as decimation, flip etc to program this field
  * @dest_rect: destination ROI.
  */
-struct dpu_hw_sspp_cfg {
+struct dpu_sw_pipe_cfg {
 	struct drm_rect src_rect;
 	struct drm_rect dst_rect;
 };
@@ -228,7 +228,7 @@ struct dpu_hw_sspp_ops {
 	 * @cfg: Pointer to pipe config structure
 	 */
 	void (*setup_rects)(struct dpu_sw_pipe *pipe,
-			    struct dpu_hw_sspp_cfg *cfg);
+			    struct dpu_sw_pipe_cfg *cfg);
 
 	/**
 	 * setup_pe - setup pipe pixel extension
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 4ae70d21c37a..ce01a602cbc9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -136,7 +136,7 @@ static struct dpu_kms *_dpu_plane_get_kms(struct drm_plane *plane)
  */
 static void _dpu_plane_calc_bw(struct drm_plane *plane,
 	struct drm_framebuffer *fb,
-	struct dpu_hw_sspp_cfg *pipe_cfg)
+	struct dpu_sw_pipe_cfg *pipe_cfg)
 {
 	struct dpu_plane_state *pstate;
 	struct drm_display_mode *mode;
@@ -191,7 +191,7 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
  * Result: Updates calculated clock in the plane state.
  * Clock equation: dst_w * v_total * fps * (src_h / dst_h)
  */
-static void _dpu_plane_calc_clk(struct drm_plane *plane, struct dpu_hw_sspp_cfg *pipe_cfg)
+static void _dpu_plane_calc_clk(struct drm_plane *plane, struct dpu_sw_pipe_cfg *pipe_cfg)
 {
 	struct dpu_plane_state *pstate;
 	struct drm_display_mode *mode;
@@ -275,7 +275,7 @@ static int _dpu_plane_calc_fill_level(struct drm_plane *plane,
  * @pipe_cfg:		Pointer to pipe configuration
  */
 static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
-		struct drm_framebuffer *fb, struct dpu_hw_sspp_cfg *pipe_cfg)
+		struct drm_framebuffer *fb, struct dpu_sw_pipe_cfg *pipe_cfg)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
@@ -421,7 +421,7 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
  * @pipe_cfg:		Pointer to pipe configuration
  */
 static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
-		struct drm_crtc *crtc, struct dpu_hw_sspp_cfg *pipe_cfg)
+		struct drm_crtc *crtc, struct dpu_sw_pipe_cfg *pipe_cfg)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
@@ -635,7 +635,7 @@ static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_plane *pdpu, cons
 
 static void _dpu_plane_setup_scaler(struct dpu_sw_pipe *pipe,
 		const struct dpu_format *fmt, bool color_fill,
-		struct dpu_hw_sspp_cfg *pipe_cfg,
+		struct dpu_sw_pipe_cfg *pipe_cfg,
 		unsigned int rotation)
 {
 	struct dpu_hw_sspp *pipe_hw = pipe->sspp;
@@ -694,7 +694,7 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 	const struct dpu_format *fmt;
 	const struct drm_plane *plane = &pdpu->base;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
-	struct dpu_hw_sspp_cfg pipe_cfg;
+	struct dpu_sw_pipe_cfg pipe_cfg;
 
 	DPU_DEBUG_PLANE(pdpu, "\n");
 
@@ -1130,9 +1130,9 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	bool is_rt_pipe;
 	const struct dpu_format *fmt =
 		to_dpu_format(msm_framebuffer_format(fb));
-	struct dpu_hw_sspp_cfg pipe_cfg;
+	struct dpu_sw_pipe_cfg pipe_cfg;
 
-	memset(&pipe_cfg, 0, sizeof(struct dpu_hw_sspp_cfg));
+	memset(&pipe_cfg, 0, sizeof(struct dpu_sw_pipe_cfg));
 
 	_dpu_plane_set_scanout(plane, pstate, fb);
 
-- 
2.39.2

