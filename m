Return-Path: <linux-arm-msm+bounces-91953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLuYLOnQhGk45QMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 18:18:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1695BF5CD9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 18:18:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83B3C308D6CD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 17:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66FE02727FA;
	Thu,  5 Feb 2026 17:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zsm+aa+l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J3bAmpw3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BEC43CED2
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 17:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770311664; cv=none; b=fZZSiGIfdJJK55B3YW/R8qQ86ExHXrud6f4w9/0PtnmgL0VPSzfxCzeSjF+vxcpRhLfDI0i/B4q6uDUDamocL0dkdIN2vFGe34388ub3EHR2Husjb7dULEsacqJG6sw9K8SZBTNBQwwsYU12BhOPDzvJylQBW5nZtDErx9sSxVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770311664; c=relaxed/simple;
	bh=r5N8Z8hPz59oN0RNuGapAQnXLzTPhHdzsNfJMM8N9DQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sZ8c00pQFKyO/d2QMjOvfJHRWinEe1y3oktJ+PvaPWvjdOWtJf2LwnmfD7m8H90MS69mtB+QI8+lF6babiiwNBRA60f5cmb4yJO4SmUcqhPGAm2RdpiDiARpILeVmW0vQt29yeTs/bN9Pty3nA8+x8fvYTazqY5Hh/sCya6hlkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zsm+aa+l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J3bAmpw3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615B4019176910
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 17:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wuA8VwYWX47
	mki1E5cO8ixPzJqRo9fgaXlZKqhxVW2w=; b=Zsm+aa+lqpY14jxn+95qMxfd2uk
	FeLzesTaQhhGrD3cOPU0I1WtzuJz2R5SDap2mpV558ESToe8jTe0KIKSWj0Z9QVn
	oAZgxRFkyGluZLAu62IO49naW+3sXSqu47HKp0a5ZTlRS7ksKdRkVz9tt+pFLNUP
	3tIUX9tk6KzBixQp3zf6BB8k9zLivc1EtQWwZm/XZvw6CrTB1aKirJhlRODO0EED
	ONMAIccduZyxnAvcyMzDBccP5kBYfcRKnmMbFcGP8/7NJwJ1+b/dQ9HDXy2KpOny
	TsuJ+fBcyWq3s5EGMlsV8WWFIvoXAbNDT4WyV7DAYJUTCLCSPLXTGOzGpeA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4t0p153n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 17:14:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52d3be24cso181517885a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 09:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770311662; x=1770916462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wuA8VwYWX47mki1E5cO8ixPzJqRo9fgaXlZKqhxVW2w=;
        b=J3bAmpw362R1m0Ejq78Fyw1F2pBVLauMyMV3kL8jXqh7kMyfSbBhiMLLBROLO3ZLw1
         tGgs2ox6cV2BSnVjwved95+z7jF8Sb4duVW+8P0gp+75mxqcqAjK2lFALRlv+ZZBjscH
         K0yfDGGKeixrFqVNj51K+lCn2o9RW06AaKJ5uLIlU9d41JJHsR5/EwU+HHNotQAsscjH
         d6/nJfsmtluwozTbm+zCMCm1Yq4qCvsqa90cf/ifxLbVy63UtqLnpZ+CuqFlAoqs4P31
         mb52IwgP0bCN4dQrdZFSyV0s3fmj+xUBPJjiQqyTtmnuPr38bv+dpN3B0xO4CKZS5i3H
         /Jfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770311662; x=1770916462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wuA8VwYWX47mki1E5cO8ixPzJqRo9fgaXlZKqhxVW2w=;
        b=Lj4rnbWhoIM5+gZ+lx6/hb37pom2UsXHOMf7jp9o3cOvmZEhQsh1Ml5X+zWbZt5WpZ
         iZcQteD+/Cm1jT30O1Zkd5WZSDJAl29f6thk0iFJyNYLyyZMKWiAzqiuDQXT5VTmpiVh
         qpD8bODrbUd7Ne4/K35z6iz0rbgCk3T/zmDW9Mh0gcGIHOKoyAfQINkemw5G/cWP62fe
         +Q7viLP58hFHYGrFjcGJyDPq+4UA0M1qY7uya080RNfem434wLyhgdWtUiTNCZEzrxdq
         /xCQsQwwZhrTvTU8+Ff3OKl+rMexy25JtzsjbfS0k3wuskosxXrrn+YHJsWMXjlSJXih
         jGnw==
X-Forwarded-Encrypted: i=1; AJvYcCX86CqG/xhODapzZQVovIiovvH6aiHVwb0u2nAd/pe/nTQnqs8Hb/5+GCD7nUGAmdU0xeHv0dV7sikEebLn@vger.kernel.org
X-Gm-Message-State: AOJu0YxgAIsVPw7sNHpLncowc1W2c5qkXW5q1F2kLZU8JokX3qGdd7PS
	10W7cJD7Vx8+cb5alt1Hpp5CUBGr46+cCDKj2GRI9loH+XDrfOcNBASaf9fl/m3/WwpP2XRevan
	/kF7Z3Gx4psTcja/N0v05aldffjXQ/oscSwR6UaRbaBGniOMoAZHLeJn5uNsjwphuWj9p
X-Gm-Gg: AZuq6aIT0Y5B61A91RlH1DOOx7FRB91HeEdDq+TDRbD21yVLL8vu3lU+igBd4cIceO6
	toe/wize5WFKfmoFM+YJChkMieOSM4STFO7J7Fix8hUxcLY/py8J1H6NaMA6Zy0BSwGZQeY7bgz
	GlLA8xKieXXRzJB64mIrmfnZy9Q61+0XT2umkrykzHPMeHebJmeZ2B8qZ2vH02h1ZmNJSXAKPdi
	gGUVfXpxgJuZwWXjPLmSTgMT5s35c3HIG8dkO4mTT3AxA4slTUQrxwic5gXU60vraoQYQTqB6Ph
	oixjUo0RS52ZFERpUSliH2zA8/atSa1e8geV0CcnDhqKUketLYN/rSFCQJZMz3dx/XlShXRqw01
	Ijx2j9pO6oTEOg9JzhfToGziOmzTIRnySJ1cBxjJKt0E=
X-Received: by 2002:a05:620a:4892:b0:8ca:105a:298e with SMTP id af79cd13be357-8ca2f9d98cfmr913457485a.63.1770311662489;
        Thu, 05 Feb 2026 09:14:22 -0800 (PST)
X-Received: by 2002:a05:620a:4892:b0:8ca:105a:298e with SMTP id af79cd13be357-8ca2f9d98cfmr913451285a.63.1770311661978;
        Thu, 05 Feb 2026 09:14:21 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43618057f87sm14802849f8f.21.2026.02.05.09.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 09:14:21 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        cnor+dt@kernel.org, srini@kernel.org, perex@perex.cz, tiwai@suse.com,
        alexey.klimov@linaro.org, mohammad.rafi.shaik@oss.qualcomm.com,
        quic_wcheng@quicinc.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 05/10] ASoC: qcom: q6dsp: add support for LPASS LPI MI2S dais
Date: Thu,  5 Feb 2026 12:14:06 -0500
Message-ID: <20260205171411.34908-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ItITsb/g c=1 sm=1 tr=0 ts=6984cfef cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NNISMICuKrt3OvTWregA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: fMZFCH-w5lYTG3F2tcGndHoUqdJhWTIE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDEzMCBTYWx0ZWRfX2Rpg+2T2ZrKy
 jI6AyICq+Hb8dVyMvL4kpR8E2zISIXN41iJOtPVcE5PnnXSu/SHz9i+7tvvHo9wPjk1KsHF+7ET
 2Ri/gDlsFsA9Da6uKCImE96Oncgi4gxeqXc+ypUY89bKYMQA8UXfEobpGZPWr4sCuwcCGW1q9Ma
 4wRMtfT3O53wWiLJkhs1h/18fYHmgqmcbesFrP9B7p2+8u4GvtFdbvtL9PkR51/yWic1SPCc68j
 QSvqnA1k5RxcRw+hrInZL+moxdUe27/BA/U/bYXUIQxbC0z0/104uhTVMt+lYL0rtVJimXUSvaq
 Z3DP67ouWsiEP7euceyOFZU0WFvVplnsYczPoWaGEr7EYXPhCUEMgCBlhrs6RltTAGH3VUnfXl9
 3iLGcOgm1peewIhsqBLKqgm9tyIdWmcyaGoz2CPaVVnS1CuE9puSnxW/lB0u8FVgqfzB9hh7eUR
 kDeRPjxi9VfQsoh/G/Q==
X-Proofpoint-GUID: fMZFCH-w5lYTG3F2tcGndHoUqdJhWTIE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_04,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050130
X-Rspamd-Server: lfdr
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
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,linaro.org,oss.qualcomm.com,quicinc.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-91953-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1695BF5CD9
X-Rspamd-Action: no action

Add new dai ids and dai driver entries ior LPASS LPI MI2S lines

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../sound/qcom,q6dsp-lpass-ports.h            | 12 ++++-
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      | 47 +++++++++++++++++++
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 609bc278f726..0febc641f351 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -140,7 +140,17 @@
 #define DISPLAY_PORT_RX_6	134
 #define DISPLAY_PORT_RX_7	135
 #define USB_RX			136
-#define LPASS_MAX_PORT		(USB_RX + 1)
+#define	LPI_MI2S_RX_0		137
+#define	LPI_MI2S_TX_0		138
+#define	LPI_MI2S_RX_1		139
+#define	LPI_MI2S_TX_1		140
+#define	LPI_MI2S_RX_2		141
+#define	LPI_MI2S_TX_2		142
+#define	LPI_MI2S_RX_3		143
+#define	LPI_MI2S_TX_3		144
+#define	LPI_MI2S_RX_4		145
+#define	LPI_MI2S_TX_4		146
+#define	LPASS_MAX_PORT		(LPI_MI2S_TX_4 + 1)
 
 #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
 #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
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


