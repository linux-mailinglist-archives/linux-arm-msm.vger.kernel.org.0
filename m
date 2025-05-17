Return-Path: <linux-arm-msm+bounces-58274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA7CABAB92
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 19:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C714173E03
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 17:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A58A211484;
	Sat, 17 May 2025 17:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dxVXMLLm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D428820E6E4;
	Sat, 17 May 2025 17:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747503185; cv=none; b=AMD1NnMHtoODp++wvm1/qhpeLR/Eca61Yztw8WqTGPMw3TY+F00uVFtzQcRXWtrryQWqpVZZcW5o0/xeqyZqW8SB+7ZKdugiScntQUUYSzpavopldVjWckcaTPQJL721VCqTBckvYwtedta6s+t2/Dvg1E0YreFwnS+HAO3cC+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747503185; c=relaxed/simple;
	bh=tFc9hug2b7fXl6hOuuxgkah3z/v9PQJg3mUq+erHT68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HpNmLFGSmUef3iuIIss0hdT83It5FFSKb+UPXfpiqRGWK+UWBoUKP4wup6Z/fzTjiIDwLooKDql488vbun+KgjQa5kXPcTCMwWLkVGCuPVUNNgajyp9J/atDj0KN5rBQzJ4kysspX+CMyOy1G6e+1Zpdq/ivhY8YrHr01BxBN6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dxVXMLLm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB94DC4CEEA;
	Sat, 17 May 2025 17:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747503185;
	bh=tFc9hug2b7fXl6hOuuxgkah3z/v9PQJg3mUq+erHT68=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dxVXMLLmypVnT0m7sadgKIDTliqgd2sDMrQ01Zlu1D9Wdn2QEneK116grFG7qv6k+
	 XVhYaYeDSlkU0Gafnl9+trC+VDwuOj4wref7Kdu4o7k+i6ETSDliBQDh38A+tlkFPN
	 faRoM5hpnenjmeMf3+yrGxB46UChAqfFO6URFL9I6RJW93voLfUi9/bpt2xvjGaNg0
	 V+W6qVi045R2kdutO0MsSIUJKx10FxQ5ioeDeNxJluYy6W73fdVhJbbyAMEvdyGolI
	 aOwHY2Nwv8LurGd82qnY/hx9uJHYgewEPTArlrpgLZs4qRD7ow6C5oEQqk7DX6uzNR
	 SUgHKAOXBeFkg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 17 May 2025 19:32:38 +0200
Subject: [PATCH RFT v3 04/14] drm/msm/a6xx: Get a handle to the common UBWC
 config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-topic-ubwc_central-v3-4-3c8465565f86@oss.qualcomm.com>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
In-Reply-To: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747503160; l=2657;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=CuuD8qViyGRCfouTGuJaUY+h/7zt6demaKxkARZ/ecE=;
 b=pKZDZ43WEfMwYSIaC45pbkcYWH4LP3Zrf02CeN7HbhxNf1EjWhaKQmTC6LzTEMLKmMpxBVFwm
 eIh8f45nKmxDUcTZgIkPJy9BlVhCW2FpEQ5Oj30FXikJ2k7dqoBd5Kt
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Start the great despaghettification by getting a pointer to the common
UBWC configuration, which houses e.g. UBWC versions that we need to
make decisions.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 16 ++++++++++++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +++
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index bf3758f010f4079aa86f9c658b52a70acf10b488..4399e69bd5156c9d8c6a17213ae02ae03ddae529 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -585,8 +585,13 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A6XX_CP_PROTECT(protect->count_max - 1), protect->regs[i]);
 }
 
-static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
+static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 {
+	/* Inherit the common config and make some necessary fixups */
+	gpu->common_ubwc_cfg = qcom_ubwc_config_get_data();
+	if (IS_ERR(gpu->common_ubwc_cfg))
+		return PTR_ERR(gpu->common_ubwc_cfg);
+
 	gpu->ubwc_config.rgb565_predicator = 0;
 	gpu->ubwc_config.uavflagprd_inv = 0;
 	gpu->ubwc_config.min_acc_len = 0;
@@ -663,6 +668,8 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 		gpu->ubwc_config.highest_bank_bit = 14;
 		gpu->ubwc_config.min_acc_len = 1;
 	}
+
+	return 0;
 }
 
 static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
@@ -2546,7 +2553,12 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		msm_mmu_set_fault_handler(gpu->aspace->mmu, gpu,
 				a6xx_fault_handler);
 
-	a6xx_calc_ubwc_config(adreno_gpu);
+	ret = a6xx_calc_ubwc_config(adreno_gpu);
+	if (ret) {
+		a6xx_destroy(&(a6xx_gpu->base.base));
+		return ERR_PTR(ret);
+	}
+
 	/* Set up the preemption specific bits and pieces for each ringbuffer */
 	a6xx_preempt_init(gpu);
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index a8f4bf416e64fadbd1c61c991db13d539581e324..06be95d3efaee94e4107a484ad3132e0a6a9ea46 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -12,6 +12,8 @@
 #include <linux/firmware.h>
 #include <linux/iopoll.h>
 
+#include <linux/soc/qcom/ubwc.h>
+
 #include "msm_gpu.h"
 
 #include "adreno_common.xml.h"
@@ -243,6 +245,7 @@ struct adreno_gpu {
 		 */
 		u32 macrotile_mode;
 	} ubwc_config;
+	const struct qcom_ubwc_cfg_data *common_ubwc_cfg;
 
 	/*
 	 * Register offsets are different between some GPUs.

-- 
2.49.0


