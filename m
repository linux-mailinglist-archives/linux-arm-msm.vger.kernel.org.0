Return-Path: <linux-arm-msm+bounces-113019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PEYFKti1LWqZiwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 21:56:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 010E967F7BE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 21:56:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b="LV7CY/bQ";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113019-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113019-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B77CA3011860
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 19:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38A9537204C;
	Sat, 13 Jun 2026 19:56:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1336F1E9906;
	Sat, 13 Jun 2026 19:56:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781380566; cv=none; b=kJbusWrh87+0iy30YoRWIdbo0TLaEPu3SCImUlWi/KqXDE7tnBhTndOAm4+sFW1X3bhdsjhfGKtETlIENjWtMhmRE0JkOVTtQrPJqGMf+E4NBrOXSFGl4tQnds2gjnibNgyi5if+m5yH7VzScNM1Y6QSH45Ihxqakt3m28nVzbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781380566; c=relaxed/simple;
	bh=79GvdYwG7UWuX4EdzvmkicBEuYdj4oCXjxhY75RMHhQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mTfzuLHLMnSncyvQFeTGHh0sMBpzm8/A8OXtoWjc3/Rh+Gzq5siX6v4DzEYojY1GZt20d/fvorvhi9jR2/UeAVxEPnHhLINZGnLGzYS3MTD7z+2v4SJ7UKCQLOHpVKFpgDt0dHjwJnrWhrQjanskSpjLTFxyKT9P7vm4KcmvrOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LV7CY/bQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9EB3DC19425;
	Sat, 13 Jun 2026 19:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781380565;
	bh=79GvdYwG7UWuX4EdzvmkicBEuYdj4oCXjxhY75RMHhQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=LV7CY/bQkTr6a+ACdhAG1p/WmdyhtjMww7w8wuYYpSIUpwbQv3uF7xwJYu/SiMvpe
	 sGYI2UVTd9SZfJ0LrLsQ7xgVOQDZngmb9hnQNVxOOdFGi0sUIrka+RcULmbnxPm/G7
	 2+FBZW8H1Q/UwCQEteYA+rsPYkojuSz8jlxJAPDVZ3vR++xRU7xslg9Rwo1ogLBwVJ
	 j/IrfW1YyE+P1Tm90BmybEOcQOfyRU1oQ1+mS64uEISMMjme+sB/kZVfioCpn1XpXZ
	 9O4OlrCMwT76KSGd9agTfd4J64iAWuPPVGh8gtbghTdBV0oxR6+Uet24OwmS6djCOe
	 uCKP2fGG5Za6Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84335CD8CA8;
	Sat, 13 Jun 2026 19:56:05 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 13 Jun 2026 21:55:59 +0200
Subject: [PATCH QUESTION] ASoC: qcom: sdm845: use DSP_A format for TDM
 codec DAIs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-rfc-dsp-b-to-a-v1-1-7d095fe90a05@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAM61LWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDM0Nj3aK0ZN2U4gLdJN2SfN1EXUNzi0TjZIPEVPNUQyWgpoKi1LTMCrC
 B0UqBoa7BIZ7+fkqxtbUAYR9AAWoAAAA=
X-Change-ID: 20260613-rfc-dsp-b-to-a-178a3c0ae7e1
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1593; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=neg8UtFcZBwtlMB/SdEqzf3x1Nv6xr1NWuiZgMsq2qA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqLbXUV2DAYE19NFvHsGSAv1VryqAgndBwZCCld
 JE0CEuOCv2JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCai211AAKCRBgAj/E00kg
 csyJD/9d6Vh67hpZ+04lqqTZChLaF1FB8No+Rgo3u0rUKnAyKAEp5EGqL5Rse8VWCMjkiYuJ9df
 rd2bK+2Hr4bBeP/Mb4Riy6V8B7wHZo+d9jdzmALaCOvjTlY7O8a1VpgNJ5tzd3LHUzY51rqOg9J
 G6Y5uYXNQER8jlMgGsEobjp3SiqvjeZW88P7+arplidO5j6sFw1EFStLaGlgRIR6F5yTA+wzfns
 v95bgmpxuNhcpeFlRtBkonAGgBVsnIa+88Ucc2dKk2SjdqC7GUXgQ0PsJ8hHSSJeoj3CIS+r0A5
 GyIN8/K5yGgqqYptI/OPlVLZWygZrGNNlkJUpzR8cCF+SRrTAUTPZtSaC76aLL2/qeWnSe8uMjE
 uIqQbxoeTmiA87axeSzPpZdbhLRVGgjojnXUXJOieys1SfvpFGxLzIhlBXCwufWvtYv8L67J3EF
 KolWhSGsygDHH4R12Zb2UYDZz6Bxfq3cqexYSjZa7vmNHWHUYZasdnrg5iSF80ZKTaxl/eW6l8H
 ox+3ItIqYY7/ZJbEAzadEZfpiA42Z+la4otS0kFcwrxVBLJQoaYU/268HQyFG+7e/SnFVEUDHWg
 S7Po6/p0eFWJjq4bW6J4Z37aHyzdtR7g+BG8gji8J6HSwKjcxA6gMUC9CL67SSawiI5y459iv6T
 OPiPvPcLIA9vp/A==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113019-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:david@ixit.cz,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 010E967F7BE

From: David Heidelberg <david@ixit.cz>

I'm currently pairing this with cs35l36 codec.

Currently this worked only because the cs35l36
codec mapped both DSP_A and DSP_B to the same hardware register value
(asp_fmt = 0), which is inherently DSP_A timing.

The CPU-side AFE is configured with qcom,tdm-data-delay = <1> which
produces DSP_A framing.
The codec format should match what is actually on the wire.

So I'm pretty lost if I should go fixing cs35l36 or sdm845.c.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 sound/soc/qcom/sdm845.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index 0ce9dff4dc525..7bf22e24b193a 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -376,17 +376,17 @@ static int sdm845_snd_startup(struct snd_pcm_substream *substream)
 	case QUATERNARY_TDM_RX_0:
 	case QUATERNARY_TDM_TX_0:
 		if (++(data->quat_tdm_clk_count) == 1) {
 			snd_soc_dai_set_sysclk(cpu_dai,
 				Q6AFE_LPASS_CLK_ID_QUAD_TDM_IBIT,
 				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
 		}
 
-		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
+		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_A;
 
 		for_each_rtd_codec_dais(rtd, j, codec_dai) {
 
 			if (!strcmp(codec_dai->component->name_prefix,
 				    "Left")) {
 				ret = snd_soc_dai_set_fmt(
 						codec_dai, codec_dai_fmt);
 				if (ret < 0) {

---
base-commit: ec039126b7fac4e3af35ebccaa7c6f9b6875ba81
change-id: 20260613-rfc-dsp-b-to-a-178a3c0ae7e1

Best regards,
-- 
David Heidelberg <david@ixit.cz>



