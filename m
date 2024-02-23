Return-Path: <linux-arm-msm+bounces-12420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 799DD861ED5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 22:23:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF9FF1F242DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 21:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9F5B14DFF3;
	Fri, 23 Feb 2024 21:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v+FTPPiR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AC814DFDF
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Feb 2024 21:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708723321; cv=none; b=twaPEmiYzeHJqTuPODqw1m6sF9MWRh1hts4BWCPd+OT5zgBGXiiZnJ75k84MK6Io+Hcj8KAIT8+YhzkbDGhngr8aJZF10xpnLODGkQF0O81Jp9nIW7+VMq4mrxA3ekidTVnotxUPBTSg/8A27dsEENH5mZPugkZ067klxkSJx8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708723321; c=relaxed/simple;
	bh=/obkr4MMIdqspTXLmZcuivEDxO3xqayOzHksqJVGMAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JkHdOXwX+b8hm34sxXsLBZttd38RwCeNAeV4UStiULWz8V0bucqvPIt4q+spvRi/EnivXX9q+mmz4Hx3x1N9gXQC++Li9fipjTetBE62G8JDiXPgQfbi/K1h37xKJqWdJlKchLMsVgSbU3qdN5d7TL50UpV5SNce9opNq1VUzDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v+FTPPiR; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a3e6f79e83dso108564566b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Feb 2024 13:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708723318; x=1709328118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+hQ3SpYizIIEdO8h/cb2gS2gZ6yJ1jbKnG/M424eunA=;
        b=v+FTPPiRLqOROWjURKdaulEH11r+NrbujoVLaEMbjMGYy9XaCNV+juKbBqqVGO0yUk
         oXD2XxZBqoWfB8HFGmX7+I7SeYjJAGI8NcklWcCejXQnJcy9Xj7DSnrZrYlduC4jT4fy
         pRod0eE9OKTZKbU07L4jzhS2usr9jEDmhDYxz0kHkP+a8ckp6hK2kiiqCDVcx0aKWvKT
         mEV5NEppYckJN/51UfiBPx/BIbZVjbIbs6oPne8ULkR2fQYHGCySk+CRvzEj38yRCAQz
         RQKPFqIKNCQ0IqpFKuqZdFx+9BiqpxRQ3SuARkdZ35ULrHOk6mYYNQ+hDrG9WAh3Kxv8
         cVJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708723318; x=1709328118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+hQ3SpYizIIEdO8h/cb2gS2gZ6yJ1jbKnG/M424eunA=;
        b=S6kRkxsqZrNQe5h+To4eSYjSl8JNkw7e2j+Zp1T2axWpFyIhRL2I/6GNnKuByOdsu+
         sCrvFh9R/I7Fep3pYGgs1N2GCdhGxY3jOUY+eSr8ElVqy1JXT9kL8R4yAeeFGSXnURpL
         gNhE2uEIr4etfPjYdeohuuQFG9OC4bOozxAX3ks7imzX+VQhRnI4rDa4xNCGzPB506if
         ATRMzQB+cs8Nl2fQjK5PH9Y7aQhJnmNcmGwIx9EKoiVexISHKrKWY5dQ9X9I2Z3CPJRf
         QjzDOLyo+0smgn/C5V4/5Jhc6eh17Iu7IkVmeJDhbVkusIPtu4QTZjnAhN70ESrpUpf1
         TxsA==
X-Forwarded-Encrypted: i=1; AJvYcCW4tmxRKtrxZPrITxNq9+7mZYTYWtb3AiIU832KqnLzT7/ksrKVMamnxMgY+Oc2EeFAL07aiwNkDw8R32NonqjnPVWS4/cK0U1Hp5yoKg==
X-Gm-Message-State: AOJu0YzePMwXxqJEmmR0vYQI3GoUyMIhzoOIJzYo2qtnNFTcvqH0oDaf
	xImRGzbDlpk6VwEez1Cu8HXmW0AC4a7qrSJ0b8dB2U7vypjqoQCsAzu4tnJL9+w=
X-Google-Smtp-Source: AGHT+IGT2W+inJ5mu4XwVKxW6JI0EEqx3LbPDQ4lO11OsxNs4YZ2Cy/N+nePCCx8UipRF2D18K6sEQ==
X-Received: by 2002:a17:906:b24c:b0:a3e:d20a:f1d9 with SMTP id ce12-20020a170906b24c00b00a3ed20af1d9mr640449ejb.11.1708723318103;
        Fri, 23 Feb 2024 13:21:58 -0800 (PST)
Received: from [10.167.154.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id mj8-20020a170906af8800b00a3ee9305b02sm4091226ejb.20.2024.02.23.13.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 13:21:57 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 23 Feb 2024 22:21:41 +0100
Subject: [PATCH v2 5/7] drm/msm/adreno: Add A702 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240219-topic-rb1_gpu-v2-5-2d3d6a0db040@linaro.org>
References: <20240219-topic-rb1_gpu-v2-0-2d3d6a0db040@linaro.org>
In-Reply-To: <20240219-topic-rb1_gpu-v2-0-2d3d6a0db040@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708723303; l=11199;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=/obkr4MMIdqspTXLmZcuivEDxO3xqayOzHksqJVGMAk=;
 b=iGpmkAcmm3fUbJiZftbO7EpEpe4DIzzUNqVGtKPVhzZmXwEUWIJSo4843rvERaJTE7dZTmzfM
 ZSadIeZnX4KBEFOGTgBXMmMGV/r2k1BMLZgPIPpwlsGsHhXVhyfXeRV
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The A702 is a weird mix of 600 and 700 series.. Perhaps even a
testing ground for some A7xx features with good ol' A6xx silicon.
It's basically A610 that's been beefed up with some new registers
and hw features (like APRIV!), that was then cut back in size,
memory bus and some other ways.

Add support for it, tested with QCM2290 / RB1.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 92 +++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 18 ++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 16 +++++-
 3 files changed, 117 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c9c55e2ea584..2a491a486ca1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -837,6 +837,65 @@ const struct adreno_reglist a690_hwcg[] = {
 	{}
 };
 
+const struct adreno_reglist a702_hwcg[] = {
+	{ REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000081 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000f3cf },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00022222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_TP0, 0x11111111 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY3_TP0, 0x11111111 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY4_TP0, 0x00011111 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x77777777 },
+	{ REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777 },
+	{ REG_A6XX_RBBM_CLOCK_HYST3_TP0, 0x77777777 },
+	{ REG_A6XX_RBBM_CLOCK_HYST4_TP0, 0x00077777 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x01202222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002220 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x00040f00 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x05522022 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00005555 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_RAC, 0x00445044 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222 },
+	{ REG_A6XX_RBBM_CLOCK_MODE_VFD, 0x00002222 },
+	{ REG_A6XX_RBBM_CLOCK_MODE_GPC, 0x02222222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_HLSQ_2, 0x00000002 },
+	{ REG_A6XX_RBBM_CLOCK_MODE_HLSQ, 0x00002222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_VFD, 0x00002222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_GPC, 0x00000200 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_VFD, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_GPC, 0x04104004 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_HLSQ, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_UCHE, 0x00000004 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_UCHE, 0x00000002 },
+	{ REG_A6XX_RBBM_ISDB_CNT, 0x00000182 },
+	{ REG_A6XX_RBBM_RAC_THRESHOLD_CNT, 0x00000000 },
+	{ REG_A6XX_RBBM_SP_HYST_CNT, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_FCHE, 0x00000222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_FCHE, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_FCHE, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_GLC, 0x00222222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_GLC, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_GLC, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_MHUB, 0x00000002 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_MHUB, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_MHUB, 0x00000000 },
+	{}
+};
+
 const struct adreno_reglist a730_hwcg[] = {
 	{ REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x02222222 },
 	{ REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02022222 },
@@ -968,6 +1027,8 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 		clock_cntl_on = 0x8aa8aa02;
 	else if (adreno_is_a610(adreno_gpu))
 		clock_cntl_on = 0xaaa8aa82;
+	else if (adreno_is_a702(adreno_gpu))
+		clock_cntl_on = 0xaaaaaa82;
 	else
 		clock_cntl_on = 0x8aa8aa82;
 
@@ -989,14 +1050,14 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 		return;
 
 	/* Disable SP clock before programming HWCG registers */
-	if (!adreno_is_a610(adreno_gpu) && !adreno_is_a7xx(adreno_gpu))
+	if (!adreno_is_a610_family(adreno_gpu) && !adreno_is_a7xx(adreno_gpu))
 		gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 1, 0);
 
 	for (i = 0; (reg = &adreno_gpu->info->hwcg[i], reg->offset); i++)
 		gpu_write(gpu, reg->offset, state ? reg->value : 0);
 
 	/* Enable SP clock */
-	if (!adreno_is_a610(adreno_gpu) && !adreno_is_a7xx(adreno_gpu))
+	if (!adreno_is_a610_family(adreno_gpu) && !adreno_is_a7xx(adreno_gpu))
 		gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 0, 1);
 
 	gpu_write(gpu, REG_A6XX_RBBM_CLOCK_CNTL, state ? clock_cntl_on : 0);
@@ -1224,7 +1285,7 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 	const u32 *regs = a6xx_protect;
 	unsigned i, count, count_max;
 
-	if (adreno_is_a650(adreno_gpu)) {
+	if (adreno_is_a650(adreno_gpu) || adreno_is_a702(adreno_gpu)) {
 		regs = a650_protect;
 		count = ARRAY_SIZE(a650_protect);
 		count_max = 48;
@@ -1320,6 +1381,12 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 		gpu->ubwc_config.rgb565_predicator = 1;
 		gpu->ubwc_config.uavflagprd_inv = 2;
 	}
+
+	if (adreno_is_a702(gpu)) {
+		gpu->ubwc_config.highest_bank_bit = 14;
+		gpu->ubwc_config.min_acc_len = 1;
+		gpu->ubwc_config.ubwc_mode = 2;
+	}
 }
 
 static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
@@ -1453,7 +1520,7 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
 		return false;
 
 	/* A7xx is safe! */
-	if (adreno_is_a7xx(adreno_gpu))
+	if (adreno_is_a7xx(adreno_gpu) || adreno_is_a702(adreno_gpu))
 		return true;
 
 	/*
@@ -1671,7 +1738,7 @@ static int hw_init(struct msm_gpu *gpu)
 	a6xx_set_hwcg(gpu, true);
 
 	/* VBIF/GBIF start*/
-	if (adreno_is_a610(adreno_gpu) ||
+	if (adreno_is_a610_family(adreno_gpu) ||
 	    adreno_is_a640_family(adreno_gpu) ||
 	    adreno_is_a650_family(adreno_gpu) ||
 	    adreno_is_a7xx(adreno_gpu)) {
@@ -1705,6 +1772,7 @@ static int hw_init(struct msm_gpu *gpu)
 	}
 
 	if (!(adreno_is_a650_family(adreno_gpu) ||
+	      adreno_is_a702(adreno_gpu) ||
 	      adreno_is_a730(adreno_gpu))) {
 		gmem_range_min = adreno_is_a740_family(adreno_gpu) ? SZ_16M : SZ_1M;
 
@@ -1725,7 +1793,7 @@ static int hw_init(struct msm_gpu *gpu)
 	if (adreno_is_a640_family(adreno_gpu) || adreno_is_a650_family(adreno_gpu)) {
 		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x02000140);
 		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_1, 0x8040362c);
-	} else if (adreno_is_a610(adreno_gpu)) {
+	} else if (adreno_is_a610_family(adreno_gpu)) {
 		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x00800060);
 		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_1, 0x40201b16);
 	} else if (!adreno_is_a7xx(adreno_gpu)) {
@@ -1740,13 +1808,18 @@ static int hw_init(struct msm_gpu *gpu)
 	if (adreno_is_a610(adreno_gpu)) {
 		gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, 48);
 		gpu_write(gpu, REG_A6XX_CP_MEM_POOL_DBG_ADDR, 47);
+	} else if (adreno_is_a702(adreno_gpu)) {
+		gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, 64);
+		gpu_write(gpu, REG_A6XX_CP_MEM_POOL_DBG_ADDR, 63);
 	} else if (!adreno_is_a7xx(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, 128);
 
 	/* Setting the primFifo thresholds default values,
 	 * and vccCacheSkipDis=1 bit (0x200) for A640 and newer
 	*/
-	if (adreno_is_a690(adreno_gpu))
+	if (adreno_is_a702(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x0000c000);
+	else if (adreno_is_a690(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00800200);
 	else if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
@@ -1786,7 +1859,7 @@ static int hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x4fffff);
 	else if (adreno_is_a619(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x3fffff);
-	else if (adreno_is_a610(adreno_gpu))
+	else if (adreno_is_a610(adreno_gpu) || adreno_is_a702(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x3ffff);
 	else
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x1fffff);
@@ -1822,6 +1895,9 @@ static int hw_init(struct msm_gpu *gpu)
 		else
 			gpu_write(gpu, REG_A6XX_CP_CHICKEN_DBG, 0x1);
 		gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x0);
+	} else if (adreno_is_a702(adreno_gpu)) {
+		/* Something to do with the HLSQ cluster */
+		gpu_write(gpu, REG_A6XX_CP_CHICKEN_DBG, BIT(24));
 	}
 
 	if (adreno_is_a690(adreno_gpu))
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 2ce7d7b1690d..b121abc71338 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -492,6 +492,24 @@ static const struct adreno_info gpulist[] = {
 		.zapfw = "a690_zap.mdt",
 		.hwcg = a690_hwcg,
 		.address_space_size = SZ_16G,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x07000200),
+		.family = ADRENO_6XX_GEN1, /* NOT a mistake! */
+		.fw = {
+			[ADRENO_FW_SQE] = "a702_sqe.fw",
+		},
+		.gmem = SZ_128K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
+		.init = a6xx_gpu_init,
+		.zapfw = "a702_zap.mbn",
+		.hwcg = a702_hwcg,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 236, 1 },
+			{ 178, 2 },
+			{ 142, 3 },
+		),
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x07030001),
 		.family = ADRENO_7XX_GEN1,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index bc14df96feb0..f451881a6ddf 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -77,7 +77,7 @@ struct adreno_reglist {
 };
 
 extern const struct adreno_reglist a612_hwcg[], a615_hwcg[], a630_hwcg[], a640_hwcg[], a650_hwcg[];
-extern const struct adreno_reglist a660_hwcg[], a690_hwcg[], a730_hwcg[], a740_hwcg[];
+extern const struct adreno_reglist a660_hwcg[], a690_hwcg[], a702_hwcg[], a730_hwcg[], a740_hwcg[];
 
 struct adreno_speedbin {
 	uint16_t fuse;
@@ -382,6 +382,20 @@ static inline int adreno_is_a690(const struct adreno_gpu *gpu)
 	return gpu->info->chip_ids[0] == 0x06090000;
 }
 
+static inline int adreno_is_a702(const struct adreno_gpu *gpu)
+{
+	return gpu->info->chip_ids[0] == 0x07000200;
+}
+
+static inline int adreno_is_a610_family(const struct adreno_gpu *gpu)
+{
+	if (WARN_ON_ONCE(!gpu->info))
+		return false;
+
+	/* TODO: A612 */
+	return adreno_is_a610(gpu) || adreno_is_a702(gpu);
+}
+
 /* check for a615, a616, a618, a619 or any a630 derivatives */
 static inline int adreno_is_a630_family(const struct adreno_gpu *gpu)
 {

-- 
2.43.2


