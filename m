Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91B0676833B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jul 2023 03:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbjG3BTo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jul 2023 21:19:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbjG3BTn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jul 2023 21:19:43 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82770171F
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 18:19:42 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-99bc0a20b54so526391866b.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 18:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690679981; x=1691284781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfDk9Qj6+BiCJjU40UaGCLUYv74yIhlO95/py5nc9LU=;
        b=ya1YPZpjPd9D5AAQY1nbT9z57d/gIux54j7rOaGSSklwV3tD3jQSoNCcwJ49hJHu2n
         Z/qhVC+m9WZCKcy5C0AgJxMH+w5dzyr687pojQlzgDHiACc2lEcj6wjlIwK0KTrhyL78
         4hihWgwvlnQpFBOMc5k2ix8lPgsm/xXkFM8YyGkZwThZqs3oGouzBDOpoBx1CN22chxc
         iuixUaXFc0AWCu7MlDhn5AscY7nJb3WGUdunF28tJeyb0uu01EzDkSPH40eQbuyCBspM
         KAIF5FE82rGT89WeD0kKTZqp2LmSFj/mB/cdW3ygvv0Dl4vmgVjaQXZxh0ussd6yOOsv
         1m1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690679981; x=1691284781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfDk9Qj6+BiCJjU40UaGCLUYv74yIhlO95/py5nc9LU=;
        b=fPOrgmdW4Hv1t5V3DVDoCJ0tdKoYIcqdGHvJYns46Adjq7Fqh7BhXtMAU4PBfLBYIi
         dDN8kUDI6j6VM2/sUwYNesEN4mgjAq5F77k2vBhlDIrmYCj8nUXKCrBwGAbNPF6cSr5V
         GAKHVMiPTuJ5Y4AJx/0Wac4QUz2+sUPhvaaYLk6MiQwwrjrooSbs2Xze7RLtt3Wti1Qg
         0sx9yETzikj68SqE8iV91CPi9hwM6CCryILZGK4FgrrtP5tp09sjVwsSaASWEiCsN/zf
         KzbVrPh8Ry3lDUpW6Bc0kDFHdtfrECwtqEBpVC4AZaWb63nZpcPDH1wS+B8KyiuU7SpB
         LaTw==
X-Gm-Message-State: ABy/qLaEcqYHYnoyXSv1o+bUEffi/UKrDwbcvt/L3iuAEJX1iRtSmkHs
        HlyveG1wQSO36YnW29WSb2RKWA==
X-Google-Smtp-Source: APBJJlGNEfY7FSVJyVX4zz2MdGe2IXNHWde+ohW5lPOEGYxEiF3y/45lAY11EFBNHtfIxo50PH23Ag==
X-Received: by 2002:a17:907:2ccc:b0:965:6075:d100 with SMTP id hg12-20020a1709072ccc00b009656075d100mr3330031ejc.39.1690679981089;
        Sat, 29 Jul 2023 18:19:41 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id rk21-20020a170907215500b00992ea405a79sm3915835ejb.166.2023.07.29.18.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 18:19:40 -0700 (PDT)
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
Subject: [PATCH v3 13/13] drm/msm/dpu: use drmm-managed allocation for dpu_encoder_virt
Date:   Sun, 30 Jul 2023 04:19:20 +0300
Message-Id: <20230730011920.354575-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730011920.354575-1-dmitry.baryshkov@linaro.org>
References: <20230730011920.354575-1-dmitry.baryshkov@linaro.org>
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

It is incorrect to use devm-managed memory allocations for DRM data
structures exposed to userspace. They should use drmm_ allocations.
Change struct dpu_encoder allocation to use drmm_encoder_alloc(). This
removes the need to perform any actions on encoder destruction.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 50 +++++----------------
 1 file changed, 10 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 2b94ff3d08a1..6d9ec3ac065c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -443,23 +443,6 @@ int dpu_encoder_get_linecount(struct drm_encoder *drm_enc)
 	return linecount;
 }
 
-static void dpu_encoder_destroy(struct drm_encoder *drm_enc)
-{
-	struct dpu_encoder_virt *dpu_enc = NULL;
-	int i = 0;
-
-	if (!drm_enc) {
-		DPU_ERROR("invalid encoder\n");
-		return;
-	}
-
-	dpu_enc = to_dpu_encoder_virt(drm_enc);
-	DPU_DEBUG_ENC(dpu_enc, "\n");
-
-	drm_encoder_cleanup(drm_enc);
-	mutex_destroy(&dpu_enc->enc_lock);
-}
-
 void dpu_encoder_helper_split_config(
 		struct dpu_encoder_phys *phys_enc,
 		enum dpu_intf interface)
@@ -2381,7 +2364,6 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
 };
 
 static const struct drm_encoder_funcs dpu_encoder_funcs = {
-		.destroy = dpu_encoder_destroy,
 		.late_register = dpu_encoder_late_register,
 		.early_unregister = dpu_encoder_early_unregister,
 };
@@ -2392,20 +2374,13 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
-	struct drm_encoder *drm_enc = NULL;
-	struct dpu_encoder_virt *dpu_enc = NULL;
-	int ret = 0;
+	struct dpu_encoder_virt *dpu_enc;
+	int ret;
 
-	dpu_enc = devm_kzalloc(dev->dev, sizeof(*dpu_enc), GFP_KERNEL);
-	if (!dpu_enc)
-		return ERR_PTR(-ENOMEM);
-
-	ret = drm_encoder_init(dev, &dpu_enc->base, &dpu_encoder_funcs,
-			       drm_enc_mode, NULL);
-	if (ret) {
-		devm_kfree(dev->dev, dpu_enc);
-		return ERR_PTR(ret);
-	}
+	dpu_enc = drmm_encoder_alloc(dev, struct dpu_encoder_virt, base,
+				     &dpu_encoder_funcs, drm_enc_mode, NULL);
+	if (IS_ERR(dpu_enc))
+		return ERR_CAST(dpu_enc);
 
 	drm_encoder_helper_add(&dpu_enc->base, &dpu_encoder_helper_funcs);
 
@@ -2415,8 +2390,10 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
 	mutex_init(&dpu_enc->rc_lock);
 
 	ret = dpu_encoder_setup_display(dpu_enc, dpu_kms, disp_info);
-	if (ret)
-		goto fail;
+	if (ret) {
+		DPU_ERROR("failed to setup encoder\n");
+		return ERR_PTR(-ENOMEM);
+	}
 
 	atomic_set(&dpu_enc->frame_done_timeout_ms, 0);
 	timer_setup(&dpu_enc->frame_done_timer,
@@ -2442,13 +2419,6 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
 	DPU_DEBUG_ENC(dpu_enc, "created\n");
 
 	return &dpu_enc->base;
-
-fail:
-	DPU_ERROR("failed to create encoder\n");
-	if (drm_enc)
-		dpu_encoder_destroy(drm_enc);
-
-	return ERR_PTR(ret);
 }
 
 int dpu_encoder_wait_for_event(struct drm_encoder *drm_enc,
-- 
2.39.2

