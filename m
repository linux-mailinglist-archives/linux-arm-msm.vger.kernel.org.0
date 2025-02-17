Return-Path: <linux-arm-msm+bounces-48256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11911A389E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 17:46:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F9AD16F6F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 16:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A696A2288FE;
	Mon, 17 Feb 2025 16:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G9IgxyNu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097B92288C8
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 16:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739810529; cv=none; b=LnYyx4Iqe+km7cI7S+VTcf0FxKiLhaT/QJ8INa2puNTScJEIajKTgJbjeDzkguuqQRcnPcZhSe5Famfm94jSSTGnL9Glk4bGezwp6gnFVAlO+GaabaLlNa6mVcHOmo9fXrHKzqKPvzXhEM5DIQcGjrfRapnYCDLBKM5Un9pnm/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739810529; c=relaxed/simple;
	bh=OK4BlEQKgWf2DPPY2IYuD91snJxEgi2akar8eW0RZEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g1HxNzRE21PjOJk7x1G2vmJhObIGow7GwbwvcTJsjKKwVtFl/0YVeDqID460wVO5waj/PPRlwgEjNGIDVdW1Y7nFbsDlm559ANXCVqpo6Ls+yb8GqKo1S//1a+i6SE8CkvZ+qI30fxxsf0t8okFBzhRDJVKetDRRIOPmWiS46lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G9IgxyNu; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-abad214f9c9so53962166b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 08:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739810525; x=1740415325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k3e6irnfKGT1PeG1ksdgrOZzEx11XJVUyYfrbYP3xxY=;
        b=G9IgxyNu0tUe2bUhZ8XMAEXb7phbbMXGafmj0uI3WhZZPpvHbT+vQW5OFXprI13TfT
         QKynp/LXwDcTGOEqQ4Km3z6UlxfMGHFF8/GDrq5VKd1ummrBwYKbrExe2Wi+cALj+P1p
         PE4+Vn+xVEhq2cBM94/BXiwO0O/3wAz+0wCFE9OmcxIGopTH1ABvxj8Q/1E+K7/NRE/N
         4RyijXa1qS2AkHOblK7nAQ4UGZQfM+RE4TWYGoMileLC+m8N6PuRHlyJVV5I9319jE5H
         PsQYZQTi7VCpNGTG/FSg/4/Xb4uCgFMLq3koRnu4e/vExw+Ij3pUnodAEMQx75Ybnhob
         pQvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810525; x=1740415325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k3e6irnfKGT1PeG1ksdgrOZzEx11XJVUyYfrbYP3xxY=;
        b=FUtF923nhYGPnbHobIvlVpWUVrN2wq1BP/A8xVcx3gBbYp8uRs3y0mATyQFnEVWR7z
         ZVmNzu1LE3wm4d9icPjsl9f+/l2lLZfnidBemEQS0yujDiyzB6yrgaXawMXZHu+wNnfX
         RYz6fox3TI0ipIewPOAb9y7nd6N/1WwqmHs6wTTjQ7kCTSTEWp+HT647Y3NnpPSQTS+g
         7t7vRIKvS5nda0sF0JHRkU3fbuNVn/ehDn6aDkzJcNam4JmpMJ2eX/yonqgKBIOZzUsr
         AVbas/b03xdiO/bk8Mmpjfj0KbayEJ4Y3S4z8a0vWpIWwEY9t090rtZksUzjwnKJCrpA
         U1cw==
X-Gm-Message-State: AOJu0YysbpV37L/mWJKd8fahtU3I3G4sYZ3Pqnvz2m34Os5oFFyVwSJZ
	vMcrWrAXLL6ylBOxIAcEQ81e3qBPJIUawruYTJfPVjXwOm6n/FQKm54sScvqdKM=
X-Gm-Gg: ASbGncswlN/42N7mGQW+LS6AcAfhvK/CdODAWZXRQlv0d1I4tD51zHWfIJwPPAM2vD+
	8iw9hqv3BoZJQLSF1yjigHpZo1Cz8TS+vuBYC01q5w/LxcTLXCk6vTGig0AvgEuMQocEUXhUWqf
	oMjcXy7yBNs8Cs/hFVwxMOt1Qyaowh8m/leX2AJkFdsRTu76GJyNLx1MkmElhDos3gGAXw8cnfV
	KXzUzOlNiQ9BRUvIP85MkrtkY24jxque7NIXovjJCDriyxKFxUBlx2j68I7vFFW00i1JnEwB9xP
	DwcMFI0vRF55B/TjljjMsqvBmyPONv4=
X-Google-Smtp-Source: AGHT+IE8QG9uCPdiBxQ5weYf5osQu09e7Btq0EsTpRlM5hKIOjXAJPRNcdRQDTsg/kmqq37u4dj+XA==
X-Received: by 2002:a17:906:4794:b0:ab7:6259:870 with SMTP id a640c23a62f3a-abb70d51d82mr372705566b.10.1739810525235;
        Mon, 17 Feb 2025 08:42:05 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbac781b78sm82647966b.60.2025.02.17.08.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:42:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Feb 2025 17:41:32 +0100
Subject: [PATCH v2 11/16] drm/msm/dsi/phy: Add support for SM8750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-b4-sm8750-display-v2-11-d201dcdda6a4@linaro.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
In-Reply-To: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10029;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=OK4BlEQKgWf2DPPY2IYuD91snJxEgi2akar8eW0RZEk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBns2bAHlF0ZHyGpixCXD5FCco8BLA4ikVf6HRlp
 T3KCKKabgqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7NmwAAKCRDBN2bmhouD
 12IWEACBnFezKROYNnuYlU1NueFiAXqyvekYCEQMCMa64lC7TpQTXz3zrkIFryWn1FQ5O+XrRBW
 1CCf8pUkNJl3y3lrzO8rdOpZMAGWH6JDv6EdU50bMFpit5O1vP/UweYLVqrZSYyqWrK1SPuFGkd
 aF7imRzhrm5FTanIblwK8OU2C0FqNgdBRZX1SB6hWaOYDW6PX9EgSWNplcIXihSEYY5Y9CprreM
 EQthH0w+H48zr7qUI2vLPTY2QJD8L9F+OnV6fSR64U0a/N/URboFe1MfxYnX+5bhPWXYTna7BTd
 lvLltvTmRy92fJMSPyR++d1BlaYRCP9qwSGS8mawkEbvHWkXt2Lbm5tLRW8I1t5bkZtpD6zJMtq
 eSfkdl4laofTfGhbGT7vAKkS4rNM3UohtBCnOtV+zlV5Umy7ddkglhazCKyPdWXinmhlxDOyJnK
 BLu/G6fW+GbJ9VDDJW0YCaap6lUQw9sAmAJL18BMto4m6IeQ08q/0Tn4HQyNXohrFZmrhlQueGM
 V5W3QMx6mINzV0AiIW1QAGS2VXX/RUmXdOWOr7q4uzzYMQ8Z1EZ8YODFo0k4TiUyjaHa22ojU97
 rydqZ/YUPDkENdM2gMdF/K8yUS/qe1lQzb9AsNqN3rfkq+94IhWIZlYQi/ZCfazYfEbuwfMXNRY
 IA2Vtf9L9+l/fgQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add support for DSI PHY v7.0 on Qualcomm SM8750 SoC which comes with an
incompatible hardware interface change:

ICODE_ACCUM_STATUS_LOW and ALOG_OBSV_BUS_STATUS_1 registers - their
offsets were just switched.  Currently these registers are not used in
the driver, so the easiest is to document both but keep them commented
out to avoid conflict.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1.
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
index 8985818bb2e0934e9084a420c90e2269c2e1c414..fdb6c648e16f25812a2948053f31186d4c0d4413 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -60,6 +60,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8350_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8650_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_3nm_8750_cfgs;
 
 struct msm_dsi_dphy_timing {
 	u32 clk_zero;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 6d287cfb0148bdb0b1c64675dfe7fa69d3faba2d..b626989cb3d505f1c53f212dba130e3d685fe59c 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -50,6 +50,8 @@
 #define DSI_PHY_7NM_QUIRK_V4_3		BIT(3)
 /* Hardware is V5.2 */
 #define DSI_PHY_7NM_QUIRK_V5_2		BIT(4)
+/* Hardware is V7.0 */
+#define DSI_PHY_7NM_QUIRK_V7_0		BIT(5)
 
 struct dsi_pll_config {
 	bool enable_ssc;
@@ -128,9 +130,30 @@ static void dsi_pll_calc_dec_frac(struct dsi_pll_7nm *pll, struct dsi_pll_config
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
@@ -249,7 +272,8 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_7nm *pll)
 			vco_config_1 = 0x01;
 	}
 
-	if ((pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
+	if ((pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2) ||
+	    (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_0)) {
 		if (pll->vco_current_rate < 1557000000ULL)
 			vco_config_1 = 0x08;
 		else
@@ -624,6 +648,7 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
 static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
 {
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
+	void __iomem *base = phy->base;
 	u32 data = 0x0;	/* internal PLL */
 
 	DBG("DSI PLL%d", pll_7nm->phy->id);
@@ -633,6 +658,9 @@ static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
 		break;
 	case MSM_DSI_PHY_MASTER:
 		pll_7nm->slave = pll_7nm_list[(pll_7nm->phy->id + 1) % DSI_MAX];
+		/* v7.0: Enable ATB_EN0 and alternate clock output to external phy */
+		if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_0)
+			writel(0x07, base + REG_DSI_7nm_PHY_CMN_CTRL_5);
 		break;
 	case MSM_DSI_PHY_SLAVE:
 		data = 0x1; /* external PLL */
@@ -914,7 +942,8 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 
 	/* Request for REFGEN READY */
 	if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3) ||
-	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
+	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2) ||
+	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_0)) {
 		writel(0x1, phy->base + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE10);
 		udelay(500);
 	}
@@ -948,7 +977,20 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
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
@@ -1010,6 +1052,7 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 
 	/* program CMN_CTRL_4 for minor_ver 2 chipsets*/
 	if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2) ||
+	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_0) ||
 	    (readl(base + REG_DSI_7nm_PHY_CMN_REVISION_ID0) & (0xf0)) == 0x20)
 		writel(0x04, base + REG_DSI_7nm_PHY_CMN_CTRL_4);
 
@@ -1124,7 +1167,8 @@ static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
 
 	/* Turn off REFGEN Vote */
 	if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3) ||
-	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
+	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2) ||
+	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_0)) {
 		writel(0x0, base + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE10);
 		wmb();
 		/* Delay to ensure HW removes vote before PHY shut down */
@@ -1341,3 +1385,26 @@ const struct msm_dsi_phy_cfg dsi_phy_4nm_8650_cfgs = {
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
index d2c8c46bb04159da6e539bfe80a4b5dc9ffdf367..d62411961f5673e0a7a37b90cfc99962de83659e 100644
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
+	Starting from SM8750, offset moved from 0x01bc to 0x01cc, however
+	we keep only one register map.  That's not a problem, so far,
+        because this register is not used.  The register map should be split
+        once it is going to be used.  Comment out the code to prevent
+	any misuse due to the change in the offset.
 	<reg32 offset="0x01bc" name="ICODE_ACCUM_STATUS_LOW"/>
+	<reg32 offset="0x01cc" name="ICODE_ACCUM_STATUS_LOW"/>
+	-->
 	<reg32 offset="0x01c0" name="ICODE_ACCUM_STATUS_HIGH"/>
 	<reg32 offset="0x01c4" name="FD_OUT_LOW"/>
 	<reg32 offset="0x01c8" name="FD_OUT_HIGH"/>
+	<!--
+	Starting from SM8750, offset moved from 0x01cc to 0x01bc, however
+	we keep only one register map.  See above comment.
 	<reg32 offset="0x01cc" name="ALOG_OBSV_BUS_STATUS_1"/>
+	<reg32 offset="0x01bc" name="ALOG_OBSV_BUS_STATUS_1"/>
+	-->
 	<reg32 offset="0x01d0" name="PLL_MISC_CONFIG"/>
 	<reg32 offset="0x01d4" name="FLL_CONFIG"/>
 	<reg32 offset="0x01d8" name="FLL_FREQ_ACQ_TIME"/>

-- 
2.43.0


