Return-Path: <linux-arm-msm+bounces-32776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E988B98A5F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 15:52:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 789D5283F9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 13:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CED40190485;
	Mon, 30 Sep 2024 13:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OKxGPCJo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6C418EFEB;
	Mon, 30 Sep 2024 13:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727704365; cv=none; b=KSYN3c3V/IYqPfuWOfnbLJa0FKk8x2UlFPMpIBEDnRPH4oKhOFXhA8peEVtkYlZya4jQdON50zn2/BcH8kDzUNRxrVS/zuYVoY4bc12RC0O9xrvj2uGDuUpbS94HZUyY4rD3oyIT6M1WEbQWpzUkcIXwBwk4DsvJhC5LmUTP4WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727704365; c=relaxed/simple;
	bh=a7i9oji+Kb0tTlTXnErd/GxgUbRIJJuFO80e+whAz5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B/kNg8Dl0kUtjI8CSLAE7AlXcwYHKCVy5fZD476SwweZvxFnrSkwJeraf62h2FA4KsetYNIe0p2mYEvyNH3oZPp0xYLAYDr3TVUG/xUweR9xOHorz/FgD4rhL1erJEfMr1UBRTRNKEuCqrPLCFy3S6TVcSEeZxE5ZuGsaz+RWMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OKxGPCJo; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c883459b19so3727423a12.2;
        Mon, 30 Sep 2024 06:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727704362; x=1728309162; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MLrAGGRIrPLNX0fIU3MHlAkZUYfcrMnizkIk1EY/dAY=;
        b=OKxGPCJoRwCBZsb2QPvT4B7fpQi3oYSsZrYIqY/U00/0IaSlRSDBzFvbS/rCKbMdw5
         FD84EAEL4+lV1sq05dRllFwYPZLuuLYO+6ZDjDubcMcAJ0HEKK+djN6pp8eb91ipr9tq
         Q8lGHG3RIDHDQcjQ3VDb0QvnsJDNNNYaEpD4s0rDRUmmc6R0CjuHyUQATIOqx/fi3rm3
         kROejB8eU/UXBcwMoy/xWFGidvw9hhzLoAPUNOWol/KuDEz9Rc7lruWy8oKG0N3K3mvn
         K1/5G7d+q829s6QrOqzp82LZEDh4nhXX5gTqkgzgrDRNNIkTXQRjJlR6E8LzWGcFZSfF
         SEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727704362; x=1728309162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MLrAGGRIrPLNX0fIU3MHlAkZUYfcrMnizkIk1EY/dAY=;
        b=ll1Y0BsYFPWHECWfDIzyGwrVeJJx5WMy6e8vNnLYFheZdOYSyTo7/fAuPia3iJjJBo
         /eG1eZ3endSX10mGQKG161iTjAa7DIph+9/JMTrz4QTzz59ziXuqcWKWfoYNzC1R232w
         Ex1eWZGSFs3BBfpefOagja2SoHT1S+Npe2fq71/C7xcU+6CTWxW8RHxlqPEwRg7in0Le
         /Qr4N3IjC7AQgMhYWl5Skfa8LhenqCxZQ2cmeBdrjAzoQlr30w6JwkjFtZM8IyQCfvqh
         llFt/0u4uk6x+E+wtOkhOxrOWSEouyMSqoRr1k8HqLNOJs+ozoHL2tkhFUK/Oe5M8hmF
         HlrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd4KSU2L2595koKx+MLxGJnvIJBl6mEpXaabGlCd1PgiZ7+ww1fijkUb4zK7lg5kve520fsEBHDWo=@vger.kernel.org, AJvYcCXZBhkXAt2BM5c3DXzEj06bx5eDuLhWK/9lzh4uZ7TcVHr2rsE85DE0+n+DTM0xuSGcslHFXIDcK36DWyCC@vger.kernel.org
X-Gm-Message-State: AOJu0YzdfEpKq0QE1rZDHsXa8X2be4Z555swuAukZucByJt67FGXzmw7
	2XX+rIxiDSWdLMBemRlDGX/SVXIfBKpjmTRYVsTA8lZ/kmfiR5nR
X-Google-Smtp-Source: AGHT+IEFwDfI/yyd85ivmRYj59a+IDIZDYGFuKouqmE64yOQiR05oWwF2sdSrNbu7DDgzfcifNS3kw==
X-Received: by 2002:a05:6402:1ece:b0:5c8:9f44:a24d with SMTP id 4fb4d7f45d1cf-5c89f44a2femr1198181a12.9.1727704361914;
        Mon, 30 Sep 2024 06:52:41 -0700 (PDT)
Received: from [192.168.1.17] (host-95-250-55-22.retail.telecomitalia.it. [95.250.55.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c88245ea57sm4507540a12.55.2024.09.30.06.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 06:52:40 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Mon, 30 Sep 2024 15:52:36 +0200
Subject: [PATCH v7 01/12] drm/msm: Fix bv_fence being used as bv_rptr
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-preemption-a750-t-v7-1-47803c7a5a64@gmail.com>
References: <20240930-preemption-a750-t-v7-0-47803c7a5a64@gmail.com>
In-Reply-To: <20240930-preemption-a750-t-v7-0-47803c7a5a64@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727704357; l=1862;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=a7i9oji+Kb0tTlTXnErd/GxgUbRIJJuFO80e+whAz5c=;
 b=8RLHfSwmKTKKYIKNjHZtEWAuGYdw62UTNn2WYfVTjtQN2MI6YKOgdgL/t97WnkqA9PvydBoyX
 x5k4icV35nrDXQKKh9xUJbaUtjVv5cUD2YpFFwtzb6XwEPKxQusJI5q
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


