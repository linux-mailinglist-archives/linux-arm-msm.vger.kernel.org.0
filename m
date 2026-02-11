Return-Path: <linux-arm-msm+bounces-92550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHIyG3nji2kVcgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 03:03:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E1107120A27
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 03:03:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CEAC23052377
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 02:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 994F22F0C62;
	Wed, 11 Feb 2026 02:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PEX+mrVH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8BF2F28EA
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 02:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770775415; cv=none; b=rrLm5zNeVqzz99ucKqbAA9h74tpO5Fm51+wFrKY+HG0uEzdY+thVclhmlcXJiLaF+eY34mXve917LRcnsOZlRdCTPEA7r59BYK+rCIQXZwe+JqCVkzLeVbSEjmBJvZtbAHJ/bDWy5ysUkKmVK3aTw4ypL4SpyO4KDZ3IVbrzVJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770775415; c=relaxed/simple;
	bh=FUwD9F8Iz5eo71Y2bnIIZAmmu2oxZd+6v2B/zGTonO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jKrYCwY5EojPLTODAj2Ka6BFJjqyve3OKH6tTjxmF4jnzSKwu0VNR9r/LCYe35dAWhzJrliXMbfPzHHewR4HuAO62yq9CFcqKdXJvsTpoXRWMSbaZvujyXj089Y9cLhjAOeM96hwuJezlsoatrNxx+hf4/jh5MCgJhzIFEb+ehA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PEX+mrVH; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8947e17968eso72975206d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 18:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770775412; x=1771380212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gt575dBNBRRhS9fBmhA5a1S0d5GWcSnTvUyNr2H8bgA=;
        b=PEX+mrVHdb5PyTxiNHn+QNTFce99LFq4kiRb4u9SoLu3pRC7i+O/sYN6od/z5rCgdG
         4uFLBxHhrQv9HLITf2lsRklV2U3g64Wvd0GDM+U4aLvcBtpETkAf9bUO9WtKDSDFCCQ9
         9hzZ5j8HgI7fhE9XwMx2OMhxa/umbnnLs03pWbk7FDsMCfi0/sREiujrIOTZgkQorQvL
         FKVD0n0gCRslqnTfq8SxK3XmMJzcj1fnTdWPaoSQLYSwcdTX4+HJgY09SufyjFoY7ksk
         0U+/c2+HY/B59Lrn7cjLSOHNFKMr9NGDwv/GqBvWVSZo5DVcVywIA4SAXTwD/eO4KWK1
         2UUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770775412; x=1771380212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gt575dBNBRRhS9fBmhA5a1S0d5GWcSnTvUyNr2H8bgA=;
        b=WEhbr2L4tDy6oMiKSMw7a2rmG1vyPi8alDuM+qaIEdQtNRTgibbDqpC03A/0lIMbqs
         oFdm5LZOyNVYHhBcKszxCdr2fGD6/hcQ5KfCwYUjAU6Hew+UhCnR7Ix5XxQ/7/c/mj3m
         qebhzYIB0s1x8S01JURUAzLoWnwjugtae9ZFRjiO8dwgEtyFwH0COwrPwBA6tc8p4Lbu
         HOG0lxy6n4ECcM102Q3EVUvJJWKXT1YDkk0V5KQd6cmElfSIYvisuDzOKzO7EDvOx5cU
         DnFfJovs/mepXtbetN3/By90CNY81tIHt4VFLgbAYHr+hcuqKXFQ1/fah8sdPAMKQ6pz
         bOEw==
X-Forwarded-Encrypted: i=1; AJvYcCVCNwaRktx4vZMAmGk9+0wLbiYG620E+hYtQTYNROv2Q2AU/rj3S9uiMjr8RH/JSi23TpJ2HbVvI6v2gUPW@vger.kernel.org
X-Gm-Message-State: AOJu0YxzQcleI43Oql0RvSOHOR308CP+C+PbqXFzdlDBWX655FDsEdj6
	Z82ZabGVbVWvWYmrhgtlQvvq1uF4/mCHufHCPjg1xKcu6d8X3aIs3p+Q
X-Gm-Gg: AZuq6aKKz6+AITb1sHI9NOkaMDoZDGxVgeX1HBTY6RXBhE67d1P2c33aHQKaLw/lpna
	PSCn+z6QmsY1aPZmD35DqrwdPf5NsaNp2x/GQZhDeLI/N+JToo6dcYC0lYdCNyBB0Yz4uxfWfL/
	ujhH6CKTC9frw1VZYGtto8RGu//MG/OFSxJh6UDLuOcpF/De5dRNJDyt/H91wgHMLZp1Tb5JzXL
	DIQBQJ8EWlb/Xpx83PCQ5Y5y8jp6zuWiPyF+55ns1Lkly828t+YDQPYbLZQmG6yXNKAG3ySQjTM
	qyDjF+1+aY00ojFMVm7yesXqOvN5h7BtIimvirh/8S5WXsKgV7duch+ccYtHQb6WYK/OKCw121g
	FgVS2MZZ/gEbvcdN7j015eppwZyT5kuJx1UtlpluczIy5+n3+ggDLYq+xFo8+M+uxjjXYbM02HN
	u0DSkf3ZHiVEYPgAZTm66UbgLk4Q==
X-Received: by 2002:a05:6214:1cc9:b0:896:fe42:e88f with SMTP id 6a1803df08f44-8971dbabf8amr2709246d6.61.1770775412360;
        Tue, 10 Feb 2026 18:03:32 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cca9b6bsm4006526d6.23.2026.02.10.18.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 18:03:31 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Johan Hovold <johan@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 08/10] ASoC: qdsp6: q6routing: add internal mi2s support
Date: Tue, 10 Feb 2026 21:03:00 -0500
Message-ID: <20260211020302.2674-9-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260211020302.2674-1-mailingradian@gmail.com>
References: <20260211020302.2674-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92550-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,linuxfoundation.org,quicinc.com,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[mainlining.org,gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E1107120A27
X-Rspamd-Action: no action

Add the ASM-AFE routing for internal MI2S ports.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/qdsp6/q6routing.c | 78 +++++++++++++++++++++++++++++++-
 1 file changed, 77 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
index aaa3af9f1993..f5d285c6590f 100644
--- a/sound/soc/qcom/qdsp6/q6routing.c
+++ b/sound/soc/qcom/qdsp6/q6routing.c
@@ -127,7 +127,14 @@
 	{ mix_name, "TX_CODEC_DMA_TX_2", "TX_CODEC_DMA_TX_2"},	\
 	{ mix_name, "TX_CODEC_DMA_TX_3", "TX_CODEC_DMA_TX_3"},	\
 	{ mix_name, "TX_CODEC_DMA_TX_4", "TX_CODEC_DMA_TX_4"},	\
-	{ mix_name, "TX_CODEC_DMA_TX_5", "TX_CODEC_DMA_TX_5"}
+	{ mix_name, "TX_CODEC_DMA_TX_5", "TX_CODEC_DMA_TX_5"},	\
+	{ mix_name, "INT0_MI2S_TX", "INT0_MI2S_TX" },		\
+	{ mix_name, "INT1_MI2S_TX", "INT1_MI2S_TX" },		\
+	{ mix_name, "INT2_MI2S_TX", "INT2_MI2S_TX" },		\
+	{ mix_name, "INT3_MI2S_TX", "INT3_MI2S_TX" },		\
+	{ mix_name, "INT4_MI2S_TX", "INT4_MI2S_TX" },		\
+	{ mix_name, "INT5_MI2S_TX", "INT5_MI2S_TX" },		\
+	{ mix_name, "INT6_MI2S_TX", "INT6_MI2S_TX" }
 
 #define Q6ROUTING_TX_MIXERS(id)						\
 	SOC_SINGLE_EXT("PRI_MI2S_TX", PRIMARY_MI2S_TX,			\
@@ -320,6 +327,27 @@
 		id, 1, 0, msm_routing_get_audio_mixer,			\
 		msm_routing_put_audio_mixer),				\
 	SOC_SINGLE_EXT("TX_CODEC_DMA_TX_5", TX_CODEC_DMA_TX_5,		\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("INT0_MI2S_TX", INT0_MI2S_TX,			\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("INT1_MI2S_TX", INT1_MI2S_TX,			\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("INT2_MI2S_TX", INT2_MI2S_TX,			\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("INT3_MI2S_TX", INT3_MI2S_TX,			\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("INT4_MI2S_TX", INT4_MI2S_TX,			\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("INT5_MI2S_TX", INT5_MI2S_TX,			\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("INT6_MI2S_TX", INT6_MI2S_TX,			\
 		id, 1, 0, msm_routing_get_audio_mixer,			\
 		msm_routing_put_audio_mixer),
 
@@ -709,6 +737,26 @@ static const struct snd_kcontrol_new rxcodec_dma_rx_6_mixer_controls[] = {
 static const struct snd_kcontrol_new rx_codec_dma_rx_7_mixer_controls[] = {
 	Q6ROUTING_RX_MIXERS(RX_CODEC_DMA_RX_7) };
 
+static const struct snd_kcontrol_new int0_mi2s_rx_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(INT0_MI2S_RX) };
+
+static const struct snd_kcontrol_new int1_mi2s_rx_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(INT1_MI2S_RX) };
+
+static const struct snd_kcontrol_new int2_mi2s_rx_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(INT2_MI2S_RX) };
+
+static const struct snd_kcontrol_new int3_mi2s_rx_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(INT3_MI2S_RX) };
+
+static const struct snd_kcontrol_new int4_mi2s_rx_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(INT4_MI2S_RX) };
+
+static const struct snd_kcontrol_new int5_mi2s_rx_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(INT5_MI2S_RX) };
+
+static const struct snd_kcontrol_new int6_mi2s_rx_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(INT6_MI2S_RX) };
 
 static const struct snd_kcontrol_new mmul1_mixer_controls[] = {
 	Q6ROUTING_TX_MIXERS(MSM_FRONTEND_DAI_MULTIMEDIA1) };
@@ -938,6 +986,27 @@ static const struct snd_soc_dapm_widget msm_qdsp6_widgets[] = {
 	SND_SOC_DAPM_MIXER("USB_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
 			   usb_rx_mixer_controls,
 			   ARRAY_SIZE(usb_rx_mixer_controls)),
+	SND_SOC_DAPM_MIXER("INT0_MI2S_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
+		int0_mi2s_rx_mixer_controls,
+		ARRAY_SIZE(int0_mi2s_rx_mixer_controls)),
+	SND_SOC_DAPM_MIXER("INT1_MI2S_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
+		int1_mi2s_rx_mixer_controls,
+		ARRAY_SIZE(int1_mi2s_rx_mixer_controls)),
+	SND_SOC_DAPM_MIXER("INT2_MI2S_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
+		int2_mi2s_rx_mixer_controls,
+		ARRAY_SIZE(int2_mi2s_rx_mixer_controls)),
+	SND_SOC_DAPM_MIXER("INT3_MI2S_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
+		int3_mi2s_rx_mixer_controls,
+		ARRAY_SIZE(int3_mi2s_rx_mixer_controls)),
+	SND_SOC_DAPM_MIXER("INT4_MI2S_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
+		int4_mi2s_rx_mixer_controls,
+		ARRAY_SIZE(int4_mi2s_rx_mixer_controls)),
+	SND_SOC_DAPM_MIXER("INT5_MI2S_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
+		int5_mi2s_rx_mixer_controls,
+		ARRAY_SIZE(int5_mi2s_rx_mixer_controls)),
+	SND_SOC_DAPM_MIXER("INT6_MI2S_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
+		int6_mi2s_rx_mixer_controls,
+		ARRAY_SIZE(int6_mi2s_rx_mixer_controls)),
 	SND_SOC_DAPM_MIXER("MultiMedia1 Mixer", SND_SOC_NOPM, 0, 0,
 		mmul1_mixer_controls, ARRAY_SIZE(mmul1_mixer_controls)),
 	SND_SOC_DAPM_MIXER("MultiMedia2 Mixer", SND_SOC_NOPM, 0, 0,
@@ -1031,6 +1100,13 @@ static const struct snd_soc_dapm_route intercon[] = {
 	Q6ROUTING_RX_DAPM_ROUTE("RX_CODEC_DMA_RX_6 Audio Mixer", "RX_CODEC_DMA_RX_6"),
 	Q6ROUTING_RX_DAPM_ROUTE("RX_CODEC_DMA_RX_7 Audio Mixer", "RX_CODEC_DMA_RX_7"),
 	Q6ROUTING_RX_DAPM_ROUTE("USB_RX Audio Mixer", "USB_RX"),
+	Q6ROUTING_RX_DAPM_ROUTE("INT0_MI2S_RX Audio Mixer", "INT0_MI2S_RX"),
+	Q6ROUTING_RX_DAPM_ROUTE("INT1_MI2S_RX Audio Mixer", "INT1_MI2S_RX"),
+	Q6ROUTING_RX_DAPM_ROUTE("INT2_MI2S_RX Audio Mixer", "INT2_MI2S_RX"),
+	Q6ROUTING_RX_DAPM_ROUTE("INT3_MI2S_RX Audio Mixer", "INT3_MI2S_RX"),
+	Q6ROUTING_RX_DAPM_ROUTE("INT4_MI2S_RX Audio Mixer", "INT4_MI2S_RX"),
+	Q6ROUTING_RX_DAPM_ROUTE("INT5_MI2S_RX Audio Mixer", "INT5_MI2S_RX"),
+	Q6ROUTING_RX_DAPM_ROUTE("INT6_MI2S_RX Audio Mixer", "INT6_MI2S_RX"),
 	Q6ROUTING_TX_DAPM_ROUTE("MultiMedia1 Mixer"),
 	Q6ROUTING_TX_DAPM_ROUTE("MultiMedia2 Mixer"),
 	Q6ROUTING_TX_DAPM_ROUTE("MultiMedia3 Mixer"),
-- 
2.53.0


