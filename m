Return-Path: <linux-arm-msm+bounces-22487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A9A905940
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 18:58:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1085B24E3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 16:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47D591822D3;
	Wed, 12 Jun 2024 16:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w66GMBTi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60ECF1822C8
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 16:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718211464; cv=none; b=LEUf0khHWY8R6x1OYmv+eFmjrvSZKk+vlOk6oBDpyDj2pxo5Z4rjaLKwP4qNTGwB3dTEXEP3IGd7u6tANHyrFHeJa/L7s0rlOughu2ljxF9WcK/9WT1jsxfaKyyqQk9JluolKghsWR9F+mqiG6CYGqCAmkxI0Z6yla5AVMy772s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718211464; c=relaxed/simple;
	bh=QS7ScGSvChG6xp5GTpKBp7tDBC6NTj2IN1ffDCw9zis=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cEWWPKA8vtY+xo3eVLGebj5YBZy6qwej9uQmLDl09OfjVRS+w/+3HIYb4nVyPxF0cgR0076PLDJGtIKagRIa5GO0K7zcPrkcJQM0tSc831MDv040tT36Q2/WU+pdq+mnVnVI45NsIV0/d/OXD6ZkNKUrT8486u2onSLaMz8v5OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w66GMBTi; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-57c714a1e24so2963750a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 09:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718211461; x=1718816261; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R2VscKvagWv42zk0rH8fHiJS5R2BnPnKyuPT4PU71oU=;
        b=w66GMBTiIYuIDfgPKTHcum3wACTdPXqf3w2VjA3iLAJ4eirOHseKYynyMxNHgfoYl5
         eXXyZykW6sq0FQQlUJL4FuGYa9bu8lVaIp6KMSQvrVy7Ngiqn6uKg1vWvzLcTv8pvnNP
         Rhr27Vu027ke89qQ0VzByWDx7s9syTsqyEIkFDbVR1+0vZ0NHu83n8/LIR7N6RgLgW7A
         h3aeagMKP6T1M0bpjlAVwK0bhJHuqQJEciV0h55VE0uTBRVJckcppRTWHzXU0u1+7g/y
         7f/CdSLTpbx1KUAaJDIKTV8dhdHECvFeqeLfKkKv39qgQoxKCAXoAUBgisQWctLnYzyY
         pvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718211461; x=1718816261;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R2VscKvagWv42zk0rH8fHiJS5R2BnPnKyuPT4PU71oU=;
        b=J6wxYoVSac4soaz9GdNnO60KJJqwJwno5mQC4Z0OP67YMK9aFJ59pfefdAzOsYxzTP
         e96ngFwAwrRnLKfGWxXZ9BgLlWOpOBuNdLhDVlqqWPLCT+HslLczSVjIzIbWBr3X6+Q7
         /XP92FCFFSThgAdYpONAbde9OB97oNiOjXdZbiuM7u8HzPkZGYL8Nh3OzJCXajGjCHTI
         +WRnOp0N12sa+CEjC4Yr9MkXGwKn8W/8S0NDAoUxNPTVMiWEQ9NzBiZEuU5HTrANJWaV
         7V5qEVb4S4jidZJpsSZpl0hteHhoQJZRUDDxTdUh//KUfiKWvYA/hh2kO4y1SknofzhR
         0hlQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6ea3abYEkDQRogz0Q1jaerhiXjt40g34yPp/rEzcySOJANCl9uWRRPGaZbjQGk4IsM/wLYIGxAyQhGC0d3kjqAsyrOvRrT0EMxSghaQ==
X-Gm-Message-State: AOJu0YyaHqwyyexO0Rn1CYYa9UhMtq5eQvMiyWBs5p40TKogNr7R/iAM
	PohLVMnKDLh2mgV9l7M8NaGem40agm/02hm1UgstCwA/kmJwP+Dhz7IbcDO4Imc=
X-Google-Smtp-Source: AGHT+IGM4yc/dCEC8LphBApl+osZjzqVFWThQMW4KCh/iLJQ2LnUNw777Wua/PKH1brzgkwN6ZTctQ==
X-Received: by 2002:a50:9308:0:b0:57c:947c:f9cf with SMTP id 4fb4d7f45d1cf-57ca975348cmr1464177a12.11.1718211460623;
        Wed, 12 Jun 2024 09:57:40 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57ca8caed84sm1564048a12.43.2024.06.12.09.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:57:39 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Wed, 12 Jun 2024 17:57:21 +0100
Subject: [PATCH v3 1/3] ASoC: codecs: lpass-macro: add helpers to get codec
 version
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-lpass-codec-v25-v1-1-9f40611a1370@linaro.org>
References: <20240612-lpass-codec-v25-v1-0-9f40611a1370@linaro.org>
In-Reply-To: <20240612-lpass-codec-v25-v1-0-9f40611a1370@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Banajit Goswami <bgoswami@quicinc.com>
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org, 
 krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5501;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=QS7ScGSvChG6xp5GTpKBp7tDBC6NTj2IN1ffDCw9zis=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmadOCpFW8pCZXDP3+balgrD4sCE41Hm01FCb6R
 YVwEt0s1/eJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZmnTggAKCRB6of1ZxzRV
 N6i9CACT/QlUOPB5omYnZ6qstzzmu6b25APVOmiYf+JCWDUIxwQ1FQlxpvwCljpgqCEyDZNZ9KY
 cd65GUmNVF6q/5hnX8IDu6J+OIXEEwIOQ1QQPS7hGPPd+mrEQeKrm9GD0EajMrkpyfRz3DeE+0s
 tgTdnOejrCM7VbgN3RqvnHnMVBlS/4kvZw/Id+z0X2rB86Jzg0JjRDNM1SGhsR+1GkRh17bUAlQ
 vuZUh8tn+pKbLWKWKJpV5V5y6QHgb+MtDkstVcpgvPyA2gnuKzFhie1sBgmxQrMkTEm85uw3Ecu
 VEVFPhyMAxkiPgLAXlhY/eGVIyDHeyCiuNpBhSvkIKPqvWYL
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6

LPASS Digital codec have changes in register layout across multiple
versions. Add a proper way read the codec version allowint all the lpass
macro drivers (tx, rx, wsa, va) to configure the registers correctly.

LPASS VA macro has the required registers to read the codec version.
Read the the version and make it available to other lpass codec macros
using the common helper functions.

Existing method of using LPASS IP version is not accurate as the same
the codec versioning is totally independent of LPASS IP block versions.

These helper functions should be able to provide a convient way to get
the codec version, and will help scale the drivers in right direction.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-macro-common.c | 23 +++++++++++++++++++++++
 sound/soc/codecs/lpass-macro-common.h | 35 +++++++++++++++++++++++++++++++++++
 sound/soc/codecs/lpass-va-macro.c     | 29 +++++++++++++++++++++++++++++
 3 files changed, 87 insertions(+)

diff --git a/sound/soc/codecs/lpass-macro-common.c b/sound/soc/codecs/lpass-macro-common.c
index da1b422250b8..8b038a99a8f9 100644
--- a/sound/soc/codecs/lpass-macro-common.c
+++ b/sound/soc/codecs/lpass-macro-common.c
@@ -11,6 +11,9 @@
 
 #include "lpass-macro-common.h"
 
+static DEFINE_MUTEX(lpass_codec_mutex);
+static int lpass_codec_version;
+
 struct lpass_macro *lpass_macro_pds_init(struct device *dev)
 {
 	struct lpass_macro *l_pds;
@@ -66,5 +69,25 @@ void lpass_macro_pds_exit(struct lpass_macro *pds)
 }
 EXPORT_SYMBOL_GPL(lpass_macro_pds_exit);
 
+void lpass_macro_set_codec_version(int version)
+{
+	mutex_lock(&lpass_codec_mutex);
+	lpass_codec_version = version;
+	mutex_unlock(&lpass_codec_mutex);
+}
+EXPORT_SYMBOL_GPL(lpass_macro_set_codec_version);
+
+int lpass_macro_get_codec_version(void)
+{
+	int ver;
+
+	mutex_lock(&lpass_codec_mutex);
+	ver = lpass_codec_version;
+	mutex_unlock(&lpass_codec_mutex);
+
+	return ver;
+}
+EXPORT_SYMBOL_GPL(lpass_macro_get_codec_version);
+
 MODULE_DESCRIPTION("Common macro driver");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index d98718b3dc4b..f6f1bfe8eb77 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -18,6 +18,18 @@ enum lpass_version {
 	LPASS_VER_11_0_0,
 };
 
+enum lpass_codec_version {
+	LPASS_CODEC_VERSION_1_0 = 1,
+	LPASS_CODEC_VERSION_1_1,
+	LPASS_CODEC_VERSION_1_2,
+	LPASS_CODEC_VERSION_2_0,
+	LPASS_CODEC_VERSION_2_1,
+	LPASS_CODEC_VERSION_2_5,
+	LPASS_CODEC_VERSION_2_6,
+	LPASS_CODEC_VERSION_2_7,
+	LPASS_CODEC_VERSION_2_8,
+};
+
 struct lpass_macro {
 	struct device *macro_pd;
 	struct device *dcodec_pd;
@@ -25,5 +37,28 @@ struct lpass_macro {
 
 struct lpass_macro *lpass_macro_pds_init(struct device *dev);
 void lpass_macro_pds_exit(struct lpass_macro *pds);
+void lpass_macro_set_codec_version(int version);
+int lpass_macro_get_codec_version(void);
+
+static inline const char *lpass_macro_get_codec_version_string(int version)
+{
+	switch (version) {
+	case LPASS_CODEC_VERSION_2_0:
+		return "v2.0";
+	case LPASS_CODEC_VERSION_2_1:
+		return "v2.1";
+	case LPASS_CODEC_VERSION_2_5:
+		return "v2.5";
+	case LPASS_CODEC_VERSION_2_6:
+		return "v2.6";
+	case LPASS_CODEC_VERSION_2_7:
+		return "v2.7";
+	case LPASS_CODEC_VERSION_2_8:
+		return "v2.8";
+	default:
+		break;
+	}
+	return "NA";
+}
 
 #endif /* __LPASS_MACRO_COMMON_H__ */
diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 6eceeff10bf6..0ae9e6377e3a 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1461,6 +1461,33 @@ static int va_macro_validate_dmic_sample_rate(u32 dmic_sample_rate,
 	return dmic_sample_rate;
 }
 
+static void va_macro_set_lpass_codec_version(struct va_macro *va)
+{
+	int core_id_0 = 0, core_id_1 = 0, core_id_2 = 0, version;
+
+	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_0, &core_id_0);
+	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_1, &core_id_1);
+	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_2, &core_id_2);
+
+	if ((core_id_0 == 0x01) && (core_id_1 == 0x0F))
+		version = LPASS_CODEC_VERSION_2_0;
+	if ((core_id_0 == 0x02) && (core_id_1 == 0x0E))
+		version = LPASS_CODEC_VERSION_2_1;
+	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x50 || core_id_2 == 0x51))
+		version = LPASS_CODEC_VERSION_2_5;
+	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x60 || core_id_2 == 0x61))
+		version = LPASS_CODEC_VERSION_2_6;
+	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x70 || core_id_2 == 0x71))
+		version = LPASS_CODEC_VERSION_2_7;
+	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x80 || core_id_2 == 0x81))
+		version = LPASS_CODEC_VERSION_2_8;
+
+	lpass_macro_set_codec_version(version);
+
+	dev_info(va->dev, "LPASS Codec Version %s\n",
+			lpass_macro_get_codec_version_string(version));
+}
+
 static int va_macro_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1554,6 +1581,8 @@ static int va_macro_probe(struct platform_device *pdev)
 			goto err_npl;
 	}
 
+	va_macro_set_lpass_codec_version(va);
+
 	if (va->has_swr_master) {
 		/* Set default CLK div to 1 */
 		regmap_update_bits(va->regmap, CDC_VA_TOP_CSR_SWR_MIC_CTL0,

-- 
2.25.1


