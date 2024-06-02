Return-Path: <linux-arm-msm+bounces-21427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEDD8D785E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 23:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1BF84B20F8C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 21:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB03477A1E;
	Sun,  2 Jun 2024 21:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xzmizdIQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F5978C79
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jun 2024 21:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717364399; cv=none; b=KeXYzP/E58ZbzTDCvHfTlDNIOB1Cn3Q8aOZbBY4MiOrjOyerbCNb+AqgPcvakkwkcvTkNzGaKqkB7hwl+felH0b/TkfpvKCPhsRfA7YLIKdPW5ZaDF9knKJvJ+5gqe2I0z86gnqCCce+WPi9HyEH6kWuzAAGkd06XCxEvyUa2To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717364399; c=relaxed/simple;
	bh=7R5XEZiZYJZfV3EIl1ZYgtEVpBJ16B4QkvSZSHsPzGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AhUnPvFEltIJkyVlviWcKybZu61HxPVjkHk4V4eTgIWnBggLIdUh3hCSAgc6QcosjL4H/rqlFz1tAuqGVNVPxtvhdX+ZqjeWR0/b6VTlZgHFxHubD8aYEgm1hYT3gYMhMNXMa+GUAghqw5IAIBO/J50QDxoqijjOBfj/5unR5JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xzmizdIQ; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52b8e0e98adso2798545e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jun 2024 14:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717364396; x=1717969196; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=phfbeBe/wHZzaldGp3CTSm4jkvtTaBdaWvDYoOuNwVE=;
        b=xzmizdIQmZn5aK5X2FesfKzkar6NmVVqqr9yZtF43lG0jUsYl++wOetrW/BHptqumF
         4nK04F5UcwI9PISTgm9klGl5tZaG9aCWM2YELDxJE4TAxwp3mIZdea3Ijs9xWSxTTJt/
         IZv6NFPmpmHYwY1HMUhhb9kA635+N5UZv8EDYL4jENcAJiwQIfOndnVVBe8m/zpWnmuL
         4Rh3TpLvW3ORe+A2jGQt3d8KBPD1Ffk7PeRHN/Zsh14CBLv5dYDuo/CePOlCZeZFDRuk
         Y+x7kpRLpmv9/2fqjLCdIDMujIknO2sBZtGlfL3mkinwO6Cq1zappR4aP+9BzJiqZFn1
         md0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717364396; x=1717969196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=phfbeBe/wHZzaldGp3CTSm4jkvtTaBdaWvDYoOuNwVE=;
        b=alVzkpQLn9bDQ624fr0X/A3WQR9jQMcCWlcIMxMl916uKICNa1kbERfD/PfADQ3/mr
         jmUHPhfU4iLZmD1+uQBYUHlGjoXtQyPSX/2xBEo+oxYn3ptKE4g2BFg6GJUb7F8+2PaO
         VoBHeRH7ZCrLJMPo4FUdvuCypE6JcXuTsuiiUnA/hOtf+5zRKmFkiiBokP86rtcsBJ2Q
         tqlYhnpCZ+zc4pUh32gF2ZH9zPjOTbd8s/WUeQZfFvqyzfUvOQDhxVR4LPypo4WjPlto
         /eREVWciiipTrKjHxodbkKZcmagjmEU5ReyWHlGmYMau1yQesKSKm9wtpjD68GXbyh0M
         1a/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVNW5d/8BNr6hJYjQeV7ygZcCjNjbj7ROnVj8LyzysN259ghGER9Sm11ae22a9JV69T/BxcOOgi1hoTUuQH4vQuktC9m+kXliWII8ZYZw==
X-Gm-Message-State: AOJu0YxfWSIa1yimhOcDVCeXUpD7GFUKMUh315arLfNIwZGlWXSIuGHA
	/2tZzGjWHw3Y6KY5Q8vJI1YqsYSNgq61iLXSU13Fo2piaV4Tt2x2f0gyqy2qOcB3uo209sTn1J5
	q
X-Google-Smtp-Source: AGHT+IGxRw+MhZXwLFb5hrNZP2u+vz4lRcl9eHFkm0LNpEaolt2v0LY1NkMZg/P1qibIuuIkHVUuAA==
X-Received: by 2002:a19:7403:0:b0:523:b272:c73 with SMTP id 2adb3069b0e04-52b89569542mr4347003e87.7.1717364395710;
        Sun, 02 Jun 2024 14:39:55 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d3f648sm1021563e87.73.2024.06.02.14.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 14:39:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 03 Jun 2024 00:39:52 +0300
Subject: [PATCH v2 6/9] drm/msm/dpu: drop call to _dpu_crtc_setup_lm_bounds
 from atomic_begin
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240603-dpu-mode-config-width-v2-6-16af520575a6@linaro.org>
References: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
In-Reply-To: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
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
 bh=7R5XEZiZYJZfV3EIl1ZYgtEVpBJ16B4QkvSZSHsPzGA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXOalI8O2Gf9SxPwCXo1gr5Krf6S3U1zjqsmVd
 jLGSJZ+Jm2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlzmpQAKCRCLPIo+Aiko
 1fOEB/4g7Qy70gGV6VTyC8hNhK+NYtc6tOoGcIm0WmQZhwToK8OfvQ9J4VMZn0xxqYJvKLLrGt4
 9zfYGnpuYD8LKcpDlqmi70GSz/E49iYgwoh4IjJWAg+rxSUikIkWyJjDfFRY0KTtMUxzXrToRni
 R6EcAlwQnPscsCRBjgsOIRTwS7F4czKxDMnRAWoMUkQF5oGN8wG6oRTUvAn+VTQaS5D9947SX7s
 kauLgM5n5CwnXNCFChuvJRxxcNKu01o0e6z3RhErUr4SOF7p5UJ3eJCvd5vgH5TCC9+1iq7MOsB
 NEXyWBfv7jBiO30j+QlkPqtd7uqNmrfWMfwk8zg5Wrr4rm0V
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The dpu_crtc_atomic_check() already calls _dpu_crtc_setup_lm_bounds().
There is no need to call it from dpu_crtc_atomic_begin().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 9f2164782844..e3b1e5f55a92 100644
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


