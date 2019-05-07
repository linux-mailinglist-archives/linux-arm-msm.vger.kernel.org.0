Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDDE016C68
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2019 22:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbfEGUk5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 May 2019 16:40:57 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:53086 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727146AbfEGUk5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 May 2019 16:40:57 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 25805611BE; Tue,  7 May 2019 20:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557261656;
        bh=uOdiVH4mM3y1gGpZn3r1a7XWidHGtTS2ItC1QISSiPQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jpeDpL1qRb5s4eMrm7WIgaNOwrXfrpBVxUcEm+O4W7HON6lbqEEimZ6fBjv+BWfia
         E1hCZqLNKVtrPtqCm0b07Ww59YEsJ1SmWFocWC3dwUNgh6mmpZ0RrKL8r3S/B6siUt
         VDge1KWOcdXoZ8XVvryirblJNTWziSnxrpj8TR5c=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9E91560F3E;
        Tue,  7 May 2019 20:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557261655;
        bh=uOdiVH4mM3y1gGpZn3r1a7XWidHGtTS2ItC1QISSiPQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=noBH39knVG9M0u+EPS5OnFZmzobCt4aAIx3Q+gkwtp53OygV7CjtZqeBYMR/+soMQ
         jBCIzyq4MUfbDsATwycV8DkoORMXaqrTRLaDMYsNeXlt0m36shCqAEr0HpMXocqXbM
         UKLKnA/2D0vNdju28tDcja9ThtZnPSHm9R/uGxmg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9E91560F3E
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, evgreen@chromium.org, marc.zyngier@arm.com,
        linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, rplsssn@codeaurora.org,
        linux-arm-msm@vger.kernel.org, thierry.reding@gmail.com,
        bjorn.andersson@linaro.org, dianders@chromium.org,
        Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH v5 05/11] of: irq: add helper to remap interrupts to another irqdomain
Date:   Tue,  7 May 2019 14:37:43 -0600
Message-Id: <20190507203749.3384-6-ilina@codeaurora.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190507203749.3384-1-ilina@codeaurora.org>
References: <20190507203749.3384-1-ilina@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Stephen Boyd <swboyd@chromium.org>

Sometimes interrupts are routed from an interrupt controller to another
in no specific order. Having these in the drivers makes it difficult to
maintain when the same drivers supports multiple variants with different
mapping. Also, specifying them in DT makes little sense with a bunch of
numbers like -
	<0, 13>, <5, 32>,

It makes more sense when we can have the parent handle along with
interrupt specifiers for the incoming interrupt as well as that of the
outgoing interrupt like -
	<22 0 &intc 36 0>,
	<24 0 &intc 37 0>,
	<26 0 &intc 38 0>,

And the interrupt specifiers can be interpreted using these optional
properties -
	irqdomain-map-mask = <0xff 0>;
	irqdomain-map-pass-thru = <0 0xff>;

The irqdomain-map-mask reads the input interrupt specifier to parse the
incoming interrupt port. The format of the output port is specified with
the irqdomain-map-pass-thru property.

Let's add a helper function to parse this from DT and match a struct
irq_fwspec using the input interrupt specifier from the irqdomain-map
and the valid bits specified in the irqdomain-map-mask and copy the
output interrupt specifier from the map to irq_fwspec per the mask in
irqdomain-map-pass-thru property for the matched interrupt.

Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
Changes in v5:
	- Fix returning 0 when no match is found
Changes in v4:
	- Fix commit text spelling and verbosity
---
 drivers/of/irq.c       | 129 +++++++++++++++++++++++++++++++++++++++++
 include/linux/of_irq.h |   1 +
 2 files changed, 130 insertions(+)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index e1f6f392a4c0..6186904b2b6b 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -273,6 +273,135 @@ int of_irq_parse_raw(const __be32 *addr, struct of_phandle_args *out_irq)
 }
 EXPORT_SYMBOL_GPL(of_irq_parse_raw);
 
+int of_irq_domain_map(const struct irq_fwspec *in, struct irq_fwspec *out)
+{
+	char *stem_name;
+	char *cells_name, *map_name = NULL, *mask_name = NULL;
+	char *pass_name = NULL;
+	struct device_node *cur, *new = NULL;
+	const __be32 *map, *mask, *pass;
+	static const __be32 dummy_mask[] = { [0 ... MAX_PHANDLE_ARGS] = ~0 };
+	static const __be32 dummy_pass[] = { [0 ... MAX_PHANDLE_ARGS] = 0 };
+	__be32 initial_match_array[MAX_PHANDLE_ARGS];
+	const __be32 *match_array = initial_match_array;
+	int i, ret, map_len, match;
+	u32 in_size, out_size;
+
+	stem_name = "";
+	cells_name = "#interrupt-cells";
+
+	ret = -ENOMEM;
+	map_name = kasprintf(GFP_KERNEL, "irqdomain%s-map", stem_name);
+	if (!map_name)
+		goto free;
+
+	mask_name = kasprintf(GFP_KERNEL, "irqdomain%s-map-mask", stem_name);
+	if (!mask_name)
+		goto free;
+
+	pass_name = kasprintf(GFP_KERNEL, "irqdomain%s-map-pass-thru", stem_name);
+	if (!pass_name)
+		goto free;
+
+	/* Get the #interrupt-cells property */
+	cur = to_of_node(in->fwnode);
+	ret = of_property_read_u32(cur, cells_name, &in_size);
+	if (ret < 0)
+		goto put;
+
+	/* Precalculate the match array - this simplifies match loop */
+	for (i = 0; i < in_size; i++)
+		initial_match_array[i] = cpu_to_be32(in->param[i]);
+
+	ret = -EINVAL;
+	/* Get the irqdomain-map property */
+	map = of_get_property(cur, map_name, &map_len);
+	if (!map) {
+		ret = 0;
+		goto free;
+	}
+	map_len /= sizeof(u32);
+
+	/* Get the irqdomain-map-mask property (optional) */
+	mask = of_get_property(cur, mask_name, NULL);
+	if (!mask)
+		mask = dummy_mask;
+	/* Iterate through irqdomain-map property */
+	match = 0;
+	while (map_len > (in_size + 1) && !match) {
+		/* Compare specifiers */
+		match = 1;
+		for (i = 0; i < in_size; i++, map_len--)
+			match &= !((match_array[i] ^ *map++) & mask[i]);
+
+		of_node_put(new);
+		new = of_find_node_by_phandle(be32_to_cpup(map));
+		map++;
+		map_len--;
+
+		/* Check if not found */
+		if (!new)
+			goto put;
+
+		if (!of_device_is_available(new))
+			match = 0;
+
+		ret = of_property_read_u32(new, cells_name, &out_size);
+		if (ret)
+			goto put;
+
+		/* Check for malformed properties */
+		if (WARN_ON(out_size > MAX_PHANDLE_ARGS))
+			goto put;
+		if (map_len < out_size)
+			goto put;
+
+		/* Move forward by new node's #interrupt-cells amount */
+		map += out_size;
+		map_len -= out_size;
+	}
+
+	if (!match) {
+		ret = -EINVAL;
+		goto put;
+	}
+
+	/* Get the irqdomain-map-pass-thru property (optional) */
+	pass = of_get_property(cur, pass_name, NULL);
+	if (!pass)
+		pass = dummy_pass;
+
+	/*
+	 * Successfully parsed a irqdomain-map translation; copy new
+	 * specifier into the out structure, keeping the
+	 * bits specified in irqdomain-map-pass-thru.
+	 */
+	match_array = map - out_size;
+	for (i = 0; i < out_size; i++) {
+		__be32 val = *(map - out_size + i);
+
+		out->param[i] = in->param[i];
+		if (i < in_size) {
+			val &= ~pass[i];
+			val |= cpu_to_be32(out->param[i]) & pass[i];
+		}
+
+		out->param[i] = be32_to_cpu(val);
+	}
+	out->param_count = in_size = out_size;
+	out->fwnode = of_node_to_fwnode(new);
+put:
+	of_node_put(cur);
+	of_node_put(new);
+free:
+	kfree(mask_name);
+	kfree(map_name);
+	kfree(pass_name);
+
+	return ret;
+}
+EXPORT_SYMBOL(of_irq_domain_map);
+
 /**
  * of_irq_parse_one - Resolve an interrupt for a device
  * @device: the device whose interrupt is to be resolved
diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
index 1214cabb2247..86342502a62a 100644
--- a/include/linux/of_irq.h
+++ b/include/linux/of_irq.h
@@ -32,6 +32,7 @@ static inline int of_irq_parse_oldworld(struct device_node *device, int index,
 }
 #endif /* CONFIG_PPC32 && CONFIG_PPC_PMAC */
 
+extern int of_irq_domain_map(const struct irq_fwspec *in, struct irq_fwspec *out);
 extern int of_irq_parse_raw(const __be32 *addr, struct of_phandle_args *out_irq);
 extern int of_irq_parse_one(struct device_node *device, int index,
 			  struct of_phandle_args *out_irq);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

