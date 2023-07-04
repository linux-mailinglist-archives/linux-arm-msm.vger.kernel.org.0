Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C45917474D1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 17:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230464AbjGDPEK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jul 2023 11:04:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231483AbjGDPEI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jul 2023 11:04:08 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B68C10D5
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 08:04:07 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b6a0d91e80so93119211fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 08:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688483045; x=1691075045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K014LgLyPe4aW6ZNHxa+7j6rHR32DjhGHYOOx4vKvz0=;
        b=cW/atZ9p/Z1NbJFRIGf7Y8+A8+yEdtUDWR9e9FUVpr/4X9EiNjcwcUQQyBNFXrYzg9
         +deMu81Lfp9/bcfjw5PHlunXr4S5+SCO7lN9OgHuBUexgv7gMuXp8NWjhNjoOKwf7cDO
         FXvKyQUKaGaXDZAI9J8d7Zs4xBzIuBGbS3G+ZKaH0rBWXJds6seTLzBouxgf1NX23HFm
         Kb09fCviq+qaqa2dk324LKQB4jc1ypFais6nV4xphl1H6JsSZnKFVflYDIaIctv0AzbN
         8/6X49tBTheNixTm7Z0sfnU+lKxWNHKu/2myypQaTIh/qmmBfJia90wobWJGgnV9PbSG
         me4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688483045; x=1691075045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K014LgLyPe4aW6ZNHxa+7j6rHR32DjhGHYOOx4vKvz0=;
        b=jF5aGNDzBgkvm2Plh08kSa135uO6Ty2UfQ+1Y4a09cErjomplZrUSUZw0WgH+WI/96
         5ar542crfM2Y8SllUE45J7NRx0+/igXbNN/i6rrgXpBTsjgtlZ0ecFbGRyxaXOwe2hfw
         6jKw/oorU1JmAMvEGXMNbz2/RSRTowjy4pLuYZCFBuA73GiRfJ6zFmvM3gYrwCmt2Rmq
         +EnsaqVMcyl0kzRAOPvrsGjQd7dZWDNdtAXgJHX07/Zcs8k2TNrfRRDf7MSRpUUuZULK
         XjDiMgPiRqt31/ADabhWRmyJnCNTo+7j07dNKKV5kq3BzHw9WmHaImsJReFY2VZ9bcHV
         M3mg==
X-Gm-Message-State: ABy/qLZxXx6sqGceT73J2s2VkqiGmo5zADDjiFpUwWXhSho+/zkbP0QZ
        g8o9D4dY7vc6AU9XOiWaoW36Aw==
X-Google-Smtp-Source: APBJJlFL6tCE43hAXSFHpFC901y1JpvL+F43NmKcBa6ZbOeviRZX7bqDm3EOf7P0JSAFnwXnrnMQdw==
X-Received: by 2002:a2e:8885:0:b0:2b5:80e0:f18e with SMTP id k5-20020a2e8885000000b002b580e0f18emr9572371lji.3.1688483045753;
        Tue, 04 Jul 2023 08:04:05 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j10-20020a2e850a000000b002b6ca539d92sm3337354lji.138.2023.07.04.08.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:04:05 -0700 (PDT)
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
Subject: [PATCH v2 13/14] drm/msm/dpu: move max clock decision to dpu_kms.
Date:   Tue,  4 Jul 2023 18:03:53 +0300
Message-Id: <20230704150354.159882-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230704150354.159882-1-dmitry.baryshkov@linaro.org>
References: <20230704150354.159882-1-dmitry.baryshkov@linaro.org>
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

dpu_core_perf should not make decisions on the maximum possible core
clock rate. Pass the value from dpu_kms_hw_init().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 11 ++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  8 ++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 13 +++++++++++--
 3 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index d533b63f90f6..608c915a2cab 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -416,21 +416,14 @@ void dpu_core_perf_destroy(struct dpu_core_perf *perf)
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
index 7c5142aca4ee..df1fcf28f2a9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -12,8 +12,6 @@
 
 #include "dpu_hw_catalog.h"
 
-#define	DPU_PERF_DEFAULT_MAX_CORE_CLK_RATE	412500000
-
 /**
  * struct dpu_core_perf_params - definition of performance parameters
  * @bw_ctl: arbitrated bandwidth request
@@ -27,7 +25,6 @@ struct dpu_core_perf_params {
 /**
  * struct dpu_core_perf - definition of core performance context
  * @perf_cfg: Platform-specific performance configuration
- * @core_clk: Pointer to the core clock
  * @core_clk_rate: current core clock rate
  * @max_core_clk_rate: maximum allowable core clock rate
  * @enable_bw_release: debug control for bandwidth release
@@ -37,7 +34,6 @@ struct dpu_core_perf_params {
  */
 struct dpu_core_perf {
 	const struct dpu_perf_cfg *perf_cfg;
-	struct clk *core_clk;
 	u64 core_clk_rate;
 	u64 max_core_clk_rate;
 	u32 enable_bw_release;
@@ -80,11 +76,11 @@ void dpu_core_perf_destroy(struct dpu_core_perf *perf);
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
index 631b6b679bae..f01b2278c01a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1011,11 +1011,14 @@ unsigned long dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name)
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
@@ -1115,8 +1118,14 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
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

