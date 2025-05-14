Return-Path: <linux-arm-msm+bounces-57854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3EBAB6F34
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 17:12:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2FF47A6416
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 15:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694C7214A81;
	Wed, 14 May 2025 15:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFtaX1sI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDEC1DDC1B;
	Wed, 14 May 2025 15:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235468; cv=none; b=M0tEVhD/EDCNJGIdL+8mKN6j3jXO6BWOSKEQSgq25lNjsjkQTtt3KJ+WGdLLWWgMSBAjkYISLHwjo6Zt9rQsKUDw6iQxRxQiE5xjN13ETX++9I7bhP5ZMUwmzSqO1IwXYV8r71cMCnKmyph5sYNyZxfufCUNQZd752h/oSw9xG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235468; c=relaxed/simple;
	bh=KpRy1WqiQOZlNaZVgIdsnx6x5tTlxnNE+gMKQtdlLbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EW7nLKa/LXnY8tRjdZxAtopSbukaftxAbT2VxcK7l8e5Vqqt+dH8aUSScroJ/uF+xograBmHWgxCdHFO8rzl+nRssCnubsfpDQQdySDRiIagyrMIKOepiIqEPYciAiKi4LLjHwzO4SdJWi4x7voZIGhxbA9aomguBEO5dWElJ/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFtaX1sI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E05DC4CEEF;
	Wed, 14 May 2025 15:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747235467;
	bh=KpRy1WqiQOZlNaZVgIdsnx6x5tTlxnNE+gMKQtdlLbo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FFtaX1sIOXUlQlkfFzs/qPaXZQKjgu/7VvelbBU1KZvEZBgcciSazAJeWvybltpKs
	 0a4zamlgPsGXLeRVvvuSgrWgk2O/Bw5PV1oE9kidAtY9pKizfuMdTCNcU6vRUwWp+C
	 aqB+hEO816AX1d8fRcw7jzEdwW1++hbx8UK0B4T1GiHTTNYzftZspMn8HTvDJH8M7e
	 7Oc8hrlaiI2UfWJWdyiSotr2eldpx6ofaBgW9XnfDPGut1NEGPM1ULAVitCMmKlOtP
	 gyltFJm4/EtAk5IBHbeMlEtUtmjZMcx0B2Vhdb/DBvhUZ7Od6lDaLeIImTifX2WKo1
	 uNm6Q5WSTwnEg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 14 May 2025 17:10:24 +0200
Subject: [PATCH RFT v2 04/15] drm/msm/a6xx: Get a handle to the common UBWC
 config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-topic-ubwc_central-v2-4-09ecbc0a05ce@oss.qualcomm.com>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
In-Reply-To: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747235442; l=2635;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=CnwmtdkXlT5mqx7UQRAXsaH60h06U3gP7uL8392haM8=;
 b=RSy/aDase/Of1wBGvCkIASHoZvOWtPHZmsZHy3BmoRziWWAGziLaOKNDaSsSgQbxNl8TxIhcW
 cTvhOezwuntBfXlX/v9j4qu9N8UzACuGm/WleT738IERKy3AyUmiqJG
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
index bf3758f010f4079aa86f9c658b52a70acf10b488..ba20ff92780dbd565374f8113ea99f615b80d105 100644
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
+		return -EINVAL;
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


