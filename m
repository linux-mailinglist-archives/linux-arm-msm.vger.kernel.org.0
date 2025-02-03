Return-Path: <linux-arm-msm+bounces-46806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B917BA26170
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 18:29:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5740A3A65BB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 17:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63AAA20CCDE;
	Mon,  3 Feb 2025 17:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c7Q8sEDb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7091320B808
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 17:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738603779; cv=none; b=nRGQ8VWOL8qimV9rnBnVckdRbO5v+eGo572LLfVdpAg72IUYaw1Whl9a7c0P5gLFmOv1FCO/Mh6GQBOc6Ds9bo9F9oJ/p47VxSxAeYx5KNOCjTsPg7xvpWV9HfOnhSTkjiQ7j+dG4WPGL2AtaWVW+gexLaBgqv4SgwxRH1FtCo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738603779; c=relaxed/simple;
	bh=qPayIg/NkA+MgAFyPivDQRmrfYR5ne0X/KrNddzzxvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qGeeXanSA1kBfnrCA4L3W4oOdW1EPYcdzy7pOlukbkOM1XaNHQbCOBU0lgqAp+8Q0Yli3QJgki1r7bn3p9xmX5bnvDI1OJWQaa8sT38qx4jDHA+iji1E8Vk3877fqSIh9jad+8CyS+7/TopkmqeXkWndzTmi/hMnFoPawZ7snIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c7Q8sEDb; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3862de51d38so182519f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 09:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738603775; x=1739208575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nuYKr/hO5ESxnU+rHE9EocNAqOyGfy1DJ7LFqKkR5XM=;
        b=c7Q8sEDbVXvfEmePzPSng6Ly0uKKVT8hN5Oi/uvCOVheN4UeAdp1TXAW1wZmmaHbcl
         4ovdVQkafTbqSbqix7S3hpaexhijkjAFO4/52nY2ugh10C9kol7cINjonYw46I1qAWBy
         H2Vy/eTxsrRUHXQZgdde7g1ipsNGCkhWTbUAUObrmXQJlam3wiPE93bSu/wN8w8xQfVu
         956FtcOMU05OZrBvOy5tOdqraAVwi/dWqwFIq+ETC2cwWzQLr6SWXHQonWPkzBYdwH01
         VftGosaMzYkDdLdhm/xq622SDtlmebOj2MfalcgfG96zJfDZbyk+ctc45K5y2Hq9I/6v
         OFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738603775; x=1739208575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nuYKr/hO5ESxnU+rHE9EocNAqOyGfy1DJ7LFqKkR5XM=;
        b=US/NsMReQPTQvWBvcHGMMq9u8n8jF2e6aPwgvjMreZb4X9bHqCXP3Lk/TsbGmXTLsD
         HBQKUT7JIY5DzuPpOWF+stY4nszZd7IHRA75SvWGcBkKIZWDVNEsnvO0vUSH1ZFN+NW6
         FZhYhfiiR4G8R+MyP1/XAGD7p/9LoS9fObZ8ALCMX+b8yk9UF7PJV4Tm7eH7JkMsN3FG
         yenL882oTk6I5n76BvHVQT4ScGUnEqMX1RhalOB1XG1fWpsku4qfcShAA1dKrFaZ2/9j
         PAFDTC147NAK35axgiOt0tX0xwruDkiRv3lEp5erBgQCwBlkvMgmPFpYTfgVuqODKp4l
         8+tA==
X-Gm-Message-State: AOJu0Yy/EQL4kjo78hdw7Wz5G9PKCeLl0RjgrYBb7L9IuBaglBBN5Ekk
	nix1SMQFJlq+x292Nxb5XEmQ/RRvClbGHd/RvdaahP2TzcU7o7UEmRrqql98ciDddegWhp4715b
	x
X-Gm-Gg: ASbGncukR80rvPuMJlFgE6FRXC5t0ReS+p8B4hN1GqrV29jOCWEiWvP2wtaQqgOuvP2
	lMwkqZpmieXYYhhEOCHj1BT1WKnW9Xp5i4pOztvlNG9/njVtluUS6y5txYpSAXv63NmYEywWSwR
	ePnmpz2X4ClI0JnT2U8nU8ZTiMvxr64cvmPuVReuTHIsCacRr98sgZzhQ1pblmBamKywIXJDVbp
	ZPo+zgpzZO4YtP+Qbn5ElTMcMPHokqQqd/uR2qj6zFg/OJJUQnRLRtAv8AbOeQKpzXTF4v3os66
	4Ll/M+huuqPHy8wxc73TzYQ4HYw63mo=
X-Google-Smtp-Source: AGHT+IECb98Xkkqy62+Q7p2Drgjriyq42gI9R4uri6xqRDj25EMSJm+y28xmAHcntMRMQEfZGqJsfA==
X-Received: by 2002:a05:6000:4013:b0:38a:8784:9137 with SMTP id ffacd0b85a97d-38da4e637e4mr149177f8f.9.1738603775494;
        Mon, 03 Feb 2025 09:29:35 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c122e59sm13528122f8f.55.2025.02.03.09.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:29:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 03 Feb 2025 18:29:18 +0100
Subject: [PATCH v2 1/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG0 updated
 from driver side
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-drm-msm-phy-pll-cfg-reg-v2-1-862b136c5d22@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2063;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=qPayIg/NkA+MgAFyPivDQRmrfYR5ne0X/KrNddzzxvc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnoPz5WQwjRgNnNMv5Hfv7P6hoqwOW1ag0x8hBw
 6PQOZoOJZmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ6D8+QAKCRDBN2bmhouD
 1wRzD/4jCTIK8MbzpBxNwd/b0SIj8Csp+QLgtshMGR8U7NiBcwPDx3vo/xW8PpGfPxVpfH40Cd+
 WrN1C/pNihHURZRJhoGPIrFRFW6VBFM2znehMUfvdkHGsLVxyT6UUkpsE5RiAVGa2Y9MHSv4osR
 JadWShWRvTiSaEH9S8jqj4ZrnnIKPNpiHYTJgEVomWb0ohaduXyXsXeLa7vnfSQKIpkDHJwKGaD
 l5h64tzDYk7D/8XfNa5k/L1Rkh0Oe9TOt/t/SHkJDWkljek3IqQ4L717HFfZW8jpJWB8UBTcnA+
 KBrP6SGSP0JrM/p5DKyia58IoWMKWN6qnqPsbsJdL7tvdyGOTqrNGBN5uGMpLX9NiO7v2X4vcAe
 jV00rYtsgS91CNe9lYealqyuXgBUezMFW2rXwJRoTHyk622+JfywVaG6BKdgZrCs+w8UnDcgOie
 6d5Sn37sXVt0WbxKuqZqf2Hmqikpi+qRgOZRHqQ9KE7/XEuZ/4F3W6i27J2VX3OsYUFnhbIETcc
 IIy7t5zJimNNF0rDrRerf9cYwk001V6uR3v7+kv4NxXIvJy3ln7a0a46D1vxqUDo44/d+evkfbi
 luJ+QkmH0PojUAmCJMaFtswrsB91IrlyX4aGGiLmCVuvzoZCazYzkUr8ScBiF8Hfg9Q67ZpmBNg
 WzBkgvtEKrudStg==
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

Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 031446c87daec0af3f81df324158311f5a80014e..c164f845653816291ad96c863257f75462ef58e7 100644
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
@@ -574,8 +583,8 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
 	val |= cached->pll_out_div;
 	writel(val, pll_7nm->phy->pll_base + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
 
-	writel(cached->bit_clk_div | (cached->pix_clk_div << 4),
-	       phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
+	dsi_pll_cmn_clk_cfg0_write(pll_7nm,
+				   cached->bit_clk_div | (cached->pix_clk_div << 4));
 
 	val = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
 	val &= ~0x3;

-- 
2.43.0


