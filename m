Return-Path: <linux-arm-msm+bounces-39473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0E19DBA24
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 16:09:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 362BB16630B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 15:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B6621B6D0D;
	Thu, 28 Nov 2024 15:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ct9fh04F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7234419D06A
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 15:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732806510; cv=none; b=eIGdkjq4SY5YgjuSxrK73T360q/dqfJkWkNJpvXpxKlp0ofdiilXs+U48Pzdl63yQPpGjyRK4STmqVBi/WoNvbELe6rATSHVKis46Z7Fg0dzvYCr5FsNsh8q+rTgEJqNNPJEKGMpQ1DkBaqE3JvF1hYgkDY83MauRYaxtN1YMRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732806510; c=relaxed/simple;
	bh=rlbKyKmaJtl7AvcVbj958NNb2CTCjGH3e22/HK7aHSI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CNCg6Jh4ZoIxtpaPM48Blwzb7XHKDwF3nbDDyOjpdHshPVaYRcnj74HfqJ01a7tZnSBp5OupDsQBPr19jzJLdiE+Rs1orkwfsD+8iWpyC91G52IxbWfrWjS+psA0q0VmJvvY5Y0RWX9zk1ikm8hjKxDPbkOi6IhM8p+nsA8lrHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ct9fh04F; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-385db79aafbso1990f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 07:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732806506; x=1733411306; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lt5QzJeMPWKPAsqGSyhIDMAHPVBRFaBMW/ugPFyL0zM=;
        b=ct9fh04FrNnN1zxce09NpASj1I5DVvF62kgyL4GuSYmB5mH/CZEmDIXUl4BMJ7I4Iy
         e+JIWInb4jIxlGxhmuf/jU6NI5uMiLfn58JxtY1c4wNE5WRxDaVdRmYZtVshhOHed8tH
         CMG0COrI+N58apdQoy6gUszawugrw3w3PUGMBiU4QZ95XwA/3vxccYwWREGptnW5BRnb
         djAeoDljnQ60QsxTdCefgEJvcJqYtT5Qd4QjX/ViUrnXIHCz2g60h5ijnP5IBTAveuYf
         JKM9zKI2DKvP0yfQfrGJssSMcbyndm+JuuEm6SW8gQcfxTk/Wx5Tp8Z3uzZS1f6D4ejr
         RTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732806506; x=1733411306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lt5QzJeMPWKPAsqGSyhIDMAHPVBRFaBMW/ugPFyL0zM=;
        b=LhgtMGRclLl/GwfjGss0/iTxYLX24jbiBG+IwJgtMw3mEDKFGNU0PxM6z8g/FdIONt
         KxzaBZtH5D0NKwnWUazmf7jWrJWfKNXaRzxVdT457lSPQ2+ePfbTBO8ACUUlt7H7CGf/
         4tnV1YrDsA6/oMlMPNDw1XIyBZvXjUGfzRnZLEms4o1iB9830VadzpTS8mZK66GGu9d8
         ew1x8ZFiiEJty2MJ93d9Oj/NqqQ7p2Bfya5fUXpFcUamkBIpL6cQKwVzg11VWju+J7u/
         mRHDMDaQemTVObpLECb16aZ7gZgpjUSI/h84uBOaD6IQUCKuSPg8ciOUiyNQVLZh3Spb
         N3Xg==
X-Gm-Message-State: AOJu0YzgL+q56ICO5aQ61hrlzSSmBJTLBxeZChEAciMFAl5Jev1ehEAK
	2WM7tYhoBsgdwyKWPBuWlFMJ5bTNQuqccR44iJLnwRqPM9oam4IFIiTlDE1PnGE=
X-Gm-Gg: ASbGncuM5u1SUwIZVuiCex47reKWzW8rr7EMT8Mdz9svbLAmKXvI/IFIW9ZFGEt5tc/
	2wWgpyKCkmPief9rrUFVngpEGTd+HMmCFcRyBcVHtLwJk9yPlXrBAjLKQyTj+cnC+t2Honfrt8K
	QrmGeRp5cksFYuqp0SVgO8cWl/J22ugBo9eO1z8DyHe3xO4jI8RI+r/Y2ULHMOgFuaHAkw8dOsR
	sO/h5U4IodBJCqBzJOo/YZrogxRSlN/GSpUtqo9i4BcWuISc6ql28Xx9G+zJ9hm
X-Google-Smtp-Source: AGHT+IGR1lbSVgB7vzP7m/gmvAgrBpQbx+UF61A50ryjf7WQv+50btp/Sgs2mmdy2IVSZrcDUYdpZw==
X-Received: by 2002:a05:6000:1867:b0:382:542d:3994 with SMTP id ffacd0b85a97d-385c6cca768mr2201090f8f.2.1732806498938;
        Thu, 28 Nov 2024 07:08:18 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd7fc33sm1828291f8f.94.2024.11.28.07.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 07:08:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 28 Nov 2024 16:08:00 +0100
Subject: [PATCH 2/3] clk: qcom: clk-alpha-pll: Add Pongo PLL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241128-sm8750-dispcc-v1-2-120705a4015c@linaro.org>
References: <20241128-sm8750-dispcc-v1-0-120705a4015c@linaro.org>
In-Reply-To: <20241128-sm8750-dispcc-v1-0-120705a4015c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10106;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=rlbKyKmaJtl7AvcVbj958NNb2CTCjGH3e22/HK7aHSI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnSIdV8PJ4CeQsUr6uhn2gqq6+GZvtv+ehfTnD7
 CHw7LVX9B2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ0iHVQAKCRDBN2bmhouD
 11tdD/91lfmRXs+7J0tCh6uvPa6RZImGwSwhswJmwdtWXKGlrgDdPM98Apd4aoX2cxZSGDBZQh3
 Fy1v0eMrCHdB7lPf5/kVAW9Qj/BZ4E6ZffSixBb49b3OSvK7bpnbODlNir8GFIHLfeZT0Tykra6
 YdbfkyIvxds2lj+VzD+IOAfZESbBqvNcwBTvqSiEuD5CwSU/nkAostnFBgx8vHnXMUI5+0dCNbn
 tk12tJ7dKrXihX/NLuDqYZfOvUY5uOLHHRfk0b22T2CBq4+cNaazg0FYyVLfubjYpT/u0B9VcGu
 lJuXYykNzkZL780Yw+5X7u7NkcmQdrd0KeIyvjns6+X7yWaLncoeM9scVcYG9ed7QUNXvxlCyny
 LY0c13VQeYb/qtWIfJBWVUhaiE5MNkAwk6Nm6rzgXrWrhNbMg/A3VKMkGAK+H/PSW50HRPY8azQ
 VjTfSiK0yWIBu85+klD7YWjzBt3kN/eAAKVZILpPtilwNMfsSVCtqyPXrLmEygboWjWuY3mvrL5
 E2b79YcUc6iB9URAxhWiHwV4scOqctZ2YHUc5bJA5lVK2bRrBpeGVlZMkuwfFHZjs1IQrEVbClS
 wSipXXNfg1T1WgknTNTtZj1BRqPlME0zThvo24Ik7eqDMX1j0QvJlhrJvQaRTWAmteRZQU79TJi
 Oz4kGKhFX2aKutA==
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
 drivers/clk/qcom/clk-alpha-pll.c | 159 ++++++++++++++++++++++++++++++++++++++-
 drivers/clk/qcom/clk-alpha-pll.h |   6 ++
 2 files changed, 163 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 0cd937ab47d04e453e9835dd142cd15f39f3f710..5603c8861a24a62789be3853effe82944289262d 100644
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
@@ -360,13 +384,14 @@ static int wait_for_pll(struct clk_alpha_pll *pll, u32 mask, bool inverse,
 	u32 val;
 	int count;
 	int ret;
-	const char *name = clk_hw_get_name(&pll->clkr.hw);
+	const char *name;
 
 	ret = regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
 	if (ret)
 		return ret;
 
-	for (count = 200; count > 0; count--) {
+	/* Pongo PLLs using a 32KHz reference can take upwards of 1500us to lock. */
+	for (count = 1500; count > 0; count--) {
 		ret = regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
 		if (ret)
 			return ret;
@@ -378,6 +403,13 @@ static int wait_for_pll(struct clk_alpha_pll *pll, u32 mask, bool inverse,
 		udelay(1);
 	}
 
+	/* Called with clocks already registered ... */
+	if (pll->clkr.hw.core)
+		name = clk_hw_get_name(&pll->clkr.hw);
+	else
+		/* or before registering, when init data is present */
+		name = pll->clkr.hw.init->name;
+
 	WARN(1, "%s failed to %s!\n", name, action);
 	return -ETIMEDOUT;
 }
@@ -2524,6 +2556,129 @@ const struct clk_ops clk_alpha_pll_reset_lucid_evo_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_reset_lucid_evo_ops);
 
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
+	.enable = alpha_pll_pongo_elu_enable,
+	.disable = alpha_pll_pongo_elu_disable,
+	.recalc_rate = alpha_pll_pongo_elu_recalc_rate,
+};
+EXPORT_SYMBOL(clk_alpha_pll_pongo_elu_ops);
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
+
+	/* Enable PLL intially to one-time calibrate against XO. */
+	regmap_write(regmap, PLL_OPMODE(pll), PLL_RUN);
+	regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
+	regmap_update_bits(regmap, PLL_MODE(pll), PONGO_XO_PRESENT, PONGO_XO_PRESENT);
+
+	/* Set regmap for wait_for_pll() */
+	pll->clkr.regmap = regmap;
+	if (wait_for_pll_enable_lock(pll))
+		return;
+
+	/* Disable PLL after one-time calibration. */
+	regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
+
+	/* Select internally generated clock. */
+	regmap_update_bits(regmap, PLL_MODE(pll), PONGO_CLOCK_SELECT, PONGO_CLOCK_SELECT);
+}
+EXPORT_SYMBOL(clk_pongo_elu_pll_configure);
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


