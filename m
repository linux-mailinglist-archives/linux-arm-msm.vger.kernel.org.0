Return-Path: <linux-arm-msm+bounces-30962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5A796DC97
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 16:53:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F19A81C2081B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 14:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4814419F48B;
	Thu,  5 Sep 2024 14:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nkQ6Aw6v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDC819EEC5;
	Thu,  5 Sep 2024 14:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725547905; cv=none; b=mo29VkXaWXazEVGNEtueeYiQNu5SZpGo4IK6JAWX2nDvkPx2Z1TRpOB5PDJlfrD2EWXX6zt0yvBXmz7ugfrxHgtyv/7IO7iTZ+SRXHIyL0l9IQoiO6Io7BuNL2T3JWYqYaD93BgEpxDaRPCelIqlSaAIxdz3MDhctgUrSZx/Iak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725547905; c=relaxed/simple;
	bh=XcMZAmkU4knaQLdm3eWeeDEi3HiarURn/gAJXIVtoOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VSkPaPr8OfBxvbYUvv7kJPp3lEI7uEVZxt/B1nQAaDDHZ6B7Wo8l7In9jpzXOR5V1WOMeb+rFu+3dSWgn4Ba6L0lDY1yfp0nNN8Tpr0CqNpZyAVJQGDBKw5X5x27MqZ/C7v6ECAcTIy+w4Oa6A/HfY6b/K86KyVDv7nTV2g1sCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nkQ6Aw6v; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53568ffc525so1173854e87.0;
        Thu, 05 Sep 2024 07:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725547901; x=1726152701; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AqntLGjYPor0NbgJDgNk1OXPGF33LiTpH6N+ESpdJz4=;
        b=nkQ6Aw6vJ6B4zuvw04B+LrjgwnT69A1W2uMdYPwaWrYiDjhj+HcjOo++ZlyVKj4IEe
         KMwihqHQYnPRINdxDHsDvAwhtNCdCI6tOLn2LJLTTv8dC37+9SDgj2OlrbCtvxn5J6bu
         ZWckHS5kC1BZH7/myGkqfrD5fTpMkROoKmp1A/E+W/2iaA3RKo8gBYwkE/xonYcJXqfu
         VQgV3BeWcA8bRh8Mxz+N7u8Dd2wVsRAjLQCQpfcWtUdlh4gwJIuvdZo4E68UqRKDkVXq
         AIxj4/u4VXtAbJm9SYJvvmREP4Dg7cZa8sW+d9nni34ZYOxy7UUquH2nGVANodV44KcL
         ZYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725547901; x=1726152701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AqntLGjYPor0NbgJDgNk1OXPGF33LiTpH6N+ESpdJz4=;
        b=H4oQu67MHGEnUoPv8qJstJbUYNTuJ2ziSlJhN/T7WNKDM5yR3PoCT8cwJxc8cjBOlZ
         AEDGqnLgptX0yXPXFA1/L786zl4X3RdVfaxjbhMnhNZYigzaQrRVsb8CaeI+9laldzF+
         fNrpkWavlDT+MKFfYJQRcnhR1xXySDbkGt8qPNYZ2/oOBfmlyXDFUcrUmERtXEcB+adT
         KJynf8wZM86rdNJC26bz5v/lnzk7/+t1T3PPIaMaNX3+K9GrAT3Bpx5eVpUICKquQA/h
         MYFccfwdEBEgS4wwCRQfdtNToVazTcHAvaKpfccmrjVBwwjJliorMDL//15UGrFeQmIv
         M3tQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYi8IWSokavk81o2lHtNNgRqpMiNLy/ieS7i98oYFanEyY0cVOuBC/T/w/R8OQa6C5sXEVJ0/E/ntFdtXL@vger.kernel.org, AJvYcCX46TNT7IL2imc0NcI/JPiHXrdhwzp8p3gK9pbE+opG92WlGZogX0Cb/sI0VgSD1cIBzI9AAzwqmEk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxlNFPHjS9GDe5i4XSeGvremQ3I3fZJ4l/RgOECi8TMne784II
	zoWnMPu4kXIGUTzDBFRkVY+E2MczcEPuBwGeH4yDNlVNR7mvHWKu
X-Google-Smtp-Source: AGHT+IGuqlfnbvJEmdMPKEjrYPueG0gM/sgbEhcDtNsaxXjtL2F4Gjq53ZKSKFnr8EzM0tSP05A/IA==
X-Received: by 2002:a05:6512:ea1:b0:52e:9c69:b25b with SMTP id 2adb3069b0e04-53546b2a85fmr13786261e87.28.1725547901198;
        Thu, 05 Sep 2024 07:51:41 -0700 (PDT)
Received: from [192.168.1.17] (host-87-16-167-153.retail.telecomitalia.it. [87.16.167.153])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3cc52b376sm1320732a12.7.2024.09.05.07.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:51:40 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 05 Sep 2024 16:51:27 +0200
Subject: [PATCH v3 09/10] drm/msm/A6xx: Enable preemption for A750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-preemption-a750-t-v3-9-fd947699f7bc@gmail.com>
References: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
In-Reply-To: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725547882; l=3440;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=XcMZAmkU4knaQLdm3eWeeDEi3HiarURn/gAJXIVtoOk=;
 b=30Jegu5hUWliIXJrIkrDfYMpCrnjH799i8f13v/kXPtYWQx4tC6ag61QW8gHtR+CkiEDHIFWR
 JIy1UIJt3/SA9N+bFLKChlaPffBDX//+W+uCx1fV3wdVDQz5g3Xb8DC
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Initialize with 4 rings to enable preemption.

For now only on A750 as other targets require testing.

Add the "preemption_enabled" module parameter to override this for other
A7xx targets.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 3 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 6 +++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 1 +
 drivers/gpu/drm/msm/msm_drv.c             | 4 ++++
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 316f23ca9167..0e3041b29419 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1240,7 +1240,8 @@ static const struct adreno_info a7xx_gpus[] = {
 		.gmem = 3 * SZ_1M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
-			  ADRENO_QUIRK_HAS_HW_APRIV,
+			  ADRENO_QUIRK_HAS_HW_APRIV |
+			  ADRENO_QUIRK_PREEMPTION,
 		.init = a6xx_gpu_init,
 		.zapfw = "gen70900_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 512ff443bd2e..8b4fa17f6003 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2547,6 +2547,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	struct a6xx_gpu *a6xx_gpu;
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
+	extern int enable_preemption;
 	bool is_a7xx;
 	int ret;
 
@@ -2585,7 +2586,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		return ERR_PTR(ret);
 	}
 
-	if (is_a7xx)
+	if ((enable_preemption == 1) || (enable_preemption == -1 &&
+	    (config->info->quirks & ADRENO_QUIRK_PREEMPTION)))
+		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7xx, 4);
+	else if (is_a7xx)
 		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7xx, 1);
 	else if (adreno_has_gmu_wrapper(adreno_gpu))
 		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_gmuwrapper, 1);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 87098567483b..d1cd53f05de6 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -56,6 +56,7 @@ enum adreno_family {
 #define ADRENO_QUIRK_LMLOADKILL_DISABLE		BIT(2)
 #define ADRENO_QUIRK_HAS_HW_APRIV		BIT(3)
 #define ADRENO_QUIRK_HAS_CACHED_COHERENT	BIT(4)
+#define ADRENO_QUIRK_PREEMPTION			BIT(5)
 
 /* Helper for formating the chip_id in the way that userspace tools like
  * crashdec expect.
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 9c33f4e3f822..7c64b20f5e3b 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -58,6 +58,10 @@ static bool modeset = true;
 MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
 module_param(modeset, bool, 0600);
 
+int enable_preemption = -1;
+MODULE_PARM_DESC(enable_preemption, "Enable preemption (A7xx only) (1=on , 0=disable, -1=auto (default))");
+module_param(enable_preemption, int, 0600);
+
 #ifdef CONFIG_FAULT_INJECTION
 DECLARE_FAULT_ATTR(fail_gem_alloc);
 DECLARE_FAULT_ATTR(fail_gem_iova);

-- 
2.46.0


