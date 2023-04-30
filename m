Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B63BF6F2AAB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Apr 2023 22:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbjD3UgE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Apr 2023 16:36:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230114AbjD3UgD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Apr 2023 16:36:03 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AD59D2
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Apr 2023 13:36:02 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2a8b1b51dbdso17423521fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Apr 2023 13:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682886961; x=1685478961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6NmOsCOeaXlBzztrIruv87ZFWNmW9EDHTimbYIfZmU=;
        b=q7IaEjj/KVy2H/qnIImiEslsTrlvC/3AuDTdkLJyCAiyWvwkBcLQWhLrRmg5zgsxMR
         GXXAtiQAADRbSmFzuwE82x30spj//x5oYuVRFRvyvCv6LCLsROou5qOfLMPAyrXV0VGo
         ACJuAsR0kg6ljQA8NLgjLYVnoNlU1pDctXClbPiXooqx+1cyUzTbHLUk33p6iQ4EjOXi
         7p/VD/m3Ug7Xlhg6kpE1lumoLvJlOdjMXcwpY5yqAYD9w+uNC/St1SenebeIODX1UVHI
         6jVqCKgQOMXWLPtytFe62iFy9JK+vbkjPFUO7fOR+L296PVSUImfUsbyWHFIJEbLONdb
         8ElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682886961; x=1685478961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+6NmOsCOeaXlBzztrIruv87ZFWNmW9EDHTimbYIfZmU=;
        b=Dv7yM8kmwqUiMFjOrID8xZwVcbda1xKL5aXbzAMz4jqelW3+2bKf3rYE2+yAHIzpPW
         NJ7HTDBVeyl8Pn5DtaxeEKcsItZNSlUVHXrMPjk24/V7dOMjTtggyhSJL6wmTA/9L9m/
         QwBz39JEk3mFbvR9Ys1kUpr10BqqgS537i24hF6TuGM0rSu1g5Dj1tFJRhacWVauZwfg
         dYJ2x5jaDBXNT9L5l7wkm9O4+kwKsCSW78qZnxAouMMr09VhJEyHBrleLSLUY+v3QtXV
         I/EgJh0SbV9GyUnTWNsi0BLDHGhNrWFI6DjEzmdD/y3dD8e+eFw4y+2gJRpDUl1vnGZU
         Arxw==
X-Gm-Message-State: AC+VfDxU1fgreRxFhl0Evi2hSpfTWRznwaa0R2Q4bsl3lWW7iF+4GUEr
        /frWJDlCv93M86GMY13JBkr2Bg==
X-Google-Smtp-Source: ACHHUZ7DMUyJmLG/H5hj/g6h14Qp8kr3jbzjgiorKr9BIA1e5M3k1Nv13J8nx+stFIzYh+9mtGSszA==
X-Received: by 2002:a05:651c:14f:b0:2a8:e6fd:5e57 with SMTP id c15-20020a05651c014f00b002a8e6fd5e57mr3419713ljd.11.1682886961048;
        Sun, 30 Apr 2023 13:36:01 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id b24-20020ac247f8000000b004edd4d1e55dsm4324634lfp.284.2023.04.30.13.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 13:36:00 -0700 (PDT)
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
Subject: [PATCH 4/4] drm/msm/dpu: move PINGPONG_NONE check to dpu_lm_init()
Date:   Sun, 30 Apr 2023 23:35:56 +0300
Message-Id: <20230430203556.3184252-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230430203556.3184252-1-dmitry.baryshkov@linaro.org>
References: <20230430203556.3184252-1-dmitry.baryshkov@linaro.org>
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

Move the check for lm->pingpong being not NONE from dpu_rm_init() to
dpu_lm_init(), following the change to dpu_hw_intf_init().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 5 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c    | 5 -----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 214f207ddf8a..d1c3bd8379ea 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -161,6 +161,11 @@ struct dpu_hw_mixer *dpu_hw_lm_init(const struct dpu_lm_cfg *cfg,
 {
 	struct dpu_hw_mixer *c;
 
+	if (cfg->pingpong == PINGPONG_NONE) {
+		DPU_DEBUG("skip mixer %d without pingpong\n", cfg->id);
+		return NULL;
+	}
+
 	c = kzalloc(sizeof(*c), GFP_KERNEL);
 	if (!c)
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index bf7b8e7c45b1..2ca3c666e22f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -117,11 +117,6 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_mixer *hw;
 		const struct dpu_lm_cfg *lm = &cat->mixer[i];
 
-		if (lm->pingpong == PINGPONG_NONE) {
-			DPU_DEBUG("skip mixer %d without pingpong\n", lm->id);
-			continue;
-		}
-
 		hw = dpu_hw_lm_init(lm, mmio);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
-- 
2.39.2

