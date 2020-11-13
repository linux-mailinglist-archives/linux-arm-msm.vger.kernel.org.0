Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 592B02B1C76
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Nov 2020 14:52:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbgKMNus (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Nov 2020 08:50:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727140AbgKMNuk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Nov 2020 08:50:40 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F94AC061A52
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2020 05:50:31 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id h62so8560592wme.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2020 05:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LO+KljdrZZIZgFM888ZdvLp3rO45dugwj559GBfLspM=;
        b=gqhHrO4P9lvKa+HYQ2fMKuZWltdhYShxnRKjubXa4pkeYjg6cm0oYSWN04KBydRfbj
         5xZ2YI2/94LH+so2pECsqPoAcf+BR0o7q43/+FlzcklUKJz4L9lDXIMlRRod1epVC3oV
         M8sG4qUPHxAFYEeHMAceOCyy4X+p8SK40cki8jMMniU96jJDDPv3BQGrUuQ6lpki01P0
         FeYhR5/pNrfWIP5hY1B6nw9AeOI26/lWpJjBtVY5ZzDRCzfvDUbi16rFLVkUWShmCTUS
         EL6TMMFwk6DF7ZA6bIHs2zELCkw3vkNrhACOk/HAebHOltutlyByE5t2GOXWI6K1HNH/
         PagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LO+KljdrZZIZgFM888ZdvLp3rO45dugwj559GBfLspM=;
        b=tMB4wv8AGqy3PjsLukcb5FFHIu8hrnIPdfp36wL4K+L688jk1LT+NnYZ2cLvWnO2V3
         Fq9qxKhiJsaOYPVjYjsATzHePz4s8bi93YXS1gmyW46n1UIkehAbBbT1sP+7MJvuhTrt
         ONxMRO1A0znBRT63Y1cnQoP0DRm8O+DyFDm0mQ9ZE4xTE9fvTooTQDe9NyITOCvhuurE
         Y9QPilrzSS/F6QcmSrpZglwWp8Xw1HY/OfI31PBw9dWotgrkh/YrN7oZ1aaQxAlAc3Vl
         kT2X1lNnqlT17R5GywI7V2FD/SaXEsow1KPRITQw4dN8vnZuvWJA6hVwJxyT5dTyqCQW
         jDsg==
X-Gm-Message-State: AOAM531aNHmr6UXTClETjN5vyzjUZlAlnAqomazmH0ozWa/XMQo1XoH+
        YrgarSvS6jd20cup34zJYObf4A==
X-Google-Smtp-Source: ABdhPJzGn+znnntIyqVcelqBOU+yTpNFBD1sJ9JIuB54Ysv0RKYRALX0IbDg2r4GGu5Q0ois64zBDw==
X-Received: by 2002:a1c:f31a:: with SMTP id q26mr2637187wmq.178.1605275430282;
        Fri, 13 Nov 2020 05:50:30 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 05:50:29 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 39/40] drm/msm/disp/dpu1/dpu_encoder: Remove a bunch of unused variables
Date:   Fri, 13 Nov 2020 13:49:37 +0000
Message-Id: <20201113134938.4004947-40-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c: In function ‘dpu_encoder_virt_mode_set’:
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:981:31: warning: variable ‘num_dspp’ set but not used [-Wunused-but-set-variable]
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:976:30: warning: variable ‘topology’ set but not used [-Wunused-but-set-variable]
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c: In function ‘_dpu_encoder_virt_enable_helper’:
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1099:26: warning: variable ‘priv’ set but not used [-Wunused-but-set-variable]
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c: In function ‘dpu_encoder_virt_disable’:
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1210:18: warning: variable ‘dpu_kms’ set but not used [-Wunused-but-set-variable]

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index f7f5c258b5537..289bfb6f1861c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -973,12 +973,11 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 	struct drm_crtc *drm_crtc;
 	struct dpu_crtc_state *cstate;
 	struct dpu_global_state *global_state;
-	struct msm_display_topology topology;
 	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
-	int num_lm, num_ctl, num_pp, num_dspp;
+	int num_lm, num_ctl, num_pp;
 	int i, j;
 
 	if (!drm_enc) {
@@ -1020,8 +1019,6 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 		if (drm_crtc->state->encoder_mask & drm_encoder_mask(drm_enc))
 			break;
 
-	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode);
-
 	/* Query resource that have been reserved in atomic check step. */
 	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
 		drm_enc->base.id, DPU_HW_BLK_PINGPONG, hw_pp,
@@ -1030,7 +1027,7 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 		drm_enc->base.id, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
 	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
 		drm_enc->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
-	num_dspp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+	dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
 		drm_enc->base.id, DPU_HW_BLK_DSPP, hw_dspp,
 		ARRAY_SIZE(hw_dspp));
 
@@ -1096,7 +1093,6 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc = NULL;
-	struct msm_drm_private *priv;
 	int i;
 
 	if (!drm_enc || !drm_enc->dev) {
@@ -1104,8 +1100,6 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
 		return;
 	}
 
-	priv = drm_enc->dev->dev_private;
-
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 	if (!dpu_enc || !dpu_enc->cur_master) {
 		DPU_ERROR("invalid dpu encoder/master\n");
@@ -1207,7 +1201,6 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc = NULL;
 	struct msm_drm_private *priv;
-	struct dpu_kms *dpu_kms;
 	int i = 0;
 
 	if (!drm_enc) {
@@ -1225,7 +1218,6 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 	dpu_enc->enabled = false;
 
 	priv = drm_enc->dev->dev_private;
-	dpu_kms = to_dpu_kms(priv->kms);
 
 	trace_dpu_enc_disable(DRMID(drm_enc));
 
-- 
2.25.1

