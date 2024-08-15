Return-Path: <linux-arm-msm+bounces-28660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB1C9539F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:27:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C1D61C228A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 18:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F8AB6BFC7;
	Thu, 15 Aug 2024 18:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L4WCpYVR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE9E4AEE9;
	Thu, 15 Aug 2024 18:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723746461; cv=none; b=IWAalmWzXEhc0duuBuZHlbTyadH6+GJpXIfuTQntjsVrvRFp95fZc6lBXbY/oOBdrG0GxCbq299CfE5XBhC8dHYW1Q+TUYjnHJiFR9sJVFU8PULfN6tm3TV24v/Lv8bG21QUAgryXBQNtCDRimHejfyYQo1Awp/+jouCuwYx4Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723746461; c=relaxed/simple;
	bh=5UQUbB4gp80E1aCA4nhyaMM7cChO8qWJiCOBtxcnjyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tvZahHSglfU24SihfDJ4P/AQkGkggRzg+57q3f+2m43KMOpJqlgmBP9OaF1xLSLyvddCHIjY0toVATMUoVyXcaRTHYcvfSbYGRHjnhx2lwkIIXZyDBY1BSZXYR8OsW9OSJhOJI7eABuJiX9R3Ij9p6cdpRCNGQFS8+czEcTtdn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L4WCpYVR; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f029e9c9cfso18225141fa.2;
        Thu, 15 Aug 2024 11:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723746457; x=1724351257; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kfyNitr7n9IBeiytQhNaMqBxtLdQ27gFGfEYrZl43AU=;
        b=L4WCpYVRizaxMpxPxcnA5nWujdnLNVVIz2WMgwuLK/lXhHfbaQRZd1/ds9o5nfWnkB
         BXKDtr9xaJbj1ZZZUf5oIvCOexYGhchFDA9HBU60JSiB6+Rg6vT++ba5HrL2RiTRmggz
         aQLtfrr9Pszn7SWPt/USCJJ+g2jEzgbpV63rqiZ1lr3AzNbmDLbHxjNA2KhK/NLiv1Nz
         aCfn7YevWCLIx7BIBN8++8It9ZgRzlyvl1m/IqOuI/umCVYno6QTbbp7+PK9nQ6m0yq/
         7kNsAhKSVYx2DUxrL6pV6Aw1Bg0VRzv6LMgGnn2quLtrDMEv4JN4d5u7aqzaH/e2ysku
         n6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723746457; x=1724351257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfyNitr7n9IBeiytQhNaMqBxtLdQ27gFGfEYrZl43AU=;
        b=wz9zI6QkI9pnP59bWhDWIPCXWG+jtpkB504dElV2q0dzevOPJqrUAJ3jBwLGwJoogm
         ktaSnneKt9QFV+0+JAGYf/iwTosP/c7X1HnemjGRPAPqsjf1QvOnoGy2vb3uq171Jx5T
         lurdhw+QlBARS16C+uCfnDNJckwfDRzBFtgcwJ32gWNayQAn0aSawGiZEeYKn7AnX77v
         fsVFDJQ/3lUXUPHvRyNDDV1xld4FnVzQvJi6axOsqI0SSmrSY8BZHAIkonb0/n82enr7
         R56Jp/xnec9o/Pj/FBZPkUMx731+Cr1RN1jjBU5UcXxxMnP3ymxXxUMVXqt5PwrqQQ0I
         C43A==
X-Forwarded-Encrypted: i=1; AJvYcCVbiDdPl4N341p3N/3rjxg+xduezEgzNJtAOTfntaRD3uL0soFhwgVAUZWQCiFPheqwoZCNLnZtvAq1z9tQ+hc7HKOb+Ch/DQTOn0AQ
X-Gm-Message-State: AOJu0YxBNZH5Rbx4Vjiwq1uKDyDKlCkauwS+IKRwRhZspuiYTm+8z0QT
	CvoQD/GkAEOEByVfUP1Sv8tVv3ERNWtu8eS/YGpFmWz7RmLPjI1T
X-Google-Smtp-Source: AGHT+IFBVz0TzJtS4M+sYECsv1VIhUSvNMY2XP3x5/1iARu7qmeuI+rqZuBoqE29ZD802zvcHsRFxg==
X-Received: by 2002:a2e:9053:0:b0:2ef:2e98:9718 with SMTP id 38308e7fff4ca-2f3be583963mr4671051fa.15.1723746457166;
        Thu, 15 Aug 2024 11:27:37 -0700 (PDT)
Received: from [192.168.1.13] (host-79-35-172-29.retail.telecomitalia.it. [79.35.172.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8383947187sm133814366b.166.2024.08.15.11.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 11:27:36 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 15 Aug 2024 20:26:11 +0200
Subject: [PATCH 1/7] drm/msm: Fix bv_fence being used as bv_rptr
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240815-preemption-a750-t-v1-1-7bda26c34037@gmail.com>
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
In-Reply-To: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
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
 Antonino Maniscalco <antomani103@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723746454; l=1437;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=5UQUbB4gp80E1aCA4nhyaMM7cChO8qWJiCOBtxcnjyU=;
 b=WStWfdviZV2WJZlLrsE28/bmfEOARulhUrSCokZ1bsiJf3LoqdAH8EezgpQo+F4dfCNvp1rag
 EzGAwabZffKAK0pipd9g5pUbKWt31CzLyz3RML+2SXrAEHDR2OM2fKI
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

The bv_fence field of rbmemptrs was being used incorrectly as the BV
rptr shadow pointer in some places.

Add a bv_rptr field and change the code to use that instead.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
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


