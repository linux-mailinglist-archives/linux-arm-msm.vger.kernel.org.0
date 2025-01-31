Return-Path: <linux-arm-msm+bounces-46604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D4DA23F63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2025 16:03:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CD33188A2FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2025 15:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29D361CD215;
	Fri, 31 Jan 2025 15:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="auodjU7F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0321E882F
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2025 15:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738335808; cv=none; b=HpLnBp8KYooOb8C2Hh8zKxHJZEOjFqKge36wVu42QZwpcvoa8KtWoVGapMOxQMtXYO3j3nTannZhloPKfXXL32V8bGVjfoyMcg0BjJPt2GEBb902BbA+PSkX0FRlBo0hzLsoeqHsRTgf7nplaxnZOvg34255WBX4LPJpJpOXDng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738335808; c=relaxed/simple;
	bh=MzjWwbzWIs8H1LDVE5c7k4kuxK5nlvhG1DNnOpxI2Ws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hiAYFWLmbAkOJ/q/wbomnkC2RRYGel9jv3teSF//CkshzJVujdqnIUxhUpeZ8JIlSIvjBNpYbuzWFSg/ePKx2J4n1nqSnNNmEmR8M3ikr/VjUN0sawDw06ZE67Kwnk8MGhq0p2EE1DTfAftpRe6pJj24qzAwIvCEfaRiVcV+XN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=auodjU7F; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43658c452f5so2849595e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2025 07:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738335804; x=1738940604; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4h/tBpBjpFYt6cfG0kP8Ocw563Sweo8KNaY+K0HOhqg=;
        b=auodjU7Fgm4xIeAbRsNuuMzfHIbb5/oTDYiuB/yA0GXenEK9ZsQhiVXBtR834V9NWQ
         9AJVdpEHzvNZhxcwtBNSlkkQ0k1esqTy/elWzykYsTLsnCRH/BAEwTaLvEaXRQYXRHYJ
         Pa9rkytyJUGSTjb1HqYvylcIrM5fYbIHMtS1eJaDuNu1R3xt/eco3ZAmAqVCHjnyaP4C
         s+umbFxqu0+DagEAginZ8c3VtXm0uU0FqgEwjMS7s8kZyr1+Bze6X9C29UNIEn2PTyfL
         TZpVF/LPDfEG9hQGLrvXBEjoHK6OdsYOlfNZvvabwumpsZHLU+qufWvzJuGcVG0/mx+l
         ZoCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738335804; x=1738940604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4h/tBpBjpFYt6cfG0kP8Ocw563Sweo8KNaY+K0HOhqg=;
        b=C6JqKWlWk1ozdvCeSzfbwZR+yzHqTpSXSX1SP2Qr3KST52jEJ1olO2sSn5zxZzLAjb
         b4tz+bfEl0D11xoNuH4s84IJ3Y3XMe+oMW1F6lKDd2vCiNHKdi3yoYi4ZxiwwDqQeKaK
         bsL25r5UsOBX7sqC4QSznv663DBh0gdAuWVb+QWmT0VfIKnzI6TbeOgAgJ6hN9GlrofR
         uKeOqaMcxIZYFsDyYkI+zfB8i/USImoBd/3i+ZWknh5YwGlxCZCXIsyvAgyVLBhbhmv1
         q64duxMRYnp+eiJdRa51myVViddA+oFUTDKBr+DmSRWxWcG/ncZ7Fui0nbllVo2HsEqR
         C5QA==
X-Gm-Message-State: AOJu0Yw58mit3B3efjcyTdIrc8VtKzJ7quJYWhRzpy2Jg4B4w/c1zjky
	kc+qg88q29Ylhm5L1FALsbuIkXWsz5N9uhRoTyY6kw2ZZroIScuIMDYpXy5tTnw=
X-Gm-Gg: ASbGncspLqcRQ8ItZuInv4lr+t6cxA4wcS/b1RN/QdhGkBwUXA4LR/3kl8/p7ntrTF2
	WJ2fWIynsddV+/HrvIcr/s7PtVgp3DB1Roaz1UU+yZzd7tctzopQBmkYayMyLHHcAb1WYzfwrbX
	fjw1Utf8+pGgBtn4vTd1GEK6wZRbob5PD6S0mHBpoZjRIPQ4Z9f+hnFnjNjFHG151IdkZwXNEyg
	gAz3w/a+4fPbdKf+IVeKK/5ggjloMNlGJqj8HyrtVpuwGd/a7iLOtBFKy1S0ZtiwEu2X0xYvnVq
	CmZLDaP5Xfc4O8D2FIFQ8VlydVJJtDA=
X-Google-Smtp-Source: AGHT+IGt/Ma1+xcecSjAs+tIN0S9176VFMEJoZh0tWzQpjFDOP83vGEsqq8F/1t/+/uO38xWoiotQQ==
X-Received: by 2002:a05:600c:1c94:b0:42c:aeee:80a with SMTP id 5b1f17b1804b1-438e183fecfmr30041345e9.7.1738335802809;
        Fri, 31 Jan 2025 07:03:22 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e245efbcsm56679925e9.33.2025.01.31.07.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 07:03:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 31 Jan 2025 16:02:51 +0100
Subject: [PATCH 2/3] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against
 clock driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-drm-msm-phy-pll-cfg-reg-v1-2-3b99efeb2e8d@linaro.org>
References: <20250131-drm-msm-phy-pll-cfg-reg-v1-0-3b99efeb2e8d@linaro.org>
In-Reply-To: <20250131-drm-msm-phy-pll-cfg-reg-v1-0-3b99efeb2e8d@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3807;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=MzjWwbzWIs8H1LDVE5c7k4kuxK5nlvhG1DNnOpxI2Ws=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnnOYz5iDHf4Qp20YJL5Udj223hj4lS787xPTNp
 gaRdf1GgciJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ5zmMwAKCRDBN2bmhouD
 14m0D/0TkOdX7O2JJNLdgRDCRNTqbqeEHBXzU2CW4U2CqKnMqlYR11fm4SNRjb2lGhLO6uReKsp
 XtbxR9n8y7E41NScMxHH1OhgTZ1PCjPA4j74nMRVl4NnATy/HjnM5viCLZVTtDOizYXTELLmR5n
 RjW7EWK/RVgGGcrFmpiWKOFHPsYVm6OP0ifu/9nwMSHUnoJPCTb+bTnPHxFunDh953Yq4bKZQNv
 aFUE3jCtlt7mW1wN/rWFZ2YkMgUBzocomJ2vGw5yKBm2fMA7LsuEXbguVTfkcQsN5LwzUHiW/us
 pBgwU5Gbc3NKrQRwRd7Om3LTx9+kLRGgJtp7CoTL8FzOQooEV3eklb767VX6nKJcVJXw23Uia22
 4EMD6j1zjIcyN35Cl4NDiGoPVcY55CwBJfplyYePtrtLyII6wnlQvUWu+lLOcThXcWmUAgMzUIm
 0aV0CyY1MRbo8low9GeH99bNc3XQc4uqtPvPGwy9acLUX6PiduZbF+UJUTfMbP8fw6/fu6+ks1Y
 bJwYEPwZ/U+ZRGl0m0eKMUw4vR8Mcm9WvAmxTwqrXJM3tJQpUjpZTyz6LJX3VwctKQaEioCgJa7
 NMrQ7cDPK4GrtzOx3mM5ZGTuQ/1tKKuJZm21addbAJvQoBxpq4Jf5wNcyjBIBVYWPswBumI49hB
 W4ZFi7pu8eAncyg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

PHY_CMN_CLK_CFG1 register is updated by the PHY driver and by a mux
clock from Common Clock Framework:
devm_clk_hw_register_mux_parent_hws().  There could be a path leading to
concurrent and conflicting updates between PHY driver and clock
framework, e.g. changing the mux and enabling PLL clocks.

Add dedicated spinlock to be sure all PHY_CMN_CLK_CFG1 updates are
synchronized.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 34 +++++++++++++++++++------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index c164f845653816291ad96c863257f75462ef58e7..6c18b9c0e1903bbd0090aceef13ae8c6f2e080ce 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -83,6 +83,9 @@ struct dsi_pll_7nm {
 	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG0 register */
 	spinlock_t postdiv_lock;
 
+	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG1 register */
+	spinlock_t pclk_mux_lock;
+
 	struct pll_7nm_cached_state cached_state;
 
 	struct dsi_pll_7nm *slave;
@@ -381,22 +384,31 @@ static void dsi_pll_cmn_clk_cfg0_write(struct dsi_pll_7nm *pll, u32 val)
 	spin_unlock_irqrestore(&pll->postdiv_lock, flags);
 }
 
-static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
+static void dsi_pll_cmn_clk_cfg1_update(struct dsi_pll_7nm *pll, u32 mask,
+					u32 val)
 {
+	unsigned long flags;
 	u32 data;
 
+	spin_lock_irqsave(&pll->pclk_mux_lock, flags);
 	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
-	writel(data & ~BIT(5), pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+	data &= ~mask;
+	data |= val & mask;
+
+	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+	spin_unlock_irqrestore(&pll->pclk_mux_lock, flags);
+}
+
+static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
+{
+	dsi_pll_cmn_clk_cfg1_update(pll, BIT(5), 0);
 }
 
 static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
 {
-	u32 data;
-
 	writel(0x04, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_3);
 
-	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
-	writel(data | BIT(5) | BIT(4), pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+	dsi_pll_cmn_clk_cfg1_update(pll, BIT(5) | BIT(4), BIT(5) | BIT(4));
 }
 
 static void dsi_pll_phy_dig_reset(struct dsi_pll_7nm *pll)
@@ -574,7 +586,6 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
 {
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
 	struct pll_7nm_cached_state *cached = &pll_7nm->cached_state;
-	void __iomem *phy_base = pll_7nm->phy->base;
 	u32 val;
 	int ret;
 
@@ -585,11 +596,7 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
 
 	dsi_pll_cmn_clk_cfg0_write(pll_7nm,
 				   cached->bit_clk_div | (cached->pix_clk_div << 4));
-
-	val = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
-	val &= ~0x3;
-	val |= cached->pll_mux;
-	writel(val, phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+	dsi_pll_cmn_clk_cfg1_update(pll_7nm, 0x3, cached->pll_mux);
 
 	ret = dsi_pll_7nm_vco_set_rate(phy->vco_hw,
 			pll_7nm->vco_current_rate,
@@ -742,7 +749,7 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 					pll_by_2_bit,
 				}), 2, 0, pll_7nm->phy->base +
 					REG_DSI_7nm_PHY_CMN_CLK_CFG1,
-				0, 1, 0, NULL);
+				0, 1, 0, &pll_7nm->pclk_mux_lock);
 		if (IS_ERR(hw)) {
 			ret = PTR_ERR(hw);
 			goto fail;
@@ -787,6 +794,7 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
 	pll_7nm_list[phy->id] = pll_7nm;
 
 	spin_lock_init(&pll_7nm->postdiv_lock);
+	spin_lock_init(&pll_7nm->pclk_mux_lock);
 
 	pll_7nm->phy = phy;
 

-- 
2.43.0


