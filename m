Return-Path: <linux-arm-msm+bounces-117262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gwiDIq3TTGqtqQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:23:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F8271A4F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:23:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b="UP/vqWqv";
	dmarc=pass (policy=none) header.from=collabora.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117262-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117262-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A7A9930B1B03
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 10:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6D8A3E5EC2;
	Tue,  7 Jul 2026 10:18:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD29E3E5567;
	Tue,  7 Jul 2026 10:18:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419521; cv=none; b=ntuItwICRK3hrFUdoITb4j1D4A2aU75J7GWaD8jvn5Y2vQPopIfyYySyGCdEvzc+mJu3F9bCm8L6ef0QTc3GnsJvgSJQAt7qPNS57ztZCEJBn71rOF55dAFLPqatMishv+Fwyb9niie12B2kY3UIHgvZpoULe8lmVhQ4ZQZgFx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419521; c=relaxed/simple;
	bh=YA2mBxOneGsKjeXjFnG70P6if1xyN9cruSo+ob7rXL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V7jlE6ZWUETjOriSu+05k+pwkCnTDaUrocxoBqSfKDio9udWVZSqiNCg8MJrf1nbuZMf463HDqeml526iE5qpeA/t3y4Ak3lq7/3myuAk69NJk9ui8C2ZgTHgCWnss8UQ606foON0ncSoihd5TRtsy+85//Dmov+VOhpP+msZ5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UP/vqWqv; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783419518;
	bh=YA2mBxOneGsKjeXjFnG70P6if1xyN9cruSo+ob7rXL8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UP/vqWqvUVJMetgg7SeEwMaBlzvdx2cfJwAAhv+QCbBrvzSrv7twR2V8dXMGGIGDQ
	 j0EK0Y3oCe+Siqx2PeerPomEVHkVZp+IefuP+aDQ4VAJJmPJMQOzW5tE3WpHF2lJRQ
	 2OdbOtLcQrpNQIJBsR6r5OrsSiQEAMBSL2igmjXPW1qgNUZ6bMG7al9hhhpXLA2Qjx
	 VgK3g8W6rmt/Tor+4yR9RHsrwgAj0ZmK4Oyu8iKXzy6Oev+X1BnjyVx9EmghU4SEc6
	 FlVEgirkk9Y5tge7RsJLOzTbcTA+Z4AX2owIlZKvoMZseLjvpaK+TWCOCELYFdvL1q
	 FEFopsJEVcXzA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 471F317E018C;
	Tue, 07 Jul 2026 12:18:37 +0200 (CEST)
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
Subject: [PATCH v11 10/12] misc: qcom-coincell: Migrate to devm_spmi_subdevice_alloc_and_add()
Date: Tue,  7 Jul 2026 12:18:19 +0200
Message-ID: <20260707101821.173319-11-angelogioacchino.delregno@collabora.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117262-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[angelogioacchino.delregno@collabora.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:sboyd@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:srini@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:sre@kernel.org,m:angelogioacchino.delregno@collabora.com,m:krzk@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:quic_wcheng@quicinc.com,m:melody.olvera@oss.qualcomm.com,m:quic_nsekar@quicinc.com,m:ivo.ivanov.ivanov1@gmail.com,m:abelvesa@kernel.org,m:luca.weiss@fairphone.com,m:konrad.dybcio@oss.qualcomm.com,m:mitltlatltl@gmail.com,m:krishna.kurapati@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-pm@vger.kernel.org,m:kernel@collabora.com,m:andriy.shevchenko@intel.com,m:ivoivanovivanov1@gmail.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:from_mime,collabora.com:email,collabora.com:mid,collabora.com:dkim,linuxfoundation.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,intel.com:email,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D1F8271A4F7

Some Qualcomm PMICs integrate a charger for coincells, usually
powering an RTC when external (or main battery) power is missing.

Instead of using the parent SPMI device (the main PMIC) as a kind
of syscon in this driver, register a new SPMI sub-device and
initialize its own regmap with this sub-device's specific base
address, retrieved from the devicetree.

This allows to stop manually adding the register base address to
every R/W call in this driver, as this can be, and is now, handled
by the regmap API instead.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/misc/Kconfig         |  2 ++
 drivers/misc/qcom-coincell.c | 45 +++++++++++++++++++++++++-----------
 2 files changed, 34 insertions(+), 13 deletions(-)

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 390256ed91f4..90947c015179 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -291,6 +291,8 @@ config HP_ILO
 config QCOM_COINCELL
 	tristate "Qualcomm coincell charger support"
 	depends on MFD_SPMI_PMIC || COMPILE_TEST
+	depends on SPMI
+	select REGMAP_SPMI
 	help
 	  This driver supports the coincell block found inside of
 	  Qualcomm PMICs.  The coincell charger provides a means to
diff --git a/drivers/misc/qcom-coincell.c b/drivers/misc/qcom-coincell.c
index 3c57f7429147..5e8030c3e450 100644
--- a/drivers/misc/qcom-coincell.c
+++ b/drivers/misc/qcom-coincell.c
@@ -9,11 +9,11 @@
 #include <linux/of.h>
 #include <linux/regmap.h>
 #include <linux/platform_device.h>
+#include <linux/spmi.h>
 
 struct qcom_coincell {
 	struct device	*dev;
 	struct regmap	*regmap;
-	u32		base_addr;
 };
 
 #define QCOM_COINCELL_REG_RSET		0x44
@@ -35,7 +35,7 @@ static int qcom_coincell_chgr_config(struct qcom_coincell *chgr, int rset,
 	/* if disabling, just do that and skip other operations */
 	if (!enable)
 		return regmap_write(chgr->regmap,
-			  chgr->base_addr + QCOM_COINCELL_REG_ENABLE, 0);
+			  QCOM_COINCELL_REG_ENABLE, 0);
 
 	/* find index for current-limiting resistor */
 	for (i = 0; i < ARRAY_SIZE(qcom_rset_map); i++)
@@ -58,7 +58,7 @@ static int qcom_coincell_chgr_config(struct qcom_coincell *chgr, int rset,
 	}
 
 	rc = regmap_write(chgr->regmap,
-			  chgr->base_addr + QCOM_COINCELL_REG_RSET, i);
+			  QCOM_COINCELL_REG_RSET, i);
 	if (rc) {
 		/*
 		 * This is mainly to flag a bad base_addr (reg) from dts.
@@ -71,19 +71,28 @@ static int qcom_coincell_chgr_config(struct qcom_coincell *chgr, int rset,
 	}
 
 	rc = regmap_write(chgr->regmap,
-		chgr->base_addr + QCOM_COINCELL_REG_VSET, j);
+		QCOM_COINCELL_REG_VSET, j);
 	if (rc)
 		return rc;
 
 	/* set 'enable' register */
 	return regmap_write(chgr->regmap,
-			    chgr->base_addr + QCOM_COINCELL_REG_ENABLE,
+			    QCOM_COINCELL_REG_ENABLE,
 			    QCOM_COINCELL_ENABLE);
 }
 
 static int qcom_coincell_probe(struct platform_device *pdev)
 {
-	struct device_node *node = pdev->dev.of_node;
+	struct regmap_config qcom_coincell_regmap_config = {
+		.reg_bits = 16,
+		.val_bits = 8,
+		.max_register = 0xff,
+		.fast_io = true,
+	};
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->of_node;
+	struct spmi_subdevice *sub_sdev;
+	struct spmi_device *sparent;
 	struct qcom_coincell chgr;
 	u32 rset = 0;
 	u32 vset = 0;
@@ -92,16 +101,25 @@ static int qcom_coincell_probe(struct platform_device *pdev)
 
 	chgr.dev = &pdev->dev;
 
-	chgr.regmap = dev_get_regmap(pdev->dev.parent, NULL);
-	if (!chgr.regmap) {
-		dev_err(chgr.dev, "Unable to get regmap\n");
-		return -EINVAL;
-	}
-
-	rc = of_property_read_u32(node, "reg", &chgr.base_addr);
+	rc = device_property_read_u32(dev, "reg", &qcom_coincell_regmap_config.reg_base);
 	if (rc)
 		return rc;
 
+	sparent = spmi_get_parent_spmi_device(dev->parent);
+	if (!sparent)
+		return -ENODEV;
+
+	sub_sdev = devm_spmi_subdevice_alloc_and_add(dev, sparent);
+	if (IS_ERR(sub_sdev))
+		return PTR_ERR(sub_sdev);
+
+	chgr.regmap = devm_regmap_init_spmi_ext(&sub_sdev->sdev,
+						&qcom_coincell_regmap_config);
+	if (IS_ERR(chgr.regmap)) {
+		dev_err(chgr.dev, "Unable to get regmap\n");
+		return PTR_ERR(chgr.regmap);
+	}
+
 	enable = !of_property_read_bool(node, "qcom,charger-disable");
 
 	if (enable) {
@@ -142,3 +160,4 @@ module_platform_driver(qcom_coincell_driver);
 
 MODULE_DESCRIPTION("Qualcomm PMIC coincell charger driver");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS("SPMI");
-- 
2.54.0


