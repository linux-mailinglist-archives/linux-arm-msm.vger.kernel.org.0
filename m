Return-Path: <linux-arm-msm+bounces-82028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 909C2C62616
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 06:19:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CA4404EA7A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 05:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 653023148B1;
	Mon, 17 Nov 2025 05:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="OJe/OLwx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8760C30E837
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 05:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763356637; cv=none; b=G3n+B/C/h/5q0NvJCHvKh29JrsufD7Z345IxRB6eNP26KUfe2thDACYLDyLtMwov8ggyW+KnAevybPIzxBLUh85U5VzmTVYWrkBsH1DVoISnmGEzDCYchhVFVrvlFq1iDr+iHSpp6rZ56+PsXvm33YLmipZlpXlPHa1zaprzyAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763356637; c=relaxed/simple;
	bh=+7f6/EfUB0qNuJaPGqb/loDCvdGQawT/Zj+p3Tc3sW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fTZNPdEo7Zw0gq8QG+uZWTTPgq4OIEGIy4X+I7YnzAJKKZq/Cbk6AShRqX1v5lSKiRFzc3FYdAmjPi8zMArXICF1jU4G8mjBYszpx1Q0XoqYfaLvfBNQ8DBIgRVeo6hnERa/N2RxK+KQ+DA8hAnGV5yoddVCAQKB4YBqe6s9CHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=OJe/OLwx; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8b2f2c5ec36so35460185a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 21:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1763356634; x=1763961434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MOdK1eF0Hvwt85eYnDgcLuM6/1GRm0/JCkihIeiWd9Q=;
        b=OJe/OLwxgRMWXJynhHnscMCTCFNamIhvRsB+2k0EqIcM/SKoNhbs5A2+NSNPPyD6dN
         minB8SYxVp934YIsbQI+qZHn4e6D26+nf0Dh2dRVhjyyCHlg6z+lm5K/S2yU7y+frBlT
         puWu9PwdE2xNo+EwaC6CTU12ByiddT36mhWc0JuVOpoMXILp6GxN732high+a8+bvVx3
         xHnQ+3eMTNgZP2p2971VyonF9OuKAWQdywiIoDtANBCPSSTUYJKaiNHbLwQ+gTKFZ2dJ
         1VdIom1JXtGeKA+pzYjqEOqi+J1AyG8rOTJd+juPB9uF4ON+FuL/AQ8x73I27etr+Hca
         5SdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763356634; x=1763961434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MOdK1eF0Hvwt85eYnDgcLuM6/1GRm0/JCkihIeiWd9Q=;
        b=hziHe6wkwznmUqeXcsniesHenoBJmYLFzSYkL970CgRn+T2t33I4AgcvrLYnTIjZ9p
         eIJlGz+TGNMuryevAOqPbrXLcmbav8BAuwKS03z8hSAeVBDpP7z1EpC4uxb88yAggw+t
         PAUdh73fEXR8/Rne/dRtr8l9T4iOACOuZ7IsPejmMf3x3L4PlGkPPkMWarZPNOjy0J8X
         9HuTzpI1U8OHP+m57vlicKQifiyX1qjWn+4572eDlKk2mM2fWJ8cHDYI2RfOzQgWi8+W
         OsbFSCuTQGpaCWtrCJqJX5m7rIi+SJMk1QovTZeq8DM5WX9q52ZN7KWMyrZl6+NyIRZX
         Awdw==
X-Gm-Message-State: AOJu0YwWl2up8J/lLYwoYEIH/STb1/A9RDzfZpVA9KZhFIwgtCOzkH/+
	eFP2QxHFAIbc+RVcV56nrceELDzJiWMYj1oWpJntsp9m8kzjAfrf5BncwbxqcQmsc3xqIZtMLC4
	WFoEY
X-Gm-Gg: ASbGnctbpJJcR5g+SbvOYzmFT+wH62a52ADo2RSDjmTYji2Fk2I+wZ1BHYxng8sXTlI
	TnikcNNKhTNl3QOlAG4PRW72HuT0K3sutgMAF0OZ4XuiiZxKaR05OZF5W7zxgh2UyIDlj5t/CJZ
	bon0yEYkzpHVHl5iqNSmwNqqhvDicL688u9U8T4kUwFxvAGaTwqW3zR4Eo6NBaayw59nPZy9Jns
	sT8/7vcpGNWNP0ps/4MnI+Z5u/N1dwoZta22AUwoxfHn+Z3FRQz772D7Wmvg1wgblFBjEw51gOh
	BCXQTOjZDbeO5JgscPC5lxynmrrB/rn/AxNXIhd9TE7THtKZgmVQTDjizhK11S8vgxAM8fcPGgn
	6KyGzGTJAT96dEL33hO/4B8PiZmYuQV0IXrmkag6NxDYec9WWxfyHmTjWKSewPW826IhVo8rLVb
	aosceaZVVQZbisI8MFwAyf/n9N9RcbW2c2Z5g7DZNSCHz/GKn7IldNE/c=
X-Google-Smtp-Source: AGHT+IHlXzebUqdY82V9w3n+/S11C6VL9ads9Mdbd/RMezxOdbHnm5SUqQobCOulYUjpC5m5dQVF2Q==
X-Received: by 2002:a05:620a:2a10:b0:8a9:b9cc:b90d with SMTP id af79cd13be357-8b2c31d3cfamr1245027985a.65.1763356634034;
        Sun, 16 Nov 2025 21:17:14 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2aef2f936sm906417185a.29.2025.11.16.21.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 21:17:13 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org (open list:QCOM AUDIO (ASoC) DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/9] ASoC: codecs: lpass-wsa-macro: remove mix path event
Date: Mon, 17 Nov 2025 00:15:15 -0500
Message-ID: <20251117051523.16462-3-jonathan@marek.ca>
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

All it does it disable the mix path clk bit, but this is already managed by
the WSA_RX_MIX0_CLK/WSA_RX_MIX1_CLK supplies.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 sound/soc/codecs/lpass-wsa-macro.c | 46 +++---------------------------
 1 file changed, 4 insertions(+), 42 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 6f16d54aee401..06570e474c850 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -1563,36 +1563,6 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
-static int wsa_macro_enable_mix_path(struct snd_soc_dapm_widget *w,
-				     struct snd_kcontrol *kcontrol, int event)
-{
-	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
-	u16 path_reg;
-
-	switch (w->shift) {
-	case WSA_MACRO_RX_MIX0:
-		path_reg = CDC_WSA_RX0_RX_PATH_MIX_CTL;
-		break;
-	case WSA_MACRO_RX_MIX1:
-		path_reg = CDC_WSA_RX1_RX_PATH_MIX_CTL;
-		break;
-	default:
-		return 0;
-	}
-
-	switch (event) {
-	case SND_SOC_DAPM_POST_PMU:
-		break;
-	case SND_SOC_DAPM_POST_PMD:
-		snd_soc_component_update_bits(component, path_reg,
-					      CDC_WSA_RX_PATH_MIX_CLK_EN_MASK,
-					      CDC_WSA_RX_PATH_MIX_CLK_DISABLE);
-		break;
-	}
-
-	return 0;
-}
-
 static void wsa_macro_hd2_control(struct snd_soc_component *component,
 				  u16 reg, int event)
 {
@@ -2475,30 +2445,22 @@ static const struct snd_soc_dapm_widget wsa_macro_dapm_widgets_v2_1[] = {
 	SND_SOC_DAPM_MUX("WSA_RX0 INP0", SND_SOC_NOPM, 0, 0, &rx0_prim_inp0_mux_v2_1),
 	SND_SOC_DAPM_MUX("WSA_RX0 INP1", SND_SOC_NOPM, 0, 0, &rx0_prim_inp1_mux_v2_1),
 	SND_SOC_DAPM_MUX("WSA_RX0 INP2", SND_SOC_NOPM, 0, 0, &rx0_prim_inp2_mux_v2_1),
-	SND_SOC_DAPM_MUX_E("WSA_RX0 MIX INP", SND_SOC_NOPM, WSA_MACRO_RX_MIX0,
-			   0, &rx0_mix_mux_v2_1, wsa_macro_enable_mix_path,
-			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX("WSA_RX0 MIX INP", SND_SOC_NOPM, 0, 0, &rx0_mix_mux_v2_1),
 	SND_SOC_DAPM_MUX("WSA_RX1 INP0", SND_SOC_NOPM, 0, 0, &rx1_prim_inp0_mux_v2_1),
 	SND_SOC_DAPM_MUX("WSA_RX1 INP1", SND_SOC_NOPM, 0, 0, &rx1_prim_inp1_mux_v2_1),
 	SND_SOC_DAPM_MUX("WSA_RX1 INP2", SND_SOC_NOPM, 0, 0, &rx1_prim_inp2_mux_v2_1),
-	SND_SOC_DAPM_MUX_E("WSA_RX1 MIX INP", SND_SOC_NOPM, WSA_MACRO_RX_MIX1,
-			   0, &rx1_mix_mux_v2_1, wsa_macro_enable_mix_path,
-			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX("WSA_RX1 MIX INP", SND_SOC_NOPM, 0, 0, &rx1_mix_mux_v2_1),
 };
 
 static const struct snd_soc_dapm_widget wsa_macro_dapm_widgets_v2_5[] = {
 	SND_SOC_DAPM_MUX("WSA_RX0 INP0", SND_SOC_NOPM, 0, 0, &rx0_prim_inp0_mux_v2_5),
 	SND_SOC_DAPM_MUX("WSA_RX0 INP1", SND_SOC_NOPM, 0, 0, &rx0_prim_inp1_mux_v2_5),
 	SND_SOC_DAPM_MUX("WSA_RX0 INP2", SND_SOC_NOPM, 0, 0, &rx0_prim_inp2_mux_v2_5),
-	SND_SOC_DAPM_MUX_E("WSA_RX0 MIX INP", SND_SOC_NOPM, WSA_MACRO_RX_MIX0,
-			   0, &rx0_mix_mux_v2_5, wsa_macro_enable_mix_path,
-			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX("WSA_RX0 MIX INP", SND_SOC_NOPM, 0, 0, &rx0_mix_mux_v2_5),
 	SND_SOC_DAPM_MUX("WSA_RX1 INP0", SND_SOC_NOPM, 0, 0, &rx1_prim_inp0_mux_v2_5),
 	SND_SOC_DAPM_MUX("WSA_RX1 INP1", SND_SOC_NOPM, 0, 0, &rx1_prim_inp1_mux_v2_5),
 	SND_SOC_DAPM_MUX("WSA_RX1 INP2", SND_SOC_NOPM, 0, 0, &rx1_prim_inp2_mux_v2_5),
-	SND_SOC_DAPM_MUX_E("WSA_RX1 MIX INP", SND_SOC_NOPM, WSA_MACRO_RX_MIX1,
-			   0, &rx1_mix_mux_v2_5, wsa_macro_enable_mix_path,
-			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX("WSA_RX1 MIX INP", SND_SOC_NOPM, 0, 0, &rx1_mix_mux_v2_5),
 };
 
 static const struct snd_soc_dapm_route wsa_audio_map[] = {
-- 
2.51.0


