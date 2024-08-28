Return-Path: <linux-arm-msm+bounces-29789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82270962B3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 17:07:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A75C61C2371E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 15:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BED141A38EA;
	Wed, 28 Aug 2024 15:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dN9wwMwG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F30D1A38E0;
	Wed, 28 Aug 2024 15:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724857641; cv=none; b=ZBca9Niw8+1R102l2c3tQdzZ5MvuJcgXtqn/3480ozhdnadzn1HzyapMu7wUh3WhJNLQgyz3sG+tw95h4Bbidw5EjwONlwDmEeXrd36LGiy36FZdZhAbX+fxiE+4wZ6qnrg+5gbXdiM0vJd18a+bWMNRdi6kvYeJZZENmofwbYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724857641; c=relaxed/simple;
	bh=fJN/wBB6IdVRV/C/0AvIDADf/BcfqwLjLXBn8yCJISU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K4xGU/YmR4HbyGdKp2gxFb1mQ5Gd0ESERb3OSlpdv2HEJt14fE3nT0xLo6FRJD7+576G3CCzXUBVIgW6sz2VXP+g070x7SYM/gjHpHDtqG15SjdHK9KiWTIR7dGlMTNpPNC9FiIwXW9Mb0DXhCuw2qcmSKksKnhyfl4/WaTWddc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dN9wwMwG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 269C0C4CEC1;
	Wed, 28 Aug 2024 15:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724857641;
	bh=fJN/wBB6IdVRV/C/0AvIDADf/BcfqwLjLXBn8yCJISU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dN9wwMwG9h3unCF3TjdVyyeL384blKNsEVJpqvsL5VSsqNLJrBdAeN4MDv+ClOmM9
	 z6/WmgkmMnJB04HKWqsiGmZRr6CL5465uDx1qbBS9G6RZvadCBs7mItKG+Y2t0J1jt
	 thMqabGPvA7FggSdciNrGzeZhHTcO1zU8uk9/Be53VPCypd3zHVZl8QfQg48Q0cC08
	 CYldVT8RzOX5w6/A4+F6Lt8EtuW2vFVfbwaDbLYLbu+xLtcDUsiKyYvQK958sCn9MO
	 HTxIRy7nIMzKrQ1c8O2PQEN7GVOrdx6a5enk+4sbnT+ULAB1QRKfraYp7ckxzmACDC
	 7156JPSUdRJWw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 28 Aug 2024 17:06:56 +0200
Subject: [PATCH v2 3/6] drm/msm/a6xx: Store correct gmu_cgc_mode in struct
 a6xx_info
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-topic-a621-v2-3-1882c6b57432@kernel.org>
References: <20240828-topic-a621-v2-0-1882c6b57432@kernel.org>
In-Reply-To: <20240828-topic-a621-v2-0-1882c6b57432@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724857626; l=5876;
 i=konradybcio@kernel.org; s=20230215; h=from:subject:message-id;
 bh=HDul3oea/s0VFDTA8cmBURLRDU8BwSstHumQgxqDetA=;
 b=QHUAqqyPCivttCwMg+fGojXhiU9T0ZYPubqeEOJlIzWyAbvMfLn5G1+ArhzvbbfDR6Fca8br0
 x4MctrDUGI3BtWFjiv+pR0G6TCN6AGeghE/2Wfy9kUf9isWyb8OcyK4
X-Developer-Key: i=konradybcio@kernel.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@linaro.org>

Store the correct values that we happen to have for some A7xx SKUs in
the GPU info struct and fill out the missing information for A6xx GPUs
based on downstream kernel information.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 1ea535960f32..6cd73abd95d4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -636,6 +636,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a612_hwcg,
 			.protect = &a630_protect,
+			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x00080000,
 		},
 		/*
@@ -668,6 +669,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a615_hwcg,
 			.protect = &a630_protect,
+			.gmu_cgc_mode = 0x00000222,
 			.prim_fifo_threshold = 0x00180000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
@@ -691,6 +693,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.init = a6xx_gpu_init,
 		.a6xx = &(const struct a6xx_info) {
 			.protect = &a630_protect,
+			.gmu_cgc_mode = 0x00000222,
 			.prim_fifo_threshold = 0x00180000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
@@ -714,6 +717,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a615_hwcg,
 			.protect = &a630_protect,
+			.gmu_cgc_mode = 0x00000222,
 			.prim_fifo_threshold = 0x00018000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
@@ -737,6 +741,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a615_hwcg,
 			.protect = &a630_protect,
+			.gmu_cgc_mode = 0x00000222,
 			.prim_fifo_threshold = 0x00018000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
@@ -760,6 +765,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a615_hwcg,
 			.protect = &a630_protect,
+			.gmu_cgc_mode = 0x00000222,
 			.prim_fifo_threshold = 0x00018000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
@@ -788,6 +794,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a630_hwcg,
 			.protect = &a630_protect,
+			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x00180000,
 		},
 	}, {
@@ -806,6 +813,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a640_hwcg,
 			.protect = &a630_protect,
+			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x00180000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
@@ -829,6 +837,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a650_hwcg,
 			.protect = &a650_protect,
+			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x00300200,
 		},
 		.address_space_size = SZ_16G,
@@ -855,6 +864,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a660_hwcg,
 			.protect = &a660_protect,
+			.gmu_cgc_mode = 0x00020000,
 			.prim_fifo_threshold = 0x00300200,
 		},
 		.address_space_size = SZ_16G,
@@ -874,6 +884,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a660_hwcg,
 			.protect = &a660_protect,
+			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x00200200,
 		},
 		.address_space_size = SZ_16G,
@@ -899,6 +910,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a640_hwcg,
 			.protect = &a630_protect,
+			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x00200200,
 		},
 	}, {
@@ -917,6 +929,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a690_hwcg,
 			.protect = &a690_protect,
+			.gmu_cgc_mode = 0x00020200,
 			.prim_fifo_threshold = 0x00800200,
 		},
 		.address_space_size = SZ_16G,
@@ -1178,6 +1191,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a702_hwcg,
 			.protect = &a650_protect,
+			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x0000c000,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
@@ -1202,6 +1216,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a730_hwcg,
 			.protect = &a730_protect,
+			.gmu_cgc_mode = 0x00020000,
 		},
 		.address_space_size = SZ_16G,
 	}, {
@@ -1221,6 +1236,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.hwcg = a740_hwcg,
 			.protect = &a730_protect,
 			.gmu_chipid = 0x7020100,
+			.gmu_cgc_mode = 0x00020202,
 		},
 		.address_space_size = SZ_16G,
 	}, {
@@ -1239,6 +1255,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.hwcg = a740_hwcg,
 			.protect = &a730_protect,
 			.gmu_chipid = 0x7050001,
+			.gmu_cgc_mode = 0x00020202,
 		},
 		.address_space_size = SZ_256G,
 	}, {
@@ -1257,6 +1274,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.protect = &a730_protect,
 			.gmu_chipid = 0x7090100,
+			.gmu_cgc_mode = 0x00020202,
 		},
 		.address_space_size = SZ_16G,
 	}
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index bc37bd8c7f65..0fb7febf70e7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -22,6 +22,7 @@ struct a6xx_info {
 	const struct adreno_reglist *hwcg;
 	const struct adreno_protect *protect;
 	u32 gmu_chipid;
+	u32 gmu_cgc_mode;
 	u32 prim_fifo_threshold;
 };
 

-- 
2.46.0


