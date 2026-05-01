Return-Path: <linux-arm-msm+bounces-105499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOd/KJzH9GmMEgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 17:32:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A724AD965
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 17:32:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A517D301809B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 15:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C77F3CFF64;
	Fri,  1 May 2026 15:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qSgOxb7O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134552857EA
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 15:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649559; cv=none; b=mmZ8IBoFLBa2svRL1FiWlNJpiQdFs6yKKXWTLj6gTTMsYig1i+vFCOmkLVfmnGXmTSatwRLkVOzoTNkctjoDmgYSZB2RImYc3EWdfKgKprZplDGNULwp906LfNWmNIAiVMFDAliVZNmh6Xk2RMmKVoARMkyZgWR4UN4P25+uECM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649559; c=relaxed/simple;
	bh=3Oj2W0pEECsgpO0iuq6+ChxJG/Mvhptw7wJCXe06oJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U3DTebPs3bHhaxC89CdnLHyg1UT9qQp37ru34ZZT7oof0JWrEftKiTUIQNDlH0IQv8s7fMkiYeoSrpogFejchpibZyvAUxwPs6xcY52wGoF/kwNIsNGS+N5L7at8L8LhgnO4f6X+BaI3/u5Qo93Q6MLcx9KRxAH2BHSo4/ogJrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qSgOxb7O; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8ee7ffd738dso301350985a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 08:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777649557; x=1778254357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQUvsQIfk5vYZwtv1eo4/scSL1Ijdz6+kHawXrTWGjY=;
        b=qSgOxb7OFBeZpF/zDPUpZQ6Q0x1YVhtFyri/uySXo1opYd4dTqbnIhbIZi7V43xUNK
         Iva3YLeecUyCMVQMw3uyGb9welUsJj5/eUckJF49MPUghiQRmi6ekDoIsmPt8of6J7ak
         qLvkjAHW2v0ivyYuf5fTaquJjbLfM713YuT/cGDF+xc/bE4KA6z4YCWCokZX20OXYw4i
         NnKIkAEytsN9OGGqtaaY5qcN/X5v9/4FiMnogL02IRPwFjb92qISXrB9/y8hkfVbB9I/
         aJO+UAEn0Y7r0ctcHh6D0PDUJhMi2P7LYZ41xlCNFT/34aPLSafJK2HGWW0FrnV3IsKD
         0eJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649557; x=1778254357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RQUvsQIfk5vYZwtv1eo4/scSL1Ijdz6+kHawXrTWGjY=;
        b=MFfurmYkCiWc5w075SLenJnpLlYEME5c7UDiPDJxrYyZcBwLE0Nu9qrsiPvQbnPl5t
         E3/Xop6zzbgblhg+Ibo9wWmusjmv9bM6aUJLEYTYbDt7+0RS1YQCnr8rkF4qMhmeROCC
         1Zz45Zsj/zALEJxibbegiP8epPpDc0UnSfGqVwBQCU32vPidLJd3QIvo9An9Ve1siUoR
         oQ4Xw1DEBC+JTzE/LblHrnkaRh8IrpZqGQA/qFQhrehmf6Wekk5WNXbLjMOVMioN8x2L
         QuR+RAQGzHeavmvPMVRGtgjgKY1lr5oycCyPYkgeTFTWV9TcAfYoaUiOc+65UFM3kNMN
         F9kA==
X-Forwarded-Encrypted: i=1; AFNElJ9RrjxKFXU4TG+L41Pf3X2Y2sbmVPwreO9Y5/AH47i+PSztB/QJ/utWkjLtUevBUFcPgDBURWB7fVlrrMJb@vger.kernel.org
X-Gm-Message-State: AOJu0YwL/4s3vdqryZ5MjMnckZy48LEYFmGVK0SkJrgGAfVDUqA+C2A1
	t+qmR0aG42JQg1NsWSDjmTovXNSlAXo+H8dv+ENoH0axYzP7qm3dmTXZ
X-Gm-Gg: AeBDieuUXez7t2vOGUJzaBfutOP4mvZsc+2tjyB7UtSKFu9vPDF7kvcIKSDRB2aK6Rl
	6tDp8PsEsOVv1NcbkKE51mkFBK6CFvYHla6ImUrvGScOexHyfq5Psoh1iHXbDmT1UqEJgsMRpMZ
	rKM8Y/WcSUC4OxhkRGHiIRCTOsXWObkdcDQe2pIfjj7QXrCYMGqnh98DGAx4KRLrzRestB1k/Jy
	pbeo1joo/6ZaTYKFEwxB8/0XUVzAuZNpE/zussFa+w5RIPzFKFc1wI6D1Ij6hht27yWwhmM77qG
	NwfthlxaVXcDBdqY9WWGTDnzLVc2hKD7Hx2PgFBKebD4D9+JoYSnQlvRMjb9orlf6Mt3ydB2hIz
	zjEVCE1hTVU8gM/8uQ9hrQszj6smqT6+iHfm8WtH7XaXziVw6xbapkyayhF4xvVIxCONwX6WTwm
	4eHFihZ1E7T9X6ci6O8TN4KlmSOyG6LxDNBpuy
X-Received: by 2002:a05:620a:170c:b0:8d5:e63d:95b5 with SMTP id af79cd13be357-8fab872d2c7mr1002912485a.2.1777649556985;
        Fri, 01 May 2026 08:32:36 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c34a0d4sm186846585a.25.2026.05.01.08.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:32:36 -0700 (PDT)
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
Subject: [PATCH v4 11/15] ASoC: qcom: sm8250: add support for INT0_MI2S_RX and INT3_MI2S_TX
Date: Fri,  1 May 2026 11:31:24 -0400
Message-ID: <20260501153128.8152-12-mailingradian@gmail.com>
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
X-Rspamd-Queue-Id: 45A724AD965
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105499-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

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
2.54.0


