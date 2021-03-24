Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABB44347B7B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 16:01:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236417AbhCXPA6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 11:00:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236381AbhCXPAo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 11:00:44 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51E83C061763
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:00:44 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id m12so32435874lfq.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zOtkoDiOO2j7crcK/NDW0zJrKE6imOch+G2dYhHVZU4=;
        b=rXGFoie/9yS3qzs+rJXWTT05Cj9L593a8CPJ8P7JADitduceizCaquXGeJ2dT2THGG
         l7ptbGmn9xeu5hmaAEvpiQO9qT+FwE/ECaqg3OIbG41DiXySO6h8W9f7aEUI27jVjJPu
         1ukn0MVHTlA39wHdC5r1iZPoOZ7gH06iUJRmBpBo9FqpvcudlfkwSNG3b2s+dNavzusX
         C58AlG06fKU95nLI0ivQwVshnxAxnyUoMg0h6dB+iDj43ZfRK5U3yrpxu5YV0bD5DoFO
         IExmy9X44z2IW5JhIHpUkXvTVU5ctQYX5CByMy7TzeNohgYjszcY+BuUS5LCblS1gocg
         T9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zOtkoDiOO2j7crcK/NDW0zJrKE6imOch+G2dYhHVZU4=;
        b=kspbtJPIDf8s7NkrxElzI80U6ERua6aNFcZGM5ReGm9LWKg6Ky02sBJuPXWwaKQ0OP
         /mCJIc9rirF0J27czPjRVzGxnEbz6DktoQVft8GbWm1Ytm9zK4Zp9Ge6NgDSdmfSr1ML
         FZ/3H9hWt+GmgpM0RTRbonhOcKt0HMWnktrMnQUO+jG/02FQ5EwMxvcndmSsSEztksnH
         50boKzj1JROSkLdDCKekQAgHHDKksd3m/Iy+L9frA0IK8LLSzTKbZPJwubK5AoKFm/FS
         5F5T5XZYzVAYFNN3+0/Pbj7nPlan0MKqXU6/SIjA2TmEFwumX9fg/SXamxzE8fVoJ92s
         f5KQ==
X-Gm-Message-State: AOAM533xTdqkSAmykAZtCfQxvmFiYTCqeoEhPZ+LZSSJLNc0SD35N15y
        ThP8yUpqHihzmVqk62IN2y3Ggw==
X-Google-Smtp-Source: ABdhPJwfDblbnU+Z1/65/qUpz0vpTBhQEknwMYuUiS0xokuJL1eIt7NEi2fvByDJR8ileYBvUKnNKg==
X-Received: by 2002:a19:353:: with SMTP id 80mr2095095lfd.97.1616598042791;
        Wed, 24 Mar 2021 08:00:42 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p5sm252463lfe.154.2021.03.24.08.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:00:42 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 10/21] drm/msm/dpu: drop dpu_hw_lm_setup_blend_config()
Date:   Wed, 24 Mar 2021 18:00:13 +0300
Message-Id: <20210324150024.2768215-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
References: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DPU1 driver supports only hardware with the version of 4.0 and higher
(>= sdm845), so drop the dpu_hw_lm_setup_blend_config() used by previous
hardware generations.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 26 +----------------------
 1 file changed, 1 insertion(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index fd09b9ab9b4b..7d5b620f7f42 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -23,9 +23,6 @@
 #define LM_FG_COLOR_FILL_SIZE            0x10
 #define LM_FG_COLOR_FILL_XY              0x14
 
-#define LM_BLEND0_FG_ALPHA               0x04
-#define LM_BLEND0_BG_ALPHA               0x08
-
 static const struct dpu_lm_cfg *_lm_offset(enum dpu_lm mixer,
 		const struct dpu_mdss_cfg *m,
 		void __iomem *addr,
@@ -117,24 +114,6 @@ static void dpu_hw_lm_setup_blend_config_sdm845(struct dpu_hw_mixer *ctx,
 	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
 }
 
-static void dpu_hw_lm_setup_blend_config(struct dpu_hw_mixer *ctx,
-	u32 stage, u32 fg_alpha, u32 bg_alpha, u32 blend_op)
-{
-	struct dpu_hw_blk_reg_map *c = &ctx->hw;
-	int stage_off;
-
-	if (stage == DPU_STAGE_BASE)
-		return;
-
-	stage_off = _stage_offset(ctx, stage);
-	if (WARN_ON(stage_off < 0))
-		return;
-
-	DPU_REG_WRITE(c, LM_BLEND0_FG_ALPHA + stage_off, fg_alpha);
-	DPU_REG_WRITE(c, LM_BLEND0_BG_ALPHA + stage_off, bg_alpha);
-	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
-}
-
 static void dpu_hw_lm_setup_color3(struct dpu_hw_mixer *ctx,
 	uint32_t mixer_op_mode)
 {
@@ -154,10 +133,7 @@ static void _setup_mixer_ops(const struct dpu_mdss_cfg *m,
 		unsigned long features)
 {
 	ops->setup_mixer_out = dpu_hw_lm_setup_out;
-	if (m->hwversion >= DPU_HW_VER_400)
-		ops->setup_blend_config = dpu_hw_lm_setup_blend_config_sdm845;
-	else
-		ops->setup_blend_config = dpu_hw_lm_setup_blend_config;
+	ops->setup_blend_config = dpu_hw_lm_setup_blend_config_sdm845;
 	ops->setup_alpha_out = dpu_hw_lm_setup_color3;
 	ops->setup_border_color = dpu_hw_lm_setup_border_color;
 }
-- 
2.30.2

