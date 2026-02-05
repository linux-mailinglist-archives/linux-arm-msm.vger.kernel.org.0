Return-Path: <linux-arm-msm+bounces-91955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wM+SIwvQhGk45QMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 18:14:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A55F5BBC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 18:14:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4B71C301061C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 17:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFF8443D4E2;
	Thu,  5 Feb 2026 17:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mCK+jooc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gg31f2LI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AAA43CEDA
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 17:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770311667; cv=none; b=aaxPYDBVRpRIQ5iRqB3jVYv3ru7I/9Lta9CN0fgySJG0S6PIjpM8nopJoLeLb1vMLlUE/RJO/DvBh+lUOoxEmnJ18Zp+i2sv5U5mgdrf2f1IgfrlJNHWoxeYHYAV+ObLltZdP3RuikZujB1stKJQTZ72qsw9D6GBKeHlgOPtjf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770311667; c=relaxed/simple;
	bh=mDW997OLPhj9/cZiWF71LObptofAy2aHxMQZYNVrW5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GuAAxeptQ2eCnaNRWeWiax9edJ0eQHXuSZYqtpBXrssV4cxXvxmOxQ25GwnyhBEQHnYhW3sba+TupjvvxFCGCNca8Ad1HP3XZ8yPekZajZTzHpCn6wXzxygujSUhs9YhIoLvSDgTkV6d3Ks0Z53qRvoHZiYMfPFddDv82ixloU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mCK+jooc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gg31f2LI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615B5pId3237394
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 17:14:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TSmNTbeOuD+
	fL/CAookHlWTYOHGnEPMNf+RyYw4NXHs=; b=mCK+joocnmJqKQFky4wSZx/JxCw
	B52ySztCcFnGZmn0Cnsv6rs89Ro0Aj6CBXHiwf+olV/p/gucC/ip6Ochq7FhymEX
	JxCSCUHrJ93RBmhl4G+1TNm2dFjc/hkTXGDS6dG1zOZ0LMa72qLM47E0iGlGA38K
	PU0BJBoNdf7pybnpv3eAlnAfLxT8lucz6UbDIQhVvSnfjGNSYpL8Jl3m2viGHR1y
	jQlfQjG6Co+AxKjddiAymhHiAFUZwBq3aCZbBhGyvIwEiWm4Pu+S2Hkp1NE3+UQy
	4GBgFw+flhwRG3GvIu402rC73gEQ5kzel1BvBxDtv4OXU8MtLFP9UWLfTTw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4cp53h9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 17:14:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70b4b53e4so498416585a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 09:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770311666; x=1770916466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSmNTbeOuD+fL/CAookHlWTYOHGnEPMNf+RyYw4NXHs=;
        b=Gg31f2LIz+5t44EEy0+GS6bimr+GQ06adHLUGj8ij1W7YB5XTUu9mHV5Is2ZDQ3zsV
         Bg/kySDmZ0Y8NB4PnfmA3WMmivd7acU0qUtCWsNAMwG7aMvqvkDq+KrZBkPmAg5f4F3o
         fvAeqp3spk34etypEKE0Fg42CqYnP4QZAXzJn9Cy9EDfwiWG6qtut+wflRwqYaoiWp0B
         5c/8B8ermbjXpHtEGQzZlYX1fNN9hV1Rnxd3j80leHdAGcqfBWovnKFkY41kUaYgoXFt
         dNWBsB0KYZ2iji/Ks8qx19jHJwWQxzSuXU5aPNgx53xnT6NoSiQku0Vy6F2T3IpHKHqS
         ymtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770311666; x=1770916466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TSmNTbeOuD+fL/CAookHlWTYOHGnEPMNf+RyYw4NXHs=;
        b=wCHRvtTcmRww1VixX7z4bF7C70RWqLZlGPZl/A1g35T7uiFpQkKvCRgYmdFmJi9zfP
         y/i8tMc9elhMUC43lRhxxLbU5SZTxaeJWBh39p3SbMRNO/sRu3QnAorPZZK5uuNr0uuW
         e0t13aA8cGWSKDVucukkz8bLfVIdWnvE5bHlbkGD9zZ/y7hvoq/dUCmXz7bhYh2186kV
         DmTnlweHBfqQBqenUaEdeu8HKL5PY28KsjJCvCXV6vsxzQeTklclQ0VOjnjm5yTtA48r
         CTzoskzsXYYM1vYpXPv0rWy+foiP9sIM5LrtQz9VlYUdteI2x5oO6tK4M+/CfR5qhW4N
         wMdg==
X-Forwarded-Encrypted: i=1; AJvYcCU3VayZCbKgCBERPzNaZ8rQ7C/3cl4njDeLv/8Jm6VRRA/djHrd/0hEf78yZKkSsqlMMNm8LK/cte+r2+Jb@vger.kernel.org
X-Gm-Message-State: AOJu0YzX3Xbkxn9lLTaQbPJWBRrbFbvGnRu5a1BWSota5EhWl0TsvizT
	Ar8XWP+S3f4UWDLENct/e5KJUpkMVwzjXMtV4U65WJwCEpQZ0m5JYZRhSa2LcjWiboH+fa9BeYp
	4e5eHTu0nHGvsk2c7hineqoS34PaUa+hF0tYnMpCacNZ2MVRtXa2r9bC/MQkI/kALZhHa
X-Gm-Gg: AZuq6aLskivLqypsaVGQ2xc9iHPHFz/cCO7frrCXeMkpcqfORT/IA5Q95Boov1aKIjj
	Wuo30oyUW5tG9iQ696YMuJZv41jc2QlXcaVBLy5O2sPAWg9HS9V8MQtexBr3c1Ui/P9ETzfrmue
	obsUR82/F+a5tj4vuxxiMas84ixf8k1SL5x7WN/D3CfzMZu1EEDrDeB7nGrfCGFGwcQtGCL9+J1
	xf7Q+5rx1YYpVr+n2Wt2KcLKDrx436Xlenf30SFV206q+cyw4yxd59Bu95Ye9/Vvidk8Q+X4Dda
	C6H0PyuGflNOmAs0KUp4mc/OHuNLmH2KwG8M4YkQQmLnxPxgn0zyWPMOTq4fx6UWXG6ik0MM6GF
	h1/+IgXVhhGMfHY+P2AccDJWfWVSlUyIe11zZPm2chWw=
X-Received: by 2002:a05:620a:3953:b0:8bb:7e56:f204 with SMTP id af79cd13be357-8ca2f82c96amr937667485a.20.1770311665764;
        Thu, 05 Feb 2026 09:14:25 -0800 (PST)
X-Received: by 2002:a05:620a:3953:b0:8bb:7e56:f204 with SMTP id af79cd13be357-8ca2f82c96amr937660185a.20.1770311665100;
        Thu, 05 Feb 2026 09:14:25 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43618057f87sm14802849f8f.21.2026.02.05.09.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 09:14:24 -0800 (PST)
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
Subject: [PATCH 07/10] ASoC: qcom: q6dsp: Add Senary MI2S audio interface support
Date: Thu,  5 Feb 2026 12:14:08 -0500
Message-ID: <20260205171411.34908-8-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Oc2VzxTY c=1 sm=1 tr=0 ts=6984cff2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=aBFzMgE2VLA-TvnT3JMA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: dYyCDV-aiWGsZ4Yrk7BUfreESdLKZV_m
X-Proofpoint-GUID: dYyCDV-aiWGsZ4Yrk7BUfreESdLKZV_m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDEzMCBTYWx0ZWRfXxhr/deTtu40M
 MdDoykxXvt5q/xX9U5EbVBN52/Andnc/p7i+WyPHni2u7tmI4PSl477fmmE5gd/x987L3kRVV2o
 VcAphHRuEluKW/0LrMtT/SXL9pc3Oo4LeVNhsVL1qhD7OHZV5oyqR76YD1K9L6xGMm7bKyClrW2
 iZyYE0FuIAIVUSJ+uV+4h7ARJgvT2Q0bKtlOvmGIBTu9d25mhwNQRotb3evBFEqn/bG/izeRjzn
 d95JZlGG6r3h7g/Wbi/aG2mv4XXIVVPX3es8ozTtJONYcTsm5WlpmVMQSb8dWGb4lTkOVSXcym8
 dLMCUCmt0eVwGE9PKF1sGbciZ/HhcRqqZ7DbGWZSrUPQSAvPl4ogQKFRFxNLVjieqiC0MU5To/V
 vp31AR5w7UKQt2yDR1nkMjI9eHEYEtx0DsM0wNuadonoWabq/HLG+Y2XuXkeHDfAda1vaE6kb4f
 S4e6pjrvZqs8PSYfzKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_04,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,linaro.org,oss.qualcomm.com,quicinc.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-91955-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 32A55F5BBC
X-Rspamd-Action: no action

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Introduces support for the Senary MI2S audio interface in the Qualcomm
q6dsp. Add new AFE port IDs for Senary MI2S RX and TX and include the
necessary mappings in the port configuration  to allow audio routing
over the Senary MI2S interface.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6afe-dai.c         |  6 +++++
 sound/soc/qcom/qdsp6/q6afe.c             |  6 +++++
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 29 ++++++++++++++++++++++++
 3 files changed, 41 insertions(+)

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
index 76e14fc1b2b5..037a281d6f61 100644
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


