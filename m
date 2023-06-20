Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8145773607B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 02:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbjFTAJD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 20:09:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbjFTAJA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 20:09:00 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 821AEE4A
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 17:08:58 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f870247d6aso2374005e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 17:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687219737; x=1689811737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9+33/Akyz646WCk+zNakB+A6BgRlH4AMlTc8/nb1Uiw=;
        b=mViB2xyscK9XvkiZe8et+ffPaojmjZnVgSiyod4kbVC/jfi56Msx70UGca6oaOB/FR
         2wqJTftRiIHtiZHrT4R+IZVP6Xih7HcGt+YiiqqYISzfUNNzXSx+y+qmhoh41ReWNnyq
         ptF06oiTB6zUNSTeBL6QiMHurRBFcFs1uBXufkBqcSYF6HENnzpVJp92I6Wu7UFK7zS/
         dgU/BP3JDtsh9epaT/wCacefdh60VuBlnbOJGQiZtaLZxS/H/wDHenbYsS0xypyMcqXu
         vhVVY3Olv9aq4U18FrmvLb12PZdeaIkASkoQgwKlkqTZzR1gB2Ta0RYpVcM17jQhW+uL
         PSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687219737; x=1689811737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9+33/Akyz646WCk+zNakB+A6BgRlH4AMlTc8/nb1Uiw=;
        b=keEFP+jwufjVatluoB43tC1iEYqm0EhiU3DylGBAMSFcQPm7Azy56i3oSPSDByTB4w
         uGzqeCpWLJYawTydnIyawk+X3079RONaKcaGJi5hfFTxQyTDrAmkId+t9CEEyGJmYEnq
         vQ0hZorCqgevtszMZLt3V7ilTtibgd0JMwsOB9FHyIA9w0Utzcvz7VoQtkTbC3sSND05
         RyIDesphVDSgQMrvE9beGW0gWM2N8jVzL0sQHua423kb2wblU/7LXFmZT/zgTpxfI3tT
         zAUTpXRa3FOsSvuqCCBtzz9AHvkaB4monm2r1fmucxPofp+zsECrR1viGsLGLdHhwzOu
         mniA==
X-Gm-Message-State: AC+VfDz+fG7JZETEPIjbmrG+3z0XIAKIO2QZXA4URet9Ugs8Dvh5+u45
        FGFcpIYjMN61JI9Y9jdmR+Fl7w==
X-Google-Smtp-Source: ACHHUZ7+MHKGzjjUh8q06D4T/v/Z2RLXhkVs/d7Oy3VT82VSGELeoh4tOCrfFU/4XXfrlzAkLPbcug==
X-Received: by 2002:a19:644e:0:b0:4e9:9e45:3470 with SMTP id b14-20020a19644e000000b004e99e453470mr6766655lfj.3.1687219736953;
        Mon, 19 Jun 2023 17:08:56 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a6-20020a056512020600b004f869e46fd4sm128815lfo.100.2023.06.19.17.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 17:08:56 -0700 (PDT)
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
Subject: [PATCH 8/8] drm/msm/dpu: remove unused fields from struct dpu_core_perf
Date:   Tue, 20 Jun 2023 03:08:46 +0300
Message-Id: <20230620000846.946925-9-dmitry.baryshkov@linaro.org>
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

Remove dpu_core_perf::dev and dpu_core_perf::debugfs_root fields, they
are not used by the code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 2 +-
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index f779ad544347..7f110d15b101 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -395,11 +395,9 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 #endif
 
 int dpu_core_perf_init(struct dpu_core_perf *perf,
-		struct drm_device *dev,
 		const struct dpu_perf_cfg *perf_cfg,
 		struct clk *core_clk)
 {
-	perf->dev = dev;
 	perf->perf_cfg = perf_cfg;
 	perf->core_clk = core_clk;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index e1198c104b5e..623e2d058695 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -27,7 +27,6 @@ struct dpu_core_perf_params {
 /**
  * struct dpu_core_perf - definition of core performance context
  * @dev: Pointer to drm device
- * @debugfs_root: top level debug folder
  * @perf_cfg: Platform-specific performance configuration
  * @core_clk: Pointer to the core clock
  * @core_clk_rate: current core clock rate
@@ -36,8 +35,6 @@ struct dpu_core_perf_params {
  * @enable_bw_release: debug control for bandwidth release
  */
 struct dpu_core_perf {
-	struct drm_device *dev;
-	struct dentry *debugfs_root;
 	const struct dpu_perf_cfg *perf_cfg;
 	struct clk *core_clk;
 	u64 core_clk_rate;
@@ -77,7 +74,6 @@ void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc);
  * @core_clk: pointer to core clock
  */
 int dpu_core_perf_init(struct dpu_core_perf *perf,
-		struct drm_device *dev,
 		const struct dpu_perf_cfg *perf_cfg,
 		struct clk *core_clk);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 4439147d2c35..5297cec68c9c 100644
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

