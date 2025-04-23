Return-Path: <linux-arm-msm+bounces-55187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CF0A998DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 21:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D5A01B86BF7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 19:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9821F2957DD;
	Wed, 23 Apr 2025 19:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aO5Uf8JE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658452957D0;
	Wed, 23 Apr 2025 19:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745437364; cv=none; b=Qnszgz2h7mB1coCUOiynykxsa+PcTh8bZ8jk34QRqAbsEihjW2VWONMaHhfQm9dsVE2HxvO3XUthmapK9F39F0DqVObJpJZOYiZHMoEekG7OWis9MqRtVwWQhnWO8WZhXwSubwwg23U+KQN1guCLzMuGDsGOlh7FYW0TuEyJcsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745437364; c=relaxed/simple;
	bh=ctYGyuPhpbkQw/STF5j4HRUKC3D1Ft1TdkVeReqE1QM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cT59+B1FXr5La1fq+xJQP4dTRhYHg5rvPobNg3OGHZnMFP/PcgyjaK41LlDvlViZB5OeQpqgvICvjW/DSsn7C+qxJoBAh4Pcy6m5d2sFBs48IUO2nPElfwSzZbB4sDh4n611bRSgs4pFdAHrCBbNjHtCdsHTHkvDZsxLozaaVns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aO5Uf8JE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CED2C4CEE2;
	Wed, 23 Apr 2025 19:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745437363;
	bh=ctYGyuPhpbkQw/STF5j4HRUKC3D1Ft1TdkVeReqE1QM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aO5Uf8JED7xdR5Sqpkq0LFktP3AlooyJkQrzX/3l9vvfYa+HCX/fc5UMvNv6g5biA
	 tKCLD1YgmcoGOrrqDxvU04wl5xLzW3RaqbHakFCkVMjoEueRDlaqQEVFCFsHlPI4Bs
	 yGLgAMVG5CwDsnWy7ADvwPYjlNA0aGZVriCX+9jAqElA3El1L50sXRoHmA15I5Kn04
	 /5zVRKtCXE0xJvKIi9Kgr6C+RKN1O6sdjXRngjopN/QKPAM+Jz5Qtx0m5vcdKyCv7/
	 E5AVhxDzb4XKtVQvEw5Vs4cVuzVZ6VrzF5wOlnpfRLuLtsvEAgpX3ihHTcyg2MoJPr
	 +dQ9ZoKYdCfDQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 23 Apr 2025 14:42:13 -0500
Subject: [PATCH v2 1/4] of: reserved_mem: Add functions to parse
 "memory-region"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-dt-memory-region-v2-v2-1-2fbd6ebd3c88@kernel.org>
References: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
In-Reply-To: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
To: Saravana Kannan <saravanak@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Daniel Baluta <daniel.baluta@nxp.com>
X-Mailer: b4 0.15-dev

Drivers with "memory-region" properties currently have to do their own
parsing of "memory-region" properties. The result is all the drivers
have similar patterns of a call to parse "memory-region" and then get
the region's address and size. As this is a standard property, it should
have common functions for drivers to use. Add new functions to count the
number of regions and retrieve the region's address as a resource.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Wrap function parameters
---
 drivers/of/of_reserved_mem.c    | 80 +++++++++++++++++++++++++++++++++++++++++
 include/linux/of_reserved_mem.h | 26 ++++++++++++++
 2 files changed, 106 insertions(+)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index ee2e31522d7e..f87915cce961 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -12,6 +12,7 @@
 #define pr_fmt(fmt)	"OF: reserved mem: " fmt
 
 #include <linux/err.h>
+#include <linux/ioport.h>
 #include <linux/libfdt.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
@@ -740,3 +741,82 @@ struct reserved_mem *of_reserved_mem_lookup(struct device_node *np)
 	return NULL;
 }
 EXPORT_SYMBOL_GPL(of_reserved_mem_lookup);
+
+/**
+ * of_reserved_mem_region_to_resource() - Get a reserved memory region as a resource
+ * @np:		node containing 'memory-region' property
+ * @idx:	index of 'memory-region' property to lookup
+ * @res:	Pointer to a struct resource to fill in with reserved region
+ *
+ * This function allows drivers to lookup a node's 'memory-region' property
+ * entries by index and return a struct resource for the entry.
+ *
+ * Returns 0 on success with @res filled in. Returns -ENODEV if 'memory-region'
+ * is missing or unavailable, -EINVAL for any other error.
+ */
+int of_reserved_mem_region_to_resource(const struct device_node *np,
+				       unsigned int idx, struct resource *res)
+{
+	struct reserved_mem *rmem;
+
+	if (!np)
+		return -EINVAL;
+
+	struct device_node __free(device_node) *target = of_parse_phandle(np, "memory-region", idx);
+	if (!target || !of_device_is_available(target))
+		return -ENODEV;
+
+	rmem = of_reserved_mem_lookup(target);
+	if (!rmem)
+		return -EINVAL;
+
+	resource_set_range(res, rmem->base, rmem->size);
+	res->name = rmem->name;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_reserved_mem_region_to_resource);
+
+/**
+ * of_reserved_mem_region_to_resource_byname() - Get a reserved memory region as a resource
+ * @np:		node containing 'memory-region' property
+ * @name:	name of 'memory-region' property entry to lookup
+ * @res:	Pointer to a struct resource to fill in with reserved region
+ *
+ * This function allows drivers to lookup a node's 'memory-region' property
+ * entries by name and return a struct resource for the entry.
+ *
+ * Returns 0 on success with @res filled in. Returns -ENODEV if 'memory-region'
+ * is missing or unavailable, -EINVAL for any other error.
+ */
+int of_reserved_mem_region_to_resource_byname(const struct device_node *np,
+					      const char *name,
+					      struct resource *res)
+{
+	int idx;
+
+	if (!name)
+		return -EINVAL;
+
+	idx = of_property_match_string(np, "memory-region-names", name);
+	if (idx < 0)
+		return idx;
+
+	return of_reserved_mem_region_to_resource(np, idx, res);
+}
+EXPORT_SYMBOL_GPL(of_reserved_mem_region_to_resource_byname);
+
+/**
+ * of_reserved_mem_region_count() - Return the number of 'memory-region' entries
+ * @np:		node containing 'memory-region' property
+ *
+ * This function allows drivers to retrieve the number of entries for a node's
+ * 'memory-region' property.
+ *
+ * Returns the number of entries on success, or negative error code on a
+ * malformed property.
+ */
+int of_reserved_mem_region_count(const struct device_node *np)
+{
+	return of_count_phandle_with_args(np, "memory-region", NULL);
+}
+EXPORT_SYMBOL_GPL(of_reserved_mem_region_count);
diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index e338282da652..f573423359f4 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -7,6 +7,7 @@
 
 struct of_phandle_args;
 struct reserved_mem_ops;
+struct resource;
 
 struct reserved_mem {
 	const char			*name;
@@ -39,6 +40,12 @@ int of_reserved_mem_device_init_by_name(struct device *dev,
 void of_reserved_mem_device_release(struct device *dev);
 
 struct reserved_mem *of_reserved_mem_lookup(struct device_node *np);
+int of_reserved_mem_region_to_resource(const struct device_node *np,
+				       unsigned int idx, struct resource *res);
+int of_reserved_mem_region_to_resource_byname(const struct device_node *np,
+					      const char *name, struct resource *res);
+int of_reserved_mem_region_count(const struct device_node *np);
+
 #else
 
 #define RESERVEDMEM_OF_DECLARE(name, compat, init)			\
@@ -63,6 +70,25 @@ static inline struct reserved_mem *of_reserved_mem_lookup(struct device_node *np
 {
 	return NULL;
 }
+
+static inline int of_reserved_mem_region_to_resource(const struct device_node *np,
+						     unsigned int idx,
+						     struct resource *res)
+{
+	return -ENOSYS;
+}
+
+static inline int of_reserved_mem_region_to_resource_byname(const struct device_node *np,
+							    const char *name,
+							    struct resource *res)
+{
+	return -ENOSYS;
+}
+
+static inline int of_reserved_mem_region_count(const struct device_node *np)
+{
+	return 0;
+}
 #endif
 
 /**

-- 
2.47.2


