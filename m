Return-Path: <linux-arm-msm+bounces-30954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2609696DC73
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 16:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C29EC1F21742
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 14:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8EA47D405;
	Thu,  5 Sep 2024 14:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXEp1QiV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC55125D6;
	Thu,  5 Sep 2024 14:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725547890; cv=none; b=X7s1Nr5zVg79r0EH1SrfizEbCFnvJA+khVlx905gH/pKwybDbg9mlMMkA2l3XXqBkGOJ/vgMOPHNXVMDONKQcRDvle1IMrOnDKF9dsQwj7XBRlC+cWkJIC1kjxQAIPduI6SQjC4orH/KOd7Kpbw0HPLDmksEO/6+j+tb4Ps0Vt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725547890; c=relaxed/simple;
	bh=V6jkAeJmIPNRJFej3NR/GIrK2ICQj0XykO4lOq0cjkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZPJJaMy9NWmUIGaLYN8mVUW+r9DIDhGyt2aDUH0SmQ6bBnjWR2mExbSlsCJnCpIWL2S7Yndw9fnulptU0iK5VtQk7XqoyxqfHdP63TcA4vyM98qrzQg2COiyC11DRx3yWe1rwkX1JVS7xs0xOd6LuhTLe6G18JlWqC3oCkHhA2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXEp1QiV; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c25554ec1eso1004741a12.1;
        Thu, 05 Sep 2024 07:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725547887; x=1726152687; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ow4BKSNXeJuwl4BWibh52xw/cDIJ4gXhuaEoDSj5CrM=;
        b=cXEp1QiVBrNGrzE8XAuofv1z9fubWFoG+YXcjjZ7KDDcaTNgoKz1nFnFao+UOk4qDJ
         a8rKdlCRUQIx8TrA3hl1MzNbI0R2n195o1vt4wi+KijeBhLDhxGRMg4a+7uDUxwUGkxN
         eTzPm4naFf7/iGq0qcwMzmR0LYXRA+tAtLaGd24c6mPFN5URn0tKHA4n9HYnU7q5pwZ8
         3pLuNhuwRCj/rvOLvP9nLG6s+kWSTNVm0hyspaxVXLPAzc6yj+TNkg1JTePmX00hFHwY
         KWYopozUFInv0o8Qje3x2DEvPWjgmKZLum5ZPmH/VYk3aZUFX9fRy9LAgpJbcCJgGnfM
         NcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725547887; x=1726152687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ow4BKSNXeJuwl4BWibh52xw/cDIJ4gXhuaEoDSj5CrM=;
        b=ZmXAQ+86S8YjlIdf4+HprSoPmCBbh3tX5NnYfQIQ3A2eLggnKsQx3/lnNeU51GQSnL
         aEyfH02rJWIvYvEwWQ/WWrrZrxZsskwno9IMpumDcQY3hutgNBP2KhSiDEkc6MTSz0ph
         pjhqchrvDqNLwKmCBmZAwEEsFSPTdrL+vNr0czpSwC0RZdf4r1T7fAVefZ3RKHTQYyrR
         cnak5fMZQ/6JMv+87JKFl7JnVIHcg7HAC4HvauNzIC2hBjEyt/0R3zZ9jaboLXebyPxW
         Zzuzauz+941sgvcylkNEtnlYiioCrT0wOrS+aV/l1eMY0AL8Iu0XhYp3GBHdLl/utBr5
         ljYg==
X-Forwarded-Encrypted: i=1; AJvYcCUQAN062WSWhHJPoj00VEBMwepX9aOXj4j+N1X1F05PWyJO+dEdBY1PwnDLHokxbF5qcHdJwomFkNU=@vger.kernel.org, AJvYcCWhM0UD9vR0vQfntoqMbfS+vsHmkwCTEQMkfiQXDLnI6fE47oLx8Sgs7nNgyvWkasBlg+KuuRzFW30+29VC@vger.kernel.org
X-Gm-Message-State: AOJu0Yx227u+l0XqwGIuteV24Ti7WznCXDHn8NAownVWaQmLE6qvL57G
	qwdjBVU9EUYqgVlS/LyNDVEv7tVZ2ao16E2axdez42Qt4NF+uPWy
X-Google-Smtp-Source: AGHT+IGVVAHqzv7b2TCmV33xgpFCR5V8XVKiiovwL94i8vFogrt3mL4xpG0SrMZPZpw0NssCUYZK9Q==
X-Received: by 2002:a05:6402:d08:b0:5bf:17f:4b7b with SMTP id 4fb4d7f45d1cf-5c21ed9e756mr18240652a12.32.1725547886416;
        Thu, 05 Sep 2024 07:51:26 -0700 (PDT)
Received: from [192.168.1.17] (host-87-16-167-153.retail.telecomitalia.it. [87.16.167.153])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3cc52b376sm1320732a12.7.2024.09.05.07.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:51:26 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 05 Sep 2024 16:51:19 +0200
Subject: [PATCH v3 01/10] drm/msm: Fix bv_fence being used as bv_rptr
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-preemption-a750-t-v3-1-fd947699f7bc@gmail.com>
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
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725547882; l=1564;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=V6jkAeJmIPNRJFej3NR/GIrK2ICQj0XykO4lOq0cjkM=;
 b=KAu0wB1v9ysnVLr6XSAHW5K4Qht7Ky2VuMd+Fpz6pG2z9NmrrMaqzRb9UQaNIYxmvCJLZ1JdX
 WuDmv9kl1cxAruaQfYpL3cJGP3828Up9is1EZOBG7OgddXywszz8neU
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


