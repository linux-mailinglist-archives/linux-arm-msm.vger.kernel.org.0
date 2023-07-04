Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E5DB7474CC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 17:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231585AbjGDPEI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jul 2023 11:04:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231613AbjGDPEH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jul 2023 11:04:07 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0B7710CF
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 08:04:05 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b69f216c73so84789311fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 08:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688483044; x=1691075044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFGHfGqaywYGdFojOEDzLMab/0n9ifuE6031kMHcPH8=;
        b=V5WVR8U5s3n3OPkS+P+dn55gCnC04keNoIO8kQa85f5uLPR/IiUTQR2plVQvoum1kK
         YoeNtW7hFRnoDj82NuDNEtONdbQ7xVyXYtDUZYJQc3VSe9W5GqZeI1h8RSrp5//SNGAy
         j1puIcBWvKSSQVp94qnQxvh6f2b54EVVljAU0+GZDFWI7QD1TG57XGpgP7dMxBC/PeLs
         uuocNALJCjiKpnGRulDxsDJI2MELxs9lScOe2OP+V34xuActiha/Icgh2AIs/135D5C/
         aQb7KXrK7hyb2kOiPW976Ls2u5hMoBdlawwPDS7Vzi1IxeRIbSiILIb24r3SBnnw9Lws
         SCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688483044; x=1691075044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jFGHfGqaywYGdFojOEDzLMab/0n9ifuE6031kMHcPH8=;
        b=fIFCYeXH0V+KU1Tf9SLlBQvtYsNzsu17OzlJPcjtol3i/cipUXv1Tbl70VpCh0HrMx
         27lHrBdWJxxGvjmj1Zt5O99TIRwwb5WGuVOE+lTGfoEI85YKnDwH8e6Zo5nRma3+/hHN
         uN69E4aAGfgYjTDgpghbNGJkidW2F8XBuBy75+UXDvG90lBLVEiIvle9w3Dwgos7qOK0
         fM2ZksO/h6mtjfsuGP4WqzbY66pHu5S3e//sxJz7pmhEGqtWPzGM+ezS6Y12jL4BKlcB
         ASRKn1kxJb1oN/YeAH6t/oxyCbPoJOgxC5fa6xVMKFFITO9kWQGBpev8wzTMD7+oILzA
         KgHg==
X-Gm-Message-State: ABy/qLYqc95gRyRriAcSdL3clgD0XETC99ZkRoVHLY72Q0xGvdgMSX/W
        Gv8vbl6esr6XQrJpAdL6DC+z4Q==
X-Google-Smtp-Source: APBJJlGyFBB6rzGAJ29n1eMGAYBz7q2UVklYzmzs4swgrVmk+tbs0tUIRlQlifOGLx+jJFTsKrhj4Q==
X-Received: by 2002:a2e:7008:0:b0:2b6:d48a:5dc3 with SMTP id l8-20020a2e7008000000b002b6d48a5dc3mr8755908ljc.39.1688483044226;
        Tue, 04 Jul 2023 08:04:04 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j10-20020a2e850a000000b002b6ca539d92sm3337354lji.138.2023.07.04.08.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:04:03 -0700 (PDT)
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
Subject: [PATCH v2 11/14] drm/msm/dpu: remove unused fields from struct dpu_core_perf
Date:   Tue,  4 Jul 2023 18:03:51 +0300
Message-Id: <20230704150354.159882-12-dmitry.baryshkov@linaro.org>
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

Remove dpu_core_perf::dev and dpu_core_perf::debugfs_root fields, they
are not used by the code.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 6 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 2 +-
 3 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index e9c7d398d9cb..906611f6b879 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -419,15 +419,12 @@ void dpu_core_perf_destroy(struct dpu_core_perf *perf)
 
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
index 4490120d11d4..7c5142aca4ee 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -26,8 +26,6 @@ struct dpu_core_perf_params {
 
 /**
  * struct dpu_core_perf - definition of core performance context
- * @dev: Pointer to drm device
- * @debugfs_root: top level debug folder
  * @perf_cfg: Platform-specific performance configuration
  * @core_clk: Pointer to the core clock
  * @core_clk_rate: current core clock rate
@@ -38,8 +36,6 @@ struct dpu_core_perf_params {
  * @fix_core_ab_vote: fixed core ab vote in bps used in mode 2
  */
 struct dpu_core_perf {
-	struct drm_device *dev;
-	struct dentry *debugfs_root;
 	const struct dpu_perf_cfg *perf_cfg;
 	struct clk *core_clk;
 	u64 core_clk_rate;
@@ -83,12 +79,10 @@ void dpu_core_perf_destroy(struct dpu_core_perf *perf);
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
index 6e62606e32de..631b6b679bae 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1115,7 +1115,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		dpu_kms->hw_vbif[vbif->id] = hw;
 	}
 
-	rc = dpu_core_perf_init(&dpu_kms->perf, dev, dpu_kms->catalog->perf,
+	rc = dpu_core_perf_init(&dpu_kms->perf, dpu_kms->catalog->perf,
 			msm_clk_bulk_get_clock(dpu_kms->clocks, dpu_kms->num_clocks, "core"));
 	if (rc) {
 		DPU_ERROR("failed to init perf %d\n", rc);
-- 
2.39.2

