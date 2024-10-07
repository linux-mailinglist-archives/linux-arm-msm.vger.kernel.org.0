Return-Path: <linux-arm-msm+bounces-33415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E3E99316B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 17:36:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D1FD1F23A7C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 15:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73ED41D9694;
	Mon,  7 Oct 2024 15:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YMJpYqlJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D2E1D9663;
	Mon,  7 Oct 2024 15:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728315383; cv=none; b=q+WkeVaGvATISxfuPC2jq8PC4LHEriim3HGdD//IO20ZD7U011RAt3i9Ei00bCOv1jm7GlOC/eVMqkBS2ugg9eaee+ywxdef5VG29CXXZnMmiKIjA+ZT39jKQsScx4MaE8ArqzTd8Nin2JHKoFnZvuiRvX2ElHok1GRCNtnnEU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728315383; c=relaxed/simple;
	bh=693tiCNiRyuQdV3vpHkuLv7Fa/G/rjvzX2pzjBKCb6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n7sOvnVYQ0w5N2KbdpPpGI+9naJAXGVkyyyeu/FZJ4BoI5rrLgX2AIWUrNwzFEnzPSgaU2ME3NQLJKjdkyLAEUfPM3HxNOHGnuKn/lRvPm5cXCP8G4Tk1uIWThaD5OXlzG3ngI6AEwSNK215ixlos9buy2LFbZnl6RIU5angwl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YMJpYqlJ; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5398e3f43f3so5281865e87.2;
        Mon, 07 Oct 2024 08:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728315377; x=1728920177; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3XxzO3eO1RE0q1H60ruK3JIdPU+va07YQFXxOpd3qaY=;
        b=YMJpYqlJWEacyWj/OBohzO3GOjQObw84ElE4I1A0b7b/iLT7PHW+yFUISp+YWpT0QM
         mvzEhXFVSkJ64ElbHzNPSs7CMGJYWqh3r67M+dK0/7+Us4bifXmgHDHBJveuPFGpT7tX
         Li50eg70/gWi2Gru1BTGQKnPFeU4gJkeDr1dj0nb7oyVKH5aY7BrB3N29LIGxwDRQE5w
         uh87Gwo+t66UOWppp11mn7Ibl6+DoLT9QieDkuMJlJLYqXgJeVCffFpYZyFuY+NHwOjd
         /KmPTvjSla/YW7F/JCk+ITMC9a3B+qWShyjULOeM1PstyNjW//tAd4y8GEOxXIiRESgR
         Oacg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728315377; x=1728920177;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3XxzO3eO1RE0q1H60ruK3JIdPU+va07YQFXxOpd3qaY=;
        b=TpSAkbNx/RYiPGH1rUoNGhB26AlVwcd4gdlTRFRhy+O/2u3pC4ab3FWnISMEp4Y25k
         rr6QTEN7/kXqTPxxAefYzRQ24KzV+wlj6AN1AMm+K9idS11jJQYf4lbuMQ1vYQpDitL3
         br/rU7mL6bpWDKnPsMjjt8y9mTdqrKbvvXqdxGStCyrUfpLYq/mumXfXe4o1fzKEaXkP
         za+0pSVkVG1f+xTiAoFcjGBSi4nC+0oKN9x75TRgT+R1vDRx+iTIWPi3L98jKtQQJZBM
         +D3sQ1MlnteV83OsX0kQMqeEg5IDeFGQ8hCLtvObEYvbRieDcjLtTiOS2qlDc2tC780Y
         5w/A==
X-Forwarded-Encrypted: i=1; AJvYcCUC2JmR1ZLXHo0trR8zjKi9XLkUt+OnMZnKFfukthX/I1vLzckXcbPQHSGPUvtVmTInt86x8cxjPuk=@vger.kernel.org, AJvYcCVTuAp2gJUh1ffXgoKWMngIAre7lrl11vHtHVUkqL1d28DuYxenkmczQREsOSfEKj14KktRfOo3UeS1YHFt@vger.kernel.org
X-Gm-Message-State: AOJu0YxF7ROqjTpmNWYMdzl6Pm50BtmYxpSWDYuWnkcP4fl9AtlzkS4H
	Ei7ugOgi5L0BcsRQ1aTKG4a2UrDhUlQVy+C1oYVPnymCwGfRgE+wKrTo8Q==
X-Google-Smtp-Source: AGHT+IFhabMJpoClOwifDERSGM1NgmaBXmltCnuuZe5S1UkU0NPR768wihmfW5LzSv41I+Uu0z/RKg==
X-Received: by 2002:a05:6512:31cc:b0:535:65ce:e901 with SMTP id 2adb3069b0e04-539ab84e046mr5684043e87.4.1728315377035;
        Mon, 07 Oct 2024 08:36:17 -0700 (PDT)
Received: from [127.0.1.1] (nat6-minsk-pool-46-53-210-75.telecom.by. [46.53.210.75])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a9937615e85sm367362266b.175.2024.10.07.08.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 08:36:16 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 07 Oct 2024 18:36:12 +0300
Subject: [PATCH v6 2/2] gcc-sdm845: Add general purpose clock ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241007-starqltechn_integration_upstream-v6-2-dd75c06c708d@gmail.com>
References: <20241007-starqltechn_integration_upstream-v6-0-dd75c06c708d@gmail.com>
In-Reply-To: <20241007-starqltechn_integration_upstream-v6-0-dd75c06c708d@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728315373; l=11221;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=693tiCNiRyuQdV3vpHkuLv7Fa/G/rjvzX2pzjBKCb6c=;
 b=ax4zflK3XlbWWJjO3uEtKXUrkWLIyt7yGk9MpxX6nV5vs4DN1phHtat53SgEZ5x/BOkhQwxAp
 kkCS2W6dha0C8gzRBU+44eS/gApShK8/S8oZ2lRgrP+GNTZ34IfB57w
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
Changes in v6:
- remove unused count variable
- run sparse and smatch

Changes in v5:
- replace '/' to div64_u64 to fix 32 bit gcc error
- fix empty scalar initializer
---
 drivers/clk/qcom/clk-rcg.h    |   1 +
 drivers/clk/qcom/clk-rcg2.c   | 191 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
 drivers/clk/qcom/gcc-sdm845.c |  11 +++-----
 3 files changed, 189 insertions(+), 14 deletions(-)

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
index 0fc23a87b432..ba0cccdc73ec 100644
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
@@ -148,6 +151,14 @@ static int clk_rcg2_set_parent(struct clk_hw *hw, u8 index)
 	return update_config(rcg);
 }
 
+// Converts divisors to corresponding clock register values.
+// @param f - Frequency table with pure m/n/pre_div parameters.
+static void convert_to_reg_val(struct freq_tbl *f)
+{
+	f->pre_div *= 2;
+	f->pre_div -= 1;
+}
+
 /*
  * Calculate m/n:d rate
  *
@@ -400,16 +411,115 @@ static int clk_rcg2_fm_determine_rate(struct clk_hw *hw,
 	return _freq_tbl_fm_determine_rate(hw, rcg->freq_multi_tbl, req);
 }
 
-static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f,
-				u32 *_cfg)
+// Split multiplier that doesn't fit in n neither in pre_div.
+//
+// @param multiplier - multiplier to split between n and pre_div
+// @param pre_div - pointer to pre divisor value
+// @param n - pointer to n divisor value
+// @param pre_div_max - pre divisor maximum value
+//
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
+			f->n = mnd_max + m;
+			f->pre_div = pre_div_max;
+			f->m = m;
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
+	struct freq_tbl *f;
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
+	f = kzalloc(sizeof(*f), GFP_KERNEL);
+
+	if (!f)
+		return -ENOMEM;
+
+	clk_rcg2_calc_mnd(parent_rate, req->rate, f, mnd_max, hid_max / 2);
+	convert_to_reg_val(f);
+	req->rate = calc_rate(parent_rate, f->m, f->n, f->n, f->pre_div);
+
+	kfree(f);
+
+	return 0;
+}
+
+static int __clk_rcg2_configure_parent(struct clk_rcg2 *rcg, u8 src, u32 *_cfg)
 {
-	u32 cfg, mask, d_val, not2d_val, n_minus_m;
 	struct clk_hw *hw = &rcg->clkr.hw;
-	int ret, index = qcom_find_src_index(hw, rcg->parent_map, f->src);
+	u32 mask = CFG_SRC_SEL_MASK;
+	int index = qcom_find_src_index(hw, rcg->parent_map, src);
 
 	if (index < 0)
 		return index;
 
+	*_cfg &= ~mask;
+	*_cfg |= rcg->parent_map[index].cfg << CFG_SRC_SEL_SHIFT;
+
+	return 0;
+}
+
+static int __clk_rcg2_configure_mnd(struct clk_rcg2 *rcg, const struct freq_tbl *f,
+				u32 *_cfg)
+{
+	u32 cfg, mask, d_val, not2d_val, n_minus_m;
+	int ret;
+
 	if (rcg->mnd_width && f->n) {
 		mask = BIT(rcg->mnd_width) - 1;
 		ret = regmap_update_bits(rcg->clkr.regmap,
@@ -438,9 +548,8 @@ static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f,
 	}
 
 	mask = BIT(rcg->hid_width) - 1;
-	mask |= CFG_SRC_SEL_MASK | CFG_MODE_MASK | CFG_HW_CLK_CTRL_MASK;
+	mask |= CFG_MODE_MASK | CFG_HW_CLK_CTRL_MASK;
 	cfg = f->pre_div << CFG_SRC_DIV_SHIFT;
-	cfg |= rcg->parent_map[index].cfg << CFG_SRC_SEL_SHIFT;
 	if (rcg->mnd_width && f->n && (f->m != f->n))
 		cfg |= CFG_MODE_DUAL_EDGE;
 	if (rcg->hw_clk_ctrl)
@@ -452,6 +561,22 @@ static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f,
 	return 0;
 }
 
+static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f,
+				u32 *_cfg)
+{
+	int ret;
+
+	ret = __clk_rcg2_configure_parent(rcg, f->src, _cfg);
+	if (ret)
+		return ret;
+
+	ret = __clk_rcg2_configure_mnd(rcg, f, _cfg);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static int clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f)
 {
 	u32 cfg;
@@ -472,6 +597,26 @@ static int clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f)
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
@@ -525,6 +670,28 @@ static int clk_rcg2_set_rate(struct clk_hw *hw, unsigned long rate,
 	return __clk_rcg2_set_rate(hw, rate, CEIL);
 }
 
+static int clk_rcg2_set_gp_rate(struct clk_hw *hw, unsigned long rate,
+			    unsigned long parent_rate)
+{
+	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+	int mnd_max = BIT(rcg->mnd_width) - 1;
+	int hid_max = BIT(rcg->hid_width) - 1;
+	struct freq_tbl *f;
+	int ret;
+
+	f = kzalloc(sizeof(*f), GFP_KERNEL);
+
+	if (!f)
+		return -ENOMEM;
+
+	clk_rcg2_calc_mnd(parent_rate, rate, f, mnd_max, hid_max / 2);
+	convert_to_reg_val(f);
+	ret = clk_rcg2_configure_gp(rcg, f);
+	kfree(f);
+
+	return ret;
+}
+
 static int clk_rcg2_set_floor_rate(struct clk_hw *hw, unsigned long rate,
 				   unsigned long parent_rate)
 {
@@ -652,6 +819,18 @@ const struct clk_ops clk_rcg2_ops = {
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


