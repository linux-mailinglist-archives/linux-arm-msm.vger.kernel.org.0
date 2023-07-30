Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 764B6768301
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jul 2023 03:01:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbjG3BBN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jul 2023 21:01:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbjG3BBM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jul 2023 21:01:12 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A370F1BF4
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 18:01:10 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fb7373dd35so5715879e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 18:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690678869; x=1691283669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0ob0u4E7GzEj0lwMhMnl9hV4h4mM4Saha8cWe62og0=;
        b=u1q7WXdLXH6NDmZpjipSV1sAoslbjAqOhCMbRuy9LyX6MeeT4BUl/EzrdFHFEeIm2b
         LfvvZRGV010J6ieOHMZq5btumuF7XTv/wlzJ/0l7Oea4WAqVW0bi27FL7mhAst/YQr0z
         jUSm2D7eVzMv9myDr6dh5Yj8+d2Ktlree/5jW3owNvCthyU/HOPgvoUA9OPClYrRXYe3
         nNQdZZbH4TtGN5+Attez9VSjCLGFcHlDFc2KITptvbpacAc/jHhDVYKDwgk5daeKxYzo
         r692GKcDvk04XZyRl2LPCbxI4q/N0x+73U6jHIdwM3a/YYZFej8ZcNinlY6cjZt2fOOW
         fy2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690678869; x=1691283669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a0ob0u4E7GzEj0lwMhMnl9hV4h4mM4Saha8cWe62og0=;
        b=LICa+Z8lOkHWcGv4MkSOOm7BHDEVUroBeGF0S0aX9gHvDN40FxCpHXL5Mp6GHgoCsz
         KpiQHVdT8QSwmf3dTQ64rQI878l8ZEA1rEiZfOBoFOArVkpmPbqU0/e+IuCtTX6lDkVH
         mbF0qdtwrPttLiLkGN8EHiXHQJKXnSLoGxTHnOHmhI7uR0jNqiJ/w0KWDmbjf599pdbZ
         CTmRYliWC0wJcJIaDk5ZZlycbw2bKepC2lawYfRTAppT5oC4RA8yUhy5DM7I+KM2clQ3
         J9/9rCY+bca/Fg7JniqlZRztFiejq/TQtqPTP0k5/ZBXO9OYYEDTNx/IwkeiFKL9imnC
         5S8g==
X-Gm-Message-State: ABy/qLbjsHPu8v1SNnOQxCm9S/5SiFuKJ6QQ8ltot7FyLLQdyk/+c6Q4
        07qFA2krncEr4uiG4K8pMse8NQ==
X-Google-Smtp-Source: APBJJlGhUEFbkjZAsH6tGDYhLbjPzirRqpSomHHOwdeiUddq1oSE3yvpNw9HLVx8q2+09pNDq4uubg==
X-Received: by 2002:a05:6512:39ce:b0:4f9:5582:a7d3 with SMTP id k14-20020a05651239ce00b004f95582a7d3mr2791685lfu.22.1690678869034;
        Sat, 29 Jul 2023 18:01:09 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 22-20020a05651c009600b002b9e501a6acsm169898ljq.3.2023.07.29.18.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 18:01:08 -0700 (PDT)
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
Subject: [PATCH v5 07/10] drm/msm/dpu: remove unused fields from struct dpu_core_perf
Date:   Sun, 30 Jul 2023 04:00:59 +0300
Message-Id: <20230730010102.350713-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730010102.350713-1-dmitry.baryshkov@linaro.org>
References: <20230730010102.350713-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove dpu_core_perf::dev and dpu_core_perf::debugfs_root fields, they
are not used by the code.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 6 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 2 +-
 3 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index f9585d717902..3dddec868bf5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -492,15 +492,12 @@ void dpu_core_perf_destroy(struct dpu_core_perf *perf)
 
 	perf->max_core_clk_rate = 0;
 	perf->core_clk = NULL;
-	perf->dev = NULL;
 }
 
 int dpu_core_perf_init(struct dpu_core_perf *perf,
-		struct drm_device *dev,
 		const struct dpu_perf_cfg *perf_cfg,
 		struct clk *core_clk)
 {
-	perf->dev = dev;
 	perf->perf_cfg = perf_cfg;
 	perf->core_clk = core_clk;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index f4b84e67138c..e718d523ff30 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -36,8 +36,6 @@ struct dpu_core_perf_tune {
 
 /**
  * struct dpu_core_perf - definition of core performance context
- * @dev: Pointer to drm device
- * @debugfs_root: top level debug folder
  * @perf_cfg: Platform-specific performance configuration
  * @core_clk: Pointer to the core clock
  * @core_clk_rate: current core clock rate
@@ -49,8 +47,6 @@ struct dpu_core_perf_tune {
  * @fix_core_ab_vote: fixed core ab vote in bps used in mode 2
  */
 struct dpu_core_perf {
-	struct drm_device *dev;
-	struct dentry *debugfs_root;
 	const struct dpu_perf_cfg *perf_cfg;
 	struct clk *core_clk;
 	u64 core_clk_rate;
@@ -95,12 +91,10 @@ void dpu_core_perf_destroy(struct dpu_core_perf *perf);
 /**
  * dpu_core_perf_init - initialize the given core performance context
  * @perf: Pointer to core performance context
- * @dev: Pointer to drm device
  * @perf_cfg: Pointer to platform performance configuration
  * @core_clk: pointer to core clock
  */
 int dpu_core_perf_init(struct dpu_core_perf *perf,
-		struct drm_device *dev,
 		const struct dpu_perf_cfg *perf_cfg,
 		struct clk *core_clk);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 074c032cd24e..80e08302680c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1156,7 +1156,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		dpu_kms->hw_vbif[vbif->id] = hw;
 	}
 
-	rc = dpu_core_perf_init(&dpu_kms->perf, dev, dpu_kms->catalog->perf,
+	rc = dpu_core_perf_init(&dpu_kms->perf, dpu_kms->catalog->perf,
 			msm_clk_bulk_get_clock(dpu_kms->clocks, dpu_kms->num_clocks, "core"));
 	if (rc) {
 		DPU_ERROR("failed to init perf %d\n", rc);
-- 
2.39.2

