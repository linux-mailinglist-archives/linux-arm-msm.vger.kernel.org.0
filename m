Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD179465982
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Dec 2021 23:51:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353712AbhLAWzK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Dec 2021 17:55:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353713AbhLAWzK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Dec 2021 17:55:10 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A68A4C061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Dec 2021 14:51:48 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id r26so66793117lfn.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Dec 2021 14:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GvsWfL7mbOVefyoKeCj6Q5Bk0eV0IEAIU/XkuhNVYgo=;
        b=o2KluvlhXKOWt4Xt6mrtsYmjh0cHuQobULvXY8yR8HgIZQZUCdXW+fDuoTdlXP7X34
         xfSUNrxKE6hAF5wDd5wUbrtHrSya3p6gPazNYn7IuAGnd3g2fpBRHdJitVIWBXx9Pt7B
         kw/Mj+RpOaNUvGlID3rCNmn2+GJrpVgqv3U53MzQjfMWbtcAXBgcm2N9rqgBntMgSpI2
         PU8uoT4rhCobjeMKCgppx/xCrb+iTQm0yzfcCJ9zTLVpD/VvcQpZ4JKcPaWvTG4D/0tU
         hAvQqEIGzcKZ4sdn6qsNUmZCTa2Xnm7WwPPnkxMlrxIQxdLlI7bNHlSaLx9Tdv84/aKC
         /JjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GvsWfL7mbOVefyoKeCj6Q5Bk0eV0IEAIU/XkuhNVYgo=;
        b=MbBB3BuWvdY7s+/65lahyZb9Rj3P8mcU831+BpEfQis+hXLG9038+72RgMJ8m9ZtZJ
         DIUouop0UgjyqqW55sSWU2NcrFZ4Wx+N68cdHRRVCcC56L5sFVaZrT/x/EaWO4gUue7V
         FOpe0r8opy4wYe5ziqwSacSW6UBliKkHxLqqQ5R09QyXpEXMo1pkd7IV67HPJpFDGDvB
         FhPA/Mx42gdqtFSN59lE+Kz6aSdsEAw1z3yrcUk/c9iiRsfKIiSW3h+R6Is2CntN7gxU
         FeWjxD3oUtVyl5nA1p2EdOOCVgJhNgkKMgqa4QuzogjATIVStn5BDGDXQz/YP/4PncWE
         eM9Q==
X-Gm-Message-State: AOAM531+fWBNNuw67U/Wz6mZoulABCwKOY2QWQpY0q560tXx1nRoj+WW
        7K6vhi6S+6X8F6k4EOuair6ZEg==
X-Google-Smtp-Source: ABdhPJxKw4DW8KW9BUo+9cv0KwE3fv/w5lZ6sNOTwpDZaYGC1eWUr4PYL3bqqVhNkx+NHZFu0973eg==
X-Received: by 2002:a05:6512:150c:: with SMTP id bq12mr8569303lfb.687.1638399106986;
        Wed, 01 Dec 2021 14:51:46 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u7sm124819ljh.49.2021.12.01.14.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 14:51:46 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/4] drm/msm/dpu: drop pe argument from _dpu_hw_sspp_setup_scaler3
Date:   Thu,  2 Dec 2021 01:51:38 +0300
Message-Id: <20211201225140.2481577-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211201225140.2481577-1-dmitry.baryshkov@linaro.org>
References: <20211201225140.2481577-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The _dpu_hw_sspp_setup_scaler3 (hw_sspp->setup_scaler) does not use pe
argument. Let's remove it while we are cleaning scaled configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 2 +-
 3 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index d77eb7da5daf..7235605bfc9e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -413,13 +413,11 @@ static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_pipe *ctx,
 
 static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_pipe *ctx,
 		struct dpu_hw_pipe_cfg *sspp,
-		struct dpu_hw_pixel_ext *pe,
 		void *scaler_cfg)
 {
 	u32 idx;
 	struct dpu_hw_scaler3_cfg *scaler3_cfg = scaler_cfg;
 
-	(void)pe;
 	if (_sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED3, &idx) || !sspp
 		|| !scaler3_cfg)
 		return;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index e8939d7387cb..ad2002d75739 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -334,12 +334,10 @@ struct dpu_hw_sspp_ops {
 	 * setup_scaler - setup scaler
 	 * @ctx: Pointer to pipe context
 	 * @pipe_cfg: Pointer to pipe configuration
-	 * @pe_cfg: Pointer to pixel extension configuration
 	 * @scaler_cfg: Pointer to scaler configuration
 	 */
 	void (*setup_scaler)(struct dpu_hw_pipe *ctx,
 		struct dpu_hw_pipe_cfg *pipe_cfg,
-		struct dpu_hw_pixel_ext *pe_cfg,
 		void *scaler_cfg);
 
 	/**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 4c373abbe89c..c7b065b14c5c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -688,7 +688,7 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
 	if (pdpu->pipe_hw->ops.setup_scaler &&
 			pstate->multirect_index != DPU_SSPP_RECT_1)
 		pdpu->pipe_hw->ops.setup_scaler(pdpu->pipe_hw,
-				pipe_cfg, &pixel_ext,
+				pipe_cfg,
 				&scaler3_cfg);
 }
 
-- 
2.33.0

