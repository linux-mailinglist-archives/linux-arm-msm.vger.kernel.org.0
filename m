Return-Path: <linux-arm-msm+bounces-22653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F23907F09
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 00:37:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA2C6B22EC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 22:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DE7814D290;
	Thu, 13 Jun 2024 22:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JM7iQMCW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EC314D439
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 22:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718318192; cv=none; b=cUK0xHektGr9thPF8K1M/xVtJmgYAOwqy00MRSdfeKY+B2BQTOR8IKyedrbKEtYwmDWFCuTVaTobEif0wgYJp0M8vSD0qxW7N0y/5xWKPFh4iaCdM/mqfZx9nRVrSVO4jNywn7jIwTqguSzEEBpqwx8JYjKFbKCcWbu0DM4zjcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718318192; c=relaxed/simple;
	bh=/ebMwYAo85KjvumV8JrThFY1ICZfff/QWK4oXrEtQu0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ogXDOVnUUK5HNO+j5XApLs+rTihRSDRdhojox9Mqro3LPpz12WGKIZfZEae8X3dLEKz1w7GmjPX1noXRg1K4sXw2uNbpejxO6HDA+RnvZManUfKL2P6dOm+8f79+/1kZN32784y6yg4/TzTrpSsCrt/qfF7qwIDIWYIyFuhHlSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JM7iQMCW; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2eae5b2ddd8so23386061fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 15:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718318189; x=1718922989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FlN072hhw0fBKiJsgk2J9BeVUDiEV3EKvdHtXHIJvno=;
        b=JM7iQMCWutk3lTUc/Tv9S5eQHluNq8b4dwxVOm3hhXLA0Ff/IgNqnaomSJGtWrxBCN
         baM4Ieh3iv5E4Eievh8z5NGVWYssCMK+E6MNuXhcA9k4bWLpFQszGxVVsmAhkfcKWDmf
         p2l0hxs3XeYo7dBDWdj52HVrt6volOKXCp6sQ7yjwG3vJp8oGhsNxg/7CZbiAq8qmpzG
         mg406oLCb4NM114CvmE9ZlnQpZ6IgN/bmlVpaQw1ABS6xUFhw1nQc2zEF5OI/AXZ0Y+x
         GGhZEmDsAOkvMPwM3LKaobq7mKG4dpEqgZEzdZGattwDiz1Rn0RObNu0yC8/o3GPDgHX
         ZIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718318189; x=1718922989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FlN072hhw0fBKiJsgk2J9BeVUDiEV3EKvdHtXHIJvno=;
        b=X4iAsnRytB0eUdNQbTV9y3/83ovgF7WoKvisBoi3zuLLBbjrTYlhWMCvNYxvSLDm8m
         4wGf+wYWxw+i623avZWnJ4pTmZfhCLQqPjLHxnTNEXF8+IMAMjRZrLJ4Dgtg2jOnprnh
         MKKEu4jS2Q2NSxg0llfaMicRt6gWbiVhofSSEPjxlKYVisQiCawuaK97oJkHl4b3lotF
         jCTy2n22wsPQ7KBgLN30fEWUpw4jGSYB8bwN/CMgiTG6LF+j7j5uznE3NexxIIEDDGcC
         TWZhcklDLWMthoSQaF10MXBd1Ym2cdo4Ka2javpBdHZtzvywHoaAeN5rY1lWb1Cw/vJS
         zF4A==
X-Forwarded-Encrypted: i=1; AJvYcCUWV55EWgmkT3f0TVzVuFwh25cUkkQZlwaUCl4iK1+Dw0CR3Q9bOPmkDEWNlQ0wYvmsZni0aJ8ByH9qzaGMXzSUVbBlIsS4pXAbBZE8Vw==
X-Gm-Message-State: AOJu0YyoYIJfvDhpu1MLx7SnSEMGYqDFxPTyLrfSchafKLy5qrareynN
	t36bRr2pofziXKZjr2TWlEaxmvZA3+8+BadCZtR2jrmcflHRfkOsg4MQfGFFAN8=
X-Google-Smtp-Source: AGHT+IH6QppQUoYrdkNvnK2t5Jhmp6XGoEKLvdCUf9/Pzsg4JY7mpWQnrjFwhF8ZL+LfKFken4NG7Q==
X-Received: by 2002:a2e:2e18:0:b0:2ea:8d49:c063 with SMTP id 38308e7fff4ca-2ec02b833a9mr12655111fa.13.1718318189423;
        Thu, 13 Jun 2024 15:36:29 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c04a08sm3865191fa.29.2024.06.13.15.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 15:36:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 14 Jun 2024 01:36:08 +0300
Subject: [PATCH v3 7/9] drm/msm/dpu: drop
 _dpu_crtc_check_and_setup_lm_bounds from atomic_begin
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dpu-mode-config-width-v3-7-29ec4069c99b@linaro.org>
References: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
In-Reply-To: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=934;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/ebMwYAo85KjvumV8JrThFY1ICZfff/QWK4oXrEtQu0=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1p2SdreK+p3WL8/aNd9JN2a4x1X3ralpXS7Gl+/lNJmL
 k3R7N5ORmMWBkYuBlkxRRafgpapMZuSwz7smFoPM4iVCWQKAxenAEzEwJv9n3li0aWA3K/6N9xM
 EoOvlEkIat2/UHLc6os7d23giXS2d2Ld9gmvJ8ZwSXkrNMxnfRwpqbA0a4Ud/zlBn1krzrk/k2r
 Zo1Lq/KxQdu38xwXZJvE7PqT65v46nb1On4nh7h6RGy/PanHr9FYuDXpdFhPO7bfLVY71+/U7k/
 SdrZ/UcXx54M0juvuBnvv8zddznZJyQplCvRSWeLVqBJxKCJjl46SdfUmn0OLb5TP8/lZT5OM9X
 jJ5FhaVanNwnzIxW/LlfbaIYUdqhqmVyLesnGlxM56kszz8xyVgOX39g7KFvvsCfMJXpOZ6aBhy
 BD8w9zp70inj+77Z4hqT1rtOr89enrBx5qyqNJff9wA=
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The dpu_crtc_atomic_check() already calls the function
_dpu_crtc_check_and_setup_lm_bounds().  There is no need to call it
again from dpu_crtc_atomic_begin().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index b0d81e8ea765..5dbf5254d310 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -809,8 +809,6 @@ static void dpu_crtc_atomic_begin(struct drm_crtc *crtc,
 
 	DRM_DEBUG_ATOMIC("crtc%d\n", crtc->base.id);
 
-	_dpu_crtc_check_and_setup_lm_bounds(crtc, crtc->state);
-
 	/* encoder will trigger pending mask now */
 	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
 		dpu_encoder_trigger_kickoff_pending(encoder);

-- 
2.39.2


