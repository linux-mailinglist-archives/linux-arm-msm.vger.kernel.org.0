Return-Path: <linux-arm-msm+bounces-82026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF31C62604
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 06:17:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id D818A241F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 05:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25A3C30E0F9;
	Mon, 17 Nov 2025 05:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="DoIe6IgK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F71B30C610
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 05:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763356635; cv=none; b=GdoJ5tj/Yi01cBWZbFogY1t7IrBrLSMGzuJXLhqDUqgP4LKiORUEGbqIeQwYVvuXyHMIOCsUNO4KOxcEtRySnelUQexQ9vL2JkwWMpHoOT0k8Uh1wlIR0G3DlUoh/GrbXQCV/de+NbcubBN2jCE+rOSRQbdXphLzSAxD8a1UcFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763356635; c=relaxed/simple;
	bh=F9bqyjnaY9vppou7CJ4Gw0zGAfIlpIs/l3kwYRqX2f0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pSC9XBc983Wi64XXtifCLbAC78+60fGq/MvDL0pphg4fSJvugNN5DlCgvNzNgFMvYqIMjBYeu+2KeYSfcPRnqJsgrP7m29iwiqlDlc3N2BNsRGymLFvNSOohoIcvpIonSZM67wiZWCWSem6kNvr3mbQUCINFWbezJzCZCPY2Sgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=DoIe6IgK; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8b220ddc189so506107685a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 21:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1763356631; x=1763961431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bjJ6mSMUDnT9EfLt8zTUS1krbqS5uLTDvq+DfAEIIKg=;
        b=DoIe6IgKQkFDV/ASs+fELUoY3hxmEcmypwbN04GaD92XkZCXA28a1K+IGWAHM8xeVJ
         lHJyaUnxAhXmgjC/hMfOXXbtuLs/e3W0Y0ZR4g3W90M9kEVH76h4qPBWOKkpkypLSJu4
         QTDRFTJ9FsUNbTrZMUlHJCtakV8necsA7FXcIvcDKzriR/wZkHJoXpdaElPrVfAtRhw4
         9Q3HBcrnILfO2EbWq6SACBEFImu2paPzjmAmoWNaImUrg5TQhcTPKkiS5m5Ulv/9/MlP
         2wRjW/G+/LJuouffkE6RKPEoNltR4ahHFw0D0c7Iwmn9MeuYIJ7mtHDSdN4Dry1gndC9
         CFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763356631; x=1763961431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bjJ6mSMUDnT9EfLt8zTUS1krbqS5uLTDvq+DfAEIIKg=;
        b=MGaYZI+I6ia1g3tJj0oD2gysoz8igVdMGDAG2q31DyyQZ7j6fyzlAgKjtuxViqgkYU
         vUpCcIib3cxHSnjRpTiBtrUOwTPFvfhALgiZlIkCpW55IPjpfYFDqrs3UEvF9KZUsKSa
         hFnY3AsjSlbe1Td4tlioJjoojgqAfxQT3KO62dapegPGyRxngvp8uOmdSyzAB5Syc6K6
         GBWLCS4HNgxOggss6tets4jsNqkf/iIsrMy25W/hw1ST9z1/HA15XJSUsQk2hkYPHK0Z
         C8cQ9C5DERG9ud4FPF1v4X6TQsYr/xjF2Qg6upxB9anC7EyQeTqqA77c3jihquZO89kN
         3APg==
X-Gm-Message-State: AOJu0Yyi4eHnqHxwjobOvqpiGI1oeimSeZotG3FY6SWI1mjh2cT5GtLG
	kSxCzG2+hlDplM7qA1ojsMwcl3Jkgq2UUuQQ5j4aBQF8aTyxUwWc8UK8Nsl/J3rnFjBICilaHQu
	Oe6sS
X-Gm-Gg: ASbGnctwdRgVUFTXJSNxlhS2DPMlPkTC/UYRNk+h951GpBnE+xIddu5zk/RBpgwR31G
	MVahyJCoMbR7DAFfdf3gSLrXaqF8NxrtZGE9guxYY3A8c+N2tluLwNcZ2iiZ469tzzQ+T87NYyX
	dcU8ebfN9fDtPGaJmJFzhGS8qnsLHiyXokAG/dLUoUmLXg2wJVJOn/9MlnSLFnJWUIz2nQSiC/7
	wAtf7e31uAH32sQBjRwmjOayyEbuNB4tauULb2JVfhl/EF6YRcXEhJWuOkSgyGBx5TmteWTp88N
	Hyf+aHyX/d+6EZLCXrlXP/HOq/fHI6rzOqxIRNu3z4qHev7/Bzasr+fkdstsRusFmuVJf+2xA5B
	QDgeyeBEx/Hxwao8AR+LD5KUXoWC7nJEUiOzo8aUloLPClYk3ecMS9dbIhJn/+rg4KUDJSXaRcL
	UxeQfqD36Pc/N9mfxGx+04WKIg4Zg4tuJ524oYRB5ECJ30oPubLgB6kA8=
X-Google-Smtp-Source: AGHT+IGrDovZ5uxWtzBZ6cBDHkf6F2Vnyg9egsBJUFuZL+TRXg+091tfkXP78NpeMOOq85KHO9Ko6Q==
X-Received: by 2002:a05:620a:2683:b0:8b2:ea5a:4146 with SMTP id af79cd13be357-8b2ea5a454bmr366248985a.89.1763356630970;
        Sun, 16 Nov 2025 21:17:10 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2aef2f936sm906417185a.29.2025.11.16.21.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 21:17:10 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org (open list:QCOM AUDIO (ASoC) DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/9] ASoC: codecs: lpass-wsa-macro: remove unnecessary bounds check
Date: Mon, 17 Nov 2025 00:15:13 -0500
Message-ID: <20251117051523.16462-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

WSA_MACRO_RX0 is 0 and WSA_MACRO_RX_MIX1 is (WSA_MACRO_RX_MAX-1), which
means it is not possible for the bounds check to fail.

Removing the WSA_MACRO_RX_MIX1 limit is needed to add support for other
ports (RX4, RX5, etc.), in which case the valid range depends on the HW
version: rely on the driver only setting valid ports in active_ch_mask
instead (already the case).

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 sound/soc/codecs/lpass-wsa-macro.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 38faa9074ca3e..6e54c1beac8f9 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -1168,12 +1168,6 @@ static int wsa_macro_set_prim_interpolator_rate(struct snd_soc_dai *dai,
 
 	for_each_set_bit(port, &wsa->active_ch_mask[dai->id], WSA_MACRO_RX_MAX) {
 		int_1_mix1_inp = port;
-		if ((int_1_mix1_inp < WSA_MACRO_RX0) || (int_1_mix1_inp > WSA_MACRO_RX_MIX1)) {
-			dev_err(component->dev,	"%s: Invalid RX port, Dai ID is %d\n",
-				__func__, dai->id);
-			return -EINVAL;
-		}
-
 		int_mux_cfg0 = CDC_WSA_RX_INP_MUX_RX_INT0_CFG0;
 
 		/*
@@ -1220,11 +1214,6 @@ static int wsa_macro_set_mix_interpolator_rate(struct snd_soc_dai *dai,
 
 	for_each_set_bit(port, &wsa->active_ch_mask[dai->id], WSA_MACRO_RX_MAX) {
 		int_2_inp = port;
-		if ((int_2_inp < WSA_MACRO_RX0) || (int_2_inp > WSA_MACRO_RX_MIX1)) {
-			dev_err(component->dev,	"%s: Invalid RX port, Dai ID is %d\n",
-				__func__, dai->id);
-			return -EINVAL;
-		}
 
 		int_mux_cfg1 = CDC_WSA_RX_INP_MUX_RX_INT0_CFG1;
 		for (j = 0; j < NUM_INTERPOLATORS; j++) {
-- 
2.51.0


