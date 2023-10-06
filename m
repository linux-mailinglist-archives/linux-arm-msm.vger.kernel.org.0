Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91CEE7BB8B4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Oct 2023 15:14:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232323AbjJFNO6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Oct 2023 09:14:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232311AbjJFNO5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Oct 2023 09:14:57 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 751B99E
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Oct 2023 06:14:55 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-503056c8195so2757923e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Oct 2023 06:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696598094; x=1697202894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+EjvI1wyeZrkzbT5judqb3tmkNP0yx0O7nDncad6txg=;
        b=X5R4CkJHpiImT4GlT3rSybLFni7i0LoyaB9+9l9D6yFgCURqu2GaPwQn2oRN2RNq19
         6tzJDqlzgdDp6kTnLPGUHrntTCtQmWTrcIoDQVzByIXc6TDBxfS3mhJr9rauvnJRT3nk
         w0LilLQNKSh/lNGIWYrYcK69kpmSiEUorZvo3nG1ue3t/e0zHXpckuyCqi3V0qxX3khF
         NiLxIwiERwk3douD+pFxVJI9cEtHXje205PrJ5bGsfX0cT1B5aAJxO1hBIdtYoC7l1/e
         PNOFF6OglnDmMpEVTyH41QBiL0MiLShHhppItk625GMLftSOk6Yi1tpSjHdQttOh9OaE
         Wq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696598094; x=1697202894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+EjvI1wyeZrkzbT5judqb3tmkNP0yx0O7nDncad6txg=;
        b=ELsaSWkTFiMavN9vefS7HvYnT63gNqpdhWNuWnjL/fgQM/MGjYezMpzL/Tz+PZYQH+
         GtUCzwt8gHyynJIb4zAwA0zSkO24mUeaZly3BYlC+ZSHgPm7u7ZVdXvwUG0qjqkxRZhi
         30F70Ms7iBTn1CCbwiM+l7VVCLyMt4ZvHkXAi00kSeanYPr65mTE/CLBG6qn9q7ax9kS
         kS88jAuOgjzQIdLumU8+9xQ9U8XZ3t7M58DxuuTRlkLrbe9OsjXXjUqd9mwBX/LoqvIT
         n0GFlfzfNiMQcN7Fr2krQUfkVzCy6PDZuuzhALqncjq4ov8hHeMVgd6HFTSNOpXq6Xtf
         E7cA==
X-Gm-Message-State: AOJu0Yywaw+B2nmfB38c6IWOS5WxTqH9bnZGxn67BVxRvSQekvFsezxY
        NJdIpZrx8Ae4hc+6TXrs4D6sqQ==
X-Google-Smtp-Source: AGHT+IHHznfuyGZG5syOhRWm43mGZCXfOUe3tfZYraSO9vzH7u2OekNMVIgeJSff/N7tzj1kU7FTsQ==
X-Received: by 2002:ac2:4f82:0:b0:4fe:2f8a:457e with SMTP id z2-20020ac24f82000000b004fe2f8a457emr6171467lfs.43.1696598093796;
        Fri, 06 Oct 2023 06:14:53 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g9-20020a19ee09000000b004fbb011c9bcsm301285lfb.161.2023.10.06.06.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 06:14:53 -0700 (PDT)
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
Subject: [PATCH v6 02/10] drm/msm/dpu: Drop unused get_scaler_ver callback from SSPP
Date:   Fri,  6 Oct 2023 16:14:42 +0300
Message-Id: <20231006131450.2436688-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231006131450.2436688-1-dmitry.baryshkov@linaro.org>
References: <20231006131450.2436688-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Marijn Suijten <marijn.suijten@somainline.org>

This pointer callback is never used and should be removed.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
[DB: dropped the helpers completely, which are unused now]
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 13 +------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  6 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c |  6 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  3 ---
 4 files changed, 1 insertion(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index f2192de93713..7e9c87088e17 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -394,15 +394,6 @@ static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
 			format);
 }
 
-static u32 _dpu_hw_sspp_get_scaler3_ver(struct dpu_hw_sspp *ctx)
-{
-	if (!ctx)
-		return 0;
-
-	return dpu_hw_get_scaler3_ver(&ctx->hw,
-				      ctx->cap->sblk->scaler_blk.base);
-}
-
 /*
  * dpu_hw_sspp_setup_rects()
  */
@@ -605,10 +596,8 @@ static void _setup_layer_ops(struct dpu_hw_sspp *c,
 
 	if (test_bit(DPU_SSPP_SCALER_QSEED3, &features) ||
 			test_bit(DPU_SSPP_SCALER_QSEED3LITE, &features) ||
-			test_bit(DPU_SSPP_SCALER_QSEED4, &features)) {
+			test_bit(DPU_SSPP_SCALER_QSEED4, &features))
 		c->ops.setup_scaler = _dpu_hw_sspp_setup_scaler3;
-		c->ops.get_scaler_ver = _dpu_hw_sspp_get_scaler3_ver;
-	}
 
 	if (test_bit(DPU_SSPP_CDP, &features))
 		c->ops.setup_cdp = dpu_hw_sspp_setup_cdp;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index cbf4f95ff0fd..ca02f86c94ed 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -288,12 +288,6 @@ struct dpu_hw_sspp_ops {
 		struct dpu_hw_scaler3_cfg *scaler3_cfg,
 		const struct dpu_format *format);
 
-	/**
-	 * get_scaler_ver - get scaler h/w version
-	 * @ctx: Pointer to pipe context
-	 */
-	u32 (*get_scaler_ver)(struct dpu_hw_sspp *ctx);
-
 	/**
 	 * setup_cdp - setup client driven prefetch
 	 * @pipe: Pointer to software pipe context
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
index 9d2273fd2fed..af4fb54f3c5d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
@@ -381,12 +381,6 @@ void dpu_hw_setup_scaler3(struct dpu_hw_blk_reg_map *c,
 	DPU_REG_WRITE(c, QSEED3_OP_MODE + scaler_offset, op_mode);
 }
 
-u32 dpu_hw_get_scaler3_ver(struct dpu_hw_blk_reg_map *c,
-			u32 scaler_offset)
-{
-	return DPU_REG_READ(c, QSEED3_HW_VERSION + scaler_offset);
-}
-
 void dpu_hw_csc_setup(struct dpu_hw_blk_reg_map *c,
 		u32 csc_reg_off,
 		const struct dpu_csc_cfg *data, bool csc10)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index 1f6079f47071..689d06c7d740 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -340,9 +340,6 @@ void dpu_hw_setup_scaler3(struct dpu_hw_blk_reg_map *c,
 		u32 scaler_offset, u32 scaler_version,
 		const struct dpu_format *format);
 
-u32 dpu_hw_get_scaler3_ver(struct dpu_hw_blk_reg_map *c,
-		u32 scaler_offset);
-
 void dpu_hw_csc_setup(struct dpu_hw_blk_reg_map  *c,
 		u32 csc_reg_off,
 		const struct dpu_csc_cfg *data, bool csc10);
-- 
2.39.2

