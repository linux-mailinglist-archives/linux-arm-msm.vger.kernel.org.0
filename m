Return-Path: <linux-arm-msm+bounces-101147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KA0bChYjzGnHPgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:40:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BD2370AA2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:40:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 24152304B2CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7DAC3DA5B9;
	Tue, 31 Mar 2026 19:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kapqWO13"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB3B3A8725
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 19:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985984; cv=none; b=fx7qk/OxbxmY8lVwRiVDpSyeP/XMgRQu45oRcey+CtdqbC8+jAV8JxvWqdFURzz9AIPC/k+2rme3uNvu84+NJoWvIvdsdUp4991musx1Cx95IAlJVEXeR+O2wmbdxLJaiV4eEhTqULRkoDVqM5835sPavONEtg2z94p9ptha4Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985984; c=relaxed/simple;
	bh=WAt23p6wWxkOHhZf8zSAdYtlsqgQv1/kNzdA1zObNIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HQiD6ECYOAPrcVsglZd/4Mn0ORE41KnqgdNR7qFFMV9saEdd7uKRNd/kIErmKbgylYzdgE+IiiZGknhlNlD48vMp2fpvuOeg2858fK0C3A1a86tn9BxwajL5zydiU25C2kt7mK07Bh7LylF17SxXhb25lZ1K2631b+KUD7XCsTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kapqWO13; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-509006c070eso45444921cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 12:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774985982; x=1775590782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lu8+HYnN9QA/s0Ocg9WNVxv21EjyZNWyGCNCp1OiYbo=;
        b=kapqWO139NWsWMzQtJxoJk4iUEoKwe8YYRJgQiQonw26bUxkK+ggEpeCKwvDgX9mwL
         JFSXlRAe8TqZlSI5REiGotd9lQGK5/2GODMWX6wY+2Fa3X8mvDlRt8l77kwffjkN3Xhy
         im/3vuit0A80N2z7FU2jVPCl3/5aRGq6AfgkveZHvn29IsThLbonaekFTLbX3XUDaJim
         KT1cIDLbEkfi7XUlc36Wjhw0dVio2OY/7gHaa6WZ08XJLJyCrCo4h0bY5KyovUq27qOB
         9DCp/W4HvOTnvF8tG1ssYYJjZ/5Sd/4L+LRhkZD5JNUlY9XN3AvDiHAUhTIdKyQZ2ez4
         MzLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985982; x=1775590782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lu8+HYnN9QA/s0Ocg9WNVxv21EjyZNWyGCNCp1OiYbo=;
        b=DBgJ1zp9+ZC8KDvstRqmWzdiuwYHKLG+zAaonfgHja8HSnOvCYFn8I3T7Fj4P1tVsF
         0V5kKEz6qfcqC4ku4VBlEgqqLyx2B5POm8iudM5dhRzaQ0EjxvB/A4DZWgKKqlMz9TNz
         Iqscc4uGJzJlK/ZWiF1s7mwNljiS9DNQDztityCije74sOvSl+P0bj1y0gajI/rNvNYv
         ScTowEEZqw925JJzBNq2v7J89ieGuuK4VbUObGiSJTlR3DeMMkYH8iD0EG4cXL2x2Qcl
         oQm/WSzMG7h3ejtvxMpV37i5e5U6RwyLAPESexECyo1JOSJn2d+wJlFAMJKAslu0mawC
         RNkw==
X-Forwarded-Encrypted: i=1; AJvYcCUy8jZ2Pw4rxz/Ujw8+Nliv7B48pmeG2IflQdM6Cnr0IAsOYnIr0mdd31e9OeGc0dLT7KTJnkqHkqFbRxOA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7Q0d50Yik5W5DPaN1jNyF65CjgDrG0me2xjRYRM9S8KVDROMY
	iHNYtWDED4mulsi9No0zJUNa0qVersxkmKP8gFrP7BkYheGjQqZ2IOcG
X-Gm-Gg: ATEYQzw8as4D+RDQ9yt3Km09WqGWSjcRBJw78FmGNRNobreYkkJ4cFl+w1WXifaTojO
	GG4U/8rf0G9UJSmHteEIiGoP/Ljh9KOGVas8MpK42hRGb0VQl638s+PmyYVDU6NCpNM2eUtL6e2
	oPcluAjGnuDlBAv1SumIByKBWdm+7ew/I8cjOk6UZBhf6ZuugMaziJHuQx577gYjnvmliZMhOQD
	tm94eO8+SNm6oPsQMp3KRx2LP95/906llE9Esh/31qxiNseMp1NdcibRsIG6sWV1bUMWYvg45I7
	pvjxV2w7p4lxBly4FIztGL4TM51/IbxXUctEB/Ap8PqkeKoX+KaRV8hak4uTeapTAhggTTqBQPT
	14zDaNo+PrJmXxgjHAKvsYmM7fJDmL1f08FflkbZqBxBYwZ5c8mGiuS1ftVIuWkfJcg5FzMfgEk
	yMXdb+7Rab0Wn9ART2E1CAOWRw
X-Received: by 2002:a05:622a:2ce:b0:509:4e59:7f2d with SMTP id d75a77b69052e-50d3bbf691cmr13111461cf.28.1774985982384;
        Tue, 31 Mar 2026 12:39:42 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2e3ed5csm109995381cf.27.2026.03.31.12.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:39:41 -0700 (PDT)
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
Subject: [PATCH v3 11/15] ASoC: qcom: sm8250: add support for INT0_MI2S_RX and INT3_MI2S_TX
Date: Tue, 31 Mar 2026 15:39:35 -0400
Message-ID: <20260331193939.40636-12-mailingradian@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101147-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 07BD2370AA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The INT0_MI2S_RX and INT3_MI2S_TX ports on SDM660 can be connected to
the digital and analog WCD codecs. They can be supported with the same
logic for other ports, but just need to be explicitly stated. Add
support for these ports.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/sm8250.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index f193d0ba63d0..b8f1c91725df 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -112,6 +112,22 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
+	case INT0_MI2S_RX:
+		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_INT0_MI2S_IBIT,
+			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(cpu_dai, fmt);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
+	case INT3_MI2S_TX:
+		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_INT3_MI2S_IBIT,
+			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(cpu_dai, fmt);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
 	default:
 		break;
 	}
-- 
2.53.0


