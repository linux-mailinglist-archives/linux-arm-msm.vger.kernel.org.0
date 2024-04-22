Return-Path: <linux-arm-msm+bounces-18212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 742F88AD75A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 00:37:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7936E1C219A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 22:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D63D374F7;
	Mon, 22 Apr 2024 22:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UIQPADv5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD9129416
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Apr 2024 22:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713825441; cv=none; b=nsg5p/EBKIyLIfJx3DUBsAUwYsDemZTyGiohDnA5sctTWAqQqPgEjsLu/7oYak/EZEzY4mXZHECfdAnTQPx9kTw0rtpYAG0kAhyZCLYI4YbmUpjKTI1yjwLvesFVFCZ7y9Wb2UCnrf1EwJcp/90vw7/Yd2Orh1luT9aOFz9mDkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713825441; c=relaxed/simple;
	bh=r44CN+ESjmYktPaczYpD0+pSSkOdxrCr0U/bsMu2p78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MUN2+QAic1y4HSXsM4Asr/UxsxTYFKT2muS/+l/30Tt+Pw7HXt9TSxnE8toezE/5aLhqJUzE9oUFnFzIdKqbyRhtNmwjbcRyX82iq6nKkPNM9tNQ5uzTZSE5D+NCKhn0ZjAbOXMXATZ6l2GQrCk8B/LbvKibQpQKyc4YTHCcIEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UIQPADv5; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-51ab47ce811so4679765e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Apr 2024 15:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713825434; x=1714430234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1psqzR1FIFL0yrKv5AWqgD2Hj1JRQaPdQ5A3gMMZVLg=;
        b=UIQPADv5vwQyw3G0LgUJGiByty4Ajp+LN0vWXq/As252YnD3LRBcgvgnpn90m23BLo
         YRaxc69hN9bCNdVvYbII/FCeWbDleekXj6wDi3dWqetoYMVh+ZISLefSdrodMW2R3BZM
         H5FK6pmY9Ce6VTWyVxKlEuVysu12A8Ug6pkCwv5SSgemn/xNSIRUmIQiFKXybA4haY2K
         kRD3sknpL/0KTJaRGcZTUvH/6naRfAhJPuzXRJeZ059d+xTcLp6A0F+nKaDrsznkQczW
         rFE4Y3ePl8SlvRPsE8nEjaeGBmd0gZMf3W6XQAD1EQH8eUxJf6wkcdvN9W90ghTPcRiN
         iZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713825434; x=1714430234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1psqzR1FIFL0yrKv5AWqgD2Hj1JRQaPdQ5A3gMMZVLg=;
        b=Y34X33XuWTJlgzUhsBdvu+2v/t7wcgkOIZ2NDJyTbRImxyuToeZNXf4+6qJujoiwGm
         9IgDOBNseZJeBv90I+F9CdmAdZtcIdowvY5EfInBEWZp0ASmpiz/TTk3KpeMXfjbfL6h
         P2JKpezLowdccOMbgsLCQ1a2nEXh7O/YciylcCkSQ4Fft2nJ63IePYnU3KoO+wpDmMMT
         LHo1TbKqR0oCCwtiwQjJTFC6DxFow/xHO2b5aPBQL6hka+UzvSVih5as68LZGCQ6zg1h
         gjO8kjYmwn1AlhVgD9G1JxDkLWVSpZXOiD5qtlDauQWpgKJ6uMsr5NN2ybkl+YL9K3z6
         iSGA==
X-Gm-Message-State: AOJu0Yztb3JkwSVnCKqa8llCKsf5r5TfBegGXKXTIaZclKTRVOEasSHV
	4gw/HXB7T3Bxef4PGKAy3VSv5YHdLWzilL2lsd6OwY7dy2BR7HDXhvaaMHYbZEbBwymrONSUHBx
	/
X-Google-Smtp-Source: AGHT+IGSRRJfd1Nn78H82uolwWrO8OHsX+K5kdh3bPTAFpwibFeyRJLK+Y/0pvlbNW1ht1SS1iFGng==
X-Received: by 2002:a05:6512:208e:b0:51a:c28e:e52 with SMTP id t14-20020a056512208e00b0051ac28e0e52mr6187742lfr.46.1713825432385;
        Mon, 22 Apr 2024 15:37:12 -0700 (PDT)
Received: from [127.0.1.1] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id r3-20020ac25f83000000b00513c4e41140sm1841271lfe.204.2024.04.22.15.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 15:37:11 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 23 Apr 2024 00:36:59 +0200
Subject: [PATCH 1/2] drm/msm/dsi: Remove dsi_phy_read/write()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240423-topic-msm_cleanup-v1-1-b30f39f43b90@linaro.org>
References: <20240423-topic-msm_cleanup-v1-0-b30f39f43b90@linaro.org>
In-Reply-To: <20240423-topic-msm_cleanup-v1-0-b30f39f43b90@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14-dev

These are dummy wrappers that do literally nothing interesting.
Remove them.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h           |   2 -
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      | 273 +++++++++-----------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      | 215 ++++++++--------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c      | 109 ++++----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      | 224 ++++++++---------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 205 +++++++--------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       | 320 ++++++++++++------------
 7 files changed, 645 insertions(+), 703 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 5a5dc3faa971..7df4d852e6fa 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -12,8 +12,6 @@
 
 #include "dsi.h"
 
-#define dsi_phy_read(offset) readl((offset))
-#define dsi_phy_write(offset, data) writel((data), (offset))
 #define dsi_phy_write_udelay(offset, data, delay_us) { writel((data), (offset)); udelay(delay_us); }
 #define dsi_phy_write_ndelay(offset, data, delay_ns) { writel((data), (offset)); ndelay(delay_ns); }
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 27b592c776a3..677c62571811 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -187,20 +187,20 @@ static void dsi_pll_ssc_commit(struct dsi_pll_10nm *pll, struct dsi_pll_config *
 	if (config->enable_ssc) {
 		pr_debug("SSC is enabled\n");
 
-		dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_SSC_STEPSIZE_LOW_1,
-			      config->ssc_stepsize & 0xff);
-		dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_SSC_STEPSIZE_HIGH_1,
-			      config->ssc_stepsize >> 8);
-		dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_SSC_DIV_PER_LOW_1,
-			      config->ssc_div_per & 0xff);
-		dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_SSC_DIV_PER_HIGH_1,
-			      config->ssc_div_per >> 8);
-		dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_SSC_DIV_ADJPER_LOW_1,
-			      config->ssc_adj_per & 0xff);
-		dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_SSC_DIV_ADJPER_HIGH_1,
-			      config->ssc_adj_per >> 8);
-		dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_SSC_CONTROL,
-			      SSC_EN | (config->ssc_center ? SSC_CENTER : 0));
+		writel(config->ssc_stepsize & 0xff,
+		       base + REG_DSI_10nm_PHY_PLL_SSC_STEPSIZE_LOW_1);
+		writel(config->ssc_stepsize >> 8,
+		       base + REG_DSI_10nm_PHY_PLL_SSC_STEPSIZE_HIGH_1);
+		writel(config->ssc_div_per & 0xff,
+		       base + REG_DSI_10nm_PHY_PLL_SSC_DIV_PER_LOW_1);
+		writel(config->ssc_div_per >> 8,
+		       base + REG_DSI_10nm_PHY_PLL_SSC_DIV_PER_HIGH_1);
+		writel(config->ssc_adj_per & 0xff,
+		       base + REG_DSI_10nm_PHY_PLL_SSC_DIV_ADJPER_LOW_1);
+		writel(config->ssc_adj_per >> 8,
+		       base + REG_DSI_10nm_PHY_PLL_SSC_DIV_ADJPER_HIGH_1);
+		writel(SSC_EN | (config->ssc_center ? SSC_CENTER : 0),
+		       base + REG_DSI_10nm_PHY_PLL_SSC_CONTROL);
 	}
 }
 
@@ -208,49 +208,43 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_10nm *pll)
 {
 	void __iomem *base = pll->phy->pll_base;
 
-	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_ONE, 0x80);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_TWO, 0x03);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_THREE, 0x00);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_DSM_DIVIDER, 0x00);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_FEEDBACK_DIVIDER, 0x4e);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_CALIBRATION_SETTINGS, 0x40);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_BAND_SEL_CAL_SETTINGS_THREE,
-		      0xba);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_FREQ_DETECT_SETTINGS_ONE,
-		      0x0c);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_OUTDIV, 0x00);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_CORE_OVERRIDE, 0x00);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_PLL_DIGITAL_TIMERS_TWO,
-		      0x08);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_PLL_PROP_GAIN_RATE_1, 0x08);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_PLL_BAND_SET_RATE_1, 0xc0);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_PLL_INT_GAIN_IFILT_BAND_1,
-		      0xfa);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_PLL_FL_INT_GAIN_PFILT_BAND_1,
-		      0x4c);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_PLL_LOCK_OVERRIDE, 0x80);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_PFILT, 0x29);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_IFILT, 0x3f);
+	writel(0x80, base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_ONE);
+	writel(0x03, base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_TWO);
+	writel(0x00, base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_THREE);
+	writel(0x00, base + REG_DSI_10nm_PHY_PLL_DSM_DIVIDER);
+	writel(0x4e, base + REG_DSI_10nm_PHY_PLL_FEEDBACK_DIVIDER);
+	writel(0x40, base + REG_DSI_10nm_PHY_PLL_CALIBRATION_SETTINGS);
+	writel(0xba, base + REG_DSI_10nm_PHY_PLL_BAND_SEL_CAL_SETTINGS_THREE);
+	writel(0x0c, base + REG_DSI_10nm_PHY_PLL_FREQ_DETECT_SETTINGS_ONE);
+	writel(0x00, base + REG_DSI_10nm_PHY_PLL_OUTDIV);
+	writel(0x00, base + REG_DSI_10nm_PHY_PLL_CORE_OVERRIDE);
+	writel(0x08, base + REG_DSI_10nm_PHY_PLL_PLL_DIGITAL_TIMERS_TWO);
+	writel(0x08, base + REG_DSI_10nm_PHY_PLL_PLL_PROP_GAIN_RATE_1);
+	writel(0xc0, base + REG_DSI_10nm_PHY_PLL_PLL_BAND_SET_RATE_1);
+	writel(0xfa, base + REG_DSI_10nm_PHY_PLL_PLL_INT_GAIN_IFILT_BAND_1);
+	writel(0x4c, base + REG_DSI_10nm_PHY_PLL_PLL_FL_INT_GAIN_PFILT_BAND_1);
+	writel(0x80, base + REG_DSI_10nm_PHY_PLL_PLL_LOCK_OVERRIDE);
+	writel(0x29, base + REG_DSI_10nm_PHY_PLL_PFILT);
+	writel(0x3f, base + REG_DSI_10nm_PHY_PLL_IFILT);
 }
 
 static void dsi_pll_commit(struct dsi_pll_10nm *pll, struct dsi_pll_config *config)
 {
 	void __iomem *base = pll->phy->pll_base;
 
-	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_CORE_INPUT_OVERRIDE, 0x12);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_DECIMAL_DIV_START_1,
-		      config->decimal_div_start);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_LOW_1,
-		      config->frac_div_start & 0xff);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_MID_1,
-		      (config->frac_div_start & 0xff00) >> 8);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_HIGH_1,
-		      (config->frac_div_start & 0x30000) >> 16);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_PLL_LOCKDET_RATE_1, 64);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_PLL_LOCK_DELAY, 0x06);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_CMODE, 0x10);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_PLL_CLOCK_INVERTERS,
-		      config->pll_clock_inverters);
+	writel(0x12, base + REG_DSI_10nm_PHY_PLL_CORE_INPUT_OVERRIDE);
+	writel(config->decimal_div_start,
+	       base + REG_DSI_10nm_PHY_PLL_DECIMAL_DIV_START_1);
+	writel(config->frac_div_start & 0xff,
+	       base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_LOW_1);
+	writel((config->frac_div_start & 0xff00) >> 8,
+	       base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_MID_1);
+	writel((config->frac_div_start & 0x30000) >> 16,
+	       base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_HIGH_1);
+	writel(64, base + REG_DSI_10nm_PHY_PLL_PLL_LOCKDET_RATE_1);
+	writel(0x06, base + REG_DSI_10nm_PHY_PLL_PLL_LOCK_DELAY);
+	writel(0x10, base + REG_DSI_10nm_PHY_PLL_CMODE);
+	writel(config->pll_clock_inverters, base + REG_DSI_10nm_PHY_PLL_CLOCK_INVERTERS);
 }
 
 static int dsi_pll_10nm_vco_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -305,21 +299,19 @@ static int dsi_pll_10nm_lock_status(struct dsi_pll_10nm *pll)
 
 static void dsi_pll_disable_pll_bias(struct dsi_pll_10nm *pll)
 {
-	u32 data = dsi_phy_read(pll->phy->base + REG_DSI_10nm_PHY_CMN_CTRL_0);
+	u32 data = readl(pll->phy->base + REG_DSI_10nm_PHY_CMN_CTRL_0);
 
-	dsi_phy_write(pll->phy->pll_base + REG_DSI_10nm_PHY_PLL_SYSTEM_MUXES, 0);
-	dsi_phy_write(pll->phy->base + REG_DSI_10nm_PHY_CMN_CTRL_0,
-		      data & ~BIT(5));
+	writel(0, pll->phy->pll_base + REG_DSI_10nm_PHY_PLL_SYSTEM_MUXES);
+	writel(data & ~BIT(5), pll->phy->base + REG_DSI_10nm_PHY_CMN_CTRL_0);
 	ndelay(250);
 }
 
 static void dsi_pll_enable_pll_bias(struct dsi_pll_10nm *pll)
 {
-	u32 data = dsi_phy_read(pll->phy->base + REG_DSI_10nm_PHY_CMN_CTRL_0);
+	u32 data = readl(pll->phy->base + REG_DSI_10nm_PHY_CMN_CTRL_0);
 
-	dsi_phy_write(pll->phy->base + REG_DSI_10nm_PHY_CMN_CTRL_0,
-		      data | BIT(5));
-	dsi_phy_write(pll->phy->pll_base + REG_DSI_10nm_PHY_PLL_SYSTEM_MUXES, 0xc0);
+	writel(data | BIT(5), pll->phy->base + REG_DSI_10nm_PHY_CMN_CTRL_0);
+	writel(0xc0, pll->phy->pll_base + REG_DSI_10nm_PHY_PLL_SYSTEM_MUXES);
 	ndelay(250);
 }
 
@@ -327,18 +319,16 @@ static void dsi_pll_disable_global_clk(struct dsi_pll_10nm *pll)
 {
 	u32 data;
 
-	data = dsi_phy_read(pll->phy->base + REG_DSI_10nm_PHY_CMN_CLK_CFG1);
-	dsi_phy_write(pll->phy->base + REG_DSI_10nm_PHY_CMN_CLK_CFG1,
-		      data & ~BIT(5));
+	data = readl(pll->phy->base + REG_DSI_10nm_PHY_CMN_CLK_CFG1);
+	writel(data & ~BIT(5), pll->phy->base + REG_DSI_10nm_PHY_CMN_CLK_CFG1);
 }
 
 static void dsi_pll_enable_global_clk(struct dsi_pll_10nm *pll)
 {
 	u32 data;
 
-	data = dsi_phy_read(pll->phy->base + REG_DSI_10nm_PHY_CMN_CLK_CFG1);
-	dsi_phy_write(pll->phy->base + REG_DSI_10nm_PHY_CMN_CLK_CFG1,
-		      data | BIT(5));
+	data = readl(pll->phy->base + REG_DSI_10nm_PHY_CMN_CLK_CFG1);
+	writel(data | BIT(5), pll->phy->base + REG_DSI_10nm_PHY_CMN_CLK_CFG1);
 }
 
 static int dsi_pll_10nm_vco_prepare(struct clk_hw *hw)
@@ -358,8 +348,7 @@ static int dsi_pll_10nm_vco_prepare(struct clk_hw *hw)
 	}
 
 	/* Start PLL */
-	dsi_phy_write(pll_10nm->phy->base + REG_DSI_10nm_PHY_CMN_PLL_CNTRL,
-		      0x01);
+	writel(0x01, pll_10nm->phy->base + REG_DSI_10nm_PHY_CMN_PLL_CNTRL);
 
 	/*
 	 * ensure all PLL configurations are written prior to checking
@@ -380,11 +369,9 @@ static int dsi_pll_10nm_vco_prepare(struct clk_hw *hw)
 	if (pll_10nm->slave)
 		dsi_pll_enable_global_clk(pll_10nm->slave);
 
-	dsi_phy_write(pll_10nm->phy->base + REG_DSI_10nm_PHY_CMN_RBUF_CTRL,
-		      0x01);
+	writel(0x01, pll_10nm->phy->base + REG_DSI_10nm_PHY_CMN_RBUF_CTRL);
 	if (pll_10nm->slave)
-		dsi_phy_write(pll_10nm->slave->phy->base +
-			      REG_DSI_10nm_PHY_CMN_RBUF_CTRL, 0x01);
+		writel(0x01, pll_10nm->slave->phy->base + REG_DSI_10nm_PHY_CMN_RBUF_CTRL);
 
 error:
 	return rc;
@@ -392,7 +379,7 @@ static int dsi_pll_10nm_vco_prepare(struct clk_hw *hw)
 
 static void dsi_pll_disable_sub(struct dsi_pll_10nm *pll)
 {
-	dsi_phy_write(pll->phy->base + REG_DSI_10nm_PHY_CMN_RBUF_CTRL, 0);
+	writel(0, pll->phy->base + REG_DSI_10nm_PHY_CMN_RBUF_CTRL);
 	dsi_pll_disable_pll_bias(pll);
 }
 
@@ -406,7 +393,7 @@ static void dsi_pll_10nm_vco_unprepare(struct clk_hw *hw)
 	 * powering down the PLL
 	 */
 	dsi_pll_disable_global_clk(pll_10nm);
-	dsi_phy_write(pll_10nm->phy->base + REG_DSI_10nm_PHY_CMN_PLL_CNTRL, 0);
+	writel(0, pll_10nm->phy->base + REG_DSI_10nm_PHY_CMN_PLL_CNTRL);
 	dsi_pll_disable_sub(pll_10nm);
 	if (pll_10nm->slave) {
 		dsi_pll_disable_global_clk(pll_10nm->slave);
@@ -429,13 +416,13 @@ static unsigned long dsi_pll_10nm_vco_recalc_rate(struct clk_hw *hw,
 	u32 dec;
 	u64 pll_freq, tmp64;
 
-	dec = dsi_phy_read(base + REG_DSI_10nm_PHY_PLL_DECIMAL_DIV_START_1);
+	dec = readl(base + REG_DSI_10nm_PHY_PLL_DECIMAL_DIV_START_1);
 	dec &= 0xff;
 
-	frac = dsi_phy_read(base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_LOW_1);
-	frac |= ((dsi_phy_read(base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_MID_1) &
+	frac = readl(base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_LOW_1);
+	frac |= ((readl(base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_MID_1) &
 		  0xff) << 8);
-	frac |= ((dsi_phy_read(base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_HIGH_1) &
+	frac |= ((readl(base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_HIGH_1) &
 		  0x3) << 16);
 
 	/*
@@ -488,15 +475,15 @@ static void dsi_10nm_pll_save_state(struct msm_dsi_phy *phy)
 	void __iomem *phy_base = pll_10nm->phy->base;
 	u32 cmn_clk_cfg0, cmn_clk_cfg1;
 
-	cached->pll_out_div = dsi_phy_read(pll_10nm->phy->pll_base +
+	cached->pll_out_div = readl(pll_10nm->phy->pll_base +
 			REG_DSI_10nm_PHY_PLL_PLL_OUTDIV_RATE);
 	cached->pll_out_div &= 0x3;
 
-	cmn_clk_cfg0 = dsi_phy_read(phy_base + REG_DSI_10nm_PHY_CMN_CLK_CFG0);
+	cmn_clk_cfg0 = readl(phy_base + REG_DSI_10nm_PHY_CMN_CLK_CFG0);
 	cached->bit_clk_div = cmn_clk_cfg0 & 0xf;
 	cached->pix_clk_div = (cmn_clk_cfg0 & 0xf0) >> 4;
 
-	cmn_clk_cfg1 = dsi_phy_read(phy_base + REG_DSI_10nm_PHY_CMN_CLK_CFG1);
+	cmn_clk_cfg1 = readl(phy_base + REG_DSI_10nm_PHY_CMN_CLK_CFG1);
 	cached->pll_mux = cmn_clk_cfg1 & 0x3;
 
 	DBG("DSI PLL%d outdiv %x bit_clk_div %x pix_clk_div %x pll_mux %x",
@@ -512,18 +499,18 @@ static int dsi_10nm_pll_restore_state(struct msm_dsi_phy *phy)
 	u32 val;
 	int ret;
 
-	val = dsi_phy_read(pll_10nm->phy->pll_base + REG_DSI_10nm_PHY_PLL_PLL_OUTDIV_RATE);
+	val = readl(pll_10nm->phy->pll_base + REG_DSI_10nm_PHY_PLL_PLL_OUTDIV_RATE);
 	val &= ~0x3;
 	val |= cached->pll_out_div;
-	dsi_phy_write(pll_10nm->phy->pll_base + REG_DSI_10nm_PHY_PLL_PLL_OUTDIV_RATE, val);
+	writel(val, pll_10nm->phy->pll_base + REG_DSI_10nm_PHY_PLL_PLL_OUTDIV_RATE);
 
-	dsi_phy_write(phy_base + REG_DSI_10nm_PHY_CMN_CLK_CFG0,
-		      cached->bit_clk_div | (cached->pix_clk_div << 4));
+	writel(cached->bit_clk_div | (cached->pix_clk_div << 4),
+	       phy_base + REG_DSI_10nm_PHY_CMN_CLK_CFG0);
 
-	val = dsi_phy_read(phy_base + REG_DSI_10nm_PHY_CMN_CLK_CFG1);
+	val = readl(phy_base + REG_DSI_10nm_PHY_CMN_CLK_CFG1);
 	val &= ~0x3;
 	val |= cached->pll_mux;
-	dsi_phy_write(phy_base + REG_DSI_10nm_PHY_CMN_CLK_CFG1, val);
+	writel(val, phy_base + REG_DSI_10nm_PHY_CMN_CLK_CFG1);
 
 	ret = dsi_pll_10nm_vco_set_rate(phy->vco_hw,
 			pll_10nm->vco_current_rate,
@@ -561,7 +548,7 @@ static int dsi_10nm_set_usecase(struct msm_dsi_phy *phy)
 	}
 
 	/* set PLL src */
-	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_CLK_CFG1, (data << 2));
+	writel(data << 2, base + REG_DSI_10nm_PHY_CMN_CLK_CFG1);
 
 	return 0;
 }
@@ -724,7 +711,7 @@ static int dsi_phy_hw_v3_0_is_pll_on(struct msm_dsi_phy *phy)
 	void __iomem *base = phy->base;
 	u32 data = 0;
 
-	data = dsi_phy_read(base + REG_DSI_10nm_PHY_CMN_PLL_CNTRL);
+	data = readl(base + REG_DSI_10nm_PHY_CMN_PLL_CNTRL);
 	mb(); /* make sure read happened */
 
 	return (data & BIT(0));
@@ -740,11 +727,9 @@ static void dsi_phy_hw_v3_0_config_lpcdrx(struct msm_dsi_phy *phy, bool enable)
 	 * corresponding to the logical data lane 0
 	 */
 	if (enable)
-		dsi_phy_write(lane_base +
-			      REG_DSI_10nm_PHY_LN_LPRX_CTRL(phy_lane_0), 0x3);
+		writel(0x3, lane_base + REG_DSI_10nm_PHY_LN_LPRX_CTRL(phy_lane_0));
 	else
-		dsi_phy_write(lane_base +
-			      REG_DSI_10nm_PHY_LN_LPRX_CTRL(phy_lane_0), 0);
+		writel(0, lane_base + REG_DSI_10nm_PHY_LN_LPRX_CTRL(phy_lane_0));
 }
 
 static void dsi_phy_hw_v3_0_lane_settings(struct msm_dsi_phy *phy)
@@ -759,43 +744,40 @@ static void dsi_phy_hw_v3_0_lane_settings(struct msm_dsi_phy *phy)
 
 	/* Strength ctrl settings */
 	for (i = 0; i < 5; i++) {
-		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_LPTX_STR_CTRL(i),
-			      0x55);
+		writel(0x55, lane_base + REG_DSI_10nm_PHY_LN_LPTX_STR_CTRL(i));
 		/*
 		 * Disable LPRX and CDRX for all lanes. And later on, it will
 		 * be only enabled for the physical data lane corresponding
 		 * to the logical data lane 0
 		 */
-		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_LPRX_CTRL(i), 0);
-		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_PIN_SWAP(i), 0x0);
-		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_HSTX_STR_CTRL(i),
-			      0x88);
+		writel(0, lane_base + REG_DSI_10nm_PHY_LN_LPRX_CTRL(i));
+		writel(0x0, lane_base + REG_DSI_10nm_PHY_LN_PIN_SWAP(i));
+		writel(0x88, lane_base + REG_DSI_10nm_PHY_LN_HSTX_STR_CTRL(i));
 	}
 
 	dsi_phy_hw_v3_0_config_lpcdrx(phy, true);
 
 	/* other settings */
 	for (i = 0; i < 5; i++) {
-		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_CFG0(i), 0x0);
-		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_CFG1(i), 0x0);
-		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_CFG2(i), 0x0);
-		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_CFG3(i),
-			      i == 4 ? 0x80 : 0x0);
+		writel(0, lane_base + REG_DSI_10nm_PHY_LN_CFG0(i));
+		writel(0, lane_base + REG_DSI_10nm_PHY_LN_CFG1(i));
+		writel(0, lane_base + REG_DSI_10nm_PHY_LN_CFG2(i));
+		writel(i == 4 ? 0x80 : 0x0, lane_base + REG_DSI_10nm_PHY_LN_CFG3(i));
 
 		/* platform specific dsi phy drive strength adjustment */
-		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_OFFSET_TOP_CTRL(i),
-				tuning_cfg->rescode_offset_top[i]);
-		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_OFFSET_BOT_CTRL(i),
-				tuning_cfg->rescode_offset_bot[i]);
+		writel(tuning_cfg->rescode_offset_top[i],
+		       lane_base + REG_DSI_10nm_PHY_LN_OFFSET_TOP_CTRL(i));
+		writel(tuning_cfg->rescode_offset_bot[i],
+		       lane_base + REG_DSI_10nm_PHY_LN_OFFSET_BOT_CTRL(i));
 
-		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_TX_DCTRL(i),
-			      tx_dctrl[i]);
+		writel(tx_dctrl[i],
+		       lane_base + REG_DSI_10nm_PHY_LN_TX_DCTRL(i));
 	}
 
 	if (!(phy->cfg->quirks & DSI_PHY_10NM_QUIRK_OLD_TIMINGS)) {
 		/* Toggle BIT 0 to release freeze I/0 */
-		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_TX_DCTRL(3), 0x05);
-		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_TX_DCTRL(3), 0x04);
+		writel(0x05, lane_base + REG_DSI_10nm_PHY_LN_TX_DCTRL(3));
+		writel(0x04, lane_base + REG_DSI_10nm_PHY_LN_TX_DCTRL(3));
 	}
 }
 
@@ -833,64 +815,51 @@ static int dsi_10nm_phy_enable(struct msm_dsi_phy *phy,
 
 	/* de-assert digital and pll power down */
 	data = BIT(6) | BIT(5);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_CTRL_0, data);
+	writel(data, base + REG_DSI_10nm_PHY_CMN_CTRL_0);
 
 	/* Assert PLL core reset */
-	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_PLL_CNTRL, 0x00);
+	writel(0x00, base + REG_DSI_10nm_PHY_CMN_PLL_CNTRL);
 
 	/* turn off resync FIFO */
-	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_RBUF_CTRL, 0x00);
+	writel(0x00, base + REG_DSI_10nm_PHY_CMN_RBUF_CTRL);
 
 	/* Select MS1 byte-clk */
-	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_GLBL_CTRL, 0x10);
+	writel(0x10, base + REG_DSI_10nm_PHY_CMN_GLBL_CTRL);
 
 	/* Enable LDO with platform specific drive level/amplitude adjustment */
-	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_VREG_CTRL,
-		      tuning_cfg->vreg_ctrl);
+	writel(tuning_cfg->vreg_ctrl, base + REG_DSI_10nm_PHY_CMN_VREG_CTRL);
 
 	/* Configure PHY lane swap (TODO: we need to calculate this) */
-	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_LANE_CFG0, 0x21);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_LANE_CFG1, 0x84);
+	writel(0x21, base + REG_DSI_10nm_PHY_CMN_LANE_CFG0);
+	writel(0x84, base + REG_DSI_10nm_PHY_CMN_LANE_CFG1);
 
 	/* DSI PHY timings */
-	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_TIMING_CTRL_0,
-		      timing->hs_halfbyte_en);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_TIMING_CTRL_1,
-		      timing->clk_zero);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_TIMING_CTRL_2,
-		      timing->clk_prepare);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_TIMING_CTRL_3,
-		      timing->clk_trail);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_TIMING_CTRL_4,
-		      timing->hs_exit);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_TIMING_CTRL_5,
-		      timing->hs_zero);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_TIMING_CTRL_6,
-		      timing->hs_prepare);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_TIMING_CTRL_7,
-		      timing->hs_trail);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_TIMING_CTRL_8,
-		      timing->hs_rqst);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_TIMING_CTRL_9,
-		      timing->ta_go | (timing->ta_sure << 3));
-	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_TIMING_CTRL_10,
-		      timing->ta_get);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_TIMING_CTRL_11,
-		      0x00);
+	writel(timing->hs_halfbyte_en, base + REG_DSI_10nm_PHY_CMN_TIMING_CTRL_0);
+	writel(timing->clk_zero, base + REG_DSI_10nm_PHY_CMN_TIMING_CTRL_1);
+	writel(timing->clk_prepare, base + REG_DSI_10nm_PHY_CMN_TIMING_CTRL_2);
+	writel(timing->clk_trail, base + REG_DSI_10nm_PHY_CMN_TIMING_CTRL_3);
+	writel(timing->hs_exit, base + REG_DSI_10nm_PHY_CMN_TIMING_CTRL_4);
+	writel(timing->hs_zero, base + REG_DSI_10nm_PHY_CMN_TIMING_CTRL_5);
+	writel(timing->hs_prepare, base + REG_DSI_10nm_PHY_CMN_TIMING_CTRL_6);
+	writel(timing->hs_trail, base + REG_DSI_10nm_PHY_CMN_TIMING_CTRL_7);
+	writel(timing->hs_rqst, base + REG_DSI_10nm_PHY_CMN_TIMING_CTRL_8);
+	writel(timing->ta_go | (timing->ta_sure << 3), base + REG_DSI_10nm_PHY_CMN_TIMING_CTRL_9);
+	writel(timing->ta_get, base + REG_DSI_10nm_PHY_CMN_TIMING_CTRL_10);
+	writel(0x00, base + REG_DSI_10nm_PHY_CMN_TIMING_CTRL_11);
 
 	/* Remove power down from all blocks */
-	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_CTRL_0, 0x7f);
+	writel(0x7f, base + REG_DSI_10nm_PHY_CMN_CTRL_0);
 
 	/* power up lanes */
-	data = dsi_phy_read(base + REG_DSI_10nm_PHY_CMN_CTRL_0);
+	data = readl(base + REG_DSI_10nm_PHY_CMN_CTRL_0);
 
 	/* TODO: only power up lanes that are used */
 	data |= 0x1F;
-	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_CTRL_0, data);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_LANE_CTRL0, 0x1F);
+	writel(data, base + REG_DSI_10nm_PHY_CMN_CTRL_0);
+	writel(0x1F, base + REG_DSI_10nm_PHY_CMN_LANE_CTRL0);
 
 	/* Select full-rate mode */
-	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_CTRL_2, 0x40);
+	writel(0x40, base + REG_DSI_10nm_PHY_CMN_CTRL_2);
 
 	ret = dsi_10nm_set_usecase(phy);
 	if (ret) {
@@ -918,15 +887,15 @@ static void dsi_10nm_phy_disable(struct msm_dsi_phy *phy)
 		pr_warn("Turning OFF PHY while PLL is on\n");
 
 	dsi_phy_hw_v3_0_config_lpcdrx(phy, false);
-	data = dsi_phy_read(base + REG_DSI_10nm_PHY_CMN_CTRL_0);
+	data = readl(base + REG_DSI_10nm_PHY_CMN_CTRL_0);
 
 	/* disable all lanes */
 	data &= ~0x1F;
-	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_CTRL_0, data);
-	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_LANE_CTRL0, 0);
+	writel(data, base + REG_DSI_10nm_PHY_CMN_CTRL_0);
+	writel(0, base + REG_DSI_10nm_PHY_CMN_LANE_CTRL0);
 
 	/* Turn off all PHY blocks */
-	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_CTRL_0, 0x00);
+	writel(0x00, base + REG_DSI_10nm_PHY_CMN_CTRL_0);
 	/* make sure phy is turned off */
 	wmb();
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 31deda1c664a..b128c4acea23 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -116,7 +116,7 @@ static bool pll_14nm_poll_for_ready(struct dsi_pll_14nm *pll_14nm,
 
 	tries = nb_tries;
 	while (tries--) {
-		val = dsi_phy_read(base + REG_DSI_14nm_PHY_PLL_RESET_SM_READY_STATUS);
+		val = readl(base + REG_DSI_14nm_PHY_PLL_RESET_SM_READY_STATUS);
 		pll_locked = !!(val & BIT(5));
 
 		if (pll_locked)
@@ -130,7 +130,7 @@ static bool pll_14nm_poll_for_ready(struct dsi_pll_14nm *pll_14nm,
 
 	tries = nb_tries;
 	while (tries--) {
-		val = dsi_phy_read(base + REG_DSI_14nm_PHY_PLL_RESET_SM_READY_STATUS);
+		val = readl(base + REG_DSI_14nm_PHY_PLL_RESET_SM_READY_STATUS);
 		pll_ready = !!(val & BIT(0));
 
 		if (pll_ready)
@@ -288,29 +288,29 @@ static void pll_db_commit_ssc(struct dsi_pll_14nm *pll, struct dsi_pll_config *p
 
 	data = pconf->ssc_adj_period;
 	data &= 0x0ff;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_SSC_ADJ_PER1, data);
+	writel(data, base + REG_DSI_14nm_PHY_PLL_SSC_ADJ_PER1);
 	data = (pconf->ssc_adj_period >> 8);
 	data &= 0x03;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_SSC_ADJ_PER2, data);
+	writel(data, base + REG_DSI_14nm_PHY_PLL_SSC_ADJ_PER2);
 
 	data = pconf->ssc_period;
 	data &= 0x0ff;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_SSC_PER1, data);
+	writel(data, base + REG_DSI_14nm_PHY_PLL_SSC_PER1);
 	data = (pconf->ssc_period >> 8);
 	data &= 0x0ff;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_SSC_PER2, data);
+	writel(data, base + REG_DSI_14nm_PHY_PLL_SSC_PER2);
 
 	data = pconf->ssc_step_size;
 	data &= 0x0ff;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_SSC_STEP_SIZE1, data);
+	writel(data, base + REG_DSI_14nm_PHY_PLL_SSC_STEP_SIZE1);
 	data = (pconf->ssc_step_size >> 8);
 	data &= 0x0ff;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_SSC_STEP_SIZE2, data);
+	writel(data, base + REG_DSI_14nm_PHY_PLL_SSC_STEP_SIZE2);
 
 	data = (pconf->ssc_center & 0x01);
 	data <<= 1;
 	data |= 0x01; /* enable */
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_SSC_EN_CENTER, data);
+	writel(data, base + REG_DSI_14nm_PHY_PLL_SSC_EN_CENTER);
 
 	wmb();	/* make sure register committed */
 }
@@ -323,43 +323,45 @@ static void pll_db_commit_common(struct dsi_pll_14nm *pll,
 
 	/* confgiure the non frequency dependent pll registers */
 	data = 0;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_SYSCLK_EN_RESET, data);
+	writel(data, base + REG_DSI_14nm_PHY_PLL_SYSCLK_EN_RESET);
 
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_TXCLK_EN, 1);
+	writel(1, base + REG_DSI_14nm_PHY_PLL_TXCLK_EN);
 
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_RESETSM_CNTRL, 48);
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_RESETSM_CNTRL2, 4 << 3); /* bandgap_timer */
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_RESETSM_CNTRL5, 5); /* pll_wakeup_timer */
+	writel(48, base + REG_DSI_14nm_PHY_PLL_RESETSM_CNTRL);
+	/* bandgap_timer */
+	writel(4 << 3, base + REG_DSI_14nm_PHY_PLL_RESETSM_CNTRL2);
+	/* pll_wakeup_timer */
+	writel(5, base + REG_DSI_14nm_PHY_PLL_RESETSM_CNTRL5);
 
 	data = pconf->pll_vco_div_ref & 0xff;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_VCO_DIV_REF1, data);
+	writel(data, base + REG_DSI_14nm_PHY_PLL_VCO_DIV_REF1);
 	data = (pconf->pll_vco_div_ref >> 8) & 0x3;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_VCO_DIV_REF2, data);
+	writel(data, base + REG_DSI_14nm_PHY_PLL_VCO_DIV_REF2);
 
 	data = pconf->pll_kvco_div_ref & 0xff;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_KVCO_DIV_REF1, data);
+	writel(data, base + REG_DSI_14nm_PHY_PLL_KVCO_DIV_REF1);
 	data = (pconf->pll_kvco_div_ref >> 8) & 0x3;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_KVCO_DIV_REF2, data);
+	writel(data, base + REG_DSI_14nm_PHY_PLL_KVCO_DIV_REF2);
 
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_MISC1, 16);
+	writel(16, base + REG_DSI_14nm_PHY_PLL_PLL_MISC1);
 
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_IE_TRIM, 4);
+	writel(4, base + REG_DSI_14nm_PHY_PLL_IE_TRIM);
 
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_IP_TRIM, 4);
+	writel(4, base + REG_DSI_14nm_PHY_PLL_IP_TRIM);
 
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_CP_SET_CUR, 1 << 3 | 1);
+	writel(1 << 3 | 1, base + REG_DSI_14nm_PHY_PLL_CP_SET_CUR);
 
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_ICPCSET, 0 << 3 | 0);
+	writel(0 << 3 | 0, base + REG_DSI_14nm_PHY_PLL_PLL_ICPCSET);
 
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_ICPMSET, 0 << 3 | 0);
+	writel(0 << 3 | 0, base + REG_DSI_14nm_PHY_PLL_PLL_ICPMSET);
 
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_ICP_SET, 4 << 3 | 4);
+	writel(4 << 3 | 4, base + REG_DSI_14nm_PHY_PLL_PLL_ICP_SET);
 
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_LPF1, 1 << 4 | 11);
+	writel(1 << 4 | 11, base + REG_DSI_14nm_PHY_PLL_PLL_LPF1);
 
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_IPTAT_TRIM, 7);
+	writel(7, base + REG_DSI_14nm_PHY_PLL_IPTAT_TRIM);
 
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_CRCTRL, 1 << 4 | 2);
+	writel(1 << 4 | 2, base + REG_DSI_14nm_PHY_PLL_PLL_CRCTRL);
 }
 
 static void pll_14nm_software_reset(struct dsi_pll_14nm *pll_14nm)
@@ -369,13 +371,13 @@ static void pll_14nm_software_reset(struct dsi_pll_14nm *pll_14nm)
 	/* de assert pll start and apply pll sw reset */
 
 	/* stop pll */
-	dsi_phy_write(cmn_base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL, 0);
+	writel(0, cmn_base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL);
 
 	/* pll sw reset */
 	dsi_phy_write_udelay(cmn_base + REG_DSI_14nm_PHY_CMN_CTRL_1, 0x20, 10);
 	wmb();	/* make sure register committed */
 
-	dsi_phy_write(cmn_base + REG_DSI_14nm_PHY_CMN_CTRL_1, 0);
+	writel(0, cmn_base + REG_DSI_14nm_PHY_CMN_CTRL_1);
 	wmb();	/* make sure register committed */
 }
 
@@ -388,50 +390,50 @@ static void pll_db_commit_14nm(struct dsi_pll_14nm *pll,
 
 	DBG("DSI%d PLL", pll->phy->id);
 
-	dsi_phy_write(cmn_base + REG_DSI_14nm_PHY_CMN_LDO_CNTRL, 0x3c);
+	writel(0x3c, cmn_base + REG_DSI_14nm_PHY_CMN_LDO_CNTRL);
 
 	pll_db_commit_common(pll, pconf);
 
 	pll_14nm_software_reset(pll);
 
 	/* Use the /2 path in Mux */
-	dsi_phy_write(cmn_base + REG_DSI_14nm_PHY_CMN_CLK_CFG1, 1);
+	writel(1, cmn_base + REG_DSI_14nm_PHY_CMN_CLK_CFG1);
 
 	data = 0xff; /* data, clk, pll normal operation */
-	dsi_phy_write(cmn_base + REG_DSI_14nm_PHY_CMN_CTRL_0, data);
+	writel(data, cmn_base + REG_DSI_14nm_PHY_CMN_CTRL_0);
 
 	/* configure the frequency dependent pll registers */
 	data = pconf->dec_start;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_DEC_START, data);
+	writel(data, base + REG_DSI_14nm_PHY_PLL_DEC_START);
 
 	data = pconf->div_frac_start & 0xff;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_DIV_FRAC_START1, data);
+	writel(data, base + REG_DSI_14nm_PHY_PLL_DIV_FRAC_START1);
 	data = (pconf->div_frac_start >> 8) & 0xff;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_DIV_FRAC_START2, data);
+	writel(data, base + REG_DSI_14nm_PHY_PLL_DIV_FRAC_START2);
 	data = (pconf->div_frac_start >> 16) & 0xf;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_DIV_FRAC_START3, data);
+	writel(data, base + REG_DSI_14nm_PHY_PLL_DIV_FRAC_START3);
 
 	data = pconf->plllock_cmp & 0xff;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLLLOCK_CMP1, data);
+	writel(data, base + REG_DSI_14nm_PHY_PLL_PLLLOCK_CMP1);
 
 	data = (pconf->plllock_cmp >> 8) & 0xff;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLLLOCK_CMP2, data);
+	writel(data, base + REG_DSI_14nm_PHY_PLL_PLLLOCK_CMP2);
 
 	data = (pconf->plllock_cmp >> 16) & 0x3;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLLLOCK_CMP3, data);
+	writel(data, base + REG_DSI_14nm_PHY_PLL_PLLLOCK_CMP3);
 
 	data = pconf->plllock_cnt << 1 | 0 << 3; /* plllock_rng */
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLLLOCK_CMP_EN, data);
+	writel(data, base + REG_DSI_14nm_PHY_PLL_PLLLOCK_CMP_EN);
 
 	data = pconf->pll_vco_count & 0xff;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_VCO_COUNT1, data);
+	writel(data, base + REG_DSI_14nm_PHY_PLL_VCO_COUNT1);
 	data = (pconf->pll_vco_count >> 8) & 0xff;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_VCO_COUNT2, data);
+	writel(data, base + REG_DSI_14nm_PHY_PLL_VCO_COUNT2);
 
 	data = pconf->pll_kvco_count & 0xff;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_KVCO_COUNT1, data);
+	writel(data, base + REG_DSI_14nm_PHY_PLL_KVCO_COUNT1);
 	data = (pconf->pll_kvco_count >> 8) & 0x3;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_KVCO_COUNT2, data);
+	writel(data, base + REG_DSI_14nm_PHY_PLL_KVCO_COUNT2);
 
 	/*
 	 * High nibble configures the post divider internal to the VCO. It's
@@ -442,7 +444,7 @@ static void pll_db_commit_14nm(struct dsi_pll_14nm *pll,
 	 * 2: divided by 4
 	 * 3: divided by 8
 	 */
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_LPF2_POSTDIV, 0 << 4 | 3);
+	writel(0 << 4 | 3, base + REG_DSI_14nm_PHY_PLL_PLL_LPF2_POSTDIV);
 
 	if (pconf->ssc_en)
 		pll_db_commit_ssc(pll, pconf);
@@ -497,16 +499,16 @@ static unsigned long dsi_pll_14nm_vco_recalc_rate(struct clk_hw *hw,
 	u32 dec_start;
 	u64 ref_clk = parent_rate;
 
-	dec_start = dsi_phy_read(base + REG_DSI_14nm_PHY_PLL_DEC_START);
+	dec_start = readl(base + REG_DSI_14nm_PHY_PLL_DEC_START);
 	dec_start &= 0x0ff;
 
 	DBG("dec_start = %x", dec_start);
 
-	div_frac_start = (dsi_phy_read(base + REG_DSI_14nm_PHY_PLL_DIV_FRAC_START3)
+	div_frac_start = (readl(base + REG_DSI_14nm_PHY_PLL_DIV_FRAC_START3)
 				& 0xf) << 16;
-	div_frac_start |= (dsi_phy_read(base + REG_DSI_14nm_PHY_PLL_DIV_FRAC_START2)
+	div_frac_start |= (readl(base + REG_DSI_14nm_PHY_PLL_DIV_FRAC_START2)
 				& 0xff) << 8;
-	div_frac_start |= dsi_phy_read(base + REG_DSI_14nm_PHY_PLL_DIV_FRAC_START1)
+	div_frac_start |= readl(base + REG_DSI_14nm_PHY_PLL_DIV_FRAC_START1)
 				& 0xff;
 
 	DBG("div_frac_start = %x", div_frac_start);
@@ -542,8 +544,8 @@ static int dsi_pll_14nm_vco_prepare(struct clk_hw *hw)
 	if (dsi_pll_14nm_vco_recalc_rate(hw, VCO_REF_CLK_RATE) == 0)
 		dsi_pll_14nm_vco_set_rate(hw, pll_14nm->phy->cfg->min_pll_rate, VCO_REF_CLK_RATE);
 
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_VREF_CFG1, 0x10);
-	dsi_phy_write(cmn_base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL, 1);
+	writel(0x10, base + REG_DSI_14nm_PHY_PLL_VREF_CFG1);
+	writel(1, cmn_base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL);
 
 	locked = pll_14nm_poll_for_ready(pll_14nm, POLL_MAX_READS,
 					 POLL_TIMEOUT_US);
@@ -569,7 +571,7 @@ static void dsi_pll_14nm_vco_unprepare(struct clk_hw *hw)
 	if (unlikely(!pll_14nm->phy->pll_on))
 		return;
 
-	dsi_phy_write(cmn_base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL, 0);
+	writel(0, cmn_base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL);
 
 	pll_14nm->phy->pll_on = false;
 }
@@ -611,7 +613,7 @@ static unsigned long dsi_pll_14nm_postdiv_recalc_rate(struct clk_hw *hw,
 
 	DBG("DSI%d PLL parent rate=%lu", pll_14nm->phy->id, parent_rate);
 
-	val = dsi_phy_read(base + REG_DSI_14nm_PHY_CMN_CLK_CFG0) >> shift;
+	val = readl(base + REG_DSI_14nm_PHY_CMN_CLK_CFG0) >> shift;
 	val &= div_mask(width);
 
 	return divider_recalc_rate(hw, parent_rate, val, NULL,
@@ -653,11 +655,11 @@ static int dsi_pll_14nm_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	spin_lock_irqsave(lock, flags);
 
-	val = dsi_phy_read(base + REG_DSI_14nm_PHY_CMN_CLK_CFG0);
+	val = readl(base + REG_DSI_14nm_PHY_CMN_CLK_CFG0);
 	val &= ~(div_mask(width) << shift);
 
 	val |= value << shift;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_CMN_CLK_CFG0, val);
+	writel(val, base + REG_DSI_14nm_PHY_CMN_CLK_CFG0);
 
 	/* If we're master in bonded DSI mode, then the slave PLL's post-dividers
 	 * follow the master's post dividers
@@ -666,7 +668,7 @@ static int dsi_pll_14nm_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
 		struct dsi_pll_14nm *pll_14nm_slave = pll_14nm->slave;
 		void __iomem *slave_base = pll_14nm_slave->phy->base;
 
-		dsi_phy_write(slave_base + REG_DSI_14nm_PHY_CMN_CLK_CFG0, val);
+		writel(val, slave_base + REG_DSI_14nm_PHY_CMN_CLK_CFG0);
 	}
 
 	spin_unlock_irqrestore(lock, flags);
@@ -691,7 +693,7 @@ static void dsi_14nm_pll_save_state(struct msm_dsi_phy *phy)
 	void __iomem *cmn_base = pll_14nm->phy->base;
 	u32 data;
 
-	data = dsi_phy_read(cmn_base + REG_DSI_14nm_PHY_CMN_CLK_CFG0);
+	data = readl(cmn_base + REG_DSI_14nm_PHY_CMN_CLK_CFG0);
 
 	cached_state->n1postdiv = data & 0xf;
 	cached_state->n2postdiv = (data >> 4) & 0xf;
@@ -723,14 +725,14 @@ static int dsi_14nm_pll_restore_state(struct msm_dsi_phy *phy)
 	DBG("DSI%d PLL restore state %x %x", pll_14nm->phy->id,
 	    cached_state->n1postdiv, cached_state->n2postdiv);
 
-	dsi_phy_write(cmn_base + REG_DSI_14nm_PHY_CMN_CLK_CFG0, data);
+	writel(data, cmn_base + REG_DSI_14nm_PHY_CMN_CLK_CFG0);
 
 	/* also restore post-dividers for slave DSI PLL */
 	if (phy->usecase == MSM_DSI_PHY_MASTER) {
 		struct dsi_pll_14nm *pll_14nm_slave = pll_14nm->slave;
 		void __iomem *slave_base = pll_14nm_slave->phy->base;
 
-		dsi_phy_write(slave_base + REG_DSI_14nm_PHY_CMN_CLK_CFG0, data);
+		writel(data, slave_base + REG_DSI_14nm_PHY_CMN_CLK_CFG0);
 	}
 
 	return 0;
@@ -758,9 +760,9 @@ static int dsi_14nm_set_usecase(struct msm_dsi_phy *phy)
 		return -EINVAL;
 	}
 
-	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_CLKBUFLR_EN, clkbuflr_en);
+	writel(clkbuflr_en, base + REG_DSI_14nm_PHY_PLL_CLKBUFLR_EN);
 	if (bandgap)
-		dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_PLL_BANDGAP, bandgap);
+		writel(bandgap, base + REG_DSI_14nm_PHY_PLL_PLL_BANDGAP);
 
 	return 0;
 }
@@ -917,27 +919,27 @@ static void dsi_14nm_dphy_set_timing(struct msm_dsi_phy *phy,
 	u32 halfbyte_en = clk_ln ? timing->hs_halfbyte_en_ckln :
 				   timing->hs_halfbyte_en;
 
-	dsi_phy_write(base + REG_DSI_14nm_PHY_LN_TIMING_CTRL_4(lane_idx),
-		      DSI_14nm_PHY_LN_TIMING_CTRL_4_HS_EXIT(timing->hs_exit));
-	dsi_phy_write(base + REG_DSI_14nm_PHY_LN_TIMING_CTRL_5(lane_idx),
-		      DSI_14nm_PHY_LN_TIMING_CTRL_5_HS_ZERO(zero));
-	dsi_phy_write(base + REG_DSI_14nm_PHY_LN_TIMING_CTRL_6(lane_idx),
-		      DSI_14nm_PHY_LN_TIMING_CTRL_6_HS_PREPARE(prepare));
-	dsi_phy_write(base + REG_DSI_14nm_PHY_LN_TIMING_CTRL_7(lane_idx),
-		      DSI_14nm_PHY_LN_TIMING_CTRL_7_HS_TRAIL(trail));
-	dsi_phy_write(base + REG_DSI_14nm_PHY_LN_TIMING_CTRL_8(lane_idx),
-		      DSI_14nm_PHY_LN_TIMING_CTRL_8_HS_RQST(rqst));
-	dsi_phy_write(base + REG_DSI_14nm_PHY_LN_CFG0(lane_idx),
-		      DSI_14nm_PHY_LN_CFG0_PREPARE_DLY(prep_dly));
-	dsi_phy_write(base + REG_DSI_14nm_PHY_LN_CFG1(lane_idx),
-		      halfbyte_en ? DSI_14nm_PHY_LN_CFG1_HALFBYTECLK_EN : 0);
-	dsi_phy_write(base + REG_DSI_14nm_PHY_LN_TIMING_CTRL_9(lane_idx),
-		      DSI_14nm_PHY_LN_TIMING_CTRL_9_TA_GO(timing->ta_go) |
-		      DSI_14nm_PHY_LN_TIMING_CTRL_9_TA_SURE(timing->ta_sure));
-	dsi_phy_write(base + REG_DSI_14nm_PHY_LN_TIMING_CTRL_10(lane_idx),
-		      DSI_14nm_PHY_LN_TIMING_CTRL_10_TA_GET(timing->ta_get));
-	dsi_phy_write(base + REG_DSI_14nm_PHY_LN_TIMING_CTRL_11(lane_idx),
-		      DSI_14nm_PHY_LN_TIMING_CTRL_11_TRIG3_CMD(0xa0));
+	writel(DSI_14nm_PHY_LN_TIMING_CTRL_4_HS_EXIT(timing->hs_exit),
+	       base + REG_DSI_14nm_PHY_LN_TIMING_CTRL_4(lane_idx));
+	writel(DSI_14nm_PHY_LN_TIMING_CTRL_5_HS_ZERO(zero),
+	       base + REG_DSI_14nm_PHY_LN_TIMING_CTRL_5(lane_idx));
+	writel(DSI_14nm_PHY_LN_TIMING_CTRL_6_HS_PREPARE(prepare),
+	       base + REG_DSI_14nm_PHY_LN_TIMING_CTRL_6(lane_idx));
+	writel(DSI_14nm_PHY_LN_TIMING_CTRL_7_HS_TRAIL(trail),
+	       base + REG_DSI_14nm_PHY_LN_TIMING_CTRL_7(lane_idx));
+	writel(DSI_14nm_PHY_LN_TIMING_CTRL_8_HS_RQST(rqst),
+	       base + REG_DSI_14nm_PHY_LN_TIMING_CTRL_8(lane_idx));
+	writel(DSI_14nm_PHY_LN_CFG0_PREPARE_DLY(prep_dly),
+	       base + REG_DSI_14nm_PHY_LN_CFG0(lane_idx));
+	writel(halfbyte_en ? DSI_14nm_PHY_LN_CFG1_HALFBYTECLK_EN : 0,
+	       base + REG_DSI_14nm_PHY_LN_CFG1(lane_idx));
+	writel(DSI_14nm_PHY_LN_TIMING_CTRL_9_TA_GO(timing->ta_go) |
+	       DSI_14nm_PHY_LN_TIMING_CTRL_9_TA_SURE(timing->ta_sure),
+	       base + REG_DSI_14nm_PHY_LN_TIMING_CTRL_9(lane_idx));
+	writel(DSI_14nm_PHY_LN_TIMING_CTRL_10_TA_GET(timing->ta_get),
+	       base + REG_DSI_14nm_PHY_LN_TIMING_CTRL_10(lane_idx));
+	writel(DSI_14nm_PHY_LN_TIMING_CTRL_11_TRIG3_CMD(0xa0),
+	       base + REG_DSI_14nm_PHY_LN_TIMING_CTRL_11(lane_idx));
 }
 
 static int dsi_14nm_phy_enable(struct msm_dsi_phy *phy,
@@ -961,49 +963,44 @@ static int dsi_14nm_phy_enable(struct msm_dsi_phy *phy,
 	data = 0x1c;
 	if (phy->usecase != MSM_DSI_PHY_STANDALONE)
 		data |= DSI_14nm_PHY_CMN_LDO_CNTRL_VREG_CTRL(32);
-	dsi_phy_write(base + REG_DSI_14nm_PHY_CMN_LDO_CNTRL, data);
+	writel(data, base + REG_DSI_14nm_PHY_CMN_LDO_CNTRL);
 
-	dsi_phy_write(base + REG_DSI_14nm_PHY_CMN_GLBL_TEST_CTRL, 0x1);
+	writel(0x1, base + REG_DSI_14nm_PHY_CMN_GLBL_TEST_CTRL);
 
 	/* 4 data lanes + 1 clk lane configuration */
 	for (i = 0; i < 5; i++) {
-		dsi_phy_write(lane_base + REG_DSI_14nm_PHY_LN_VREG_CNTRL(i),
-			      0x1d);
-
-		dsi_phy_write(lane_base +
-			      REG_DSI_14nm_PHY_LN_STRENGTH_CTRL_0(i), 0xff);
-		dsi_phy_write(lane_base +
-			      REG_DSI_14nm_PHY_LN_STRENGTH_CTRL_1(i),
-			      (i == PHY_14NM_CKLN_IDX) ? 0x00 : 0x06);
-
-		dsi_phy_write(lane_base + REG_DSI_14nm_PHY_LN_CFG3(i),
-			      (i == PHY_14NM_CKLN_IDX) ? 0x8f : 0x0f);
-		dsi_phy_write(lane_base + REG_DSI_14nm_PHY_LN_CFG2(i), 0x10);
-		dsi_phy_write(lane_base + REG_DSI_14nm_PHY_LN_TEST_DATAPATH(i),
-			      0);
-		dsi_phy_write(lane_base + REG_DSI_14nm_PHY_LN_TEST_STR(i),
-			      0x88);
+		writel(0x1d, lane_base + REG_DSI_14nm_PHY_LN_VREG_CNTRL(i));
+
+		writel(0xff, lane_base + REG_DSI_14nm_PHY_LN_STRENGTH_CTRL_0(i));
+		writel(i == PHY_14NM_CKLN_IDX ? 0x00 : 0x06,
+		       lane_base + REG_DSI_14nm_PHY_LN_STRENGTH_CTRL_1(i));
+
+		writel(i == PHY_14NM_CKLN_IDX ? 0x8f : 0x0f,
+		       lane_base + REG_DSI_14nm_PHY_LN_CFG3(i));
+		writel(0x10, lane_base + REG_DSI_14nm_PHY_LN_CFG2(i));
+		writel(0, lane_base + REG_DSI_14nm_PHY_LN_TEST_DATAPATH(i));
+		writel(0x88, lane_base + REG_DSI_14nm_PHY_LN_TEST_STR(i));
 
 		dsi_14nm_dphy_set_timing(phy, timing, i);
 	}
 
 	/* Make sure PLL is not start */
-	dsi_phy_write(base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL, 0x00);
+	writel(0x00, base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL);
 
 	wmb(); /* make sure everything is written before reset and enable */
 
 	/* reset digital block */
-	dsi_phy_write(base + REG_DSI_14nm_PHY_CMN_CTRL_1, 0x80);
+	writel(0x80, base + REG_DSI_14nm_PHY_CMN_CTRL_1);
 	wmb(); /* ensure reset is asserted */
 	udelay(100);
-	dsi_phy_write(base + REG_DSI_14nm_PHY_CMN_CTRL_1, 0x00);
+	writel(0x00, base + REG_DSI_14nm_PHY_CMN_CTRL_1);
 
-	glbl_test_ctrl = dsi_phy_read(base + REG_DSI_14nm_PHY_CMN_GLBL_TEST_CTRL);
+	glbl_test_ctrl = readl(base + REG_DSI_14nm_PHY_CMN_GLBL_TEST_CTRL);
 	if (phy->id == DSI_1 && phy->usecase == MSM_DSI_PHY_SLAVE)
 		glbl_test_ctrl |= DSI_14nm_PHY_CMN_GLBL_TEST_CTRL_BITCLK_HS_SEL;
 	else
 		glbl_test_ctrl &= ~DSI_14nm_PHY_CMN_GLBL_TEST_CTRL_BITCLK_HS_SEL;
-	dsi_phy_write(base + REG_DSI_14nm_PHY_CMN_GLBL_TEST_CTRL, glbl_test_ctrl);
+	writel(glbl_test_ctrl, base + REG_DSI_14nm_PHY_CMN_GLBL_TEST_CTRL);
 	ret = dsi_14nm_set_usecase(phy);
 	if (ret) {
 		DRM_DEV_ERROR(&phy->pdev->dev, "%s: set pll usecase failed, %d\n",
@@ -1012,15 +1009,15 @@ static int dsi_14nm_phy_enable(struct msm_dsi_phy *phy,
 	}
 
 	/* Remove power down from PLL and all lanes */
-	dsi_phy_write(base + REG_DSI_14nm_PHY_CMN_CTRL_0, 0xff);
+	writel(0xff, base + REG_DSI_14nm_PHY_CMN_CTRL_0);
 
 	return 0;
 }
 
 static void dsi_14nm_phy_disable(struct msm_dsi_phy *phy)
 {
-	dsi_phy_write(phy->base + REG_DSI_14nm_PHY_CMN_GLBL_TEST_CTRL, 0);
-	dsi_phy_write(phy->base + REG_DSI_14nm_PHY_CMN_CTRL_0, 0);
+	writel(0, phy->base + REG_DSI_14nm_PHY_CMN_GLBL_TEST_CTRL);
+	writel(0, phy->base + REG_DSI_14nm_PHY_CMN_CTRL_0);
 
 	/* ensure that the phy is completely disabled */
 	wmb();
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
index c9752b991744..cee34b76c3d2 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
@@ -12,32 +12,32 @@ static void dsi_20nm_dphy_set_timing(struct msm_dsi_phy *phy,
 {
 	void __iomem *base = phy->base;
 
-	dsi_phy_write(base + REG_DSI_20nm_PHY_TIMING_CTRL_0,
-		DSI_20nm_PHY_TIMING_CTRL_0_CLK_ZERO(timing->clk_zero));
-	dsi_phy_write(base + REG_DSI_20nm_PHY_TIMING_CTRL_1,
-		DSI_20nm_PHY_TIMING_CTRL_1_CLK_TRAIL(timing->clk_trail));
-	dsi_phy_write(base + REG_DSI_20nm_PHY_TIMING_CTRL_2,
-		DSI_20nm_PHY_TIMING_CTRL_2_CLK_PREPARE(timing->clk_prepare));
+	writel(DSI_20nm_PHY_TIMING_CTRL_0_CLK_ZERO(timing->clk_zero),
+	       base + REG_DSI_20nm_PHY_TIMING_CTRL_0);
+	writel(DSI_20nm_PHY_TIMING_CTRL_1_CLK_TRAIL(timing->clk_trail),
+	       base + REG_DSI_20nm_PHY_TIMING_CTRL_1);
+	writel(DSI_20nm_PHY_TIMING_CTRL_2_CLK_PREPARE(timing->clk_prepare),
+	       base + REG_DSI_20nm_PHY_TIMING_CTRL_2);
 	if (timing->clk_zero & BIT(8))
-		dsi_phy_write(base + REG_DSI_20nm_PHY_TIMING_CTRL_3,
-			DSI_20nm_PHY_TIMING_CTRL_3_CLK_ZERO_8);
-	dsi_phy_write(base + REG_DSI_20nm_PHY_TIMING_CTRL_4,
-		DSI_20nm_PHY_TIMING_CTRL_4_HS_EXIT(timing->hs_exit));
-	dsi_phy_write(base + REG_DSI_20nm_PHY_TIMING_CTRL_5,
-		DSI_20nm_PHY_TIMING_CTRL_5_HS_ZERO(timing->hs_zero));
-	dsi_phy_write(base + REG_DSI_20nm_PHY_TIMING_CTRL_6,
-		DSI_20nm_PHY_TIMING_CTRL_6_HS_PREPARE(timing->hs_prepare));
-	dsi_phy_write(base + REG_DSI_20nm_PHY_TIMING_CTRL_7,
-		DSI_20nm_PHY_TIMING_CTRL_7_HS_TRAIL(timing->hs_trail));
-	dsi_phy_write(base + REG_DSI_20nm_PHY_TIMING_CTRL_8,
-		DSI_20nm_PHY_TIMING_CTRL_8_HS_RQST(timing->hs_rqst));
-	dsi_phy_write(base + REG_DSI_20nm_PHY_TIMING_CTRL_9,
-		DSI_20nm_PHY_TIMING_CTRL_9_TA_GO(timing->ta_go) |
-		DSI_20nm_PHY_TIMING_CTRL_9_TA_SURE(timing->ta_sure));
-	dsi_phy_write(base + REG_DSI_20nm_PHY_TIMING_CTRL_10,
-		DSI_20nm_PHY_TIMING_CTRL_10_TA_GET(timing->ta_get));
-	dsi_phy_write(base + REG_DSI_20nm_PHY_TIMING_CTRL_11,
-		DSI_20nm_PHY_TIMING_CTRL_11_TRIG3_CMD(0));
+		writel(DSI_20nm_PHY_TIMING_CTRL_3_CLK_ZERO_8,
+		       base + REG_DSI_20nm_PHY_TIMING_CTRL_3);
+	writel(DSI_20nm_PHY_TIMING_CTRL_4_HS_EXIT(timing->hs_exit),
+	       base + REG_DSI_20nm_PHY_TIMING_CTRL_4);
+	writel(DSI_20nm_PHY_TIMING_CTRL_5_HS_ZERO(timing->hs_zero),
+	       base + REG_DSI_20nm_PHY_TIMING_CTRL_5);
+	writel(DSI_20nm_PHY_TIMING_CTRL_6_HS_PREPARE(timing->hs_prepare),
+	       base + REG_DSI_20nm_PHY_TIMING_CTRL_6);
+	writel(DSI_20nm_PHY_TIMING_CTRL_7_HS_TRAIL(timing->hs_trail),
+	       base + REG_DSI_20nm_PHY_TIMING_CTRL_7);
+	writel(DSI_20nm_PHY_TIMING_CTRL_8_HS_RQST(timing->hs_rqst),
+	       base + REG_DSI_20nm_PHY_TIMING_CTRL_8);
+	writel(DSI_20nm_PHY_TIMING_CTRL_9_TA_GO(timing->ta_go) |
+	       DSI_20nm_PHY_TIMING_CTRL_9_TA_SURE(timing->ta_sure),
+	       base + REG_DSI_20nm_PHY_TIMING_CTRL_9);
+	writel(DSI_20nm_PHY_TIMING_CTRL_10_TA_GET(timing->ta_get),
+	       base + REG_DSI_20nm_PHY_TIMING_CTRL_10);
+	writel(DSI_20nm_PHY_TIMING_CTRL_11_TRIG3_CMD(0),
+	       base + REG_DSI_20nm_PHY_TIMING_CTRL_11);
 }
 
 static void dsi_20nm_phy_regulator_ctrl(struct msm_dsi_phy *phy, bool enable)
@@ -45,23 +45,23 @@ static void dsi_20nm_phy_regulator_ctrl(struct msm_dsi_phy *phy, bool enable)
 	void __iomem *base = phy->reg_base;
 
 	if (!enable) {
-		dsi_phy_write(base + REG_DSI_20nm_PHY_REGULATOR_CAL_PWR_CFG, 0);
+		writel(0, base + REG_DSI_20nm_PHY_REGULATOR_CAL_PWR_CFG);
 		return;
 	}
 
 	if (phy->regulator_ldo_mode) {
-		dsi_phy_write(phy->base + REG_DSI_20nm_PHY_LDO_CNTRL, 0x1d);
+		writel(0x1d, phy->base + REG_DSI_20nm_PHY_LDO_CNTRL);
 		return;
 	}
 
 	/* non LDO mode */
-	dsi_phy_write(base + REG_DSI_20nm_PHY_REGULATOR_CTRL_1, 0x03);
-	dsi_phy_write(base + REG_DSI_20nm_PHY_REGULATOR_CTRL_2, 0x03);
-	dsi_phy_write(base + REG_DSI_20nm_PHY_REGULATOR_CTRL_3, 0x00);
-	dsi_phy_write(base + REG_DSI_20nm_PHY_REGULATOR_CTRL_4, 0x20);
-	dsi_phy_write(base + REG_DSI_20nm_PHY_REGULATOR_CAL_PWR_CFG, 0x01);
-	dsi_phy_write(phy->base + REG_DSI_20nm_PHY_LDO_CNTRL, 0x00);
-	dsi_phy_write(base + REG_DSI_20nm_PHY_REGULATOR_CTRL_0, 0x03);
+	writel(0x03, base + REG_DSI_20nm_PHY_REGULATOR_CTRL_1);
+	writel(0x03, base + REG_DSI_20nm_PHY_REGULATOR_CTRL_2);
+	writel(0x00, base + REG_DSI_20nm_PHY_REGULATOR_CTRL_3);
+	writel(0x20, base + REG_DSI_20nm_PHY_REGULATOR_CTRL_4);
+	writel(0x01, base + REG_DSI_20nm_PHY_REGULATOR_CAL_PWR_CFG);
+	writel(0x00, phy->base + REG_DSI_20nm_PHY_LDO_CNTRL);
+	writel(0x03, base + REG_DSI_20nm_PHY_REGULATOR_CTRL_0);
 }
 
 static int dsi_20nm_phy_enable(struct msm_dsi_phy *phy,
@@ -83,49 +83,48 @@ static int dsi_20nm_phy_enable(struct msm_dsi_phy *phy,
 
 	dsi_20nm_phy_regulator_ctrl(phy, true);
 
-	dsi_phy_write(base + REG_DSI_20nm_PHY_STRENGTH_0, 0xff);
+	writel(0xff, base + REG_DSI_20nm_PHY_STRENGTH_0);
 
-	val = dsi_phy_read(base + REG_DSI_20nm_PHY_GLBL_TEST_CTRL);
+	val = readl(base + REG_DSI_20nm_PHY_GLBL_TEST_CTRL);
 	if (phy->id == DSI_1 && phy->usecase == MSM_DSI_PHY_STANDALONE)
 		val |= DSI_20nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL;
 	else
 		val &= ~DSI_20nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL;
-	dsi_phy_write(base + REG_DSI_20nm_PHY_GLBL_TEST_CTRL, val);
+	writel(val, base + REG_DSI_20nm_PHY_GLBL_TEST_CTRL);
 
 	for (i = 0; i < 4; i++) {
-		dsi_phy_write(base + REG_DSI_20nm_PHY_LN_CFG_3(i),
-							(i >> 1) * 0x40);
-		dsi_phy_write(base + REG_DSI_20nm_PHY_LN_TEST_STR_0(i), 0x01);
-		dsi_phy_write(base + REG_DSI_20nm_PHY_LN_TEST_STR_1(i), 0x46);
-		dsi_phy_write(base + REG_DSI_20nm_PHY_LN_CFG_0(i), 0x02);
-		dsi_phy_write(base + REG_DSI_20nm_PHY_LN_CFG_1(i), 0xa0);
-		dsi_phy_write(base + REG_DSI_20nm_PHY_LN_CFG_4(i), cfg_4[i]);
+		writel((i >> 1) * 0x40, base + REG_DSI_20nm_PHY_LN_CFG_3(i));
+		writel(0x01, base + REG_DSI_20nm_PHY_LN_TEST_STR_0(i));
+		writel(0x46, base + REG_DSI_20nm_PHY_LN_TEST_STR_1(i));
+		writel(0x02, base + REG_DSI_20nm_PHY_LN_CFG_0(i));
+		writel(0xa0, base + REG_DSI_20nm_PHY_LN_CFG_1(i));
+		writel(cfg_4[i], base + REG_DSI_20nm_PHY_LN_CFG_4(i));
 	}
 
-	dsi_phy_write(base + REG_DSI_20nm_PHY_LNCK_CFG_3, 0x80);
-	dsi_phy_write(base + REG_DSI_20nm_PHY_LNCK_TEST_STR0, 0x01);
-	dsi_phy_write(base + REG_DSI_20nm_PHY_LNCK_TEST_STR1, 0x46);
-	dsi_phy_write(base + REG_DSI_20nm_PHY_LNCK_CFG_0, 0x00);
-	dsi_phy_write(base + REG_DSI_20nm_PHY_LNCK_CFG_1, 0xa0);
-	dsi_phy_write(base + REG_DSI_20nm_PHY_LNCK_CFG_2, 0x00);
-	dsi_phy_write(base + REG_DSI_20nm_PHY_LNCK_CFG_4, 0x00);
+	writel(0x80, base + REG_DSI_20nm_PHY_LNCK_CFG_3);
+	writel(0x01, base + REG_DSI_20nm_PHY_LNCK_TEST_STR0);
+	writel(0x46, base + REG_DSI_20nm_PHY_LNCK_TEST_STR1);
+	writel(0x00, base + REG_DSI_20nm_PHY_LNCK_CFG_0);
+	writel(0xa0, base + REG_DSI_20nm_PHY_LNCK_CFG_1);
+	writel(0x00, base + REG_DSI_20nm_PHY_LNCK_CFG_2);
+	writel(0x00, base + REG_DSI_20nm_PHY_LNCK_CFG_4);
 
 	dsi_20nm_dphy_set_timing(phy, timing);
 
-	dsi_phy_write(base + REG_DSI_20nm_PHY_CTRL_1, 0x00);
+	writel(0x00, base + REG_DSI_20nm_PHY_CTRL_1);
 
-	dsi_phy_write(base + REG_DSI_20nm_PHY_STRENGTH_1, 0x06);
+	writel(0x06, base + REG_DSI_20nm_PHY_STRENGTH_1);
 
 	/* make sure everything is written before enable */
 	wmb();
-	dsi_phy_write(base + REG_DSI_20nm_PHY_CTRL_0, 0x7f);
+	writel(0x7f, base + REG_DSI_20nm_PHY_CTRL_0);
 
 	return 0;
 }
 
 static void dsi_20nm_phy_disable(struct msm_dsi_phy *phy)
 {
-	dsi_phy_write(phy->base + REG_DSI_20nm_PHY_CTRL_0, 0);
+	writel(0, phy->base + REG_DSI_20nm_PHY_CTRL_0);
 	dsi_20nm_phy_regulator_ctrl(phy, false);
 }
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index ceec7bb87bf1..b3e914954f4a 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -83,7 +83,7 @@ static bool pll_28nm_poll_for_ready(struct dsi_pll_28nm *pll_28nm,
 	u32 val;
 
 	while (nb_tries--) {
-		val = dsi_phy_read(pll_28nm->phy->pll_base + REG_DSI_28nm_PHY_PLL_STATUS);
+		val = readl(pll_28nm->phy->pll_base + REG_DSI_28nm_PHY_PLL_STATUS);
 		pll_locked = !!(val & DSI_28nm_PHY_PLL_STATUS_PLL_RDY);
 
 		if (pll_locked)
@@ -128,7 +128,7 @@ static int dsi_pll_28nm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	VERB("rate=%lu, parent's=%lu", rate, parent_rate);
 
 	/* Force postdiv2 to be div-4 */
-	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_POSTDIV2_CFG, 3);
+	writel(3, base + REG_DSI_28nm_PHY_PLL_POSTDIV2_CFG);
 
 	/* Configure the Loop filter resistance */
 	for (i = 0; i < LPFR_LUT_SIZE; i++)
@@ -139,11 +139,11 @@ static int dsi_pll_28nm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 				rate);
 		return -EINVAL;
 	}
-	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_LPFR_CFG, lpfr_lut[i].resistance);
+	writel(lpfr_lut[i].resistance, base + REG_DSI_28nm_PHY_PLL_LPFR_CFG);
 
 	/* Loop filter capacitance values : c1 and c2 */
-	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_LPFC1_CFG, 0x70);
-	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_LPFC2_CFG, 0x15);
+	writel(0x70, base + REG_DSI_28nm_PHY_PLL_LPFC1_CFG);
+	writel(0x15, base + REG_DSI_28nm_PHY_PLL_LPFC2_CFG);
 
 	rem = rate % VCO_REF_CLK_RATE;
 	if (rem) {
@@ -168,7 +168,7 @@ static int dsi_pll_28nm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	DBG("Generated VCO Clock: %lu", gen_vco_clk);
 	rem = 0;
-	sdm_cfg1 = dsi_phy_read(base + REG_DSI_28nm_PHY_PLL_SDM_CFG1);
+	sdm_cfg1 = readl(base + REG_DSI_28nm_PHY_PLL_SDM_CFG1);
 	sdm_cfg1 &= ~DSI_28nm_PHY_PLL_SDM_CFG1_DC_OFFSET__MASK;
 	if (frac_n_mode) {
 		sdm_cfg0 = 0x0;
@@ -195,17 +195,17 @@ static int dsi_pll_28nm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	cal_cfg10 = (u32)((gen_vco_clk % (256 * 1000000)) / 1000000);
 	DBG("cal_cfg10=%d, cal_cfg11=%d", cal_cfg10, cal_cfg11);
 
-	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_CHGPUMP_CFG, 0x02);
-	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_CAL_CFG3,    0x2b);
-	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_CAL_CFG4,    0x06);
-	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2,  0x0d);
+	writel(0x02, base + REG_DSI_28nm_PHY_PLL_CHGPUMP_CFG);
+	writel(0x2b, base + REG_DSI_28nm_PHY_PLL_CAL_CFG3);
+	writel(0x06, base + REG_DSI_28nm_PHY_PLL_CAL_CFG4);
+	writel(0x0d, base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2);
 
-	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_SDM_CFG1, sdm_cfg1);
-	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_SDM_CFG2,
-		      DSI_28nm_PHY_PLL_SDM_CFG2_FREQ_SEED_7_0(sdm_cfg2));
-	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_SDM_CFG3,
-		      DSI_28nm_PHY_PLL_SDM_CFG3_FREQ_SEED_15_8(sdm_cfg3));
-	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_SDM_CFG4, 0x00);
+	writel(sdm_cfg1, base + REG_DSI_28nm_PHY_PLL_SDM_CFG1);
+	writel(DSI_28nm_PHY_PLL_SDM_CFG2_FREQ_SEED_7_0(sdm_cfg2),
+	       base + REG_DSI_28nm_PHY_PLL_SDM_CFG2);
+	writel(DSI_28nm_PHY_PLL_SDM_CFG3_FREQ_SEED_15_8(sdm_cfg3),
+	       base + REG_DSI_28nm_PHY_PLL_SDM_CFG3);
+	writel(0, base + REG_DSI_28nm_PHY_PLL_SDM_CFG4);
 
 	/* Add hardware recommended delay for correct PLL configuration */
 	if (pll_28nm->phy->cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_LP)
@@ -213,18 +213,18 @@ static int dsi_pll_28nm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	else
 		udelay(1);
 
-	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_REFCLK_CFG, refclk_cfg);
-	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_PWRGEN_CFG, 0x00);
-	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_VCOLPF_CFG, 0x31);
-	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_SDM_CFG0,   sdm_cfg0);
-	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_CAL_CFG0,   0x12);
-	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_CAL_CFG6,   0x30);
-	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_CAL_CFG7,   0x00);
-	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_CAL_CFG8,   0x60);
-	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_CAL_CFG9,   0x00);
-	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_CAL_CFG10,  cal_cfg10 & 0xff);
-	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_CAL_CFG11,  cal_cfg11 & 0xff);
-	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_EFUSE_CFG,  0x20);
+	writel(refclk_cfg, base + REG_DSI_28nm_PHY_PLL_REFCLK_CFG);
+	writel(0x00, base + REG_DSI_28nm_PHY_PLL_PWRGEN_CFG);
+	writel(0x31, base + REG_DSI_28nm_PHY_PLL_VCOLPF_CFG);
+	writel(sdm_cfg0, base + REG_DSI_28nm_PHY_PLL_SDM_CFG0);
+	writel(0x12, base + REG_DSI_28nm_PHY_PLL_CAL_CFG0);
+	writel(0x30, base + REG_DSI_28nm_PHY_PLL_CAL_CFG6);
+	writel(0x00, base + REG_DSI_28nm_PHY_PLL_CAL_CFG7);
+	writel(0x60, base + REG_DSI_28nm_PHY_PLL_CAL_CFG8);
+	writel(0x00, base + REG_DSI_28nm_PHY_PLL_CAL_CFG9);
+	writel(cal_cfg10 & 0xff, base + REG_DSI_28nm_PHY_PLL_CAL_CFG10);
+	writel(cal_cfg11 & 0xff, base + REG_DSI_28nm_PHY_PLL_CAL_CFG11);
+	writel(0x20, base + REG_DSI_28nm_PHY_PLL_EFUSE_CFG);
 
 	return 0;
 }
@@ -250,27 +250,27 @@ static unsigned long dsi_pll_28nm_clk_recalc_rate(struct clk_hw *hw,
 	VERB("parent_rate=%lu", parent_rate);
 
 	/* Check to see if the ref clk doubler is enabled */
-	doubler = dsi_phy_read(base + REG_DSI_28nm_PHY_PLL_REFCLK_CFG) &
+	doubler = readl(base + REG_DSI_28nm_PHY_PLL_REFCLK_CFG) &
 			DSI_28nm_PHY_PLL_REFCLK_CFG_DBLR;
 	ref_clk += (doubler * VCO_REF_CLK_RATE);
 
 	/* see if it is integer mode or sdm mode */
-	sdm0 = dsi_phy_read(base + REG_DSI_28nm_PHY_PLL_SDM_CFG0);
+	sdm0 = readl(base + REG_DSI_28nm_PHY_PLL_SDM_CFG0);
 	if (sdm0 & DSI_28nm_PHY_PLL_SDM_CFG0_BYP) {
 		/* integer mode */
 		sdm_byp_div = FIELD(
-				dsi_phy_read(base + REG_DSI_28nm_PHY_PLL_SDM_CFG0),
+				readl(base + REG_DSI_28nm_PHY_PLL_SDM_CFG0),
 				DSI_28nm_PHY_PLL_SDM_CFG0_BYP_DIV) + 1;
 		vco_rate = ref_clk * sdm_byp_div;
 	} else {
 		/* sdm mode */
 		sdm_dc_off = FIELD(
-				dsi_phy_read(base + REG_DSI_28nm_PHY_PLL_SDM_CFG1),
+				readl(base + REG_DSI_28nm_PHY_PLL_SDM_CFG1),
 				DSI_28nm_PHY_PLL_SDM_CFG1_DC_OFFSET);
 		DBG("sdm_dc_off = %d", sdm_dc_off);
-		sdm2 = FIELD(dsi_phy_read(base + REG_DSI_28nm_PHY_PLL_SDM_CFG2),
+		sdm2 = FIELD(readl(base + REG_DSI_28nm_PHY_PLL_SDM_CFG2),
 				DSI_28nm_PHY_PLL_SDM_CFG2_FREQ_SEED_7_0);
-		sdm3 = FIELD(dsi_phy_read(base + REG_DSI_28nm_PHY_PLL_SDM_CFG3),
+		sdm3 = FIELD(readl(base + REG_DSI_28nm_PHY_PLL_SDM_CFG3),
 				DSI_28nm_PHY_PLL_SDM_CFG3_FREQ_SEED_15_8);
 		sdm_freq_seed = (sdm3 << 8) | sdm2;
 		DBG("sdm_freq_seed = %d", sdm_freq_seed);
@@ -318,7 +318,7 @@ static int _dsi_pll_28nm_vco_prepare_hpm(struct dsi_pll_28nm *pll_28nm)
 		/* DSI Uniphy lock detect setting */
 		dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2,
 				     0x0c, 100);
-		dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2, 0x0d);
+		writel(0x0d, base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2);
 
 		/* poll for PLL ready status */
 		locked = pll_28nm_poll_for_ready(pll_28nm, max_reads,
@@ -396,7 +396,7 @@ static int dsi_pll_28nm_vco_prepare_8226(struct clk_hw *hw)
 	 * PLL power up sequence.
 	 * Add necessary delays recommended by hardware.
 	 */
-	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_CAL_CFG1, 0x34);
+	writel(0x34, base + REG_DSI_28nm_PHY_PLL_CAL_CFG1);
 
 	val = DSI_28nm_PHY_PLL_GLB_CFG_PLL_PWRDN_B;
 	dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 200);
@@ -410,10 +410,10 @@ static int dsi_pll_28nm_vco_prepare_8226(struct clk_hw *hw)
 
 	for (i = 0; i < 7; i++) {
 		/* DSI Uniphy lock detect setting */
-		dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2, 0x0d);
+		writel(0x0d, base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2);
 		dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2,
 				0x0c, 100);
-		dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2, 0x0d);
+		writel(0x0d, base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2);
 
 		/* poll for PLL ready status */
 		locked = pll_28nm_poll_for_ready(pll_28nm,
@@ -504,7 +504,7 @@ static void dsi_pll_28nm_vco_unprepare(struct clk_hw *hw)
 	if (unlikely(!pll_28nm->phy->pll_on))
 		return;
 
-	dsi_phy_write(pll_28nm->phy->pll_base + REG_DSI_28nm_PHY_PLL_GLB_CFG, 0x00);
+	writel(0, pll_28nm->phy->pll_base + REG_DSI_28nm_PHY_PLL_GLB_CFG);
 
 	pll_28nm->phy->pll_on = false;
 }
@@ -560,10 +560,10 @@ static void dsi_28nm_pll_save_state(struct msm_dsi_phy *phy)
 	void __iomem *base = pll_28nm->phy->pll_base;
 
 	cached_state->postdiv3 =
-			dsi_phy_read(base + REG_DSI_28nm_PHY_PLL_POSTDIV3_CFG);
+			readl(base + REG_DSI_28nm_PHY_PLL_POSTDIV3_CFG);
 	cached_state->postdiv1 =
-			dsi_phy_read(base + REG_DSI_28nm_PHY_PLL_POSTDIV1_CFG);
-	cached_state->byte_mux = dsi_phy_read(base + REG_DSI_28nm_PHY_PLL_VREG_CFG);
+			readl(base + REG_DSI_28nm_PHY_PLL_POSTDIV1_CFG);
+	cached_state->byte_mux = readl(base + REG_DSI_28nm_PHY_PLL_VREG_CFG);
 	if (dsi_pll_28nm_clk_is_enabled(phy->vco_hw))
 		cached_state->vco_rate = clk_hw_get_rate(phy->vco_hw);
 	else
@@ -585,12 +585,9 @@ static int dsi_28nm_pll_restore_state(struct msm_dsi_phy *phy)
 		return ret;
 	}
 
-	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_POSTDIV3_CFG,
-		      cached_state->postdiv3);
-	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_POSTDIV1_CFG,
-		      cached_state->postdiv1);
-	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_VREG_CFG,
-		      cached_state->byte_mux);
+	writel(cached_state->postdiv3, base + REG_DSI_28nm_PHY_PLL_POSTDIV3_CFG);
+	writel(cached_state->postdiv1, base + REG_DSI_28nm_PHY_PLL_POSTDIV1_CFG);
+	writel(cached_state->byte_mux, base + REG_DSI_28nm_PHY_PLL_VREG_CFG);
 
 	return 0;
 }
@@ -700,72 +697,71 @@ static void dsi_28nm_dphy_set_timing(struct msm_dsi_phy *phy,
 {
 	void __iomem *base = phy->base;
 
-	dsi_phy_write(base + REG_DSI_28nm_PHY_TIMING_CTRL_0,
-		      DSI_28nm_PHY_TIMING_CTRL_0_CLK_ZERO(timing->clk_zero));
-	dsi_phy_write(base + REG_DSI_28nm_PHY_TIMING_CTRL_1,
-		      DSI_28nm_PHY_TIMING_CTRL_1_CLK_TRAIL(timing->clk_trail));
-	dsi_phy_write(base + REG_DSI_28nm_PHY_TIMING_CTRL_2,
-		      DSI_28nm_PHY_TIMING_CTRL_2_CLK_PREPARE(timing->clk_prepare));
+	writel(DSI_28nm_PHY_TIMING_CTRL_0_CLK_ZERO(timing->clk_zero),
+	       base + REG_DSI_28nm_PHY_TIMING_CTRL_0);
+	writel(DSI_28nm_PHY_TIMING_CTRL_1_CLK_TRAIL(timing->clk_trail),
+	       base + REG_DSI_28nm_PHY_TIMING_CTRL_1);
+	writel(DSI_28nm_PHY_TIMING_CTRL_2_CLK_PREPARE(timing->clk_prepare),
+	       base + REG_DSI_28nm_PHY_TIMING_CTRL_2);
 	if (timing->clk_zero & BIT(8))
-		dsi_phy_write(base + REG_DSI_28nm_PHY_TIMING_CTRL_3,
-			      DSI_28nm_PHY_TIMING_CTRL_3_CLK_ZERO_8);
-	dsi_phy_write(base + REG_DSI_28nm_PHY_TIMING_CTRL_4,
-		      DSI_28nm_PHY_TIMING_CTRL_4_HS_EXIT(timing->hs_exit));
-	dsi_phy_write(base + REG_DSI_28nm_PHY_TIMING_CTRL_5,
-		      DSI_28nm_PHY_TIMING_CTRL_5_HS_ZERO(timing->hs_zero));
-	dsi_phy_write(base + REG_DSI_28nm_PHY_TIMING_CTRL_6,
-		      DSI_28nm_PHY_TIMING_CTRL_6_HS_PREPARE(timing->hs_prepare));
-	dsi_phy_write(base + REG_DSI_28nm_PHY_TIMING_CTRL_7,
-		      DSI_28nm_PHY_TIMING_CTRL_7_HS_TRAIL(timing->hs_trail));
-	dsi_phy_write(base + REG_DSI_28nm_PHY_TIMING_CTRL_8,
-		      DSI_28nm_PHY_TIMING_CTRL_8_HS_RQST(timing->hs_rqst));
-	dsi_phy_write(base + REG_DSI_28nm_PHY_TIMING_CTRL_9,
-		      DSI_28nm_PHY_TIMING_CTRL_9_TA_GO(timing->ta_go) |
-		      DSI_28nm_PHY_TIMING_CTRL_9_TA_SURE(timing->ta_sure));
-	dsi_phy_write(base + REG_DSI_28nm_PHY_TIMING_CTRL_10,
-		      DSI_28nm_PHY_TIMING_CTRL_10_TA_GET(timing->ta_get));
-	dsi_phy_write(base + REG_DSI_28nm_PHY_TIMING_CTRL_11,
-		      DSI_28nm_PHY_TIMING_CTRL_11_TRIG3_CMD(0));
+		writel(DSI_28nm_PHY_TIMING_CTRL_3_CLK_ZERO_8,
+		       base + REG_DSI_28nm_PHY_TIMING_CTRL_3);
+	writel(DSI_28nm_PHY_TIMING_CTRL_4_HS_EXIT(timing->hs_exit),
+	       base + REG_DSI_28nm_PHY_TIMING_CTRL_4);
+	writel(DSI_28nm_PHY_TIMING_CTRL_5_HS_ZERO(timing->hs_zero),
+	       base + REG_DSI_28nm_PHY_TIMING_CTRL_5);
+	writel(DSI_28nm_PHY_TIMING_CTRL_6_HS_PREPARE(timing->hs_prepare),
+	       base + REG_DSI_28nm_PHY_TIMING_CTRL_6);
+	writel(DSI_28nm_PHY_TIMING_CTRL_7_HS_TRAIL(timing->hs_trail),
+	       base + REG_DSI_28nm_PHY_TIMING_CTRL_7);
+	writel(DSI_28nm_PHY_TIMING_CTRL_8_HS_RQST(timing->hs_rqst),
+	       base + REG_DSI_28nm_PHY_TIMING_CTRL_8);
+	writel(DSI_28nm_PHY_TIMING_CTRL_9_TA_GO(timing->ta_go) |
+	       DSI_28nm_PHY_TIMING_CTRL_9_TA_SURE(timing->ta_sure),
+	       base + REG_DSI_28nm_PHY_TIMING_CTRL_9);
+	writel(DSI_28nm_PHY_TIMING_CTRL_10_TA_GET(timing->ta_get),
+	       base + REG_DSI_28nm_PHY_TIMING_CTRL_10);
+	writel(DSI_28nm_PHY_TIMING_CTRL_11_TRIG3_CMD(0),
+	       base + REG_DSI_28nm_PHY_TIMING_CTRL_11);
 }
 
 static void dsi_28nm_phy_regulator_enable_dcdc(struct msm_dsi_phy *phy)
 {
 	void __iomem *base = phy->reg_base;
 
-	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_0, 0x0);
-	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CAL_PWR_CFG, 1);
-	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_5, 0);
-	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_3, 0);
-	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_2, 0x3);
-	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_1, 0x9);
-	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_0, 0x7);
-	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_4, 0x20);
-	dsi_phy_write(phy->base + REG_DSI_28nm_PHY_LDO_CNTRL, 0x00);
+	writel(0x0, base + REG_DSI_28nm_PHY_REGULATOR_CTRL_0);
+	writel(1, base + REG_DSI_28nm_PHY_REGULATOR_CAL_PWR_CFG);
+	writel(0, base + REG_DSI_28nm_PHY_REGULATOR_CTRL_5);
+	writel(0, base + REG_DSI_28nm_PHY_REGULATOR_CTRL_3);
+	writel(0x3, base + REG_DSI_28nm_PHY_REGULATOR_CTRL_2);
+	writel(0x9, base + REG_DSI_28nm_PHY_REGULATOR_CTRL_1);
+	writel(0x7, base + REG_DSI_28nm_PHY_REGULATOR_CTRL_0);
+	writel(0x20, base + REG_DSI_28nm_PHY_REGULATOR_CTRL_4);
+	writel(0x00, phy->base + REG_DSI_28nm_PHY_LDO_CNTRL);
 }
 
 static void dsi_28nm_phy_regulator_enable_ldo(struct msm_dsi_phy *phy)
 {
 	void __iomem *base = phy->reg_base;
 
-	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_0, 0x0);
-	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CAL_PWR_CFG, 0);
-	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_5, 0x7);
-	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_3, 0);
-	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_2, 0x1);
-	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_1, 0x1);
-	dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_4, 0x20);
+	writel(0x0, base + REG_DSI_28nm_PHY_REGULATOR_CTRL_0);
+	writel(0, base + REG_DSI_28nm_PHY_REGULATOR_CAL_PWR_CFG);
+	writel(0x7, base + REG_DSI_28nm_PHY_REGULATOR_CTRL_5);
+	writel(0, base + REG_DSI_28nm_PHY_REGULATOR_CTRL_3);
+	writel(0x1, base + REG_DSI_28nm_PHY_REGULATOR_CTRL_2);
+	writel(0x1, base + REG_DSI_28nm_PHY_REGULATOR_CTRL_1);
+	writel(0x20, base + REG_DSI_28nm_PHY_REGULATOR_CTRL_4);
 
 	if (phy->cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_LP)
-		dsi_phy_write(phy->base + REG_DSI_28nm_PHY_LDO_CNTRL, 0x05);
+		writel(0x05, phy->base + REG_DSI_28nm_PHY_LDO_CNTRL);
 	else
-		dsi_phy_write(phy->base + REG_DSI_28nm_PHY_LDO_CNTRL, 0x0d);
+		writel(0x0d, phy->base + REG_DSI_28nm_PHY_LDO_CNTRL);
 }
 
 static void dsi_28nm_phy_regulator_ctrl(struct msm_dsi_phy *phy, bool enable)
 {
 	if (!enable) {
-		dsi_phy_write(phy->reg_base +
-			      REG_DSI_28nm_PHY_REGULATOR_CAL_PWR_CFG, 0);
+		writel(0, phy->reg_base + REG_DSI_28nm_PHY_REGULATOR_CAL_PWR_CFG);
 		return;
 	}
 
@@ -792,49 +788,49 @@ static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy,
 		return -EINVAL;
 	}
 
-	dsi_phy_write(base + REG_DSI_28nm_PHY_STRENGTH_0, 0xff);
+	writel(0xff, base + REG_DSI_28nm_PHY_STRENGTH_0);
 
 	dsi_28nm_phy_regulator_ctrl(phy, true);
 
 	dsi_28nm_dphy_set_timing(phy, timing);
 
-	dsi_phy_write(base + REG_DSI_28nm_PHY_CTRL_1, 0x00);
-	dsi_phy_write(base + REG_DSI_28nm_PHY_CTRL_0, 0x5f);
+	writel(0x00, base + REG_DSI_28nm_PHY_CTRL_1);
+	writel(0x5f, base + REG_DSI_28nm_PHY_CTRL_0);
 
-	dsi_phy_write(base + REG_DSI_28nm_PHY_STRENGTH_1, 0x6);
+	writel(0x6, base + REG_DSI_28nm_PHY_STRENGTH_1);
 
 	for (i = 0; i < 4; i++) {
-		dsi_phy_write(base + REG_DSI_28nm_PHY_LN_CFG_0(i), 0);
-		dsi_phy_write(base + REG_DSI_28nm_PHY_LN_CFG_1(i), 0);
-		dsi_phy_write(base + REG_DSI_28nm_PHY_LN_CFG_2(i), 0);
-		dsi_phy_write(base + REG_DSI_28nm_PHY_LN_CFG_3(i), 0);
-		dsi_phy_write(base + REG_DSI_28nm_PHY_LN_CFG_4(i), 0);
-		dsi_phy_write(base + REG_DSI_28nm_PHY_LN_TEST_DATAPATH(i), 0);
-		dsi_phy_write(base + REG_DSI_28nm_PHY_LN_DEBUG_SEL(i), 0);
-		dsi_phy_write(base + REG_DSI_28nm_PHY_LN_TEST_STR_0(i), 0x1);
-		dsi_phy_write(base + REG_DSI_28nm_PHY_LN_TEST_STR_1(i), 0x97);
+		writel(0, base + REG_DSI_28nm_PHY_LN_CFG_0(i));
+		writel(0, base + REG_DSI_28nm_PHY_LN_CFG_1(i));
+		writel(0, base + REG_DSI_28nm_PHY_LN_CFG_2(i));
+		writel(0, base + REG_DSI_28nm_PHY_LN_CFG_3(i));
+		writel(0, base + REG_DSI_28nm_PHY_LN_CFG_4(i));
+		writel(0, base + REG_DSI_28nm_PHY_LN_TEST_DATAPATH(i));
+		writel(0, base + REG_DSI_28nm_PHY_LN_DEBUG_SEL(i));
+		writel(0x1, base + REG_DSI_28nm_PHY_LN_TEST_STR_0(i));
+		writel(0x97, base + REG_DSI_28nm_PHY_LN_TEST_STR_1(i));
 	}
 
-	dsi_phy_write(base + REG_DSI_28nm_PHY_LNCK_CFG_4, 0);
-	dsi_phy_write(base + REG_DSI_28nm_PHY_LNCK_CFG_1, 0xc0);
-	dsi_phy_write(base + REG_DSI_28nm_PHY_LNCK_TEST_STR0, 0x1);
-	dsi_phy_write(base + REG_DSI_28nm_PHY_LNCK_TEST_STR1, 0xbb);
+	writel(0, base + REG_DSI_28nm_PHY_LNCK_CFG_4);
+	writel(0xc0, base + REG_DSI_28nm_PHY_LNCK_CFG_1);
+	writel(0x1, base + REG_DSI_28nm_PHY_LNCK_TEST_STR0);
+	writel(0xbb, base + REG_DSI_28nm_PHY_LNCK_TEST_STR1);
 
-	dsi_phy_write(base + REG_DSI_28nm_PHY_CTRL_0, 0x5f);
+	writel(0x5f, base + REG_DSI_28nm_PHY_CTRL_0);
 
-	val = dsi_phy_read(base + REG_DSI_28nm_PHY_GLBL_TEST_CTRL);
+	val = readl(base + REG_DSI_28nm_PHY_GLBL_TEST_CTRL);
 	if (phy->id == DSI_1 && phy->usecase == MSM_DSI_PHY_SLAVE)
 		val &= ~DSI_28nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL;
 	else
 		val |= DSI_28nm_PHY_GLBL_TEST_CTRL_BITCLK_HS_SEL;
-	dsi_phy_write(base + REG_DSI_28nm_PHY_GLBL_TEST_CTRL, val);
+	writel(val, base + REG_DSI_28nm_PHY_GLBL_TEST_CTRL);
 
 	return 0;
 }
 
 static void dsi_28nm_phy_disable(struct msm_dsi_phy *phy)
 {
-	dsi_phy_write(phy->base + REG_DSI_28nm_PHY_CTRL_0, 0);
+	writel(0, phy->base + REG_DSI_28nm_PHY_CTRL_0);
 	dsi_28nm_phy_regulator_ctrl(phy, false);
 
 	/*
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index 26c08047e20c..5311ab7f3c70 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -74,7 +74,7 @@ static bool pll_28nm_poll_for_ready(struct dsi_pll_28nm *pll_28nm,
 	u32 val;
 
 	while (nb_tries--) {
-		val = dsi_phy_read(pll_28nm->phy->pll_base + REG_DSI_28nm_8960_PHY_PLL_RDY);
+		val = readl(pll_28nm->phy->pll_base + REG_DSI_28nm_8960_PHY_PLL_RDY);
 		pll_locked = !!(val & DSI_28nm_8960_PHY_PLL_RDY_PLL_RDY);
 
 		if (pll_locked)
@@ -103,30 +103,25 @@ static int dsi_pll_28nm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	val = VCO_REF_CLK_RATE / 10;
 	fb_divider = (temp * VCO_PREF_DIV_RATIO) / val;
 	fb_divider = fb_divider / 2 - 1;
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_1,
-		      fb_divider & 0xff);
+	writel(fb_divider & 0xff, base + REG_DSI_28nm_8960_PHY_PLL_CTRL_1);
 
-	val = dsi_phy_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_2);
+	val = readl(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_2);
 
 	val |= (fb_divider >> 8) & 0x07;
 
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_2,
-		      val);
+	writel(val, base + REG_DSI_28nm_8960_PHY_PLL_CTRL_2);
 
-	val = dsi_phy_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_3);
+	val = readl(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_3);
 
 	val |= (VCO_PREF_DIV_RATIO - 1) & 0x3f;
 
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_3,
-		      val);
+	writel(val, base + REG_DSI_28nm_8960_PHY_PLL_CTRL_3);
 
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_6,
-		      0xf);
+	writel(0xf, base + REG_DSI_28nm_8960_PHY_PLL_CTRL_6);
 
-	val = dsi_phy_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8);
+	val = readl(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8);
 	val |= 0x7 << 4;
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8,
-		      val);
+	writel(val, base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8);
 
 	return 0;
 }
@@ -149,16 +144,16 @@ static unsigned long dsi_pll_28nm_clk_recalc_rate(struct clk_hw *hw,
 
 	VERB("parent_rate=%lu", parent_rate);
 
-	status = dsi_phy_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_0);
+	status = readl(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_0);
 
 	if (status & DSI_28nm_8960_PHY_PLL_CTRL_0_ENABLE) {
-		fb_divider = dsi_phy_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_1);
+		fb_divider = readl(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_1);
 		fb_divider &= 0xff;
-		temp = dsi_phy_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_2) & 0x07;
+		temp = readl(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_2) & 0x07;
 		fb_divider = (temp << 8) | fb_divider;
 		fb_divider += 1;
 
-		ref_divider = dsi_phy_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_3);
+		ref_divider = readl(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_3);
 		ref_divider &= 0x3f;
 		ref_divider += 1;
 
@@ -195,18 +190,18 @@ static int dsi_pll_28nm_vco_prepare(struct clk_hw *hw)
 	 * 2: divide by 8 to get bit clock divider
 	 * 3: write it to POSTDIV1
 	 */
-	val = dsi_phy_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_9);
+	val = readl(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_9);
 	byte_div = val + 1;
 	bit_div = byte_div / 8;
 
-	val = dsi_phy_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8);
+	val = readl(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8);
 	val &= ~0xf;
 	val |= (bit_div - 1);
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8, val);
+	writel(val, base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8);
 
 	/* enable the PLL */
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_0,
-		      DSI_28nm_8960_PHY_PLL_CTRL_0_ENABLE);
+	writel(DSI_28nm_8960_PHY_PLL_CTRL_0_ENABLE,
+	       base + REG_DSI_28nm_8960_PHY_PLL_CTRL_0);
 
 	locked = pll_28nm_poll_for_ready(pll_28nm, max_reads, timeout_us);
 
@@ -230,7 +225,7 @@ static void dsi_pll_28nm_vco_unprepare(struct clk_hw *hw)
 	if (unlikely(!pll_28nm->phy->pll_on))
 		return;
 
-	dsi_phy_write(pll_28nm->phy->pll_base + REG_DSI_28nm_8960_PHY_PLL_CTRL_0, 0x00);
+	writel(0x00, pll_28nm->phy->pll_base + REG_DSI_28nm_8960_PHY_PLL_CTRL_0);
 
 	pll_28nm->phy->pll_on = false;
 }
@@ -277,7 +272,7 @@ static unsigned long clk_bytediv_recalc_rate(struct clk_hw *hw,
 	struct clk_bytediv *bytediv = to_clk_bytediv(hw);
 	unsigned int div;
 
-	div = dsi_phy_read(bytediv->reg) & 0xff;
+	div = readl(bytediv->reg) & 0xff;
 
 	return parent_rate / (div + 1);
 }
@@ -323,9 +318,9 @@ static int clk_bytediv_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	factor = get_vco_mul_factor(rate);
 
-	val = dsi_phy_read(bytediv->reg);
+	val = readl(bytediv->reg);
 	val |= (factor - 1) & 0xff;
-	dsi_phy_write(bytediv->reg, val);
+	writel(val, bytediv->reg);
 
 	return 0;
 }
@@ -347,11 +342,11 @@ static void dsi_28nm_pll_save_state(struct msm_dsi_phy *phy)
 	void __iomem *base = pll_28nm->phy->pll_base;
 
 	cached_state->postdiv3 =
-			dsi_phy_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_10);
+			readl(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_10);
 	cached_state->postdiv2 =
-			dsi_phy_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_9);
+			readl(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_9);
 	cached_state->postdiv1 =
-			dsi_phy_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8);
+			readl(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8);
 
 	cached_state->vco_rate = clk_hw_get_rate(phy->vco_hw);
 }
@@ -371,12 +366,9 @@ static int dsi_28nm_pll_restore_state(struct msm_dsi_phy *phy)
 		return ret;
 	}
 
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_10,
-		      cached_state->postdiv3);
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_9,
-		      cached_state->postdiv2);
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8,
-		      cached_state->postdiv1);
+	writel(cached_state->postdiv3, base + REG_DSI_28nm_8960_PHY_PLL_CTRL_10);
+	writel(cached_state->postdiv2, base + REG_DSI_28nm_8960_PHY_PLL_CTRL_9);
+	writel(cached_state->postdiv1, base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8);
 
 	return 0;
 }
@@ -477,53 +469,52 @@ static void dsi_28nm_dphy_set_timing(struct msm_dsi_phy *phy,
 {
 	void __iomem *base = phy->base;
 
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_TIMING_CTRL_0,
-		      DSI_28nm_8960_PHY_TIMING_CTRL_0_CLK_ZERO(timing->clk_zero));
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_TIMING_CTRL_1,
-		      DSI_28nm_8960_PHY_TIMING_CTRL_1_CLK_TRAIL(timing->clk_trail));
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_TIMING_CTRL_2,
-		      DSI_28nm_8960_PHY_TIMING_CTRL_2_CLK_PREPARE(timing->clk_prepare));
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_TIMING_CTRL_3, 0x0);
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_TIMING_CTRL_4,
-		      DSI_28nm_8960_PHY_TIMING_CTRL_4_HS_EXIT(timing->hs_exit));
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_TIMING_CTRL_5,
-		      DSI_28nm_8960_PHY_TIMING_CTRL_5_HS_ZERO(timing->hs_zero));
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_TIMING_CTRL_6,
-		      DSI_28nm_8960_PHY_TIMING_CTRL_6_HS_PREPARE(timing->hs_prepare));
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_TIMING_CTRL_7,
-		      DSI_28nm_8960_PHY_TIMING_CTRL_7_HS_TRAIL(timing->hs_trail));
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_TIMING_CTRL_8,
-		      DSI_28nm_8960_PHY_TIMING_CTRL_8_HS_RQST(timing->hs_rqst));
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_TIMING_CTRL_9,
-		      DSI_28nm_8960_PHY_TIMING_CTRL_9_TA_GO(timing->ta_go) |
-		      DSI_28nm_8960_PHY_TIMING_CTRL_9_TA_SURE(timing->ta_sure));
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_TIMING_CTRL_10,
-		      DSI_28nm_8960_PHY_TIMING_CTRL_10_TA_GET(timing->ta_get));
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_TIMING_CTRL_11,
-		      DSI_28nm_8960_PHY_TIMING_CTRL_11_TRIG3_CMD(0));
+	writel(DSI_28nm_8960_PHY_TIMING_CTRL_0_CLK_ZERO(timing->clk_zero),
+	       base + REG_DSI_28nm_8960_PHY_TIMING_CTRL_0);
+	writel(DSI_28nm_8960_PHY_TIMING_CTRL_1_CLK_TRAIL(timing->clk_trail),
+	       base + REG_DSI_28nm_8960_PHY_TIMING_CTRL_1);
+	writel(DSI_28nm_8960_PHY_TIMING_CTRL_2_CLK_PREPARE(timing->clk_prepare),
+	       base + REG_DSI_28nm_8960_PHY_TIMING_CTRL_2);
+	writel(0, base + REG_DSI_28nm_8960_PHY_TIMING_CTRL_3);
+	writel(DSI_28nm_8960_PHY_TIMING_CTRL_4_HS_EXIT(timing->hs_exit),
+	       base + REG_DSI_28nm_8960_PHY_TIMING_CTRL_4);
+	writel(DSI_28nm_8960_PHY_TIMING_CTRL_5_HS_ZERO(timing->hs_zero),
+	       base + REG_DSI_28nm_8960_PHY_TIMING_CTRL_5);
+	writel(DSI_28nm_8960_PHY_TIMING_CTRL_6_HS_PREPARE(timing->hs_prepare),
+	       base + REG_DSI_28nm_8960_PHY_TIMING_CTRL_6);
+	writel(DSI_28nm_8960_PHY_TIMING_CTRL_7_HS_TRAIL(timing->hs_trail),
+	       base + REG_DSI_28nm_8960_PHY_TIMING_CTRL_7);
+	writel(DSI_28nm_8960_PHY_TIMING_CTRL_8_HS_RQST(timing->hs_rqst),
+	       base + REG_DSI_28nm_8960_PHY_TIMING_CTRL_8);
+	writel(DSI_28nm_8960_PHY_TIMING_CTRL_9_TA_GO(timing->ta_go) |
+	       DSI_28nm_8960_PHY_TIMING_CTRL_9_TA_SURE(timing->ta_sure),
+	       base + REG_DSI_28nm_8960_PHY_TIMING_CTRL_9);
+	writel(DSI_28nm_8960_PHY_TIMING_CTRL_10_TA_GET(timing->ta_get),
+	       base + REG_DSI_28nm_8960_PHY_TIMING_CTRL_10);
+	writel(DSI_28nm_8960_PHY_TIMING_CTRL_11_TRIG3_CMD(0),
+	       base + REG_DSI_28nm_8960_PHY_TIMING_CTRL_11);
 }
 
 static void dsi_28nm_phy_regulator_init(struct msm_dsi_phy *phy)
 {
 	void __iomem *base = phy->reg_base;
 
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CTRL_0, 0x3);
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CTRL_1, 1);
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CTRL_2, 1);
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CTRL_3, 0);
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CTRL_4,
-		      0x100);
+	writel(0x3, base + REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CTRL_0);
+	writel(1, base + REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CTRL_1);
+	writel(1, base + REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CTRL_2);
+	writel(0, base + REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CTRL_3);
+	writel(0x100, base + REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CTRL_4);
 }
 
 static void dsi_28nm_phy_regulator_ctrl(struct msm_dsi_phy *phy)
 {
 	void __iomem *base = phy->reg_base;
 
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CTRL_0, 0x3);
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CTRL_1, 0xa);
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CTRL_2, 0x4);
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CTRL_3, 0x0);
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CTRL_4, 0x20);
+	writel(0x3, base + REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CTRL_0);
+	writel(0xa, base + REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CTRL_1);
+	writel(0x4, base + REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CTRL_2);
+	writel(0x0, base + REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CTRL_3);
+	writel(0x20, base + REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CTRL_4);
 }
 
 static void dsi_28nm_phy_calibration(struct msm_dsi_phy *phy)
@@ -532,21 +523,20 @@ static void dsi_28nm_phy_calibration(struct msm_dsi_phy *phy)
 	u32 status;
 	int i = 5000;
 
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CAL_PWR_CFG,
-		      0x3);
+	writel(0x3, base + REG_DSI_28nm_8960_PHY_MISC_REGULATOR_CAL_PWR_CFG);
 
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_MISC_CAL_SW_CFG_2, 0x0);
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_MISC_CAL_HW_CFG_1, 0x5a);
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_MISC_CAL_HW_CFG_3, 0x10);
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_MISC_CAL_HW_CFG_4, 0x1);
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_MISC_CAL_HW_CFG_0, 0x1);
+	writel(0x0, base + REG_DSI_28nm_8960_PHY_MISC_CAL_SW_CFG_2);
+	writel(0x5a, base + REG_DSI_28nm_8960_PHY_MISC_CAL_HW_CFG_1);
+	writel(0x10, base + REG_DSI_28nm_8960_PHY_MISC_CAL_HW_CFG_3);
+	writel(0x1, base + REG_DSI_28nm_8960_PHY_MISC_CAL_HW_CFG_4);
+	writel(0x1, base + REG_DSI_28nm_8960_PHY_MISC_CAL_HW_CFG_0);
 
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_MISC_CAL_HW_TRIGGER, 0x1);
+	writel(0x1, base + REG_DSI_28nm_8960_PHY_MISC_CAL_HW_TRIGGER);
 	usleep_range(5000, 6000);
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_MISC_CAL_HW_TRIGGER, 0x0);
+	writel(0x0, base + REG_DSI_28nm_8960_PHY_MISC_CAL_HW_TRIGGER);
 
 	do {
-		status = dsi_phy_read(base +
+		status = readl(base +
 				REG_DSI_28nm_8960_PHY_MISC_CAL_STATUS);
 
 		if (!(status & DSI_28nm_8960_PHY_MISC_CAL_STATUS_CAL_BUSY))
@@ -562,23 +552,20 @@ static void dsi_28nm_phy_lane_config(struct msm_dsi_phy *phy)
 	int i;
 
 	for (i = 0; i < 4; i++) {
-		dsi_phy_write(base + REG_DSI_28nm_8960_PHY_LN_CFG_0(i), 0x80);
-		dsi_phy_write(base + REG_DSI_28nm_8960_PHY_LN_CFG_1(i), 0x45);
-		dsi_phy_write(base + REG_DSI_28nm_8960_PHY_LN_CFG_2(i), 0x00);
-		dsi_phy_write(base + REG_DSI_28nm_8960_PHY_LN_TEST_DATAPATH(i),
-			      0x00);
-		dsi_phy_write(base + REG_DSI_28nm_8960_PHY_LN_TEST_STR_0(i),
-			      0x01);
-		dsi_phy_write(base + REG_DSI_28nm_8960_PHY_LN_TEST_STR_1(i),
-			      0x66);
+		writel(0x80, base + REG_DSI_28nm_8960_PHY_LN_CFG_0(i));
+		writel(0x45, base + REG_DSI_28nm_8960_PHY_LN_CFG_1(i));
+		writel(0x00, base + REG_DSI_28nm_8960_PHY_LN_CFG_2(i));
+		writel(0x00, base + REG_DSI_28nm_8960_PHY_LN_TEST_DATAPATH(i));
+		writel(0x01, base + REG_DSI_28nm_8960_PHY_LN_TEST_STR_0(i));
+		writel(0x66, base + REG_DSI_28nm_8960_PHY_LN_TEST_STR_1(i));
 	}
 
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_LNCK_CFG_0, 0x40);
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_LNCK_CFG_1, 0x67);
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_LNCK_CFG_2, 0x0);
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_LNCK_TEST_DATAPATH, 0x0);
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_LNCK_TEST_STR0, 0x1);
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_LNCK_TEST_STR1, 0x88);
+	writel(0x40, base + REG_DSI_28nm_8960_PHY_LNCK_CFG_0);
+	writel(0x67, base + REG_DSI_28nm_8960_PHY_LNCK_CFG_1);
+	writel(0x0, base + REG_DSI_28nm_8960_PHY_LNCK_CFG_2);
+	writel(0x0, base + REG_DSI_28nm_8960_PHY_LNCK_TEST_DATAPATH);
+	writel(0x1, base + REG_DSI_28nm_8960_PHY_LNCK_TEST_STR0);
+	writel(0x88, base + REG_DSI_28nm_8960_PHY_LNCK_TEST_STR1);
 }
 
 static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy,
@@ -598,18 +585,18 @@ static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy,
 
 	dsi_28nm_phy_regulator_init(phy);
 
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_LDO_CTRL, 0x04);
+	writel(0x04, base + REG_DSI_28nm_8960_PHY_LDO_CTRL);
 
 	/* strength control */
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_STRENGTH_0, 0xff);
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_STRENGTH_1, 0x00);
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_STRENGTH_2, 0x06);
+	writel(0xff, base + REG_DSI_28nm_8960_PHY_STRENGTH_0);
+	writel(0x00, base + REG_DSI_28nm_8960_PHY_STRENGTH_1);
+	writel(0x06, base + REG_DSI_28nm_8960_PHY_STRENGTH_2);
 
 	/* phy ctrl */
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_CTRL_0, 0x5f);
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_CTRL_1, 0x00);
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_CTRL_2, 0x00);
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_CTRL_3, 0x10);
+	writel(0x5f, base + REG_DSI_28nm_8960_PHY_CTRL_0);
+	writel(0x00, base + REG_DSI_28nm_8960_PHY_CTRL_1);
+	writel(0x00, base + REG_DSI_28nm_8960_PHY_CTRL_2);
+	writel(0x10, base + REG_DSI_28nm_8960_PHY_CTRL_3);
 
 	dsi_28nm_phy_regulator_ctrl(phy);
 
@@ -617,10 +604,10 @@ static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy,
 
 	dsi_28nm_phy_lane_config(phy);
 
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_BIST_CTRL_4, 0x0f);
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_BIST_CTRL_1, 0x03);
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_BIST_CTRL_0, 0x03);
-	dsi_phy_write(base + REG_DSI_28nm_8960_PHY_BIST_CTRL_4, 0x0);
+	writel(0x0f, base + REG_DSI_28nm_8960_PHY_BIST_CTRL_4);
+	writel(0x03, base + REG_DSI_28nm_8960_PHY_BIST_CTRL_1);
+	writel(0x03, base + REG_DSI_28nm_8960_PHY_BIST_CTRL_0);
+	writel(0x0, base + REG_DSI_28nm_8960_PHY_BIST_CTRL_4);
 
 	dsi_28nm_dphy_set_timing(phy, timing);
 
@@ -629,7 +616,7 @@ static int dsi_28nm_phy_enable(struct msm_dsi_phy *phy,
 
 static void dsi_28nm_phy_disable(struct msm_dsi_phy *phy)
 {
-	dsi_phy_write(phy->base + REG_DSI_28nm_8960_PHY_CTRL_0, 0x0);
+	writel(0x0, phy->base + REG_DSI_28nm_8960_PHY_CTRL_0);
 
 	/*
 	 * Wait for the registers writes to complete in order to
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 82d015aa2d63..3b59137ca674 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -194,20 +194,20 @@ static void dsi_pll_ssc_commit(struct dsi_pll_7nm *pll, struct dsi_pll_config *c
 	if (config->enable_ssc) {
 		pr_debug("SSC is enabled\n");
 
-		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_SSC_STEPSIZE_LOW_1,
-			      config->ssc_stepsize & 0xff);
-		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_SSC_STEPSIZE_HIGH_1,
-			      config->ssc_stepsize >> 8);
-		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_SSC_DIV_PER_LOW_1,
-			      config->ssc_div_per & 0xff);
-		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_SSC_DIV_PER_HIGH_1,
-			      config->ssc_div_per >> 8);
-		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_SSC_ADJPER_LOW_1,
-			      config->ssc_adj_per & 0xff);
-		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_SSC_ADJPER_HIGH_1,
-			      config->ssc_adj_per >> 8);
-		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_SSC_CONTROL,
-			      SSC_EN | (config->ssc_center ? SSC_CENTER : 0));
+		writel(config->ssc_stepsize & 0xff,
+		       base + REG_DSI_7nm_PHY_PLL_SSC_STEPSIZE_LOW_1);
+		writel(config->ssc_stepsize >> 8,
+		       base + REG_DSI_7nm_PHY_PLL_SSC_STEPSIZE_HIGH_1);
+		writel(config->ssc_div_per & 0xff,
+		       base + REG_DSI_7nm_PHY_PLL_SSC_DIV_PER_LOW_1);
+		writel(config->ssc_div_per >> 8,
+		       base + REG_DSI_7nm_PHY_PLL_SSC_DIV_PER_HIGH_1);
+		writel(config->ssc_adj_per & 0xff,
+		       base + REG_DSI_7nm_PHY_PLL_SSC_ADJPER_LOW_1);
+		writel(config->ssc_adj_per >> 8,
+		       base + REG_DSI_7nm_PHY_PLL_SSC_ADJPER_HIGH_1);
+		writel(SSC_EN | (config->ssc_center ? SSC_CENTER : 0),
+		       base + REG_DSI_7nm_PHY_PLL_SSC_CONTROL);
 	}
 }
 
@@ -242,36 +242,35 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_7nm *pll)
 			vco_config_1 = 0x01;
 	}
 
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_FIVE_1,
-		      analog_controls_five_1);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_VCO_CONFIG_1, vco_config_1);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_FIVE, 0x01);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_TWO, 0x03);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_THREE, 0x00);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_DSM_DIVIDER, 0x00);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_FEEDBACK_DIVIDER, 0x4e);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_CALIBRATION_SETTINGS, 0x40);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_BAND_SEL_CAL_SETTINGS_THREE, 0xba);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_FREQ_DETECT_SETTINGS_ONE, 0x0c);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_OUTDIV, 0x00);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_CORE_OVERRIDE, 0x00);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PLL_DIGITAL_TIMERS_TWO, 0x08);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PLL_PROP_GAIN_RATE_1, 0x0a);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PLL_BAND_SEL_RATE_1, 0xc0);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PLL_INT_GAIN_IFILT_BAND_1, 0x84);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PLL_INT_GAIN_IFILT_BAND_1, 0x82);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PLL_FL_INT_GAIN_PFILT_BAND_1, 0x4c);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCK_OVERRIDE, 0x80);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PFILT, 0x29);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PFILT, 0x2f);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_IFILT, 0x2a);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_IFILT,
-		  !(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1) ? 0x3f : 0x22);
+	writel(analog_controls_five_1, base + REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_FIVE_1);
+	writel(vco_config_1, base + REG_DSI_7nm_PHY_PLL_VCO_CONFIG_1);
+	writel(0x01, base + REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_FIVE);
+	writel(0x03, base + REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_TWO);
+	writel(0x00, base + REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_THREE);
+	writel(0x00, base + REG_DSI_7nm_PHY_PLL_DSM_DIVIDER);
+	writel(0x4e, base + REG_DSI_7nm_PHY_PLL_FEEDBACK_DIVIDER);
+	writel(0x40, base + REG_DSI_7nm_PHY_PLL_CALIBRATION_SETTINGS);
+	writel(0xba, base + REG_DSI_7nm_PHY_PLL_BAND_SEL_CAL_SETTINGS_THREE);
+	writel(0x0c, base + REG_DSI_7nm_PHY_PLL_FREQ_DETECT_SETTINGS_ONE);
+	writel(0x00, base + REG_DSI_7nm_PHY_PLL_OUTDIV);
+	writel(0x00, base + REG_DSI_7nm_PHY_PLL_CORE_OVERRIDE);
+	writel(0x08, base + REG_DSI_7nm_PHY_PLL_PLL_DIGITAL_TIMERS_TWO);
+	writel(0x0a, base + REG_DSI_7nm_PHY_PLL_PLL_PROP_GAIN_RATE_1);
+	writel(0xc0, base + REG_DSI_7nm_PHY_PLL_PLL_BAND_SEL_RATE_1);
+	writel(0x84, base + REG_DSI_7nm_PHY_PLL_PLL_INT_GAIN_IFILT_BAND_1);
+	writel(0x82, base + REG_DSI_7nm_PHY_PLL_PLL_INT_GAIN_IFILT_BAND_1);
+	writel(0x4c, base + REG_DSI_7nm_PHY_PLL_PLL_FL_INT_GAIN_PFILT_BAND_1);
+	writel(0x80, base + REG_DSI_7nm_PHY_PLL_PLL_LOCK_OVERRIDE);
+	writel(0x29, base + REG_DSI_7nm_PHY_PLL_PFILT);
+	writel(0x2f, base + REG_DSI_7nm_PHY_PLL_PFILT);
+	writel(0x2a, base + REG_DSI_7nm_PHY_PLL_IFILT);
+	writel(!(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1) ? 0x3f : 0x22,
+	       base + REG_DSI_7nm_PHY_PLL_IFILT);
 
 	if (!(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1)) {
-		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE, 0x22);
+		writel(0x22, base + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE);
 		if (pll->slave)
-			dsi_phy_write(pll->slave->phy->pll_base + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE, 0x22);
+			writel(0x22, pll->slave->phy->pll_base + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE);
 	}
 }
 
@@ -279,21 +278,21 @@ static void dsi_pll_commit(struct dsi_pll_7nm *pll, struct dsi_pll_config *confi
 {
 	void __iomem *base = pll->phy->pll_base;
 
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_CORE_INPUT_OVERRIDE, 0x12);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_DECIMAL_DIV_START_1,
-		      config->decimal_div_start);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_LOW_1,
-		      config->frac_div_start & 0xff);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_MID_1,
-		      (config->frac_div_start & 0xff00) >> 8);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_HIGH_1,
-		      (config->frac_div_start & 0x30000) >> 16);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCKDET_RATE_1, 0x40);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCK_DELAY, 0x06);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_CMODE_1,
-		      pll->phy->cphy_mode ? 0x00 : 0x10);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_CLOCK_INVERTERS,
-		      config->pll_clock_inverters);
+	writel(0x12, base + REG_DSI_7nm_PHY_PLL_CORE_INPUT_OVERRIDE);
+	writel(config->decimal_div_start,
+	       base + REG_DSI_7nm_PHY_PLL_DECIMAL_DIV_START_1);
+	writel(config->frac_div_start & 0xff,
+	       base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_LOW_1);
+	writel((config->frac_div_start & 0xff00) >> 8,
+	       base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_MID_1);
+	writel((config->frac_div_start & 0x30000) >> 16,
+	       base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_HIGH_1);
+	writel(0x40, base + REG_DSI_7nm_PHY_PLL_PLL_LOCKDET_RATE_1);
+	writel(0x06, base + REG_DSI_7nm_PHY_PLL_PLL_LOCK_DELAY);
+	writel(pll->phy->cphy_mode ? 0x00 : 0x10,
+	       base + REG_DSI_7nm_PHY_PLL_CMODE_1);
+	writel(config->pll_clock_inverters,
+	       base + REG_DSI_7nm_PHY_PLL_CLOCK_INVERTERS);
 }
 
 static int dsi_pll_7nm_vco_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -347,19 +346,19 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
 
 static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
 {
-	u32 data = dsi_phy_read(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
+	u32 data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 
-	dsi_phy_write(pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES, 0);
-	dsi_phy_write(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0, data & ~BIT(5));
+	writel(0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
+	writel(data & ~BIT(5), pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 	ndelay(250);
 }
 
 static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
 {
-	u32 data = dsi_phy_read(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
+	u32 data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 
-	dsi_phy_write(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0, data | BIT(5));
-	dsi_phy_write(pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES, 0xc0);
+	writel(data | BIT(5), pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
+	writel(0xc0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
 	ndelay(250);
 }
 
@@ -367,19 +366,18 @@ static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
 {
 	u32 data;
 
-	data = dsi_phy_read(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
-	dsi_phy_write(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1, data & ~BIT(5));
+	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+	writel(data & ~BIT(5), pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
 }
 
 static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
 {
 	u32 data;
 
-	dsi_phy_write(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_3, 0x04);
+	writel(0x04, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_3);
 
-	data = dsi_phy_read(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
-	dsi_phy_write(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1,
-		      data | BIT(5) | BIT(4));
+	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+	writel(data | BIT(5) | BIT(4), pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
 }
 
 static void dsi_pll_phy_dig_reset(struct dsi_pll_7nm *pll)
@@ -389,9 +387,9 @@ static void dsi_pll_phy_dig_reset(struct dsi_pll_7nm *pll)
 	 * coming out of a CX or analog rail power collapse while
 	 * ensuring that the pads maintain LP00 or LP11 state
 	 */
-	dsi_phy_write(pll->phy->base + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE4, BIT(0));
+	writel(BIT(0), pll->phy->base + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE4);
 	wmb(); /* Ensure that the reset is deasserted */
-	dsi_phy_write(pll->phy->base + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE4, 0x0);
+	writel(0, pll->phy->base + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE4);
 	wmb(); /* Ensure that the reset is deasserted */
 }
 
@@ -405,7 +403,7 @@ static int dsi_pll_7nm_vco_prepare(struct clk_hw *hw)
 		dsi_pll_enable_pll_bias(pll_7nm->slave);
 
 	/* Start PLL */
-	dsi_phy_write(pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_PLL_CNTRL, 0x01);
+	writel(BIT(0), pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_PLL_CNTRL);
 
 	/*
 	 * ensure all PLL configurations are written prior to checking
@@ -441,7 +439,7 @@ static int dsi_pll_7nm_vco_prepare(struct clk_hw *hw)
 
 static void dsi_pll_disable_sub(struct dsi_pll_7nm *pll)
 {
-	dsi_phy_write(pll->phy->base + REG_DSI_7nm_PHY_CMN_RBUF_CTRL, 0);
+	writel(0, pll->phy->base + REG_DSI_7nm_PHY_CMN_RBUF_CTRL);
 	dsi_pll_disable_pll_bias(pll);
 }
 
@@ -455,7 +453,7 @@ static void dsi_pll_7nm_vco_unprepare(struct clk_hw *hw)
 	 * powering down the PLL
 	 */
 	dsi_pll_disable_global_clk(pll_7nm);
-	dsi_phy_write(pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_PLL_CNTRL, 0);
+	writel(0, pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_PLL_CNTRL);
 	dsi_pll_disable_sub(pll_7nm);
 	if (pll_7nm->slave) {
 		dsi_pll_disable_global_clk(pll_7nm->slave);
@@ -478,13 +476,13 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
 	u32 dec;
 	u64 pll_freq, tmp64;
 
-	dec = dsi_phy_read(base + REG_DSI_7nm_PHY_PLL_DECIMAL_DIV_START_1);
+	dec = readl(base + REG_DSI_7nm_PHY_PLL_DECIMAL_DIV_START_1);
 	dec &= 0xff;
 
-	frac = dsi_phy_read(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_LOW_1);
-	frac |= ((dsi_phy_read(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_MID_1) &
+	frac = readl(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_LOW_1);
+	frac |= ((readl(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_MID_1) &
 		  0xff) << 8);
-	frac |= ((dsi_phy_read(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_HIGH_1) &
+	frac |= ((readl(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_HIGH_1) &
 		  0x3) << 16);
 
 	/*
@@ -537,15 +535,15 @@ static void dsi_7nm_pll_save_state(struct msm_dsi_phy *phy)
 	void __iomem *phy_base = pll_7nm->phy->base;
 	u32 cmn_clk_cfg0, cmn_clk_cfg1;
 
-	cached->pll_out_div = dsi_phy_read(pll_7nm->phy->pll_base +
+	cached->pll_out_div = readl(pll_7nm->phy->pll_base +
 			REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
 	cached->pll_out_div &= 0x3;
 
-	cmn_clk_cfg0 = dsi_phy_read(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
+	cmn_clk_cfg0 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
 	cached->bit_clk_div = cmn_clk_cfg0 & 0xf;
 	cached->pix_clk_div = (cmn_clk_cfg0 & 0xf0) >> 4;
 
-	cmn_clk_cfg1 = dsi_phy_read(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+	cmn_clk_cfg1 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
 	cached->pll_mux = cmn_clk_cfg1 & 0x3;
 
 	DBG("DSI PLL%d outdiv %x bit_clk_div %x pix_clk_div %x pll_mux %x",
@@ -561,18 +559,18 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
 	u32 val;
 	int ret;
 
-	val = dsi_phy_read(pll_7nm->phy->pll_base + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
+	val = readl(pll_7nm->phy->pll_base + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
 	val &= ~0x3;
 	val |= cached->pll_out_div;
-	dsi_phy_write(pll_7nm->phy->pll_base + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE, val);
+	writel(val, pll_7nm->phy->pll_base + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
 
-	dsi_phy_write(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0,
-		      cached->bit_clk_div | (cached->pix_clk_div << 4));
+	writel(cached->bit_clk_div | (cached->pix_clk_div << 4),
+	       phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
 
-	val = dsi_phy_read(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+	val = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
 	val &= ~0x3;
 	val |= cached->pll_mux;
-	dsi_phy_write(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1, val);
+	writel(val, phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
 
 	ret = dsi_pll_7nm_vco_set_rate(phy->vco_hw,
 			pll_7nm->vco_current_rate,
@@ -610,7 +608,7 @@ static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
 	}
 
 	/* set PLL src */
-	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CLK_CFG1, (data << 2));
+	writel(data << 2, base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
 
 	return 0;
 }
@@ -712,8 +710,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 	if (pll_7nm->phy->cphy_mode) {
 		u32 data;
 
-		data = dsi_phy_read(pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
-		dsi_phy_write(pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1, data | 3);
+		data = readl(pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+		writel(data | 3, pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
 
 		phy_pll_out_dsi_parent = pll_post_out_div;
 	} else {
@@ -792,7 +790,7 @@ static int dsi_phy_hw_v4_0_is_pll_on(struct msm_dsi_phy *phy)
 	void __iomem *base = phy->base;
 	u32 data = 0;
 
-	data = dsi_phy_read(base + REG_DSI_7nm_PHY_CMN_PLL_CNTRL);
+	data = readl(base + REG_DSI_7nm_PHY_CMN_PLL_CNTRL);
 	mb(); /* make sure read happened */
 
 	return (data & BIT(0));
@@ -808,11 +806,9 @@ static void dsi_phy_hw_v4_0_config_lpcdrx(struct msm_dsi_phy *phy, bool enable)
 	 * corresponding to the logical data lane 0
 	 */
 	if (enable)
-		dsi_phy_write(lane_base +
-			      REG_DSI_7nm_PHY_LN_LPRX_CTRL(phy_lane_0), 0x3);
+		writel(0x3, lane_base + REG_DSI_7nm_PHY_LN_LPRX_CTRL(phy_lane_0));
 	else
-		dsi_phy_write(lane_base +
-			      REG_DSI_7nm_PHY_LN_LPRX_CTRL(phy_lane_0), 0);
+		writel(0, lane_base + REG_DSI_7nm_PHY_LN_LPRX_CTRL(phy_lane_0));
 }
 
 static void dsi_phy_hw_v4_0_lane_settings(struct msm_dsi_phy *phy)
@@ -833,18 +829,18 @@ static void dsi_phy_hw_v4_0_lane_settings(struct msm_dsi_phy *phy)
 		 * be only enabled for the physical data lane corresponding
 		 * to the logical data lane 0
 		 */
-		dsi_phy_write(lane_base + REG_DSI_7nm_PHY_LN_LPRX_CTRL(i), 0);
-		dsi_phy_write(lane_base + REG_DSI_7nm_PHY_LN_PIN_SWAP(i), 0x0);
+		writel(0, lane_base + REG_DSI_7nm_PHY_LN_LPRX_CTRL(i));
+		writel(0x0, lane_base + REG_DSI_7nm_PHY_LN_PIN_SWAP(i));
 	}
 
 	dsi_phy_hw_v4_0_config_lpcdrx(phy, true);
 
 	/* other settings */
 	for (i = 0; i < 5; i++) {
-		dsi_phy_write(lane_base + REG_DSI_7nm_PHY_LN_CFG0(i), 0x0);
-		dsi_phy_write(lane_base + REG_DSI_7nm_PHY_LN_CFG1(i), 0x0);
-		dsi_phy_write(lane_base + REG_DSI_7nm_PHY_LN_CFG2(i), i == 4 ? 0x8a : 0xa);
-		dsi_phy_write(lane_base + REG_DSI_7nm_PHY_LN_TX_DCTRL(i), tx_dctrl[i]);
+		writel(0x0, lane_base + REG_DSI_7nm_PHY_LN_CFG0(i));
+		writel(0x0, lane_base + REG_DSI_7nm_PHY_LN_CFG1(i));
+		writel(i == 4 ? 0x8a : 0xa, lane_base + REG_DSI_7nm_PHY_LN_CFG2(i));
+		writel(tx_dctrl[i], lane_base + REG_DSI_7nm_PHY_LN_TX_DCTRL(i));
 	}
 }
 
@@ -882,7 +878,7 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 	/* Request for REFGEN READY */
 	if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3) ||
 	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
-		dsi_phy_write(phy->base + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE10, 0x1);
+		writel(0x1, phy->base + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE10);
 		udelay(500);
 	}
 
@@ -967,53 +963,53 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 
 	/* de-assert digital and pll power down */
 	data = BIT(6) | BIT(5);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_0, data);
+	writel(data, base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 
 	/* Assert PLL core reset */
-	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_PLL_CNTRL, 0x00);
+	writel(0x00, base + REG_DSI_7nm_PHY_CMN_PLL_CNTRL);
 
 	/* turn off resync FIFO */
-	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_RBUF_CTRL, 0x00);
+	writel(0x00, base + REG_DSI_7nm_PHY_CMN_RBUF_CTRL);
 
 	/* program CMN_CTRL_4 for minor_ver 2 chipsets*/
 	if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2) ||
-	    (dsi_phy_read(base + REG_DSI_7nm_PHY_CMN_REVISION_ID0) & (0xf0)) == 0x20)
-		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_4, 0x04);
+	    (readl(base + REG_DSI_7nm_PHY_CMN_REVISION_ID0) & (0xf0)) == 0x20)
+		writel(0x04, base + REG_DSI_7nm_PHY_CMN_CTRL_4);
 
 	/* Configure PHY lane swap (TODO: we need to calculate this) */
-	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_LANE_CFG0, 0x21);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_LANE_CFG1, 0x84);
+	writel(0x21, base + REG_DSI_7nm_PHY_CMN_LANE_CFG0);
+	writel(0x84, base + REG_DSI_7nm_PHY_CMN_LANE_CFG1);
 
 	if (phy->cphy_mode)
-		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_CTRL, BIT(6));
+		writel(BIT(6), base + REG_DSI_7nm_PHY_CMN_GLBL_CTRL);
 
 	/* Enable LDO */
-	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_VREG_CTRL_0, vreg_ctrl_0);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_VREG_CTRL_1, vreg_ctrl_1);
-
-	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_3, 0x00);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_STR_SWI_CAL_SEL_CTRL,
-		      glbl_str_swi_cal_sel_ctrl);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_HSTX_STR_CTRL_0,
-		      glbl_hstx_str_ctrl_0);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_PEMPH_CTRL_0,
-		      glbl_pemph_ctrl_0);
+	writel(vreg_ctrl_0, base + REG_DSI_7nm_PHY_CMN_VREG_CTRL_0);
+	writel(vreg_ctrl_1, base + REG_DSI_7nm_PHY_CMN_VREG_CTRL_1);
+
+	writel(0x00, base + REG_DSI_7nm_PHY_CMN_CTRL_3);
+	writel(glbl_str_swi_cal_sel_ctrl,
+	       base + REG_DSI_7nm_PHY_CMN_GLBL_STR_SWI_CAL_SEL_CTRL);
+	writel(glbl_hstx_str_ctrl_0,
+	       base + REG_DSI_7nm_PHY_CMN_GLBL_HSTX_STR_CTRL_0);
+	writel(glbl_pemph_ctrl_0,
+	       base + REG_DSI_7nm_PHY_CMN_GLBL_PEMPH_CTRL_0);
 	if (phy->cphy_mode)
-		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_PEMPH_CTRL_1, 0x01);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_RESCODE_OFFSET_TOP_CTRL,
-		      glbl_rescode_top_ctrl);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_RESCODE_OFFSET_BOT_CTRL,
-		      glbl_rescode_bot_ctrl);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_LPTX_STR_CTRL, 0x55);
+		writel(0x01, base + REG_DSI_7nm_PHY_CMN_GLBL_PEMPH_CTRL_1);
+	writel(glbl_rescode_top_ctrl,
+	       base + REG_DSI_7nm_PHY_CMN_GLBL_RESCODE_OFFSET_TOP_CTRL);
+	writel(glbl_rescode_bot_ctrl,
+	       base + REG_DSI_7nm_PHY_CMN_GLBL_RESCODE_OFFSET_BOT_CTRL);
+	writel(0x55, base + REG_DSI_7nm_PHY_CMN_GLBL_LPTX_STR_CTRL);
 
 	/* Remove power down from all blocks */
-	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_0, 0x7f);
+	writel(0x7f, base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 
-	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_LANE_CTRL0, lane_ctrl0);
+	writel(lane_ctrl0, base + REG_DSI_7nm_PHY_CMN_LANE_CTRL0);
 
 	/* Select full-rate mode */
 	if (!phy->cphy_mode)
-		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_2, 0x40);
+		writel(0x40, base + REG_DSI_7nm_PHY_CMN_CTRL_2);
 
 	ret = dsi_7nm_set_usecase(phy);
 	if (ret) {
@@ -1024,34 +1020,34 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 
 	/* DSI PHY timings */
 	if (phy->cphy_mode) {
-		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_0, 0x00);
-		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_4, timing->hs_exit);
-		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_5,
-			      timing->shared_timings.clk_pre);
-		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_6, timing->clk_prepare);
-		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_7,
-			      timing->shared_timings.clk_post);
-		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_8, timing->hs_rqst);
-		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_9, 0x02);
-		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_10, 0x04);
-		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_11, 0x00);
+		writel(0x00, base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_0);
+		writel(timing->hs_exit, base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_4);
+		writel(timing->shared_timings.clk_pre,
+		       base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_5);
+		writel(timing->clk_prepare, base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_6);
+		writel(timing->shared_timings.clk_post,
+		       base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_7);
+		writel(timing->hs_rqst, base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_8);
+		writel(0x02, base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_9);
+		writel(0x04, base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_10);
+		writel(0x00, base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_11);
 	} else {
-		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_0, 0x00);
-		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_1, timing->clk_zero);
-		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_2, timing->clk_prepare);
-		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_3, timing->clk_trail);
-		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_4, timing->hs_exit);
-		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_5, timing->hs_zero);
-		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_6, timing->hs_prepare);
-		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_7, timing->hs_trail);
-		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_8, timing->hs_rqst);
-		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_9, 0x02);
-		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_10, 0x04);
-		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_11, 0x00);
-		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_12,
-			      timing->shared_timings.clk_pre);
-		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_13,
-			      timing->shared_timings.clk_post);
+		writel(0x00, base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_0);
+		writel(timing->clk_zero, base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_1);
+		writel(timing->clk_prepare, base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_2);
+		writel(timing->clk_trail, base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_3);
+		writel(timing->hs_exit, base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_4);
+		writel(timing->hs_zero, base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_5);
+		writel(timing->hs_prepare, base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_6);
+		writel(timing->hs_trail, base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_7);
+		writel(timing->hs_rqst, base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_8);
+		writel(0x02, base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_9);
+		writel(0x04, base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_10);
+		writel(0x00, base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_11);
+		writel(timing->shared_timings.clk_pre,
+		       base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_12);
+		writel(timing->shared_timings.clk_post,
+		       base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_13);
 	}
 
 	/* DSI lane settings */
@@ -1067,12 +1063,12 @@ static bool dsi_7nm_set_continuous_clock(struct msm_dsi_phy *phy, bool enable)
 	void __iomem *base = phy->base;
 	u32 data;
 
-	data = dsi_phy_read(base + REG_DSI_7nm_PHY_CMN_LANE_CTRL1);
+	data = readl(base + REG_DSI_7nm_PHY_CMN_LANE_CTRL1);
 	if (enable)
 		data |= BIT(5) | BIT(6);
 	else
 		data &= ~(BIT(5) | BIT(6));
-	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_LANE_CTRL1, data);
+	writel(data, base + REG_DSI_7nm_PHY_CMN_LANE_CTRL1);
 
 	return enable;
 }
@@ -1092,21 +1088,21 @@ static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
 	/* Turn off REFGEN Vote */
 	if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3) ||
 	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
-		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE10, 0x0);
+		writel(0x0, base + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE10);
 		wmb();
 		/* Delay to ensure HW removes vote before PHY shut down */
 		udelay(2);
 	}
 
-	data = dsi_phy_read(base + REG_DSI_7nm_PHY_CMN_CTRL_0);
+	data = readl(base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 
 	/* disable all lanes */
 	data &= ~0x1F;
-	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_0, data);
-	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_LANE_CTRL0, 0);
+	writel(data, base + REG_DSI_7nm_PHY_CMN_CTRL_0);
+	writel(0, base + REG_DSI_7nm_PHY_CMN_LANE_CTRL0);
 
 	/* Turn off all PHY blocks */
-	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_0, 0x00);
+	writel(0x00, base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 	/* make sure phy is turned off */
 	wmb();
 

-- 
2.40.1


