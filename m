Return-Path: <linux-arm-msm+bounces-48209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDF0A38258
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 12:53:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A24E4169318
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 11:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D782821A449;
	Mon, 17 Feb 2025 11:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FytocBdT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BA4219E8C
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 11:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739793209; cv=none; b=myF6C22ld1JT8Q+3yd8k8j2zmQaVhYZLMqa6xxkK5Ub49fIq1KyGTZ0AdSai2Eq8ZbQq/Z7tsLm2MMrBtQZvSIxjO0W+3OT8B6kAeL2WhYc7owzSZvpJTLRcbYD1l9VYQgJjg4rBx17Wd9qx3WLLQSpY/ZqhUqLwIQBTCSwDpwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739793209; c=relaxed/simple;
	bh=VSoo9tOfvx5J/rILKbc9JGnlfjdESe0PpUUegqGlGK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CS2bYAMgDiWfb1ut5pI3JBYDaY+uED8dMgbu4Fyax0pS6M9BAhG3obN1DdGihN3m1IPVdT6GJb0ErDmakovSk+KtyTPFOo3DkJGTwLjUt81Ztu5VHRZO6RAyAdQjQyG3pK4J8fn3IGhaRXbSmI/NzQWB7qAxurdcr/rqV9xB7F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FytocBdT; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4394944f161so3073655e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 03:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739793206; x=1740398006; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tgWx1O98lxWOuf2pUGZf2+wF+nxvuU7wTS9vVKBBrYU=;
        b=FytocBdTFxRXmIqdRGA8J6M9BWC1UA596R5uVN/V0d6xPBZo5uuRvzSgR9+X1o2E9p
         z/Eqg4TqLlNoLaf0Hnv8qVwG0G7+8SNBJM/qUDqKZeRkyEbtZmT1+rZmQETK5FyGFG1X
         Xflzt0nH5RsBwO35CFYJMxLiD35kocSMexwxDrs575RWKrEpEdttxzYGfdRGhV9fhsSb
         Zxum7VFoi9/lQ+UCTPJDFbgP9YIVtkI4Z6Ly7HVz/23InnFlmv/Q4Ce3bk5qa78zPNbC
         SZv2GdSixbokkwQff9bgR33Faqv7VcBrPYbeqWoXHGLzOpqAUFa/PSznHgu+4E1gFMkU
         txwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739793206; x=1740398006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tgWx1O98lxWOuf2pUGZf2+wF+nxvuU7wTS9vVKBBrYU=;
        b=YtOkgiYSZTY+Kbp0WCMapnVSoGrej7J4aUFTymc3d8qT7R72p8u23l5bCuYhdPqQAO
         e8wTM9RHTcBVASr9376OO2AqrS9nH30isR8lIcWzElaGdRz9kz86R08pTEuPQHTCjiHq
         LqXSSPnSVIYGBDsTO++Zk1M5he6uq307Q3yVmSzzJ9Bdb2sI1iwWi3iBz940Dsh2w7ki
         ED/wXxQ8V+dSlM71QU7whDjQQtChpv05dC1AEpIl33/ssBUTrHJyG2H2wsSXpPYPVXxB
         NqPFvwxGN+D6uY7E/NY5e58qjVKf+79Yue94NgeQg7AC0c88F9D/4dEVDvkIDPdtVPH5
         JfBg==
X-Gm-Message-State: AOJu0YywyPeXml8b3ruitRbI51LFCjDVylCEnhAIJ0wgY1PZD9gYvjcg
	5YMhVNY49lwOW5MGo6DU4QDXO7aOo8wNTl4Jx+hejuu4mpb8UKCqKdzfCX3PJ9k=
X-Gm-Gg: ASbGncvTIa1j/JZpNXCYFVMwtD88m5NmVq4PDVqtvC5yHIn09aPvwSg5PKBtQh8CPdt
	9ChrUd6cRpRMjgzDn3nEl/EXJOEfYW/z3dLsZ//VNqmkaUS9DINiOYsmGGaGTfqAE2rb9Ga+59j
	3GTzd/LWqvq1HoDKKL4UFAz17Oa3R2GVY0WCYF456RGjeH7zMS1aD02kqH+kZTJWYstnceuw4Qu
	x77R6yt4bpgcIyf8Sj6M6NvEgI3A10X+GzApgr8BB8ZZnxyJh1DMhnLyWuDa7aQpivaLkAWdVvC
	5br+PAhKv6yI3qd6dn1A44u7BBQ/S48=
X-Google-Smtp-Source: AGHT+IENBpGOOCFfXQ2oU+u0lvPVoTf/HoOUkdK7JIiHIZbTU/t9CaTNX3kn8py3uSDeAAwKZRr4DQ==
X-Received: by 2002:a05:600c:154d:b0:439:6103:d2de with SMTP id 5b1f17b1804b1-4396e78e432mr36085435e9.7.1739793206047;
        Mon, 17 Feb 2025 03:53:26 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1b8397sm150212575e9.36.2025.02.17.03.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 03:53:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Feb 2025 12:53:14 +0100
Subject: [PATCH v4 1/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG0 updated
 from driver side
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-drm-msm-phy-pll-cfg-reg-v4-1-106b0d1df51e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3488;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=VSoo9tOfvx5J/rILKbc9JGnlfjdESe0PpUUegqGlGK4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnsyMuKJttLyTWP9K0UPqf4QMjwl4tteEV/CcIb
 UADWxj71/2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7MjLgAKCRDBN2bmhouD
 11xLD/9x4qurO23zU/hodHy295lsiPZHU24L4380Y9aoU1JpwtPWdySzx5OkgyZP/e5qdO5zccs
 H8tRCcPP8KP+gBceRgwAYKv5dZ1GseSMvfPCL17nIcns1QC3LseIXD8VzW+sT84r10gPPWg9sT+
 wT9fTJK99166K8b3RBCz2DCKX3/Wp7b2vWSeumk86EsGV/rovQm+xLzjwUBwCQZu7vUZJlsId47
 bxooued62Jd03oXxlKmHp4OdwSLg0/JWDGtcleuw9UAuL3oOsjo0W6jJraImo0wH/V4YxPg+DB7
 BpXlRNBlzjzQylj4hpfyyxnpogDEuJK2HBGkhJQdKtdmfdj80N/4wJ0h1K98BCBu5oCqfrJakl3
 9jvcmV3mnea2/MCifQErjHX2RTQEB7j7RuntOn8zFVCb0atFBZAumvQBLZFL7ZsHS5HoEmkEExx
 UDYTOAaY/Upy4QkptQ/l2csvmQ93z3xpDtoFxJGemPmEnQs0NhbrcCNZB6ZbbiFo/dIdWAk29pY
 4pIhpqM3OjpRnezrG/ai0E6uKOpUOC0SpwWGIELKt9/6E0NMCiOcnL+v2k3UWpoB0H3+sy2snlN
 gmrAyN+ITOKbEbVBddWqVCcFXlphEfhoR8f2uAm29x9NE2j6BXqjmnLRjC+WeqlvSHZZGP2sQEe
 Lo1anelF8vcMvXQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

PHY_CMN_CLK_CFG0 register is updated by the PHY driver and by two
divider clocks from Common Clock Framework:
devm_clk_hw_register_divider_parent_hw().  Concurrent access by the
clocks side is protected with spinlock, however driver's side in
restoring state is not.  Restoring state is called from
msm_dsi_phy_enable(), so there could be a path leading to concurrent and
conflicting updates with clock framework.

Add missing lock usage on the PHY driver side, encapsulated in its own
function so the code will be still readable.

While shuffling the code, define and use PHY_CMN_CLK_CFG0 bitfields to
make the code more readable and obvious.

Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
1. Define bitfields (move here parts from patch #4)
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             | 14 ++++++++++++--
 drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml |  5 ++++-
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 031446c87daec0af3f81df324158311f5a80014e..25ca649de717eaeec603c520bbaa603ece244d3c 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -372,6 +372,15 @@ static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
 	ndelay(250);
 }
 
+static void dsi_pll_cmn_clk_cfg0_write(struct dsi_pll_7nm *pll, u32 val)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&pll->postdiv_lock, flags);
+	writel(val, pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
+	spin_unlock_irqrestore(&pll->postdiv_lock, flags);
+}
+
 static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
 {
 	u32 data;
@@ -574,8 +583,9 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
 	val |= cached->pll_out_div;
 	writel(val, pll_7nm->phy->pll_base + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
 
-	writel(cached->bit_clk_div | (cached->pix_clk_div << 4),
-	       phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
+	dsi_pll_cmn_clk_cfg0_write(pll_7nm,
+				   DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0(cached->bit_clk_div) |
+				   DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4(cached->pix_clk_div));
 
 	val = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
 	val &= ~0x3;
diff --git a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
index d54b72f924493b4bf0925c287366f7b1e18eb46b..e0bf6e016b4ce5b35f73fce7b8e371456b88e3ac 100644
--- a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
+++ b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
@@ -9,7 +9,10 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x00004" name="REVISION_ID1"/>
 	<reg32 offset="0x00008" name="REVISION_ID2"/>
 	<reg32 offset="0x0000c" name="REVISION_ID3"/>
-	<reg32 offset="0x00010" name="CLK_CFG0"/>
+	<reg32 offset="0x00010" name="CLK_CFG0">
+		<bitfield name="DIV_CTRL_3_0" low="0" high="3" type="uint"/>
+		<bitfield name="DIV_CTRL_7_4" low="4" high="7" type="uint"/>
+	</reg32>
 	<reg32 offset="0x00014" name="CLK_CFG1"/>
 	<reg32 offset="0x00018" name="GLBL_CTRL"/>
 	<reg32 offset="0x0001c" name="RBUF_CTRL"/>

-- 
2.43.0


