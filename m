Return-Path: <linux-arm-msm+bounces-106883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKRkKzerAWoMhwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 12:11:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BFC50B9DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 12:11:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 38DF33051523
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 10:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F9E23CF67F;
	Mon, 11 May 2026 10:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nmKrw2wu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50063CB2D4;
	Mon, 11 May 2026 10:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778494098; cv=none; b=ig/aTaA4qZY1c38eSewBc95dmu4KKjIvsKLmuRWJfn/Y7ZhNmiYkHikZ5ihVN9YmVt/VIzc4S1vbDWp9Qzyow0NzhyvXE3NuW6pyj2IOYiqqYytLQmJFxDiAt8dPz0/eZTYNyiFWbsSO2Wq752j70r3AfWe42AUhzPfip8oHnvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778494098; c=relaxed/simple;
	bh=UKNoVjV0J5dUNKFl1Cy2bkx2vPCkjP0RRouQmXHppmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uw7l/NFKmLorsyxCymCz1vE1s61GlQZwOq9HVMiIKGDuxphgU3XCBUtn/j/KM6jVBhhtzOf0BvQVa4BSrWg/y93CGTqjO2v6pG4VQHZO6M7OvPm3WmRdyGOu/UpageNu7B1dQxE682IzmQLw/LZuW3tYUglCoFdSBIB/71f3lL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nmKrw2wu; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778494095;
	bh=UKNoVjV0J5dUNKFl1Cy2bkx2vPCkjP0RRouQmXHppmQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nmKrw2wu97BqIp/+zdNWfDVVOsYGC7pCQoeUwKHvYErC22e9WGdORsMDyg/KKQmWk
	 k6xhXvnPX81ixFgwoMZbhAignTlpGURtyR82Xi/7wNrEJhkKx9EF0Vd3zUuokkWd1B
	 3JOIQuBcbjj2PZDwwCgLlmHZwGmcqE57kssVcD7EjRz6drUPYJqbX4miN48BUA6xlz
	 88UV73VJ1WUE9XzpkgFAEl7xiKcDAmVVpwaxt0rG6jJgxquKwRrT5i5t2mdnLtqBC/
	 fDAh+IwljcE7yd8CGoO7ct96lCzP3ZYrfhs2gSCrd2PLQot8NxgYEHFNI/xYzl20Ln
	 GaSI6s7RAgaCw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3864817E0CA9;
	Mon, 11 May 2026 12:08:14 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	srini@kernel.org,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	sre@kernel.org,
	sboyd@kernel.org,
	angelogioacchino.delregno@collabora.com,
	krzk@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	quic_wcheng@quicinc.com,
	melody.olvera@oss.qualcomm.com,
	quic_nsekar@quicinc.com,
	ivo.ivanov.ivanov1@gmail.com,
	abelvesa@kernel.org,
	luca.weiss@fairphone.com,
	konrad.dybcio@oss.qualcomm.com,
	mitltlatltl@gmail.com,
	krishna.kurapati@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-pm@vger.kernel.org,
	kernel@collabora.com,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH RESEND v8 05/10] nvmem: qcom-spmi-sdam: Migrate to devm_spmi_subdevice_alloc_and_add()
Date: Mon, 11 May 2026 12:08:00 +0200
Message-ID: <20260511100805.121432-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511100805.121432-1-angelogioacchino.delregno@collabora.com>
References: <20260511100805.121432-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 29BFC50B9DD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,arndb.de,linuxfoundation.org,linaro.org,collabora.com,oss.qualcomm.com,quicinc.com,gmail.com,fairphone.com,vger.kernel.org,lists.infradead.org,intel.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[30];
	TAGGED_FROM(0.00)[bounces-106883-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angelogioacchino.delregno@collabora.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:mid,collabora.com:dkim,intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,linaro.org:email]
X-Rspamd-Action: no action

Some Qualcomm PMICs integrate a SDAM device, internally located in
a specific address range reachable through SPMI communication.

Instead of using the parent SPMI device (the main PMIC) as a kind
of syscon in this driver, register a new SPMI sub-device for SDAM
and initialize its own regmap with this sub-device's specific base
address, retrieved from the devicetree.

This allows to stop manually adding the register base address to
every R/W call in this driver, as this can be, and is now, handled
by the regmap API instead.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Acked-by: Srinivas Kandagatla <srini@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/nvmem/Kconfig          |  1 +
 drivers/nvmem/qcom-spmi-sdam.c | 38 +++++++++++++++++++++++-----------
 2 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index 74ddbd0f79b0..476967e2c68b 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -368,6 +368,7 @@ config NVMEM_SNVS_LPGPR
 config NVMEM_SPMI_SDAM
 	tristate "SPMI SDAM Support"
 	depends on SPMI
+	select REGMAP_SPMI
 	help
 	  This driver supports the Shared Direct Access Memory Module on
 	  Qualcomm Technologies, Inc. PMICs. It provides the clients
diff --git a/drivers/nvmem/qcom-spmi-sdam.c b/drivers/nvmem/qcom-spmi-sdam.c
index 4f1cca6eab71..4974105dd963 100644
--- a/drivers/nvmem/qcom-spmi-sdam.c
+++ b/drivers/nvmem/qcom-spmi-sdam.c
@@ -9,6 +9,7 @@
 #include <linux/nvmem-provider.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/spmi.h>
 
 #define SDAM_MEM_START			0x40
 #define REGISTER_MAP_ID			0x40
@@ -20,7 +21,6 @@
 struct sdam_chip {
 	struct regmap			*regmap;
 	struct nvmem_config		sdam_config;
-	unsigned int			base;
 	unsigned int			size;
 };
 
@@ -73,7 +73,7 @@ static int sdam_read(void *priv, unsigned int offset, void *val,
 		return -EINVAL;
 	}
 
-	rc = regmap_bulk_read(sdam->regmap, sdam->base + offset, val, bytes);
+	rc = regmap_bulk_read(sdam->regmap, offset, val, bytes);
 	if (rc < 0)
 		dev_err(dev, "Failed to read SDAM offset %#x len=%zd, rc=%d\n",
 						offset, bytes, rc);
@@ -100,7 +100,7 @@ static int sdam_write(void *priv, unsigned int offset, void *val,
 		return -EINVAL;
 	}
 
-	rc = regmap_bulk_write(sdam->regmap, sdam->base + offset, val, bytes);
+	rc = regmap_bulk_write(sdam->regmap, offset, val, bytes);
 	if (rc < 0)
 		dev_err(dev, "Failed to write SDAM offset %#x len=%zd, rc=%d\n",
 						offset, bytes, rc);
@@ -110,8 +110,17 @@ static int sdam_write(void *priv, unsigned int offset, void *val,
 
 static int sdam_probe(struct platform_device *pdev)
 {
+	struct regmap_config sdam_regmap_config = {
+		.reg_bits = 16,
+		.val_bits = 8,
+		.max_register = 0xff,
+		.fast_io = true,
+	};
 	struct sdam_chip *sdam;
 	struct nvmem_device *nvmem;
+	struct spmi_device *sparent;
+	struct spmi_subdevice *sub_sdev;
+	struct device *dev = &pdev->dev;
 	unsigned int val;
 	int rc;
 
@@ -119,19 +128,23 @@ static int sdam_probe(struct platform_device *pdev)
 	if (!sdam)
 		return -ENOMEM;
 
-	sdam->regmap = dev_get_regmap(pdev->dev.parent, NULL);
-	if (!sdam->regmap) {
-		dev_err(&pdev->dev, "Failed to get regmap handle\n");
-		return -ENXIO;
-	}
+	sparent = to_spmi_device(dev->parent);
+	sub_sdev = devm_spmi_subdevice_alloc_and_add(dev, sparent);
+	if (IS_ERR(sub_sdev))
+		return PTR_ERR(sub_sdev);
 
-	rc = of_property_read_u32(pdev->dev.of_node, "reg", &sdam->base);
+	rc = device_property_read_u32(dev, "reg", &sdam_regmap_config.reg_base);
 	if (rc < 0) {
-		dev_err(&pdev->dev, "Failed to get SDAM base, rc=%d\n", rc);
+		dev_err(dev, "Failed to get SDAM base, rc=%d\n", rc);
 		return -EINVAL;
 	}
 
-	rc = regmap_read(sdam->regmap, sdam->base + SDAM_SIZE, &val);
+	sdam->regmap = devm_regmap_init_spmi_ext(&sub_sdev->sdev, &sdam_regmap_config);
+	if (IS_ERR(sdam->regmap))
+		return dev_err_probe(dev, PTR_ERR(sdam->regmap),
+				     "Failed to get regmap handle\n");
+
+	rc = regmap_read(sdam->regmap, SDAM_SIZE, &val);
 	if (rc < 0) {
 		dev_err(&pdev->dev, "Failed to read SDAM_SIZE rc=%d\n", rc);
 		return -EINVAL;
@@ -159,7 +172,7 @@ static int sdam_probe(struct platform_device *pdev)
 	}
 	dev_dbg(&pdev->dev,
 		"SDAM base=%#x size=%u registered successfully\n",
-		sdam->base, sdam->size);
+		sdam_regmap_config.reg_base, sdam->size);
 
 	return 0;
 }
@@ -181,3 +194,4 @@ module_platform_driver(sdam_driver);
 
 MODULE_DESCRIPTION("QCOM SPMI SDAM driver");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS("SPMI");
-- 
2.53.0


