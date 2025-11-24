Return-Path: <linux-arm-msm+bounces-83012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CA52CC7F1E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 07:51:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 33524345D8B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 06:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0A042E285C;
	Mon, 24 Nov 2025 06:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="OnD4W1Oa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22872E1C6B
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 06:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763967043; cv=none; b=kuWj03lDNMQr2BECMIsCjmW52ADzClQ8rphsapP74T4qflY0XzGEGb6c1A4Ht/OKu3EFg4l9hfWVyjM0SUIkUEZ83+kHBGdR8N7tFMvR5nTmrbY86ghBscFQn1q6AufCZJMUkLwdQQIh7zMsclballeOtjbY0Www+y5QkjcsT4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763967043; c=relaxed/simple;
	bh=5/7645nxDX/Ve3gQvZ4qFnsgT3qAFRZ+rGIFBNbXT/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BmflvTNyo7zd6Q1B3STKi0CMGzI26K/oN+9iIXc0uzNIm1AOK3p6KEET5XNJfAqZDU52cqExg9hdHmMyK3BEQaPNwMfL9Y+nj+H+uf9SRcjjlJe8tma9a0FErZASogRnqiHXjYlNR5exQpwI/mrwloNnA7NElZcHOwmnB38Wp6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=OnD4W1Oa; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8b2ea5a44a9so405239585a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Nov 2025 22:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1763967040; x=1764571840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9x25JhqrWPc6PenBsCSlUchighQZUVytI0VSm4UmqVs=;
        b=OnD4W1OadJ1KAw/yvjezz9/XU47rrjYfYMqPYD+RebVVSXUAdXs8oohyFzGXBib/ad
         x6v/EuqsBwulY3/fkfmHiNeMcbTt2cKPny7cPMnH5rMNYHu/Hczu3UVByV4C9aCJneCg
         UBhPgUArKyBhdkA4UM6G0TLDrb6D4/GOR3o5J/D9I1nFyCtA6D+CIV0IVnN20BPNS2rf
         k+pHPLmrafGxjOM3FVPuhM0qNFrvzyJef5z7a8hvMQIesojrAzo4ZRrCNO9WL/bqfyK+
         oIPnryKl6uQ9lJYjGbinGHV1ho6COS8stlV++/ek0XJh0HJkia8p3Ey2mC0nnKb6+VY2
         976A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763967040; x=1764571840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9x25JhqrWPc6PenBsCSlUchighQZUVytI0VSm4UmqVs=;
        b=KXr5EylcTmEGFZHRlUzQyzn6h8Dq1fYfHQSYL9noPwSmmuWzKHdY7pzQj5JrNlmU3k
         kvTHy+n9R/T5FZOtVUElYxI7CvXPvFF/1mDs98Np8nPr/tCv5fQqzIQQ3eRe9GApg26E
         k47S2tHoQn9pANzALfliygxplHMKvY4WOT4uqOdQ1K0seePU2oysp0n8SGcS6/OYWz+N
         G7AgSFM+wfnopuYcQ1rEl5xtswzvuco/rcWZM/ggqgxQbEs+NIx0/Y8ICe+WUSCG+LHV
         +Gill2rCVWwe/N7h97Uys8C2vazBPH/IT4BZWcgxvoJUieA0h13+9MAtsTpAklQESKGp
         +EwQ==
X-Gm-Message-State: AOJu0YzI5gLh3+iyoZrk3rs4m/fNcrmCpV6SvEtAZpn+1uS4xvxWk6hm
	J2B7BBIi2/Wh6cuA6wCM3DPdXwH1ZKMWN0c1mHP/VVYgfjgYoeeyO2VQ+ZQvb1Y1j9m9s1PDXnE
	KS16o
X-Gm-Gg: ASbGncta6d39BPWpjmLxC5O77l+PUcvf78J9u1R7FZDDXEbpzIayRlbLBPuAtNwRAxM
	k0Zg84n/0LBfAA3FcPsvAhjOn1jzNYpXYvALEbRFmFDzrLFKmsBpAAHbcKOyx196SKY8irrWGCB
	LtNUw7a/s1GcSuHj70/ErQiAUIzCUo53nsmnlhccDXgioDmV86D8CdhvmbbZw064lPg9snf+uHV
	/ehYOxF7N4iUWAfqNzJcqA9VWRqZh9Rx+LrjhoVMIQhyZwHEXFA7i3SsEuPeZ55W2oTTUTHbCA8
	zyfiDYPGviI4giya3plO4CgSEQJ8p9twNz748hBkG+WFFF0xIcv76j/EEKu6+IvOWJMc2nW5KYU
	Ihov/OJSHeDLP8RF8gCQapDT3P0zsfNANqKEzc27V/+gnNG446oMCDw+iyc7UsiN3aF8iYlTjRd
	k4oPcOwEVA5YudxoM8Mz7AHVYy3p2/rkqg9L3DG0x+4eZer8D1BNUySxWo4EYzqa7Y7w==
X-Google-Smtp-Source: AGHT+IEpkuVHBzWewZQk3g1CEp6i2qPris1Z82ut2quCTt3sgemBBQi7s2esHFyyypx9wmv/rA7dBg==
X-Received: by 2002:a05:620a:450f:b0:8b2:213a:e2e4 with SMTP id af79cd13be357-8b33d4c834emr1329101385a.84.1763967040238;
        Sun, 23 Nov 2025 22:50:40 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b3295db8b1sm889075185a.40.2025.11.23.22.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 22:50:39 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org (open list:QCOM AUDIO (ASoC) DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 4/6] ASoC: codecs: wcd938x: fix headphone pop/click sound
Date: Mon, 24 Nov 2025 01:45:57 -0500
Message-ID: <20251124064850.15419-5-jonathan@marek.ca>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251124064850.15419-1-jonathan@marek.ca>
References: <20251124064850.15419-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PA enable must happen while the soundwire stream is enabled (between
sdw_enable_stream and sdw_disable_stream) to avoid issues. This is
between the link prepare and hw_free for qcom drivers.

Move the PA enable/disable to a mute_stream callback, which satisfies this
condition.

Note the dapm events already cleared HPHL_ENABLE/etc. bits, so only writes
to set them need to be added.

I used the DAC events to determine if PA should be enabled, which is not
exactly the same as before, but practically it shouldn't make a difference.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 sound/soc/codecs/wcd938x.c | 76 ++++++++++++++++++--------------------
 1 file changed, 36 insertions(+), 40 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index e1a4783b984c1..cf15190dd61a4 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -178,6 +178,8 @@ struct wcd938x_priv {
 	bool comp2_enable;
 	bool ldoh;
 	bool mux_setup_done;
+	bool hphl_enable;
+	bool hphr_enable;
 };
 
 static const char * const wcd938x_supplies[] = {
@@ -468,6 +470,7 @@ static int wcd938x_codec_hphl_dac_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
+		wcd938x->hphl_enable = true;
 		snd_soc_component_write_field(component,
 				WCD938X_DIGITAL_CDC_DIG_CLK_CTL,
 				WCD938X_RXD0_CLK_EN_MASK, 0x01);
@@ -507,6 +510,7 @@ static int wcd938x_codec_hphl_dac_event(struct snd_soc_dapm_widget *w,
 		snd_soc_component_write_field(component,
 			WCD938X_HPH_NEW_INT_RDAC_HD2_CTL_R,
 			WCD938X_HPH_RES_DIV_MASK, 0x1);
+		wcd938x->hphl_enable = false;
 		break;
 	}
 
@@ -522,6 +526,7 @@ static int wcd938x_codec_hphr_dac_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
+		wcd938x->hphr_enable = true;
 		snd_soc_component_write_field(component,
 				WCD938X_DIGITAL_CDC_DIG_CLK_CTL,
 				WCD938X_RXD1_CLK_EN_MASK, 1);
@@ -558,6 +563,7 @@ static int wcd938x_codec_hphr_dac_event(struct snd_soc_dapm_widget *w,
 		}
 		break;
 	case SND_SOC_DAPM_POST_PMD:
+		wcd938x->hphr_enable = false;
 		snd_soc_component_write_field(component,
 			WCD938X_HPH_NEW_INT_RDAC_HD2_CTL_R,
 			WCD938X_HPH_RES_DIV_MASK, 0x01);
@@ -683,15 +689,12 @@ static int wcd938x_codec_aux_dac_event(struct snd_soc_dapm_widget *w,
 
 }
 
-static int wcd938x_codec_enable_hphr_pa(struct snd_soc_dapm_widget *w,
-					struct snd_kcontrol *kcontrol, int event)
+static void wcd938x_codec_enable_hphr_pa(struct snd_soc_component *component, int enable)
 {
-	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
 	int hph_mode = wcd938x->hph_mode;
 
-	switch (event) {
-	case SND_SOC_DAPM_PRE_PMU:
+	if (enable) {
 		if (wcd938x->ldoh)
 			snd_soc_component_write_field(component, WCD938X_LDOH_MODE,
 						      WCD938X_LDOH_EN_MASK, 1);
@@ -714,8 +717,7 @@ static int wcd938x_codec_enable_hphr_pa(struct snd_soc_dapm_widget *w,
 		snd_soc_component_write_field(component,
 					      WCD938X_DIGITAL_PDM_WD_CTL1,
 					      WCD938X_PDM_WD_EN_MASK, 0x3);
-		break;
-	case SND_SOC_DAPM_POST_PMU:
+
 		/*
 		 * 7ms sleep is required if compander is enabled as per
 		 * HW requirement. If compander is disabled, then
@@ -741,9 +743,10 @@ static int wcd938x_codec_enable_hphr_pa(struct snd_soc_dapm_widget *w,
 			snd_soc_component_write_field(component, WCD938X_ANA_RX_SUPPLIES,
 					WCD938X_REGULATOR_MODE_MASK,
 					WCD938X_REGULATOR_MODE_CLASS_AB);
+		snd_soc_component_write_field(component, WCD938X_ANA_HPH,
+					      WCD938X_HPHR_EN_MASK, 1);
 		enable_irq(wcd938x->hphr_pdm_wd_int);
-		break;
-	case SND_SOC_DAPM_PRE_PMD:
+	} else {
 		disable_irq_nosync(wcd938x->hphr_pdm_wd_int);
 		/*
 		 * 7ms sleep is required if compander is enabled as per
@@ -759,8 +762,7 @@ static int wcd938x_codec_enable_hphr_pa(struct snd_soc_dapm_widget *w,
 		wcd_mbhc_event_notify(wcd938x->wcd_mbhc,
 					     WCD_EVENT_PRE_HPHR_PA_OFF);
 		set_bit(HPH_PA_DELAY, &wcd938x->status_mask);
-		break;
-	case SND_SOC_DAPM_POST_PMD:
+
 		/*
 		 * 7ms sleep is required if compander is enabled as per
 		 * HW requirement. If compander is disabled, then
@@ -784,21 +786,15 @@ static int wcd938x_codec_enable_hphr_pa(struct snd_soc_dapm_widget *w,
 		if (wcd938x->ldoh)
 			snd_soc_component_write_field(component, WCD938X_LDOH_MODE,
 						      WCD938X_LDOH_EN_MASK, 0);
-		break;
 	}
-
-	return 0;
 }
 
-static int wcd938x_codec_enable_hphl_pa(struct snd_soc_dapm_widget *w,
-					struct snd_kcontrol *kcontrol, int event)
+static void wcd938x_codec_enable_hphl_pa(struct snd_soc_component *component, int enable)
 {
-	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
 	int hph_mode = wcd938x->hph_mode;
 
-	switch (event) {
-	case SND_SOC_DAPM_PRE_PMU:
+	if (enable) {
 		if (wcd938x->ldoh)
 			snd_soc_component_write_field(component, WCD938X_LDOH_MODE,
 						      WCD938X_LDOH_EN_MASK, 1);
@@ -820,8 +816,7 @@ static int wcd938x_codec_enable_hphl_pa(struct snd_soc_dapm_widget *w,
 		snd_soc_component_write_field(component,
 					WCD938X_DIGITAL_PDM_WD_CTL0,
 					WCD938X_PDM_WD_EN_MASK, 0x3);
-		break;
-	case SND_SOC_DAPM_POST_PMU:
+
 		/*
 		 * 7ms sleep is required if compander is enabled as per
 		 * HW requirement. If compander is disabled, then
@@ -847,9 +842,10 @@ static int wcd938x_codec_enable_hphl_pa(struct snd_soc_dapm_widget *w,
 			snd_soc_component_write_field(component, WCD938X_ANA_RX_SUPPLIES,
 					WCD938X_REGULATOR_MODE_MASK,
 					WCD938X_REGULATOR_MODE_CLASS_AB);
+		snd_soc_component_write_field(component, WCD938X_ANA_HPH,
+					      WCD938X_HPHL_EN_MASK, 1);
 		enable_irq(wcd938x->hphl_pdm_wd_int);
-		break;
-	case SND_SOC_DAPM_PRE_PMD:
+	} else {
 		disable_irq_nosync(wcd938x->hphl_pdm_wd_int);
 		/*
 		 * 7ms sleep is required if compander is enabled as per
@@ -864,8 +860,7 @@ static int wcd938x_codec_enable_hphl_pa(struct snd_soc_dapm_widget *w,
 					      WCD938X_HPHL_EN_MASK, 0);
 		wcd_mbhc_event_notify(wcd938x->wcd_mbhc, WCD_EVENT_PRE_HPHL_PA_OFF);
 		set_bit(HPH_PA_DELAY, &wcd938x->status_mask);
-		break;
-	case SND_SOC_DAPM_POST_PMD:
+
 		/*
 		 * 7ms sleep is required if compander is enabled as per
 		 * HW requirement. If compander is disabled, then
@@ -889,10 +884,7 @@ static int wcd938x_codec_enable_hphl_pa(struct snd_soc_dapm_widget *w,
 		if (wcd938x->ldoh)
 			snd_soc_component_write_field(component, WCD938X_LDOH_MODE,
 						      WCD938X_LDOH_EN_MASK, 0);
-		break;
 	}
-
-	return 0;
 }
 
 static int wcd938x_codec_enable_aux_pa(struct snd_soc_dapm_widget *w,
@@ -2815,14 +2807,6 @@ static const struct snd_soc_dapm_widget wcd938x_dapm_widgets[] = {
 			   wcd938x_codec_enable_aux_pa,
 			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
 			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
-	SND_SOC_DAPM_PGA_E("HPHL PGA", WCD938X_ANA_HPH, 7, 0, NULL, 0,
-			   wcd938x_codec_enable_hphl_pa,
-			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
-			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
-	SND_SOC_DAPM_PGA_E("HPHR PGA", WCD938X_ANA_HPH, 6, 0, NULL, 0,
-			   wcd938x_codec_enable_hphr_pa,
-			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
-			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
 
 	SND_SOC_DAPM_DAC_E("RDAC1", NULL, SND_SOC_NOPM, 0, 0,
 			   wcd938x_codec_hphl_dac_event,
@@ -2935,8 +2919,7 @@ static const struct snd_soc_dapm_route wcd938x_audio_map[] = {
 	{"RX1", NULL, "RXCLK"},
 	{"RDAC1", NULL, "RX1"},
 	{"HPHL_RDAC", "Switch", "RDAC1"},
-	{"HPHL PGA", NULL, "HPHL_RDAC"},
-	{"HPHL", NULL, "HPHL PGA"},
+	{"HPHL", NULL, "HPHL_RDAC"},
 
 	{"IN2_HPHR", NULL, "VDD_BUCK"},
 	{"IN2_HPHR", NULL, "CLS_H_PORT"},
@@ -2944,8 +2927,7 @@ static const struct snd_soc_dapm_route wcd938x_audio_map[] = {
 	{"RDAC2", NULL, "RX2"},
 	{"RX2", NULL, "RXCLK"},
 	{"HPHR_RDAC", "Switch", "RDAC2"},
-	{"HPHR PGA", NULL, "HPHR_RDAC"},
-	{"HPHR", NULL, "HPHR PGA"},
+	{"HPHR", NULL, "HPHR_RDAC"},
 
 	{"IN3_AUX", NULL, "VDD_BUCK"},
 	{"IN3_AUX", NULL, "CLS_H_PORT"},
@@ -3290,6 +3272,19 @@ static int wcd938x_codec_free(struct snd_pcm_substream *substream,
 	return wcd938x_sdw_free(wcd, substream, dai);
 }
 
+static int wcd938x_codec_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
+{
+	struct wcd938x_priv *wcd938x = dev_get_drvdata(dai->dev);
+	struct snd_soc_component *component = dai->component;
+
+	if (wcd938x->hphl_enable)
+		wcd938x_codec_enable_hphl_pa(component, !mute);
+	if (wcd938x->hphr_enable)
+		wcd938x_codec_enable_hphr_pa(component, !mute);
+
+	return 0;
+}
+
 static int wcd938x_codec_set_sdw_stream(struct snd_soc_dai *dai,
 				  void *stream, int direction)
 {
@@ -3303,6 +3298,7 @@ static int wcd938x_codec_set_sdw_stream(struct snd_soc_dai *dai,
 static const struct snd_soc_dai_ops wcd938x_sdw_dai_ops = {
 	.hw_params = wcd938x_codec_hw_params,
 	.hw_free = wcd938x_codec_free,
+	.mute_stream = wcd938x_codec_mute_stream,
 	.set_stream = wcd938x_codec_set_sdw_stream,
 };
 
-- 
2.51.0


