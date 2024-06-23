Return-Path: <linux-arm-msm+bounces-23793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D5F913E25
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 22:31:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C4A91F21F05
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 20:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A0A186E27;
	Sun, 23 Jun 2024 20:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T4sEmVNr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E6C185E61;
	Sun, 23 Jun 2024 20:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719174650; cv=none; b=NdnmGipOLqCwy5LqMyWGLP/B/kCLxSth72RonA/+tsXIKdXf7Lef3NMAI3kEwMQqtkJ1OMOjEyoBbb0PWBgvABlvd9cNnNQ8nlhn1xNEhitwNGTyF61CLVm7slBTHzUtyuVnyT1jmhZTF32zgkFlLUYkKkzh781lD5rLp/kB+l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719174650; c=relaxed/simple;
	bh=3JNunO5f6RhDruA2EIg8SygzHVxREN39A64YoEn2SKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I6f7vVOLowSpTj2ffr/zd8pENRy+BegkmTiBDjZ37CBd4iqRPc89NR3si8/Nzbog4yMkrx7bSBXLj/7S2lzDxH05rxOXCl3ClmpEYZiZlQc4T9zoFVA2SmV5qIVZzF6z1fKwty0ZZLxlXK3pEPffUoKiTn2AB7bidN9/cZSxkZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T4sEmVNr; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-35f2c9e23d3so2881006f8f.0;
        Sun, 23 Jun 2024 13:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719174647; x=1719779447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5IThLSZxCkprktvpOp0R1xO5qT7TqcAXcmsbOx04wBw=;
        b=T4sEmVNrPrxbuse2J4IgzjTpsKaKDENGNOpmDY4O+8hWtISgVobByY03DGHjw95DUp
         6dvtDHZNu/m7AwkKF8Sacb8Dj5QYVqGK1Esi1TEtOdw6MhthyGKczr119cR/UMD9JN9h
         cVHS07HV2Gh8XWDxQJtpjd8kJJNoslxU2oDG81UWwM/BbZXTHStI5xg2W3QtNw/r7RWl
         ilBs5EuCvt4eZN+Rte4XMvu4zpAbDepSfMZ9RqYSfB/YYTp63hLG1BQIhdSTK5/6JxUo
         RUG8RYjLoS5E6aDcAwhvq67iG0GfOW5p4oATl716K23QaCtu0Thgyy4xNp27HOgn5fVp
         aRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719174647; x=1719779447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5IThLSZxCkprktvpOp0R1xO5qT7TqcAXcmsbOx04wBw=;
        b=Y+oJdS4D6ureT6byZI9radgdw5QhMk4Ua62+WcBOsFtYH9pChv8S+ys2YEFTez0JvG
         Rv9PQ1BrU+kr3Y5wpgQn1oaUX/piQ8nYFwyhtzMrwW5lo+aEPA62h3EKBSeaJaHHA2Cz
         E82jHG2KJmU5rZy5eTg51T6PRzH/O0duptqI5ibLYmVxvuey+3KL54Ufil0qXzJYTniG
         ZORxnhezA4yAxBtqS9iooZ+WqV82spjq3jXYiMv4Fp0mHtAN9x8Ij3Fliz3A4Ujj6ihv
         xw8PbOfaBt24DAonY/YoTvEUfEd30fNSOhSegr2DXzUevzMpKjuiLdr5d+NB+Uwe29AO
         0deg==
X-Forwarded-Encrypted: i=1; AJvYcCVW9MQLFNfU7+Rn8h5TYNFWNJliW05KNSpMYZBO4A4Qqf8ZjvltcRPnWfCDbpkOUqI30cV8p9IeoH62J/UYUnSuLnO7de4/zEGHB5BN2uE25Q/1+F+qRmVIqKoCJZWvwSNW3ymxQGGReEtcBq5sm47AHXk1W3Q0sPKbadz8jcGo4YdlBCHw
X-Gm-Message-State: AOJu0Yw3UCusnZg3OJy/90RjeNK75VJjQ0Y9Tsg196y4/zbDZTBHn23f
	d3mipTQL/IT42Jdj06DqSGYX3jB/wcnRkLHmHHGbPI0IdMIYD+Hc
X-Google-Smtp-Source: AGHT+IEtxSf0FqRKKf6O5su5WO1aK1An8BcYpxm9JuMgBzotWwroMshjUUv72Y3gADnWy0VLBDhhqg==
X-Received: by 2002:adf:efcf:0:b0:360:7c76:dd5 with SMTP id ffacd0b85a97d-366e3677026mr3662823f8f.14.1719174647089;
        Sun, 23 Jun 2024 13:30:47 -0700 (PDT)
Received: from [192.168.1.130] (BC2492F3.dsl.pool.telekom.hu. [188.36.146.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366389b8ad2sm8088599f8f.33.2024.06.23.13.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 13:30:46 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Date: Sun, 23 Jun 2024 22:30:39 +0200
Subject: [PATCH v2 4/4] drm/msm/dsi: Add phy configuration for MSM8937
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240623-dsi-v2-4-a0ca70fb4846@gmail.com>
References: <20240623-dsi-v2-0-a0ca70fb4846@gmail.com>
In-Reply-To: <20240623-dsi-v2-0-a0ca70fb4846@gmail.com>
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
 phone-devel@vger.kernel.org, Daniil Titov <daniilt971@gmail.com>
X-Mailer: b4 0.14.0

From: Daniil Titov <daniilt971@gmail.com>

Add phy configuration for 28nm dsi phy found on MSM8937 SoC. Only
difference from existing msm8916 configuration is number of phy
and io_start addresses.

Signed-off-by: Daniil Titov <daniilt971@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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


