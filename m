Return-Path: <linux-arm-msm+bounces-26752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D03938CA6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 11:57:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4140284575
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D3716D306;
	Mon, 22 Jul 2024 09:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bqu93y7d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2E816D308;
	Mon, 22 Jul 2024 09:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721641942; cv=none; b=tRch1SQEtvyVnUEX0yDGVz/SNkINTOqc6Q2B5G5pQ1dGBlbfBzUVjwKllM8a4jR2OHTG4tICVG1dUq127aJttPGjXqzE6HWOiCShcUfk90aJR/9JHBhPeSjyufQ5TNtvVW+jf2cTUbIh+pLADCQJkh3W3SPbcmKlNGXT6JgLTko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721641942; c=relaxed/simple;
	bh=EFy7tExuqG9na7Q+Y80CJaISj3tjIZbe4+zf3f1TTaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lkbx+735G8/2uNeDvtzbnXk7iz+KISRIo/INRkXHYqrVtedXRFntGjOjgvOOaIZjf8OIxC3vFTzcHJzVCVcWfL5mHJcNDxO0GrC4lRe6lnor5u9f+GDfpwRmdfSPwggVEormkiJMuq9UtYqdefT7pcNX2pMqVMKPrY77/O9As4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bqu93y7d; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52f01afa11cso1589688e87.0;
        Mon, 22 Jul 2024 02:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721641938; x=1722246738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GF6xFxPj/ytlezNbhhUqMrRGdstZMHpzQeT2XWw6wjY=;
        b=bqu93y7dBe6371DIGkBkVawt8R8SV7BB3RC7L4LYBSBLmfKrOTCqQV6k2q/2z6q6x/
         XylenjnDZD/3LmZgi/ADqy5tfs5paV6O0tkE7mU7BB1nESWe/ms0p0NNNyDMVZXYWfwp
         8MwykmvuFlKsuz13LdvYRWL+sNqKxv7rOzbrmv2k1CsKfu7oVxiZhdud/9ScapKStylD
         Ox7pcWEgHbUN92QrM5/XW6N+f8A9CjCvTINadOGJMafEI8yC+qBAWFM+XPGdlrdj98KW
         xOnWDolTsOiHC9wUK71G5l763HhYHCmQTosd99HyMBumlyyfsjT07gGJz7HiPPm5gCEL
         SdGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721641938; x=1722246738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GF6xFxPj/ytlezNbhhUqMrRGdstZMHpzQeT2XWw6wjY=;
        b=j1hoLQbnZlK1ncCdwfkt0L5q9f3JRFGa6dFWm1xynjdoaLdF6PK+etgF9LPHB6W6tl
         LbS64Tp51a5+IASFPK3tu/UDAY3xUnm0v8/rK3xQP2G3urZU7u8WiSEn3kxkvE63Uy2k
         aZVqmMYMZ2JdtNgI9x6NZSFlXVfbymZ6dZgNmKR6fC/HXYIZ1fo2JIYUZCiE4JI7jVWL
         obbdSJ198qxPkxnKDhZygxtIvDCLdjswohVIInd1aTXSOsYb2VXcgairQ73pUC+QhwwD
         f0hErAjHpNchqBRV8nk7n8G9QkAwBH+pXsw1p4msLzDH70vB0NoDLTJWNMHydX+HCsNA
         C2uw==
X-Forwarded-Encrypted: i=1; AJvYcCVLc0ZF/UtDT6LswWGN8/c1LEBwedZllYQuakvReNxhXOBfYMX0/HFZPkJ/pPPLLimrEEiV7s8FRq+os6Q6WCYjr4Ih4Hdwtd39E4SGQCiHLyB1Nz4wfp21GfgqGwh3w06UH9yN+A0JY2l96n+B+flwG97PdZweCIa8gEXYhtofTsOyXgkc+BgEAtoH/5E7FbaRp0rGIp5tJ9Dgr0kaaq2NA6x6qA==
X-Gm-Message-State: AOJu0YzWR+xjAseRGkDI2I95XcdEXGwNowlkkBU7wrIESieadeYTjhnG
	BEaZ17fQgK7ILu/xlAowDo31zPKSzjbFU5TbSgvKYLY3SMZYGe1aZCh2DpOs
X-Google-Smtp-Source: AGHT+IGMjXFxraEsXHIkxYNkndbJxB9/sBbeVo4mr3BgdM9QyhZYaPDjmM+IUr8WAtpuoBhZAJ6eTg==
X-Received: by 2002:a05:6512:1327:b0:52b:bf8e:ffea with SMTP id 2adb3069b0e04-52efb7bf318mr4451648e87.40.1721641938089;
        Mon, 22 Jul 2024 02:52:18 -0700 (PDT)
Received: from localhost.localdomain (byy214.neoplus.adsl.tpnet.pl. [83.30.44.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fc226cdccsm91552e87.164.2024.07.22.02.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 02:52:17 -0700 (PDT)
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
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: [PATCH 2/4] ASoC: msm8916-wcd-analog: add cajon and cajon v2 support
Date: Mon, 22 Jul 2024 11:51:06 +0200
Message-ID: <20240722095147.3372-3-a39.skl@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240722095147.3372-1-a39.skl@gmail.com>
References: <20240722095147.3372-1-a39.skl@gmail.com>
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


