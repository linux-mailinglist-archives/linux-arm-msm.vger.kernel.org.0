Return-Path: <linux-arm-msm+bounces-96126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHUcEtNurmnCEAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 07:55:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AA240234804
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 07:55:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3DB0430630A9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 06:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B26A1364EBA;
	Mon,  9 Mar 2026 06:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g8L5DxLp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fk2jscVh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B74364E86
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 06:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773039114; cv=none; b=GR4BbMwfSHvNQo2syyzAYYezyib6KyyKD7iKGQYaB91xpihlAaEvem6xUP3SnmYKquDb3EohzvYY/pV9O0IA3Cxn8BhYAFjBSGTnKeYZWtHphIeI63hkU0Welvq6+5aWMzWiY0ZLEhpYZoL51YmDHZ/RHq5bDExSZA6m7tKpf0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773039114; c=relaxed/simple;
	bh=1AGWMMo+ZQ2MpMqgndQclqL9hoOIddPn00jRigW1KUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c2VueYcWBK2hmPvtvVik9Wskpi6OhFh+XBhlSvfUCd2vT1Pdi1Jdi4zGrPv15jNYRC3eIzJ/nWViKVKe7lqFee59mDqNeslEzLo9imb2TQGD95ernq3qlIS67dB0HyqKsWvl/d1ybNjibpKDf/HpPNNvx5V8uJdi/DAadKKtUUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g8L5DxLp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fk2jscVh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62961S2V1186455
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 06:51:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2UA23pg+dGV
	Ambwz2ppXfyVdk6xlbVmq70z85L7JFXQ=; b=g8L5DxLp5yKatlPFxlc6ckn+uMd
	taFLoGQTsXy6fI/v6KAM3DSmCdlEF05Rrei7QrC3hL+iTVQTjO/Z9ShkA0L3r6Fr
	k0aR9xDeeyC107AIkj/sWgcik21YCRKyo88/xIfhr4m1v0OTBBbzy1OcmltQ6HOr
	iE1cXtsNk8J+bBaGLo87ocNPhhrJ8lGarj2e8w9KnLgn34cO5FVGYHhOQOzNx70/
	1WVJRmG3FlDnZzZ6zdpc81Srt9pjd4QxG5uRZJtjhVOI2kvl5p2hnxmHwD47XmTU
	/PotlNbJwlH0VbeEMndmQnENs8sI+EdsHZzPG3zuLH090hM64GH6Uuj9IgA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crbbg48kt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 06:51:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd85e08fddso817534485a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 23:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773039111; x=1773643911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UA23pg+dGVAmbwz2ppXfyVdk6xlbVmq70z85L7JFXQ=;
        b=fk2jscVhaEFS8qLs6w9ZIo0MZNXBRDtUIXMIX2VzXYJdjwzRNn5v5LheQst7GI/XOy
         z5IJ61dseTxrGZYQcLgvwvEhSN3yHULN35dDaV6Gcyg/q7tq0puj+ygRDgtJ6qwkRJBV
         lquSnDAR74k5oPmM9Qsr5wGzJo3SbBju/KmiggeJH+TDXzbH3rSVASBrsnGrR2r57QSm
         p3l4GnKbEs5UbzAlns+eQ0WbozjT71W++mOC5RL0DhJfht89byD1Cu2qNmkO5OrnGAdi
         nu5QVWl0ERFlr8fmL+Pb7unX/Q+uykcDTbFS/5YPQv7DR9S2NtMciVDhlEl1j1x5hrk8
         Zq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773039111; x=1773643911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2UA23pg+dGVAmbwz2ppXfyVdk6xlbVmq70z85L7JFXQ=;
        b=DiVvukQGKaJczWXELaQGrZghcYIxosZoIKODwds77nmF6PnAqp2JxHrUJG9yP2mdIp
         nPeyZI2bk8AT/Cgq8BMYab4TaqbKie44zfxKgUcjDnSh5FOkjPXbm4TDgj0sJrmId8JX
         gr1YEbfhx05TKM5MNFKiruNw2SE9IgIeFJu4CJ9orDO4XQCIHff4CvTR5OmUJ+GGe+vB
         HXcLZQpdgiCyM5awggMQE2Uma4Tvxpx7jovPR6aizGGAWu000MFliFBKEt9rX+ml99i/
         pr9ENABSu5arTu1QBNcDWm1DwCcAZOBJVFiZ5o+Bw+TuQaqCTNVOwxjsrTmiDWRKt1zS
         VMAg==
X-Forwarded-Encrypted: i=1; AJvYcCUwuzh5qDCEeTkC9PmVBLwFklzvFmT6PWOSA2VDX5t9Ck6O1BnPAqVkn+MBLRmGfgaMRN5ComikgKn7e8NW@vger.kernel.org
X-Gm-Message-State: AOJu0YyR7VWisMCwNiZy9mMkaEnZXctyxPtSqMi9+c43iPnNTT3iNOfk
	8obpS0BvYWyXqatqkIjiYh7CgpgpZc+LFNLHLPZYDPTazgYsnY/VY4PIl+RL5wAi+9XSmjYKsQy
	eMLkFm/PXuXDH1a985OaOe4W6LDgh0HnOwjm4k92frTJu9WY4RFrc+ZY4pDUwTG+j3Utk
X-Gm-Gg: ATEYQzzMpdARhyZV7codMWk2pwI5BUIeXIapqeXRlPjtksUvrFKN9mEt0CLBFn52EjJ
	pkoCe1XyGx/ZgU2oU+Dsv+A4uVHTmfkXye6T2p9f7J9y69ckrappUcTExvk2XJeYBx0GqTPi5DC
	ueaJmx7fUVyRlWJx4tTVsbL3KQN04x98S9rIoSMCNql4G38BoSCEo53lIJKsC16HZVsWyKuwAN0
	j+GJNmtHXxnp/aE/FsNt8Jfd4MDxDrbCz21HN/UUogY94jkf1O7PwO4inUhplRDVAfSGPnLE+dP
	bFRe+RmdMSRc2+BqoS8f+SCZylD96HIJ1K2sYiocQkhgWmRx2smj8jadi1PABTSg/e4AxQ/wmYH
	+1BDFNjvKHcZfE+lobibagTqZgT8SpmUAVhxpVEgdGg/LTWs7cJQ7EN0=
X-Received: by 2002:a05:620a:1a8b:b0:8cd:88c7:9f96 with SMTP id af79cd13be357-8cd88c7a3dfmr333893985a.67.1773039111508;
        Sun, 08 Mar 2026 23:51:51 -0700 (PDT)
X-Received: by 2002:a05:620a:1a8b:b0:8cd:88c7:9f96 with SMTP id af79cd13be357-8cd88c7a3dfmr333891985a.67.1773039111115;
        Sun, 08 Mar 2026 23:51:51 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48529f01997sm80449975e9.14.2026.03.08.23.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 23:51:49 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 07/13] ASoC: qcom: qdsp6: lpass-ports: add support for LPASS LPI MI2S dais
Date: Mon,  9 Mar 2026 06:51:31 +0000
Message-ID: <20260309065137.949053-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: iJ2-UFUQ1VFepIC_VwVKAJul_k_HvAst
X-Proofpoint-ORIG-GUID: iJ2-UFUQ1VFepIC_VwVKAJul_k_HvAst
X-Authority-Analysis: v=2.4 cv=SumdKfO0 c=1 sm=1 tr=0 ts=69ae6e08 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=nvRDalaNTaWZAukup-IA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA2MSBTYWx0ZWRfXyKuuxNO0M3J3
 Tn0Fh1ESC3JaXM9CAVch5E+qYig9SCLO6MdWjy5Ndcdoqyup2GgeXQhSWNGkzG4RkxW2cFIV4Mp
 Mhmke5xhlA6hmefu/+PabBtoKwQJ1uadClHkPXDOps5W4dk5nvALN1FS50vEIeN+P4LydO8Oret
 ryAIg8yg9SY+tPSvjz00xKtjIeFFrJzZIybBpCFmk3LZ4B2eJTKQwfBqDcATVmwqCrw5iXsdJ+c
 Sp1b2ba2+vwrP/CTuvFg5AmlZ7u7LQcJURyAwAuJ8lrsZ3NtrgtxrAqMJTsaWJSowEodlEs7Ozy
 +3TVAkDpPz5BYTPAiQDmEPc0FPAFF2ocVrnEkLnDHZrEbFnbfmJdabhwzuInh1RztD+KEsd9LoX
 uuoMnI5lDiZ2O4+LKHActL/glhFXyFqO2lWsxKn27dDr1SHR+VX0tBbigVavAIhcHfFEdLp8MOm
 FEpG32uBdwD8gWzChmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090061
X-Rspamd-Queue-Id: AA240234804
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-96126-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

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


