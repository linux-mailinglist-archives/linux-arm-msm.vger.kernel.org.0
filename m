Return-Path: <linux-arm-msm+bounces-48045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C49E9A36113
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 16:10:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 811DB188ED10
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 15:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FC5E266F1A;
	Fri, 14 Feb 2025 15:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WNuS80tN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D87A2673BB
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 15:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739545759; cv=none; b=P5bE76DxDcdjanT8Z6x89DdLIDizMGh0KNghYsdA76T85swucpwH0nrRyQPdXOLW3IkvJjYPsTi6SsKt0K5/4bDduJ7ZSnNghi7DAR1lYjmVDSRPAzCQo3+YjqL8IMZXy6S5FvYDUIK4kza9Xlc681TdElOOMRDmUbWQo8fyteg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739545759; c=relaxed/simple;
	bh=2CBa9IBMibbcITCTnBXKA4ai81Vo/pmWYs2riYsXCmg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tYcTyFxy762IG1JYz7N3ITRerd+faWYbeVALtyZKlpBUL+pnrfgKsnI4ONG8X3Ki8gXEXm0MW56fV7VNHIwHxUt8GHm28ZKcsFghKJXiQrZOIrONcIpckyD0RVPlcKqUnjU5cYdpOJCsRDvuN/+rdz95CjJZKPDNCUnVddTjNb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WNuS80tN; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ab7b35a004aso38631666b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 07:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739545754; x=1740150554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B7jsGzrzWA2UpjfP518+Ys9Fu8SxTav8yjO65ThpneE=;
        b=WNuS80tNfTlW7WceVU/9Fxvy0fkxRA0xVSw8+D8ymEo3WTBVsYHqvdTEvrVpCKn4dL
         U9YYgx7bpUjlZfhETbzZjHMCUHT4LA97BU73W1Q4J8kQz0i0iKZr1EMdHtAh0T+puU25
         joYGueXy0y8d/KnIqNoqeT+nCoFU5hHIdsrKdid25cZlV4kGUkfcn8Bs02tUqaGkw96S
         6JjxV4B/P+OzYiPJTgQBaOF/4oFSVJjfEYDisijetllLxPZy3agMOtK6gGJC9ZIwvlU2
         uWSP7qZlAm0AWiOT6+8wgoz4qmcfDILKjYGLsV9mQqz3nCRJfXBABPaLSKC72+GP+4De
         YH/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739545754; x=1740150554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B7jsGzrzWA2UpjfP518+Ys9Fu8SxTav8yjO65ThpneE=;
        b=F3KjKB2VZ3xZpgbE7HraWMpxlpw/kaYJeF0AxoNEZRbCW3rBknxEMmiovQS8r2O7n4
         bSS5AT5unijwRJhmpN6wdv1JhOGDS87CoW5nb2uItTss75FPEIUR5TaznMb0G3Igyp+y
         eMGdelJLnQKUO/UZlloSjeLwy4TJTJ/2MTM7DFp4cEiUdoD0D8jED/Y3EvEbu0m1mbXl
         +O31Foi5vxCFhLYq1ZMFauDo/FpL3Y43gg6B0MW4Ya06YzsQ5QY/0egQ5Ou37gHgEdZf
         YC3rlxzUQbsnSzFQ0kDHVDanzkkFiasgdMaWKlgtakDJkusuLoRF1vC2fjie6KAhRIy0
         j8+g==
X-Gm-Message-State: AOJu0YwH6eOXsjyq7z/LpZGZmzCAySCWNpPQj2VV55btjZDppoBHL/Uz
	0fIOxGoFu2BR/7rnAUdaTLnn+Fr/QcdRq9fiCtZVhJU6LPCSaxFAtJ+kH5ov1Q1hYs/FUV56M5M
	O
X-Gm-Gg: ASbGncsqPiY+2+qlj1sNHcA65LHzcP7VInzbJPOX6S91dr4SVH988XFXCGV8XNfOf5T
	XYejjS9djgCXiziHqM3Q8I6obK9/Xdw4TC/FKGAupmkyO4QXHJuD7ZWOs+GXG1ZW5PIyClrp/sA
	l19xjCguPFGd5DWL133CA+V7apUiA7yJr4kGRkbM3JxIBeLztGwrY37OvvntMjt0r5lS9VT57Om
	deunCXK9ZA9hanJIO9Wnh0h20ROQkeaC/qtq4mG5uA50xzYRHDPbgR7JAJm1Hm407wR94anMe6p
	cs6mdPNkoCo/XGC/kRDia/2TBUUnbZU=
X-Google-Smtp-Source: AGHT+IE7JU7OBLRkos654tOsr2eurVNX6fP97fyobBh9cWCTtMYkOpMH7QEK2km71kJRMzG661dyZw==
X-Received: by 2002:a17:907:9490:b0:aa6:6f12:aa45 with SMTP id a640c23a62f3a-ab7f33cee90mr468424866b.7.1739545753005;
        Fri, 14 Feb 2025 07:09:13 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba533bf70asm356266766b.180.2025.02.14.07.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 07:09:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Feb 2025 16:08:44 +0100
Subject: [PATCH v3 4/4] drm/msm/dsi/phy: Define PHY_CMN_CLK_CFG[01]
 bitfields and simplify saving
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-drm-msm-phy-pll-cfg-reg-v3-4-0943b850722c@linaro.org>
References: <20250214-drm-msm-phy-pll-cfg-reg-v3-0-0943b850722c@linaro.org>
In-Reply-To: <20250214-drm-msm-phy-pll-cfg-reg-v3-0-0943b850722c@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Rob Clark <robdclark@chromium.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3653;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=2CBa9IBMibbcITCTnBXKA4ai81Vo/pmWYs2riYsXCmg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnr1yNPOoysNFKaCqU06xwyIbjOpzjtXtIKu6ny
 4+bnqJO1UuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ69cjQAKCRDBN2bmhouD
 1yGpD/wMzzZRoNEJddfIEvdwKtLRihZJNRYkTaNYECkfJYQ6wVhuz/xiDFeQ/SsAKz9pXIik4SF
 r1dMnA02Sdxyt8TCDLtpJK0u3ExejMBuU8qebOKqizCR+eo6R0DPttheCsrYtVrbdFF3AdnlwzG
 gAz+vQprz0JP0P0HRcUQ6Lr7dLKjgGlJTEnUD/BA2haAPIeNL65suMKARExE7XPqcKfKKW2rerR
 bP+5YlODHhXC8Ed9PZUTBZeKswlrHetbg+K6sXYVVeiZlrSaHxaAiBKwqRG3aZDmGTck+fXDxAc
 wtArZ7WcsYip5uEe+3IpEMbhKj30Y63CHWBXqhEF3Yy7whUzFW7Y/MidDXE5b6H54iOl1FFTA1M
 ygz7rypxFuKTIhwjjQMwTRwmi7QmB8lYQwO0AXuNjogTa/87fzaHB0ZksZL08OGx7pdzSkD2FVF
 H70bF7zWAVrubgHNrd7dq7mVvW7fUagqjVZgQ4zt0qZyKGq9tfdF32WqOjQzuKP8KTOuJDjzz53
 GU8w3jameWwtUdx94rwQWUwBSybUxrlEFt/u3CyrfAQuJREuLn63Um71DBvnAUeGy5WMAuoceSJ
 0gyuPMvDvi+/l74qISVy8ROY5hlboH4ec0KxaguKF40BhO8oR2imSsOJkhGsagTK+4ZDRJmNgS7
 o1B5XGYPuyYdueA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add bitfields for PHY_CMN_CLK_CFG0 and PHY_CMN_CLK_CFG1 registers to
avoid hard-coding bit masks and shifts and make the code a bit more
readable.  While touching the lines in dsi_7nm_pll_save_state()
resulting cached->pix_clk_div assignment would be too big, so just
combine pix_clk_div and bit_clk_div into one cached state to make
everything simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
1. Use FIELD_GET
2. Keep separate bit_clk_div and pix_clk_div
3. Rebase (some things moved to previous patches)

Changes in v2:
1. New patch
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             | 12 +++++++-----
 drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml |  1 +
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 798168180c1ab6c96ec2384f854302720cb27932..a8a5b41b63fb78348038c8f9fbb141aab2b07c7a 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -572,11 +572,11 @@ static void dsi_7nm_pll_save_state(struct msm_dsi_phy *phy)
 	cached->pll_out_div &= 0x3;
 
 	cmn_clk_cfg0 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
-	cached->bit_clk_div = cmn_clk_cfg0 & 0xf;
-	cached->pix_clk_div = (cmn_clk_cfg0 & 0xf0) >> 4;
+	cached->bit_clk_div = FIELD_GET(DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0__MASK, cmn_clk_cfg0);
+	cached->pix_clk_div = FIELD_GET(DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4__MASK, cmn_clk_cfg0);
 
 	cmn_clk_cfg1 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
-	cached->pll_mux = cmn_clk_cfg1 & 0x3;
+	cached->pll_mux = cmn_clk_cfg1 & DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK;
 
 	DBG("DSI PLL%d outdiv %x bit_clk_div %x pix_clk_div %x pll_mux %x",
 	    pll_7nm->phy->id, cached->pll_out_div, cached->bit_clk_div,
@@ -598,7 +598,8 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
 	dsi_pll_cmn_clk_cfg0_write(pll_7nm,
 				   DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0(cached->bit_clk_div) |
 				   DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4(cached->pix_clk_div));
-	dsi_pll_cmn_clk_cfg1_update(pll_7nm, 0x3, cached->pll_mux);
+	dsi_pll_cmn_clk_cfg1_update(pll_7nm, DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK,
+				    cached->pll_mux);
 
 	ret = dsi_pll_7nm_vco_set_rate(phy->vco_hw,
 			pll_7nm->vco_current_rate,
@@ -739,7 +740,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 		u32 data;
 
 		data = readl(pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
-		writel(data | 3, pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+		writel(data | DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK,
+		       pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
 
 		phy_pll_out_dsi_parent = pll_post_out_div;
 	} else {
diff --git a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
index 35f7f40e405b7dd9687725eae754522a7136725e..d2c8c46bb04159da6e539bfe80a4b5dc9ffdf367 100644
--- a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
+++ b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
@@ -17,6 +17,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 		<bitfield name="CLK_EN" pos="5" type="boolean"/>
 		<bitfield name="CLK_EN_SEL" pos="4" type="boolean"/>
 		<bitfield name="BITCLK_SEL" low="2" high="3" type="uint"/>
+		<bitfield name="DSICLK_SEL" low="0" high="1" type="uint"/>
 	</reg32>
 	<reg32 offset="0x00018" name="GLBL_CTRL"/>
 	<reg32 offset="0x0001c" name="RBUF_CTRL"/>

-- 
2.43.0


