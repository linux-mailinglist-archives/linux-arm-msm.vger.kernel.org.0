Return-Path: <linux-arm-msm+bounces-82032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8947BC62628
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 06:20:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 72F4D3613B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 05:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15352317712;
	Mon, 17 Nov 2025 05:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="XWk4+hhc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E883168EB
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 05:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763356645; cv=none; b=ljZx6vnqpuLhP0bonsGJlbD0Qpqmv4UyNZBDu6n7ln+f7CmdhuDBI3y+foxWQSO3i4PYpGyFshvniT8ZRMICD2YNSmV9RYHjtN8y2AMRyJC2xfZ+4cINrKUamWxfrQU8OVtuyOOiuCo+6+yD79KUqrq54mNXfAP8y4rCiwz5x60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763356645; c=relaxed/simple;
	bh=QClXhx5ARnTy9LGdH+a8E6RnFwHPyRcc8KD2gn0mW8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h/3mhPjhK4W7+CDSvypCzhU0NYZBV9pejVoDyXneDg24vJsmJjga0j3F7AiMRtTLvbeEKiHbdjZRSzhytAz4MYWUIhF2esnZA1PIoPTvSx+4rCpL8Wh+mK19otGk/nGOe6cFsDHqOWJ2zY6nN15WSgWpS7aO51D7O2NuWAohu8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=XWk4+hhc; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8b2dcdde65bso215378285a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 21:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1763356640; x=1763961440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FLG0T5uQDYkiU6SBnwuZjMqSGIc/bYbXTWXhObRL4cI=;
        b=XWk4+hhcS0fpvoI2Q7mgd4l0UeySZhjarzxlYr6gObcKGbn/lHAK32QPpVabBgIytC
         re13sMGc4rI6nM3ZZ4Fxi5K79nmox/EIGDYf2L8F5fr/ptbIAGxdMI7bQ2vLuxNci90a
         pmo66cskbxnWza+ejQLn8OFZaYKr9W5ZNPOwA6SJrr2WgYUWu+FM5oqWA1bSiKeK77D8
         j88U/xJj/mA6Z9LxYjm8Cypio37xn07/CkffaTRg1riJ/wZZjurAzyAAkIOK90Dk/oK+
         yYisFhR9grLxrg1GMsytg8nZNE+mFQucZbtcX7bht76svsyqu6VzSrC7UGF+Eo0xkHdZ
         IHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763356640; x=1763961440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FLG0T5uQDYkiU6SBnwuZjMqSGIc/bYbXTWXhObRL4cI=;
        b=ZIGML98Nrp/DIu4v8tb9KZvUIyjuOTVo3Mspv5bMqgjVGPba5ahVKgw1HO6pid1zYK
         qabbDO35IrhGzeb+oK+bXKfOH5pY9fSx6CjYi4+tFaLrX5RAlefRZ9dUqwzY2dHAnviY
         rg7I9QRtVbjSIKmzdK9RpbgrcUubrwzBnhQV2MlTm4TVeXgaPaVNRuluJgUD4hTKlKQ+
         E/2yKSpNRlRx2LTvjaDyxb1dEpWXbw9zcBEZ5ydQ/xXRoysWkV5wVIelMw4dnbCdR1AA
         fn0tE/huv0vHjN+Ol4KmVZOb0ukyR7zbjnpnQmMRl7efBfyyUHJZa+8N7C6rajMFyceh
         QKvw==
X-Gm-Message-State: AOJu0YxHB/+8TsVcZSg08K1SiFLY5yUSEsVblDsA2CYNvWV1SbQijkcC
	gAqT7AGdOa9GDRtcTrDR6lDE66MVyiT5aPtayweNOtcIndWFmAASeuTImjOYbAuNW1mpHF1t8vk
	ojdA0
X-Gm-Gg: ASbGncswZAZJlErkM6df/ixrZIFEWPW7URS9I2QIvEGteV8+ASojczNxeqSKU77AdPV
	dOiSxLZb+tV4EcOtpv4wZTwrTasRQPm+qmX3Ku84L7rmdPXEjMrTh14b8dJBeP6gaDLm+xj6/b9
	C/iRizH8NKFx0a+quJnr5iziV7bZahvfSOLY6chiKA1Pv5odQkyPayEOjoAdmtMDj0DD9pApNrG
	lAsL74tZfMxSJQRn7t9zAUnkfhJc4DyFc8kyPWBPtDBDiBJey73oxhP8FElZ/fJY4+aHn1nSqNx
	bWbpONdN6PXaNGWZ0qmt3Kr608GFH2yKKFsiyigRLYBvPfByBywP4LF5BjNH08FzNsMZ1fnD/pG
	LUts6hWxY0SifT92AUmFOhwhDgNL6/NZlIaHWrRtjNPUkBBfaVaoYxyzykftnmhlhWJzhq/BSje
	EWGE9Z+g4D2FCO48GGVJDIaGNB3JX6UGyqZjWnKCfjY/PIpKuPX/6LJ5U=
X-Google-Smtp-Source: AGHT+IHV9YdJAX/ejpEt3AE8rAH/db03OuIBK9xBWIZhcnMimpNgDSnNalE0fhyfK2+x00/+/f9n9g==
X-Received: by 2002:a05:620a:4095:b0:8b2:7608:1ee0 with SMTP id af79cd13be357-8b2c31c795emr1352025285a.71.1763356639827;
        Sun, 16 Nov 2025 21:17:19 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2aef2f936sm906417185a.29.2025.11.16.21.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 21:17:19 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org (open list:QCOM AUDIO (ASoC) DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 7/9] ASoC: codecs: lpass-wsa-macro: add RX4 and RX5
Date: Mon, 17 Nov 2025 00:15:19 -0500
Message-ID: <20251117051523.16462-7-jonathan@marek.ca>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117051523.16462-1-jonathan@marek.ca>
References: <20251117051523.16462-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows playback using the WSA_2CH AIF, which feeds RX4 and RX5 on both
WSA and WSA2.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 sound/soc/codecs/lpass-wsa-macro.c | 48 ++++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index e2e78ff6dd54e..f02153108c275 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -300,6 +300,8 @@ enum {
 	WSA_MACRO_RX_MIX,
 	WSA_MACRO_RX_MIX0 = WSA_MACRO_RX_MIX,
 	WSA_MACRO_RX_MIX1,
+	WSA_MACRO_RX4,
+	WSA_MACRO_RX5,
 	WSA_MACRO_RX_MAX,
 };
 
@@ -2228,6 +2230,10 @@ static const struct snd_kcontrol_new rx_mux[WSA_MACRO_RX_MAX] = {
 			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
 	SOC_DAPM_ENUM_EXT("WSA RX_MIX1 Mux", rx_mux_enum,
 			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
+	SOC_DAPM_ENUM_EXT("WSA RX4 Mux", rx_mux_enum,
+			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
+	SOC_DAPM_ENUM_EXT("WSA RX5 Mux", rx_mux_enum,
+			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
 };
 
 static int wsa_macro_vi_feed_mixer_get(struct snd_kcontrol *kcontrol,
@@ -2410,6 +2416,10 @@ static const struct snd_soc_dapm_widget wsa_macro_dapm_widgets_v2_5[] = {
 	SND_SOC_DAPM_MUX("WSA_RX1 INP1", SND_SOC_NOPM, 0, 0, &rx1_prim_inp1_mux_v2_5),
 	SND_SOC_DAPM_MUX("WSA_RX1 INP2", SND_SOC_NOPM, 0, 0, &rx1_prim_inp2_mux_v2_5),
 	SND_SOC_DAPM_MUX("WSA_RX1 MIX INP", SND_SOC_NOPM, 0, 0, &rx1_mix_mux_v2_5),
+	SND_SOC_DAPM_MIXER("WSA RX4", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("WSA RX5", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MUX("WSA RX4 MUX", SND_SOC_NOPM, WSA_MACRO_RX4, 0, &rx_mux[WSA_MACRO_RX4]),
+	SND_SOC_DAPM_MUX("WSA RX5 MUX", SND_SOC_NOPM, WSA_MACRO_RX5, 0, &rx_mux[WSA_MACRO_RX5]),
 };
 
 static const struct snd_soc_dapm_route wsa_audio_map[] = {
@@ -2529,6 +2539,31 @@ static const struct snd_soc_dapm_route wsa_audio_map[] = {
 	{"WSA_SPK2 OUT", NULL, "WSA_MCLK"},
 };
 
+static const struct snd_soc_dapm_route wsa_audio_map_v2_5[] = {
+	{"WSA RX4 MUX", "AIF1_PB", "WSA AIF1 PB"},
+	{"WSA RX5 MUX", "AIF1_PB", "WSA AIF1 PB"},
+	{"WSA RX4 MUX", "AIF_MIX1_PB", "WSA AIF_MIX1 PB"},
+	{"WSA RX5 MUX", "AIF_MIX1_PB", "WSA AIF_MIX1 PB"},
+	{"WSA RX4", NULL, "WSA RX4 MUX"},
+	{"WSA RX5", NULL, "WSA RX5 MUX"},
+	{"WSA_RX0 INP0", "RX4", "WSA RX4"},
+	{"WSA_RX0 INP0", "RX5", "WSA RX5"},
+	{"WSA_RX0 INP1", "RX4", "WSA RX4"},
+	{"WSA_RX0 INP1", "RX5", "WSA RX5"},
+	{"WSA_RX0 INP2", "RX4", "WSA RX4"},
+	{"WSA_RX0 INP2", "RX5", "WSA RX5"},
+	{"WSA_RX0 MIX INP", "RX4", "WSA RX4"},
+	{"WSA_RX0 MIX INP", "RX5", "WSA RX5"},
+	{"WSA_RX1 INP0", "RX4", "WSA RX4"},
+	{"WSA_RX1 INP0", "RX5", "WSA RX5"},
+	{"WSA_RX1 INP1", "RX4", "WSA RX4"},
+	{"WSA_RX1 INP1", "RX5", "WSA RX5"},
+	{"WSA_RX1 INP2", "RX4", "WSA RX4"},
+	{"WSA_RX1 INP2", "RX5", "WSA RX5"},
+	{"WSA_RX1 MIX INP", "RX4", "WSA RX4"},
+	{"WSA_RX1 MIX INP", "RX5", "WSA RX5"},
+};
+
 static int wsa_swrm_clock(struct wsa_macro *wsa, bool enable)
 {
 	struct regmap *regmap = wsa->regmap;
@@ -2562,7 +2597,9 @@ static int wsa_macro_component_probe(struct snd_soc_component *comp)
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(comp);
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(comp);
 	const struct snd_soc_dapm_widget *widgets;
-	unsigned int num_widgets;
+	const struct snd_soc_dapm_route *routes;
+	unsigned int num_widgets, num_routes;
+	int ret;
 
 	snd_soc_component_init_regmap(comp, wsa->regmap);
 
@@ -2587,6 +2624,7 @@ static int wsa_macro_component_probe(struct snd_soc_component *comp)
 	case LPASS_CODEC_VERSION_2_1:
 		widgets = wsa_macro_dapm_widgets_v2_1;
 		num_widgets = ARRAY_SIZE(wsa_macro_dapm_widgets_v2_1);
+		num_routes = 0;
 		break;
 	case LPASS_CODEC_VERSION_2_5:
 	case LPASS_CODEC_VERSION_2_6:
@@ -2595,12 +2633,18 @@ static int wsa_macro_component_probe(struct snd_soc_component *comp)
 	case LPASS_CODEC_VERSION_2_9:
 		widgets = wsa_macro_dapm_widgets_v2_5;
 		num_widgets = ARRAY_SIZE(wsa_macro_dapm_widgets_v2_5);
+		routes = wsa_audio_map_v2_5;
+		num_routes = ARRAY_SIZE(wsa_audio_map_v2_5);
 		break;
 	default:
 		return -EINVAL;
 	}
 
-	return snd_soc_dapm_new_controls(dapm, widgets, num_widgets);
+	ret = snd_soc_dapm_new_controls(dapm, widgets, num_widgets);
+	if (ret)
+		return ret;
+
+	return snd_soc_dapm_add_routes(dapm, routes, num_routes);
 }
 
 static int swclk_gate_enable(struct clk_hw *hw)
-- 
2.51.0


