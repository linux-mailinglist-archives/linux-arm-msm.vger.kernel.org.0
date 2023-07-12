Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28B74751353
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 00:11:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232444AbjGLWL6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jul 2023 18:11:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232443AbjGLWL4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jul 2023 18:11:56 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C25A210C
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 15:11:50 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fbaef9871cso112189e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 15:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689199909; x=1689804709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWwNSVsmh1bG+GHUN/mVATtu1UgwWBFt1a+c6iz+eLk=;
        b=aSC8OmNhmNYBmv27p0LBeT//vmWVquIGlNLAo9DVDuyMUpao3hRhtVbkxLwaIgYjIf
         9aN/oFL5YGvo0ML548i7zQra6CVrmrnum5pOjjRsSmwtNNnQa7HlhPCqJd2yc9kI3UUP
         J7o61wgvilevHxjd+wd7HPUaSOVr/VXtmc523hiOo02VhOFoGTwaFX2phF/zxoQmJTZA
         t52oDhjY7fdXKoTx5IWX/cSx7iSnJc9axn2DlKN3dxp9OmQvCSkO5ttteZ8rC2ZYnBdc
         CzfYvbEhRAypUVi58iA9BkVyGLjO/Ortm/lbrqm6RrmfnNHZ/xM23QtKyoA3vBWPvLVq
         oTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689199909; x=1689804709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gWwNSVsmh1bG+GHUN/mVATtu1UgwWBFt1a+c6iz+eLk=;
        b=ZSHmTNCfA92MyuplPCxF3AFJOxHX7WOm6gSGx/5f2KqYeMpUNxdMWyKqYYFGHgexuA
         YvMz9lxwwLICVg7VoTdga21zA41JApr9V5EZRSYLnvPAOKUpqHai5F0F39Q4lyJFiAef
         0h+RbuJWWdwypQqu7vOK1ujg8NUkcd9AcOpw6tPofKXjnj3H/tfgAZjvzv8Th9FknZ87
         7YPB7idCctsB/CyP1epCJTeqBeXpXzxJT3bWDot4WwwzR7PcVg9Xljjn06Iwmn/heSqs
         ZRZXogIcZkBamSSQF70Mfr0tL5v5/cs9KWMX9Ls9gWK8iL7O4kGx2xyrjiVBIJMnsHd7
         E6bg==
X-Gm-Message-State: ABy/qLaM1tenSUB8Vuh6XriBp+jpSWp/N8uv8DF3KuwCr6BnOQP/ZDuS
        3a73D+SHFV1EUhYi5BPV0XvE3g==
X-Google-Smtp-Source: APBJJlGE6umXBMHF2GTMhqi3lKCFZW01eI3qr0kPway+oAWpXZmXrZFIpTBWl8K7REtfJgAIu1eD/w==
X-Received: by 2002:a05:6512:34cf:b0:4f9:69af:9857 with SMTP id w15-20020a05651234cf00b004f969af9857mr15813885lfr.51.1689199909151;
        Wed, 12 Jul 2023 15:11:49 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q16-20020ac25290000000b004f62fdf61fdsm856193lfm.204.2023.07.12.15.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 15:11:48 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v4 11/11] drm/msm/dpu: drop dpu_core_perf_destroy()
Date:   Thu, 13 Jul 2023 01:11:39 +0300
Message-Id: <20230712221139.313729-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712221139.313729-1-dmitry.baryshkov@linaro.org>
References: <20230712221139.313729-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This function does nothing, just clears one struct field. Drop it now.

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 10 ----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  6 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  1 -
 3 files changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 16a4d6c67f4d..31813a322afd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -486,16 +486,6 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 }
 #endif
 
-void dpu_core_perf_destroy(struct dpu_core_perf *perf)
-{
-	if (!perf) {
-		DPU_ERROR("invalid parameters\n");
-		return;
-	}
-
-	perf->max_core_clk_rate = 0;
-}
-
 int dpu_core_perf_init(struct dpu_core_perf *perf,
 		const struct dpu_perf_cfg *perf_cfg,
 		unsigned long max_core_clk_rate)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index 8cc55752db5e..4186977390bd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -78,12 +78,6 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
  */
 void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc);
 
-/**
- * dpu_core_perf_destroy - destroy the given core performance context
- * @perf: Pointer to core performance context
- */
-void dpu_core_perf_destroy(struct dpu_core_perf *perf);
-
 /**
  * dpu_core_perf_init - initialize the given core performance context
  * @perf: Pointer to core performance context
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 5bfea4868e43..76ba86d3e436 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1212,7 +1212,6 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	return 0;
 
 drm_obj_init_err:
-	dpu_core_perf_destroy(&dpu_kms->perf);
 hw_intr_init_err:
 perf_err:
 power_error:
-- 
2.39.2

