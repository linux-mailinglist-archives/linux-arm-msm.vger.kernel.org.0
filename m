Return-Path: <linux-arm-msm+bounces-23735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCFC9136EC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 01:26:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1AFE1C2163C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 23:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B04D886652;
	Sat, 22 Jun 2024 23:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+xVE3pH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D713684A24;
	Sat, 22 Jun 2024 23:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719098763; cv=none; b=KgYQ6242uqJo9deFKppxrqO38so0dmhEkYrHub9FzXKbKXYYADroJX4J3aUDoOYxa7l++9Kiv0FflkMYlolUaUyTtwTx/UNGLPRUsx5ywyEPciff6I61gKAcstBgb+qSqkdow9LZAWxm/YdD4UhvJ3kI2Oqkx84uJqWLWSFPyvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719098763; c=relaxed/simple;
	bh=3ByRKPZCxRzOwxwLlWyit3OOc6nnUrkfnIT8Zo6676A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VxbLB4ES0iw8g95jJxXJ4H/QWJ/ytiUq0aCwIdPDW3JtFrmWLMu3/eeOr83fZa97wvr531l8COkIqpFHclPVqcVSCsMEiQ7EDhVo9EwcYRM2TGQNFkCR5my8FTISc9M7N1sagShcTCghUTijiG/wzmIEL4R6jlH4uSZ0kBcM4Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+xVE3pH; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-36226e98370so1916760f8f.3;
        Sat, 22 Jun 2024 16:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719098760; x=1719703560; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9HxxfvJUbEcWAuUqzp/z3HeawFFFv82S2A3aKWCvEsY=;
        b=O+xVE3pHpMTcjuTYrrxs2pwtWs5tRRch3fl5l39j7Pyr7gnxO4lcPl4d1UaLbpoihr
         60kZXVFsbIRIZgzxWbUZsB1ev1ZbbStvkdvB31Oi2er53gQSL4Emu3wunwjtdcFDGxWp
         PWMeROs1w0vgkC/ul9FaUefVbPYYqIgWYZu/erHlsj47quGrfFjrQ5kS2E7LZeoWhOf/
         Wsl6vXE9ctRGnhqs/WBajljGtFVwow5gdsP0usVHUxOy+axmVycVSPrq9g8kDJdWfswc
         xk7Y1QU9uTSHEPI29+pTR7QjtIyxQwmURbTsM4n88EhLnAc4e/2/tunEmymuwjdVAf9d
         lP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719098760; x=1719703560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9HxxfvJUbEcWAuUqzp/z3HeawFFFv82S2A3aKWCvEsY=;
        b=Pw071lcD8fWJESmCqntzTe5g4gwlRoQf9q9TAzvc4Y9J2wbw1/dvUntmU9CwEe8AhY
         FcJSRc7YOwdLUOzPzG3bft+/c5CbcoNcYz/1Dx87g3F9uh9NVAxauc6LYooPEthKM6aU
         uYcs7dsSuzedYtGnS6of+RflLGvgGOe/b2Ch5MtwDhT+dU3XmaEYTMhyK7SVMutpHeTQ
         VWvlngs8oBspuZZ19/78qeyDzDZ1gMQVOMq5nEdTSAs6B9WiXbkabtqlhfx7ecl/vRKJ
         dZ9LPUh1Gmnyh6PlLTf4v/KkXYnSmWnuwP3FTn7opQTKLflHMAHV+WBfPNUCq+fdl/Eh
         bD7w==
X-Forwarded-Encrypted: i=1; AJvYcCUjpqPrVcQxJiXzcu3PjXj0x/8ZxdQlj0tYgo9EQkCPZ7r/c9v7yIGehGOhSRTfRTrk8ojZ+Er7mWZND9oAYAD15bTCAB7KV98UC4NMb55fbGYiVooad8jCqS8J78HpfUL6U5iHOnRc6A==
X-Gm-Message-State: AOJu0YwxkR61UxUUJ3gjLYwZ3PiM6OeNQ+H8LK7ek33XtIynYQLwzM6k
	nhyugvnsR4EI5NgxiS4oz46ke/eDv67E4yhI3Qq7fumqWZfogLgm
X-Google-Smtp-Source: AGHT+IF+eQztVkaYxVTPniLTiN0Q2Wuwvs1PNUhkt+p/MWOEuEvm4JylLlMlCQKx4FGcg1T83BFCHA==
X-Received: by 2002:a05:6000:2c2:b0:366:eb45:6d55 with SMTP id ffacd0b85a97d-366eb456ecemr217579f8f.49.1719098760243;
        Sat, 22 Jun 2024 16:26:00 -0700 (PDT)
Received: from [192.168.1.90] (20014C4E18129200DEAEE2020304A5A2.dsl.pool.telekom.hu. [2001:4c4e:1812:9200:deae:e202:304:a5a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d2190desm120301875e9.48.2024.06.22.16.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 16:25:59 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Date: Sun, 23 Jun 2024 01:25:54 +0200
Subject: [PATCH 4/4] drm/msm/dsi: Add phy configuration for MSM8937
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240623-dsi-v1-4-4ab560eb5bd9@gmail.com>
References: <20240623-dsi-v1-0-4ab560eb5bd9@gmail.com>
In-Reply-To: <20240623-dsi-v1-0-4ab560eb5bd9@gmail.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>, 
 Daniil Titov <daniilt971@gmail.com>
X-Mailer: b4 0.14.0

From: Daniil Titov <daniilt971@gmail.com>

Add phy configuration for 28nm dsi phy found on MSM8937 SoC. Only
difference from existing msm8916 configuration is number of phy
and io_start addresses.

Signed-off-by: Daniil Titov <daniilt971@gmail.com>
Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 18 ++++++++++++++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 24a347fe2998..dd58bc0a49eb 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -545,6 +545,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 	  .data = &dsi_phy_28nm_lp_cfgs },
 	{ .compatible = "qcom,dsi-phy-28nm-8226",
 	  .data = &dsi_phy_28nm_8226_cfgs },
+	{ .compatible = "qcom,dsi-phy-28nm-8937",
+	  .data = &dsi_phy_28nm_8937_cfgs },
 #endif
 #ifdef CONFIG_DRM_MSM_DSI_20NM_PHY
 	{ .compatible = "qcom,dsi-phy-20nm",
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 5a5dc3faa971..a9b4eb2c0e8c 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -47,6 +47,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8226_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8937_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index ceec7bb87bf1..3afc8b1c9bdf 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -917,3 +917,21 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_8226_cfgs = {
 	.num_dsi_phy = 1,
 	.quirks = DSI_PHY_28NM_QUIRK_PHY_8226,
 };
+
+const struct msm_dsi_phy_cfg dsi_phy_28nm_8937_cfgs = {
+	.has_phy_regulator = true,
+	.regulator_data = dsi_phy_28nm_regulators,
+	.num_regulators = ARRAY_SIZE(dsi_phy_28nm_regulators),
+	.ops = {
+		.enable = dsi_28nm_phy_enable,
+		.disable = dsi_28nm_phy_disable,
+		.pll_init = dsi_pll_28nm_init,
+		.save_pll_state = dsi_28nm_pll_save_state,
+		.restore_pll_state = dsi_28nm_pll_restore_state,
+	},
+	.min_pll_rate = VCO_MIN_RATE,
+	.max_pll_rate = VCO_MAX_RATE,
+	.io_start = { 0x1a94400, 0x1a96400 },
+	.num_dsi_phy = 2,
+	.quirks = DSI_PHY_28NM_QUIRK_PHY_LP,
+};

-- 
2.45.2


