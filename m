Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA6774BAAE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jul 2023 03:04:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbjGHBEP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 21:04:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230044AbjGHBEO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 21:04:14 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D99C211F
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 18:04:13 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b6f0508f54so38702261fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 18:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688778251; x=1691370251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cqj1zfTkSVBVi5MTMAUdf4BIRwAJVp5IKDlTTrfyBVo=;
        b=kJ1yMhnV18HiwIf59EEaYuVZdW/ZrgVW406HaxuPFBCSbJKBdkIpvYQoYGMrVbyWC7
         9aQkNT1KTxPu6m3txMr4Uq8shX/rXIaguisxKHg85LLz/hca5T6AIstl7+8yVuai08xh
         f+CuaqwsG9CvnkB0s/Hvi+o5qj+87M6+Hf7oPe9t289hMs+0yU6ffAnXBk/A3fBjVre9
         91/NWiqS48DKaIz8cl7oCMMZRYUDfIJHwaubUml4pMCXIhxnST/RVdlFx8OP8gutC29f
         7AsiaibzmkmuhPqnhwKa6l/fd/JlW7LSIkeP+i4dYVMfKJS/8dRvBDvJQCWtC7T6HLal
         bF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688778251; x=1691370251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cqj1zfTkSVBVi5MTMAUdf4BIRwAJVp5IKDlTTrfyBVo=;
        b=XBQC7tYxjr/2mv/wjYu6ujnZRBWQojx0WXnitUuTPv/jUbrqNAZcu6Eu0ChvB74Gb6
         /QK5kzTEX4SmIhCmnezK5zSZZSbkqpS3VVsjHA1dpu8K64wKLt3vU1AhX7+roR38zWlb
         yPnn62g6rLd0Ve6Un9QIDcREggyBTDxB/6vajcQoLoRpaDXnV+WGpvSPHaWYybuaOrUg
         PQ6aMFoc3Ns9fqTzy0AtP52/GpCZ1DT7O1FCQ55te3VVBHS3XPSvjk+VR/K/2eQ2Q/fn
         06WEGtfnHNiowf2GX70K3t1hq3F4QV81+eqDC7Wkwktn0V2IacJXqtEii+blm2yvLDLb
         0Okg==
X-Gm-Message-State: ABy/qLYSA6F0d42uwucsvGonTeWSdOhtWc9ppPKSiGXmFivVuYiVDFZz
        GAYu1aZ6deIzDln+6PJAF2M9zg==
X-Google-Smtp-Source: APBJJlHEdzppfaTBCM4pe0IaFvABpePK2NwTjEKLk1Fm2g3Lzzn4Q+O2ehaPn7/LWOwWPkV2Oh/TGg==
X-Received: by 2002:a2e:960a:0:b0:2b6:d733:b580 with SMTP id v10-20020a2e960a000000b002b6d733b580mr4605078ljh.37.1688778251621;
        Fri, 07 Jul 2023 18:04:11 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l5-20020a2e8685000000b002b6ee99fff2sm1012807lji.34.2023.07.07.18.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 18:04:11 -0700 (PDT)
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
Subject: [PATCH 04/17] drm/msm/mdp5: use devres-managed allocation for mixer data
Date:   Sat,  8 Jul 2023 04:03:54 +0300
Message-Id: <20230708010407.3871346-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
References: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
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

Use devm_kzalloc to create mixer data structure. This allows us
to remove corresponding kfree and drop mdp5_mixer_destroy() function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c   |  5 +----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c | 10 +++-------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.h |  4 ++--
 3 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index e20ead138602..b4a49d369f0d 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -211,9 +211,6 @@ static void mdp5_kms_destroy(struct msm_kms *kms)
 	struct msm_gem_address_space *aspace = kms->aspace;
 	int i;
 
-	for (i = 0; i < mdp5_kms->num_hwmixers; i++)
-		mdp5_mixer_destroy(mdp5_kms->hwmixers[i]);
-
 	for (i = 0; i < mdp5_kms->num_hwpipes; i++)
 		mdp5_pipe_destroy(mdp5_kms->hwpipes[i]);
 
@@ -720,7 +717,7 @@ static int hwmixer_init(struct mdp5_kms *mdp5_kms)
 	for (i = 0; i < hw_cfg->lm.count; i++) {
 		struct mdp5_hw_mixer *mixer;
 
-		mixer = mdp5_mixer_init(&hw_cfg->lm.instances[i]);
+		mixer = mdp5_mixer_init(dev, &hw_cfg->lm.instances[i]);
 		if (IS_ERR(mixer)) {
 			ret = PTR_ERR(mixer);
 			DRM_DEV_ERROR(dev->dev, "failed to construct LM%d (%d)\n",
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c
index 2536def2a000..2822b533f807 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c
@@ -140,20 +140,16 @@ int mdp5_mixer_release(struct drm_atomic_state *s, struct mdp5_hw_mixer *mixer)
 	return 0;
 }
 
-void mdp5_mixer_destroy(struct mdp5_hw_mixer *mixer)
-{
-	kfree(mixer);
-}
-
 static const char * const mixer_names[] = {
 	"LM0", "LM1", "LM2", "LM3", "LM4", "LM5",
 };
 
-struct mdp5_hw_mixer *mdp5_mixer_init(const struct mdp5_lm_instance *lm)
+struct mdp5_hw_mixer *mdp5_mixer_init(struct drm_device *dev,
+				      const struct mdp5_lm_instance *lm)
 {
 	struct mdp5_hw_mixer *mixer;
 
-	mixer = kzalloc(sizeof(*mixer), GFP_KERNEL);
+	mixer = devm_kzalloc(dev->dev, sizeof(*mixer), GFP_KERNEL);
 	if (!mixer)
 		return ERR_PTR(-ENOMEM);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.h
index 545ee223b9d7..2bedd75835bc 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.h
@@ -25,8 +25,8 @@ struct mdp5_hw_mixer_state {
 	struct drm_crtc *hwmixer_to_crtc[8];
 };
 
-struct mdp5_hw_mixer *mdp5_mixer_init(const struct mdp5_lm_instance *lm);
-void mdp5_mixer_destroy(struct mdp5_hw_mixer *lm);
+struct mdp5_hw_mixer *mdp5_mixer_init(struct drm_device *dev,
+				      const struct mdp5_lm_instance *lm);
 int mdp5_mixer_assign(struct drm_atomic_state *s, struct drm_crtc *crtc,
 		      uint32_t caps, struct mdp5_hw_mixer **mixer,
 		      struct mdp5_hw_mixer **r_mixer);
-- 
2.39.2

