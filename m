Return-Path: <linux-arm-msm+bounces-21666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE14B8FBB52
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 20:11:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62D8D2826EC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 18:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5111814A0AD;
	Tue,  4 Jun 2024 18:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IBq1msh3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7405214A4F1;
	Tue,  4 Jun 2024 18:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717524652; cv=none; b=ssGgPSisjxxAjL3b6BvDYvvHPl1tCq0uEBmnvRvYWsWpQ23WUSEZ62yZqeQBVS8DOus4AI34JdCEpHDf+BG89TGwgoG01mrJxc5aEpAURaYnudD2uQgDHaE76FWlh9Et/SwtoNq7TwpeMkEeorjLJECGt7Nv7uJWA1cmHQIlczE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717524652; c=relaxed/simple;
	bh=WnMDJ0vo9umd5nj+sH2aK3UG/m+Gwvr5xF3krGz7bMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mtwcpFope/p/hfWattdbUA99usbe/pKR2MNSIz9y2le4gics3IvvGH74GhdqGtiT38JjLBmWXSgyNHIzR7GRzLtqFdFVAmX0WRAlnzdnP3JXltnelvxDZhY52JoBk3rw6pSNR2nj4sHKs3POySzGWng/AkB9uVyMr+k06371PEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IBq1msh3; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-354be94c874so4933716f8f.3;
        Tue, 04 Jun 2024 11:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717524649; x=1718129449; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rg6UIUhsA5R3P7t6NSlBZQMEWIFqCSy8a6ADHv0dKTc=;
        b=IBq1msh3fhlV8YZI6OaeRmHp6Djqz/j14Kt6BvjhPTjj/dRhQnZy+AwTKvNpDZ93XB
         LTNk+gMWIsCM6wnkiSUDtWfNuv6YSPex/AeknK1EFtREsym3eMiohgK2DNkg2E+VsWjX
         TMNuFDd8R0S9+cngR29VCETUh0Wc/UG3TcLNj3E74HFvH2G/G6iPm7UpuK7FjND1F/6f
         +k3mJzrf/JU+TOMM5GAbALxOKhS3KggfjpSqzNolC7H8mtF6ITl9WS4SGi3bMSkxxPEH
         aZrIorfNm7EmF1Lvqy+l0Zp52un5QhKy7EvD3hVxVnecO91w5irTfZlYJVJyojtmreEq
         B7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717524649; x=1718129449;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rg6UIUhsA5R3P7t6NSlBZQMEWIFqCSy8a6ADHv0dKTc=;
        b=IG78BhhZ76qYRU1BENAacS4hFqzswXhWOprfpNu8zdjJZjeMTGXDt0oqE/8WAG7f09
         K74GksIFJmJF2B3Zo8FNeg51FyAeQoEUsMnvf8RpSfDJe76uglyxdbbfNw9wjLqMBg/L
         zhvI92EOhJl5T3m9NatI537kc+T248ryoy420VSMYbQU17BHhJn57vN+qNtcG086KtsK
         tdUfbuE0aGqBxYZTRN8UMC3SVqQHVbRqgtVmG/ZFpO5P0PEFs0NTnikuDI5SP9E/l+aW
         J6vjPuyA3APNy85q2+Nrj7OoTiRzm0RoTrg1VqeEA6J47vL+J6spTh3ZJzVep075P2qT
         n+Sg==
X-Forwarded-Encrypted: i=1; AJvYcCVh2RbRhNje/gPNeG5BzQZY8jb4XW1dqWRZcrVKluE0pon6422lqrMVnJKULBKSo8qdIdEqbs9qy5A0Lb3thKu8+/jbVfKHW5XG87gN
X-Gm-Message-State: AOJu0Yzv/FjjD2NYR5xpRuerA353PcaDZr2OIhZMHqF86f7DI3PFLtrQ
	wg2L1lI4+mZl14ALjs58P9R1H4OPuPgvkhNVNlso/MIlI+RtTF2r
X-Google-Smtp-Source: AGHT+IHETCX8BouUTH+Bzdh9s7ZGCkWVQY6/mu1jNdXlBkzuDzJU19LRsRpKRYRjzUv2xYYPqvU2tg==
X-Received: by 2002:a5d:4287:0:b0:354:fa0d:1427 with SMTP id ffacd0b85a97d-35e8833a380mr149341f8f.15.1717524648807;
        Tue, 04 Jun 2024 11:10:48 -0700 (PDT)
Received: from [192.168.1.130] (51B6DB6F.dsl.pool.telekom.hu. [81.182.219.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04e48b9sm12336222f8f.64.2024.06.04.11.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 11:10:48 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Date: Tue, 04 Jun 2024 20:10:47 +0200
Subject: [PATCH v2] drm/msm/adreno: Add support for Adreno 505 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240604-a505-v2-1-dfa599a4d3c1@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKZYX2YC/zXMQQ7CIBCF4as0sxYzUKjVlfcwXSCM7SS2GDBE0
 3B3scbl//LyrZAoMiU4NStEypw4LDXUrgE32WUkwb42KFQaO2yFNWgEmUPbH6+d9MpCvT4i3fi
 1MZeh9sTpGeJ7U7P8rn9A/4AshRS9IpIOtVeI53G2fN+7MMNQSvkAXX/JNJgAAAA=
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Daniil Titov <daniilt971@gmail.com>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
X-Mailer: b4 0.13.0

From: Daniil Titov <daniilt971@gmail.com>

This GPU is found on SoCs such as MSM8937 (450 MHz), MSM8940 (475 MHz),
SDM439 (650 MHz).

Signed-off-by: Daniil Titov <daniilt971@gmail.com>
Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
---
Changes in v2:
- use DRM_MSM_INACTIVE_PERIOD instead of 250 ms.
- Link to v1: https://lore.kernel.org/r/20240604-a505-v1-1-82ee1c04d200@gmail.com
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      | 29 +++++++++++++++++------------
 drivers/gpu/drm/msm/adreno/adreno_device.c | 13 +++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 +++++
 3 files changed, 35 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index c003f970189b..c0b5373e90d7 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -439,7 +439,8 @@ void a5xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	const struct adreno_five_hwcg_regs *regs;
 	unsigned int i, sz;
 
-	if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu)) {
+	if (adreno_is_a505(adreno_gpu) || adreno_is_a506(adreno_gpu) ||
+	    adreno_is_a508(adreno_gpu)) {
 		regs = a50x_hwcg;
 		sz = ARRAY_SIZE(a50x_hwcg);
 	} else if (adreno_is_a509(adreno_gpu) || adreno_is_a512(adreno_gpu)) {
@@ -483,7 +484,8 @@ static int a5xx_me_init(struct msm_gpu *gpu)
 	OUT_RING(ring, 0x00000000);
 
 	/* Specify workarounds for various microcode issues */
-	if (adreno_is_a506(adreno_gpu) || adreno_is_a530(adreno_gpu)) {
+	if (adreno_is_a505(adreno_gpu) || adreno_is_a506(adreno_gpu) ||
+	    adreno_is_a530(adreno_gpu)) {
 		/* Workaround for token end syncs
 		 * Force a WFI after every direct-render 3D mode draw and every
 		 * 2D mode 3 draw
@@ -752,10 +754,11 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 		0x00100000 + adreno_gpu->info->gmem - 1);
 	gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MAX_HI, 0x00000000);
 
-	if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu) ||
-	    adreno_is_a510(adreno_gpu)) {
+	if (adreno_is_a505(adreno_gpu) || adreno_is_a506(adreno_gpu) ||
+	    adreno_is_a508(adreno_gpu) || adreno_is_a510(adreno_gpu)) {
 		gpu_write(gpu, REG_A5XX_CP_MEQ_THRESHOLDS, 0x20);
-		if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu))
+		if (adreno_is_a505(adreno_gpu) || adreno_is_a506(adreno_gpu) ||
+			adreno_is_a508(adreno_gpu))
 			gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x400);
 		else
 			gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x20);
@@ -771,7 +774,8 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_1, 0x40201B16);
 	}
 
-	if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu))
+	if (adreno_is_a505(adreno_gpu) || adreno_is_a506(adreno_gpu) ||
+	    adreno_is_a508(adreno_gpu))
 		gpu_write(gpu, REG_A5XX_PC_DBG_ECO_CNTL,
 			  (0x100 << 11 | 0x100 << 22));
 	else if (adreno_is_a509(adreno_gpu) || adreno_is_a510(adreno_gpu) ||
@@ -789,8 +793,9 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	 * Disable the RB sampler datapath DP2 clock gating optimization
 	 * for 1-SP GPUs, as it is enabled by default.
 	 */
-	if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu) ||
-	    adreno_is_a509(adreno_gpu) || adreno_is_a512(adreno_gpu))
+	if (adreno_is_a505(adreno_gpu) || adreno_is_a506(adreno_gpu) ||
+	    adreno_is_a508(adreno_gpu) || adreno_is_a509(adreno_gpu) ||
+	    adreno_is_a512(adreno_gpu))
 		gpu_rmw(gpu, REG_A5XX_RB_DBG_ECO_CNTL, 0, (1 << 9));
 
 	/* Disable UCHE global filter as SP can invalidate/flush independently */
@@ -1345,7 +1350,7 @@ static int a5xx_pm_resume(struct msm_gpu *gpu)
 	if (ret)
 		return ret;
 
-	/* Adreno 506, 508, 509, 510, 512 needs manual RBBM sus/res control */
+	/* Adreno 505, 506, 508, 509, 510, 512 needs manual RBBM sus/res control */
 	if (!(adreno_is_a530(adreno_gpu) || adreno_is_a540(adreno_gpu))) {
 		/* Halt the sp_input_clk at HM level */
 		gpu_write(gpu, REG_A5XX_RBBM_CLOCK_CNTL, 0x00000055);
@@ -1388,9 +1393,9 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
 	u32 mask = 0xf;
 	int i, ret;
 
-	/* A506, A508, A510 have 3 XIN ports in VBIF */
-	if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu) ||
-	    adreno_is_a510(adreno_gpu))
+	/* A505, A506, A508, A510 have 3 XIN ports in VBIF */
+	if (adreno_is_a505(adreno_gpu) || adreno_is_a506(adreno_gpu) ||
+	    adreno_is_a508(adreno_gpu) || adreno_is_a510(adreno_gpu))
 		mask = 0x7;
 
 	/* Clear the VBIF pipe before shutting down */
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index c3703a51287b..82953217b0b6 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -149,6 +149,19 @@ static const struct adreno_info gpulist[] = {
 		.gmem  = (SZ_1M + SZ_512K),
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a4xx_gpu_init,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x05000500),
+		.family = ADRENO_5XX,
+		.revn = 505,
+		.fw = {
+			[ADRENO_FW_PM4] = "a530_pm4.fw",
+			[ADRENO_FW_PFP] = "a530_pfp.fw",
+		},
+		.gmem = (SZ_128K + SZ_8K),
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_TWO_PASS_USE_WFI |
+			  ADRENO_QUIRK_LMLOADKILL_DISABLE,
+		.init = a5xx_gpu_init,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x05000600),
 		.family = ADRENO_5XX,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 77526892eb8c..b80cc4772cc0 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -298,6 +298,11 @@ static inline int adreno_is_a430(const struct adreno_gpu *gpu)
 	return adreno_is_revn(gpu, 430);
 }
 
+static inline int adreno_is_a505(const struct adreno_gpu *gpu)
+{
+	return adreno_is_revn(gpu, 505);
+}
+
 static inline int adreno_is_a506(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 506);

---
base-commit: 861a3cb5a2a8480d361fa6708da24747d6fa72fe
change-id: 20240603-a505-e57389b61d2a

Best regards,
-- 
Barnabás Czémán <trabarni@gmail.com>


