Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2739874BAB0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jul 2023 03:04:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230036AbjGHBEQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 21:04:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231249AbjGHBEP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 21:04:15 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A41F1210C
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 18:04:14 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b6ef9ed2fdso40515201fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 18:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688778253; x=1691370253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2II3eP/imOK3wgOrSDeLiLVf5Scf+gSw5v2bj8N9xHc=;
        b=RZocBjiVJprEs93xGEUXJmEZg67XQcLKV4GI9CSye+jwEprd1kpbiEBCi4dgD099JV
         YUuv3FlJPcrrk20avme4buforkmOmZqUrykOulLb8jpuqbyzt1zzox+/2G8ONG0Ayl2J
         52RqOEF0K+eI18akuycEowccqK0k7FCGdG5IGSEq9mkN2QELYa7rHjClfupNsgdFjm9g
         j97SMUhgkLSsLgAPYUOTHGql1pwaTjtiM/oavPOu++HzYBDNh4fVc4azmCHZOPrNNemy
         F9Mip/77U5cPEGYCIof9tmCKVMOteo3JO6E85mOP/rIqlZs+WvvXorhA1lQvKyXFpldk
         5f3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688778253; x=1691370253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2II3eP/imOK3wgOrSDeLiLVf5Scf+gSw5v2bj8N9xHc=;
        b=FILPpB/FnepciV0FlhLSjhyDcuHHNHrdFnnV4hjdLPFq8APJaT33romdj8efjH2rAi
         iHNF/MDT4AO1UJHVkH2Gwj2wn7o/5Yo24ADvGHDhwCm1xhf0Vc5xoPICIr2NGD3ql3Tp
         mCHIK/8wUtBUyCAYY0ctQykSNI5qp7X88BM9wi0qa7ygaMQUEKRN8QHajXNOUD7Ikqf+
         etBOQ06dJiNrnHgO3pR6p2l5ifeq5aPaeCCYdNDkEh9faENKKkT37pYFPllTS8pRMQkA
         qRr42/0NGNoW0lW8QfmCfNbEC6hoe8AE1Em/yxdLbRWhYkr/vAmNn0oowFoupAR4rJuo
         vkaQ==
X-Gm-Message-State: ABy/qLaZoPUSdAu0X17TrSdOJ2yMPFIjS1uusDR5Wc+PbkmNHBIXVfq/
        ZDy/ONq7zO0nwmoUVYmoGd5PXg==
X-Google-Smtp-Source: APBJJlGP8VAjq6k876CRT56faHFdQfRap+fUYG9xImOyv+dOqSre58JgXws72E9dWNiKNRgoi9Q8oA==
X-Received: by 2002:a2e:80cd:0:b0:2b6:dd9a:e1d3 with SMTP id r13-20020a2e80cd000000b002b6dd9ae1d3mr4753616ljg.44.1688778253013;
        Fri, 07 Jul 2023 18:04:13 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l5-20020a2e8685000000b002b6ee99fff2sm1012807lji.34.2023.07.07.18.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 18:04:12 -0700 (PDT)
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
Subject: [PATCH 06/17] drm/msm/mdp5: use devres-managed allocation for SMP data
Date:   Sat,  8 Jul 2023 04:03:56 +0300
Message-Id: <20230708010407.3871346-7-dmitry.baryshkov@linaro.org>
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

Use devm_kzalloc to create SMP data structure. This allows us
to remove corresponding kfree and drop mdp5_smp_destroy() function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  3 ---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c | 19 ++++---------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h |  1 -
 3 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index be4338a48e52..0a85777625d3 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -618,9 +618,6 @@ static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
 {
 	int i;
 
-	if (mdp5_kms->smp)
-		mdp5_smp_destroy(mdp5_kms->smp);
-
 	for (i = 0; i < mdp5_kms->num_intfs; i++)
 		kfree(mdp5_kms->intfs[i]);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
index 56a3063545ec..d7c957207255 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
@@ -370,23 +370,17 @@ void mdp5_smp_dump(struct mdp5_smp *smp, struct drm_printer *p)
 		drm_modeset_unlock(&mdp5_kms->glob_state_lock);
 }
 
-void mdp5_smp_destroy(struct mdp5_smp *smp)
-{
-	kfree(smp);
-}
 
 struct mdp5_smp *mdp5_smp_init(struct mdp5_kms *mdp5_kms, const struct mdp5_smp_block *cfg)
 {
+	struct drm_device *dev = mdp5_kms->dev;
 	struct mdp5_smp_state *state;
 	struct mdp5_global_state *global_state;
 	struct mdp5_smp *smp = NULL;
-	int ret;
 
-	smp = kzalloc(sizeof(*smp), GFP_KERNEL);
-	if (unlikely(!smp)) {
-		ret = -ENOMEM;
-		goto fail;
-	}
+	smp = devm_kzalloc(dev->dev, sizeof(*smp), GFP_KERNEL);
+	if (unlikely(!smp))
+		return ERR_PTR(-ENOMEM);
 
 	smp->dev = mdp5_kms->dev;
 	smp->blk_cnt = cfg->mmb_count;
@@ -400,9 +394,4 @@ struct mdp5_smp *mdp5_smp_init(struct mdp5_kms *mdp5_kms, const struct mdp5_smp_
 	memcpy(smp->reserved, cfg->reserved, sizeof(smp->reserved));
 
 	return smp;
-fail:
-	if (smp)
-		mdp5_smp_destroy(smp);
-
-	return ERR_PTR(ret);
 }
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h
index ba5618e136c3..d8b6a11413d9 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h
@@ -68,7 +68,6 @@ struct mdp5_smp;
 
 struct mdp5_smp *mdp5_smp_init(struct mdp5_kms *mdp5_kms,
 		const struct mdp5_smp_block *cfg);
-void  mdp5_smp_destroy(struct mdp5_smp *smp);
 
 void mdp5_smp_dump(struct mdp5_smp *smp, struct drm_printer *p);
 
-- 
2.39.2

