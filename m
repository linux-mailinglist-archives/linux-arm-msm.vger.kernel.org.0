Return-Path: <linux-arm-msm+bounces-19522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEF38C03A2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 19:47:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 541191F25957
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 17:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A8E612A142;
	Wed,  8 May 2024 17:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CjSTttrr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3711812AAEF
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 May 2024 17:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715190402; cv=none; b=eb9JvTyx7V7uJ8S3u/+e4HfKQ9wfGAcDNl3T3/pS9PeJ2Df/15Hrabd1dzzXPx5Qc2ubLOTb62EOGbkoAuB8Z4dTGmca5yOZdUhfCigcA52AEvrBnAIPpgc6S4BMFZv86c26qrggPOX5FI6ocncQLrXNLfOlIbpDFMO9X5PJ4Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715190402; c=relaxed/simple;
	bh=GVJHmEwymCVBDV/Kc2heeoYUG9kyI20JxTRuwx64UEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KOScJffHwqhIeqzjGo81uJHruREY/y9WNFFcHjfuCYEQMDtrrOgtsaxTtLYhyTx+DnI0GPrbtPXFLXzvnnEhR/oLSuARulS30SUKufZwe7/PWDegYugyEjh07v/e1Kc4U3C1KbejzSX26SYJHgsGvOmSszu1Pfogy8gIJFeqjzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CjSTttrr; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e3b1b6e9d1so258531fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 May 2024 10:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715190398; x=1715795198; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tBqc0otO/1vZytz7RpFsktZzqG8V8CralOjrOLBef2c=;
        b=CjSTttrrYZuf9kwnWneMHGUXnblAj9o1MvT68LX8RHJom63mK3aIy6i6GQLcXeB85F
         Fl2xjo6GtNeMTfQ7w0kQs0n5p/y/+gdAAUOdvZBKO7EZqDo/9DQHIFuTE/8AZKIJa8Y6
         UGYINVThIc7c6QabTRkJM29LAtRhFIpZT9HlDBjFevYSNrxfMM9jNoqCS6eyq87oivFz
         /y7+vHrj+R4rFR72C1jHme6hxcUD0CBcnSQJQfOkG5OaZpHAParsMXJbfsXFSow+Xvm4
         R++vC9QafxTRZscR1DCZ01oQmu8Fy+zh6jJsGQaI4+qiPov8N4TXlJZq0TvIb048ukwW
         pD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715190398; x=1715795198;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tBqc0otO/1vZytz7RpFsktZzqG8V8CralOjrOLBef2c=;
        b=twC1UzKid+b/zzD2TjcoQm5zuqSaG8mESmBwCqNXc5621cM9G3die5uHq6NWCvtCV0
         pvM0z2QH1nX2xjNHKD5dL7HoH+yqN9U1Z8sn4+Dd+l1/yR6FQlrCaBIFVnXG14Q3FmDx
         169rjai7mL/VSTt5+PxgdajSTm3b41W36E4bJNSFVYT3AJHOsbJCG6MHtGpXLFA2ddNr
         GsWrMTKZOGhly1CfbNzTRraVCawIfoAEO0eAXRx4caB7u7nBWN1pB2Ji0Yu433ldEGin
         y/e+50j3EQHH9oOSLH/hQOWgBFXcUaBhVMBf1CbR4hgTWfKnpcAYVmzKvUI1JJPaQ0tx
         RFQg==
X-Forwarded-Encrypted: i=1; AJvYcCXIo3cmno/bgod86udJIFzFtnKYQzkjPMf8WJ6XssN0mcRNBuS2P8L6ayjDSsDKcCZgcsBq2iHycknGTOsDONA9hW5lGRzGsLzTp8RvTw==
X-Gm-Message-State: AOJu0YxqFd19KRyCJACOnq59G453cCm5/tGAG+pqn/1Eg17hWFo6HSsY
	cQUkjZjFMFshsLU+RN6DH/WUdpEFogkibibah1sl+6CONavQbmCVj152/Q0YXAE=
X-Google-Smtp-Source: AGHT+IG+Rmny74VZr2L+E6k80Nq9iEIJnnTkrW4sDMxKn1aUHIiF+KJWt9jPP/boB01r67V0blTUSw==
X-Received: by 2002:a05:6512:3a89:b0:521:b333:6f02 with SMTP id 2adb3069b0e04-521b3336f3cmr1623400e87.14.1715190398393;
        Wed, 08 May 2024 10:46:38 -0700 (PDT)
Received: from [127.0.1.1] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id z19-20020a195e53000000b0051b6f060248sm2635543lfi.134.2024.05.08.10.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 10:46:38 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 08 May 2024 19:46:31 +0200
Subject: [PATCH] drm/msm/adreno: De-spaghettify the use of memory barriers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240508-topic-adreno-v1-1-1babd05c119d@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHa6O2YC/x3MQQqAIBBA0avIrBN0UMiuEi1Ep5qNikYE4d2Tl
 m/x/wuNKlODRbxQ6ebGOQ3oSUA4fTpIchwGVGiUVbO8cuEgfayUsvQYtXMhGm0RRlIq7fz8u3X
 r/QNAVpdUXgAAAA==
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14-dev

Memory barriers help ensure instruction ordering, NOT time and order
of actual write arrival at other observers (e.g. memory-mapped IP).
On architectures employing weak memory ordering, the latter can be a
giant pain point, and it has been as part of this driver.

Moreover, the gpu_/gmu_ accessors already use non-relaxed versions of
readl/writel, which include r/w (respectively) barriers.

Replace the barriers with a readback that ensures the previous writes
have exited the write buffer (as the CPU must flush the write to the
register it's trying to read back) and subsequently remove the hack
introduced in commit b77532803d11 ("drm/msm/a6xx: Poll for GBIF unhalt
status in hw_init").

Fixes: b77532803d11 ("drm/msm/a6xx: Poll for GBIF unhalt status in hw_init")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  5 ++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 ++++----------
 2 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 0e3dfd4c2bc8..4135a53b55a7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -466,9 +466,8 @@ static int a6xx_rpmh_start(struct a6xx_gmu *gmu)
 	int ret;
 	u32 val;
 
-	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 1 << 1);
-	/* Wait for the register to finish posting */
-	wmb();
+	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, BIT(1));
+	gmu_read(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ);
 
 	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_RSCC_CONTROL_ACK, val,
 		val & (1 << 1), 100, 10000);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 973872ad0474..0acbc38b8e70 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1713,22 +1713,16 @@ static int hw_init(struct msm_gpu *gpu)
 	}
 
 	/* Clear GBIF halt in case GX domain was not collapsed */
+	gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
+	gpu_read(gpu, REG_A6XX_GBIF_HALT);
 	if (adreno_is_a619_holi(adreno_gpu)) {
-		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
 		gpu_write(gpu, REG_A6XX_RBBM_GPR0_CNTL, 0);
-		/* Let's make extra sure that the GPU can access the memory.. */
-		mb();
+		gpu_read(gpu, REG_A6XX_RBBM_GPR0_CNTL);
 	} else if (a6xx_has_gbif(adreno_gpu)) {
-		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
 		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 0);
-		/* Let's make extra sure that the GPU can access the memory.. */
-		mb();
+		gpu_read(gpu, REG_A6XX_RBBM_GBIF_HALT);
 	}
 
-	/* Some GPUs are stubborn and take their sweet time to unhalt GBIF! */
-	if (adreno_is_a7xx(adreno_gpu) && a6xx_has_gbif(adreno_gpu))
-		spin_until(!gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK));
-
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
 
 	if (adreno_is_a619_holi(adreno_gpu))

---
base-commit: 93a39e4766083050ca0ecd6a3548093a3b9eb60c
change-id: 20240508-topic-adreno-a2d199cd4152

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


