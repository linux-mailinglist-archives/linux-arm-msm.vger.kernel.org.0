Return-Path: <linux-arm-msm+bounces-92549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EOAM2zji2kVcgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 03:03:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A61120A15
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 03:03:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C8B5A3006830
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 02:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D97C92ECEAE;
	Wed, 11 Feb 2026 02:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fHx7OwkW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8EC2D63FC
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 02:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770775402; cv=none; b=LlAPdPlb8xPqG3lwFkBeGwRcmQglkEplnc7XK1gMjsMT5aaOSrnwlRq1p3v49AJjr0nY1CGfMJyAltYzttq1gznQIZ3nZJvwZ9h6ED7/H9rQzb7yF+Rejz++Ew+FbkTT8+Zem0HxGG7mnrl3ROjjA1knY6P5sxmzLyONI8QM6HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770775402; c=relaxed/simple;
	bh=5tRJaERsB3MX0Vg1OT71H28pfSmH/MMPXLkF26YbpNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jubvEDsSCq/X2v8V24U2K3Jb0neq3W8oZfxu6XgL3vyKeDE/HzH2ervLKrX2K1MozDAm6rWSsRlw0m8RyeJW43kSPscM/Lt2Z4jTxPeKEarOOKnBSdGoiP+TQDAe17CUHV6Iw9xMaHfqf+f5x5eFQ84KOq0ogiHNZ8CEfT7YhFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fHx7OwkW; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8c5320536bfso137931885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 18:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770775400; x=1771380200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GnFDrdEkwQYpE8O+rmjepmoD5Aaw7ZEA0lHf8+9NWg=;
        b=fHx7OwkWh8WeczGJdWbCYr9PEbNMyM/M/m8AskEhwf3LpqfKwRhfRpCwBzzNf/wNLQ
         NXw7B7xzF/1Z+REFkjFAqqAN8iwxqze2U5aMCrS/DasF3iiYDZ0OA0lg+RA7+zW5AJR4
         8NNN6A3TxoHDkzr9YWmJPuqBnoFEa2O3eb5RuWynYCnf1EsWYNerS9YDXws7LSaG6JFC
         NwFo4U9Hb5sk21wRtfBz0PiONSG7DsnBf8mtYecg/Me+dMtxGPapmQumE2UjVzbGUlji
         /cxnme4mcneY+pXcVRTzJ4MqsCi+EApnmeEg5sKyuoK7oss8GdW5YCjvIl3dWZoHo6Rq
         4PfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770775400; x=1771380200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9GnFDrdEkwQYpE8O+rmjepmoD5Aaw7ZEA0lHf8+9NWg=;
        b=UWIZn+iD7ufcv5PlHjy6wsSYlxlVfbonSH49Wf+28RRqxG42Z7Qhq+2deqweMlfVK4
         fB1j78vGodCtRxFJBDYrwKu0n1V1GGyL4Rw0IiFZnDTY10MDzuSYOwoK/Y+DbUqDFN9X
         yMrFGAlGxwDY6iXWR8ImhLLGckWgHYzbtimEAA6xkF8Xts9K71wuNVIBo4k1aemFY6u0
         /MBBUxUFQGtap6pgLMMtGqEWKxWk0nZwXDgDdLDR8HLIcI5FoqaUe528ljNZ5Lmy7wj4
         UZl6TgNei/4dQIs6o96vA3WQbEXef2SfO/cj7Yvm/Th2wX3/MmrfrT8OTpkGQ7URX52z
         qMdg==
X-Forwarded-Encrypted: i=1; AJvYcCUZ6ns3A8TIA7L/29Bk8t0NeOaEPoGSB5DUgc/9VahYvkxW9ZQ+nOoIT6p0TEnNF1Qwbn9GeNjnnNZ7qgdF@vger.kernel.org
X-Gm-Message-State: AOJu0YwYpc4F3VhpdU7Ig7etaj/A0BpDsDQ/N45fEzdfp/Q4xwuxkIQs
	zQsnFTDsY9kWUOB4y0coBynJcu+pEJ5BmAywe8WDoC/CUDqFjDOBW+i+
X-Gm-Gg: AZuq6aLpUP/QJu2HD63/nhyIOPGaqMm8Y6zk+GXw/Ea1I9afYkuA+53eKi5sBqVZhj7
	UxEktu0icl+lWH2T99UhTC6lynU8jFpPn91d9KcoDwjhaispDcMFngQl0abNL0g/gWPqW1egksP
	beTJJ4qYDe8RTBECDZY0PBwgtRzOY4JNEP2bJJ9JlD5yfDApE7j/HiPlHEtkRilU9NdCB6KDxk6
	cRBRIuLe28loteDUpTDdyAKK+Kxr1Mnd4K1MnXdzyp3hN44BevOJgHlx1VcND3XBIIu3ZyrJYm6
	H5f2WwS0HFajqm67Ikf42sMnNzj0eJcnJw/vplYzGEpc8sBOzNr615YyEmaZUqDC8zwT8OAkPRv
	wb46o54G4XhXcp9cLciB7De9fHohieczGUg0k+hKOujf/RjGcfehgQTY8tCwdIYCcAS1d4x/0UX
	i1mf7HJ0xW+XCpryuDgbvJ6v4plYcPcuICpo5CvTbLa40S+bzI1OU7CXlE4uLjMJQfs2QJIg3VK
	NwVusDpJdTHyRE=
X-Received: by 2002:a05:620a:22e5:b0:8ca:fe5c:ea6d with SMTP id af79cd13be357-8cafe5cec8emr1558801185a.59.1770775400534;
        Tue, 10 Feb 2026 18:03:20 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b0e1d72sm11282585a.18.2026.02.10.18.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 18:03:20 -0800 (PST)
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
Subject: [PATCH 07/10] ASoC: qdsp6: q6afe-dai: add internal mi2s support
Date: Tue, 10 Feb 2026 21:02:59 -0500
Message-ID: <20260211020302.2674-8-mailingradian@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92549-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 68A61120A15
X-Rspamd-Action: no action

Add the internal MI2S ports found on the SDM660 internal sound card.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/qdsp6/q6afe-dai.c | 46 ++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index 0f47aadaabe1..dfe964b1a341 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -411,6 +411,7 @@ static int q6afe_dai_prepare(struct snd_pcm_substream *substream,
 		break;
 	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
+	case INT0_MI2S_RX ... INT6_MI2S_TX:
 		rc = q6afe_i2s_port_prepare(dai_data->port[dai->id],
 			       &dai_data->port_config[dai->id].i2s_cfg);
 		if (rc < 0) {
@@ -662,6 +663,21 @@ static const struct snd_soc_dapm_route q6afe_dapm_routes[] = {
 
 	/* USB playback AFE port receives data for playback, hence use the RX port */
 	{"USB Playback", NULL, "USB_RX"},
+
+	{"INT0 MI2S Playback", NULL, "INT0_MI2S_RX"},
+	{"INT0_MI2S_TX", NULL, "INT0 MI2S Capture"},
+	{"INT1 MI2S Playback", NULL, "INT1_MI2S_RX"},
+	{"INT1_MI2S_TX", NULL, "INT1 MI2S Capture"},
+	{"INT2 MI2S Playback", NULL, "INT2_MI2S_RX"},
+	{"INT2_MI2S_TX", NULL, "INT2 MI2S Capture"},
+	{"INT3 MI2S Playback", NULL, "INT3_MI2S_RX"},
+	{"INT3_MI2S_TX", NULL, "INT3 MI2S Capture"},
+	{"INT4 MI2S Playback", NULL, "INT4_MI2S_RX"},
+	{"INT4_MI2S_TX", NULL, "INT4 MI2S Capture"},
+	{"INT5 MI2S Playback", NULL, "INT5_MI2S_RX"},
+	{"INT5_MI2S_TX", NULL, "INT5 MI2S Capture"},
+	{"INT6 MI2S Playback", NULL, "INT6_MI2S_RX"},
+	{"INT6_MI2S_TX", NULL, "INT6 MI2S Capture"},
 };
 
 static int msm_dai_q6_dai_probe(struct snd_soc_dai *dai)
@@ -1006,6 +1022,35 @@ static const struct snd_soc_dapm_widget q6afe_dai_widgets[] = {
 		0, SND_SOC_NOPM, 0, 0),
 
 	SND_SOC_DAPM_AIF_IN("USB_RX", NULL, 0, SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_AIF_IN("INT0_MI2S_RX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("INT0_MI2S_TX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("INT1_MI2S_RX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("INT1_MI2S_TX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("INT2_MI2S_RX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("INT2_MI2S_TX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("INT3_MI2S_RX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("INT3_MI2S_TX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("INT4_MI2S_RX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("INT4_MI2S_TX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("INT5_MI2S_RX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("INT5_MI2S_TX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("INT6_MI2S_RX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("INT6_MI2S_TX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
 };
 
 static const struct snd_soc_component_driver q6afe_dai_component = {
@@ -1039,6 +1084,7 @@ static void of_q6afe_parse_dai_data(struct device *dev,
 		/* MI2S specific properties */
 		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
+		case INT0_MI2S_RX ... INT6_MI2S_TX:
 			priv = &data->priv[id];
 			ret = of_property_read_variable_u32_array(node,
 							"qcom,sd-lines",
-- 
2.53.0


