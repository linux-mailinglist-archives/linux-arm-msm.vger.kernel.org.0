Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFBB64AF838
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Feb 2022 18:26:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238170AbiBIRZf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Feb 2022 12:25:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238160AbiBIRZc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Feb 2022 12:25:32 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA19EC05CB90
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Feb 2022 09:25:34 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id 13so5539303lfp.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Feb 2022 09:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MG3zuJRQr0/11wQ3yzupBhlp7+IP6nsyDfHf4irQxtY=;
        b=u5qfYP9TDVSTY4earvH1yPKWmkiPqVvTc49fKYcLElCuaeeEa5+4i4BeQ5HWjhyK7J
         Dgh+bG0HhXimVWD+hufvDQLsxUG22MPfk4yPF+BtgZFn+EyliSvMaf2cycyH7qNBifVr
         z9phkN3FawAzNkDcpdTkfw6U+ImxQTr1Stfoq6sNPqhgsonNwkVZukcAseHoExVKx3EH
         FjbvEuAD6DdN3yXWtUiFRvhZM6cVnzU0TlvWAw4WRD40gYIOdMRqFHAF8KKeyQdKKdWy
         lyJeWTVbY4Hd9gWNXDaM4wNsg/26xjy2uJvpt3mz1uaMdMsG5kZ9i8DUsuLIV0rkUu/W
         CyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MG3zuJRQr0/11wQ3yzupBhlp7+IP6nsyDfHf4irQxtY=;
        b=MWSaiORWV/E+L9X9DvTyU09CNl8N4UlLAiZbkKFtQLM9SShp7u5XrTFe3qk4E29A8F
         MSQUxslX8yRvvUf28IFPHW8WfsqDdbjSBvzFbdhEbazXJbe+2xhlufxofQf+8OhrJLYN
         /NEDcMhxvBuQ50qpMmfyGo1CCa2E4MphjdUj1/DSinl/xUyFbQIvs2diXo5P73bnlcIr
         6BZ6l19auDogQdWwVmC0nSHgyu6nj4PaU50Doh12QWV9Ok8FLcR6UHvdpH7SEQJbUFdf
         fxPTGHDF0eqtekADdiv2VLxflhpOBU7PCZlEJRsFT0t+qNrc/x07x9Kf7sSpRCZi7pqW
         t1UA==
X-Gm-Message-State: AOAM533YjJv+XmsEcunvp/QLvV2DnVGiLn2yUq/uvijgjaG+SBjuXDCg
        yWfS26g0L1xmLbMeNXaIXYqWbQ==
X-Google-Smtp-Source: ABdhPJzkspnpj0RHn32D7wkua/6ALOhuUR/7ZzYarqohURMzFEL3aURJi+Dzg6eCk+O3QN1IBBJPpg==
X-Received: by 2002:a05:6512:114d:: with SMTP id m13mr2197256lfg.450.1644427533287;
        Wed, 09 Feb 2022 09:25:33 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 09:25:32 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 12/25] drm/msm/dpu: inline _dpu_plane_set_scanout
Date:   Wed,  9 Feb 2022 20:25:07 +0300
Message-Id: <20220209172520.3719906-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
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

In preparation to reworking dpu_plane_sspp_atomic_update() inline the
_dpu_plane_set_scanout() function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 41 ++++++++++-------------
 1 file changed, 18 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index d029ce806039..3ce7dcc285e2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -490,28 +490,6 @@ static void _dpu_plane_set_qos_remap(struct drm_plane *plane)
 	dpu_vbif_set_qos_remap(dpu_kms, &qos_params);
 }
 
-static void _dpu_plane_set_scanout(struct drm_plane *plane,
-		struct dpu_plane_state *pstate,
-		struct dpu_hw_pipe_cfg *pipe_cfg,
-		struct drm_framebuffer *fb)
-{
-	struct dpu_plane *pdpu = to_dpu_plane(plane);
-	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
-	struct msm_gem_address_space *aspace = kms->base.aspace;
-	int ret;
-
-	ret = dpu_format_populate_layout(aspace, fb, &pipe_cfg->layout);
-	if (ret == -EAGAIN)
-		DPU_DEBUG_PLANE(pdpu, "not updating same src addrs\n");
-	else if (ret)
-		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
-	else if (pstate->pipe.sspp->ops.setup_sourceaddress) {
-		trace_dpu_plane_set_scanout(&pstate->pipe,
-					    &pipe_cfg->layout);
-		pstate->pipe.sspp->ops.setup_sourceaddress(&pstate->pipe, pipe_cfg);
-	}
-}
-
 static void _dpu_plane_setup_scaler3(struct dpu_hw_pipe *pipe_hw,
 		uint32_t src_w, uint32_t src_h, uint32_t dst_w, uint32_t dst_h,
 		struct dpu_hw_scaler3_cfg *scale_cfg,
@@ -1074,10 +1052,27 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	const struct dpu_format *fmt =
 		to_dpu_format(msm_framebuffer_format(fb));
 	struct dpu_hw_pipe_cfg pipe_cfg;
+	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
+	struct msm_gem_address_space *aspace = kms->base.aspace;
+	bool update_src_addr = true;
+	int ret;
 
 	memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
 
-	_dpu_plane_set_scanout(plane, pstate, &pipe_cfg, fb);
+	ret = dpu_format_populate_layout(aspace, fb, &pipe_cfg.layout);
+	if (ret == -EAGAIN) {
+		DPU_DEBUG_PLANE(pdpu, "not updating same src addrs\n");
+		update_src_addr = false;
+	} else if (ret) {
+		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
+		update_src_addr = false;
+	}
+
+	if (update_src_addr &&
+	    pipe->sspp->ops.setup_sourceaddress) {
+		trace_dpu_plane_set_scanout(pipe, &pipe_cfg.layout);
+		pipe->sspp->ops.setup_sourceaddress(pipe, &pipe_cfg);
+	}
 
 	pstate->pending = true;
 
-- 
2.34.1

