Return-Path: <linux-arm-msm+bounces-25116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2B9925C92
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 13:19:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5759BB3421C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 11:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7539916B390;
	Wed,  3 Jul 2024 10:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MHAe3FTa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE11B181CF0
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jul 2024 10:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720004047; cv=none; b=A3qDVjvCaCPifhYLOKssftpx9eM4fvJCglxWtQrGPXje34RWVIj+sAuP79h7Rkx7ENrkfGZ0VdyL3AaFEfu+iT0zm8vr8Oi63+cW6458X3nMf4T2pAvbpWaCoDNXe2cECimHRHvnqDNo3IFQdX3/QupOMTPt4izCu0KxmVteROg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720004047; c=relaxed/simple;
	bh=NRBL4jAN6hjfyxISVZD05E8syLttrXlZkKCLenRZkDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kX7AjuxlE2T4h/rKkgqRRHpKWzHDtjixr2lxPwxlIus9vp59CONqx3NX5XgoRKjaf2/N5a0ZMfNPu7LQP+8UvLYG/vmDNGq4EYphBNwANJAfL8XGn2wIIcpzCrPtY5Y2DcK1Pg58XTQfWU3Dg67jOXFcjzHY8sYQjII1bq7q48k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MHAe3FTa; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ec4eefbaf1so55597381fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2024 03:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720004044; x=1720608844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X+in5BXb/vtFxcHIZXRWviluH0ffdCxEZJKwCycdffI=;
        b=MHAe3FTaKszuSNE2y/LPo61aACBO/T1SdzgzaSwKDzf+HIJUaYU2GMXyw4s2BgWya+
         1W7/qGh5L0WFJgo0gRj6XTdPw+FRXNsUuYwnyTDr4LptLenpg1R1GnYjiz4wnNYTy3u/
         IGh95WWexAkt7pLyzx5wVRPWogApf4FZMO9iRGexs+dpHxJ5Le+FEcUWGxe/OhVLYof7
         G43z370KXQ+cggUMz308yReNbAqpVKtRiUIPcCbS3c8gXkvwyRiG/KZkQuP+sJZj95GT
         cZ8T80ODDcJySuWLn22AyvBWs2xNgmz3a9oGzTkvVF4Xwp7lKyt82n2/iw6Tu3nC7fug
         xsvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720004044; x=1720608844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X+in5BXb/vtFxcHIZXRWviluH0ffdCxEZJKwCycdffI=;
        b=pGnTjKJx92j17lj5PCBeVrTfnCe2BxcrRT8AxqLroKXRwM+6/v4pl/4fOv9Jm0vBOJ
         sxrocHtRs+XMSWoTAAIB3cd/2fIckWi2HpVhU/EmFKXD+6Yt87Et1+3M9Bq0Ix1xegFI
         KyBJpsf80yixwbTQXCDroFBxiKz6LHnvmFQcfMBvQ6nDK2OTi0bcmXPRcWv6DZbSm8oq
         pkkBatDKYXudd5iOFN6Vamyu/CboYcc7huWJ4jwHuGPCQxefmZNGlxmk8fTTKPVe0Hi5
         3AxpenSuYrot4Ro6iNpxdSBaatzDvN1fPb8N9aqMLBjDZEyfy3bOA4iqtwiUHYvbYccS
         Q2GQ==
X-Gm-Message-State: AOJu0YxbIPl83sXhm890n/9fh11nk2POGj9QTjYv9fbARkIPPeI3unKD
	KbRGjyNj7/P1qqkm/Q2AswUBYXVWt1nt7rD6AMD1e+kJvCWTQrJs
X-Google-Smtp-Source: AGHT+IGkQhYp6C4iCdcLdDXmR0eESMCPMl+aTQRH6S1hhLyjnuBSp92V5VZ53UeIKqFXa98xzrHVjQ==
X-Received: by 2002:a2e:b169:0:b0:2ee:8817:422b with SMTP id 38308e7fff4ca-2ee8817435emr4552951fa.19.1720004043456;
        Wed, 03 Jul 2024 03:54:03 -0700 (PDT)
Received: from [192.168.0.20] (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0d9b1dsm15644879f8f.42.2024.07.03.03.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 03:54:03 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 03 Jul 2024 11:53:49 +0100
Subject: [PATCH v2 3/3] drm/msm: Expose expanded UBWC config uapi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-msm-tiling-config-v2-3-b9da29ab6608@gmail.com>
References: <20240703-msm-tiling-config-v2-0-b9da29ab6608@gmail.com>
In-Reply-To: <20240703-msm-tiling-config-v2-0-b9da29ab6608@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720004038; l=1686;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=NRBL4jAN6hjfyxISVZD05E8syLttrXlZkKCLenRZkDQ=;
 b=uOMD0cQHXWYYxQeOFr04/892ck5b1ocEmyn8AQq69zm16OKeU85kklfqTCge7b1j1knvXHGK9
 i3zfAdgB7EvBAenyVHWZ44zjKbL20RNSaqmk08J4cUdCWs+BruErspQ
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

This adds extra parameters that affect UBWC tiling that will be used by
the Mesa implementation of VK_EXT_host_image_copy.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 6 ++++++
 include/uapi/drm/msm_drm.h              | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 1c6626747b98..a4d3bc2de8df 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -379,6 +379,12 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 	case MSM_PARAM_RAYTRACING:
 		*value = adreno_gpu->has_ray_tracing;
 		return 0;
+	case MSM_PARAM_UBWC_SWIZZLE:
+		*value = adreno_gpu->ubwc_config.ubwc_swizzle;
+		return 0;
+	case MSM_PARAM_MACROTILE_MODE:
+		*value = adreno_gpu->ubwc_config.macrotile_mode;
+		return 0;
 	default:
 		DBG("%s: invalid param: %u", gpu->name, param);
 		return -EINVAL;
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 3fca72f73861..2377147b6af0 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -88,6 +88,8 @@ struct drm_msm_timespec {
 #define MSM_PARAM_VA_SIZE    0x0f  /* RO: size of valid GPU iova range (bytes) */
 #define MSM_PARAM_HIGHEST_BANK_BIT 0x10 /* RO */
 #define MSM_PARAM_RAYTRACING 0x11 /* RO */
+#define MSM_PARAM_UBWC_SWIZZLE 0x12 /* RO */
+#define MSM_PARAM_MACROTILE_MODE 0x13 /* RO */
 
 /* For backwards compat.  The original support for preemption was based on
  * a single ring per priority level so # of priority levels equals the #

-- 
2.31.1


