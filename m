Return-Path: <linux-arm-msm+bounces-82034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D82E7C62634
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 06:20:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4185E3B5DA1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 05:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A37E93168FB;
	Mon, 17 Nov 2025 05:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="A+SMierF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10A0316907
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 05:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763356645; cv=none; b=BvHP+7StaCnz+TVS6U7d8Iqx2gDs1wVdg8uyHSOqGVDxDKemYzBTm1/dY2Q38xRovYqo+sQDgXsjo1pX4j8IdUpwH1bxd3HbAnPCVu48Va+vEJxj0TMbboih1Kv8mEYft/glfcvayL3wMB7gsvdPIwE+F2l0PdqseSb7vG8f3t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763356645; c=relaxed/simple;
	bh=fFCnrKfZ6fyKdtooA6OkkWdD4KpdkZStP4RM2O4IPe0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZYXW1sQis0SHOoHLkLbKy56l5c1jY1bGzK//Nt1towW30Rs2Ib4AcgF0/cgxhY9/bzRPhJFBe4ciknIg8fJyYalE541IxNa79ein7FwIas3DX2lSeJCaYgYy94UpD9ryg6ENbVR9H9e4n5FuekPyv+42LD0ZAfblalWVSipoHR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=A+SMierF; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8b21fa7b91bso367448085a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 21:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1763356642; x=1763961442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjB9Qq208HC3pXFl5L+RekWRbUTIKQ1gS1VARhSM6F4=;
        b=A+SMierF8r5wlvUMyveSTeuhJ/bX99qVdRBAsqPOeQv2L4Lhe903bypLvuzPe2tYHf
         zYu7ysLG8k46uDPeI9MKl7XrjECxiqjVF+FhsGBjMN33FKquP//KE2IvfTP0iufz2Kul
         7ei6tJ9Ir7MdRhbhO5blN/hWMUFT3B0CxOnwHqwbBP2685njLjxmg9IHanh+1GHaWlUd
         ChmyYjLsVhVztUQOPgcn6jkh3N6ISvQ5YrB1GqPWP2HInWMqjQr/Wl8j8NV3tKevPbLr
         0x3zXmWGTUpiSX0tCDhoRbQZYx6Jtm0tIA+JaxFB274/CJfuQGERU5WMj+0oCs3nC0rP
         wetw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763356642; x=1763961442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sjB9Qq208HC3pXFl5L+RekWRbUTIKQ1gS1VARhSM6F4=;
        b=VeVm9kx2zJtWp6aEAhjfmBORTn+WSUuGupfUV5r7wlGTyVmktURTF/WorL0VlCUey8
         548Y5KTBcwYQUcG9UrUxJQ6yN2n2tju9kx8N5uLDHF3gDm4Hm1vb2K8B4EoI7SwOZA3r
         +2HqHmFXuL9AHYno0b9uIA8Pk8qpbFrZAR0Ax6HW6BzERIUhPjg/ay6IfM9AvdWiEsVn
         ZSH/yjtdKLB3JENTBQG+2WNqzxBXauPJ09HziNIyl60kRQ6q8nOVDdA8j3h2/3UdA7Mp
         gZhzuGaafd/VapSIFw/Ik9A0zHqtqzbIfTic1Ig0zC5MUt0ZnbDM5EHh4qREql2wW5Ty
         AKhg==
X-Gm-Message-State: AOJu0Yx0FRVYM1g5iPag6OV5s2eSvvc2a/Vup/vUUzuAWXnp81tLhLwZ
	cGVw8XOVb7wo8nqaM7RVQlaOYB3rqk+b7r6O8pvNX+nIUrevBMEvT8FlQLosjCKADJN80gLru3k
	PP5QE
X-Gm-Gg: ASbGncu02Iuo6BRFYjtVyg2JAOGjD5ipCBuJJIg/71ItAnEcjov4TjaHLVfMw+b8GLE
	bQmRI0DJ4vOvoO1IU0s9JygjRhvnMcRl6xdgPtvkV3tn8iXzfDe2t7kmErDmUfMZdL/bMtUQfYl
	CiKUMErVNB+GnqNGRVF3Avamrk/gszQIYpLP8Uqu+wzpB2dLq1Hun9wVF0TReEgqw+Am7VQxX6X
	QlkR5wG/hBklPaHM9Ck5dgFx4aNZsdTZTXBJRBIVtcPb5honEm//jAHnBOl6yZeBDLWR2ETaVyx
	7IHxmmrXds6DSdNCRpATfmT3zxOWFJItgnD16v5h4BOUkC03eUPQdMjgF0zrcjr8FDu3PC4OIny
	fgob5E6YQnMhrWgbjA4pP9gIHEF1Md+pnLvKX6QtZSQaVgwe2LhfK0C1RUS876iggw4bmJwB5aN
	f9PibZF4qs75xMDHg/ZKc329ZcPUQwVI8QOUuSubcIAALX0p5mUtS+UZM=
X-Google-Smtp-Source: AGHT+IGOCSSak+wz7zgqeh6lwC6pX6YCBNM80+YM/AiDDTj6WYPvkidk/KXiUkkIfEgfWxGmdWb1TA==
X-Received: by 2002:a05:620a:1917:b0:8b2:eefb:c8a6 with SMTP id af79cd13be357-8b2eefbccc1mr306815385a.88.1763356642316;
        Sun, 16 Nov 2025 21:17:22 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2aef2f936sm906417185a.29.2025.11.16.21.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 21:17:22 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org (open list:QCOM AUDIO (ASoC) DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 9/9] ASoC: codecs: lpass-rx-macro: fix mute_stream affecting all paths
Date: Mon, 17 Nov 2025 00:15:21 -0500
Message-ID: <20251117051523.16462-9-jonathan@marek.ca>
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

The current mute_steam() implementation affects all paths instead of
only those in use by the DAI.

For example, playing to 2 DAIs simultaneously with mixing, stopping
one will mute the other.

Rework to use the same logic as hw_params() to mute only the relevant paths.
(also, use "rx->main_clk_users[j] > 0" instead of dsm_reg, which is
equivalent. I also don't think the clock enable should be in this function,
but that's a change for another patch)

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 sound/soc/codecs/lpass-rx-macro.c | 74 +++++++++++++++----------------
 1 file changed, 35 insertions(+), 39 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index a8fc842cc94ef..d7e51f02a9115 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -1905,52 +1905,48 @@ static int rx_macro_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
 {
 	struct snd_soc_component *component = dai->component;
 	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
-	uint16_t j, reg, mix_reg, dsm_reg;
-	u16 int_mux_cfg0, int_mux_cfg1;
+	u32 port, j, reg, mix_reg, int_mux_cfg0, int_mux_cfg1;
+	u32 mask, val;
 	u8 int_mux_cfg0_val, int_mux_cfg1_val;
 
-	switch (dai->id) {
-	case RX_MACRO_AIF1_PB:
-	case RX_MACRO_AIF2_PB:
-	case RX_MACRO_AIF3_PB:
-	case RX_MACRO_AIF4_PB:
-		for (j = 0; j < INTERP_MAX; j++) {
-			reg = CDC_RX_RXn_RX_PATH_CTL(rx, j);
-			mix_reg = CDC_RX_RXn_RX_PATH_MIX_CTL(rx, j);
-			dsm_reg = CDC_RX_RXn_RX_PATH_DSM_CTL(rx, j);
-
-			if (mute) {
-				snd_soc_component_update_bits(component, reg,
-							      CDC_RX_PATH_PGA_MUTE_MASK,
-							      CDC_RX_PATH_PGA_MUTE_ENABLE);
-				snd_soc_component_update_bits(component, mix_reg,
-							      CDC_RX_PATH_PGA_MUTE_MASK,
-							      CDC_RX_PATH_PGA_MUTE_ENABLE);
-			} else {
-				snd_soc_component_update_bits(component, reg,
-							      CDC_RX_PATH_PGA_MUTE_MASK, 0x0);
-				snd_soc_component_update_bits(component, mix_reg,
-							      CDC_RX_PATH_PGA_MUTE_MASK, 0x0);
+	if (stream != SNDRV_PCM_STREAM_PLAYBACK)
+		return 0;
+
+	for (j = 0; j < INTERP_MAX; j++) {
+		reg = CDC_RX_RXn_RX_PATH_CTL(rx, j);
+		mix_reg = CDC_RX_RXn_RX_PATH_MIX_CTL(rx, j);
+
+		mask = CDC_RX_PATH_PGA_MUTE_MASK;
+		val = 0;
+		if (mute)
+			val |= CDC_RX_PATH_PGA_MUTE_ENABLE;
+		if (rx->main_clk_users[j] > 0) {
+			mask |= CDC_RX_PATH_CLK_EN_MASK;
+			val |= CDC_RX_PATH_CLK_ENABLE;
+		}
+
+		int_mux_cfg0 = CDC_RX_INP_MUX_RX_INT0_CFG0 + j * 8;
+		int_mux_cfg1 = int_mux_cfg0 + 4;
+		int_mux_cfg0_val = snd_soc_component_read(component, int_mux_cfg0);
+		int_mux_cfg1_val = snd_soc_component_read(component, int_mux_cfg1);
+
+		for_each_set_bit(port, &rx->active_ch_mask[dai->id], RX_MACRO_PORTS_MAX) {
+			if (((int_mux_cfg0_val & 0x0f) == port + INTn_1_INP_SEL_RX0) ||
+			    ((int_mux_cfg0_val >> 4) == port + INTn_1_INP_SEL_RX0) ||
+			    ((int_mux_cfg1_val >> 4) == port + INTn_1_INP_SEL_RX0)) {
+				snd_soc_component_update_bits(component, reg, mask, val);
 			}
 
-			int_mux_cfg0 = CDC_RX_INP_MUX_RX_INT0_CFG0 + j * 8;
-			int_mux_cfg1 = int_mux_cfg0 + 4;
-			int_mux_cfg0_val = snd_soc_component_read(component, int_mux_cfg0);
-			int_mux_cfg1_val = snd_soc_component_read(component, int_mux_cfg1);
-
-			if (snd_soc_component_read(component, dsm_reg) & 0x01) {
-				if (int_mux_cfg0_val || (int_mux_cfg1_val & 0xF0))
-					snd_soc_component_update_bits(component, reg, 0x20, 0x20);
-				if (int_mux_cfg1_val & 0x0F) {
-					snd_soc_component_update_bits(component, reg, 0x20, 0x20);
-					snd_soc_component_update_bits(component, mix_reg, 0x20,
-								      0x20);
+			if ((int_mux_cfg1_val & 0x0f) == port + INTn_2_INP_SEL_RX0) {
+				snd_soc_component_update_bits(component, mix_reg, mask, val);
+				/* main clock needs to be enabled for mix to be useful: */
+				if (rx->main_clk_users[j] > 0) {
+					snd_soc_component_update_bits(component, reg,
+								      CDC_RX_PATH_CLK_EN_MASK,
+								      CDC_RX_PATH_CLK_ENABLE);
 				}
 			}
 		}
-		break;
-	default:
-		break;
 	}
 	return 0;
 }
-- 
2.51.0


