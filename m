Return-Path: <linux-arm-msm+bounces-46808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03634A26173
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 18:30:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95B2F3A8481
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 17:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8EC320E01B;
	Mon,  3 Feb 2025 17:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RTMIFlAr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D120A20B808
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 17:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738603781; cv=none; b=hK9pR69nvfpprZjq8ZSzP3ay62G7iTxr9k3/8qPyylGpME1p8b6UYLAICHqK7CNb7XcVoViI2U0JRUhZwgoOq5sjnbyeEt2FNkN0y/T5tS3iVtmzMp2hopzWJr26kevmTdPimfSJRYAg4hUIS2OAgMj38fW5bBVSnh5Gdx6ULeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738603781; c=relaxed/simple;
	bh=hyETAALjAp1ZZkmUcX9prHNyliCQYJnSPIVGqiYhRz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HFrAj2kMP1fLd8QwsEuz0qBRtkPkL6l3QStyAEFEcvjUWsRUKTfgMiuKYOfqxzbpv5iXZbbAwxjNkauYrgSawLMfpxY9vKP8I/0PxN5ZowA8godvg+kU25UGMikycCPINZKwYS2DQETkv4DUJNK5zoQeIMq94QmxnCMhRN6EdC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RTMIFlAr; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38bec08834dso339369f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 09:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738603778; x=1739208578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZJ4SckAe3M5hIc6bII4OvJM2A7o5F83xDKuWL0+57KE=;
        b=RTMIFlArVDT5vELC+OTFrYoX/+shiD8E3Q3XIm9sl7e/5EwRD6HMLRIFsKDGviZJl6
         8drNKdqM+5gferuBij1MIJk/Vy/2KJYj1vtJvmUDKFystwNxTY0icEw6eqEe11LxVEH/
         oRTZij8oXIUw9jlxk7vpfI207nGBokyriwnx08PHtvoi0rQOtzSSMzh+GiGOMxjyWQ1p
         J+xWJw6Xw86fgF7AFfLzO8E0UHrzOU/G4XEQuWFvZXefTqIDAkKby5TxEZ0AKBDzPrBy
         /RAP6mIo85F78Dj+5bQYzvWLodxO23F4hpA6+S74K5r5ZZbcaVjlytJbiSoPLj48Prej
         r2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738603778; x=1739208578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJ4SckAe3M5hIc6bII4OvJM2A7o5F83xDKuWL0+57KE=;
        b=Sf5fBnU0lzxmBcFuo1xMNLTraEDIyEfFMTgzXR6i8I+R5lhx2O+7/J0wQdcpmr0Fit
         W9CbgcGs4qs1m7FLH8Ehg7x/Vw0hQtO3Xo8QiUtrB3qtx8RSM+nokl4q4if2SEsb261W
         HzITtzu2SDsbWgToZmZWvIc6zFjleWW4nBBeHl+OREUMylW1w3pGmNtD5aNGVOKOL6Zh
         UH4e5zmF0sOi/1OKoyqgKC3xhAXtQWFgA1rNDkFkvxtw3XWs+MUUOI2BttrYuayUemBA
         zJV1PCgx28E+/0u4u0pKapfp0M+1XREfgQgT0Qj3lu1k+Xr2NYMcALLBwxoMjInrwFT+
         2KKQ==
X-Gm-Message-State: AOJu0Yzp+i2Qzw9JDNJ+4zrSTyLBJ1GTZtzzdlND5s6qKPtQZgLuELnJ
	KidKKy4krzuYyKQQXqpF2zVu4h0Uwu/9b+IQMOpQPmlcvgQwNUcBa6THb+zJy28=
X-Gm-Gg: ASbGncvcnMM/MJMu4qFov/Q2YI8oeDEEOzuLv29nC11kuEBF/Sq0jNT8cX1ohhRW63m
	lGWWuuuLSa+XLzw0s87JF16BXhUvjQd1Vx/1MzaxuPb/piLBpN2jZLNwW2AF3jRNLzaw3mwcfps
	9Gpp38eBaUd3jx6d1Z+0I13Pi18km201K7M8e6ERVoaVrG94uBqdnPv74LEUvJKpk/g/oMZcCoj
	/uUqhLU+YTTu5sKBnLSnwxx85So/NvYGN9enDkPQIGVThLAdV6t+BYaVFwj9RVSJE8EChz0QzTl
	WhEhgKCedPrrs/vHFPjzN808XJgx5q0=
X-Google-Smtp-Source: AGHT+IFIj4gRIDP4pX0InpsIa4ZwSNF/sOa8F+6utSwOkoqKvTqGjRdYhd1+BwpOgmBytJ4Gc3rcYQ==
X-Received: by 2002:a05:6000:1acb:b0:38b:f3a4:4e15 with SMTP id ffacd0b85a97d-38da4e027c5mr148030f8f.4.1738603778081;
        Mon, 03 Feb 2025 09:29:38 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c122e59sm13528122f8f.55.2025.02.03.09.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:29:37 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 03 Feb 2025 18:29:20 +0100
Subject: [PATCH v2 3/4] drm/msm/dsi/phy: Do not overwite PHY_CMN_CLK_CFG1
 when choosing bitclk source
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-drm-msm-phy-pll-cfg-reg-v2-3-862b136c5d22@linaro.org>
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
In-Reply-To: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=hyETAALjAp1ZZkmUcX9prHNyliCQYJnSPIVGqiYhRz8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnoPz7wTiytFmItVkhR/QVQhjlyp7a9NNDuCzGS
 viLLXyQdLeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ6D8+wAKCRDBN2bmhouD
 13ecD/45uNqBQXPujtKXQplCzdZ1S842t1bD975cTQzBpJN1MF75/iexO0wkpEJ6CNa0k7fiP/H
 RE2nQ7Q0HPfls6Secz/pG9DTzy2OSiQmnOHq6eOWExVJSl6cQcjZ7o0+y21srYhpSdXutcpJ6xp
 kGJN7lQyXyOJ5fFGnPWALIeNVf0ozbkylM/Vz4rac4IqDcf1QfFvNA69wX14RhVxuyBsRLhq6z8
 DKj5oBB3OU1ahAlviKu0t/QQjTzGe93CeZVECz1mQYMeP7t0ARY+TWzCwSxfz0ruWi9wOLMsUnL
 tD0C/XZyJWAkMmPQvPdxXpvxi5iygP95ZVkYu7RZJLgbsS3BlkQJaacvP9/SjDzQ/FM7F6/l3nq
 aSGm0kDHrtl9xKUaJYfzGT//rbAYE7+kC65UxR0/duievXHCMFHaCd+kK1EmI9RmTYintf5RMWQ
 wTGUO5QpvM/s1cwyaVRE+BDfVT63Usc4PoQDKMTMDcBI2/hO86rn5zEwiqpAiHQwmj0p8CjsfYc
 z44BJYZt19buIAOLuaMGpVtKb0AmjGXI7m43Ves93B7laSLFisFFqyWirB8cUp8sNbeiSimpZLh
 LINguzbhhSWwMtaI2sxpN6vcKNUsG4zvl5703fAv43h5uvZI1EFLXtSFgw0MOjYo5K0ts2+uxAt
 wzuwFw28fzFFykw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

PHY_CMN_CLK_CFG1 register has four fields being used in the driver: DSI
clock divider, source of bitclk and two for enabling the DSI PHY PLL
clocks.

dsi_7nm_set_usecase() sets only the source of bitclk, so should leave
all other bits untouched.  Use newly introduced
dsi_pll_cmn_clk_cfg1_update() to update respective bits without
overwriting the rest.

Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index e26f53f7cde8f0f6419a633f5d39784dc2e5bb98..926fd8e3330b2cdfc69d1e0e5d3930abae77b7d8 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -616,7 +616,6 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
 static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
 {
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
-	void __iomem *base = phy->base;
 	u32 data = 0x0;	/* internal PLL */
 
 	DBG("DSI PLL%d", pll_7nm->phy->id);
@@ -635,7 +634,7 @@ static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
 	}
 
 	/* set PLL src */
-	writel(data << 2, base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+	dsi_pll_cmn_clk_cfg1_update(pll_7nm, GENMASK(3, 2), data << 2);
 
 	return 0;
 }

-- 
2.43.0


