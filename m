Return-Path: <linux-arm-msm+bounces-105497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDFrOJbH9GmMEgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 17:32:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 744864AD957
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 17:32:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65217301DE34
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 15:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 461D43CFF64;
	Fri,  1 May 2026 15:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sbUVIfZb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D823CF69C
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 15:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649547; cv=none; b=FdjbS3DCj8S/xQpucwqDZ0Lkzub766o0HnuyNp++/k+/1V6n29oHNNZSKrTERJnWNsHNF0azjnlZpr2awz37pXocGYkOIjGBKTsxDz1ZpsADeuGyz/gOEzogdFINW2azTPIZB9xeDDwSWa8sudZpC3OvU0Or077isJkKstHdTkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649547; c=relaxed/simple;
	bh=i6n4kgYlK/kQHPEe7+5DwAlZeJEwIPoycv1dqqBd5II=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ESlRBR86G/iZaAEhVtBvMvtNJ9V7/LITRq9mg8YUkqZ0c9atvP4DFRzu7TgHzL3MnDFQqUaX2ifb3up7yHzjUvWo5W+iQEv/IzYctc/TwQ4XSGjUWuHFvFzNN13MxMFlZgmYVM/4IaPr/lJ9WGiohnf6TdmJ1C7WhkKkfY9h2YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sbUVIfZb; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8d67a483d3eso230246685a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 08:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777649543; x=1778254343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BgmKodKO3BKZ5SGeQ+n3wh4X6xMoeU7XIti8CgEQnWk=;
        b=sbUVIfZbyitC/FUiyqErcl4TaYG8Q/G5l3eOg7a0SthEPQQapX08VabViUaz6Ao90C
         ALDjnwM1ggQfQC/tne7pRbxgrdyNWvnaB1FKbhyt3xQu+jEQwO7QsYdUa2kN1MzG39LU
         mpJimH1uZAf5uLqko26oV9TMR7urSkrACOSQTxOYmN64YUSST5JRB+08sNmcEU9/yzyb
         G+SsxuwAmbY0Ajmtso98bZhFKovOV5Dce8/e7/lX7MqzNSWI5llK0Xw2lguukWeQKCic
         z7mFl5dZPbky7gSFcxo101uwjubTrnaMwiKcUDJa7CgyA4JzO3DAw+9e95ilyRtUmrNS
         xnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649543; x=1778254343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BgmKodKO3BKZ5SGeQ+n3wh4X6xMoeU7XIti8CgEQnWk=;
        b=ZFTTIgqh2cTtaBaBWYPWQoJSzbdsXemCLUF2Zx1VlzgjSvrvYsS/GQ335JpoYGds/R
         KLjyk1ifP5fD2XVW8LinO+4eagwZ6gokXabfO4Xc0jQIQo9vyX+WFMx66kpRjqHXmMNR
         VT5IJSLzRKhi8u+WDabwAXbnnMGEYwL87ZiRd2RKgrwLL/xUHWt6fGGzC/FgMT6XBA+J
         dz6bparrBV4jwsT3I1jdszeWsgh3M0ANDMf6dht45anZgqqOH/gTsuT73TWn6lcR9J8W
         uz4P+X+gcBorDg3db2buacn7GN4ldtA04QjEZTvxUgFAc8C6nO806XL8QrBMVmol8GRz
         SD1w==
X-Forwarded-Encrypted: i=1; AFNElJ+JpKKtq+RTH6s0/WFPO7+e+42ORJF5Lu0ldRiXuXZ64yTVviid1myw+Uog93M4jrv3K7LxZYCNSMxKJ+Oe@vger.kernel.org
X-Gm-Message-State: AOJu0YyO8rc1WssN7ZNcHVTF4ljHpF2XIcipWC1aCETSeEFnTtqy99Jn
	t/USJMTkr1qd4eotfaypi0Cd2USRLWce56OefXMOSNfoK5L2S46tIKqH
X-Gm-Gg: AeBDiesA14SuJ0Jtz4rnxJNdd3tqM845wmpwMCoAqPIZugkn1MNQLzR48Xu6XJu5wWv
	jRDBcY9UBKbPSW+NU20DmxHzktwDbAr0yR1LmUOaSOEMC8xzIyoTEJYT32rXpjJupnd+hBH5CUx
	qsv0eJLPNs6TE/GPD9PwooKckb0LPoaXWZ4Eu8UoVgjD4rFC5sVaerzFDOoTQBoCgLW/uTWVtDd
	fKGlIjIpFcn7HOfos6V2jH9vDjBOBddOHwNwUtJwbQacD7HKa7NyXaZ7BqXtPjtguqXRKAR1eAK
	fTfUQ2CO5RmyuJc/8yalHe7tY104P3Z6AsWH93yF74AJatVE/rw45/R5iqv4Bg9mzMMZXpO0i9I
	0k/GZ1KYgBYxhwuuedmmLksRvcp+CvdSW06cVPhIm49/DK/v5yJjtRulsiXyN4jG5i9lf/bnvim
	oTOHj62bJZbnFjuLlhpXrhD6W+ydH/b8LvNqfX
X-Received: by 2002:a05:620a:1726:b0:8cf:da76:58ea with SMTP id af79cd13be357-8faafef903fmr1157541085a.25.1777649543538;
        Fri, 01 May 2026 08:32:23 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc29a7a627sm194432885a.17.2026.05.01.08.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:32:22 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 09/15] ASoC: qdsp6: q6routing: add internal mi2s support
Date: Fri,  1 May 2026 11:31:22 -0400
Message-ID: <20260501153128.8152-10-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501153128.8152-1-mailingradian@gmail.com>
References: <20260501153128.8152-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 744864AD957
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105497-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[mainlining.org,gmail.com,oss.qualcomm.com,quicinc.com,linuxfoundation.org,kernel.org,opensource.cirrus.com,renesas.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Add the ASM-AFE routing for internal MI2S ports.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/qdsp6/q6routing.c | 78 +++++++++++++++++++++++++++++++-
 1 file changed, 77 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
index 7386226046fa..cfb953700f14 100644
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
2.54.0


