Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0270C1EE434
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 14:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728175AbgFDMJQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jun 2020 08:09:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728008AbgFDMJQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jun 2020 08:09:16 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89274C08C5C0
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2020 05:09:15 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id h5so5814883wrc.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2020 05:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jLOpxtZ/2WYBgqxYGSCuWHrLASkKLBzIuDEydJEL7OQ=;
        b=1hy7H4awXmXbu3C9rteE5RlVnIe/awJ82GAcp00UQC+yLE20+qTsPA+3g1bgSFIYWh
         hiX3TH7uC7VutKh3YAl2NTkqE3kDJBlqcNum6m9dMpTFZfono2JA8Lr+itzZ2Idj9ozJ
         IxJmbLDjjnQC6qJApuWuaO+MQwkeQSPGFxpa0kEBy/4WM6/d6LPeLa+JBGjMLkoUojUC
         EyasmnhFnJyKB7nUBnCSXFCFMatpM5xK0c59gNSi/F1WdmFLX4YQA0CpmLii/ZOVl5Zc
         ceVJeVCudX5rmRnjMySUM5HTC7ncJ9XRQ5sDcWXzUMQNaGhh3smCPEZjsQNZlFU0cRuc
         DAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jLOpxtZ/2WYBgqxYGSCuWHrLASkKLBzIuDEydJEL7OQ=;
        b=Us+1hr8cGYZ1Ey5yQGY/SdYYAH9rdH+G+dOuZORJcaL4ymriCvVmnABGriQFP2FgP6
         Ys2tOOOrFJ6MUpLJ4cbEJR3B0jQNR4uu0X3A3RCtFdYlWzh2p3o5PFhZlgwfifYw+M1l
         CTGCmwBT6Yfuvrj5Ox0uvyiVuKYw/tqnF9Cw9lGltTWvhRjMHllrOb6VnN4Hz+tqGukt
         l+YENGJHx0JyaPmXFLDMLmvTabZqG5ryHslffpjaXDTCUhcY+B88gdXDe5dNpIIhTMVc
         +0VIUAmljQyEsglYTcH+gzNrDQKA+MfvRu7AibkjDdUvTLZ8Kk1Ckjd0Pa94OGpV/2Gb
         K3Cg==
X-Gm-Message-State: AOAM530KhDwi9sFJm4D6LufeZXLAsDHRusqb5eCbI0P1FNutST0gOqsN
        K8nq88wd35wlehRLayTBEF0elQ==
X-Google-Smtp-Source: ABdhPJze958wqzKWPLBGHJhB470MblvxDP4tTNXuOJ5ziAVLe3vlHl6olnns0TOcrFMXkjuar1YWUQ==
X-Received: by 2002:a5d:4a89:: with SMTP id o9mr4016933wrq.267.1591272554144;
        Thu, 04 Jun 2020 05:09:14 -0700 (PDT)
Received: from localhost.localdomain (dh207-97-4.xnet.hr. [88.207.97.4])
        by smtp.googlemail.com with ESMTPSA id s2sm6740549wmh.11.2020.06.04.05.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 05:09:13 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, absahu@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Christian Lamparter <chunkeey@gmail.com>,
        John Crispin <john@phrozen.org>,
        Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH] clk: qcom: ipq4019: fix apss cpu overclocking
Date:   Thu,  4 Jun 2020 14:09:05 +0200
Message-Id: <20200604120905.1344074-1-robert.marko@sartura.hr>
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
Tested-by: Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
 drivers/clk/qcom/gcc-ipq4019.c | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
index ef5137fd50f3..eeed50573752 100644
--- a/drivers/clk/qcom/gcc-ipq4019.c
+++ b/drivers/clk/qcom/gcc-ipq4019.c
@@ -1243,6 +1243,29 @@ static const struct clk_fepll_vco gcc_fepll_vco = {
 	.reg = 0x2f020,
 };
 
+
+const struct freq_tbl *qcom_find_freq_close(const struct freq_tbl *f,
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

