Return-Path: <linux-arm-msm+bounces-106196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLi2D/an+2mYewMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 22:43:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 907AD4E0470
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 22:43:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8063D3017252
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 20:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 154B53AF65F;
	Wed,  6 May 2026 20:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="kPerp9wx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB1B3A4505;
	Wed,  6 May 2026 20:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778100199; cv=none; b=p6hqGfjiNoRed/wzc9uz09WpGz0n7Nv8Ot3YUkM0aDW5Ubk+8VAnj3Fr46U8SXvuXNtIUlD3jMvPsGX8g6mmutQfXz6O1hO9nzGo8Cb9GURlJBDaOrZTN8IWIZ/oomuj/R0xdxcTtm0XWYGFXNfGFPc3jhU8HoYmG63nuQY9ngw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778100199; c=relaxed/simple;
	bh=2yxpfwbmtMhGY7toV/DOGqB0FSWoIMgpc7O5paD+vro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qzL4woCfLYt9v5eO8P9J+/OeNAKnSvck7WSZgCKMAghQfzumLwV0Rnfp+ve1kB4Y9LEoO5NvTBhyBPBidvQj9WZh1Z5Myk7TWfhSOY6CUf1jXx5RfhL2ZIglDKU0XMjKqgbfFQktAYzY56qZ5/g7xuP8TMUv/WNj7GQBbHbRFCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=kPerp9wx; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1778100194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XJvn4Kmgr3hYMJPtGfeLpjqkFYR7MaG36asqmMm2Wkg=;
	b=kPerp9wxHVJwxiQAqn6fQ1OIn2j97rvSrgT3dYiymEbjTwaWHB/EGAIN6bTznvfsmeJASy
	Edn7lWOIZLAmbhUL++3zgLTK3mp0xHY6UsY5ydP6j0PJLYw/3cTObQvBAno6o6h5l8rArS
	IlP9W4PwpXRua9rXTj2OsnU/jsscwZNXyA3FS1p0cMHUiglGiNuobIaXQmAMzdjw3OvHKb
	enZSJPEAAMKkHuveQLJxedTKLNboi+nO7roN7MMUPy1jen6fMdhzYOP6V3A5ihPn/Vyr+e
	cdkLl82S4d3WoVtJAiJSUS9mQSXLg1rRsdCBHEKyA9GnLlPdGP2zFIouZTBRKA==
From: Val Packett <val@packett.cool>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Val Packett <val@packett.cool>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Bhushan Shah <bhushan.shah@machinesoul.in>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Antoine Bernard <zalnir@proton.me>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] ASoC: qcom: qdsp6: q6routing: add Senary MI2S ports
Date: Wed,  6 May 2026 17:33:03 -0300
Message-ID: <20260506204142.659778-3-val@packett.cool>
In-Reply-To: <20260506204142.659778-1-val@packett.cool>
References: <20260506204142.659778-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: 907AD4E0470
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106196-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[packett.cool:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,packett.cool:email,packett.cool:dkim,packett.cool:mid]

This commit adds support for senary MI2S mixers.

Signed-off-by: Val Packett <val@packett.cool>
---
 sound/soc/qcom/qdsp6/q6routing.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
index 7386226046fa..55119cc33d95 100644
--- a/sound/soc/qcom/qdsp6/q6routing.c
+++ b/sound/soc/qcom/qdsp6/q6routing.c
@@ -68,6 +68,7 @@
 	{ mix_name, "SEC_MI2S_TX", "SEC_MI2S_TX" },	\
 	{ mix_name, "QUAT_MI2S_TX", "QUAT_MI2S_TX" },	\
 	{ mix_name, "QUIN_MI2S_TX", "QUIN_MI2S_TX" },	\
+	{ mix_name, "SEN_MI2S_TX", "SEN_MI2S_TX" },	\
 	{ mix_name, "TERT_MI2S_TX", "TERT_MI2S_TX" },		\
 	{ mix_name, "SLIMBUS_0_TX", "SLIMBUS_0_TX" },		\
 	{ mix_name, "SLIMBUS_1_TX", "SLIMBUS_1_TX" },		\
@@ -145,6 +146,9 @@
 	SOC_SINGLE_EXT("QUIN_MI2S_TX", QUINARY_MI2S_TX,			\
 		id, 1, 0, msm_routing_get_audio_mixer,			\
 		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("SEN_MI2S_TX", SENARY_MI2S_TX,			\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
 	SOC_SINGLE_EXT("SLIMBUS_0_TX", SLIMBUS_0_TX,			\
 		id, 1, 0, msm_routing_get_audio_mixer,			\
 		msm_routing_put_audio_mixer),				\
@@ -535,6 +539,9 @@ static const struct snd_kcontrol_new quaternary_mi2s_rx_mixer_controls[] = {
 static const struct snd_kcontrol_new quinary_mi2s_rx_mixer_controls[] = {
 	Q6ROUTING_RX_MIXERS(QUINARY_MI2S_RX) };
 
+static const struct snd_kcontrol_new senary_mi2s_rx_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(SENARY_MI2S_RX) };
+
 static const struct snd_kcontrol_new tertiary_mi2s_rx_mixer_controls[] = {
 	Q6ROUTING_RX_MIXERS(TERTIARY_MI2S_RX) };
 
@@ -777,6 +784,9 @@ static const struct snd_soc_dapm_widget msm_qdsp6_widgets[] = {
 	SND_SOC_DAPM_MIXER("QUIN_MI2S_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
 			   quinary_mi2s_rx_mixer_controls,
 			   ARRAY_SIZE(quinary_mi2s_rx_mixer_controls)),
+	SND_SOC_DAPM_MIXER("SEN_MI2S_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
+			   senary_mi2s_rx_mixer_controls,
+			   ARRAY_SIZE(senary_mi2s_rx_mixer_controls)),
 	SND_SOC_DAPM_MIXER("TERT_MI2S_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
 			   tertiary_mi2s_rx_mixer_controls,
 			   ARRAY_SIZE(tertiary_mi2s_rx_mixer_controls)),
@@ -969,6 +979,7 @@ static const struct snd_soc_dapm_route intercon[] = {
 	Q6ROUTING_RX_DAPM_ROUTE("SLIMBUS_6_RX Audio Mixer", "SLIMBUS_6_RX"),
 	Q6ROUTING_RX_DAPM_ROUTE("QUAT_MI2S_RX Audio Mixer", "QUAT_MI2S_RX"),
 	Q6ROUTING_RX_DAPM_ROUTE("QUIN_MI2S_RX Audio Mixer", "QUIN_MI2S_RX"),
+	Q6ROUTING_RX_DAPM_ROUTE("SEN_MI2S_RX Audio Mixer", "SEN_MI2S_RX"),
 	Q6ROUTING_RX_DAPM_ROUTE("TERT_MI2S_RX Audio Mixer", "TERT_MI2S_RX"),
 	Q6ROUTING_RX_DAPM_ROUTE("SEC_MI2S_RX Audio Mixer", "SEC_MI2S_RX"),
 	Q6ROUTING_RX_DAPM_ROUTE("PRI_MI2S_RX Audio Mixer", "PRI_MI2S_RX"),
-- 
2.53.0


