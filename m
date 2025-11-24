Return-Path: <linux-arm-msm+bounces-83011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CED11C7F1EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 07:51:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8F7694E3F2F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 06:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABC4C2E0405;
	Mon, 24 Nov 2025 06:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="DXeIr3C4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B543A2DFF19
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 06:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763967041; cv=none; b=EvYunC8Jhke2MMX5NVSGT9Rx/OvM0r4fQhDwx185k2oo3MvVZg7d2qd3xdKqV5ikAj0Txt0wdB0BDMhitnAD8qWD/mkvO/aS5j3WEmpREnqTbYZTrVjlPk8VUb1nLYDI580lFRDvLStvzS7yK4aWGxt1iFZ676iwQgDlm5+bzxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763967041; c=relaxed/simple;
	bh=ODKZZ6llYfgYgWR/6DbA7mxg/k8lgmUIfV1DzxX9fS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s3DoiDgnt7erhBHC8dObVp/2Pa1WYxExdJJ9ALxTXqPR4fUm5yXZx6s2viVEsqObFfInkiaWHJYtW6JLfhl8u5GrxISxJnY233L3yYLPKzbugrM1IrdotjrDMR9T+IvVTseV9Z5Q5p1ewiP1RmmmtJMGp8xCQpuAExCVeTTMGsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=DXeIr3C4; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8b28f983333so399752085a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Nov 2025 22:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1763967038; x=1764571838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vyGmcBay0+DkW1QEBakkTS1fQ2rSDF+O9yJM76nIi/s=;
        b=DXeIr3C4hVT3OH7+yuu6U5c9isGid6hXkwBply/Kf2nmbxDAnFtxaw/uT6Lo6wFSgB
         iCafZOw6fUR9U8Yc4HXk//qNZQMrqlQ6Uzdh8ZR73HBvfh3bOybfoBg2js2k7ty4NIxR
         T7142pqDRCjVmRqI4byZyKekR4yeBJ/MuxSh5tM/mDG4RBt26jwTizYGys0BdydRg3Jc
         o2pL5PpeKQMGhtnXoSelZtqq7oe4P1IhREetWqgWErOwAzxVoDshuV3HQxFSstuzXub9
         U/CW2Arz3KIRCfs8xEH52b9kE5l00Gu9xcYutgmnB1ZBWp9BzZNFDvfb4l5VEC0oPh5O
         kblQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763967038; x=1764571838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vyGmcBay0+DkW1QEBakkTS1fQ2rSDF+O9yJM76nIi/s=;
        b=OJ8nt9qTeRFXRXcer01EUOICce8d6N88wWlsl7DLliqrNc/TmSXy5uISuvJ5GrNr/G
         bBsUee/psbgoU68gPcIP45Aqhh6luuIsLiFNJDYcQPxZuCk2UCHbAC8J0TW+r4O9n7eu
         ldBvCb1J6J76INETQwvTDdAWoKjDniWpoEC1UdvQ7nMrxRnKkpPJ2V6ueGd9f5jJGOxF
         idnewdY1JQ2hsfc4rSAFouK1DCgEdR+k1aAd0JtZiACDfb7aSpNEByDq/CLg3BSkmSQH
         vkkYcA3fA3IVGPNmSzBML29kAjxBId1gVEWlt23Jmixvcng/zkxLX6b8e2IiE+MycrsB
         +k5A==
X-Gm-Message-State: AOJu0YyqtUOwWC8VAkkYDsJGqy7Bta1FYYl9zx/Uj/TXRhVUksgZWr+2
	faI2T/m+UOY/diyQFkfTG/nJ2w9fuE1ozxdpAn6ZSdwNBHvbffC+ML+7/EWPRrFtBYVgLaamE2k
	PbvM5
X-Gm-Gg: ASbGncuQ2MWHRvX882zZnpyNI1RQds9h7izTTYBl/ivA2iCk/6+l9op1xdSGpMCukAg
	cQQAd/0fmY+SbIh5TiBuoDu6mjefzctBbGG+a0qVdW7aQ1lq+qQ41v8RHqz9qQxcpGWyklatHqA
	3iWIkTcpEQ8jH877t984upYy8UlGCkb2yCydRr98RdsVv5rzZK19AGMKkZC198dAe6nKCHyVKxe
	bEBWMzIrvEkptnvvkC9g/VgI70oLPVxar8LMzTlqomxHCGhvWl4forncugCGoViGCst5vp/6PC+
	icM+kHQTW+xD6hT+eCzJimUhN8nUjhzXDD0I7AhM04Mxy2riShfNB4vEFnLgBfI4tjGAPrnjEn9
	wRXqhQsABYC+bbLCOs9UylwvqKoyn1eYHAXmI7plDlBwHMEjzmqJ1Lhm3QmagPUm2BDVnKRtA8U
	ut+IDSzMJpuUydeoKNiq/H2v/AYWuFvfte2s31V+XqmtTEiisiuYTH67NajmoInWridQ==
X-Google-Smtp-Source: AGHT+IEGinri7FfzNXmmlyC2Q7pb+oH0NVL9SOp/e15LApRFrCRvqXP61oERVCDhDxN1m/8j+Rq6/g==
X-Received: by 2002:a05:620a:c44:b0:849:d117:e86a with SMTP id af79cd13be357-8b33d4734d4mr1291646985a.59.1763967038248;
        Sun, 23 Nov 2025 22:50:38 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b3295db8b1sm889075185a.40.2025.11.23.22.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 22:50:37 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org (open list:QCOM AUDIO (ASoC) DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/6] ASoC: codecs: wcd939x: fix headphone pop/click sound
Date: Mon, 24 Nov 2025 01:45:56 -0500
Message-ID: <20251124064850.15419-4-jonathan@marek.ca>
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
 sound/soc/codecs/wcd939x.c | 84 ++++++++++++++++++--------------------
 1 file changed, 39 insertions(+), 45 deletions(-)

diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index e74e6f0131318..48f82a92722dd 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -209,6 +209,8 @@ struct wcd939x_priv {
 	bool comp1_enable;
 	bool comp2_enable;
 	bool ldoh;
+	bool hphl_enable;
+	bool hphr_enable;
 };
 
 static const char * const wcd939x_supplies[] = {
@@ -508,6 +510,7 @@ static int wcd939x_codec_hphl_dac_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
+		wcd939x->hphl_enable = true;
 		snd_soc_component_write_field(component, WCD939X_HPH_RDAC_CLK_CTL1,
 					      WCD939X_RDAC_CLK_CTL1_OPAMP_CHOP_CLK_EN,
 					      false);
@@ -547,6 +550,7 @@ static int wcd939x_codec_hphl_dac_event(struct snd_soc_dapm_widget *w,
 					      WCD939X_RDAC_HD2_CTL_L_HD2_RES_DIV_CTL_L, 1);
 		snd_soc_component_write_field(component, WCD939X_DIGITAL_CDC_HPH_GAIN_CTL,
 					      WCD939X_CDC_HPH_GAIN_CTL_HPHL_RX_EN, false);
+		wcd939x->hphl_enable = false;
 		break;
 	}
 
@@ -565,6 +569,7 @@ static int wcd939x_codec_hphr_dac_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
+		wcd939x->hphr_enable = true;
 		snd_soc_component_write_field(component, WCD939X_HPH_RDAC_CLK_CTL1,
 					      WCD939X_RDAC_CLK_CTL1_OPAMP_CHOP_CLK_EN,
 					      false);
@@ -603,6 +608,7 @@ static int wcd939x_codec_hphr_dac_event(struct snd_soc_dapm_widget *w,
 					      WCD939X_RDAC_HD2_CTL_R_HD2_RES_DIV_CTL_R, 1);
 		snd_soc_component_write_field(component, WCD939X_DIGITAL_CDC_HPH_GAIN_CTL,
 					      WCD939X_CDC_HPH_GAIN_CTL_HPHR_RX_EN, false);
+		wcd939x->hphr_enable = false;
 		break;
 	}
 
@@ -641,16 +647,12 @@ static int wcd939x_codec_ear_dac_event(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
-static int wcd939x_codec_enable_hphr_pa(struct snd_soc_dapm_widget *w,
-					struct snd_kcontrol *kcontrol,
-					int event)
+static void wcd939x_codec_enable_hphr_pa(struct snd_soc_component *component, int enable)
 {
-	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
 	int hph_mode = wcd939x->hph_mode;
 
-	switch (event) {
-	case SND_SOC_DAPM_PRE_PMU:
+	if (enable) {
 		if (wcd939x->ldoh)
 			snd_soc_component_write_field(component, WCD939X_LDOH_MODE,
 						      WCD939X_MODE_LDOH_EN, true);
@@ -679,8 +681,7 @@ static int wcd939x_codec_enable_hphr_pa(struct snd_soc_dapm_widget *w,
 		set_bit(HPH_PA_DELAY, &wcd939x->status_mask);
 		snd_soc_component_write_field(component, WCD939X_DIGITAL_PDM_WD_CTL1,
 					      WCD939X_PDM_WD_CTL1_PDM_WD_EN, 3);
-		break;
-	case SND_SOC_DAPM_POST_PMU:
+
 		/*
 		 * 7ms sleep is required if compander is enabled as per
 		 * HW requirement. If compander is disabled, then
@@ -708,9 +709,11 @@ static int wcd939x_codec_enable_hphr_pa(struct snd_soc_dapm_widget *w,
 						      WCD939X_RX_SUPPLIES_REGULATOR_MODE,
 						      true);
 
+		snd_soc_component_write_field(component, WCD939X_ANA_HPH,
+					      WCD939X_HPH_HPHR_ENABLE, true);
+
 		enable_irq(wcd939x->hphr_pdm_wd_int);
-		break;
-	case SND_SOC_DAPM_PRE_PMD:
+	} else {
 		disable_irq_nosync(wcd939x->hphr_pdm_wd_int);
 		/*
 		 * 7ms sleep is required if compander is enabled as per
@@ -728,8 +731,7 @@ static int wcd939x_codec_enable_hphr_pa(struct snd_soc_dapm_widget *w,
 		wcd_mbhc_event_notify(wcd939x->wcd_mbhc,
 				      WCD_EVENT_PRE_HPHR_PA_OFF);
 		set_bit(HPH_PA_DELAY, &wcd939x->status_mask);
-		break;
-	case SND_SOC_DAPM_POST_PMD:
+
 		/*
 		 * 7ms sleep is required if compander is enabled as per
 		 * HW requirement. If compander is disabled, then
@@ -755,25 +757,15 @@ static int wcd939x_codec_enable_hphr_pa(struct snd_soc_dapm_widget *w,
 		if (wcd939x->ldoh)
 			snd_soc_component_write_field(component, WCD939X_LDOH_MODE,
 						      WCD939X_MODE_LDOH_EN, false);
-		break;
 	}
-
-	return 0;
 }
 
-static int wcd939x_codec_enable_hphl_pa(struct snd_soc_dapm_widget *w,
-					struct snd_kcontrol *kcontrol,
-					int event)
+static void wcd939x_codec_enable_hphl_pa(struct snd_soc_component *component, bool enable)
 {
-	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
 	int hph_mode = wcd939x->hph_mode;
 
-	dev_dbg(component->dev, "%s wname: %s event: %d\n", __func__,
-		w->name, event);
-
-	switch (event) {
-	case SND_SOC_DAPM_PRE_PMU:
+	if (enable) {
 		if (wcd939x->ldoh)
 			snd_soc_component_write_field(component, WCD939X_LDOH_MODE,
 						      WCD939X_MODE_LDOH_EN, true);
@@ -802,8 +794,7 @@ static int wcd939x_codec_enable_hphl_pa(struct snd_soc_dapm_widget *w,
 		set_bit(HPH_PA_DELAY, &wcd939x->status_mask);
 		snd_soc_component_write_field(component, WCD939X_DIGITAL_PDM_WD_CTL0,
 					      WCD939X_PDM_WD_CTL0_PDM_WD_EN, 3);
-		break;
-	case SND_SOC_DAPM_POST_PMU:
+
 		/*
 		 * 7ms sleep is required if compander is enabled as per
 		 * HW requirement. If compander is disabled, then
@@ -829,9 +820,12 @@ static int wcd939x_codec_enable_hphl_pa(struct snd_soc_dapm_widget *w,
 			snd_soc_component_write_field(component, WCD939X_ANA_RX_SUPPLIES,
 						      WCD939X_RX_SUPPLIES_REGULATOR_MODE,
 						      true);
+
+		snd_soc_component_write_field(component, WCD939X_ANA_HPH,
+					      WCD939X_HPH_HPHL_ENABLE, true);
+
 		enable_irq(wcd939x->hphl_pdm_wd_int);
-		break;
-	case SND_SOC_DAPM_PRE_PMD:
+	} else {
 		disable_irq_nosync(wcd939x->hphl_pdm_wd_int);
 		/*
 		 * 7ms sleep is required if compander is enabled as per
@@ -848,8 +842,7 @@ static int wcd939x_codec_enable_hphl_pa(struct snd_soc_dapm_widget *w,
 
 		wcd_mbhc_event_notify(wcd939x->wcd_mbhc, WCD_EVENT_PRE_HPHL_PA_OFF);
 		set_bit(HPH_PA_DELAY, &wcd939x->status_mask);
-		break;
-	case SND_SOC_DAPM_POST_PMD:
+
 		/*
 		 * 7ms sleep is required if compander is enabled as per
 		 * HW requirement. If compander is disabled, then
@@ -873,10 +866,7 @@ static int wcd939x_codec_enable_hphl_pa(struct snd_soc_dapm_widget *w,
 		if (wcd939x->ldoh)
 			snd_soc_component_write_field(component, WCD939X_LDOH_MODE,
 						      WCD939X_MODE_LDOH_EN, false);
-		break;
 	}
-
-	return 0;
 }
 
 static int wcd939x_codec_enable_ear_pa(struct snd_soc_dapm_widget *w,
@@ -2736,14 +2726,6 @@ static const struct snd_soc_dapm_widget wcd939x_dapm_widgets[] = {
 			   wcd939x_codec_enable_ear_pa,
 			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
 			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
-	SND_SOC_DAPM_PGA_E("HPHL PGA", WCD939X_ANA_HPH, 7, 0, NULL, 0,
-			   wcd939x_codec_enable_hphl_pa,
-			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
-			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
-	SND_SOC_DAPM_PGA_E("HPHR PGA", WCD939X_ANA_HPH, 6, 0, NULL, 0,
-			   wcd939x_codec_enable_hphr_pa,
-			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
-			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
 
 	SND_SOC_DAPM_DAC_E("RDAC1", NULL, SND_SOC_NOPM, 0, 0,
 			   wcd939x_codec_hphl_dac_event,
@@ -2858,8 +2840,7 @@ static const struct snd_soc_dapm_route wcd939x_audio_map[] = {
 	{"RX1", NULL, "RXCLK"},
 	{"RDAC1", NULL, "RX1"},
 	{"HPHL_RDAC", "Switch", "RDAC1"},
-	{"HPHL PGA", NULL, "HPHL_RDAC"},
-	{"HPHL", NULL, "HPHL PGA"},
+	{"HPHL", NULL, "HPHL_RDAC"},
 
 	{"IN2_HPHR", NULL, "VDD_BUCK"},
 	{"IN2_HPHR", NULL, "CLS_H_PORT"},
@@ -2867,8 +2848,7 @@ static const struct snd_soc_dapm_route wcd939x_audio_map[] = {
 	{"RDAC2", NULL, "RX2"},
 	{"RX2", NULL, "RXCLK"},
 	{"HPHR_RDAC", "Switch", "RDAC2"},
-	{"HPHR PGA", NULL, "HPHR_RDAC"},
-	{"HPHR", NULL, "HPHR PGA"},
+	{"HPHR", NULL, "HPHR_RDAC"},
 
 	{"IN3_EAR", NULL, "VDD_BUCK"},
 	{"RX3", NULL, "IN3_EAR"},
@@ -3258,6 +3238,19 @@ static int wcd939x_codec_free(struct snd_pcm_substream *substream,
 	return wcd939x_sdw_free(wcd, substream, dai);
 }
 
+static int wcd939x_codec_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
+{
+	struct wcd939x_priv *wcd939x = dev_get_drvdata(dai->dev);
+	struct snd_soc_component *component = dai->component;
+
+	if (wcd939x->hphl_enable)
+		wcd939x_codec_enable_hphl_pa(component, !mute);
+	if (wcd939x->hphr_enable)
+		wcd939x_codec_enable_hphr_pa(component, !mute);
+
+	return 0;
+}
+
 static int wcd939x_codec_set_sdw_stream(struct snd_soc_dai *dai,
 					void *stream, int direction)
 {
@@ -3270,6 +3263,7 @@ static int wcd939x_codec_set_sdw_stream(struct snd_soc_dai *dai,
 static const struct snd_soc_dai_ops wcd939x_sdw_dai_ops = {
 	.hw_params = wcd939x_codec_hw_params,
 	.hw_free = wcd939x_codec_free,
+	.mute_stream = wcd939x_codec_mute_stream,
 	.set_stream = wcd939x_codec_set_sdw_stream,
 };
 
-- 
2.51.0


