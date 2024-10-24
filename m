Return-Path: <linux-arm-msm+bounces-35673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C495B9AE23A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 12:14:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C9D0B2327D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 10:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 054141C9EDB;
	Thu, 24 Oct 2024 10:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hCBmdvZu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121EA1C75FA;
	Thu, 24 Oct 2024 10:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729764812; cv=none; b=WNyveuWe+Vc9tYSH1KMJoJaabjWgB/PTcUYF4yZKV+p4cADd/WQbq1f70WPXA4/caL7L62seHBak26QnemKLxgmzkUxYiAnaKZallI68uB9rEfJjL0pOqVvS4jYXWHjSjYD39JDJLH7VJlIxyi+NCUyPOqlTAB2sH7ndpbRLcr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729764812; c=relaxed/simple;
	bh=yvsN3uHXEDaNJ7PpTpFPxbPfmuXvrn9otwuak3kjTTA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GkIwl7v1baT7VuY6oqw23En81M6KGruO7N7AISIp6XiYDZ7CRG4athqk64d3VzXukhUDZBe1LpFEjYwW8qRhUVo9YNBpf1ytuWEKT7FBlIIa2PukxztksUOhcXABOuqeEMq29rgbcDoXOgOwba7xUDcf+lvfnTjY1VJx26lUiGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hCBmdvZu; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a9a977d6cc7so40001866b.3;
        Thu, 24 Oct 2024 03:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729764808; x=1730369608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=carGputot5lA13PiuUkbUqLVhby4W9zP8Cj/uY2Pmk0=;
        b=hCBmdvZux40r0z4spFR0+kwz88cHGyxVkT8KFd86vE0AarU7JWHGZBZYChOJxwIYOf
         b62gOfQDkbjO1rp6bbXn+7kA37N7CvnqWB5Mu4DxgmF3W6hFfwBNLs8Rz2kLb5eQlc/z
         teYMFb9Zt8KrdA0TDLgM9TAkYJ+Jqdou62UB2C+YAx6luHBRvnLGi3VbCx9eAK4+2NFs
         vH/OaoWA70KiDFjhenjJVXJ2hOV3ZclpcAVnrDUh8gTycw9nDoIVxQMEx2+8InrnRxki
         JE5n3uj/fgSUyaBZSPGxxG9Qb58G8fbRKhIwryBI9TCbsMmAIJ8CQtofs6GpJ6HwOiUq
         Sh7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729764808; x=1730369608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=carGputot5lA13PiuUkbUqLVhby4W9zP8Cj/uY2Pmk0=;
        b=GoMExeWBKx0+BmHJFxKxT/kSLa8QW3LoHdAS1L/cHT6LfbNOWnj7TAQXiNTuCyrF8H
         Q44C8Y5HZZ3efONhIpLTv+two4CTpdl+9nS0rf1kXC+qIT+DGPakF54jMUJRdC7dv3U0
         vR+mQLyCgx1L+VdbJiwSA5G7eYiTSnl+nSGLdwiXS3RfgUVj/BYv4HalKmhuQqsQaNIM
         BP4bhTAOP8XX9waS1R4Ef4g2iBlcysLlQJIBmCf9PIs3lZvdsV73EcrFJzGFDz1i1H2G
         BAM1aOUu67lfTF4zaFVXoeGMjsZ2WkhgDbUheE/ALcKoUx9tyY4ZqEHPRAp8T2rEitvO
         /l9g==
X-Forwarded-Encrypted: i=1; AJvYcCUfR+xtyG/FrvAu2OauBgufsD6kjq/Uf8AzZS8KlbgbsVeGVn3B4UGLWALSQtRtSSe63RExRCAawN4=@vger.kernel.org, AJvYcCUzd0VMrGhKRll4XMqm4U3UFUByzFMRV4qK8FVC1756DxJJyim79aryRlQw13Bi0Lq8m8hDbMcF9D/hhrhV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/QOGWOCoOonHeTGJanLpjfiCqWzHU+lS6/f1EPGF6WJgLg9sv
	MebtiQ9wWiJog9rk8vcHd3AOQ+v/Xe9ioBunZn1y5gEGrX8ZWEgo4SjvUg==
X-Google-Smtp-Source: AGHT+IEJbF/7RIqoJSCB4yG1ul3Cahl9BFM4aZAuq0QcGlxuo5/AyyvSF05cJwweZY++bhttfamV9Q==
X-Received: by 2002:a05:6402:5387:b0:5ca:e44:6945 with SMTP id 4fb4d7f45d1cf-5cb8b1c1ac1mr5990249a12.15.1729764807718;
        Thu, 24 Oct 2024 03:13:27 -0700 (PDT)
Received: from [127.0.1.1] ([46.53.244.166])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66a6a6efsm5519757a12.53.2024.10.24.03.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 03:13:26 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 24 Oct 2024 13:13:11 +0300
Subject: [PATCH v7 3/3] gcc-sdm845: Add general purpose clock ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-starqltechn_integration_upstream-v7-3-78eaf21ecee9@gmail.com>
References: <20241024-starqltechn_integration_upstream-v7-0-78eaf21ecee9@gmail.com>
In-Reply-To: <20241024-starqltechn_integration_upstream-v7-0-78eaf21ecee9@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729764800; l=9700;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=yvsN3uHXEDaNJ7PpTpFPxbPfmuXvrn9otwuak3kjTTA=;
 b=6EeyXt1vGYA1jyhYYKnptD5dD8DbvBc4S8u3Fd8iSt4kViB+Fpg6T3v4Dpax7Ad6zLHXKhFJv
 x6HIb9heEB8BpFN9fZ2o0kK5+qZXNc8OQjqXEObbvC/gGybL+/hz5Kj
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
index a56c7caad33a..d01d2d6f8e41 100644
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
@@ -148,6 +151,16 @@ static int clk_rcg2_set_parent(struct clk_hw *hw, u8 index)
 	return update_config(rcg);
 }
 
+/*
+ * Converts divisors to corresponding clock register values.
+ * @param f - Frequency table with pure m/n/pre_div parameters.
+ */
+static void convert_to_reg_val(struct freq_tbl *f)
+{
+	f->pre_div *= 2;
+	f->pre_div -= 1;
+}
+
 /*
  * Calculate m/n:d rate
  *
@@ -400,6 +413,91 @@ static int clk_rcg2_fm_determine_rate(struct clk_hw *hw,
 	return _freq_tbl_fm_determine_rate(hw, rcg->freq_multi_tbl, req);
 }
 
+/*
+ * Split multiplier that doesn't fit in n neither in pre_div.
+ *
+ * @param multiplier - multiplier to split between n and pre_div
+ * @param pre_div - pointer to pre divisor value
+ * @param n - pointer to n divisor value
+ * @param pre_div_max - pre divisor maximum value
+ *
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
@@ -497,6 +595,26 @@ static int clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f)
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
@@ -550,6 +668,22 @@ static int clk_rcg2_set_rate(struct clk_hw *hw, unsigned long rate,
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
@@ -677,6 +811,18 @@ const struct clk_ops clk_rcg2_ops = {
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


