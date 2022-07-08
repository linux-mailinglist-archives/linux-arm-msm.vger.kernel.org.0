Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A1BF56BB39
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jul 2022 15:56:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238360AbiGHNy6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jul 2022 09:54:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238357AbiGHNy5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jul 2022 09:54:57 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EAFF2A435
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jul 2022 06:54:55 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id u14so26050540ljh.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jul 2022 06:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EZUGt5gCk+MdWylcaBkZx6phsLIE0h86j1sFH20tEAQ=;
        b=FfCRKrxfUKQKpwbdzPRN+pHx5Kjtdlz5+r1KZuHovMqpH482MpGYPOSlqoPsSokLCr
         BsTcCnmcLZf/eyagb1g4Bvxi3HTs90S6xrg2s08wFkPxCJrOa2EA9Jh4oDXUo2aypSrR
         fZNlxTT5dqpyeplGrver+Q8bdZXD0DVgyhSJ3wsce7NE5+PKQu5ziAU4/s+M972daoRg
         T0CT/N02A2VUDkWSB6AtIIvuMAwvMwMuJ4lgzFIP1V2ZBAmj9tj5rKs7RYZ3duHmSPUn
         g8XMMY1u2Sb5mso7hY6vH7yOpDwpabwxmZScQU9aDujALc6IjwkM1fLwj0hCkX5nfnuI
         gsbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EZUGt5gCk+MdWylcaBkZx6phsLIE0h86j1sFH20tEAQ=;
        b=kfijQopwFTGhAqTQewpgLqcflnXU8jJgG+H9yHC6mPuWJyxAdJsRksyip3ktsoo8vH
         q9dvBuTbJMJxxUXUSqehLjfxoLVtIkymwN2R56zXFQWdPPiFm7C3BYNsj4X1+ZL4oD1O
         QpAcFfWHIE17QXBo+mSfHoExqu8Whdxu3ZwzsfzbdmyR8bmPa1ipXnH9iMkYyjiQ8YoW
         5Lz2x2mKxjJa423GBs+TamhXhLrCSQ8wnAhFYgTQvSRcyKGnXZLddBPM54BMBp4BOOqF
         KRhU10AO2JLBpT7DlhF/iMg8QWnSZ860aSRXDDy02gQwJUxkQAew65FZ9pu5KL+7VQLQ
         hH1A==
X-Gm-Message-State: AJIora/OEp+YYt5C3OH5UGSZmJISnanTDC13oY8xkrHV+u2LBLyUwpAa
        3ykmkGKpwCQJsJT0W5a87tkc5w==
X-Google-Smtp-Source: AGRyM1stZOiDpeg6tjdPHR8914m7obHodtyvPGHBfcL42/nIqKRnx1ON/2CjCiqvRzpj8pm8NhjVFA==
X-Received: by 2002:a2e:a7c7:0:b0:25b:b72d:aa3c with SMTP id x7-20020a2ea7c7000000b0025bb72daa3cmr2067238ljp.318.1657288493987;
        Fri, 08 Jul 2022 06:54:53 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y9-20020ac24e69000000b0047f647414efsm7428352lfs.190.2022.07.08.06.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 06:54:53 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-phy@lists.infradead.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH v3 2/3] clk: fixed-rate: add devm_clk_hw_register_fixed_rate
Date:   Fri,  8 Jul 2022 16:54:49 +0300
Message-Id: <20220708135450.2845810-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220708135450.2845810-1-dmitry.baryshkov@linaro.org>
References: <20220708135450.2845810-1-dmitry.baryshkov@linaro.org>
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
 drivers/clk/clk-fixed-rate.c | 28 ++++++++++++++++++++++++----
 include/linux/clk-provider.h | 29 +++++++++++++++++++++--------
 2 files changed, 45 insertions(+), 12 deletions(-)

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
index 659ef5a77246..5058c8175fd1 100644
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
 /**
  * clk_hw_register_fixed_rate_parent_accuracy - register fixed-rate clock with
  * the clock framework
@@ -452,7 +465,7 @@ struct clk *clk_register_fixed_rate(struct device *dev, const char *name,
 						   flags, fixed_rate)	      \
 	__clk_hw_register_fixed_rate((dev), NULL, (name), (parent_name),      \
 				     NULL, NULL, (flags), (fixed_rate), 0,    \
-				     CLK_FIXED_RATE_PARENT_ACCURACY)
+				     CLK_FIXED_RATE_PARENT_ACCURACY, false)
 
 void clk_unregister_fixed_rate(struct clk *clk);
 void clk_hw_unregister_fixed_rate(struct clk_hw *hw);
-- 
2.35.1

