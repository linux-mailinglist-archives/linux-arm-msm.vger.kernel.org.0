Return-Path: <linux-arm-msm+bounces-36487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FD69B6C69
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 19:58:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 424D51F222B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 18:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3FEC1D0E1B;
	Wed, 30 Oct 2024 18:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MkJUbm6n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19341D0967;
	Wed, 30 Oct 2024 18:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730314675; cv=none; b=fUhkA/PNLphGyx9l/724AVJC3yb82k+hlE42WQsqUhSqQsuTssSU8SfGaon2yThXVi6W0J5WjY3waDarJwU2IN9TeUD3XE4uHdpZlddhfWN9MdeUEetZtcqLKe8Bhfdw3H5frU7dxCTQQYs+1gD+i+GcoSxlyb2lCnEdW+/RarI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730314675; c=relaxed/simple;
	bh=TH30VyqA7OU9YqATMjryFauBN4pQYazeqI+zTeF8qaU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dC/1mLx8YIKJutgX4NkEZeDfo+zi6WljeXk+B8aOWVoA9qgzfqs0nCjjckzt6dI2Y+/C7G4rqUXwz6LVWfVQpPo6k5liwhES3vYKSp9TJsqAORRhrlLryPzq8MErA7e8HxZShWCEsXu8N6shxV9SrbkTQldt52nhYcixUhYMabE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MkJUbm6n; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c941623a5aso2262302a12.0;
        Wed, 30 Oct 2024 11:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730314671; x=1730919471; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YdKa5z3twiIQe8AUFC1Fbj5IBy2mDQVy5MB2Z28mCTw=;
        b=MkJUbm6nMw2w8qixQ4g1xgRsLDm6s+ng2aFXItWJrHiXO5vEolMXn7gFPUEMqemsD2
         9QnS5teEy0RbGRMtmR+P7AIpxpaO+VhgJ9FCFxX3yQUwNUXv+hOxvFGz18hmwTS1DPlR
         mOSSqca3VfyKEHrsLdiiy01FtLPWKNH6H2z4qJlWusZCfd3sj/f+U5tYjsrVX2qvM2vF
         mT/ZW7at+rnFSW2gzUkr8amDgbHt6lin5mEL4Xwk9knWw7UK4YwE9tS2Bsy/buIq1mq+
         IvUZLmwUw1S1saZMYAfLi/7yH6jnISNKT6Fez3yGWd9thSZ2dtz+A0fD6EH0TklA4qaQ
         kE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730314671; x=1730919471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YdKa5z3twiIQe8AUFC1Fbj5IBy2mDQVy5MB2Z28mCTw=;
        b=VQSsyl0Qhv9yuKUdvDLjDQKNoc4QwOhd3IZ1fLOFTLqlu/+KWEcEuTMaoIkPgcxjOX
         ZPo5YQKmbQVOoEqUlg+kQXNFKudLbyDAyFAnPPpD6Q32BcbWNQrSGLI2yfqadlxmz9UW
         vWr0vHh+0ajPHwEZkT8s9S7y7TYI2af6agU4X61MNVALowKPei+orDjoqL/mkj5pfKBp
         uFuFJn422IWbePG2UMhFaRbTSXABLfllO9ZJPUCTi+d4nk8/RhcRS4xdZa1O4+xnZFtV
         Fp6yiw+J6iDNloN/PJ+Kpo4+6UwtZ8L4beZnjqla06vwnToRs6uc9XLvZafCyHBe4TfO
         AXdg==
X-Forwarded-Encrypted: i=1; AJvYcCUx0hVODwWrVN+XmvYMy1pyc4TUjSwtDz4mfR+ecfgsB35ngGyP/yWDNtdX1xCBU767QIqi4e/K6KmjyMyW@vger.kernel.org, AJvYcCVBthQEp4la/m6VWfBfJk5TSOGdfSoG0PJQyxQ9wKk6i9M28ahhY2pcZYbzNLjY9YJL3uTvCHn0XZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoUExvZy1Ou7ng14VB7XVloC1teMPR668n3n8NGfrZNWlXTMoY
	vwMQs2+Ki4yeN+Ah8UvdvUsBcawkMlU27ZfhrZ1dZVpnftd4CY6OUB875g==
X-Google-Smtp-Source: AGHT+IEzJVd1GXFUme12ZMJyOhBQig42aLyDkpnyudUaJ4JMJR57bxj/nxnfhL5Si6cnFrkkONsAHg==
X-Received: by 2002:a05:6402:50cb:b0:5cb:991d:c51e with SMTP id 4fb4d7f45d1cf-5cd2e35309cmr6145619a12.15.1730314670588;
        Wed, 30 Oct 2024 11:57:50 -0700 (PDT)
Received: from [127.0.1.1] (leased-line-46-53-189-50.telecom.by. [46.53.189.50])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb62c20dasm4970447a12.46.2024.10.30.11.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 11:57:50 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Wed, 30 Oct 2024 21:57:39 +0300
Subject: [PATCH v8 3/3] gcc-sdm845: Add general purpose clock ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241030-starqltechn_integration_upstream-v8-3-40f8d5e47062@gmail.com>
References: <20241030-starqltechn_integration_upstream-v8-0-40f8d5e47062@gmail.com>
In-Reply-To: <20241030-starqltechn_integration_upstream-v8-0-40f8d5e47062@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730314661; l=9804;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=TH30VyqA7OU9YqATMjryFauBN4pQYazeqI+zTeF8qaU=;
 b=ieSG9DH0e1S1luDrgXGgIInFruF5WdeyD/fjiisyCX4LS3BZbpMS/v36t7aZNMvpZbnpr06Zo
 VUqnE8kb7S0AB5KRbN8Yexy1Mf2PVpVMvbj7k8hfbI/4m8uSSLTgXgp
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

SDM845 has "General Purpose" clocks that can be muxed to
SoC pins to clock various external devices.
Those clocks may be used as e.g. PWM sources for external peripherals.

GPCLK can in theory have arbitrary value depending on the use case, so
the concept of frequency tables, used in rcg2 clock driver, is not
efficient, because it allows only defined frequencies.

Introduce clk_rcg2_gp_ops, which automatically calculate clock
mnd values for arbitrary clock rate. The calculation done as follows:
- upon determine rate request, we calculate m/n/pre_div as follows:
  - find parent(from our client's assigned-clock-parent) rate
  - find scaled rates by dividing rates on its greatest common divisor
  - assign requested scaled rate to m
  - factorize scaled parent rate, put multipliers to n till max value
    (determined by mnd_width)
- validate calculated values with *_width:
  - if doesn't fit, delete divisor and multiplier by 2 until fit
- return determined rate

Limitations:
- The driver doesn't select a parent clock (it may be selected by client
  in device tree with assigned-clocks, assigned-clock-parents properties)

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>

---
Changes in v8:
- format kernel-doc
- test with scripts/kernel-doc

Changes in v7:
- split patch on gp and non gp changes
- use /**/ comment for kernel doc
- clk_rcg2_determine_gp_rate: put freq_tbl to the stack
- clk_rcg2_calc_mnd: if impossible to lower scale, return
  after setting max divisors values

Changes in v6:
- remove unused count variable
- run sparse and smatch

Changes in v5:
- replace '/' to div64_u64 to fix 32 bit gcc error
- fix empty scalar initializer
---
 drivers/clk/qcom/clk-rcg.h    |   1 +
 drivers/clk/qcom/clk-rcg2.c   | 146 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/gcc-sdm845.c |  11 +++--------
 3 files changed, 150 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index 8e0f3372dc7a..8817d14bbda4 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -189,6 +189,7 @@ struct clk_rcg2_gfx3d {
 	container_of(to_clk_rcg2(_hw), struct clk_rcg2_gfx3d, rcg)
 
 extern const struct clk_ops clk_rcg2_ops;
+extern const struct clk_ops clk_rcg2_gp_ops;
 extern const struct clk_ops clk_rcg2_floor_ops;
 extern const struct clk_ops clk_rcg2_fm_ops;
 extern const struct clk_ops clk_rcg2_mux_closest_ops;
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 714ab79e11d6..75617cc8f0c4 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -8,11 +8,13 @@
 #include <linux/err.h>
 #include <linux/bug.h>
 #include <linux/export.h>
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
 #include <linux/rational.h>
 #include <linux/regmap.h>
 #include <linux/math64.h>
+#include <linux/gcd.h>
 #include <linux/minmax.h>
 #include <linux/slab.h>
 
@@ -32,6 +34,7 @@
 
 #define CFG_REG			0x4
 #define CFG_SRC_DIV_SHIFT	0
+#define CFG_SRC_DIV_LENGTH	8
 #define CFG_SRC_SEL_SHIFT	8
 #define CFG_SRC_SEL_MASK	(0x7 << CFG_SRC_SEL_SHIFT)
 #define CFG_MODE_SHIFT		12
@@ -148,6 +151,17 @@ static int clk_rcg2_set_parent(struct clk_hw *hw, u8 index)
 	return update_config(rcg);
 }
 
+/**
+ * convert_to_reg_val() - Convert divisor values to hardware values.
+ *
+ * @f: Frequency table with pure m/n/pre_div parameters.
+ */
+static void convert_to_reg_val(struct freq_tbl *f)
+{
+	f->pre_div *= 2;
+	f->pre_div -= 1;
+}
+
 /**
  * calc_rate() - Calculate rate based on m/n:d values
  *
@@ -402,6 +416,90 @@ static int clk_rcg2_fm_determine_rate(struct clk_hw *hw,
 	return _freq_tbl_fm_determine_rate(hw, rcg->freq_multi_tbl, req);
 }
 
+/**
+ * clk_rcg2_split_div() - Split multiplier that doesn't fit in n neither in pre_div.
+ *
+ * @multiplier: Multiplier to split between n and pre_div.
+ * @pre_div: Pointer to pre divisor value.
+ * @n: Pointer to n divisor value.
+ * @pre_div_max: Pre divisor maximum value.
+ */
+static inline void clk_rcg2_split_div(int multiplier, unsigned int *pre_div,
+				      u16 *n, unsigned int pre_div_max)
+{
+	*n = mult_frac(multiplier * *n, *pre_div, pre_div_max);
+	*pre_div = pre_div_max;
+}
+
+static void clk_rcg2_calc_mnd(u64 parent_rate, u64 rate, struct freq_tbl *f,
+			unsigned int mnd_max, unsigned int pre_div_max)
+{
+	int i = 2;
+	unsigned int pre_div = 1;
+	unsigned long rates_gcd, scaled_parent_rate;
+	u16 m, n = 1, n_candidate = 1, n_max;
+
+	rates_gcd = gcd(parent_rate, rate);
+	m = div64_u64(rate, rates_gcd);
+	scaled_parent_rate = div64_u64(parent_rate, rates_gcd);
+	while (scaled_parent_rate > (mnd_max + m) * pre_div_max) {
+		// we're exceeding divisor's range, trying lower scale.
+		if (m > 1) {
+			m--;
+			scaled_parent_rate = mult_frac(scaled_parent_rate, m, (m + 1));
+		} else {
+			// cannot lower scale, just set max divisor values.
+			f->n = mnd_max + m;
+			f->pre_div = pre_div_max;
+			f->m = m;
+			return;
+		}
+	}
+
+	n_max = m + mnd_max;
+
+	while (scaled_parent_rate > 1) {
+		while (scaled_parent_rate % i == 0) {
+			n_candidate *= i;
+			if (n_candidate < n_max)
+				n = n_candidate;
+			else if (pre_div * i < pre_div_max)
+				pre_div *= i;
+			else
+				clk_rcg2_split_div(i, &pre_div, &n, pre_div_max);
+
+			scaled_parent_rate /= i;
+		}
+		i++;
+	}
+
+	f->m = m;
+	f->n = n;
+	f->pre_div = pre_div > 1 ? pre_div : 0;
+}
+
+static int clk_rcg2_determine_gp_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
+{
+	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+	struct freq_tbl f_tbl = {}, *f = &f_tbl;
+	int mnd_max = BIT(rcg->mnd_width) - 1;
+	int hid_max = BIT(rcg->hid_width) - 1;
+	struct clk_hw *parent;
+	u64 parent_rate;
+
+	parent = clk_hw_get_parent(hw);
+	parent_rate = clk_get_rate(parent->clk);
+	if (!parent_rate)
+		return -EINVAL;
+
+	clk_rcg2_calc_mnd(parent_rate, req->rate, f, mnd_max, hid_max / 2);
+	convert_to_reg_val(f);
+	req->rate = calc_rate(parent_rate, f->m, f->n, f->n, f->pre_div);
+
+	return 0;
+}
+
 static int __clk_rcg2_configure_parent(struct clk_rcg2 *rcg, u8 src, u32 *_cfg)
 {
 	struct clk_hw *hw = &rcg->clkr.hw;
@@ -499,6 +597,26 @@ static int clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f)
 	return update_config(rcg);
 }
 
+static int clk_rcg2_configure_gp(struct clk_rcg2 *rcg, const struct freq_tbl *f)
+{
+	u32 cfg;
+	int ret;
+
+	ret = regmap_read(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg), &cfg);
+	if (ret)
+		return ret;
+
+	ret = __clk_rcg2_configure_mnd(rcg, f, &cfg);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg), cfg);
+	if (ret)
+		return ret;
+
+	return update_config(rcg);
+}
+
 static int __clk_rcg2_set_rate(struct clk_hw *hw, unsigned long rate,
 			       enum freq_policy policy)
 {
@@ -552,6 +670,22 @@ static int clk_rcg2_set_rate(struct clk_hw *hw, unsigned long rate,
 	return __clk_rcg2_set_rate(hw, rate, CEIL);
 }
 
+static int clk_rcg2_set_gp_rate(struct clk_hw *hw, unsigned long rate,
+			    unsigned long parent_rate)
+{
+	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+	int mnd_max = BIT(rcg->mnd_width) - 1;
+	int hid_max = BIT(rcg->hid_width) - 1;
+	struct freq_tbl f_tbl = {}, *f = &f_tbl;
+	int ret;
+
+	clk_rcg2_calc_mnd(parent_rate, rate, f, mnd_max, hid_max / 2);
+	convert_to_reg_val(f);
+	ret = clk_rcg2_configure_gp(rcg, f);
+
+	return ret;
+}
+
 static int clk_rcg2_set_floor_rate(struct clk_hw *hw, unsigned long rate,
 				   unsigned long parent_rate)
 {
@@ -679,6 +813,18 @@ const struct clk_ops clk_rcg2_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_rcg2_ops);
 
+const struct clk_ops clk_rcg2_gp_ops = {
+	.is_enabled = clk_rcg2_is_enabled,
+	.get_parent = clk_rcg2_get_parent,
+	.set_parent = clk_rcg2_set_parent,
+	.recalc_rate = clk_rcg2_recalc_rate,
+	.determine_rate = clk_rcg2_determine_gp_rate,
+	.set_rate = clk_rcg2_set_gp_rate,
+	.get_duty_cycle = clk_rcg2_get_duty_cycle,
+	.set_duty_cycle = clk_rcg2_set_duty_cycle,
+};
+EXPORT_SYMBOL_GPL(clk_rcg2_gp_ops);
+
 const struct clk_ops clk_rcg2_floor_ops = {
 	.is_enabled = clk_rcg2_is_enabled,
 	.get_parent = clk_rcg2_get_parent,
diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
index dc3aa7014c3e..0def0fc0e009 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -284,11 +284,6 @@ static struct clk_rcg2 gcc_sdm670_cpuss_rbcpr_clk_src = {
 };
 
 static const struct freq_tbl ftbl_gcc_gp1_clk_src[] = {
-	F(19200000, P_BI_TCXO, 1, 0, 0),
-	F(25000000, P_GPLL0_OUT_EVEN, 12, 0, 0),
-	F(50000000, P_GPLL0_OUT_EVEN, 6, 0, 0),
-	F(100000000, P_GPLL0_OUT_MAIN, 6, 0, 0),
-	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
 	{ }
 };
 
@@ -302,7 +297,7 @@ static struct clk_rcg2 gcc_gp1_clk_src = {
 		.name = "gcc_gp1_clk_src",
 		.parent_data = gcc_parent_data_1,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_gp_ops,
 	},
 };
 
@@ -316,7 +311,7 @@ static struct clk_rcg2 gcc_gp2_clk_src = {
 		.name = "gcc_gp2_clk_src",
 		.parent_data = gcc_parent_data_1,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_gp_ops,
 	},
 };
 
@@ -330,7 +325,7 @@ static struct clk_rcg2 gcc_gp3_clk_src = {
 		.name = "gcc_gp3_clk_src",
 		.parent_data = gcc_parent_data_1,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_gp_ops,
 	},
 };
 

-- 
2.39.2


