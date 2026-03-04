Return-Path: <linux-arm-msm+bounces-95446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNccEpuPqGmzvgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 21:01:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB40C2075CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 21:01:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4873930FCA14
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 19:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9CB13E0C54;
	Wed,  4 Mar 2026 19:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kaMOI3Kn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BACA3E1208
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 19:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772654350; cv=none; b=NF1TGBpedRfmgDsZNU4GpYrKxZV+GQA7p3yzWmW8hCS7N4o/NiNnkJ19HIwkVDa/T7HqIPURVqod6fnUbS2L7iQKQEk5Ypvrb5rHhc9WdSGOssrebH3ciaE2nyJ7dWH0pvnszkMIiiltqAKvqZ/mto1zrozGpaVOj+v1HPcsfjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772654350; c=relaxed/simple;
	bh=5tRJaERsB3MX0Vg1OT71H28pfSmH/MMPXLkF26YbpNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d8EKinvYyYbweYinSn/tV07NZZJ3sBw1io/5F1sq6f/DVNjdcJTzc4Z12yXi9anU5EqoV83N4yxhELjlcFVD04F9GqVeQuCv8mZPZmL/srQOtVVgWyGw7794Z3Zuk3YLCDQrYb80vD55EKvLu/T40b+j4++la624h5HTpR2cbmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kaMOI3Kn; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-506bcb23a78so65762191cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 11:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772654348; x=1773259148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GnFDrdEkwQYpE8O+rmjepmoD5Aaw7ZEA0lHf8+9NWg=;
        b=kaMOI3KnzDjkLxitzhxI44KuAXIasesZ2X5XQz6i1rajTrKhvDFZU9ifi0HB7Yee3i
         7gQ0fo+MARz9HfvO+mMVOxdmHnM5nOrFhCRHMmoj1i6bQKYVOEzQOZZUptyMVuYkEiQ0
         hgFdwsI/e7wJ8Z+sfLULeHVqU/P9gXQjonmyRd5H0xMlVBtgYKf5+v+W0A9C6Gpzw2Y4
         zT4EiS4HPn9kILAUZlfzUe6x75+kiZn92G7aurGEdLqHR2t0ZZxbOPLJJMh1mGLUJe54
         EX/OK/oyACEKQy12Qx5I6tFkM/CX2auYCZXuT20avqAzuo6WgRwme0vsHifPqtWH1f4n
         bDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772654348; x=1773259148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9GnFDrdEkwQYpE8O+rmjepmoD5Aaw7ZEA0lHf8+9NWg=;
        b=aazAa0sd+ACJ5gNwqysr+ChmgpgYK7Azgc1RmNvI5ljSgca7mY/VKgT7ymuFgkwdDy
         v96v7LaJPt3TOEmHP82I83K447sl2Qvv1kPN9qiEb+LoD8X4yn4Vcf1E2nLalRghYIOJ
         pkznyKIcFGlXDiw3DgOQN+LnIBJ32+95CbzE5Noo2MP0X9GnDZb6RcoWOwR6VBUmP/Qy
         U6S1MU0A313txN24AedGIrGhOh+qsnDwB1HbqiuWufPPDkmfsOSTVV8l043olfaRDCcR
         +wjZJvHnwliMoIJ3dj2WI0m6mHrkVuJBlMgVdNmCtFV6zTmnVSvuXumUga8yN/BYnW4F
         zDWw==
X-Forwarded-Encrypted: i=1; AJvYcCXtZFxM/CX8QNTRFhbxCGmtXzljVBejgFX9XY31QfM23i7ViIY4B2ZfKDVRadZYPbPsIW8y9/mBk7qxEyUX@vger.kernel.org
X-Gm-Message-State: AOJu0YykG3EuJxIIxs0aHoxt5+TVLXf7KxUqqD5vYf4A8nP6Q41sjIP1
	yTFWTMkCmAVUuhjn4KM4aaHxZQZZ2TG5VKHQqtWzPAV0p7paZb6zDJJ5
X-Gm-Gg: ATEYQzzw6JOiERSzdWcf8tf4Bp7YELjvSaPhm6VRhuFn21Iz6x+Jo0MKMZC+mGUyUDM
	v6jZGV9RXaf3walYehj6a4AcrmBWrRczO1mR698nSuZOTCDa05YDyruS4Wd5TQ4AemAAXPLKOIN
	eCnXCXnsaRJUVZmDvsWE+1xEX0yMdhObl6nOj5ksqqJS0Kf693FDbcGizQEfXjTNLebJEdgvYDW
	6ykCKl8OBXHoLeNc+nvbi6mtXGLIMvNZ7uuhe7OM8qgSjyVCDfhfynR8/mLfwRmUnrvX1NUAC7+
	qHIkJDm/MpiN/AD0FaM50uMbrEdLKS1Nz7xg3wyGoE3Sat97YjItzjzPzebnsG3UUh3pPhy8T7Q
	N7KCiRODn+5ZosKs3YEnXiLcggZMUNdanTIaeLu19Ny201pt227hHEN42n9GR6qZE3pXtVpmTBZ
	NA2q/v0zTcMq1DafqHEMWNtAHBdg==
X-Received: by 2002:ac8:7dd0:0:b0:506:9b96:6283 with SMTP id d75a77b69052e-508db3d317bmr35698351cf.66.1772654348492;
        Wed, 04 Mar 2026 11:59:08 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899ebb09772sm99714546d6.12.2026.03.04.11.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 11:59:08 -0800 (PST)
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
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 07/11] ASoC: qdsp6: q6afe-dai: add internal mi2s support
Date: Wed,  4 Mar 2026 14:58:11 -0500
Message-ID: <20260304195815.52347-8-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304195815.52347-1-mailingradian@gmail.com>
References: <20260304195815.52347-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CB40C2075CC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95446-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[mainlining.org,quicinc.com,linuxfoundation.org,kernel.org,opensource.cirrus.com,renesas.com,gmail.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
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


