Return-Path: <linux-arm-msm+bounces-83330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA59C875C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 23:40:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 790A93A5761
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 22:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252C533BBAB;
	Tue, 25 Nov 2025 22:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="B9E7jy5I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4128A2EA72A
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 22:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764110420; cv=none; b=Qn0OC7yLK//vPU38/WaLkZCWA6xAKQOEv2hjnhPfdcnnsf6r4tSBQ1CRF+wXC7cQSt5oRHBtCeDzG4W3LyLhbB5OI523pDHllSm1/FacY8BrURcBZ1/GfBEhGjLyU8H1pM6JkaAxYyYHm1ms5Tf774Fssl2eJy1sV/KwWJXrnU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764110420; c=relaxed/simple;
	bh=gnX9JW5f46EXyEPEqpCvdvIki/uTlKEZkFS8ea24FGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G6Y0R5tte82uFS+ydLpvk1z7aERQQElTktSeiMnCSMN0WteEcLu4qF7Si/kVWd87WvaB4pzuNWchyC3FGyvf86KIJq9dD0vyOuST5v13VpbwlUJF7HezgWP+Zu2dUvYfbRbR7GLYCWCjUqd2a2QTmllHY2Fjokk1et5TDbIf4yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=B9E7jy5I; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4ee0084fd98so50269281cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 14:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1764110417; x=1764715217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GpUlgL7OoQH+YHHyuLPwxyegT1nfFlDHYmrN4C1UCdM=;
        b=B9E7jy5I4mgHiDBUChkCJ/APrbv0Y7Epuk2cZFRVpptRWZfNKCrGt86ZJYWUM1IARI
         tEXFjchr7GuZX81boJNnXaVYF4Jx0D6PR16Xoe8EPyvzqn6YZFK7FtgDfozriMX66Oaw
         +UOtNotDrVNZwJMTQoTpnmZEXsv0BJQZSrgSaCs1IIBAfqMbp6v3Ut9p/fMyR1Ic0+Vz
         pZHQZEnJ3M0M+MzV0gJAhtJCaNr6XQ49c02shtMJaWWSvTNLxdQEfBDGj50VveRnXn7g
         RPG/OBmJmj61AE7oqC7+2FBsliuhGZm2o0HrkxDrtpaS6wCx5S7GHj/OhD50BQI8rXAP
         mCCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764110417; x=1764715217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GpUlgL7OoQH+YHHyuLPwxyegT1nfFlDHYmrN4C1UCdM=;
        b=JXs7ykR43VQqnxQi0QCeOAhEZJF1CywJYiPqs3DHhKtvxrBSjIa2RUwx1o4lSZlI/T
         ri6KYGZDyECHhaXXIaet41XmqTLZgPw/ZUNEGI1kCbWgfoC67gXGJNk3jyiVMDUbIvFm
         UP/lPecD8Mndq0jgNY5smZcDGRcZSqtWhYthCV+yYDNtcSb0nKoVFnHd1Q/Y/LpLAjs0
         2hb2EvZi6mm0EAeNp0Xx6oxKO7bgIVlIYMoTZxc1Lr5cXsdmpOsaillcopKt2MMZ2AME
         U81pR3u3TUz3AP3P9MWg8Gs7SzUgZt1v6y7KwVdCO5jZHHjJ8Lkutl+meNCHAFw620Tv
         1SgQ==
X-Gm-Message-State: AOJu0YyPGL6pURsap/OjBUFSCDBi63KsUmGXvTsRhhP9h8IUkDlcNnUy
	KPMK04eLYeGxSK76GfUza6jRK4Tc5M8Kgl3lmc08v7IbQZPNVV+ge9sgNyk8zjXq6Rx0+10ixJx
	+0Rjs
X-Gm-Gg: ASbGncs+V3KdN1dZIVw4ZrHgzHgGIBR5BIRBc7Gfz473LKORYmfgDNDphUV8NofNtdn
	Kzlguyrh+Ha6RYMO/Vdri2QpfCP/azTU3Q1mfKfU6i6y85BpbvaLI1Nveev2t/VX408r+YcMjSr
	xapSTpan82tzlOpx8J1E3XeaN7quDQ4UYsEaPx8NjdXGsUYqCYehKUwSSEJCZiYsYP1cniDa9sg
	7Jr+kwd7NlvzCgDfIG39LWDNdbwE4uRzBKip/CKNaaPFOWrCRe3CK/shUCcVL6bM1uGg9F8En9Q
	vstK8bKkefTVz21J2dWzND9M/ooDU7iPU39aB95udnFgDKiv7zPRSL/MS+bKdOFwmxNDzlXHXFP
	NwuwHVM3SL3ElQHZZtzW8Cw7tFq+QYmtlCFaEFptSwbCBHGLv9nPLD4WObcz60w2ZMVOHj7t9cn
	MBDt7lMqzR121pPKGd3s5VqgECgBFcIBuSGOpSn01sXvvwPS0PfdYOnd3H7Rhl4CxjVM5SXwqDA
	o3C
X-Google-Smtp-Source: AGHT+IG/AXrf847z5waiX56BUbuq0TBVNl+tKPHmuICjf5LmTDcAnM4xXSW87YloDzklhKJF+4+8gw==
X-Received: by 2002:ac8:5fc1:0:b0:4ee:4214:3201 with SMTP id d75a77b69052e-4ee58b30a71mr235780211cf.78.1764110416736;
        Tue, 25 Nov 2025 14:40:16 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e54e9e2sm132836336d6.31.2025.11.25.14.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 14:40:16 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org (open list:QCOM AUDIO (ASoC) DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 1/2] ASoC: codecs: lpass-wsa-macro: add RX4/RX5/RX6/RX7/RX8
Date: Tue, 25 Nov 2025 17:35:32 -0500
Message-ID: <20251125223848.1798-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251125223848.1798-1-jonathan@marek.ca>
References: <20251125223848.1798-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows playback using the WSA_2CH AIF, which feeds RX4 and RX5 on both
WSA and WSA2.

RX6/RX7/RX8 can be tested with the regular WSA AIF (the 3rd intf is RX8,
the 5th intf is RX6/7).

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 sound/soc/codecs/lpass-wsa-macro.c | 96 +++++++++++++++++++++++++++++-
 1 file changed, 94 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 74a812fa7dcb2..e00b901eb3a0c 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -299,6 +299,11 @@ enum {
 	WSA_MACRO_RX1,
 	WSA_MACRO_RX_MIX0,
 	WSA_MACRO_RX_MIX1,
+	WSA_MACRO_RX4,
+	WSA_MACRO_RX5,
+	WSA_MACRO_RX6,
+	WSA_MACRO_RX7,
+	WSA_MACRO_RX8,
 	WSA_MACRO_RX_MAX,
 };
 
@@ -2227,6 +2232,16 @@ static const struct snd_kcontrol_new rx_mux[WSA_MACRO_RX_MAX] = {
 			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
 	SOC_DAPM_ENUM_EXT("WSA RX_MIX1 Mux", rx_mux_enum,
 			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
+	SOC_DAPM_ENUM_EXT("WSA RX4 Mux", rx_mux_enum,
+			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
+	SOC_DAPM_ENUM_EXT("WSA RX5 Mux", rx_mux_enum,
+			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
+	SOC_DAPM_ENUM_EXT("WSA RX6 Mux", rx_mux_enum,
+			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
+	SOC_DAPM_ENUM_EXT("WSA RX7 Mux", rx_mux_enum,
+			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
+	SOC_DAPM_ENUM_EXT("WSA RX8 Mux", rx_mux_enum,
+			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
 };
 
 static int wsa_macro_vi_feed_mixer_get(struct snd_kcontrol *kcontrol,
@@ -2409,6 +2424,16 @@ static const struct snd_soc_dapm_widget wsa_macro_dapm_widgets_v2_5[] = {
 	SND_SOC_DAPM_MUX("WSA_RX1 INP1", SND_SOC_NOPM, 0, 0, &rx1_prim_inp1_mux_v2_5),
 	SND_SOC_DAPM_MUX("WSA_RX1 INP2", SND_SOC_NOPM, 0, 0, &rx1_prim_inp2_mux_v2_5),
 	SND_SOC_DAPM_MUX("WSA_RX1 MIX INP", SND_SOC_NOPM, 0, 0, &rx1_mix_mux_v2_5),
+	SND_SOC_DAPM_MIXER("WSA RX4", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("WSA RX5", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("WSA RX6", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("WSA RX7", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("WSA RX8", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MUX("WSA RX4 MUX", SND_SOC_NOPM, WSA_MACRO_RX4, 0, &rx_mux[WSA_MACRO_RX4]),
+	SND_SOC_DAPM_MUX("WSA RX5 MUX", SND_SOC_NOPM, WSA_MACRO_RX5, 0, &rx_mux[WSA_MACRO_RX5]),
+	SND_SOC_DAPM_MUX("WSA RX6 MUX", SND_SOC_NOPM, WSA_MACRO_RX6, 0, &rx_mux[WSA_MACRO_RX6]),
+	SND_SOC_DAPM_MUX("WSA RX7 MUX", SND_SOC_NOPM, WSA_MACRO_RX7, 0, &rx_mux[WSA_MACRO_RX7]),
+	SND_SOC_DAPM_MUX("WSA RX8 MUX", SND_SOC_NOPM, WSA_MACRO_RX8, 0, &rx_mux[WSA_MACRO_RX8]),
 };
 
 static const struct snd_soc_dapm_route wsa_audio_map[] = {
@@ -2528,6 +2553,64 @@ static const struct snd_soc_dapm_route wsa_audio_map[] = {
 	{"WSA_SPK2 OUT", NULL, "WSA_MCLK"},
 };
 
+static const struct snd_soc_dapm_route wsa_audio_map_v2_5[] = {
+	{"WSA RX4 MUX", "AIF1_PB", "WSA AIF1 PB"},
+	{"WSA RX5 MUX", "AIF1_PB", "WSA AIF1 PB"},
+	{"WSA RX6 MUX", "AIF1_PB", "WSA AIF1 PB"},
+	{"WSA RX7 MUX", "AIF1_PB", "WSA AIF1 PB"},
+	{"WSA RX8 MUX", "AIF1_PB", "WSA AIF1 PB"},
+	{"WSA RX4 MUX", "AIF_MIX1_PB", "WSA AIF_MIX1 PB"},
+	{"WSA RX5 MUX", "AIF_MIX1_PB", "WSA AIF_MIX1 PB"},
+	{"WSA RX6 MUX", "AIF_MIX1_PB", "WSA AIF_MIX1 PB"},
+	{"WSA RX7 MUX", "AIF_MIX1_PB", "WSA AIF_MIX1 PB"},
+	{"WSA RX8 MUX", "AIF_MIX1_PB", "WSA AIF_MIX1 PB"},
+	{"WSA RX4", NULL, "WSA RX4 MUX"},
+	{"WSA RX5", NULL, "WSA RX5 MUX"},
+	{"WSA RX6", NULL, "WSA RX6 MUX"},
+	{"WSA RX7", NULL, "WSA RX7 MUX"},
+	{"WSA RX8", NULL, "WSA RX8 MUX"},
+	{"WSA_RX0 INP0", "RX4", "WSA RX4"},
+	{"WSA_RX0 INP0", "RX5", "WSA RX5"},
+	{"WSA_RX0 INP0", "RX6", "WSA RX6"},
+	{"WSA_RX0 INP0", "RX7", "WSA RX7"},
+	{"WSA_RX0 INP0", "RX8", "WSA RX8"},
+	{"WSA_RX0 INP1", "RX4", "WSA RX4"},
+	{"WSA_RX0 INP1", "RX5", "WSA RX5"},
+	{"WSA_RX0 INP1", "RX6", "WSA RX6"},
+	{"WSA_RX0 INP1", "RX7", "WSA RX7"},
+	{"WSA_RX0 INP1", "RX8", "WSA RX8"},
+	{"WSA_RX0 INP2", "RX4", "WSA RX4"},
+	{"WSA_RX0 INP2", "RX5", "WSA RX5"},
+	{"WSA_RX0 INP2", "RX6", "WSA RX6"},
+	{"WSA_RX0 INP2", "RX7", "WSA RX7"},
+	{"WSA_RX0 INP2", "RX8", "WSA RX8"},
+	{"WSA_RX0 MIX INP", "RX4", "WSA RX4"},
+	{"WSA_RX0 MIX INP", "RX5", "WSA RX5"},
+	{"WSA_RX0 MIX INP", "RX6", "WSA RX6"},
+	{"WSA_RX0 MIX INP", "RX7", "WSA RX7"},
+	{"WSA_RX0 MIX INP", "RX8", "WSA RX8"},
+	{"WSA_RX1 INP0", "RX4", "WSA RX4"},
+	{"WSA_RX1 INP0", "RX5", "WSA RX5"},
+	{"WSA_RX1 INP0", "RX6", "WSA RX6"},
+	{"WSA_RX1 INP0", "RX7", "WSA RX7"},
+	{"WSA_RX1 INP0", "RX8", "WSA RX8"},
+	{"WSA_RX1 INP1", "RX4", "WSA RX4"},
+	{"WSA_RX1 INP1", "RX5", "WSA RX5"},
+	{"WSA_RX1 INP1", "RX6", "WSA RX6"},
+	{"WSA_RX1 INP1", "RX7", "WSA RX7"},
+	{"WSA_RX1 INP1", "RX8", "WSA RX8"},
+	{"WSA_RX1 INP2", "RX4", "WSA RX4"},
+	{"WSA_RX1 INP2", "RX5", "WSA RX5"},
+	{"WSA_RX1 INP2", "RX6", "WSA RX6"},
+	{"WSA_RX1 INP2", "RX7", "WSA RX7"},
+	{"WSA_RX1 INP2", "RX8", "WSA RX8"},
+	{"WSA_RX1 MIX INP", "RX4", "WSA RX4"},
+	{"WSA_RX1 MIX INP", "RX5", "WSA RX5"},
+	{"WSA_RX1 MIX INP", "RX6", "WSA RX6"},
+	{"WSA_RX1 MIX INP", "RX7", "WSA RX7"},
+	{"WSA_RX1 MIX INP", "RX8", "WSA RX8"},
+};
+
 static int wsa_swrm_clock(struct wsa_macro *wsa, bool enable)
 {
 	struct regmap *regmap = wsa->regmap;
@@ -2561,7 +2644,9 @@ static int wsa_macro_component_probe(struct snd_soc_component *comp)
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(comp);
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(comp);
 	const struct snd_soc_dapm_widget *widgets;
-	unsigned int num_widgets;
+	const struct snd_soc_dapm_route *routes;
+	unsigned int num_widgets, num_routes;
+	int ret;
 
 	snd_soc_component_init_regmap(comp, wsa->regmap);
 
@@ -2586,6 +2671,7 @@ static int wsa_macro_component_probe(struct snd_soc_component *comp)
 	case LPASS_CODEC_VERSION_2_1:
 		widgets = wsa_macro_dapm_widgets_v2_1;
 		num_widgets = ARRAY_SIZE(wsa_macro_dapm_widgets_v2_1);
+		num_routes = 0;
 		break;
 	case LPASS_CODEC_VERSION_2_5:
 	case LPASS_CODEC_VERSION_2_6:
@@ -2594,12 +2680,18 @@ static int wsa_macro_component_probe(struct snd_soc_component *comp)
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


