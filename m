Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24A1434FE90
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 12:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235112AbhCaK6C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 06:58:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235118AbhCaK5o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 06:57:44 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5882AC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 03:57:44 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id w28so7527022lfn.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 03:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y1u3qI91niStgKbW+WBtzClbJFp3L1syvepMyAqokcs=;
        b=K6LTjhrenDqyIdIUPPp1YHKyaN4YhM1dbepoy7YLo0scME9jbZ+wQlMhx+dRGbtyIb
         rn7jp2woz9YglWY/x3BpkmoGS7UcXAXHCCTEIBTtDzpVZYQmKwL38+al3kzNTagV4yjh
         Uuz8+DzOt6VY9axa9x0wN4CkUD0vBmroUiqm5Jaok3t8eFJ6iySpXyKxHDMPPtJtje1L
         FtnZfNCWUlahfgd89f4IuXuvyjIzcSqH5lTD9fR5GxYJeeNv2r+9oNDm3q6ZaVjwF+si
         paXskREcH2t+lSSLP5MobghwphANhKhhZM1NorG9GkonDiAN604k0oVynfOCQP2dH6/F
         +fww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y1u3qI91niStgKbW+WBtzClbJFp3L1syvepMyAqokcs=;
        b=JRog5/eOhK53/AovTgDN5qqvWWMTdOtixCzN8uHqktBtVcDj/PEaJOAiShePg+J28P
         MvyDRu3H9VzpIbK5EiahOuxRgywOKDwwpdQnOeSrMu15gr8GKNy9L4Uw5txgqbFRvHVr
         ExbprVIcpwkdKcvZGVLujH9tOHf4r3S6RaGP9NWXEQycJrQc9p3AKuxda17Nad9cvinM
         kHXpSlXQzzJzACN31/edSOTaPbS/32nAK0vIDySt39VM/iawq0ocCOtVHzH15HfWqfpi
         6YRynBN/t7Np1lkPq8sDNo4VWOY5hAFKj+X6gkcAH+y6XF/bSL2Oywb1n8wnzwM+lcVc
         5t4A==
X-Gm-Message-State: AOAM533FaS4tiBEBVjEtWCPX42v0ndNHgb/vGNF+gbQuY/M7xRdKqiU9
        /9YJMq7DeKZaV37iXnvDXcCmxQ==
X-Google-Smtp-Source: ABdhPJw+e6U8PmbzHAo1cvC6WZ26mkuLIlfkspnFHFdkIZbIQm2Awy3Zr3l9C8JAtWInd/sKvzz+yQ==
X-Received: by 2002:a05:6512:a82:: with SMTP id m2mr1920945lfu.259.1617188257411;
        Wed, 31 Mar 2021 03:57:37 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h3sm184359ljc.67.2021.03.31.03.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 03:57:37 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v4 01/24] clk: mux: provide devm_clk_hw_register_mux()
Date:   Wed, 31 Mar 2021 13:57:12 +0300
Message-Id: <20210331105735.3690009-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
References: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devm_clk_hw_register_mux() - devres-managed version of
clk_hw_register_mux().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/clk-mux.c        | 35 +++++++++++++++++++++++++++++++++++
 include/linux/clk-provider.h | 13 +++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/clk/clk-mux.c b/drivers/clk/clk-mux.c
index e54e79714818..20582aae7a35 100644
--- a/drivers/clk/clk-mux.c
+++ b/drivers/clk/clk-mux.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/device.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/io.h>
@@ -206,6 +207,40 @@ struct clk_hw *__clk_hw_register_mux(struct device *dev, struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(__clk_hw_register_mux);
 
+static void devm_clk_hw_release_mux(struct device *dev, void *res)
+{
+	clk_hw_unregister_mux(*(struct clk_hw **)res);
+}
+
+struct clk_hw *__devm_clk_hw_register_mux(struct device *dev, struct device_node *np,
+		const char *name, u8 num_parents,
+		const char * const *parent_names,
+		const struct clk_hw **parent_hws,
+		const struct clk_parent_data *parent_data,
+		unsigned long flags, void __iomem *reg, u8 shift, u32 mask,
+		u8 clk_mux_flags, u32 *table, spinlock_t *lock)
+{
+	struct clk_hw **ptr, *hw;
+
+	ptr = devres_alloc(devm_clk_hw_release_mux, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	hw = __clk_hw_register_mux(dev, np, name, num_parents, parent_names, parent_hws,
+				       parent_data, flags, reg, shift, mask,
+				       clk_mux_flags, table, lock);
+
+	if (!IS_ERR(hw)) {
+		*ptr = hw;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return hw;
+}
+EXPORT_SYMBOL_GPL(__devm_clk_hw_register_mux);
+
 struct clk *clk_register_mux_table(struct device *dev, const char *name,
 		const char * const *parent_names, u8 num_parents,
 		unsigned long flags, void __iomem *reg, u8 shift, u32 mask,
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index e4316890661a..9cf7ecc62f7c 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -868,6 +868,13 @@ struct clk_hw *__clk_hw_register_mux(struct device *dev, struct device_node *np,
 		const struct clk_parent_data *parent_data,
 		unsigned long flags, void __iomem *reg, u8 shift, u32 mask,
 		u8 clk_mux_flags, u32 *table, spinlock_t *lock);
+struct clk_hw *__devm_clk_hw_register_mux(struct device *dev, struct device_node *np,
+		const char *name, u8 num_parents,
+		const char * const *parent_names,
+		const struct clk_hw **parent_hws,
+		const struct clk_parent_data *parent_data,
+		unsigned long flags, void __iomem *reg, u8 shift, u32 mask,
+		u8 clk_mux_flags, u32 *table, spinlock_t *lock);
 struct clk *clk_register_mux_table(struct device *dev, const char *name,
 		const char * const *parent_names, u8 num_parents,
 		unsigned long flags, void __iomem *reg, u8 shift, u32 mask,
@@ -902,6 +909,12 @@ struct clk *clk_register_mux_table(struct device *dev, const char *name,
 	__clk_hw_register_mux((dev), NULL, (name), (num_parents), NULL, NULL, \
 			      (parent_data), (flags), (reg), (shift),	      \
 			      BIT((width)) - 1, (clk_mux_flags), NULL, (lock))
+#define devm_clk_hw_register_mux(dev, name, parent_names, num_parents, flags, reg, \
+			    shift, width, clk_mux_flags, lock)		      \
+	__devm_clk_hw_register_mux((dev), NULL, (name), (num_parents),	      \
+			      (parent_names), NULL, NULL, (flags), (reg),     \
+			      (shift), BIT((width)) - 1, (clk_mux_flags),     \
+			      NULL, (lock))
 
 int clk_mux_val_to_index(struct clk_hw *hw, u32 *table, unsigned int flags,
 			 unsigned int val);
-- 
2.30.2

