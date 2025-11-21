Return-Path: <linux-arm-msm+bounces-82772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F97C7780D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 07:06:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 513674E3E1C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 06:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 635B42D97BE;
	Fri, 21 Nov 2025 06:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="HASdJYUk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A8E271A94
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 06:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763705173; cv=none; b=dJUUw+vPsKWGcws8wtyt1eJFzSyVHCNnPO1L4fyKvRcIacwzXgc68KniYG7o6fsmCE0e092h5XSJC+oj8gm9Hfr+hvl50Ts9F3YgBHvfmV5U1w1DYJ7XVzrTehZOvDRtZ2WP6xQ9kb2r8UoWyvabdETzikU8H8UEBN9wvCBRDlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763705173; c=relaxed/simple;
	bh=GcROR96JF5hCwBimwpg3lqL3nafgW194peOGSoR1pUA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eOug0YXycSzce038ef7J0tUrTAU8Zzy22PVNtyWpFVh+WxZNXGr3MI1pCZorTsNrvXg8DnsCCu5w4DW25yjFpd01L551aLcwcIV7i9kxLw5dXYhEGsFyHk5XnoVmkxS0aFQACna96pQdLmkA6urzAEwG9mc8j070JKFpmuei4RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=HASdJYUk; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4ee2014c228so13327231cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 22:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1763705170; x=1764309970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=La5vJNM1jWM5YiAHSf9v+V5WGA4ndFbbe8gW9RIdiFU=;
        b=HASdJYUkgCBJXUhfrnr5RVJ+DI+K7lQxO4c6FhtW0J+dJUD7pr4vvtslEvKOu8+VLU
         XHX9LLS7XAthXRnYTw+unVASUbHamogMwiQG5axrizfj+u/DOZBtSU+qloUCVzuXGtbD
         xOUcV2YEAls0Jh0GX+ArnUCUN0hf9/5xeip2s3J+YIDrdtt4eRPuKaD6O6IINLMFelEt
         Q43vQHMpbxeDnbcxvvVD/hO3nHFYC7NbmQpxnnaR5fBQcJTLnaiXGgC105dsiAhi+Lpv
         JUq/K4p5Yrz2XMQfQF12yXvinXM/Cc62xZICiQV0/BRdRTK82GikzZkbuQC6qejJ4UkF
         RspQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763705170; x=1764309970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=La5vJNM1jWM5YiAHSf9v+V5WGA4ndFbbe8gW9RIdiFU=;
        b=PoXhtSwVZzETPHWZZOIg39Kug8rQpY1zCWjJ3DYryQZnkznse5yZpbdkB5JgrD7sQ7
         cP01Mv2fQx8KWmFFepCJHs0jaoD/C710TUEJLkAvb456hYAWKKX+tlfo5uxKYVP7GNbs
         kLI4XpPIPo5BxvMTZlHlxb4tY6Y0ksgwyENQ9IKJI693zocdluL5K//hoFA25oRNW2rE
         ztDxU6xdCK+YutDFAQszPdseVzBmoziqOIjqr77RMydjy7f4KmCSctpL2cEp/Hh3hQ+k
         kEHjr2HjR6Dt+tXltR+prbm23li79xDBUFLsdCbPtt7L6jDj9173lIVG/4xp2GfSapTb
         8vJg==
X-Gm-Message-State: AOJu0YwiJ35Fg0mtjKo5Ooy7QIcVQnEUf9Xgj4pENrJazldNShFVXWaZ
	KwURCn0akOnakYVEgFkU2v6MMusehsgMa1r0vmfJvRu4C2mHyUYm/o2pde0tzSx4DNzWcQ7+2W/
	hh4WH
X-Gm-Gg: ASbGnctfu+pa5b9F6Xl7Ju09+2iDtzhBaSUUMt+0DmJUxnu1l/MuvuoQ3ZAKHhjCZMb
	/nBotokBe0cLbgaCAAqKe7IorZUzlOk4v63kn524sQcEp3cIpf2BceDpBsDDrRUTx86hgAkWukO
	rolHSPXk4SmfA0eKHopY+4CkEHbkFTt7090NsmOfg3VcpIDi6e48DPseASZ2Edr4Lfm02K7zRIJ
	60UO2UM2f0pVN+yi3o093fY8Uz3WXwmvbxcpzItW7XI7FjtD+AXfs2exuOx6h5jGNqcYdV01V44
	bNSWDeAmjHWUG8IOI2MLEyQ+8BPTUUKGwZSTykG+10Ftn3qTJBVWzcwuzK65gvO5g9fbRZz2xE9
	rNzCV8m1VkHJmWMoH9HiRtU8jfPC0RjQwRTtv4bf1ZWurqhq6qn1E5YtnWXwqvWOtfRdN2f/3sU
	S/ZzdlE+e5qPUhjkqal7+ZX9Lw70BjkkLjNX8yQTRkjUoGzCCRAo+psXmlW1cGoaT87Tk5pNg8T
	jzo
X-Google-Smtp-Source: AGHT+IFQdwMnwbIyaAZ09s2AcuDIc3ln2beikKLvPXoaLdoe4d+jYtLW2a8X7J1WM977sGr1YJ8SNA==
X-Received: by 2002:ac8:5846:0:b0:4ed:213c:1582 with SMTP id d75a77b69052e-4ee588194e0mr19087991cf.7.1763705169906;
        Thu, 20 Nov 2025 22:06:09 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ee48d6aab4sm30245831cf.15.2025.11.20.22.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 22:06:08 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org (open list:QCOM AUDIO (ASoC) DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] ASoC: codecs: lpass-wsa-macro: add RX4/RX5/RX6/RX7/RX8
Date: Fri, 21 Nov 2025 01:03:30 -0500
Message-ID: <20251121060437.26704-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.51.0
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
v2: added RX6/RX7/RX8
this depends on the other patches from the original series

 sound/soc/codecs/lpass-wsa-macro.c | 96 +++++++++++++++++++++++++++++-
 1 file changed, 94 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index e2e78ff6dd54e..5d440a839e733 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -300,6 +300,11 @@ enum {
 	WSA_MACRO_RX_MIX,
 	WSA_MACRO_RX_MIX0 = WSA_MACRO_RX_MIX,
 	WSA_MACRO_RX_MIX1,
+	WSA_MACRO_RX4,
+	WSA_MACRO_RX5,
+	WSA_MACRO_RX6,
+	WSA_MACRO_RX7,
+	WSA_MACRO_RX8,
 	WSA_MACRO_RX_MAX,
 };
 
@@ -2228,6 +2233,16 @@ static const struct snd_kcontrol_new rx_mux[WSA_MACRO_RX_MAX] = {
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
@@ -2410,6 +2425,16 @@ static const struct snd_soc_dapm_widget wsa_macro_dapm_widgets_v2_5[] = {
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
@@ -2529,6 +2554,64 @@ static const struct snd_soc_dapm_route wsa_audio_map[] = {
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
@@ -2562,7 +2645,9 @@ static int wsa_macro_component_probe(struct snd_soc_component *comp)
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(comp);
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(comp);
 	const struct snd_soc_dapm_widget *widgets;
-	unsigned int num_widgets;
+	const struct snd_soc_dapm_route *routes;
+	unsigned int num_widgets, num_routes;
+	int ret;
 
 	snd_soc_component_init_regmap(comp, wsa->regmap);
 
@@ -2587,6 +2672,7 @@ static int wsa_macro_component_probe(struct snd_soc_component *comp)
 	case LPASS_CODEC_VERSION_2_1:
 		widgets = wsa_macro_dapm_widgets_v2_1;
 		num_widgets = ARRAY_SIZE(wsa_macro_dapm_widgets_v2_1);
+		num_routes = 0;
 		break;
 	case LPASS_CODEC_VERSION_2_5:
 	case LPASS_CODEC_VERSION_2_6:
@@ -2595,12 +2681,18 @@ static int wsa_macro_component_probe(struct snd_soc_component *comp)
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


