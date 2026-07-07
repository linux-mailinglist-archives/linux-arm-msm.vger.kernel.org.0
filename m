Return-Path: <linux-arm-msm+bounces-117264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZX63CfHTTGrHqQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:24:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ACF71A542
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:24:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=iPCljxGj;
	dmarc=pass (policy=none) header.from=collabora.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117264-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117264-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0FF7230C3C57
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 10:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702663E7160;
	Tue,  7 Jul 2026 10:18:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DB63E5EF7;
	Tue,  7 Jul 2026 10:18:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419524; cv=none; b=CEl+C7f+prhCxPWJS2Loju3ftqz2RXxu5ymyZwYla+dd0DoqPC3HyCq9KZO5a3Oojn6GMF+Iwz4sSnlJ9V3pMUkKnNd8CZHcjzHFeAmU7Cn3vT4ruyNyahG8tBcxic4ObT5iENl8SX6G4Y1XpUBafJ1gk2cueFs/dgaZeQFWnwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419524; c=relaxed/simple;
	bh=rN5cO27Z+Vgzw6e0TYdRDp7g5zASFKfeaDG26p8WB7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BgMqoqXlB+BKCc1Xs5F7EfvjM0RE+8VvjuBf1QoHkiHaJg8KYoGXetszLAH/ky6GMXczOdPMRAbqPRrQuHxvE7tYhVS7VDSPe29OhEw0Nyhjnf95THMXog6uJK2DeimlQH+YiDx4kkbj0bzRg5YoX1e1G2KWQcF0zoSdCF5raOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=iPCljxGj; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783419520;
	bh=rN5cO27Z+Vgzw6e0TYdRDp7g5zASFKfeaDG26p8WB7I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iPCljxGj6xr8l5keNpOW4QemGUi6PWB0xo88xYTZ12h3vK34x1IS5dJFlQbwxqPHY
	 cAqkwx8eJkiznVROfnfibARhbjWiltWB9c/K9Ua1JH07587IR6eI++A492gLNfnhMQ
	 xbUjnEpL4QRsKttcZS3w93wQlRwEjkjqaEStyYuuPis8uzLx9zeKSzxAWwrz5zJf8g
	 B8QZj8KeCSayiAWJD61F9U9OdK3zn/osIUKmD2798Kkllm6mBx88NPXGswZMu+gYhx
	 sa6mmhXPiOXKZX+CIUn1B8IaoPbvXbAo8DIhw9Q4lBsOzQqan60a6VvxJHdqLcVrtA
	 PgW0BW7ITK1jg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B208317E05D3;
	Tue, 07 Jul 2026 12:18:39 +0200 (CEST)
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
Subject: [PATCH v11 12/12] iio: adc: qcom-spmi-iadc: Remove regmap R/W wrapper functions
Date: Tue,  7 Jul 2026 12:18:21 +0200
Message-ID: <20260707101821.173319-13-angelogioacchino.delregno@collabora.com>
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
	TAGGED_FROM(0.00)[bounces-117264-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,intel.com:email,huawei.com:email,collabora.com:from_mime,collabora.com:email,collabora.com:mid,collabora.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A0ACF71A542

This driver doesn't need to add any register base address to any
regmap call anymore since it was migrated to register as a SPMI
subdevice with its own regmap reg_base, which makes the regmap
API to automatically add such base address internally.

Since the iadc_{read,write,read_result}() functions now only do
call regmap_{read,write,bulk_read}() and nothing else, simplify
the driver by removing them and by calling regmap APIs directly.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/iio/adc/qcom-spmi-iadc.c | 89 ++++++++++++--------------------
 1 file changed, 33 insertions(+), 56 deletions(-)

diff --git a/drivers/iio/adc/qcom-spmi-iadc.c b/drivers/iio/adc/qcom-spmi-iadc.c
index 71049cdc2765..aacf570eadca 100644
--- a/drivers/iio/adc/qcom-spmi-iadc.c
+++ b/drivers/iio/adc/qcom-spmi-iadc.c
@@ -113,77 +113,59 @@ struct iadc_chip {
 	struct completion complete;
 };
 
-static int iadc_read(struct iadc_chip *iadc, u16 offset, u8 *data)
-{
-	unsigned int val;
-	int ret;
-
-	ret = regmap_read(iadc->regmap, offset, &val);
-	if (ret < 0)
-		return ret;
-
-	*data = val;
-	return 0;
-}
-
-static int iadc_write(struct iadc_chip *iadc, u16 offset, u8 data)
-{
-	return regmap_write(iadc->regmap, offset, data);
-}
-
 static int iadc_reset(struct iadc_chip *iadc)
 {
-	u8 data;
+	u32 data;
 	int ret;
 
-	ret = iadc_write(iadc, IADC_SEC_ACCESS, IADC_SEC_ACCESS_DATA);
+	ret = regmap_write(iadc->regmap, IADC_SEC_ACCESS, IADC_SEC_ACCESS_DATA);
 	if (ret < 0)
 		return ret;
 
-	ret = iadc_read(iadc, IADC_PERH_RESET_CTL3, &data);
+	ret = regmap_read(iadc->regmap, IADC_PERH_RESET_CTL3, &data);
 	if (ret < 0)
 		return ret;
 
-	ret = iadc_write(iadc, IADC_SEC_ACCESS, IADC_SEC_ACCESS_DATA);
+	ret = regmap_write(iadc->regmap, IADC_SEC_ACCESS, IADC_SEC_ACCESS_DATA);
 	if (ret < 0)
 		return ret;
 
 	data |= IADC_FOLLOW_WARM_RB;
 
-	return iadc_write(iadc, IADC_PERH_RESET_CTL3, data);
+	return regmap_write(iadc->regmap, IADC_PERH_RESET_CTL3, data);
 }
 
 static int iadc_set_state(struct iadc_chip *iadc, bool state)
 {
-	return iadc_write(iadc, IADC_EN_CTL1, state ? IADC_EN_CTL1_SET : 0);
+	return regmap_write(iadc->regmap, IADC_EN_CTL1, state ? IADC_EN_CTL1_SET : 0);
 }
 
 static void iadc_status_show(struct iadc_chip *iadc)
 {
-	u8 mode, sta1, chan, dig, en, req;
+	u32 mode, sta1, chan, dig, en, req;
 	int ret;
 
-	ret = iadc_read(iadc, IADC_MODE_CTL, &mode);
+	ret = regmap_read(iadc->regmap, IADC_MODE_CTL, &mode);
 	if (ret < 0)
 		return;
 
-	ret = iadc_read(iadc, IADC_DIG_PARAM, &dig);
+	ret = regmap_read(iadc->regmap, IADC_DIG_PARAM, &dig);
 	if (ret < 0)
 		return;
 
-	ret = iadc_read(iadc, IADC_CH_SEL_CTL, &chan);
+	ret = regmap_read(iadc->regmap, IADC_CH_SEL_CTL, &chan);
 	if (ret < 0)
 		return;
 
-	ret = iadc_read(iadc, IADC_CONV_REQ, &req);
+	ret = regmap_read(iadc->regmap, IADC_CONV_REQ, &req);
 	if (ret < 0)
 		return;
 
-	ret = iadc_read(iadc, IADC_STATUS1, &sta1);
+	ret = regmap_read(iadc->regmap, IADC_STATUS1, &sta1);
 	if (ret < 0)
 		return;
 
-	ret = iadc_read(iadc, IADC_EN_CTL1, &en);
+	ret = regmap_read(iadc->regmap, IADC_EN_CTL1, &en);
 	if (ret < 0)
 		return;
 
@@ -199,34 +181,34 @@ static int iadc_configure(struct iadc_chip *iadc, int channel)
 
 	/* Mode selection */
 	mode = (IADC_OP_MODE_NORMAL << IADC_OP_MODE_SHIFT) | IADC_TRIM_EN;
-	ret = iadc_write(iadc, IADC_MODE_CTL, mode);
+	ret = regmap_write(iadc->regmap, IADC_MODE_CTL, mode);
 	if (ret < 0)
 		return ret;
 
 	/* Channel selection */
-	ret = iadc_write(iadc, IADC_CH_SEL_CTL, channel);
+	ret = regmap_write(iadc->regmap, IADC_CH_SEL_CTL, channel);
 	if (ret < 0)
 		return ret;
 
 	/* Digital parameter setup */
 	decim = IADC_DEF_DECIMATION << IADC_DIG_DEC_RATIO_SEL_SHIFT;
-	ret = iadc_write(iadc, IADC_DIG_PARAM, decim);
+	ret = regmap_write(iadc->regmap, IADC_DIG_PARAM, decim);
 	if (ret < 0)
 		return ret;
 
 	/* HW settle time delay */
-	ret = iadc_write(iadc, IADC_HW_SETTLE_DELAY, IADC_DEF_HW_SETTLE_TIME);
+	ret = regmap_write(iadc->regmap, IADC_HW_SETTLE_DELAY, IADC_DEF_HW_SETTLE_TIME);
 	if (ret < 0)
 		return ret;
 
-	ret = iadc_write(iadc, IADC_FAST_AVG_CTL, IADC_DEF_AVG_SAMPLES);
+	ret = regmap_write(iadc->regmap, IADC_FAST_AVG_CTL, IADC_DEF_AVG_SAMPLES);
 	if (ret < 0)
 		return ret;
 
 	if (IADC_DEF_AVG_SAMPLES)
-		ret = iadc_write(iadc, IADC_FAST_AVG_EN, IADC_FAST_AVG_EN_SET);
+		ret = regmap_write(iadc->regmap, IADC_FAST_AVG_EN, IADC_FAST_AVG_EN_SET);
 	else
-		ret = iadc_write(iadc, IADC_FAST_AVG_EN, 0);
+		ret = regmap_write(iadc->regmap, IADC_FAST_AVG_EN, 0);
 
 	if (ret < 0)
 		return ret;
@@ -239,19 +221,19 @@ static int iadc_configure(struct iadc_chip *iadc, int channel)
 		return ret;
 
 	/* Request conversion */
-	return iadc_write(iadc, IADC_CONV_REQ, IADC_CONV_REQ_SET);
+	return regmap_write(iadc->regmap, IADC_CONV_REQ, IADC_CONV_REQ_SET);
 }
 
 static int iadc_poll_wait_eoc(struct iadc_chip *iadc, unsigned int interval_us)
 {
 	unsigned int count, retry;
+	u32 sta1;
 	int ret;
-	u8 sta1;
 
 	retry = interval_us / IADC_CONV_TIME_MIN_US;
 
 	for (count = 0; count < retry; count++) {
-		ret = iadc_read(iadc, IADC_STATUS1, &sta1);
+		ret = regmap_read(iadc->regmap, IADC_STATUS1, &sta1);
 		if (ret < 0)
 			return ret;
 
@@ -267,11 +249,6 @@ static int iadc_poll_wait_eoc(struct iadc_chip *iadc, unsigned int interval_us)
 	return -ETIMEDOUT;
 }
 
-static int iadc_read_result(struct iadc_chip *iadc, u16 *data)
-{
-	return regmap_bulk_read(iadc->regmap, IADC_DATA, data, 2);
-}
-
 static int iadc_do_conversion(struct iadc_chip *iadc, int chan, u16 *data)
 {
 	unsigned int wait;
@@ -296,7 +273,7 @@ static int iadc_do_conversion(struct iadc_chip *iadc, int chan, u16 *data)
 	}
 
 	if (!ret)
-		ret = iadc_read_result(iadc, data);
+		ret = regmap_bulk_read(iadc->regmap, IADC_DATA, data, sizeof(*data));
 exit:
 	iadc_set_state(iadc, false);
 	if (ret < 0)
@@ -392,33 +369,33 @@ static int iadc_update_offset(struct iadc_chip *iadc)
 
 static int iadc_version_check(struct iadc_chip *iadc)
 {
-	u8 val;
+	u32 val;
 	int ret;
 
-	ret = iadc_read(iadc, IADC_PERPH_TYPE, &val);
+	ret = regmap_read(iadc->regmap, IADC_PERPH_TYPE, &val);
 	if (ret < 0)
 		return ret;
 
 	if (val < IADC_PERPH_TYPE_ADC) {
-		dev_err(iadc->dev, "%d is not ADC\n", val);
+		dev_err(iadc->dev, "%u is not ADC\n", val);
 		return -EINVAL;
 	}
 
-	ret = iadc_read(iadc, IADC_PERPH_SUBTYPE, &val);
+	ret = regmap_read(iadc->regmap, IADC_PERPH_SUBTYPE, &val);
 	if (ret < 0)
 		return ret;
 
 	if (val < IADC_PERPH_SUBTYPE_IADC) {
-		dev_err(iadc->dev, "%d is not IADC\n", val);
+		dev_err(iadc->dev, "%u is not IADC\n", val);
 		return -EINVAL;
 	}
 
-	ret = iadc_read(iadc, IADC_REVISION2, &val);
+	ret = regmap_read(iadc->regmap, IADC_REVISION2, &val);
 	if (ret < 0)
 		return ret;
 
 	if (val < IADC_REVISION2_SUPPORTED_IADC) {
-		dev_err(iadc->dev, "revision %d not supported\n", val);
+		dev_err(iadc->dev, "revision %u not supported\n", val);
 		return -EINVAL;
 	}
 
@@ -428,7 +405,7 @@ static int iadc_version_check(struct iadc_chip *iadc)
 static int iadc_rsense_read(struct iadc_chip *iadc, struct device_node *node)
 {
 	int ret, sign, int_sense;
-	u8 deviation;
+	u32 deviation;
 
 	ret = of_property_read_u32(node, "qcom,external-resistor-micro-ohms",
 				   &iadc->rsense[IADC_EXT_RSENSE]);
@@ -440,7 +417,7 @@ static int iadc_rsense_read(struct iadc_chip *iadc, struct device_node *node)
 		return -EINVAL;
 	}
 
-	ret = iadc_read(iadc, IADC_NOMINAL_RSENSE, &deviation);
+	ret = regmap_read(iadc->regmap, IADC_NOMINAL_RSENSE, &deviation);
 	if (ret < 0)
 		return ret;
 
-- 
2.54.0


