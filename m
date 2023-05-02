Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70CF46F46B5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 17:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234254AbjEBPGA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 11:06:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233946AbjEBPFz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 11:05:55 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66CC52119
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 08:05:42 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2a8b62cfaceso39461861fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 May 2023 08:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683039940; x=1685631940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bElysP1UJSOGquuvipEK769ngA8o08YYKDnk6OwOQeg=;
        b=AC1d3IKWbRenC2OOtU2v/2DnwiI5mpovUXn823Y4N3V7jwB2JjZG89wC4IyzgTNvTl
         HDo8bCb4z+xGQurb7keicFeBBHaWT5kJrTTmVTG5TI3/bNTmR832QwJwnVX/e9n6k4Tc
         Gm4pfRpwEADFRJDMBNP15H69GHs62BOmVJAzIheSvaycrQxsj0TIC0DnjvcHcANOkOZn
         CPku8hoplc5ODVcoeOJQYqiF6Db6az3o/1JYzglOfKI7Ym6jLfeZC5xUmrZvmUaqQTdi
         mgmCQA381QYFlXRdTPME6jf14R0Y4daOsiIL/9IdgUh9/8DSLRpMMmW32v8IrxcdloZA
         GTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683039940; x=1685631940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bElysP1UJSOGquuvipEK769ngA8o08YYKDnk6OwOQeg=;
        b=cxQHlFH6qMe6jxESJtDVKI3kAzXvrdIV1yGl/aC5wpELDFw6ZcQF9ilF2NAYkLej4R
         X8hbDhfnhaXPGO0yz0vqhWNC8cEGi+Q4JeUQ/cmtC19Uvm8RMwvrN5j6EJibvF5M85E7
         NKDUZjZELBs/m9+y0U4lae317wc0xxBffln1h1VtnN6UiTcuGr2EvBJd7gUvoDXiObCo
         5wu2D7u0sUrIUFixEli1RgIfWVlpAlJKezhR8Pllf4cvac3GMqcWHKzDoN8p8jFlt+xA
         4sqMC8bINWYU81N/XBNuFtdbAg6JputdfNSOmPUDdWJvZC9+9ZavOnazXJJVnWLdyXzO
         FhbA==
X-Gm-Message-State: AC+VfDw0LkaKnSc7N+85jElvvN6a8ZDBpf97R51aY+fiRaDGOKBrKHFB
        W7XZR3wgVRviHdURPbnMZbr7Mw==
X-Google-Smtp-Source: ACHHUZ5kGIzQWzeMLRi5+leeEwu7rwXbQrCuqJfzIr98G1B2LUDH5SC8OFmqK5xnDNKTkxI45oA0NA==
X-Received: by 2002:a2e:8507:0:b0:2ac:66c8:3c4b with SMTP id j7-20020a2e8507000000b002ac66c83c4bmr413374lji.11.1683039940735;
        Tue, 02 May 2023 08:05:40 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id a22-20020a2e8316000000b002a8bb52d994sm5341659ljh.25.2023.05.02.08.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 08:05:40 -0700 (PDT)
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
Subject: [PATCH v2 6/9] drm/msm/dpu: simplify qos_ctrl handling
Date:   Tue,  2 May 2023 18:05:30 +0300
Message-Id: <20230502150533.3672840-7-dmitry.baryshkov@linaro.org>
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

After removal of DPU_PLANE_QOS_VBLANK_CTRL, several fields of struct
dpu_hw_pipe_qos_cfg are fixed to false/0. Drop them from the structure
(and drop the corresponding code from the functions).

The DPU_PLANE_QOS_VBLANK_AMORTIZE flag is also removed, since it is now
a NOP.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 10 ----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  6 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 17 ++---------------
 3 files changed, 2 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index b198def5534b..341e3a8fc927 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -575,16 +575,6 @@ static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_sspp *ctx,
 	if (!ctx)
 		return;
 
-	if (cfg->vblank_en) {
-		qos_ctrl |= ((cfg->creq_vblank &
-				SSPP_QOS_CTRL_CREQ_VBLANK_MASK) <<
-				SSPP_QOS_CTRL_CREQ_VBLANK_OFF);
-		qos_ctrl |= ((cfg->danger_vblank &
-				SSPP_QOS_CTRL_DANGER_VBLANK_MASK) <<
-				SSPP_QOS_CTRL_DANGER_VBLANK_OFF);
-		qos_ctrl |= SSPP_QOS_CTRL_VBLANK_EN;
-	}
-
 	if (cfg->danger_safe_en)
 		qos_ctrl |= SSPP_QOS_CTRL_DANGER_SAFE_EN;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 86bf4b2cda77..aaf6f41d546c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -165,15 +165,9 @@ struct dpu_sw_pipe_cfg {
 
 /**
  * struct dpu_hw_pipe_qos_cfg : Source pipe QoS configuration
- * @creq_vblank: creq value generated to vbif during vertical blanking
- * @danger_vblank: danger value generated during vertical blanking
- * @vblank_en: enable creq_vblank and danger_vblank during vblank
  * @danger_safe_en: enable danger safe generation
  */
 struct dpu_hw_pipe_qos_cfg {
-	u32 creq_vblank;
-	u32 danger_vblank;
-	bool vblank_en;
 	bool danger_safe_en;
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 3cb891917b65..0ed350776775 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -73,12 +73,9 @@ static const uint32_t qcom_compressed_supported_formats[] = {
 /**
  * enum dpu_plane_qos - Different qos configurations for each pipe
  *
- * @DPU_PLANE_QOS_VBLANK_AMORTIZE: Enables Amortization within pipe.
- *	this configuration is mutually exclusive from VBLANK_CTRL.
  * @DPU_PLANE_QOS_PANIC_CTRL: Setup panic for the pipe.
  */
 enum dpu_plane_qos {
-	DPU_PLANE_QOS_VBLANK_AMORTIZE = BIT(1),
 	DPU_PLANE_QOS_PANIC_CTRL = BIT(2),
 };
 
@@ -359,25 +356,15 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
 
 	memset(&pipe_qos_cfg, 0, sizeof(pipe_qos_cfg));
 
-	if (flags & DPU_PLANE_QOS_VBLANK_AMORTIZE) {
-		pipe_qos_cfg.vblank_en = false;
-		pipe_qos_cfg.creq_vblank = 0; /* clear vblank bits */
-	}
-
 	if (flags & DPU_PLANE_QOS_PANIC_CTRL)
 		pipe_qos_cfg.danger_safe_en = enable;
 
-	if (!pdpu->is_rt_pipe) {
-		pipe_qos_cfg.vblank_en = false;
+	if (!pdpu->is_rt_pipe)
 		pipe_qos_cfg.danger_safe_en = false;
-	}
 
-	DPU_DEBUG_PLANE(pdpu, "pnum:%d ds:%d vb:%d pri[0x%x, 0x%x] is_rt:%d\n",
+	DPU_DEBUG_PLANE(pdpu, "pnum:%d ds:%d is_rt:%d\n",
 		pdpu->pipe - SSPP_VIG0,
 		pipe_qos_cfg.danger_safe_en,
-		pipe_qos_cfg.vblank_en,
-		pipe_qos_cfg.creq_vblank,
-		pipe_qos_cfg.danger_vblank,
 		pdpu->is_rt_pipe);
 
 	pipe->sspp->ops.setup_qos_ctrl(pipe->sspp,
-- 
2.39.2

