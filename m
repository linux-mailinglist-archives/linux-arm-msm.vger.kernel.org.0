Return-Path: <linux-arm-msm+bounces-76099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B905BBEFE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 20:38:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 615863B96B4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 18:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C3672D94A6;
	Mon,  6 Oct 2025 18:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IfwCwJu/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127A62D94BC
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 18:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759775852; cv=none; b=q7dvyZwQlDuh64SrqJDY9x3Cyz6VknrQxoUCwZxu8zPoGLtqQZAPWMdmItxXS/YW29+aktRxfuW3/bXCn7JzBuSHUJvGneKZGm55r4bXaHXV+Pr1rMTI+eeBlmSb21FBbq3KSXJEN294PHo8wdxtMDvAzOpbGpUhPX1Sqnqg17A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759775852; c=relaxed/simple;
	bh=M5GD77yVYPF4Q7GbK/5MsLgJ13pQ7XTyeq/dx8K3o3k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IKFEee9h0kAWmmWznUweSV+RgjPoYkQ17sc9tfDcHEH5a5Qjg9Z/cyBSz0U2EybOKON8gu4PFDrkUKBAA3Bw8aSmYhkFDYWE2znvE7vcEx9jaTbYD3iiVdilzp9aDlFMgYWGz37/+2E8EhiRhGRY9Gynbb5W4W50xIzYZ2qre4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IfwCwJu/; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3ece1102998so3334129f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 11:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759775848; x=1760380648; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dI8wUrz4/k851DETHwU7YXPmi9b0tL6nAakNVDCwCbw=;
        b=IfwCwJu/+kr7FMaUWFNdJ9LM/zfhGIYfzkP2fWVuhzgEsiO6VeQeLk4LOjWUZa3B6Z
         DkKka+wkfKXx2ejpENi/Kv1TARkV05efs02RYFxdBIn+LYlWD+1Z6S06D8Rn6D5Bm2Ow
         Fl4SMZOIMk6sT0P5RTMTkwFL3ClpH3GFBQxG0BQ3mEo7A06REYHUr8lHDQu13zx9LMj7
         ierM2Lm4W39m7BiLq/LUOOM5rzHxM+U9j9IGZsfxmeZH07BrkEBE1c6heu0r9aAhFWdm
         cC+oIbI/wgOAmrVOskbOrzmzn/53/Zqw1JACGhlbEeUqoLV1Adoup7GaPQ7IDyBxIB7J
         JQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759775848; x=1760380648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dI8wUrz4/k851DETHwU7YXPmi9b0tL6nAakNVDCwCbw=;
        b=HoeXNaTczhABzq/aEECUQG8IEoiBGoEbrggZWIb9WdfK3CT06+CEeiVT2nHg6oaH5l
         0iH995prlCxONI6kF6NXDtMaR7XJpJtXlhe4RBEFrGnV9whCdk5CY9BXi+iGRGhVPymC
         UndvEOlQTcFzT2D/YZ9QMoc246FO2Ahl3SWDBhaandGB8waoFio1qWggtY41PVpYGrQl
         t5PgqSi4Bd58Hh72rUQvfLFnCp2ubXePcUeRtAbyvkeElp5xNbu2YaCuQUIRvWq4hmcL
         UFFwWAORs5gXbJ//APGHcA3GAUQpXN0fPl6YPzkwi1+UoquRS2MFINET2hynL//7NJAb
         r9GA==
X-Forwarded-Encrypted: i=1; AJvYcCVW5IUvKloVucFzrIPBkVvze8ZlZfuaQqZxpTj3AxY0UD4vnSfEtBvIKY6pMTw3USqgci5ViaTKxIvzOPNR@vger.kernel.org
X-Gm-Message-State: AOJu0YwFgHCTjxXpN1+xzXLjWy96kO69BRCuwwq1vIvrXy1Kb/KlXTjR
	gMI6tYvcxYbzYaM2eVvYhs3mLVnLHdWN84cfkujQeum6z3VFRjR/4fd/06IDJALpyOg=
X-Gm-Gg: ASbGncvJwU/aFAh5CgIq3sMr0+NMyogGkne/8+ifjMuEuvOAudN9TRWkQ9oRjSmYz8D
	IJpsjt3YGG+ODc9J6DiHu6DXxjcytZyQhITG6pcUUwl4jSic6uDqzorqWsqnZWGos5LIoPV5MnI
	YmdDOKO8kb/d3O1TOKkoEt3Dg4rA8McQegk3IzlmnVG9n6YEg47XWvJXXygSQKnwEoC5hGnXtsD
	lo71Qwi1B77EsL8IZH7YRs+aPaKRrvSUstClLt1r5bFQtyC2pMqzEnE9Evjopmhj8uZ+JWyWI1S
	bKfjydSAwdMSrh9nL/56eBxUZBmZDBF7nLKD4F1d/38lNY2oXfDy94JMG37UXbHPmi9j+htdz4k
	HVlX7clnXb+lJHvdvSPpleZg6m9ui/eKyd+Yujf4mp7gQCgikDKiQ6+YQ2+aq8z5cCMagJkI=
X-Google-Smtp-Source: AGHT+IH5WFHXj0MAsogmXEFsMguBCEu2+LGzAK6Up3vXAWYFmLrYzU7DqZUEVx2h3vNb0guaFYMCFQ==
X-Received: by 2002:a05:6000:1862:b0:3f4:8579:3692 with SMTP id ffacd0b85a97d-42567139e8bmr8755978f8f.11.1759775848188;
        Mon, 06 Oct 2025 11:37:28 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e61a022d8sm254997085e9.12.2025.10.06.11.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 11:37:27 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 06 Oct 2025 20:37:16 +0200
Subject: [PATCH RFC 3/6] ASoC: soc: qcom: sc8280xp: add support for I2S
 clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251006-topic-sm8x50-next-hdk-i2s-v1-3-184b15a87e0a@linaro.org>
References: <20251006-topic-sm8x50-next-hdk-i2s-v1-0-184b15a87e0a@linaro.org>
In-Reply-To: <20251006-topic-sm8x50-next-hdk-i2s-v1-0-184b15a87e0a@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5267;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=M5GD77yVYPF4Q7GbK/5MsLgJ13pQ7XTyeq/dx8K3o3k=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBo5Axji7KylYpPsvsncc7vt5nwH771LHGNHt5tDHXN
 VaqKniiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaOQMYwAKCRB33NvayMhJ0QVAD/
 9BlLFEVSfpcHuKOUy3obt8YQw32WcWZiI8dQOAWS7EDVQoJ5KDE7p5akSn/PbxH7mq/8qQRCpwF8a0
 f57TEFun9bTcnIkXFtHgkIvivsffMRqFYgShb9+Yi8VITe5lFy/9nAjyj8gh821QK9vQo8OEHpdzPR
 TidqLnmUZxEqkAFr0SkLhmy5XZeWfudvtIfGWBwDNT4r+fMTIFdaFexMjH+ioiRt0L/6/CRdknfqUD
 xS+xMqKOIzlgVpUVhDsuJhG7U3Wf5gtqqDVGKBaX4Vywa/OwQfzlQkqgSSgspYMrOfX3xB+1E/QtJ4
 CF+YhV68XMGO5hqgbht9Aj1CS5nANkdLXrKOMzVerZQ/2PYDl/Dk1M12bg3RBFlnacqKaZsGW3bWx4
 4Zga3Th4MG54eSB0zBUO4eqyuoWk20C9rDklS9Pl+uUVlC8ZPJ6eTWfIXBbLAmF6LyvgyOrSFpmd7O
 PWaqaesE9Llv3lsQhgo7F5f8TFQrcWupHXxukioy6oMp7uhMvx+zJj81E4TJvyzNRr2dQIeN+oeJCc
 DLEmBbnhD3Ai3PMO8ojtIzO9wuJh9wd3PRBXQuK2vqVraHcp3xTchNS4K3wEKUvvYrkFL050uL0AVm
 Kiy2nZcXzIogLzpY13E1PR6fbPk7TAXTa/E78yeV+zYa5RR/LL7f8KiyexvQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add support for getting the I2S clocks used for the MI2S
interfaces, and enable/disable the clocks on the PCM
startup and shutdown card callbacks.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/sc8280xp.c | 104 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 103 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 78e327bc2f07767b1032f09af7f45b947e7eb67a..ad4ee5c6fab8994f18de572842f3dab6f4f5397e 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -4,6 +4,8 @@
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/clk.h>
+#include <linux/of_clk.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/pcm.h>
@@ -15,12 +17,16 @@
 #include "common.h"
 #include "sdw.h"
 
+#define I2S_MAX_CLKS	5
+
 struct sc8280xp_snd_data {
 	bool stream_prepared[AFE_PORT_MAX];
 	struct snd_soc_card *card;
 	struct sdw_stream_runtime *sruntime[AFE_PORT_MAX];
 	struct snd_soc_jack jack;
 	struct snd_soc_jack dp_jack[8];
+	struct clk *i2s_clk[I2S_MAX_CLKS];
+	struct clk *i2s_mclk[I2S_MAX_CLKS];
 	bool jack_setup;
 };
 
@@ -68,12 +74,66 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
 }
 
+static int sc8280xp_snd_i2s_index(struct snd_soc_dai *dai)
+{
+	switch (dai->id) {
+	case PRIMARY_MI2S_RX..PRIMARY_MI2S_TX:
+		return 0;
+	case  SECONDARY_MI2S_RX.. SECONDARY_MI2S_TX:
+		return 1;
+	case TERTIARY_MI2S_RX..TERTIARY_MI2S_TX:
+		return 2;
+	case QUATERNARY_MI2S_RX..QUATERNARY_MI2S_TX:
+		return 3;
+	case QUINARY_MI2S_RX..QUINARY_MI2S_TX:
+		return 4;
+	default:
+		return -1;
+	}
+}
+
+static int sc8280xp_snd_startup(struct snd_pcm_substream *substream)
+{
+	unsigned int codec_dai_fmt = SND_SOC_DAIFMT_BC_FC | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct sc8280xp_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	int index;
+
+	switch (cpu_dai->id) {
+	case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:
+	case QUINARY_MI2S_RX...QUINARY_MI2S_TX:
+		index = sc8280xp_snd_i2s_index(cpu_dai);
+		clk_enable(pdata->i2s_mclk[index]);
+		clk_enable(pdata->i2s_clk[index]);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
+	default:
+		break;
+	}
+
+	return qcom_snd_sdw_startup(substream);
+}
+
 static void sc8280xp_snd_shutdown(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sc8280xp_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
 	struct sdw_stream_runtime *sruntime = pdata->sruntime[cpu_dai->id];
+	int index;
+
+	switch (cpu_dai->id) {
+	case PRIMARY_MI2S_RX..TERTIARY_MI2S_RX:
+	case QUINARY_MI2S_RX...QUINARY_MI2S_TX:
+		index = sc8280xp_snd_i2s_index(cpu_dai);
+		clk_disable(pdata->i2s_clk[index]);
+		clk_disable(pdata->i2s_mclk[index]);
+		break;
+	default:
+		break;
+	}
 
 	pdata->sruntime[cpu_dai->id] = NULL;
 	sdw_release_stream(sruntime);
@@ -141,7 +201,7 @@ static int sc8280xp_snd_hw_free(struct snd_pcm_substream *substream)
 }
 
 static const struct snd_soc_ops sc8280xp_be_ops = {
-	.startup = qcom_snd_sdw_startup,
+	.startup = sc8280xp_snd_startup,
 	.shutdown = sc8280xp_snd_shutdown,
 	.hw_params = sc8280xp_snd_hw_params,
 	.hw_free = sc8280xp_snd_hw_free,
@@ -162,6 +222,44 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *card)
 	}
 }
 
+static const char * const i2s_bus_names[I2S_MAX_CLKS] = {
+	"primary",
+	"secondary",
+	"tertiary",
+	"quaternary",
+	"quinary",
+};
+
+static int sc8280xp_get_i2c_clocks(struct platform_device *pdev,
+				   struct sc8280xp_snd_data *data)
+{
+	struct device *dev = &pdev->dev;
+	int i;
+
+	if (!device_property_present(dev))
+		return 0;
+
+	for (i = 0; i < I2S_MAX_CLKS; ++i) {
+		char name[16];
+
+		snprintf(name, 16, "%s-mi2s", i2s_bus_names, i);
+		data->i2s_clk[i] = devm_clk_get_optional_prepared(dev, name);
+		if (IS_ERR(data->i2s_clk[i]))
+			return dev_err_probe(dev, PTR_ERR(data->i2s_clk[i]),
+					     "unable to get %s clock\n",
+					     name);
+
+		snprintf(name, 16, "%s-mclk", i2s_bus_names, i);
+		data->i2s_mclk[i] = devm_clk_get_optional_prepared(dev, name);
+		if (IS_ERR(data->i2s_mclk[i]))
+			return dev_err_probe(dev, PTR_ERR(data->i2s_mclk[i]),
+					     "unable to get %s clock\n",
+					     name);
+	}
+
+	return 0;
+}
+
 static int sc8280xp_platform_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card;
@@ -185,6 +283,10 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = sc8280xp_get_i2c_clocks(pdev, data);
+	if (ret)
+		return ret;
+
 	card->driver_name = of_device_get_match_data(dev);
 	sc8280xp_add_be_ops(card);
 	return devm_snd_soc_register_card(dev, card);

-- 
2.34.1


