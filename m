Return-Path: <linux-arm-msm+bounces-22574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC72906A6A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 12:50:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEB1A282762
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 10:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A48142E71;
	Thu, 13 Jun 2024 10:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="io4VgMQV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEE41428EF
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 10:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718275788; cv=none; b=nUtADYtBF1pX4jC+j7TjbqSSI8TunT4suACZ3I6RZfwDdB5nffpaOltLK+NxscqbE4c0HzKyozxyseYN1Vd8EFbyi0AW0KDWjdaS9B4r1hOFJlR6DE1HYUGuhQn7R3FF+pJDe3p8c1+vHf3mERKs62U1U7U0ydH8S/PmKPhcABY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718275788; c=relaxed/simple;
	bh=W8Z9ariOdTdB4BEP9y5dSPIrqMhesxPnDncFzUaxhYw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OWsSi8t9ZZEN8Sia+JANeeuBZUpPlTpp/O4vR6EIbQA+6xgsxsI0iO4E8wY2tmLkL80tzZ6hOMSxARwxssppKwoIOFJfDIp2ibVzpU5QiVvbl3vOQTZDx/Ew+imJr75rizjtTrbcFvZ6g91DseZlVpt4kbCGAgz6Bj8OduyQT8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=io4VgMQV; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-57c8353d8d0so854204a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 03:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718275784; x=1718880584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U5Dbj2tNPPRmGqfhK6AHzXiGKWxuXHpu/BVao47nlUo=;
        b=io4VgMQVuk235zsiOK7AEy4bS/lt+MnY15chW/gMwcxgOd08H0VNwUe2prTy5Ogyyf
         GbqN7IDWzYQMS3csu9FY0mXLgrSy8ZXpsuHA6mlOmS8JzaysYJ618xMQHQ0fO4EEBT5U
         y5hDsybeN17Vbdzybpp5Ur3ery9GHJ1S1WhxMJlVZMAkKueU/7+0PXcAlk2Xtufs9J6u
         BVOHq8ndnTdLON6gHa7EuD6JxO30DrPl5qJxXbNLgSAUxIjoBmPt3Um0D5gWFFq0CJsE
         s8qf16/Q4seWhMkjnHFzZ3U6QnAauLmrHbiN/OXmlxjVN5FXoHkf5iJ9BoI5tCbrVs4P
         P77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718275784; x=1718880584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U5Dbj2tNPPRmGqfhK6AHzXiGKWxuXHpu/BVao47nlUo=;
        b=NWL4xTT6TJkpXSC9uqhiYSwHLvdYq1Hms98OEEP2/MxiI+wEuIDhyOWx+jpmrgTRDw
         NNjDIdbn2yLahg/uGo3vEMF6t8JtM1//yR2RTpkTqN4OujxbBZ7xEwlYFc5LElLdZGwd
         kNgzPxs7498jXabhG3NZNpWxjGtBs1XIvSpcpo+Zc+vmnCecHrjc+IRxNDjUKE21+LkT
         L5ohsvoketAuY6puJQLXEULZMxcNrGUXDX1zDLymr1jbxj3Lk/mg03Waf4Rj1w4SN0s2
         PQGPFECVIEGzzttHMgvGer/1TBcWjjIO9w2KhDjDeUfDYbVRuFrJdkxLZyYcoS3+tbLi
         lXtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIQM7Nb8wKRExnINQuI1fcvvImIPWpcbc4rEsxnTC+CzUdGnVdSqNcXyHt3ona8PlDAlf1CqJ3fLcdRIgPzzFfkP5cA4VBi/AFZhprbA==
X-Gm-Message-State: AOJu0Yy/5/s3cJA27v/engWbP+M3ljWYOw5Lnqll9GlcPV0OBaFUXEkG
	tY1qcfj6AYZaDoJhdxcihrws/uIo8nsSiDH/tOO6KPkz+DxbhpINx6B7ZuBEoJM=
X-Google-Smtp-Source: AGHT+IE6jbEo6eR9gE1efQOg/KSHJMC7rOyygFVEHaOeFqRsLpmsfS/WwNzk/nMsXNwVOVMJkQq1UQ==
X-Received: by 2002:a50:cd54:0:b0:57c:5f70:36d2 with SMTP id 4fb4d7f45d1cf-57ca976d543mr2717898a12.15.1718275783912;
        Thu, 13 Jun 2024 03:49:43 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72cdf2bsm762618a12.17.2024.06.13.03.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 03:49:43 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Thu, 13 Jun 2024 11:49:32 +0100
Subject: [PATCH v4 2/3] ASoC: codec: lpass-rx-macro: prepare driver to
 accomdate new codec versions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-lpass-codec-v25-v4-2-f63d3676dbc4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=31710;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=W8Z9ariOdTdB4BEP9y5dSPIrqMhesxPnDncFzUaxhYw=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmas7Da1k0vz6je4pknJbh5yHslifFNsQoGkEI2
 s9hhycKkLaJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZmrOwwAKCRB6of1ZxzRV
 Nw0xB/9r07Mghxu7Gso1moA6ps/T+6WxQ3s9HZQRmwD2vT3s6NWdreInHAFRbbzhIJzCtfrzJfn
 SBj6VFLU8hSKb/SUmyL76o8tGBtiB77DQ6o/00X4ZfXRCehJABowmZXE8JRMK14ap8RDQcft+lO
 W1gHtaoE/z9wRrP/mh1UErynPwaexW6xaEJCK7XiF4CKbAK7RcHX9oYlYGcWn4fzIHM/hjJKS5B
 PxK9o/w/ywzMclBZjqinvX4O2l7YqMDssd4ijbnt1VMjTzTXosLhO/IST2aPUbGQI5d41JLBmoY
 3hTQ5cL81w1sMZrYh+ixuJkipInZglrtAudM+5DYY0EAjpiQ
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6

LPASS Codec v2.5 has significant changes in the rx block register strides.
This is a preparatory patch to do the required changes in the existing driver
to be able to accomdate these changes.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
---
 sound/soc/codecs/lpass-rx-macro.c | 397 +++++++++++++++++++++++---------------
 1 file changed, 244 insertions(+), 153 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index f35187d69cac..360c9003a890 100644
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
@@ -1175,8 +1184,62 @@ static bool rx_is_volatile_register(struct device *dev, unsigned int reg)
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
+	struct rx_macro *rx = dev_get_drvdata(dev);
+
 	switch (reg) {
 	case CDC_RX_TOP_TOP_CFG0:
 	case CDC_RX_TOP_SWR_CTRL:
@@ -1306,49 +1369,6 @@ static bool rx_is_rw_register(struct device *dev, unsigned int reg)
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
@@ -1435,6 +1455,16 @@ static bool rx_is_rw_register(struct device *dev, unsigned int reg)
 		return true;
 	}
 
+	switch (rx->codec_version) {
+	case LPASS_CODEC_VERSION_1_0:
+	case LPASS_CODEC_VERSION_1_1:
+	case LPASS_CODEC_VERSION_1_2:
+	case LPASS_CODEC_VERSION_2_0:
+		return rx_pre_2_5_is_rw_register(dev, reg);
+	default:
+		break;
+	}
+
 	return false;
 }
 
@@ -1485,14 +1515,12 @@ static bool rx_is_readable_register(struct device *dev, unsigned int reg)
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
@@ -1504,16 +1532,17 @@ static int rx_macro_int_dem_inp_mux_put(struct snd_kcontrol *kcontrol,
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
@@ -1567,7 +1596,7 @@ static int rx_macro_set_prim_interpolator_rate(struct snd_soc_dai *dai,
 			if ((inp0_sel == int_1_mix1_inp + INTn_1_INP_SEL_RX0) ||
 			    (inp1_sel == int_1_mix1_inp + INTn_1_INP_SEL_RX0) ||
 			    (inp2_sel == int_1_mix1_inp + INTn_1_INP_SEL_RX0)) {
-				int_fs_reg = CDC_RX_RXn_RX_PATH_CTL(j);
+				int_fs_reg = CDC_RX_RXn_RX_PATH_CTL(rx, j);
 				/* sample_rate is in Hz */
 				snd_soc_component_update_bits(component, int_fs_reg,
 							      CDC_RX_PATH_PCM_RATE_MASK,
@@ -1600,7 +1629,7 @@ static int rx_macro_set_mix_interpolator_rate(struct snd_soc_dai *dai,
 									CDC_RX_INTX_2_SEL_MASK);
 
 			if (int_mux_cfg1_val == int_2_inp + INTn_2_INP_SEL_RX0) {
-				int_fs_reg = CDC_RX_RXn_RX_PATH_MIX_CTL(j);
+				int_fs_reg = CDC_RX_RXn_RX_PATH_MIX_CTL(rx, j);
 				snd_soc_component_update_bits(component, int_fs_reg,
 							      CDC_RX_RXn_MIX_PCM_RATE_MASK,
 							      rate_reg_val);
@@ -1719,6 +1748,7 @@ static int rx_macro_get_channel_map(struct snd_soc_dai *dai,
 static int rx_macro_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
 {
 	struct snd_soc_component *component = dai->component;
+	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 	uint16_t j, reg, mix_reg, dsm_reg;
 	u16 int_mux_cfg0, int_mux_cfg1;
 	u8 int_mux_cfg0_val, int_mux_cfg1_val;
@@ -1729,9 +1759,9 @@ static int rx_macro_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
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
@@ -1748,7 +1778,7 @@ static int rx_macro_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
 			}
 
 			if (j == INTERP_AUX)
-				dsm_reg = CDC_RX_RX2_RX_PATH_DSM_CTL;
+				dsm_reg = CDC_RX_RXn_RX_PATH_DSM_CTL(rx, 2);
 
 			int_mux_cfg0 = CDC_RX_INP_MUX_RX_INT0_CFG0 + j * 8;
 			int_mux_cfg1 = int_mux_cfg0 + 4;
@@ -1956,10 +1986,11 @@ static int rx_macro_enable_main_path(struct snd_soc_dapm_widget *w,
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
@@ -1991,7 +2022,7 @@ static int rx_macro_config_compander(struct snd_soc_component *component,
 	if (comp == INTERP_AUX)
 		return 0;
 
-	pcm_rate = snd_soc_component_read(component, CDC_RX_RXn_RX_PATH_CTL(comp)) & 0x0F;
+	pcm_rate = snd_soc_component_read(component, CDC_RX_RXn_RX_PATH_CTL(rx, comp)) & 0x0F;
 	if (pcm_rate < 0x06)
 		val = 0x03;
 	else if (pcm_rate < 0x08)
@@ -2002,11 +2033,11 @@ static int rx_macro_config_compander(struct snd_soc_component *component,
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
@@ -2019,14 +2050,14 @@ static int rx_macro_config_compander(struct snd_soc_component *component,
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
@@ -2125,13 +2156,13 @@ static int rx_macro_config_aux_hpf(struct snd_soc_component *component,
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
@@ -2183,7 +2214,7 @@ static int rx_macro_config_classh(struct snd_soc_component *component,
 				CDC_RX_CLSH_DECAY_CTRL,
 				CDC_RX_CLSH_DECAY_RATE_MASK, 0x0);
 		snd_soc_component_write_field(component,
-				CDC_RX_RX0_RX_PATH_CFG0,
+				CDC_RX_RXn_RX_PATH_CFG0(rx, 0),
 				CDC_RX_RXn_CLSH_EN_MASK, 0x1);
 		break;
 	case INTERP_HPHR:
@@ -2199,15 +2230,15 @@ static int rx_macro_config_classh(struct snd_soc_component *component,
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
@@ -2218,16 +2249,17 @@ static int rx_macro_config_classh(struct snd_soc_component *component,
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
 
@@ -2482,7 +2514,7 @@ static int rx_macro_hphdelay_lutbypass(struct snd_soc_component *component,
 		if (interp_idx == INTERP_HPHL) {
 			if (rx->is_ear_mode_on)
 				snd_soc_component_write_field(component,
-					CDC_RX_RX0_RX_PATH_CFG1,
+					CDC_RX_RXn_RX_PATH_CFG1(rx, 0),
 					CDC_RX_RX0_HPH_L_EAR_SEL_MASK, 0x1);
 			else
 				snd_soc_component_write_field(component,
@@ -2499,7 +2531,7 @@ static int rx_macro_hphdelay_lutbypass(struct snd_soc_component *component,
 
 	if (hph_lut_bypass_reg && SND_SOC_DAPM_EVENT_OFF(event)) {
 		snd_soc_component_write_field(component,
-					CDC_RX_RX0_RX_PATH_CFG1,
+					CDC_RX_RXn_RX_PATH_CFG1(rx, 0),
 					CDC_RX_RX0_HPH_L_EAR_SEL_MASK, 0x0);
 		snd_soc_component_update_bits(component, hph_lut_bypass_reg,
 					CDC_RX_TOP_HPH_LUT_BYPASS_MASK, 0);
@@ -2516,11 +2548,12 @@ static int rx_macro_enable_interp_clk(struct snd_soc_component *component,
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
@@ -2587,10 +2620,11 @@ static int rx_macro_enable_mix_path(struct snd_soc_dapm_widget *w,
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
@@ -2621,17 +2655,18 @@ static int rx_macro_enable_rx_path_clk(struct snd_soc_dapm_widget *w,
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
@@ -2801,20 +2836,22 @@ static int rx_macro_iir_filter_info(struct snd_kcontrol *kcontrol,
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
@@ -2931,6 +2968,10 @@ static int rx_macro_enable_echo(struct snd_soc_dapm_widget *w,
 
 	return 0;
 }
+static const struct snd_soc_dapm_widget rx_macro_def_dapm_widgets[] = {
+	SND_SOC_DAPM_MUX("RX INT1 DEM MUX", SND_SOC_NOPM, 0, 0,
+			 &rx_int1_dem_inp_mux),
+};
 
 static const struct snd_soc_dapm_widget rx_macro_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_IN("RX AIF1 PB", "RX_MACRO_AIF1 Playback", 0,
@@ -3003,8 +3044,6 @@ static const struct snd_soc_dapm_widget rx_macro_dapm_widgets[] = {
 
 	SND_SOC_DAPM_MUX("RX INT0 DEM MUX", SND_SOC_NOPM, 0, 0,
 			 &rx_int0_dem_inp_mux),
-	SND_SOC_DAPM_MUX("RX INT1 DEM MUX", SND_SOC_NOPM, 0, 0,
-			 &rx_int1_dem_inp_mux),
 
 	SND_SOC_DAPM_MUX_E("RX INT0_2 MUX", SND_SOC_NOPM, INTERP_HPHL, 0,
 		&rx_int0_2_mux, rx_macro_enable_mix_path,
@@ -3399,32 +3438,55 @@ static const struct snd_soc_dapm_route rx_audio_map[] = {
 
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
 
+	switch (rx->codec_version) {
+	case LPASS_CODEC_VERSION_1_0:
+	case LPASS_CODEC_VERSION_1_1:
+	case LPASS_CODEC_VERSION_1_2:
+	case LPASS_CODEC_VERSION_2_0:
+		controls = rx_macro_def_snd_controls;
+		num_controls = ARRAY_SIZE(rx_macro_def_snd_controls);
+		widgets = rx_macro_def_dapm_widgets;
+		num_widgets = ARRAY_SIZE(rx_macro_def_dapm_widgets);
+		break;
+	default:
+		return -EINVAL;
+	}
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
@@ -3523,11 +3585,12 @@ static const struct snd_soc_component_driver rx_macro_component_drv = {
 
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
 
@@ -3566,11 +3629,36 @@ static int rx_macro_probe(struct platform_device *pdev)
 		ret = PTR_ERR(base);
 		goto err;
 	}
+	rx->codec_version = lpass_macro_get_codec_version();
+	switch (rx->codec_version) {
+	case LPASS_CODEC_VERSION_1_0:
+	case LPASS_CODEC_VERSION_1_1:
+	case LPASS_CODEC_VERSION_1_2:
+	case LPASS_CODEC_VERSION_2_0:
+		rx->rxn_reg_stride = 0x80;
+		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_pre_2_5_defaults);
+		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
+		if (!reg_defaults) {
+			ret = -ENOMEM;
+			goto err;
+		}
+		memcpy(&reg_defaults[0], rx_defaults, sizeof(rx_defaults));
+		memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
+				rx_pre_2_5_defaults, sizeof(rx_pre_2_5_defaults));
+		break;
+	default:
+		dev_err(rx->dev, "Unsupported Codec version (%d)\n", rx->codec_version);
+		ret = -EINVAL;
+		goto err;
+	}
+
+	rx_regmap_config.reg_defaults = reg_defaults;
+	rx_regmap_config.num_reg_defaults = def_count;
 
 	rx->regmap = devm_regmap_init_mmio(dev, base, &rx_regmap_config);
 	if (IS_ERR(rx->regmap)) {
 		ret = PTR_ERR(rx->regmap);
-		goto err;
+		goto err_ver;
 	}
 
 	dev_set_drvdata(dev, rx);
@@ -3583,7 +3671,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 
 	ret = clk_prepare_enable(rx->macro);
 	if (ret)
-		goto err;
+		goto err_ver;
 
 	ret = clk_prepare_enable(rx->dcodec);
 	if (ret)
@@ -3629,6 +3717,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_clkout;
 
+	kfree(reg_defaults);
 	return 0;
 
 err_clkout:
@@ -3641,6 +3730,8 @@ static int rx_macro_probe(struct platform_device *pdev)
 	clk_disable_unprepare(rx->dcodec);
 err_dcodec:
 	clk_disable_unprepare(rx->macro);
+err_ver:
+	kfree(reg_defaults);
 err:
 	lpass_macro_pds_exit(rx->pds);
 

-- 
2.25.1


