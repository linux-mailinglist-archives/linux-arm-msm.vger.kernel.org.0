Return-Path: <linux-arm-msm+bounces-3039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BCE801EBA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 22:40:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5013F281064
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 21:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9723022310;
	Sat,  2 Dec 2023 21:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ft71GJQx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3857FE8
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Dec 2023 13:40:23 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50bc4fe8158so4699652e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Dec 2023 13:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701553221; x=1702158021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tirbLVRWLbCAowB38PQvXffjvU5Mrx5S3hKLHOtczZo=;
        b=Ft71GJQx0r29J4GV1L2u1FKY7fRyHt7JYMer8K8huqsrGdNIxJaV2oiVzMlB8CsIr1
         TbanzwAvMiXzj9yq7eWHeMTC91JPZDXUOz++ivQCS8OA2A11MWdaxvhFKVM1Ab36EyMx
         81o5M2e7Q6h6/YRKfuYdvMd1cOM5p66RIqadYOgJoWrfbxRCZCMbmUE3Gvoi+BnznsBS
         j3rTGFHDRji+KniUm1yIszlNo7EH6/EcyDlr3xlyByRpIUTe4Jy+TpGJvR+/ceshKGqP
         X7VwXU+e6xRE+J0G0ethkozsa7G3h3IMjQeDje39Ikx6GVfA1ZbpJCeH+1nw/hzcY56j
         G8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701553221; x=1702158021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tirbLVRWLbCAowB38PQvXffjvU5Mrx5S3hKLHOtczZo=;
        b=DuHHZpnuHY2DcE49j7qyF5h6uaxyrl5c+3XvYvLsj1H2CoDhKg7MBt0AzaN43fvRMr
         AkPrVKufzGsJQCbE5s+l05MB+xaBNq8r6rcgTwKDfJY9pRDXaZi6zyTcasLm2PcMBA9w
         fRgWE36gD1hx0LszNtxL7LF48uU0hKoblQDjkzq2IOb87X0VoVpmr+jujJJ/jnkVtpMA
         tqBfBvDhYh5WS2Lahm/S9G8BGF9Mppu5afBtk4wMTz2akuxhZXe7j9WD7SWcplMoLJwH
         RHiuufuW3RbnU3SUozhR7sem/3TCVFKsmqrGaX/GdX3uXPCpgcpqtLztQQDVmqYL2quK
         gCjw==
X-Gm-Message-State: AOJu0YxXZOqRSKhQTtb+mXkz9CpzQ7FbDtyDrPvq2mV9kkHfyiHvgEzS
	cIdI0L6nmSKuyezDPyYvJkwpHQ==
X-Google-Smtp-Source: AGHT+IEOb0nFn1AJOzX0DGuI7MPLsWoa8ws07TqEP1Il7scskfZsZupJdUoIlhkmIgqXTE/gOum/Ig==
X-Received: by 2002:a05:6512:3c8f:b0:50b:d764:9673 with SMTP id h15-20020a0565123c8f00b0050bd7649673mr2481949lfv.87.1701553221549;
        Sat, 02 Dec 2023 13:40:21 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f24-20020ac25338000000b0050be6038170sm282996lfh.48.2023.12.02.13.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 13:40:21 -0800 (PST)
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
Subject: [PATCH 05/12] drm/msm/dpu: in dpu_format replace bitmap with unsigned long field
Date: Sun,  3 Dec 2023 00:40:09 +0300
Message-Id: <20231202214016.1257621-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using bitmap for the flags results in a clumsy syntax on test_bit,
replace it with unsigned long type and simple binary ops.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 18 +++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 16 +++++++---------
 2 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 05e82f5dd0e6..3112d85808c7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -45,7 +45,7 @@ bp, flg, fm, np)                                                          \
 	.unpack_count = uc,                                               \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
-	.flag = {(flg)},                                                  \
+	.flags = flg,                                                     \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -64,7 +64,7 @@ alpha, bp, flg, fm, np, th)                                               \
 	.unpack_count = uc,                                               \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
-	.flag = {(flg)},                                                  \
+	.flags = flg,                                                     \
 	.num_planes = np,                                                 \
 	.tile_height = th                                                 \
 }
@@ -84,7 +84,7 @@ alpha, chroma, count, bp, flg, fm, np)                                    \
 	.unpack_count = count,                                            \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
-	.flag = {(flg)},                                                  \
+	.flags = flg,                                                     \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -102,7 +102,7 @@ alpha, chroma, count, bp, flg, fm, np)                                    \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
 	.fetch_mode = fm,                                                 \
-	.flag = {(flg)},                                                  \
+	.flags = flg,                                                     \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -121,7 +121,7 @@ flg, fm, np, th)                                                          \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
 	.fetch_mode = fm,                                                 \
-	.flag = {(flg)},                                                  \
+	.flags = flg,                                                     \
 	.num_planes = np,                                                 \
 	.tile_height = th                                                 \
 }
@@ -139,7 +139,7 @@ flg, fm, np, th)                                                          \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
 	.fetch_mode = fm,                                                 \
-	.flag = {(flg)},                                                  \
+	.flags = flg,                                                     \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -158,7 +158,7 @@ flg, fm, np, th)                                                          \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
 	.fetch_mode = fm,                                                 \
-	.flag = {(flg)},                                                  \
+	.flags = flg,                                                     \
 	.num_planes = np,                                                 \
 	.tile_height = th                                                 \
 }
@@ -178,7 +178,7 @@ flg, fm, np)                                                      \
 	.unpack_count = 1,                                                \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
-	.flag = {(flg)},                                                  \
+	.flags = flg,                                                     \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -1047,7 +1047,7 @@ const struct dpu_format *dpu_get_dpu_format_ext(
 		DPU_ERROR("unsupported fmt: %4.4s modifier 0x%llX\n",
 			(char *)&format, modifier);
 	else
-		DRM_DEBUG_ATOMIC("fmt %4.4s mod 0x%llX ubwc %d yuv %d\n",
+		DRM_DEBUG_ATOMIC("fmt %4.4s mod 0x%llX ubwc %d yuv %ld\n",
 				(char *)&format, modifier,
 				DPU_FORMAT_IS_UBWC(fmt),
 				DPU_FORMAT_IS_YUV(fmt));
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index ebb3f9f493c3..caa0ff2d192f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -40,23 +40,21 @@ enum dpu_format_flags {
 	DPU_FORMAT_FLAG_YUV_BIT,
 	DPU_FORMAT_FLAG_DX_BIT,
 	DPU_FORMAT_FLAG_COMPRESSED_BIT,
-	DPU_FORMAT_FLAG_BIT_MAX,
 };
 
 #define DPU_FORMAT_FLAG_YUV		BIT(DPU_FORMAT_FLAG_YUV_BIT)
 #define DPU_FORMAT_FLAG_DX		BIT(DPU_FORMAT_FLAG_DX_BIT)
 #define DPU_FORMAT_FLAG_COMPRESSED	BIT(DPU_FORMAT_FLAG_COMPRESSED_BIT)
-#define DPU_FORMAT_IS_YUV(X)		\
-	(test_bit(DPU_FORMAT_FLAG_YUV_BIT, (X)->flag))
-#define DPU_FORMAT_IS_DX(X)		\
-	(test_bit(DPU_FORMAT_FLAG_DX_BIT, (X)->flag))
+
+#define DPU_FORMAT_IS_YUV(X)		((X)->flags & DPU_FORMAT_FLAG_YUV)
+#define DPU_FORMAT_IS_DX(X)		((X)->flags & DPU_FORMAT_FLAG_DX)
 #define DPU_FORMAT_IS_LINEAR(X)		((X)->fetch_mode == MDP_FETCH_LINEAR)
 #define DPU_FORMAT_IS_TILE(X) \
 	(((X)->fetch_mode == MDP_FETCH_UBWC) && \
-			!test_bit(DPU_FORMAT_FLAG_COMPRESSED_BIT, (X)->flag))
+	 !((X)->flags & DPU_FORMAT_FLAG_COMPRESSED))
 #define DPU_FORMAT_IS_UBWC(X) \
 	(((X)->fetch_mode == MDP_FETCH_UBWC) && \
-			test_bit(DPU_FORMAT_FLAG_COMPRESSED_BIT, (X)->flag))
+	 ((X)->flags & DPU_FORMAT_FLAG_COMPRESSED))
 
 #define DPU_BLEND_FG_ALPHA_FG_CONST	(0 << 0)
 #define DPU_BLEND_FG_ALPHA_BG_CONST	(1 << 0)
@@ -325,7 +323,7 @@ enum dpu_3d_blend_mode {
  * @alpha_enable: whether the format has an alpha channel
  * @num_planes: number of planes (including meta data planes)
  * @fetch_mode: linear, tiled, or ubwc hw fetch behavior
- * @flag: usage bit flags
+ * @flags: usage bit flags
  * @tile_width: format tile width
  * @tile_height: format tile height
  */
@@ -342,7 +340,7 @@ struct dpu_format {
 	u8 alpha_enable;
 	u8 num_planes;
 	enum mdp_fetch_mode fetch_mode;
-	DECLARE_BITMAP(flag, DPU_FORMAT_FLAG_BIT_MAX);
+	unsigned long flags;
 	u16 tile_width;
 	u16 tile_height;
 };
-- 
2.39.2


