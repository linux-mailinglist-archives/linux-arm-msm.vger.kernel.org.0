Return-Path: <linux-arm-msm+bounces-57176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EECFAAAE550
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 17:49:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 764253BDB08
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 15:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC5428C2CB;
	Wed,  7 May 2025 15:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DN2Xp91c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B27289837;
	Wed,  7 May 2025 15:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746632848; cv=none; b=KxKi+hAjxnnCdH2bf5ALBH5xdN3SPUzLlXROs/Ip1Y1cL3V+STbQssSzHsYDZDndw+kAYGNbvFsSy2Gt2gvpnDwClE3sEMmL7B1yGCmqzafB9A9BsRya1FiUy/AuoUADKAGBqxYexBxEYBtKDxXkcRS+Z3qR7Z48ggUEVu44738=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746632848; c=relaxed/simple;
	bh=XJP3ksP+po7wqMMJKXn4rgDgRNdO3D3MPvv47yMTjsk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bkbJ3Pou2ex/qrb/bZCT2/D83YLnvYnlpZEva/tee+EEOSPBXX+f4kjEK6svxNreXP4ZJMBTXECSfUZATskZKSQXYnXumKzHswOt5LeXKaSunMq4WBTP9aX/DlZTMstkjpGNd1tVxNAOcDnvNWUAQjjz8slfHB0GM+oHsT8sijY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DN2Xp91c; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso78028b3a.2;
        Wed, 07 May 2025 08:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746632846; x=1747237646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LmkbRzm6/L2ISgCL3Ow+dZj/hCqoVpb93sMpickKofs=;
        b=DN2Xp91c8ar5ctiEjxFlX3ZSga1DfqiPk7VUjs3E176jVfZpB/bK+4QOw0MqAJstwd
         Fmz2t9O6f1gX7ZBt/GrPGghiPGnJ/gT9FTAkxsILXfKU9kz2yzeph/Q2VbfHRKvZ6PFn
         I13ZaQ9va2DUpLaqOjvo/F9dLMJulltDu7WpWzZPq2PJ0RIwyJl8c10+/FXcSTq6Zs86
         smf0FhFX4731jzkMxa/ATabHluZjVLr5x8K3X+qjP4lwDnJ/aqHj8xHchVApW/J0AJqV
         v8D34f2H4DKL05EXJqvce5lLqejO3f0hZ6siFlT0A5+cU7D1X+sXBgNQXLrd5XPb04D1
         QkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746632846; x=1747237646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LmkbRzm6/L2ISgCL3Ow+dZj/hCqoVpb93sMpickKofs=;
        b=u8ihhveMV66Oci5d7uXa+vMEkY+8ju/tZDCh40iyMpnQnQeWApHJL9FhpsPUkMK39B
         HDcdwIcrMjE2NdIVzoeImeW9uh1529vu9CGmpw40w8JOJ2l7VVi4nwnJrwG7mm5/eBM1
         PU4aVEfY75qYTy7VF0pQ/Y2p5pZE+YRZIgv2Rye+hl9YogP0Vu7FRK1TvkOhx7OlQgeT
         WVtVhCCfwScHWAnTUdqkTQvfvITCMnQ1jgrF7tZ/UebJmSXiL0xHpLn+vB4xe3LJ4klU
         e02GT4+5djPpw1PIq4Xet2KKil9DmK2N1yYKI1+OqKvwTyPBiU50j93EvbAtLSAcht59
         AWAg==
X-Forwarded-Encrypted: i=1; AJvYcCUE8nUMpAveEXJuIZzrjf19mqnA6SklygvnLgZv9eCjyMHu4mMVGv241Gk25iD5TeTOaOUjPL/fhKC6ZJL+@vger.kernel.org, AJvYcCVgoG09wJbZzn1IO3NFzvFlTHljtOKqg7kuKcM6xY7L2ofGOD6kzQ9wkUBEDlBodoTGLwrZwAprBI/S01zv@vger.kernel.org
X-Gm-Message-State: AOJu0YyBZ4z07WjJbjZMyu7SYhWNaaLAYRfI6k+Yr8PmiZ3PkHcKCIfl
	BGoRMX6hJygEQZfQJ6t4QDUSWFk+z60IB9mm5c5d2XwN8H+8KTyC
X-Gm-Gg: ASbGnctwOtfzkC1lTQcwx3EKyqmspqZxjESYAq30TNVt/U8ibpSbZR2N8tHBgoJktPY
	fsHV1PTr8mUQRSAOQvWq/s9mUZH+9+ZFT6Gmn5EExaqpu++HD+cV7lN7J8qFft3p/a0b1e0XRXi
	hsUqoyjcjipqOOXvziQw0WWc7emgRzmBH9IN08jI5i8KP7IUAVBEUlmlOL1WExusBW0p8EZkxSM
	nUYkVZV/lTrXfzmHAdszzoj//cWY4PmsWTbVCscQRjE5p4RGZs1wOl2Smie9FZkDAChUwREtdeh
	1y8Ujue0vfMdFfAcbYo7kQ6roGf1wLHvQOqqu18agJPyclgJ0Ufa1BIzUmfPNs7ql9qq0sZMrH+
	ijwbVMIf4ax9T3XI=
X-Google-Smtp-Source: AGHT+IEjee61+V1bhnajLB99NRDjF86bj6+oLpOJxzBD/kzEvFWRPqLSBK91CgrPhNzavqWjuXF4TA==
X-Received: by 2002:a05:6a21:3944:b0:201:8a13:f392 with SMTP id adf61e73a8af0-2148c0f634bmr5732814637.20.1746632846056;
        Wed, 07 May 2025 08:47:26 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058d7ad7asm11852752b3a.11.2025.05.07.08.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 08:47:25 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/adreno: Remove MODULE_FIRMWARE()'s
Date: Wed,  7 May 2025 08:47:22 -0700
Message-ID: <20250507154723.275987-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

The driver handles the case where gpu fw is not in the initrd.  OTOH it
doesn't always handle the case where _some_ fw is in the initrd, but
others are not.  In particular the zap fw tends to be signed with an OEM
specific key, so the paths/names differ across devices with the same
SoC/GPU, so we cannot sanely list them with MODULE_FIRMWARE().

So MODULE_FIRMWARE() just ends up causing problems without actually
solving anything.  Remove them!

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a2xx_catalog.c |  5 -----
 drivers/gpu/drm/msm/adreno/a3xx_catalog.c |  5 -----
 drivers/gpu/drm/msm/adreno/a4xx_catalog.c |  3 ---
 drivers/gpu/drm/msm/adreno/a5xx_catalog.c |  9 ---------
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 -----------
 5 files changed, 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_catalog.c b/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
index 9ddb7b31fd98..5ddd015f930d 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
@@ -45,8 +45,3 @@ static const struct adreno_info a2xx_gpus[] = {
 	}
 };
 DECLARE_ADRENO_GPULIST(a2xx);
-
-MODULE_FIRMWARE("qcom/leia_pfp_470.fw");
-MODULE_FIRMWARE("qcom/leia_pm4_470.fw");
-MODULE_FIRMWARE("qcom/yamato_pfp.fw");
-MODULE_FIRMWARE("qcom/yamato_pm4.fw");
diff --git a/drivers/gpu/drm/msm/adreno/a3xx_catalog.c b/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
index 2eb6c3e93748..1498e6532f62 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
@@ -85,8 +85,3 @@ static const struct adreno_info a3xx_gpus[] = {
 	}
 };
 DECLARE_ADRENO_GPULIST(a3xx);
-
-MODULE_FIRMWARE("qcom/a300_pm4.fw");
-MODULE_FIRMWARE("qcom/a300_pfp.fw");
-MODULE_FIRMWARE("qcom/a330_pm4.fw");
-MODULE_FIRMWARE("qcom/a330_pfp.fw");
diff --git a/drivers/gpu/drm/msm/adreno/a4xx_catalog.c b/drivers/gpu/drm/msm/adreno/a4xx_catalog.c
index 93519f807f87..09f9f228b75e 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_catalog.c
@@ -45,6 +45,3 @@ static const struct adreno_info a4xx_gpus[] = {
 	}
 };
 DECLARE_ADRENO_GPULIST(a4xx);
-
-MODULE_FIRMWARE("qcom/a420_pm4.fw");
-MODULE_FIRMWARE("qcom/a420_pfp.fw");
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_catalog.c b/drivers/gpu/drm/msm/adreno/a5xx_catalog.c
index 633f31539162..b48a636d8237 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_catalog.c
@@ -150,12 +150,3 @@ static const struct adreno_info a5xx_gpus[] = {
 	}
 };
 DECLARE_ADRENO_GPULIST(a5xx);
-
-MODULE_FIRMWARE("qcom/a530_pm4.fw");
-MODULE_FIRMWARE("qcom/a530_pfp.fw");
-MODULE_FIRMWARE("qcom/a530v3_gpmu.fw2");
-MODULE_FIRMWARE("qcom/a530_zap.mdt");
-MODULE_FIRMWARE("qcom/a530_zap.b00");
-MODULE_FIRMWARE("qcom/a530_zap.b01");
-MODULE_FIRMWARE("qcom/a530_zap.b02");
-MODULE_FIRMWARE("qcom/a540_gpmu.fw2");
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 3b996837b178..bc8e6f621b70 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1092,17 +1092,6 @@ static const struct adreno_info a6xx_gpus[] = {
 };
 DECLARE_ADRENO_GPULIST(a6xx);
 
-MODULE_FIRMWARE("qcom/a615_zap.mbn");
-MODULE_FIRMWARE("qcom/a619_gmu.bin");
-MODULE_FIRMWARE("qcom/a630_sqe.fw");
-MODULE_FIRMWARE("qcom/a630_gmu.bin");
-MODULE_FIRMWARE("qcom/a630_zap.mbn");
-MODULE_FIRMWARE("qcom/a640_gmu.bin");
-MODULE_FIRMWARE("qcom/a650_gmu.bin");
-MODULE_FIRMWARE("qcom/a650_sqe.fw");
-MODULE_FIRMWARE("qcom/a660_gmu.bin");
-MODULE_FIRMWARE("qcom/a660_sqe.fw");
-
 static const struct adreno_reglist a702_hwcg[] = {
 	{ REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222 },
 	{ REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220 },
-- 
2.49.0


