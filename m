Return-Path: <linux-arm-msm+bounces-62595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8059AE997B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 11:03:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D993D3AAF00
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 09:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C83072C1588;
	Thu, 26 Jun 2025 09:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OWGHL4Y9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1C92BCF6C;
	Thu, 26 Jun 2025 09:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750928580; cv=none; b=te1I9FcMwmZyrZVWpUCzPPptGRTqlNfoAmEaHI466X7chhHJAvvp5sDF2E8i0xZYKodK3MKfBp77fQxd8w/jC8rI7+LZeiMRBCy40lDNsaoa01MF5E9ScV23Mww8yO4Q+BXUWowEkoMlIjF1Z4FN7AlSY5Fo39QCmINAszUZ4wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750928580; c=relaxed/simple;
	bh=Cg+8DupBWLyeRJpjZIdQOmGK3HcqSLv3ER/VUAwzlDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IstdV9C49ror3sEgV9yQWPfLnI92NBLLdEALCspuGY6tW4HazAPcPfaYYd1uuJbtZpi2O8G0XHBtg2upyoN0gUdhJuY08d+CZqtHi70gug0FN14a4m6eBDP9B7ZO/mo4jH4G4crcyRBBe+R3m5MYVcASbjJJN+Sc8CQT7mJLVmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OWGHL4Y9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98DA9C4CEEB;
	Thu, 26 Jun 2025 09:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750928580;
	bh=Cg+8DupBWLyeRJpjZIdQOmGK3HcqSLv3ER/VUAwzlDQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OWGHL4Y9Hph+lAXdhVgIi8KQ/BWs5egwyNNUTKinTpdnWR6dOFXbL2mfYlRLzfVUY
	 C9rwmMh5jwRiaA9klVFNQlWr/OttL0U1J+0DUwPf676nmqeaA7gNGEUVjq1igvkiB+
	 vtgvFnrWGaPDRa5L17+IlWPYtVOKK2MLgkoXen6aCvaso1NDnpRTQ8h+KJoaz06L97
	 wshpcGzJ4Oz+UZjdsNO8lYDJjpSZe2GfU97jk/rw6EJqzdZrHetR/hG4pkSQhjOO7s
	 d8gP+5hOTuC4tgob+CeKPg56hjhnLrIRm2iMQ8bXn75LfGclLm96b5ibQv33qDSGzG
	 1PakqZFlfHo8g==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 26 Jun 2025 11:02:31 +0200
Subject: [PATCH v6 04/14] drm/msm/a6xx: Get a handle to the common UBWC
 config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-topic-ubwc_central-v6-4-c94fa9d12040@oss.qualcomm.com>
References: <20250626-topic-ubwc_central-v6-0-c94fa9d12040@oss.qualcomm.com>
In-Reply-To: <20250626-topic-ubwc_central-v6-0-c94fa9d12040@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750928557; l=2724;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=3iWBKvs5q5N+qB3FfdC53TcHieKOPEBmf5TENWZJ3pY=;
 b=Zz3RnThb2v+hw8zbA1XaLBwu+YWPf/Txrf0EdkRBRpvBj7hLbIK4qIdg0ltK53LugLYE7DRNF
 3/+8G8xMmO9AOvyHJ8t51V7CjFQEACvNJjUEk8FkqRE7ZbklRBic55f
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Start the great despaghettification by getting a pointer to the common
UBWC configuration, which houses e.g. UBWC versions that we need to
make decisions.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 16 ++++++++++++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +++
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 491fde0083a202bec7c6b3bca88d0e5a717a6560..6588a47ea0f0635aaf3944215fa31befb63f4f57 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -603,8 +603,13 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
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
@@ -681,6 +686,8 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 		gpu->ubwc_config.highest_bank_bit = 14;
 		gpu->ubwc_config.min_acc_len = 1;
 	}
+
+	return 0;
 }
 
 static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
@@ -2564,7 +2571,12 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
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
index bc063594a359ee6b796381c5fd2c30e2aa12a26d..a2a211cac147cb5bc5befdcab07559b778adc2bb 100644
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
2.50.0


