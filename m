Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D972B21A176
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 15:55:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgGINzU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 09:55:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728069AbgGINyd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 09:54:33 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39276C08C5DD
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 06:54:33 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id di5so937182qvb.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 06:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0ufJ+qo3NfI0pabE9TlU5wbhOS8NacG5qNuj9VUJYPk=;
        b=xxR/kBVrjAvM3PTciA1Ziksqch0eZWMYJd6YXw1iaYoHl+y0FaAlNhfqelRKo3yMLL
         keN5XG0fezOw1cnKtnHpx5rNmt9n9aMH4fk6cwkONCCmBAyyEVqDMtY2Ld7ZPibYkHSV
         R9ennjTremIAghXCdMHTFWWkanVLBZEHZhD88UvEFnCYeXDMGisYj2yIWM00zomCBfjL
         xZxl9+a458hGF/6jcnUHnhcZ2pcDsS+m9EVPOc2G1VHiVmsE9wZavUuAIYP4DBR+sCvt
         CclmOKI7t3LIPvqN42lf/gNrruZx//0w4oNwL04QzMMS9qLG0MgXx1sLWfYSd79Qy7y4
         Tbrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0ufJ+qo3NfI0pabE9TlU5wbhOS8NacG5qNuj9VUJYPk=;
        b=VtffQ0klDiqzEGB6D+PJlOz/6HtvsTIiN0yaBgT8vDOE95LyJvZTltbuPmxrEjYn4K
         C/TE09NJoARZKD3rsRATNhGiDqAjUsDIUCO/jJF+SdX8E2Fet+wiuMM7/RUUsxV5GiOc
         +nF2Qq9NgVaV7e4howklmY2Lg9ggzA3xrt0hd1wYQRL2MoWoZgdn+q2GdYnMPUV0ocwf
         OiDnIXxBADelNsL1wbX2ZRBv1gSJcJARC81CmOme5P+1Ni35nV5jDoeZHgxw38nx/KjD
         totR/1U7ycHTa8I+5j5KChWPSfSqWSDU0yqp06oEZ3M/xRECx9K5jOAofpMNy7tHeQkq
         JFRg==
X-Gm-Message-State: AOAM532odYHL6HQ16ECvzNAA0l2Al/ucL3/zffmhx6pm9yUStz6YNVx+
        rGjfzopxMHbFIuzUTr0c+6Lffb9sBr4=
X-Google-Smtp-Source: ABdhPJzyx8GT/ryaZkA7TNFBBmSZcc1xOCH6qZW1Snu+t7WUje6MBbcN3w5UdBMbKSc5Iu7mjAoKsA==
X-Received: by 2002:ad4:4444:: with SMTP id l4mr39432366qvt.121.1594302872249;
        Thu, 09 Jul 2020 06:54:32 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id 130sm3632735qkn.82.2020.07.09.06.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 06:54:31 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 04/14] clk: qcom: clk-alpha-pll: use the right PCAL_DONE value for lucid pll
Date:   Thu,  9 Jul 2020 09:52:35 -0400
Message-Id: <20200709135251.643-5-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200709135251.643-1-jonathan@marek.ca>
References: <20200709135251.643-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Lucid PCAL_DONE is different from trion.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/clk/qcom/clk-alpha-pll.c | 28 ++++++++++++++++++++++++++--
 drivers/clk/qcom/clk-alpha-pll.h |  2 +-
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index be7ffeae21b1..26139ef005e4 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -143,6 +143,9 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
 #define TRION_PLL_CAL_VAL	0x44
 #define TRION_PCAL_DONE		BIT(26)
 
+/* LUCID PLL specific settings and offsets */
+#define LUCID_PCAL_DONE		BIT(27)
+
 #define pll_alpha_width(p)					\
 		((PLL_ALPHA_VAL_U(p) - PLL_ALPHA_VAL(p) == 4) ?	\
 				 ALPHA_REG_BITWIDTH : ALPHA_REG_16BIT_WIDTH)
@@ -1447,7 +1450,7 @@ EXPORT_SYMBOL_GPL(clk_trion_pll_configure);
  * The TRION PLL requires a power-on self-calibration which happens when the
  * PLL comes out of reset. Calibrate in case it is not completed.
  */
-static int alpha_pll_trion_prepare(struct clk_hw *hw)
+static int __alpha_pll_trion_prepare(struct clk_hw *hw, u32 pcal_done)
 {
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 	u32 regval;
@@ -1455,7 +1458,7 @@ static int alpha_pll_trion_prepare(struct clk_hw *hw)
 
 	/* Return early if calibration is not needed. */
 	regmap_read(pll->clkr.regmap, PLL_STATUS(pll), &regval);
-	if (regval & TRION_PCAL_DONE)
+	if (regval & pcal_done)
 		return 0;
 
 	/* On/off to calibrate */
@@ -1466,6 +1469,16 @@ static int alpha_pll_trion_prepare(struct clk_hw *hw)
 	return ret;
 }
 
+static int alpha_pll_trion_prepare(struct clk_hw *hw)
+{
+	return __alpha_pll_trion_prepare(hw, TRION_PCAL_DONE);
+}
+
+static int alpha_pll_lucid_prepare(struct clk_hw *hw)
+{
+	return __alpha_pll_trion_prepare(hw, LUCID_PCAL_DONE);
+}
+
 static int alpha_pll_trion_set_rate(struct clk_hw *hw, unsigned long rate,
 				    unsigned long prate)
 {
@@ -1529,6 +1542,17 @@ const struct clk_ops clk_alpha_pll_trion_ops = {
 	.round_rate = clk_alpha_pll_round_rate,
 	.set_rate = alpha_pll_trion_set_rate,
 };
+EXPORT_SYMBOL_GPL(clk_alpha_pll_trion_ops);
+
+const struct clk_ops clk_alpha_pll_lucid_ops = {
+	.prepare = alpha_pll_lucid_prepare,
+	.enable = clk_trion_pll_enable,
+	.disable = clk_trion_pll_disable,
+	.is_enabled = clk_trion_pll_is_enabled,
+	.recalc_rate = clk_trion_pll_recalc_rate,
+	.round_rate = clk_alpha_pll_round_rate,
+	.set_rate = alpha_pll_trion_set_rate,
+};
 EXPORT_SYMBOL_GPL(clk_alpha_pll_lucid_ops);
 
 const struct clk_ops clk_alpha_pll_postdiv_lucid_ops = {
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 67f1fd271931..69337c1b5850 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -132,7 +132,7 @@ extern const struct clk_ops clk_alpha_pll_trion_ops;
 extern const struct clk_ops clk_alpha_pll_fixed_trion_ops;
 extern const struct clk_ops clk_alpha_pll_postdiv_trion_ops;
 
-#define clk_alpha_pll_lucid_ops clk_alpha_pll_trion_ops
+extern const struct clk_ops clk_alpha_pll_lucid_ops;
 #define clk_alpha_pll_fixed_lucid_ops clk_alpha_pll_fixed_trion_ops
 extern const struct clk_ops clk_alpha_pll_postdiv_lucid_ops;
 
-- 
2.26.1

