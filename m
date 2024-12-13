Return-Path: <linux-arm-msm+bounces-42132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB38E9F18AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 23:16:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 880F7188ECC0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 22:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B0921EC012;
	Fri, 13 Dec 2024 22:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VioGESNM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8912C1E883E
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 22:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734128094; cv=none; b=MeJp3GdW78deFaviiFf4gGl+HAhzSbM88zOqFKylqPf1/RIcCviOcY29kPuS/LRXe3qWx5XMydZAJQPPWBGUXsJpAasrHVaMfGl7mL6wa1AytDk5W3igS6DIjImgBhTqV87WlqDFMmL49BWazxbD93Pnag0Ts4MD9SnLIBCghUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734128094; c=relaxed/simple;
	bh=A8qcENijj/tiP/qF0PkucDRV4zm48lgOYJZUS8nuXXo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M45lE5FgjpDO4kqVfb+ZgPDiLRtOsBIJTPkCoVpVqYyKCiM820VJiuqenpWLP1l6/bFCVH2g6pRJs1/JWYiBbUzQAXa44kXug2VISXloKPJDt07efGQJ8ILPjQzcPhjtddZgoul2O2y5jlLBsOXauDl8d58XvZOx5HOG4zEv9Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VioGESNM; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53e3a90336eso2431274e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734128091; x=1734732891; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EVXTFZ9qs5ua0a0DbBLW3XISYeiOdL8J1dr4xXWqZyw=;
        b=VioGESNM0gSS408L0ry9KEuJX5BvwmP90cQXSHFiRxnO0rAnCxjAC7JB6Szp4n7n63
         gML6bRIjd5d+vJuVHkxz23wdx41rq6bMB7VaxTOXEQzXf0lcmKxr7VZc62pg6W+0y4qj
         eHtYb7U5poyyV4PayGsPH6dSseephUCO8i5YZS50Opg7UIv1h/gdDVBZZQREgPeqavGg
         LtQh5VBMNihr3HrD1SK7jZHJyAUw3vnBwucH+AFO6Xl+qzbzvk152GvsZ8DrSFSKymnQ
         uGaQ+a3LavVvnvUfJp9chLkICOr7Y+lluNMzUxStIPX7LGo2vLhvyrl7pXcu4UFhNdRP
         GBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734128091; x=1734732891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EVXTFZ9qs5ua0a0DbBLW3XISYeiOdL8J1dr4xXWqZyw=;
        b=tU03BRdYSH3TkzoRDzcWuw/BuctQJwGfRmhl/YOaX//eK1UchHc8orbCgdLBZ4317j
         0p0/UoGpJR0UCypvSbrWyGaGPKrk1v5ZGFmTk31vdZTbyhErCWHWGSYRY5QE/bLEfLiz
         BvX31MQ55TTgIUI+T19HfcAx4HVZsNWSdEPAeTeq6irXHwyHi24TxaiiVWFSjgCuwspo
         bHfCZqjF83ZijZpRtMNYDwY6WNJedXNIcTDNgxpEL3u7LKwIEiY+46i3FghRLJatV4Ij
         zG55TXf8cfPQEEbWNBYz4P6Bb9bpr7hZ9/14wPkkhi4TO2iM1OaY9HIkZluphEYr2kPH
         Y2eg==
X-Gm-Message-State: AOJu0YzCdBAPAeN55FWr6CI+YEsZOcR8iCEr/Q+AbUzl9pJ95+YUhybN
	zEnv3vIxFuMrSF6in0+5t0yuhj454hju5hK+e6RQg6N4uVyjU7qt6EqM4ykuui8=
X-Gm-Gg: ASbGncsF4MszpvjZyGUD447+Mpmfh3RKfa4jJTzh0k6SIfpomqXHc5bX2PxT1B7ocC0
	6vDj6OSzgu7oSG61kHBp+NE/T8HjPRUtCQf05fJoQ+MorNImx7Y3q+P/rCu9rG1209NTPGy/RBb
	vYnD9cUDY63IK6uRUjBteb+DICgEKiXv1X6J95lLFToKLnu58r6khekMEV/WvAUbomY40BdJzdM
	q8zpw7M7H9RmAHiu9hikoIpQIrXNbvigJokFCAkb86W+9BX2ZKhNgYBeYLNxGwk
X-Google-Smtp-Source: AGHT+IFFousbh5sDETxWnJYsRUG+aFldqnVxIw01zT1Khil6+rtwivaKhd/OLBdvT7ptEDYIDTiw7A==
X-Received: by 2002:a05:6512:401b:b0:540:1f7d:8bc0 with SMTP id 2adb3069b0e04-54099b6d6afmr1331527e87.49.1734128090680;
        Fri, 13 Dec 2024 14:14:50 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 14:14:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:22 +0200
Subject: [PATCH 06/35] drm/msm/dpu: inline _setup_dsc_ops()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-6-988f0662cb7e@linaro.org>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
In-Reply-To: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1652;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=A8qcENijj/tiP/qF0PkucDRV4zm48lgOYJZUS8nuXXo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHEzG0hSBjyvopp5YyPtQtFDbzgciLOW3/Te
 M9p0FbDsuaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxxAAKCRCLPIo+Aiko
 1SphB/47Bb/7YcZo08PzuhzFzDbS0O6TeNRzeKUFGUhrUSA8z2vehm+BrpEdeeYCGeNvuMl6FEk
 HksShACL7VmLM6lkw7RcWWf+aqeJAGlz0LIpO/imjPLv5sL9DwlqLcV60zzOfmS+Aq5RAJD+1I7
 Zsqsl4r7igtIiBOic10VXBD4wbH1lf8g8Y4R0JMol+uCe8Z/9jknJkTpRPjvGLpFNBm5k6nqRNR
 mkAK2nfnOJWSgt4udXPkAbjOmwc66PYFMywJslqfMVFmD+z+nBUX5iMZsySSInI0DaoKpIgFEew
 O8yjYzzior4JfzH1HEGX1G1jxTIOqkBCspwORKDE/fzfCABt
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Inline the _setup_dsc_ops() function, it makes it easier to handle
different conditions involving DSC configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index 657200401f57635481a22f018ff00076dfd2ba34..0db375d2d779e075d20d08de059124bee81652ab 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -180,16 +180,6 @@ static void dpu_hw_dsc_bind_pingpong_blk(
 	DPU_REG_WRITE(c, dsc_ctl_offset, mux_cfg);
 }
 
-static void _setup_dsc_ops(struct dpu_hw_dsc_ops *ops,
-			   unsigned long cap)
-{
-	ops->dsc_disable = dpu_hw_dsc_disable;
-	ops->dsc_config = dpu_hw_dsc_config;
-	ops->dsc_config_thresh = dpu_hw_dsc_config_thresh;
-	if (cap & BIT(DPU_DSC_OUTPUT_CTRL))
-		ops->dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
-};
-
 /**
  * dpu_hw_dsc_init() - Initializes the DSC hw driver object.
  * @dev:  Corresponding device for devres management
@@ -212,7 +202,12 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
 
 	c->idx = cfg->id;
 	c->caps = cfg;
-	_setup_dsc_ops(&c->ops, c->caps->features);
+
+	c->ops.dsc_disable = dpu_hw_dsc_disable;
+	c->ops.dsc_config = dpu_hw_dsc_config;
+	c->ops.dsc_config_thresh = dpu_hw_dsc_config_thresh;
+	if (c->caps->features & BIT(DPU_DSC_OUTPUT_CTRL))
+		c->ops.dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
 
 	return c;
 }

-- 
2.39.5


