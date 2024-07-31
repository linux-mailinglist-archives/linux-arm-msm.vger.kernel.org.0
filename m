Return-Path: <linux-arm-msm+bounces-27552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B4B94333C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 17:27:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C4BE1C23A38
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 15:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C131BD03F;
	Wed, 31 Jul 2024 15:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E0FRJmVV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B5A1BD020;
	Wed, 31 Jul 2024 15:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722439574; cv=none; b=hj0Z3nz+OQ+WJAMCxsHfH0zLYn/7YTBn7BvOA4tEps+948G8G8cIfD0F5AAuRAlfXgmJk64HMrxlSOTvFn4f9uwFEfYAJqplUGEWOVVuLDFBRGou1lWxhxGMB4jmEv/vvYVhElsQLiFYPOpyhUzYnqNNC5r89ay15peg8heHROY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722439574; c=relaxed/simple;
	bh=cAiwEYPyhie5YN0PaVJrgMAafcZxhlOZNQ26oDH/bMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EXxE88P1/s6Y1QIxnMjZ5wRCPG/Yqzm2SXvNOOUk/3Daa14ljTQ/GYzvyf2m66+JkfWiEaAYqPH2ihyu9NINjFpTswQRsisE45ypEeT4PnE7/p+2tRw5a38gXMv1Pm8lCHp+KDC7Mhz5BCYNJ1WJPiNP4EJRUvHoz0BDJWWbUnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E0FRJmVV; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2eeb1ba0468so91042341fa.0;
        Wed, 31 Jul 2024 08:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722439570; x=1723044370; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HNjd7IUt9Z8kpFWJyPP/P05dyp4sHdu+T/jMNypx4g4=;
        b=E0FRJmVVR6JC8aZb0ySFLtTSP7SplVbzrbgIMRC/hNlL39bcMZ689/hHC2aK1mqZl/
         35NyHFv/5Nyp9UUFYSua4ZaYScbGGPAFKSIM59Wp+kHIAjcrf+OAHV8xKCpVhUK/ppVe
         R3KMZQ0PAfUi74AEwDvpARerkIu0Ox4DOH3xA96LSHZhV/eak8C5lPwE/SxgHgNCWKWF
         Rqnsfg+HV72tpKVtyqcABlb0zAQNgK0LLCGoFQEraV9Tg/pw4hh7vHdvGgW7sGjaVibD
         4B+bZYMlU4C+iZpvHMn0PS1UeZPWLE6oMVkQq7gwZ7Ma6rjgJEzC0XQyueVPXs6Bopc+
         Uvig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722439570; x=1723044370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HNjd7IUt9Z8kpFWJyPP/P05dyp4sHdu+T/jMNypx4g4=;
        b=Nh9jTiGWYggeyZPrixlevfQ/UtpkhUQfLw6Vo1NyN02Zw2wUncvm2fPvN/rrWpbGrz
         s8cX/ESqQOKWy36k9V92rL97D8gfgZD71VSAJ6NJDQKZJh37+pEtv+xkbszar9a7PCvb
         rXXqYc05g/KRUq5sJlDWwfvKU4J7a8jq0q7lbkcpo/IDt+MubsK05DjV/FE5Xyg2o4Eo
         JKhPM2+6ZlTw2nqSd1pwwI+98wObuBQVEdb31R8OA/SGOiILRIhzWJJD0w+ySsqfpcUL
         kUmJUmLhEUa2YuFQvsC455wLOB8ZaapjdjJe+ekTh3SsYUXPkgzkN3rYARNg79+lP4ja
         y9/A==
X-Forwarded-Encrypted: i=1; AJvYcCVGX8Vrf4SmGWRydtH9M0dC9HThknwQeA/5rYjYD9mq8mRL9DmKVQTUBus6rKC6sf24mJnvM1PyPymqQkKjHykgERPG4UFlzQMDE0fxmNndedMeD33P/Z0x3B3FpsBXcQIlwF7dCNvH6rc0jRb4C3QPhE+vMxI29wFLsVEEMKZeJ1rIcflVHaGwVm8qMAXP3euc09mZQ77WMLOAFDEBYk0u+LsVFg==
X-Gm-Message-State: AOJu0YyQ4UTl8/9xpcajCocKKeMGhP/n2KTfKeivF9RQstvSgrABLTk+
	JlvG8nDWPY7L3UTIp5fLDFB0E/e7NkFvucI38J3MzHMNeyjD75K1
X-Google-Smtp-Source: AGHT+IFQXiJjYzgQhwbnofWVANeBtgbuGWzLTcGQFaQNCs4mjjL1q369HZTUzjEqcwg8HucG/ozxpQ==
X-Received: by 2002:a05:651c:545:b0:2f0:1fd5:2f29 with SMTP id 38308e7fff4ca-2f12edfef11mr114493221fa.19.1722439570019;
        Wed, 31 Jul 2024 08:26:10 -0700 (PDT)
Received: from [127.0.1.1] (byv161.neoplus.adsl.tpnet.pl. [83.30.41.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bb64755sm25430985e9.36.2024.07.31.08.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 08:26:09 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Wed, 31 Jul 2024 17:25:28 +0200
Subject: [PATCH v3 4/8] ASoC: msm8916-wcd-analog: add pm8953 codec
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-msm8953-msm8976-asoc-v3-4-163f23c3a28d@gmail.com>
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

Add regs overrides for PM8953 codec.

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
[Adam: rename codec]
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 sound/soc/codecs/msm8916-wcd-analog.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
index 13df60409857..b9325290c28d 100644
--- a/sound/soc/codecs/msm8916-wcd-analog.c
+++ b/sound/soc/codecs/msm8916-wcd-analog.c
@@ -755,6 +755,34 @@ static const struct wcd_reg_seq pm8950_data = {
 	.seq_size = ARRAY_SIZE(wcd_reg_defaults_pm8950),
 };
 
+static const struct reg_default wcd_reg_defaults_pm8953[] = {
+	{CDC_A_RX_COM_OCP_CTL, 0xd1},
+	{CDC_A_RX_COM_OCP_COUNT, 0xff},
+	{CDC_D_SEC_ACCESS, 0xa5},
+	{CDC_D_PERPH_RESET_CTL3, 0x0f},
+	{CDC_A_TX_1_2_OPAMP_BIAS, 0x4c},
+	{CDC_A_NCP_FBCTRL, 0xa8},
+	{CDC_A_NCP_VCTRL, 0xa4},
+	{CDC_A_SPKR_DRV_CTL, 0x69},
+	{CDC_A_SPKR_DRV_DBG, 0x01},
+	{CDC_A_SEC_ACCESS, 0xa5},
+	{CDC_A_PERPH_RESET_CTL3, 0x0f},
+	{CDC_A_CURRENT_LIMIT, 0xa2},
+	{CDC_A_BYPASS_MODE, 0x18},
+	{CDC_A_SPKR_ANA_BIAS_SET, 0x41},
+	{CDC_A_SPKR_DAC_CTL, 0x03},
+	{CDC_A_SPKR_OCP_CTL, 0xe1},
+	{CDC_A_RX_HPH_BIAS_PA, 0xfa},
+	{CDC_A_RX_EAR_STATUS, 0x10},
+	{CDC_A_MASTER_BIAS_CTL, 0x30},
+	{CDC_A_MICB_1_INT_RBIAS, 0x00},
+};
+
+static const struct wcd_reg_seq pm8953_data = {
+	.seq = wcd_reg_defaults_pm8953,
+	.seq_size = ARRAY_SIZE(wcd_reg_defaults_pm8953),
+};
+
 static int pm8916_wcd_analog_probe(struct snd_soc_component *component)
 {
 	struct pm8916_wcd_analog_priv *priv = dev_get_drvdata(component->dev);
@@ -1304,6 +1332,7 @@ static int pm8916_wcd_analog_spmi_probe(struct platform_device *pdev)
 static const struct of_device_id pm8916_wcd_analog_spmi_match_table[] = {
 	{ .compatible = "qcom,pm8916-wcd-analog-codec", .data = &pm8916_data },
 	{ .compatible = "qcom,pm8950-wcd-analog-codec", .data = &pm8950_data },
+	{ .compatible = "qcom,pm8953-wcd-analog-codec", .data = &pm8953_data },
 	{ }
 };
 

-- 
2.45.2


