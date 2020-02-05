Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD2915267C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2020 07:54:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbgBEGyX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Feb 2020 01:54:23 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:46125 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbgBEGyX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Feb 2020 01:54:23 -0500
Received: by mail-pf1-f193.google.com with SMTP id k29so674246pfp.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2020 22:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xC6pTkHOfWDELEok5+Rk1+a9t64mfOMziwPkHBy7kSE=;
        b=JbHW6Y+RQ+QybQ7Gk2Mx+Qkw7MsZxHziwp2ap85W9f0rNcbLqhN+21ukKwPPvKo+1k
         BLURHbCzVbGG+DYX1+w7EaLK6UsUcAaK0MDtMo3lpMtXuMfnxymPl/eyLpiwq3Lay191
         78N/ayHrbaAG/KBmuJ3digCu40Cf7aWoX6rbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xC6pTkHOfWDELEok5+Rk1+a9t64mfOMziwPkHBy7kSE=;
        b=j80q1U9kbIE/HyWeZMjYX2+zszTYmEeqX5lLm9CQiRUo8nVVIW70joXKXTT8i5ag9i
         lQiiqU/icNw1vjy58s2Z5M8v6YFd08z2UlpVP/+wTMrlMqW8GRkNlmIr0Ei4mNgK/OPG
         QiP9WNmbzjJnwJ0VVzGOXSFMyeN5swmva36QM/xMFAUVPh3OW8N08hXNhqhk7dCKxCb+
         LbmSRJvkYpdVtc0hvQmTl6c4/cPm8NZymrF1WtxrJxT8c+RGMl9eFHqSpbt3tshg5MlW
         JagwwLLBmQ/yRIgDOs8S8vvQKP6az0gNTKgilBmM9PNfn58f4pjZuRB7PN2RRrjNrksY
         I8JQ==
X-Gm-Message-State: APjAAAVu9Lw+k7Sh2qr2GtBD4mlDMiLB0Euu2zI68z6gI+RI4z03H1wE
        S5rhZYHXCG1n2wgkt9+k+NpLnUMX9Lg=
X-Google-Smtp-Source: APXvYqxLtsypnc5e6xwR5LhibDb5b+SOMmWOhDPpwbRPbyJCr56/sg1cj0sMa+gJN96i0oonpU3OWg==
X-Received: by 2002:aa7:9629:: with SMTP id r9mr35694347pfg.51.1580885662409;
        Tue, 04 Feb 2020 22:54:22 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id u18sm26278894pgi.44.2020.02.04.22.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 22:54:21 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Taniya Das <tdas@codeaurora.org>,
        Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Subject: [PATCH] clk: qcom: alpha-pll: Make error prints more informative
Date:   Tue,  4 Feb 2020 22:54:21 -0800
Message-Id: <20200205065421.9426-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I recently ran across this printk error message spewing in my logs

 Call set rate on the PLL with rounded rates!

and I had no idea what clk that was or what rate was failing to round
properly. Make the printk more informative by telling us what went wrong
and also add the name of the clk that's failing to change rate.
Furthermore, update the other printks in this file with the clk name
each time so we know what clk we're talking about.

Cc: Taniya Das <tdas@codeaurora.org>
Cc: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 7c2936da9b14..6d946770a80f 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -544,7 +544,8 @@ static int __clk_alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	rate = alpha_pll_round_rate(rate, prate, &l, &a, alpha_width);
 	vco = alpha_pll_find_vco(pll, rate);
 	if (pll->vco_table && !vco) {
-		pr_err("alpha pll not in a valid vco range\n");
+		pr_err("%s: alpha pll not in a valid vco range\n",
+		       clk_hw_get_name(hw));
 		return -EINVAL;
 	}
 
@@ -722,7 +723,7 @@ static int alpha_pll_huayra_set_rate(struct clk_hw *hw, unsigned long rate,
 	 */
 	if (clk_alpha_pll_is_enabled(hw)) {
 		if (cur_alpha != a) {
-			pr_err("clock needs to be gated %s\n",
+			pr_err("%s: clock needs to be gated\n",
 			       clk_hw_get_name(hw));
 			return -EBUSY;
 		}
@@ -1170,7 +1171,7 @@ static int alpha_pll_fabia_set_rate(struct clk_hw *hw, unsigned long rate,
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 	u32 l, alpha_width = pll_alpha_width(pll);
 	u64 a;
-	unsigned long rrate;
+	unsigned long rrate, max = rate + FABIA_PLL_RATE_MARGIN;
 
 	rrate = alpha_pll_round_rate(rate, prate, &l, &a, alpha_width);
 
@@ -1178,8 +1179,9 @@ static int alpha_pll_fabia_set_rate(struct clk_hw *hw, unsigned long rate,
 	 * Due to limited number of bits for fractional rate programming, the
 	 * rounded up rate could be marginally higher than the requested rate.
 	 */
-	if (rrate > (rate + FABIA_PLL_RATE_MARGIN) || rrate < rate) {
-		pr_err("Call set rate on the PLL with rounded rates!\n");
+	if (rrate > max || rrate < rate) {
+		pr_err("%s: Rounded rate %lu not within range [%lu, %lu)\n",
+		       clk_hw_get_name(hw), rrate, rate, max);
 		return -EINVAL;
 	}
 
@@ -1196,6 +1198,7 @@ static int alpha_pll_fabia_prepare(struct clk_hw *hw)
 	struct clk_hw *parent_hw;
 	unsigned long cal_freq, rrate;
 	u32 cal_l, val, alpha_width = pll_alpha_width(pll);
+	const char *name = clk_hw_get_name(hw);
 	u64 a;
 	int ret;
 
@@ -1210,7 +1213,7 @@ static int alpha_pll_fabia_prepare(struct clk_hw *hw)
 
 	vco = alpha_pll_find_vco(pll, clk_hw_get_rate(hw));
 	if (!vco) {
-		pr_err("alpha pll: not in a valid vco range\n");
+		pr_err("%s: alpha pll not in a valid vco range\n", name);
 		return -EINVAL;
 	}
 
@@ -1236,7 +1239,7 @@ static int alpha_pll_fabia_prepare(struct clk_hw *hw)
 	/* Bringup the PLL at calibration frequency */
 	ret = clk_alpha_pll_enable(hw);
 	if (ret) {
-		pr_err("alpha pll calibration failed\n");
+		pr_err("%s: alpha pll calibration failed\n", name);
 		return ret;
 	}
 
-- 
Sent by a computer, using git, on the internet

