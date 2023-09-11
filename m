Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E71D79B23F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 01:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbjIKXQy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Sep 2023 19:16:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350069AbjIKXMT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Sep 2023 19:12:19 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EC8593F7
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 15:22:17 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-401da71b85eso54506775e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 15:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694470856; x=1695075656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTOfPIF9LYdHpAxSH/XAFUroqjv5MWy5k+f01k9rwAA=;
        b=b9kL/x1OUbufDn7Y1hXHIF0ZWY/q4LgUxW1svLTARAMeq5C/2uVGVAHzmgjejvlSe1
         W4RZAMB/11lpICH2yDovpvIQ2avKBlLNLwguxFXe9hYbdDQJYNgsDz0kv/K6xWAdwPmL
         kdbdimKCKYHMdw7Rilf1wdpY4xM02ASqqTc7YAIJyz//2csARTP26vAqVJvZY8jRQl/H
         R9dF+0i+GP6EXgM/FQbWv5g1HGJ2FWo12T8MlesUTmyXmY0XO0U44jh4Vivpe9XktH+W
         IJJGtTdQv4tVdxsDQ8lrMRXONDLmzBAETHqtPy7xZVr/tQ0aFOPXXZYPpIOCgCIm0MfQ
         4zdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694470856; x=1695075656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xTOfPIF9LYdHpAxSH/XAFUroqjv5MWy5k+f01k9rwAA=;
        b=PM+45nUu45SHHJnw91d6b/7GC5dfVCwCkKDyA6ZqMuUKgffCmmtGtyK7uVsBsDLZ6w
         VtUeLQM8b1fZ+nQ1UcIi7SIna6GBP3bjhtcHlAnf1jWR2/KWFarkEdw+rBg93T19vPwx
         eD2U4hr/Tw4kl1XOMVNMk3U/4pdWZR8futPJ2W7A15JFC1hqxpDlFGqWRa0J2e0PpU1F
         +xFnlPzZCxs4Xs/priPeWqZ39Y2O2ocb+hH0OfU/HczmIo6Zjqd1CFvvnNybSul0xYW7
         a+cOMGTnXBiCMmCLV9xlAIKKBfOQ1aengXOtkqqm/5m0DFhncXW5JyY9nAAncsB13VVd
         tzhg==
X-Gm-Message-State: AOJu0Yze2f2jkSKxY2W+r88nPcC9lyxLahLu6IV7sCFgccCouBKkubPW
        k+SNKofn918QytK05y+F4ql4HDYfXNHUj0iuuRc=
X-Google-Smtp-Source: AGHT+IH6L6EO4AM5yWWLtSkl5v7ZE3u25hOZYrK7fN+XJdeB7s18jGU0WzJjjLStLkwWOrcwhy/qlg==
X-Received: by 2002:a05:6512:4007:b0:500:d970:6541 with SMTP id br7-20020a056512400700b00500d9706541mr10761061lfb.39.1694468726592;
        Mon, 11 Sep 2023 14:45:26 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b5-20020a0565120b8500b004ff9bfda9d6sm1168804lfv.212.2023.09.11.14.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 14:45:26 -0700 (PDT)
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
Subject: [PATCH v4 5/9] drm/msm/dpu: drop the `smart_dma_priority' field from struct dpu_sspp_sub_blks
Date:   Tue, 12 Sep 2023 00:45:17 +0300
Message-Id: <20230911214521.787453-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230911214521.787453-1-dmitry.baryshkov@linaro.org>
References: <20230911214521.787453-1-dmitry.baryshkov@linaro.org>
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

In preparation to deduplicating SSPP subblocks, drop the (unused)
`smart_dma_priority' field from struct dpu_sspp_sub_blks. If it is
needed later (e.g. for SmartDMA v1), it should be added to the SSPP
declarations themselves.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 112 +++++++-----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   2 -
 2 files changed, 40 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index ed7458991509..e9773274bdd6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -253,11 +253,10 @@ static const uint32_t wb2_formats[] = {
 #define SSPP_SCALER_VER(maj, min) (((maj) << 16) | (min))
 
 /* SSPP common configuration */
-#define _VIG_SBLK(sdma_pri, scaler_ver) \
+#define _VIG_SBLK(scaler_ver) \
 	{ \
 	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
 	.maxupscale = MAX_UPSCALE_RATIO, \
-	.smart_dma_priority = sdma_pri, \
 	.scaler_blk = {.name = "scaler", \
 		.version = scaler_ver, \
 		.base = 0xa00, .len = 0xa0,}, \
@@ -270,11 +269,10 @@ static const uint32_t wb2_formats[] = {
 	.rotation_cfg = NULL, \
 	}
 
-#define _VIG_SBLK_ROT(sdma_pri, scaler_ver, rot_cfg) \
+#define _VIG_SBLK_ROT(scaler_ver, rot_cfg) \
 	{ \
 	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
 	.maxupscale = MAX_UPSCALE_RATIO, \
-	.smart_dma_priority = sdma_pri, \
 	.scaler_blk = {.name = "scaler", \
 		.version = scaler_ver, \
 		.base = 0xa00, .len = 0xa0,}, \
@@ -287,11 +285,10 @@ static const uint32_t wb2_formats[] = {
 	.rotation_cfg = rot_cfg, \
 	}
 
-#define _DMA_SBLK(sdma_pri) \
+#define _DMA_SBLK() \
 	{ \
 	.maxdwnscale = SSPP_UNITY_SCALE, \
 	.maxupscale = SSPP_UNITY_SCALE, \
-	.smart_dma_priority = sdma_pri, \
 	.format_list = plane_formats, \
 	.num_formats = ARRAY_SIZE(plane_formats), \
 	.virt_format_list = plane_formats, \
@@ -299,17 +296,13 @@ static const uint32_t wb2_formats[] = {
 	}
 
 static const struct dpu_sspp_sub_blks msm8998_vig_sblk_0 =
-				_VIG_SBLK(0,
-					  SSPP_SCALER_VER(1, 2));
+				_VIG_SBLK(SSPP_SCALER_VER(1, 2));
 static const struct dpu_sspp_sub_blks msm8998_vig_sblk_1 =
-				_VIG_SBLK(0,
-					  SSPP_SCALER_VER(1, 2));
+				_VIG_SBLK(SSPP_SCALER_VER(1, 2));
 static const struct dpu_sspp_sub_blks msm8998_vig_sblk_2 =
-				_VIG_SBLK(0,
-					  SSPP_SCALER_VER(1, 2));
+				_VIG_SBLK(SSPP_SCALER_VER(1, 2));
 static const struct dpu_sspp_sub_blks msm8998_vig_sblk_3 =
-				_VIG_SBLK(0,
-					  SSPP_SCALER_VER(1, 2));
+				_VIG_SBLK(SSPP_SCALER_VER(1, 2));
 
 static const struct dpu_rotation_cfg dpu_rot_sc7280_cfg_v2 = {
 	.rot_maxheight = 1088,
@@ -318,107 +311,82 @@ static const struct dpu_rotation_cfg dpu_rot_sc7280_cfg_v2 = {
 };
 
 static const struct dpu_sspp_sub_blks sdm845_vig_sblk_0 =
-				_VIG_SBLK(5,
-					  SSPP_SCALER_VER(1, 3));
+				_VIG_SBLK(SSPP_SCALER_VER(1, 3));
 static const struct dpu_sspp_sub_blks sdm845_vig_sblk_1 =
-				_VIG_SBLK(6,
-					  SSPP_SCALER_VER(1, 3));
+				_VIG_SBLK(SSPP_SCALER_VER(1, 3));
 static const struct dpu_sspp_sub_blks sdm845_vig_sblk_2 =
-				_VIG_SBLK(7,
-					  SSPP_SCALER_VER(1, 3));
+				_VIG_SBLK(SSPP_SCALER_VER(1, 3));
 static const struct dpu_sspp_sub_blks sdm845_vig_sblk_3 =
-				_VIG_SBLK(8,
-					  SSPP_SCALER_VER(1, 3));
+				_VIG_SBLK(SSPP_SCALER_VER(1, 3));
 
 static const struct dpu_sspp_sub_blks sm8150_vig_sblk_0 =
-				_VIG_SBLK(5,
-					  SSPP_SCALER_VER(1, 4));
+				_VIG_SBLK(SSPP_SCALER_VER(1, 4));
 static const struct dpu_sspp_sub_blks sm8150_vig_sblk_1 =
-				_VIG_SBLK(6,
-					  SSPP_SCALER_VER(1, 4));
+				_VIG_SBLK(SSPP_SCALER_VER(1, 4));
 static const struct dpu_sspp_sub_blks sm8150_vig_sblk_2 =
-				_VIG_SBLK(7,
-					  SSPP_SCALER_VER(1, 4));
+				_VIG_SBLK(SSPP_SCALER_VER(1, 4));
 static const struct dpu_sspp_sub_blks sm8150_vig_sblk_3 =
-				_VIG_SBLK(8,
-					  SSPP_SCALER_VER(1, 4));
+				_VIG_SBLK(SSPP_SCALER_VER(1, 4));
 
-static const struct dpu_sspp_sub_blks sdm845_dma_sblk_0 = _DMA_SBLK(1);
-static const struct dpu_sspp_sub_blks sdm845_dma_sblk_1 = _DMA_SBLK(2);
-static const struct dpu_sspp_sub_blks sdm845_dma_sblk_2 = _DMA_SBLK(3);
-static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = _DMA_SBLK(4);
+static const struct dpu_sspp_sub_blks sdm845_dma_sblk_0 = _DMA_SBLK();
+static const struct dpu_sspp_sub_blks sdm845_dma_sblk_1 = _DMA_SBLK();
+static const struct dpu_sspp_sub_blks sdm845_dma_sblk_2 = _DMA_SBLK();
+static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = _DMA_SBLK();
 
 static const struct dpu_sspp_sub_blks sc7180_vig_sblk_0 =
-				_VIG_SBLK(4,
-					  SSPP_SCALER_VER(3, 0));
+				_VIG_SBLK(SSPP_SCALER_VER(3, 0));
 
 static const struct dpu_sspp_sub_blks sc7280_vig_sblk_0 =
-			_VIG_SBLK_ROT(4,
-				      SSPP_SCALER_VER(3, 0),
+			_VIG_SBLK_ROT(SSPP_SCALER_VER(3, 0),
 				      &dpu_rot_sc7280_cfg_v2);
 
 static const struct dpu_sspp_sub_blks sm6115_vig_sblk_0 =
-				_VIG_SBLK(2,
-					  SSPP_SCALER_VER(3, 0));
+				_VIG_SBLK(SSPP_SCALER_VER(3, 0));
 
 static const struct dpu_sspp_sub_blks sm6125_vig_sblk_0 =
-				_VIG_SBLK(3,
-					  SSPP_SCALER_VER(2, 4));
+				_VIG_SBLK(SSPP_SCALER_VER(2, 4));
 
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_0 =
-				_VIG_SBLK(5,
-					  SSPP_SCALER_VER(3, 0));
+				_VIG_SBLK(SSPP_SCALER_VER(3, 0));
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_1 =
-				_VIG_SBLK(6,
-					  SSPP_SCALER_VER(3, 0));
+				_VIG_SBLK(SSPP_SCALER_VER(3, 0));
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_2 =
-				_VIG_SBLK(7,
-					  SSPP_SCALER_VER(3, 0));
+				_VIG_SBLK(SSPP_SCALER_VER(3, 0));
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_3 =
-				_VIG_SBLK(8,
-					  SSPP_SCALER_VER(3, 0));
+				_VIG_SBLK(SSPP_SCALER_VER(3, 0));
 
 static const struct dpu_sspp_sub_blks sm8450_vig_sblk_0 =
-				_VIG_SBLK(5,
-					  SSPP_SCALER_VER(3, 1));
+				_VIG_SBLK(SSPP_SCALER_VER(3, 1));
 static const struct dpu_sspp_sub_blks sm8450_vig_sblk_1 =
-				_VIG_SBLK(6,
-					  SSPP_SCALER_VER(3, 1));
+				_VIG_SBLK(SSPP_SCALER_VER(3, 1));
 static const struct dpu_sspp_sub_blks sm8450_vig_sblk_2 =
-				_VIG_SBLK(7,
-					  SSPP_SCALER_VER(3, 1));
+				_VIG_SBLK(SSPP_SCALER_VER(3, 1));
 static const struct dpu_sspp_sub_blks sm8450_vig_sblk_3 =
-				_VIG_SBLK(8,
-					  SSPP_SCALER_VER(3, 1));
+				_VIG_SBLK(SSPP_SCALER_VER(3, 1));
 
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_0 =
-				_VIG_SBLK(7,
-					  SSPP_SCALER_VER(3, 2));
+				_VIG_SBLK(SSPP_SCALER_VER(3, 2));
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_1 =
-				_VIG_SBLK(8,
-					  SSPP_SCALER_VER(3, 2));
+				_VIG_SBLK(SSPP_SCALER_VER(3, 2));
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_2 =
-				_VIG_SBLK(9,
-					  SSPP_SCALER_VER(3, 2));
+				_VIG_SBLK(SSPP_SCALER_VER(3, 2));
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
-				_VIG_SBLK(10,
-					  SSPP_SCALER_VER(3, 2));
-static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK(5);
-static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK(6);
+				_VIG_SBLK(SSPP_SCALER_VER(3, 2));
+static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK();
+static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK();
 
-#define _VIG_SBLK_NOSCALE(sdma_pri) \
+#define _VIG_SBLK_NOSCALE() \
 	{ \
 	.maxdwnscale = SSPP_UNITY_SCALE, \
 	.maxupscale = SSPP_UNITY_SCALE, \
-	.smart_dma_priority = sdma_pri, \
 	.format_list = plane_formats_yuv, \
 	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
 	.virt_format_list = plane_formats, \
 	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	}
 
-static const struct dpu_sspp_sub_blks qcm2290_vig_sblk_0 = _VIG_SBLK_NOSCALE(2);
-static const struct dpu_sspp_sub_blks qcm2290_dma_sblk_0 = _DMA_SBLK(1);
+static const struct dpu_sspp_sub_blks qcm2290_vig_sblk_0 = _VIG_SBLK_NOSCALE();
+static const struct dpu_sspp_sub_blks qcm2290_dma_sblk_0 = _DMA_SBLK();
 
 /*************************************************************
  * MIXER sub blocks config
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index c47969ba7ed5..19ab36ae6765 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -372,7 +372,6 @@ struct dpu_caps {
  * common: Pointer to common configurations shared by sub blocks
  * @maxdwnscale: max downscale ratio supported(without DECIMATION)
  * @maxupscale:  maxupscale ratio supported
- * @smart_dma_priority: hw priority of rect1 of multirect pipe
  * @max_per_pipe_bw: maximum allowable bandwidth of this pipe in kBps
  * @qseed_ver: qseed version
  * @scaler_blk:
@@ -386,7 +385,6 @@ struct dpu_caps {
 struct dpu_sspp_sub_blks {
 	u32 maxdwnscale;
 	u32 maxupscale;
-	u32 smart_dma_priority;
 	u32 max_per_pipe_bw;
 	u32 qseed_ver;
 	struct dpu_scaler_blk scaler_blk;
-- 
2.39.2

