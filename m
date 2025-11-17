Return-Path: <linux-arm-msm+bounces-82027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3120C6260F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 06:19:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1637B3A5975
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 05:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AC0B30EF81;
	Mon, 17 Nov 2025 05:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="PiC47BZG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B012430DED4
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 05:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763356636; cv=none; b=bh6dJ/ltWi1filDv9JwqTbu03B25ludr+Oj0xVcJ7fpuezkxOYIFxaYcEEI5wHdcAiCNDem/pcJLoAZjU0uO2ogXgX28dWcbo9VzY55Hw0rGDrZFMdhEvGqDGQWEIhrtZP75uiARvT04aTeiteGN7UzqyADx6qtpK0SvlLDtrmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763356636; c=relaxed/simple;
	bh=jMetAjXswfKk89xDttBgjMjZ7rBfdZBoYOr/KWndOtI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tGBFcHqypp1Eg4A6XehoULnUKAGdnIcMQ9HdUPZeKLaTSA+UNd4200Nwx8jffBHj6zLADgpyWXruR8JmkGWURzqlhxrkGUWyjtldhjEwW3oCXqeJoF2tnUNqMzW2YFhq/xQa1Ch6aNkXZ6LsNjajh1mrslPPw9iapGHqbk6EZDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=PiC47BZG; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8b2ea5a44a9so76251685a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 21:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1763356632; x=1763961432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zPoFzhzfSfJq6z3nwCCFRs05FcCD1UdEmhhsy+Y9N4=;
        b=PiC47BZGYCUlA1JFvPI6JxGd8ZrMt0PitZyHe2dV3YKzvS4JyCLQsV+xvo/Kf1COEb
         LGiXqwdsgeyxrsYdyCXKD39HtXiN519niHCjdte0aC27jgHMgXhodHz3AT2M0uUTK9Bw
         lxAKxUHsbmbp6qxQMO+fu/T4G7QqDV5iWy+UBUitgtEwNnl2jwDB/K8Fq6nuzJSY8tnK
         Tp115MWXZj7ujr89Goie+g3gXOPV1dBL2HzKzplRGz1JxgYNAi0aoPDZ29j7UnvdpSHC
         nJWBUupmqRw9+LW9Az7+s/TwHe5Hmq9d1eEaZEaGfKRPkh/OX/gHsOo+y//lRfXZL1Xj
         LrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763356632; x=1763961432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1zPoFzhzfSfJq6z3nwCCFRs05FcCD1UdEmhhsy+Y9N4=;
        b=sNTH05zrtQ/BXYeuXKmc0VODbaxQE0corpuk7qAX47aJw/M+t9B1HqQoEycC5zbdTE
         v5fltopLbiqjsGGFz/GKtK3uH713u49MYD2HJJyVdR8gByS9M90gGGTS2dnNOH6lN2Iz
         9K5Yytqn28E+nqd7IQTZdbhpqCfxLNoAEXihic8IWl/ZbkkR3C9ncF7VSusrLMVtbCov
         bFB1EVoRdnpul/z9MWy5g+IuEPKVzztTJidf62x00HFiM7PAQM7tGNX5tNhmw4apRqNJ
         pH0NP2IH+Yk46mKn+TkhtIG85vG5hLg7mSx46ZrZX84uiEQgsmgI3w5Y08TGWQmfNFHI
         L7Jg==
X-Gm-Message-State: AOJu0YxBa6+6S44jh56/SzKA70xA0zN4OB+CEQAgJDY03pan0CltZJk9
	z2moeCNUtz8MlafNYBXSOJH5l6tJTY1Ye6reDXFJrEXlpEmwLLobpMs+4LQWjfHT7xH4o4kvvxm
	qEjtG
X-Gm-Gg: ASbGnctxQoHtCU5mkjbMWa1pUO3/n5FNvuPwjQdBwRaZNofOOoYG0s3kz3qhwpB2EYJ
	8bpHG/ZUcn81fJPWF67+WMpN59BoMfZ3vkpPFErZC+Y4yCTsVymvM3U7mAwGmlK08v5bvEX/b0C
	/vU1ELE1jhfp5ughdbbCE0YV3FmfnpjPzKTRtcWT73SdeZghAPXrK+bzeaXK8tSbjj7zOxEBntw
	NOHNbPM9Qoyxcuy1+FMACAw+CLArfdU3g3P9WbxiVawE4MCdHS/dkXdGVQrMRePWmmbh4mZTKW+
	M6Dw+EfFF+3+zF9U79M/UAjsa3onK6ORYKPxpNyc59kxH5iwoF/LfJfqdE+gN2/inAYkeoYT3VT
	Cmv9+PjeC+lZ6D9DrcKgDc5oYqgebONB0CHWgucsFaIV7FVXqXfPtMeU5f9setpRLr8pnuXvcBL
	edQRHt6n0zXt8d66MGd80HeFhizH5Dd8vgXzBstcpncr41kGRmsEh7FWxiqMHOti2tYA==
X-Google-Smtp-Source: AGHT+IEKEHjgfMdQRDp2kMcmdyptWSAZDc1BLteCr++y67jIrvfuS9EbngFPfnmOmRhGKb2Nu3/DLg==
X-Received: by 2002:a05:620a:2908:b0:8a2:a5b2:e3bc with SMTP id af79cd13be357-8b2c31e904emr1313924985a.89.1763356632100;
        Sun, 16 Nov 2025 21:17:12 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2aef2f936sm906417185a.29.2025.11.16.21.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 21:17:11 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org (open list:QCOM AUDIO (ASoC) DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/9] ASoC: codecs: lpass-wsa-macro: remove useless gain read/write sequence
Date: Mon, 17 Nov 2025 00:15:14 -0500
Message-ID: <20251117051523.16462-2-jonathan@marek.ca>
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

Reading and writing the same value to this register does nothing.

Looking at downstream driver it seems there was meant to be an offset added

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 sound/soc/codecs/lpass-wsa-macro.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 6e54c1beac8f9..6f16d54aee401 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -1567,17 +1567,14 @@ static int wsa_macro_enable_mix_path(struct snd_soc_dapm_widget *w,
 				     struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
-	u16 path_reg, gain_reg;
-	int val;
+	u16 path_reg;
 
 	switch (w->shift) {
 	case WSA_MACRO_RX_MIX0:
 		path_reg = CDC_WSA_RX0_RX_PATH_MIX_CTL;
-		gain_reg = CDC_WSA_RX0_RX_VOL_MIX_CTL;
 		break;
 	case WSA_MACRO_RX_MIX1:
 		path_reg = CDC_WSA_RX1_RX_PATH_MIX_CTL;
-		gain_reg = CDC_WSA_RX1_RX_VOL_MIX_CTL;
 		break;
 	default:
 		return 0;
@@ -1585,8 +1582,6 @@ static int wsa_macro_enable_mix_path(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		val = snd_soc_component_read(component, gain_reg);
-		snd_soc_component_write(component, gain_reg, val);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		snd_soc_component_update_bits(component, path_reg,
@@ -1931,7 +1926,6 @@ static int wsa_macro_enable_interpolator(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	u16 gain_reg;
 	u16 reg;
-	int val;
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
 
 	if (w->shift == WSA_MACRO_COMP1) {
@@ -1971,8 +1965,6 @@ static int wsa_macro_enable_interpolator(struct snd_soc_dapm_widget *w,
 					CDC_WSA_RX_PGA_HALF_DB_MASK,
 					CDC_WSA_RX_PGA_HALF_DB_ENABLE);
 		}
-		val = snd_soc_component_read(component, gain_reg);
-		snd_soc_component_write(component, gain_reg, val);
 		wsa_macro_config_ear_spkr_gain(component, wsa,
 						event, gain_reg);
 		break;
-- 
2.51.0


