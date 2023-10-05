Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0F667BABF0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Oct 2023 23:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230140AbjJEV1N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Oct 2023 17:27:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbjJEV1L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Oct 2023 17:27:11 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F9C7DE
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Oct 2023 14:27:09 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-505a62d24b9so1786814e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Oct 2023 14:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696541228; x=1697146028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h01w8L/kilJV1fo82p5qpWiI1oIXkPC5GnMBarPktWU=;
        b=GyCYZL2cmVBhr+d0o2h/zLoMLgxEmm8TYwAijFROAOo9HSIm/38a9BTNWtIP8iEMli
         WhxB6uuqYJize97MdYhKSt8zgzM7JSqGgijn2WTbrkg/pwRyTmmyLPr2iX84L/rgaD96
         3i+r9jV9VO8dC05nMkXMC9JQ4CmqLxqZ3yoeVLTjTVAjmB3Iq59Ew67MGqSRvzsrtBVg
         0ltt3TzqOV1ogpabpdN2BSDNp3CW4+m5Ok0RZk+B9jJnJCdlogr0/q7aTzbqkn9bH4Ox
         mRvmOmCppORoS+U4OzC4gAbbktCCmYg85jcOCdOpdZIoBI2Q5Ib/art+kCJDlcMok+Hq
         l2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696541228; x=1697146028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h01w8L/kilJV1fo82p5qpWiI1oIXkPC5GnMBarPktWU=;
        b=g7bs/9wJ/7f/EZYH7JB6FjXG8nAS3jhjd/uh2oN77YECxSteRPIGEL5v9Tfrhxkrko
         4HDEPUYNE0Xj4bMHMlzFjwkH6UuRwDQtCIjH5BxH1BJdoIMr9a0aLSXrcnk0WoMRwrMQ
         X9Zzth6aLXAXR/7Oc7k+ir5UOYqGkGdKyfWTwNZsKOWcawcrCt+a+8zjCw0BQBq8VMxM
         RzVnzKUU27uDXxKGA/DqcVbh2XnEvqHfh368zzRyk9TXzSIgVX81kapXbJcHEpUdwPO4
         6k9wuNcf9uU+1MHrGDzsOBBGLK8o1ipiL5laX6KPgLmMptbTdxZ122XJWL63L/oXuw3J
         E3gA==
X-Gm-Message-State: AOJu0YwyUH/n/4QqfcgRTtT2Fs95Ki3iBDl8Ee1Nxi/+o/a4KKW2tus+
        VxNWs+orqK8u/kwQfNmgjkjgeg==
X-Google-Smtp-Source: AGHT+IGAdvN9QQxRArkdaOKhCmAufm6JJbElfOTnjbteVMx94jXyqSERjmVJ0HNTX+6TyHmktiZLoQ==
X-Received: by 2002:ac2:4141:0:b0:505:6fcd:dc46 with SMTP id c1-20020ac24141000000b005056fcddc46mr5361460lfi.13.1696541227809;
        Thu, 05 Oct 2023 14:27:07 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a6-20020a19f806000000b00500b3157ec6sm8435lff.143.2023.10.05.14.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 14:27:07 -0700 (PDT)
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
Subject: [PATCH v5 05/10] drm/msm/dpu: drop the `smart_dma_priority' field from struct dpu_sspp_sub_blks
Date:   Fri,  6 Oct 2023 00:26:58 +0300
Message-Id: <20231005212703.2400237-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231005212703.2400237-1-dmitry.baryshkov@linaro.org>
References: <20231005212703.2400237-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In preparation to deduplicating SSPP subblocks, drop the (unused)
`smart_dma_priority' field from struct dpu_sspp_sub_blks. If it is
needed later (e.g. for SmartDMA v1), it should be added to the SSPP
declarations themselves.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
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

