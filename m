Return-Path: <linux-arm-msm+bounces-78181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDA4BF6E60
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 15:53:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1DE67504768
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 13:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E14B33A02B;
	Tue, 21 Oct 2025 13:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lbr8IPQW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D71C339703
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 13:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761054667; cv=none; b=g/ejsVSLSPtvgE2gjvNwf+doCUWrJeRz8xxaz5oT3zlLjUQbZCZMdK6caUxL8zJ322sR+tZ1u3753HVthpcZ0YdDsWBYBQHzdcY6VQYNnfZwW57EQc/lv/JER3HNFFUXXVy2gQ5op28tdIQjbZspgbmi8I/xLo3PmFjbuYqCD64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761054667; c=relaxed/simple;
	bh=K2jOnkW1IsfbbGeogypIYlrDxXiV/U7Y6TILjFAX1/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bT31g5LM9pDT8IeMpnlHWarI6uDBxpT0u560wOIBV9DqatbLuPEX55CtdZyXey4QRHPxK8YOzuYhLruGryQohklEjFkEoBGpvQc+i9SXRnpZAHCp8BRqYZYAR7lajxk03stiA0sb+eB6vinolb8na486a1U9edWQq3bWMpcYfu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lbr8IPQW; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-427015003eeso947084f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 06:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761054664; x=1761659464; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bWW5rpiL3fXVP4SacOcVtEnuu9Zwh6Lw21oGD01RkRw=;
        b=lbr8IPQWRYG9GBBw8BCwSfaJyYR6moo9IodUx5J7cJf/Z+s+r4FaXz9DeHe9natYHP
         Bw6/o9Ll4Le6chTKdp5eZWIapnL0rTnmrRjPyooppXoSprODKpGJj9CsoQkg3borTFXI
         QVddDrGEk+/A5AwxClXx/4AH5rmPesgHSag09HczNRg9W6isaItWGR6SJ5kcBYreAaUu
         86RGbRbHlGhvWVfAc5jZSi2JqBKeftr87Swwkm8puY+zLP+fDVwwqcCspUKut4R8iaQq
         qLI6KFlQPzfx/3vDV13ido3kwKPNdue6EIvJxBAMTtnS7C2hUeJdMXcueRpzSbgIjx5q
         E+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761054664; x=1761659464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWW5rpiL3fXVP4SacOcVtEnuu9Zwh6Lw21oGD01RkRw=;
        b=id99/JjwArsh3avLmlynR08Ja7DlO4k49zlV2WLiy43bZQ9uZN0zku8AxszFxjjDGV
         Ux776grjxOhMa95tSBc7JES4iByY5hFRVZB58i8xppDsVK8TjHLAGxLAKm5xRK8ZYfQD
         mMGSyozicrOBZXyhiTI7jMSnlbfHwr5KX3+sxyn2aut/VhDD0mBBt24OdoSMAunEO+Hz
         yO/5JhZkGvipp6cbJvREfiA9B80SbidO+iUpbuQqxkuBQVXjxN+lzpeDIM0lstf3FT84
         awTZLy0Dn5A9OqtUhSRG9tS4FV9RRS2B2fQEM2G9Ydp01YSaR7sPxgbXOzPLrLEX6ITl
         eRng==
X-Forwarded-Encrypted: i=1; AJvYcCVw7HwZzcQmNFmM7/aSAa9agsaLC4WEDOuuddoJ+WwMVEE7wGnr6BRvKJS20IIqWoHEGgW8NcyV/6O55oHy@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj2m1T3UZloSTgCslGs0xno7EzZcd4ubet6uM8MBwQVZ4eZeJ1
	NzKAuxlO5xetZqCNSCSuv663Yu/UEVkRD8ZFRdN0JmghyDxSHtN1MJ3OFeagFdFv8No=
X-Gm-Gg: ASbGnct+d35mzC4913OT9l1sPNJuD1B7apTxTwpdng+bH+sdiwKvJw01QyGib4GuLHz
	okhS52AqLbHgXLbPQSC/pNoYNESGW84DSWUkUgGfb0UocTsT02ig5XSE1lotxWxVFcN5E0++bMp
	GTZkd5e3NG7hJCumR4GxLwKthmQ5ytevkSOq6daE8D+YA+amUlatLYpIvriRWoXFxeCuhY/7N+x
	DQSDNgjggcBFHhZ+MpDC7/4hQOdH3eA4OECB6N6wbO1nyFNzrIhlmusw/B9Aq7YzF2aBEjpXKGj
	RyXBO8AAbLQe8oA7botMJQBKbaroJEQ6XPGbJ24jiPrdilHotETBvp7G9axM4RGuCV4sGBoh2KK
	rdNBYLk4A+RSQ27UjwSGnf34ITS2OzIArO1jpcxpdhoWuNGDR3MUGWz+b0PdFN2qW8JiCaPPHUw
	==
X-Google-Smtp-Source: AGHT+IEVarB8hPd9oTaPMzVW88VSh7bgsSwShOtuu9cb1VFtLqYXTOEOEnjKaYmdkaTGgMDCDNPnsw==
X-Received: by 2002:a05:6000:3101:b0:3ff:17ac:a34b with SMTP id ffacd0b85a97d-42704db8d8fmr12866650f8f.42.1761054663604;
        Tue, 21 Oct 2025 06:51:03 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00b97f8sm20124378f8f.36.2025.10.21.06.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 06:51:02 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 21 Oct 2025 16:50:45 +0300
Subject: [PATCH RFC 2/3] ASoC: qcom: x1e80100: Add Dell XPS13 9345 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-dell-xps13-9345-enable-audio-v1-2-6f3f6bbd977b@linaro.org>
References: <20251021-dell-xps13-9345-enable-audio-v1-0-6f3f6bbd977b@linaro.org>
In-Reply-To: <20251021-dell-xps13-9345-enable-audio-v1-0-6f3f6bbd977b@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3561; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=K2jOnkW1IsfbbGeogypIYlrDxXiV/U7Y6TILjFAX1/c=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBo94+/wao7msGfzrKycnoNRBsxGkf+jr3yIVSag
 doPwABdLfmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaPePvwAKCRAbX0TJAJUV
 Vik0D/9yRlW7mzDOHEZOM4jU8YAieeym5Qv4zPGKoJZs2lKTlP77jfPT+8ouLYC/f6lUvG43tpq
 fgWnbwhFpZI5mAmZM1NZ/q8Eph63OH8zrCh+ei3r+IhefciJ1FxlujC9RUOjMzQByrA83141md1
 0qSgE6YQwgqNT1Rq0xSV+QgEo6IdPIFC2B1NaJVnUVEBpXhrzlvng9WH0sRIpgGSiwTFP6pUgCi
 VvPhfza6NsrEKTpPUiK4qJckRcRQjVYFJbRM2KSfMuSJFxmrKJint/PgIKT0j34Dl0gq2MNefX1
 hVHdRD31Ctmv/0pBz9g6Ll8pRr6GW7lq0LSehX1lD2dl2AE6nbUa+v2ErDLz1wUbYs+mV7Kdk1S
 9fEN7GXLKX+pwzZxxJGITtuoR+Nqx6poFcnkZob2UHb2lk/fKUf79HlEYLkWL7xIDdkuXoFgLIO
 R2iOxtqH32/tkaUWU74VF7DWI22wp1oU7yZ/H/HO7HFJa45LKpKiyNlC83wwfZPNfthz84YFPSp
 /X7AI4jJMtG4dcolrPS9x2wXzUS18/V/ubyT3wqDFGMXigpwotemHsfNQ7A8JffbXRStfjTX32T
 APjxSfVyXPeF9nlrMUk2vYF8ERvnxgzn4KnoTjAi9cR47Ux26yrSjon476SQw/SoevCoQmXspIK
 YSFzwxWlX8ZiTew==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

On Dell XPS13 9345, the PCM channels are mapped starting with right
hand side instead of left. So in order to support this, we need to
hardcode the mapping and tie it up to a dedicated board compatible.

So define a match data that brings the mapping as well, for the XPS 13,
while the rest of the boards will fallback to use the mapping based
on number of channels.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 sound/soc/qcom/x1e80100.c | 49 ++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 44 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index 444f2162889f7d9d4b6b06bddc980d8a15dd988b..e21cf534b2ac3875b694f381f260164acb2e3ae4 100644
--- a/sound/soc/qcom/x1e80100.c
+++ b/sound/soc/qcom/x1e80100.c
@@ -15,10 +15,17 @@
 #include "qdsp6/q6dsp-common.h"
 #include "sdw.h"
 
+struct x1e80100_snd_cfg {
+	const char *driver_name;
+	const unsigned int *channels_map;
+	int channels_num;
+};
+
 struct x1e80100_snd_data {
 	bool stream_prepared[AFE_PORT_MAX];
 	struct snd_soc_card *card;
 	struct sdw_stream_runtime *sruntime[AFE_PORT_MAX];
+	const struct x1e80100_snd_cfg *cfg;
 	struct snd_soc_jack jack;
 	struct snd_soc_jack dp_jack[8];
 	bool jack_setup;
@@ -95,8 +102,16 @@ static int x1e80100_snd_hw_params(struct snd_pcm_substream *substream,
 	return qcom_snd_sdw_hw_params(substream, params, &data->sruntime[cpu_dai->id]);
 }
 
-static int x1e80100_snd_hw_map_channels(unsigned int *ch_map, int num)
+static int x1e80100_snd_hw_map_channels(struct x1e80100_snd_data *data,
+					unsigned int *ch_map, int num)
 {
+	if (data->cfg->channels_map) {
+		for (int i = 0; i < data->cfg->channels_num; i++)
+			ch_map[i] = data->cfg->channels_map[i];
+
+		return 0;
+	}
+
 	switch (num) {
 	case 1:
 		ch_map[0] = PCM_CHANNEL_FC;
@@ -136,7 +151,7 @@ static int x1e80100_snd_prepare(struct snd_pcm_substream *substream)
 	switch (cpu_dai->id) {
 	case WSA_CODEC_DMA_RX_0:
 	case WSA_CODEC_DMA_RX_1:
-		ret = x1e80100_snd_hw_map_channels(rx_slot, channels);
+		ret = x1e80100_snd_hw_map_channels(data, rx_slot, channels);
 		if (ret)
 			return ret;
 
@@ -210,15 +225,39 @@ static int x1e80100_platform_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	card->driver_name = of_device_get_match_data(dev);
+	data->cfg = of_device_get_match_data(dev);
+
+	card->driver_name = data->cfg->driver_name;
 	x1e80100_add_be_ops(card);
 
 	return devm_snd_soc_register_card(dev, card);
 }
 
+static const struct x1e80100_snd_cfg x1e80100_cfg = {
+	.driver_name = "x1e80100",
+};
+
+static const struct x1e80100_snd_cfg glymur_cfg = {
+	.driver_name = "glymur",
+};
+
+static const unsigned int right_left_4_channels_map[] = {
+	PCM_CHANNEL_FR,
+	PCM_CHANNEL_RB,
+	PCM_CHANNEL_FL,
+	PCM_CHANNEL_LB,
+};
+
+static const struct x1e80100_snd_cfg dell_xps13_9345_cfg = {
+	.driver_name = "x1e80100",
+	.channels_map = right_left_4_channels_map,
+	.channels_num = ARRAY_SIZE(right_left_4_channels_map),
+};
+
 static const struct of_device_id snd_x1e80100_dt_match[] = {
-	{ .compatible = "qcom,x1e80100-sndcard", .data = "x1e80100" },
-	{ .compatible = "qcom,glymur-sndcard", .data = "glymur" },
+	{ .compatible = "qcom,x1e80100-sndcard", .data = &x1e80100_cfg, },
+	{ .compatible = "dell,xps13-9345-sndcard", .data = &dell_xps13_9345_cfg, },
+	{ .compatible = "qcom,glymur-sndcard", .data = &glymur_cfg, },
 	{}
 };
 MODULE_DEVICE_TABLE(of, snd_x1e80100_dt_match);

-- 
2.48.1


