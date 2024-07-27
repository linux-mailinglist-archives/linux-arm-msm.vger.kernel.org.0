Return-Path: <linux-arm-msm+bounces-27128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E96693E073
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 20:21:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69CAF1C20E4F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 18:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37980187843;
	Sat, 27 Jul 2024 18:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7IrBQmI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D5E18757F;
	Sat, 27 Jul 2024 18:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722104456; cv=none; b=WLLLzCtuxVkp5YQCe6srzo5ozRBfgKnTy6Ju7ZOwym/+Hu/C4v3iOJCpQs1FSFEpa0QDSG4IV6Nb8tWvj2dbsRPxz7UV8UyKmvHV0rEWuXzN5Vq8j98QVd7pbg/SrAMSMOz+1tHyWE71UhoL7as6U9P1OfKYDMGl+tmW3TlwQVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722104456; c=relaxed/simple;
	bh=EFy7tExuqG9na7Q+Y80CJaISj3tjIZbe4+zf3f1TTaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iK5RveG9bj/lZ7i5zuuaRwbKCZlqD4UBttf1NpldDGaTNqlV/z3cjx882+syE06x2dyBmFkPJNfaUhcG6eg3ZvXnKpsDMojFeNoe8SV2E6lvjwkmJJCqZkR6vwKW94SJoejGYylvD2uGvAsL9EGcX1Poa/0uwT/mB/GBN0ife+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7IrBQmI; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f035ae0fd1so26359641fa.2;
        Sat, 27 Jul 2024 11:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722104452; x=1722709252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GF6xFxPj/ytlezNbhhUqMrRGdstZMHpzQeT2XWw6wjY=;
        b=C7IrBQmITHfmf6QelZlWJjAofQc/smf/U1TB4DqOPQjVzkNBhQbJOqUOqKorQSd+yv
         +KN2pRg86hHQw0Jv0sEv53IHLf+D9F+N6KxyDKSZQvcwu9i1lyPQA0MOf9648lnFUff4
         RCQGujd3W7do+A9cQ/xm1c0lXvfgL4kwNoD4uv7JunY1tZSiqizapy8efCuq8L00m8lX
         cwyTYiuApF2JzDAIpidDSPjwdR5FUPQYiegbtxVuYi+bidCa5nLK2uCYiUe+QMyy6Znw
         AvxySaNF9NOPgamn7V+aR2NGzvjvE+JKmDrznJq5PRLDWppHSaahEc3n4W2YHdXWUCPs
         bKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722104452; x=1722709252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GF6xFxPj/ytlezNbhhUqMrRGdstZMHpzQeT2XWw6wjY=;
        b=faOMihb0/V9nt8TPFf8hqu2RZzxYLYCge/Jbt+4T3MZ1v9x+38NH6w8iRF0wZhMKWu
         67yk7GT01CNQ+3tSJarq24a42/eWbPTfdBGLu9b9heGIgYIoxvsGE4JiMjVjB0uGB/eD
         iO0JWPzw8CYUVPmqw6Sjy5pcbunpnqjGZCKIxdtKY8UIvr3JOc733jLNTJ2LV74K4jXl
         RhRpHxPGNV4btBCN8KXDDRDZEtCJH8abdR5c80CrS+MHWRp7M61wEX7Rwegp+LhWw+mQ
         j0qX0cAVrWb2kTtq5id45eafHc2xR5jRS6oV4eWk5h7GvcAA8el71F19dXrPEW+t/fsO
         mArQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRH9gqLeOzrz3BEPOvszptw4qFTYVeij7PFKT0E/7jQTwdzkJC54hqOdh4CKcMShh2DN6xZPWwxq6jkKJPPMVASAGWXcdQ1/lZt6I2xfbPj3P+OaFO4/OXqq7XPr6X9pWf2W7lEfF3MiKV99RPy/20Ml5oL8tm/Cd4jEvPNqt9Vyo7cOfSngrJ30gXSevtIiOZV/T7lCX0gjmSnT6kTyv2lud6PA==
X-Gm-Message-State: AOJu0Yw2h0zwxkeuZvhA0KMqpbQdipiqMl+XLZkx01yBmeWH+KtjtA/I
	H1YR43C6ltxwsRRrmEJsB2YcMn5b5FoCSuvEFlnf3k5x1vMM/2hDe1yxRA==
X-Google-Smtp-Source: AGHT+IEm/COoGFbHv82FK7uvxWXcLwKhJWA1hhbjMFP9GYJUO820ubZBT+LuGLrHoMr/gFZyfg3itg==
X-Received: by 2002:a2e:3a19:0:b0:2ee:4c2e:3d3b with SMTP id 38308e7fff4ca-2f12ee02fa2mr19973671fa.4.1722104451431;
        Sat, 27 Jul 2024 11:20:51 -0700 (PDT)
Received: from localhost.localdomain (byw127.neoplus.adsl.tpnet.pl. [83.30.42.127])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f03d077226sm7504891fa.126.2024.07.27.11.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 11:20:50 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Adam Skladowski <a39.skl@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: [PATCH v2 2/4] ASoC: msm8916-wcd-analog: add cajon and cajon v2 support
Date: Sat, 27 Jul 2024 20:20:25 +0200
Message-ID: <20240727182031.35069-3-a39.skl@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240727182031.35069-1-a39.skl@gmail.com>
References: <20240727182031.35069-1-a39.skl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vladimir Lypak <vladimir.lypak@gmail.com>

Add regs overrides for Cajon(PM8952) and Cajon v2(PM8953) codecs.

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
[Adam: Add Cajon support,add msg]
Co-developed-by: Adam Skladowski <a39.skl@gmail.com>
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 sound/soc/codecs/msm8916-wcd-analog.c | 63 +++++++++++++++++++++++++--
 1 file changed, 60 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
index 9ca381812975..daf65f5d4e99 100644
--- a/sound/soc/codecs/msm8916-wcd-analog.c
+++ b/sound/soc/codecs/msm8916-wcd-analog.c
@@ -250,6 +250,7 @@
 		SPKR_DRV_CAL_EN | SPKR_DRV_SETTLE_EN | \
 		SPKR_DRV_FW_EN | SPKR_DRV_BOOST_SET | \
 		SPKR_DRV_CMFB_SET | SPKR_DRV_GAIN_SET)
+#define CDC_A_SPKR_ANA_BIAS_SET		(0xf1B3)
 #define CDC_A_SPKR_OCP_CTL		(0xf1B4)
 #define CDC_A_SPKR_PWRSTG_CTL		(0xf1B5)
 #define SPKR_PWRSTG_CTL_DAC_EN_MASK	BIT(0)
@@ -264,12 +265,15 @@
 
 #define CDC_A_SPKR_DRV_DBG		(0xf1B7)
 #define CDC_A_CURRENT_LIMIT		(0xf1C0)
+#define CDC_A_BYPASS_MODE		(0xf1C2)
 #define CDC_A_BOOST_EN_CTL		(0xf1C3)
 #define CDC_A_SLOPE_COMP_IP_ZERO	(0xf1C4)
 #define CDC_A_SEC_ACCESS		(0xf1D0)
 #define CDC_A_PERPH_RESET_CTL3		(0xf1DA)
 #define CDC_A_PERPH_RESET_CTL4		(0xf1DB)
 
+#define CDC_A_RX_EAR_STATUS		(0xf1A1)
+
 #define MSM8916_WCD_ANALOG_RATES (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
 			SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000)
 #define MSM8916_WCD_ANALOG_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
@@ -715,6 +719,50 @@ static const struct reg_default wcd_reg_defaults_2_0[] = {
 	{CDC_A_MASTER_BIAS_CTL, 0x30},
 };
 
+static const struct reg_default wcd_reg_defaults_cajon[] = {
+	{CDC_A_RX_COM_OCP_CTL, 0xD1},
+	{CDC_A_RX_COM_OCP_COUNT, 0xFF},
+	{CDC_D_SEC_ACCESS, 0xA5},
+	{CDC_D_PERPH_RESET_CTL3, 0x0F},
+	{CDC_A_TX_1_2_OPAMP_BIAS, 0x4C},
+	{CDC_A_NCP_FBCTRL, 0xA8},
+	{CDC_A_NCP_VCTRL, 0xA4},
+	{CDC_A_SPKR_DRV_CTL, 0x69},
+	{CDC_A_SPKR_DRV_DBG, 0x01},
+	{CDC_A_SEC_ACCESS, 0xA5},
+	{CDC_A_PERPH_RESET_CTL3, 0x0F},
+	{CDC_A_CURRENT_LIMIT, 0x82},
+	{CDC_A_SPKR_ANA_BIAS_SET, 0x41},
+	{CDC_A_SPKR_DAC_CTL, 0x03},
+	{CDC_A_SPKR_OCP_CTL, 0xE1},
+	{CDC_A_RX_HPH_BIAS_PA, 0xFA},
+	{CDC_A_MASTER_BIAS_CTL, 0x30},
+	{CDC_A_MICB_1_INT_RBIAS, 0x00},
+};
+
+static const struct reg_default wcd_reg_defaults_cajon_2_0[] = {
+	{CDC_A_RX_COM_OCP_CTL, 0xD1},
+	{CDC_A_RX_COM_OCP_COUNT, 0xFF},
+	{CDC_D_SEC_ACCESS, 0xA5},
+	{CDC_D_PERPH_RESET_CTL3, 0x0F},
+	{CDC_A_TX_1_2_OPAMP_BIAS, 0x4C},
+	{CDC_A_NCP_FBCTRL, 0xA8},
+	{CDC_A_NCP_VCTRL, 0xA4},
+	{CDC_A_SPKR_DRV_CTL, 0x69},
+	{CDC_A_SPKR_DRV_DBG, 0x01},
+	{CDC_A_SEC_ACCESS, 0xA5},
+	{CDC_A_PERPH_RESET_CTL3, 0x0F},
+	{CDC_A_CURRENT_LIMIT, 0xA2},
+	{CDC_A_BYPASS_MODE, 0x18},
+	{CDC_A_SPKR_ANA_BIAS_SET, 0x41},
+	{CDC_A_SPKR_DAC_CTL, 0x03},
+	{CDC_A_SPKR_OCP_CTL, 0xE1},
+	{CDC_A_RX_HPH_BIAS_PA, 0xFA},
+	{CDC_A_RX_EAR_STATUS, 0x10},
+	{CDC_A_MASTER_BIAS_CTL, 0x30},
+	{CDC_A_MICB_1_INT_RBIAS, 0x00},
+};
+
 static int pm8916_wcd_analog_probe(struct snd_soc_component *component)
 {
 	struct pm8916_wcd_analog_priv *priv = dev_get_drvdata(component->dev);
@@ -738,9 +786,18 @@ static int pm8916_wcd_analog_probe(struct snd_soc_component *component)
 	snd_soc_component_write(component, CDC_D_PERPH_RESET_CTL4, 0x01);
 	snd_soc_component_write(component, CDC_A_PERPH_RESET_CTL4, 0x01);
 
-	for (reg = 0; reg < ARRAY_SIZE(wcd_reg_defaults_2_0); reg++)
-		snd_soc_component_write(component, wcd_reg_defaults_2_0[reg].reg,
-			      wcd_reg_defaults_2_0[reg].def);
+	if (priv->codec_version == 4)
+		for (reg = 0; reg < ARRAY_SIZE(wcd_reg_defaults_cajon_2_0); reg++)
+			snd_soc_component_write(component, wcd_reg_defaults_cajon_2_0[reg].reg,
+					wcd_reg_defaults_cajon_2_0[reg].def);
+	else if (priv->codec_version == 3)
+		for (reg = 0; reg < ARRAY_SIZE(wcd_reg_defaults_cajon); reg++)
+			snd_soc_component_write(component, wcd_reg_defaults_cajon[reg].reg,
+					wcd_reg_defaults_cajon[reg].def);
+	else
+		for (reg = 0; reg < ARRAY_SIZE(wcd_reg_defaults_2_0); reg++)
+			snd_soc_component_write(component, wcd_reg_defaults_2_0[reg].reg,
+					wcd_reg_defaults_2_0[reg].def);
 
 	priv->component = component;
 
-- 
2.45.2


