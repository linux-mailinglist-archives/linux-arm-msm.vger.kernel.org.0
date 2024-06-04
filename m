Return-Path: <linux-arm-msm+bounces-21537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D188FA6EB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 02:20:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20F011C216F0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 00:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92F5820E3;
	Tue,  4 Jun 2024 00:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gjCOp+e8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1893182;
	Tue,  4 Jun 2024 00:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717460427; cv=none; b=PXoPQkoS7c/8P7isgNlcJxZrV+zc8rQP2GGqGrYbqRgfx7WzRujuQpMpqTDIfdLeMO6301YalTybOAU5o5Z9u+nH3wkIptb5bDdz+RJmrDCsq94L26ecksf1YuJC3AU7j2b/cW+l3XhGn0cXi55uIoKCy9QLrKdI1c7KaQKj3tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717460427; c=relaxed/simple;
	bh=USlRVlWaOrPNRknCiS1HjsWKC2ke3RZCJ3scQ0TNt2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AJfUpkGUrlAA4jx26/pJcO6UHJWJHcSX8V8jHM6QdsHrO888zoQwv/9i0yLbEUjNJIbrxTDQPqhTJwclcMiVn8wjhVGObroWnxm1RSj+57UKy02Ck1NJIrncAMlvbcDkWzOljcyxD+8CM1ziZcyy1RO09142mBs29P81GkwE/54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gjCOp+e8; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2eaa80cb4d3so40657031fa.1;
        Mon, 03 Jun 2024 17:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717460424; x=1718065224; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FrlYSwM264hBhCwGHb/m41CgMyXslmsh35MYvVUqi8A=;
        b=gjCOp+e8Wlm2z5GExrHVsw4GmL0HOtebJJYRVoRtvcQ07KyjM9WsheGTW3tSuW45QZ
         h2nn/h3IGrcCqmD5es4XuMArJU4sy1UE6RkRtPbGJiR+LpwyObaE1tbc1fpemXH2kOTc
         KZ0LH1jVcLEv0Hn0+31EmtYWvCUG/GfRioCTSTJYsuAaaudQ+qOPJVr97RHXroCUTAHF
         XQ+N88J8RA+UII7JsObZxM+2r9VjAGyldd1h5hrsQs/MR22BWEzsc6cQa0CVTyR1SXg7
         leW+7HQ1aqVxkEyvihsLxMnKqTbx+/jK55V4rPjQDHeucAhiA97hXUibNvNKBD+sdk5T
         Pefg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717460424; x=1718065224;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FrlYSwM264hBhCwGHb/m41CgMyXslmsh35MYvVUqi8A=;
        b=LNHNNhaknjROGpjbKzX0SZptlR9tSOVGUvccB4aXpOQl0TWAsC7MmU5YGovKITRWn7
         VxeCKm6K8EI56J0Xda3YbcWql6+KLoonrIrOZMCO94j+KjW2g5ZmK6+INmfdkTgbJLL6
         F4y1ul1H8+vBeBgBEHNjgXxJtl9E+OPjEZK8hvuEgZD+EF1yFbr7nVRbwxhjjqA/5uWL
         85bDvdW28rVxFlXMh7rGiY5Tp8kytnHXmWvvz3t6dXKT2uUXKcvg+2iPLzrIVA3zQGlq
         4viEmzjyktMnOo8lmUq3EKGdEcr7UY6lErtwwB7ruvyh+AnaJZb6CqDvy6yhmn4hFWMh
         ViOQ==
X-Forwarded-Encrypted: i=1; AJvYcCU37QwfqlEYghE6wOmq5cOCaqMRZaZrA522dEL0tR1w95b0+ITQfeJlPSZ84lmd/5JJ4iNSbPI4U2R8TOAvaoK1EFp1JB/d0ErSsPbl
X-Gm-Message-State: AOJu0YxeNQW9VjrPbUBwHz49UYqRqBq4QNYOTzdUsfWMI4Tf/liEUt1I
	ZMxxS6+A6li+/4VcS8SQEpq2TrdBChtmvf9yd09myat3fTtOKL+p
X-Google-Smtp-Source: AGHT+IEp36/GJZadTs7r0++UDOWUpMWtX/2Qmis14sRY9Qqow+5m9MHDZ3vP6c0LUYFDSEprPYX4Bg==
X-Received: by 2002:a2e:988f:0:b0:2ea:79b2:1839 with SMTP id 38308e7fff4ca-2ea950e77f9mr89339561fa.2.1717460423516;
        Mon, 03 Jun 2024 17:20:23 -0700 (PDT)
Received: from [192.168.1.130] (51B6DB6F.dsl.pool.telekom.hu. [81.182.219.111])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31bb828dsm6244325a12.33.2024.06.03.17.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 17:20:22 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Date: Tue, 04 Jun 2024 02:20:21 +0200
Subject: [PATCH] drm/msm/adreno: Add support for Adreno 505 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240604-a505-v1-1-82ee1c04d200@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMRdXmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMwNj3URTA1PdVFNzYwvLJDPDFKNEJaDSgqLUtMwKsDHRsbW1AG085/9
 WAAAA
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
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      | 29 +++++++++++++++++------------
 drivers/gpu/drm/msm/adreno/adreno_device.c | 17 +++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 +++++
 3 files changed, 39 insertions(+), 12 deletions(-)

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
index c3703a51287b..7e1ff091acaf 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -149,6 +149,23 @@ static const struct adreno_info gpulist[] = {
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
+		/*
+		 * Increase inactive period to 250 to avoid bouncing
+		 * the GDSC which appears to make it grumpy
+		 */
+		.inactive_period = 250,
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


