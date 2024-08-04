Return-Path: <linux-arm-msm+bounces-27839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CFC946C57
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Aug 2024 07:40:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F47E2822AA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Aug 2024 05:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 274F51755C;
	Sun,  4 Aug 2024 05:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gswo4N3l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32627EEA6
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 Aug 2024 05:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722750024; cv=none; b=AfHns9QQkhMbcf6wm32w9bSLuHjuOGQPRqPNw15SgQMUjYFuxf2CCKmGdYbRf6Xh6ulYlpik1IrFgY+NqYj+C1sXbOu/DuQgCv7IphKKbtXCqzGzpw9n10BwtorTygfK+zZ6UEDMRm0RPsEue2Gx7Mrx7s0M3K4D9JRtXrGcs2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722750024; c=relaxed/simple;
	bh=jmcv3QZDbF0/FB7C2A1nETsdriKJ1dXxo+mdoIZ+Ot8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UQEKYc/JxUq817yl6GfyG6NfrrMIwf7jU8WLzQUFa5pldpTXc87WGP2LLOYgXsMZiE5DlN987sl0QsrD7oK39lGU2IGajMi9zi3TO+WGKx8AJUbJKPYD0oCPL5zM0CjCLG4e3Xk0mlMS56/wdzJCEhnmPbj7/ccuA20ZGfxreDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gswo4N3l; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a77ec5d3b0dso1069039066b.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Aug 2024 22:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722750021; x=1723354821; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QAmP59CsMg1OmM3gD5Is1pyiJbDBWr21J5h6ZsQbULc=;
        b=Gswo4N3lA+BuEYX/Eph0AWWldcoclH+qo+zux31SLbtUFr4pjdXiGYD5VTc+J7MGaj
         0+rb/jlZeemPS7cd1uSc+2AOSbJSMYpqPxk97acYLjhBWkEEeut+dehxp/6fxeI1nAIN
         WqKYCmADtjrrBVGolSxWdW+VfsP+36oik5u0I96ykNBKkc+ozYvpJkrhb0AYo0aONx80
         /esgQEew+TlGuONhQXtZ8JkKzW3dS71nN/lEpS9GAVHFUcKret97beJ2Ppew4sBg3SIM
         ySxUsBf1cdQVZWtUVsAdwH7V8KedCPYrpC7+E14RKno5eIkoJQIxPXFab1y64HsnpPPt
         K71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722750021; x=1723354821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QAmP59CsMg1OmM3gD5Is1pyiJbDBWr21J5h6ZsQbULc=;
        b=IRG+9r3/xbY3UTB8RHpC+UJzh/oe5uqwVQ5djY2iJUR7D8T+HGSkaR/T1ieA7CG9Lh
         KzHtSAbW8dSI7JKA9t6Ma/bR78A3vSLhJ+ivkSZZP8J12osLEoHUvx/VhWvbTB25toz/
         xQuoVrqbm3B3KdCmmI+GvuI8EFifGdI+Wmss4v4pLOLQ6GY500Q5OkJwzAv48CfbS8or
         DsKWQQy3XIHotKNbBN1howXTB0UccJS4Z6xusDMTr0DtebUQCnSJx3RzABJ3tSwQkxaE
         vwss/TiEFcetE/bc5N1eLPUMF/AIA0NJZTsuPJm0gUKVNrO7VjI5PVUvOX9TSbtjV75w
         8QPw==
X-Gm-Message-State: AOJu0YzkA00tNvX8kRPSLruRuhIYQVc1nnRTnD8J0g3avnQQt11mmOnH
	hvoWBBtnJT/g7B8Kp/n6JFimVklniY4jBZTxOt5Px1NTqVdXTdvUG5UUuGpkClc=
X-Google-Smtp-Source: AGHT+IFVLTR76CbNV5qahJQoIGpt3Vzypxa8q34XuuIwmITvoXxOKd6/Ru/9TyTfB1g1mcja4mQVgg==
X-Received: by 2002:a17:907:a096:b0:a7d:d1a6:d943 with SMTP id a640c23a62f3a-a7dd1a6dec8mr392048566b.40.1722750021473;
        Sat, 03 Aug 2024 22:40:21 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9bc3bd7sm292248466b.34.2024.08.03.22.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Aug 2024 22:40:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 04 Aug 2024 08:40:06 +0300
Subject: [PATCH 02/11] clk: qcom: dispcc-sm8250: use special function for
 Lucid 5LPE PLL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240804-sm8350-fixes-v1-2-1149dd8399fe@linaro.org>
References: <20240804-sm8350-fixes-v1-0-1149dd8399fe@linaro.org>
In-Reply-To: <20240804-sm8350-fixes-v1-0-1149dd8399fe@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jonathan Marek <jonathan@marek.ca>, 
 Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Georgi Djakov <djakov@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mike Tipton <quic_mdtipton@quicinc.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4876;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=jmcv3QZDbF0/FB7C2A1nETsdriKJ1dXxo+mdoIZ+Ot8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmrxQ+bL7txinbbvtpaZCB41puWCXaqSR2+yfiX
 +7P7Ff+UomJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZq8UPgAKCRCLPIo+Aiko
 1c0CCACx/TGWwylNnfimpuNOVKIxADSMA2GbffeGvgGYp+409LFZHjV8RPg5nyWwwhARcdnhDCk
 ZRv9hR4KhHmZF8C/Bmh1c9XxTeaj2mLaH4qwpNgycQavj8ZTli/pQUcCRg+/BEZrxSgsMsVa0F5
 8QvJInBHia3iHgVKJzoh7P7xCsbCudufusswKl3z27BrrQrNVF8QUeMV8/5fQ23LSvQXFj4P1sL
 wI4itM1zoO5ZnBQeyPPpHU0WuctZTd+0NaskZeZeo3y8Mtv4CHuTuVzDlkZ9HU+3igoyrnneVNP
 gtibXN/1UhcT3R5hnWf7rrhn82vRAV1kkitFhrlW2wYWcNDL
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

According to msm-5.10 the lucid 5lpe PLLs have require slightly
different configuration that trion / lucid PLLs, it doesn't set
PLL_UPDATE_BYPASS bit. Add corresponding function and use it for the
display clock controller on Qualcomm SM8350 platform.

Fixes: 205737fe3345 ("clk: qcom: add support for SM8350 DISPCC")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 52 ++++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  2 ++
 drivers/clk/qcom/dispcc-sm8250.c |  9 +++++--
 3 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index d87314042528..d0b911499cf9 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -1831,6 +1831,58 @@ const struct clk_ops clk_alpha_pll_agera_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_agera_ops);
 
+/**
+ * clk_lucid_5lpe_pll_configure - configure the lucid 5lpe pll
+ *
+ * @pll: clk alpha pll
+ * @regmap: register map
+ * @config: configuration to apply for pll
+ */
+void clk_lucid_5lpe_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
+				  const struct alpha_pll_config *config)
+{
+	/*
+	 * If the bootloader left the PLL enabled it's likely that there are
+	 * RCGs that will lock up if we disable the PLL below.
+	 */
+	if (trion_pll_is_enabled(pll, regmap)) {
+		pr_debug("Lucid 5LPE PLL is already enabled, skipping configuration\n");
+		return;
+	}
+
+	clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), config->l);
+	regmap_write(regmap, PLL_CAL_L_VAL(pll), TRION_PLL_CAL_VAL);
+	clk_alpha_pll_write_config(regmap, PLL_ALPHA_VAL(pll), config->alpha);
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL(pll),
+				     config->config_ctl_val);
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U(pll),
+				     config->config_ctl_hi_val);
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U1(pll),
+				     config->config_ctl_hi1_val);
+	clk_alpha_pll_write_config(regmap, PLL_USER_CTL(pll),
+					config->user_ctl_val);
+	clk_alpha_pll_write_config(regmap, PLL_USER_CTL_U(pll),
+					config->user_ctl_hi_val);
+	clk_alpha_pll_write_config(regmap, PLL_USER_CTL_U1(pll),
+					config->user_ctl_hi1_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL(pll),
+					config->test_ctl_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U(pll),
+					config->test_ctl_hi_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U1(pll),
+					config->test_ctl_hi1_val);
+
+	/* Disable PLL output */
+	regmap_update_bits(regmap, PLL_MODE(pll),  PLL_OUTCTRL, 0);
+
+	/* Set operation mode to OFF */
+	regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
+
+	/* Place the PLL in STANDBY mode */
+	regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
+}
+EXPORT_SYMBOL_GPL(clk_lucid_5lpe_pll_configure);
+
 static int alpha_pll_lucid_5lpe_enable(struct clk_hw *hw)
 {
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index df8f0fe15531..e2cf5c7e501d 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -208,6 +208,8 @@ void clk_agera_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 
 void clk_zonda_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config);
+void clk_lucid_5lpe_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
+				  const struct alpha_pll_config *config);
 void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 				 const struct alpha_pll_config *config);
 void clk_lucid_ole_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index eb78cd5439d0..884bbd3fb305 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -1360,8 +1360,13 @@ static int disp_cc_sm8250_probe(struct platform_device *pdev)
 		disp_cc_sm8250_clocks[DISP_CC_MDSS_EDP_GTC_CLK_SRC] = NULL;
 	}
 
-	clk_lucid_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
-	clk_lucid_pll_configure(&disp_cc_pll1, regmap, &disp_cc_pll1_config);
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8350-dispcc")) {
+		clk_lucid_5lpe_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
+		clk_lucid_5lpe_pll_configure(&disp_cc_pll1, regmap, &disp_cc_pll1_config);
+	} else {
+		clk_lucid_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
+		clk_lucid_pll_configure(&disp_cc_pll1, regmap, &disp_cc_pll1_config);
+	}
 
 	/* Enable clock gating for MDP clocks */
 	regmap_update_bits(regmap, 0x8000, 0x10, 0x10);

-- 
2.39.2


