Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86C6B74B76B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 21:42:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230166AbjGGTmj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 15:42:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233081AbjGGTlX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 15:41:23 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39974213C
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 12:39:52 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fb9ae4cef6so3690234e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 12:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688758790; x=1691350790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stYVLsEgOMltlLU01Ln5wiaTK1sjCVpmWow+sg/bmWw=;
        b=y+6d/Z3cAs8oqki/XdIT5t+QkdEvWcbIbEcxqIC24+60NzkhyGLOABMzlP9//QjHNd
         KpeheGP/g0My+z1wZrDrxf2w0kMF72S7mQC6aRfFHt6yOCU/N+F6P8eoF8hFCgCq+Khh
         /b0caZLKvsJ4B+c2QoAjUx8i1X8E2/Geeq8wFJP+xClodXm+XU70UJKBTWHVp2JqrepI
         3xBf7msvLapmiuhhTdQIRVPAWFntJv3YpqqqBcDmD1H929EYCHqRcfZsQuG5N2AcxAKZ
         hcY2+EzDbKmZkpBF0Ofaqrb/bJCU72Rjok5evob+UmYvjdtnkSraS+tw3NoGjdy3OCyY
         1RFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688758790; x=1691350790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=stYVLsEgOMltlLU01Ln5wiaTK1sjCVpmWow+sg/bmWw=;
        b=iD9YoaPJxWMhxzyOwhsHxoJc90Jm8E/VcmxFLLgOVQvHhF4zl2RrxYlH0+NjeGmC7X
         Xz99ySLnwpq2YlDf5dvcM6fvB/gJ3qH/2m9YfXETLc08ihC2kuFx/5IS2pq1Z/jLmNig
         ct5FeFpjkSYSRPlUyvxrJvtVhmQM2Utq+7O6p0hjliyO20ySiGXSiLeTK8r02qJF5Tt/
         SeIk2mYhMFTz9NMqqkdxpmtjmpcpXa5dMAY3LWVS08YSrJy+3Bb0fV/xmxqQGUiQYN7y
         RZiA3CzgLxNbY6LZ9fEIMIy8WRDqN+chHjW4mecznIe2JLq+4FaklvLrHJwUBM+f4LWK
         N4Jg==
X-Gm-Message-State: ABy/qLYb4J7Bl70W3n0tJSc2pBRSqgkoW/PHdn9UIsp25w2BD8kqR/fT
        6Oyyc8JgdFXXvCgfG9RQmjy3bg==
X-Google-Smtp-Source: APBJJlHDcfDnE6tihaK1q0IR27ghObqQBeF13prI3Uxwi0uKWTZBqUDCQI2Jv8hYdNNpdczeHL8J5A==
X-Received: by 2002:a19:645e:0:b0:4fb:8948:2b2b with SMTP id b30-20020a19645e000000b004fb89482b2bmr4464509lfj.48.1688758790538;
        Fri, 07 Jul 2023 12:39:50 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q16-20020a19a410000000b004fba759bf44sm778995lfc.277.2023.07.07.12.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 12:39:50 -0700 (PDT)
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
Subject: [PATCH v3 10/11] drm/msm/dpu: move max clock decision to dpu_kms.
Date:   Fri,  7 Jul 2023 22:39:41 +0300
Message-Id: <20230707193942.3806526-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707193942.3806526-1-dmitry.baryshkov@linaro.org>
References: <20230707193942.3806526-1-dmitry.baryshkov@linaro.org>
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
index a570810c9254..e9d71c0855df 100644
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

