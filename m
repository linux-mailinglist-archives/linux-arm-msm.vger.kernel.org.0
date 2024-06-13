Return-Path: <linux-arm-msm+bounces-22575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA92906A6B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 12:50:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B8C31F235D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 10:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 575A5142E9C;
	Thu, 13 Jun 2024 10:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BvXnKsvm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4FA142E7D
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 10:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718275790; cv=none; b=A2VvMSApVrc5//JUsPoaImibiBhgtxsXOt16GmtwRjU5GQHL6bwTR6aTLkLbiycYXWTJO7Uf/kEFdkY/FEIRhapyllrTKqggZAqYfPy2kvnP3xegsFmpC3VEOPt3rjPuYJ0NR51gvs/ucAOH5570oJKigBWvgwAMQefaKWkrtOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718275790; c=relaxed/simple;
	bh=Q5qXrkmMMKvYiQVQS+98K9kxshLYVF15IXhA4UaxwHU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SGSOHnD16N0wmWsMvYeHXLD/uNvvi95RPz0eHtDl2hDy+1khnLoYG5XYwv2lcVAISsuUDlXSN12ujoHM213Y4XEBEI9OS6oXyBr7QDTP8RRN3mBTgus9dn6rPr1vQ09UXJgZl9Yihl+/7PQVTmuioZM4S4Dd1YdUtBJiJCerkYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BvXnKsvm; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ebec2f11b7so7772371fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 03:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718275786; x=1718880586; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+EFZ7aGP5K8ollcI2eEzGJdE98yax1we/UmwmsJYk5M=;
        b=BvXnKsvmxlqNnozhhu8nxzIylyde9jxabZGCT5hdLQhuw+beNGMXzWGpHskh8R+k8y
         S0M9JzO8epb2libnRTjDFk4dfdFEJlnG2lJ+IItrXM2iWncM2lz4CvkpJGJ6UPYVe7LN
         a5h5l6gkStZB8vCxj/K6EQJApIoE5zB+9ROgGV0YpRgW8vweP5CYnNRsP2uCWtn44wPC
         suVFLbCmC4Cya19h8JwFTyOhlUBXBf09rnC/ZlQCdI2dKZ7a0wbabypBlts9jUuVrGSp
         dt5piVqfcwylq728I1MoWSRdVjF2guZl6pr0mnuVe18hMezmX1BAonV9fQq5zanssWcV
         6K+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718275786; x=1718880586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+EFZ7aGP5K8ollcI2eEzGJdE98yax1we/UmwmsJYk5M=;
        b=pi4sypQnJ/1iSYNR1gmK0z2Uk9LYb4032Q1T7A6JeF2ygkru4L+j6XhEGRQ75dzt1R
         Iy/SpbdCTRNIO3JiKMJbVhd+8nmN2dj2AcfVUciREd+akSonjnfKA8GeihVdzFDSsxca
         FzbcPctrS3dqM8suGCdHAIJgics03WXpCalh/1sfdWdmM3oDchwADpduDcf4MbTtndw9
         F08FJ4ZpYC0eKRXZs5jRrA9Fsbk35HR8LJH18IMCzXpQDO8BbowSyj4sMW+S236q394M
         b7H70y3205UU5bOlzWRVFvxS9hJ0FFsYSEoIeJfiwE2hm6CAxLnWhPDtuUdzJJkRMqXu
         F3yg==
X-Forwarded-Encrypted: i=1; AJvYcCW6mnZ/9CnbXLufEafrGLsjF4bN8Z4adq5uApI3Ks1LBSUhgPrBYt2+Z+NY/KQAJegVFfIPw9CMthJyjAXWEhh+qEjDkZGao3Au8N26Gw==
X-Gm-Message-State: AOJu0YzEIfxegWyagfSCyMQgPvqyJzNIVWX80YOZqOnArj1oMSEiMgyK
	MGFdhPaeg1ObnxhOm+1g8Up/uZsEQ4DDgig5hNyZN9d+i6vQTvTH2KAK9mx2cj4=
X-Google-Smtp-Source: AGHT+IEo0/iwZawg1zUJqiJfhp3mWJ6WuqCeA7on9TRDsYPTsORcLXQl+8T8rl/FlvDttieQdP7p6A==
X-Received: by 2002:a2e:be90:0:b0:2e9:841d:dacb with SMTP id 38308e7fff4ca-2ebfca55763mr31590221fa.40.1718275786409;
        Thu, 13 Jun 2024 03:49:46 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72cdf2bsm762618a12.17.2024.06.13.03.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 03:49:44 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Thu, 13 Jun 2024 11:49:33 +0100
Subject: [PATCH v4 3/3] ASoC: codec: lpass-rx-macro: add support for 2.5
 codec version
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-lpass-codec-v25-v4-3-f63d3676dbc4@linaro.org>
References: <20240612-lpass-codec-v25-v4-0-f63d3676dbc4@linaro.org>
In-Reply-To: <20240612-lpass-codec-v25-v4-0-f63d3676dbc4@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Banajit Goswami <bgoswami@quicinc.com>
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org, 
 krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11767;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=Q5qXrkmMMKvYiQVQS+98K9kxshLYVF15IXhA4UaxwHU=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmas7E+sPjEpcG5qIMu8TlnucpB+aedEuBBHIpQ
 H1WTRgCbkqJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZmrOxAAKCRB6of1ZxzRV
 N13aB/9xtAjRcCvZTtQqy6qrfVwfEmp4ZuM9k21caEBhHFoSfkfqYGMAz29tBD5GuwEdtmB0lqy
 F8fbznZOFFq8hl62vogaUgRispeVx3slVwN6qfy4tVRv+HmzHSkwFAM8lHMy9a1E27KgK1oqYVI
 XTkbb940KWQZFufbljl76vFqID5CcrjlxBDHbxPNzUJfJO4286MSq+cHeT2xFh+myOtXx76sC5V
 ruENdAzVGMPhDlwfrpU7xxOjiyJx07c8wl6D+BGVpv6y/wZ14GMA/hJwzx40LIwxGjP15cqN0eJ
 7JpgIjIqU2VbLNjRPMaYRIv0yJttmnkFK0tjPbQkAxZzum07
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6

LPASS Codec v2.5 has significant changes in the rx register strides.
Due to this headset playback on SM8550, SM8650, x1e80100 and all SoCs
after SM8450 have only Left working.

This patch adjusts the registers to accomdate 2.5 changes. With this
fixed now L and R are functional on Headset playback.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
---
 sound/soc/codecs/lpass-rx-macro.c | 198 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 198 insertions(+)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 360c9003a890..d962a9599694 100644
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
@@ -1236,6 +1331,58 @@ static bool rx_pre_2_5_is_rw_register(struct device *dev, unsigned int reg)
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
 	struct rx_macro *rx = dev_get_drvdata(dev);
@@ -1461,6 +1608,11 @@ static bool rx_is_rw_register(struct device *dev, unsigned int reg)
 	case LPASS_CODEC_VERSION_1_2:
 	case LPASS_CODEC_VERSION_2_0:
 		return rx_pre_2_5_is_rw_register(dev, reg);
+	case LPASS_CODEC_VERSION_2_5:
+	case LPASS_CODEC_VERSION_2_6:
+	case LPASS_CODEC_VERSION_2_7:
+	case LPASS_CODEC_VERSION_2_8:
+		return rx_2_5_is_rw_register(dev, reg);
 	default:
 		break;
 	}
@@ -1563,6 +1715,10 @@ static const struct snd_kcontrol_new rx_int1_dem_inp_mux =
 		SOC_DAPM_ENUM_EXT("rx_int1_dem_inp", rx_int1_dem_inp_enum,
 		  snd_soc_dapm_get_enum_double, rx_macro_int_dem_inp_mux_put);
 
+static const struct snd_kcontrol_new rx_2_5_int1_dem_inp_mux =
+		SOC_DAPM_ENUM_EXT("rx_int1_dem_inp", rx_2_5_int1_dem_inp_enum,
+		  snd_soc_dapm_get_enum_double, rx_macro_int_dem_inp_mux_put);
+
 static int rx_macro_set_prim_interpolator_rate(struct snd_soc_dai *dai,
 					       int rate_reg_val, u32 sample_rate)
 {
@@ -2847,6 +3003,18 @@ static const struct snd_kcontrol_new rx_macro_def_snd_controls[] = {
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
@@ -2968,6 +3136,12 @@ static int rx_macro_enable_echo(struct snd_soc_dapm_widget *w,
 
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
@@ -3476,6 +3650,15 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
 		widgets = rx_macro_def_dapm_widgets;
 		num_widgets = ARRAY_SIZE(rx_macro_def_dapm_widgets);
 		break;
+	case LPASS_CODEC_VERSION_2_5:
+	case LPASS_CODEC_VERSION_2_6:
+	case LPASS_CODEC_VERSION_2_7:
+	case LPASS_CODEC_VERSION_2_8:
+		controls = rx_macro_2_5_snd_controls;
+		num_controls = ARRAY_SIZE(rx_macro_2_5_snd_controls);
+		widgets = rx_macro_2_5_dapm_widgets;
+		num_widgets = ARRAY_SIZE(rx_macro_2_5_dapm_widgets);
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -3646,6 +3829,21 @@ static int rx_macro_probe(struct platform_device *pdev)
 		memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
 				rx_pre_2_5_defaults, sizeof(rx_pre_2_5_defaults));
 		break;
+	case LPASS_CODEC_VERSION_2_5:
+	case LPASS_CODEC_VERSION_2_6:
+	case LPASS_CODEC_VERSION_2_7:
+	case LPASS_CODEC_VERSION_2_8:
+		rx->rxn_reg_stride = 0xc0;
+		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
+		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
+		if (!reg_defaults) {
+			ret = -ENOMEM;
+			goto err;
+		}
+		memcpy(&reg_defaults[0], rx_defaults, sizeof(rx_defaults));
+		memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
+				rx_2_5_defaults, sizeof(rx_2_5_defaults));
+		break;
 	default:
 		dev_err(rx->dev, "Unsupported Codec version (%d)\n", rx->codec_version);
 		ret = -EINVAL;

-- 
2.25.1


