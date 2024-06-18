Return-Path: <linux-arm-msm+bounces-23119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2064F90DA17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 18:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2CF6B27513
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 16:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6D4D13BC35;
	Tue, 18 Jun 2024 16:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yfuh+u4h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2098E13B780;
	Tue, 18 Jun 2024 16:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718728992; cv=none; b=iC8/0ThKP/3KBeHzKUP1aKtS5WgpL6p0zrNx9tlc04XN/hnp2WMsLmi/6WDzqkCN733alcNn9tKJ2uMAVHYIfqjRTjdPbNnWJYsZdtxndWnuYabTeoVY1bvAMqPrKET6/KWIrzCxlAXvhlA9bM917gjszTzX6s6CecnQfXIKzS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718728992; c=relaxed/simple;
	bh=qgLpEq+msvolgpn+bUs3ySe6b820ypLyTev/yRntPJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IjWH7KJA1eB20D1ZxUS3WIU0FKNK6KuEyzB2wFBgxyE+3H37zcrEJtaEOTMpqkR6TgItnU/2dp4plxfLT4MUteq9BkXvs5aiZ2oc3T3suf+H0h+aptkkYAO+seI4yp8O4CjNdGfwNF6VXqvy/7P1X6CReeo+GpshDC0uaOACbb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yfuh+u4h; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5bfa5f9bbe6so1467090eaf.3;
        Tue, 18 Jun 2024 09:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718728989; x=1719333789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DT2W54XHt1fLDl14LZ4vb765yKuSefzWt8eaySrAzbM=;
        b=Yfuh+u4hE6TakxpF4dO4XUnT9tcF5rZDyN/WF2l5615Gqd/fS8cBBdKw3xZjLHxXMh
         1hKfnUMSOjqJmIfPGxtCqmEZWlRv3Q1HYyT8KmD2/amNYR4Jl+q6pXPHqgr6fR8xN0CS
         QnE7thA7IchDHDPckup3dXDDybfaACeBNPYvQ/qUyJlpw9y9bbgilFhbGIzVxulp11PM
         J7js4Igj9tpzT1hYqPBczS4FMCWBqfysW3pJPF26yyl0XLC4hgTw1bcKn27R+OHZwntc
         tfunHXRs1Nm0Y6hTGHLSFWeNFUKRMPUXmb2aAPgxuZfnQqNaz8TZ5ZUfXhTvnLsIi34X
         Qmvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718728989; x=1719333789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DT2W54XHt1fLDl14LZ4vb765yKuSefzWt8eaySrAzbM=;
        b=b37Q1AT/dFlJ8/HUD0Jh6eQs9FmaSTGM+v5Z49maqid3MsHdogMppJhn4qUPM373XQ
         hx/Lnge+JUJM6vu1Q1h2IZFShwDRA+4gSRA9zernlgac8kGEXjHeiORiwfMzdBUe1r4p
         MlQp8h9ltL52SVcObx8btMNO0LpE9yT3m4uI4uGkT4DQoIu7maYETUVbxBz8AB1d8/vT
         cEXurUdaKpG6L5WDGdtvskQMqDPNCAu0Ut7E4FDVO6RVZTkp2seCGPhk/kkwua0VcYLu
         dHUE+5HKuvQet+8x9+klv2cxKPUIyyac+6jdW554qZHNQq0ycCA7EjgfGESF71Ut7ybD
         c0Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWEhzkDKDnZvid/5KGxAxbGRIZyJfZ6IBtyYjgj64t2ukh14KjfYKwjzudRS9vwXtBgDeJwSA9/bM3lPogz0tXQvtcYAzFBMratvOu+
X-Gm-Message-State: AOJu0Yz1A18I/h2XtGle6/l/+jtpaJtFKNYenNyit6N4u0RbgVAqhWkq
	4bEOPeA/oBpIbbLpHxqbxgfKjkPBPdRNMuhoD7IMgn0I2z/feJqZK5jowA==
X-Google-Smtp-Source: AGHT+IELxjMBPl9nkbYtcm0qF2QaoCcUcAFTALpCWjUZ3M3MRjUE6itYvT5wn9+xMLnTRwZF0WKDqA==
X-Received: by 2002:a05:6358:5e04:b0:19f:424f:d08a with SMTP id e5c5f4694b2df-1a1fd63a662mr40561955d.29.1718728988981;
        Tue, 18 Jun 2024 09:43:08 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6fede16af59sm8293969a12.30.2024.06.18.09.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 09:43:08 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Rob Clark <robdclark@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 1/5] drm/msm/adreno: Split up giant device table
Date: Tue, 18 Jun 2024 09:42:47 -0700
Message-ID: <20240618164303.66615-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618164303.66615-1-robdclark@gmail.com>
References: <20240618164303.66615-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Split into a separate table per generation, in preparation to move each
gen's device table to it's own file.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 67 +++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 10 ++++
 2 files changed, 63 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index c3703a51287b..a57659eaddc2 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -20,7 +20,7 @@ bool allow_vram_carveout = false;
 MODULE_PARM_DESC(allow_vram_carveout, "Allow using VRAM Carveout, in place of IOMMU");
 module_param_named(allow_vram_carveout, allow_vram_carveout, bool, 0600);
 
-static const struct adreno_info gpulist[] = {
+static const struct adreno_info a2xx_gpus[] = {
 	{
 		.chip_ids = ADRENO_CHIP_IDS(0x02000000),
 		.family = ADRENO_2XX_GEN1,
@@ -54,7 +54,12 @@ static const struct adreno_info gpulist[] = {
 		.gmem  = SZ_512K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a2xx_gpu_init,
-	}, {
+	}
+};
+DECLARE_ADRENO_GPULIST(a2xx);
+
+static const struct adreno_info a3xx_gpus[] = {
+	{
 		.chip_ids = ADRENO_CHIP_IDS(0x03000512),
 		.family = ADRENO_3XX,
 		.fw = {
@@ -116,7 +121,12 @@ static const struct adreno_info gpulist[] = {
 		.gmem  = SZ_1M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a3xx_gpu_init,
-	}, {
+	}
+};
+DECLARE_ADRENO_GPULIST(a3xx);
+
+static const struct adreno_info a4xx_gpus[] = {
+	{
 		.chip_ids = ADRENO_CHIP_IDS(0x04000500),
 		.family = ADRENO_4XX,
 		.revn  = 405,
@@ -149,7 +159,12 @@ static const struct adreno_info gpulist[] = {
 		.gmem  = (SZ_1M + SZ_512K),
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a4xx_gpu_init,
-	}, {
+	}
+};
+DECLARE_ADRENO_GPULIST(a4xx);
+
+static const struct adreno_info a5xx_gpus[] = {
+	{
 		.chip_ids = ADRENO_CHIP_IDS(0x05000600),
 		.family = ADRENO_5XX,
 		.revn = 506,
@@ -274,7 +289,12 @@ static const struct adreno_info gpulist[] = {
 		.quirks = ADRENO_QUIRK_LMLOADKILL_DISABLE,
 		.init = a5xx_gpu_init,
 		.zapfw = "a540_zap.mdt",
-	}, {
+	}
+};
+DECLARE_ADRENO_GPULIST(a5xx);
+
+static const struct adreno_info a6xx_gpus[] = {
+	{
 		.chip_ids = ADRENO_CHIP_IDS(0x06010000),
 		.family = ADRENO_6XX_GEN1,
 		.revn = 610,
@@ -520,7 +540,12 @@ static const struct adreno_info gpulist[] = {
 		.zapfw = "a690_zap.mdt",
 		.hwcg = a690_hwcg,
 		.address_space_size = SZ_16G,
-	}, {
+	}
+};
+DECLARE_ADRENO_GPULIST(a6xx);
+
+static const struct adreno_info a7xx_gpus[] = {
+	{
 		.chip_ids = ADRENO_CHIP_IDS(0x07000200),
 		.family = ADRENO_6XX_GEN1, /* NOT a mistake! */
 		.fw = {
@@ -582,7 +607,17 @@ static const struct adreno_info gpulist[] = {
 		.init = a6xx_gpu_init,
 		.zapfw = "gen70900_zap.mbn",
 		.address_space_size = SZ_16G,
-	},
+	}
+};
+DECLARE_ADRENO_GPULIST(a7xx);
+
+static const struct adreno_gpulist *gpulists[] = {
+	&a2xx_gpulist,
+	&a3xx_gpulist,
+	&a4xx_gpulist,
+	&a5xx_gpulist,
+	&a6xx_gpulist,
+	&a6xx_gpulist,
 };
 
 MODULE_FIRMWARE("qcom/a300_pm4.fw");
@@ -617,13 +652,17 @@ MODULE_FIRMWARE("qcom/yamato_pm4.fw");
 static const struct adreno_info *adreno_info(uint32_t chip_id)
 {
 	/* identify gpu: */
-	for (int i = 0; i < ARRAY_SIZE(gpulist); i++) {
-		const struct adreno_info *info = &gpulist[i];
-		if (info->machine && !of_machine_is_compatible(info->machine))
-			continue;
-		for (int j = 0; info->chip_ids[j]; j++)
-			if (info->chip_ids[j] == chip_id)
-				return info;
+	for (int i = 0; i < ARRAY_SIZE(gpulists); i++) {
+		for (int j = 0; j < gpulists[i]->gpus_count; j++) {
+			const struct adreno_info *info = &gpulists[i]->gpus[j];
+
+			if (info->machine && !of_machine_is_compatible(info->machine))
+				continue;
+
+			for (int k = 0; info->chip_ids[k]; k++)
+				if (info->chip_ids[k] == chip_id)
+					return info;
+		}
 	}
 
 	return NULL;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 77526892eb8c..17aba8c58f3d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -114,6 +114,16 @@ struct adreno_info {
 
 #define ADRENO_CHIP_IDS(tbl...) (uint32_t[]) { tbl, 0 }
 
+struct adreno_gpulist {
+	const struct adreno_info *gpus;
+	unsigned gpus_count;
+};
+
+#define DECLARE_ADRENO_GPULIST(name)                  \
+const struct adreno_gpulist name ## _gpulist = {      \
+	name ## _gpus, ARRAY_SIZE(name ## _gpus)      \
+}
+
 /*
  * Helper to build a speedbin table, ie. the table:
  *      fuse | speedbin
-- 
2.45.2


