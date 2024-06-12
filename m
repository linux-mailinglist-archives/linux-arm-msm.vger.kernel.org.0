Return-Path: <linux-arm-msm+bounces-22488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7103905944
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 18:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C6E1284CF9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 16:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18114183064;
	Wed, 12 Jun 2024 16:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IhtUqeef"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD1F17B437
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 16:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718211467; cv=none; b=p8YVm9rCzWY9HfWO9rI5AREvdoJgFqk9KlVPZLyvNHe8O6vroNwabQ3Q+BzN6u5eoK2ATgQxIr0YJpV+LLC7L4QkypBi7n3ijnDjnvmVBaGgo6M9VRAXwU6VguCXhx4mAPkRciClR7ETgunV+qAi0KLisBb+UC4Vyou4hHbBR90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718211467; c=relaxed/simple;
	bh=5ZN3xjXpNBCURPh377SLSMVX3FBxokJhVeC5MayH3RM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jEm5XDiDkt2/QZwHzI3lqQHkVziC6HxSNuUvfKJCedQaqpQywDL34IpbpkximI35vdmVwgQmtIv0cYYbdphMhl9NiOUE767z5TmdYm6vdatKSV3VBz8jtldEdYsZPSygFDzc73eNWHzh8twxc+z69OOQtyEGpl9UnMLrOyRxmlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IhtUqeef; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57c68682d1aso5584124a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 09:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718211462; x=1718816262; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6oZDs56ZrsGbkQ4wo4YOh9ymuN0wlg08FGT9TTGGrB0=;
        b=IhtUqeefebaBwRZ5+GqhmiWCy6Dfv4i1lqDGlPvuYDGws3rSKMUASk38R237HbpROn
         yt7VW8Kp/6w6gDILu78F5Vl6Xz2jbJvnPpwvJwMMUnaCSuHAunvo3q9F0AcLqwOqpbYg
         N/5khrO2hQEU7iJJimyXyCpPZIcCVPlF3uG0edydF6jDqOQfKBbQsdpH5DyDzN9XoXIq
         XZKa5gDgGhRcFATjivHNwJRBSmUGkM2vs/bP0hneAGyJEgmiG/XlD1cnPOSc2q/siN5x
         Sy9oQ2K8Xxqs9cSLIjxX6z4eG9UjUB49kV6p582ytt3mDyorPWyO5P/Miiq79+MDbJ9x
         ODNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718211462; x=1718816262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6oZDs56ZrsGbkQ4wo4YOh9ymuN0wlg08FGT9TTGGrB0=;
        b=GBU8JXjZqsZd8QqaT9eTZDiYa9KAbNjajYr4PM8I9dbTQYVwImss31nluDWJQKsOev
         +Wj1w2TyCvQS6vOSxa1ePvbyLFsFwtFmYZ4uat9Er9Quf/GK7e00mw/TyDDpeD3KSYG4
         rqwoh8r9mZEEzzIqbsjj+ybGQjCnEwrUItPSdaQm2CQvFSEHiq/hOkmFrNr3mlCyyN+d
         ml9qMNFgET9Gctk90k2H6yi9HmXqpK1XUqHchEatfIJTFYyprF1wFBK25YEdNDULpiR6
         55yzucwXgoSsVUvDt7UZIUtl7xhN3jc8yHfYvz2eUUIKc9jAzBiG8vTSQQnnc9/sF4DM
         cLmg==
X-Forwarded-Encrypted: i=1; AJvYcCXAoIz06RtmdxHGlc9jQX2uTI4zfCSC5IwxeMyxiIScqSqKYWqEQNgNMCEA+eLSrkA4VRdeYvIxaqW6tBJ/lJSdJYDvQg81s6sXDXvdfQ==
X-Gm-Message-State: AOJu0Yz7C4j5kFvO8tLZ2RQZXDGz6v6lQedRsP0KBrKvEl/xDB0hYZBx
	Rf+trtOr+jiAIbM0eRamsl9LP/iHGz0B8QsnMfcNsPq9Wl1j8ZKiZOwICUyrz2M=
X-Google-Smtp-Source: AGHT+IE+x5EO1CuoxVq2kJcPw5eVPTM4wLMSCBqjpXqdNqPG2JKqlsZZkZkzI/nryT/6ySfXDVClgw==
X-Received: by 2002:a05:6402:c82:b0:579:c8cb:ec3d with SMTP id 4fb4d7f45d1cf-57caaac6290mr1386945a12.37.1718211461950;
        Wed, 12 Jun 2024 09:57:41 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57ca8caed84sm1564048a12.43.2024.06.12.09.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:57:41 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Wed, 12 Jun 2024 17:57:22 +0100
Subject: [PATCH v3 2/3] ASoC: codec: lpass-rx-macro: prepare driver to
 accomdate new codec versions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-lpass-codec-v25-v1-2-9f40611a1370@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=30444;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=5ZN3xjXpNBCURPh377SLSMVX3FBxokJhVeC5MayH3RM=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmadOCXl9UnG8B1/Ojx3z4whylw6bptgy1iBH/N
 wIUbvYQ0yWJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZmnTggAKCRB6of1ZxzRV
 N3oLB/9XgSDQKGiSKECBV34ayFfr1DH1IgqFV29sN+8XeVOQjckOMY+cs7LzX3tq3OdfOzPb1Px
 fOnNV3A7S//9MUZ4lZrNc2iDOP4r+7Zq1p2BpQKHa/Hu8Z+gYNQ1Oa9UoZoi+bO5p746BKK5oi7
 /aY4MhjHUoouh3LP6TqCW7yQhxQPjasEeXWQZOtIs6zZ7QVuLN8MC/hwR39bdGbBovfB4Q0aMCG
 6vpNHhrUwom7ObFcB4PEsBiq4ZNdq/tJetbncz2GogUigGH/a9dGH8l3alETTuSBMSqpZ8WKDoR
 xHpW8xrDkqOcVRF9zAF4he3z+xL24LAFuO9e8/ele+cQuTko
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6

LPASS Codec v2.5 has significant changes in the rx block register strides.
This is a preparatory patch to do the required changes in the existing driver
to be able to accomdate these changes.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 361 ++++++++++++++++++++++----------------
 1 file changed, 209 insertions(+), 152 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index f35187d69cac..8beeacbd6ae6 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -158,7 +158,7 @@
 #define CDC_RX_INTR_CTRL_LEVEL0		(0x03C0)
 #define CDC_RX_INTR_CTRL_BYPASS0	(0x03C8)
 #define CDC_RX_INTR_CTRL_SET0		(0x03D0)
-#define CDC_RX_RXn_RX_PATH_CTL(n)	(0x0400 + 0x80 * n)
+#define CDC_RX_RXn_RX_PATH_CTL(rx, n)	(0x0400  + rx->rxn_reg_stride * n)
 #define CDC_RX_RX0_RX_PATH_CTL		(0x0400)
 #define CDC_RX_PATH_RESET_EN_MASK	BIT(6)
 #define CDC_RX_PATH_CLK_EN_MASK		BIT(5)
@@ -166,45 +166,47 @@
 #define CDC_RX_PATH_PGA_MUTE_MASK	BIT(4)
 #define CDC_RX_PATH_PGA_MUTE_ENABLE	BIT(4)
 #define CDC_RX_PATH_PCM_RATE_MASK	GENMASK(3, 0)
-#define CDC_RX_RXn_RX_PATH_CFG0(n)	(0x0404 + 0x80 * n)
+#define CDC_RX_RXn_RX_PATH_CFG0(rx, n)	(0x0404  + rx->rxn_reg_stride * n)
 #define CDC_RX_RXn_COMP_EN_MASK		BIT(1)
 #define CDC_RX_RX0_RX_PATH_CFG0		(0x0404)
 #define CDC_RX_RXn_CLSH_EN_MASK		BIT(6)
 #define CDC_RX_DLY_ZN_EN_MASK		BIT(3)
 #define CDC_RX_DLY_ZN_ENABLE		BIT(3)
 #define CDC_RX_RXn_HD2_EN_MASK		BIT(2)
-#define CDC_RX_RXn_RX_PATH_CFG1(n)	(0x0408 + 0x80 * n)
+#define CDC_RX_RXn_RX_PATH_CFG1(rx, n)	(0x0408  + rx->rxn_reg_stride * n)
 #define CDC_RX_RXn_SIDETONE_EN_MASK	BIT(4)
 #define CDC_RX_RX0_RX_PATH_CFG1		(0x0408)
 #define CDC_RX_RX0_HPH_L_EAR_SEL_MASK	BIT(1)
-#define CDC_RX_RXn_RX_PATH_CFG2(n)	(0x040C + 0x80 * n)
+#define CDC_RX_RXn_RX_PATH_CFG2(rx, n)	(0x040C  + rx->rxn_reg_stride * n)
 #define CDC_RX_RXn_HPF_CUT_FREQ_MASK	GENMASK(1, 0)
 #define CDC_RX_RX0_RX_PATH_CFG2		(0x040C)
-#define CDC_RX_RXn_RX_PATH_CFG3(n)	(0x0410 + 0x80 * n)
+#define CDC_RX_RXn_RX_PATH_CFG3(rx, n)	(0x0410  + rx->rxn_reg_stride * n)
 #define CDC_RX_RX0_RX_PATH_CFG3		(0x0410)
 #define CDC_RX_DC_COEFF_SEL_MASK	GENMASK(1, 0)
 #define CDC_RX_DC_COEFF_SEL_TWO		0x2
-#define CDC_RX_RXn_RX_VOL_CTL(n)	(0x0414 + 0x80 * n)
+#define CDC_RX_RXn_RX_VOL_CTL(rx, n)	(0x0414  + rx->rxn_reg_stride * n)
 #define CDC_RX_RX0_RX_VOL_CTL		(0x0414)
-#define CDC_RX_RXn_RX_PATH_MIX_CTL(n)	(0x0418 + 0x80 * n)
+#define CDC_RX_RXn_RX_PATH_MIX_CTL(rx, n)	(0x0418  + rx->rxn_reg_stride * n)
 #define CDC_RX_RXn_MIX_PCM_RATE_MASK	GENMASK(3, 0)
 #define CDC_RX_RXn_MIX_RESET_MASK	BIT(6)
 #define CDC_RX_RXn_MIX_RESET		BIT(6)
 #define CDC_RX_RXn_MIX_CLK_EN_MASK	BIT(5)
 #define CDC_RX_RX0_RX_PATH_MIX_CTL	(0x0418)
 #define CDC_RX_RX0_RX_PATH_MIX_CFG	(0x041C)
-#define CDC_RX_RXn_RX_VOL_MIX_CTL(n)	(0x0420 + 0x80 * n)
+#define CDC_RX_RXn_RX_VOL_MIX_CTL(rx, n)	(0x0420  + rx->rxn_reg_stride * n)
 #define CDC_RX_RX0_RX_VOL_MIX_CTL	(0x0420)
 #define CDC_RX_RX0_RX_PATH_SEC1		(0x0424)
 #define CDC_RX_RX0_RX_PATH_SEC2		(0x0428)
 #define CDC_RX_RX0_RX_PATH_SEC3		(0x042C)
+#define CDC_RX_RXn_RX_PATH_SEC3(rx, n)	(0x042c  + rx->rxn_reg_stride * n)
 #define CDC_RX_RX0_RX_PATH_SEC4		(0x0430)
 #define CDC_RX_RX0_RX_PATH_SEC7		(0x0434)
+#define CDC_RX_RXn_RX_PATH_SEC7(rx, n)	(0x0434  + rx->rxn_reg_stride * n)
 #define CDC_RX_DSM_OUT_DELAY_SEL_MASK	GENMASK(2, 0)
 #define CDC_RX_DSM_OUT_DELAY_TWO_SAMPLE	0x2
 #define CDC_RX_RX0_RX_PATH_MIX_SEC0	(0x0438)
 #define CDC_RX_RX0_RX_PATH_MIX_SEC1	(0x043C)
-#define CDC_RX_RXn_RX_PATH_DSM_CTL(n)	(0x0440 + 0x80 * n)
+#define CDC_RX_RXn_RX_PATH_DSM_CTL(rx, n)	(0x0440  + rx->rxn_reg_stride * n)
 #define CDC_RX_RXn_DSM_CLK_EN_MASK	BIT(0)
 #define CDC_RX_RX0_RX_PATH_DSM_CTL	(0x0440)
 #define CDC_RX_RX0_RX_PATH_DSM_DATA1	(0x0444)
@@ -213,6 +215,7 @@
 #define CDC_RX_RX0_RX_PATH_DSM_DATA4	(0x0450)
 #define CDC_RX_RX0_RX_PATH_DSM_DATA5	(0x0454)
 #define CDC_RX_RX0_RX_PATH_DSM_DATA6	(0x0458)
+/* RX offsets prior to 2.5 codec version */
 #define CDC_RX_RX1_RX_PATH_CTL		(0x0480)
 #define CDC_RX_RX1_RX_PATH_CFG0		(0x0484)
 #define CDC_RX_RX1_RX_PATH_CFG1		(0x0488)
@@ -598,6 +601,8 @@ struct rx_macro {
 	int rx_mclk_users;
 	int clsh_users;
 	int rx_mclk_cnt;
+	int codec_version;
+	int rxn_reg_stride;
 	bool is_ear_mode_on;
 	bool hph_pwr_mode;
 	bool hph_hd2_mode;
@@ -976,49 +981,6 @@ static const struct reg_default rx_defaults[] = {
 	{ CDC_RX_RX0_RX_PATH_DSM_DATA4, 0x55 },
 	{ CDC_RX_RX0_RX_PATH_DSM_DATA5, 0x55 },
 	{ CDC_RX_RX0_RX_PATH_DSM_DATA6, 0x55 },
-	{ CDC_RX_RX1_RX_PATH_CTL, 0x04 },
-	{ CDC_RX_RX1_RX_PATH_CFG0, 0x00 },
-	{ CDC_RX_RX1_RX_PATH_CFG1, 0x64 },
-	{ CDC_RX_RX1_RX_PATH_CFG2, 0x8F },
-	{ CDC_RX_RX1_RX_PATH_CFG3, 0x00 },
-	{ CDC_RX_RX1_RX_VOL_CTL, 0x00 },
-	{ CDC_RX_RX1_RX_PATH_MIX_CTL, 0x04 },
-	{ CDC_RX_RX1_RX_PATH_MIX_CFG, 0x7E },
-	{ CDC_RX_RX1_RX_VOL_MIX_CTL, 0x00 },
-	{ CDC_RX_RX1_RX_PATH_SEC1, 0x08 },
-	{ CDC_RX_RX1_RX_PATH_SEC2, 0x00 },
-	{ CDC_RX_RX1_RX_PATH_SEC3, 0x00 },
-	{ CDC_RX_RX1_RX_PATH_SEC4, 0x00 },
-	{ CDC_RX_RX1_RX_PATH_SEC7, 0x00 },
-	{ CDC_RX_RX1_RX_PATH_MIX_SEC0, 0x08 },
-	{ CDC_RX_RX1_RX_PATH_MIX_SEC1, 0x00 },
-	{ CDC_RX_RX1_RX_PATH_DSM_CTL, 0x08 },
-	{ CDC_RX_RX1_RX_PATH_DSM_DATA1, 0x00 },
-	{ CDC_RX_RX1_RX_PATH_DSM_DATA2, 0x00 },
-	{ CDC_RX_RX1_RX_PATH_DSM_DATA3, 0x00 },
-	{ CDC_RX_RX1_RX_PATH_DSM_DATA4, 0x55 },
-	{ CDC_RX_RX1_RX_PATH_DSM_DATA5, 0x55 },
-	{ CDC_RX_RX1_RX_PATH_DSM_DATA6, 0x55 },
-	{ CDC_RX_RX2_RX_PATH_CTL, 0x04 },
-	{ CDC_RX_RX2_RX_PATH_CFG0, 0x00 },
-	{ CDC_RX_RX2_RX_PATH_CFG1, 0x64 },
-	{ CDC_RX_RX2_RX_PATH_CFG2, 0x8F },
-	{ CDC_RX_RX2_RX_PATH_CFG3, 0x00 },
-	{ CDC_RX_RX2_RX_VOL_CTL, 0x00 },
-	{ CDC_RX_RX2_RX_PATH_MIX_CTL, 0x04 },
-	{ CDC_RX_RX2_RX_PATH_MIX_CFG, 0x7E },
-	{ CDC_RX_RX2_RX_VOL_MIX_CTL, 0x00 },
-	{ CDC_RX_RX2_RX_PATH_SEC0, 0x04 },
-	{ CDC_RX_RX2_RX_PATH_SEC1, 0x08 },
-	{ CDC_RX_RX2_RX_PATH_SEC2, 0x00 },
-	{ CDC_RX_RX2_RX_PATH_SEC3, 0x00 },
-	{ CDC_RX_RX2_RX_PATH_SEC4, 0x00 },
-	{ CDC_RX_RX2_RX_PATH_SEC5, 0x00 },
-	{ CDC_RX_RX2_RX_PATH_SEC6, 0x00 },
-	{ CDC_RX_RX2_RX_PATH_SEC7, 0x00 },
-	{ CDC_RX_RX2_RX_PATH_MIX_SEC0, 0x08 },
-	{ CDC_RX_RX2_RX_PATH_MIX_SEC1, 0x00 },
-	{ CDC_RX_RX2_RX_PATH_DSM_CTL, 0x00 },
 	{ CDC_RX_IDLE_DETECT_PATH_CTL, 0x00 },
 	{ CDC_RX_IDLE_DETECT_CFG0, 0x07 },
 	{ CDC_RX_IDLE_DETECT_CFG1, 0x3C },
@@ -1121,6 +1083,53 @@ static const struct reg_default rx_defaults[] = {
 	{ CDC_RX_DSD1_CFG2, 0x96 },
 };
 
+static const struct reg_default rx_pre_2_5_defaults[] = {
+	{ CDC_RX_RX1_RX_PATH_CTL, 0x04 },
+	{ CDC_RX_RX1_RX_PATH_CFG0, 0x00 },
+	{ CDC_RX_RX1_RX_PATH_CFG1, 0x64 },
+	{ CDC_RX_RX1_RX_PATH_CFG2, 0x8F },
+	{ CDC_RX_RX1_RX_PATH_CFG3, 0x00 },
+	{ CDC_RX_RX1_RX_VOL_CTL, 0x00 },
+	{ CDC_RX_RX1_RX_PATH_MIX_CTL, 0x04 },
+	{ CDC_RX_RX1_RX_PATH_MIX_CFG, 0x7E },
+	{ CDC_RX_RX1_RX_VOL_MIX_CTL, 0x00 },
+	{ CDC_RX_RX1_RX_PATH_SEC1, 0x08 },
+	{ CDC_RX_RX1_RX_PATH_SEC2, 0x00 },
+	{ CDC_RX_RX1_RX_PATH_SEC3, 0x00 },
+	{ CDC_RX_RX1_RX_PATH_SEC4, 0x00 },
+	{ CDC_RX_RX1_RX_PATH_SEC7, 0x00 },
+	{ CDC_RX_RX1_RX_PATH_MIX_SEC0, 0x08 },
+	{ CDC_RX_RX1_RX_PATH_MIX_SEC1, 0x00 },
+	{ CDC_RX_RX1_RX_PATH_DSM_CTL, 0x08 },
+	{ CDC_RX_RX1_RX_PATH_DSM_DATA1, 0x00 },
+	{ CDC_RX_RX1_RX_PATH_DSM_DATA2, 0x00 },
+	{ CDC_RX_RX1_RX_PATH_DSM_DATA3, 0x00 },
+	{ CDC_RX_RX1_RX_PATH_DSM_DATA4, 0x55 },
+	{ CDC_RX_RX1_RX_PATH_DSM_DATA5, 0x55 },
+	{ CDC_RX_RX1_RX_PATH_DSM_DATA6, 0x55 },
+	{ CDC_RX_RX2_RX_PATH_CTL, 0x04 },
+	{ CDC_RX_RX2_RX_PATH_CFG0, 0x00 },
+	{ CDC_RX_RX2_RX_PATH_CFG1, 0x64 },
+	{ CDC_RX_RX2_RX_PATH_CFG2, 0x8F },
+	{ CDC_RX_RX2_RX_PATH_CFG3, 0x00 },
+	{ CDC_RX_RX2_RX_VOL_CTL, 0x00 },
+	{ CDC_RX_RX2_RX_PATH_MIX_CTL, 0x04 },
+	{ CDC_RX_RX2_RX_PATH_MIX_CFG, 0x7E },
+	{ CDC_RX_RX2_RX_VOL_MIX_CTL, 0x00 },
+	{ CDC_RX_RX2_RX_PATH_SEC0, 0x04 },
+	{ CDC_RX_RX2_RX_PATH_SEC1, 0x08 },
+	{ CDC_RX_RX2_RX_PATH_SEC2, 0x00 },
+	{ CDC_RX_RX2_RX_PATH_SEC3, 0x00 },
+	{ CDC_RX_RX2_RX_PATH_SEC4, 0x00 },
+	{ CDC_RX_RX2_RX_PATH_SEC5, 0x00 },
+	{ CDC_RX_RX2_RX_PATH_SEC6, 0x00 },
+	{ CDC_RX_RX2_RX_PATH_SEC7, 0x00 },
+	{ CDC_RX_RX2_RX_PATH_MIX_SEC0, 0x08 },
+	{ CDC_RX_RX2_RX_PATH_MIX_SEC1, 0x00 },
+	{ CDC_RX_RX2_RX_PATH_DSM_CTL, 0x00 },
+
+};
+
 static bool rx_is_wronly_register(struct device *dev,
 					unsigned int reg)
 {
@@ -1175,6 +1184,58 @@ static bool rx_is_volatile_register(struct device *dev, unsigned int reg)
 	return false;
 }
 
+static bool rx_pre_2_5_is_rw_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case CDC_RX_RX1_RX_PATH_CTL:
+	case CDC_RX_RX1_RX_PATH_CFG0:
+	case CDC_RX_RX1_RX_PATH_CFG1:
+	case CDC_RX_RX1_RX_PATH_CFG2:
+	case CDC_RX_RX1_RX_PATH_CFG3:
+	case CDC_RX_RX1_RX_VOL_CTL:
+	case CDC_RX_RX1_RX_PATH_MIX_CTL:
+	case CDC_RX_RX1_RX_PATH_MIX_CFG:
+	case CDC_RX_RX1_RX_VOL_MIX_CTL:
+	case CDC_RX_RX1_RX_PATH_SEC1:
+	case CDC_RX_RX1_RX_PATH_SEC2:
+	case CDC_RX_RX1_RX_PATH_SEC3:
+	case CDC_RX_RX1_RX_PATH_SEC4:
+	case CDC_RX_RX1_RX_PATH_SEC7:
+	case CDC_RX_RX1_RX_PATH_MIX_SEC0:
+	case CDC_RX_RX1_RX_PATH_MIX_SEC1:
+	case CDC_RX_RX1_RX_PATH_DSM_CTL:
+	case CDC_RX_RX1_RX_PATH_DSM_DATA1:
+	case CDC_RX_RX1_RX_PATH_DSM_DATA2:
+	case CDC_RX_RX1_RX_PATH_DSM_DATA3:
+	case CDC_RX_RX1_RX_PATH_DSM_DATA4:
+	case CDC_RX_RX1_RX_PATH_DSM_DATA5:
+	case CDC_RX_RX1_RX_PATH_DSM_DATA6:
+	case CDC_RX_RX2_RX_PATH_CTL:
+	case CDC_RX_RX2_RX_PATH_CFG0:
+	case CDC_RX_RX2_RX_PATH_CFG1:
+	case CDC_RX_RX2_RX_PATH_CFG2:
+	case CDC_RX_RX2_RX_PATH_CFG3:
+	case CDC_RX_RX2_RX_VOL_CTL:
+	case CDC_RX_RX2_RX_PATH_MIX_CTL:
+	case CDC_RX_RX2_RX_PATH_MIX_CFG:
+	case CDC_RX_RX2_RX_VOL_MIX_CTL:
+	case CDC_RX_RX2_RX_PATH_SEC0:
+	case CDC_RX_RX2_RX_PATH_SEC1:
+	case CDC_RX_RX2_RX_PATH_SEC2:
+	case CDC_RX_RX2_RX_PATH_SEC3:
+	case CDC_RX_RX2_RX_PATH_SEC4:
+	case CDC_RX_RX2_RX_PATH_SEC5:
+	case CDC_RX_RX2_RX_PATH_SEC6:
+	case CDC_RX_RX2_RX_PATH_SEC7:
+	case CDC_RX_RX2_RX_PATH_MIX_SEC0:
+	case CDC_RX_RX2_RX_PATH_MIX_SEC1:
+	case CDC_RX_RX2_RX_PATH_DSM_CTL:
+		return true;
+	}
+
+	return false;
+}
+
 static bool rx_is_rw_register(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
@@ -1306,49 +1367,6 @@ static bool rx_is_rw_register(struct device *dev, unsigned int reg)
 	case CDC_RX_RX0_RX_PATH_DSM_DATA4:
 	case CDC_RX_RX0_RX_PATH_DSM_DATA5:
 	case CDC_RX_RX0_RX_PATH_DSM_DATA6:
-	case CDC_RX_RX1_RX_PATH_CTL:
-	case CDC_RX_RX1_RX_PATH_CFG0:
-	case CDC_RX_RX1_RX_PATH_CFG1:
-	case CDC_RX_RX1_RX_PATH_CFG2:
-	case CDC_RX_RX1_RX_PATH_CFG3:
-	case CDC_RX_RX1_RX_VOL_CTL:
-	case CDC_RX_RX1_RX_PATH_MIX_CTL:
-	case CDC_RX_RX1_RX_PATH_MIX_CFG:
-	case CDC_RX_RX1_RX_VOL_MIX_CTL:
-	case CDC_RX_RX1_RX_PATH_SEC1:
-	case CDC_RX_RX1_RX_PATH_SEC2:
-	case CDC_RX_RX1_RX_PATH_SEC3:
-	case CDC_RX_RX1_RX_PATH_SEC4:
-	case CDC_RX_RX1_RX_PATH_SEC7:
-	case CDC_RX_RX1_RX_PATH_MIX_SEC0:
-	case CDC_RX_RX1_RX_PATH_MIX_SEC1:
-	case CDC_RX_RX1_RX_PATH_DSM_CTL:
-	case CDC_RX_RX1_RX_PATH_DSM_DATA1:
-	case CDC_RX_RX1_RX_PATH_DSM_DATA2:
-	case CDC_RX_RX1_RX_PATH_DSM_DATA3:
-	case CDC_RX_RX1_RX_PATH_DSM_DATA4:
-	case CDC_RX_RX1_RX_PATH_DSM_DATA5:
-	case CDC_RX_RX1_RX_PATH_DSM_DATA6:
-	case CDC_RX_RX2_RX_PATH_CTL:
-	case CDC_RX_RX2_RX_PATH_CFG0:
-	case CDC_RX_RX2_RX_PATH_CFG1:
-	case CDC_RX_RX2_RX_PATH_CFG2:
-	case CDC_RX_RX2_RX_PATH_CFG3:
-	case CDC_RX_RX2_RX_VOL_CTL:
-	case CDC_RX_RX2_RX_PATH_MIX_CTL:
-	case CDC_RX_RX2_RX_PATH_MIX_CFG:
-	case CDC_RX_RX2_RX_VOL_MIX_CTL:
-	case CDC_RX_RX2_RX_PATH_SEC0:
-	case CDC_RX_RX2_RX_PATH_SEC1:
-	case CDC_RX_RX2_RX_PATH_SEC2:
-	case CDC_RX_RX2_RX_PATH_SEC3:
-	case CDC_RX_RX2_RX_PATH_SEC4:
-	case CDC_RX_RX2_RX_PATH_SEC5:
-	case CDC_RX_RX2_RX_PATH_SEC6:
-	case CDC_RX_RX2_RX_PATH_SEC7:
-	case CDC_RX_RX2_RX_PATH_MIX_SEC0:
-	case CDC_RX_RX2_RX_PATH_MIX_SEC1:
-	case CDC_RX_RX2_RX_PATH_DSM_CTL:
 	case CDC_RX_IDLE_DETECT_PATH_CTL:
 	case CDC_RX_IDLE_DETECT_CFG0:
 	case CDC_RX_IDLE_DETECT_CFG1:
@@ -1435,7 +1453,7 @@ static bool rx_is_rw_register(struct device *dev, unsigned int reg)
 		return true;
 	}
 
-	return false;
+	return rx_pre_2_5_is_rw_register(dev, reg);
 }
 
 static bool rx_is_writeable_register(struct device *dev, unsigned int reg)
@@ -1485,14 +1503,12 @@ static bool rx_is_readable_register(struct device *dev, unsigned int reg)
 	return rx_is_rw_register(dev, reg);
 }
 
-static const struct regmap_config rx_regmap_config = {
+static struct regmap_config rx_regmap_config = {
 	.name = "rx_macro",
 	.reg_bits = 16,
 	.val_bits = 32, /* 8 but with 32 bit read/write */
 	.reg_stride = 4,
 	.cache_type = REGCACHE_FLAT,
-	.reg_defaults = rx_defaults,
-	.num_reg_defaults = ARRAY_SIZE(rx_defaults),
 	.max_register = RX_MAX_OFFSET,
 	.writeable_reg = rx_is_writeable_register,
 	.volatile_reg = rx_is_volatile_register,
@@ -1504,16 +1520,17 @@ static int rx_macro_int_dem_inp_mux_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
 	struct snd_soc_component *component = snd_soc_dapm_to_component(widget->dapm);
+	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned short look_ahead_dly_reg;
 	unsigned int val;
 
 	val = ucontrol->value.enumerated.item[0];
 
-	if (e->reg == CDC_RX_RX0_RX_PATH_CFG1)
-		look_ahead_dly_reg = CDC_RX_RX0_RX_PATH_CFG0;
-	else if (e->reg == CDC_RX_RX1_RX_PATH_CFG1)
-		look_ahead_dly_reg = CDC_RX_RX1_RX_PATH_CFG0;
+	if (e->reg == CDC_RX_RXn_RX_PATH_CFG1(rx, 0))
+		look_ahead_dly_reg = CDC_RX_RXn_RX_PATH_CFG0(rx, 0);
+	else if (e->reg == CDC_RX_RXn_RX_PATH_CFG1(rx, 1))
+		look_ahead_dly_reg = CDC_RX_RXn_RX_PATH_CFG0(rx, 1);
 
 	/* Set Look Ahead Delay */
 	if (val)
@@ -1567,7 +1584,7 @@ static int rx_macro_set_prim_interpolator_rate(struct snd_soc_dai *dai,
 			if ((inp0_sel == int_1_mix1_inp + INTn_1_INP_SEL_RX0) ||
 			    (inp1_sel == int_1_mix1_inp + INTn_1_INP_SEL_RX0) ||
 			    (inp2_sel == int_1_mix1_inp + INTn_1_INP_SEL_RX0)) {
-				int_fs_reg = CDC_RX_RXn_RX_PATH_CTL(j);
+				int_fs_reg = CDC_RX_RXn_RX_PATH_CTL(rx, j);
 				/* sample_rate is in Hz */
 				snd_soc_component_update_bits(component, int_fs_reg,
 							      CDC_RX_PATH_PCM_RATE_MASK,
@@ -1600,7 +1617,7 @@ static int rx_macro_set_mix_interpolator_rate(struct snd_soc_dai *dai,
 									CDC_RX_INTX_2_SEL_MASK);
 
 			if (int_mux_cfg1_val == int_2_inp + INTn_2_INP_SEL_RX0) {
-				int_fs_reg = CDC_RX_RXn_RX_PATH_MIX_CTL(j);
+				int_fs_reg = CDC_RX_RXn_RX_PATH_MIX_CTL(rx, j);
 				snd_soc_component_update_bits(component, int_fs_reg,
 							      CDC_RX_RXn_MIX_PCM_RATE_MASK,
 							      rate_reg_val);
@@ -1719,6 +1736,7 @@ static int rx_macro_get_channel_map(struct snd_soc_dai *dai,
 static int rx_macro_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
 {
 	struct snd_soc_component *component = dai->component;
+	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 	uint16_t j, reg, mix_reg, dsm_reg;
 	u16 int_mux_cfg0, int_mux_cfg1;
 	u8 int_mux_cfg0_val, int_mux_cfg1_val;
@@ -1729,9 +1747,9 @@ static int rx_macro_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
 	case RX_MACRO_AIF3_PB:
 	case RX_MACRO_AIF4_PB:
 		for (j = 0; j < INTERP_MAX; j++) {
-			reg = CDC_RX_RXn_RX_PATH_CTL(j);
-			mix_reg = CDC_RX_RXn_RX_PATH_MIX_CTL(j);
-			dsm_reg = CDC_RX_RXn_RX_PATH_DSM_CTL(j);
+			reg = CDC_RX_RXn_RX_PATH_CTL(rx, j);
+			mix_reg = CDC_RX_RXn_RX_PATH_MIX_CTL(rx, j);
+			dsm_reg = CDC_RX_RXn_RX_PATH_DSM_CTL(rx, j);
 
 			if (mute) {
 				snd_soc_component_update_bits(component, reg,
@@ -1748,7 +1766,7 @@ static int rx_macro_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
 			}
 
 			if (j == INTERP_AUX)
-				dsm_reg = CDC_RX_RX2_RX_PATH_DSM_CTL;
+				dsm_reg = CDC_RX_RXn_RX_PATH_DSM_CTL(rx, 2);
 
 			int_mux_cfg0 = CDC_RX_INP_MUX_RX_INT0_CFG0 + j * 8;
 			int_mux_cfg1 = int_mux_cfg0 + 4;
@@ -1956,10 +1974,11 @@ static int rx_macro_enable_main_path(struct snd_soc_dapm_widget *w,
 					int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 	u16 gain_reg, reg;
 
-	reg = CDC_RX_RXn_RX_PATH_CTL(w->shift);
-	gain_reg = CDC_RX_RXn_RX_VOL_CTL(w->shift);
+	reg = CDC_RX_RXn_RX_PATH_CTL(rx, w->shift);
+	gain_reg = CDC_RX_RXn_RX_VOL_CTL(rx, w->shift);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -1991,7 +2010,7 @@ static int rx_macro_config_compander(struct snd_soc_component *component,
 	if (comp == INTERP_AUX)
 		return 0;
 
-	pcm_rate = snd_soc_component_read(component, CDC_RX_RXn_RX_PATH_CTL(comp)) & 0x0F;
+	pcm_rate = snd_soc_component_read(component, CDC_RX_RXn_RX_PATH_CTL(rx, comp)) & 0x0F;
 	if (pcm_rate < 0x06)
 		val = 0x03;
 	else if (pcm_rate < 0x08)
@@ -2002,11 +2021,11 @@ static int rx_macro_config_compander(struct snd_soc_component *component,
 		val = 0x00;
 
 	if (SND_SOC_DAPM_EVENT_ON(event))
-		snd_soc_component_update_bits(component, CDC_RX_RXn_RX_PATH_CFG3(comp),
+		snd_soc_component_update_bits(component, CDC_RX_RXn_RX_PATH_CFG3(rx, comp),
 					      CDC_RX_DC_COEFF_SEL_MASK, val);
 
 	if (SND_SOC_DAPM_EVENT_OFF(event))
-		snd_soc_component_update_bits(component, CDC_RX_RXn_RX_PATH_CFG3(comp),
+		snd_soc_component_update_bits(component, CDC_RX_RXn_RX_PATH_CFG3(rx, comp),
 					      CDC_RX_DC_COEFF_SEL_MASK, 0x3);
 	if (!rx->comp_enabled[comp])
 		return 0;
@@ -2019,14 +2038,14 @@ static int rx_macro_config_compander(struct snd_soc_component *component,
 					      CDC_RX_COMPANDERn_SOFT_RST_MASK, 0x1);
 		snd_soc_component_write_field(component, CDC_RX_COMPANDERn_CTL0(comp),
 					      CDC_RX_COMPANDERn_SOFT_RST_MASK, 0x0);
-		snd_soc_component_write_field(component, CDC_RX_RXn_RX_PATH_CFG0(comp),
+		snd_soc_component_write_field(component, CDC_RX_RXn_RX_PATH_CFG0(rx, comp),
 					      CDC_RX_RXn_COMP_EN_MASK, 0x1);
 	}
 
 	if (SND_SOC_DAPM_EVENT_OFF(event)) {
 		snd_soc_component_write_field(component, CDC_RX_COMPANDERn_CTL0(comp),
 					      CDC_RX_COMPANDERn_HALT_MASK, 0x1);
-		snd_soc_component_write_field(component, CDC_RX_RXn_RX_PATH_CFG0(comp),
+		snd_soc_component_write_field(component, CDC_RX_RXn_RX_PATH_CFG0(rx, comp),
 					      CDC_RX_RXn_COMP_EN_MASK, 0x0);
 		snd_soc_component_write_field(component, CDC_RX_COMPANDERn_CTL0(comp),
 					      CDC_RX_COMPANDERn_CLK_EN_MASK, 0x0);
@@ -2125,13 +2144,13 @@ static int rx_macro_config_aux_hpf(struct snd_soc_component *component,
 		/* Update Aux HPF control */
 		if (!rx->is_aux_hpf_on)
 			snd_soc_component_update_bits(component,
-				CDC_RX_RX2_RX_PATH_CFG1, 0x04, 0x00);
+				CDC_RX_RXn_RX_PATH_CFG1(rx, 2), 0x04, 0x00);
 	}
 
 	if (SND_SOC_DAPM_EVENT_OFF(event)) {
 		/* Reset to default (HPF=ON) */
 		snd_soc_component_update_bits(component,
-			CDC_RX_RX2_RX_PATH_CFG1, 0x04, 0x04);
+			CDC_RX_RXn_RX_PATH_CFG1(rx, 2), 0x04, 0x04);
 	}
 
 	return 0;
@@ -2183,7 +2202,7 @@ static int rx_macro_config_classh(struct snd_soc_component *component,
 				CDC_RX_CLSH_DECAY_CTRL,
 				CDC_RX_CLSH_DECAY_RATE_MASK, 0x0);
 		snd_soc_component_write_field(component,
-				CDC_RX_RX0_RX_PATH_CFG0,
+				CDC_RX_RXn_RX_PATH_CFG0(rx, 0),
 				CDC_RX_RXn_CLSH_EN_MASK, 0x1);
 		break;
 	case INTERP_HPHR:
@@ -2199,15 +2218,15 @@ static int rx_macro_config_classh(struct snd_soc_component *component,
 				CDC_RX_CLSH_DECAY_CTRL,
 				CDC_RX_CLSH_DECAY_RATE_MASK, 0x0);
 		snd_soc_component_write_field(component,
-				CDC_RX_RX1_RX_PATH_CFG0,
+				CDC_RX_RXn_RX_PATH_CFG0(rx, 1),
 				CDC_RX_RXn_CLSH_EN_MASK, 0x1);
 		break;
 	case INTERP_AUX:
 		snd_soc_component_update_bits(component,
-				CDC_RX_RX2_RX_PATH_CFG0,
+				CDC_RX_RXn_RX_PATH_CFG0(rx, 2),
 				CDC_RX_RX2_DLY_Z_EN_MASK, 1);
 		snd_soc_component_write_field(component,
-				CDC_RX_RX2_RX_PATH_CFG0,
+				CDC_RX_RXn_RX_PATH_CFG0(rx, 2),
 				CDC_RX_RX2_CLSH_EN_MASK, 1);
 		break;
 	}
@@ -2218,16 +2237,17 @@ static int rx_macro_config_classh(struct snd_soc_component *component,
 static void rx_macro_hd2_control(struct snd_soc_component *component,
 				 u16 interp_idx, int event)
 {
+	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 	u16 hd2_scale_reg, hd2_enable_reg;
 
 	switch (interp_idx) {
 	case INTERP_HPHL:
-		hd2_scale_reg = CDC_RX_RX0_RX_PATH_SEC3;
-		hd2_enable_reg = CDC_RX_RX0_RX_PATH_CFG0;
+		hd2_scale_reg = CDC_RX_RXn_RX_PATH_SEC3(rx, 0);
+		hd2_enable_reg = CDC_RX_RXn_RX_PATH_CFG0(rx, 0);
 		break;
 	case INTERP_HPHR:
-		hd2_scale_reg = CDC_RX_RX1_RX_PATH_SEC3;
-		hd2_enable_reg = CDC_RX_RX1_RX_PATH_CFG0;
+		hd2_scale_reg = CDC_RX_RXn_RX_PATH_SEC3(rx, 1);
+		hd2_enable_reg = CDC_RX_RXn_RX_PATH_CFG0(rx, 1);
 		break;
 	}
 
@@ -2482,7 +2502,7 @@ static int rx_macro_hphdelay_lutbypass(struct snd_soc_component *component,
 		if (interp_idx == INTERP_HPHL) {
 			if (rx->is_ear_mode_on)
 				snd_soc_component_write_field(component,
-					CDC_RX_RX0_RX_PATH_CFG1,
+					CDC_RX_RXn_RX_PATH_CFG1(rx, 0),
 					CDC_RX_RX0_HPH_L_EAR_SEL_MASK, 0x1);
 			else
 				snd_soc_component_write_field(component,
@@ -2499,7 +2519,7 @@ static int rx_macro_hphdelay_lutbypass(struct snd_soc_component *component,
 
 	if (hph_lut_bypass_reg && SND_SOC_DAPM_EVENT_OFF(event)) {
 		snd_soc_component_write_field(component,
-					CDC_RX_RX0_RX_PATH_CFG1,
+					CDC_RX_RXn_RX_PATH_CFG1(rx, 0),
 					CDC_RX_RX0_HPH_L_EAR_SEL_MASK, 0x0);
 		snd_soc_component_update_bits(component, hph_lut_bypass_reg,
 					CDC_RX_TOP_HPH_LUT_BYPASS_MASK, 0);
@@ -2516,11 +2536,12 @@ static int rx_macro_enable_interp_clk(struct snd_soc_component *component,
 	u16 main_reg, dsm_reg, rx_cfg2_reg;
 	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 
-	main_reg = CDC_RX_RXn_RX_PATH_CTL(interp_idx);
-	dsm_reg = CDC_RX_RXn_RX_PATH_DSM_CTL(interp_idx);
+	main_reg = CDC_RX_RXn_RX_PATH_CTL(rx, interp_idx);
+	dsm_reg = CDC_RX_RXn_RX_PATH_DSM_CTL(rx, interp_idx);
 	if (interp_idx == INTERP_AUX)
-		dsm_reg = CDC_RX_RX2_RX_PATH_DSM_CTL;
-	rx_cfg2_reg = CDC_RX_RXn_RX_PATH_CFG2(interp_idx);
+		dsm_reg = CDC_RX_RXn_RX_PATH_DSM_CTL(rx, 2);
+
+	rx_cfg2_reg = CDC_RX_RXn_RX_PATH_CFG2(rx, interp_idx);
 
 	if (SND_SOC_DAPM_EVENT_ON(event)) {
 		if (rx->main_clk_users[interp_idx] == 0) {
@@ -2587,10 +2608,11 @@ static int rx_macro_enable_mix_path(struct snd_soc_dapm_widget *w,
 				    struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 	u16 gain_reg, mix_reg;
 
-	gain_reg = CDC_RX_RXn_RX_VOL_MIX_CTL(w->shift);
-	mix_reg = CDC_RX_RXn_RX_PATH_MIX_CTL(w->shift);
+	gain_reg = CDC_RX_RXn_RX_VOL_MIX_CTL(rx, w->shift);
+	mix_reg = CDC_RX_RXn_RX_PATH_MIX_CTL(rx, w->shift);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -2621,17 +2643,18 @@ static int rx_macro_enable_rx_path_clk(struct snd_soc_dapm_widget *w,
 				       struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		rx_macro_enable_interp_clk(component, event, w->shift);
-		snd_soc_component_write_field(component, CDC_RX_RXn_RX_PATH_CFG1(w->shift),
+		snd_soc_component_write_field(component, CDC_RX_RXn_RX_PATH_CFG1(rx, w->shift),
 					      CDC_RX_RXn_SIDETONE_EN_MASK, 1);
-		snd_soc_component_write_field(component, CDC_RX_RXn_RX_PATH_CTL(w->shift),
+		snd_soc_component_write_field(component, CDC_RX_RXn_RX_PATH_CTL(rx, w->shift),
 					      CDC_RX_PATH_CLK_EN_MASK, 1);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		snd_soc_component_write_field(component, CDC_RX_RXn_RX_PATH_CFG1(w->shift),
+		snd_soc_component_write_field(component, CDC_RX_RXn_RX_PATH_CFG1(rx, w->shift),
 					      CDC_RX_RXn_SIDETONE_EN_MASK, 0);
 		rx_macro_enable_interp_clk(component, event, w->shift);
 		break;
@@ -2801,20 +2824,22 @@ static int rx_macro_iir_filter_info(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-static const struct snd_kcontrol_new rx_macro_snd_controls[] = {
-	SOC_SINGLE_S8_TLV("RX_RX0 Digital Volume", CDC_RX_RX0_RX_VOL_CTL,
-			  -84, 40, digital_gain),
+static const struct snd_kcontrol_new rx_macro_def_snd_controls[] = {
 	SOC_SINGLE_S8_TLV("RX_RX1 Digital Volume", CDC_RX_RX1_RX_VOL_CTL,
 			  -84, 40, digital_gain),
 	SOC_SINGLE_S8_TLV("RX_RX2 Digital Volume", CDC_RX_RX2_RX_VOL_CTL,
 			  -84, 40, digital_gain),
-	SOC_SINGLE_S8_TLV("RX_RX0 Mix Digital Volume", CDC_RX_RX0_RX_VOL_MIX_CTL,
-			  -84, 40, digital_gain),
 	SOC_SINGLE_S8_TLV("RX_RX1 Mix Digital Volume", CDC_RX_RX1_RX_VOL_MIX_CTL,
 			  -84, 40, digital_gain),
 	SOC_SINGLE_S8_TLV("RX_RX2 Mix Digital Volume", CDC_RX_RX2_RX_VOL_MIX_CTL,
 			  -84, 40, digital_gain),
+};
 
+static const struct snd_kcontrol_new rx_macro_snd_controls[] = {
+	SOC_SINGLE_S8_TLV("RX_RX0 Digital Volume", CDC_RX_RX0_RX_VOL_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX_RX0 Mix Digital Volume", CDC_RX_RX0_RX_VOL_MIX_CTL,
+			  -84, 40, digital_gain),
 	SOC_SINGLE_EXT("RX_COMP1 Switch", SND_SOC_NOPM, RX_MACRO_COMP1, 1, 0,
 		rx_macro_get_compander, rx_macro_set_compander),
 	SOC_SINGLE_EXT("RX_COMP2 Switch", SND_SOC_NOPM, RX_MACRO_COMP2, 1, 0,
@@ -2931,6 +2956,10 @@ static int rx_macro_enable_echo(struct snd_soc_dapm_widget *w,
 
 	return 0;
 }
+static const struct snd_soc_dapm_widget rx_macro_def_dapm_widgets[] = {
+	SND_SOC_DAPM_MUX("RX INT1 DEM MUX", SND_SOC_NOPM, 0, 0,
+			 &rx_int1_dem_inp_mux),
+};
 
 static const struct snd_soc_dapm_widget rx_macro_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_IN("RX AIF1 PB", "RX_MACRO_AIF1 Playback", 0,
@@ -3003,8 +3032,6 @@ static const struct snd_soc_dapm_widget rx_macro_dapm_widgets[] = {
 
 	SND_SOC_DAPM_MUX("RX INT0 DEM MUX", SND_SOC_NOPM, 0, 0,
 			 &rx_int0_dem_inp_mux),
-	SND_SOC_DAPM_MUX("RX INT1 DEM MUX", SND_SOC_NOPM, 0, 0,
-			 &rx_int1_dem_inp_mux),
 
 	SND_SOC_DAPM_MUX_E("RX INT0_2 MUX", SND_SOC_NOPM, INTERP_HPHL, 0,
 		&rx_int0_2_mux, rx_macro_enable_mix_path,
@@ -3399,32 +3426,46 @@ static const struct snd_soc_dapm_route rx_audio_map[] = {
 
 static int rx_macro_component_probe(struct snd_soc_component *component)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
+	const struct snd_soc_dapm_widget *widgets;
+	const struct snd_kcontrol_new *controls;
+	unsigned int num_controls;
+	int ret, num_widgets;
 
 	snd_soc_component_init_regmap(component, rx->regmap);
 
-	snd_soc_component_update_bits(component, CDC_RX_RX0_RX_PATH_SEC7,
+	snd_soc_component_update_bits(component, CDC_RX_RXn_RX_PATH_SEC7(rx, 0),
 				      CDC_RX_DSM_OUT_DELAY_SEL_MASK,
 				      CDC_RX_DSM_OUT_DELAY_TWO_SAMPLE);
-	snd_soc_component_update_bits(component, CDC_RX_RX1_RX_PATH_SEC7,
+	snd_soc_component_update_bits(component, CDC_RX_RXn_RX_PATH_SEC7(rx, 1),
 				      CDC_RX_DSM_OUT_DELAY_SEL_MASK,
 				      CDC_RX_DSM_OUT_DELAY_TWO_SAMPLE);
-	snd_soc_component_update_bits(component, CDC_RX_RX2_RX_PATH_SEC7,
+	snd_soc_component_update_bits(component, CDC_RX_RXn_RX_PATH_SEC7(rx, 2),
 				      CDC_RX_DSM_OUT_DELAY_SEL_MASK,
 				      CDC_RX_DSM_OUT_DELAY_TWO_SAMPLE);
-	snd_soc_component_update_bits(component, CDC_RX_RX0_RX_PATH_CFG3,
+	snd_soc_component_update_bits(component, CDC_RX_RXn_RX_PATH_CFG3(rx, 0),
 				      CDC_RX_DC_COEFF_SEL_MASK,
 				      CDC_RX_DC_COEFF_SEL_TWO);
-	snd_soc_component_update_bits(component, CDC_RX_RX1_RX_PATH_CFG3,
+	snd_soc_component_update_bits(component, CDC_RX_RXn_RX_PATH_CFG3(rx, 1),
 				      CDC_RX_DC_COEFF_SEL_MASK,
 				      CDC_RX_DC_COEFF_SEL_TWO);
-	snd_soc_component_update_bits(component, CDC_RX_RX2_RX_PATH_CFG3,
+	snd_soc_component_update_bits(component, CDC_RX_RXn_RX_PATH_CFG3(rx, 2),
 				      CDC_RX_DC_COEFF_SEL_MASK,
 				      CDC_RX_DC_COEFF_SEL_TWO);
 
+	controls = rx_macro_def_snd_controls;
+	num_controls = ARRAY_SIZE(rx_macro_def_snd_controls);
+	widgets = rx_macro_def_dapm_widgets;
+	num_widgets = ARRAY_SIZE(rx_macro_def_dapm_widgets);
+
 	rx->component = component;
 
-	return 0;
+	ret = snd_soc_add_component_controls(component, controls, num_controls);
+	if (ret)
+		return ret;
+
+	return snd_soc_dapm_new_controls(dapm, widgets, num_widgets);
 }
 
 static int swclk_gate_enable(struct clk_hw *hw)
@@ -3523,11 +3564,12 @@ static const struct snd_soc_component_driver rx_macro_component_drv = {
 
 static int rx_macro_probe(struct platform_device *pdev)
 {
+	struct reg_default *reg_defaults;
 	struct device *dev = &pdev->dev;
 	kernel_ulong_t flags;
 	struct rx_macro *rx;
 	void __iomem *base;
-	int ret;
+	int ret, def_count;
 
 	flags = (kernel_ulong_t)device_get_match_data(dev);
 
@@ -3566,6 +3608,19 @@ static int rx_macro_probe(struct platform_device *pdev)
 		ret = PTR_ERR(base);
 		goto err;
 	}
+	rx->codec_version = lpass_macro_get_codec_version();
+
+	rx->rxn_reg_stride = 0x80;
+	def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_pre_2_5_defaults);
+	reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
+	if (!reg_defaults)
+		return -ENOMEM;
+	memcpy(&reg_defaults[0], rx_defaults, sizeof(rx_defaults));
+	memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
+			rx_pre_2_5_defaults, sizeof(rx_pre_2_5_defaults));
+
+	rx_regmap_config.reg_defaults = reg_defaults;
+	rx_regmap_config.num_reg_defaults = def_count;
 
 	rx->regmap = devm_regmap_init_mmio(dev, base, &rx_regmap_config);
 	if (IS_ERR(rx->regmap)) {
@@ -3629,6 +3684,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_clkout;
 
+	kfree(reg_defaults);
 	return 0;
 
 err_clkout:
@@ -3642,6 +3698,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 err_dcodec:
 	clk_disable_unprepare(rx->macro);
 err:
+	kfree(reg_defaults);
 	lpass_macro_pds_exit(rx->pds);
 
 	return ret;

-- 
2.25.1


