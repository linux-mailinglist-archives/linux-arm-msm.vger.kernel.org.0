Return-Path: <linux-arm-msm+bounces-24816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2459691E673
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 19:19:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0EAA28484D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 17:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8094C16EB48;
	Mon,  1 Jul 2024 17:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ReQDNhpW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79A816EB42
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jul 2024 17:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719854365; cv=none; b=MuqZ12qhcZbHjhq8PRBsuqCHwV2R01N4h6A0FZJr8Bi7Hfji0tuQ8vshrahf9rJaCVQOtRKwfelmFyDnlEn71+FYrJHMfwrfXmVOHRfU9VNPtyizkDd5FCnMbcBM60mFCqFEkjmf9/s8fn4PPCTBtNbijuMmIf2ucLZiYqx9S+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719854365; c=relaxed/simple;
	bh=dqfvYGwmOKhaiFHa1zCpcfeOXkzk+rPswzjvChsg7so=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ANVhSRygkLvDn/j/bQ5ldg2HwkafNyH3UFX4qAKdc/dvvSkpVD7JBGnPo8vNDGUGNg9q2aQfy4qwGMCjUFcSdPENrb5eAUngNRgq6fsNzGJnuBh2T3pRUz71jBF6QZP8aqL8mBGtjKz5m4FOOU6UaY42P8K0NERC1APvurbfo1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ReQDNhpW; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3629c517da9so2652573f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jul 2024 10:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719854361; x=1720459161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mFg/9L3rp+k4GtkOLXisVJYUePHQn+Z+ti8m2E06xN0=;
        b=ReQDNhpWTbRFiLMF4Hr49Gnu7i+sy3KClp048viN/0u6cX3G+ZiwoyDnMqUXdt5s85
         0hMNdALmZgWKct8JhZT4Ogmz/z4Ui3GBBDJyhk+BIBR2fZFFcw58O9OFOgREl1xeDiPj
         UbmiTIYLZ9jb9LEjXWMgYaNCTnV4TRTJ7X6FV3TDYo1LZfuFh6MOQnHXr2BUjhm59L8x
         NXZ4JKXo37GfxcwFWzBYG12nWFLBSw05KGWuPooaaorI6P5qbEwckdfobI2O5SQc0Q3i
         yBJc3kmBpwJUhVtJNPUPEum/V+/HtVSOkTtvyw3aTaAv1cHR9jcFAkjW5zCBvftwJRRz
         JAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719854361; x=1720459161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mFg/9L3rp+k4GtkOLXisVJYUePHQn+Z+ti8m2E06xN0=;
        b=WfCohE/gVOXQrmqjfX3j0CiLNrv5kyEqACa+az53hq/vNq2/9jvx2siOReUaztewAW
         QDu8d68Po42RFK/YxTdc0B6HuS+Cqg3lRkNB0Tj7u4iyOeN0wJe8vHxM4Px+pdipd4IQ
         s6am2BUx6lcY2LrfkSMCPENItknMztwkMpK3lumZzfud76IiStLgHaiMQV/Uv5I0jpVz
         Jb5jjyORh7bz0AleTCLQ4yU+vZVfIczFUcpA0IjSBp3x8XY5Cp2TAq4rehhlcOPXVBX+
         03SzAfHPvJihyKI7upOuD/yAjtmpqC0+lZy/u+KriXJeVbJf+FgyK0vnaxpMEqmLVlcE
         DIeA==
X-Forwarded-Encrypted: i=1; AJvYcCVZEYKZzZiYzGJjxF3Mtry+E7uiZiJDxBV/StlaCDbr07mNhx91tZJjslr4/MlMd6S/wMfo4/xYs9OvluVvGudAmtcZDdG5qU7beVIfDQ==
X-Gm-Message-State: AOJu0YxPqpg/gsVUoO0KUeOF4LPC0WDrJgdyL6Xdp4NwahdROiY34xRT
	v18qJOUBmJNGpRs7Y5fLvcaUka4zTT6mDNoS6BBvTIQ2uoVtVXxa6I1eSaUGx4U=
X-Google-Smtp-Source: AGHT+IHNR1ABH6PKyzk7JMg6Jn5J0bcvxQEYovEtPBYvIHQfTDJs3e3xsSp6WhWeIyvAPFDDKwmFyw==
X-Received: by 2002:a5d:5f56:0:b0:367:437f:1785 with SMTP id ffacd0b85a97d-3677569950bmr5309302f8f.13.1719854360985;
        Mon, 01 Jul 2024 10:19:20 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a112e19sm10581137f8f.116.2024.07.01.10.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 10:19:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ASoC: codecs: aw88395: Simplify with cleanup.h
Date: Mon,  1 Jul 2024 19:19:16 +0200
Message-ID: <20240701171917.596173-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allocate memory, which is being freed at end of the scope, with
scoped/cleanup.h to reduce number of error paths and make code a bit
simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/aw88395/aw88395_lib.c | 51 +++++++++-----------------
 1 file changed, 17 insertions(+), 34 deletions(-)

diff --git a/sound/soc/codecs/aw88395/aw88395_lib.c b/sound/soc/codecs/aw88395/aw88395_lib.c
index f25f6e0d4428..769ca32a5c8e 100644
--- a/sound/soc/codecs/aw88395/aw88395_lib.c
+++ b/sound/soc/codecs/aw88395/aw88395_lib.c
@@ -7,6 +7,7 @@
 // Author: Bruce zhao <zhaolei@awinic.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/crc8.h>
 #include <linux/i2c.h>
 #include "aw88395_lib.h"
@@ -361,11 +362,11 @@ static int aw_dev_parse_raw_dsp_fw(unsigned char *data,	unsigned int data_len,
 static int aw_dev_prof_parse_multi_bin(struct aw_device *aw_dev, unsigned char *data,
 				unsigned int data_len, struct aw_prof_desc *prof_desc)
 {
-	struct aw_bin *aw_bin;
 	int ret;
 	int i;
 
-	aw_bin = devm_kzalloc(aw_dev->dev, data_len + sizeof(struct aw_bin), GFP_KERNEL);
+	struct aw_bin *aw_bin __free(kfree) = kzalloc(data_len + sizeof(struct aw_bin),
+						     GFP_KERNEL);
 	if (!aw_bin)
 		return -ENOMEM;
 
@@ -375,7 +376,7 @@ static int aw_dev_prof_parse_multi_bin(struct aw_device *aw_dev, unsigned char *
 	ret = aw_parsing_bin_file(aw_dev, aw_bin);
 	if (ret < 0) {
 		dev_err(aw_dev->dev, "parse bin failed");
-		goto parse_bin_failed;
+		return ret;
 	}
 
 	for (i = 0; i < aw_bin->all_bin_parse_num; i++) {
@@ -387,10 +388,8 @@ static int aw_dev_prof_parse_multi_bin(struct aw_device *aw_dev, unsigned char *
 					data + aw_bin->header_info[i].valid_data_addr;
 			break;
 		case DATA_TYPE_DSP_REG:
-			if (aw_bin->header_info[i].valid_data_len & 0x01) {
-				ret = -EINVAL;
-				goto parse_bin_failed;
-			}
+			if (aw_bin->header_info[i].valid_data_len & 0x01)
+				return -EINVAL;
 
 			swab16_array((u16 *)(data + aw_bin->header_info[i].valid_data_addr),
 					aw_bin->header_info[i].valid_data_len >> 1);
@@ -402,10 +401,8 @@ static int aw_dev_prof_parse_multi_bin(struct aw_device *aw_dev, unsigned char *
 			break;
 		case DATA_TYPE_DSP_FW:
 		case DATA_TYPE_SOC_APP:
-			if (aw_bin->header_info[i].valid_data_len & 0x01) {
-				ret = -EINVAL;
-				goto parse_bin_failed;
-			}
+			if (aw_bin->header_info[i].valid_data_len & 0x01)
+				return -EINVAL;
 
 			swab16_array((u16 *)(data + aw_bin->header_info[i].valid_data_addr),
 					aw_bin->header_info[i].valid_data_len >> 1);
@@ -422,20 +419,17 @@ static int aw_dev_prof_parse_multi_bin(struct aw_device *aw_dev, unsigned char *
 		}
 	}
 	prof_desc->prof_st = AW88395_PROFILE_OK;
-	ret =  0;
 
-parse_bin_failed:
-	devm_kfree(aw_dev->dev, aw_bin);
-	return ret;
+	return 0;
 }
 
 static int aw_dev_parse_reg_bin_with_hdr(struct aw_device *aw_dev,
 			uint8_t *data, uint32_t data_len, struct aw_prof_desc *prof_desc)
 {
-	struct aw_bin *aw_bin;
 	int ret;
 
-	aw_bin = devm_kzalloc(aw_dev->dev, data_len + sizeof(*aw_bin), GFP_KERNEL);
+	struct aw_bin *aw_bin __free(kfree) = kzalloc(data_len + sizeof(*aw_bin),
+						      GFP_KERNEL);
 	if (!aw_bin)
 		return -ENOMEM;
 
@@ -445,14 +439,13 @@ static int aw_dev_parse_reg_bin_with_hdr(struct aw_device *aw_dev,
 	ret = aw_parsing_bin_file(aw_dev, aw_bin);
 	if (ret < 0) {
 		dev_err(aw_dev->dev, "parse bin failed");
-		goto parse_bin_failed;
+		return ret;
 	}
 
 	if ((aw_bin->all_bin_parse_num != 1) ||
 		(aw_bin->header_info[0].bin_data_type != DATA_TYPE_REGISTER)) {
 		dev_err(aw_dev->dev, "bin num or type error");
-		ret = -EINVAL;
-		goto parse_bin_failed;
+		return -EINVAL;
 	}
 
 	prof_desc->sec_desc[AW88395_DATA_TYPE_REG].data =
@@ -461,15 +454,7 @@ static int aw_dev_parse_reg_bin_with_hdr(struct aw_device *aw_dev,
 				aw_bin->header_info[0].valid_data_len;
 	prof_desc->prof_st = AW88395_PROFILE_OK;
 
-	devm_kfree(aw_dev->dev, aw_bin);
-	aw_bin = NULL;
-
 	return 0;
-
-parse_bin_failed:
-	devm_kfree(aw_dev->dev, aw_bin);
-	aw_bin = NULL;
-	return ret;
 }
 
 static int aw_dev_parse_data_by_sec_type(struct aw_device *aw_dev, struct aw_cfg_hdr *cfg_hdr,
@@ -678,21 +663,21 @@ static int aw_dev_cfg_get_multiple_valid_prof(struct aw_device *aw_dev,
 static int aw_dev_load_cfg_by_hdr(struct aw_device *aw_dev,
 		struct aw_cfg_hdr *prof_hdr)
 {
-	struct aw_all_prof_info *all_prof_info;
 	int ret;
 
-	all_prof_info = devm_kzalloc(aw_dev->dev, sizeof(struct aw_all_prof_info), GFP_KERNEL);
+	struct aw_all_prof_info *all_prof_info __free(kfree) = kzalloc(sizeof(*all_prof_info),
+								       GFP_KERNEL);
 	if (!all_prof_info)
 		return -ENOMEM;
 
 	ret = aw_dev_parse_dev_type(aw_dev, prof_hdr, all_prof_info);
 	if (ret < 0) {
-		goto exit;
+		return ret;
 	} else if (ret == AW88395_DEV_TYPE_NONE) {
 		dev_dbg(aw_dev->dev, "get dev type num is 0, parse default dev");
 		ret = aw_dev_parse_dev_default_type(aw_dev, prof_hdr, all_prof_info);
 		if (ret < 0)
-			goto exit;
+			return ret;
 	}
 
 	switch (aw_dev->prof_data_type) {
@@ -710,8 +695,6 @@ static int aw_dev_load_cfg_by_hdr(struct aw_device *aw_dev,
 	if (!ret)
 		aw_dev->prof_info.prof_name_list = profile_name;
 
-exit:
-	devm_kfree(aw_dev->dev, all_prof_info);
 	return ret;
 }
 
-- 
2.43.0


