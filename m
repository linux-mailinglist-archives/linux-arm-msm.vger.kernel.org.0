Return-Path: <linux-arm-msm+bounces-98944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEarIsZhvWlF9gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 16:03:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3E12DC3F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 16:03:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E89A930D948E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 14:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AB133CB2D5;
	Fri, 20 Mar 2026 14:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eMj0TbLW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cfQ9BrjQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBA03CA4AE
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 14:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774018178; cv=none; b=iN6w6OMT7pT/3TtNtAggRgu3f13/1SWn200xjRU6WZEwFBGWEF+fRqPqK/0JPIZSjZv1pVtQ0cLWQayDnI1XHhUXP3L9YHOTKWCAJSsTQC1SSu6x1eoIfjmzwP9ZVlcSXtQr/9dbpXElcNmFGV1BE/1TLdZTy09xE+co8ICaO6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774018178; c=relaxed/simple;
	bh=1AGWMMo+ZQ2MpMqgndQclqL9hoOIddPn00jRigW1KUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JU75JiOF50nFJV5U9O6dDQb24s46XVhTYWwwnlGLK3VGOpaZFCzhKKtz0vTG5YXFVBEoGKEPQkglxmn1m5RouC3p+r3DsL/5nlV3qLcYBeTvxIHddKxViieiXt02I8EX3qzaRiKc1Pe5u3XwhENNNvj3AmNCGwvkO0lpwnlSl5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eMj0TbLW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cfQ9BrjQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62KBs0XQ3874981
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 14:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2UA23pg+dGV
	Ambwz2ppXfyVdk6xlbVmq70z85L7JFXQ=; b=eMj0TbLW9TnwZv5eZisp6ltT93f
	vKBIFuNjscoJjw2nSmLYL/4m4adRbZiST4b9ChS+by6MRry98Ni0Uox2Uy0Z6Rth
	P5ks/Cn6R9yGWpganhME7VmcZJ48o/4KN2cNhdZpxljKNl072KwyIZglLcyyJkuu
	ArNipY5IbFt+x4SzNWk0Ff1hPPYjWtbGaW5NaQqaYzyvD7FbDD/rxWNslJinjG/c
	E0ogYkaQ6Lj+YYy5armXA9lcWl5WAHbcVqz0RI3ZRBtNzhxFJjilc3n6H4jU7Wv8
	U4Do1zqZAqBbr6qzA+PIRoeO5gXBx51bKeLLsnuMAVQImvCcvZjskNCEt0g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d15s08e51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 14:49:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50921f7da6dso4836501cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 07:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774018175; x=1774622975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UA23pg+dGVAmbwz2ppXfyVdk6xlbVmq70z85L7JFXQ=;
        b=cfQ9BrjQwmVRJG7acdG7rck9IEifG0j5ZL8/zQIs0BdC6Ze+nhm+LtqYTTJgmshGrR
         hkCUbh68hTt3AK/09VVIMHMVVMQ3BJBbLuKXTF+sjzMKW2oO4tJuBt//gZfuGJHEJxuM
         8SDVgB9gdClYVljbv/Cey/qrZ2sGk+mUn9gNBD7ylxw3wAusoo9PMmIIN+vhHizBvSb9
         UHeLe4P+F+Tq/U2HFNwe+3DrLfNkNY/EIseDogsbPQ7rxqjwMARDlWp6GhVclj3RVX0m
         OQg0v/ecG+ThMwDwkcj5UdR13EPzXhMWRU05zn276xQW23EUvElT0Ro5jGmKksh9KNzr
         /o6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774018175; x=1774622975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2UA23pg+dGVAmbwz2ppXfyVdk6xlbVmq70z85L7JFXQ=;
        b=dTU36k0eJbLMGmnjS0Mym8SWqTKmswCLfLcU8ps3FUE7HxofyBkbbDjlBz587f8+JN
         TjX8t3HcJS9LLUVcV1E+FH8GTUQ1eo14pjjIGD1FaJWLSwtUlXLzwCwH//90liTjZMsd
         wv699XRG6f9SGvhtUm0jMGOtgyEGLLch50Xx5tdCYEstHNDwQ8xvEUdXdR7RLmHOnEpU
         w9LSerSLvTpBkEM+izCjlaqi5rzLS2JW/q89xk0oWbyJ0ezLgwZwxGBhBJrEuZUNRM+2
         T8LVoWYk9UbYVPTDlC9WDMRvoT2uNB2jafYfIkc9ncmwEPG74bT6itLncj3aJScdJv3o
         jSdg==
X-Forwarded-Encrypted: i=1; AJvYcCUMY9U6x9p0H2ZsKLqV8Ls6DGKOVPvYI7TcXPYjzEns4bt6kdLk8iRxQ3EmI+0SeoOHXe8rWV5SY9NQGDLk@vger.kernel.org
X-Gm-Message-State: AOJu0YyBIt6xt5Xm2KuIf9mlwpd3O4NKiiULo3vC5309JdN0+/z2Hzr/
	dORTsOPQ9WGsvLYkvnKQ7TM1v/vV1E8Dm2t8MyWWhOCQ57JRcJQSn7dC7jtAgQnKdPvZKEcaQkC
	KRc/N4/MmNpiDXNErasaUtgl4HTLR3xywr9zNthcAQe/otmDqlMe87t+kT3W6h2IMDnuA
X-Gm-Gg: ATEYQzw13mgEnMXimd9igwuL1AXvphWmQpyLsK8lBFsUlAO+eAv7NGU/XETr7eh5Gq3
	XyeYWckxccxkO3FaCjjxI2qfWSxtueksRFgDZ0uT4A3Ort1xMEQtFNMXdBU16z5bHYlvciXPB+G
	B9EFh5UJk0FovM0Fy7bqSBUe7RenSPjwZ+4VPygVFHbSXfa4dbjfiQUmKHS1+4Y7Bi0+M3wzld8
	BSccxxzeCojWjsAififdUdiDN1L1WtYpFR6UFnvT5dBMFvy5CCrT87rhsCWneUhl8uJ5RV9H/k6
	ukWMRM8uGLgrnYXww/1JGwqzIeoZoFshaxV2BX3YN8aYYMwS0hX5yTsnxhjV+ZM1u/GRsDrgehm
	xt9FPmIjDPh32x4QPC6u6zcRvCQqBIibn6BoXKDbuygY3Q+vUiEV+vvI=
X-Received: by 2002:a05:622a:cd:b0:50b:4051:2cab with SMTP id d75a77b69052e-50b40513540mr22009701cf.58.1774018175009;
        Fri, 20 Mar 2026 07:49:35 -0700 (PDT)
X-Received: by 2002:a05:622a:cd:b0:50b:4051:2cab with SMTP id d75a77b69052e-50b40513540mr22009001cf.58.1774018174465;
        Fri, 20 Mar 2026 07:49:34 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff109b95sm47906825e9.1.2026.03.20.07.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:49:33 -0700 (PDT)
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
Subject: [PATCH v6 07/13] ASoC: qcom: qdsp6: lpass-ports: add support for LPASS LPI MI2S dais
Date: Fri, 20 Mar 2026 14:49:12 +0000
Message-ID: <20260320144918.1685838-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320144918.1685838-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260320144918.1685838-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WkUzlHhTZdQpDbImauE7nLdaBHaqxV8X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDExOCBTYWx0ZWRfXwQHpV24kUky7
 YbNPznzPxUCad/INqA2HwCMKtK7+kSFHL/SNleYjL/eyj9FnHgE/e7K+et/InJgh0EZ1VgP54Bn
 Oueks+cWHTRSvsL/SYoUwgUKoT0fhHNLyrPlrprf6/C/UYkan7P/n/VaTPyki2rzin2AmY/N4UE
 59y09nAB2hA8MGhuByEnuU2BIPJrezigjBfmwjRhkKS0JcmdThh5L07RqtMHCGwdi01kf5NoGQU
 0fwnS6ST4wCB9ygcyMPfswl5RmxFEqVTMmldEp7CnVlolMDQsLF1+Qtt5yPzZOM7IeDSI9abnwN
 120GahM3Spw4wic8dpVcnJtmewUwtstEhTh1qk1zZzZ+4kqWlit1/RCiYHhYAcL1hJicV0RN21j
 GtsO9QaVgdfLz73S2P5N/IROXHvGpHn1NScztZ8JGycjEFQ97JG4DodcZlvf2hVSuDHstn/OWZ8
 MVyrJVXfNA4et3CKWQg==
X-Proofpoint-GUID: WkUzlHhTZdQpDbImauE7nLdaBHaqxV8X
X-Authority-Analysis: v=2.4 cv=KORXzVFo c=1 sm=1 tr=0 ts=69bd5e7f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=nvRDalaNTaWZAukup-IA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200118
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-98944-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.962];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CA3E12DC3F1
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


