Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BEE974B7ED
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 22:37:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbjGGUh3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 16:37:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbjGGUh2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 16:37:28 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 610621994
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 13:37:27 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f004cc54f4so3449998e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 13:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688762245; x=1691354245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c5EkIcBQ5UsEGuU8h3jpVbyp/gnVsJ18dn8r0MlAf7U=;
        b=yuXH+DaUQD0V2CBNfFcRQzjAc3r2CDAKTGf9Z8Kk30wc//colUaQQ33xYE8+/nFRrS
         z9I/4q1QoCRrFL63LgYreDB40Qy7E+8Vunb+Gn8ysP9OMygMhL6VbxUjeJAlJ/5r5KHD
         mFyXVEm8NRHt7bHryuy/buUeI/CVD1h9clE/1iDNAlK02YRQmZyaosIRZVlpL8cXcZLR
         uMa24T06F3qYYWXO25YaSGwkXWeuhC42vGkQUa93wpUw4JISMtZf8EyEmsQaLu6usvIV
         KjrsgddwzTrKU6BHPDK5J9/ra/Bx23oPA8tMQioovECHIZEsu7dhK6Fh2dFzQUYF25j7
         VN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688762245; x=1691354245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c5EkIcBQ5UsEGuU8h3jpVbyp/gnVsJ18dn8r0MlAf7U=;
        b=SKgpjIdZjY4By1e/D1hVsJqpF4Ra42LOql46vxVjc0GHEYJjBB79Ud/YesLidkaXDC
         XzW5q5GhOCnHJqi1MPlMyq7GwYQJn70xJTmPs8g+nJyAkZ5QkQgChPoeQQZWkw7y4fnh
         ljU4x8UEjlsV9fqU0Z4I/RFzIsLFY1OovfKEMZ6WLK2diyunBu67v0i8X2T7z9fQA3Yk
         nuLsXv15Um5Wjtw4ZwoIL8FnAaM+5P0QbiK+hoMP1nIy8ikmxH41aggQ9Q2vA9YoMyyR
         e4vKNG/IxjRabEAogkAzo6FITU8zI/TsBox7KVTh42ZJJGYREknbHyj89byIG/CfvcZN
         IBQw==
X-Gm-Message-State: ABy/qLZdP2pcR2wQ0u7gg7IdgY+J5I1MCvLoUAmW/r8Sqth+YjOaiifQ
        SAzQhMgO4YtcrpYMVYvHluvx3qLmvtvzr0cVszQ=
X-Google-Smtp-Source: APBJJlGNwJMED/RsQR5nQb0C+lBB+RAAvkVZQGb4RvQhMX6pzMOLheOgrzAfBxvuCVPwRe5dafOg8A==
X-Received: by 2002:a05:6512:34c2:b0:4f9:5c89:5b08 with SMTP id w2-20020a05651234c200b004f95c895b08mr5222296lfr.21.1688762245748;
        Fri, 07 Jul 2023 13:37:25 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d4-20020ac244c4000000b004fb738796casm808899lfm.40.2023.07.07.13.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 13:37:25 -0700 (PDT)
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
Subject: [PATCH 01/13] drm/msm/dpu: cleanup dpu_kms_hw_init error path
Date:   Fri,  7 Jul 2023 23:37:12 +0300
Message-Id: <20230707203724.3820757-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707203724.3820757-1-dmitry.baryshkov@linaro.org>
References: <20230707203724.3820757-1-dmitry.baryshkov@linaro.org>
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

It was noticed that dpu_kms_hw_init()'s error path contains several
labels which point to the same code path. Replace all of them with a
single label.

Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index c11b3ab572ab..e7ac02e92f42 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1037,7 +1037,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	if (!dpu_kms->catalog) {
 		DPU_ERROR("device config not known!\n");
 		rc = -EINVAL;
-		goto power_error;
+		goto err_pm_put;
 	}
 
 	/*
@@ -1047,13 +1047,13 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
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
@@ -1065,7 +1065,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		rc = PTR_ERR(dpu_kms->hw_mdp);
 		DPU_ERROR("failed to get hw_mdp: %d\n", rc);
 		dpu_kms->hw_mdp = NULL;
-		goto power_error;
+		goto err_pm_put;
 	}
 
 	for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
@@ -1076,7 +1076,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed to init vbif %d: %d\n", vbif->id, rc);
-			goto power_error;
+			goto err_pm_put;
 		}
 
 		dpu_kms->hw_vbif[vbif->id] = hw;
@@ -1092,7 +1092,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	rc = dpu_core_perf_init(&dpu_kms->perf, dpu_kms->catalog->perf, max_core_clk_rate);
 	if (rc) {
 		DPU_ERROR("failed to init perf %d\n", rc);
-		goto perf_err;
+		goto err_pm_put;
 	}
 
 	dpu_kms->hw_intr = dpu_hw_intr_init(dpu_kms->mmio, dpu_kms->catalog);
@@ -1100,7 +1100,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		rc = PTR_ERR(dpu_kms->hw_intr);
 		DPU_ERROR("hw_intr init failed: %d\n", rc);
 		dpu_kms->hw_intr = NULL;
-		goto hw_intr_init_err;
+		goto err_pm_put;
 	}
 
 	dev->mode_config.min_width = 0;
@@ -1125,7 +1125,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	rc = _dpu_kms_drm_obj_init(dpu_kms);
 	if (rc) {
 		DPU_ERROR("modeset init failed: %d\n", rc);
-		goto drm_obj_init_err;
+		goto err_pm_put;
 	}
 
 	dpu_vbif_init_memtypes(dpu_kms);
@@ -1134,10 +1134,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 
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

