Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E4764AF82D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Feb 2022 18:26:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238164AbiBIRZg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Feb 2022 12:25:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238173AbiBIRZf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Feb 2022 12:25:35 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7F9CC05CB86
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Feb 2022 09:25:35 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id 13so5539383lfp.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Feb 2022 09:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dEJPfPx0nYAq+fkrBMQ8Y9lHlDnWeG3gMpqCP1BAOBY=;
        b=SuLKaj6Bw1efVxvbR7EBnT6VDupFpsmXnt7irI0/AFj7KorqK4P+qXyaQf/R9hPJ6s
         uIm926kW60swva4kr9H3klMQpEbyWmzlssWyfATZYe92L93YDYcm2fOvallJL5CqV3XB
         W1nkhTaIBnaw/JRhHAMG+ByZy/JvaQd9PC7EraBr3LcDD3I+HfbSpGOicsvh86k85YNd
         wRY/ksW+GH7kqzqhZ1yShE64FzDpyM5oTk/PNgXLzwbkxS4WG6+g1y0phEoQkbtOXYvp
         CtDwzQVCCT638tZJbWLSeXg5bcKmWGZLAhmGlo++6UjFuXgv6sN8fNkH/zq9c3aPlqTf
         HExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dEJPfPx0nYAq+fkrBMQ8Y9lHlDnWeG3gMpqCP1BAOBY=;
        b=PAaxdLVPVpfh4US42ScFF/uts6sUuVRaYssADSGWlIFA84+PZYBHDKa0fUVXv7WapF
         dDGpofV6mz3LJXpOpNE1GyQ6+mvOGH4va2cOvMvQ44yyjHweU4JDVuioeG1ctbQEYLD4
         tLivLyZC9kR64LD/axu3nk64f9LhhATuKGOWzijyMqlnrajHMOf2pac6xmhm6JxtHDy6
         6VNUUk+a90TcSxOc+4L4WXCuKVdzNJQVTEfpwqFRySVzv09RiSBjfq5z5aAe7sWiJM3E
         ldAcTqxWUExd/1QdjKBgVwrDVfWxjrKwNs+fzvE1Gg23BVcdUWxj7wsBu8itpSOJqPLd
         MLeA==
X-Gm-Message-State: AOAM533hJ50fzhtscQKUpKKtMRTA9Izg9XCyGHPpEFCFMGbUTQ9jlgiQ
        iJ/kLvSFVMxLj9vzpYT5s3s3uw==
X-Google-Smtp-Source: ABdhPJzklp3OMmnXSVsNAdGMPJUqnRf1QM921ImCr8NYuUOHdUKPC2BBlYKLgcuLIcLvFpWMPyssiQ==
X-Received: by 2002:a05:6512:3d8a:: with SMTP id k10mr2246953lfv.141.1644427534236;
        Wed, 09 Feb 2022 09:25:34 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 09:25:33 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 13/25] drm/msm/dpu: pass dpu_format to _dpu_hw_sspp_setup_scaler3()
Date:   Wed,  9 Feb 2022 20:25:08 +0300
Message-Id: <20220209172520.3719906-14-dmitry.baryshkov@linaro.org>
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

There is no need to pass full dpu_hw_pipe_cfg instance to
_dpu_hw_sspp_setup_scaler3, pass just struct dpu_format pointer.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 9 ++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 7 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 4 ++--
 3 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index d8120168f974..7194c14f87bc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -415,19 +415,18 @@ static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_pipe *ctx,
 }
 
 static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_pipe *ctx,
-		struct dpu_hw_pipe_cfg *sspp,
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
 
 static u32 _dpu_hw_sspp_get_scaler3_ver(struct dpu_hw_pipe *ctx)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 74171fb4e585..eee8501ea80d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -334,13 +334,12 @@ struct dpu_hw_sspp_ops {
 
 	/**
 	 * setup_scaler - setup scaler
-	 * @ctx: Pointer to pipe context
-	 * @pipe_cfg: Pointer to pipe configuration
 	 * @scaler_cfg: Pointer to scaler configuration
+	 * @format: pixel format parameters
 	 */
 	void (*setup_scaler)(struct dpu_hw_pipe *ctx,
-		struct dpu_hw_pipe_cfg *pipe_cfg,
-		void *scaler_cfg);
+		struct dpu_hw_scaler3_cfg *scaler3_cfg,
+		const struct dpu_format *format);
 
 	/**
 	 * get_scaler_ver - get scaler h/w version
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 3ce7dcc285e2..e9421fa2fb2e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -646,8 +646,8 @@ static void _dpu_plane_setup_scaler(struct dpu_sw_pipe *pipe,
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
2.34.1

