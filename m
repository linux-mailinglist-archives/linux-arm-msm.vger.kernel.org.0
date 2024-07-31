Return-Path: <linux-arm-msm+bounces-27556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC7E943348
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 17:28:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 169B31F21EBD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 15:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC051BE85F;
	Wed, 31 Jul 2024 15:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ijaeW3FS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690D21BE255;
	Wed, 31 Jul 2024 15:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722439582; cv=none; b=BQsknGsx37MPCw43ZeJp1P3KF7LiSwuoKVkEIpV09TDa78Eg4XsjKZpqU0WityEZ2nW8k2feKvci60AozGQVaJmiFkYrh3LVxX045hm1pYddZlxznMZi5b3KZnQcxHoNtr3pCuffk4YxxGWNcU7AdZUx1yV7hM8FHy+rzj27pWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722439582; c=relaxed/simple;
	bh=rmwwYOUTvCDddLDjHz/8Ej1d+CDtpGbxfwCt2PfUiuw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iRBslJ4lnZgLdUIgLBkhIXXMuowrY+8zMmdn2WrmI9ZtWYyEV4z4abxF9SmiBjrWwgYskw45i0614veunnohi+lMZmrQRIlmXjeu2CdHsg1X14PR6w4qTkvuNCBkQAICywQyWsYJ0NLc9o2ckH3VcII6tuRU6vZL5eAnwSYdy58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ijaeW3FS; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4280bca3960so38653205e9.3;
        Wed, 31 Jul 2024 08:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722439579; x=1723044379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5WuGgWX4JRf3ODe4Tn035HhTlH91E7fm9nkBF1QertU=;
        b=ijaeW3FSBEIz0MVESetpW6q/RykcTWKfE+7nSUB8ZCHwIMHnPiyuW5c+/3dgROy1VD
         6xBvHgTcY7YXJa7QTCeR1A36lTPw5duIxZ0j82d+H3gap6BxArrIc4oIdFqL+6lxJRxj
         jrIez/u2NKgee/rkmkqthEoSUVLX35Go+wer9oqOxAglY/MCydrIw6qR79cSXJjGTUTi
         r9KCRdCVdiqfow/8kGj2GYqJIigIp5WuzKgScncAEKrJwJVyIRbsZ+itvWXFnAvKvWs+
         g3CYGOqqFutMzUup+2p7vbK5lvbTesJJR2b87YmC2+pg7LUKnkMA8uWRrs8gXW708pzd
         K14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722439579; x=1723044379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5WuGgWX4JRf3ODe4Tn035HhTlH91E7fm9nkBF1QertU=;
        b=lAw5jZxAN4V/u05CjKEugMkdobXVInSIT+EPl0j2uvzB1CPp3wR9LO4TanQA+xQeAA
         PlXMBWO/ESVwZ1b4p+pj7BcHcGCJzVRMLo/KteIANXvCIl54kscy+1u6OtUPZFsmv8xL
         aD8gD1Ho/N+BdMns+SlHGy6tIP2BEvnTL1El13Ys1H7o3PIEGZmRGR+wNc8KaV388upY
         29EMsagA153KbHtfbfMBPa9oM4kUQLODHeY6ASvutxseL0bSgKNfdOKB4fbsKrk1qVkV
         JXakjCoQStk9eCTJZp6/C2Jqb0qWFvjlxlpMRvX7Ff92nytWB0LRE0KiBFtGuQR/9VM9
         eizQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpX4lxKfS3bG34CzeHMsofGpZ4V0wXAkA8Eppdmb20K9X9MvnbjjdNev4yWesK3zc5QyOuUOilawvC+76WVlCVDDtj3kdrlLkR0MpdA6bYJtT26g2mF+VB8cYzNZVhn4UtVErhj7+XZlrzaf80D6NzvdqWSLM//xQrfbo8CvIAl4mF8LrXDuaRjpcsWXetSaZ22MjNQf/zCW7Yeupakvbtfh59hQ==
X-Gm-Message-State: AOJu0YxGqF4yNK7KHemiBRtVVf1FdoakPFTw7xjsJBFZn4gssfZj6nSv
	ByNRhJp5W/B5qAOM2Lf7mzeQPzcGXTHF0xZa5AqBiorqvvGGHkj2
X-Google-Smtp-Source: AGHT+IGH0/A9VV9XmlFr+VqIo2r5LTMx1mKaXlbbJoBz7UKepQPkmCu2QIQblz8in7UpA4OPhwqRFg==
X-Received: by 2002:a05:600c:4fc8:b0:426:593c:935f with SMTP id 5b1f17b1804b1-42811d6c45bmr96433365e9.1.1722439578523;
        Wed, 31 Jul 2024 08:26:18 -0700 (PDT)
Received: from [127.0.1.1] (byv161.neoplus.adsl.tpnet.pl. [83.30.41.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bb64755sm25430985e9.36.2024.07.31.08.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 08:26:18 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Wed, 31 Jul 2024 17:25:32 +0200
Subject: [PATCH v3 8/8] ASoC: msm8916-wcd-analog: add lineout output
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-msm8953-msm8976-asoc-v3-8-163f23c3a28d@gmail.com>
References: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
In-Reply-To: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Stephan Gerhold <stephan@gerhold.net>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Adam Skladowski <a39.skl@gmail.com>, 
 Vladimir Lypak <vladimir.lypak@gmail.com>
X-Mailer: b4 0.14.0

From: Vladimir Lypak <vladimir.lypak@gmail.com>

Add descriptions and controls to toggle lineout output

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 sound/soc/codecs/msm8916-wcd-analog.c | 64 +++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
index b9325290c28d..38949556f7d9 100644
--- a/sound/soc/codecs/msm8916-wcd-analog.c
+++ b/sound/soc/codecs/msm8916-wcd-analog.c
@@ -233,6 +233,8 @@
 #define RX_EAR_CTL_PA_SEL			BIT(7)
 
 #define CDC_A_RX_EAR_STATUS		(0xf1A1)
+#define CDC_A_RX_LO_DAC_CTL		(0xf1AC)
+#define CDC_A_RX_LO_EN_CTL		(0xf1AD)
 
 #define CDC_A_SPKR_DAC_CTL		(0xf1B0)
 #define SPKR_DAC_CTL_DAC_RESET_MASK	BIT(4)
@@ -327,6 +329,8 @@ static const struct soc_enum hph_enum = SOC_ENUM_SINGLE_VIRT(
 static const struct snd_kcontrol_new ear_mux = SOC_DAPM_ENUM("EAR_S", hph_enum);
 static const struct snd_kcontrol_new hphl_mux = SOC_DAPM_ENUM("HPHL", hph_enum);
 static const struct snd_kcontrol_new hphr_mux = SOC_DAPM_ENUM("HPHR", hph_enum);
+static const struct snd_kcontrol_new lineout_mux = SOC_DAPM_ENUM("LINEOUT",
+								 hph_enum);
 
 /* ADC2 MUX */
 static const struct soc_enum adc2_enum = SOC_ENUM_SINGLE_VIRT(
@@ -630,6 +634,46 @@ static int pm8916_wcd_analog_enable_adc(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static int pm8916_wcd_analog_enable_lineout_dac(struct snd_soc_dapm_widget *w,
+					 struct snd_kcontrol *kcontrol,
+					 int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		snd_soc_component_update_bits(component, CDC_A_RX_LO_EN_CTL,
+				0x20, 0x20);
+		snd_soc_component_update_bits(component, CDC_A_RX_LO_EN_CTL,
+				0x80, 0x80);
+		snd_soc_component_update_bits(component, CDC_A_RX_LO_DAC_CTL,
+				0x08, 0x08);
+		snd_soc_component_update_bits(component, CDC_A_RX_LO_DAC_CTL,
+				0x40, 0x40);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		snd_soc_component_update_bits(component, CDC_A_RX_LO_DAC_CTL,
+				0x80, 0x80);
+		snd_soc_component_update_bits(component, CDC_A_RX_LO_DAC_CTL,
+				0x08, 0x00);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		usleep_range(20000, 20100);
+		snd_soc_component_update_bits(component, CDC_A_RX_LO_DAC_CTL,
+				0x80, 0x00);
+		snd_soc_component_update_bits(component, CDC_A_RX_LO_DAC_CTL,
+				0x40, 0x00);
+		snd_soc_component_update_bits(component, CDC_A_RX_LO_DAC_CTL,
+				0x08, 0x00);
+		snd_soc_component_update_bits(component, CDC_A_RX_LO_EN_CTL,
+				0x80, 0x00);
+		snd_soc_component_update_bits(component, CDC_A_RX_LO_EN_CTL,
+				0x20, 0x00);
+		break;
+	}
+	return 0;
+}
+
 static int pm8916_wcd_analog_enable_spk_pa(struct snd_soc_dapm_widget *w,
 					    struct snd_kcontrol *kcontrol,
 					    int event)
@@ -917,6 +961,13 @@ static const struct snd_soc_dapm_route pm8916_wcd_analog_audio_map[] = {
 	{"SPK PA", NULL, "SPK DAC"},
 	{"SPK DAC", "Switch", "PDM_RX3"},
 
+	{"LINEOUT_OUT", NULL, "LINEOUT PA"},
+	{"LINEOUT PA", NULL, "RX_BIAS"},
+	{"LINEOUT PA", NULL, "SPKR_CLK"},
+	{"LINEOUT PA", NULL, "LINEOUT"},
+	{"LINEOUT", "Switch", "LINEOUT DAC"},
+	{"LINEOUT DAC", NULL, "PDM_RX3"},
+
 	{"MIC_BIAS1", NULL, "INT_LDO_H"},
 	{"MIC_BIAS2", NULL, "INT_LDO_H"},
 	{"MIC_BIAS1", NULL, "vdd-micbias"},
@@ -978,6 +1029,19 @@ static const struct snd_soc_dapm_widget pm8916_wcd_analog_dapm_widgets[] = {
 	SND_SOC_DAPM_SUPPLY("DAC_REF", CDC_A_RX_COM_BIAS_DAC, 0, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("RX_BIAS", CDC_A_RX_COM_BIAS_DAC, 7, 0, NULL, 0),
 
+	/* Lineout */
+	SND_SOC_DAPM_OUTPUT("LINEOUT_OUT"),
+
+	SND_SOC_DAPM_PGA_E("LINEOUT PA", CDC_A_RX_LO_EN_CTL,
+			   6, 0, NULL, 0, NULL, 0),
+
+	SND_SOC_DAPM_DAC_E("LINEOUT DAC", NULL, SND_SOC_NOPM, 0, 0,
+			   pm8916_wcd_analog_enable_lineout_dac,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX("LINEOUT", SND_SOC_NOPM, 0, 0, &lineout_mux),
+
 	/* TX */
 	SND_SOC_DAPM_SUPPLY("MIC_BIAS1", CDC_A_MICB_1_EN, 7, 0,
 			    pm8916_wcd_analog_enable_micbias1,

-- 
2.45.2


