Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8B7C74B9DA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jul 2023 01:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232308AbjGGXNE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 19:13:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231845AbjGGXNC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 19:13:02 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C24082128
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 16:13:00 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4fb761efa7aso3813797e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 16:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688771579; x=1691363579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iXV9b1StspueKJj0IlpvU3obPfD7J9ZL/UBCxcWtYF0=;
        b=zqFISPHUI01jS8fb+aioCfYSpK9+rt7SX5EG8hM1ds6XSa4RWJL66sdAdOVd9wvT6F
         tfFHU3BzddnVfcZxZpIZfCUrHFRQOhgqYl1/YamuH0klTDsLtZuC+gy9eK1oBq0vBSRr
         IWmDQT07r7VMjr/UnWsNzSu8dj15IWWFMKVSCurcUhMcVoTeckBbbUwjSP9INQ1GDR5F
         slioMkw/B3WQjtWczo5mVAUPGwulOHSXR4EUAgNWsO/ioqWRb2S0Zi8phJ7jgP93gmGu
         B9xJFC6Y/60Rba2yb22I++s8F3+5x5/1OOlz970Rsz8GbSU11lg2CfHnkbHSB33o5Wwu
         rTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688771579; x=1691363579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iXV9b1StspueKJj0IlpvU3obPfD7J9ZL/UBCxcWtYF0=;
        b=ctyFVEKhvlvgyc/cuNj/TJTrMv/H8yd8i18vMdywgX7PC09FEZSmF4cNBYGjTSbsSy
         DMEXAjLEHDxcoSiukiRIFtp7jyzyWDsD4sq9OEPHavF1xYuOVZMKWCfs4UanD58h7ODK
         HKVcZZTbLWRM1n2t2fENp7PVijURMbCGXYeHhBxqcxsV7XfSaK1mlJEaF9NCscFwFBgE
         lLngtMSgwCRkHIYzawGHVCePuEm/p5DujYNlnflsz9lzTGq/s/MIXx7QxWPmF+1PC3vz
         aOd/S2EE8Sh3yFhhPhw9FIbukxIda91RHWcZcZO1qRp34xKzSczq5k2An4C2oEZr9Scl
         nTVw==
X-Gm-Message-State: ABy/qLam5oLOeowOZ9EdarSHUmNO3wzjMDDRtY2W/QW9ggLoWP7YvMOY
        W5NeEnef9FsmcQ02/w1qUip8oQ==
X-Google-Smtp-Source: APBJJlHxA+YQ3Vx3whZYY2hjArK1xdp0xNFOGtfv/+cpSD/yhx5rKq5eAVh8U5Ug2dPnn4VInQKR1A==
X-Received: by 2002:a05:6512:ba1:b0:4fb:741f:75bf with SMTP id b33-20020a0565120ba100b004fb741f75bfmr6082561lfv.16.1688771579137;
        Fri, 07 Jul 2023 16:12:59 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d1-20020ac25441000000b004fb7388360esm841643lfn.188.2023.07.07.16.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 16:12:58 -0700 (PDT)
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
Subject: [PATCH v2 09/13] drm/msm/dpu: use drmm-managed allocation for dpu_plane
Date:   Sat,  8 Jul 2023 02:12:47 +0300
Message-Id: <20230707231251.3849701-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
References: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change struct dpu_plane allocation to use drmm_universal_plane_alloc().
This removes the need to perform any actions on plane destruction.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 46 +++++------------------
 1 file changed, 10 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index f114efee1b57..9d9e1cbf0dd7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1170,20 +1170,6 @@ static void dpu_plane_atomic_update(struct drm_plane *plane,
 	}
 }
 
-static void dpu_plane_destroy(struct drm_plane *plane)
-{
-	struct dpu_plane *pdpu = plane ? to_dpu_plane(plane) : NULL;
-
-	DPU_DEBUG_PLANE(pdpu, "\n");
-
-	if (pdpu) {
-		/* this will destroy the states as well */
-		drm_plane_cleanup(plane);
-
-		kfree(pdpu);
-	}
-}
-
 static void dpu_plane_destroy_state(struct drm_plane *plane,
 		struct drm_plane_state *state)
 {
@@ -1353,7 +1339,6 @@ static bool dpu_plane_format_mod_supported(struct drm_plane *plane,
 static const struct drm_plane_funcs dpu_plane_funcs = {
 		.update_plane = drm_atomic_helper_update_plane,
 		.disable_plane = drm_atomic_helper_disable_plane,
-		.destroy = dpu_plane_destroy,
 		.reset = dpu_plane_reset,
 		.atomic_duplicate_state = dpu_plane_duplicate_state,
 		.atomic_destroy_state = dpu_plane_destroy_state,
@@ -1381,35 +1366,28 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	struct dpu_hw_sspp *pipe_hw;
 	uint32_t num_formats;
 	uint32_t supported_rotations;
-	int ret = -EINVAL;
-
-	/* create and zero local structure */
-	pdpu = kzalloc(sizeof(*pdpu), GFP_KERNEL);
-	if (!pdpu) {
-		DPU_ERROR("[%u]failed to allocate local plane struct\n", pipe);
-		ret = -ENOMEM;
-		return ERR_PTR(ret);
-	}
-
-	/* cache local stuff for later */
-	plane = &pdpu->base;
-	pdpu->pipe = pipe;
+	int ret;
 
 	/* initialize underlying h/w driver */
 	pipe_hw = dpu_rm_get_sspp(&kms->rm, pipe);
 	if (!pipe_hw || !pipe_hw->cap || !pipe_hw->cap->sblk) {
 		DPU_ERROR("[%u]SSPP is invalid\n", pipe);
-		goto clean_plane;
+		return ERR_PTR(-EINVAL);
 	}
 
 	format_list = pipe_hw->cap->sblk->format_list;
 	num_formats = pipe_hw->cap->sblk->num_formats;
 
-	ret = drm_universal_plane_init(dev, plane, 0xff, &dpu_plane_funcs,
+	pdpu = drmm_universal_plane_alloc(dev, struct dpu_plane, base,
+				0xff, &dpu_plane_funcs,
 				format_list, num_formats,
 				supported_format_modifiers, type, NULL);
-	if (ret)
-		goto clean_plane;
+	if (IS_ERR(pdpu))
+		return ERR_CAST(pdpu);
+
+	/* cache local stuff for later */
+	plane = &pdpu->base;
+	pdpu->pipe = pipe;
 
 	pdpu->catalog = kms->catalog;
 
@@ -1439,8 +1417,4 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	DPU_DEBUG("%s created for pipe:%u id:%u\n", plane->name,
 					pipe, plane->base.id);
 	return plane;
-
-clean_plane:
-	kfree(pdpu);
-	return ERR_PTR(ret);
 }
-- 
2.39.2

