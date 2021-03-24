Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54E87347C2E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 16:20:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236515AbhCXPTl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 11:19:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236528AbhCXPTL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 11:19:11 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29E96C0613E0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:19:09 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 75so32523847lfa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7jEz8oihVJdadZw/hP+a4+zFOQ5LD0ulQWufz9UuUgQ=;
        b=umv8kGD2XAiabDM1eKGbsE+1QjsA7nf8WlZCAwm+jjA8SUY+de6PtmpOmplebBTrmK
         uR5yYJUbpQ1NTFSaeMDWa/4ENqtACs0W9iENlaa9EEJDeO/J/5WFR5f4qD50e3Ln/pEz
         AgXWxhqAONka76khzwgmVMTJbI5WoApWNS6PQyAfMlmXVRdP8M8Lku1pG6nGCKJRPWmE
         gPROGTT7Ka3bm0rbgD9ChWkbcHRQ+qIAdlvSqH8U1y92LguFTTBBtjlfvF98AxiO2uPk
         EaJVxwRRnkzO9RPmc++A4GExaAc9TSm4G7bP1OR/ZOEGgEFXlKzhXvsz/Kky3p2cWzOA
         QjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7jEz8oihVJdadZw/hP+a4+zFOQ5LD0ulQWufz9UuUgQ=;
        b=eA7IPA2HPS2vVXuRVishqeejJkmZjcYrVO17G17a6RxUXhYRaIfC587tAz/J9VziNg
         OR6IKXoFx12dc/pZ8APXH0xzdUIBDpkyzUFSbG0qF/fTUZLRLC4yPFa5Ln1H1Tz3b7Us
         SoI9eYViZSGyuSNfRk8V0ILUY1l4N2QqjFBzGPpDKn6UJXQXXicxBYOtsilmXwQBP8Nr
         UsaWMqpQ1tpnWsC+W8hJoPgmiFrDmvVIGvZWg1LBhem8M/SdJ7kXo8AnfZmlMR83ZwcW
         mDAE4ceKzn7xnfVJ0cizeK9E6XccPUd0I7kJM3ksNC68d/60dgBwf7OsAb+iz1FKDUqj
         J8Vg==
X-Gm-Message-State: AOAM533ixYW7t4b/LIp+1SMWMCs/0MZWe5WUlrTYgxYm5AjHxax209bE
        z2Kz58d0+NBXn1p/flRMQrsqrQ==
X-Google-Smtp-Source: ABdhPJy7YbYhyQfY6Cp4XY8fXFlojsORYmI6nyAshZg9X85m7MoLRkEgws7Y3BDMUI+f1+SyfSzBXA==
X-Received: by 2002:a05:6512:1192:: with SMTP id g18mr2136641lfr.408.1616599147684;
        Wed, 24 Mar 2021 08:19:07 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d22sm255199lfm.267.2021.03.24.08.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:19:06 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org, Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v2 01/28] clk: fixed: add devm helper for clk_hw_register_fixed_factor()
Date:   Wed, 24 Mar 2021 18:18:19 +0300
Message-Id: <20210324151846.2774204-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
References: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Daniel Palmer <daniel@0x0f.com>

Add a devm helper for clk_hw_register_fixed_factor() so that drivers that internally
register fixed factor clocks for things like dividers don't need to manually unregister
them on remove or if probe fails.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
Link: https://lore.kernel.org/r/20210211052206.2955988-4-daniel@0x0f.com
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/clk-fixed-factor.c | 39 ++++++++++++++++++++++++++++------
 include/linux/clk-provider.h   |  4 +++-
 2 files changed, 36 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
index 910e6e74ae90..4f7bf3929d6d 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -64,10 +64,16 @@ const struct clk_ops clk_fixed_factor_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_fixed_factor_ops);
 
+static void devm_clk_hw_register_fixed_factor_release(struct device *dev, void *res)
+{
+	clk_hw_unregister_fixed_factor(&((struct clk_fixed_factor *)res)->hw);
+}
+
 static struct clk_hw *
 __clk_hw_register_fixed_factor(struct device *dev, struct device_node *np,
 		const char *name, const char *parent_name, int index,
-		unsigned long flags, unsigned int mult, unsigned int div)
+		unsigned long flags, unsigned int mult, unsigned int div,
+		bool devm)
 {
 	struct clk_fixed_factor *fix;
 	struct clk_init_data init = { };
@@ -75,7 +81,15 @@ __clk_hw_register_fixed_factor(struct device *dev, struct device_node *np,
 	struct clk_hw *hw;
 	int ret;
 
-	fix = kmalloc(sizeof(*fix), GFP_KERNEL);
+	/* You can't use devm without a dev */
+	if (devm && !dev)
+		return ERR_PTR(-EINVAL);
+
+	if (devm)
+		fix = devres_alloc(devm_clk_hw_register_fixed_factor_release,
+				sizeof(*fix), GFP_KERNEL);
+	else
+		fix = kmalloc(sizeof(*fix), GFP_KERNEL);
 	if (!fix)
 		return ERR_PTR(-ENOMEM);
 
@@ -99,9 +113,13 @@ __clk_hw_register_fixed_factor(struct device *dev, struct device_node *np,
 	else
 		ret = of_clk_hw_register(np, hw);
 	if (ret) {
-		kfree(fix);
+		if (devm)
+			devres_free(fix);
+		else
+			kfree(fix);
 		hw = ERR_PTR(ret);
-	}
+	} else if (devm)
+		devres_add(dev, fix);
 
 	return hw;
 }
@@ -111,7 +129,7 @@ struct clk_hw *clk_hw_register_fixed_factor(struct device *dev,
 		unsigned int mult, unsigned int div)
 {
 	return __clk_hw_register_fixed_factor(dev, NULL, name, parent_name, -1,
-					      flags, mult, div);
+					      flags, mult, div, false);
 }
 EXPORT_SYMBOL_GPL(clk_hw_register_fixed_factor);
 
@@ -153,6 +171,15 @@ void clk_hw_unregister_fixed_factor(struct clk_hw *hw)
 }
 EXPORT_SYMBOL_GPL(clk_hw_unregister_fixed_factor);
 
+struct clk_hw *devm_clk_hw_register_fixed_factor(struct device *dev,
+		const char *name, const char *parent_name, unsigned long flags,
+		unsigned int mult, unsigned int div)
+{
+	return __clk_hw_register_fixed_factor(dev, NULL, name, parent_name, -1,
+			flags, mult, div, true);
+}
+EXPORT_SYMBOL_GPL(devm_clk_hw_register_fixed_factor);
+
 #ifdef CONFIG_OF
 static const struct of_device_id set_rate_parent_matches[] = {
 	{ .compatible = "allwinner,sun4i-a10-pll3-2x-clk" },
@@ -185,7 +212,7 @@ static struct clk_hw *_of_fixed_factor_clk_setup(struct device_node *node)
 		flags |= CLK_SET_RATE_PARENT;
 
 	hw = __clk_hw_register_fixed_factor(NULL, node, clk_name, NULL, 0,
-					    flags, mult, div);
+					    flags, mult, div, false);
 	if (IS_ERR(hw)) {
 		/*
 		 * Clear OF_POPULATED flag so that clock registration can be
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index e4316890661a..58f6fe866ae9 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -941,7 +941,9 @@ struct clk_hw *clk_hw_register_fixed_factor(struct device *dev,
 		const char *name, const char *parent_name, unsigned long flags,
 		unsigned int mult, unsigned int div);
 void clk_hw_unregister_fixed_factor(struct clk_hw *hw);
-
+struct clk_hw *devm_clk_hw_register_fixed_factor(struct device *dev,
+		const char *name, const char *parent_name, unsigned long flags,
+		unsigned int mult, unsigned int div);
 /**
  * struct clk_fractional_divider - adjustable fractional divider clock
  *
-- 
2.30.2

