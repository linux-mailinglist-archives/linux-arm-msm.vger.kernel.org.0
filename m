Return-Path: <linux-arm-msm+bounces-51055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F23E9A5CEDA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 20:07:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB1A87A9E58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 19:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E557264638;
	Tue, 11 Mar 2025 19:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rXub2/kS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A962676D0
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 19:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741719775; cv=none; b=cAQf/ZdBhwFyv78rlu3jBATo7lFNvTspo31qdL8EaONUMThJR6kxsQpkU6rym2JmaU/JMpr4n5dCS4+98+FMzkoHZFsM8x/wu9uKs42LfeTTreVC5yvr/5ys39fwGK38kbpjGzUwPAOupaj+4iZJRaiYRbtdzKZAFIAkSGbolbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741719775; c=relaxed/simple;
	bh=hOIud5F5BRx8PnkZcGoH+YmqAQ66SOw9/EZF/feaI+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=djhoHsp6hHMpI5h6/ywy+leianZf/C19XfTdvs2mdJDwsw5iFnDn8xMyce0VbgdYwSUA40alzZKr6J0DY9BuwBUXj5iyBEaw1WUPaec+06pcjIdznsZBKekbqWHUoiPLTS2ttbioizYSUlvvsfiOuJSiqYirZGGFyZB9sb8EqeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rXub2/kS; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43ce4e47a85so4141485e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 12:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741719771; x=1742324571; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HKj4JzsbxepexWwkfwVA7cklRE9uJluKBLxo8BD1+2g=;
        b=rXub2/kSHe7hU+MTVV7z8Ilzn5lSKq8rCLrRvUHMv3Ddd3JBvTO5bbVFlCbkRXql5y
         y1PrwpOdX59AZ0OLgjVmvGsXtU1SvZQ8SB+LIRUVIo2/quZ+xUfWigwj6HyiYdaq8BlM
         Jwdbf5gAQFeXGHkA8kTlhoeihz41jupqGe2wNFlS0e2L0H1g4qtK84IGdEietRJqwyrH
         Up2rVRcbfPToFc7RiarFmC0Qlw+tfY7PdUJcalxIUao1Ve8qXYSRn1IjAykXqrXFzPrU
         c6SO+ps8lmEQyE2c63+yOnYnKbbEHHGHHKQTS2QRfHfwj6arWFJKtkpwdgtJcdfWLdSp
         KP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741719771; x=1742324571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HKj4JzsbxepexWwkfwVA7cklRE9uJluKBLxo8BD1+2g=;
        b=Y3in40PXEPQH8VmRj9V4ZTbXVixcFE5tOci/rXBN+CLbeV9rROswGuJyTBNfvM6Kup
         dRZL2HXcvnVBi7G3xkBNG/EX6P+i/ykYNcBxWEF8xJOEupg4bbforBR8Mvo4gU7YMbgL
         phvg+priIW0X28hcY7Xu0GZrkkOeTLTHr1GTMHd5MlgfAeS6Zv69LyHADwCko2oIhxx/
         RQQPTiLi29MrPZ05WZh8XdQRtCyWkNLStafMarWgIYzjHsi8gNCces9csB68CFElojLN
         8/dkOG7HPzsU/RKOXToUrIVuMO33eZDWwA74s28FMFybwXRNtaC+ZoBt+70CDaObdQWJ
         hYHA==
X-Gm-Message-State: AOJu0YzrtbjDaLyWHCMqW2zPP133PivE5gxjg/2e56QsEoVdo4sn6A8b
	8UeIAKhVKBlfZchSK+2VkaRsOIEmQKqqCZUVj3qG1Y68YJ9TsrJTKxlSi5ks/9A=
X-Gm-Gg: ASbGncvj4kY5LzBVpOVeGWE6QCn5j23O295L7YZFvGH8zzfPCrX2Tx5JlzBlfO100Cc
	/51sITMqAbsszHJ0t2e2yGynrVWV0YSp9rWPNV99BqI1hbdsBDlgYULlIwJ1VnYWX2iom3N+RZf
	ZpvR1a0UQ3Lm+Uvmf9KnqnZtq0e+OxbKVL6zsp11ureMVKG5b7V+/OlnXezglO9yfmpxL7POowt
	80v6WMY7ABAzw8GEMSGX0t0feOS7Oke+KWgy+rK2yCQj7c0qztzZUXQRaFoZEpjm+vY5W/I1R2d
	1Om9DEWdJxCD869fq0pQCJXeJScQm9qprNFgvfq8BfNVt8atFmKpt1EU5gfNfVF10yOm8w==
X-Google-Smtp-Source: AGHT+IG0epeqR8b57UC5XJpFOR5XZH7tKZNr1AuGT41hNOsbCN9suEDB5Dc3hue18gCfE6Zp4dcciw==
X-Received: by 2002:a05:600c:5493:b0:439:a1ce:5669 with SMTP id 5b1f17b1804b1-43d01c25c57mr24816205e9.5.1741719771320;
        Tue, 11 Mar 2025 12:02:51 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ce70d13b4sm127681155e9.38.2025.03.11.12.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 12:02:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 11 Mar 2025 20:02:03 +0100
Subject: [PATCH v4 13/19] drm/msm/dsi/phy: Add support for SM8750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-b4-sm8750-display-v4-13-da6b3e959c76@linaro.org>
References: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
In-Reply-To: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
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
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10146;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=hOIud5F5BRx8PnkZcGoH+YmqAQ66SOw9/EZF/feaI+k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn0IiwZkD0W2eZZrfbzJM69eXsz41H+jYNveD/d
 3NZw1ApdNmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ9CIsAAKCRDBN2bmhouD
 1+URD/oCVDQo3UaqOhugcOHL6zIEHo062vYuR7JO3ZhaES8nc+CfyhVqM+cwMRLdTuyAJ/sc4bL
 HJKLV+aqNngTahapNtEkC17U3UhSAT1eAm0LP7/sqiL2qV5PZBoWKh9cr1rLcCDKZQeJphTUjOm
 ClrtiKXjrgwcQMKDkrTcahD7A+7LWxniJdfSAIo5/8GS/7JpzMPiN5iN3iJ8OggTvthd3ZhwJd7
 NcCel4rZiwAxGvfI1fjdfzVkY3Ty/OTUz2CeNwHZy4sP0uifFqHhlQGtk2xZodiX2ziw0cdu/ko
 wY37n8VuCMwfjV/VPAT/Gbitk8Vh4avSWXZG1S/BKggdUEbwG/Cfb4GfimxAqWH+D9un1/JJDsh
 y3+aZeQRcg0m1mhLXzXlfmRlkMQ19et457tsoSetkrVv+o0t4oaWC7UfsYTXRhdIeYu8DwyuH+Z
 B9Kp0ObhIxSL3EBkEYP5+dIEYYldYvxwqTjDVFnT4CbThRHY+QrypdeQqiQK+l5Y5WBVxiOV30u
 jpPvw6LpS+S79yZAAF7yjR4dctZiz2lEPGDiara3VMcvmELjigi/Z2xeiFLFYTTaPLUTrMtLuHz
 /Wqq+QyR5YU/LfNggjQl89MDetl3OemkfxBuHmdh47/wohGhKNKXunXyjEO0ysZ/yXg2Qyl4mHN
 yT7THLn0J78yxyg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add support for DSI PHY v7.0 on Qualcomm SM8750 SoC which comes with an
incompatible hardware interface change:

ICODE_ACCUM_STATUS_LOW and ALOG_OBSV_BUS_STATUS_1 registers - their
offsets were just switched.  Currently these registers are not used in
the driver, so the easiest is to document both but keep them commented
out to avoid conflict.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v2:
1. Fix pll freq check for clock inverters
   160000000ULL -> 163000000ULL
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |  2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 79 ++++++++++++++++++++--
 .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  | 14 ++++
 4 files changed, 90 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index c0bcc68289633fd7506ce4f1f963655d862e8f08..60571237efc4d332959ac76ff1d6d6245f688469 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -593,6 +593,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 	  .data = &dsi_phy_4nm_8550_cfgs },
 	{ .compatible = "qcom,sm8650-dsi-phy-4nm",
 	  .data = &dsi_phy_4nm_8650_cfgs },
+	{ .compatible = "qcom,sm8750-dsi-phy-3nm",
+	  .data = &dsi_phy_3nm_8750_cfgs },
 #endif
 	{}
 };
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 1925418d9999a24263d6621299cae78f1fb9455c..7541ffde65218a28d4dde7cfc8246c0715b53ec6 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -61,6 +61,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8350_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8650_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_3nm_8750_cfgs;
 
 struct msm_dsi_dphy_timing {
 	u32 clk_zero;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index a92decbee5b5433853ed973747f7705d9079068d..b077d00e4c5dfcc81040fe3ec71c43607749f26b 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -51,6 +51,8 @@
 #define DSI_PHY_7NM_QUIRK_V4_3		BIT(3)
 /* Hardware is V5.2 */
 #define DSI_PHY_7NM_QUIRK_V5_2		BIT(4)
+/* Hardware is V7.0 */
+#define DSI_PHY_7NM_QUIRK_V7_0		BIT(5)
 
 struct dsi_pll_config {
 	bool enable_ssc;
@@ -129,9 +131,30 @@ static void dsi_pll_calc_dec_frac(struct dsi_pll_7nm *pll, struct dsi_pll_config
 	dec_multiple = div_u64(pll_freq * multiplier, divider);
 	dec = div_u64_rem(dec_multiple, multiplier, &frac);
 
-	if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1)
+	if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1) {
 		config->pll_clock_inverters = 0x28;
-	else if ((pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
+	} else if ((pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_0)) {
+		if (pll_freq < 163000000ULL)
+			config->pll_clock_inverters = 0xa0;
+		else if (pll_freq < 175000000ULL)
+			config->pll_clock_inverters = 0x20;
+		else if (pll_freq < 325000000ULL)
+			config->pll_clock_inverters = 0xa0;
+		else if (pll_freq < 350000000ULL)
+			config->pll_clock_inverters = 0x20;
+		else if (pll_freq < 650000000ULL)
+			config->pll_clock_inverters = 0xa0;
+		else if (pll_freq < 700000000ULL)
+			config->pll_clock_inverters = 0x20;
+		else if (pll_freq < 1300000000ULL)
+			config->pll_clock_inverters = 0xa0;
+		else if (pll_freq < 2500000000ULL)
+			config->pll_clock_inverters = 0x20;
+		else if (pll_freq < 4000000000ULL)
+			config->pll_clock_inverters = 0x00;
+		else
+			config->pll_clock_inverters = 0x40;
+	} else if ((pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
 		if (pll_freq <= 1300000000ULL)
 			config->pll_clock_inverters = 0xa0;
 		else if (pll_freq <= 2500000000ULL)
@@ -250,7 +273,8 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_7nm *pll)
 			vco_config_1 = 0x01;
 	}
 
-	if ((pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
+	if ((pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2) ||
+	    (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_0)) {
 		if (pll->vco_current_rate < 1557000000ULL)
 			vco_config_1 = 0x08;
 		else
@@ -620,6 +644,7 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
 static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
 {
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
+	void __iomem *base = phy->base;
 	u32 data = 0x0;	/* internal PLL */
 
 	DBG("DSI PLL%d", pll_7nm->phy->id);
@@ -629,6 +654,9 @@ static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
 		break;
 	case MSM_DSI_PHY_MASTER:
 		pll_7nm->slave = pll_7nm_list[(pll_7nm->phy->id + 1) % DSI_MAX];
+		/* v7.0: Enable ATB_EN0 and alternate clock output to external phy */
+		if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_0)
+			writel(0x07, base + REG_DSI_7nm_PHY_CMN_CTRL_5);
 		break;
 	case MSM_DSI_PHY_SLAVE:
 		data = 0x1; /* external PLL */
@@ -907,7 +935,8 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 
 	/* Request for REFGEN READY */
 	if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3) ||
-	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
+	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2) ||
+	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_0)) {
 		writel(0x1, phy->base + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE10);
 		udelay(500);
 	}
@@ -941,7 +970,20 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 		lane_ctrl0 = 0x1f;
 	}
 
-	if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
+	if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_0)) {
+		if (phy->cphy_mode) {
+			/* TODO: different for second phy */
+			vreg_ctrl_0 = 0x57;
+			vreg_ctrl_1 = 0x41;
+			glbl_rescode_top_ctrl = 0x3d;
+			glbl_rescode_bot_ctrl = 0x38;
+		} else {
+			vreg_ctrl_0 = 0x56;
+			vreg_ctrl_1 = 0x19;
+			glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3c :  0x03;
+			glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x38 :  0x3c;
+		}
+	} else if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
 		if (phy->cphy_mode) {
 			vreg_ctrl_0 = 0x45;
 			vreg_ctrl_1 = 0x41;
@@ -1003,6 +1045,7 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 
 	/* program CMN_CTRL_4 for minor_ver 2 chipsets*/
 	if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2) ||
+	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_0) ||
 	    (readl(base + REG_DSI_7nm_PHY_CMN_REVISION_ID0) & (0xf0)) == 0x20)
 		writel(0x04, base + REG_DSI_7nm_PHY_CMN_CTRL_4);
 
@@ -1117,7 +1160,8 @@ static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
 
 	/* Turn off REFGEN Vote */
 	if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3) ||
-	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
+	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2) ||
+	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_0)) {
 		writel(0x0, base + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE10);
 		wmb();
 		/* Delay to ensure HW removes vote before PHY shut down */
@@ -1334,3 +1378,26 @@ const struct msm_dsi_phy_cfg dsi_phy_4nm_8650_cfgs = {
 	.num_dsi_phy = 2,
 	.quirks = DSI_PHY_7NM_QUIRK_V5_2,
 };
+
+const struct msm_dsi_phy_cfg dsi_phy_3nm_8750_cfgs = {
+	.has_phy_lane = true,
+	.regulator_data = dsi_phy_7nm_98000uA_regulators,
+	.num_regulators = ARRAY_SIZE(dsi_phy_7nm_98000uA_regulators),
+	.ops = {
+		.enable = dsi_7nm_phy_enable,
+		.disable = dsi_7nm_phy_disable,
+		.pll_init = dsi_pll_7nm_init,
+		.save_pll_state = dsi_7nm_pll_save_state,
+		.restore_pll_state = dsi_7nm_pll_restore_state,
+		.set_continuous_clock = dsi_7nm_set_continuous_clock,
+	},
+	.min_pll_rate = 600000000UL,
+#ifdef CONFIG_64BIT
+	.max_pll_rate = 5000000000UL,
+#else
+	.max_pll_rate = ULONG_MAX,
+#endif
+	.io_start = { 0xae95000, 0xae97000 },
+	.num_dsi_phy = 2,
+	.quirks = DSI_PHY_7NM_QUIRK_V7_0,
+};
diff --git a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
index d2c8c46bb04159da6e539bfe80a4b5dc9ffdf367..4e5ac0f25dea856a49a1523f59c60b7f7769c1c2 100644
--- a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
+++ b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
@@ -26,6 +26,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x00028" name="CTRL_1"/>
 	<reg32 offset="0x0002c" name="CTRL_2"/>
 	<reg32 offset="0x00030" name="CTRL_3"/>
+	<reg32 offset="0x001b0" name="CTRL_5"/>
 	<reg32 offset="0x00034" name="LANE_CFG0"/>
 	<reg32 offset="0x00038" name="LANE_CFG1"/>
 	<reg32 offset="0x0003c" name="PLL_CNTRL"/>
@@ -191,11 +192,24 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x01b0" name="COMMON_STATUS_ONE"/>
 	<reg32 offset="0x01b4" name="COMMON_STATUS_TWO"/>
 	<reg32 offset="0x01b8" name="BAND_SEL_CAL"/>
+	<!--
+	Starting with SM8750, offset moved from 0x01bc to 0x01cc, however
+	we keep only one register map.  That's not a problem, so far,
+	because this register is not used.  The register map should be split
+	once it is going to be used.  Comment out the code to prevent
+	any misuse due to the change in the offset.
 	<reg32 offset="0x01bc" name="ICODE_ACCUM_STATUS_LOW"/>
+	<reg32 offset="0x01cc" name="ICODE_ACCUM_STATUS_LOW"/>
+	-->
 	<reg32 offset="0x01c0" name="ICODE_ACCUM_STATUS_HIGH"/>
 	<reg32 offset="0x01c4" name="FD_OUT_LOW"/>
 	<reg32 offset="0x01c8" name="FD_OUT_HIGH"/>
+	<!--
+	Starting with SM8750, offset moved from 0x01cc to 0x01bc, however
+	we keep only one register map.  See above comment.
 	<reg32 offset="0x01cc" name="ALOG_OBSV_BUS_STATUS_1"/>
+	<reg32 offset="0x01bc" name="ALOG_OBSV_BUS_STATUS_1"/>
+	-->
 	<reg32 offset="0x01d0" name="PLL_MISC_CONFIG"/>
 	<reg32 offset="0x01d4" name="FLL_CONFIG"/>
 	<reg32 offset="0x01d8" name="FLL_FREQ_ACQ_TIME"/>

-- 
2.43.0


