Return-Path: <linux-arm-msm+bounces-106888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BbaBh6sAWqdhwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 12:14:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3F050BB4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 12:14:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 720A03046372
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 10:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F13A3D332A;
	Mon, 11 May 2026 10:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FtTM7dCc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690FE3D1CCA;
	Mon, 11 May 2026 10:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778494105; cv=none; b=km4QkGCj2bVnNvx3EkgPgJMqi7WvRhyDgKONmUzx8ix6BjyTuphd7Iblgg8K3sti5qDLKGrBlg1elFAxFg+5oXFeqEmD9LK7av1x9AdGz6GHEVJlLwr9iHuCzZQxG8IVYZce8J3+AzYFdlPoQ3vFQ9OtRWVjSwTi14UjxldVRQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778494105; c=relaxed/simple;
	bh=xGqbaekXBIwazXODc92pEPI3eTzP0CIca9FRsBmggeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tGB1r/wpyiLBt03mLnQwSTD0JmA0cVSdPLN9u6/Pr+13RCuY1t5/tyA41U/M9SKYcLqOQTe99zQqHdXvt8ADwFmLREuaLRYjMjlMX8xoCzFVMh99ykGKtMcvXACCE2DW55/7y/7NreG96U6+3wCsEhofMCAKxg21BlxkkpSqLQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FtTM7dCc; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778494102;
	bh=xGqbaekXBIwazXODc92pEPI3eTzP0CIca9FRsBmggeA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FtTM7dCc4qIA37Nk5W6myNf9v5ZUDRUZyXCkyByCYSan9Julx2ZGOnZRqDB5ATwtY
	 UqlTRoR1xFBKE9J6kcaBNCM4w8/oI5OtzZG466jKiaO+3RNPAn4cWxWkRKJ9jYYGxy
	 r7n1wCyqLXoaRPi9/yvmUHclkJhWznnfViJajZkBwZaE/QVBDgxX7Ju2Ujf5x5NVO7
	 kBjpfRV0MDYBYQROMH4sXf6tglNB//JMYgTQ//u/o4PpzX2jpPOVwg8+3lflo0FY1q
	 kolpyuNB3CHsPjeDiuNC9ZNl7YbOaUSCmFJFPvjyjHIq5QPugwKLQICfagn4l3pUOt
	 7Od5R3xamkiAA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C51CC17E0F7B;
	Mon, 11 May 2026 12:08:20 +0200 (CEST)
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
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH RESEND v8 10/10] iio: adc: qcom-spmi-iadc: Remove regmap R/W wrapper functions
Date: Mon, 11 May 2026 12:08:05 +0200
Message-ID: <20260511100805.121432-11-angelogioacchino.delregno@collabora.com>
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
X-Rspamd-Queue-Id: AD3F050BB4B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,arndb.de,linuxfoundation.org,linaro.org,collabora.com,oss.qualcomm.com,quicinc.com,gmail.com,fairphone.com,vger.kernel.org,lists.infradead.org,huawei.com,intel.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[31];
	TAGGED_FROM(0.00)[bounces-106888-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:mid,collabora.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,huawei.com:email,intel.com:email,linaro.org:email]
X-Rspamd-Action: no action

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
 drivers/iio/adc/qcom-spmi-iadc.c | 83 ++++++++++++--------------------
 1 file changed, 30 insertions(+), 53 deletions(-)

diff --git a/drivers/iio/adc/qcom-spmi-iadc.c b/drivers/iio/adc/qcom-spmi-iadc.c
index 55a09c0e2d5c..503f90b2a5ba 100644
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
@@ -392,10 +369,10 @@ static int iadc_update_offset(struct iadc_chip *iadc)
 
 static int iadc_version_check(struct iadc_chip *iadc)
 {
-	u8 val;
+	u32 val;
 	int ret;
 
-	ret = iadc_read(iadc, IADC_PERPH_TYPE, &val);
+	ret = regmap_read(iadc->regmap, IADC_PERPH_TYPE, &val);
 	if (ret < 0)
 		return ret;
 
@@ -404,7 +381,7 @@ static int iadc_version_check(struct iadc_chip *iadc)
 		return -EINVAL;
 	}
 
-	ret = iadc_read(iadc, IADC_PERPH_SUBTYPE, &val);
+	ret = regmap_read(iadc->regmap, IADC_PERPH_SUBTYPE, &val);
 	if (ret < 0)
 		return ret;
 
@@ -413,7 +390,7 @@ static int iadc_version_check(struct iadc_chip *iadc)
 		return -EINVAL;
 	}
 
-	ret = iadc_read(iadc, IADC_REVISION2, &val);
+	ret = regmap_read(iadc->regmap, IADC_REVISION2, &val);
 	if (ret < 0)
 		return ret;
 
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
2.53.0


