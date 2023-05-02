Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70D966F46B7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 17:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234260AbjEBPGA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 11:06:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233906AbjEBPFz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 11:05:55 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49B9D211B
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 08:05:43 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2a8bbea12d7so39165621fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 May 2023 08:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683039941; x=1685631941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8J28eACRqrNZgWLdcKBN02apY9uwxk7NuPSUNH9E5M=;
        b=AzDc3eH/QL3XDfklmWMCuwTWngDjDMXQs4JVchYgaAvK+0syeR7feBjVhcAeYYzXA5
         tQsZkJ4w8EyCIvk78CXzcTFQw7DByTK4/qV1zRYFPcA8TcWsxjeeXRHlA42raZ5EbHlF
         Z1mmP0OKzo7gm6FIvwQLSsyO5vnW2PgJVwrzh415Ox/TbbN8noiTundQrwNx58/ayMy2
         o+PrGesERFXPVgXwvF1IdO2dWLlYhcT0dbYuouqtptWN9GcKg7lnGe0kFVXMPKMfDqFw
         m/KC7MZY2pCifFWU3aHqNTOgE5Bf1xPuWFf7BRkA++vSzY/b7FS/U+v/FEHLgiYM4WLe
         aRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683039941; x=1685631941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c8J28eACRqrNZgWLdcKBN02apY9uwxk7NuPSUNH9E5M=;
        b=VMopcqfKD8kx6AAzLsKS7xLAJdSUbEup0+7SyVsF7re7b/kWaLEtdAVC6ptvgRwG3S
         kh/RwBDh+T4I5Q7ZQWipAeMSIh1Ph2qaKAD0eR7HxjzX7iffrk6zDtKRRiWbLBcrdpZb
         ZKzJhVur9CZQijDnZ6isIA1IWRgG5SazWp++PKW2rdrUT+oJ+dDkUZnQ/QmluVdxs4LW
         fFMozw/H5b6inhD6tRfMdyZ+o+7ezs8MfT+1fNorpWrxemrg5JcZwSf945UhDsWT+pC8
         mdoMQdm6P9U4ZTQXmAdbxJxAYGWIkL7RbHq5xusuhT3dGU+dDMmCJgFJLDNEa8grJes+
         jVNg==
X-Gm-Message-State: AC+VfDxtj7xCi5il1ty76CKWnLbSGOKotKk3VIQDPBlVGbpbzlxLteFe
        z+mDqVLT5nA5SeBQRVWhywJyUg==
X-Google-Smtp-Source: ACHHUZ7SjgXwKWOMidjKqm8nWy3aeDgoQonE55kn1Led+AsBROR39chuCNK1FBcDGLfBevW/kW8E2g==
X-Received: by 2002:a2e:7012:0:b0:2a7:8582:f4f2 with SMTP id l18-20020a2e7012000000b002a78582f4f2mr4677326ljc.32.1683039941552;
        Tue, 02 May 2023 08:05:41 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id a22-20020a2e8316000000b002a8bb52d994sm5341659ljh.25.2023.05.02.08.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 08:05:41 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 7/9] drm/msm/dpu: drop DPU_PLANE_QOS_PANIC_CTRL
Date:   Tue,  2 May 2023 18:05:31 +0300
Message-Id: <20230502150533.3672840-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230502150533.3672840-1-dmitry.baryshkov@linaro.org>
References: <20230502150533.3672840-1-dmitry.baryshkov@linaro.org>
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

This flag is always passed to _dpu_plane_set_qos_ctrl(), so drop it and
remove corresponding conditions from the mentioned function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 27 +++++++----------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 0ed350776775..d1443c4b2915 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -70,15 +70,6 @@ static const uint32_t qcom_compressed_supported_formats[] = {
 	DRM_FORMAT_P010,
 };
 
-/**
- * enum dpu_plane_qos - Different qos configurations for each pipe
- *
- * @DPU_PLANE_QOS_PANIC_CTRL: Setup panic for the pipe.
- */
-enum dpu_plane_qos {
-	DPU_PLANE_QOS_PANIC_CTRL = BIT(2),
-};
-
 /*
  * struct dpu_plane - local dpu plane structure
  * @aspace: address space pointer
@@ -349,15 +340,14 @@ static void _dpu_plane_set_danger_lut(struct drm_plane *plane,
  */
 static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
 	struct dpu_sw_pipe *pipe,
-	bool enable, u32 flags)
+	bool enable)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_hw_pipe_qos_cfg pipe_qos_cfg;
 
 	memset(&pipe_qos_cfg, 0, sizeof(pipe_qos_cfg));
 
-	if (flags & DPU_PLANE_QOS_PANIC_CTRL)
-		pipe_qos_cfg.danger_safe_en = enable;
+	pipe_qos_cfg.danger_safe_en = enable;
 
 	if (!pdpu->is_rt_pipe)
 		pipe_qos_cfg.danger_safe_en = false;
@@ -1058,7 +1048,7 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
 
 	/* override for color fill */
 	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
-		_dpu_plane_set_qos_ctrl(plane, pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
+		_dpu_plane_set_qos_ctrl(plane, pipe, false);
 
 		/* skip remaining processing on color fill */
 		return;
@@ -1104,8 +1094,7 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
 	_dpu_plane_set_danger_lut(plane, pipe, fmt);
 	_dpu_plane_set_qos_ctrl(plane, pipe,
 				pipe->sspp->idx != SSPP_CURSOR0 &&
-				pipe->sspp->idx != SSPP_CURSOR1,
-				DPU_PLANE_QOS_PANIC_CTRL);
+				pipe->sspp->idx != SSPP_CURSOR1);
 
 	if (pipe->sspp->idx != SSPP_CURSOR0 &&
 	    pipe->sspp->idx != SSPP_CURSOR1)
@@ -1224,10 +1213,10 @@ static void dpu_plane_destroy(struct drm_plane *plane)
 
 	if (pdpu) {
 		pstate = to_dpu_plane_state(plane->state);
-		_dpu_plane_set_qos_ctrl(plane, &pstate->pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
+		_dpu_plane_set_qos_ctrl(plane, &pstate->pipe, false);
 
 		if (pstate->r_pipe.sspp)
-			_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
+			_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, false);
 
 		mutex_destroy(&pdpu->lock);
 
@@ -1384,9 +1373,9 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
 		return;
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
-	_dpu_plane_set_qos_ctrl(plane, &pstate->pipe, enable, DPU_PLANE_QOS_PANIC_CTRL);
+	_dpu_plane_set_qos_ctrl(plane, &pstate->pipe, enable);
 	if (pstate->r_pipe.sspp)
-		_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, enable, DPU_PLANE_QOS_PANIC_CTRL);
+		_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, enable);
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }
 #endif
-- 
2.39.2

