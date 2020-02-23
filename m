Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D65861695CC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2020 05:20:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727166AbgBWETw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 22 Feb 2020 23:19:52 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:33427 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726983AbgBWETw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 22 Feb 2020 23:19:52 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 589E721B03;
        Sat, 22 Feb 2020 23:19:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sat, 22 Feb 2020 23:19:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm2; bh=29jUBwoXvuarTIYCv2K9/Ed7RP
        zIOgoOw2xOPHEd28A=; b=XJ2snZnj7a6mcv05PkQ04IqGL1WPX0jE1k35GsuDnz
        a9/i+DS+fjwR3zHY83HTaHSMuL0Af3zkoS8uId802BhCe5n9BR2zOz/Nd6H1g6NG
        TTNvxfyvDTXn3c1gmkwi/SBf66R2uVrUdlvoGR0GEfwm1G9q21ZU4kqXcE/4rbJa
        OWWOxzqXb0qsPndCs7cYXhfwsC9C1lYwEnL7318RD+x/Mj/mIix6FQuVjxie0dOc
        Xbz/V2ZFrt5ps4l2+Kj7TKIxGMWNu3X03EwS0NI+/NCPh5/0GQw/hHnpEOTc8bvv
        vrTYciL4YR6cg0H0/qX5OfrcVMcLb3bgcgK3BckPHAeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=29jUBwoXvuarTIYCv
        2K9/Ed7RPzIOgoOw2xOPHEd28A=; b=faVC0fIXMmvtXXZl/KlJS2hCmrK5IpCBx
        fGOUndeFr0+bdNkAgGWKsNgDmpqXEvvz8Nd+ooSl9ZgtjShM5GH5G+rrdvPTrAm9
        GU0lib2mNA6Q1gGI055etM/t5YqjZYsYvFZUjQqSAxn6TfzCmQvGk6rFtfqrSLtT
        CXLYvqRWfmXFf8Lp0Zg/wQx0zh39SWMCjQiKWY007OAVwx9Lyq1i2r9661p2V63n
        WDgiowjswROxKDIEyrKGpFQj68vdis3Y3PIuJxrD4vNiUwXhIlTErhKRfUXTdecb
        QPc/dsS/bpGQm++SinIFO185Q45T9YG8UEBLmbjTJvnyLku3wUBQA==
X-ME-Sender: <xms:Zf1RXhx1tPRT0N4ffetoFIYSnbF6At4qplbON0WZyxHstcRHuixowg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkeejgdeiiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghlucfj
    ohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppeejtd
    drudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:Zf1RXvFhSZQJtqjmU8UyYKjL_6VYjVQy6wjui7IEhEd10pTb6-tTfA>
    <xmx:Zf1RXsO4S3qkjKwFgR33W9t_G9s1K5elT9mhpk-SDS9P3zJ5wNC1Xg>
    <xmx:Zf1RXufj2N5HbPheOar6ZRhgBX87cVQU9iWGYDS6C8Mv-hh_PDf0eA>
    <xmx:Zv1RXm2lpTjvLOcqkWpLzi9ieURaM2VRibhMGiaWOX01qZSUwmsQ2g>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id CE9C7328005E;
        Sat, 22 Feb 2020 23:19:48 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Samuel Holland <samuel@sholland.org>
Subject: [PATCH 1/2] clk: Implement protected-clocks for all OF clock providers
Date:   Sat, 22 Feb 2020 22:19:47 -0600
Message-Id: <20200223041948.3218-1-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a generic implementation of the "protected-clocks" property from
the common clock binding. It allows firmware to inform the OS about
clocks that must not be disabled while the OS is running.

This implementation comes with some caveats:

1) Clocks that have CLK_IS_CRITICAL in their init data are prepared/
enabled before they are attached to the clock tree. protected-clocks are
only protected once the clock provider is added, which is generally
after all of the clocks it provides have been registered. This leaves a
window of opportunity where something could disable or modify the clock,
such as a driver running on another CPU, or the clock core itself. There
is a comment to this effect in __clk_core_init():

  /*
   * Enable CLK_IS_CRITICAL clocks so newly added critical clocks
   * don't get accidentally disabled when walking the orphan tree and
   * reparenting clocks
   */

Similarly, these clocks will be enabled after they are first reparented,
unlike other CLK_IS_CRITICAL clocks. See the comment in
clk_core_reparent_orphans_nolock():

  /*
   * We need to use __clk_set_parent_before() and _after() to
   * to properly migrate any prepare/enable count of the orphan
   * clock. This is important for CLK_IS_CRITICAL clocks, which
   * are enabled during init but might not have a parent yet.
   */

Ideally we could detect protected clocks before they are reparented, but
there are two problems with that:

  a) From the clock core's perspective, hw->init is const.

  b) The clock core doesn't see the device_node until __clk_register is
     called on the first clock.

So the only "race-free" way to detect protected-clocks is to do it in
the middle of __clk_register, between when core->flags is initialized
and calling __clk_core_init(). That requires scanning the device tree
again for each clock, which is part of why I didn't do it that way.

2) __clk_protect needs to be idempotent, for two reasons:

  a) Clocks with CLK_IS_CRITICAL in their init data are already
     prepared/enabled, and we don't want to prepare/enable them again.

  b) of_clk_set_defaults() is called twice for (at least some) clock
     controllers registered with CLK_OF_DECLARE. It is called first in
     of_clk_add_provider()/of_clk_add_hw_provider() inside clk_init_cb,
     and again afterward in of_clk_init(). The second call in
     of_clk_init() may be unnecessary, but verifying that would require
     auditing all users of CLK_OF_DECLARE to ensure they called one of
     the of_clk_add{,_hw}_provider functions.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

Changes RFC->v1:
  - Only set CLK_IS_CRITICAL, not other flags

---
 drivers/clk/clk-conf.c | 54 ++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/clk.c      | 31 ++++++++++++++++++++++++
 drivers/clk/clk.h      |  2 ++
 3 files changed, 87 insertions(+)

diff --git a/drivers/clk/clk-conf.c b/drivers/clk/clk-conf.c
index 2ef819606c41..a57d28b0f397 100644
--- a/drivers/clk/clk-conf.c
+++ b/drivers/clk/clk-conf.c
@@ -11,6 +11,54 @@
 #include <linux/of.h>
 #include <linux/printk.h>
 
+#include "clk.h"
+
+static int __set_clk_flags(struct device_node *node)
+{
+	struct of_phandle_args clkspec;
+	struct property *prop;
+	int i, index = 0, rc;
+	const __be32 *cur;
+	struct clk *clk;
+	u32 nr_cells;
+
+	rc = of_property_read_u32(node, "#clock-cells", &nr_cells);
+	if (rc < 0) {
+		pr_err("clk: missing #clock-cells property on %pOF\n", node);
+		return rc;
+	}
+
+	clkspec.np         = node;
+	clkspec.args_count = nr_cells;
+
+	of_property_for_each_u32(node, "protected-clocks", prop, cur, clkspec.args[0]) {
+		/* read the remainder of the clock specifier */
+		for (i = 1; i < nr_cells; ++i) {
+			cur = of_prop_next_u32(prop, cur, &clkspec.args[i]);
+			if (!cur) {
+				pr_err("clk: invalid value of protected-clocks"
+				       " property at %pOF\n", node);
+				return -EINVAL;
+			}
+		}
+		clk = of_clk_get_from_provider(&clkspec);
+		if (IS_ERR(clk)) {
+			if (PTR_ERR(clk) != -EPROBE_DEFER)
+				pr_err("clk: couldn't get protected clock"
+				       " %u for %pOF\n", index, node);
+			return PTR_ERR(clk);
+		}
+
+		rc = __clk_protect(clk);
+		if (rc < 0)
+			pr_warn("clk: failed to protect %s: %d\n",
+				__clk_get_name(clk), rc);
+		clk_put(clk);
+		index++;
+	}
+	return 0;
+}
+
 static int __set_clk_parents(struct device_node *node, bool clk_supplier)
 {
 	struct of_phandle_args clkspec;
@@ -135,6 +183,12 @@ int of_clk_set_defaults(struct device_node *node, bool clk_supplier)
 	if (!node)
 		return 0;
 
+	if (clk_supplier) {
+		rc = __set_clk_flags(node);
+		if (rc < 0)
+			return rc;
+	}
+
 	rc = __set_clk_parents(node, clk_supplier);
 	if (rc < 0)
 		return rc;
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index f0f2b599fd7e..1dc1e115197b 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4122,6 +4122,37 @@ void devm_clk_hw_unregister(struct device *dev, struct clk_hw *hw)
 }
 EXPORT_SYMBOL_GPL(devm_clk_hw_unregister);
 
+/*
+ * clk-conf helpers
+ */
+
+int __clk_protect(struct clk *clk)
+{
+	struct clk_core *core = clk->core;
+	int ret = 0;
+
+	clk_prepare_lock();
+
+	/*
+	 * If CLK_IS_CRITICAL was set in the clock's init data, then
+	 * the clock was already prepared/enabled when it was added.
+	 */
+	if (core->flags & CLK_IS_CRITICAL)
+		goto out;
+
+	core->flags |= CLK_IS_CRITICAL;
+	ret = clk_core_prepare(core);
+	if (ret)
+		goto out;
+
+	ret = clk_core_enable_lock(core);
+
+out:
+	clk_prepare_unlock();
+
+	return ret;
+}
+
 /*
  * clkdev helpers
  */
diff --git a/drivers/clk/clk.h b/drivers/clk/clk.h
index 2d801900cad5..367a0f036b13 100644
--- a/drivers/clk/clk.h
+++ b/drivers/clk/clk.h
@@ -24,6 +24,7 @@ struct clk_hw *clk_find_hw(const char *dev_id, const char *con_id);
 #ifdef CONFIG_COMMON_CLK
 struct clk *clk_hw_create_clk(struct device *dev, struct clk_hw *hw,
 			      const char *dev_id, const char *con_id);
+int __clk_protect(struct clk *clk);
 void __clk_put(struct clk *clk);
 #else
 /* All these casts to avoid ifdefs in clkdev... */
@@ -33,6 +34,7 @@ clk_hw_create_clk(struct device *dev, struct clk_hw *hw, const char *dev_id,
 {
 	return (struct clk *)hw;
 }
+static inline int __clk_protect(struct clk *clk) { return 0; }
 static inline void __clk_put(struct clk *clk) { }
 
 #endif
-- 
2.24.1

