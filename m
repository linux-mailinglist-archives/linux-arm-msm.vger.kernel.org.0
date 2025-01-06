Return-Path: <linux-arm-msm+bounces-44005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D190A026FC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 14:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98121164A72
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 13:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A8F01DE885;
	Mon,  6 Jan 2025 13:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zQNoDtcr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8A01DE2BF
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 13:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736171087; cv=none; b=Ur75PfASJanOOC/jI+F/k85SgbvvdpsAsJperFJe/E8U0PYNKPTywT6nR220DIRorPOaQpZGRqTqe6wHdUKxtDNE5jB0iUhnnkcFrNLRwNk6iKcTPq/z+KawhywqlIzs6DaPLkaQcE0boXaNr37YfI2rEUngaMnjjdpGLjFHcDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736171087; c=relaxed/simple;
	bh=BuGgxnT8GMf64DMeHuTbpu3NUBH1f3aydDCYK6u6bsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fD486HpVbSgpTWXPsl0+HbneMAzbZD76xUM7dpdn238lRIlPuUqKmJ1/6eQ360ketsOJ+4MUoHP3jWS5RW9zZN94YwN0u7W3sdh1Wrxt+7tJIOJiTIz2EBz7uzGNYCp3vMI8NFlG4j+o35qjwzVdT8RaTFMRUlqxY3dlpdJCiWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zQNoDtcr; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385e0d47720so874907f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2025 05:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736171084; x=1736775884; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7WO07+3DSNAkiI5qeBErU9v9LYXfXGKgxc4E2I2nirQ=;
        b=zQNoDtcrRStzJUkfbxwvkWHuviRTMBD2SSbspllbQ+sLp4Mod4pOPcEjbVlizg96bv
         TDnzjTu/pDtM31DdZeVIx6t0YyBmiOVqcl/Ld/T4t5k7jaxMwrzsDM1i2VCqQsIH/kl0
         JetzDl6T4z5q5++nVok3VdaHVdhq3Y+z4GtUf9tNTsS//aPZtGMUJ7QX4UUmvTjdyo3P
         qdcurW7dHOkNbgTmdwQPaHJgkolYj+UmuLjbOiXLKinWUBGRmgwrWLMvoDRNBlhrz5ih
         iP7kR1IPH72SX6T+GGFv/0tQbW4EHiGKGQmJI3EWg3Ct2Aa253ImKU/ncWsE8EoFZdKs
         MYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736171084; x=1736775884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7WO07+3DSNAkiI5qeBErU9v9LYXfXGKgxc4E2I2nirQ=;
        b=wu6fYWmj8f1jL/09AZtRS/WdLAoaCLCFrQAYhumleNUxENuVb4K6d8WwvZ9oXz2XWX
         7Z0koeg7aqWOunxSugxyCt1OGtbsAV5+OqDpT98DTKozz/ssGN9GWBBKjPj/p4y89Hjn
         nLoSC7HESSWVwIqPSE/LExROrRsxw/0Oxdn1Xp3EyxTWBfcJ/rXXkYZIQnXeNiEFA7kP
         vQQugPxUBC5ozz29BMwhfZQqdGM9XJ0h0Y4lu32nTWodfCner1Ux7M3Os3lM8hDjXeV+
         97aZu1keF7HLhyi/UxMNGhcjrQCygxzaw6H57xraspZ7rjXGnuFKz/zimBuKFhM6/nwY
         2B8w==
X-Gm-Message-State: AOJu0YyjTDQObQ4DWvMwtdyq3EupB7ofTnaUh35gMP/KTksOGdJAXkEs
	1YAlJzp8ZLPB6YCP4ybggDqcC0ZsXmJe+uQQ+cBCFoihDgsZLktnhUfh8Pfjjic=
X-Gm-Gg: ASbGnctrD8OnSqAq/cK8E4jWTzClWsRXyUGg3JlbuoGHTvXXSewY743+WPgOvaMBztC
	hvDDeFn+FwEHguYSsxlI1uzoQkOV+CN7dl1FBB5g/mQEAGEegKcHQEsLCA6l5+P61ncbYlVOgiT
	LSuVCXJKvEXPCzXGBP9UAWizLqzgVdoJHdllupir36AIhcI2qSFXzRoIGG18NUmG0kUwhB3h3v3
	c8EEwfJlvPaGFFx1IueI0xNxdFYXG4agIjD89J9+LWjLgzGmyuxWOuuOTyR7kDnqxkAgQoc
X-Google-Smtp-Source: AGHT+IHdcFtAEYAAQASBtKeayCfm+TUeh0EUmIhELlzygdyzDHi/RefZDfbGF4KAgHav5VabTtBUqA==
X-Received: by 2002:a05:6000:2c3:b0:385:f1bc:7644 with SMTP id ffacd0b85a97d-38a221f9f85mr21128445f8f.6.1736171083848;
        Mon, 06 Jan 2025 05:44:43 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8acc02sm47383151f8f.104.2025.01.06.05.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 05:44:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 06 Jan 2025 14:44:30 +0100
Subject: [PATCH v2 2/3] clk: qcom: clk-alpha-pll: Add Pongo PLL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-sm8750-dispcc-v2-2-6f42beda6317@linaro.org>
References: <20250106-sm8750-dispcc-v2-0-6f42beda6317@linaro.org>
In-Reply-To: <20250106-sm8750-dispcc-v2-0-6f42beda6317@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10027;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=BuGgxnT8GMf64DMeHuTbpu3NUBH1f3aydDCYK6u6bsA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBne95Fpn+Mb36A3fYoMGD9W3ROEcr9EkmP0fIt5
 OzLMzOXlxWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ3veRQAKCRDBN2bmhouD
 1wvjD/0c0ewfkCZXtzrbzg9sTGFllgttbERhtfKwAiGOF2SiyUWRnpnToU4oTUJ6KgrwMTO25xd
 gYmAKmlsoDf3u1vP7PpAdlJ16ICdS978e9DuuYV7VB0ESW/xnlzznDUltNPZ4AR0b1JMNrtEB59
 hC7CEcFDnuNVwF5Inq5N6szRFIe1OxpFi+0tEW89ygVuDaUZr/0v3Gfp40tWtbxoQxVs3LTO/V8
 TGjUupCv643GRezXwBBN5+JOyyGBclXUZVFfUEnMPu2LSqSH+9Qnxz746zB52tirwC6T6qhZqYK
 +tVIrVQFSDmIMX7w9ItRQNuvc4bG9qqd02z1ILxZwfURE9P/ZmMDHTihpFTqUtF+M12v7Ovg1TD
 WraJ19Vxi2FIHKSajSeGgQpleM81ksqbWVpa3Hza/T681P24nV5pVz+Bqe2Q56lkUl3CMABaZvE
 B3P+Pjmy/dHg0gkq+iJYa9RxtZH0W3qs7Bb+/Ys/QSNzX88MtG1X79J8P6ULMwXyXI6dAbPvqdh
 kzG40stzSOLJqnxeS28TFoJaK7Pw0Xm3SE6Mq6AEOGf4wunU05pv7oTlp+yzt78pqr8/JWxQH1P
 Fd4espwHyDGBhtHBKO4UcmAiGaPzSGt9p94q1Guqk2nLgKFKO5lKA0ARJ0MocJEY22EIaoQ0Rcl
 bC35hdj1jcopH5A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add support for Pongo type of PLL clocks, used in Qualcomm SM8750 SoC.
Notable difference comparing to other PLLs is the need for calibration
for internally generated clock followed by wait_for_pll().  This is done
in configure call and at this time clocks are not yet registered, thus
wait_for_pll() cannot use clk_hw_get_name.  Locking during this
calibration requires much more time, thus increase the timeout in
wait_for_pll().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

v2:
 - EXPORT_SYMBOL_GPL
 - Move the PLL calibration and wait_for_pll_enable_lock() call to
   prepare callback.
---
 drivers/clk/qcom/clk-alpha-pll.c | 165 ++++++++++++++++++++++++++++++++++++++-
 drivers/clk/qcom/clk-alpha-pll.h |   6 ++
 2 files changed, 170 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 00d3659ea2124e26dd50c1b4e88ba71c1411442e..df609f7e394de2dc73e60df01b1ad71714c0719d 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -58,6 +58,7 @@
 #define PLL_TEST_CTL_U(p)	((p)->offset + (p)->regs[PLL_OFF_TEST_CTL_U])
 #define PLL_TEST_CTL_U1(p)     ((p)->offset + (p)->regs[PLL_OFF_TEST_CTL_U1])
 #define PLL_TEST_CTL_U2(p)     ((p)->offset + (p)->regs[PLL_OFF_TEST_CTL_U2])
+#define PLL_TEST_CTL_U3(p)     ((p)->offset + (p)->regs[PLL_OFF_TEST_CTL_U3])
 #define PLL_STATUS(p)		((p)->offset + (p)->regs[PLL_OFF_STATUS])
 #define PLL_OPMODE(p)		((p)->offset + (p)->regs[PLL_OFF_OPMODE])
 #define PLL_FRAC(p)		((p)->offset + (p)->regs[PLL_OFF_FRAC])
@@ -197,6 +198,23 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 		[PLL_OFF_TEST_CTL_U1] = 0x34,
 		[PLL_OFF_TEST_CTL_U2] = 0x38,
 	},
+	[CLK_ALPHA_PLL_TYPE_PONGO_ELU] = {
+		[PLL_OFF_OPMODE] = 0x04,
+		[PLL_OFF_STATE] = 0x08,
+		[PLL_OFF_STATUS] = 0x0c,
+		[PLL_OFF_L_VAL] = 0x10,
+		[PLL_OFF_USER_CTL] = 0x14,
+		[PLL_OFF_USER_CTL_U] = 0x18,
+		[PLL_OFF_CONFIG_CTL] = 0x1c,
+		[PLL_OFF_CONFIG_CTL_U] = 0x20,
+		[PLL_OFF_CONFIG_CTL_U1] = 0x24,
+		[PLL_OFF_CONFIG_CTL_U2] = 0x28,
+		[PLL_OFF_TEST_CTL] = 0x2c,
+		[PLL_OFF_TEST_CTL_U] = 0x30,
+		[PLL_OFF_TEST_CTL_U1] = 0x34,
+		[PLL_OFF_TEST_CTL_U2] = 0x38,
+		[PLL_OFF_TEST_CTL_U3] = 0x3c,
+	},
 	[CLK_ALPHA_PLL_TYPE_TAYCAN_ELU] = {
 		[PLL_OFF_OPMODE] = 0x04,
 		[PLL_OFF_STATE] = 0x08,
@@ -337,6 +355,12 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
 #define LUCID_EVO_PLL_CAL_L_VAL_SHIFT	16
 #define LUCID_OLE_PLL_RINGOSC_CAL_L_VAL_SHIFT	24
 
+/* PONGO ELU PLL specific setting and offsets */
+#define PONGO_PLL_OUT_MASK		GENMASK(1, 0)
+#define PONGO_PLL_L_VAL_MASK		GENMASK(11, 0)
+#define PONGO_XO_PRESENT		BIT(10)
+#define PONGO_CLOCK_SELECT		BIT(12)
+
 /* ZONDA PLL specific */
 #define ZONDA_PLL_OUT_MASK	0xf
 #define ZONDA_STAY_IN_CFA	BIT(16)
@@ -366,7 +390,8 @@ static int wait_for_pll(struct clk_alpha_pll *pll, u32 mask, bool inverse,
 	if (ret)
 		return ret;
 
-	for (count = 200; count > 0; count--) {
+	/* Pongo PLLs using a 32KHz reference can take upwards of 1500us to lock. */
+	for (count = 1500; count > 0; count--) {
 		ret = regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
 		if (ret)
 			return ret;
@@ -2527,6 +2552,144 @@ const struct clk_ops clk_alpha_pll_reset_lucid_evo_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_reset_lucid_evo_ops);
 
+static int alpha_pll_pongo_elu_prepare(struct clk_hw *hw)
+{
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	struct regmap *regmap = pll->clkr.regmap;
+	int ret;
+
+	/* Enable PLL intially to one-time calibrate against XO. */
+	regmap_write(regmap, PLL_OPMODE(pll), PLL_RUN);
+	regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
+	regmap_update_bits(regmap, PLL_MODE(pll), PONGO_XO_PRESENT, PONGO_XO_PRESENT);
+
+	/* Set regmap for wait_for_pll() */
+	pll->clkr.regmap = regmap;
+	ret = wait_for_pll_enable_lock(pll);
+	if (ret) {
+		/* Reverse calibration - disable PLL output */
+		regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, 0);
+		return ret;
+	}
+
+	/* Disable PLL after one-time calibration. */
+	regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
+
+	/* Select internally generated clock. */
+	regmap_update_bits(regmap, PLL_MODE(pll), PONGO_CLOCK_SELECT,
+			   PONGO_CLOCK_SELECT);
+
+	return 0;
+}
+
+static int alpha_pll_pongo_elu_enable(struct clk_hw *hw)
+{
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	struct regmap *regmap = pll->clkr.regmap;
+	int ret;
+
+	/* Check if PLL is already enabled */
+	if (trion_pll_is_enabled(pll, regmap))
+		return 0;
+
+	ret = regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
+	if (ret)
+		return ret;
+
+	/* Set operation mode to RUN */
+	regmap_write(regmap, PLL_OPMODE(pll), PLL_RUN);
+
+	ret = wait_for_pll_enable_lock(pll);
+	if (ret)
+		return ret;
+
+	/* Enable the global PLL outputs */
+	ret = regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, PLL_OUTCTRL);
+	if (ret)
+		return ret;
+
+	/* Ensure that the write above goes through before returning. */
+	mb();
+
+	return ret;
+}
+
+static void alpha_pll_pongo_elu_disable(struct clk_hw *hw)
+{
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	struct regmap *regmap = pll->clkr.regmap;
+	int ret;
+
+	/* Disable the global PLL output */
+	ret = regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, 0);
+	if (ret)
+		return;
+
+	/* Place the PLL mode in STANDBY */
+	regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
+}
+
+static unsigned long alpha_pll_pongo_elu_recalc_rate(struct clk_hw *hw,
+						     unsigned long parent_rate)
+{
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	struct regmap *regmap = pll->clkr.regmap;
+	u32 l;
+
+	if (regmap_read(regmap, PLL_L_VAL(pll), &l))
+		return 0;
+
+	l &= PONGO_PLL_L_VAL_MASK;
+
+	return alpha_pll_calc_rate(parent_rate, l, 0, pll_alpha_width(pll));
+}
+
+const struct clk_ops clk_alpha_pll_pongo_elu_ops = {
+	.prepare = alpha_pll_pongo_elu_prepare,
+	.enable = alpha_pll_pongo_elu_enable,
+	.disable = alpha_pll_pongo_elu_disable,
+	.recalc_rate = alpha_pll_pongo_elu_recalc_rate,
+};
+EXPORT_SYMBOL_GPL(clk_alpha_pll_pongo_elu_ops);
+
+void clk_pongo_elu_pll_configure(struct clk_alpha_pll *pll,
+				 struct regmap *regmap,
+				 const struct alpha_pll_config *config)
+{
+	u32 val;
+
+	regmap_update_bits(regmap, PLL_USER_CTL(pll), PONGO_PLL_OUT_MASK,
+			   PONGO_PLL_OUT_MASK);
+
+	if (trion_pll_is_enabled(pll, regmap))
+		return;
+
+	if (regmap_read(regmap, PLL_L_VAL(pll), &val))
+		return;
+	val &= PONGO_PLL_L_VAL_MASK;
+	if (val)
+		return;
+
+	clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), config->l);
+	clk_alpha_pll_write_config(regmap, PLL_ALPHA_VAL(pll), config->alpha);
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL(pll), config->config_ctl_val);
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U(pll), config->config_ctl_hi_val);
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U1(pll), config->config_ctl_hi1_val);
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U2(pll), config->config_ctl_hi2_val);
+	clk_alpha_pll_write_config(regmap, PLL_USER_CTL(pll),
+				   config->user_ctl_val | PONGO_PLL_OUT_MASK);
+	clk_alpha_pll_write_config(regmap, PLL_USER_CTL_U(pll), config->user_ctl_hi_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL(pll), config->test_ctl_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U(pll), config->test_ctl_hi_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U1(pll), config->test_ctl_hi1_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U2(pll), config->test_ctl_hi2_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U3(pll), config->test_ctl_hi3_val);
+
+	/* Disable PLL output */
+	regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, 0);
+}
+EXPORT_SYMBOL_GPL(clk_pongo_elu_pll_configure);
+
 void clk_rivian_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 				  const struct alpha_pll_config *config)
 {
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 87bd469d9c2c2ec4e0758c97231527b92fe6afe5..79aca8525262211ae5295245427d4540abf1e09a 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -27,6 +27,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_ZONDA_OLE,
 	CLK_ALPHA_PLL_TYPE_LUCID_EVO,
 	CLK_ALPHA_PLL_TYPE_LUCID_OLE,
+	CLK_ALPHA_PLL_TYPE_PONGO_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
 	CLK_ALPHA_PLL_TYPE_DEFAULT_EVO,
@@ -53,6 +54,7 @@ enum {
 	PLL_OFF_TEST_CTL_U,
 	PLL_OFF_TEST_CTL_U1,
 	PLL_OFF_TEST_CTL_U2,
+	PLL_OFF_TEST_CTL_U3,
 	PLL_OFF_STATE,
 	PLL_OFF_STATUS,
 	PLL_OFF_OPMODE,
@@ -138,6 +140,7 @@ struct alpha_pll_config {
 	u32 test_ctl_hi_mask;
 	u32 test_ctl_hi1_val;
 	u32 test_ctl_hi2_val;
+	u32 test_ctl_hi3_val;
 	u32 main_output_mask;
 	u32 aux_output_mask;
 	u32 aux2_output_mask;
@@ -196,6 +199,7 @@ extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
 #define clk_alpha_pll_postdiv_lucid_ole_ops clk_alpha_pll_postdiv_lucid_evo_ops
 #define clk_alpha_pll_postdiv_taycan_elu_ops clk_alpha_pll_postdiv_lucid_evo_ops
 
+extern const struct clk_ops clk_alpha_pll_pongo_elu_ops;
 extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
 #define clk_alpha_pll_postdiv_rivian_evo_ops clk_alpha_pll_postdiv_fabia_ops
 
@@ -222,6 +226,8 @@ void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regma
 				 const struct alpha_pll_config *config);
 void clk_lucid_ole_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 				 const struct alpha_pll_config *config);
+void clk_pongo_elu_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
+				 const struct alpha_pll_config *config);
 #define clk_taycan_elu_pll_configure(pll, regmap, config) \
 	clk_lucid_evo_pll_configure(pll, regmap, config)
 

-- 
2.43.0


