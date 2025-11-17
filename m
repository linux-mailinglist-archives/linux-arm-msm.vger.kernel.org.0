Return-Path: <linux-arm-msm+bounces-82031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B04C6262B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 06:20:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 857F14ED13A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 05:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDF183161A1;
	Mon, 17 Nov 2025 05:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="hCIs0JuW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E19315D21
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 05:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763356641; cv=none; b=gpeuzoBLcBZQL8jScjC7mSFqp/Y8m6RhTbuRl/0JD7it7GwVKYc4Rns4m/sVs+G0Y2y+i1879eFsGrvhCsZ/nmDwGbPCtPe4x8fPlqbVwjVnAKfgEzaPrKAWxoAxLJlIgtLT2qoIXxYwaZObvwtlQLs70aBR9jjItGCv7vBzQtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763356641; c=relaxed/simple;
	bh=nPfi1cqWPH+uoaysXqvyZ9RStliWvV/SheA0t8CK5o4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XKet/K71E+tAQ31pWl2FEA5fXRwR5v1QaQvCW+oEFCFT7E65KSN+RhGLgDNMTGiYRUEcFMwJDK/oyFTlqJH/iGICX2mFdsNSILNwBAmmoUIX5lW2YUHlzM2HC/wIxAARi5lGslF8B2XYWjbsVDSqISm7xrayFh4bmidYhQ+Ll+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=hCIs0JuW; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8b2dcdde698so216721085a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 21:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1763356639; x=1763961439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+q/DJ3T1QwmqJRkGDl3IH0ngS+XUlezRwVul2293Q4=;
        b=hCIs0JuWzrup/TNuVVJiqi1ieYepuTZJcB0WK9CHCok3SOMFZw1Tj8igpp9YVAIXVH
         bCLL7XFC4egW1Jdo4dWyKOSZAvWfgBGNjoRd21NGXVe5C9MNwTbpEOD3o0W4PVVAmZMQ
         IphCDnvzo6y3c/UKJ+ilUwpXJ33vTAC5K259qBycvIITFmuGEy5ZunKpz5z7/sMvA31y
         UmnggCVRFuIpfHdXyfRLR+UdjHaoVkDffC3Gxik3dW+81M0/3vW16CBGw6DUXQJIJAES
         vATu/Te/6kyE7soHcxxhkgt8Dv9MjYIyzgPzR6hBs/T6KofDzOTJeVVOzkxjpvTeUGqW
         rSzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763356639; x=1763961439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V+q/DJ3T1QwmqJRkGDl3IH0ngS+XUlezRwVul2293Q4=;
        b=UcifrVoHcMRwByddsUQutPuWzs0No4kseqfhEMl+xFjEHluoiPTvBKnYazSZ/g6Kex
         81c9j1letQqydNSsQUZMaziZxPVQnJoiYA7cLx7PLMxm8Qzd0n5jBY+HTwmPSnrX8xjS
         Z5QMBj+B0OasLcTtPLl2vBrP1621xejp58SHyxZ1T73OtC9q225amjNz2OgU6MR1sjkb
         renyA3bNHkUeNJ+40+CcyLYuRiSNbtxvBOiX0W3I8VcrMMXr6XCpDBzXA2kee3+qQR/o
         ozSgR5Os3R4m+1BpBadndAZTol/TC9W+TLpE+LyoYmwJWFKuN7B3CvHI6zoek3j0Vlus
         ek1g==
X-Gm-Message-State: AOJu0YwPKD4lAHqmzMHuhXfy3oEs8wGmGjCHENaugq4m+B2lzbKavb7a
	FzoIKSwjG+lYeuLNvcz9i+wL3KiLh2wS2FtXU+WJuzP630U+lqKOBF2tUiiDgIXTCBw/0i9te9A
	jAwNQ
X-Gm-Gg: ASbGnctNjhX98lOkTh5/FLkCfsrou9joH9HbILe1a7VJfmi/ch8b8x2kp0Rr2z1Ylwn
	uT+cPRv5OqtqSDl4/aKmgmB0GpdE5W5ftoq5fhbQHab82Ii59cUmz2XtHL41bZPzExHWIW0T6MJ
	bfMSmuydzmZkowb+4Kp+vmXLimdvBnd/DRw7ACK19eI2TmxUJSgOt98VlVuHN9D9znL0W6Mr2YB
	mMasaO+W7YnCQPZo3glowCpxSYk6JM0S4sJmktinSTVsankFFkHECnOwaMJXtP3nDA52KPmcKOd
	dgQofW46BpTXmNZI5rjMsqoYKT6QbR+gVUCYYXQ8Jbggqo13fTkEycOcPCgjEPi9tMfXuSXuGiv
	RcC2MNveb66fbFdaFaCT0sq7FoyZ2tcQS2QxoyrPtvcn4fOZabfGT4DnhEn/jRiqvmrQ+ZMH2WT
	nHpEMBpUhX4jd4pz/f0hAY7iJyfJrAXBd8A31RGI8S+FIiI2Itqb3mhMZShcVq/uA5Gw==
X-Google-Smtp-Source: AGHT+IHKW6VEyuUZwqdEUiPubm0TQiXXe1MtRR/yF1NhaBCs2zxrDW/nVJOBuPjryrUoA+ryeI/pwA==
X-Received: by 2002:a05:620a:28c6:b0:8b2:f228:ed73 with SMTP id af79cd13be357-8b2f228f14fmr146295985a.7.1763356638634;
        Sun, 16 Nov 2025 21:17:18 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2aef2f936sm906417185a.29.2025.11.16.21.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 21:17:18 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org (open list:QCOM AUDIO (ASoC) DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 6/9] ASoC: codecs: lpass-wsa-macro: remove main path event
Date: Mon, 17 Nov 2025 00:15:18 -0500
Message-ID: <20251117051523.16462-6-jonathan@marek.ca>
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

The event enables the main path clock when the mux is set to DEC0/DEC1.
My patch ("ASoC: codecs: lpass-wsa-macro: fix path clock dependencies")
makes it depend on the main path clock, so this event is now redundant.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 sound/soc/codecs/lpass-wsa-macro.c | 59 +-----------------------------
 1 file changed, 2 insertions(+), 57 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 2a814a5d2d1f0..e2e78ff6dd54e 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -1726,59 +1726,6 @@ static int wsa_macro_config_softclip(struct snd_soc_component *component,
 	return 0;
 }
 
-static bool wsa_macro_adie_lb(struct snd_soc_component *component,
-			      int interp_idx)
-{
-	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
-	u16 int_mux_cfg0,  int_mux_cfg1;
-	u8 int_n_inp0, int_n_inp1, int_n_inp2;
-
-	int_mux_cfg0 = CDC_WSA_RX_INP_MUX_RX_INT0_CFG0 + interp_idx * 8;
-	int_mux_cfg1 = int_mux_cfg0 + 4;
-
-	int_n_inp0 = snd_soc_component_read_field(component, int_mux_cfg0,
-						  wsa->reg_layout->rx_intx_1_mix_inp0_sel_mask);
-	if (int_n_inp0 == INTn_1_INP_SEL_DEC0 ||
-		int_n_inp0 == INTn_1_INP_SEL_DEC1)
-		return true;
-
-	int_n_inp1 = snd_soc_component_read_field(component, int_mux_cfg0,
-						  wsa->reg_layout->rx_intx_1_mix_inp1_sel_mask);
-	if (int_n_inp1 == INTn_1_INP_SEL_DEC0 ||
-		int_n_inp1 == INTn_1_INP_SEL_DEC1)
-		return true;
-
-	int_n_inp2 = snd_soc_component_read_field(component, int_mux_cfg1,
-						  wsa->reg_layout->rx_intx_1_mix_inp2_sel_mask);
-	if (int_n_inp2 == INTn_1_INP_SEL_DEC0 ||
-		int_n_inp2 == INTn_1_INP_SEL_DEC1)
-		return true;
-
-	return false;
-}
-
-static int wsa_macro_enable_main_path(struct snd_soc_dapm_widget *w,
-				      struct snd_kcontrol *kcontrol,
-				      int event)
-{
-	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
-	u16 reg;
-
-	reg = CDC_WSA_RX0_RX_PATH_CTL + WSA_MACRO_RX_PATH_OFFSET * w->shift;
-	switch (event) {
-	case SND_SOC_DAPM_PRE_PMU:
-		if (wsa_macro_adie_lb(component, w->shift)) {
-			snd_soc_component_update_bits(component, reg,
-					     CDC_WSA_RX_PATH_CLK_EN_MASK,
-					     CDC_WSA_RX_PATH_CLK_ENABLE);
-		}
-		break;
-	default:
-		break;
-	}
-	return 0;
-}
-
 static int wsa_macro_interp_get_primary_reg(u16 reg, u16 *ind)
 {
 	u16 prim_int_reg = 0;
@@ -2395,10 +2342,8 @@ static const struct snd_soc_dapm_widget wsa_macro_dapm_widgets[] = {
 	SND_SOC_DAPM_MIXER("WSA RX_MIX0", SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_MIXER("WSA RX_MIX1", SND_SOC_NOPM, 0, 0, NULL, 0),
 
-	SND_SOC_DAPM_MIXER_E("WSA_RX INT0 MIX", SND_SOC_NOPM, 0, 0, NULL, 0,
-			     wsa_macro_enable_main_path, SND_SOC_DAPM_PRE_PMU),
-	SND_SOC_DAPM_MIXER_E("WSA_RX INT1 MIX", SND_SOC_NOPM, 1, 0, NULL, 0,
-			     wsa_macro_enable_main_path, SND_SOC_DAPM_PRE_PMU),
+	SND_SOC_DAPM_MIXER("WSA_RX INT0 MIX", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("WSA_RX INT1 MIX", SND_SOC_NOPM, 0, 0, NULL, 0),
 
 	SND_SOC_DAPM_MIXER("WSA_RX INT0 SEC MIX", SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_MIXER("WSA_RX INT1 SEC MIX", SND_SOC_NOPM, 0, 0, NULL, 0),
-- 
2.51.0


