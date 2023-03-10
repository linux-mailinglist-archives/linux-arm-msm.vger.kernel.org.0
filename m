Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 148E76B3325
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Mar 2023 01:57:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbjCJA5p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 19:57:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229933AbjCJA5d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 19:57:33 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75E8910339C
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 16:57:29 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id m6so4620551lfq.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 16:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678409849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9aJ5jicF9C8vMK5aC+d8/WlOn4/QqskwYJwHac+MO44=;
        b=YXdtBA+gHoC8CE13NJUZ0tgzqk6HJxsBjcjwz5ideHa6WJU7JcdqHXCep6PvvDn4M4
         C6ekC3CjWrdCSV8s/GYkDhN8AbPnwjVcHjz1k0pgKgADYNb9C4hyliUOO2uKpO8cltt9
         /rqWiK9pLYrbvVbIWWe8irzPHYgKIdEoOfe159lfvuL4WlbjeAT5GehvJZL2gNFRK3vS
         03OFP8WbURW3yYdojDDIZ1f+J59K+q2OGlQxW3khAUjItJkSaXiQNzHwOLH8OXYjZDHE
         oHQqlN3ZGSfnPoBslYbQVUdzqUmk2GTVJ7mP/3JpoGp1v2sV7qlkbklboo9z7DdYgIyh
         Ybbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678409849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9aJ5jicF9C8vMK5aC+d8/WlOn4/QqskwYJwHac+MO44=;
        b=DvlQBsgXSDZ/kcOTPBtwu+aOyqw2pSoUecePIrKFibA1n4PkjwBn+Rrp6exox7gn/h
         ABmFydbDf77QAQuJVGjULEm/ARoRhmQEGoiGI8RKsGLbV/cFARyMKBYI6bnFjoRta0GZ
         0Z/03vzHzMUtrHjOUaf5MptNU9V6/Zh7BhvBFT9cbhadc4s+C4pXErUnVdOYgfTdqYfI
         hD6IUQckk0uNSN+c6MSWJX7KvGRCvs+jRrNEh8L3rBkFcxSGc80+vrrA6x4lOAQcMqFJ
         GuuhMvspXgS8HzU/IQcCKPT1AnxZoVO47L5FuHf2WmDoQlSfHF9//EDhul3yQ4gzVAVZ
         rkWw==
X-Gm-Message-State: AO0yUKU1Ct87FdGu1PwmgwLOLnPbMmtiSL0nL3j/EkLarREAYSzxEtHx
        cgijeAXDROCvRErdlwp05NCYtw==
X-Google-Smtp-Source: AK7set+W+qX7X3i8I/INJv4ObxBbypnt+ZrcN3/61+lU2+EjwrqoQ5Bd9KAWPo4vaWU3ZxhPQQRhWg==
X-Received: by 2002:a19:550f:0:b0:4dd:aefc:8777 with SMTP id n15-20020a19550f000000b004ddaefc8777mr6481980lfe.47.1678409848841;
        Thu, 09 Mar 2023 16:57:28 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id m13-20020ac2428d000000b004d8540b947asm75280lfh.56.2023.03.09.16.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 16:57:28 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v5 25/32] drm/msm/dpu: rework static color fill code
Date:   Fri, 10 Mar 2023 02:56:57 +0200
Message-Id: <20230310005704.1332368-26-dmitry.baryshkov@linaro.org>
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

