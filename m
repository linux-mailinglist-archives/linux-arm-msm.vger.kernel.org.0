Return-Path: <linux-arm-msm+bounces-32609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE407987A6B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 23:17:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C19AC282C17
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 21:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A28186E5D;
	Thu, 26 Sep 2024 21:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WNmEnJyv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0983C185E4E;
	Thu, 26 Sep 2024 21:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727385420; cv=none; b=hA5xo74uCVb9RE1T2R3zCnsI2kxMUkgIQpMJ8OagrtkI2h/vp8iuIlL8O7UlaRCPKl1KP1yq/7ArZ61oXrIjBmK0MCyrrsz124t/VputLb7HAgPI731t06no3aPLyP6rNHTvdwL6519+EJcXK49MKerPemhbhDip7XcoF02gyUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727385420; c=relaxed/simple;
	bh=8ChbnJhsvl1xm2NLNpkzia7Mqz9GSrQ1hXSsZqycXm8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nlGgXvrwRYpzot66WnmBi4meACZf7XrGwt0HwcRZ6WMZTeL7tFDDbZn9r8siSr+6r3EJFa3sDqcFvEEKziYVwqBWk7AKp/QVLiDRFfyblI67EX6uYcgVmCC1InMdUp/llvxEDfS84uJPMID1Si4Mwoark8i27LVmnqihD3hILdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WNmEnJyv; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a8a897bd4f1so190858166b.3;
        Thu, 26 Sep 2024 14:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727385417; x=1727990217; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhEk8RuEr+Jxg4Bk7Vc0/8COm679tekr0FDZbumhOZg=;
        b=WNmEnJyvZkDHL6vY3hjxtVBJAgoxNOQaebFQN3eMusjxuxre7QenNd24ru0nQOc3Rf
         wy9VDAQ7ADs5J/iVgY0DLvqDiG4MUJhS5oC4WEw2lWZjUF8HZV5wSK81BNLSsv/kztf4
         5wyYKQ3jprHK4yWFemtTiqT4Y/4mMN/KQRblPraqVKZ7DnLSF0FBCJQDyDNTTAVw8WkM
         gJ23lVVIjoTbfDl3hlac2kkZlu4RZvv9uHC8zP0we+R+IFvCbf0mJWIBnBKxKXzyCF1H
         3x+1dFi5CdRfB8JFZSGccpfuUe2ssSYM6Ez8Anhuoc1Q3rAXQZzZ2TqCJlsNjws+weoT
         efuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727385417; x=1727990217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhEk8RuEr+Jxg4Bk7Vc0/8COm679tekr0FDZbumhOZg=;
        b=VW3GyyLGKCESI1MK6GffQnS/IAJT1xw8eP1RkLL+UF2XBAvIDVL763EpTaCN+Dj3tb
         Y16s3KreW4Vb+d0HvLSkuGj2tpFQhQD5WtuUK4CGEDpJ2pIe+UkD1VMRRTy+C5I3eBzA
         QnotrRPkNXxVIZhR0fCtB+LfUY9sja39qjo40uKDHV8VfpapYS2Qek00p7qdr+U1Zy2W
         li/kEMwMr5pW579u8rouQ6m9nSF8O/XzZtpYFZiaUimeAB1GgDZvSS6Pn4+YB7V/a001
         fEMq9If/4HqjkoilsbIOZmeXJl7wc4lxZyxSCksKA5gZCufvCJ7c0f/qtlvgOi/WzUlt
         tFOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOPLTT94H7K4JHELYM7DMNE7qr4cIDbzOFk6O8e/w7XZEYiRJDVAkZQiN71NrejwvbEOeVTjbrD6A=@vger.kernel.org, AJvYcCUQSLjASq6amx/FamTSqhyaK/3tYlN4wxTgQ0ToD4oMuTM8m6thm6xZFd77VZo7R6n42+RPpZp9ylpQ89tn@vger.kernel.org
X-Gm-Message-State: AOJu0YzhjQp42RJ4myLZkkQ065ye0CxRb84PtFSDxO5mF1wiHQAcFzbd
	w7YlDvofUWI/myrTK5lLFQhn1eew2dBhnKrroskovEuu/7FsdCbT
X-Google-Smtp-Source: AGHT+IGtt+t+Af5mg7EyuUZyXyVhphpGMI7KE1Ez8k428+chJA0fQWwTgH4qOXmeHsjClRMG8Hlkug==
X-Received: by 2002:a17:907:3f22:b0:a86:8ff8:1dd8 with SMTP id a640c23a62f3a-a93c4a61db7mr64371966b.46.1727385417044;
        Thu, 26 Sep 2024 14:16:57 -0700 (PDT)
Received: from [192.168.1.17] (a-lu6-5.tin.it. [212.216.221.196])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c297b7d6sm38862166b.162.2024.09.26.14.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 14:16:56 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 26 Sep 2024 23:16:43 +0200
Subject: [PATCH v6 01/11] drm/msm: Fix bv_fence being used as bv_rptr
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-preemption-a750-t-v6-1-7b6e1ef3648f@gmail.com>
References: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com>
In-Reply-To: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727385413; l=1818;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=8ChbnJhsvl1xm2NLNpkzia7Mqz9GSrQ1hXSsZqycXm8=;
 b=pHX2PTo2RuaylcDsM37sIS1jp15/MvbG2l9GP2Utp4rHO0/VlOujPmqW1J8fQKGaiGdPmbItq
 UxIOy8OFADSAANr2ahvBzateCWxQ5Wb7FPYUlk/96zJaBgcwJpjSuxB
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

The bv_fence field of rbmemptrs was being used incorrectly as the BV
rptr shadow pointer in some places.

Add a bv_rptr field and change the code to use that instead.

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
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


