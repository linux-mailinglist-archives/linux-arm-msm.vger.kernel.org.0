Return-Path: <linux-arm-msm+bounces-22489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E31905945
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 18:58:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C6C62849F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 16:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AAC2183068;
	Wed, 12 Jun 2024 16:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BOyQSQS4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C54E1822E0
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 16:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718211467; cv=none; b=uDgEj2QgHdlh/91h6he3luPs0lA8p1AFalh6qssPl1BDAM06gGIxsTkEZ87xxUubz4c2Iwgd4KN0oix4v2kiMBrv8vLjhQX6o0MF0hSITXnlMpBtKVHX6uFi7UhZfcTywqEzy/0ROP729CmWhaRmML8X0U8Vi385p35DJaQF6XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718211467; c=relaxed/simple;
	bh=JFf1ba0LvJEf5aBHNYT8wbt+1/NIJ/KqCRlLVk+FoEM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WrUS1L6dWrSKWE7oLQIyzlxQIfadDXmxvp4VgVgsAuGEvllj0GTu5Ow+o21JxO+FMGd5AIX5aWWFj8JuEOQmuoc46Xyc8QtktZb3j+7C2xTddr7Kzb1XJEIXA1j+dYh6w2yeVmKo1zmDivqa+/c8+EZk6eAyBSydrCi+x+M2bZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BOyQSQS4; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a6efacd25ecso7182266b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 09:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718211463; x=1718816263; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hA8Uv19Nou90pANNoqLSi6bCqQmJ/2mZDqEZRolGRzU=;
        b=BOyQSQS4i6CKxXdGC6z7Hf8OiwiMcHougASP5wajgluID8AkkYr1cHUyBmbYMNHQx/
         c5y1bkwwisrvtAFjZuLuBOBUU2PSYn0hvHN1kMCTHzFPRTJUUF1VkvRuv3rv57uhVWYW
         /cXnsvxkZ9hDkeqFfvmMxt+5TFem7CiAeZ/DY8+CJTB05gwdjRkXp+qIvi79l0a1Sxmx
         OKeN7z0qwfgOHmKkqgj7JncPTWkOCbU6xnaxqFslR9eIoTvNgj3zj19HL5v1/mLw3wn9
         Oyma3QL7oI7oiEv5YmZF0wBBtskH/y3+vedQlvoyjyfha6RGfKK/vKqKQQiDtGS7qTH9
         FkeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718211463; x=1718816263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hA8Uv19Nou90pANNoqLSi6bCqQmJ/2mZDqEZRolGRzU=;
        b=DOWIuq2/SGeOpv3eAXLBVkMdIvIGJQRRyuoa9t3B7TfdJLJVjhkYjpRwHgwOk1mI+G
         52n+bX/xW7EqR2RM2IdnN5fA0+IaU30f2YToJAUxiAavm3EYVe7cPQd5V/1+hZGYvbXf
         cFx41Xo0hPBMCu8czILmHFxa41v5dEDQsleaQZ/gUoPEvWnClzzVQaOyIvI2s5kw4ONT
         Ege4WGV97gKfhSS8nNvkSd2yIAuYWmmblsCkLjN5RpKUZOdLYg7p6W4phyYl3KaawYfJ
         DIFEUiRNZZ0tbkfmRwx01bViG7wYq8ok5uDMdw8skWZ1j05Xkk7sAPJYri1DJ6UFpox9
         wI1w==
X-Forwarded-Encrypted: i=1; AJvYcCU7A49FBSTrv2MZAJmtUAxaKl0+T36HXKw9sILsPegKC7BFdndnlKQj/WXB0QLbiVwBuE2g0yGzIFx/9f94XWlK2YpKFkkXkL9kq145AQ==
X-Gm-Message-State: AOJu0Yyjz0d+EkVWK7JIwy52l7wPoZa84pV28uvQky+53MWnGTGLggt8
	2ro4+RTSumTRnoRoK7Wfex/IandESlGb5qKpR0rQyaNgU194nffQdflgQy1q5IChDCnn7Eh3/yv
	jGYQ=
X-Google-Smtp-Source: AGHT+IEvN40LYBhiGduch21LlwUW8L7Qas7F4e+pTKoBtX+TR8FU4F2MiXYFCNAok9YDpbxMXx2/mw==
X-Received: by 2002:a50:f68b:0:b0:579:d673:4e67 with SMTP id 4fb4d7f45d1cf-57caab12c4fmr1835950a12.26.1718211463429;
        Wed, 12 Jun 2024 09:57:43 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57ca8caed84sm1564048a12.43.2024.06.12.09.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:57:42 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Wed, 12 Jun 2024 17:57:23 +0100
Subject: [PATCH v3 3/3] ASoC: codec: lpass-rx-macro: add support for 2.5
 codec version
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-lpass-codec-v25-v1-3-9f40611a1370@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12605;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=JFf1ba0LvJEf5aBHNYT8wbt+1/NIJ/KqCRlLVk+FoEM=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmadOCYBs0U1bF5QvwZq8fi2Ul4FGUYXCdv57mB
 RPb53pp6zqJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZmnTggAKCRB6of1ZxzRV
 N/r7CACU5WHkmH8TU2jhyoeoVzmvu4rAd+hI2SZJLK795y1H1gsywfX72jxpZGApjQoF9oAilnb
 n85QAX2guUbWvm1GDRx8qfDxD1kc/qf3QRIwIcEi+2kp4aXlXBqhh/mZCJeUy3efisH0p7bfhy2
 mJjq26ramTo0Eor6wKoISlvU1FEvRTEQyU0UP17c1ENo/+ukggL9pbs/sKYcN9UPlqKw31/eimw
 QbGtG2OgPH05T5SFP/VKurIfJJ0GOoQhI26Eyl//qBq91C+SPZ19SzpI8X9lDW6F4SYuaXbrbYJ
 MYU8/LgU8dCwmaks/ETk6fBijGlpTnErxTY7WjMuYAq3dz5U
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6

LPASS Codec v2.5 has significant changes in the rx register strides.
Due to this headset playback on SM8550, SM8650, x1e80100 and all SoCs
after SM8450 have only Left working.

This patch adjusts the registers to accomdate 2.5 changes. With this
fixed now L and R are functional on Headset playback.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 220 +++++++++++++++++++++++++++++++++++---
 1 file changed, 207 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 8beeacbd6ae6..7e8bb005b0b9 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -262,6 +262,53 @@
 #define CDC_RX_RX2_RX_PATH_MIX_SEC0	(0x0544)
 #define CDC_RX_RX2_RX_PATH_MIX_SEC1	(0x0548)
 #define CDC_RX_RX2_RX_PATH_DSM_CTL	(0x054C)
+
+/* LPASS CODEC version 2.5 rx reg offsets */
+#define CDC_2_5_RX_RX1_RX_PATH_CTL		(0x04c0)
+#define CDC_2_5_RX_RX1_RX_PATH_CFG0		(0x04c4)
+#define CDC_2_5_RX_RX1_RX_PATH_CFG1		(0x04c8)
+#define CDC_2_5_RX_RX1_RX_PATH_CFG2		(0x04cC)
+#define CDC_2_5_RX_RX1_RX_PATH_CFG3		(0x04d0)
+#define CDC_2_5_RX_RX1_RX_VOL_CTL		(0x04d4)
+#define CDC_2_5_RX_RX1_RX_PATH_MIX_CTL		(0x04d8)
+#define CDC_2_5_RX_RX1_RX_PATH_MIX_CFG		(0x04dC)
+#define CDC_2_5_RX_RX1_RX_VOL_MIX_CTL		(0x04e0)
+#define CDC_2_5_RX_RX1_RX_PATH_SEC1		(0x04e4)
+#define CDC_2_5_RX_RX1_RX_PATH_SEC2		(0x04e8)
+#define CDC_2_5_RX_RX1_RX_PATH_SEC3		(0x04eC)
+#define CDC_2_5_RX_RX1_RX_PATH_SEC4		(0x04f0)
+#define CDC_2_5_RX_RX1_RX_PATH_SEC7		(0x04f4)
+#define CDC_2_5_RX_RX1_RX_PATH_MIX_SEC0		(0x04f8)
+#define CDC_2_5_RX_RX1_RX_PATH_MIX_SEC1		(0x04fC)
+#define CDC_2_5_RX_RX1_RX_PATH_DSM_CTL		(0x0500)
+#define CDC_2_5_RX_RX1_RX_PATH_DSM_DATA1	(0x0504)
+#define CDC_2_5_RX_RX1_RX_PATH_DSM_DATA2	(0x0508)
+#define CDC_2_5_RX_RX1_RX_PATH_DSM_DATA3	(0x050C)
+#define CDC_2_5_RX_RX1_RX_PATH_DSM_DATA4	(0x0510)
+#define CDC_2_5_RX_RX1_RX_PATH_DSM_DATA5	(0x0514)
+#define CDC_2_5_RX_RX1_RX_PATH_DSM_DATA6	(0x0518)
+
+#define CDC_2_5_RX_RX2_RX_PATH_CTL		(0x0580)
+#define CDC_2_5_RX_RX2_RX_PATH_CFG0		(0x0584)
+#define CDC_2_5_RX_RX2_RX_PATH_CFG1		(0x0588)
+#define CDC_2_5_RX_RX2_RX_PATH_CFG2		(0x058C)
+#define CDC_2_5_RX_RX2_RX_PATH_CFG3		(0x0590)
+#define CDC_2_5_RX_RX2_RX_VOL_CTL		(0x0594)
+#define CDC_2_5_RX_RX2_RX_PATH_MIX_CTL		(0x0598)
+#define CDC_2_5_RX_RX2_RX_PATH_MIX_CFG		(0x059C)
+#define CDC_2_5_RX_RX2_RX_VOL_MIX_CTL		(0x05a0)
+#define CDC_2_5_RX_RX2_RX_PATH_SEC0		(0x05a4)
+#define CDC_2_5_RX_RX2_RX_PATH_SEC1		(0x05a8)
+#define CDC_2_5_RX_RX2_RX_PATH_SEC2		(0x05aC)
+#define CDC_2_5_RX_RX2_RX_PATH_SEC3		(0x05b0)
+#define CDC_2_5_RX_RX2_RX_PATH_SEC4		(0x05b4)
+#define CDC_2_5_RX_RX2_RX_PATH_SEC5		(0x05b8)
+#define CDC_2_5_RX_RX2_RX_PATH_SEC6		(0x05bC)
+#define CDC_2_5_RX_RX2_RX_PATH_SEC7		(0x05c0)
+#define CDC_2_5_RX_RX2_RX_PATH_MIX_SEC0		(0x05c4)
+#define CDC_2_5_RX_RX2_RX_PATH_MIX_SEC1		(0x05c8)
+#define CDC_2_5_RX_RX2_RX_PATH_DSM_CTL		(0x05cC)
+
 #define CDC_RX_IDLE_DETECT_PATH_CTL	(0x0780)
 #define CDC_RX_IDLE_DETECT_CFG0		(0x0784)
 #define CDC_RX_IDLE_DETECT_CFG1		(0x0788)
@@ -764,6 +811,8 @@ static SOC_ENUM_SINGLE_DECL(rx_int0_dem_inp_enum, CDC_RX_RX0_RX_PATH_CFG1, 0,
 			    rx_int_dem_inp_mux_text);
 static SOC_ENUM_SINGLE_DECL(rx_int1_dem_inp_enum, CDC_RX_RX1_RX_PATH_CFG1, 0,
 			    rx_int_dem_inp_mux_text);
+static SOC_ENUM_SINGLE_DECL(rx_2_5_int1_dem_inp_enum, CDC_2_5_RX_RX1_RX_PATH_CFG1, 0,
+			    rx_int_dem_inp_mux_text);
 
 static SOC_ENUM_SINGLE_DECL(rx_macro_rx0_enum, SND_SOC_NOPM, 0, rx_macro_mux_text);
 static SOC_ENUM_SINGLE_DECL(rx_macro_rx1_enum, SND_SOC_NOPM, 0, rx_macro_mux_text);
@@ -1083,6 +1132,52 @@ static const struct reg_default rx_defaults[] = {
 	{ CDC_RX_DSD1_CFG2, 0x96 },
 };
 
+static const struct reg_default rx_2_5_defaults[] = {
+	{ CDC_2_5_RX_RX1_RX_PATH_CTL, 0x04 },
+	{ CDC_2_5_RX_RX1_RX_PATH_CFG0, 0x00 },
+	{ CDC_2_5_RX_RX1_RX_PATH_CFG1, 0x64 },
+	{ CDC_2_5_RX_RX1_RX_PATH_CFG2, 0x8F },
+	{ CDC_2_5_RX_RX1_RX_PATH_CFG3, 0x00 },
+	{ CDC_2_5_RX_RX1_RX_VOL_CTL, 0x00 },
+	{ CDC_2_5_RX_RX1_RX_PATH_MIX_CTL, 0x04 },
+	{ CDC_2_5_RX_RX1_RX_PATH_MIX_CFG, 0x7E },
+	{ CDC_2_5_RX_RX1_RX_VOL_MIX_CTL, 0x00 },
+	{ CDC_2_5_RX_RX1_RX_PATH_SEC1, 0x08 },
+	{ CDC_2_5_RX_RX1_RX_PATH_SEC2, 0x00 },
+	{ CDC_2_5_RX_RX1_RX_PATH_SEC3, 0x00 },
+	{ CDC_2_5_RX_RX1_RX_PATH_SEC4, 0x00 },
+	{ CDC_2_5_RX_RX1_RX_PATH_SEC7, 0x00 },
+	{ CDC_2_5_RX_RX1_RX_PATH_MIX_SEC0, 0x08 },
+	{ CDC_2_5_RX_RX1_RX_PATH_MIX_SEC1, 0x00 },
+	{ CDC_2_5_RX_RX1_RX_PATH_DSM_CTL, 0x08 },
+	{ CDC_2_5_RX_RX1_RX_PATH_DSM_DATA1, 0x00 },
+	{ CDC_2_5_RX_RX1_RX_PATH_DSM_DATA2, 0x00 },
+	{ CDC_2_5_RX_RX1_RX_PATH_DSM_DATA3, 0x00 },
+	{ CDC_2_5_RX_RX1_RX_PATH_DSM_DATA4, 0x55 },
+	{ CDC_2_5_RX_RX1_RX_PATH_DSM_DATA5, 0x55 },
+	{ CDC_2_5_RX_RX1_RX_PATH_DSM_DATA6, 0x55 },
+	{ CDC_2_5_RX_RX2_RX_PATH_CTL, 0x04 },
+	{ CDC_2_5_RX_RX2_RX_PATH_CFG0, 0x00 },
+	{ CDC_2_5_RX_RX2_RX_PATH_CFG1, 0x64 },
+	{ CDC_2_5_RX_RX2_RX_PATH_CFG2, 0x8F },
+	{ CDC_2_5_RX_RX2_RX_PATH_CFG3, 0x00 },
+	{ CDC_2_5_RX_RX2_RX_VOL_CTL, 0x00 },
+	{ CDC_2_5_RX_RX2_RX_PATH_MIX_CTL, 0x04 },
+	{ CDC_2_5_RX_RX2_RX_PATH_MIX_CFG, 0x7E },
+	{ CDC_2_5_RX_RX2_RX_VOL_MIX_CTL, 0x00 },
+	{ CDC_2_5_RX_RX2_RX_PATH_SEC0, 0x04 },
+	{ CDC_2_5_RX_RX2_RX_PATH_SEC1, 0x08 },
+	{ CDC_2_5_RX_RX2_RX_PATH_SEC2, 0x00 },
+	{ CDC_2_5_RX_RX2_RX_PATH_SEC3, 0x00 },
+	{ CDC_2_5_RX_RX2_RX_PATH_SEC4, 0x00 },
+	{ CDC_2_5_RX_RX2_RX_PATH_SEC5, 0x00 },
+	{ CDC_2_5_RX_RX2_RX_PATH_SEC6, 0x00 },
+	{ CDC_2_5_RX_RX2_RX_PATH_SEC7, 0x00 },
+	{ CDC_2_5_RX_RX2_RX_PATH_MIX_SEC0, 0x08 },
+	{ CDC_2_5_RX_RX2_RX_PATH_MIX_SEC1, 0x00 },
+	{ CDC_2_5_RX_RX2_RX_PATH_DSM_CTL, 0x00 },
+};
+
 static const struct reg_default rx_pre_2_5_defaults[] = {
 	{ CDC_RX_RX1_RX_PATH_CTL, 0x04 },
 	{ CDC_RX_RX1_RX_PATH_CFG0, 0x00 },
@@ -1236,8 +1331,62 @@ static bool rx_pre_2_5_is_rw_register(struct device *dev, unsigned int reg)
 	return false;
 }
 
+static bool rx_2_5_is_rw_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case CDC_2_5_RX_RX1_RX_PATH_CTL:
+	case CDC_2_5_RX_RX1_RX_PATH_CFG0:
+	case CDC_2_5_RX_RX1_RX_PATH_CFG1:
+	case CDC_2_5_RX_RX1_RX_PATH_CFG2:
+	case CDC_2_5_RX_RX1_RX_PATH_CFG3:
+	case CDC_2_5_RX_RX1_RX_VOL_CTL:
+	case CDC_2_5_RX_RX1_RX_PATH_MIX_CTL:
+	case CDC_2_5_RX_RX1_RX_PATH_MIX_CFG:
+	case CDC_2_5_RX_RX1_RX_VOL_MIX_CTL:
+	case CDC_2_5_RX_RX1_RX_PATH_SEC1:
+	case CDC_2_5_RX_RX1_RX_PATH_SEC2:
+	case CDC_2_5_RX_RX1_RX_PATH_SEC3:
+	case CDC_2_5_RX_RX1_RX_PATH_SEC4:
+	case CDC_2_5_RX_RX1_RX_PATH_SEC7:
+	case CDC_2_5_RX_RX1_RX_PATH_MIX_SEC0:
+	case CDC_2_5_RX_RX1_RX_PATH_MIX_SEC1:
+	case CDC_2_5_RX_RX1_RX_PATH_DSM_CTL:
+	case CDC_2_5_RX_RX1_RX_PATH_DSM_DATA1:
+	case CDC_2_5_RX_RX1_RX_PATH_DSM_DATA2:
+	case CDC_2_5_RX_RX1_RX_PATH_DSM_DATA3:
+	case CDC_2_5_RX_RX1_RX_PATH_DSM_DATA4:
+	case CDC_2_5_RX_RX1_RX_PATH_DSM_DATA5:
+	case CDC_2_5_RX_RX1_RX_PATH_DSM_DATA6:
+	case CDC_2_5_RX_RX2_RX_PATH_CTL:
+	case CDC_2_5_RX_RX2_RX_PATH_CFG0:
+	case CDC_2_5_RX_RX2_RX_PATH_CFG1:
+	case CDC_2_5_RX_RX2_RX_PATH_CFG2:
+	case CDC_2_5_RX_RX2_RX_PATH_CFG3:
+	case CDC_2_5_RX_RX2_RX_VOL_CTL:
+	case CDC_2_5_RX_RX2_RX_PATH_MIX_CTL:
+	case CDC_2_5_RX_RX2_RX_PATH_MIX_CFG:
+	case CDC_2_5_RX_RX2_RX_VOL_MIX_CTL:
+	case CDC_2_5_RX_RX2_RX_PATH_SEC0:
+	case CDC_2_5_RX_RX2_RX_PATH_SEC1:
+	case CDC_2_5_RX_RX2_RX_PATH_SEC2:
+	case CDC_2_5_RX_RX2_RX_PATH_SEC3:
+	case CDC_2_5_RX_RX2_RX_PATH_SEC4:
+	case CDC_2_5_RX_RX2_RX_PATH_SEC5:
+	case CDC_2_5_RX_RX2_RX_PATH_SEC6:
+	case CDC_2_5_RX_RX2_RX_PATH_SEC7:
+	case CDC_2_5_RX_RX2_RX_PATH_MIX_SEC0:
+	case CDC_2_5_RX_RX2_RX_PATH_MIX_SEC1:
+	case CDC_2_5_RX_RX2_RX_PATH_DSM_CTL:
+		return true;
+	}
+
+	return false;
+}
+
 static bool rx_is_rw_register(struct device *dev, unsigned int reg)
 {
+	struct rx_macro *rx = dev_get_drvdata(dev);
+
 	switch (reg) {
 	case CDC_RX_TOP_TOP_CFG0:
 	case CDC_RX_TOP_SWR_CTRL:
@@ -1453,6 +1602,9 @@ static bool rx_is_rw_register(struct device *dev, unsigned int reg)
 		return true;
 	}
 
+	if (rx->codec_version >= LPASS_CODEC_VERSION_2_5)
+		return rx_2_5_is_rw_register(dev, reg);
+
 	return rx_pre_2_5_is_rw_register(dev, reg);
 }
 
@@ -1551,6 +1703,10 @@ static const struct snd_kcontrol_new rx_int1_dem_inp_mux =
 		SOC_DAPM_ENUM_EXT("rx_int1_dem_inp", rx_int1_dem_inp_enum,
 		  snd_soc_dapm_get_enum_double, rx_macro_int_dem_inp_mux_put);
 
+static const struct snd_kcontrol_new rx_2_5_int1_dem_inp_mux =
+		SOC_DAPM_ENUM_EXT("rx_int1_dem_inp", rx_2_5_int1_dem_inp_enum,
+		  snd_soc_dapm_get_enum_double, rx_macro_int_dem_inp_mux_put);
+
 static int rx_macro_set_prim_interpolator_rate(struct snd_soc_dai *dai,
 					       int rate_reg_val, u32 sample_rate)
 {
@@ -2835,6 +2991,18 @@ static const struct snd_kcontrol_new rx_macro_def_snd_controls[] = {
 			  -84, 40, digital_gain),
 };
 
+static const struct snd_kcontrol_new rx_macro_2_5_snd_controls[] = {
+
+	SOC_SINGLE_S8_TLV("RX_RX1 Digital Volume", CDC_2_5_RX_RX1_RX_VOL_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX_RX2 Digital Volume", CDC_2_5_RX_RX2_RX_VOL_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX_RX1 Mix Digital Volume", CDC_2_5_RX_RX1_RX_VOL_MIX_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX_RX2 Mix Digital Volume", CDC_2_5_RX_RX2_RX_VOL_MIX_CTL,
+			  -84, 40, digital_gain),
+};
+
 static const struct snd_kcontrol_new rx_macro_snd_controls[] = {
 	SOC_SINGLE_S8_TLV("RX_RX0 Digital Volume", CDC_RX_RX0_RX_VOL_CTL,
 			  -84, 40, digital_gain),
@@ -2956,6 +3124,12 @@ static int rx_macro_enable_echo(struct snd_soc_dapm_widget *w,
 
 	return 0;
 }
+
+static const struct snd_soc_dapm_widget rx_macro_2_5_dapm_widgets[] = {
+	SND_SOC_DAPM_MUX("RX INT1 DEM MUX", SND_SOC_NOPM, 0, 0,
+			 &rx_2_5_int1_dem_inp_mux),
+};
+
 static const struct snd_soc_dapm_widget rx_macro_def_dapm_widgets[] = {
 	SND_SOC_DAPM_MUX("RX INT1 DEM MUX", SND_SOC_NOPM, 0, 0,
 			 &rx_int1_dem_inp_mux),
@@ -3454,10 +3628,17 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
 				      CDC_RX_DC_COEFF_SEL_MASK,
 				      CDC_RX_DC_COEFF_SEL_TWO);
 
-	controls = rx_macro_def_snd_controls;
-	num_controls = ARRAY_SIZE(rx_macro_def_snd_controls);
-	widgets = rx_macro_def_dapm_widgets;
-	num_widgets = ARRAY_SIZE(rx_macro_def_dapm_widgets);
+	if (rx->codec_version >= LPASS_CODEC_VERSION_2_5) {
+		controls = rx_macro_2_5_snd_controls;
+		num_controls = ARRAY_SIZE(rx_macro_2_5_snd_controls);
+		widgets = rx_macro_2_5_dapm_widgets;
+		num_widgets = ARRAY_SIZE(rx_macro_2_5_dapm_widgets);
+	} else {
+		controls = rx_macro_def_snd_controls;
+		num_controls = ARRAY_SIZE(rx_macro_def_snd_controls);
+		widgets = rx_macro_def_dapm_widgets;
+		num_widgets = ARRAY_SIZE(rx_macro_def_dapm_widgets);
+	}
 
 	rx->component = component;
 
@@ -3609,15 +3790,28 @@ static int rx_macro_probe(struct platform_device *pdev)
 		goto err;
 	}
 	rx->codec_version = lpass_macro_get_codec_version();
-
-	rx->rxn_reg_stride = 0x80;
-	def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_pre_2_5_defaults);
-	reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
-	if (!reg_defaults)
-		return -ENOMEM;
-	memcpy(&reg_defaults[0], rx_defaults, sizeof(rx_defaults));
-	memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
-			rx_pre_2_5_defaults, sizeof(rx_pre_2_5_defaults));
+	switch (rx->codec_version) {
+	case LPASS_CODEC_VERSION_2_5 ... LPASS_CODEC_VERSION_2_8:
+		rx->rxn_reg_stride = 0xc0;
+		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
+		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
+		if (!reg_defaults)
+			return -ENOMEM;
+		memcpy(&reg_defaults[0], rx_defaults, sizeof(rx_defaults));
+		memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
+				rx_2_5_defaults, sizeof(rx_2_5_defaults));
+		break;
+	default:
+		rx->rxn_reg_stride = 0x80;
+		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_pre_2_5_defaults);
+		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
+		if (!reg_defaults)
+			return -ENOMEM;
+		memcpy(&reg_defaults[0], rx_defaults, sizeof(rx_defaults));
+		memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
+				rx_pre_2_5_defaults, sizeof(rx_pre_2_5_defaults));
+		break;
+	}
 
 	rx_regmap_config.reg_defaults = reg_defaults;
 	rx_regmap_config.num_reg_defaults = def_count;

-- 
2.25.1


