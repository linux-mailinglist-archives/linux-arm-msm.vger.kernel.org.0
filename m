Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE8CF33F348
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Mar 2021 15:41:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231998AbhCQOk6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Mar 2021 10:40:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231854AbhCQOkp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Mar 2021 10:40:45 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA1DDC061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 07:40:43 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id u10so3470260lju.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 07:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fvhlkx4xo48Lrm5ulhQx7P9OeXo+UeYdR2FET2xIgts=;
        b=pnTeO43vRrTTIyH/0Kf9thZqUQDzE7amtRzGouGc2QcNAkg3xnnWiA5lgxsBccDHtd
         m89FM+q6AIwCsWRO0YRZko+kyjxwE/5mo7ypDHy4haD1RosVlLBgcTiM/dvqxGcVo+Ur
         Dk2zweHYjDZfH8FdcWhUtScz0I1ZGlALKjRhFZHW5762Bv2pvjjEqVViPYGS3M9ivRR9
         ciY3txcksWbhjRxQ5S6SCmRQ2g45AsYckeWJEnTXb1eRiq0PbyxYUChTl9/cKx+cYsuP
         W2nrulk+YgrZgxg7uNpOCED7WqL2YiQQKDfwCN849UVBbODaGTGCyHfNrdkmJukj8n+S
         wQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fvhlkx4xo48Lrm5ulhQx7P9OeXo+UeYdR2FET2xIgts=;
        b=poGSLAdjoc7eIm/pMRypOvmOeinDe+iv8771AV5aPM/wdnm8LnLR2jzms5SDArxGQw
         t4EsFQ9cGGKc+3g5FeD/56vB5gegYz701dBrVc3z4JGYS0AIrCfJWL2ZbBuGqbGdhTyT
         l78OCLWR+6FR3CiQra+46ItjQpu52ToJ7ah2EHBNHqM9Pn/Gn5h3Lfg97tTHKsP++yW7
         reuGoAEsK687NPeV8iA5lklmCuy2a3N/UeDS1m6XxA0Pk7/67bBvnltgY0mbt4xEYfqB
         NdUxMcLutyOzpBnZ/k531Ax4FDvGhPAHtA26tGfpHgOFWnVp8gXm4ry1KbfCT2XGepR5
         YyPQ==
X-Gm-Message-State: AOAM533CvFFPwXAEM0IAIRhpnArbMW4fhdAbNHDXBktv/DnezYPiV6X8
        UN9kfjGQxtHlYDkWcAWwQwPWuw==
X-Google-Smtp-Source: ABdhPJzmCrc7lv3T+k1mtzhrq65ATRhhEHbFaPLQEu4C6EV5jaGVeVV69aSMLfrvvJH3IkW41dE2/Q==
X-Received: by 2002:a2e:9151:: with SMTP id q17mr2578808ljg.107.1615992042332;
        Wed, 17 Mar 2021 07:40:42 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q8sm1484309lfc.223.2021.03.17.07.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 07:40:41 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v1 01/26] clk: mux: provide devm_clk_hw_register_mux()
Date:   Wed, 17 Mar 2021 17:40:14 +0300
Message-Id: <20210317144039.556409-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
References: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devm_clk_hw_register_mux() - devres-managed version of
clk_hw_register_mux().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
index 58f6fe866ae9..3eb15e0262f5 100644
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

