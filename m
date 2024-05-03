Return-Path: <linux-arm-msm+bounces-19183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EF18BADF3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 May 2024 15:43:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5336F1F225DF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 May 2024 13:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70AA61474BF;
	Fri,  3 May 2024 13:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wq94fX7j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E2E153BCD
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 May 2024 13:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714743803; cv=none; b=NXu/rTnkFJJDTmg6XXPA7OvUcG+XFt6f8bfHaMkgVIbdm4pECe7uD4GqJkLCLMx03iMRV0o8Y/sCEhg6qOdBU02DU1AfM1dfCcZixb1KqcWyzLulLsv5jv/RBIIG/SKneUUISFe3mN1AMntlZWUpNmAXu5t7dYyONbrL/LnJ3j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714743803; c=relaxed/simple;
	bh=/4c8RXHe1ZwfY3zxF3/XsbJWUAdPAwCtivQ4EVfABN8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jNKsD3wAZcKBWihYTw9K3xTBtoLcdVSzgfITtdHcqHx0M6uaRtuEgZVFMR+9ynLcOD205Q3XdnOFZNUR3dY8TuIwirE8bJLJJhi4E3F/xzIqApXWhqJaEo4XVqO+JolwkbKzumb+LZLI+BRiB0dYCYNQ8pLfatB54QEtbBDJONg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wq94fX7j; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-34ddc9fe4a1so1528126f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 May 2024 06:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714743800; x=1715348600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A61biRqVJhTnScYcORs7EQzF8Fv421/of/urY8VoZKs=;
        b=Wq94fX7jw84xHc3EKxMInxEk29FGQ0F8KbOWhlMqh20HO2YVqpBRrhpaFEqbD86GYY
         2dqsp6QRO10/jORIQyV2uKxRLBPth6XWx8e3nHrm51+AIYDHBLaV64EDc6y3JMtApMjI
         IDH5+3XcXnZWzZ54/6UisYD6sHhUtDNtCqaiLNp8HKL5MyYIzU9HU1HKurlBQOKlzaXY
         /SQt4gw+X3p1LmeWWQioea+oVZsKzY8LvLr+aVV1148FdIjpFnCcrA1Ob48zdtJEcfgp
         WWN487/yweoxUl5hMerrLKIkf71xMagsT/e+/TQyNof+aTDKNWAE3NZSA+5UB+WGeMyU
         8ofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714743800; x=1715348600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A61biRqVJhTnScYcORs7EQzF8Fv421/of/urY8VoZKs=;
        b=aCYP/datwqMnly0D0lSSj3Z6r3Cm4TYmfj2OJQq5HbmbrWo1bhJYncQbmTkYP39Age
         GS3IEpMXs4+7hiWIGaZ7FQ81cfE7Ffbh1oWsta/q9YyExbAIpPkLrzYJMa1/J+N2OsrS
         fJ1KvUvweysDtcmvmoiqubF/FTRTuIFSiyNgmz1vMHDmdQuPyriIH9/0bOtRtYl24y6s
         vQyW1iT0qR7Bp+1j7gQPGs2EPurTZZ9S98hEKSHcsAuHycyLcJFJNFa1hLptrtPMomhD
         F8RmCgUwdeoAde8Im9C64LR87VB2dvBvknnvLQyGP8D3KKpD84akEFvBlqGAZu441Tgu
         sf4Q==
X-Gm-Message-State: AOJu0YxGnplN+NcqNtOPUd82zISXVsHHZH7bXz65BljARomlD3I9tAtN
	4y5z9vBrUX8k+oLrirN50+Eo0z9q3Qb89rUK6MOKPhzjGvTuFYaS
X-Google-Smtp-Source: AGHT+IGeBs+/NaST6xGUoIqoV0OI2JKKgiJLp0/yciabgHI21S2gcM7i6idpB13zgcpw02hT2tYn1w==
X-Received: by 2002:a5d:55c9:0:b0:34c:77dd:b1b5 with SMTP id i9-20020a5d55c9000000b0034c77ddb1b5mr2154598wrw.15.1714743799832;
        Fri, 03 May 2024 06:43:19 -0700 (PDT)
Received: from [192.168.0.20] (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id z18-20020adff1d2000000b0034df178a9acsm3782482wro.99.2024.05.03.06.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 06:43:19 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 03 May 2024 14:42:34 +0100
Subject: [PATCH 5/5] drm/msm: Add devcoredump support for a750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240503-a750-devcoredump-v1-5-04e669e2c3f7@gmail.com>
References: <20240503-a750-devcoredump-v1-0-04e669e2c3f7@gmail.com>
In-Reply-To: <20240503-a750-devcoredump-v1-0-04e669e2c3f7@gmail.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714743792; l=6513;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=/4c8RXHe1ZwfY3zxF3/XsbJWUAdPAwCtivQ4EVfABN8=;
 b=SUWbcnHWPBpkG17Ay17aBCjwtDqiMsXLO/etk5Ic+mDelpaLqOlmcJMJKN6gR0KkhLxV4GjwA
 T5ZHwZvTuM+AeYJG+1jhOrpolN2SPjJao+1lXSVnkGmDlxmwaxUfQLd
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

Add an a750 case to the various places where we choose a list of
registers.
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 64 +++++++++++++++++++++--------
 1 file changed, 46 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index bb0592af41f3..77146d30bcaa 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -13,9 +13,11 @@
  */
 #pragma GCC diagnostic push
 #pragma GCC diagnostic ignored "-Wunused-variable"
+#pragma GCC diagnostic ignored "-Wunused-const-variable"
 
 #include "adreno_gen7_0_0_snapshot.h"
 #include "adreno_gen7_2_0_snapshot.h"
+#include "adreno_gen7_9_0_snapshot.h"
 
 #pragma GCC diagnostic pop
 
@@ -384,21 +386,29 @@ static void a7xx_get_debugbus_blocks(struct msm_gpu *gpu,
 		struct a6xx_gpu_state *a6xx_state)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
-	int debugbus_blocks_count, total_debugbus_blocks;
-	const u32 *debugbus_blocks;
+	int debugbus_blocks_count, gbif_debugbus_blocks_count, total_debugbus_blocks;
+	const u32 *debugbus_blocks, *gbif_debugbus_blocks;
 	int i;
 
 	if (adreno_is_a730(adreno_gpu)) {
 		debugbus_blocks = gen7_0_0_debugbus_blocks;
 		debugbus_blocks_count = ARRAY_SIZE(gen7_0_0_debugbus_blocks);
-	} else {
-		BUG_ON(!adreno_is_a740_family(adreno_gpu));
+		gbif_debugbus_blocks = a7xx_gbif_debugbus_blocks;
+		gbif_debugbus_blocks_count = ARRAY_SIZE(a7xx_gbif_debugbus_blocks);
+	} else if (adreno_is_a740_family(adreno_gpu)) {
 		debugbus_blocks = gen7_2_0_debugbus_blocks;
 		debugbus_blocks_count = ARRAY_SIZE(gen7_2_0_debugbus_blocks);
+		gbif_debugbus_blocks = a7xx_gbif_debugbus_blocks;
+		gbif_debugbus_blocks_count = ARRAY_SIZE(a7xx_gbif_debugbus_blocks);
+	} else {
+		BUG_ON(!adreno_is_a750(adreno_gpu));
+		debugbus_blocks = gen7_9_0_debugbus_blocks;
+		debugbus_blocks_count = ARRAY_SIZE(gen7_9_0_debugbus_blocks);
+		gbif_debugbus_blocks = gen7_9_0_gbif_debugbus_blocks;
+		gbif_debugbus_blocks_count = ARRAY_SIZE(gen7_9_0_gbif_debugbus_blocks);
 	}
 
-	total_debugbus_blocks = debugbus_blocks_count +
-		ARRAY_SIZE(a7xx_gbif_debugbus_blocks);
+	total_debugbus_blocks = debugbus_blocks_count + gbif_debugbus_blocks_count;
 
 	a6xx_state->debugbus = state_kcalloc(a6xx_state, total_debugbus_blocks,
 			sizeof(*a6xx_state->debugbus));
@@ -410,9 +420,9 @@ static void a7xx_get_debugbus_blocks(struct msm_gpu *gpu,
 				&a6xx_state->debugbus[i]);
 		}
 
-		for (i = 0; i < ARRAY_SIZE(a7xx_gbif_debugbus_blocks); i++) {
+		for (i = 0; i < gbif_debugbus_blocks_count; i++) {
 			a6xx_get_debugbus_block(gpu,
-				a6xx_state, &a7xx_debugbus_blocks[a7xx_gbif_debugbus_blocks[i]],
+				a6xx_state, &a7xx_debugbus_blocks[gbif_debugbus_blocks[i]],
 				&a6xx_state->debugbus[i + debugbus_blocks_count]);
 		}
 	}
@@ -813,10 +823,13 @@ static void a7xx_get_clusters(struct msm_gpu *gpu,
 	if (adreno_is_a730(adreno_gpu)) {
 		clusters = gen7_0_0_clusters;
 		clusters_size = ARRAY_SIZE(gen7_0_0_clusters);
-	} else {
-		BUG_ON(!adreno_is_a740_family(adreno_gpu));
+	} else if (adreno_is_a740_family(adreno_gpu)) {
 		clusters = gen7_2_0_clusters;
 		clusters_size = ARRAY_SIZE(gen7_2_0_clusters);
+	} else {
+		BUG_ON(!adreno_is_a750(adreno_gpu));
+		clusters = gen7_9_0_clusters;
+		clusters_size = ARRAY_SIZE(gen7_9_0_clusters);
 	}
 
 	a6xx_state->clusters = state_kcalloc(a6xx_state,
@@ -948,10 +961,13 @@ static void a7xx_get_shaders(struct msm_gpu *gpu,
 	if (adreno_is_a730(adreno_gpu)) {
 		shader_blocks = gen7_0_0_shader_blocks;
 		num_shader_blocks = ARRAY_SIZE(gen7_0_0_shader_blocks);
-	} else {
-		BUG_ON(!adreno_is_a740_family(adreno_gpu));
+	} else if (adreno_is_a740_family(adreno_gpu)) {
 		shader_blocks = gen7_2_0_shader_blocks;
 		num_shader_blocks = ARRAY_SIZE(gen7_2_0_shader_blocks);
+	} else {
+		BUG_ON(!adreno_is_a750(adreno_gpu));
+		shader_blocks = gen7_9_0_shader_blocks;
+		num_shader_blocks = ARRAY_SIZE(gen7_9_0_shader_blocks);
 	}
 
 	a6xx_state->shaders = state_kcalloc(a6xx_state,
@@ -1337,10 +1353,13 @@ static void a7xx_get_registers(struct msm_gpu *gpu,
 	if (adreno_is_a730(adreno_gpu)) {
 		reglist = gen7_0_0_reg_list;
 		pre_crashdumper_regs = gen7_0_0_pre_crashdumper_gpu_registers;
-	} else {
-		BUG_ON(!adreno_is_a740_family(adreno_gpu));
+	} else if (adreno_is_a740_family(adreno_gpu)) {
 		reglist = gen7_2_0_reg_list;
 		pre_crashdumper_regs = gen7_0_0_pre_crashdumper_gpu_registers;
+	} else {
+		BUG_ON(!adreno_is_a750(adreno_gpu));
+		reglist = gen7_9_0_reg_list;
+		pre_crashdumper_regs = gen7_9_0_pre_crashdumper_gpu_registers;
 	}
 
 	count = A7XX_PRE_CRASHDUMPER_SIZE + A7XX_POST_CRASHDUMPER_SIZE;
@@ -1388,7 +1407,8 @@ static void a7xx_get_post_crashdumper_registers(struct msm_gpu *gpu,
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	const u32 *regs;
 
-	BUG_ON(!(adreno_is_a730(adreno_gpu) || adreno_is_a740_family(adreno_gpu)));
+	BUG_ON(!(adreno_is_a730(adreno_gpu) || adreno_is_a740_family(adreno_gpu) ||
+		 adreno_is_a750(adreno_gpu)));
 	regs = gen7_0_0_post_crashdumper_registers;
 
 	a7xx_get_ahb_gpu_registers(gpu,
@@ -1491,10 +1511,18 @@ static void a7xx_get_indexed_registers(struct msm_gpu *gpu,
 		struct a6xx_gpu_state *a6xx_state)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	const struct a6xx_indexed_registers *indexed_regs;
 	int i, indexed_count, mempool_count;
 
-	BUG_ON(!(adreno_is_a730(adreno_gpu) || adreno_is_a740_family(adreno_gpu)));
-	indexed_count = ARRAY_SIZE(a7xx_indexed_reglist);
+	if (adreno_is_a730(adreno_gpu) || adreno_is_a740_family(adreno_gpu)) {
+		indexed_regs = a7xx_indexed_reglist;
+		indexed_count = ARRAY_SIZE(a7xx_indexed_reglist);
+	} else {
+		BUG_ON(!adreno_is_a750(adreno_gpu));
+		indexed_regs = gen7_9_0_cp_indexed_reg_list;
+		indexed_count = ARRAY_SIZE(gen7_9_0_cp_indexed_reg_list);
+	}
+
 	mempool_count = ARRAY_SIZE(a7xx_cp_bv_mempool_indexed);
 
 	a6xx_state->indexed_regs = state_kcalloc(a6xx_state,
@@ -1507,7 +1535,7 @@ static void a7xx_get_indexed_registers(struct msm_gpu *gpu,
 
 	/* First read the common regs */
 	for (i = 0; i < indexed_count; i++)
-		a6xx_get_indexed_regs(gpu, a6xx_state, &a7xx_indexed_reglist[i],
+		a6xx_get_indexed_regs(gpu, a6xx_state, &indexed_regs[i],
 			&a6xx_state->indexed_regs[i]);
 
 	gpu_rmw(gpu, REG_A6XX_CP_CHICKEN_DBG, 0, BIT(2));

-- 
2.31.1


