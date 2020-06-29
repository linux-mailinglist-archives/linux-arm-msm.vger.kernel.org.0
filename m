Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A073820E5FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 00:08:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727867AbgF2Vn1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jun 2020 17:43:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727866AbgF2Shu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jun 2020 14:37:50 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4759DC031427
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 10:21:06 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id a14so8004048qvq.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 10:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0ufJ+qo3NfI0pabE9TlU5wbhOS8NacG5qNuj9VUJYPk=;
        b=OMKFcKDrueeyAPoA5OL/u+H5xzaq00FILSbTOVAi+N3SEtlp8hpaP/IDWZoxs0d4ew
         +sBK5UiS0nXSrilEKSGD4wzUOszhbHGyMeJBzOvUx/hI0EUnxruMBe3zf1Qt/nhbXs0c
         qoQeZsA6V9ZBnAN/4r+5B5IPeQqLi1kq2qEVl5jc/wPf8tX5twMJ4sPsnC3nBqjg4PyU
         sQYDK1d2pUrg1xYUcsKlZSAPaTlbgvlOvVskif7nCYjrIx4SScOY0PSSUCGyt/V2o4jg
         bI1WRU3euefu9A9HL6hgH9D+en/DXyshXvMsHWCGd8tJjX5lgiFIAtolwhQCAevaN2Sb
         QUpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0ufJ+qo3NfI0pabE9TlU5wbhOS8NacG5qNuj9VUJYPk=;
        b=BggZoKeUVjt8yxTch86pRzkT/+JJR+MFuBKkbOeqo5htPG9j9OnOQYw73ZK/Uy4niQ
         veNNP0Km7s4Qj+nOLktRCQaoC24GkIEju9U9mgB2/GVszL5lhjRzRq4lBpebgApSH0Uo
         o53ESeXGE2wiZGXw5PO/SfJWtzNYDf6gMyUXuztz7eiZGdK9ZLI1sg7VLzO6ODC+jWfO
         Eue57q25TKPWLogWGkvIZdbRHnhnD9FbAvXIWO8iYHlmbKF5QIpRe0pxOzDtDWOSOEXj
         t3rE5dNywjcNTfgOWqF9jPN+7rd9Ho0p0y+y2+GISORUsVAbfh7E/ZrenVTAOaphG5lN
         tiqg==
X-Gm-Message-State: AOAM533+Ur8g6synM2qAqPUaCUe1Y6UDuwk5ft77mIomIB+ItaWCwOqC
        mnCSDkGGCqlSfochZRfv2w0z8W4fGp8=
X-Google-Smtp-Source: ABdhPJz8pJS6NEBzMCzGxe3fMXEDZTIp+qlfGMxwpTu++ezpcDWHCsvWqMxpRKYmLhixDhcOZZ7X9w==
X-Received: by 2002:a0c:800e:: with SMTP id 14mr6319433qva.92.1593451265173;
        Mon, 29 Jun 2020 10:21:05 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id q5sm408363qtf.12.2020.06.29.10.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 10:21:04 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 04/13] clk: qcom: clk-alpha-pll: use the right PCAL_DONE value for lucid pll
Date:   Mon, 29 Jun 2020 13:20:34 -0400
Message-Id: <20200629172049.30452-5-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200629172049.30452-1-jonathan@marek.ca>
References: <20200629172049.30452-1-jonathan@marek.ca>
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

