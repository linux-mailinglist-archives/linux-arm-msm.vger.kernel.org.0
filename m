Return-Path: <linux-arm-msm+bounces-3041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27132801EBC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 22:40:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B1A71C20860
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 21:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 921C222337;
	Sat,  2 Dec 2023 21:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X2v4CiZO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB7B5134
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Dec 2023 13:40:26 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50abb83866bso4611201e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Dec 2023 13:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701553225; x=1702158025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VP6tHJ9mGaAiGFKJb5YhHXoS5WIwdbuGxI10tW2QYRg=;
        b=X2v4CiZO/tar9ZzYYfJK+UdDVJUC7dP9HArkP81/SYAOGRWxehJNtjPIrly2sc+MH+
         WI2Uu64VAksVoJJmjOrSHikEC/rDxlQkp59fM05OdqfrFuLe8nrsVeRHnDbunKvh310B
         vxrcYWyIuEWp3Hsh1Rs7KVxR6p4ASXoF2akj7aN5QlVoGgw4peTDTuvMSpZCTKoqoHdG
         57p8R5FAhf/9imEaSpr/izY5N4peBTw9Ft739BUIXx+Aoo/V4RUDz/onpn8kbs/zXapX
         b1AqqG8GHYSk7UESTb6Xvqbe03TAOmppEHWsJbkdDz4RgcHMF9F+g9yr++mcpTKgNbyd
         4b+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701553225; x=1702158025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VP6tHJ9mGaAiGFKJb5YhHXoS5WIwdbuGxI10tW2QYRg=;
        b=I6d8DjHqQzdIMjgThOz0Jk+twgIk/FtPDesAq0/J+azZEtCICFhwVSxBtJ17O16LZX
         cr53GhGYmDALTzUoSBAzLAqKEZgC6mTnoz/MJnn3ZSadihlCOW7mkXBdhMO2ZWgswAP1
         +oQCqtkJh1i1ukYSMVIRiDrJAYhfcSAEk9PXN2l6ycz24bv52mKpZonGjWmvOabKBPph
         dLUEO5CA3pDcjggIY47S3ebk59kkgS0lEkA+iGzEtkTyfOq7aPr6cHKvcKN99zvpgl54
         s3aYoC2yIqAhOCdeeswcodcM5fOoHj9V5bA56DFScIpESue621BjGbN3J71ylwQD7pt7
         2QaQ==
X-Gm-Message-State: AOJu0YwzbKtuDugKZCJBl2mRDgFIlDGGTKM3IecpN73k5/PZldgG0z1p
	ksftJ22nqwWyffu079N3hRVbzw==
X-Google-Smtp-Source: AGHT+IH0BJcin6/hShEeVYXB5vZfYPCWBbgIKKN9qxdSDMDN70wpuibImh1tXOeIEYrUSg+tOKr0mA==
X-Received: by 2002:a05:6512:3a8a:b0:50a:2721:a43d with SMTP id q10-20020a0565123a8a00b0050a2721a43dmr1369776lfu.49.1701553224909;
        Sat, 02 Dec 2023 13:40:24 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f24-20020ac25338000000b0050be6038170sm282996lfh.48.2023.12.02.13.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 13:40:24 -0800 (PST)
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
Subject: [PATCH 09/12] drm/msm: convert msm_format::unpack_align_msb to the flag
Date: Sun,  3 Dec 2023 00:40:13 +0300
Message-Id: <20231202214016.1257621-10-dmitry.baryshkov@linaro.org>
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

Instead of having a u8 or bool field unpack_align_msb, convert it to the
flag, this save space in the tables and allows us to handle all booleans
in the same way.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 12 ++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c   |  2 +-
 drivers/gpu/drm/msm/msm_drv.h               |  4 ++--
 4 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 419400311837..baf0fd67bf42 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -43,7 +43,6 @@ bp, flg, fm, np)                                                          \
 	.bpc_r_cr = r,                                                    \
 	.bpc_a = a,                                                       \
 	.chroma_sample = CHROMA_FULL,                                     \
-	.unpack_align_msb = 0,                                            \
 	.unpack_count = uc,                                               \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
@@ -64,7 +63,6 @@ alpha, bp, flg, fm, np, th)                                               \
 	.bpc_r_cr = r,                                                    \
 	.bpc_a = a,                                                       \
 	.chroma_sample = CHROMA_FULL,                                     \
-	.unpack_align_msb = 0,                                            \
 	.unpack_count = uc,                                               \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
@@ -86,7 +84,6 @@ alpha, chroma, count, bp, flg, fm, np)                                    \
 	.bpc_r_cr = r,                                                    \
 	.bpc_a = a,                                                       \
 	.chroma_sample = chroma,                                          \
-	.unpack_align_msb = 0,                                            \
 	.unpack_count = count,                                            \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
@@ -106,7 +103,6 @@ alpha, chroma, count, bp, flg, fm, np)                                    \
 	.bpc_r_cr = r,                                                    \
 	.bpc_a = a,                                                       \
 	.chroma_sample = chroma,                                          \
-	.unpack_align_msb = 0,                                            \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
 	.fetch_mode = fm,                                                 \
@@ -127,7 +123,6 @@ flg, fm, np, th)                                                          \
 	.bpc_r_cr = r,                                                    \
 	.bpc_a = a,                                                       \
 	.chroma_sample = chroma,                                          \
-	.unpack_align_msb = 0,                                            \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
 	.fetch_mode = fm,                                                 \
@@ -147,11 +142,10 @@ flg, fm, np, th)                                                          \
 	.bpc_r_cr = r,                                                    \
 	.bpc_a = a,                                                       \
 	.chroma_sample = chroma,                                          \
-	.unpack_align_msb = 1,                                            \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
 	.fetch_mode = fm,                                                 \
-	.flags = flg,                                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB | flg,                  \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -168,11 +162,10 @@ flg, fm, np, th)                                                          \
 	.bpc_r_cr = r,                                                    \
 	.bpc_a = a,                                                       \
 	.chroma_sample = chroma,                                          \
-	.unpack_align_msb = 1,                                            \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
 	.fetch_mode = fm,                                                 \
-	.flags = flg,                                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB | flg,                  \
 	.num_planes = np,                                                 \
 	.tile_height = th                                                 \
 }
@@ -190,7 +183,6 @@ flg, fm, np)                                                      \
 	.bpc_r_cr = r,                                                    \
 	.bpc_a = a,                                                       \
 	.chroma_sample = chroma,                                          \
-	.unpack_align_msb = 0,                                            \
 	.unpack_count = 1,                                                \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index f6c772df048b..c1ff70d80bdb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -263,7 +263,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		(fmt->element[1] << 8) | (fmt->element[0] << 0);
 	src_format |= ((fmt->unpack_count - 1) << 12) |
 		((fmt->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT ? 1 : 0) << 17) |
-		(fmt->unpack_align_msb << 18) |
+		((fmt->flags & MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB ? 1 : 0) << 18) |
 		((fmt->bpp - 1) << 9);
 
 	if (fmt->fetch_mode != MDP_FETCH_LINEAR) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index 12418256326d..1eadaabc8b25 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -92,7 +92,7 @@ static void dpu_hw_wb_setup_format(struct dpu_hw_wb *ctx,
 		(fmt->element[1] << 8)  |
 		(fmt->element[0] << 0);
 
-	dst_format |= (fmt->unpack_align_msb << 18) |
+	dst_format |= ((fmt->flags & MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB ? 1 : 0) << 18) |
 		((fmt->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT ? 1 : 0) << 17) |
 		((fmt->unpack_count - 1) << 12) |
 		((fmt->bpp - 1) << 9);
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 61a4587382b5..7ea24d776a50 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -256,12 +256,14 @@ enum msm_format_flags {
 	MSM_FORMAT_FLAG_DX_BIT,
 	MSM_FORMAT_FLAG_COMPRESSED_BIT,
 	MSM_FORMAT_FLAG_UNPACK_TIGHT_BIT,
+	MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB_BIT,
 };
 
 #define MSM_FORMAT_FLAG_YUV		BIT(MSM_FORMAT_FLAG_YUV_BIT)
 #define MSM_FORMAT_FLAG_DX		BIT(MSM_FORMAT_FLAG_DX_BIT)
 #define MSM_FORMAT_FLAG_COMPRESSED	BIT(MSM_FORMAT_FLAG_COMPRESSED_BIT)
 #define MSM_FORMAT_FLAG_UNPACK_TIGHT	BIT(MSM_FORMAT_FLAG_UNPACK_TIGHT_BIT)
+#define MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB BIT(MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB_BIT)
 
 /**
  * struct msm_format: defines the format configuration
@@ -270,7 +272,6 @@ enum msm_format_flags {
  * @fetch_type: how the color components are packed in pixel format
  * @chroma_sample: chroma sub-samplng type
  * @alpha_enable: whether the format has an alpha channel
- * @unpack_align_msb: unpack aligned to LSB or MSB
  * @unpack_count: number of the components to unpack
  * @bpp: bytes per pixel
  * @flags: usage bit flags
@@ -286,7 +287,6 @@ struct msm_format {
 	enum mdp_fetch_type fetch_type;
 	enum mdp_chroma_samp_type chroma_sample;
 	bool alpha_enable;
-	u8 unpack_align_msb;
 	u8 unpack_count;
 	u8 bpp;
 	unsigned long flags;
-- 
2.39.2


