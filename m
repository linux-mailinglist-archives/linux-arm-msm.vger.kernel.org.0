Return-Path: <linux-arm-msm+bounces-105494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAYwFYbH9GmMEgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 17:32:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A53564AD923
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 17:32:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43CEC302E79B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 15:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EA5D3CFF5A;
	Fri,  1 May 2026 15:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lgZTrW6D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93F93CF678
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 15:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649510; cv=none; b=trt749E5BS71ET4Y+uKIJf+s+7qHea1WBO+6kQIQ47M12/eO4Ftpv2KlgUFRdNV9Tl/zHgNzNGXSQUD6PG0T+lPsBCicr3gs2bmBJYTObUbHSfqeZGWTnu3/+5/3D1apa1wi03LFsGGbxhjbwgojLCPQ3YKQMdWyVBBRYjzHUwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649510; c=relaxed/simple;
	bh=G/s+y93B3VbxxbXuxJ8DNAXRrp8SJiVZEcWWP2z/wTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ow/9lX0VlZiMdRKGcgAyf5YvFo0oG70ZpN1zLPxRfo/Lo1zuMK7VmGNI4sDkJ6crGIVTlqnXLuRwAIav2kGrLoH6g44nAMclhGNuXxpLhOZWv6gFv/e7mPr/FNcqcOFW8xwt3zpXm5zelsjhEstC1SRG+f+WDle5bYt1Hjxl96I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lgZTrW6D; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7de7c57b52cso1672476a34.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 08:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777649508; x=1778254308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0MHNLJO73RcwFspMcGaCjKGm8pPZRWJ1o/rW8cSDca8=;
        b=lgZTrW6D59WrjEdAwam3n/UTfZLfYWC5ZBORCZ5s3db4wH04j8e0Rq2rXB5J6JK7Mu
         ucGh93kblHfOKFQeDzEtk7mdxuW4YeemZnKKTYcTcSeopak4z7bGVrMMtTCrflSbcew7
         L/u0Yc7iJ1hDrIrWML/DyOt1YyJBz0PLnCn7JU5rgGxwHC6YkeDLGk7mqWIMarYwKlTX
         qBl3U0eU/kjnpC28GJJnC3aDQ+BKgi8yRQ8/wjC0lMCtZhy+tNh95UiBJb7ZcsnfueP0
         k6UXaWtKJwTxR6L4WW3jbiFzaoal7I6t1Rk3Kj0OQGi7ykoO1Vvh6DJ3UpngBqIziDnj
         KvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649508; x=1778254308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0MHNLJO73RcwFspMcGaCjKGm8pPZRWJ1o/rW8cSDca8=;
        b=XHrsY6qpaz9YjNFCsmVN0Qyg90a2HJfvNX5ynx8iFtdayS80TaixhuiLPLTn2nAydV
         AyCDPyw/Flse870oLtgYl0tLNMyRMTeRdKtMvntYBt9e67HX+7YP/P8SAOiaj3f1DlhR
         kHTlM0iSUbCA8rQ9LWF0s8kc93MLz7YFGUj+RFkHSezLfLA/paoPzHXDwb41X+y0NxFd
         7lZ9VlNv0uidD92ZzfiASn4uLpFkN2lCUvE2bOe47mHcgL3YzuGqlVayl5zHPkhdSuDb
         OZp5MuvWi6+TWNQLyD20H1YWjjeafjaDogeRlE018fk/CRwi4+HQaIhQKfYC4Pv/UmSI
         +DJQ==
X-Forwarded-Encrypted: i=1; AFNElJ/sBF8A2qWH/tH95Ibf99lKXUQcCNb4D5+pFpVMGBUkStEMvlYdZEdvC21/T5lTy1HWR2phqO/kZjvwlqPm@vger.kernel.org
X-Gm-Message-State: AOJu0YzWBoh3Cr2bX/kF4HMuNd0hRG9+EImLEEcATgDGcnDGQYf8nFHn
	f3pPnxNk2OY4JL6c76fyLZfUFpKOZBk3jhPgE+Ej6d3MJcm3dVUoeKcz
X-Gm-Gg: AeBDieu2rgF5fjsliU+keZ+pNKWzb9NZW+mPFgrxCs87nNJuIu7U4TWtIr/Xcq88vj+
	NUSZ0iAydl1l9rjlu2ONk7UErP3HvSjAyc8nUgbohBR4L3Wn9szkm/Uzv2vQTApxMewpQO/Qj4n
	Q5OhAkYNh3TXPcVkmZ+v99Bpq6k4w9gCJxV7T/DgHS1pq103oGwX9AjH+xtm6+90Ce314RWKgwv
	CegOhkmnhsipH6cg1QSA4OdtId9G2kKKQ2su96GU2oqKRkM0NAjcWciTZLkEnAHwqcnKPg008Qw
	3cjb5bxcmnmekHWD6xswT9hzpJMG6mjz8QAROGfYy/bQWqf8LG1viliKdz8JtttFZnAFs85iO2Y
	wLrBacoYqT/27EmnroJtGcGHLOq/dRK7xKfNbl8AiKL82R2wMrDbzOwh9or6eqET+rbTMiUeq3H
	eiufkfAc/ei25Ga6s9Y3/GuWriQbSZnhCY5s92
X-Received: by 2002:a05:6820:2016:b0:694:6d72:9fd0 with SMTP id 006d021491bc7-6967a56709fmr4086741eaf.16.1777649507661;
        Fri, 01 May 2026 08:31:47 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2cd04c68sm189355085a.46.2026.05.01.08.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:31:47 -0700 (PDT)
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
Subject: [PATCH v4 06/15] ASoC: qdsp6: q6dsp-lpass-ports: add internal mi2s support
Date: Fri,  1 May 2026 11:31:19 -0400
Message-ID: <20260501153128.8152-7-mailingradian@gmail.com>
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
X-Rspamd-Queue-Id: A53564AD923
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
	TAGGED_FROM(0.00)[bounces-105494-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,googlesource.com:url]

Add the internal MI2S stream capabilities as specified by the audio
kernel modules and configure the ports as MI2S ports.

Link: https://android.googlesource.com/kernel/msm-extra/+/530cffa4cc977a348753831b163eb9d3302b954a/asoc/msm-dai-q6-v2.c#4597
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/common.h                  |   2 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 200 +++++++++++++++++++++++
 2 files changed, 201 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index ee6662885593..be693b53a4fa 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -7,7 +7,7 @@
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <sound/soc.h>
 
-#define LPASS_MAX_PORT			(SENARY_MI2S_TX + 1)
+#define LPASS_MAX_PORT			(INT6_MI2S_TX + 1)
 
 int qcom_snd_parse_of(struct snd_soc_card *card);
 int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
index e5cd82f77b55..7006071f45a0 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
@@ -668,6 +668,205 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 	Q6AFE_CDC_DMA_TX_DAI(TX_CODEC_DMA_TX_5),
 	Q6AFE_CDC_DMA_RX_DAI(RX_CODEC_DMA_RX_6),
 	Q6AFE_CDC_DMA_RX_DAI(RX_CODEC_DMA_RX_7),
+	{
+		.playback = {
+			.stream_name = "INT0 MI2S Playback",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000 |
+				 SNDRV_PCM_RATE_192000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S24_3LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     192000,
+		},
+		.id = INT0_MI2S_RX,
+		.name = "INT0_MI2S_RX",
+	}, {
+		.capture = {
+			.stream_name = "INT0 MI2S Capture",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     48000,
+		},
+		.id = INT0_MI2S_TX,
+		.name = "INT0_MI2S_TX",
+	}, {
+		.playback = {
+			.stream_name = "INT1 MI2S Playback",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S24_3LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     48000,
+		},
+		.id = INT1_MI2S_RX,
+		.name = "INT1_MI2S_RX",
+	}, {
+		.capture = {
+			.stream_name = "INT1 MI2S Capture",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     48000,
+		},
+		.id = INT1_MI2S_TX,
+		.name = "INT1_MI2S_TX",
+	}, {
+		.playback = {
+			.stream_name = "INT2 MI2S Playback",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S24_3LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     48000,
+		},
+		.id = INT2_MI2S_RX,
+		.name = "INT2_MI2S_RX",
+	}, {
+		.capture = {
+			.stream_name = "INT2 MI2S Capture",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     48000,
+		},
+		.id = INT2_MI2S_TX,
+		.name = "INT2_MI2S_TX",
+	}, {
+		.playback = {
+			.stream_name = "INT3 MI2S Playback",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S24_3LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     48000,
+		},
+		.id = INT3_MI2S_RX,
+		.name = "INT3_MI2S_RX",
+	}, {
+		.capture = {
+			.stream_name = "INT3 MI2S Capture",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     48000,
+		},
+		.id = INT3_MI2S_TX,
+		.name = "INT3_MI2S_TX",
+	}, {
+		.playback = {
+			.stream_name = "INT4 MI2S Playback",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000 |
+				 SNDRV_PCM_RATE_192000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S24_3LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     192000,
+		},
+		.id = INT4_MI2S_RX,
+		.name = "INT4_MI2S_RX",
+	}, {
+		.capture = {
+			.stream_name = "INT4 MI2S Capture",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     48000,
+		},
+		.id = INT4_MI2S_TX,
+		.name = "INT4_MI2S_TX",
+	}, {
+		.playback = {
+			.stream_name = "INT5 MI2S Playback",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S24_3LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     48000,
+		},
+		.id = INT5_MI2S_RX,
+		.name = "INT5_MI2S_RX",
+	}, {
+		.capture = {
+			.stream_name = "INT5 MI2S Capture",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     48000,
+		},
+		.id = INT5_MI2S_TX,
+		.name = "INT5_MI2S_TX",
+	}, {
+		.playback = {
+			.stream_name = "INT6 MI2S Playback",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S24_3LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     48000,
+		},
+		.id = INT6_MI2S_RX,
+		.name = "INT6_MI2S_RX",
+	}, {
+		.capture = {
+			.stream_name = "INT6 MI2S Capture",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     48000,
+		},
+		.id = INT6_MI2S_TX,
+		.name = "INT6_MI2S_TX",
+	},
 };
 
 int q6dsp_audio_ports_of_xlate_dai_name(struct snd_soc_component *component,
@@ -712,6 +911,7 @@ struct snd_soc_dai_driver *q6dsp_audio_ports_set_config(struct device *dev,
 		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
 		case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
+		case INT0_MI2S_RX ... INT6_MI2S_TX:
 			q6dsp_audio_fe_dais[i].ops = cfg->q6i2s_ops;
 			break;
 		case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
-- 
2.54.0


