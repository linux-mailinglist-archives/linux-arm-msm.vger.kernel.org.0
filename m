Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7A4F32A0F9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Mar 2021 14:33:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241993AbhCBEra (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 23:47:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238459AbhCAX1o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 18:27:44 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 996EEC0617A9
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Mar 2021 15:26:16 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id k12so12581830ljg.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Mar 2021 15:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i7JxfEOiT7doc9bceVt7LQIeJ4pML0irOGPzAfMrTt8=;
        b=E6l0v+eqcwSupcmH++VK45o34oa4nPc4etdc7kijF77tYLq2eQb3CywuiXRK/BFjsM
         wmZO2fbDWY0gqJsZBwIv0Y3QWZGRUFP5aAXnyrbHSDoGMrr/ooHY4N4rAU/QtraiqLC/
         Rh1BYI2k/mA1Te5x9eEH3jtruTCPIbNoOz+QjHNCLmMMTt0uMTFrkqR6/PLqoux8lYg6
         04x0jbLp/Yh6JwtSGOTCTn6kagifWW+ll2wj8w0xENAVEpH/gEcu2G3WDBe1p4JLgu4s
         LBRU2gtFpMhaxO7rqYzWMfU/BlSp9xH68lICQs/NeZQMLf4U49vaMmDOC5L1CuQ+PL1n
         ECsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i7JxfEOiT7doc9bceVt7LQIeJ4pML0irOGPzAfMrTt8=;
        b=WPnSwiN7n23s9a/yd6RfNkwekHR3SqWSU5YpiILj8sZiM+IQ5AmbWxlxBdbciZqDKQ
         EPHWOv2it2FNxpziccZjQ0sc6Q4ceddFWhK7FCTGb0QxylDgF7Qc2YzYoYTwrBtGeQwk
         5glhO61I04q2m6hbxkT0ZVq7bEyi3iesxu1wHw77waSdvSuQ0JLvuH9jzxhKGMkIfl/J
         XjayQJDL5vslbtwat7WllRDO6Irpb61ICSUYoLq5f8L8AKEtDRdbykwZDmjJkiFAZyQw
         ySbPwjR0ZC/zRZ1of/8x4BOhQMEclSzcefA17NQm6BODkTXEYIvmE28RLInO9NKZqLmi
         aUFA==
X-Gm-Message-State: AOAM530E+LKTmyDNVZCPA3EoibvreP7IHoFTi/u4nsJ5MYE/E5xXO9Af
        QCLcG6wmSN6iCqXgt8Ryly1aSg==
X-Google-Smtp-Source: ABdhPJwCo7QLF86DsxnO22jiwTiSbNG/FTHYxh4zuB1uth3CPWlQY8+ysnIyF7y4r2326MfKfTrTNg==
X-Received: by 2002:a2e:b817:: with SMTP id u23mr6503299ljo.44.1614641175190;
        Mon, 01 Mar 2021 15:26:15 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b20sm154749lfa.183.2021.03.01.15.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 15:26:14 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [RFC 09/24] clk: mux: provide devm_clk_hw_register_mux()
Date:   Tue,  2 Mar 2021 02:24:52 +0300
Message-Id: <20210301232506.3057401-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210301232506.3057401-1-dmitry.baryshkov@linaro.org>
References: <20210301232506.3057401-1-dmitry.baryshkov@linaro.org>
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
2.30.0

