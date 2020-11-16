Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4419C2B4E10
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Nov 2020 18:49:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387767AbgKPRlx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 12:41:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387759AbgKPRlv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 12:41:51 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0D3DC0613D3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2020 09:41:50 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id l1so19645885wrb.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2020 09:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W1MHY4aaGFabv01eWFz4IHQEmJmgXDktxmU/mwniRQM=;
        b=mpqKiv0z8EhJ1hkWKiD4s3yFbia9Nq2ccdMY5wK4NY+1NhTHbISUM0ZH3ZCHS26yIY
         6O92czvRbWnbgPQe9WAFU9K/ifLShQgqoCdc7wLL0GhgXqzaJijOqVfYbvzNe6LIIrEV
         npClTG9jo/n4w5RaShICj+fD7GkqO5I7mu+U0V9gizrF3eBSNbo4+XqLYYmIaqdgUX9Q
         XQhvG0ntpPs8mW8I2RcJcfkUebZtEbvrmRX8nwIuOSrjkDv5t30hRk4VdnTEpzExNK9u
         h7JAg3+m/h/EUMPZYwgmbeUUW31PgTukkL+KomU9Y91HNvhWS1dYAqQp0E8FWX/P9HJ7
         1nQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W1MHY4aaGFabv01eWFz4IHQEmJmgXDktxmU/mwniRQM=;
        b=Wd7OxwwVUtmbQl7LCFRHDzENCZ45jojxqkaZQ3J/AjFBJzAhmxsFO96sxK9F6GN8Bx
         duXNJ0P+1LRcuFMAMWNEEolM8RZXzsTC+7FrT5Vn5NnZ5KLq0l2yO9psE1Vg8KYorXi5
         0CUG9icMXhTc8UT2Q8vYkSVBykS36ri4uW3b7HpOdb307y0A/DEnQHp0Mx2GZvsc+LQR
         i+RrYKlzveKBgivLrFNped83L2G28lU7C9BvOzAPUZzvDlNvVQTpbXrNen6YS8Upvpn3
         M+/UihWzdXyJ3hmnpMILbx28zOmw4+slETVlTREbeEIzlJ0uCP5NzItE/Vuh2BrYfKfA
         AnWQ==
X-Gm-Message-State: AOAM53171dvD9vFS2vxOJV3BDRviyP7r2I54f4ZR/c2ALePPL0/tolMt
        QpHV8Ef0gu8OwU9AiwTHooq8Dg==
X-Google-Smtp-Source: ABdhPJwZ0jSj+/r94Ojpe6Rg7ZSUOee9IJj4lYLdYAt/Xz4U6G4d3Gz4HVMuhx4NAwzNQfjCx3+8NA==
X-Received: by 2002:adf:dc4b:: with SMTP id m11mr19844677wrj.328.1605548509721;
        Mon, 16 Nov 2020 09:41:49 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 09:41:49 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 20/42] drm/msm/disp/dpu1/dpu_encoder: Remove a bunch of unused variables
Date:   Mon, 16 Nov 2020 17:40:50 +0000
Message-Id: <20201116174112.1833368-21-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
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
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
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

