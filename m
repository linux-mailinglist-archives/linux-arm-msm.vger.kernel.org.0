Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 603AA751351
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 00:11:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232412AbjGLWL5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jul 2023 18:11:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232444AbjGLWLz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jul 2023 18:11:55 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB3C51FF7
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 15:11:49 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fba74870abso106575e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 15:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689199908; x=1689804708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sb/58smK4QA8GZRG0BTTatT01e0cBQtMbD8OLWYEOmE=;
        b=zL+/ogyRIlx43/gIAW13h0XusjJumIQXNfVkOzvZZ31ysIeZQhcif2QHg6Mbqqn5MO
         JXilO9/kmzuckGscySeM+06IcMzyHcJ28YMybj/f5+xBwdn1D9tLWf80X8/FVf0+PlWc
         bvUzq4TJVdLfmkdywMgnEKv2Kv+l8Mu4SHwi3aTxpVVBMYOgj7/8ijZD+Kqd0SLVUD59
         IW0KHKSS8frCGvJUi9M7DlreQELn8+SJIl2Dfb96udScEu6HSJBrtN2Di9c0XQ3uy1Vo
         hWcfmNRIrkirwg1Vlp9oRGf6XQzw4T0ji4IXBLUHZtK68l9EBZTWQlS6hozd3kE2LpmV
         FnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689199908; x=1689804708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sb/58smK4QA8GZRG0BTTatT01e0cBQtMbD8OLWYEOmE=;
        b=Cp9qi7Q5RoU4Us35RXA2jFRXqIhv66wDlxtoUyeAbRpa+AF3Vr0xlRRR4yrQ/Tg4o1
         2gfucQYXklPevEo6yIOylgNBxqxTBMPp2yd91jFc6nrkckqcTMOReQWj6IZapIuPsY1Z
         lqNS4DZEpsUmWxN8qLizp4fkhYUbMEVvNK6FeeFAYdkpj14PoYTRMyokUb6YPP6Z5PmA
         CJkK2VfwtVzmxCZz1BvFUogswLWzR/ZM6C+P6H6TYV7WrxBJfr4dr0B46mKWkrL4MGKW
         gx/6QET88A8T6ZBEs+rbCv7T2Tueo/4n2NJAEFgHwV9+1pP7L0bq9IHqEvGH6P/Kby1A
         r8eA==
X-Gm-Message-State: ABy/qLatxyMPHWE6WKlwwBQjtqtD1/ZLBdDJ/PkaS98ukgscWE267a2g
        /syq9JFU/Y4GgAg5EA7WP3tvoA==
X-Google-Smtp-Source: APBJJlHg0t/wk9o6pn+nG3LVS+daQu6IglLbXVQS3gWW/jgkN98i2RrON4KUCkmg/raLiRjarfJUPw==
X-Received: by 2002:a05:6512:311c:b0:4fb:7be5:4870 with SMTP id n28-20020a056512311c00b004fb7be54870mr15437202lfb.46.1689199908348;
        Wed, 12 Jul 2023 15:11:48 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q16-20020ac25290000000b004f62fdf61fdsm856193lfm.204.2023.07.12.15.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 15:11:47 -0700 (PDT)
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
Subject: [PATCH v4 10/11] drm/msm/dpu: move max clock decision to dpu_kms.
Date:   Thu, 13 Jul 2023 01:11:38 +0300
Message-Id: <20230712221139.313729-11-dmitry.baryshkov@linaro.org>
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

dpu_core_perf should not make decisions on the maximum possible core
clock rate. Pass the value from dpu_kms_hw_init().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 11 ++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  8 ++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 13 +++++++++++--
 3 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 896e87b13dbe..16a4d6c67f4d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -494,21 +494,14 @@ void dpu_core_perf_destroy(struct dpu_core_perf *perf)
 	}
 
 	perf->max_core_clk_rate = 0;
-	perf->core_clk = NULL;
 }
 
 int dpu_core_perf_init(struct dpu_core_perf *perf,
 		const struct dpu_perf_cfg *perf_cfg,
-		struct clk *core_clk)
+		unsigned long max_core_clk_rate)
 {
 	perf->perf_cfg = perf_cfg;
-	perf->core_clk = core_clk;
-
-	perf->max_core_clk_rate = clk_get_rate(core_clk);
-	if (!perf->max_core_clk_rate) {
-		DPU_DEBUG("optional max core clk rate, use default\n");
-		perf->max_core_clk_rate = DPU_PERF_DEFAULT_MAX_CORE_CLK_RATE;
-	}
+	perf->max_core_clk_rate = max_core_clk_rate;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index e718d523ff30..8cc55752db5e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -12,8 +12,6 @@
 
 #include "dpu_hw_catalog.h"
 
-#define	DPU_PERF_DEFAULT_MAX_CORE_CLK_RATE	412500000
-
 /**
  * struct dpu_core_perf_params - definition of performance parameters
  * @max_per_pipe_ib: maximum instantaneous bandwidth request
@@ -37,7 +35,6 @@ struct dpu_core_perf_tune {
 /**
  * struct dpu_core_perf - definition of core performance context
  * @perf_cfg: Platform-specific performance configuration
- * @core_clk: Pointer to the core clock
  * @core_clk_rate: current core clock rate
  * @max_core_clk_rate: maximum allowable core clock rate
  * @perf_tune: debug control for performance tuning
@@ -48,7 +45,6 @@ struct dpu_core_perf_tune {
  */
 struct dpu_core_perf {
 	const struct dpu_perf_cfg *perf_cfg;
-	struct clk *core_clk;
 	u64 core_clk_rate;
 	u64 max_core_clk_rate;
 	struct dpu_core_perf_tune perf_tune;
@@ -92,11 +88,11 @@ void dpu_core_perf_destroy(struct dpu_core_perf *perf);
  * dpu_core_perf_init - initialize the given core performance context
  * @perf: Pointer to core performance context
  * @perf_cfg: Pointer to platform performance configuration
- * @core_clk: pointer to core clock
+ * @max_core_clk_rate: Maximum core clock rate
  */
 int dpu_core_perf_init(struct dpu_core_perf *perf,
 		const struct dpu_perf_cfg *perf_cfg,
-		struct clk *core_clk);
+		unsigned long max_core_clk_rate);
 
 struct dpu_kms;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 80e08302680c..5bfea4868e43 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1051,11 +1051,14 @@ unsigned long dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name)
 	return clk_get_rate(clk);
 }
 
+#define	DPU_PERF_DEFAULT_MAX_CORE_CLK_RATE	412500000
+
 static int dpu_kms_hw_init(struct msm_kms *kms)
 {
 	struct dpu_kms *dpu_kms;
 	struct drm_device *dev;
 	int i, rc = -EINVAL;
+	unsigned long max_core_clk_rate;
 	u32 core_rev;
 
 	if (!kms) {
@@ -1156,8 +1159,14 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		dpu_kms->hw_vbif[vbif->id] = hw;
 	}
 
-	rc = dpu_core_perf_init(&dpu_kms->perf, dpu_kms->catalog->perf,
-			msm_clk_bulk_get_clock(dpu_kms->clocks, dpu_kms->num_clocks, "core"));
+	/* TODO: use the same max_freq as in dpu_kms_hw_init */
+	max_core_clk_rate = dpu_kms_get_clk_rate(dpu_kms, "core");
+	if (!max_core_clk_rate) {
+		DPU_DEBUG("max core clk rate not determined, using default\n");
+		max_core_clk_rate = DPU_PERF_DEFAULT_MAX_CORE_CLK_RATE;
+	}
+
+	rc = dpu_core_perf_init(&dpu_kms->perf, dpu_kms->catalog->perf, max_core_clk_rate);
 	if (rc) {
 		DPU_ERROR("failed to init perf %d\n", rc);
 		goto perf_err;
-- 
2.39.2

