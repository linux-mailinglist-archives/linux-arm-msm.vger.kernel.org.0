Return-Path: <linux-arm-msm+bounces-117296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IkmOEl3kTGqNrgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 13:34:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C13571AFB6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 13:34:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=Hhf6nL2Y;
	dmarc=pass (policy=none) header.from=collabora.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117296-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117296-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A290130786A5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 11:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C087641610A;
	Tue,  7 Jul 2026 11:18:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24689414A27;
	Tue,  7 Jul 2026 11:18:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783423128; cv=none; b=B0b/lDWmc+4isaXFY4+0ATUVf7xEQ67CjPd2gBs1E5/JA7z+VgTLQxJ/2uL840qhK0wZ4TvzXqkZvmFPQLcwhmxvaX0h+WgVRJ82fLzvdZ7kGSMP+/lrRAf5QBIsgbZUgBwynV0Y7gntfALe9uaQwRad6VSa7OkxJJLwuPPypXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783423128; c=relaxed/simple;
	bh=VheSqs2Tcda06cbmsqvvTXDu2BowRYVSsjr31ZS0laA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qkCOc8+myoSlfr74L9z83n4nAJ3zjcT1icDWLXZaJkT6SI9IHoP/92A5U36aUZRIoZcOdEk8g6UMMtCaRS1fPM5XObuOax1GKBIbcQjoPK+Iwb0GSpGU50Fp6+/C6+L0eSAQ3lxtRYgRHAILXwJHLrdr9cPgMhZU0NA5GT0pifw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Hhf6nL2Y; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783423125;
	bh=VheSqs2Tcda06cbmsqvvTXDu2BowRYVSsjr31ZS0laA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hhf6nL2YDzBkf4Pl1/Q4h5HQRv1RoNHGmoZCcBpGWwVWfgWOjuuEnneEE9vPf+PrP
	 wHrqD0CcjhJfisPfcKGRSyQBG23NUfLdc76cDH7nLMw6XJSVL5arG2VJnewXZUvTYa
	 mtplll6VGleRuaJMvswL2B/uXThbWzmxYsU4F1g/CABMGHG0o7WZqfbFasDy/I8+92
	 V5bq2qmQvxgjlAieMgrRiSCUpugV8behZ/aeQ4LUiK8canY7PPgxI1KwDLyFex7L7l
	 dwHkBuOqMYn7+vpNkVxuiajBWWVqvEYvN7B/t/AyLJz8ZsFo5lTnoZIbeFQGzkvJJV
	 +SoPZnQ3Wx32Q==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AA86017E0713;
	Tue, 07 Jul 2026 13:18:44 +0200 (CEST)
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
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v12 11/12] iio: adc: qcom-spmi-iadc: Migrate to devm_spmi_subdevice_alloc_and_add()
Date: Tue,  7 Jul 2026 13:18:28 +0200
Message-ID: <20260707111829.180158-12-angelogioacchino.delregno@collabora.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117296-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[angelogioacchino.delregno@collabora.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[31];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:sboyd@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:srini@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:sre@kernel.org,m:angelogioacchino.delregno@collabora.com,m:krzk@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:quic_wcheng@quicinc.com,m:melody.olvera@oss.qualcomm.com,m:quic_nsekar@quicinc.com,m:ivo.ivanov.ivanov1@gmail.com,m:abelvesa@kernel.org,m:luca.weiss@fairphone.com,m:konrad.dybcio@oss.qualcomm.com,m:mitltlatltl@gmail.com,m:krishna.kurapati@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-pm@vger.kernel.org,m:kernel@collabora.com,m:jonathan.cameron@huawei.com,m:andriy.shevchenko@intel.com,m:ivoivanovivanov1@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,arndb.de,linuxfoundation.org,linaro.org,collabora.com,oss.qualcomm.com,quicinc.com,gmail.com,fairphone.com,vger.kernel.org,lists.infradead.org,huawei.com,intel.com];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,vger.kernel.org:from_smtp,mm-sol.com:email,collabora.com:from_mime,collabora.com:email,collabora.com:mid,collabora.com:dkim,linaro.org:email,huawei.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6C13571AFB6

Some Qualcomm PMICs integrate an Current ADC device, reachable
in a specific address range over SPMI.

Instead of using the parent SPMI device (the main PMIC) as a kind
of syscon in this driver, register a new SPMI sub-device and
initialize its own regmap with this sub-device's specific base
address, retrieved from the devicetree.

This allows to stop manually adding the register base address to
every R/W call in this driver, as this can be, and is now, handled
by the regmap API instead.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/iio/adc/qcom-spmi-iadc.c | 33 ++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/iio/adc/qcom-spmi-iadc.c b/drivers/iio/adc/qcom-spmi-iadc.c
index 0ec3a0c4b1de..21e35df82193 100644
--- a/drivers/iio/adc/qcom-spmi-iadc.c
+++ b/drivers/iio/adc/qcom-spmi-iadc.c
@@ -16,6 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
+#include <linux/spmi.h>
 
 /* IADC register and bit definition */
 #define IADC_REVISION2				0x1
@@ -94,7 +95,6 @@
  * struct iadc_chip - IADC Current ADC device structure.
  * @regmap: regmap for register read/write.
  * @dev: This device pointer.
- * @base: base offset for the ADC peripheral.
  * @rsense: Values of the internal and external sense resister in micro Ohms.
  * @poll_eoc: Poll for end of conversion instead of waiting for IRQ.
  * @offset: Raw offset values for the internal and external channels.
@@ -105,7 +105,6 @@
 struct iadc_chip {
 	struct regmap	*regmap;
 	struct device	*dev;
-	u16		base;
 	bool		poll_eoc;
 	u32		rsense[2];
 	u16		offset[2];
@@ -119,7 +118,7 @@ static int iadc_read(struct iadc_chip *iadc, u16 offset, u8 *data)
 	unsigned int val;
 	int ret;
 
-	ret = regmap_read(iadc->regmap, iadc->base + offset, &val);
+	ret = regmap_read(iadc->regmap, offset, &val);
 	if (ret < 0)
 		return ret;
 
@@ -129,7 +128,7 @@ static int iadc_read(struct iadc_chip *iadc, u16 offset, u8 *data)
 
 static int iadc_write(struct iadc_chip *iadc, u16 offset, u8 data)
 {
-	return regmap_write(iadc->regmap, iadc->base + offset, data);
+	return regmap_write(iadc->regmap, offset, data);
 }
 
 static int iadc_reset(struct iadc_chip *iadc)
@@ -270,7 +269,7 @@ static int iadc_poll_wait_eoc(struct iadc_chip *iadc, unsigned int interval_us)
 
 static int iadc_read_result(struct iadc_chip *iadc, u16 *data)
 {
-	return regmap_bulk_read(iadc->regmap, iadc->base + IADC_DATA, data, 2);
+	return regmap_bulk_read(iadc->regmap, IADC_DATA, data, 2);
 }
 
 static int iadc_do_conversion(struct iadc_chip *iadc, int chan, u16 *data)
@@ -488,12 +487,19 @@ static void iadc_disable_irq_wake(void *data)
 
 static int iadc_probe(struct platform_device *pdev)
 {
+	struct regmap_config iadc_regmap_config = {
+		.reg_bits = 16,
+		.val_bits = 8,
+		.max_register = 0xff,
+		.fast_io = true,
+	};
 	struct device_node *node = pdev->dev.of_node;
 	struct device *dev = &pdev->dev;
+	struct spmi_subdevice *sub_sdev;
+	struct spmi_device *sparent;
 	struct iio_dev *indio_dev;
 	struct iadc_chip *iadc;
 	int ret, irq_eoc;
-	u32 res;
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*iadc));
 	if (!indio_dev)
@@ -502,18 +508,24 @@ static int iadc_probe(struct platform_device *pdev)
 	iadc = iio_priv(indio_dev);
 	iadc->dev = dev;
 
-	iadc->regmap = dev_get_regmap(dev->parent, NULL);
-	if (!iadc->regmap)
+	sparent = spmi_get_parent_spmi_device(dev);
+	if (!sparent)
 		return -ENODEV;
 
+	sub_sdev = devm_spmi_subdevice_alloc_and_add(dev, sparent);
+	if (IS_ERR(sub_sdev))
+		return PTR_ERR(sub_sdev);
+
 	init_completion(&iadc->complete);
 	mutex_init(&iadc->lock);
 
-	ret = of_property_read_u32(node, "reg", &res);
+	ret = device_property_read_u32(dev, "reg", &iadc_regmap_config.reg_base);
 	if (ret < 0)
 		return -ENODEV;
 
-	iadc->base = res;
+	iadc->regmap = devm_regmap_init_spmi_ext(&sub_sdev->sdev, &iadc_regmap_config);
+	if (IS_ERR(iadc->regmap))
+		return PTR_ERR(iadc->regmap);
 
 	ret = iadc_version_check(iadc);
 	if (ret < 0)
@@ -596,3 +608,4 @@ MODULE_ALIAS("platform:qcom-spmi-iadc");
 MODULE_DESCRIPTION("Qualcomm SPMI PMIC current ADC driver");
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Ivan T. Ivanov <iivanov@mm-sol.com>");
+MODULE_IMPORT_NS("SPMI");
-- 
2.54.0


