Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0E4573607A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 02:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbjFTAJC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 20:09:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbjFTAI7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 20:08:59 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 766E01BE
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 17:08:57 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b44eddb52dso56864451fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 17:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687219736; x=1689811736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N1f0epuyrcv1RU1D8RCL1bTxQUfmJgIbJdamZcHM4z8=;
        b=h6hlO0G9tD6bqU7iekDSCKAx9/wyz6s77b6sRDkLrpvqmOsu9az91XMbCqqk87UTo5
         C9gBF8CDox+iJUrLHpfp3xKhgPJb9hDlSD8+dpbx3T7/+daz/nZskjjso1sqy1oVotb5
         svLHoH+E5sw9CEopUkVkt9mwlh25Oj0+lCJ+ayokIfQwxDV8eUU0t3Kno2mxc7qakXLY
         sA4+qt9/XhfrOUwMwHLikijkeoiYa4CR9CJ/dvm1zqeUGIlZpbLd4DEJ0E7eE+kFYZyV
         WMgF3H9J8dvtUSF8cNKdLrl1af/B9PD+AuNQ/0NNtizHLGGDmNAhLDzygiAigsktvWD6
         P6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687219736; x=1689811736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N1f0epuyrcv1RU1D8RCL1bTxQUfmJgIbJdamZcHM4z8=;
        b=X89A2et3NI3b3deGHN3d6crBTyXCiorbrBdb6cb4w+F0FPUXzJse3+s4mY51WMFmmJ
         LSfEF31/RiMsRhStQ3bKPxhXTlTOjmjcXIE/Ciq9HhzRJrSDNkEdKxp4tNSVDSfCZpY7
         YhI+oVspZaL+SLEi6XWBbks6wRUIcpIRkL+oXMqeBVAflxu7gCP/pq2HI8m+ISTGoTnY
         yP4HcGe3aJNYgC6rMbEzC4wWmMb5ffeNZfhmFfO1IUwdGSp5LSEfZ2wghp2X/8yCp+dU
         X0DA7h8TFA9AHrjPJ2pLlz94JlE680rURNMfHCx/K9HZLaQg95j5hnULZHZG+P3p4hoA
         UKOw==
X-Gm-Message-State: AC+VfDzRIE4IvcQRec5YSH9bWsBEO3n8wqodfHoMZlJZVMuTpOwrB4fW
        VP8MtOjbFz9mKBsyaZw5lcMSEg==
X-Google-Smtp-Source: ACHHUZ5AngE0yN0H7zTFD5kCQVRdEsKWzyybqGju1ZIWmz4QWQcDoWXxmHGzfQcPG7SKy73OKHapTg==
X-Received: by 2002:a19:434b:0:b0:4f1:477c:f8a9 with SMTP id m11-20020a19434b000000b004f1477cf8a9mr5355270lfj.65.1687219735827;
        Mon, 19 Jun 2023 17:08:55 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a6-20020a056512020600b004f869e46fd4sm128815lfo.100.2023.06.19.17.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 17:08:55 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 7/8] drm/msm/dpu: drop dpu_core_perf_destroy()
Date:   Tue, 20 Jun 2023 03:08:45 +0300
Message-Id: <20230620000846.946925-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
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

This function does nothing, just clears several data pointers. Drop it
now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 12 ------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  6 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  1 -
 3 files changed, 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 78a7e3ea27a4..f779ad544347 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -394,18 +394,6 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
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
-	perf->core_clk = NULL;
-	perf->dev = NULL;
-}
-
 int dpu_core_perf_init(struct dpu_core_perf *perf,
 		struct drm_device *dev,
 		const struct dpu_perf_cfg *perf_cfg,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index e8a7916b6f71..e1198c104b5e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -69,12 +69,6 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
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
index 6e62606e32de..4439147d2c35 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1162,7 +1162,6 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	return 0;
 
 drm_obj_init_err:
-	dpu_core_perf_destroy(&dpu_kms->perf);
 hw_intr_init_err:
 perf_err:
 power_error:
-- 
2.39.2

