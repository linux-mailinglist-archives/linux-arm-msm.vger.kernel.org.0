Return-Path: <linux-arm-msm+bounces-3001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8C18017EA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 00:42:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8305C1F210A5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 23:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC3353F8C3;
	Fri,  1 Dec 2023 23:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WtB8wuSu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E62931B4
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 15:42:41 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-50be03cc8a3so911218e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 15:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701474160; x=1702078960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXPYHp8joPrN0buAd69zkV0LOa0gHcNZFVl2YQIZUXg=;
        b=WtB8wuSu5DcFDvQDbjozSyhSxrq5fTJXsgYnGC6d8vuMSovR+RiBhCdhBhr8JsR/mH
         hU6BuQAmdBqXRZ4aAeFBMlPQEblW/GZr1kmZ62BGF1kCbDoo5XHUTAVjacpWAcdvqHRa
         m3r7YolSGCYA+cMwaaeiIy82pShlOMb3Th/qrHyM2iYxwLxHoUfPUttzAUoxYFX9/K84
         Ic4FTy9WXfxmte3h3oUmYJs8jlWgA8zuH+VNQV3a4h1V5VZkamV3z5cHxYgqZG43EZwp
         X1O9vEsSxXduahxCiLcpf+qcyj80GqWWgfQou2bpSO8iOfwKxTPE0oALy/ChcEEhnS+U
         2KaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701474160; x=1702078960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HXPYHp8joPrN0buAd69zkV0LOa0gHcNZFVl2YQIZUXg=;
        b=GdDQzxHhCVd61Hy9P+RLJrP9CCCK0JbLHyHh8ahEXmvBMRY7C9Oh4ti8VxF1PLO14Q
         vd8EFpVe6u8m7HOZjJ1Z/eK9lV4kL/v/cXrTnV5LOKI5JrQf/fpjhhjLy1k5kKx9xkIP
         Q7UBVuw+w0DKROQ2AmvjkrAK+Uu//yKVBk0kCNrAn6zlbTdD2kQNsJ6Jl2ZZcQSuchW6
         7OheRVStDuWxBU5kLZs4uL4uhvzNiR6W7pPvAYnSAVRAF0GwitTt1zjGdgA91ctvvsoM
         yWRN3nCbXVv8zgKrxPCelXhM/OGgTfjpnxVWc921sPaPJCtHbxkg/gJSFUu0oQ57vZUe
         Kw9g==
X-Gm-Message-State: AOJu0Yx4rHU79iqsEKx9mfDR78BYl7sYnCCUZdXjivqh6qUBkCpZK0qk
	Ceu4zCX/cYCrCWicpv2p2kLOag==
X-Google-Smtp-Source: AGHT+IHhAuxsl0fgaG7xAEVyyzTLMxhHn5Az+GkdWjPAalbDPxA5ACvlb7u/GrzbAmuHtlq3xeyFFA==
X-Received: by 2002:a05:6512:ba8:b0:50b:e153:a6c9 with SMTP id b40-20020a0565120ba800b0050be153a6c9mr609360lfv.62.1701474160289;
        Fri, 01 Dec 2023 15:42:40 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id m14-20020a056512358e00b0050803043fc6sm554248lfr.265.2023.12.01.15.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 15:42:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v7 05/10] drm/msm/dpu: drop the `smart_dma_priority' field from struct dpu_sspp_sub_blks
Date: Sat,  2 Dec 2023 01:40:29 +0200
Message-ID: <20231201234234.2065610-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231201234234.2065610-1-dmitry.baryshkov@linaro.org>
References: <20231201234234.2065610-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
index eb9dfdcf610e..4179174ee4ee 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -252,11 +252,10 @@ static const uint32_t wb2_formats[] = {
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
@@ -269,11 +268,10 @@ static const uint32_t wb2_formats[] = {
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
@@ -286,11 +284,10 @@ static const uint32_t wb2_formats[] = {
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
@@ -298,17 +295,13 @@ static const uint32_t wb2_formats[] = {
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
@@ -317,107 +310,82 @@ static const struct dpu_rotation_cfg dpu_rot_sc7280_cfg_v2 = {
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
index 3cf7d316b475..b2a9b2cf2c05 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -368,7 +368,6 @@ struct dpu_caps {
  * common: Pointer to common configurations shared by sub blocks
  * @maxdwnscale: max downscale ratio supported(without DECIMATION)
  * @maxupscale:  maxupscale ratio supported
- * @smart_dma_priority: hw priority of rect1 of multirect pipe
  * @max_per_pipe_bw: maximum allowable bandwidth of this pipe in kBps
  * @qseed_ver: qseed version
  * @scaler_blk:
@@ -382,7 +381,6 @@ struct dpu_caps {
 struct dpu_sspp_sub_blks {
 	u32 maxdwnscale;
 	u32 maxupscale;
-	u32 smart_dma_priority;
 	u32 max_per_pipe_bw;
 	u32 qseed_ver;
 	struct dpu_scaler_blk scaler_blk;
-- 
2.42.0


