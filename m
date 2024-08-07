Return-Path: <linux-arm-msm+bounces-28084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C808094A7C6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 14:34:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 879E9284D1A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 12:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E191E4869;
	Wed,  7 Aug 2024 12:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GmlEfcEz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7151E4F06
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Aug 2024 12:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723034088; cv=none; b=hGkaAT9wpaRJvYFFVnTrAyTGLhbzCM/BCO2+9gV+oKa/m0ZBnKCqOrhto6RxllAwDJzyG9C7c56HCJUhTpPDdguCRpqf93ZItulsZx6Q20tjZETk8bejuymzlIGmA9kAqYKwpMojIiUs/Dn7jhAr7uFKwYq1OsJZJAMN/QaqOes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723034088; c=relaxed/simple;
	bh=YDTMlYTd8Jl+1LbuEOwzVy2qVGX9nsvbpTUbbqpunaM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dt84X6D0HA1g/1ty3iCkBNbwGT0gGqe01cDChsRP8eiQzQbIvTWE9DJMqObksxFwK1jQSUAPR/cN4HITn6IcMWKcaHiSekUvcqeBioVxPOoOsiyOJlpSBGMYisbD1CVCn5Io9Wgfe53zjxC9DL3IJfd9Zg5FPaeGUQwTdXdggVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GmlEfcEz; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4266f3e0df8so11637595e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Aug 2024 05:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723034085; x=1723638885; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MHCgfOjCAWuaCf+wlNyjS/SdCnZB5VMR+4B9ySlLbTk=;
        b=GmlEfcEzKvVFgXObCV8l59ldfYXtJoJQvs2gVpfXjoMdOszvEeQUiY61PMEPc3rtLb
         pV242oijnFKBuJselh39j1P5z6/MuGhjt4C6FMK0rQSyIXH/4fDeJakVQd1FKp/6kFK6
         Noyi5vriD9YetwQ8EkcHLRf6xBMMapU3KHUu5fUG4FusfaM3WPaGQppFvClB7ZGROQzg
         rSd87ySpp9AIwrkAIGgzvAOeKipUURoYQStPDM5Z+2a8YQuUEMsV3qYYybLtuUXB38xb
         ziu2SiuWFindmsaxM9j7muVsNnyM3EwA3hfs71r9FSNGND7YmX4BWDqXq0arGglu99WZ
         zDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723034085; x=1723638885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MHCgfOjCAWuaCf+wlNyjS/SdCnZB5VMR+4B9ySlLbTk=;
        b=N8YWAZnWcqfvDtpUhD+nxpSd46rKxZoz1uQjhYNTmHy1apWTHrXwg/BVGqdJ3NihBd
         sWa4PN695fsqNEjMLIhNw8dV00r+xLySvF+1kcom4T4SdJ8HDdRfa3tYaAyFG+82vvvV
         g5zdh6rKM0CEWeqVG07Xq8Ujw8Msgnl6XtI0LlMEP/uxNYPYkJm+pxdLPSTXB3/OcUPt
         nyXs/+p9HgTJJccrpgzH1lxOchE5JYOkkXusA+cDdKK5mhMTvnKUiVrHo53lkL92s+KY
         xLq4Vt8oskc4rt38zgRgBlPoZQPYqzK/e6iADLylc89FsKWXFSv2ExFXwNNfJnn7bksa
         IL8Q==
X-Gm-Message-State: AOJu0Yz79BUH4qGTj4qSukhX2RtRkJLplR7cw6X2INhHErsvnXUiVXad
	0fUmfz86NDfYyZ1mrXf7i0ZsVwVxTOH/N09mOWCZL/SXLUgSCXvI
X-Google-Smtp-Source: AGHT+IHl9P9/5KkDx90+rurqwTLkXyyd1DLiP0ZC8rp5YWNQ0j2MsOIYxDHFYaLvFL5q9mWV7WKdZg==
X-Received: by 2002:a05:600c:5489:b0:428:1965:450d with SMTP id 5b1f17b1804b1-428e6b2f279mr129062815e9.17.1723034084713;
        Wed, 07 Aug 2024 05:34:44 -0700 (PDT)
Received: from [192.168.0.12] (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429059714d5sm27198425e9.13.2024.08.07.05.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 05:34:44 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 07 Aug 2024 13:34:28 +0100
Subject: [PATCH v2 2/3] drm/msm: Dump correct dbgahb clusters on a750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-a750-devcoredump-fixes-v2-2-d7483736d26d@gmail.com>
References: <20240807-a750-devcoredump-fixes-v2-0-d7483736d26d@gmail.com>
In-Reply-To: <20240807-a750-devcoredump-fixes-v2-0-d7483736d26d@gmail.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723034082; l=1299;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=YDTMlYTd8Jl+1LbuEOwzVy2qVGX9nsvbpTUbbqpunaM=;
 b=hbQvMTamQhjjpf6bA9aO2PZ7cUamP830QpGMda9alx6ZsBC2c2zVcd3QzThpTdjttLb30Xz5m
 b9eFsxaUWy/DX5L0KAxdOwLJvT5SUrVlVnviDT6AWKOuMGhIRGXEKjh
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


