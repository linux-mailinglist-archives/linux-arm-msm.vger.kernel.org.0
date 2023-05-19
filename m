Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27DE470A376
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 May 2023 01:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbjESXke (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 May 2023 19:40:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230005AbjESXkd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 May 2023 19:40:33 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20AD51B7
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 16:40:32 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2af28303127so10875771fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 16:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684539630; x=1687131630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SP9r8o45jCIKKsv86cuaR2n6xnWFwKLjeFYUSAiBNjc=;
        b=jfAAR1SEHiKrVRED/e4YHu2ieVicHNB5SXnFYtRpO4i2yTK32P6PSIY6no6pDyHR4U
         /3IS409Au91L20PuZSqSaJkO4418crBke1zO+HFMOduMBEVjGOsNcxVfKltHqv24QzOs
         3xSvYLXNkWnNqKnhcNXjVALKOPN+WsNFslOaSzfQqqDZKmiiEJsfOzzy/mIRJp0ExXKQ
         G4RK/rgaIDIlK+D+NW0R+K5e1GIEQTC3MClhOO3CsXV4Tb6Fw1gGcnPxt8eR09x8cqBq
         d6PPvFtVwXl21gHE7taswp84XLUBL6/qQUT5nwDuOl7j0G5jHeS/rAXdCg+s00MDT4OP
         IZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684539630; x=1687131630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SP9r8o45jCIKKsv86cuaR2n6xnWFwKLjeFYUSAiBNjc=;
        b=NEX6vvUJcBhqhgLaAT63fp3f+dUihZ2+CKYUK4sntGQGkaTVjz+tR6pt+TXw6yAI9R
         C8C89njZz/GBRDBEAPhXqiKR0+HshTjIEMW9io69DEEL5uomIijQY5m1wAAWQnEPSXl3
         Vr92HJFrW30kD6C+r/oY4seWlGoiM3xRiB08EMTIQ/iQDXhaIHBm4ECpeF2Ai6veohSR
         edM4XpRIXhhXJqImUT/nUiTwwtW9CcNdbkG4baz/nYKnB6EHobWV5IAO1GRIc0W4a2ly
         8WBYEpOQd5qorMXm1VZvxMRTXXJ2cdrpbHttwHglxOD3FfdWFLbD3xznDmPz3TZT3Gcg
         kRcw==
X-Gm-Message-State: AC+VfDzjy9U4xLfJFWA+474Y/vExmOrMdZayTa4HKhZikJI7H9aPgw0J
        soR6ycRCnyxFq3MtiO6WmMBXzA==
X-Google-Smtp-Source: ACHHUZ4L1DmQxj2wcs+2VmKrhphZOV8bO0R/mrtTqApwLNfX3QOU1rJVE5lDNRfyJGLaU79dWCmK5A==
X-Received: by 2002:a2e:8014:0:b0:2ac:8cc0:bee5 with SMTP id j20-20020a2e8014000000b002ac8cc0bee5mr1447324ljg.0.1684539630277;
        Fri, 19 May 2023 16:40:30 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id l7-20020a2e3e07000000b002af25598f07sm43454lja.78.2023.05.19.16.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 16:40:29 -0700 (PDT)
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
Subject: [PATCH v2 4/4] drm/msm/dpu: move PINGPONG_NONE check to dpu_lm_init()
Date:   Sat, 20 May 2023 02:40:25 +0300
Message-Id: <20230519234025.2864377-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519234025.2864377-1-dmitry.baryshkov@linaro.org>
References: <20230519234025.2864377-1-dmitry.baryshkov@linaro.org>
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

Move the check for lm->pingpong being not NONE from dpu_rm_init() to
dpu_lm_init(), following the change to dpu_hw_intf_init().

Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
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

