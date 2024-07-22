Return-Path: <linux-arm-msm+bounces-26811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 111E2939123
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 16:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C3AD282459
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 14:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D7AF16DC21;
	Mon, 22 Jul 2024 14:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctvi+FQ0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625E61598F4;
	Mon, 22 Jul 2024 14:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721660317; cv=none; b=BY/Sdzk8ZV9zBOxH7inidotW8vw8N0dk2t7MPt6DnAPSHaSEdtvPOn2hP3/OGD8zGMXi3Xnh1G/0rRF50tiiI11RdHI4GIKIZH+3ps4a7xhKvoPqNyvpa/43xS9HjkQhC973qernxW87BCrk2ZpkDhMNw0C7Fqc7DEtBUmWKMbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721660317; c=relaxed/simple;
	bh=2+U75kxGeg6boIv7FzzRfJWExUrRss9eHlXmgAwkWHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cGfd6iNncRf/Kucv3bCYS4MXavlYDlPvMW92NfCz6P1W1kAjWiZIL7VRqNPCLbVtFXOU74gng66nYyeC7c0j0xTzLjmiLGdW8VdanryqWokNxJyUh/+GE1PuCNoPFQruSGUyHXOMfDQJ3vuM5XHPHLFRF8aygvCS0nrmF6uCSBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctvi+FQ0; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4257d5fc9b7so37803595e9.2;
        Mon, 22 Jul 2024 07:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721660314; x=1722265114; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uvRXbc2W10YhzddPjznwtMvfAtM0HPxa93PdBpyxyzc=;
        b=ctvi+FQ0HzEa8hp/mfoRfgQJORqn3AFooGT4jRMz+O5MFMxLSFemsHEqcerA/Nuyug
         5/9AnZi1E6ZTZIgqf+JawyCVFUicnyHBeW6DZ4rE13CVin8KYcVygA94xCL964/QG9Tr
         saS2CTuPhC5n2p4EDUNtC3K6pM5wQUmSiVaRr84UL0PnyN1NhOlZV30d+o3GPuBtvdr4
         AmNWkowK3sTMZk6XkJabdn5/Ueu5o40m9H0bY0V+44RJC2V1M0LGdM5rI+gicCnyub+X
         /CFIAKhAboHUwhsSzWBWEN16K7lYCpxCT8tzJtKwgbsh4WLSestMzt1sRvVig7AVYlyP
         Jzww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721660314; x=1722265114;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uvRXbc2W10YhzddPjznwtMvfAtM0HPxa93PdBpyxyzc=;
        b=Ulsb30sUR9fy27+lYx4d1+x3ZIkSWzDt9oonBqtLRu+2gvNHED/S+/jIN+/rPNNwoK
         H5bDCGxItwIwgXHzddqA+vbx6XQwBnRw3JwpeD/QWKH92Hci3SKwv5jW9NCUpf1Y/B4v
         22UhFcgQAzjlLZy3nyhms7eZvBvLzeUbX5oFkHqX9nKGpEDB7hSfVYL214YPMuYsn7je
         igTuA34fQnO+pUOBDlJgpYpoTnVv31jHsfeRbHcuwq6NPux9jyly7xzQvwztAR091Y8I
         +LkOTh2S+d6Om3Bb2Rdemm87o3o++zv0tnKIQks0p3O3Sa0GD+nk/kduJGJnAULvNlXU
         fU7w==
X-Forwarded-Encrypted: i=1; AJvYcCXiafyEmMruF8NiOXHM2st/Rl8Cdp1tGu4kgyADp4eQDUVR6DpdTrLj9hojRHHWEiCulJ63y28KQR0QINWprT6plpiLwAsOXjGwd95w
X-Gm-Message-State: AOJu0YyMzj/yLp/lTA7gbO89iyO+lLhUFmWD6rb6JSFsDb1rjn7mTtDB
	2ApZW+jGEucjRN6xWWMkObB7lDgoqjUAsCqI3ocalpATNoIgF8n/dam3+JCt
X-Google-Smtp-Source: AGHT+IHft4RH3hRBVeVQW93z8LFgj/ytRnObBn5Djt8fHS7MHN36oIbol7ITeI2yPPUhds6nwsPkUw==
X-Received: by 2002:a05:600c:470d:b0:426:5e8e:aa48 with SMTP id 5b1f17b1804b1-427dc52910amr65865035e9.22.1721660313545;
        Mon, 22 Jul 2024 07:58:33 -0700 (PDT)
Received: from [192.168.1.130] (51B6D03E.dsl.pool.telekom.hu. [81.182.208.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d68fa09bsm133294335e9.7.2024.07.22.07.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 07:58:32 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Date: Mon, 22 Jul 2024 16:58:19 +0200
Subject: [PATCH v3] drm/msm/adreno: Add A306A support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240722-a306a-v3-1-cff90857c615@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIpznmYC/12NQQrCMBBFr1JmbSSZ1DS48h7iIibTdsC2kkhQS
 u9uWhDF5fvMezNDosiU4FjNEClz4mksoHcV+N6NHQkOhQEl1vKAVjgtjRO1JdXoButgPJTbe6S
 Wn1vnfCncc3pM8bVls1rX/0JWQgmpnTHB+WB9c+oGx7e9nwZYCxm/lkH5sXC1grblfyC6tr/Ws
 ixvN46h0tAAAAA=
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
X-Mailer: b4 0.14.0

From: Otto Pflüger <otto.pflueger@abscue.de>

Add support for Adreno 306A GPU what is found in MSM8917 SoC.
This GPU marketing name is Adreno 308.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
[use internal name of the GPU, reword the commit message]
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
---
Changes in v3:
- Fix issues addressed by reviews.
- Rebase on latest next.
- Link to v2: https://lore.kernel.org/r/20240620-a306a-v2-1-0d388e1deebf@gmail.com

Changes in v2:
- Rebase on https://patchwork.freedesktop.org/series/127393/
- Link to v1: https://lore.kernel.org/r/20240528-a306a-v1-1-03a66dacd8c7@gmail.com
---
 drivers/gpu/drm/msm/adreno/a3xx_catalog.c | 11 +++++++++++
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c     | 14 +++++++++++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  6 ++++++
 3 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a3xx_catalog.c b/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
index 0de8465b6cf0..2eb6c3e93748 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
@@ -41,6 +41,17 @@ static const struct adreno_info a3xx_gpus[] = {
 		.gmem  = SZ_128K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a3xx_gpu_init,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x03000620),
+		.family = ADRENO_3XX,
+		.revn = 308,
+		.fw = {
+			[ADRENO_FW_PM4] = "a300_pm4.fw",
+			[ADRENO_FW_PFP] = "a300_pfp.fw",
+		},
+		.gmem = SZ_128K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init = a3xx_gpu_init,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(
 			0x03020000,
diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index 5273dc849838..b46ff49f47cf 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -145,6 +145,10 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A3XX_VBIF_ROUND_ROBIN_QOS_ARB, 0x0003);
 		gpu_write(gpu, REG_A3XX_VBIF_OUT_RD_LIM_CONF0, 0x0000000a);
 		gpu_write(gpu, REG_A3XX_VBIF_OUT_WR_LIM_CONF0, 0x0000000a);
+	} else if (adreno_is_a306a(adreno_gpu)) {
+		gpu_write(gpu, REG_A3XX_VBIF_ROUND_ROBIN_QOS_ARB, 0x0003);
+		gpu_write(gpu, REG_A3XX_VBIF_OUT_RD_LIM_CONF0, 0x00000010);
+		gpu_write(gpu, REG_A3XX_VBIF_OUT_WR_LIM_CONF0, 0x00000010);
 	} else if (adreno_is_a320(adreno_gpu)) {
 		/* Set up 16 deep read/write request queues: */
 		gpu_write(gpu, REG_A3XX_VBIF_IN_RD_LIM_CONF0, 0x10101010);
@@ -237,7 +241,9 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A3XX_UCHE_CACHE_MODE_CONTROL_REG, 0x00000001);
 
 	/* Enable Clock gating: */
-	if (adreno_is_a305b(adreno_gpu) || adreno_is_a306(adreno_gpu))
+	if (adreno_is_a305b(adreno_gpu) ||
+	    adreno_is_a306(adreno_gpu) ||
+	    adreno_is_a306a(adreno_gpu))
 		gpu_write(gpu, REG_A3XX_RBBM_CLOCK_CTL, 0xaaaaaaaa);
 	else if (adreno_is_a320(adreno_gpu))
 		gpu_write(gpu, REG_A3XX_RBBM_CLOCK_CTL, 0xbfffffff);
@@ -334,8 +340,10 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A3XX_CP_PFP_UCODE_DATA, ptr[i]);
 
 	/* CP ROQ queue sizes (bytes) - RB:16, ST:16, IB1:32, IB2:64 */
-	if (adreno_is_a305(adreno_gpu) || adreno_is_a306(adreno_gpu) ||
-			adreno_is_a320(adreno_gpu)) {
+	if (adreno_is_a305(adreno_gpu) ||
+	    adreno_is_a306(adreno_gpu) ||
+	    adreno_is_a306a(adreno_gpu) ||
+	    adreno_is_a320(adreno_gpu)) {
 		gpu_write(gpu, REG_AXXX_CP_QUEUE_THRESHOLDS,
 				AXXX_CP_QUEUE_THRESHOLDS_CSQ_IB1_START(2) |
 				AXXX_CP_QUEUE_THRESHOLDS_CSQ_IB2_START(6) |
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 1ab523a163a0..c3b7970c2bfa 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -294,6 +294,12 @@ static inline bool adreno_is_a306(const struct adreno_gpu *gpu)
 	return adreno_is_revn(gpu, 307);
 }
 
+static inline bool adreno_is_a306a(const struct adreno_gpu *gpu)
+{
+	/* a306a (marketing name is a308) */
+	return adreno_is_revn(gpu, 308);
+}
+
 static inline bool adreno_is_a320(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 320);

---
base-commit: dee7f101b64219f512bb2f842227bd04c14efe30
change-id: 20240528-a306a-48e173724d6c

Best regards,
-- 
Barnabás Czémán <trabarni@gmail.com>


