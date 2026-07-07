Return-Path: <linux-arm-msm+bounces-117292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qsxtCR3iTGoTrgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 13:25:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3DF71AE90
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 13:25:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=KNpm+eS7;
	dmarc=pass (policy=none) header.from=collabora.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117292-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117292-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB03330B842A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 11:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B53D40A935;
	Tue,  7 Jul 2026 11:18:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D9C3FE656;
	Tue,  7 Jul 2026 11:18:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783423123; cv=none; b=CgJPyh57xAsoTt1lHCZp2yknLt9FHUly13HnQg0g7oCHPnRSwva2WnEBxiEcUs3FildxcOyjgNZIT6VINVQm3yyfcbC+mJKx3JjW+jE1rNzyYAfE50gomEd948hs8xhtzNbt2b6rk4JT3Ew7n95ynIJAQQix9Rt3tz7Z8z9mhXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783423123; c=relaxed/simple;
	bh=0wPsZVvVNAYlhEjrZvdOBSE/yLWdJd3ryYHW/HNNQac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IXJGAbzPupEJASYYcVUkmTM14llPW4C4fzAhfEZHgyMhDGimNMV+LRMGPGJyDSKX9ZwAPueOqG6xclEJ8qfgcZfs8TEUKtC7VKLRrGLCGCT0TTkpZfiwTmc05AFw90dRwZCftZQK8Ate8/nMM3Zl+uGlPTgYvNJhz3ZGNi0dmjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KNpm+eS7; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783423120;
	bh=0wPsZVvVNAYlhEjrZvdOBSE/yLWdJd3ryYHW/HNNQac=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KNpm+eS7HpENohOeLunJiBbomi/LHnlsnGWjXKSJVlbSnOg9HLLxAbIuKoFDCYHYX
	 JMl3CjetZLTiDUtD6jPkfJYOwddChZX7vu8fc8cw1t+rXDTrBY6GtfFBv4VsfaYkQP
	 +JyZk5YNGAMjRq6cooFt5tMEPYl0TDJxXnlx69PRrtJ3J62oTXPKellyLdtUyB3akt
	 GsIiJu16zsPGaqEgt96pvfnS++WrJZ7iMISCvBaUQ57nnWk14dEv1aTJ8u92c/QrMw
	 T1u7E2CcqODsXp9dNBXWv3icm3zS9xDbbGGMpv7H02SLkR8BIdz0ejDIEHCAce/DEo
	 E/O/J+GTA3MOA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C58E617E0DE6;
	Tue, 07 Jul 2026 13:18:39 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: jic23@kernel.org,
	sboyd@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	srini@kernel.org,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	sre@kernel.org,
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
Subject: [PATCH v12 07/12] nvmem: qcom-spmi-sdam: Migrate to devm_spmi_subdevice_alloc_and_add()
Date: Tue,  7 Jul 2026 13:18:24 +0200
Message-ID: <20260707111829.180158-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707111829.180158-1-angelogioacchino.delregno@collabora.com>
References: <20260707111829.180158-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117292-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:sboyd@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:srini@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:sre@kernel.org,m:angelogioacchino.delregno@collabora.com,m:krzk@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:quic_wcheng@quicinc.com,m:melody.olvera@oss.qualcomm.com,m:quic_nsekar@quicinc.com,m:ivo.ivanov.ivanov1@gmail.com,m:abelvesa@kernel.org,m:luca.weiss@fairphone.com,m:konrad.dybcio@oss.qualcomm.com,m:mitltlatltl@gmail.com,m:krishna.kurapati@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-pm@vger.kernel.org,m:kernel@collabora.com,m:andriy.shevchenko@intel.com,m:ivoivanovivanov1@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[angelogioacchino.delregno@collabora.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,arndb.de,linuxfoundation.org,linaro.org,collabora.com,oss.qualcomm.com,quicinc.com,gmail.com,fairphone.com,vger.kernel.org,lists.infradead.org,intel.com];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angelogioacchino.delregno@collabora.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:email,collabora.com:from_mime,collabora.com:email,collabora.com:mid,collabora.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F3DF71AE90

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
 drivers/nvmem/qcom-spmi-sdam.c | 41 ++++++++++++++++++++++++----------
 2 files changed, 30 insertions(+), 12 deletions(-)

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index e10f7ff725ff..cc032d60b8c1 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -380,6 +380,7 @@ config NVMEM_SNVS_LPGPR
 config NVMEM_SPMI_SDAM
 	tristate "SPMI SDAM Support"
 	depends on SPMI
+	select REGMAP_SPMI
 	help
 	  This driver supports the Shared Direct Access Memory Module on
 	  Qualcomm Technologies, Inc. PMICs. It provides the clients
diff --git a/drivers/nvmem/qcom-spmi-sdam.c b/drivers/nvmem/qcom-spmi-sdam.c
index 4f1cca6eab71..2aec95dff05d 100644
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
 
@@ -119,19 +128,26 @@ static int sdam_probe(struct platform_device *pdev)
 	if (!sdam)
 		return -ENOMEM;
 
-	sdam->regmap = dev_get_regmap(pdev->dev.parent, NULL);
-	if (!sdam->regmap) {
-		dev_err(&pdev->dev, "Failed to get regmap handle\n");
-		return -ENXIO;
-	}
+	sparent = spmi_get_parent_spmi_device(dev);
+	if (!sparent)
+		return -ENODEV;
 
-	rc = of_property_read_u32(pdev->dev.of_node, "reg", &sdam->base);
+	sub_sdev = devm_spmi_subdevice_alloc_and_add(dev, sparent);
+	if (IS_ERR(sub_sdev))
+		return PTR_ERR(sub_sdev);
+
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
@@ -159,7 +175,7 @@ static int sdam_probe(struct platform_device *pdev)
 	}
 	dev_dbg(&pdev->dev,
 		"SDAM base=%#x size=%u registered successfully\n",
-		sdam->base, sdam->size);
+		sdam_regmap_config.reg_base, sdam->size);
 
 	return 0;
 }
@@ -181,3 +197,4 @@ module_platform_driver(sdam_driver);
 
 MODULE_DESCRIPTION("QCOM SPMI SDAM driver");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS("SPMI");
-- 
2.54.0


