Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3C491F15E0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2020 11:50:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729265AbgFHJuC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jun 2020 05:50:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729264AbgFHJuA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jun 2020 05:50:00 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9EA9C08C5C3
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2020 02:49:59 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id q19so17546407eja.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2020 02:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bowu5S2kLRuujMs4c7peqMpp/j0/TN2F5Fz+wpb7ydQ=;
        b=hkDyJPIWslLC9m9KSdfkJN50IY+SjmiZM6B4D1trkHnzwxFSKZBby522cIEJnmrIBb
         lotbEeWNLZQBjUnqQ1+N2eeJ5NeqInEGrM73s5a2BdseJH2JZ/dhW2LZWGLMQmT/H63V
         l6s9HGAL4H6Xe0oKLIMQliPy6K0gF96V+4oPH6qmzlUPNu+cQLrUN8E/VswoeMCGy0Vx
         XaAGKzPyOYww2P8na1SvJb459iEWK8wc59bhuue+Q17YP0zUdHTyE0JtO+BN+F2jZrJg
         BbJAPn7OGTjP+p5oFpIjc/8k4MNv9cT9Xv8q1ZASOgbqVN2yO/4vJ7s5uATSgbKghbRK
         784Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bowu5S2kLRuujMs4c7peqMpp/j0/TN2F5Fz+wpb7ydQ=;
        b=Zn0rdSEUMnpYRiJ2f71xpkiD+3GX50JwQtthWzmV9rquB2Qb6TGki8Axo+49DyNoNd
         C6zTKfYjyOJyb0xXASH0mBEknRuPSsfmNxIMdpjqJi4Zzjmcs0uzEU9eC8eVLzbnHe8t
         oJQg6QaTxf7677/I5GKgG/Ds+OW6omfDy2+QOMnYb2FymE8kbQLCLI0JyIuseSDu9l8q
         zbg2NI54PKLvKREb4+FoLW5n5h5lGtcgyGnMpMLHJ8sWwhH6qYxl1ztuAQPWXrZpR3bp
         e/aMYJRF7xl+rZ8mBtudMpmx7vSIxG908Tme0B3ul75iHVstt5iTEkboLOALIF5Jxqh6
         Fovg==
X-Gm-Message-State: AOAM5301JnINVHLJpvHFP3hu/I6rr4z4gnh49e3zJD6zf2Oc6GX6H0d6
        r2jB4Fq7+Pj74yyFmJjFy3MuQA==
X-Google-Smtp-Source: ABdhPJw6zPYO7Ns1y9ZYS2jdqo5E8/ZXxETtL5izFfAKlRPo2xWy2hfeIyBsJJhlo1e/0t5i5zbFCw==
X-Received: by 2002:a17:906:6c82:: with SMTP id s2mr19815065ejr.215.1591609798352;
        Mon, 08 Jun 2020 02:49:58 -0700 (PDT)
Received: from localhost.localdomain (dh207-96-217.xnet.hr. [88.207.96.217])
        by smtp.googlemail.com with ESMTPSA id d11sm7354549edy.79.2020.06.08.02.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 02:49:57 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Christian Lamparter <chunkeey@gmail.com>,
        John Crispin <john@phrozen.org>,
        Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH] clk: qcom: ipq4019: fix apss cpu overclocking
Date:   Mon,  8 Jun 2020 11:47:15 +0200
Message-Id: <20200608094714.382149-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Christian Lamparter <chunkeey@gmail.com>

There's an interaction issue between the clk changes:"
clk: qcom: ipq4019: Add the apss cpu pll divider clock node
clk: qcom: ipq4019: remove fixed clocks and add pll clocks
" and the cpufreq-dt.

cpufreq-dt is now spamming the kernel-log with the following:

[ 1099.190658] cpu cpu0: dev_pm_opp_set_rate: failed to find current OPP
for freq 761142857 (-34)

This only happens on certain devices like the Compex WPJ428
and AVM FritzBox!4040. However, other devices like the Asus
RT-AC58U and Meraki MR33 work just fine.

The issue stem from the fact that all higher CPU-Clocks
are achieved by switching the clock-parent to the P_DDRPLLAPSS
(ddrpllapss). Which is set by Qualcomm's proprietary bootcode
as part of the DDR calibration.

For example, the FB4040 uses 256 MiB Nanya NT5CC128M16IP clocked
at round 533 MHz (ddrpllsdcc = 190285714 Hz).

whereas the 128 MiB Nanya NT5CC64M16GP-DI in the ASUS RT-AC58U is
clocked at a slightly higher 537 MHz ( ddrpllsdcc = 192000000 Hz).

This patch attempts to fix the issue by modifying
clk_cpu_div_round_rate(), clk_cpu_div_set_rate(), clk_cpu_div_recalc_rate()
to use a new qcom_find_freq_close() function, which returns the closest
matching frequency, instead of the next higher. This way, the SoC in
the FB4040 (with its max clock speed of 710.4 MHz) will no longer
try to overclock to 761 MHz.

Fixes: d83dcacea18 ("clk: qcom: ipq4019: Add the apss cpu pll divider clock node")
Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
Changes from v1 to v2:
* Resolve warnings discovered by the kbot
* Return the return of regmap_update_bits instead of not using it at all

 drivers/clk/qcom/gcc-ipq4019.c | 36 ++++++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
index ef5137fd50f3..62fa17a4291c 100644
--- a/drivers/clk/qcom/gcc-ipq4019.c
+++ b/drivers/clk/qcom/gcc-ipq4019.c
@@ -1243,6 +1243,29 @@ static const struct clk_fepll_vco gcc_fepll_vco = {
 	.reg = 0x2f020,
 };
 
+
+static const struct freq_tbl *qcom_find_freq_close(const struct freq_tbl *f,
+					     unsigned long rate)
+{
+	const struct freq_tbl *last = NULL;
+
+	for ( ; f->freq; f++) {
+		if (rate == f->freq)
+			return f;
+
+		if (f->freq > rate) {
+			if (!last ||
+			   (f->freq - rate) < (rate - last->freq))
+				return f;
+			else
+				return last;
+		}
+		last = f;
+	}
+
+	return last;
+}
+
 /*
  * Round rate function for APSS CPU PLL Clock divider.
  * It looks up the frequency table and returns the next higher frequency
@@ -1255,7 +1278,7 @@ static long clk_cpu_div_round_rate(struct clk_hw *hw, unsigned long rate,
 	struct clk_hw *p_hw;
 	const struct freq_tbl *f;
 
-	f = qcom_find_freq(pll->freq_tbl, rate);
+	f = qcom_find_freq_close(pll->freq_tbl, rate);
 	if (!f)
 		return -EINVAL;
 
@@ -1278,7 +1301,7 @@ static int clk_cpu_div_set_rate(struct clk_hw *hw, unsigned long rate,
 	u32 mask;
 	int ret;
 
-	f = qcom_find_freq(pll->freq_tbl, rate);
+	f = qcom_find_freq_close(pll->freq_tbl, rate);
 	if (!f)
 		return -EINVAL;
 
@@ -1292,7 +1315,7 @@ static int clk_cpu_div_set_rate(struct clk_hw *hw, unsigned long rate,
 	 */
 	udelay(1);
 
-	return 0;
+	return ret;
 };
 
 /*
@@ -1305,6 +1328,7 @@ static unsigned long
 clk_cpu_div_recalc_rate(struct clk_hw *hw,
 			unsigned long parent_rate)
 {
+	const struct freq_tbl *f;
 	struct clk_fepll *pll = to_clk_fepll(hw);
 	u32 cdiv, pre_div;
 	u64 rate;
@@ -1325,7 +1349,11 @@ clk_cpu_div_recalc_rate(struct clk_hw *hw,
 	rate = clk_fepll_vco_calc_rate(pll, parent_rate) * 2;
 	do_div(rate, pre_div);
 
-	return rate;
+	f = qcom_find_freq_close(pll->freq_tbl, rate);
+	if (!f)
+		return rate;
+
+	return f->freq;
 };
 
 static const struct clk_ops clk_regmap_cpu_div_ops = {
-- 
2.26.2

