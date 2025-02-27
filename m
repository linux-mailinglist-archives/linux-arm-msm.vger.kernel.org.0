Return-Path: <linux-arm-msm+bounces-49584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B589A472F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 03:35:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08B377A8179
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 02:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A28118E743;
	Thu, 27 Feb 2025 02:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NROAzE8G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E1E187858
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 02:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740623119; cv=none; b=spt5LbFMnXb59FzXy9/4auUP79wRAb4VvzA6+RR1Xiee/ynzRDuzLxAnjQS4l2aNcvKbmXM2tqv+31POVdmI6bq4EYC9rMLAojauYaRqgkUsljuIT6GWwMTcaq/EQy2GFWxURD2kFt4DOPSmbEnXJ7uj/o/Z9dZi8bfpSWzHNRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740623119; c=relaxed/simple;
	bh=GI+BVzpsla5S77ixF6zzScQlWVEkGguh/pXHwFaIqGk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OPv6qTRYCI2BDmrh1k2xZi1YeNJDwTev9K+uh0rgj18SZVzkct7wNSB7WTF6T6P8B0P5ZpS1ZQoQy+C9CpTQXNBRwxic7kKx2aMbdxBS2g1lDIK55xH5pHzomOacG/1mYyzqzwzAzFR9Au7FUfmzpEIecuvfz1mo9nareKv+6Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NROAzE8G; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30a2dfcfd83so4410261fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 18:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740623114; x=1741227914; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eUWtdB14jnh2w/XRiviqZD62FhazLUs+EUPGvTKghf8=;
        b=NROAzE8GqHSrClfNBxLM6RaUx00bhft+uIyGrq2nqah1eaGKtqi32Ih6c9xZdSa67J
         U9ALNH36DzWfsrHaQ23vzGDeon+MGiqSsMGP20g3p1Vjy8NIk0YKmiLDaZi10/CQwSZe
         QLUTeujIM5lvOfkEzWWtaS28exCBrYYydWJxAYXzbX9YFmDUV/l/AP5Qf5VjnY/wC8bP
         h7OBhZwUnYa7rl6zj0SFIF2YFvAdKV3NJc7D3VUpiiDwjPdbfHeO5zsSnt6V2JVT+cVu
         aUamF67KsEVyjgl+oY6G5vbU4qz2kpDRfHrlIwuue9uCRq/qTNdoziKnby3LZYvi4muH
         lq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740623114; x=1741227914;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eUWtdB14jnh2w/XRiviqZD62FhazLUs+EUPGvTKghf8=;
        b=trfrWTt+DfAlq+fp8Q9pVDRGJQacL1dV3fM55Gd/t+Ve+ZAQ7BvaDr+UGlzhfIym6u
         bPZsL4CV9FHiK939vEe3Jf20twl4KJnfYIjTDVNt1ECAFCT682EeOJUizjWdpJq3fEs2
         IB8bKMlcDznHwCu0EInIag33C1MhQB2Q/6VGPzaUMAgkwbKPJhRXlEuZk2eAn5GJcEMF
         XYkW/JzWUxYEDwkD8TogJD5pnnyZdjB8k3oGhqn5MN4H19lKtWIOIFsqkGqPX32bR1z4
         IBhWJ8aDTH2dYtcOruomM9l7TXqHt1A9jtsrXXmO1F5vOXBCGctMruOxutBF/gjuDOg7
         OJaA==
X-Gm-Message-State: AOJu0Yw9bq9Lt17W43Iv/ESOyK20Whv+DkEXeNb1Jmwdh8nwFLiCSgdI
	N648o9+iFNM8dKrdWo1SzSFrCy29490Hw1XBp+Qop2Bna7vLqirKZ4jawpLMQVDW2eXLvWYUKSO
	daPAvow==
X-Gm-Gg: ASbGncv1H3dAeoPVVMlaKq+SnkgjbdEKHtegUVUnol9HQzdtO3dCwsLRNxsV/1AzZiO
	Chq2aZozPnjbBPEp4lkBup1G7SA6rh8SZpEeOypY+zYXLh3cFpJE0eu4bGoD5PB25IjHyoVt5Gn
	pwTOP1jF02pC1fTjXhDFLlZI2S4ad792PqbehIMBpjlQAy+hNmCxaMxHu3R9T0YjA9+nrZZL53/
	6Xzt1BESDqy77BykRISqxtwBgspuaqO4NsCOrCPDQLDvuwFkxgkv52ZbE+obmBSWUYFx90tPEfM
	gEGQCTAh5dtETok+H4V8YwDz9tsJN/75UQ==
X-Google-Smtp-Source: AGHT+IEcp3eou/4dlv37w4mxvS1t+d8IRoUwVQH8cDzzQZ+M5zz+OASkfl03BF8A1+GTRYY3AwRSGA==
X-Received: by 2002:a05:6512:200e:b0:548:794f:f9dd with SMTP id 2adb3069b0e04-548794ffb8cmr4463067e87.10.1740623114210;
        Wed, 26 Feb 2025 18:25:14 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549441742a0sm48067e87.5.2025.02.26.18.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 18:25:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/7] drm/msm/mdp4: rework LVDS/LCDC panel support
Date: Thu, 27 Feb 2025 04:25:08 +0200
Message-Id: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAATNv2cC/52PywqDMBBFf0Wy7kgePrvqfxQXqUk0VI1MJFTEf
 28UCu22yzNwDnc24jVa7ck12QjqYL11UwRxSUjby6nTYFVkwinPqGAlGAWjmjMYgvKg48VUhVF
 13ZKozKiNfZ25exPZoBth6VHLT4TTghW0poKzNBOCZzUwUKNdcE0fElffP124DXaS6FKH3VHtr
 V8crufGwI/2v6Wo5Yf5+0XgQIHl0ug8Lysp2LfV7Pv+BvFbrbUmAQAA
X-Change-ID: 20240317-fd-mdp4-lvds-e317f86fd99c
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
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2142;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=GI+BVzpsla5S77ixF6zzScQlWVEkGguh/pXHwFaIqGk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnv80GTG9htKZS4aIoUdR9qZ1oXGU6qMNP2/w7D
 +V0XH1DRe2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7/NBgAKCRCLPIo+Aiko
 1X7kB/9IV/ZQTS+2xw+LYlJXcF50/7JBHGVTDk3fEUr5Vr4SUe7EC6Kz2ybH5fXb6pA6a+MkHtl
 E4GfYnPdt86zcBggSdP4MAZUmk7mY0y6zumQLZW1rA86bd8adZuPhmfYrYZf8jVphdUtyVxH+Zf
 t5MmFFV7ejM8FDsVVanMkElZlfNJhkKsO3vonUgGGGJU4wxEzeBZzTu5Qte70Y7FLSIK/PpndyO
 UCYZHEu/uILCvTkRMc9NO+rXCv9MwIuL4hX/25Z+nxp1TeXspRNPW7iBzkabv+zkKM/VKWfFO8d
 u8zuoo+vca87hzCm8ChPPROf1gJbyibdmMlS4SERUXzPVP4V
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The LCDC controller uses pixel clock provided by the multimedia clock
controller (mmcc) instead of using LVDS PHY clock directly. Link LVDS
clocks properly, taking MMCC into account.

MDP4 uses custom code to handle LVDS panel. It predates handling
EPROBE_DEFER, it tries to work when the panel device is not available,
etc. Switch MDP4 LCDC code to use drm_panel_bridge/drm_bridge_connector
to follow contemporary DRM practices.

---
Changes in v3:
- Fixed commit message to explain that DT name is used in addition to
  the global system table lookup (Konrad).
- Link to v2: https://lore.kernel.org/r/20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org

Changes in v2:
- Rebase on top of msm-next.
- Upgrade LVDS clock code to use clock providers and parent_data
- Use LVDS clock from the MMCC instead of using LVDS PHY directly
- Link to v1: https://lore.kernel.org/r/20220616090321.433249-1-dmitry.baryshkov@linaro.org

---
Dmitry Baryshkov (7):
      dt-bindings: display: msm: mdp4: add LCDC clock and PLL source
      drm/msm/mdp4: drop mpd4_lvds_pll_init stub
      drm/msm/mdp4: register the LVDS PLL as a clock provider
      drm/msm/mdp4: use parent_data for LVDS PLL
      drm/msm/mdp4: move move_valid callback to lcdc_encoder
      drm/msm/mdp4: switch LVDS to use drm_bridge/_connector
      arm: dts: qcom: apq8064: link LVDS clocks

 .../devicetree/bindings/display/msm/mdp4.yaml      |   9 +-
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           |  16 ++-
 drivers/gpu/drm/msm/Makefile                       |   1 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |  34 ++++--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |  16 +--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  |  55 +++++-----
 .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    | 121 ---------------------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c      |  28 ++---
 8 files changed, 86 insertions(+), 194 deletions(-)
---
base-commit: 66054467b223f366fc463bb69aa7dcd050986e62
change-id: 20240317-fd-mdp4-lvds-e317f86fd99c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


