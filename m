Return-Path: <linux-arm-msm+bounces-26754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A6E938CAF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 11:58:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D818287079
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1409816EB4C;
	Mon, 22 Jul 2024 09:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jUEYtoQp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C20116E884;
	Mon, 22 Jul 2024 09:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721641949; cv=none; b=B5jccEd3PwL/cQ+XWQwZBSWfu9LlCFYwGClwuRbEA59W5Ac6T4q8WIQTrEjMjr0uee11yGhBXcw/KGZtmE+GgqicPh83bbkd/mu1iOKmhEgbJiwiOQM6qSlMVwo55VMuLJSt2gFA3v7tVprcCs0bt60BTe+wLuUFp+zHJdv7UfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721641949; c=relaxed/simple;
	bh=L/ApIpFJ9BfLOmjZ356/A8+sGcAzB4WiLcEPhi10XKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=plbUG3AAdQgv/FeALM1JqFxA7fgYMNRSxxNmuZiGPtHJRrmU6FwOhc1Lx7E5t1UwmDWPU0Bgj38UrXcYp3Cq8ARbtHs1YZROlsqZGOVH8dIFy9m7FnsTuM6xUayEYfjHMCXfECJ3ea/SuxovExJRkdmA3pC2ubOwTnx59eEe2rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jUEYtoQp; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52efdf02d13so1790152e87.2;
        Mon, 22 Jul 2024 02:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721641945; x=1722246745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dl6ci1X9H1bocspAYVTPwqDYk40+i0zlUVaPzwxman8=;
        b=jUEYtoQpoRGKzaJvIq5X2V3U5vsgXwvFpb0f1ZZSaNXbJb6iDjyszVFelV5WUWdzDN
         gwAe7Kb92iheLmgtMIKNaIZcRH1815StUQlRJL8DqC0C9rYMpk5uMtAqztiVCgI9b9Jl
         55/RUSBAxwZ7kklglLMdbTcOmXa9NnTCrdjXXuenwuMlnua5vc3dbYI1Gqs2kylITix+
         QCPWSlwgE8sHdQPmqJALa3T61EdVmDIn81Q94+n3XTaXAc7Pzu+EH46GnIdKtC41VhrU
         KD7D/9Poy/LrztzXCOE1TYlVfIXKNdnfhd7Vjjjyq/95ldNFfnwG+9fjuRqgYEBP1pzK
         Hl+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721641945; x=1722246745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dl6ci1X9H1bocspAYVTPwqDYk40+i0zlUVaPzwxman8=;
        b=jFZCu6GtouPd2196EQtMC818X/GPOLU2HL4f9xmniL1kwVGr6BDMXP9vRCMBEADsDE
         GjPH8xZj0zeF6NEticj68Tcpu04JHBrVJTOAtnWr/pTTFhuWpcwixSn8O8agulU2RlPh
         zRoSgnduKv+F1XGO7beh1Zncr1gU5g2OFr2i0HVcBYdAMTVNzFq2OdMKu194bSY1DTTH
         H6UWvKN4DRCqHHacWwoEgirODYPW6MgdM64NrSrqnhlWG32kTzTU4bJ/aMDVb8Ys+dTR
         yclig57kYkO/WEBlzK+GAFwlS3W+4jtNq56j0Bu88qqArFN0Cb/vRgAQrXUlUMrFC3xS
         mcdA==
X-Forwarded-Encrypted: i=1; AJvYcCW0Ouf7UcS7Kl/Z2+w5bmnOAs/RJgyOp2LZ6iNjB0gxlWJSXMTkXhQtx/OSvz427YKAXPGML/2/QqnNDmFBUlFlnCtDllM6FQyxEn0749GUVBq+fp3fPpehe1wdyPw+eT410CcYfbk7VKovq5OuVgSKj+tfNB3WO2ei6WT1MfiutkZqTRcwYxgOZhv4IIynRNzAPYe2zY4pL84t0vLGqO75Osv9Yg==
X-Gm-Message-State: AOJu0YzRXAQRFq/CLE30un1DNDmCWGMPPHoKPHbAW6LukLxGQdSHsnrY
	V5DxqNztis1UJqVlK0AMd3zFE+KYztqJvOPrQ86WfAO/+uJIDQuZONM/zUya
X-Google-Smtp-Source: AGHT+IHiwNvnwn1Ldydw+/A3gbnMJ79+Ia18db3RGXJpSUtCeRrxw/7o90BQd8QswtyBBxDk+Uh7pg==
X-Received: by 2002:a05:6512:1250:b0:52c:db76:2a7a with SMTP id 2adb3069b0e04-52efb74c166mr4664718e87.34.1721641944859;
        Mon, 22 Jul 2024 02:52:24 -0700 (PDT)
Received: from localhost.localdomain (byy214.neoplus.adsl.tpnet.pl. [83.30.44.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fc226cdccsm91552e87.164.2024.07.22.02.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 02:52:24 -0700 (PDT)
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
Subject: [PATCH 4/4] ASoC: qcom: apq8016_sbc: Add support for msm8953/msm8976 SoC
Date: Mon, 22 Jul 2024 11:51:08 +0200
Message-ID: <20240722095147.3372-5-a39.skl@gmail.com>
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

Introduce support for audio card on MSM8953/MSM8976 platform.
Main difference between those two is Q6AFE CLK API supported by firmware
which influence way we enable digital codec clock.
Either inside machine driver or outside via q6afe-clocks driver.

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
[Adam: Add MSM8976, rename functions, add mclk setting,add msg]
Co-developed-by: Adam Skladowski <a39.skl@gmail.com>
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 sound/soc/qcom/apq8016_sbc.c | 66 ++++++++++++++++++++++++++++++++++--
 1 file changed, 64 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
index 8971f4f5d339..51efefefe0a1 100644
--- a/sound/soc/qcom/apq8016_sbc.c
+++ b/sound/soc/qcom/apq8016_sbc.c
@@ -22,6 +22,11 @@
 
 #define MI2S_COUNT  (MI2S_QUINARY + 1)
 
+enum afe_clk_api {
+	Q6AFE_CLK_V1,
+	Q6AFE_CLK_V2
+};
+
 struct apq8016_sbc_data {
 	struct snd_soc_card card;
 	void __iomem *mic_iomux;
@@ -29,6 +34,8 @@ struct apq8016_sbc_data {
 	void __iomem *quin_iomux;
 	struct snd_soc_jack jack;
 	bool jack_setup;
+	enum afe_clk_api q6afe_clk_ver;
+	bool dig_cdc_mclk_en;
 	int mi2s_clk_count[MI2S_COUNT];
 };
 
@@ -192,6 +199,28 @@ static int qdsp6_dai_get_lpass_id(struct snd_soc_dai *cpu_dai)
 	}
 }
 
+static int qdsp6_get_clk_id(struct apq8016_sbc_data *data, int mi2s_id)
+{
+	if (data->q6afe_clk_ver == Q6AFE_CLK_V2) {
+		switch (mi2s_id) {
+		case MI2S_PRIMARY:
+			return Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT;
+		case MI2S_SECONDARY:
+			return Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT;
+		case MI2S_TERTIARY:
+			return Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT;
+		case MI2S_QUATERNARY:
+			return Q6AFE_LPASS_CLK_ID_QUAD_MI2S_IBIT;
+		case MI2S_QUINARY:
+			return Q6AFE_LPASS_CLK_ID_QUI_MI2S_IBIT;
+		default:
+			break;
+		}
+	}
+	/* If AFE CLK isn't V2 return V1 */
+	return LPAIF_BIT_CLK;
+}
+
 static int msm8916_qdsp6_dai_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
@@ -214,8 +243,16 @@ static int msm8916_qdsp6_startup(struct snd_pcm_substream *substream)
 
 	if (++data->mi2s_clk_count[mi2s] > 1)
 		return 0;
+	/*
+	 * On newer legacy SoC (MSM8976) lpass codec clocks are not available in gcc region
+	 * so we have to request clock from machine driver using V1 API)
+	 */
+	if (data->q6afe_clk_ver == Q6AFE_CLK_V1 && data->dig_cdc_mclk_en == true)
+		ret = snd_soc_dai_set_sysclk(cpu_dai,  LPAIF_DIG_CLK, DEFAULT_MCLK_RATE, 0);
+	if (ret)
+		dev_err(card->dev, "Failed to enable LPAIF dig clk: %d\n", ret);
 
-	ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_BIT_CLK, MI2S_BCLK_RATE, 0);
+	ret = snd_soc_dai_set_sysclk(cpu_dai, qdsp6_get_clk_id(data, mi2s), MI2S_BCLK_RATE, 0);
 	if (ret)
 		dev_err(card->dev, "Failed to enable LPAIF bit clk: %d\n", ret);
 	return ret;
@@ -236,9 +273,15 @@ static void msm8916_qdsp6_shutdown(struct snd_pcm_substream *substream)
 	if (--data->mi2s_clk_count[mi2s] > 0)
 		return;
 
-	ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_BIT_CLK, 0, 0);
+	ret = snd_soc_dai_set_sysclk(cpu_dai, qdsp6_get_clk_id(data, mi2s), 0, 0);
 	if (ret)
 		dev_err(card->dev, "Failed to disable LPAIF bit clk: %d\n", ret);
+
+	if (data->q6afe_clk_ver == Q6AFE_CLK_V1 && data->dig_cdc_mclk_en == true)
+		ret = snd_soc_dai_set_sysclk(cpu_dai,  LPAIF_DIG_CLK, 0, 0);
+	if (ret)
+		dev_err(card->dev, "Failed to disable LPAIF dig clk: %d\n", ret);
+
 }
 
 static const struct snd_soc_ops msm8916_qdsp6_be_ops = {
@@ -279,6 +322,23 @@ static void msm8916_qdsp6_add_ops(struct snd_soc_card *card)
 	}
 }
 
+static void msm8953_qdsp6_add_ops(struct snd_soc_card *card)
+{
+	struct apq8016_sbc_data *pdata = snd_soc_card_get_drvdata(card);
+
+	pdata->q6afe_clk_ver = Q6AFE_CLK_V2;
+	msm8916_qdsp6_add_ops(card);
+}
+
+static void msm8976_qdsp6_add_ops(struct snd_soc_card *card)
+{
+	struct apq8016_sbc_data *pdata = snd_soc_card_get_drvdata(card);
+
+	pdata->q6afe_clk_ver = Q6AFE_CLK_V1;
+	pdata->dig_cdc_mclk_en = true;
+	msm8916_qdsp6_add_ops(card);
+}
+
 static const struct snd_kcontrol_new apq8016_sbc_snd_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
 	SOC_DAPM_PIN_SWITCH("Mic Jack"),
@@ -343,6 +403,8 @@ static int apq8016_sbc_platform_probe(struct platform_device *pdev)
 static const struct of_device_id apq8016_sbc_device_id[] __maybe_unused = {
 	{ .compatible = "qcom,apq8016-sbc-sndcard", .data = apq8016_sbc_add_ops },
 	{ .compatible = "qcom,msm8916-qdsp6-sndcard", .data = msm8916_qdsp6_add_ops },
+	{ .compatible = "qcom,msm8953-qdsp6-sndcard", .data = msm8953_qdsp6_add_ops },
+	{ .compatible = "qcom,msm8976-qdsp6-sndcard", .data = msm8976_qdsp6_add_ops },
 	{},
 };
 MODULE_DEVICE_TABLE(of, apq8016_sbc_device_id);
-- 
2.45.2


