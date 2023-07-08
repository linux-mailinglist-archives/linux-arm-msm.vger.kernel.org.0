Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 463CD74BAAF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jul 2023 03:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbjGHBEP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 21:04:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbjGHBEP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 21:04:15 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19F91210B
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 18:04:14 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b703d7ed3aso40823891fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 18:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688778252; x=1691370252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c67ZCjzlNdx/XIvJplLRs/ovo3gUYzy9Nna9L/Wnj3A=;
        b=jw7J2xd9PvXrph2i+P2M9+qXmQ/Ynow26KULw3kswytzVbu7kb+vXN/FiNeZ7OMUX5
         utnNEkUz9Ud/74abFHIEz4HjYqW1X+rxv7jvUCtrAYTzLi3zQXDQYfoo0hQtul0RBomh
         eAFpkH5VlVatCf8XtdHWcCi4VFAe+bhDHicDSV7uo3kYr6uil6nvqAuQTOya4SHzMHRk
         wteyEA10l8YwX8Jce56YK6rTPfWlAJ/L9b9zxgZg5BmvwxDzXY53pCmLXYa+0oZjueGc
         JxNhLyaXV+UF73vXdiB/d2mxgj8nHMZv4ZHVT73zRgk7ocYTfZeHR/wWc361V373oA+w
         ZPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688778252; x=1691370252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c67ZCjzlNdx/XIvJplLRs/ovo3gUYzy9Nna9L/Wnj3A=;
        b=ktArlQ/aKT7T8QO/OtOaoiHOgy3LM/oLZRbR+M20ihMyCIHQ3hJtRjea4fkldCdlR6
         fK6hnEGYIpA/l8Frrzk7WaF/8yMk91rgYiVaYIT4Vza19G9FLpoua/w9A+HDsZ1gTIIX
         X/CNYRJMljL7RsdygWiI2egK+mn/FZn7L06dBTuwtmxiiLnSAckc0Vc0UgL6K2yFphjc
         /E00rYHyN9P1DqmCqPj11d20lRkkV8M+X6kI46GI/4U0D0/+93j/rnycklBpGaAL7+AL
         GE6xyz8rMX9y41FtKaQ7mF62lf8B08uQ6SLFYbLc4mzTtb6zAHefBH2YYNcqe5D5RfCG
         xZeA==
X-Gm-Message-State: ABy/qLYgMyKXQw+GCjLbtUFVpNPGHjs3/r/SwLDaax29RCuxBazzQbgi
        GXGKnd1hxzRqeLBGJNwzG0pdRA==
X-Google-Smtp-Source: APBJJlF1Ryz032/WTELXYwFoL+c0PZSZueJpHIwzNpRH1emr8OH5jk/1/aQS3dKc0vLLz0PzQ2vVwA==
X-Received: by 2002:a2e:7802:0:b0:2b6:d576:a25b with SMTP id t2-20020a2e7802000000b002b6d576a25bmr5043109ljc.28.1688778252284;
        Fri, 07 Jul 2023 18:04:12 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l5-20020a2e8685000000b002b6ee99fff2sm1012807lji.34.2023.07.07.18.04.11
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
Subject: [PATCH 05/17] drm/msm/mdp5: use devres-managed allocation for pipe data
Date:   Sat,  8 Jul 2023 04:03:55 +0300
Message-Id: <20230708010407.3871346-6-dmitry.baryshkov@linaro.org>
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

Use devm_kzalloc to create pipe data structure. This allows us
to remove corresponding kfree and drop mdp5_pipe_destroy() function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  |  6 +-----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c | 10 +++-------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h |  4 ++--
 3 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index b4a49d369f0d..be4338a48e52 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -209,10 +209,6 @@ static void mdp5_kms_destroy(struct msm_kms *kms)
 {
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
 	struct msm_gem_address_space *aspace = kms->aspace;
-	int i;
-
-	for (i = 0; i < mdp5_kms->num_hwpipes; i++)
-		mdp5_pipe_destroy(mdp5_kms->hwpipes[i]);
 
 	if (aspace) {
 		aspace->mmu->funcs->detach(aspace->mmu);
@@ -645,7 +641,7 @@ static int construct_pipes(struct mdp5_kms *mdp5_kms, int cnt,
 	for (i = 0; i < cnt; i++) {
 		struct mdp5_hw_pipe *hwpipe;
 
-		hwpipe = mdp5_pipe_init(pipes[i], offsets[i], caps);
+		hwpipe = mdp5_pipe_init(dev, pipes[i], offsets[i], caps);
 		if (IS_ERR(hwpipe)) {
 			ret = PTR_ERR(hwpipe);
 			DRM_DEV_ERROR(dev->dev, "failed to construct pipe for %s (%d)\n",
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
index e4b8a789835a..99b2c30b1d48 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
@@ -151,17 +151,13 @@ int mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe)
 	return 0;
 }
 
-void mdp5_pipe_destroy(struct mdp5_hw_pipe *hwpipe)
-{
-	kfree(hwpipe);
-}
-
-struct mdp5_hw_pipe *mdp5_pipe_init(enum mdp5_pipe pipe,
+struct mdp5_hw_pipe *mdp5_pipe_init(struct drm_device *dev,
+		enum mdp5_pipe pipe,
 		uint32_t reg_offset, uint32_t caps)
 {
 	struct mdp5_hw_pipe *hwpipe;
 
-	hwpipe = kzalloc(sizeof(*hwpipe), GFP_KERNEL);
+	hwpipe = devm_kzalloc(dev->dev, sizeof(*hwpipe), GFP_KERNEL);
 	if (!hwpipe)
 		return ERR_PTR(-ENOMEM);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h
index cca67938cab2..452138821f60 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h
@@ -39,8 +39,8 @@ int mdp5_pipe_assign(struct drm_atomic_state *s, struct drm_plane *plane,
 		     struct mdp5_hw_pipe **r_hwpipe);
 int mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe);
 
-struct mdp5_hw_pipe *mdp5_pipe_init(enum mdp5_pipe pipe,
+struct mdp5_hw_pipe *mdp5_pipe_init(struct drm_device *dev,
+		enum mdp5_pipe pipe,
 		uint32_t reg_offset, uint32_t caps);
-void mdp5_pipe_destroy(struct mdp5_hw_pipe *hwpipe);
 
 #endif /* __MDP5_PIPE_H__ */
-- 
2.39.2

