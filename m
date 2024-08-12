Return-Path: <linux-arm-msm+bounces-28332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 488C794F179
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 17:16:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CED01C21F4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 15:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A51416E885;
	Mon, 12 Aug 2024 15:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g9qIxnwc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DC6450F2;
	Mon, 12 Aug 2024 15:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723475775; cv=none; b=rVE3qAkKnF42NwjoSSEKUt17FoRXaT35AqrB8wyYSaLKLWYbc2WKmNDOfPI/6DkLgIzWDFA8BeLUbwkMUs467VLEIEJ5ku3kmW/4Bkvww/xr5IXBvatgbDimZMol0aAXAyphU6ZaaI9gbKoTn3FZe1h7ifsAJFNiyaKcOc+yezM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723475775; c=relaxed/simple;
	bh=BtvWqiM7SzvAw0Emf4u4FDyWez3s59F5VLJ5IkrEXEc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XlZotG62sCkhl0w3xAdqBMrDM8ihsx1vHeIqtDJmQQTKDoV5q9mBD/af7cCAo3Ke9n43CX6zoeEoGmz1RZYKf0Q9JTqvy8YyCWJdqt9ajA3zDlkGVAYeiwESVd643r8MLlz1oIxzG3FjGBDpcDkORvmqaL312SWmrGz3DEjLZdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g9qIxnwc; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a7a8553db90so538040666b.2;
        Mon, 12 Aug 2024 08:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723475771; x=1724080571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAb1+Zu/NWkbyLJ5jLNMxxkvJ/aPU9MFIMXTO7SfrPk=;
        b=g9qIxnwcr8KOplS71uihK4n1KgAZrPQUal7ipkTO0FQFOUYyObIp/RSQxf5UpzlgSf
         DA9mWoDMAELgSmR36e3kgxrmSi0B7KKprdzLbtjejxFurKddYT+lVOQtzWN67m7CauXu
         HkfI8CC9kq0N36b4+KsXq8gl6IidqqZSViNZ5168KN2UE0ZW/1OEi5fUPPKXUadd4diV
         pfgoyjedHRbrmKVKLvTBiTJJdJMDuogF+o4hxzjPCMyUE/ZSCRlUhVPT3jLJJgYA8iI3
         eHj1feSaGGtVQEfSlyQfMlyfJyGPyo5D9Fm56YqwBtyxO8mhN7YbaGWEQrARITwDkNGf
         pG8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723475771; x=1724080571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XAb1+Zu/NWkbyLJ5jLNMxxkvJ/aPU9MFIMXTO7SfrPk=;
        b=V5FHb0n1ObWmb4N+n3WM6MbSjSqqKSKD2ZYU7p8AJmGbTjnYVXiVafX0Kg+ogyomvx
         APh4w3BGjKLA23FsqxjLaEXffCtbLglxjZ9oI8Sp21TySJjCCrJVLbsgLejTwL6/u/Ii
         +nzGwZZfnSr9F5iAaSEYHybI5qXy62zcZiiTqFSoRXHdQ+VQtuzpI1N4cyTikoX7mqaE
         /sPeluvbY8+YS5Om/yJ57P5VI6+nh2txhvtVuSIQBYltzCW5TULKFS0STSBS4pY7SBe3
         kDeQZqtD3NgCSQW/TLWBi87Ys5RVNJfy3EiXL110UCUzZfqyo/BZjKSJFed+XAMVjCzg
         j54A==
X-Forwarded-Encrypted: i=1; AJvYcCVhv31D1JO+QlvytoRuiWF5L+2aG0UqbzoXnhGu1gxN24OkkF/EXHepOtZxFB0QoO8hmkjazdt3e5CDVQTf2rI6Wu8Mmu8oJpMxvleCe2UIHN9SLromc1Z70ptycbuBqPV0rAz+BSjwcBgVd+uFzm7bFA9F7jyjb4K1yTKCzl+RXbTysmHcjA==
X-Gm-Message-State: AOJu0YyjE+UcvxocuI3YF/0tEW98i3wQajJEZLnxCFMl+KEmTAmgc/NL
	yXfHbNA/tfybWQ4eWvxNekiPo06upLj95isn+AHPnrXT8Tr0i1R3
X-Google-Smtp-Source: AGHT+IFDH46Q9I0CzR0qYReHmQlH666BZOMvRVpudVGjQFuLf2kjMfdk13QHF1B9Cgs6nQABqcXbww==
X-Received: by 2002:a17:906:794d:b0:a72:5598:f03d with SMTP id a640c23a62f3a-a80ed2d4733mr41323166b.59.1723475771404;
        Mon, 12 Aug 2024 08:16:11 -0700 (PDT)
Received: from debian.localdomain ([178.127.68.169])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a80bb23c250sm237340966b.189.2024.08.12.08.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 08:16:11 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dsankouski@gmail.com,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org (open list:QUALCOMM CLOCK DRIVERS),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH v3 02/23] gcc-sdm845: Add rates to the GP clocks
Date: Mon, 12 Aug 2024 18:16:06 +0300
Message-Id: <20240812151606.1996198-1-dsankouski@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <n7gvt4e6kt33lpnfivv4t2waro2t4qi4evkrfot3j2en7ubffb@gpzwolihwemr>
References: <n7gvt4e6kt33lpnfivv4t2waro2t4qi4evkrfot3j2en7ubffb@gpzwolihwemr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is Proof-of-concept for general purpose clock ops. It's purpose is to
eliminate the need of freq_tbl for general purpose clock, by runtime
m/n/hid_div(pre-divisor) calculation. The calculation done as follows:
- upon determine rate request, we calculate m/n/hid_div as follows:
  - find parent(from our client's assigned-clock-parent) rate
  - find requested rate - parent rate highest common factor
  - find scaled rates by dividing rates on highest common factor
  - assign requested scaled rate to m
  - factorize scaled parent rate, put even multipliers to hid_div,
    odd to n (to maintain approximately same hid_div and n width)
- validate calculated values with *_width:
  - if doesn't fit, shift right accordingly
- return determined rate

In this POC, pwm-clk driver requests assigned-clock-parent with the call of
assigned-clock-parent function, so GP clocks don't need to configure parent.
__clk_rcg2_configure is therefore divided to __clk_rcg2_configure_parent
and __clk_rcg2_configure_mnd to reuse code.

SDM845 has "General Purpose" clocks that can be muxed to
SoC pins to clock various external devices.
Those clocks may be used as e.g. PWM sources for external peripherals.

GPCLK can in theory have arbitrary value depending on the use case, so
the concept of frequency tables, used in rcg2 clock driver, is not
efficient, because it allows only defined frequencies.

Introduce clk_rcg2_gp_ops, which automatically calculate clock
mnd values for arbitrary clock rate.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---

 drivers/clk/qcom/clk-rcg.h    |   1 +
 drivers/clk/qcom/clk-rcg2.c   | 162 ++++++++++++++++++++++++++++++++--
 drivers/clk/qcom/gcc-sdm845.c |  12 ++-
 drivers/pwm/pwm-clk.c         |   5 ++
 4 files changed, 167 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index d7414361e432..5bd86bce0c4d 100644
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
index 30b19bd39d08..44b257481556 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -32,6 +32,7 @@
 
 #define CFG_REG			0x4
 #define CFG_SRC_DIV_SHIFT	0
+#define CFG_SRC_DIV_LENGTH	8
 #define CFG_SRC_SEL_SHIFT	8
 #define CFG_SRC_SEL_MASK	(0x7 << CFG_SRC_SEL_SHIFT)
 #define CFG_MODE_SHIFT		12
@@ -393,16 +394,103 @@ static int clk_rcg2_fm_determine_rate(struct clk_hw *hw,
 	return _freq_tbl_fm_determine_rate(hw, rcg->freq_multi_tbl, req);
 }
 
-static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f,
-				u32 *_cfg)
+static inline u64 find_hcf(u64 a, u64 b)
+{
+	while (a != 0 && b != 0) {
+		if (a > b)
+			a %= b;
+		else
+			b %= a;
+	}
+	return a + b;
+}
+
+static int clk_calc_mnd(u64 parent_rate, u64 rate, struct freq_tbl *f)
+{
+	u64 hcf;
+	u64 hid_div = 1, n = 1;
+	int i = 2, count = 0;
+
+	hcf = find_hcf(parent_rate, rate);
+	u64 scaled_rate = rate / hcf;
+	u64 scaled_parent_rate = parent_rate / hcf;
+
+	while (scaled_parent_rate > 1) {
+		while (scaled_parent_rate % i == 0) {
+			scaled_parent_rate /= i;
+			if (count % 2 == 0)
+				hid_div *= i;
+			else
+				n *= i;
+		}
+		i++;
+		count++;
+	}
+
+	f->m = scaled_rate;
+	f->n = n;
+	f->pre_div = hid_div;
+
+	return 0;
+}
+
+static int clk_rcg2_determine_gp_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
+{
+	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+	struct freq_tbl *f;
+	int src = clk_rcg2_get_parent(hw);
+	int mnd_max = BIT(rcg->mnd_width) - 1;
+	int hid_max = BIT(rcg->hid_width) - 1;
+	u64 parent_rate;
+	int ret;
+
+	parent_rate = rcg->freq_tbl[src].freq;
+	f = kcalloc(MAX_PERF_LEVEL + 1, sizeof(f), GFP_KERNEL);
+
+	if (!f)
+		return 0;
+
+	ret = clk_calc_mnd(parent_rate, req->rate, f);
+	if (ret)
+		return 0;
+
+
+	while (f->n - f->m >= mnd_max) {
+		f->m = f->m >> 1;
+		f->n = f->n >> 1;
+	}
+	while (f->pre_div >= hid_max) {
+		f->pre_div = f->pre_div >> 1;
+		f->m = f->m >> 1;
+	}
+
+	req->rate = calc_rate(parent_rate, f->m, f->n, f->n, f->pre_div);
+
+	return 0;
+}
+
+static int __clk_rcg2_configure_parent(struct clk_rcg2 *rcg, int src, u32 *_cfg)
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
@@ -431,9 +519,8 @@ static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f,
 	}
 
 	mask = BIT(rcg->hid_width) - 1;
-	mask |= CFG_SRC_SEL_MASK | CFG_MODE_MASK | CFG_HW_CLK_CTRL_MASK;
+	mask |= CFG_MODE_MASK | CFG_HW_CLK_CTRL_MASK;
 	cfg = f->pre_div << CFG_SRC_DIV_SHIFT;
-	cfg |= rcg->parent_map[index].cfg << CFG_SRC_SEL_SHIFT;
 	if (rcg->mnd_width && f->n && (f->m != f->n))
 		cfg |= CFG_MODE_DUAL_EDGE;
 	if (rcg->hw_clk_ctrl)
@@ -445,6 +532,22 @@ static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f,
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
@@ -465,6 +568,26 @@ static int clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f)
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
@@ -518,6 +641,22 @@ static int clk_rcg2_set_rate(struct clk_hw *hw, unsigned long rate,
 	return __clk_rcg2_set_rate(hw, rate, CEIL);
 }
 
+static int clk_rcg2_set_gp_rate(struct clk_hw *hw, unsigned long rate,
+			    unsigned long parent_rate)
+{
+	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+	struct freq_tbl *f;
+
+	f = kcalloc(MAX_PERF_LEVEL + 1, sizeof(*f), GFP_KERNEL);
+
+	if (!f)
+		return -ENOMEM;
+
+	clk_calc_mnd(parent_rate, rate, f);
+
+	return clk_rcg2_configure_gp(rcg, f);
+}
+
 static int clk_rcg2_set_floor_rate(struct clk_hw *hw, unsigned long rate,
 				   unsigned long parent_rate)
 {
@@ -645,6 +784,17 @@ const struct clk_ops clk_rcg2_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_rcg2_ops);
 
+const struct clk_ops clk_rcg2_gp_ops = {
+	.is_enabled = clk_rcg2_is_enabled,
+	.get_parent = clk_rcg2_get_parent,
+	.set_parent = clk_rcg2_set_parent,
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
index dc3aa7014c3e..4567f405683b 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -285,10 +285,8 @@ static struct clk_rcg2 gcc_sdm670_cpuss_rbcpr_clk_src = {
 
 static const struct freq_tbl ftbl_gcc_gp1_clk_src[] = {
 	F(19200000, P_BI_TCXO, 1, 0, 0),
-	F(25000000, P_GPLL0_OUT_EVEN, 12, 0, 0),
-	F(50000000, P_GPLL0_OUT_EVEN, 6, 0, 0),
-	F(100000000, P_GPLL0_OUT_MAIN, 6, 0, 0),
-	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	F(300000000, P_GPLL0_OUT_EVEN, 1, 0, 0),
+	F(600000000, P_GPLL0_OUT_MAIN, 1, 0, 0),
 	{ }
 };
 
@@ -302,7 +300,7 @@ static struct clk_rcg2 gcc_gp1_clk_src = {
 		.name = "gcc_gp1_clk_src",
 		.parent_data = gcc_parent_data_1,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_gp_ops,
 	},
 };
 
@@ -316,7 +314,7 @@ static struct clk_rcg2 gcc_gp2_clk_src = {
 		.name = "gcc_gp2_clk_src",
 		.parent_data = gcc_parent_data_1,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_gp_ops,
 	},
 };
 
@@ -330,7 +328,7 @@ static struct clk_rcg2 gcc_gp3_clk_src = {
 		.name = "gcc_gp3_clk_src",
 		.parent_data = gcc_parent_data_1,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_gp_ops,
 	},
 };
 
diff --git a/drivers/pwm/pwm-clk.c b/drivers/pwm/pwm-clk.c
index c19a482d7e28..1bfc7870e3aa 100644
--- a/drivers/pwm/pwm-clk.c
+++ b/drivers/pwm/pwm-clk.c
@@ -25,6 +25,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
+#include <linux/clk/clk-conf.h>
 #include <linux/pwm.h>
 
 struct pwm_clk_chip {
@@ -87,6 +88,10 @@ static int pwm_clk_probe(struct platform_device *pdev)
 	struct pwm_clk_chip *pcchip;
 	int ret;
 
+	ret = of_clk_set_defaults(pdev->dev.of_node, false);
+	if (ret < 0)
+		return -EINVAL;
+
 	chip = devm_pwmchip_alloc(&pdev->dev, 1, sizeof(*pcchip));
 	if (IS_ERR(chip))
 		return PTR_ERR(chip);
-- 
2.39.2


