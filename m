Return-Path: <linux-arm-msm+bounces-27130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 148D693E079
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 20:21:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFDBE280E8D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 18:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90248188CB1;
	Sat, 27 Jul 2024 18:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MtUQ1ylC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC61188CA1;
	Sat, 27 Jul 2024 18:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722104462; cv=none; b=CvgwCFLluMM4VxJP0NBq9Oco6tLjXtWtEfp5WSFmDFPWbzFqj9u//yqckK+lEZshSu+j1c8RYob+UKMfCSC7n4P0Hes9T3eioexg/FygshOWmuCQYCRvvxNeSSf35KDqANgHkmtp+vaWEKKs1CO+oJ4u2hdz8mSWDw2bf71jbN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722104462; c=relaxed/simple;
	bh=5zVSTCeiMxOBFFg5PrNZbHTDjaRaeLpoeIwBE9Am3N4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g3OMOrno75lA0tWq+JzAAx/iVLRI2S2Z73NW8qqSt3FHuhWo5QiSrtE4ytZtvz0IvcyJXbsryMFL/CyR4iB/yJ48CTaQfeyNmK76eXJyHQoQYZBxadKHCpznIbVf4ENg61/FEIumzV6TD16eG/HZHsSa4f24sf6K3nxS8HFKEYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MtUQ1ylC; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ef2c109eabso28603001fa.0;
        Sat, 27 Jul 2024 11:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722104458; x=1722709258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EqaxMQ0ue5RjoXRCR/HykfXlaIjq8MZY6Aig5hFF/Rw=;
        b=MtUQ1ylCPtLRTrOAiX8i5WrJ4AcAnh0wZML1jlgHTUae7RlEZ35bIWMXr4JXQmJSme
         s0n08HW1hcc9FN0FkqiNF79rP8rnsIXCRk42aEQPrAe8N1meWWASu7DP9Gm/o882Tp/3
         YnHsu6oiGCnHUouNabr0DJjvCeHZ+Zk1Pbm4aWDOO3hAhRebO8DR+pc3TWXvPoVV9+/c
         JxP6GO6CnX2ZtEMMAFpDEe3LAZTmk2i7Y5sAwPa24PYXUyzmZpNGoQN9NGHDH7RyFfo7
         OCF9ttNibtwm6H+3cm4ecP38WkntUbh2Tkj1PqI02RvMpS0UZZJQOPGDsIxvb4Zxt2TS
         pT0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722104458; x=1722709258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EqaxMQ0ue5RjoXRCR/HykfXlaIjq8MZY6Aig5hFF/Rw=;
        b=YucXuQgwpIRZ1z5p5LlkxHYbd+m+GVRpUJtJxYU/V3OMfoLjmmldNxajOPAYwoTJIx
         tVn5q+Zw1a5lZOhG4Fi86/SxTZi/L+XbZPwE7T2rJ8yw0UL/7ce0OVnwbPF6G+Y0AoZ2
         zJ2+9ZFN46cz0ipsA8LSG6NJ9IHkE2lhc/wdsLXe07TQDwgpgrVBaOhdnRLoc8IpEFTJ
         8uAD1R8fTC6r43V/W1wZgv9Vz7XtNLawE/o4UY40lO/TlKFJm4iH+915gPZArm3JekHU
         ysbIiSNgRKm2nlGeIKPIez1mJjq0J0Xn60rEeAxIsMeI/tJZOqT2NtoQdN6oNYYe8YkF
         OdXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVodgq4oZOHsEGVSYmGlP/7hXEuNhEQWoXS7ZymyV7Pf5R2vWbFk1HVmbEviHYGCbXZtXIH3n1XPyjYD0rUjg7M69sErIKt/oP+CUGX0SvkVeQ39ADmfqb7n040KF4e1wYpzr2lTWsjjmp5JN/bWYEviN0C1IwbG39/SS8P17c7t9lAy3EmNu1ehRJSzITMAq8e1lqhzBWOyilcIH8p0I9Oyp1Gcw==
X-Gm-Message-State: AOJu0Yw67EKsSByZsLfRWQTRgiNsjUqAydcqj7JFBJxO5n1kVAhE7BdY
	7t0LckxFKSLQdWqZo5JBMnZHwyjTxw4COP0ZEcm4OLna8dRPJCJ6+uOnzA==
X-Google-Smtp-Source: AGHT+IGbBdJtk3eIEo/RH3d6bKcSiI0SsWpJ+V+kkSG9Ok71l+0sMc9Cw5SGvtCbjRPh+gvKYM/Y9Q==
X-Received: by 2002:a2e:990e:0:b0:2ef:24e0:633b with SMTP id 38308e7fff4ca-2f12ecd42d4mr19809041fa.19.1722104458102;
        Sat, 27 Jul 2024 11:20:58 -0700 (PDT)
Received: from localhost.localdomain (byw127.neoplus.adsl.tpnet.pl. [83.30.42.127])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f03d077226sm7504891fa.126.2024.07.27.11.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 11:20:57 -0700 (PDT)
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
Subject: [PATCH v2 4/4] ASoC: qcom: apq8016_sbc: Add support for msm8953/msm8976 SoC
Date: Sat, 27 Jul 2024 20:20:27 +0200
Message-ID: <20240727182031.35069-5-a39.skl@gmail.com>
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

Introduce support for audio card on MSM8953/MSM8976 platform.
Main difference between those two is Q6AFE CLK API supported by firmware
which influence way we enable digital codec clock.
Either inside machine driver or outside via q6afe-clocks driver.

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
[Adam: Add MSM8976, rename functions, add mclk setting,add msg]
Co-developed-by: Adam Skladowski <a39.skl@gmail.com>
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 sound/soc/qcom/apq8016_sbc.c | 68 ++++++++++++++++++++++++++++++++++--
 1 file changed, 66 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
index 303dd88206b1..453ca4795603 100644
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
@@ -214,8 +243,17 @@ static int msm8916_qdsp6_startup(struct snd_pcm_substream *substream)
 
 	if (++data->mi2s_clk_count[mi2s] > 1)
 		return 0;
+	/*
+	 * On newer legacy SoC (MSM8976) lpass codec clocks are not available in gcc region
+	 * so we have to request clock from machine driver using V1 API)
+	 */
+	if (data->q6afe_clk_ver == Q6AFE_CLK_V1 && data->dig_cdc_mclk_en == true) {
+		ret = snd_soc_dai_set_sysclk(cpu_dai,  LPAIF_DIG_CLK, DEFAULT_MCLK_RATE, 0);
+		if (ret)
+			dev_err(card->dev, "Failed to enable LPAIF dig clk: %d\n", ret);
+	}
 
-	ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_BIT_CLK, MI2S_BCLK_RATE, 0);
+	ret = snd_soc_dai_set_sysclk(cpu_dai, qdsp6_get_clk_id(data, mi2s), MI2S_BCLK_RATE, 0);
 	if (ret)
 		dev_err(card->dev, "Failed to enable LPAIF bit clk: %d\n", ret);
 	return ret;
@@ -236,9 +274,16 @@ static void msm8916_qdsp6_shutdown(struct snd_pcm_substream *substream)
 	if (--data->mi2s_clk_count[mi2s] > 0)
 		return;
 
-	ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_BIT_CLK, 0, 0);
+	ret = snd_soc_dai_set_sysclk(cpu_dai, qdsp6_get_clk_id(data, mi2s), 0, 0);
 	if (ret)
 		dev_err(card->dev, "Failed to disable LPAIF bit clk: %d\n", ret);
+
+	if (data->q6afe_clk_ver == Q6AFE_CLK_V1 && data->dig_cdc_mclk_en == true) {
+		ret = snd_soc_dai_set_sysclk(cpu_dai,  LPAIF_DIG_CLK, 0, 0);
+		if (ret)
+			dev_err(card->dev, "Failed to disable LPAIF dig clk: %d\n", ret);
+	}
+
 }
 
 static const struct snd_soc_ops msm8916_qdsp6_be_ops = {
@@ -279,6 +324,23 @@ static void msm8916_qdsp6_add_ops(struct snd_soc_card *card)
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
@@ -343,6 +405,8 @@ static int apq8016_sbc_platform_probe(struct platform_device *pdev)
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


