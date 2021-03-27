Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF2C34B65A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Mar 2021 12:03:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbhC0LDO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 27 Mar 2021 07:03:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbhC0LDN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 27 Mar 2021 07:03:13 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A8AAC0613B2
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Mar 2021 04:03:13 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id v15so11503622lfq.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Mar 2021 04:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=821JPadqceS+s/0RcZV8FtCTa+nAVDnEcGJf+djq6mQ=;
        b=npIsBaY3sU7Mr4s72ru0F/USbmW/sqXdFE28eIzij/ipeEl7r+TuzEYlxafAM4nhNr
         bajNwD8tluV0eCPf8hxSvPJKyJomuGRHSbFJdliulvG0opI3tMJXOphCd+0SaLe7P+G0
         QL8MtSMbEiFoEEiKxSJGQxsGijjRV/eyfLXP/0GeFn8y+EBpW6wm/0YV7Pqc9s7IqFar
         vxsNfvsZ29wp18vmnds1/X0ClgNEdtyT89MmP41obAs0ECFKkPQIX//XROP50a2/XZ2T
         3yYiBXL/YHPkobmUaShWaHJKrBiiadXoEjWI7WvGnfoJNX0TRKVq1w4KTs00i0UUYhv6
         klDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=821JPadqceS+s/0RcZV8FtCTa+nAVDnEcGJf+djq6mQ=;
        b=PH4YUDp/l8aJB5DE8Uj4nGA36reCGvOG0taG7dPuT4vK15wfPioJ6tlq235UXuEW/C
         jGwT9devSsLirmmWfbs1boNwdR7GhuLF2Aksi4+nIg4hhExc8CTCcWZoJ1HKqh+cXH7s
         tXbwJ6ycuJ66CdZVV7Qgmxnarrytb6vYU8TSO8yzs6u7AWJB3EIJUiEFopAhft3QkaAl
         ql78BHJ/AvvwcOgEFon992wM+yUe2CyZyNXPCZXF/LPxdfv6VSuQxPm84UNRqm8vGu4M
         c1RW1VcqhlHeSD++1zCPHpJp9suLP2oX6wVtI7tmulxuzeKrn//19f9m8d7NCJDF81V5
         trig==
X-Gm-Message-State: AOAM5334zzdCevYLdYA/qdquigNdtLlMnruYrYCcWVE6aH08rT/4LikC
        J3sEeYS9jry3fR+XrJzO3SGFqw==
X-Google-Smtp-Source: ABdhPJzcQNTnymZds/VNl4DYZ1qZoGyLcC8/xJRrpDSS+RMUG4IU064W1LZj9TKHDl7MzfoE60tkzw==
X-Received: by 2002:ac2:47ef:: with SMTP id b15mr10544704lfp.615.1616842991985;
        Sat, 27 Mar 2021 04:03:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a8sm1513801ljn.96.2021.03.27.04.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 04:03:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org, Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v3 01/25] clk: fixed: add devm helper for clk_hw_register_fixed_factor()
Date:   Sat, 27 Mar 2021 14:02:41 +0300
Message-Id: <20210327110305.3289784-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
References: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
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
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

