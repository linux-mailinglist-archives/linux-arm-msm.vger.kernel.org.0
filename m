Return-Path: <linux-arm-msm+bounces-112248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9oA3NA9BKGppBAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 18:36:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D54662735
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 18:36:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Km5pZxjK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112248-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112248-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1D50A301D5A7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 16:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43F093EEAC8;
	Tue,  9 Jun 2026 16:23:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2FF3B635F
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 16:23:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022193; cv=none; b=gDQqkY/IwEMqQ7kqrjLUGMW+RW9UsNeNlodXwRo7XtBik9zRu07crrsNYvOcjxFJtrk1kIOP9qdfMoYrT6vhPgfDjI600KeIs2CY1e/KNSBj/1XNJhTIxd1DiSTAg0Y5wN/KnRNSgdUXYKJ8ngbTRppg4pMWt0bvnMVOuVmCGSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022193; c=relaxed/simple;
	bh=2f1OPZ121QSNwsYLYAWhK9Hw/qiI58CkFpqvVUdneak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J25wZKB7efM+bDQ5JIiQvicN29zaOQObv/kdsHixY5JQW+nUhtuuNTjGGd5f7Hkfmp0hNiM33G1kKEDXmTFRNmFHzKW9JFQk+/2v3eg6s8o3GFhIjqZDWuohuuPG04TcaQutrOMf0gk7QLuPrOU1BaehMQ5S5npFkm2JjvnAPho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Km5pZxjK; arc=none smtp.client-ip=209.85.160.178
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5176d4c14f5so46741471cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781022191; x=1781626991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hun3Ky6XQUrHOTGKT/KTktQmM2f62wDExV37VcKxdpo=;
        b=Km5pZxjKIrfYWh873OO5iWZfIrHyWAVrFz3EHRDPJzCAXNx1JCku9GP4wh9xZ0lm+X
         m0rsRrC6OxWnv9UDMe11Y0m9MJm8YrJHr+ZoU2Mf1+PXkRSBfVO2MMSLxoteeX3cKD62
         iK35x/4c8AUdQ8ulLbhThxwewn1cptOHWx3sX2VSsTrfGPqE2nlZZKrLAEFZiDWrO3Z3
         0Z7QoCbl5EzEwyw1SUyNW+adTzMXvJ7W32Nf5M6JmFBJK2/x604nNSotcmA7ypmmaAP9
         1+gPz+u2Qpjm6tvs5/ZJItFPIhsZh6DqoSqiHYVtt8e2lHGfTQP+KxlQ8PWGLDfJXXe2
         tfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022191; x=1781626991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hun3Ky6XQUrHOTGKT/KTktQmM2f62wDExV37VcKxdpo=;
        b=cQLBa61TvUvIw6tO+CTlyzOvjdfWy3+0jNyPpPpaP/bxKwK2QcgABUmTkg+G4WO0eX
         4s+RiZ51fv8kFs+NzjFNttd9eZ+ULw1Q1noUdUwjRcnJ04a/gzWvvN+7osvwyghBfpu/
         kLqqzTQbintKPVqDAiLofPeXhfvIuNs5+bZeP7Z5TnuNG6i5lhj/zHpjyaTSU+dFJDyY
         RUc9nPP5dAYJwLFH3UU7HgLjYvOgNMvCaGIdT68DUEXKDvQwPZcgCNhKzmxZDuf8+CgA
         OjmGfKCiqulfrJebObt/PrR2fsrNO9y2Y0yjGerJWXPpCMcHrF83OGjkVDU+b/VEQ6Hv
         Cv3w==
X-Forwarded-Encrypted: i=1; AFNElJ9XpFtH/9LabwSQADCs5GyZtAmlwJKsqjrjcOWhwO/1OP23pY8TksQaPATZWFKp2wqlgjP9PlrQCpSEAfi8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7uYa5ZFSpmEiBDSuJSwdxyEXxA/5d0e6i3ArxxRK+qfCGbybK
	IRY+du7CcqF+PUKDJZbvxVPYyAqe+lyqN6wURMUUiGKCI7dmlZcXHEyr
X-Gm-Gg: Acq92OGo2LK8BNZrIuCxrpwq47Ol+bfZBmNjio1ZJliM3IoV1I+E/2HYGi8p+VXx/O+
	0qFVAJinO9VwrRsaKD4T6q3v52elIoliMGtozdkSwqqZ/7D+c3NzvO09G87JiX4377xNF2ABDk2
	Tnze4ugYkiEF5IXxArZS3AiCENB8D4gA9x8qp6J5w9PmH/5/nlMTLTfSKQt0o30VIO3xZjv2Cwu
	D5HExv6mHoqclVJd926Y+E6AVh8z4aG64G/2KD8yWCYJNCPUX+lsib4QPf5hMPwEdYLIHMMRaOe
	Sx46ob72toAVKuxDXzaacQZzTunzbeZCq7XmW5gCg+6KigEVIGsUg628A7I+ZG0KI7Oze5y+bm7
	umMaorEfLTUsS2jLprunnv4vYrbQKaDCmiCVgJn/sCJ0sgPnOpyp54pThjGaPgIELCMEV8VEcyF
	d0O7gvKtabSS7ldPmtC6V2gtsYmC/32O4+gnx70Q==
X-Received: by 2002:a05:622a:4cd:b0:517:8437:f67b with SMTP id d75a77b69052e-51795a48383mr305424961cf.12.1781022190790;
        Tue, 09 Jun 2026 09:23:10 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775c297a8sm186983521cf.8.2026.06.09.09.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:23:10 -0700 (PDT)
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
Subject: [PATCH v5 08/15] ASoC: qdsp6: q6afe-dai: add internal mi2s support
Date: Tue,  9 Jun 2026 12:22:48 -0400
Message-ID: <20260609162255.31074-9-mailingradian@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112248-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 83D54662735

The bindings for LPI MI2S ports, originally exclusive to q6apm, can be
used for internal MI2S ports on q6afe. Add the internal MI2S ports found
on the SDM660 internal sound card using the LPI MI2S bindings.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/qdsp6/q6afe-dai.c | 48 ++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index a0d21034a626..920345609d2c 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -412,6 +412,8 @@ static int q6afe_dai_prepare(struct snd_pcm_substream *substream,
 	case SENARY_MI2S_RX ... SENARY_MI2S_TX:
 	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
+	case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
+	case LPI_MI2S_RX_5 ... LPI_MI2S_TX_6:
 		rc = q6afe_i2s_port_prepare(dai_data->port[dai->id],
 			       &dai_data->port_config[dai->id].i2s_cfg);
 		if (rc < 0) {
@@ -665,6 +667,21 @@ static const struct snd_soc_dapm_route q6afe_dapm_routes[] = {
 
 	/* USB playback AFE port receives data for playback, hence use the RX port */
 	{"USB Playback", NULL, "USB_RX"},
+
+	{"LPI RX0 MI2S Playback", NULL, "LPI_MI2S_RX_0"},
+	{"LPI_MI2S_TX_0", NULL, "LPI TX0 MI2S Capture"},
+	{"LPI RX1 MI2S Playback", NULL, "LPI_MI2S_RX_1"},
+	{"LPI_MI2S_TX_1", NULL, "LPI TX1 MI2S Capture"},
+	{"LPI RX2 MI2S Playback", NULL, "LPI_MI2S_RX_2"},
+	{"LPI_MI2S_TX_2", NULL, "LPI TX2 MI2S Capture"},
+	{"LPI RX3 MI2S Playback", NULL, "LPI_MI2S_RX_3"},
+	{"LPI_MI2S_TX_3", NULL, "LPI TX3 MI2S Capture"},
+	{"LPI RX4 MI2S Playback", NULL, "LPI_MI2S_RX_4"},
+	{"LPI_MI2S_TX_4", NULL, "LPI TX4 MI2S Capture"},
+	{"LPI RX5 MI2S Playback", NULL, "LPI_MI2S_RX_5"},
+	{"LPI_MI2S_TX_5", NULL, "LPI TX5 MI2S Capture"},
+	{"LPI RX6 MI2S Playback", NULL, "LPI_MI2S_RX_6"},
+	{"LPI_MI2S_TX_6", NULL, "LPI TX6 MI2S Capture"},
 };
 
 static int msm_dai_q6_dai_probe(struct snd_soc_dai *dai)
@@ -1011,6 +1028,35 @@ static const struct snd_soc_dapm_widget q6afe_dai_widgets[] = {
 		0, SND_SOC_NOPM, 0, 0),
 
 	SND_SOC_DAPM_AIF_IN("USB_RX", NULL, 0, SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_AIF_IN("LPI_MI2S_RX_0", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("LPI_MI2S_TX_0", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("LPI_MI2S_RX_1", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("LPI_MI2S_TX_1", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("LPI_MI2S_RX_2", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("LPI_MI2S_TX_2", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("LPI_MI2S_RX_3", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("LPI_MI2S_TX_3", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("LPI_MI2S_RX_4", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("LPI_MI2S_TX_4", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("LPI_MI2S_RX_5", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("LPI_MI2S_TX_5", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("LPI_MI2S_RX_6", NULL,
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("LPI_MI2S_TX_6", NULL,
+		0, SND_SOC_NOPM, 0, 0),
 };
 
 static const struct snd_soc_component_driver q6afe_dai_component = {
@@ -1045,6 +1091,8 @@ static void of_q6afe_parse_dai_data(struct device *dev,
 		case SENARY_MI2S_RX ... SENARY_MI2S_TX:
 		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
+		case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
+		case LPI_MI2S_RX_5 ... LPI_MI2S_TX_6:
 			priv = &data->priv[id];
 			ret = of_property_read_variable_u32_array(node,
 							"qcom,sd-lines",
-- 
2.54.0


