Return-Path: <linux-arm-msm+bounces-27555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE711943345
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 17:28:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09C661C241AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 15:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57B1E1BE253;
	Wed, 31 Jul 2024 15:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="naUzGYF6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D531BE245;
	Wed, 31 Jul 2024 15:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722439580; cv=none; b=AlWIa7YkfOqbHKlbcHKt2sWu2zmQ2NvAcBqQEct1AHNoA3p7hMQBa1x/G6R7xsIMFSU18IeWiw7RcabsQkUIG//eK2BUWNgbehjOQNDoN6+bdcdnuxaw1REAvys5fm0W5BaHSOgh3nfhjAQov9VorvZR9XU+xBmnF+b3DIPPa3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722439580; c=relaxed/simple;
	bh=7ih/twfj7Vu9/nowcpH2q0+GyQypwWFRSVqFIt9jL5M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VZxiP/jMW7SGHhqB6DA3wK76X7tMMcMDHwi2NNO4lU/LdFaaWfGAAAF3jqe9lZjlfJ3qgsaE/Pdfmiejfwckgpl43JSo97wLWDN4I2ZgRk9CQ+MDtYfBF/iz6hlLjo7hP6Cy/9QnEzJg4dUrWy/hVJxLzN6X5ZdRKyPqVTbHxxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=naUzGYF6; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ef23d04541so71019181fa.2;
        Wed, 31 Jul 2024 08:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722439577; x=1723044377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QiPIHigZUWEy/gTiB3EmC11NKGqz88RzfHr+wLDLdBQ=;
        b=naUzGYF6rIo9kAgKJebJ9oT0iyk6ka+rxFIRUMXobPf3brJ7xyWapQTfD68VHwdfLa
         4PsOW0hBMz1emgJm5lhAOL9t+aC2xJx2azY+S/GdNgbngydXhLMxw9sJCwfKZqntNMs8
         eqGNPPgNgebb318v69dzKkQ9mm1iOdQea2gTr4s2h3FwA99XEACuhG/k5QmRSc6E+teq
         CthJgYZBwUEdQQgp+eCUMP8p6EinQdZSXs1p82WIUX0Wp+fi6+hN08f4WTYP/SszYsZp
         2AoHe7DFsv/56T7k73bc3r6BIzOxMLefdULfxObk+X1ee4f9BKUuD7ZNeIRAADYciNif
         aDFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722439577; x=1723044377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QiPIHigZUWEy/gTiB3EmC11NKGqz88RzfHr+wLDLdBQ=;
        b=l36eX8Is1pJEUWC8/t16EhKHXFSsKnVnlKM1bK+wwsenbqpXHg6jw2NaHjiiHt1js8
         xgcv4Q9avg61/V+cHHB+b2nLRF7TQmNte5/CUan6ouHRkV3p2vDRWMeuDC7JeJCpsi5E
         6HOnpvicxttMpWG/nbreQTG8Y9fduebUzzNLmRSgpVC02+0FXWi5MVC8873n+a30xQfY
         lCNeAmwpkUcQjSuOgyE4HQ3tZuCuX0hPqmZy0n4cduBTRAdnYQUGW5iFej4/vjvMrUEJ
         m0x1qSpursVPJWX/TtYfXFsnE0rHtjdrTCWj7F44Z1x9HkZc7yR9jPRRy57otn8FLNSu
         OnnA==
X-Forwarded-Encrypted: i=1; AJvYcCXt9VLTnFl+Ryu9YpgwFsfOu961oVd++B1K1XVW5mYoeVgi/5T/cAuJknMPgxMyF64UutVdbcjWrAs7UESqdUB/GBMB/1EdURSWogZ3F5zH7cV4nAyRsLagNecEV+wRPA+3Df9kiUmF0g40hJEBMV/eAJp5PdfYROmw8j0AEAbAFsIOfT3BPkF0qF5s8BOXdyU0z3zd1T0nVs1Gnq0x9UA4lCQ4Eg==
X-Gm-Message-State: AOJu0YzKwI2UFicgrKH7NYpQzpd2iTxT6Zv29IekP574w2NEV7VPMc07
	yVLF4pp9FwQThYVfR1p8Y7D8ZALowW9rza2SNitADVRicBZDJ38g
X-Google-Smtp-Source: AGHT+IGfiiY8nEDh5Jy5pRnrx5JgptFO0aaTdFxWxnCuI2DfwVrpN841vJxt9dac7N5AxkUuFMo2zw==
X-Received: by 2002:a2e:7d13:0:b0:2ef:2b38:879c with SMTP id 38308e7fff4ca-2f12edf02b2mr97756941fa.3.1722439576327;
        Wed, 31 Jul 2024 08:26:16 -0700 (PDT)
Received: from [127.0.1.1] (byv161.neoplus.adsl.tpnet.pl. [83.30.41.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bb64755sm25430985e9.36.2024.07.31.08.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 08:26:15 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Wed, 31 Jul 2024 17:25:31 +0200
Subject: [PATCH v3 7/8] ASoC: qcom: apq8016_sbc: Add support for msm8976
 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-msm8953-msm8976-asoc-v3-7-163f23c3a28d@gmail.com>
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
 devicetree@vger.kernel.org, Adam Skladowski <a39.skl@gmail.com>
X-Mailer: b4 0.14.0

Introduce support for audio card on MSM8976 platform.
While MSM8976 falls into v1 category with MSM8916, digitial codec clock
is not available in GCC so we have to set it in machine driver.
For that reason for V1 clocks new boolean is added to check
if we need to enable codec clock.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 sound/soc/qcom/apq8016_sbc.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
index 3ed35beb671a..8219d4d55625 100644
--- a/sound/soc/qcom/apq8016_sbc.c
+++ b/sound/soc/qcom/apq8016_sbc.c
@@ -35,6 +35,7 @@ struct apq8016_sbc_data {
 	struct snd_soc_jack jack;
 	bool jack_setup;
 	enum afe_clk_api q6afe_clk_ver;
+	bool dig_cdc_mclk_en;
 	int mi2s_clk_count[MI2S_COUNT];
 };
 
@@ -242,6 +243,16 @@ static int msm8916_qdsp6_startup(struct snd_pcm_substream *substream)
 
 	if (++data->mi2s_clk_count[mi2s] > 1)
 		return 0;
+	/*
+	 * On newer legacy SoC (MSM8976) lpass codec clocks are not available in gcc region
+	 * so we have to request clock from machine driver using V1 API)
+	 */
+	if (data->q6afe_clk_ver == Q6AFE_CLK_V1 &&
+	    data->dig_cdc_mclk_en) {
+		ret = snd_soc_dai_set_sysclk(cpu_dai,  LPAIF_DIG_CLK, DEFAULT_MCLK_RATE, 0);
+		if (ret)
+			dev_err(card->dev, "Failed to enable LPAIF dig clk: %d\n", ret);
+	}
 
 	ret = snd_soc_dai_set_sysclk(cpu_dai, qdsp6_get_clk_id(data, mi2s), MI2S_BCLK_RATE, 0);
 	if (ret)
@@ -267,6 +278,13 @@ static void msm8916_qdsp6_shutdown(struct snd_pcm_substream *substream)
 	ret = snd_soc_dai_set_sysclk(cpu_dai, qdsp6_get_clk_id(data, mi2s), 0, 0);
 	if (ret)
 		dev_err(card->dev, "Failed to disable LPAIF bit clk: %d\n", ret);
+
+	if (data->q6afe_clk_ver == Q6AFE_CLK_V1 &&
+	    data->dig_cdc_mclk_en) {
+		ret = snd_soc_dai_set_sysclk(cpu_dai,  LPAIF_DIG_CLK, 0, 0);
+		if (ret)
+			dev_err(card->dev, "Failed to disable LPAIF dig clk: %d\n", ret);
+	}
 }
 
 static const struct snd_soc_ops msm8916_qdsp6_be_ops = {
@@ -317,6 +335,15 @@ static void msm8953_qdsp6_add_ops(struct snd_soc_card *card)
 	pdata->q6afe_clk_ver = Q6AFE_CLK_V2;
 }
 
+static void msm8976_qdsp6_add_ops(struct snd_soc_card *card)
+{
+	struct apq8016_sbc_data *pdata = snd_soc_card_get_drvdata(card);
+
+	msm8916_qdsp6_add_ops(card);
+	pdata->q6afe_clk_ver = Q6AFE_CLK_V1;
+	pdata->dig_cdc_mclk_en = true;
+}
+
 static const struct snd_kcontrol_new apq8016_sbc_snd_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
 	SOC_DAPM_PIN_SWITCH("Mic Jack"),
@@ -383,6 +410,7 @@ static const struct of_device_id apq8016_sbc_device_id[] __maybe_unused = {
 	{ .compatible = "qcom,apq8016-sbc-sndcard", .data = apq8016_sbc_add_ops },
 	{ .compatible = "qcom,msm8916-qdsp6-sndcard", .data = msm8916_qdsp6_add_ops },
 	{ .compatible = "qcom,msm8953-qdsp6-sndcard", .data = msm8953_qdsp6_add_ops },
+	{ .compatible = "qcom,msm8976-qdsp6-sndcard", .data = msm8976_qdsp6_add_ops },
 	{},
 };
 MODULE_DEVICE_TABLE(of, apq8016_sbc_device_id);

-- 
2.45.2


