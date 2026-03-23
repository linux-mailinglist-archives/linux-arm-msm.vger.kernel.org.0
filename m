Return-Path: <linux-arm-msm+bounces-99424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNtbOCvCwWkHWQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:43:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8093C2FE6C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:43:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D2D730E4268
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 22:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E12DF384222;
	Mon, 23 Mar 2026 22:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pHJr0Beu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9asEZTi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162E4383C64
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774305554; cv=none; b=mCN6o7h6Ixd33VinaB8tdtxa5TX8lQ7uYmwSXtuITbZd1RuWJbLj+L19DHQjMJBCH0YbO31JuS0RaA7VctO2oERtKnuvUAmzW95KwU2PpE1p1tB9Iox+x9oCpGI/wgAqfZ7OGSSfY/Cc3UcX3NURjk3hWujrPpl5m1Wpf8H7RlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774305554; c=relaxed/simple;
	bh=DWuvTD8Cw0DUhqpHbWAOgp0+9q9ilBF02Exs71eghWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BaVtnTQ791fI9AwbNAOnsfnX2N5GSDycPn9TXZyivR6HmDED9F1ot+0PSsHp+bOXfZ4gBB1j2cQX3ch0DrgRoVQs8zR08uiLrwQ+QtQs5SX8RqJKb0S8v1TLSp2qLnOsbcflSoCFwaTaewNjd7p6Gc3jeu5CpQQ2RdGaWvVDO2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pHJr0Beu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9asEZTi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqWD03817386
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VHHn5cWjpEy
	VxsTN9vGBX+/Npp0nx1w8ZRbazvG1gDU=; b=pHJr0BeuPYXMRg9lnFuQiAUL16f
	gfKlO35Jj6uKbRuil5/siv1mUc2UFGDvpULfouRDvzVfAeHfMGaF42+FZRSF6ZDk
	qbHG2rXKNhKfAaiHNgSjXoL5eJt9A7OdfHs5A8i58VR7yhV5MZsKIuRUsWyyGOK6
	7EHGSsQQtIkzI7PtWWJpYT9ja3b7Ar01KCREbAqIEfk5TivtXKK2VjT3z49QZDhK
	1qurH4PrKrqpddgq5S9V3stDbEctIprnGrSkgYqrOae/QAWBdlmLkuRLzfYTpWk7
	0w4O5H0L7LiU7rvQh9HSwuGllneVYoL8rgkePnIqIUQjsMbStSyMnxjtJ0A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d355w235w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:39:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093a985e21so358280391cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 15:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774305550; x=1774910350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHHn5cWjpEyVxsTN9vGBX+/Npp0nx1w8ZRbazvG1gDU=;
        b=B9asEZTiwgOxkTFSnqAlxLluwPhtr6CUSUptHS5X9B7HoFvLpj3pa0CmG8bh1xMOPw
         erbJwH4DuT1oqQxY5UHiR4PVw80nk5MFean0HAhecT3wq7NWTmTrUONGM5D5TuS9DcFM
         E4ZJ2VgD3I6yc3lnoYmgC38FQQClZdm6xjDsZvxmlpVYF7NfFoQX7DJ8bU0I/MCxNPrx
         wPNQsERkG1nm4jaoZq+Bs7u8U+x4rw31nICcyRRWYFX9nRhCKLw4zggedhlMkQjGLb+o
         S1udlYxDJ7tu7AAXpJTZw6bX4YAvEo9v+Zj+P7Y7IfYpFEPXBAQlAv/5B/EJF5O3CDHO
         VYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774305550; x=1774910350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VHHn5cWjpEyVxsTN9vGBX+/Npp0nx1w8ZRbazvG1gDU=;
        b=ac32u6hB3XYdqE+/pN9GyBWM6dWHLfO5yVcF6jTfXY9906gpCM5L5nENRbZT9CdCVW
         5816n9YTSWY7qDBgvX0h4EkIuGxF7cwNjcI4bqhrRQpeA0d3p4TY9wjrSyGNSoGdemP5
         HYsiMy3D0h616Ft95c01W3fJFrsUpKcXhhpKtAM30LJvBIVJYUhIDQGpey0z+UJ9X+Uq
         OSnxLFLHuTu3ZYoEcyhGd5/KS06o+siaMuV4jgYAYGoq0rKGfpRMVfDI28eUtMHZnZgR
         m2BQ4IFHbX5MjtKdAAaoeHKfpYOf+A1/IGsnzobWQMaD7JBjTFkUYL1pT9pdCTVUuHBn
         F6Iw==
X-Forwarded-Encrypted: i=1; AJvYcCWMujXYQthtqiEWCmRclLD8oQ4igUvtu2ipO1zvEbkPKGrg2Ri548PXzO7E9rphg5uHK8grR9QasUSXqWAX@vger.kernel.org
X-Gm-Message-State: AOJu0YxBW8ErvFcy1vmiVZrM2ABgCd4SV++XlcIQMooayWi1Km75bg7d
	DjC3FEMfJjl6GzCWzET5lewesuTQIS4c7jAHYJPxVPYz6zkJ50eSLHSAE5u2wMNoO5Ks7uRj8wN
	/35rxbpKBXts7K5RiVwyJIeWwKsbZxDF71IpFmGcVNTT7X6YkkSP7gjvI4fIN8pO/mGDS
X-Gm-Gg: ATEYQzw8NC9GV8/CbtW4B97fErW/HI3flN+le2+vzrS/kdlUnGUd1bCVB2Wm2ZG6T8p
	VjPOg2JnrgLn/GOuA/7Tftwr9+erX/Hr/FT6YY2H9q5skLWfM+8bsAGHZwXFdFfz/NJXZYBvH22
	IQxOfCQ3yEXhzUf9w4O5TOoe5LRqucPyx8yLpe4oTGlDEGaiQjaoNP7e93pCp0/83NCGfDcEZac
	Ak12p8XQRf2JEarrMe/VVUiAHMR3RRuV/ASGaAgUJr9U6HRlheYy8k+OsRjAn/fHG1LvLG6FgXY
	5YLJT9K2Pp0yLQSEUYK0wqRxSQKE/3thMupz86RHzCL3LKBhz5QwjiO6uhhhBgouwASteFxX4TC
	ldY0XlvqWt5DOwa9G8lZ5xbSgLlZWT18KQtui+uD6UTgz7H36/P9aqyA=
X-Received: by 2002:a05:622a:1f8a:b0:50b:534f:4292 with SMTP id d75a77b69052e-50b534f4a60mr103772781cf.35.1774305550125;
        Mon, 23 Mar 2026 15:39:10 -0700 (PDT)
X-Received: by 2002:a05:622a:1f8a:b0:50b:534f:4292 with SMTP id d75a77b69052e-50b534f4a60mr103772411cf.35.1774305549649;
        Mon, 23 Mar 2026 15:39:09 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64715539sm33320351f8f.33.2026.03.23.15.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:39:09 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v7 08/13] ASoC: qcom: q6dsp: Add Senary MI2S audio interface support
Date: Mon, 23 Mar 2026 22:38:40 +0000
Message-ID: <20260323223845.2126142-9-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fq7RpV4f c=1 sm=1 tr=0 ts=69c1c10e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=yvctMs8w4tAFySAdhFMA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: q7VZEbFpsDkFYcPjHeJL9xte_b7aNigp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2NyBTYWx0ZWRfX1J6eK4tgnnWH
 U0SE1hrYwYt4i2vlRVRuzDGckHFF9X6w+9k4z5Y9Sn56zB6+agCTwwwHjHShwSF0U79EdFbzUxs
 Q2WkHS334BiYk3R77W08/gQtqduzSaMNJ79Q7NxBPZxeiQE/UkDhU72pqfzifJkgKK/CUMGztGy
 pBXxaNrdO6AFkNIZFh4r/qINAhtkr5MtkfezylcKMMUvkV91JfjFZJ3LALShk0bCDKBhx5kEcwY
 70kzi5FbI001+E+Pt9Pt0JFen3To6lESFwISU2gkwYOqL/0cjjnUgtOoewCkVTqEf37s66HP+eM
 EUzmhiewMIj96hYggDaYmNKw+WzzwKF4pI/hs+xJe0OzDCCqtsJXmMBx4jQjZOwPEkLXweMorvC
 1IplWKtZ3AYn3/DjgZ7FUVovOr+cmPLqGLXQpEcvl1ACZ0N6ISFKN8l+rTKnylVba2XeCsG2f5u
 KT1UNOIhLJRrWmQ0uGg==
X-Proofpoint-GUID: q7VZEbFpsDkFYcPjHeJL9xte_b7aNigp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230167
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99424-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8093C2FE6C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Introduces support for the Senary MI2S audio interface in the Qualcomm
q6dsp. Add new AFE port IDs for Senary MI2S RX and TX and include the
necessary mappings in the port configuration  to allow audio routing
over the Senary MI2S interface.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Val Packett <val@packett.cool> # sm7325-motorola-dubai
---
 sound/soc/qcom/qdsp6/q6afe-dai.c         |  6 +++++
 sound/soc/qcom/qdsp6/q6afe.c             |  8 +++++++
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 29 ++++++++++++++++++++++++
 3 files changed, 43 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index 0f47aadaabe1..a0d21034a626 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -409,6 +409,7 @@ static int q6afe_dai_prepare(struct snd_pcm_substream *substream,
 		q6afe_slim_port_prepare(dai_data->port[dai->id],
 					&dai_data->port_config[dai->id].slim);
 		break;
+	case SENARY_MI2S_RX ... SENARY_MI2S_TX:
 	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
 		rc = q6afe_i2s_port_prepare(dai_data->port[dai->id],
@@ -540,6 +541,7 @@ static const struct snd_soc_dapm_route q6afe_dapm_routes[] = {
 	{"Tertiary MI2S Playback", NULL, "TERT_MI2S_RX"},
 	{"Quaternary MI2S Playback", NULL, "QUAT_MI2S_RX"},
 	{"Quinary MI2S Playback", NULL, "QUIN_MI2S_RX"},
+	{"Senary MI2S Playback", NULL, "SEN_MI2S_RX"},
 
 	{"Primary TDM0 Playback", NULL, "PRIMARY_TDM_RX_0"},
 	{"Primary TDM1 Playback", NULL, "PRIMARY_TDM_RX_1"},
@@ -636,6 +638,7 @@ static const struct snd_soc_dapm_route q6afe_dapm_routes[] = {
 	{"SEC_MI2S_TX", NULL, "Secondary MI2S Capture"},
 	{"QUAT_MI2S_TX", NULL, "Quaternary MI2S Capture"},
 	{"QUIN_MI2S_TX", NULL, "Quinary MI2S Capture"},
+	{"SEN_MI2S_TX", NULL, "Senary MI2S Capture"},
 
 	{"WSA_CODEC_DMA_RX_0 Playback", NULL, "WSA_CODEC_DMA_RX_0"},
 	{"WSA_CODEC_DMA_TX_0", NULL, "WSA_CODEC_DMA_TX_0 Capture"},
@@ -770,6 +773,8 @@ static const struct snd_soc_dapm_widget q6afe_dai_widgets[] = {
 	SND_SOC_DAPM_AIF_OUT("SLIMBUS_4_TX", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("SLIMBUS_5_TX", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("SLIMBUS_6_TX", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("SEN_MI2S_RX", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("SEN_MI2S_TX", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("QUIN_MI2S_RX", NULL,
 						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("QUIN_MI2S_TX", NULL,
@@ -1037,6 +1042,7 @@ static void of_q6afe_parse_dai_data(struct device *dev,
 
 		switch (id) {
 		/* MI2S specific properties */
+		case SENARY_MI2S_RX ... SENARY_MI2S_TX:
 		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
 			priv = &data->priv[id];
diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 43d877322bae..40237267fda0 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -130,6 +130,8 @@
 #define AFE_PORT_ID_QUATERNARY_MI2S_TX      0x1007
 #define AFE_PORT_ID_QUINARY_MI2S_RX	    0x1016
 #define AFE_PORT_ID_QUINARY_MI2S_TX	    0x1017
+#define AFE_PORT_ID_SENARY_MI2S_RX          0x1018
+#define AFE_PORT_ID_SENARY_MI2S_TX          0x1019
 
 /* Start of the range of port IDs for TDM devices. */
 #define AFE_PORT_ID_TDM_PORT_RANGE_START	0x9000
@@ -718,6 +720,10 @@ static struct afe_port_map port_maps[AFE_PORT_MAX] = {
 				QUINARY_MI2S_RX, 1, 1},
 	[QUINARY_MI2S_TX] =   { AFE_PORT_ID_QUINARY_MI2S_TX,
 				QUINARY_MI2S_TX, 0, 1},
+	[SENARY_MI2S_RX]  =  { AFE_PORT_ID_SENARY_MI2S_RX,
+				SENARY_MI2S_RX, 1, 1},
+	[SENARY_MI2S_TX] =   { AFE_PORT_ID_SENARY_MI2S_TX,
+				SENARY_MI2S_TX, 0, 1},
 	[PRIMARY_TDM_RX_0] =  { AFE_PORT_ID_PRIMARY_TDM_RX,
 				PRIMARY_TDM_RX_0, 1, 1},
 	[PRIMARY_TDM_TX_0] =  { AFE_PORT_ID_PRIMARY_TDM_TX,
@@ -1777,6 +1783,8 @@ struct q6afe_port *q6afe_port_get_from_id(struct device *dev, int id)
 	case AFE_PORT_ID_QUATERNARY_MI2S_TX:
 	case AFE_PORT_ID_QUINARY_MI2S_RX:
 	case AFE_PORT_ID_QUINARY_MI2S_TX:
+	case AFE_PORT_ID_SENARY_MI2S_RX:
+	case AFE_PORT_ID_SENARY_MI2S_TX:
 		cfg_type = AFE_PARAM_ID_I2S_CONFIG;
 		break;
 	case AFE_PORT_ID_PRIMARY_TDM_RX ... AFE_PORT_ID_QUINARY_TDM_TX_7:
diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
index d31388ed3ccf..e5cd82f77b55 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
@@ -519,6 +519,34 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 		},
 		.id = QUINARY_MI2S_TX,
 		.name = "QUIN_MI2S_TX",
+	}, {
+		.playback = {
+			.stream_name = "Senary MI2S Playback",
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     192000,
+		},
+		.id = SENARY_MI2S_RX,
+		.name = "SEN_MI2S_RX",
+	}, {
+		.capture = {
+			.stream_name = "Senary MI2S Capture",
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     192000,
+		},
+		.id = SENARY_MI2S_TX,
+		.name = "SEN_MI2S_TX",
 	},
 	Q6AFE_MI2S_RX_DAI("LPI RX0", LPI_MI2S_RX_0),
 	Q6AFE_MI2S_RX_DAI("LPI RX1", LPI_MI2S_RX_1),
@@ -680,6 +708,7 @@ struct snd_soc_dai_driver *q6dsp_audio_ports_set_config(struct device *dev,
 		case SLIMBUS_0_RX ... SLIMBUS_6_TX:
 			q6dsp_audio_fe_dais[i].ops = cfg->q6slim_ops;
 			break;
+		case SENARY_MI2S_RX ... SENARY_MI2S_TX:
 		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
 		case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
-- 
2.47.3


