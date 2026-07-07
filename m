Return-Path: <linux-arm-msm+bounces-117261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +eOZHPfTTGrIqQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:24:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A03B971A54B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:24:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=U5bTaQBM;
	dmarc=pass (policy=none) header.from=collabora.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117261-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117261-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 067173034895
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 10:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FA9A3E5598;
	Tue,  7 Jul 2026 10:18:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9287C3E44F9;
	Tue,  7 Jul 2026 10:18:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419520; cv=none; b=mD7mjdniuvIWZbuhtXgyCN9pEaD9UfMLnEG3nIvRCelC2Fpc2Pj6hH+9c6DNXXvo6uQeUdgSx+FCQryXWKpYpy/FWb/oDIXjOJoQ7c6hr1p/ScxuS/+EhTTGXlDs2fecjVaedu/bCsASQMnEZQ4JMQyArVrkMNNl1UsxRakEMLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419520; c=relaxed/simple;
	bh=sVNkkV8uL94cr17uyAdt+j62uOnX4B7OLaBuuZtHXs8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t+DTD1JpxTzF+zBrSSOB5ny30vcawjkWW5iH9iJy8d6ny7d5GxxXODHVxOgmOUk5n+GTakimCU5ylwtyRquFm3KDmaTA1bsfUx6NDSXwRxY4GavKIgFFIpZMa2kcNY/wzHo+r2cBzFE9MtMVbMkB5SsNf6Pudik+pw/y6HwCSZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=U5bTaQBM; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783419517;
	bh=sVNkkV8uL94cr17uyAdt+j62uOnX4B7OLaBuuZtHXs8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U5bTaQBMoGH1dgaMXx42vj5M+NbEWbvocInyLKRMIrNvrlvA3K+WysF3UJXYgYqco
	 MqcWEn8kGs6us9FvJTWIa8bP1J+1nb85mmnk+gnQQpVVcXG9xFDwm8VcG9XKMfV2O+
	 /7qhs1G4dDg/rGd8RV9DievwkhgbTEPC+/T+wBXBNtqHyWKk8a46bhMTK9vRa4nkhq
	 7qgp3PYjASocrr1tJz63ofzSXLmSc/j2kYa5+F8am43A0bZs7cagYxUWIOURHRAo7U
	 Ao8FWBM4zpvY+JRYXPLQpjME0dbLBG3U/WHwOs7JNzhYtu3czKpWr8po5U1/7NAhqV
	 DVE37rFPWKG8A==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0C26B17E0DE6;
	Tue, 07 Jul 2026 12:18:36 +0200 (CEST)
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
	Abel Vesa <abel.vesa@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v11 09/12] phy: qualcomm: eusb2-repeater: Migrate to devm_spmi_subdevice_alloc_and_add()
Date: Tue,  7 Jul 2026 12:18:18 +0200
Message-ID: <20260707101821.173319-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707101821.173319-1-angelogioacchino.delregno@collabora.com>
References: <20260707101821.173319-1-angelogioacchino.delregno@collabora.com>
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
	TAGGED_FROM(0.00)[bounces-117261-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[angelogioacchino.delregno@collabora.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[31];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:sboyd@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:srini@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:sre@kernel.org,m:angelogioacchino.delregno@collabora.com,m:krzk@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:quic_wcheng@quicinc.com,m:melody.olvera@oss.qualcomm.com,m:quic_nsekar@quicinc.com,m:ivo.ivanov.ivanov1@gmail.com,m:abelvesa@kernel.org,m:luca.weiss@fairphone.com,m:konrad.dybcio@oss.qualcomm.com,m:mitltlatltl@gmail.com,m:krishna.kurapati@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-pm@vger.kernel.org,m:kernel@collabora.com,m:abel.vesa@linaro.org,m:andriy.shevchenko@intel.com,m:ivoivanovivanov1@gmail.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,intel.com:email,vger.kernel.org:from_smtp,collabora.com:from_mime,collabora.com:email,collabora.com:mid,collabora.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A03B971A54B

Some Qualcomm PMICs integrate an USB Repeater device, used to
convert between eUSB2 and USB 2.0 signaling levels, reachable
in a specific address range over SPMI.

Instead of using the parent SPMI device (the main PMIC) as a kind
of syscon in this driver, register a new SPMI sub-device for EUSB2
and initialize its own regmap with this sub-device's specific base
address, retrieved from the devicetree.

This allows to stop manually adding the register base address to
every R/W call in this driver, as this can be, and is now, handled
by the regmap API instead.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Acked-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/phy/qualcomm/Kconfig                  |  2 +
 .../phy/qualcomm/phy-qcom-eusb2-repeater.c    | 52 ++++++++++++-------
 2 files changed, 34 insertions(+), 20 deletions(-)

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index 60a0ead127fa..902a788f35f1 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -128,7 +128,9 @@ config PHY_QCOM_QUSB2
 config PHY_QCOM_EUSB2_REPEATER
 	tristate "Qualcomm PMIC eUSB2 Repeater Driver"
 	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	depends on SPMI
 	select GENERIC_PHY
+	select REGMAP_SPMI
 	help
 	  Enable support for the USB high-speed eUSB2 repeater on Qualcomm
 	  PMICs. The repeater is paired with a Synopsys or M31 eUSB2 Phy
diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
index efeec4709a15..a8542da2b462 100644
--- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
+++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
@@ -9,6 +9,7 @@
 #include <linux/regmap.h>
 #include <linux/of.h>
 #include <linux/phy/phy.h>
+#include <linux/spmi.h>
 
 /* eUSB2 status registers */
 #define EUSB2_RPTR_STATUS		0x08
@@ -66,7 +67,6 @@ struct eusb2_repeater {
 	struct phy *phy;
 	struct regulator_bulk_data *vregs;
 	const struct eusb2_repeater_cfg *cfg;
-	u32 base;
 	enum phy_mode mode;
 };
 
@@ -143,7 +143,6 @@ static int eusb2_repeater_init(struct phy *phy)
 	struct eusb2_repeater *rptr = phy_get_drvdata(phy);
 	struct device_node *np = rptr->dev->of_node;
 	struct regmap *regmap = rptr->regmap;
-	u32 base = rptr->base;
 	u32 poll_val;
 	s32 dt_val;
 	int ret;
@@ -154,37 +153,37 @@ static int eusb2_repeater_init(struct phy *phy)
 	if (ret)
 		return ret;
 
-	regmap_write(regmap, base + EUSB2_EN_CTL1, EUSB2_RPTR_EN);
+	regmap_write(regmap, EUSB2_EN_CTL1, EUSB2_RPTR_EN);
 
 	/* Write registers from init table */
 	for (int i = 0; i < rptr->cfg->init_tbl_num; i++)
-		regmap_write(regmap, base + rptr->cfg->init_tbl[i].reg,
+		regmap_write(regmap, rptr->cfg->init_tbl[i].reg,
 			     rptr->cfg->init_tbl[i].value);
 
 	/* Override registers from devicetree values */
 	if (!of_property_read_u8(np, "qcom,tune-usb2-preem", &val))
-		regmap_write(regmap, base + EUSB2_TUNE_USB2_PREEM, val);
+		regmap_write(regmap, EUSB2_TUNE_USB2_PREEM, val);
 
 	if (!of_property_read_u8(np, "qcom,tune-usb2-disc-thres", &val))
-		regmap_write(regmap, base + EUSB2_TUNE_HSDISC, val);
+		regmap_write(regmap, EUSB2_TUNE_HSDISC, val);
 
 	if (!of_property_read_u8(np, "qcom,tune-usb2-amplitude", &val))
-		regmap_write(regmap, base + EUSB2_TUNE_IUSB2, val);
+		regmap_write(regmap, EUSB2_TUNE_IUSB2, val);
 
 	if (!of_property_read_u8(np, "qcom,tune-res-fsdif", &val))
-		regmap_write(regmap, base + EUSB2_TUNE_RES_FSDIF, val);
+		regmap_write(regmap, EUSB2_TUNE_RES_FSDIF, val);
 
 	if (!of_property_read_s32(np, "qcom,squelch-detector-bp", &dt_val)) {
 		for (i = 0; i < ARRAY_SIZE(squelch_detector); i++) {
 			if (squelch_detector[i] == dt_val) {
-				regmap_write(regmap, base + EUSB2_TUNE_SQUELCH_U, i);
+				regmap_write(regmap, EUSB2_TUNE_SQUELCH_U, i);
 				break;
 			}
 		}
 	}
 
 	/* Wait for status OK */
-	ret = regmap_read_poll_timeout(regmap, base + EUSB2_RPTR_STATUS, poll_val,
+	ret = regmap_read_poll_timeout(regmap, EUSB2_RPTR_STATUS, poll_val,
 				       poll_val & RPTR_OK, 10, 5);
 	if (ret)
 		dev_err(rptr->dev, "initialization timed-out\n");
@@ -197,7 +196,6 @@ static int eusb2_repeater_set_mode(struct phy *phy,
 {
 	struct eusb2_repeater *rptr = phy_get_drvdata(phy);
 	struct regmap *regmap = rptr->regmap;
-	u32 base = rptr->base;
 
 	switch (mode) {
 	case PHY_MODE_USB_HOST:
@@ -206,8 +204,8 @@ static int eusb2_repeater_set_mode(struct phy *phy,
 		 * per eUSB 1.2 Spec. Below implement software workaround until
 		 * PHY and controller is fixing seen observation.
 		 */
-		regmap_write(regmap, base + EUSB2_FORCE_EN_5, F_CLK_19P2M_EN);
-		regmap_write(regmap, base + EUSB2_FORCE_VAL_5, V_CLK_19P2M_EN);
+		regmap_write(regmap, EUSB2_FORCE_EN_5, F_CLK_19P2M_EN);
+		regmap_write(regmap, EUSB2_FORCE_VAL_5, V_CLK_19P2M_EN);
 		break;
 	case PHY_MODE_USB_DEVICE:
 		/*
@@ -216,8 +214,8 @@ static int eusb2_repeater_set_mode(struct phy *phy,
 		 * repeater doesn't clear previous value due to shared
 		 * regulators (say host <-> device mode switch).
 		 */
-		regmap_write(regmap, base + EUSB2_FORCE_EN_5, 0);
-		regmap_write(regmap, base + EUSB2_FORCE_VAL_5, 0);
+		regmap_write(regmap, EUSB2_FORCE_EN_5, 0);
+		regmap_write(regmap, EUSB2_FORCE_VAL_5, 0);
 		break;
 	default:
 		return -EINVAL;
@@ -242,11 +240,18 @@ static const struct phy_ops eusb2_repeater_ops = {
 
 static int eusb2_repeater_probe(struct platform_device *pdev)
 {
+	struct regmap_config eusb2_regmap_config = {
+		.reg_bits = 16,
+		.val_bits = 8,
+		.max_register = 0xff,
+		.fast_io = true,
+	};
+	struct spmi_device *sparent;
 	struct eusb2_repeater *rptr;
+	struct spmi_subdevice *sub_sdev;
 	struct device *dev = &pdev->dev;
 	struct phy_provider *phy_provider;
 	struct device_node *np = dev->of_node;
-	u32 res;
 	int ret;
 
 	rptr = devm_kzalloc(dev, sizeof(*rptr), GFP_KERNEL);
@@ -260,15 +265,21 @@ static int eusb2_repeater_probe(struct platform_device *pdev)
 	if (!rptr->cfg)
 		return -EINVAL;
 
-	rptr->regmap = dev_get_regmap(dev->parent, NULL);
-	if (!rptr->regmap)
+	sparent = spmi_get_parent_spmi_device(dev->parent);
+	if (!sparent)
 		return -ENODEV;
 
-	ret = of_property_read_u32(np, "reg", &res);
+	sub_sdev = devm_spmi_subdevice_alloc_and_add(dev, sparent);
+	if (IS_ERR(sub_sdev))
+		return PTR_ERR(sub_sdev);
+
+	ret = device_property_read_u32(dev, "reg", &eusb2_regmap_config.reg_base);
 	if (ret < 0)
 		return ret;
 
-	rptr->base = res;
+	rptr->regmap = devm_regmap_init_spmi_ext(&sub_sdev->sdev, &eusb2_regmap_config);
+	if (IS_ERR(rptr->regmap))
+		return PTR_ERR(rptr->regmap);
 
 	ret = eusb2_repeater_init_vregs(rptr);
 	if (ret < 0) {
@@ -335,3 +346,4 @@ module_platform_driver(eusb2_repeater_driver);
 
 MODULE_DESCRIPTION("Qualcomm PMIC eUSB2 Repeater driver");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("SPMI");
-- 
2.54.0


