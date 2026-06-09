Return-Path: <linux-arm-msm+bounces-112251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hjkHH+9BKGqqBAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 18:40:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F396627E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 18:40:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ara+ebIc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112251-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112251-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CDBC31D419E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 16:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F06513B6BF7;
	Tue,  9 Jun 2026 16:23:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56CE3F8893
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 16:23:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022198; cv=none; b=SsdtDCjOH7eA6KGp+d2cfBt/Tirb3Om9SmrAOv2hOGOVakGEFbKC2aCUlE5ZUhCxJK7oRQr0EdkpgNe07hXV7D7JS/daWstrJsh6OWuJRp0/yGUT8bMgD4HM4soCTMlP+h76xZ8/3Tf2O4R3GMRBimrYujgrToShK63terdkH8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022198; c=relaxed/simple;
	bh=5RJmdsszUwLf4aDp9kqAY1nEgmpwmhr4v8CwdairNGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hw2YGrIIt3rsleO4Pq+XJBuWUsSSeBR7oFAifGhy++K7PQI27NJacIjD3+zdZxWNDilfiqiPbgEzB2aP7Hb7Rft+b3rfzl6SWcZ+XlKvNJ9Q8YRbhx8OTHjnZABG+J8WJxUfq2ucPqbgracEHi1XHow6IcaE2mM5p/jbRNispfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ara+ebIc; arc=none smtp.client-ip=209.85.222.172
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-91574384cc2so658273985a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781022196; x=1781626996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gbMh7js/t00A2OiKknYuR6CQAso5EMSHmQD8+7uhBQM=;
        b=ara+ebIchabtqoFhkWbIlvVBzv0Qq235kwuKx1CET1E7u7LPdoC7RTFJb8BZqBlih9
         l5ZW9bmd5UPrGpaWOH9olPsUhTW27m5CQhBEigDEowjpfVHNzKAeYo6x1UXPtmfXXShH
         +KMjexyks9k6fCQHdud4uL33Q3Hm5QHS8RoSmmODQCOCQ2oCMBbW3r504AEsQM/qE2k2
         gpyrZIX9H7yXdOH0q0KrafeLSHgJ87Fy0BZnvVSwnjpER7Ea4rpVAc7MBw5Biepgi8Sr
         EKRMZWqP+P12k6VAMp8B9v46J3Ol5A0LvI8tyKQqyHh2pdqM7062xhbI61QpCfLvpH0J
         yprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022196; x=1781626996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gbMh7js/t00A2OiKknYuR6CQAso5EMSHmQD8+7uhBQM=;
        b=gLKoUFsWs0UEVoKE+Urkt8zIIf/eiQ7V7cjJYf574BkyNvqfb0BDPPBd7T6eLJO2A3
         sci73RAE7/f6IxEoW8vjvPdFGEiRq5u7VKq1AliBmHXYC8YiloVSocTBbSVq/4FfSs1v
         urqyJKf6CLKW/zbd6WIsgh/lBqVFHGSvObvFjs2o+qSKEjycCwHt1VgJwcq8yPdt9igm
         VZX6Kn7U8Lzc8tzC56rgP++9RiySX0ShOfC4zhT62rT05FiosgqGPd2aNbnSeqAOoFGD
         GHknkw8NzgEsNRcp93K9OE9RKAfFTVodfzGmH1sia55qDEOHJhxG9vudCggOUGaJtOzI
         wgGw==
X-Forwarded-Encrypted: i=1; AFNElJ/TPqbsKX/W4nlvy55fojvm1LpRoTmSndhhFignF+sqcwnyHBU6e24U/pVdtskuGjWkIZpMnX1fL4hsPOXh@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq7yE/l8lZFg3+z2Oi69JOFUpc3Oi0A49ioVf4PZu4bFMw7MZU
	Na8GnTwDJ2OTsREmJFJUrPTSal2sSnXu1eZcPmJa4s7LEofgCcT+Q05W
X-Gm-Gg: Acq92OED6TxD0xaWZR+ydTHSEXytxzyBoRmH+FYTLA5uDC+vJJ2KSjiJ0UD/tAe+YSh
	u93zCpGSF9lYAdPElFVqNuGf+2+g5WqpDgfQ3RiJvVaoYd9KsY9MwgyvJrEUcxQDsZ0GENJaZcs
	gjWbXFw5FxteLfRWLzvjAJcUZVomki8VheXcsFWm2Gi5e5G0E1fK7FLG4n6MAnC6bW5Ge/711EW
	aAB6rRtnzKn2IWWwuni1tPhTm/vQNs8G/l9zGr4+Nbp8/DorInbPrFC3rCLPCg+6FbNqQU1lBuc
	VRAxHEDc/JBhm41YG9HTc6KYV7Bvfmi0Itsoy9QngBO5e3cXhy6XlDY/RdrxSNSQKaeQzQW1a5i
	uagpsTjDkhmWqMI4aRJ3WDscnvEjAcJ44f3Vgi8wblLYtJeUA5psNPaWl5bom+sCB1KLI2xTdtM
	O5ynjjQ1wZnsAsYxritCdokyEtwzt5CO1KHfsj9BTQmupqlYEW
X-Received: by 2002:a05:620a:468f:b0:915:9fba:8794 with SMTP id af79cd13be357-915e822bc64mr519249685a.6.1781022195649;
        Tue, 09 Jun 2026 09:23:15 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a00840dsm2345045185a.1.2026.06.09.09.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:23:15 -0700 (PDT)
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
Subject: [PATCH v5 11/15] ASoC: qcom: sm8250: add support for LPI_MI2S_RX_0 and LPI_MI2S_TX_3
Date: Tue,  9 Jun 2026 12:22:51 -0400
Message-ID: <20260609162255.31074-12-mailingradian@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-112251-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: D3F396627E7

The LPI_MI2S_RX_0 and LPI_MI2S_TX_3 ports on SDM660 can be connected to
the digital and analog WCD codecs. They can be supported with the same
logic for other ports, but just need to be explicitly stated. Add
support for these ports.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/sm8250.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index f193d0ba63d0..1952c599e004 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -112,6 +112,22 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
+	case LPI_MI2S_RX_0:
+		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_INT0_MI2S_IBIT,
+			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(cpu_dai, fmt);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
+	case LPI_MI2S_TX_3:
+		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_INT3_MI2S_IBIT,
+			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_CAPTURE);
+		snd_soc_dai_set_fmt(cpu_dai, fmt);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
 	default:
 		break;
 	}
-- 
2.54.0


