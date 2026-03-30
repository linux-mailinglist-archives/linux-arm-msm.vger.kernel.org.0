Return-Path: <linux-arm-msm+bounces-100691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KK3DLyMzymk66QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:24:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D42B357121
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:24:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CCEE030160F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 08:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F24893B0AC5;
	Mon, 30 Mar 2026 08:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DVUW6reX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C5Fus72o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E663AD519
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858908; cv=none; b=F6IIReUKgVzmlxrNNW/GcRHJx8BZAY50sma3t/DJh6rR+Ok3VQBDYbNjgT6OuRwZg2bWLdgdT6uAF4+UX8u1d2a7+W6rppsZ/NJdFHlEyw+WQwyaumXv/WcAYdVGNqSUb4YaI9UVzc6+GukSHh1WrZhM39uSibio7j3+LGCLz64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858908; c=relaxed/simple;
	bh=1AGWMMo+ZQ2MpMqgndQclqL9hoOIddPn00jRigW1KUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TosnB9mon6a8ycV2SFmwtqbxdxcw5VhuyCJlPuGI7p+RxIFW+19xvJxC76ZTjeijT9uU+QvNZ+m7qnvZmWgCDWkzkzXErgMmGDaC6LzSBqx8BNC5qwWrkuPMzIlWD8E2M/Tmy/Qt6yo56fjzLLXvEfo/ufKGHcFxf7L4lat11Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DVUW6reX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C5Fus72o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U4PU7d581263
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2UA23pg+dGV
	Ambwz2ppXfyVdk6xlbVmq70z85L7JFXQ=; b=DVUW6reXA+rkVOIiwtFQcayQ5xg
	cRLFqNyfpc1LVi4UE7siNqwYKSv158h/wJMMpEr9Mhg6ymgdICmtGMwZN9BSJfB/
	4KQfZsKjNBpgDc7RUzQDmNBNINjRxmaZwxspNiOmMTF+w03gaHBzoFMDFWv0P/wL
	nFeWgVMTOumDK2tcgWZkO1z1LB81hTUE5dyWV1Jaqfa7tRQo+43Q1qv0kcOTi9JV
	dnWbvssHgWmBy+lRqrGvNR2+LSsCjQb0RI8IL2WgoGxnslvDMdjRRHPn+XwGLlDQ
	JoBT8YGo/3Q6/wwVs/jwYz54jrtC0XTWVS4kH3Ew6Fd3PL+LPxuadsVzQNQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d65xqnb5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:21:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b3544bc7bso57242211cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 01:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774858906; x=1775463706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UA23pg+dGVAmbwz2ppXfyVdk6xlbVmq70z85L7JFXQ=;
        b=C5Fus72ondUh48RdASfrC8iqUOEfv/5pU8A5evS7lF7iHQjA6cp0g6VnxPVY2aLk2s
         Mtsngf8uQE+rgxv4Szys21C+8Jj201Tkwor80fVH1fWtjTtvlLETdCG6khWSEk8wLEc8
         5kiY72SH6dQGLYVgv1wJDUWdjlcnTnqrAaXVkDmiShR7GkR0NAVS15rARpT/GT15W9+4
         w9BWLgdsCkX8lEgNyELDqFelqMtLOYdPiI8anPsIy7fFJ/nVAx6txaEUI9QKGJ8JcT1/
         uIM5eh8uyjKI6bR4IyMHFYJJ6yWPO7X/pF37Kbyc/YTnro0fdFIjfa6mEOwlp17yqo4g
         MhxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774858906; x=1775463706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2UA23pg+dGVAmbwz2ppXfyVdk6xlbVmq70z85L7JFXQ=;
        b=T21FHoGNHgEEj8QQu29ZDDsodyW2nT7cLSrDDfciaFuoV3L9qSyAgjtEtV9AWhb2L4
         /ChAMKvmZiqtCcBf2SGW3SPbnLdH8JcTSxNqM2tUIF3lVU0QytiE/EQLsa3pXOXrqp2C
         8xvqVaOA5uS605vzmzmjj5/G9kzirbI571qHYr4M9EAQkNHUqxAdEiQuxfkP4pMEszQk
         P3Hasma8gpNquDK/EZ0EVt79vT2YU0buJdLn795YAWgLnini9OuiwtH8i05jQIhKm8O0
         AtjVPhVoShMArDHrroVQqY7HvPhw5B/T3z891PyQlW3CweLfHWqqVoE6p3dhHg9mF12G
         Zi6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVms2w4opYmZaijJJxGV5EiLfHahKKp4dLuUSHqj4ZlzJHNucnYm4r161kS1AK4obTejJHCJ4iv0vuaDFeY@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+T66j2HEOoTFeCWIWIEh34wKSCqP6yhADt+M+Xfsf9lthsayk
	V3H7M3Nc6ZxxHpDD1cCQBKLSf9zhj6ODcRRdCwgR3kWVneZjc5Fgu6i6m2CQU5icCHUaF+1fEgL
	WlQl+77uTpGGhS0ie1uJtyvbIzFVE2JLwbzoz7DgZSKlIpyNWSO59sVBwjLwZ5hiESDZn
X-Gm-Gg: ATEYQzziu+q5i72HtjqrG8sP9hxO9nbCm2BSZbYM7b9VosGEItshANvkMR2qRljotVL
	zj2Kh6M/LCbkbxMtGEUr/SqtS0XCF+8A7U7hS5XNPAFqvvBOQwA/jeHQWgE8Cry7NBR1Bs+NYpD
	BKSOOoyCwb5+Z1wFuLzqb6vjktwFcNNql2VR12BN2dxbEFhR4LpSsSL7GdGKzyYj/WmhYwN7tc0
	el8MuF4JCDCBVWF2SaKQWLYSPtueYrh98/aMipeqbnASP/oaZYF+vu7wQjyEsl3qcITcwrb6nhD
	8iQP2h1okmRBSAX1FMBSgL0cKnmvTRn5w6rh/Z06oy7y5pWXufPIuN+2kCfaV72lZF+rrKIDll2
	XR1PcTMGVZvB1uJqWRBb7lcHoU52iZXQqNZaQSa40Nt8CSPpvX0SWm9Q=
X-Received: by 2002:ac8:7d4b:0:b0:50b:3895:fac4 with SMTP id d75a77b69052e-50ba397a624mr142938611cf.62.1774858905810;
        Mon, 30 Mar 2026 01:21:45 -0700 (PDT)
X-Received: by 2002:ac8:7d4b:0:b0:50b:3895:fac4 with SMTP id d75a77b69052e-50ba397a624mr142938321cf.62.1774858905379;
        Mon, 30 Mar 2026 01:21:45 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf1db08e6sm26244773f8f.0.2026.03.30.01.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:21:44 -0700 (PDT)
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
Subject: [PATCH v8 07/13] ASoC: qcom: qdsp6: lpass-ports: add support for LPASS LPI MI2S dais
Date: Mon, 30 Mar 2026 08:20:59 +0000
Message-ID: <20260330082105.278055-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: suslAWvQTWktZF-Nf9EBLfA7WFKDDYsj
X-Proofpoint-GUID: suslAWvQTWktZF-Nf9EBLfA7WFKDDYsj
X-Authority-Analysis: v=2.4 cv=evLSD4pX c=1 sm=1 tr=0 ts=69ca329a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=nvRDalaNTaWZAukup-IA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2NSBTYWx0ZWRfXxxf4JO563O4w
 azb/rzhRyl6Y8i7vxLFaRv7Bne4F0+3CsK7P7eR/IoyA4ezoHe+SV6QloiuEz7gH1FBdxhW746f
 Ra+RgWZ2NmLRYOPLOSF7KN+Rb71bbukxMc1Dh7GXADiH4epAIP73reGzsJGDjCEuF3AMg18Ftsd
 Uv2oiwE7lGqe4K0UzcYZaxxcfCFfc0kRagw2wu+1wLiBRmqzhwP2+6MlClRJw/X4aKw4C++z7rl
 3NWNPQH85PVRUV9zeFXA3cwVTO2C0w0VaSjqwmsmNghwi9rRgurv/rO3XuhcQJKSk1uaCdgqZBN
 pYWYSrmgG5WbbBRB2DdAYUzFKZ8rw15RTBU4A4i8BIXfJVliZ+dsdGdEzlvw5jXbm2BHnR0r0kr
 Ps9UCdXePrkv/ZzvoSq/cQPD+Uy3vGcP8VHv9emu6dK1q3Urf2+I07KSPEzNch4LNKrXTkABkBo
 tXmWqFlexTuL5VgUwAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300065
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100691-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3D42B357121
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for LPASS LPI MI2S dais in the dai-driver, these dais are
used in Monaco based platform devices.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 47 ++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
index 4eed54b071a5..d31388ed3ccf 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
@@ -96,6 +96,42 @@
 		.id = did,						\
 	}
 
+#define Q6AFE_MI2S_RX_DAI(pre, did) {				\
+		.playback = {						\
+			.stream_name = pre" MI2S Playback",	\
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
+				SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
+				SNDRV_PCM_RATE_176400,			\
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |		\
+				   SNDRV_PCM_FMTBIT_S24_LE |		\
+				   SNDRV_PCM_FMTBIT_S32_LE,		\
+			.channels_min = 1,				\
+			.channels_max = 8,				\
+			.rate_min = 8000,				\
+			.rate_max = 176400,				\
+		},							\
+		.name = #did,						\
+		.id = did,						\
+	}
+
+#define Q6AFE_MI2S_TX_DAI(pre, did) {				\
+		.capture = {						\
+			.stream_name = pre" MI2S Capture",	\
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
+				SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
+				SNDRV_PCM_RATE_176400,			\
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |		\
+				   SNDRV_PCM_FMTBIT_S24_LE |		\
+				   SNDRV_PCM_FMTBIT_S32_LE,		\
+			.channels_min = 1,				\
+			.channels_max = 8,				\
+			.rate_min = 8000,				\
+			.rate_max = 176400,				\
+		},							\
+		.name = #did,						\
+		.id = did,						\
+	}
+
 static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 	{
 		.playback = {
@@ -484,6 +520,16 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 		.id = QUINARY_MI2S_TX,
 		.name = "QUIN_MI2S_TX",
 	},
+	Q6AFE_MI2S_RX_DAI("LPI RX0", LPI_MI2S_RX_0),
+	Q6AFE_MI2S_RX_DAI("LPI RX1", LPI_MI2S_RX_1),
+	Q6AFE_MI2S_RX_DAI("LPI RX2", LPI_MI2S_RX_2),
+	Q6AFE_MI2S_RX_DAI("LPI RX3", LPI_MI2S_RX_3),
+	Q6AFE_MI2S_RX_DAI("LPI RX4", LPI_MI2S_RX_4),
+	Q6AFE_MI2S_TX_DAI("LPI TX0", LPI_MI2S_TX_0),
+	Q6AFE_MI2S_TX_DAI("LPI TX1", LPI_MI2S_TX_1),
+	Q6AFE_MI2S_TX_DAI("LPI TX2", LPI_MI2S_TX_2),
+	Q6AFE_MI2S_TX_DAI("LPI TX3", LPI_MI2S_TX_3),
+	Q6AFE_MI2S_TX_DAI("LPI TX4", LPI_MI2S_TX_4),
 	Q6AFE_TDM_PB_DAI("Primary", 0, PRIMARY_TDM_RX_0),
 	Q6AFE_TDM_PB_DAI("Primary", 1, PRIMARY_TDM_RX_1),
 	Q6AFE_TDM_PB_DAI("Primary", 2, PRIMARY_TDM_RX_2),
@@ -636,6 +682,7 @@ struct snd_soc_dai_driver *q6dsp_audio_ports_set_config(struct device *dev,
 			break;
 		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
+		case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
 			q6dsp_audio_fe_dais[i].ops = cfg->q6i2s_ops;
 			break;
 		case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
-- 
2.47.3


