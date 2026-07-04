Return-Path: <linux-arm-msm+bounces-116497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TgvCMwZfSWpa0wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 21:29:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E53D37083E1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 21:29:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116497-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116497-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB29F30226B6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2026 19:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42320374A0C;
	Sat,  4 Jul 2026 19:29:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from h8.fbrelay.privateemail.com (h8.fbrelay.privateemail.com [162.0.218.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5719288C30;
	Sat,  4 Jul 2026 19:29:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783193348; cv=none; b=Q5a7o2cg+5rnHoHf/6HalPxiFl/gRT1SdIKU/NVPf+wNjlHglYY9qSmQeezqwywmx/GAb3EDKyCDlzdrB5uMm8ZPOfUQ5OrWLUbv+rW/TtztZsintHknftQY1QtMqmPabBqrs1HiJ/QgLtKyjSj3QyZqWBzEqZtK1+zpRWF6GuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783193348; c=relaxed/simple;
	bh=ughmAO3Q1SC/LcU01RDqMndLrphSt+noFXJ+WL1Sq2c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sPM7MmTRJGbb8Q53zGPe7SscjiD3mEBYpTAmhLR8kKltldfMMxrBUpYzRblZvCr4XeyidyCtuyhiE4FjJ+raxqS3XftunxlwEhUtaAZbCdbJmGWJ0mjylZTmrF+ZqetKTk3cusG0dHftWCThiWzxYpbxBbrNNCx2QBOZfrIp86o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net; spf=pass smtp.mailfrom=catcrafts.net; arc=none smtp.client-ip=162.0.218.231
Received: from MTA-07-3.privateemail.com (mta-07.privateemail.com [198.54.127.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by h7.fbrelay.privateemail.com (Postfix) with ESMTPSA id 4gt0zh5jWXz2xCX;
	Sat,  4 Jul 2026 15:29:04 -0400 (EDT)
Received: from mail.privateemail.com (unknown [87.215.145.39])
	by mta-07.privateemail.com (Postfix) with ESMTPA id 4gt0zM18xCz3hhTK;
	Sat,  4 Jul 2026 15:28:46 -0400 (EDT)
From: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
Subject: [PATCH] ASoC: qcom: sc8280xp: support Senary MI2S
Date: Sat,  4 Jul 2026 21:28:30 +0200
Message-ID: <20260704192830.88134-1-jorijnvdgraaf@catcrafts.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,vger.kernel.org,catcrafts.net];
	TAGGED_FROM(0.00)[bounces-116497-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[catcrafts.net];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jorijnvdgraaf@catcrafts.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jorijnvdgraaf@catcrafts.net,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[jorijnvdgraaf@catcrafts.net,linux-arm-msm@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,catcrafts.net:from_mime,catcrafts.net:email,catcrafts.net:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E53D37083E1

Extend the clock-provider DAI fmt setup to Senary MI2S; without it
q6i2s_set_fmt() is never called, ws_src remains external and the DSP
does not drive the I2S clocks.

Force 32-bit slots on this interface in the BE fixup. The only Senary
MI2S user so far is the Fairphone (Gen. 6), whose AW88261 speaker
amplifiers derive their boost converter clock from BCLK and are
configured by their firmware profile for 48 kHz x 32 bit x 2
(3.072 MHz BCLK), matching the downstream configuration of this
backend (bit_width 32). The board DTS enabling this interface is
headed upstream separately via linux-arm-msm. Should a board with
different requirements on this interface appear, the fixup can be
keyed on the card compatible instead.

Note the snd_mask_none() before snd_mask_set_format(): the latter only
ORs the format bit into the mask, and with the default S16 left in
place DPCM refinement still resolves to S16.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
---
 sound/soc/qcom/sc8280xp.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 7925aa3f63ba..5a0b7f05c12b 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -34,6 +34,7 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 	switch (cpu_dai->id) {
 	case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:
 	case QUINARY_MI2S_RX...QUINARY_MI2S_TX:
+	case SENARY_MI2S_RX...SENARY_MI2S_TX:
 		snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
 		break;
 	case WSA_CODEC_DMA_RX_0:
@@ -88,6 +89,17 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	case TX_CODEC_DMA_TX_3:
 		channels->min = 1;
 		break;
+	case SENARY_MI2S_RX...SENARY_MI2S_TX:
+		/*
+		 * Run the interface in 32-bit slots (3.072 MHz BCLK at
+		 * 48 kHz stereo), as the speaker amplifiers on this
+		 * interface require. The default S16 must be cleared
+		 * first: snd_mask_set_format() only ORs the bit in, and
+		 * DPCM refinement would still resolve to S16.
+		 */
+		snd_mask_none(fmt);
+		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S32_LE);
+		break;
 	default:
 		break;
 	}

base-commit: be44d21728b6646189779923b841ad3a46d694e5
-- 
2.55.0


