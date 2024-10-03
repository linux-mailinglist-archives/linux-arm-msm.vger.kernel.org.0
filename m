Return-Path: <linux-arm-msm+bounces-33028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EF498F3C4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 18:13:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C5E42813EE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 16:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 651861A707F;
	Thu,  3 Oct 2024 16:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QX3dikZ9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9887D1A705F;
	Thu,  3 Oct 2024 16:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727971982; cv=none; b=NeVRhlig3VJwmTFXpaWt/I2l+Bpe7BS6GucGFSPuxf8ROc3bVvv85AuLvlpQ6C3KHHAGgaEI3vEbyXOzDYtAzcEakPMrWfJyuqUwETMrEqOzBJpOPYUM4rq7xlus7MiUwZlSKAntldY+z8Qh8Nh3MUxxkIFA60hDVzpFZfQKLcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727971982; c=relaxed/simple;
	bh=a7i9oji+Kb0tTlTXnErd/GxgUbRIJJuFO80e+whAz5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OxG2dezmydEJq1a4Zks8Bm07k2gCGkk5fERuHDXmLFuzVTIf5agmtdskAszNK9MWcrjA+hZKL9WABl48pSnnmSSAgsqXYrD2L2W6H6/w+dTefO/73Iohoa//KBInk1Y32VbCxIbuQaT4Ov6ugvyjJc/dcUn+pSPaIJO55e2tKAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QX3dikZ9; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c42f406e29so1528469a12.2;
        Thu, 03 Oct 2024 09:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727971979; x=1728576779; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MLrAGGRIrPLNX0fIU3MHlAkZUYfcrMnizkIk1EY/dAY=;
        b=QX3dikZ9b6xVHkZ6CuUw0bltsW7SrX8wmqVeSV6c6Q9jnwDA8pHfllVN9U9UVrf+4A
         j6TbKGQuixKQnV5JhqJxrXSxYl0i8HY6YZRNV3slcUiIUymrf3dfrimkE3xIICqbwcmh
         scJ8nLZpG74J7MHhhhRQQL8n2CRNhiO9hI0kWk2Vginss1sSvWXdty7Jzb//eob1mPP3
         aH52CrjvpAwDSPBNc8yfR5VHLLwq6DgkytXaB4CdzdvwcprQgyd1CdJiV8uX7TCm2LQ0
         iOKvnUT6MADMxUjje4J2zFpYiMhPZzMiRyB1VnhrNoY8UvHddXniVd1a9JK6MWug3FwL
         Hi9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727971979; x=1728576779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MLrAGGRIrPLNX0fIU3MHlAkZUYfcrMnizkIk1EY/dAY=;
        b=fMQcBCovpp1/XswSefbAz9+h8WUGD/eNWoDkC3E0dI124CRC6d+hnZOE87ghBz07m8
         ninFuQDBvCayCvQdk5QXlPtjJUTvvr6gikRPqsqL3mH2duGGE/Z06fz5KrDqX2znFtwk
         ZWiNrn7YuW1RM/NzpmiIGXhCi8q/CTKV2b8hgPIA3Rv8iqESBvqul0I1H/BP8D5fiizw
         UvnvH1iEIlVZ0kUvEC6jZMMH4Ooh4KK3/whjg5GFOgNy3z3XOgsU4SyUMuzC/rMSShV5
         KCdt27SlgNfKaV1pZCHWBsU9hg487TuoRanx1jH7xlTdAhw3Z7X/IkI08a/JUE8apHcs
         EnlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk2z3iSkPe3rqr9kOaRhrqZFZMu1s1oen28kfAubXIj8yMHP5mV9ML0lZuxOfiqsk56Mufq2Hu7Ho=@vger.kernel.org, AJvYcCWrgJf2elh7BhkC6IFzkXZM/Siv+Q3vXkzAA8LG9OeL71RqRukUJuYYRw1IZTbYqSODbjHO2e5r8kbqrNrZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxXY9oS9jiOgs6MP7p6CU1sWaiipz1yO3fWnQ6Vq95jbNOFEKzg
	IPNPKFyeIaSVEwyp5/CZ+MUh3pNvY5DFVYGmxSJ5iKp6sslO+kqI
X-Google-Smtp-Source: AGHT+IGM5Zca8lHIH3urol1yKb73CC7sbx8xGX58Lw0mbRqhf2dJkhWVdEEnVL42vMbQdzKn0MUHIg==
X-Received: by 2002:a17:907:9345:b0:a8d:5d28:8e0d with SMTP id a640c23a62f3a-a98f837b6c6mr566731966b.45.1727971978757;
        Thu, 03 Oct 2024 09:12:58 -0700 (PDT)
Received: from [192.168.1.17] (host-79-12-161-203.retail.telecomitalia.it. [79.12.161.203])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99103b314asm102382366b.103.2024.10.03.09.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 09:12:58 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 03 Oct 2024 18:12:50 +0200
Subject: [PATCH v8 01/12] drm/msm: Fix bv_fence being used as bv_rptr
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241003-preemption-a750-t-v8-1-5c6cb9f256e0@gmail.com>
References: <20241003-preemption-a750-t-v8-0-5c6cb9f256e0@gmail.com>
In-Reply-To: <20241003-preemption-a750-t-v8-0-5c6cb9f256e0@gmail.com>
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
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727971975; l=1862;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=a7i9oji+Kb0tTlTXnErd/GxgUbRIJJuFO80e+whAz5c=;
 b=dFWbauOYlLyo1yIzbd6BN2HyYlM/JboGwxDZJeazXddSBkCqLThvPU4p1EwM1NUDIMPvVoTqE
 tfS/mBscX7hDVM6S57Z4XDeSbWutmxY8ic8c851HnaJ6DNaPohkCR14
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

The bv_fence field of rbmemptrs was being used incorrectly as the BV
rptr shadow pointer in some places.

Add a bv_rptr field and change the code to use that instead.

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Tested-by: Rob Clark <robdclark@gmail.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index bcaec86ac67a5c90544922372cd46fbdd8cf359e..32a4faa93d7f072ea6b8d949f4dc9d2a58cec6b9 100644
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
index 0d6beb8cd39a7b297e73741d2018915246a710d4..40791b2ade46ef0e16e2a4088291a575d3be9e82 100644
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
2.46.1


