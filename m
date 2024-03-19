Return-Path: <linux-arm-msm+bounces-14516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AD787FEAB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 14:22:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B636B250B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 13:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D53D68062B;
	Tue, 19 Mar 2024 13:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OJP9ZhTd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9D28060C
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 13:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710854530; cv=none; b=PIenaWlKCfl9a+O1zj9HLInpNR1Q2qR5x2SX0izBHBHLCswtwCB2/281DJEO9R/gsVeop33W4LRN/1ykbStxPNazHYA7IU+SjInPNM8NV4tGVWRnFNhIPTto7JsFdzT33RiITgwjITx/IVvuZkyXOH8i2bG6Z/rmuTuxY62mqZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710854530; c=relaxed/simple;
	bh=PZaux6GZliSItAtHMhFoC7Cv0J9bBbkhdS1XTU0uAuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rM5I5JHl+2YYpWUAzoevp5gWE/dMvBl6vayr34GSND45ibxq7tz5OZ6ZYh3XAXlSawJPxXYd5vEDbd76oNP6csjyvvfNbGSVI49NXofzkKOhqgSS2ii4ltjXLodkYI/1zd+UYeBi2nJ8xD94qfzY7TGfxW8GhoOUS2gnWb9sp94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OJP9ZhTd; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d21cdbc85bso80244011fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 06:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710854527; x=1711459327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wkg7d4NEsh9ZC2iGh7MvW0HxBI7EYVmrRUBe6AkB3qo=;
        b=OJP9ZhTd7NgqETG1xErRujZKxwT2JmPrAPcXTQ5AoMEmVzDeHICJNmXhb5RjJrw8oV
         JKsS2dqY4UriGCMVpaimIIaTuZQVaEEE6nnJR54BbNeKUL082KNQfNJVAylIClH4aB8D
         pajWLLpKWilY1KX25XItyehS0+J4DW3B8q+Y/fnxypBHY5qSu6aWsPcLEaU6oDyE0fyq
         Aaqynnwu0lyMztmSzpN6VhiMTONdj54KHfN62ekpaTdcTq50WnHjK/UGCL+q/Hzzc/I/
         om/iXD0gTml+eK6oJr6hx4rjSlqq5WnodSWwpyLH9ZA2l0CzoMxt7Z9j+FnPOekpBWUU
         asAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710854527; x=1711459327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wkg7d4NEsh9ZC2iGh7MvW0HxBI7EYVmrRUBe6AkB3qo=;
        b=A6g4AMV/4XeG5rAA3TZ/jYDTkmhF+DScVMlYDBSA9fhtarDd/snSjg2RCzOInbAwhQ
         xm40S149rzKjaS7sx96+toYqVs9+oBMx01KKsymtNHGKZr8Z4ApcPgqbUM/mNRIZlCL5
         jb5wLMxelJo1km2nebqgQ/pRUFY1127V2YekgH9a88kzCDrzxxVfhqOCEG04hLrtVqJg
         9b4xIvfzgBF3k9H7JPJz/oMIZKXGZ9pNERz8xNfVcU3uKCUiX5QwurGgaluyX7/DSTN2
         h26ZzNnYlsL5ox4CRiuF3JRFHjCgaNdZi2/dUcYmGxSbGyBN2bs6Mey2g01yTO9T8ViE
         Yp4g==
X-Forwarded-Encrypted: i=1; AJvYcCXFDrK53WRHSD51pTr2sgrFqD0HVMmR6acnl73hzTQQOiAXsn0KMwHAAXQiDnBzudd1Bwoitpw5Q6kq+bUjzN7HckMsk7FC6Vi8DanjjA==
X-Gm-Message-State: AOJu0YxFoGTEY20WaAl0OsdMllB8CbzXSRmsjFjH25wo6vNYVWnd9P5U
	sJSTnHylI+kbuSjIfnaZAPVdq1VCT1tNEezgF57haomt1ukbuCdbXXTExTo3iJU=
X-Google-Smtp-Source: AGHT+IEJOSkP21SWHRkBvJ/gKsHTLI5anClFTAmbFaNnG1iFr5mCTdKzmhe08eHXXq4zyTwWZ0jxkw==
X-Received: by 2002:a2e:2c16:0:b0:2d2:c83c:ffd7 with SMTP id s22-20020a2e2c16000000b002d2c83cffd7mr7540374ljs.42.1710854527250;
        Tue, 19 Mar 2024 06:22:07 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j7-20020a2e3c07000000b002d435cdf2adsm1826148lja.111.2024.03.19.06.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 06:22:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 15:22:04 +0200
Subject: [PATCH 6/9] drm/msm/dpu: drop call to _dpu_crtc_setup_lm_bounds
 from atomic_begin
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-dpu-mode-config-width-v1-6-d0fe6bf81bf1@linaro.org>
References: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
In-Reply-To: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=893;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=PZaux6GZliSItAtHMhFoC7Cv0J9bBbkhdS1XTU0uAuA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl+ZF402eopG0n4dj6mj2TTriwPmVKnm7MzvpNe
 nYDXVJUWRqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfmReAAKCRCLPIo+Aiko
 1ToOB/47+iGOOAdfofKqOyaIgByjkF+X12vvIEhw8fXNxKwKiC1DATubjzcO1vVMqhlvU73a628
 D2mI0z46D3oOBvpK32SEd9U9piZ/C+/WZ3dwarCmbryFKCi9+qWkIl6gRpx8R0qJsh7GZgTaKOG
 OAqr0z6gDgA14ot0s2Kp2oosgrpzDswzxLwGbbOGMux9slgPkVc+qzHaUTHb5cq+BBbuSEizmpU
 svixizDtZAx4n3YgIP2354yq9CN1vr+y00OyylH5yYtme1KJkLgD+msS3rP2729d0rXWNKPkpk4
 sm9qx+Q3yfzUA2l0+V7FbNiXmXvnqOlidDshrEG0bSZD+Yrv
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The dpu_crtc_atomic_check() already calls _dpu_crtc_setup_lm_bounds().
There is no need to call it from dpu_crtc_atomic_begin().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 88c2e51ab166..64befead366f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -803,8 +803,6 @@ static void dpu_crtc_atomic_begin(struct drm_crtc *crtc,
 
 	DRM_DEBUG_ATOMIC("crtc%d\n", crtc->base.id);
 
-	_dpu_crtc_setup_lm_bounds(crtc, crtc->state);
-
 	/* encoder will trigger pending mask now */
 	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
 		dpu_encoder_trigger_kickoff_pending(encoder);

-- 
2.39.2


