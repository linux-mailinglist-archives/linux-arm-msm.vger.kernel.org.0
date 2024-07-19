Return-Path: <linux-arm-msm+bounces-26620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA6293766A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 12:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43CE81F26CE5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 10:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB11128369;
	Fri, 19 Jul 2024 10:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uZRNO5kB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D6183A19
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jul 2024 10:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721383436; cv=none; b=n6eqIVNUhN7HM47F5X+nbqDJakQDe7GVa4OzTgoVzDAT7I7KLLwrBESqKOIeJrxCic71Ki5B9Fexbm94GVi/8s+uGJcGDUeU9quF5V52Bz5t7VGorTq1WNNhNGPO6hICAWSIU2I3C6nZP+5qFX/omPc3GC4RgTek3gwvlAaMhCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721383436; c=relaxed/simple;
	bh=JaRdtAmG/aBVVoGezGVY9XvHQEh3BjeMocyDoFnu27k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aNRnjz2lbNAV9je9jx1PIO8r9VOFcJutAiVO88OkCI4wwkOVJGTk03Od6q+A+TtWb8miM8JX54AhM3jAXY2RC6VbrEWueVgNc65FM2ywqDFFxQz1qEJVrknoJOzR+uOM/L2tyqO7AGgm5TOzyw5JRo2J1tJVRRSaw32bt7gKJBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uZRNO5kB; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5a167b9df7eso906138a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jul 2024 03:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721383433; x=1721988233; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ncnxowO0dKQNeRgTlGsuN2AsFIskGsfKL/5xH//5Wcs=;
        b=uZRNO5kBCsh5bpj6NxS7uz563BazVCrXxVgmMjoG6aueedyExDQBJbL7F1A1ndRFxa
         mXjKUvANqNJJWdeDpEFFSMzgu/sITL/UHf95x/vANTRMBFWr+9POwDm8lT322QXTo6Gd
         0C/XMC+8tx+4XOj7VTmLpfxrF9yV7n8lp4oBlhD/TWhdr9HpW1M6BOKYeaPCJWdRdtRa
         6kktJ916MW8uj1OC/Dx/jud28v+txqZxoksLjUi/Cq93WcJjx68aAaoMhr65WB8yoZZi
         dzYmHttSPfWwLlQbUIupnGkKZq+zxtn70GN9wrXjWmordn2Npzx9x+sP7eVOh8KNwPQY
         ejlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721383433; x=1721988233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ncnxowO0dKQNeRgTlGsuN2AsFIskGsfKL/5xH//5Wcs=;
        b=C2r00QJj/qK+sutBTrYPHV8ZznG0MTMs3LwJz4Kf6hzLwlukUHJQ39/Ea5rgLuteZZ
         9GQRkYVtrXu4lzSQaTDvkvHo6xQldbluf6odzwycHXdsySshl6rE6sTRhcTdhkp7HbiC
         FfexcWXZdoudo7g22XsBR8n/fCjLOazXTpjOuGI0pmbgkhhMuxBg/2WHUBHzGA6Qv9nV
         wkJjstd3BJbneBRZ4RLW03t6Z8QSrPJQUn7cBv/alpT1LBlmNHr8CkkwPvGYJDcVfQfg
         KS15k43JHwl+1Y6mPaVxVBn0hlT9idXSQXTxAWk8vq9hAB74WoYEvUVytkB76/IipTDT
         /1yQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5fxC+005abfiSwHxEJ+8DyDbQ0D/te5xKKuOFrZLpKKoG59k8+ICy6MG4F0CsjFXLdWhvC0klgE+IDniNoiylMTnZ9UiDqUD2gkjRSQ==
X-Gm-Message-State: AOJu0Yx1NqTq6gj3bhzOurXx6Fwtc0ihsXH+Tk5n2xoWO+3DXPUPMEKR
	MbtcaFBF2X0tzio2odJHkVvBp0L6I1Xelnmgiho6LxGNa7uu1Exo8UgWv6WcBaY=
X-Google-Smtp-Source: AGHT+IGrK/LjcvYrCZfPpRzcYpKV89QxZNQN9PbHJitkiyif7HT6hYYn+oRnlJCAfm3lGptaQnl7AA==
X-Received: by 2002:a50:d7da:0:b0:5a1:bda1:3e23 with SMTP id 4fb4d7f45d1cf-5a1bda13e79mr2627029a12.14.1721383432801;
        Fri, 19 Jul 2024 03:03:52 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5a30aaa31e0sm919984a12.27.2024.07.19.03.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 03:03:52 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 19 Jul 2024 12:03:30 +0200
Subject: [PATCH 5/5] drm/msm/a6xx: Add A621 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240719-topic-a621-v1-5-850ae5307cf4@linaro.org>
References: <20240719-topic-a621-v1-0-850ae5307cf4@linaro.org>
In-Reply-To: <20240719-topic-a621-v1-0-850ae5307cf4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721383413; l=7367;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=JaRdtAmG/aBVVoGezGVY9XvHQEh3BjeMocyDoFnu27k=;
 b=ADDODhRNXrzr1tgbQPACCM6K+qdkFVA6ky23/Sj8al4neKyX2odC0vFGSkOxnFYA8Ppu6xyLb
 SKvz9AwlWRvBNYKBR6ZthaHbUNF+WEClZaj1wbjHZaB/sm1MULlOb2E
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

A621 is a clear A662 derivative (same lineage as A650), no explosions
or sick features, other than a NoC bug which can stall the GPU..

Add support for it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 78 ++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 18 +++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  6 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  5 ++
 4 files changed, 106 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index deee0b686962..d9d4a3e821f7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -129,6 +129,59 @@ static const struct adreno_reglist a615_hwcg[] = {
 	{},
 };
 
+static const struct adreno_reglist a620_hwcg[] = {
+	{REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x02222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
+	{REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000080},
+	{REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000f3cf},
+	{REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x02222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00022222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_TP0, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY3_TP0, 0x11111111},
+	{REG_A6XX_RBBM_CLOCK_DELAY4_TP0, 0x00011111},
+	{REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST3_TP0, 0x77777777},
+	{REG_A6XX_RBBM_CLOCK_HYST4_TP0, 0x00077777},
+	{REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x01002222},
+	{REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002220},
+	{REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x00040f00},
+	{REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x25222022},
+	{REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00005555},
+	{REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011},
+	{REG_A6XX_RBBM_CLOCK_HYST_RAC, 0x00445044},
+	{REG_A6XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222},
+	{REG_A6XX_RBBM_CLOCK_MODE_VFD, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_MODE_GPC, 0x00222222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ_2, 0x00000002},
+	{REG_A6XX_RBBM_CLOCK_MODE_HLSQ, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000},
+	{REG_A6XX_RBBM_CLOCK_DELAY_VFD, 0x00002222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_GPC, 0x00000200},
+	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_HYST_VFD, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_HYST_GPC, 0x04104004},
+	{REG_A6XX_RBBM_CLOCK_HYST_HLSQ, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_CNTL_TEX_FCHE, 0x00000222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_TEX_FCHE, 0x00000111},
+	{REG_A6XX_RBBM_CLOCK_HYST_TEX_FCHE, 0x00000777},
+	{REG_A6XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222},
+	{REG_A6XX_RBBM_CLOCK_HYST_UCHE, 0x00000004},
+	{REG_A6XX_RBBM_CLOCK_DELAY_UCHE, 0x00000002},
+	{REG_A6XX_RBBM_ISDB_CNT, 0x00000182},
+	{REG_A6XX_RBBM_RAC_THRESHOLD_CNT, 0x00000000},
+	{REG_A6XX_RBBM_SP_HYST_CNT, 0x00000000},
+	{REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222},
+	{REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111},
+	{REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555},
+	{},
+};
+
 static const struct adreno_reglist a630_hwcg[] = {
 	{REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222},
 	{REG_A6XX_RBBM_CLOCK_CNTL_SP1, 0x22222222},
@@ -490,7 +543,6 @@ static const u32 a630_protect_regs[] = {
 };
 DECLARE_ADRENO_PROTECT(a630_protect, 32);
 
-/* These are for a620 and a650 */
 static const u32 a650_protect_regs[] = {
 	A6XX_PROTECT_RDONLY(0x00000, 0x04ff),
 	A6XX_PROTECT_RDONLY(0x00501, 0x0005),
@@ -774,6 +826,30 @@ static const struct adreno_info a6xx_gpus[] = {
 			{ 169, 2 },
 			{ 180, 1 },
 		),
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x06020100),
+		.family = ADRENO_6XX_GEN3,
+		.fw = {
+			[ADRENO_FW_SQE] = "a650_sqe.fw",
+			[ADRENO_FW_GMU] = "a621_gmu.bin",
+		},
+		.gmem = SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_HAS_HW_APRIV,
+		.init = a6xx_gpu_init,
+		.zapfw = "a620_zap.mbn",
+		.a6xx = &(const struct a6xx_info) {
+			.hwcg = a620_hwcg,
+			.protect = &a650_protect,
+			.gmu_cgc_mode = 0x00020200,
+			.prim_fifo_threshold = 0x00010000,
+		},
+		.address_space_size = SZ_16G,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0, 0 },
+			{ 137, 1 },
+		),
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(
 			0x06030001,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 6f168f1f32d8..37927bdd6fbe 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -423,6 +423,20 @@ static int a6xx_gmu_gfx_rail_on(struct a6xx_gmu *gmu)
 	return a6xx_gmu_set_oob(gmu, GMU_OOB_BOOT_SLUMBER);
 }
 
+static void a6xx_gemnoc_workaround(struct a6xx_gmu *gmu)
+{
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+
+	/*
+	 * GEMNoC can power collapse whilst the GPU is being powered down, resulting
+	 * in the power down sequence not being fully executed. That in turn can
+	 * prevent CX_GDSC from collapsing. Assert Qactive to avoid this.
+	 */
+	if (adreno_is_a621(adreno_gpu) || adreno_is_7c3(adreno_gpu))
+		gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, BIT(0));
+}
+
 /* Let the GMU know that we are about to go into slumber */
 static int a6xx_gmu_notify_slumber(struct a6xx_gmu *gmu)
 {
@@ -456,6 +470,8 @@ static int a6xx_gmu_notify_slumber(struct a6xx_gmu *gmu)
 	}
 
 out:
+	a6xx_gemnoc_workaround(gmu);
+
 	/* Put fence into allow mode */
 	gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, 0);
 	return ret;
@@ -945,6 +961,8 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
 	/* Force off SPTP in case the GMU is managing it */
 	a6xx_sptprac_disable(gmu);
 
+	a6xx_gemnoc_workaround(gmu);
+
 	/* Make sure there are no outstanding RPMh votes */
 	a6xx_gmu_rpmh_off(gmu);
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 33a319f7d200..f2eca69613af 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -523,6 +523,12 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	if (adreno_is_a619_holi(gpu))
 		gpu->ubwc_config.highest_bank_bit = 13;
 
+	if (adreno_is_a621(gpu)) {
+		gpu->ubwc_config.highest_bank_bit = 13;
+		gpu->ubwc_config.amsbc = 1;
+		gpu->ubwc_config.uavflagprd_inv = 2;
+	}
+
 	if (adreno_is_a640_family(gpu))
 		gpu->ubwc_config.amsbc = 1;
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 26972b2cc896..ea2c25e007eb 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -384,6 +384,11 @@ static inline int adreno_is_a619_holi(const struct adreno_gpu *gpu)
 	return adreno_is_a619(gpu) && adreno_has_gmu_wrapper(gpu);
 }
 
+static inline int adreno_is_a621(const struct adreno_gpu *gpu)
+{
+	return gpu->info->chip_ids[0] == 0x06020100;
+}
+
 static inline int adreno_is_a630(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 630);

-- 
2.45.2


