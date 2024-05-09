Return-Path: <linux-arm-msm+bounces-19594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8578C1221
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 17:41:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 541BC1F220BB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 15:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 204EA16F26E;
	Thu,  9 May 2024 15:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TOLUgBfi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6004516F271
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 May 2024 15:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715269303; cv=none; b=WziS/GkJVCEWwylNWHvG9/TrvpY+QyHqQwjTwEo677rU6hSzBRsHrwrQNy1FcWViDU3OOrpLDCII3QP9BQoOg16C5EulbNF2RthRDlmySJTxRTTwsRF8aIsp2Lllu/h2z6jS7d6nYUc26u3e88TzsHS1Ua5kZTtaTE4ohEdceDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715269303; c=relaxed/simple;
	bh=YDTMlYTd8Jl+1LbuEOwzVy2qVGX9nsvbpTUbbqpunaM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bP1fQQf6+S1tMseWQx8neLf83J4I+3PLa1VsW+YMw0LKXwEx7Y46qSch82YJizIlyWVcR7cGg6EAzQUOFZ2f+6gfygf2VHsIWEx+ZJdb5M+vAtwarKNvaRqFVOGHPQP+Aa+8nGIQko6rf7/7Uqb7dSFCGQP7jY2lMYol9gI82yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TOLUgBfi; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2e242b1dfd6so13109531fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 May 2024 08:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715269299; x=1715874099; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MHCgfOjCAWuaCf+wlNyjS/SdCnZB5VMR+4B9ySlLbTk=;
        b=TOLUgBfi++4EV1OsrHY5u6zEi7RLi/t4CeZmc8u80ggI6hlU8IAVMT0tu82ZRbVqER
         6AkZnWRv9GkLcXCWIXJ6uq4YXDAaMQS769rzlBGEqDXV/KhJzs32l5tfXkcSo4Pq0Ddu
         OfayXYVzJPuIlpRIiwQ9/hoGQBwa05nXpZczVpN1xxkpZMo+7wFxAvhHG6lvUL3COGRw
         fdkUBh7rk9Wa2oXb72Q2vY5gK2EuJlIIKBOctS8m+HMdLHefsKl2vytq7Qpb1ppV21vF
         FjOxRIPDYAGgth2ZXZ4bbEvgLhyp45g0wqLmxiaq6F3/+j8du5qlN1i8+c07JlWkQQHS
         43KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715269299; x=1715874099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MHCgfOjCAWuaCf+wlNyjS/SdCnZB5VMR+4B9ySlLbTk=;
        b=mz5eH6zRHgHiRUTwFo1rQVgb914bqvK6yXcfq5+RCmxxTLXSWoty8fIdPYQTS/AXg3
         gbf9hwh6PunA24LfKV6L2koamnlMN1c/LMPL1vKZRQc79Ddblhs8L/xh0ahoCxd557Jd
         wbuG8BAhcJ9TNDsCVxOznN+zn0BMlFtAGTccZDvsB/Mh1XGxgE+4Ab5gIM03WWh0lsQq
         +lkLjrE2QdKtF/aH7+mUFFlQGrKPD8NWHBZvcKsNh3IvDqUkxQuJ2XriGIiRCRbedFMK
         O3Ncz+pnlodXi/qJswNzPnNoaB2DQ22flotPi58ml60PDsXJaD45YgVNBm7M4vM4gYiZ
         yx7Q==
X-Gm-Message-State: AOJu0YwqNTEYM3V91WbUmPQt2qUa63vPmkP+EBbLe35QSmrAIvJg1/Mg
	lj5aI0aENcaJBeltLm5GIgSFoslyYkKFlAqqOUcGpf9fa72Y5LeJ
X-Google-Smtp-Source: AGHT+IGW47YrANCiM7MAOv1YCC4wAKiyKqY/iX4tT8I3a2vjfykMHd5JV7q+HsYEiB/NPT6K68bqDQ==
X-Received: by 2002:a05:651c:11d3:b0:2e2:f2d:b8ad with SMTP id 38308e7fff4ca-2e447084a8amr35217221fa.26.1715269299347;
        Thu, 09 May 2024 08:41:39 -0700 (PDT)
Received: from [192.168.0.20] (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce1b17sm29577555e9.12.2024.05.09.08.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 08:41:38 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 09 May 2024 16:41:34 +0100
Subject: [PATCH 2/2] drm/msm: Dump correct dbgahb clusters on a750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240509-a750-devcoredump-fixes-v1-2-60cc99e2147d@gmail.com>
References: <20240509-a750-devcoredump-fixes-v1-0-60cc99e2147d@gmail.com>
In-Reply-To: <20240509-a750-devcoredump-fixes-v1-0-60cc99e2147d@gmail.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715269296; l=1299;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=YDTMlYTd8Jl+1LbuEOwzVy2qVGX9nsvbpTUbbqpunaM=;
 b=BKxi8bwquihpob2UmeuDEeaUfWIOAKCHgPIrTzz/DiJ4w779kGeQf/VyOcZzZ0xd9qyIt1H7j
 Y3w+RuiAezpBAIKcybt38M7n75/2t5DOEoVNJ1g+mM0TfEV2EuG1MUZ
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

This was missed thanks to the family mixup fixed in the previous commit.

Fixes: f3f8207d8aed ("drm/msm: Add devcoredump support for a750")
Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index c641ee7dec78..69f3b942ce9d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -665,10 +665,13 @@ static void a7xx_get_dbgahb_clusters(struct msm_gpu *gpu,
 	if (adreno_gpu->info->family == ADRENO_7XX_GEN1) {
 		dbgahb_clusters = gen7_0_0_sptp_clusters;
 		dbgahb_clusters_size = ARRAY_SIZE(gen7_0_0_sptp_clusters);
-	} else {
-		BUG_ON(adreno_gpu->info->family > ADRENO_7XX_GEN3);
+	} else if (adreno_gpu->info->family == ADRENO_7XX_GEN2) {
 		dbgahb_clusters = gen7_2_0_sptp_clusters;
 		dbgahb_clusters_size = ARRAY_SIZE(gen7_2_0_sptp_clusters);
+	} else {
+		BUG_ON(adreno_gpu->info->family != ADRENO_7XX_GEN3);
+		dbgahb_clusters = gen7_9_0_sptp_clusters;
+		dbgahb_clusters_size = ARRAY_SIZE(gen7_9_0_sptp_clusters);
 	}
 
 	a6xx_state->dbgahb_clusters = state_kcalloc(a6xx_state,

-- 
2.31.1


