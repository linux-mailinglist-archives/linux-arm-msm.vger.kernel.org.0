Return-Path: <linux-arm-msm+bounces-55188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2314BA998DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 21:44:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 398774A2A99
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 19:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D6CE296150;
	Wed, 23 Apr 2025 19:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VIjZU/Qp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1ED296178;
	Wed, 23 Apr 2025 19:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745437366; cv=none; b=n5MxczVuc8RHAKYJ9R6bW439K8bhoFg5mGpWo03RD2L3FwX/Csu9wQmvncJsR9wve2A9G9Lg1F6KZ/ykCnu4smsGkUDzGSWfY3ATviGnjI4jKi0VBhfIj2tOYn6S8CcggB356IDsSK+wz06LNF2Yn/0SOmx6RlO67Q3LOPYav8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745437366; c=relaxed/simple;
	bh=unEvAgjEXaifATfQLY+rUlEDDFjsnO4G5ZkCTJbRQE0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AscsenrdUq7ryAG32tTH/2NUcdsSkoEhMGkHPbd5OdMg/O0+5y50OuorMCBufNKC4c+9xxPXg75lEo5xv53EflO+CvsKqVsMGGsKAu3CwwIodnQTf79IduZaV0F6Z9fWc3akR8mLa2r9GJco6qiHQYa8gDUNdEJF/40sg7iYqjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VIjZU/Qp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92FD4C4CEE8;
	Wed, 23 Apr 2025 19:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745437365;
	bh=unEvAgjEXaifATfQLY+rUlEDDFjsnO4G5ZkCTJbRQE0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VIjZU/QpUi50/IPulSmOpn4kWiFWTDG3gcinh++VKxhR0g3SnwhE5VxJ/GFzGnHHe
	 chTGuKVY/RVqQ2+ptgJuzbncEHvSYeh5XibbcYG5uqp5eDcvD9FFN41cCbDVEY/gyH
	 hrG1wheiB6Z/TJIlLaj6REEInD8RiRVU7LObwgdTi3G16jRgbdW+mYVT+GMGO4i3EU
	 zJ8hxmKd15iZmkvAASb5LMaMvheK9A9GT4iNst9LrPx7w0+hsnxtf82eK+jQIYfRLL
	 y9phE2/T5rX6btTzGxZNWwl54yPEsJeiUp3NPnoz0qUTNNE1U5Unz+xJO5YnupYsOD
	 UQECtDvjOsWwg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 23 Apr 2025 14:42:14 -0500
Subject: [PATCH v2 2/4] of: Simplify of_dma_set_restricted_buffer() to use
 of_for_each_phandle()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-dt-memory-region-v2-v2-2-2fbd6ebd3c88@kernel.org>
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
 linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.15-dev

Simplify of_dma_set_restricted_buffer() by using of_property_present()
and of_for_each_phandle() iterator.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Maintain prior behavior only warning if
   of_reserved_mem_device_init_by_idx() fails
---
 drivers/of/device.c | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/of/device.c b/drivers/of/device.c
index 5053e5d532cc..c80426510ec2 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -35,44 +35,35 @@ EXPORT_SYMBOL(of_match_device);
 static void
 of_dma_set_restricted_buffer(struct device *dev, struct device_node *np)
 {
-	struct device_node *node, *of_node = dev->of_node;
-	int count, i;
+	struct device_node *of_node = dev->of_node;
+	struct of_phandle_iterator it;
+	int rc, i = 0;
 
 	if (!IS_ENABLED(CONFIG_DMA_RESTRICTED_POOL))
 		return;
 
-	count = of_property_count_elems_of_size(of_node, "memory-region",
-						sizeof(u32));
 	/*
 	 * If dev->of_node doesn't exist or doesn't contain memory-region, try
 	 * the OF node having DMA configuration.
 	 */
-	if (count <= 0) {
+	if (!of_property_present(of_node, "memory-region"))
 		of_node = np;
-		count = of_property_count_elems_of_size(
-			of_node, "memory-region", sizeof(u32));
-	}
 
-	for (i = 0; i < count; i++) {
-		node = of_parse_phandle(of_node, "memory-region", i);
+	of_for_each_phandle(&it, rc, of_node, "memory-region", NULL, 0) {
 		/*
 		 * There might be multiple memory regions, but only one
 		 * restricted-dma-pool region is allowed.
 		 */
-		if (of_device_is_compatible(node, "restricted-dma-pool") &&
-		    of_device_is_available(node)) {
-			of_node_put(node);
+		if (of_device_is_compatible(it.node, "restricted-dma-pool") &&
+		    of_device_is_available(it.node)) {
+			if (of_reserved_mem_device_init_by_idx(dev, of_node, i))
+				dev_warn(dev, "failed to initialise \"restricted-dma-pool\" memory node\n");
+			of_node_put(it.node);
 			break;
 		}
-		of_node_put(node);
+		i++;
 	}
 
-	/*
-	 * Attempt to initialize a restricted-dma-pool region if one was found.
-	 * Note that count can hold a negative error code.
-	 */
-	if (i < count && of_reserved_mem_device_init_by_idx(dev, of_node, i))
-		dev_warn(dev, "failed to initialise \"restricted-dma-pool\" memory node\n");
 }
 
 /**

-- 
2.47.2


