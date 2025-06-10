Return-Path: <linux-arm-msm+bounces-60815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8311AD3A97
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 16:09:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C319C1778AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 14:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 016CA2D4B47;
	Tue, 10 Jun 2025 14:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hLFuOwzC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECEA2D29DF
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 14:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749564394; cv=none; b=pQ2QvpOCskG94D0EcGEVy7Lql/tUDNoMapHdK1ckODdPKwKf1cB85vaKJp6l0AxGgtjeXmm/OOabPzkOsq0vQFPYIDwghxYskSDPR2Gq4wcc6dZLPpuiazda3lu5fOem80xaKBQEoihDNkAaichrXiwSW/U1mJu3TgWIGnMslyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749564394; c=relaxed/simple;
	bh=rD/vxqx5nSUfP2XbOh0k+p4MMI3tgwoJRLYjdRzeMRE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k+HqbNDOHrY/CIHLF1zyf6/GJmZcl3Vx4Kkxy1+RwnMDB57t0Y0h4APzxbULHCATeRq/sI6vSaK3iZJBuQAFzXO/pljHYp4iD0D2JvvoaRoB2XV9xxm//fwXSIBi/SemYcFu9MIy44GxkhUUroFpmo9q2qsj5OOQvlUY6duBC4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hLFuOwzC; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4e749d7b2so729249f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 07:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749564391; x=1750169191; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J+s2K9q0nfSbrKocqSr/McebFVTHHj9+pTuCq5ceG5Q=;
        b=hLFuOwzClrjVbfFh6VfW6VvqQYuxpyKFSgIv0VC+oQNIX6SF5KQYwyLITJ/bldEGa1
         kdwQhV3SX7Rp0mBP0GWEmravGGRoEumBBCyjk+bSipFfO4XzXbAk7bm7FFxbRAdIpxAx
         n5JrfVoByZKIhSfHfxy35Mzms2CFPuShoNwBvDHjFW4eqn44fzQZbl1gs8pMdadI9FN7
         bkTbVAuBTwdALD03KDtcvIsfuufRDiOo2ahQZWekicFj7+Gce1H3wOm7Fhm+mh+VTRMz
         uwooEhDoRa1mWrgBylU6Rafw02xBK4iJ6pyvoyUqTzb7QC/687E5XbPivO7oegeOvz8n
         7QVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749564391; x=1750169191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+s2K9q0nfSbrKocqSr/McebFVTHHj9+pTuCq5ceG5Q=;
        b=lSGSgxL+8XyB0OhcLQra7nvnxZo9nN2/hZVCucvuHyWwrtLmYuXTmXD3PFg+XdubPi
         c0riovx6n57Ue0GoUSt3rMNyDQGm5xEtL5QiopLFt5XcQTYpch2yyrq73p6itnRNf8ZY
         /Jk/nh+v/fQ6lTF/3VMjOU55wt/90LT+ReAcxbNJSfs5+gBu/csmg0bUrn9MBbe37l7F
         COvX528zq07hCpWuhl4LKNW4EfS/GPXZRurYe3vd+aS4atNMLRXW45MCUFrhgc1b+9id
         +seNS2AHzGJs09sIAa/nVPVhlFjXA8alZE7aQOQNWcJQSOY1WzPtQ3/1+Ix0CYmriOGE
         0waQ==
X-Gm-Message-State: AOJu0YyIIG0sY6rCSI38b7EZMCtJCAJv5VxgWlniiz3nG0FbGMTlN/QJ
	GGqbvViDprvL3P4i8BgeoupSL5AjS5q08IURj/ETONhVJySU75AaL51ERYReiEV6qJc=
X-Gm-Gg: ASbGncvSSXvPYw/c0wIlpIweRoX9po2V2IaCViXRqI1fckSFqJfUhSlzNRqE13nB67M
	5WkNr/TvbyltFikC+p5y0Drm1DSy6kZRN0+ziKB5EyKTAI5Qg78kcR7WrPHsP/WUuGzCwyTxM2x
	fv+5f7CwuNzhyWxBpa3rDRYh8+PHray72loCxtzROfRNbeENY4AvnpFvMSESLRrVnI1cmS/tzkw
	dYQ/xrSPvQUDeB3VKARN/mRXUUZ+mjbXzetubX6N65Ql95x9PdSoDCjUvR+MCcRN12Ron+DCKGq
	U0i6xsdzEBUY8ngILNkgoZC+D9flHlr2ZoB9r3t+/TXC+gWRY0AvI4by/e8J3e+hpYu+/ooBsyM
	hvL/TIA==
X-Google-Smtp-Source: AGHT+IGOD7neS88gds4HjMSeiykUy2lf9EPuFamRjB8ThGGIlXT3+gNiU9q5oyf/nxbFns/0GxUlTA==
X-Received: by 2002:a05:6000:26d3:b0:3a4:d7c7:89d1 with SMTP id ffacd0b85a97d-3a531789bb8mr5438073f8f.4.1749564390577;
        Tue, 10 Jun 2025 07:06:30 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df06sm12734469f8f.69.2025.06.10.07.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:06:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 10 Jun 2025 16:05:48 +0200
Subject: [PATCH v6 10/17] drm/msm/dsi/phy: Add support for SM8750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-b4-sm8750-display-v6-10-ee633e3ddbff@linaro.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
In-Reply-To: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
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
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10153;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=rD/vxqx5nSUfP2XbOh0k+p4MMI3tgwoJRLYjdRzeMRE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSDvHUNhdu3vSKx/mraq9Kly5KAZiQfWX7c0JK
 41wUf+BNMSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEg7xwAKCRDBN2bmhouD
 14IjD/wP95Wp0SNg33Fm+5sDnjY4h7IEFpwDtESb5WPp2bnpxwdKV543cD2webG8KFgWAqn3t64
 P3Mtm+DSpy2AWdtJNpoicTOyWL355MkW95Qpja0snlHcN2fF9X4HrvkdcxKMcOpWgJT9u1o9sd/
 bL9ZN6SbtAcYUxNi0q3Rfnuaqt4FrqNe47bZirxwfilTaDK4S/k1XhnyP3o5buo7nd8bH3ecsNB
 cw6P26Hffj+bjI1ywxyNja0sYZrrzmafQlp5wdFGkj4DFsVbCvfxYuc5YLPq0h91MoZP21ye3kb
 FfTvfW8YgicTuo5dRZwxg/E5BecI6ybNfqhibhmTrwlPNCYeSRfdEBMpKgk7vQfTTnA1htJqPIs
 9NS/3srf0SRZDdplpVsepChyX1uMMC+k09vu8rugzNKPjLAqD6+pV4dTYEex7M9efbuZtgmBhrB
 6b4EwnKk9vFCr5/Mg6Ih375zIJe5/SOZa4tqq9dWvcRHzvsQz4RFbjoK0E4ZvVxWRMp9/ciapgu
 /2/MO17YPelMXquw7n6qIpC/4PSRXQ/sfUtl89b5FYd+g+J7jihSzgxwLJEcxDRD+5cSFh0f+nn
 jdYhFueUP2R4/7U2+OwVmATGv3BK34IJeQbl9yr2xZJEmz2BDNlQTjqK687QEAtjRIjwSLmFuc5
 1rY6JjXSnZt4PTA==
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
index 5973d7325699bf5fc67c4cf93fcaf04abb618b46..221f12db5f8b7686b2f37524322ea3e118f503b1 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -597,6 +597,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 	  .data = &dsi_phy_4nm_8550_cfgs },
 	{ .compatible = "qcom,sm8650-dsi-phy-4nm",
 	  .data = &dsi_phy_4nm_8650_cfgs },
+	{ .compatible = "qcom,sm8750-dsi-phy-3nm",
+	  .data = &dsi_phy_3nm_8750_cfgs },
 #endif
 	{}
 };
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 82baec385b3224c8b3e36742230d806c4fe68cbb..93fb5a30a755f7cade56af271640670cbb2e50a0 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -63,6 +63,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8775p_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_5nm_sar2130p_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8650_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_3nm_8750_cfgs;
 
 struct msm_dsi_dphy_timing {
 	u32 clk_zero;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index c8b4a84b38340e0f907e0123299b493768454160..fd405e257f89181f32432dc4865475eeb7a88f5f 100644
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
@@ -139,9 +141,30 @@ static void dsi_pll_calc_dec_frac(struct dsi_pll_7nm *pll, struct dsi_pll_config
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
@@ -260,7 +283,8 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_7nm *pll)
 			vco_config_1 = 0x01;
 	}
 
-	if ((pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
+	if ((pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2) ||
+	    (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_0)) {
 		if (pll->vco_current_rate < 1557000000ULL)
 			vco_config_1 = 0x08;
 		else
@@ -669,6 +693,7 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
 static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
 {
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
+	void __iomem *base = phy->base;
 	u32 data = 0x0;	/* internal PLL */
 
 	DBG("DSI PLL%d", pll_7nm->phy->id);
@@ -678,6 +703,9 @@ static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
 		break;
 	case MSM_DSI_PHY_MASTER:
 		pll_7nm->slave = pll_7nm_list[(pll_7nm->phy->id + 1) % DSI_MAX];
+		/* v7.0: Enable ATB_EN0 and alternate clock output to external phy */
+		if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_0)
+			writel(0x07, base + REG_DSI_7nm_PHY_CMN_CTRL_5);
 		break;
 	case MSM_DSI_PHY_SLAVE:
 		data = 0x1; /* external PLL */
@@ -966,7 +994,8 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 
 	/* Request for REFGEN READY */
 	if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3) ||
-	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
+	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2) ||
+	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_0)) {
 		writel(0x1, phy->base + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE10);
 		udelay(500);
 	}
@@ -1000,7 +1029,20 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
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
@@ -1066,6 +1108,7 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 
 	/* program CMN_CTRL_4 for minor_ver 2 chipsets*/
 	if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2) ||
+	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_0) ||
 	    (readl(base + REG_DSI_7nm_PHY_CMN_REVISION_ID0) & (0xf0)) == 0x20)
 		writel(0x04, base + REG_DSI_7nm_PHY_CMN_CTRL_4);
 
@@ -1182,7 +1225,8 @@ static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
 
 	/* Turn off REFGEN Vote */
 	if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3) ||
-	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
+	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2) ||
+	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_0)) {
 		writel(0x0, base + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE10);
 		wmb();
 		/* Delay to ensure HW removes vote before PHY shut down */
@@ -1453,3 +1497,26 @@ const struct msm_dsi_phy_cfg dsi_phy_4nm_8650_cfgs = {
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
index d49122b88d14896ef3e87b783a1691f85b61aa9c..f41516dd0567ca7406b0d41c9410e28084f2b03c 100644
--- a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
+++ b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
@@ -35,6 +35,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x00028" name="CTRL_1"/>
 	<reg32 offset="0x0002c" name="CTRL_2"/>
 	<reg32 offset="0x00030" name="CTRL_3"/>
+	<reg32 offset="0x001b0" name="CTRL_5"/>
 	<reg32 offset="0x00034" name="LANE_CFG0"/>
 	<reg32 offset="0x00038" name="LANE_CFG1"/>
 	<reg32 offset="0x0003c" name="PLL_CNTRL"/>
@@ -200,11 +201,24 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
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
2.45.2


