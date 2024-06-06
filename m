Return-Path: <linux-arm-msm+bounces-21915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3F58FE675
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 14:26:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50B401F245DC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 12:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148E119599A;
	Thu,  6 Jun 2024 12:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OXwF1t4D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDC41850B6
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 12:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717676784; cv=none; b=njjuxcniJD2PxcdmiInmM2VHK2NF8tQ4dqILeBoICwdv9dQvFgb5WM4Nk7J9g0lhyziFxASe2cjzw7OmjEZ31R3M0DvIxeiAjIvR+/inUX7kxYeOz0d9jCuk8eAfJ6YK6G80jE/9h0Ek3Rm1mShPf8eJwzFVJ9vBiyJJ7ic7l4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717676784; c=relaxed/simple;
	bh=nFhoqr2wMY0whfkoabem9irTKvdC4/rV+7S2nXCIz4s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mTJCJ5HjTh1dyrFrNMwhMeIBu3StFbiHni0f7TwOVfNniLqXYKN+tP3haQ9IvUwCz063AuTN8MFq91HvMw42MYHCRpXS1NYNFx+HYmre5QlgUdL+oZhFOaQlxUbWq06qofdTKBjFPw16rVIITuLVYJBUVsuLnVrYyWNUYLhFIC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OXwF1t4D; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42163fa630aso426765e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 05:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717676780; x=1718281580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1VkxcrZpp4kvTeXW7bP9jyRSyfs9NM9XyTq3inohO0=;
        b=OXwF1t4D9739IQePG1ti0qs1yzpNsk+jypDObbxnf/eHFeC6QMo9F+Z00lRzBqPoh1
         HBu967w4lBu9ZEm2cgWN7ZoTl3j1CERiAn8Zt66lrO12EuSWsKGDc+pawSTT3+f2uOrG
         73Nl7xZyBIndD6Xib8Do+qALEVl1pXirysKh+Ncn+ov+trj984XxfIGJ+LPZS9yuMYof
         e3OfDalnK42uoCeMsaqfxjmyivuSB1RJ+GhI2EINZMMr/2bq96IjUZyP0/nbElCe8bbe
         i0edBwG5q3JvbiGA5PUNdHBq/Iob3CQUC0uGyA0AdVPkgvfboHwjFIKHaB9SM/Yz6uCJ
         YlyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717676780; x=1718281580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s1VkxcrZpp4kvTeXW7bP9jyRSyfs9NM9XyTq3inohO0=;
        b=XLpHp1WUq0RO7y4jl2kxre3ArilRdjPuNUbo9MThgK/0E6VyCCTqDcRxVbjTvAx3CT
         dDU0VnA7XJbDkB5xkSHbY6nJG8FaOj6dkqvxtATP9B2qkh5beUxc4P1djs682m6vTAlr
         jtKa3b0R6wXcxWv0sQQVEcUVbhoxATxDtswbRjT1zNkYNta8n/HS7MuFmGbnAiZruNKd
         LW8+1ZLSgcBz8gWpWLfSFYCWnBR2ki1K1kHSfpTHeCrDGWsAzF9OovZsGiUTvXAFd6CU
         vHfDKyIvJpiHpnHrlf+79IQoLlf5FtHgE3sXhpBEQ+oonqbZnw7avN49y2HnmvuCtWb8
         JH9w==
X-Forwarded-Encrypted: i=1; AJvYcCVPE5czPvIZ2nbUhudKVyPWMLH6EKlpOsmgm5FF6UdMXLgSQs22Vl2fP1weHd6gWAKGq1+p7ALhAVZBbeFc8HJbwKwBxmV61T0Z7f7img==
X-Gm-Message-State: AOJu0YxXzKJYsLJ2/5I93prHGrk+T4I82b5PivOEjJp6gR56B88qWn6s
	bhz/+UplWnPIUX07W4QFLmD1rm5gAyORXdj2Tihj8TUYhMLPlk7TNdXGhjepQaY=
X-Google-Smtp-Source: AGHT+IFYvdUuHBNDMes2MT9Yl3Cwenx25oAenPp97LW2+dMe2ZDRFwQqBUtrPymBHEUXEvXS2p/PGA==
X-Received: by 2002:a05:600c:1da1:b0:421:1d5:c0a3 with SMTP id 5b1f17b1804b1-42156351b48mr45599345e9.28.1717676779622;
        Thu, 06 Jun 2024 05:26:19 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4216412972fsm275325e9.47.2024.06.06.05.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 05:26:18 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	lgirdwood@gmail.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	krzk+dt@kernel.org,
	neil.armstrong@linaro.org,
	krzysztof.kozlowski@linaro.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 1/2] ASoC: codecs: lpass-macro: add helpers to get codec version
Date: Thu,  6 Jun 2024 13:25:58 +0100
Message-Id: <20240606122559.116698-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240606122559.116698-1-srinivas.kandagatla@linaro.org>
References: <20240606122559.116698-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5254; i=srinivas.kandagatla@linaro.org; h=from:subject; bh=SVW44utVjXNuFZ+AypBWA7rXwY5vRIX97O/MMF4uf9s=; b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmYarX1Kwrp4yWxHLOe/EW1JkSYs+Bk1zuaPMAn INHrpzyxzCJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZmGq1wAKCRB6of1ZxzRV N7vcCACz6rY+yaz6h4BXF37jugKcZemEzbE09Ij7IgQiw+yIeGl+ZPUevNTssCSVsa+xxhT0ydX NDWD0BfkaTMVVoYhkK0jDGGK9SRkKEHKBhjqYGi3r8EO6u+/KVNxYnEIZj7Hy6gS+hBm2fRFBxp Mcr1b+DIcTm8ix2tY6QYC3IuSDEf3XnHmM6rke2wccewGoaaIsOWyU/h1gTYkPjxj6X5/oUqdff WU7t+PrMBaTZdrwkYCSNSghhFLYQo3vu7/pMbgSo7b6gnT/AHIpA2UQbVealQSTPnc1GtsHUGp3 xHNI8OymXQNiU6O17CcFVMjQo5edypZtlnt+TZsbIUeGBoD1
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp; fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

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
 sound/soc/codecs/lpass-macro-common.c | 14 +++++++++++
 sound/soc/codecs/lpass-macro-common.h | 35 +++++++++++++++++++++++++++
 sound/soc/codecs/lpass-va-macro.c     | 29 ++++++++++++++++++++++
 3 files changed, 78 insertions(+)

diff --git a/sound/soc/codecs/lpass-macro-common.c b/sound/soc/codecs/lpass-macro-common.c
index da1b422250b8..a640bf88a6cd 100644
--- a/sound/soc/codecs/lpass-macro-common.c
+++ b/sound/soc/codecs/lpass-macro-common.c
@@ -11,6 +11,8 @@
 
 #include "lpass-macro-common.h"
 
+static int lpass_codec_version;
+
 struct lpass_macro *lpass_macro_pds_init(struct device *dev)
 {
 	struct lpass_macro *l_pds;
@@ -66,5 +68,17 @@ void lpass_macro_pds_exit(struct lpass_macro *pds)
 }
 EXPORT_SYMBOL_GPL(lpass_macro_pds_exit);
 
+void lpass_macro_set_codec_version(int version)
+{
+	lpass_codec_version = version;
+}
+EXPORT_SYMBOL_GPL(lpass_macro_set_codec_version);
+
+int lpass_macro_get_codec_version(void)
+{
+	return lpass_codec_version;
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
2.21.0


