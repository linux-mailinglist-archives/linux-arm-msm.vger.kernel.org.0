Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F3FE6B99CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 16:37:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231823AbjCNPhg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 11:37:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230211AbjCNPhS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 11:37:18 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A76E1B3280
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 08:36:12 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id a32so16435848ljr.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 08:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678808153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33Uz6ukfxujAHIUon1961ksLYKkDkn39ZsTBVLn6xD4=;
        b=ypMGKG8O4W5Zk1TkHFvu4VHl+Z9ZKLNw0BzVYtj+ROCFFygVof6CiUKfogPdRnrfUN
         k6GH/hpUwYJbI7ijcJvosXOgpCNLSzXQtc+x+S4GPu2tun72DgpmjJarPvfbpiFs65Ur
         LGph5nos4nxt2pSYlWGEgeQK0udu6tUgpdK/jY6X7vY23rkR+UggsGwL/VncPZowXT+H
         ZGqt1Cds1TwVg7uD3dZ+gqgNz6R+jsy6uz+Vjba09IRpODOIGa73EHog+89msWfD1/sP
         F94vDOOOzVlbqMD+YEyLWy+5FVH/MptBPOx8ZGKK58M1Ly/9G7w2CU7sl8bI9PVwvIEf
         BjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678808153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=33Uz6ukfxujAHIUon1961ksLYKkDkn39ZsTBVLn6xD4=;
        b=JtARYmzbhiebgl/eSLVY6/guiDPIBx1sDeioNBnHkYQTJbJ/pvcx07bsmRwAT7IoA+
         2ewNTKEsPVYUkE4cx4OqAzeDOmWFnBZh+hvRpFtHwkH1wwY10G2s5vUL7bUh5JqHdxMF
         ECj//UcCzhMpv9jcXRrIMqD6WgBkB7/s/E2Y+FTLuLaFrrjzhgGru73mt4hlv9fH7uRJ
         3fpj8O+EwTwjgHWCPU1/kYa8JnAeH+6uXctGGpplpkAb6P/dI5a0W11EQ1HuryFK1JOx
         KjMbI72ikjIoqfSPINqRy+y+GpAAiwS+gCXIj/Bt3pm+UTzdBAZ84SR2iL7ZTbogM/Hj
         T8yw==
X-Gm-Message-State: AO0yUKVcdwEXmmNTe89u21zrwAdss6ZC2nIulmpCMXy6i/ryFEP1gBkr
        R0/AjFA27sC8PvkchZn0qOqXlw==
X-Google-Smtp-Source: AK7set/CM5wQjLbHzpnit4hIGklA1lsVoLw8qhpQD/iKJGSotby3KVIURZPcIUfHleHywiHXPlQh+A==
X-Received: by 2002:a2e:92cd:0:b0:295:b0a8:951f with SMTP id k13-20020a2e92cd000000b00295b0a8951fmr11670584ljh.27.1678808152855;
        Tue, 14 Mar 2023 08:35:52 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z8-20020a2eb528000000b0029573844d03sm470854ljm.109.2023.03.14.08.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 08:35:52 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v6 09/32] drm/msm/dpu: pass dpu_format to _dpu_hw_sspp_setup_scaler3()
Date:   Tue, 14 Mar 2023 18:35:22 +0300
Message-Id: <20230314153545.3442879-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
References: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
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
2.30.2

