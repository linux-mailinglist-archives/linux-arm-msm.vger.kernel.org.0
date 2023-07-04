Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 723087474D2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 17:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231483AbjGDPEL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jul 2023 11:04:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231615AbjGDPEJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jul 2023 11:04:09 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BEB510CA
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 08:04:08 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b5c2433134so71909521fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 08:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688483046; x=1691075046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3xZk5vPk29uIzS1RfjK4BQWFnQ4bvdjXpPHBXHvz4II=;
        b=NYmiUxpvSBe4mTOK8eLkgFsavb3DP2IC2R4Qi1euCOF3BQjEU+n02DzCTCerxqyiKc
         axiNoOfGlOwEwEh7j4LoM0FEl8qRwQj9E1ngesL1BlJAqVpG3Zfo9cEHyhYpgDBx6nEk
         Er6HTxocnXgjch+Fx8VeT6mBmxjveQ9m0ST7bEq/bvLaAzx+EwJaZbSgbgLVbXJoLn+Z
         NQru2E4W+9Xi2j9e4AVhZnsOqJZ3oi0oas11lMWTXItbQlxf8z2rTdGtGLHT7kUwtXc9
         FCO/fx7dsyKoZH2AtdevK9UuLLt5PophfiFO10Styur0sAl8JvpqLSmah3K8cyZAarnT
         aIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688483046; x=1691075046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3xZk5vPk29uIzS1RfjK4BQWFnQ4bvdjXpPHBXHvz4II=;
        b=iuLBbOLRcRmRN/2GOYjy2SX/5QybvoaHdFLgPhVTCob3Hbsedhy33Ua8Ca3e3y0tU7
         gCyiUg2s662KMU0wXP3SSi4k8bDTObCdEc1026AgRVilS6qDD189OoCaAdI7fCMdlUoI
         V3ghV+YfmvHDutNTKzIQvbXgTEwxQpDmylQfUPtH23MW6p+3+rS6iO87if1Z0nih+Qw2
         tong3EAcKnrBLXoRVZhXoIfvOjYQzjh22Zv8oU0j/WJI03qfPhL3p9aozrwNwfNDfp3B
         5FoBxRG6IdxGALNiI0X+bA01qOVyo+NpyKFR5Xd/xYdEhzJcU3sCS6cZdM4OXJFtlNqG
         yy/g==
X-Gm-Message-State: ABy/qLbfPrb8bvEVNJESWHy3exv5skiZXRkLoeWrTtalnWtTsirYylhx
        cqF+duL1cU/e1UNiMipgmjPoSA==
X-Google-Smtp-Source: APBJJlGlVAmws/zMk7QPQqjvFWIeZD/9Vb6AMtK23TVaTRNSUSWpkJJOJAyRpJOGtp+pssjCwgW/Pg==
X-Received: by 2002:a2e:8951:0:b0:2b5:8b02:1000 with SMTP id b17-20020a2e8951000000b002b58b021000mr5575166ljk.8.1688483046494;
        Tue, 04 Jul 2023 08:04:06 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j10-20020a2e850a000000b002b6ca539d92sm3337354lji.138.2023.07.04.08.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:04:06 -0700 (PDT)
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
Subject: [PATCH v2 14/14] drm/msm/dpu: drop dpu_core_perf_destroy()
Date:   Tue,  4 Jul 2023 18:03:54 +0300
Message-Id: <20230704150354.159882-15-dmitry.baryshkov@linaro.org>
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

This function does nothing, just clears several data pointers. Drop it
now.

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 10 ----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  6 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  1 -
 3 files changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 608c915a2cab..4b8127932e13 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -408,16 +408,6 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
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
index df1fcf28f2a9..a5a9c3389718 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -66,12 +66,6 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
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
index f01b2278c01a..44b0daf70c4e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1171,7 +1171,6 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	return 0;
 
 drm_obj_init_err:
-	dpu_core_perf_destroy(&dpu_kms->perf);
 hw_intr_init_err:
 perf_err:
 power_error:
-- 
2.39.2

