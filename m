Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7CC955214D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 17:40:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236268AbiFTPkC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 11:40:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236251AbiFTPkC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 11:40:02 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A506219035
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 08:40:00 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id f39so2255102lfv.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 08:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WQOpuTtxtx19Mr1BJrOTZLhnJAU/tYV6MdBZ7pUhmKc=;
        b=Spo2YlkLbOTO5KJky1S7cxDug6QWJaWvN2H1zNK92GxftWapVxPqC1pweMaht/lM+c
         b1/sDhdEE6qJ2zi9lugRVI+rqUr4OWVjZu4Ui3RkWx5t+tNDTIFEudEt4kBaQm5f9I0e
         c79Tkjwq/I/YUzPOZlV8AJot1ifC1rZEUvu/hvb3S43Wz8+9kgyDbXNlrfxYMPXD+X25
         +laMhtWV9peSD4fjyQyAMmAJciHnyFoX1ujFamAnzb6qvH2GPSu1VJogoLOMzIs1jkSJ
         Da8JI9QkuSVCGAvaQztJkNhZtVxcnvJvvO2AXetS7rvSaa17YOByhj+8ig/Vicl/8Kfc
         /fEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WQOpuTtxtx19Mr1BJrOTZLhnJAU/tYV6MdBZ7pUhmKc=;
        b=eCPNiVw7CzNM82HnPmlrMN87JsGV8K64wDhv4MjVOS7fqOBkmDRZfAiT+DevPlcZSO
         7HsXbuGR8E+yOia5g8pEzqVpzLhGNSXBCxA/4cBBoeaa7jWZmmdjp6vnqkPhoil1vLNO
         +U/zKEJIyw2wqFN+o1cXPhEPMCqUVAKT0SFJg+qUR5lNWk/TW5okjUoMzzHSfGcsf99+
         6t/21Wk+GaV1K2TyOWOaugKSBeJtuvMGNzgvfqCh+X/UpGw2O0nxaItgcQpLIzTrLVpN
         698emJctq6njh63Xn6E7RcJTavUiIH9yx5HwK/7II388/g/UXmMtX/saNHRIM1ic++85
         X4tQ==
X-Gm-Message-State: AJIora+EPpmtJ3a7SELxzBctBtzulH7CiN5+bCdduiODuRG0ovBxGsv0
        VQPULGhUPvU9tC+AhtYA7Gq4pw==
X-Google-Smtp-Source: AGRyM1vhupqIVK5NEkelw6vzZzx9Q9B6p8UFuD9FQTBq03YT3ADJXxcqEhmWQS9Y50TomG+31En9iQ==
X-Received: by 2002:a05:6512:33c8:b0:479:307e:cdf2 with SMTP id d8-20020a05651233c800b00479307ecdf2mr13531736lfg.632.1655739598936;
        Mon, 20 Jun 2022 08:39:58 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b7-20020a056512070700b0047255d211fasm1801029lfs.297.2022.06.20.08.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 08:39:57 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 1/2] clk: fixed-rate: add devm_clk_hw_register_fixed_rate
Date:   Mon, 20 Jun 2022 18:39:55 +0300
Message-Id: <20220620153956.1723269-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devm_clk_hw_register_fixed_rate(), devres-managed helper to register
fixed-rate clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/clk-asm9260.c    |  2 +-
 drivers/clk/clk-fixed-rate.c | 28 ++++++++++++++++++++++++----
 include/linux/clk-provider.h | 27 ++++++++++++++++++++-------
 3 files changed, 45 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/clk-asm9260.c b/drivers/clk/clk-asm9260.c
index bacebd457e6f..4da5f38249bf 100644
--- a/drivers/clk/clk-asm9260.c
+++ b/drivers/clk/clk-asm9260.c
@@ -278,7 +278,7 @@ static void __init asm9260_acc_init(struct device_node *np)
 	ref_clk = of_clk_get_parent_name(np, 0);
 	hw = __clk_hw_register_fixed_rate(NULL, NULL, pll_clk,
 			ref_clk, NULL, NULL, 0, rate, 0,
-			CLK_FIXED_RATE_PARENT_ACCURACY);
+			CLK_FIXED_RATE_PARENT_ACCURACY, false);
 
 	if (IS_ERR(hw))
 		panic("%pOFn: can't register REFCLK. Check DT!", np);
diff --git a/drivers/clk/clk-fixed-rate.c b/drivers/clk/clk-fixed-rate.c
index ac68a6b40f0e..7d775954e26d 100644
--- a/drivers/clk/clk-fixed-rate.c
+++ b/drivers/clk/clk-fixed-rate.c
@@ -49,12 +49,24 @@ const struct clk_ops clk_fixed_rate_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_fixed_rate_ops);
 
+static void devm_clk_hw_register_fixed_rate_release(struct device *dev, void *res)
+{
+	struct clk_fixed_rate *fix = res;
+
+	/*
+	 * We can not use clk_hw_unregister_fixed_rate, since it will kfree()
+	 * the hw, resulting in double free. Just unregister the hw and let
+	 * devres code kfree() it.
+	 */
+	clk_hw_unregister(&fix->hw);
+}
+
 struct clk_hw *__clk_hw_register_fixed_rate(struct device *dev,
 		struct device_node *np, const char *name,
 		const char *parent_name, const struct clk_hw *parent_hw,
 		const struct clk_parent_data *parent_data, unsigned long flags,
 		unsigned long fixed_rate, unsigned long fixed_accuracy,
-		unsigned long clk_fixed_flags)
+		unsigned long clk_fixed_flags, bool devm)
 {
 	struct clk_fixed_rate *fixed;
 	struct clk_hw *hw;
@@ -62,7 +74,11 @@ struct clk_hw *__clk_hw_register_fixed_rate(struct device *dev,
 	int ret = -EINVAL;
 
 	/* allocate fixed-rate clock */
-	fixed = kzalloc(sizeof(*fixed), GFP_KERNEL);
+	if (devm)
+		fixed = devres_alloc(devm_clk_hw_register_fixed_rate_release,
+				     sizeof(*fixed), GFP_KERNEL);
+	else
+		fixed = kzalloc(sizeof(*fixed), GFP_KERNEL);
 	if (!fixed)
 		return ERR_PTR(-ENOMEM);
 
@@ -90,9 +106,13 @@ struct clk_hw *__clk_hw_register_fixed_rate(struct device *dev,
 	else
 		ret = of_clk_hw_register(np, hw);
 	if (ret) {
-		kfree(fixed);
+		if (devm)
+			devres_free(fixed);
+		else
+			kfree(fixed);
 		hw = ERR_PTR(ret);
-	}
+	} else if (devm)
+		devres_add(dev, fixed);
 
 	return hw;
 }
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index c10dc4c659e2..fbab9715ca25 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -350,7 +350,7 @@ struct clk_hw *__clk_hw_register_fixed_rate(struct device *dev,
 		const char *parent_name, const struct clk_hw *parent_hw,
 		const struct clk_parent_data *parent_data, unsigned long flags,
 		unsigned long fixed_rate, unsigned long fixed_accuracy,
-		unsigned long clk_fixed_flags);
+		unsigned long clk_fixed_flags, bool devm);
 struct clk *clk_register_fixed_rate(struct device *dev, const char *name,
 		const char *parent_name, unsigned long flags,
 		unsigned long fixed_rate);
@@ -365,7 +365,20 @@ struct clk *clk_register_fixed_rate(struct device *dev, const char *name,
  */
 #define clk_hw_register_fixed_rate(dev, name, parent_name, flags, fixed_rate)  \
 	__clk_hw_register_fixed_rate((dev), NULL, (name), (parent_name), NULL, \
-				     NULL, (flags), (fixed_rate), 0, 0)
+				     NULL, (flags), (fixed_rate), 0, 0, false)
+
+/**
+ * devm_clk_hw_register_fixed_rate - register fixed-rate clock with the clock
+ * framework
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @parent_name: name of clock's parent
+ * @flags: framework-specific flags
+ * @fixed_rate: non-adjustable clock rate
+ */
+#define devm_clk_hw_register_fixed_rate(dev, name, parent_name, flags, fixed_rate)  \
+	__clk_hw_register_fixed_rate((dev), NULL, (name), (parent_name), NULL, \
+				     NULL, (flags), (fixed_rate), 0, 0, true)
 /**
  * clk_hw_register_fixed_rate_parent_hw - register fixed-rate clock with
  * the clock framework
@@ -378,7 +391,7 @@ struct clk *clk_register_fixed_rate(struct device *dev, const char *name,
 #define clk_hw_register_fixed_rate_parent_hw(dev, name, parent_hw, flags,     \
 					     fixed_rate)		      \
 	__clk_hw_register_fixed_rate((dev), NULL, (name), NULL, (parent_hw),  \
-				     NULL, (flags), (fixed_rate), 0, 0)
+				     NULL, (flags), (fixed_rate), 0, 0, false)
 /**
  * clk_hw_register_fixed_rate_parent_data - register fixed-rate clock with
  * the clock framework
@@ -392,7 +405,7 @@ struct clk *clk_register_fixed_rate(struct device *dev, const char *name,
 					     fixed_rate)		      \
 	__clk_hw_register_fixed_rate((dev), NULL, (name), NULL, NULL,	      \
 				     (parent_data), (flags), (fixed_rate), 0, \
-				     0)
+				     0, false)
 /**
  * clk_hw_register_fixed_rate_with_accuracy - register fixed-rate clock with
  * the clock framework
@@ -408,7 +421,7 @@ struct clk *clk_register_fixed_rate(struct device *dev, const char *name,
 						 fixed_accuracy)	      \
 	__clk_hw_register_fixed_rate((dev), NULL, (name), (parent_name),      \
 				     NULL, NULL, (flags), (fixed_rate),       \
-				     (fixed_accuracy), 0)
+				     (fixed_accuracy), 0, false)
 /**
  * clk_hw_register_fixed_rate_with_accuracy_parent_hw - register fixed-rate
  * clock with the clock framework
@@ -423,7 +436,7 @@ struct clk *clk_register_fixed_rate(struct device *dev, const char *name,
 		parent_hw, flags, fixed_rate, fixed_accuracy)		      \
 	__clk_hw_register_fixed_rate((dev), NULL, (name), NULL, (parent_hw)   \
 				     NULL, NULL, (flags), (fixed_rate),	      \
-				     (fixed_accuracy), 0)
+				     (fixed_accuracy), 0, false)
 /**
  * clk_hw_register_fixed_rate_with_accuracy_parent_data - register fixed-rate
  * clock with the clock framework
@@ -438,7 +451,7 @@ struct clk *clk_register_fixed_rate(struct device *dev, const char *name,
 		parent_data, flags, fixed_rate, fixed_accuracy)		      \
 	__clk_hw_register_fixed_rate((dev), NULL, (name), NULL, NULL,	      \
 				     (parent_data), NULL, (flags),	      \
-				     (fixed_rate), (fixed_accuracy), 0)
+				     (fixed_rate), (fixed_accuracy), 0, false)
 
 void clk_unregister_fixed_rate(struct clk *clk);
 void clk_hw_unregister_fixed_rate(struct clk_hw *hw);
-- 
2.35.1

