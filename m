Return-Path: <linux-arm-msm+bounces-48660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BE3A3D805
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 12:15:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1E087A70BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 11:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6AB1F152D;
	Thu, 20 Feb 2025 11:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iBKVl2Bt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31181F37CE
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 11:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740050103; cv=none; b=IMAzrV/4Iw+y7/rbKmzLQjatAerZAHtTbV22oqnNRQLYLBBsgreoE0chc4+nxEOZNiPLGePyTzfx/lg/ol/0C4alSc6ivYt9E6SkyXTboJpc0HVcOV+GH/CRRKuy7XpUhaRj91PaOrvWJnk9hpwZS2xOMw9hkiJgRM5w4sYF7TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740050103; c=relaxed/simple;
	bh=Iuu/rih2gTkZKK6Ghs6dsVuCdf8xwLg/vMhkHtsubTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d/S6dnU9W1ttljj/q1J/CY79a/pN1UlxlTTrl59yZcK1jcnfEfROuzktNW+MsYVSN74lf1A5ENMzJOJCKKpAzVbScPsAlU7dVOkb5ywnPG3TR1Z8NMQHlFpffeeHR4kuKyH41Z5wi/oYs0+F+HJapkOnrn+2KqT42GgLdiyZvno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iBKVl2Bt; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54622940ef7so893296e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 03:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740050100; x=1740654900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v2FT69grsgtQGwodtPuDBrmjAJehPRULckabnrzgeOM=;
        b=iBKVl2BtZMiXiv6oqXoZt1UyyEDPhbke6aT3kMtbhnoK5P0kQG4inAsIyTaEt8EOsV
         W0gvhZ/GET1RpJHWhaQY1/5LLYxbSmVTpdz2qH1z3XZmrpcVAUuQsBUCASfFYDjcV92l
         fyu9IR8N4qe4U4amrtRip+6F08s0IJvwmF7Ai9W7Tyyd873sLvyqVGVKyTOnOf01lQOy
         IZuiYj/Qs8X3217mTJsU+1rjxiYSXPZqO3oed86Mc/EyP0aZqQjhCjw0G1jl9q3NmLUD
         mhuR8nofnP55d2yGrvPzNaQPRPtx7R9aCWRl7BqvwucTJDcFJH4H/tE6s+nwTcx1OXSC
         4DYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740050100; x=1740654900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v2FT69grsgtQGwodtPuDBrmjAJehPRULckabnrzgeOM=;
        b=b+WwY8GH/lCmb3wzL2dYN4YRD58RtPlpjmfQ4av1Rj4wlkmEQermwGnpmg1P4iOMoq
         FfJPEJMocDnA/GNKRthfTAKIikchO/XpBheZaYtWbMP1SiyRjQLYjqyzjqo3977NITTP
         gE/3jDGu9/1ImDBOqP+s8cvS442c/FyH0n7NyvLAUyPNKIbLWYm9D/AInptGlQX9n5wq
         AOHV/URvvNgrXZfbXt5cKSn+MX3PXEq9how+ck3EfDbHmsIhQhoCTU2D0rhPf/jkmjC8
         vW7XcPJ1+JSk8Fw5AFawNgeSYEQkQsEbeskUSYLoAHAKiNBnXyi9qjz4fX5yJVXvObq3
         hk4A==
X-Gm-Message-State: AOJu0Yxt1OQ3hQpEt6/jhU2ql04ZGSGp5kJub/Lzlr4ODOjWcMfT97U/
	hz4GbVHjD3eotQvPgrGaW9a1bMbtBs90NVi325n3y7PLRk2cPN9GR+KacZ/nL9A=
X-Gm-Gg: ASbGncsm/DoEcF6bxoKZlxBkm7aamli0o2UHAseNYpNeT21IIaGRdWL+VIt0on4614I
	VkUUKghGPr3wx1PUnbzqgyCgMR+iLzBZ1nF9waKEvsEv/aBFdl3foOCuG1WqcSzrlXd38tpSPtR
	Tpda3D6QqmXYmlRfH8yfuH1Z0vJ7sb9j7HVTF07Kw36pwyv3+X5aEWmYvIs/csGgeXQtXgTmUcM
	FOTsKarZQdKBVFkPqA0fDK7lvQY8fQFsYb1c/gse/U/xQaV/oZuKL96RHLqZRhKmj4t7hth8Wir
	k37WIKsBMbmBM6hsKoxTy9I=
X-Google-Smtp-Source: AGHT+IEK5YepgQWPALUfLRJKi3C8erOz++2sLryCYJu3ofhHXWr7LbJxyrpPkJIZbnwDfcXCA7dAIw==
X-Received: by 2002:a05:6512:1189:b0:545:bda:f17 with SMTP id 2adb3069b0e04-5462ef201a0mr3010127e87.44.1740050099792;
        Thu, 20 Feb 2025 03:14:59 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545297856c6sm2056164e87.142.2025.02.20.03.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 03:14:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Feb 2025 13:14:44 +0200
Subject: [PATCH v2 2/7] drm/msm/mdp4: drop mpd4_lvds_pll_init stub
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-fd-mdp4-lvds-v2-2-15afe5578a31@linaro.org>
References: <20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org>
In-Reply-To: <20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=922;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Iuu/rih2gTkZKK6Ghs6dsVuCdf8xwLg/vMhkHtsubTw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBntw6rBhceXrSdx0nb7uB53zSoFWDO1AkbXhVhq
 +gcl/EdOZuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7cOqwAKCRCLPIo+Aiko
 1YGzB/0Xno3UiIYTOdud4CEcJfrYiPKQ+eDCZMrq2/oZ3IKWU8zODmyCDhFLUcbZQ0C04pdG40O
 rYOSy2Jg8WQNkxq444ypAAVL3fV3LD466bkbnE84alabWsqUc95eCsbpatXcR1zt5C0SXGXZiZc
 Md04vbC4VX36PjRWVJigYfHQbbINZ7pG28jzX3Sk3GzjQ4frPc8PlEI7NBw+0T9gPcqfovjJp4a
 j+JLYqZ2LQFVh4CThB5jajAT1whTWnjZZNxaUgEld9idFUVCoLrRLazh8ADiIT3oMEBF9UbJt2J
 FY1lN1Ofmnmmuw+OeJcGqDv8RkS5ZlbAx+7roaozkAtlnVV3
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Drop the !COMMON_CLK stub for mpd4_lvds_pll_init(), the DRM_MSM driver
depends on COMMON_CLK.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index 94b1ba92785fe55f8ead3bb8a7f998dc24a76f6a..142ccb68b435263f91ba1ab27676e426d43e5d84 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -207,13 +207,6 @@ static inline struct drm_encoder *mdp4_dsi_encoder_init(struct drm_device *dev)
 }
 #endif
 
-#ifdef CONFIG_COMMON_CLK
 struct clk *mpd4_lvds_pll_init(struct drm_device *dev);
-#else
-static inline struct clk *mpd4_lvds_pll_init(struct drm_device *dev)
-{
-	return ERR_PTR(-ENODEV);
-}
-#endif
 
 #endif /* __MDP4_KMS_H__ */

-- 
2.39.5


