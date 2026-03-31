Return-Path: <linux-arm-msm+bounces-101145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MB0mCg4kzGllQQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:44:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B9388370BF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 414FA30EDB4B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 780F63E1D09;
	Tue, 31 Mar 2026 19:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZV3v1z34"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7523A0E84
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 19:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985976; cv=none; b=h5FPjVfxO/3Y4bXnL63yl298wpV+JeAkUGKsMm7uFJLG2hiheokOa8nj2n/nZLfijwf2pTtm3JMBOixwTE+IdZmxA1gxjtx+0NnMuuZyFk06VlWlO02yGzaWMBfR4M8mjj8ktj0cxALbmrH46hKmYNd/yEFJdCr7qdLIOS5cnz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985976; c=relaxed/simple;
	bh=NTLYLQFXzthunQAVwPc0tHdCrO0Rc+WOiGk7EDUWulU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G9LgJj6lVnBGtUpU8HxJv8mkQDZ9dfI1AKh/tYWMCkvMICo7QSSMDXvD29ZXzUtLNX6Aiu7ckkbkyZQdpKOKqTpxsDv1xbeSr+0J7Ujj/uSFmwB4dKO6I9oggaz8N+AYX8ccDXaMBVqmDQ9SNvErCrapjH0nIlQapvJZpixy24c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZV3v1z34; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8d0288d24f6so45895885a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 12:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774985974; x=1775590774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ko8pkaQ/h2+Vf8CzfWT1kqph029g9HoONI/ib77Rfy4=;
        b=ZV3v1z34X64Uua4psXDTZWKwgFkDKf+a7wjFnFdWB3rga4vaBIwFUmB9cU0vjCLTGw
         pj/Ynus3kkjH5r4bYTGW9yh+cc3ABOZcFbCxpigyTusZLI8PnEUZ6M6usInFR+BGt/hY
         nRTP6lupSuMUjYt5G/2DlgRma8w3OJloBjRCFJXQVV7jctcUa9bl0cyYLDvBSVT15ygY
         P1AmocTbAyQSP+6FPFRzcstSV2D4QXYkqAWqZ0P6mAtbwvWP/7v0dgiAxDLJeMROly0Y
         aFDf5JcQywTkBEQowrmIFif6EQbG2bXGJ5fjUtx6eDJeN+eJeZT7n6cIOorgoPncV6l2
         2Oog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985974; x=1775590774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ko8pkaQ/h2+Vf8CzfWT1kqph029g9HoONI/ib77Rfy4=;
        b=MBS2RF0hCJdeRDbtWV34ec4IVcUpozjIiCangbZWK7BKBjC25T/ut2WaBhlTTCjhcS
         ybCB6JcRb9+qEuQn8VAKGSX1rHa/98OBmv080XMkmlbS9BdeHm3O6ErxKtRjtPFAA5FX
         WDJMol9h5Yz7967cazbJmqVvTBJkQ2RHz2FphJhcOtuUqEJZ/AOinxd3Ac2rWTHtP1Sq
         gCafCt4QSSK8Kb2RBSFZoqG0jtojO/xmMkRvWKeOvoAtAnoVrVH/pwt5Zvf182GJRGmG
         i3Plb0+J7ly0/VHYROxjfG2aG9Z8cDUZiJNHLFxhSCDwWxMVb5IumP0lSbk1U2X/3+7m
         KdSg==
X-Forwarded-Encrypted: i=1; AJvYcCV8hZsxFrfjT2KcNr3hBIJus4h7Xp1XxEkOIHOvnS/LJuukAJVUG0fmWMry4M9LiMjbaTYZfIUlQsotfMH3@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk50EviqTpQ7GMvXXkYluvt64W1MzAkvtBRTmIKIWMmwT901aV
	cdh++GkAJQpGvCB9HYI+4ZxRPW85jKfPNfd6zgjpl4utiTqxPjoVwA6i
X-Gm-Gg: ATEYQzzoWk62iyVVgaT1cICAttVe/Mx1UAoQK09N3l6qPJtn9xp81elzVq4WejzGVoP
	yUo/jqcme655Z90Rste5OYGKr+Gb4xqGvKZEljSOy8qb1iP5/qy2xf15F9bYI8UUH369Q/6v0rX
	Hz4LH5SSg5y6w+fJpDIQWdOXPWBom+9c4y5cpYeajb2mRZbs2phTWqS2sZvxIgNZNLe9osi3FOk
	ROGzuQxlvRmv0KpcRGTRWfh3s2h/4yPKfejcdATU4ZRFAWymlJ27xXkN9yRw2Wi1jJy97koIoLX
	4QvJ1xl2dMnATIdwtcKPiiE7nSkgpef9Bx+cig70epWXrLKHRB7DuMxjfEe5CRQs/wHtNz9bywF
	Qn3YndasWmUFa1ps0V2HprNLm6IMjAjAMrExkhVKzyqQegPfq+XExS4eFeiXslSjVU3UqHKoC4x
	5ryeu1h2RRa3H3jCQXkIp3qlr8
X-Received: by 2002:a05:620a:459f:b0:8d0:38e1:4d1e with SMTP id af79cd13be357-8d1aa679b86mr657250185a.28.1774985973885;
        Tue, 31 Mar 2026 12:39:33 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d02803f2c9sm952299585a.23.2026.03.31.12.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:39:33 -0700 (PDT)
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
Subject: [PATCH v3 09/15] ASoC: qdsp6: q6routing: add internal mi2s support
Date: Tue, 31 Mar 2026 15:39:33 -0400
Message-ID: <20260331193939.40636-10-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331193939.40636-1-mailingradian@gmail.com>
References: <20260331193939.40636-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101145-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B9388370BF6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
2.53.0


