Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E82752217B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jul 2020 00:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727873AbgGOWTY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jul 2020 18:19:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726356AbgGOWTY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jul 2020 18:19:24 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E103C061755;
        Wed, 15 Jul 2020 15:19:24 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id z5so3796253pgb.6;
        Wed, 15 Jul 2020 15:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qxMjYphEfEAV7tSz+LCOdD9vQZvr3WacRlabwazm568=;
        b=tUbTUWR3dxj56+YyBKIZgJW/7OA2iUxxr4thXULbGaCVs/FCj2qxgmftDdCgQcDfAj
         P5pg8iyiIjQnURraFdk4xxB9TYVuanQxxhvUUAqFJKFeXquE3grQoz4CcppAAy4p5B5E
         R+/cmzvRIj8wFAXTYPyl3DfbeeARc8bZzK9LkaPYajrSDztZTrdukZcz/XpD4YeBH+Se
         vYEXBRqGTZ/F2Fuv9aMgg/pO+40ZN4ejTFs7IzCFduxAh5ykbHu13lc1dBt0YzCg57dZ
         p4UV4ANTI/ixautCIS60xQkouahgl9VBwr1QkJCepyM0WYVBoR1dvQklHkzhUAmNDkU/
         NR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qxMjYphEfEAV7tSz+LCOdD9vQZvr3WacRlabwazm568=;
        b=YZb+rvD5V7SzJf1LZFWdbZWEJi6JLMQxK5t5ezXfE7Vglly6G41pEGj1weFeYApLnx
         p4pSW8Iup+jQLQt7q18CmLulia45ST6KncXzzMgLkA5gKQmPGzqojj+9QYsxjLBfDauT
         ebbE74tmGSBeE5r/FVQ4b7/F1Utq/xZ2HJkemKYL23dx8ZITHzJb5TcDmYP6yd1yCEBg
         33rRvqU9g4hbR8vilw9srnPboue+BkR3rZLU6c4WmPxC1V2IU3Q2UUtDDadhRQ9+fqtv
         +535tVmr2tNNwzDQHg+zjKbCnd18bcTiRnXBcWqow/kzNnVTHxPVuiS7bq3biUvSNOLc
         xivw==
X-Gm-Message-State: AOAM533gUwNBSVM95bG9jyXYgDcicZr5wj/6b1ww2oiL4Aaej5iYG1El
        6copP2FrtbWxbtaBOB8vArQ=
X-Google-Smtp-Source: ABdhPJztQ4b1Z0Z4rUFJQFEEF4msB+mPG53K5SjClbyNecECZ4BF9AnbVoPPw+8lwtj9Zq1DN6QehQ==
X-Received: by 2002:a63:135b:: with SMTP id 27mr1656329pgt.37.1594851563677;
        Wed, 15 Jul 2020 15:19:23 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id p9sm1445997pgc.77.2020.07.15.15.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 15:19:22 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Steev Klimaszewski <steev@gentoo.org>,
        Doug Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Drew Davenport <ddavenport@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Zheng Bin <zhengbin13@huawei.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/dpu: fix/enable 6bpc dither with split-lm
Date:   Wed, 15 Jul 2020 15:19:51 -0700
Message-Id: <20200715221955.3209856-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

If split-lm is used (for ex, on sdm845), we can have multiple ping-
pongs, but only a single phys encoder.  We need to configure dithering
on each of them.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 22 ++++++++++---------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   |  3 +--
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 46df0ff75b85..9b98b63c77fb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -212,14 +212,14 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
 	15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
 };
 
-static void _dpu_encoder_setup_dither(struct dpu_encoder_phys *phys)
+static void _dpu_encoder_setup_dither(struct dpu_hw_pingpong *hw_pp, unsigned bpc)
 {
 	struct dpu_hw_dither_cfg dither_cfg = { 0 };
 
-	if (!phys->hw_pp || !phys->hw_pp->ops.setup_dither)
+	if (!hw_pp->ops.setup_dither)
 		return;
 
-	switch (phys->connector->display_info.bpc) {
+	switch (bpc) {
 	case 6:
 		dither_cfg.c0_bitdepth = 6;
 		dither_cfg.c1_bitdepth = 6;
@@ -228,14 +228,14 @@ static void _dpu_encoder_setup_dither(struct dpu_encoder_phys *phys)
 		dither_cfg.temporal_en = 0;
 		break;
 	default:
-		phys->hw_pp->ops.setup_dither(phys->hw_pp, NULL);
+		hw_pp->ops.setup_dither(hw_pp, NULL);
 		return;
 	}
 
 	memcpy(&dither_cfg.matrix, dither_matrix,
 			sizeof(u32) * DITHER_MATRIX_SZ);
 
-	phys->hw_pp->ops.setup_dither(phys->hw_pp, &dither_cfg);
+	hw_pp->ops.setup_dither(hw_pp, &dither_cfg);
 }
 
 void dpu_encoder_helper_report_irq_timeout(struct dpu_encoder_phys *phys_enc,
@@ -1132,11 +1132,13 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
 
 	_dpu_encoder_update_vsync_source(dpu_enc, &dpu_enc->disp_info);
 
-	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
-		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-			struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
-
-			_dpu_encoder_setup_dither(phys);
+	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI &&
+			!WARN_ON(dpu_enc->num_phys_encs == 0)) {
+		unsigned bpc = dpu_enc->phys_encs[0]->connector->display_info.bpc;
+		for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+			if (!dpu_enc->hw_pp[i])
+				continue;
+			_dpu_encoder_setup_dither(dpu_enc->hw_pp[i], bpc);
 		}
 	}
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index 7411ab6bf6af..bea4ab5c58c5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -231,8 +231,7 @@ static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
 	c->ops.poll_timeout_wr_ptr = dpu_hw_pp_poll_timeout_wr_ptr;
 	c->ops.get_line_count = dpu_hw_pp_get_line_count;
 
-	if (test_bit(DPU_PINGPONG_DITHER, &features) &&
-		IS_SC7180_TARGET(c->hw.hwversion))
+	if (test_bit(DPU_PINGPONG_DITHER, &features))
 		c->ops.setup_dither = dpu_hw_pp_setup_dither;
 };
 
-- 
2.26.2

