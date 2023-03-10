Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBC286B330F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Mar 2023 01:57:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbjCJA5b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 19:57:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbjCJA50 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 19:57:26 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ED8D116C25
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 16:57:15 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id s20so4596786lfb.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 16:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678409833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFgAXnkO9HoVCfEVaNPBdaBqkA0/oPvI0GCIR4oV0Vk=;
        b=bALT0ey/QjHIR1s0JWGTnoNCs+RiGXd2gpwyLrOukLf0LLKx1GRmch8HVIUYssl/vl
         2e9pAwnTmvOoPp+eoTyuVgBYBjVvVXg5IGnhbjO4RKmS416fWZvzK02CQEZyaffDZMHy
         bmGVK056iSnODE/rL+yxYHzTOpOUiJJCQhhzvO49TiPcP5TcLXgX3j1UfsyiK3yvM8uL
         XkXcL2p6kJD3Zx+OBrD8TnUiGgHXHvCW7wmcOfm5Cn+/2FWZIBnjr7gFaIqqThslhz1f
         Zmns4ca1/IT+87f5PqgIT3gl0u0tCu5DiaZanrY7vh1XenHEh9JQ1EQdO2X7zPoScMte
         H4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678409833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sFgAXnkO9HoVCfEVaNPBdaBqkA0/oPvI0GCIR4oV0Vk=;
        b=Bwx29U8F4S0TgH9rh3KfhsWG9HjHEBbpNt3wd57K1KLBltG1YWlObKJUe/kuXOobwN
         b+RKsE2tIx1B2v97T8Aw0tASXk6hCe6vhBE4PYzcvad8POMLTbGFcSvx8P/7mhmcFHLh
         Et5VwmZKfV2cIru5K9l7JiIzEPPO6dPl5p3pq+NDw3wQeaRw51ekh8akUDq4eLDlx7Ti
         k3dlWg0aD+qjhrH+tvcHbLHnYZa3mZt0xdoL+zTCFOiVAbvcPspOkJy4ZyfGv53J44MF
         RbB1kqqeX/BrIntCw3O1qEVbL3UXbCmlJr3duZ9ie89OcVtKOEkFCTKf3FamfFws6ppj
         8p3Q==
X-Gm-Message-State: AO0yUKXINNSnI1C3FITd8hmUEu7JzTUIyXiq1NJogK3O5xjXhZHCGLrt
        wYR7+PscdmL4FR98EB2zJ1J/ew==
X-Google-Smtp-Source: AK7set9ZGayts/xNhmrwjEnSQxQeotIhxeZmXQaVCu77M1GF4m/ZEhlf6eQVdqnEBBUwdisyUote2w==
X-Received: by 2002:ac2:5312:0:b0:4db:3877:817a with SMTP id c18-20020ac25312000000b004db3877817amr7246222lfh.28.1678409833653;
        Thu, 09 Mar 2023 16:57:13 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id m13-20020ac2428d000000b004d8540b947asm75280lfh.56.2023.03.09.16.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 16:57:13 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v5 09/32] drm/msm/dpu: pass dpu_format to _dpu_hw_sspp_setup_scaler3()
Date:   Fri, 10 Mar 2023 02:56:41 +0200
Message-Id: <20230310005704.1332368-10-dmitry.baryshkov@linaro.org>
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

There is no need to pass full dpu_hw_sspp_cfg instance to
_dpu_hw_sspp_setup_scaler3, pass just struct dpu_format pointer.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 9 ++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 9 ++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 4 ++--
 3 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index a1492a7e43ce..3030cd3b253a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -419,19 +419,18 @@ static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
 }
 
 static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
-		struct dpu_hw_sspp_cfg *sspp,
-		void *scaler_cfg)
+		struct dpu_hw_scaler3_cfg *scaler3_cfg,
+		const struct dpu_format *format)
 {
 	u32 idx;
-	struct dpu_hw_scaler3_cfg *scaler3_cfg = scaler_cfg;
 
-	if (_sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED3, &idx) || !sspp
+	if (_sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED3, &idx)
 		|| !scaler3_cfg)
 		return;
 
 	dpu_hw_setup_scaler3(&ctx->hw, scaler3_cfg, idx,
 			ctx->cap->sblk->scaler_blk.version,
-			sspp->layout.format);
+			format);
 }
 
 static u32 _dpu_hw_sspp_get_scaler3_ver(struct dpu_hw_sspp *ctx)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 5903413256ea..136b8713943f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -317,13 +317,12 @@ struct dpu_hw_sspp_ops {
 
 	/**
 	 * setup_scaler - setup scaler
-	 * @ctx: Pointer to pipe context
-	 * @pipe_cfg: Pointer to pipe configuration
-	 * @scaler_cfg: Pointer to scaler configuration
+	 * @scaler3_cfg: Pointer to scaler configuration
+	 * @format: pixel format parameters
 	 */
 	void (*setup_scaler)(struct dpu_hw_sspp *ctx,
-		struct dpu_hw_sspp_cfg *pipe_cfg,
-		void *scaler_cfg);
+		struct dpu_hw_scaler3_cfg *scaler3_cfg,
+		const struct dpu_format *format);
 
 	/**
 	 * get_scaler_ver - get scaler h/w version
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 6ec39f937042..8c98385303ea 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -677,8 +677,8 @@ static void _dpu_plane_setup_scaler(struct dpu_sw_pipe *pipe,
 	if (pipe_hw->ops.setup_scaler &&
 			pipe->multirect_index != DPU_SSPP_RECT_1)
 		pipe_hw->ops.setup_scaler(pipe_hw,
-				pipe_cfg,
-				&scaler3_cfg);
+				&scaler3_cfg,
+				fmt);
 }
 
 /**
-- 
2.39.2

