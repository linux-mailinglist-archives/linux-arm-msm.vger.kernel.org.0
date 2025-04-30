Return-Path: <linux-arm-msm+bounces-56282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 859BEAA4CD2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 15:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 876171C231E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 13:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73A33278E6B;
	Wed, 30 Apr 2025 13:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g2rRyFtf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880EC276025
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 13:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018104; cv=none; b=CDH2yGQ8YHQQcmwgbUUqeciIQX0fWgEExqOzE3S/2kkEGz38P6cDdIAz4Q6CQjBY2307rJWRJNvJS/KeK9JadTGgNa408GPTZb0aHpLpHEY7zAMYCaGhd7I2p6utQyj6KrXNPsEVrkVZnm2FWOSiqETDeWOMwy9MIlIBXOdNqH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018104; c=relaxed/simple;
	bh=L86VjcIlUPTyl97TCOA761t4ZCfvvfnN425URVF10Z8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=benFzOfKOOB1rWASHBwRr39hYIcdcm1AWw7ZYnCWdXehXOsgP7EzJ3EwCeUSeUKWcnj83ouc6t4h6mWJmXtT+R0SVg1vCjuXNVo9W0MAYW9/KLs1meV6Wzbxxj/OKnc4bVYSQTT3venKwtiUpUjdZLW0U+yxUUQ6cR413JDzRyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g2rRyFtf; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3912622c9c0so678903f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 06:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746018100; x=1746622900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LM24bDa7iOIUWC8t6uWvtQysa6eAdU5lGmeO6NndF6E=;
        b=g2rRyFtfRKLJbS7QStU3j2KJgj5ONyaqjU4mFD1Zk33M+zEHnLFUgsFTnpYH3In1ml
         MniqFLqE79NwU/7Bhw3Fj8CPQdONltFB6Y4e3mqblUwrXaNzzi5DwcEVPCy01twInQyk
         ScUsoE/o7TsHDjQu5MlJClwuu9fFDSfTYHMEjuq6w7mfr9vRyJHoItCCPPTLECxOjerE
         XerUnIlNmq1ZwRWyRllogIrX4D9QrZUesTtE/RbvhMflT9S3AtqyAc+KdSPHGL2RhImN
         6j0Rj4+t2ygRGfJM8nsmcnozlVD0DGrbUS3zhQFN0EJrfi6AyqtatPSnVehZBOB4as8r
         VWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746018100; x=1746622900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LM24bDa7iOIUWC8t6uWvtQysa6eAdU5lGmeO6NndF6E=;
        b=V/7OwFlauQMQYNkspXnPbHNoBT5qdDqOPjugzomr5gB9gro9uA71Fukb979rfYGAnb
         XrwKYnq9qLRSm31qm1u+fx3fgCyN/Lw3VYwTch82cWOTRBeq/yMI2udgqwg/kA+RGJYp
         zBX+IG1UNLOaS2wBjAawGBXRtIti7BqzmS1ZNZoZxQ+YcUYtxCxswQgyc0mQgPq3uoAu
         xBQZJgTDMPNNkovhO1SRorczGh8fcxN0au4eqJijFX6w2d2ZZD8TKoXKpJhoolxbkT52
         3TM5x5YqrUHTXRE106SG3lzDF+VqA5Ibb0sY+zNX+Y2VTMkS0nvZbZ15rzeu6K3QKdUg
         1cng==
X-Gm-Message-State: AOJu0YwYEANKhVhFa5TKuwGnooiR2UyXNQax78N4KSnUcLR7vhtrP957
	cHlUs0reb60TnEbD+dfbIGdSsallgDhtIwpt+lqlEpO4zYM3UIoY7CrTAZH2RUM=
X-Gm-Gg: ASbGncs7eRpvY+r09dgH2/oFSAGbe1vKFcPdXQBT3f8HYhfO8IkN5IbEVVV+ieFEuoI
	1pFIrpHuaAdd0/PSKlFPJ/eMyH8i5Z1d6Z9890pz1SUnsZLy5S3pZVBGVCgh8o6jLZ9N/0SQP9V
	qXECtENu94UNf7KL/I90O9SwG382hDMrIu0IUHgiN83RMwRmmW+NdDSsLo1LNiz1nlHAPcXqQwm
	p1IjxKt47Gw8XAe2PxOlzgYSpJ/fdCpbftVn0m/EhAAmGjCS2x0aDWEkSxZxK4yGBze/Bg2sUK8
	S5osTwLnCB3v9jkXScKj2jow0TzmBpYNLfcrDKEcjDqxS2ZKQ6nteyrJJvg=
X-Google-Smtp-Source: AGHT+IH2rx1fg5ZTesnYB4q5L+He7XJ7RQcIFWsPkQJFXNtvB4sLm4M+PRGEinPbyqmKhH7WkFGF+w==
X-Received: by 2002:a05:6000:1866:b0:3a0:86f3:451f with SMTP id ffacd0b85a97d-3a09007e244mr807662f8f.12.1746018099714;
        Wed, 30 Apr 2025 06:01:39 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 06:01:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:45 +0200
Subject: [PATCH v5 15/24] drm/msm/dsi/phy: Define PHY_CMN_CTRL_0 bitfields
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-15-8cab30c3e4df@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
In-Reply-To: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3289;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=L86VjcIlUPTyl97TCOA761t4ZCfvvfnN425URVF10Z8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh8Eee70M6ToABe2+KYQGOXv5I4i/QOKutTAF
 yXMi2zVij6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIfBAAKCRDBN2bmhouD
 18ftD/9GVp0+K2BUhEAuJSjzH08czgrFiefIuIU9QfHPr0uuOIXnmo1kDKgRguApHvgda6Y/TzO
 Jn7PCWEIi85lWH7E9ds8xcPZIPazI7gt/PbL6ABOWGuCIzQT59kVXptV/T3FR9sxEUR1rmk4HUJ
 mSJZySn+JMaNTYdning2aZOzbXWiRyax2lI/JluLLnIJBHjbQ1CNJcMLJPTQp2YCRSL3QRcJVfI
 NdMLtKFQa9WrgiKQPp9hG8Kp77G5l9p+0XqzHIb9GD5W6qqRkIcpcK+en3+7i0aQj+8YS7IBWdV
 gWgnE1QR8aAaYGK/WNwHpoHPxCg919ZFCqnONVefIyZHg8ej/mtPq2MH6XCO9FjY0HWz/QCIRa7
 v1FFgurhyJr8D6GQOJaPV6cntq9mysnZ9Zb8uOhoCL4HHHArsC9bSHM6rsvASQNDlR6CYzcm73P
 PHtm6DNs0Zxlco+ZrjlcaNNkkITKMkrX7FSZvgveNbZbnRopyGJ1bKGyWN3w0SaTkyojaEDGrPN
 PSVhfQxSUQ0KSkBULD5WFoBGqb9aTyQNmrwjhuMpOyh9eKSJTKWoXtW8gPhRLg3XWxytV+uRZRB
 X3JjoRw5w4wJJaNkxFKRfs4zxDGa6ItIhiLG4eN9/93r68mz9gEdktL86sn5U1C2MBoZyvm2W7r
 KveHdE0KJGAkwzA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add bitfields for PHY_CMN_CTRL_0 registers to avoid hard-coding bit
masks and shifts and make the code a bit more readable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v5:
1. New patch
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             |  9 ++++++---
 drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml | 11 ++++++++++-
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index ca1a120f630a3650bf6d9f9d426cccea88c22e7f..7ef0aa7ff41b7d10d2630405c3d2f541957f19ea 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -362,17 +362,19 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
 static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
 {
 	u32 data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
+	data &= ~DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
 
 	writel(0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
-	writel(data & ~BIT(5), pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
+	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 	ndelay(250);
 }
 
 static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
 {
 	u32 data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
+	data |= DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
+	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 
-	writel(data | BIT(5), pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 	writel(0xc0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
 	ndelay(250);
 }
@@ -996,7 +998,8 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 	}
 
 	/* de-assert digital and pll power down */
-	data = BIT(6) | BIT(5);
+	data = DSI_7nm_PHY_CMN_CTRL_0_DIGTOP_PWRDN_B |
+	       DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
 	writel(data, base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 
 	/* Assert PLL core reset */
diff --git a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
index d2c8c46bb04159da6e539bfe80a4b5dc9ffdf367..d49122b88d14896ef3e87b783a1691f85b61aa9c 100644
--- a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
+++ b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
@@ -22,7 +22,16 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x00018" name="GLBL_CTRL"/>
 	<reg32 offset="0x0001c" name="RBUF_CTRL"/>
 	<reg32 offset="0x00020" name="VREG_CTRL_0"/>
-	<reg32 offset="0x00024" name="CTRL_0"/>
+	<reg32 offset="0x00024" name="CTRL_0">
+		<bitfield name="CLKSL_SHUTDOWNB" pos="7" type="boolean"/>
+		<bitfield name="DIGTOP_PWRDN_B" pos="6" type="boolean"/>
+		<bitfield name="PLL_SHUTDOWNB" pos="5" type="boolean"/>
+		<bitfield name="DLN3_SHUTDOWNB" pos="4" type="boolean"/>
+		<bitfield name="DLN2_SHUTDOWNB" pos="3" type="boolean"/>
+		<bitfield name="CLK_SHUTDOWNB" pos="2" type="boolean"/>
+		<bitfield name="DLN1_SHUTDOWNB" pos="1" type="boolean"/>
+		<bitfield name="DLN0_SHUTDOWNB" pos="0" type="boolean"/>
+	</reg32>
 	<reg32 offset="0x00028" name="CTRL_1"/>
 	<reg32 offset="0x0002c" name="CTRL_2"/>
 	<reg32 offset="0x00030" name="CTRL_3"/>

-- 
2.45.2


