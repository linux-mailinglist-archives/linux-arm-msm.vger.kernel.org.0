Return-Path: <linux-arm-msm+bounces-95318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHjEDo4vqGlPpQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:11:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DED90200216
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:11:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B9D5F30DEDBB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 13:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34A0836E467;
	Wed,  4 Mar 2026 13:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="STGiRzOy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CVnkTMHd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEBD34A3D6
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 13:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772629652; cv=none; b=AovEzGDt0RC//WtAARi0AzOScrd18/PAF2/op8rLoY2AR67WPMHF2sBO6xp86DqYRPYwWEpVvaOagG3GdrteIlS+cj3dDAFZESVkuGHAuCkpkWPFO3davsFe/O2CnvgqkwCHt9gk/yMcX9OOqtDF2a7KejaVfcdqnNsivowE62Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772629652; c=relaxed/simple;
	bh=1AGWMMo+ZQ2MpMqgndQclqL9hoOIddPn00jRigW1KUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B8OHovIcFJQsdAOewAXV8EwlTMimMQc0UvYbScU80Ky66KzpR4Ug+U+QgA8k5jodkkDO47uvsF9GTLqOlHojnBkFwY7d3fhTSSH6pxfQvLm9ueuHKGQAOYszjVgCaYAcN2ESiDoQTzY4NR+GWqzXYHi7BoF2hn9j8QhMQoTNmWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=STGiRzOy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CVnkTMHd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624C23DD2306019
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 13:07:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2UA23pg+dGV
	Ambwz2ppXfyVdk6xlbVmq70z85L7JFXQ=; b=STGiRzOyvXPiZkgPc8Msq9QtVaX
	HIDfmhqAJcNVwgb+hLc7IwLxX9pVGHVQMQUQGeSeOORBMkR6SjaoRPwnOPm2p5NQ
	Fpv88bBLCiJNbDWLRVpu5FY7ig67K/41Br31UPqI9HIuCvLpGAK+0UwIiBqKfs+m
	CEHIUbsWzDfP+9FvONbBcAX/LBj2oaizmgC6nellVQzjf6SpbpPn6GdKAW2vX09+
	IzTnSl7onFSIDGtlsktNgLjk2I6vWLmKM2zJ0ZQvP1ecoTJier6+zc+W6BCN+bZh
	V6n3kHFV+ZgLq9vFQHZynt762pFKH/JYaGBoHXh06aM0Xdbn4PIHa2KFTew==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpau8t73m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 13:07:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3ad1b81aso69278985a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 05:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772629646; x=1773234446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UA23pg+dGVAmbwz2ppXfyVdk6xlbVmq70z85L7JFXQ=;
        b=CVnkTMHdDV4D3suRmBRlsxEy+qgDmnSESrLm3oxXJZCcQNvQ4ZAwBHswjKATRfPnZR
         lGPsYt6xIG/AWxokUgWRAzQnzHhY46xkGXxBGXctHlaelUZu1Rk3ppimcAkY+W0eP8XR
         diN9eKTJTBsmoE+54PmI/YF5OfEAn0yClCvmtVjNIO3DFJIry6Wy9eHtAiRaONlZLTpH
         XBXrihCXBuo+P9HZxRjbuFTCg9UmRZwjq5ipTbuzcX0+kde3pGCMUOWDx96Z+WCDnzhO
         uY3kFGIFTY7coD1x8U3K578LBO6+2gZPe5QUBMnCM+jJssm9sUmKcJqz0vAow6tv4SHw
         TrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772629646; x=1773234446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2UA23pg+dGVAmbwz2ppXfyVdk6xlbVmq70z85L7JFXQ=;
        b=OUqu6tytcBSfU6E61Wp5tka8ORQRkWa7WuQ9prw/3BsKzNUEoh1SzORK0UpzJ4Mxx/
         IONmHuCNqHAZX2lXycMtGC8UuwVxdnrUOfajNwBXHrhVml6JaZNVsF4wMBi2YVsdUnSx
         i37uLfZQmqzZCiwTZUwhd8SdJ9Lji+QvLj3LigyLGC8jyDS1zYkjIxito6YISWpt4qkN
         2ewgWpRLGm8HO6XBB3Yhm3JIv4eqr/MS19RHIXFKpNx3Vtl3u8fc7FffTz0EdaZxogj3
         w5e6F0I95VmnYDA6G6vR6jUn2+AmJWj5r+VCRGNC+nA0JNYnj79+gWK347U8orTVRA10
         jKjw==
X-Forwarded-Encrypted: i=1; AJvYcCVfkOJLF5AUJfgcmY/qUlRieRj4XIGXWDYTj2bdQPw3mto4qpCZnQOaUpkXRe7KwdhlLSfHfTWOrWl7q3js@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0c1mX1C4Xoo/KhOrwsKmsTTpIharYYGeKdF5olwxiqgfpui4B
	2MOlNt79fMH2+BFdhUDVoKPaE1JtOJcsHhcQYlkwF+Rbfx2SsnlsVHG2FA8olH4y2/mXZ7zViQK
	WizxpEvOAjLKfuJprPD8K+q39n1d3YGOo5vh4aApiwp+c25a0WnW7h92UdNUHggVQ3Udg
X-Gm-Gg: ATEYQzwtk2AA8XNG5i6kVKxp3KqUe193zQhW8WAUMYvzb0jR15sZvUlxiqqGcru+5Ub
	Ythr/VOw3u5JUApY8oepWtrFTbyMWF8n5SvGpy1yffXqTYrqkIlbzx1yzKl4/yCsskcrT/lmEzi
	1Hj6q0Y/VsB8kyfwUgXpZq0HpeEKPV6Zd/E8hnexed/SKic3sKozM6hBpVQxT4JKMsQ38c5wYFo
	NlcNFyJtTquy8mt4nV3o+KjdGrBM3DNeCtiSom+1DzR0t5SKG3RIZFsWTfXdimDslJTJI3foR8U
	57ywRsJmEIKCYLah+5KBvClXsiDs+MX+3ZM7Fyujm+24m7e5JuW1NC0KKhm57br16PZwI9iH7Qe
	BhIp13yPI/YadJ7puqZZI6ZSFu5rBmRGk5K7iwsx10ygde4zirIexHY8=
X-Received: by 2002:a05:620a:460e:b0:8c6:b4c9:aa86 with SMTP id af79cd13be357-8cd5af1b3a5mr218504485a.36.1772629645969;
        Wed, 04 Mar 2026 05:07:25 -0800 (PST)
X-Received: by 2002:a05:620a:460e:b0:8c6:b4c9:aa86 with SMTP id af79cd13be357-8cd5af1b3a5mr218500685a.36.1772629645556;
        Wed, 04 Mar 2026 05:07:25 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485188122a6sm49969745e9.12.2026.03.04.05.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 05:07:24 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 07/14] ASoC: qcom: qdsp6: lpass-ports: add support for LPASS LPI MI2S dais
Date: Wed,  4 Mar 2026 13:07:05 +0000
Message-ID: <20260304130712.222246-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304130712.222246-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260304130712.222246-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AJS1/0o2 c=1 sm=1 tr=0 ts=69a82e8f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=nvRDalaNTaWZAukup-IA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: -VwXcFo_oupJQUJmQLTEYZ4Trkp6iIbE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwNSBTYWx0ZWRfX6K7WAeDwA/DP
 KkRHGc4+bW+T4T1ASnYqhx31UzZKNsdr2af9XwQ77Klxo3DD/tN6R7JXEt0dLYkz3biEBWAPSsU
 uF0e+dU1MAsX3D4Q1u0xp6vmS1BPHEGS/1IuHeIShsv20zXDan1Hed46O14szKe46nONMy7vN2m
 KdK1Gc/JgG3K+xa6OsM1Av+35IhIhnK8Z0yB8Bn5tMA0U/4k7LbWhZIUtiqPxgQa//q+9cBOizf
 2ObskizKiEBu8U9sLywYJjR+KbDhYBXMgVu9nSrIcjIY0DGL6hWn4HiHlp7IqUl4tmDftxYJsF+
 DLsTWuJWmG7yFbOA9Luo8OF8+Rn0OzYaq4Y7ZwO1y+k+mEJkTY3dh18HAE7RdLEYe2bMY3SHXpq
 HU+WBD7XmsDm0bcPzb5b5Y5MLZLUjV3juOVyTDZK+XIcfecBWoK/zYLWRosA89apmU+MQshmB0w
 hZn69o3jEBX+Po3f35g==
X-Proofpoint-GUID: -VwXcFo_oupJQUJmQLTEYZ4Trkp6iIbE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040105
X-Rspamd-Queue-Id: DED90200216
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-95318-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
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


