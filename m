Return-Path: <linux-arm-msm+bounces-28093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB5294A83C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 15:05:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA1821F21500
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 13:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F719155C83;
	Wed,  7 Aug 2024 13:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJqD+hLm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B26D1E4F1E
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Aug 2024 13:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723035917; cv=none; b=QgxoqBwc6GZqSIAY6SX2hcdUKo0/PCNIvwS6WnmN8b/Rnz/TqpqDYcc4aDNBhju+1RwxyCksq8k65i++eobzxRj1xC20vhGkg373RwcNceNEBWOoEqzf9BgSGDIqGGUv+AVWjCpb3elGBpqq7qESlqhyNDKJTlvo9UtVF0ntTG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723035917; c=relaxed/simple;
	bh=NRBL4jAN6hjfyxISVZD05E8syLttrXlZkKCLenRZkDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T53MTEuu28rHlr0gtq8uIKJyltdYLwjOzra63hcBJnr5spL1oaS957ge4ntW/8xWuTXMPqQfJ5RwXbCpxMR+nWCBs/zlYQ1dheWpdG6Dx+xiz7HKFoxc2iBn8evmB8rdEH+bkNvrg8TKvS0r25ivSEEv0vyuSmmuxTdLP+K/SZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJqD+hLm; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3683f56b9bdso1198775f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Aug 2024 06:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723035914; x=1723640714; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X+in5BXb/vtFxcHIZXRWviluH0ffdCxEZJKwCycdffI=;
        b=LJqD+hLmGAW8Jxy8yz7SMbBkJIaWZOhP+Ooh1sYm6OGFEnfU/t2zLXi7C7gq5nqJNY
         ngqFcGCmmaK7bM6wiTi/dLDZilsG+cA9XtszD2hKKB1Gzknisp7HNbIydmH6BqhU2t8Y
         T+iP58q8WY7kggJAhWdWg/rsR8oebZo1C0ggp58ARg1FsKQfkd0ARybIsM03vCh3QGxj
         Ah3bPB8JjGF6jiWB7BMwhqOv6w4nGf0mNaOOIX73ofbmvX02/8De2K4ysIc6LyFC8iHk
         2eM5vhZ0JChoVCRA5+McnNpdlZbTBviHQa/mjjLHFpZq9Zdyzm5OliShE2YBwrli8+yd
         y8ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723035914; x=1723640714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X+in5BXb/vtFxcHIZXRWviluH0ffdCxEZJKwCycdffI=;
        b=JS4fq5H6KOPLxOFypyjLKvrcCf30jR74qJWWRvrf41ByFg0vswE1xca5yqmXC4Ix2v
         Lwp5Dy1E1tL5nlwmPx2fbsdmN1upTQtZ6vSIV/gF0adbk6QHvdARG3fAMiE3ll38o1LR
         hGEb1Y9rSn9eTiwupwVskxQ0Z4u2SR2fUgDetCf0/kuJznAmp1xOOQKW1LG/3ONsYkUt
         Gej5YoBQ4YE8Qy2h4EHlN7b4Q/UOA8Vw5YWnWkEmR7mKIPA7WX/YVB98k9yfx1JIYpg1
         KRrbNBAXiuOr7aGzrBKbM3Or15dKFmSw5QpSMCxyFLXu0EU5An3scmM2iBZQAOw0NVWv
         WjCA==
X-Gm-Message-State: AOJu0YxYwf9RMBTwCZ8cYxAoCwOuLBUvWtXWkVCaybNXIccQmE8JU/3D
	3M/Y+8ejEwTC3iMUGU0jsYo0hvGL/kQHZ7+It5CMNX1wqCpnKFxX
X-Google-Smtp-Source: AGHT+IGryRxi5KmB9DpHFGsqNZJS7ZbVWGPc/xzxJkhPbGz4XRaLoFExWXIJS6YW/kfmgunxFy1xrQ==
X-Received: by 2002:adf:e607:0:b0:367:40b9:e9e6 with SMTP id ffacd0b85a97d-36bbc0f5b05mr11537555f8f.21.1723035913757;
        Wed, 07 Aug 2024 06:05:13 -0700 (PDT)
Received: from [192.168.0.12] (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd05980csm16072849f8f.76.2024.08.07.06.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 06:05:13 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 07 Aug 2024 14:04:58 +0100
Subject: [PATCH v3 3/4] drm/msm: Expose expanded UBWC config uapi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-msm-tiling-config-v3-3-ef1bc26efb4c@gmail.com>
References: <20240807-msm-tiling-config-v3-0-ef1bc26efb4c@gmail.com>
In-Reply-To: <20240807-msm-tiling-config-v3-0-ef1bc26efb4c@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723035909; l=1686;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=NRBL4jAN6hjfyxISVZD05E8syLttrXlZkKCLenRZkDQ=;
 b=s9YvQa4URwtRyyRrn7r60+3wWfDZ+grUkG7vbmYkOJLhXjDSyozklBEyFds/LrCkjLo+fgccq
 VsJdVKmVLtSBVAt+DGq2jmLUL9W1A2fTqbXbs2S866A04vNgzk3KETJ
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


