Return-Path: <linux-arm-msm+bounces-30264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 164549665A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 17:34:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C724628333B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 15:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01DD11B8EB3;
	Fri, 30 Aug 2024 15:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZrpwfDl5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CC01B86E6;
	Fri, 30 Aug 2024 15:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725031998; cv=none; b=pp+YHllUUMxOB4DpU8b3kWYqo05Z/7HBkvuZshQUFOmhDwnqxSWT3g0dFxaXPuoEVnLRiXXhurK9fM5Ntqednthubcz1wEDLiBK6rdEPvqrHYlqjIiFpFucXOQ7xSYyVPDddg2YMOSzjxOotMAh/Q1LXJdsLG73awXYSq0b8hKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725031998; c=relaxed/simple;
	bh=V6jkAeJmIPNRJFej3NR/GIrK2ICQj0XykO4lOq0cjkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wz5dyfDJ2cn92h0bljj9UspkvJaMrDdCJ6vckmr3qQBd4QRG9bzy6w+ZuFo/qmtnbXwqzItYRNtPm3KQl77e1kv14gjBhqw6LDF2EBelNSSZoetU34UkGjQT4fooK8TTspqOYiqEuCj/hWPEg27AyyflHxD/xbcnuVB5E0RUxq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZrpwfDl5; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a86a0b5513aso227370366b.1;
        Fri, 30 Aug 2024 08:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725031995; x=1725636795; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ow4BKSNXeJuwl4BWibh52xw/cDIJ4gXhuaEoDSj5CrM=;
        b=ZrpwfDl5+VURuserujqGLUqv5Wzilw52XgRj/YD/vD01YEX88p+qfdFR7N51QEWGXJ
         r97T/dBvehhI94Ro3FfmSSJrLNCQkRUOealFfYtGQK5EKfdXzAea5zcuxvpNTorquile
         TWVsJ6VwwvPuz4VV7IpVtPtD3pwyOwYMG0K0FVt+3XjKdgYXPk3ShswK3P43p5jBZQlz
         DeLQ2D2v5z5xPp4Nfpr32WY94/eiWfyEeISZhmnQwQh2fglm2b8ltiE3vIarQtxDveOQ
         q3vzfpjaMQFB5A0zhjR3bB0NbOTLVJXV1TRMbinanMrqDKBm3s8v5VsuD/Cjzfno3req
         5vig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725031995; x=1725636795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ow4BKSNXeJuwl4BWibh52xw/cDIJ4gXhuaEoDSj5CrM=;
        b=q3T5WP9wNhjUAGrOIej29IYr8sDHp5YWys3ZAshhb2XCrVGZhbuyiT+op1gbDW/fNX
         9zi5RwZ/YExvleXOIj2sPKK7CCoSxCZAw6OnoeNPwYky/syGZ0iXdbc1k4DPEy9vRG58
         aZtRP4M49wxDMjRY1BRsOAqYYHZbhrYx5psZyXdsWvJr55THfe2s8E/yhr3QU6K5NCy2
         mQyoyPnzWlvdHgMlnBX303PeqXSLkl/nyVBLB6hj6Ogh4SSn08V6+F5xshnK6qm9oUdm
         B8Zci5j6rSA9FpkB7ogeZRFdM8Y19RNfNOUS7XhtsTcmpdC0nDPpKig3Q31fvGTYiunl
         ZmyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxqarPGKt+cpqaBFdIMKI3hLJXi36Hsiw4TGL+waBuNmCTJH/zEcjM/ekMcqNDMKbJdCuJt0TNFJikMN0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDx66piLlnGRCqM80cFrj+5BiKYXEUft6Ril8+EO2I5c0nGoTX
	IeJwUwSkyOr7J4+XZdmPWvrrN3AZkWhDO5CIk+vVqAIWaKTeKePibObMfpe8
X-Google-Smtp-Source: AGHT+IHeWzyBK3/Rb0wAVxcifNA9MgfBUVYtmBN6K76DeomNylK7id8vZAxQplW4+3vbTvlIOlrm9g==
X-Received: by 2002:a17:907:1c23:b0:a86:8165:1802 with SMTP id a640c23a62f3a-a897fad8ccamr471207366b.66.1725031994977;
        Fri, 30 Aug 2024 08:33:14 -0700 (PDT)
Received: from [192.168.1.14] (host-95-234-170-37.retail.telecomitalia.it. [95.234.170.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988ff4233sm227157866b.25.2024.08.30.08.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 08:33:14 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Fri, 30 Aug 2024 17:32:43 +0200
Subject: [PATCH v2 1/9] drm/msm: Fix bv_fence being used as bv_rptr
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240830-preemption-a750-t-v2-1-86aeead2cd80@gmail.com>
References: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
In-Reply-To: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Antonino Maniscalco <antomani103@gmail.com>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725031992; l=1564;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=V6jkAeJmIPNRJFej3NR/GIrK2ICQj0XykO4lOq0cjkM=;
 b=Yvj0xkSArHF9jxkL4DQg3HmZFs66B/DCv6oN2e8qM13O0VoJVQPSL11L9kqMhHh3jx+WwQ6iJ
 3wDZimVfbVDAiZbnjK0GHpwlhRdCgk93U3Z06TgRfVdhgLoSA1A3OfX
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

The bv_fence field of rbmemptrs was being used incorrectly as the BV
rptr shadow pointer in some places.

Add a bv_rptr field and change the code to use that instead.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index bcaec86ac67a..32a4faa93d7f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1132,7 +1132,7 @@ static int hw_init(struct msm_gpu *gpu)
 	/* ..which means "always" on A7xx, also for BV shadow */
 	if (adreno_is_a7xx(adreno_gpu)) {
 		gpu_write64(gpu, REG_A7XX_CP_BV_RB_RPTR_ADDR,
-			    rbmemptr(gpu->rb[0], bv_fence));
+			    rbmemptr(gpu->rb[0], bv_rptr));
 	}
 
 	/* Always come up on rb 0 */
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
index 0d6beb8cd39a..40791b2ade46 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.h
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
@@ -31,6 +31,7 @@ struct msm_rbmemptrs {
 	volatile uint32_t rptr;
 	volatile uint32_t fence;
 	/* Introduced on A7xx */
+	volatile uint32_t bv_rptr;
 	volatile uint32_t bv_fence;
 
 	volatile struct msm_gpu_submit_stats stats[MSM_GPU_SUBMIT_STATS_COUNT];

-- 
2.46.0


