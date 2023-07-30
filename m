Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46500768323
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jul 2023 03:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbjG3BT1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jul 2023 21:19:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbjG3BT0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jul 2023 21:19:26 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5CCB171F
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 18:19:25 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-986d8332f50so475108366b.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 18:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690679964; x=1691284764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8os/TMAEnvf6K9BQCQyps63gRao5zmV5qOLXNQ+yl0=;
        b=jsmX4rnG/K5ErrJaNDiboodld+ZIFWkNtup8qs2uFG1WK+inpoPmh03NH7XVdgkr/4
         Hw5gZe8xTkbFJecE87DYFCU6fUO8ZJLIQk6LdGz7oaTRJ66TfrosI/MkLea63t0i8gUw
         Bv4Lv6LtQfp8SRBwFD5nTOd+ylMx954GGk9K4vJswISk8XfeJhNGHxmg6LHzlcjdmScA
         Lh9bWZyp0NJ/aSFSCsz7bxMUSSkh2nxlJ8bInwV6nHzwbNQG1Mq7y5CL6CMoxJe5efhh
         KEnuz3sPgNl2F3nMsdrA7hWWMcn+/+hRyGRDelHgHAhEVPsFW43Ge4pYNV5j6icf45k+
         HeVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690679964; x=1691284764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B8os/TMAEnvf6K9BQCQyps63gRao5zmV5qOLXNQ+yl0=;
        b=hLmyBzNtxLAubFJE77OzcdqeGELSqGwrYMsMzjmGWoH40T10kTKrQ5rNgfLl78wncb
         75IYOlSsWd+QJGUf0WfTbuDevlVQJnqnchU+PmW+72hsI2o9ywQyIHO7jB4ZaaG8nk+a
         GZoy4w5d42NQh7PJtUEpySK1aA8YIzxpOOSmgrvxfqsrXKCQ48v/xRuoAE2N0JHJUnSq
         suUVluWBZk74gc7rbg+pqeTZbPfuhDoHYUwR/AsVHam7zSpm1y8o/7J3tmbmL+s6iwfK
         0mT3nh1ZdSzikv+E5/vbDbisDQwwKbOiGFA9lGdlsEl9IebPf2HoIxCw7uX2yhGVb32v
         mlqw==
X-Gm-Message-State: ABy/qLb3JUjDwYN1fjsbHuMBhVBQzTjSUBni6qsJIIsiRY5cY5vyyg09
        NzQRyr5w+tcsAH0kT2DiR2FTsQ==
X-Google-Smtp-Source: APBJJlGc6305yw1LBRkZHXvp14RrtUiVrieVuP977kY1KN8+GcRs9VpVme5jFiCEYuxMHLFDBecIpw==
X-Received: by 2002:a17:906:3092:b0:991:e7c3:5712 with SMTP id 18-20020a170906309200b00991e7c35712mr2925950ejv.30.1690679964409;
        Sat, 29 Jul 2023 18:19:24 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id rk21-20020a170907215500b00992ea405a79sm3915835ejb.166.2023.07.29.18.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 18:19:24 -0700 (PDT)
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
Subject: [PATCH v3 01/13] drm/msm/dpu: cleanup dpu_kms_hw_init error path
Date:   Sun, 30 Jul 2023 04:19:08 +0300
Message-Id: <20230730011920.354575-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730011920.354575-1-dmitry.baryshkov@linaro.org>
References: <20230730011920.354575-1-dmitry.baryshkov@linaro.org>
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

It was noticed that dpu_kms_hw_init()'s error path contains several
labels which point to the same code path. Replace all of them with a
single label.

Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 31782a6d821f..77a79bc42492 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1077,7 +1077,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	if (!dpu_kms->catalog) {
 		DPU_ERROR("device config not known!\n");
 		rc = -EINVAL;
-		goto power_error;
+		goto err_pm_put;
 	}
 
 	/*
@@ -1087,13 +1087,13 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	rc = _dpu_kms_mmu_init(dpu_kms);
 	if (rc) {
 		DPU_ERROR("dpu_kms_mmu_init failed: %d\n", rc);
-		goto power_error;
+		goto err_pm_put;
 	}
 
 	rc = dpu_rm_init(&dpu_kms->rm, dpu_kms->catalog, dpu_kms->mmio);
 	if (rc) {
 		DPU_ERROR("rm init failed: %d\n", rc);
-		goto power_error;
+		goto err_pm_put;
 	}
 
 	dpu_kms->rm_init = true;
@@ -1105,7 +1105,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		rc = PTR_ERR(dpu_kms->hw_mdp);
 		DPU_ERROR("failed to get hw_mdp: %d\n", rc);
 		dpu_kms->hw_mdp = NULL;
-		goto power_error;
+		goto err_pm_put;
 	}
 
 	for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
@@ -1116,7 +1116,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed to init vbif %d: %d\n", vbif->id, rc);
-			goto power_error;
+			goto err_pm_put;
 		}
 
 		dpu_kms->hw_vbif[vbif->id] = hw;
@@ -1132,7 +1132,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	rc = dpu_core_perf_init(&dpu_kms->perf, dpu_kms->catalog->perf, max_core_clk_rate);
 	if (rc) {
 		DPU_ERROR("failed to init perf %d\n", rc);
-		goto perf_err;
+		goto err_pm_put;
 	}
 
 	dpu_kms->hw_intr = dpu_hw_intr_init(dpu_kms->mmio, dpu_kms->catalog);
@@ -1140,7 +1140,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		rc = PTR_ERR(dpu_kms->hw_intr);
 		DPU_ERROR("hw_intr init failed: %d\n", rc);
 		dpu_kms->hw_intr = NULL;
-		goto hw_intr_init_err;
+		goto err_pm_put;
 	}
 
 	dev->mode_config.min_width = 0;
@@ -1165,7 +1165,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	rc = _dpu_kms_drm_obj_init(dpu_kms);
 	if (rc) {
 		DPU_ERROR("modeset init failed: %d\n", rc);
-		goto drm_obj_init_err;
+		goto err_pm_put;
 	}
 
 	dpu_vbif_init_memtypes(dpu_kms);
@@ -1174,10 +1174,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 
 	return 0;
 
-drm_obj_init_err:
-hw_intr_init_err:
-perf_err:
-power_error:
+err_pm_put:
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 error:
 	_dpu_kms_hw_destroy(dpu_kms);
-- 
2.39.2

