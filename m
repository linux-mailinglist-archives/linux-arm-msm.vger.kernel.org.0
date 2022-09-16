Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D032F5BA6A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Sep 2022 08:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbiIPGRq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Sep 2022 02:17:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbiIPGRp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Sep 2022 02:17:45 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF8B04DB69
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 23:17:43 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id f9so33231635lfr.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 23:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=bdT4oIVJBpS3aTEX0D4eG2/56m0Eb1XqFrZYqvu24hE=;
        b=kLA6yliXqa3vH95OMYFBnZ38qBzZMRv6s8v2K3jzz5X/jKrnZ/O6n8a363/NOd5cZN
         t5Rggk+RgniwlRjU6vnR4ykFMdC+TnyV35/QiFSx+7/VHMCzPHR6yfzl9Jcl6mvinE/f
         WKn3k4jSO4Bl4wcFGNtM5j7R2ivuDydnX+EG2/abrX56SFH6D53LH1aKW9M1a2LEmaWq
         72Ff45ffQJOeVP7jb3W27pEf1XIQIJ92c1gZthLzE4J6XlUsbxyomuJTWeewEROLq1Eo
         BIklVqeH63Kr5YyIMHa4EM7ljWDMjWrT9Cq37iglvw5x8wi/8/8MSqLlP+zzZqR/I9Pe
         2W5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=bdT4oIVJBpS3aTEX0D4eG2/56m0Eb1XqFrZYqvu24hE=;
        b=mgadkEuIYDUMUyE4b+yDcbB0R6/xyG9zRQSfMNAxUOWN8aqZvotfLXkyuzxuKSJHKO
         Hoka95bdrND6g53lh6rWviXOxBoW8DvUB0fMUjHdtzHjg4V1CDgqlnJ0NEit/SPDGKEt
         ZXbNwNdkWx+1J3DZW/3Fzs8uPLWf1dSd9LMEIWTWVFYoOc/XHMCHdaX3AyqaJRlS0+o9
         b8mrVAw8UMu1cQdjo/MsFgWSdIiWcJU+bUn4nNSwKACSJQWWh9cQgiD0GT03hCvNgYb7
         fEtrFSRYlTBmg0lqkyv1Ba0D2nzT+PBbT1MVGS6YVBaFW68XVlBjNX67AJykFWj/GhCZ
         /paw==
X-Gm-Message-State: ACrzQf1XFOTsagQgutw7YZNbQbT4vCVpDhO4qaVMiHe6QOnpSA7e48lo
        1fplBTD+6a+6CN0jlMII21TDLA==
X-Google-Smtp-Source: AMsMyM4ePNt3gfx9GsjpKPkGMFhNmnqa/lpONYwb0Lw01rfMtUeHdIhevXBn23eyag1V/Sy/P9o74A==
X-Received: by 2002:a05:6512:3f1d:b0:492:e175:402a with SMTP id y29-20020a0565123f1d00b00492e175402amr1115487lfa.384.1663309062310;
        Thu, 15 Sep 2022 23:17:42 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b15-20020a2eb90f000000b00261eaa819b7sm3529383ljb.30.2022.09.15.23.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 23:17:41 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-phy@lists.infradead.org
Subject: [PATCH v4 1/3] clk: asm9260: use parent index to link the reference clock
Date:   Fri, 16 Sep 2022 09:17:38 +0300
Message-Id: <20220916061740.87167-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220916061740.87167-1-dmitry.baryshkov@linaro.org>
References: <20220916061740.87167-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rewrite clk-asm9260 to use parent index to use the reference clock.
During this rework two helpers are added:

- clk_hw_register_mux_table_parent_data() to supplement
  clk_hw_register_mux_table() but using parent_data instead of
  parent_names

- clk_hw_register_fixed_rate_parent_accuracy() to be used instead of
  directly calling __clk_hw_register_fixed_rate(). The later function is
  an internal API, which is better not to be called directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/clk-asm9260.c    | 29 ++++++++++++-----------------
 include/linux/clk-provider.h | 21 +++++++++++++++++++++
 2 files changed, 33 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/clk-asm9260.c b/drivers/clk/clk-asm9260.c
index bacebd457e6f..8b3c059e19a1 100644
--- a/drivers/clk/clk-asm9260.c
+++ b/drivers/clk/clk-asm9260.c
@@ -80,7 +80,7 @@ struct asm9260_mux_clock {
 	u8			mask;
 	u32			*table;
 	const char		*name;
-	const char		**parent_names;
+	const struct clk_parent_data *parent_data;
 	u8			num_parents;
 	unsigned long		offset;
 	unsigned long		flags;
@@ -232,10 +232,10 @@ static const struct asm9260_gate_data asm9260_ahb_gates[] __initconst = {
 		HW_AHBCLKCTRL1,	16 },
 };
 
-static const char __initdata *main_mux_p[] =   { NULL, NULL };
-static const char __initdata *i2s0_mux_p[] =   { NULL, NULL, "i2s0m_div"};
-static const char __initdata *i2s1_mux_p[] =   { NULL, NULL, "i2s1m_div"};
-static const char __initdata *clkout_mux_p[] = { NULL, NULL, "rtc"};
+static struct clk_parent_data __initdata main_mux_p[] =   { { .index = 0, }, { .name = "pll" } };
+static struct clk_parent_data __initdata i2s0_mux_p[] =   { { .index = 0, }, { .name = "pll" }, { .name = "i2s0m_div"} };
+static struct clk_parent_data __initdata i2s1_mux_p[] =   { { .index = 0, }, { .name = "pll" }, { .name = "i2s1m_div"} };
+static struct clk_parent_data __initdata clkout_mux_p[] = { { .index = 0, }, { .name = "pll" }, { .name = "rtc"} };
 static u32 three_mux_table[] = {0, 1, 3};
 
 static struct asm9260_mux_clock asm9260_mux_clks[] __initdata = {
@@ -255,9 +255,10 @@ static struct asm9260_mux_clock asm9260_mux_clks[] __initdata = {
 
 static void __init asm9260_acc_init(struct device_node *np)
 {
-	struct clk_hw *hw;
+	struct clk_hw *hw, *pll_hw;
 	struct clk_hw **hws;
-	const char *ref_clk, *pll_clk = "pll";
+	const char *pll_clk = "pll";
+	struct clk_parent_data pll_parent_data = { .index = 0 };
 	u32 rate;
 	int n;
 
@@ -274,21 +275,15 @@ static void __init asm9260_acc_init(struct device_node *np)
 	/* register pll */
 	rate = (ioread32(base + HW_SYSPLLCTRL) & 0xffff) * 1000000;
 
-	/* TODO: Convert to DT parent scheme */
-	ref_clk = of_clk_get_parent_name(np, 0);
-	hw = __clk_hw_register_fixed_rate(NULL, NULL, pll_clk,
-			ref_clk, NULL, NULL, 0, rate, 0,
-			CLK_FIXED_RATE_PARENT_ACCURACY);
-
-	if (IS_ERR(hw))
+	pll_hw = clk_hw_register_fixed_rate_parent_accuracy(NULL, pll_clk, &pll_parent_data,
+							0, rate);
+	if (IS_ERR(pll_hw))
 		panic("%pOFn: can't register REFCLK. Check DT!", np);
 
 	for (n = 0; n < ARRAY_SIZE(asm9260_mux_clks); n++) {
 		const struct asm9260_mux_clock *mc = &asm9260_mux_clks[n];
 
-		mc->parent_names[0] = ref_clk;
-		mc->parent_names[1] = pll_clk;
-		hw = clk_hw_register_mux_table(NULL, mc->name, mc->parent_names,
+		hw = clk_hw_register_mux_table_parent_data(NULL, mc->name, mc->parent_data,
 				mc->num_parents, mc->flags, base + mc->offset,
 				0, mc->mask, 0, mc->table, &asm9260_clk_lock);
 	}
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 1615010aa0ec..86140ac2f9a5 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -439,6 +439,20 @@ struct clk *clk_register_fixed_rate(struct device *dev, const char *name,
 	__clk_hw_register_fixed_rate((dev), NULL, (name), NULL, NULL,	      \
 				     (parent_data), NULL, (flags),	      \
 				     (fixed_rate), (fixed_accuracy), 0)
+/**
+ * clk_hw_register_fixed_rate_parent_accuracy - register fixed-rate clock with
+ * the clock framework
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @parent_name: name of clock's parent
+ * @flags: framework-specific flags
+ * @fixed_rate: non-adjustable clock rate
+ */
+#define clk_hw_register_fixed_rate_parent_accuracy(dev, name, parent_data,    \
+						   flags, fixed_rate)	      \
+	__clk_hw_register_fixed_rate((dev), NULL, (name), NULL, NULL,      \
+				     (parent_data), (flags), (fixed_rate), 0,    \
+				     CLK_FIXED_RATE_PARENT_ACCURACY)
 
 void clk_unregister_fixed_rate(struct clk *clk);
 void clk_hw_unregister_fixed_rate(struct clk_hw *hw);
@@ -957,6 +971,13 @@ struct clk *clk_register_mux_table(struct device *dev, const char *name,
 			      (parent_names), NULL, NULL, (flags), (reg),     \
 			      (shift), (mask), (clk_mux_flags), (table),      \
 			      (lock))
+#define clk_hw_register_mux_table_parent_data(dev, name, parent_data,	      \
+				  num_parents, flags, reg, shift, mask,	      \
+				  clk_mux_flags, table, lock)		      \
+	__clk_hw_register_mux((dev), NULL, (name), (num_parents),	      \
+			      NULL, NULL, (parent_data), (flags), (reg),      \
+			      (shift), (mask), (clk_mux_flags), (table),      \
+			      (lock))
 #define clk_hw_register_mux(dev, name, parent_names, num_parents, flags, reg, \
 			    shift, width, clk_mux_flags, lock)		      \
 	__clk_hw_register_mux((dev), NULL, (name), (num_parents),	      \
-- 
2.35.1

