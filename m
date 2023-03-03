Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7A46A97D0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Mar 2023 13:57:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbjCCM5s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Mar 2023 07:57:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229893AbjCCM5o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Mar 2023 07:57:44 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5550F5FE81
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Mar 2023 04:57:43 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id s22so3435587lfi.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Mar 2023 04:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9aJ5jicF9C8vMK5aC+d8/WlOn4/QqskwYJwHac+MO44=;
        b=kmk8sSlWBt0oc5XpUOE2myuSZa8NvPeOlxYm1XKeWY6u6ky3Meo94+zqlFDQ4C9AvC
         XCV6IOl1rPOhANEf1TxUGAVuWNb2rzKQLRKUxtYHdPammkU9SnntTYmKyFCerFGSEw2X
         cQR+YIEBm3cAvv6rnYpG0Z2LlZomKrmp/+rnhdpDMkSHAtUYXyk9aNYaY7waQDCoIMnG
         rbxTlcRUUzts8emOwq5r7OSW09G+IstvjQUb+UX5O70YO3QlZeilLMOTgfAEWkJAYtQE
         +fGz36yOTjZIxNayomPjaLztfAxjH9j360XWC/Xpdqfr0c6krZLdSvlK8FQAa3d6T2P1
         mbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9aJ5jicF9C8vMK5aC+d8/WlOn4/QqskwYJwHac+MO44=;
        b=7uYcGwcSyl8HzDUGu+8EqaH31/ZHDbuIOnzYYPQy910NFfhPZouYx8BNcTkHT8bvT+
         ysPxe1j3eJaymeqQADCOC9cCBKbIFY5WQpP5WIKimdwcxsbfzDxwt7Js05YHC/ghANgK
         Kfy8+EznuhOUKMMOAXHciEEvxBm15Fg4E+lDgVb3q+FSmyVgSAH5LfiQCHITULI2Nkev
         yWIDY5pEHvcpu+MAThMPzmAo7Xv63N0DaG1FdRP3MlqCXz/o1LLPetsvHvgU+2/rAGQD
         lts1YXMmQ2CcNnjP0dAHCVPzrpMWYju3PmWAgXzpyiJqKrZRGJ25xbI2o1wVrWJqz3RH
         IMFw==
X-Gm-Message-State: AO0yUKU07tndB2M/Z6inv/UIHMfqb02ekyqUuBgeluMuqxfOXJz/GJfy
        XLuk33vj9qUZZqZIQoPZD5U6Zg==
X-Google-Smtp-Source: AK7set/Mfm93e92dpHnxotjdYZz5HVj3Wg6oRaJ+M6cpefwmE6gdkyY/swRyWAmyFdCCdp4ZRXX+/w==
X-Received: by 2002:a05:6512:516:b0:4dd:ad4c:74b7 with SMTP id o22-20020a056512051600b004ddad4c74b7mr528920lfb.24.1677848262910;
        Fri, 03 Mar 2023 04:57:42 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c5-20020ac25305000000b004cf07a0051csm379266lfh.228.2023.03.03.04.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 04:57:42 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v4 25/30] drm/msm/dpu: rework static color fill code
Date:   Fri,  3 Mar 2023 14:57:20 +0200
Message-Id: <20230303125725.3695011-26-dmitry.baryshkov@linaro.org>
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

Rework static color fill code to separate the pipe / pipe_cfg handling.
This is a preparation for the r_pipe support.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 69 +++++++++++++----------
 1 file changed, 40 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index c637713e23c7..3d798b939faa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -640,20 +640,52 @@ static void _dpu_plane_setup_scaler(struct dpu_sw_pipe *pipe,
 				fmt);
 }
 
+static void _dpu_plane_color_fill_pipe(struct dpu_plane_state *pstate,
+				       struct dpu_sw_pipe *pipe,
+				       struct drm_rect *dst_rect,
+				       u32 fill_color,
+				       const struct dpu_format *fmt)
+{
+	struct dpu_sw_pipe_cfg pipe_cfg;
+
+	/* update sspp */
+	if (!pipe->sspp->ops.setup_solidfill)
+		return;
+
+	pipe->sspp->ops.setup_solidfill(pipe, fill_color);
+
+	/* override scaler/decimation if solid fill */
+	pipe_cfg.dst_rect = *dst_rect;
+
+	pipe_cfg.src_rect.x1 = 0;
+	pipe_cfg.src_rect.y1 = 0;
+	pipe_cfg.src_rect.x2 =
+		drm_rect_width(&pipe_cfg.dst_rect);
+	pipe_cfg.src_rect.y2 =
+		drm_rect_height(&pipe_cfg.dst_rect);
+
+	if (pipe->sspp->ops.setup_format)
+		pipe->sspp->ops.setup_format(pipe, fmt, DPU_SSPP_SOLID_FILL);
+
+	if (pipe->sspp->ops.setup_rects)
+		pipe->sspp->ops.setup_rects(pipe, &pipe_cfg);
+
+	_dpu_plane_setup_scaler(pipe, fmt, true, &pipe_cfg, pstate->rotation);
+}
+
 /**
  * _dpu_plane_color_fill - enables color fill on plane
  * @pdpu:   Pointer to DPU plane object
  * @color:  RGB fill color value, [23..16] Blue, [15..8] Green, [7..0] Red
  * @alpha:  8-bit fill alpha value, 255 selects 100% alpha
- * Returns: 0 on success
  */
-static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
+static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
 		uint32_t color, uint32_t alpha)
 {
 	const struct dpu_format *fmt;
 	const struct drm_plane *plane = &pdpu->base;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
-	struct dpu_sw_pipe_cfg pipe_cfg;
+	u32 fill_color = (color & 0xFFFFFF) | ((alpha & 0xFF) << 24);
 
 	DPU_DEBUG_PLANE(pdpu, "\n");
 
@@ -662,34 +694,13 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 	 * h/w only supports RGB variants
 	 */
 	fmt = dpu_get_dpu_format(DRM_FORMAT_ABGR8888);
+	/* should not happen ever */
+	if (!fmt)
+		return;
 
 	/* update sspp */
-	if (fmt && pstate->pipe.sspp->ops.setup_solidfill) {
-		pstate->pipe.sspp->ops.setup_solidfill(&pstate->pipe,
-				(color & 0xFFFFFF) | ((alpha & 0xFF) << 24));
-
-		/* override scaler/decimation if solid fill */
-		pipe_cfg.dst_rect = pstate->base.dst;
-
-		pipe_cfg.src_rect.x1 = 0;
-		pipe_cfg.src_rect.y1 = 0;
-		pipe_cfg.src_rect.x2 =
-			drm_rect_width(&pipe_cfg.dst_rect);
-		pipe_cfg.src_rect.y2 =
-			drm_rect_height(&pipe_cfg.dst_rect);
-
-		if (pstate->pipe.sspp->ops.setup_format)
-			pstate->pipe.sspp->ops.setup_format(&pstate->pipe,
-					fmt, DPU_SSPP_SOLID_FILL);
-
-		if (pstate->pipe.sspp->ops.setup_rects)
-			pstate->pipe.sspp->ops.setup_rects(&pstate->pipe,
-					&pipe_cfg);
-
-		_dpu_plane_setup_scaler(&pstate->pipe, fmt, true, &pipe_cfg, pstate->rotation);
-	}
-
-	return 0;
+	_dpu_plane_color_fill_pipe(pstate, &pstate->pipe, &pstate->pipe_cfg.dst_rect,
+				   fill_color, fmt);
 }
 
 int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane)
-- 
2.39.2

