Return-Path: <linux-arm-msm+bounces-49587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 69476A472FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 03:36:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BCA5168D02
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 02:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88DBB1C7003;
	Thu, 27 Feb 2025 02:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W9wANFDo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764531C07DA
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 02:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740623125; cv=none; b=isY4nw6O4WyvHaYjiIZ0/thfRuyglgDqqi8STT9ZPkCjlmtW19+O9nZVzeNUK+6iPbdvr0hAGXgrfax+SL6Mk9RwRfxTP2B4x/ZMp2AbyQmSBwY/EqleKpj4ol62o1Q6Gh4uhz1jt9lA6frA9kKeqTZ1XXdNDoiFXWlyZ4s4AFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740623125; c=relaxed/simple;
	bh=27+bBwIzCM8lHu2v6Fir13MzMlLQU6chggcqKIoU0MI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oq1ZFqX9GjKmVcYqY+5WGDr9WFcIuPKshzmvW1MDXur/m5Yu5alKMcKDTOd2O4dKNQxd+9leQw306V3OYt4ApVLOhBl6IhTDATpSx1U9RfFuJLDD4ZkIH1cJwylhdNZKJAaKRZ/h9AVmm6BAGpaYud22aK3jL0KlZczjlG6joGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W9wANFDo; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30613802a04so5190861fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 18:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740623121; x=1741227921; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xjMPSn3p+kKVaFgGwZAw2jpHs3L/eAAFrrWZof4s+cw=;
        b=W9wANFDoaAwcnML1oAliVynhMeEWmCo41zXTMNTecu9P2e9v31tLc7AfAiHB8tHBUP
         MWPmzmjYCsRDeYVodgTIQPBIPE8kruKC14Mi1rLRYMNP7/qr4Tnr3D0KTD1OamTS4koT
         p10y3jwxzIXuP1wIFijRxg22qPnEmdeZMMkg8NvsSkzB0BYC1Hvbq5VSdsh/EP1JInpN
         WtjUID2/WohR+S9Bve70nslxRI/LGYufvLWdZq/HS+UAY/mMSSBEkI1W/tjW/zBReJ3N
         1oeYHETKZDINwXpKpZ3at8tCoeArHHR3fNi4lm6YQEn3ZyrBy7LBtB39y8jAnjCHXjSU
         1fgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740623121; x=1741227921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xjMPSn3p+kKVaFgGwZAw2jpHs3L/eAAFrrWZof4s+cw=;
        b=hvzwXohqR+RJEGZeT8x9xihFA3ggWHhTrPSUwFj87ZiOjAN027cL/mw8A606BMoG23
         RqJmkObs94YhMTvDTnRs49vMlofghKTXLVUNMv/+0a42VytUcrBRBwKhLOJWI5GAeDsQ
         S7UrtTJDNjWTVUY/I7Nl7IdiK2C6T0pIvSC2SdxV4Prn2pv7bcvetM/JHXO5Svkj7hNf
         hyPGJXOzzpb9Is7m1U2y3hffEQkFkHCHte7eg4oamRxOcx1UQ6ckMcNtdEajCw+5K8Mv
         /J9wBFU3tj9q1Lhe3YpZBRjEwlJXAT/z5/aii2gChaa1psOoVpjKc4jr0hf+/+mviMHi
         RU2Q==
X-Gm-Message-State: AOJu0Yx2JJAlkowGOXhC94fnliVOUYhv15VjsFFTnu5k6R3Syw+YvlZR
	3jrvsJ6mj8ftLeN/fbZnK7S4Ald2kXS6+epRWhxrCU3707g1hm0oGdifCz2Fqrk=
X-Gm-Gg: ASbGncukjLfqDGVEjOPV+z5m0H9XGrlrB5MEgbrNfDzr03OkVnA9Fk2NxUbqVN1YRJI
	zJNh+c8VT3SPN+aSTewTkbHrARCZ/0vntAh5BmA+vsiXzfTDbyVZq0Sx5WFlu5GbP4WnD13drtD
	bfMyL2fr2NBDUHxW5WMcv79+klmv2uDGkPbcQeuVdp44yimtKXEUIww2Ghral83Oh1j2eBZ8dgs
	l1lhArf4TIF6hd3uCfo7tcVx7opXZM9G/Stbwjy4ZuETmi+9+gYT3pNAr/Bp+2JPAgmizBeXoty
	y6GKcLpA3c7NRLB5NBL91ptESQE6o65ztw==
X-Google-Smtp-Source: AGHT+IH77YDGb3SZATx2bSqI54qqDb0dQOMQtl3AYNP1lYyp8xUbecwSvBjawn7myFKJmWOKcAzSAA==
X-Received: by 2002:a05:6512:3c9c:b0:545:c23:9a9f with SMTP id 2adb3069b0e04-5483926338bmr11394006e87.44.1740623121569;
        Wed, 26 Feb 2025 18:25:21 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549441742a0sm48067e87.5.2025.02.26.18.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 18:25:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Feb 2025 04:25:11 +0200
Subject: [PATCH v3 3/7] drm/msm/mdp4: register the LVDS PLL as a clock
 provider
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-fd-mdp4-lvds-v3-3-c983788987ae@linaro.org>
References: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
In-Reply-To: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3368;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=27+bBwIzCM8lHu2v6Fir13MzMlLQU6chggcqKIoU0MI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnv80Gt/5nSvJtT/vlFx8Una3vhVbTV9fge9Jhj
 jIZmIOXNPCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7/NBgAKCRCLPIo+Aiko
 1Zw0B/0X9T9NpQIFhPxEgci4pkI3GQTWUb6qpGsk+NLJ+A1v4NgpUypKdVr6srLGtwcdZp9i23h
 SfSAwiTWE/idrluzIasJ4sQsQ9f47F5gCpWRexmttiwyxpVcqLDGLcRYAsf3cQ/EgRAX0zV5cvO
 Kgy5Vk21qsHpeb8IAuDgsMg4Zb+DZUhYt1Eo+Pl2rOGmXdG28FirbFGS30IwPlvlRiCHaMjZwpu
 4VBIGuT0UUjf+YG2UL7uIKH56gpgkMQC07+VlNui77Q07EOWZ+bQOX1o5TMu0qctVaLs6M5DcpS
 zWMcqMFEDrW91UvPDrvkDkmXXnsV/QgCWDnIsVV/BSEJP6Gy
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The LVDS/LCDC controller uses pixel clock coming from the multimedia
controller (mmcc) rather than using the PLL directly. Stop using LVDS
PLL directly and register it as a clock provider. Use lcdc_clk as a
pixel clock for the LCDC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h          |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c |  8 +++++++-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c     | 22 +++++++---------------
 3 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index 142ccb68b435263f91ba1ab27676e426d43e5d84..b8bdc3712c73b14f3547dce3439a895e3d10f193 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -207,6 +207,6 @@ static inline struct drm_encoder *mdp4_dsi_encoder_init(struct drm_device *dev)
 }
 #endif
 
-struct clk *mpd4_lvds_pll_init(struct drm_device *dev);
+int mpd4_lvds_pll_init(struct drm_device *dev);
 
 #endif /* __MDP4_KMS_H__ */
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
index 8bbc7fb881d599e7d309cc61bda83697fecd253a..db93795916cdaa87ac8e61d3b44c2dadac10fd9e 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
@@ -381,7 +381,13 @@ struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
 	drm_encoder_helper_add(encoder, &mdp4_lcdc_encoder_helper_funcs);
 
 	/* TODO: do we need different pll in other cases? */
-	mdp4_lcdc_encoder->lcdc_clk = mpd4_lvds_pll_init(dev);
+	ret = mpd4_lvds_pll_init(dev);
+	if (ret) {
+		DRM_DEV_ERROR(dev->dev, "failed to register LVDS PLL\n");
+		return ERR_PTR(ret);
+	}
+
+	mdp4_lcdc_encoder->lcdc_clk = devm_clk_get(dev->dev, "lcdc_clk");
 	if (IS_ERR(mdp4_lcdc_encoder->lcdc_clk)) {
 		DRM_DEV_ERROR(dev->dev, "failed to get lvds_clk\n");
 		return ERR_CAST(mdp4_lcdc_encoder->lcdc_clk);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
index ab8c0c187fb2cd05e26f5019244af15f1b2470c8..cbd154c72e44c848fa65fe01d848879b9f6735fb 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
@@ -133,29 +133,21 @@ static struct clk_init_data pll_init = {
 	.num_parents = ARRAY_SIZE(mpd4_lvds_pll_parents),
 };
 
-struct clk *mpd4_lvds_pll_init(struct drm_device *dev)
+int mpd4_lvds_pll_init(struct drm_device *dev)
 {
 	struct mdp4_lvds_pll *lvds_pll;
-	struct clk *clk;
 	int ret;
 
 	lvds_pll = devm_kzalloc(dev->dev, sizeof(*lvds_pll), GFP_KERNEL);
-	if (!lvds_pll) {
-		ret = -ENOMEM;
-		goto fail;
-	}
+	if (!lvds_pll)
+		return -ENOMEM;
 
 	lvds_pll->dev = dev;
 
 	lvds_pll->pll_hw.init = &pll_init;
-	clk = devm_clk_register(dev->dev, &lvds_pll->pll_hw);
-	if (IS_ERR(clk)) {
-		ret = PTR_ERR(clk);
-		goto fail;
-	}
+	ret = devm_clk_hw_register(dev->dev, &lvds_pll->pll_hw);
+	if (ret)
+		return ret;
 
-	return clk;
-
-fail:
-	return ERR_PTR(ret);
+	return devm_of_clk_add_hw_provider(dev->dev, of_clk_hw_simple_get, &lvds_pll->pll_hw);
 }

-- 
2.39.5


