Return-Path: <linux-arm-msm+bounces-48210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CD67DA38259
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 12:54:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 922A57A2CBB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 11:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8632621A94D;
	Mon, 17 Feb 2025 11:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VMSGBqkj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7866821A440
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 11:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739793211; cv=none; b=RawM/NsWWRBqWY6YriB/hJBOJzmINeT1vtOx5oLuWmIbcR9f0dqqupXGGgW5j2JPayJWPC+uy52U+OIGwn5HqWf1miEK+oXyPnUekBUZxpIv/ZziAvcTJAGNFWdrtEOFY0hgSaNZnfBicTx0ooZEZh48uIxUajA4CKSsl4cydU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739793211; c=relaxed/simple;
	bh=JDa2rufW4GrwAH1og6yrejuXIhY3lQbcXiG2vjBVULk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=reG5teJggMy2RrV0qdloP9IMAHkp+VcGxMlry/iJPtO8AxZYRsZe83HrHsKZqoUDgsV3KR/s6ii45IeIPBf+4KKZvgRDu48sZFC9+5DXv28dr2U9uCbdqJ5cB9RO5NFiucdo+94ycrMmr2x8J9auuvSilSZrwHbDVn3abNAlD9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VMSGBqkj; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43979038df6so1045175e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 03:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739793207; x=1740398007; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rWmUpWyrE1eFyVx0zffSJlvaDmfJ0SMAFHZs9MJfKYI=;
        b=VMSGBqkjQopMSqf5+aWIiWZTaljZ4C36+b9zcw8jfB7hhaG59+oUH9Uhpz/GzYI165
         f+oiE+wNMfUfOUYV18OkDelt2GBzxGA4CUlS1OPPKACqoo3hrp9TqVBRcE+UW7j6e5Rf
         7D9KJ3wf9sJLjONy04pohzvV2LhEsMcq9RBm0Sqw/7uIZ3BiP/jFFxXblCoEHwF9dtvO
         Ps411HrKxOh72nHzyyGEfZuZln2amL21Xge2BQCuxlvD7zRkevH3GgA0eePFG0L1vGPz
         ky9Rp3sSns9QUbIpbfHR1rpmIRUFpHs48Yfr7qmUR8yJkuZVfejQ0k/qMZNQ+kluFpMP
         ZPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739793207; x=1740398007;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rWmUpWyrE1eFyVx0zffSJlvaDmfJ0SMAFHZs9MJfKYI=;
        b=RJdAyY6cwJvjymfD8wv2Bd4ZGoAxOoerzhr3BqXpg1Jboy9bjnwJ9z+hoZZnRb6Hyr
         U2lhzp9p5/Iv9CKXphJhpudXVYVgTSJ04HP74AY9MpbeGzYfs1EJ6bfcPGrYpMpxZ6Px
         jI9okOOqJlp4T/56yWWcGKdXVcjWlMyU21rxV+almofznYRR2Pkp2S8TLWxStKZSdnRk
         uDb4b19Z0AD5mevczIi2OAvvh67EZ2c9IyX7HoKugFACTAbbVOokl6rcg+weVh6ZoMx8
         m5/NW5S1eGtmGa9RpdcLn8vsd9ZJTygjXJxNm0cDx0wxcPJIwlF09j05A93GdBTEEfDG
         YVwA==
X-Gm-Message-State: AOJu0Yxy0eBpvh9SUAlRj1d81A1h3LeqgJo6ycBoBxwxQB8uesFNpSHd
	Dv13VLRzlXm5DSzQ/jMOIhjMU6BsTW3TTU7+ZAGJON8EsrXZXxTrkZpy4dq7wR0=
X-Gm-Gg: ASbGnctZ0Mudbg8toD3nUZbzNfyQaY1oP5rgmCxzhwzoem0WO5CPIU7m0XUiqKQsfH1
	dg12XSEa982tn60RJR9SXdqaD5QVUjSnqXF8ccx6krwb/9+P2Pm39TgcRqqo5Y1o88BYjw9h5YM
	7S8yB8tePMAbGMxy0pufGSFm2ZWf1rUHpclm1rRMIZRazxBhOwIW6JY/TlURmFoZtK7ZjVWbCYC
	eg6bfC62uervwVpJkUZ6XgjbC1Wa6igMkFkCj4RbKH1foqzini3xxQJN+LePdh/3eWk7haTdPbe
	yTnq6rUpM3zLUP46LYMx+S+4lFz6NPU=
X-Google-Smtp-Source: AGHT+IEpqJgGoiNouVEBinoSlxzWDrCXnZfB8FaV8pAohFqj/o2Rl50/1emoQ/bdbrtDxEfbHaNIPQ==
X-Received: by 2002:a05:600c:4611:b0:439:8c80:6af3 with SMTP id 5b1f17b1804b1-4398c806dcamr4218225e9.8.1739793207551;
        Mon, 17 Feb 2025 03:53:27 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1b8397sm150212575e9.36.2025.02.17.03.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 03:53:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Feb 2025 12:53:15 +0100
Subject: [PATCH v4 2/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against
 clock driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-drm-msm-phy-pll-cfg-reg-v4-2-106b0d1df51e@linaro.org>
References: <20250217-drm-msm-phy-pll-cfg-reg-v4-0-106b0d1df51e@linaro.org>
In-Reply-To: <20250217-drm-msm-phy-pll-cfg-reg-v4-0-106b0d1df51e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5441;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=JDa2rufW4GrwAH1og6yrejuXIhY3lQbcXiG2vjBVULk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnsyMvKhzTG7p5hIu1DyXtjncScjmy2NVL7bNxB
 dCbQx/Xs1iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7MjLwAKCRDBN2bmhouD
 1w1mD/4+hN+MoWY8h+0Oz8p1Zy+XrCbiPsqhtlTwRDDxZ6r561qTxlUcb+kG4Z6Dqz0U696Bcop
 CJTTqbNxGKIW2OeWCpOadGSJT4qDrBbsiFocY1oeWKSG1C6b4q4hW6uii63NRhb3aD8J5Of/dGH
 LeXNS6rNnK8VIJyEenFvM7h67CULUfQbRnNqNc5iQ+CN7NsASC08j/4yquoholWmb6ao4ckqao1
 lxrX3muDfxCFAt5p50j5Zr9z6b/wn88Yf9jgtrineIz2wsOpmcAVmIFVSpK6/1NyLv2rbNyCvKp
 CmOc2EXGFQ/zhN0wQ7+V75TefYs9Rbvzt7OAppYksGqb4lZzzKeCTNatHJ6ARpkvvwPOtUM1rpG
 nkTlcCUkMx7JOFNfBrhFsVQKkakoZ9OEdiJOF0ldR2/McKm8QevkVC2A0cIdZWNImz9cVIT5GqM
 KugKstXy+4xyZ7BOlPXTGvtZhw+97425GFk24pKFA+oWB69RnXuX4npp1cLGlgZKCw311ApPU1H
 u7o9gGv5UPC3waR1TlZ/RNTWYY/vf+NJRBPLBbv3/hRkZG1IZq3bFrpUXVKmTpdzAy2Aml9zkQw
 0LY1tQLxefSOsFuPMkPL91hL6DZnKWY21jgR710hSdVoDQwcXjfsRoiHb5Xxj5T/XTcmrIIIZEd
 wTezgW5/isw+Umw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

PHY_CMN_CLK_CFG1 register is updated by the PHY driver and by a mux
clock from Common Clock Framework:
devm_clk_hw_register_mux_parent_hws().  There could be a path leading to
concurrent and conflicting updates between PHY driver and clock
framework, e.g. changing the mux and enabling PLL clocks.

Add dedicated spinlock to be sure all PHY_CMN_CLK_CFG1 updates are
synchronized.

While shuffling the code, define and use PHY_CMN_CLK_CFG1 bitfields to
make the code more readable and obvious.

Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v3:
1. Define bitfields (move here parts from patch #4)

Changes in v2:
1. Store BIT(4) and BIT(5) in local var in dsi_pll_enable_global_clk()
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 35 ++++++++++++++--------
 .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  |  5 +++-
 2 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 25ca649de717eaeec603c520bbaa603ece244d3c..388017db45d802c4ef1299296f932c4182512aae 100644
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
@@ -381,22 +384,32 @@ static void dsi_pll_cmn_clk_cfg0_write(struct dsi_pll_7nm *pll, u32 val)
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
+	dsi_pll_cmn_clk_cfg1_update(pll, DSI_7nm_PHY_CMN_CLK_CFG1_CLK_EN, 0);
 }
 
 static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
 {
-	u32 data;
+	u32 cfg_1 = DSI_7nm_PHY_CMN_CLK_CFG1_CLK_EN | DSI_7nm_PHY_CMN_CLK_CFG1_CLK_EN_SEL;
 
 	writel(0x04, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_3);
-
-	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
-	writel(data | BIT(5) | BIT(4), pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+	dsi_pll_cmn_clk_cfg1_update(pll, cfg_1, cfg_1);
 }
 
 static void dsi_pll_phy_dig_reset(struct dsi_pll_7nm *pll)
@@ -574,7 +587,6 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
 {
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
 	struct pll_7nm_cached_state *cached = &pll_7nm->cached_state;
-	void __iomem *phy_base = pll_7nm->phy->base;
 	u32 val;
 	int ret;
 
@@ -586,11 +598,7 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
 	dsi_pll_cmn_clk_cfg0_write(pll_7nm,
 				   DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0(cached->bit_clk_div) |
 				   DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4(cached->pix_clk_div));
-
-	val = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
-	val &= ~0x3;
-	val |= cached->pll_mux;
-	writel(val, phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+	dsi_pll_cmn_clk_cfg1_update(pll_7nm, 0x3, cached->pll_mux);
 
 	ret = dsi_pll_7nm_vco_set_rate(phy->vco_hw,
 			pll_7nm->vco_current_rate,
@@ -743,7 +751,7 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 					pll_by_2_bit,
 				}), 2, 0, pll_7nm->phy->base +
 					REG_DSI_7nm_PHY_CMN_CLK_CFG1,
-				0, 1, 0, NULL);
+				0, 1, 0, &pll_7nm->pclk_mux_lock);
 		if (IS_ERR(hw)) {
 			ret = PTR_ERR(hw);
 			goto fail;
@@ -788,6 +796,7 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
 	pll_7nm_list[phy->id] = pll_7nm;
 
 	spin_lock_init(&pll_7nm->postdiv_lock);
+	spin_lock_init(&pll_7nm->pclk_mux_lock);
 
 	pll_7nm->phy = phy;
 
diff --git a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
index e0bf6e016b4ce5b35f73fce7b8e371456b88e3ac..cfaf78c028b1325682889a5c2d8fffd0268122cf 100644
--- a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
+++ b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
@@ -13,7 +13,10 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 		<bitfield name="DIV_CTRL_3_0" low="0" high="3" type="uint"/>
 		<bitfield name="DIV_CTRL_7_4" low="4" high="7" type="uint"/>
 	</reg32>
-	<reg32 offset="0x00014" name="CLK_CFG1"/>
+	<reg32 offset="0x00014" name="CLK_CFG1">
+		<bitfield name="CLK_EN" pos="5" type="boolean"/>
+		<bitfield name="CLK_EN_SEL" pos="4" type="boolean"/>
+	</reg32>
 	<reg32 offset="0x00018" name="GLBL_CTRL"/>
 	<reg32 offset="0x0001c" name="RBUF_CTRL"/>
 	<reg32 offset="0x00020" name="VREG_CTRL_0"/>

-- 
2.43.0


