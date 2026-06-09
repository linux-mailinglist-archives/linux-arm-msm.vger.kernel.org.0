Return-Path: <linux-arm-msm+bounces-112249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rkrUOOpBKGqmBAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 18:40:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 429BF6627DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 18:40:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Y3+ekqDd;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112249-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112249-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9EA4F3072566
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 16:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A6C3B6BEB;
	Tue,  9 Jun 2026 16:23:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4833E3D9D
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 16:23:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022195; cv=none; b=cfA08L0DpRlorp9WcBR7Hz+D5RJfhY6Zkd2kMjup+bg0k24D5xYHpo9p81dCC7K1mXcRLynL24RCyYOssEvRIQcK/N2pWncq90GokWAEi7JOhdbNet62QBqefgFW++c0KqSsz/vnq+dAxBRSK6J1wQqNpF5rvjzpoVn6S48Tq9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022195; c=relaxed/simple;
	bh=tZzl0LSt5hWKjHWY0hRyxQWh/N8wup3F94zum0CMnlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TcutAHM9mpCaD2WxJhLkHY/1P74IydXUNzsiN7nj04o4GH68QDm8UlT/Us5XMfKp/A9wCgdsFugpp3xhkajAbsSPbDLqTnaQdq/NNqz5SNhBgflnF/uLXp7W3UL0xfqcAu3wPpWuf3ilmUoloEqW+OpZ87/Ey8AYG+eZKKZY6n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y3+ekqDd; arc=none smtp.client-ip=209.85.222.45
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-9638c832c48so2133310241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781022192; x=1781626992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/RwMIwkE5nM8F7dAjhZHrdIn89L9B+B3Bhy6t+lh+c=;
        b=Y3+ekqDdMRcrxLbSPuwdnZZ7YZ7Eu+NbTN8pJylhJ6kMG+02wHyLppQqY66sXuyYeM
         GL3kog9QfzU8RBJ65pbKNlO4CZ7i5ZkVfsYNX37ULh9h1CmhZxs5FBGa4OfucHwFp8PF
         xj27giFzPUyS5CpHDhNj1CDg98UNXHOV9GG7KQAkfJ5571N6lNHKDoNYrcACuOyiixB3
         U/neTVVNoJ6rf0xn8cH/BiBNkhuVMQrNXQtYOqjbWJuuXyri4+e9zS6rv7ZMofX3QY/6
         /Ghb/68Ul1oRmR1Grwi9L/5N7Dnko50zQpSI/6JWj3Fea7/CaWvxjOd2s8u0bGrFQ4Al
         BpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022192; x=1781626992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x/RwMIwkE5nM8F7dAjhZHrdIn89L9B+B3Bhy6t+lh+c=;
        b=IH/eQk1E6dwIrYsa0EJO1W4CfYXSpJGAKCNhzuoAuIdV9XSXobLy/I7MW/wUet7xDB
         6dqY6zKKxwEo5nCR2tn68GkmZzzjwqn7vPXNAqBYrT71TKBmPpcm15yPklcvZk5LfDWz
         Aa21iltP06I1WFARSpytDLtfsW9OP0jmqOdY8eqxVet5cIfFBNmRZBO9zDRgdsZgT7Hr
         Kh9sFhLZRM8XZNEjWXAC1Bmx4xksVXomP4BfabPNkXt/Q4rd66B5P5B1dHr9ggb5ez+X
         Z6471VZLSDMZ/MzonZpRVqH0xjXSeCyZyYLlWYzrhe+t+hIw7mvNzLwp57HDZ+ZZn0PQ
         d7HQ==
X-Forwarded-Encrypted: i=1; AFNElJ90tdGGKi3akCeubEdgtRkRgqwSyZb2Pm+4kqTZjuxvaWc1xJlpLbwM+0erp8vJo3GGAHrCW+944ufPmJ+8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+q2/KEUAVmGhU40duXV9f/LPwW47WkbEoa2SinKB9Ye+acP7j
	Z+MJFDe+FnBVFm9pkHaBhv3fnCRXjkUrGJiP19uWP3TUsc73ZHqwimDt
X-Gm-Gg: Acq92OGaO22KUHWHibzRPmYULe8/O8ZZ0mbqWA7os64f82xvLHNZdfmAn+h2kKCI566
	s5F8OvC8YHEJKqYCOvdYr/0tHVSYnmX98J/CYYTaYK/w2gw5sGmEFPz+PAUsMotUZODNcyo6D6G
	XHN9Ck/nTsL+9rXwuZOLVxKZs3egnrCN+HTsu9RwD0SRcJQ64jKjUJa0f6sBRLi5wdbS7cg3F33
	UBnMYhPG9niPqnPE1hJnlGVEKIKFDLyDJrIB4Un3CduQ12lDcaaqB5J6H+hY1XeHj1J/7749KP9
	ASvWqeOOf/T9zRPZljOsKafBc8l3/lRsHxBfhUn2FsfIfmqX2sElqhVQnYtnqRAurshtHODuTDj
	6JGG685HbDlZdkidCItdiwzOrhMoqecVEmlcWFt2LOnGxwDS5BVJ4CUaVynpX+Zovtki7x4RgfE
	V2BjexwG1JsBhOmbU86gffd0use1xbpT/2NGEHzA==
X-Received: by 2002:a05:6102:9d8:b0:634:d42d:15e2 with SMTP id ada2fe7eead31-6ff0725fd2fmr10705801137.26.1781022192234;
        Tue, 09 Jun 2026 09:23:12 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccdcc968sm220219576d6.22.2026.06.09.09.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:23:11 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v5 09/15] ASoC: qdsp6: q6routing: add lpi mi2s support
Date: Tue,  9 Jun 2026 12:22:49 -0400
Message-ID: <20260609162255.31074-10-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609162255.31074-1-mailingradian@gmail.com>
References: <20260609162255.31074-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112249-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:setotau@mainlining.org,m:a39.skl@gmail.com,m:vladimir.lypak@gmail.com,m:dmitry.baryshkov@oss.qualcomm.com,m:mohammad.rafi.shaik@oss.qualcomm.com,m:johan@kernel.org,m:kees@kernel.org,m:ckeepax@opensource.cirrus.com,m:kuninori.morimoto.gx@renesas.com,m:mailingradian@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:a39skl@gmail.com,m:vladimirlypak@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[mainlining.org,gmail.com,oss.qualcomm.com,kernel.org,opensource.cirrus.com,renesas.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 429BF6627DA

Add the ASM-AFE routing for LPI MI2S ports which represent internal MI2S
ports on SDM660.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/qdsp6/q6routing.c | 78 +++++++++++++++++++++++++++++++-
 1 file changed, 77 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
index 7386226046fa..d076c99f197f 100644
--- a/sound/soc/qcom/qdsp6/q6routing.c
+++ b/sound/soc/qcom/qdsp6/q6routing.c
@@ -127,7 +127,14 @@
 	{ mix_name, "TX_CODEC_DMA_TX_2", "TX_CODEC_DMA_TX_2"},	\
 	{ mix_name, "TX_CODEC_DMA_TX_3", "TX_CODEC_DMA_TX_3"},	\
 	{ mix_name, "TX_CODEC_DMA_TX_4", "TX_CODEC_DMA_TX_4"},	\
-	{ mix_name, "TX_CODEC_DMA_TX_5", "TX_CODEC_DMA_TX_5"}
+	{ mix_name, "TX_CODEC_DMA_TX_5", "TX_CODEC_DMA_TX_5"},	\
+	{ mix_name, "LPI_MI2S_TX_0", "LPI_MI2S_TX_0" },		\
+	{ mix_name, "LPI_MI2S_TX_1", "LPI_MI2S_TX_1" },		\
+	{ mix_name, "LPI_MI2S_TX_2", "LPI_MI2S_TX_2" },		\
+	{ mix_name, "LPI_MI2S_TX_3", "LPI_MI2S_TX_3" },		\
+	{ mix_name, "LPI_MI2S_TX_4", "LPI_MI2S_TX_4" },		\
+	{ mix_name, "LPI_MI2S_TX_5", "LPI_MI2S_TX_5" },		\
+	{ mix_name, "LPI_MI2S_TX_6", "LPI_MI2S_TX_6" }
 
 #define Q6ROUTING_TX_MIXERS(id)						\
 	SOC_SINGLE_EXT("PRI_MI2S_TX", PRIMARY_MI2S_TX,			\
@@ -320,6 +327,27 @@
 		id, 1, 0, msm_routing_get_audio_mixer,			\
 		msm_routing_put_audio_mixer),				\
 	SOC_SINGLE_EXT("TX_CODEC_DMA_TX_5", TX_CODEC_DMA_TX_5,		\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("LPI_MI2S_TX_0", LPI_MI2S_TX_0,			\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("LPI_MI2S_TX_1", LPI_MI2S_TX_1,			\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("LPI_MI2S_TX_2", LPI_MI2S_TX_2,			\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("LPI_MI2S_TX_3", LPI_MI2S_TX_3,			\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("LPI_MI2S_TX_4", LPI_MI2S_TX_4,			\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("LPI_MI2S_TX_5", LPI_MI2S_TX_5,			\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("LPI_MI2S_TX_6", LPI_MI2S_TX_6,			\
 		id, 1, 0, msm_routing_get_audio_mixer,			\
 		msm_routing_put_audio_mixer),
 
@@ -709,6 +737,26 @@ static const struct snd_kcontrol_new rxcodec_dma_rx_6_mixer_controls[] = {
 static const struct snd_kcontrol_new rx_codec_dma_rx_7_mixer_controls[] = {
 	Q6ROUTING_RX_MIXERS(RX_CODEC_DMA_RX_7) };
 
+static const struct snd_kcontrol_new lpi_mi2s_rx_0_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(LPI_MI2S_RX_0) };
+
+static const struct snd_kcontrol_new lpi_mi2s_rx_1_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(LPI_MI2S_RX_1) };
+
+static const struct snd_kcontrol_new lpi_mi2s_rx_2_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(LPI_MI2S_RX_2) };
+
+static const struct snd_kcontrol_new lpi_mi2s_rx_3_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(LPI_MI2S_RX_3) };
+
+static const struct snd_kcontrol_new lpi_mi2s_rx_4_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(LPI_MI2S_RX_4) };
+
+static const struct snd_kcontrol_new lpi_mi2s_rx_5_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(LPI_MI2S_RX_5) };
+
+static const struct snd_kcontrol_new lpi_mi2s_rx_6_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(LPI_MI2S_RX_6) };
 
 static const struct snd_kcontrol_new mmul1_mixer_controls[] = {
 	Q6ROUTING_TX_MIXERS(MSM_FRONTEND_DAI_MULTIMEDIA1) };
@@ -938,6 +986,27 @@ static const struct snd_soc_dapm_widget msm_qdsp6_widgets[] = {
 	SND_SOC_DAPM_MIXER("USB_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
 			   usb_rx_mixer_controls,
 			   ARRAY_SIZE(usb_rx_mixer_controls)),
+	SND_SOC_DAPM_MIXER("LPI_MI2S_RX_0 Audio Mixer", SND_SOC_NOPM, 0, 0,
+		lpi_mi2s_rx_0_mixer_controls,
+		ARRAY_SIZE(lpi_mi2s_rx_0_mixer_controls)),
+	SND_SOC_DAPM_MIXER("LPI_MI2S_RX_1 Audio Mixer", SND_SOC_NOPM, 0, 0,
+		lpi_mi2s_rx_1_mixer_controls,
+		ARRAY_SIZE(lpi_mi2s_rx_1_mixer_controls)),
+	SND_SOC_DAPM_MIXER("LPI_MI2S_RX_2 Audio Mixer", SND_SOC_NOPM, 0, 0,
+		lpi_mi2s_rx_2_mixer_controls,
+		ARRAY_SIZE(lpi_mi2s_rx_2_mixer_controls)),
+	SND_SOC_DAPM_MIXER("LPI_MI2S_RX_3 Audio Mixer", SND_SOC_NOPM, 0, 0,
+		lpi_mi2s_rx_3_mixer_controls,
+		ARRAY_SIZE(lpi_mi2s_rx_3_mixer_controls)),
+	SND_SOC_DAPM_MIXER("LPI_MI2S_RX_4 Audio Mixer", SND_SOC_NOPM, 0, 0,
+		lpi_mi2s_rx_4_mixer_controls,
+		ARRAY_SIZE(lpi_mi2s_rx_4_mixer_controls)),
+	SND_SOC_DAPM_MIXER("LPI_MI2S_RX_5 Audio Mixer", SND_SOC_NOPM, 0, 0,
+		lpi_mi2s_rx_5_mixer_controls,
+		ARRAY_SIZE(lpi_mi2s_rx_5_mixer_controls)),
+	SND_SOC_DAPM_MIXER("LPI_MI2S_RX_6 Audio Mixer", SND_SOC_NOPM, 0, 0,
+		lpi_mi2s_rx_6_mixer_controls,
+		ARRAY_SIZE(lpi_mi2s_rx_6_mixer_controls)),
 	SND_SOC_DAPM_MIXER("MultiMedia1 Mixer", SND_SOC_NOPM, 0, 0,
 		mmul1_mixer_controls, ARRAY_SIZE(mmul1_mixer_controls)),
 	SND_SOC_DAPM_MIXER("MultiMedia2 Mixer", SND_SOC_NOPM, 0, 0,
@@ -1031,6 +1100,13 @@ static const struct snd_soc_dapm_route intercon[] = {
 	Q6ROUTING_RX_DAPM_ROUTE("RX_CODEC_DMA_RX_6 Audio Mixer", "RX_CODEC_DMA_RX_6"),
 	Q6ROUTING_RX_DAPM_ROUTE("RX_CODEC_DMA_RX_7 Audio Mixer", "RX_CODEC_DMA_RX_7"),
 	Q6ROUTING_RX_DAPM_ROUTE("USB_RX Audio Mixer", "USB_RX"),
+	Q6ROUTING_RX_DAPM_ROUTE("LPI_MI2S_RX_0 Audio Mixer", "LPI_MI2S_RX_0"),
+	Q6ROUTING_RX_DAPM_ROUTE("LPI_MI2S_RX_1 Audio Mixer", "LPI_MI2S_RX_1"),
+	Q6ROUTING_RX_DAPM_ROUTE("LPI_MI2S_RX_2 Audio Mixer", "LPI_MI2S_RX_2"),
+	Q6ROUTING_RX_DAPM_ROUTE("LPI_MI2S_RX_3 Audio Mixer", "LPI_MI2S_RX_3"),
+	Q6ROUTING_RX_DAPM_ROUTE("LPI_MI2S_RX_4 Audio Mixer", "LPI_MI2S_RX_4"),
+	Q6ROUTING_RX_DAPM_ROUTE("LPI_MI2S_RX_5 Audio Mixer", "LPI_MI2S_RX_5"),
+	Q6ROUTING_RX_DAPM_ROUTE("LPI_MI2S_RX_6 Audio Mixer", "LPI_MI2S_RX_6"),
 	Q6ROUTING_TX_DAPM_ROUTE("MultiMedia1 Mixer"),
 	Q6ROUTING_TX_DAPM_ROUTE("MultiMedia2 Mixer"),
 	Q6ROUTING_TX_DAPM_ROUTE("MultiMedia3 Mixer"),
-- 
2.54.0


