Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 292C2751345
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 00:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232380AbjGLWLs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jul 2023 18:11:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232443AbjGLWLr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jul 2023 18:11:47 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FB571FCC
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 15:11:45 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fbf1f6c771so93817e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 15:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689199903; x=1689804703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5XWChv4vT18nWUgbzPeiVwsxo15cumrt9rjiPAkOKEw=;
        b=LrfA6udGKNXPT3NP5hqNTSnny5daWC5bP5r3Sk0GJmvUkXFSqps87WFxUaXvK/NUjb
         nb3Qga+6cfwtIvWUwdUTScwQraEfzOZ3jo7UIuU8krHCd/wjmlxGVylJNY24x9eBZWmJ
         fdzGeKKz1CGOhHgsmuVCo12/ewaCU5aNGTgoMsvSrzE2cCt2o3g2mHIOGuROBV6oiMOr
         RgWx6yVLOE6AkuG1ScxJoN86HJI0+YmxL5y8xgwBHLQxEwt4rY3ExnMqjfG9kPLVVj7k
         8CHhrzDHMfhpGUP8KYpbhn6o/1UXX57ngTWeBxtaFmabC+aU1CIdFO6W2Jk69s3GP7wP
         uTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689199903; x=1689804703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5XWChv4vT18nWUgbzPeiVwsxo15cumrt9rjiPAkOKEw=;
        b=EzW2vcptd/0vXMMIrv3F38Inp2UkKiWIJL1LicFV2tRcvrdiYznQpBESOoSD1/AsYH
         rHXK8dh7stYFkaPns0VenW9875KjuAHFHwdRsCJutJk0Re37j83t48usnAEB6+5VGhRB
         ifgju2ONk98jSN0GurSAvu2QCpDiedUTRegl2VcY7dL30RqtS5CFLNIrT0dPu4HMD4lb
         CwGcdlB5H9MEghoyg1dww8PKBIWlMaael5pAS1yqsEcbqSFhDoV6/JA+rCL85ovPDnFj
         sa4JXmXZqT9V8w2fNRLhJjDnSuihdK5BUQL/ubT1ID2xnQLRPhbcJbtnNESGmTZoyE+r
         jA9g==
X-Gm-Message-State: ABy/qLaN9MA5jw5BAkJrnpPw5cGqxvbRJNmkGFgFU9o/19R5Tqn6Tqf1
        yZgDTS1lhL4Gwp2hnSXyke67Tw==
X-Google-Smtp-Source: APBJJlHH4t/mhmlGvZmAiZMvEvV4olCUNQRCaJ74OGgbFzq250PCTZKzdTQWh3x0WZhsYV3wpmE7ZQ==
X-Received: by 2002:a05:6512:344f:b0:4fb:92a9:cbe8 with SMTP id j15-20020a056512344f00b004fb92a9cbe8mr14592262lfr.18.1689199903547;
        Wed, 12 Jul 2023 15:11:43 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q16-20020ac25290000000b004f62fdf61fdsm856193lfm.204.2023.07.12.15.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 15:11:43 -0700 (PDT)
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
Subject: [PATCH v4 04/11] drm/msm/dpu: drop separate dpu_core_perf_tune overrides
Date:   Thu, 13 Jul 2023 01:11:32 +0300
Message-Id: <20230712221139.313729-5-dmitry.baryshkov@linaro.org>
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

The values in struct dpu_core_perf_tune are fixed per the core perf
mode. Drop the 'tune' values and substitute them with known values when
performing perf management.

Note: min_bus_vote was not used at all, so it is just silently dropped.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 27 ++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  4 ---
 2 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 05d340aa18c5..f9f44cfcfbf2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -291,10 +291,16 @@ void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc)
 
 static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
 {
-	u64 clk_rate = kms->perf.perf_tune.min_core_clk;
+	u64 clk_rate;
 	struct drm_crtc *crtc;
 	struct dpu_crtc_state *dpu_cstate;
 
+	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED)
+		return kms->perf.fix_core_clk_rate;
+
+	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM)
+		return kms->perf.max_core_clk_rate;
+
 	drm_for_each_crtc(crtc, kms->dev) {
 		if (crtc->enabled) {
 			dpu_cstate = to_dpu_crtc_state(crtc->state);
@@ -305,11 +311,6 @@ static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
 		}
 	}
 
-	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED)
-		clk_rate = kms->perf.fix_core_clk_rate;
-
-	DRM_DEBUG_ATOMIC("clk:%llu\n", clk_rate);
-
 	return clk_rate;
 }
 
@@ -397,6 +398,8 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 	if (update_clk) {
 		clk_rate = _dpu_core_perf_get_core_clk_rate(kms);
 
+		DRM_DEBUG_ATOMIC("clk:%llu\n", clk_rate);
+
 		trace_dpu_core_perf_update_clk(kms->dev, stop_req, clk_rate);
 
 		clk_rate = min(clk_rate, kms->perf.max_core_clk_rate);
@@ -418,7 +421,6 @@ static ssize_t _dpu_core_perf_mode_write(struct file *file,
 		    const char __user *user_buf, size_t count, loff_t *ppos)
 {
 	struct dpu_core_perf *perf = file->private_data;
-	const struct dpu_perf_cfg *cfg = perf->catalog->perf;
 	u32 perf_mode = 0;
 	int ret;
 
@@ -433,14 +435,9 @@ static ssize_t _dpu_core_perf_mode_write(struct file *file,
 		DRM_INFO("fix performance mode\n");
 	} else if (perf_mode == DPU_PERF_MODE_MINIMUM) {
 		/* run the driver with max clk and BW vote */
-		perf->perf_tune.min_core_clk = perf->max_core_clk_rate;
-		perf->perf_tune.min_bus_vote =
-				(u64) cfg->max_bw_high * 1000;
 		DRM_INFO("minimum performance mode\n");
 	} else if (perf_mode == DPU_PERF_MODE_NORMAL) {
 		/* reset the perf tune params to 0 */
-		perf->perf_tune.min_core_clk = 0;
-		perf->perf_tune.min_bus_vote = 0;
 		DRM_INFO("normal performance mode\n");
 	}
 	perf->perf_tune.mode = perf_mode;
@@ -456,10 +453,8 @@ static ssize_t _dpu_core_perf_mode_read(struct file *file,
 	char buf[128];
 
 	len = scnprintf(buf, sizeof(buf),
-			"mode %d min_mdp_clk %llu min_bus_vote %llu\n",
-			perf->perf_tune.mode,
-			perf->perf_tune.min_core_clk,
-			perf->perf_tune.min_bus_vote);
+			"mode %d\n",
+			perf->perf_tune.mode);
 
 	return simple_read_from_buffer(buff, count, ppos, buf, len);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index 29bb8ee2bc26..c965dfbc3007 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -29,13 +29,9 @@ struct dpu_core_perf_params {
 /**
  * struct dpu_core_perf_tune - definition of performance tuning control
  * @mode: performance mode
- * @min_core_clk: minimum core clock
- * @min_bus_vote: minimum bus vote
  */
 struct dpu_core_perf_tune {
 	u32 mode;
-	u64 min_core_clk;
-	u64 min_bus_vote;
 };
 
 /**
-- 
2.39.2

