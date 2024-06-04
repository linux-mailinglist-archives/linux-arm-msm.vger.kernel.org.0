Return-Path: <linux-arm-msm+bounces-21633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 488B18FB7F6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 17:51:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BF961C219F7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 15:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E63831487EB;
	Tue,  4 Jun 2024 15:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RipAK1rZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70365145A1F;
	Tue,  4 Jun 2024 15:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717516131; cv=none; b=FfhUxKjOBqvP2OB2nsECbtOsQFFs4JfMOBzYOo+86yddnqVUGVh5GdCNSW/8gp7lUN6gLfxtyCv7+9YVWsctX7qNuz/OinJtqTtJPDaiIwszxqmllnccoTn0XOgIO2L6sjaIak0uix9lFLzHA3542EwlUV0hZ2/3oHqhHADXpj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717516131; c=relaxed/simple;
	bh=rl0V1efIkBWcPNXf1GY2r+h8AP6zylGJu5kf/w2ddgM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m9BnnRpf4JuI5C23BD+fGlCxTFmmNqVHlTyLGgMS6y8HH8t5LizOBiyBuqPwdVai4xx3UJfxZhL6Sa6hTFTfsWN+cs5QgKOIXjissb9PDpjxqvIOJEp+5TPJOieMZctbxZQs+krWdFYEbAE5cRLceyvdkVJ3QGMtTokoaBxKfa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RipAK1rZ; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2c2070e1579so2221225a91.3;
        Tue, 04 Jun 2024 08:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717516130; x=1718120930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Q70FeNK1/2wRB7vpNO0oOJ1GgfoQ2PpKwWEQ3Wdqpg=;
        b=RipAK1rZDcJWxXt0m+Hr9IqiyBNS96Vq5ZU7ZyJgn43dGOwLPUVEGDsunvIrZJIU6l
         Ws2QGBQ5NSTIiY9aII6V7SLCJOvNFkLGqHCstIjqzTfplJZHc/pYTaJBczwfL2xWKwdn
         tWi/Ofkli/KcNkHeGiGG8ubNU9hBEaEBerCSe1hAhrBUkQ5fXc/Bm3FafOMlD3kjktDK
         GabGMStYUuBQi0PMoobAaFz8pgIwwz63QPdAvZJKpG3QwqSxs64gnkQUJifZ6FAHGUVf
         79oKdCN9t42TZ14Mc7vW79JAlDjTumMW+vLcwT+DjqRSG2xBx0J6+Qw5D4dlJaAWoTt3
         pCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717516130; x=1718120930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Q70FeNK1/2wRB7vpNO0oOJ1GgfoQ2PpKwWEQ3Wdqpg=;
        b=MiepFanXGca/170YTB8vZjOzmmbuKbQTvvbBERudVLMNCdTIYUy5sg+eyV12qI3V3L
         yR4DHukPI/471kYlUqT+sEharB35K4C3JVMJ7gcCTruBXM9QLoVKBX9ZTF8ruA77BQH0
         MFN7aMup1twxWpw82aYHk8R4dAl2o5y1hsV6gg9ANOxKakIq3CqL+PQU52q01KssXLfH
         JbPcXMHx0yK4872h73oSZ34AH2nxD8v1SIHfDNCJcO+3Z3CopsSFUWNCzL9BPmd0sGpt
         4ZP+vR205x3GgYqOgpGtL/nNfOVae+R3Rjw52ZT/nH4iWYzThK2oQSEG/xr2K51eecR2
         Vxgg==
X-Forwarded-Encrypted: i=1; AJvYcCXk6vQ3NzPO9+frHcJL7gfDiXsuUCvI9wU3A+T8xuEEmbYqSmcMFVnNCjM3nsSWrIqhSEWSpMIpqxppRV54mhiFPcYzMVBc/RYwsiiA
X-Gm-Message-State: AOJu0Yzk6slzksuyzHV1tqS/n4wa/GdHQG/8tHmdaKT06xayvpS5wvwg
	pQCb0k4I26SFV10syWOfxKUKbXOFgyFYzrzbOGHHfP9YTB2vUSN4
X-Google-Smtp-Source: AGHT+IETdb/v65fN1hSr8RwtXZ9wGqMKKKZp/iq5lA8SpMG6PGllSWGbwuTvA5+zM0FaJ/bEI1ZTMA==
X-Received: by 2002:a17:90b:889:b0:2bd:f713:800e with SMTP id 98e67ed59e1d1-2c1dc575163mr11404129a91.14.1717516129658;
        Tue, 04 Jun 2024 08:48:49 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1a775d5c3sm10792383a91.5.2024.06.04.08.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 08:48:48 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/a6xx: Print SQE fw version
Date: Tue,  4 Jun 2024 08:48:45 -0700
Message-ID: <20240604154846.500357-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Add the SQE fw version to dmesg and devcoredump.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 32 +++++++++++++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h       |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  2 ++
 3 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 56bfb228808d..5a2a005003c8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -665,6 +665,32 @@ static int a7xx_cp_init(struct msm_gpu *gpu)
 	return a6xx_idle(gpu, ring) ? 0 : -EINVAL;
 }
 
+static uint32_t get_ucode_version(const uint32_t *data)
+{
+	uint32_t version;
+
+	/* NOTE: compared to kgsl, we've already stripped off the first dword: */
+	version = data[0];
+
+	if ((version & 0xf) != 0xa)
+		return version;
+
+	version &= ~0xfff;
+	return  version | ((data[2] & 0xfff000) >> 12);
+}
+
+uint32_t a6xx_get_sqe_version(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	uint32_t *buf = msm_gem_get_vaddr(a6xx_gpu->sqe_bo);
+	uint32_t version = get_ucode_version(buf);
+
+	msm_gem_put_vaddr(a6xx_gpu->sqe_bo);
+
+	return version;
+}
+
 /*
  * Check that the microcode version is new enough to include several key
  * security fixes. Return true if the ucode is safe.
@@ -681,6 +707,8 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
 	if (IS_ERR(buf))
 		return false;
 
+	DRM_DEV_INFO(&gpu->pdev->dev, "Have SQE version %03x\n", get_ucode_version(buf));
+
 	/* A7xx is safe! */
 	if (adreno_is_a7xx(adreno_gpu) || adreno_is_a702(adreno_gpu))
 		return true;
@@ -714,7 +742,7 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
 		}
 
 		DRM_DEV_ERROR(&gpu->pdev->dev,
-			"a630 SQE ucode is too old. Have version %x need at least %x\n",
+			"a630 SQE ucode is too old. Have version %03x need at least %03x\n",
 			buf[0] & 0xfff, 0x190);
 	} else if (!strcmp(sqe_name, "a650_sqe.fw")) {
 		if ((buf[0] & 0xfff) >= 0x095) {
@@ -723,7 +751,7 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
 		}
 
 		DRM_DEV_ERROR(&gpu->pdev->dev,
-			"a650 SQE ucode is too old. Have version %x need at least %x\n",
+			"a650 SQE ucode is too old. Have version %03x need at least %03x\n",
 			buf[0] & 0xfff, 0x095);
 	} else if (!strcmp(sqe_name, "a660_sqe.fw")) {
 		ret = true;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 1c3cc6df70fe..c206dab8bc08 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -109,6 +109,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
 		       bool suspended);
 unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu);
 
+uint32_t a6xx_get_sqe_version(struct msm_gpu *gpu);
 void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 		struct drm_printer *p);
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 0a7717a4fc2f..1acfe39eb8e0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -1957,6 +1957,8 @@ void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 
 	adreno_show(gpu, state, p);
 
+	drm_printf(p, "sqe-version: 0x%08x\n", a6xx_get_sqe_version(gpu));
+
 	drm_puts(p, "gmu-log:\n");
 	if (a6xx_state->gmu_log) {
 		struct msm_gpu_state_bo *gmu_log = a6xx_state->gmu_log;
-- 
2.45.1


