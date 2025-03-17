Return-Path: <linux-arm-msm+bounces-51660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E8DA662A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 00:25:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDE3117F472
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 23:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 083482063C5;
	Mon, 17 Mar 2025 23:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WtBxQCHG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7C7205E37;
	Mon, 17 Mar 2025 23:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742253877; cv=none; b=Lh7HiSu515cuxlUkCw9+DvAh4x0biR4OMf/mgDob6qeSsoEXgXs++/ovKx9DETZYAT7wxWMF4622iZCeoiY5qbBN6Rb62yGGOfkxfPFas7dkCfkJghOBEMnbvON3fqGQHShhVlgOYKZ1oR60LGMjcMn3aduAjw7h+QpsNVGxw84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742253877; c=relaxed/simple;
	bh=ntMn2ITUTPUhGAIqv6TVX+CHm+RKieyU9jYM8nDojVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dxRxVY/rGtZJo9pdVNLjsEZjmuGwkCBH0ZClsc2GWiUT0yT5fV4zvuE5i/RIp3g59OR/YsH3tijXwDteHygEGiZGRA6D4qcM4TFMf64A1ZSVKFVkwdjKh/iEYOWHbI8E9hnKmDjFNAiKV7BQyizOHE1bO28EfGDPSZDKW9cWMig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WtBxQCHG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16309C4CEE3;
	Mon, 17 Mar 2025 23:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742253877;
	bh=ntMn2ITUTPUhGAIqv6TVX+CHm+RKieyU9jYM8nDojVw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WtBxQCHGCCUfaRKilodwzCHd2KyUvLLbflwi3znhIMfAIrEogRngrjwN/2zDHaKhV
	 1m6cYo+M8AMILvzXmBYO9M10VyotHIYJAuh4uxpRb2aMlv8+eM9t+9etq4BtmxvQKI
	 piDkWV/+jKEzbGPvLHqPwvU5Q/UO4zGBLaVwLR5ZGHfzbf+7IpMiw98f3jxusNhKs9
	 DPBTjiLsnlvLK3/Q/J0R4/GcKUo+pSLhtE5gfyPs4kHjQ6uTgJplaOolCUbN368oZe
	 okHiCMB22lQNevyhqZko759YeC5aonjysf6ArbpbLKCx0haWFwc8/5B2fkqyJqNBae
	 RTQWIdonPVVUQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Saravana Kannan <saravanak@google.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 2/3] of: Simplify of_dma_set_restricted_buffer() to use of_for_each_phandle()
Date: Mon, 17 Mar 2025 18:24:22 -0500
Message-ID: <20250317232426.952188-3-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317232426.952188-1-robh@kernel.org>
References: <20250317232426.952188-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify of_dma_set_restricted_buffer() by using of_property_present()
and of_for_each_phandle() iterator.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/of/device.c | 34 +++++++++++++---------------------
 1 file changed, 13 insertions(+), 21 deletions(-)

diff --git a/drivers/of/device.c b/drivers/of/device.c
index edf3be197265..bb4a47d58249 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -35,44 +35,36 @@ EXPORT_SYMBOL(of_match_device);
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
-			break;
+		if (of_device_is_compatible(it.node, "restricted-dma-pool") &&
+		    of_device_is_available(it.node)) {
+			if (!of_reserved_mem_device_init_by_idx(dev, of_node, i)) {
+				of_node_put(it.node);
+				return;
+			}
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
+	dev_warn(dev, "failed to initialise \"restricted-dma-pool\" memory node\n");
 }
 
 /**
-- 
2.47.2


