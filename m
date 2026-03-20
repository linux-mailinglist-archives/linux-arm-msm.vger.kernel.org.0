Return-Path: <linux-arm-msm+bounces-98945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCN5HG5jvWlF9gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 16:10:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 717B92DC5FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 16:10:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B6DFC30DADEF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 14:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415153A9630;
	Fri, 20 Mar 2026 14:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KvIBovX0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GTU/sqnE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935103C9425
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 14:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774018180; cv=none; b=o73goWOVewkCVrWnUPXAvpcpYXhhA4OVm8ShlcH/sx0a9kj3UjUWIpcyMbYzw0rgtH6n7+WehuYQ5pHBxbWh33kBSdLMytf6wpCh7iChEjNme3bhX43FfExrDY1aZsud1ka8sE/oHc7gQllpOMAPGT+cHFDGDtFQ42YCupGL+8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774018180; c=relaxed/simple;
	bh=DWuvTD8Cw0DUhqpHbWAOgp0+9q9ilBF02Exs71eghWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lHOIuI/g2JaNF0fq5ePfQWjkgFQLWHRczGr2cqzg//zFu8XbMHRzMYRt04URLqi8YT0niT/FNZjht0Sra2+WfqARHc5GhQvaxk0Ht3np7eAZqIVcdnP5Dw0cqUDAJgXQhZQmWtPWY3Ca6Oln6IWn7BRNDRWCt9mJkdCvMNICh9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KvIBovX0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GTU/sqnE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62KBsXkh3876041
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 14:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VHHn5cWjpEy
	VxsTN9vGBX+/Npp0nx1w8ZRbazvG1gDU=; b=KvIBovX0MGCe+SKa3+x6aLuHNWA
	kFX32k4iOrpLV1vRTEkYZX9XRymtzkdeSq2QMqJDFQkE8sRjbMTJbWBQuepfWA/6
	TVrVPTAuCZIJ+VpPEdwXQfMJYJwzkfc+9ONvjo4wMjcBsDBE/pHrCxhIm1n+5MjZ
	SCtB3VB+mBEROlxfQELI0aY7GwuWAHn+YuZtEDlyrJ4qD77nV4AzRxNsS5os2NPt
	Iniz4vLLaLEvgJke8qHMrB0H15ptFuClou11D5WJoTXZiV37uRtLGEEVjChnij+E
	gqYiBfZluDJxVKBrr0qA3aTUJMsPyzCBldFPVeF7ClfrP9f/O3ZvXiBU1vQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d15s08e56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 14:49:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b2cbe7223so122689591cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 07:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774018177; x=1774622977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHHn5cWjpEyVxsTN9vGBX+/Npp0nx1w8ZRbazvG1gDU=;
        b=GTU/sqnEt72RFOFMhGy5PlSjjNk6aUOPTXw8HEWD0w7ZsVSlNEGeG6aLxTTsy2+mmu
         Atb8/BP0YAJ6iCXCoTodkd3jvV7n16Dqve26MiIj9/yql8hGOgW0qy6V04LIuXWKNKV0
         q/OihPxnUZzRSWJG41lLCzCmSUyUW78JC91daS3F2GPataql4JoHpXyP5B6qLRrnq9nC
         saxpnNs4H8eQgvLDPeIo4vdwvs7FMAJaX01+IsrtVLsHLhMgAkdK9fMA+2275EBQbGU4
         y7MSl7TQi9c+8hL2AqV5RbNWvT5X2C4AGHCV0cKSCKbfyNZVzwiHf0RT76IcKAy1M5kv
         HAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774018177; x=1774622977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VHHn5cWjpEyVxsTN9vGBX+/Npp0nx1w8ZRbazvG1gDU=;
        b=qyOeblI0vD0CYu9sdRIA1eaop4bu0f/3KUeAqJ6agYGelVIIousOnMYa3TfVAhXdJ1
         QnJ/nArk9alndUkd1zTXGcgxpezf9x6pigbjk9HCOFsJ/+KKIU+5Ks4CmhnMNhcjtksH
         GdjRafrXyf0hXiklHGe9x7COJw3eferKGPZGA0RbZ2t+figrVblRhsrRj/wZCCc+esOs
         hqM2tKhniakvowMvdMKKe8bnRNrUajAtS4R4vaelnMP8Df2GsDerPqv8vjVr/FxHV5KP
         Yt9BUUvTf+IjLkmtsvd1aMQP5nr7zsgpM1E9RGgrRaW7z7tDCiP6E9XmGaVMbS08doyY
         XGTA==
X-Forwarded-Encrypted: i=1; AJvYcCU9XXuJGcLn/G0aNZKqNgLAm9MKnkAMvMVSqbXdvYhKeXzFh0FcFLdu7qIUOzEo0DFniKbG44HdCMmA740s@vger.kernel.org
X-Gm-Message-State: AOJu0YyQE0lg/HSF7vcjiyNihkYPwUEi6o2EKUs0+/ZjDDH5pm4aMQQd
	MFyQwiio3R1S69VK735oXqwrrmXFpOR+gsebeKRMCTvyJ5XHoFI1F91XrzZPVskSnv25IQoCus2
	9VVId8Z0ym2cmIUO/e6/h2XxYIUiVbz8KlzC0CyDqIDeNRY/utaHMJcXcqftRDiYIUwyX
X-Gm-Gg: ATEYQzyZub4MKsswbWv22Ky+4gv6LRMbo0OQp3szOqiyx4SxcgfVJ474PDVsu6wzyv+
	fVkemIPETydnJm9KTZdiBtjYfTtcczC7wTHsMbbzmMUYmj2Sbk/G4RKEfzk5mSKblRovHVFya66
	Jw78fxz0uCN1dLScG8UEOdpV5a+EvxQ4civHPPmyzmqtm4NOIReJ6t03S/Ws9NgnXeiYXEOGERZ
	QbxOElmH82AZ3C6cb+Y3w9rR2kc7g9fbHME/HneM7GjvnxWASVPH2L8ujq5ALo8DVYTBbFxJe+b
	ib91e9y0hfuz9ICHkZP+NtAU8rrwVQBTvTvlNyjAV5eOo6/7Kqyd5w3AWXF1hBYYzShc4tOjAwW
	NWBBzuaIdiZfBMHeKRo1ZP3qyOYTyzoSKDW+1hP0F089DgUr+KHuG3qs=
X-Received: by 2002:ac8:5814:0:b0:509:66:cd5b with SMTP id d75a77b69052e-50b373e8da0mr46993551cf.18.1774018176632;
        Fri, 20 Mar 2026 07:49:36 -0700 (PDT)
X-Received: by 2002:ac8:5814:0:b0:509:66:cd5b with SMTP id d75a77b69052e-50b373e8da0mr46992941cf.18.1774018176135;
        Fri, 20 Mar 2026 07:49:36 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff109b95sm47906825e9.1.2026.03.20.07.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:49:35 -0700 (PDT)
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
Subject: [PATCH v6 08/13] ASoC: qcom: q6dsp: Add Senary MI2S audio interface support
Date: Fri, 20 Mar 2026 14:49:13 +0000
Message-ID: <20260320144918.1685838-9-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: S9SX3lGJPtXoxfhyZi0g9nwuGJYP8yb5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDExOCBTYWx0ZWRfX+mCVTLrzim/t
 MbJD78edSMPlZDXWYrnPcM3E4oXPJJnqBDqWWDN+GUuIAhKQHP/NZsREzcmFWBWHJEsGrO+Ukvn
 B9dacNQ18HHUx7MIb4eBvJd7HS7jLJ+ObfQE4H8RP0hTw0+3ZdvnQQSkQZoOOsJjyYQxOA9qzd1
 G1UKaDnFY/iY2M8fbpQagmRTch87WHbVZo88qSSSE0CRO5lDkalaNFIEW/cAmknaKcQNoFFlxsK
 zYMzKoFXAlyiMaDcBIajURppay3/t+ThdXmqPMbUCqNRN8vM4YzgN7F5CAFn6i28P8KiuZN80gZ
 F1QMqFQffC+XXA20hDjfwAc+nli/D91Fzb6qxv7d6T6QJkruJG1PJc2Hk4lYC1xHsbqZMhWgdoK
 NN4NXKe2xv0Rt3if1I9LqY+fa4V+Ye0O3M5QqoxK0hTikaEymsnMxxAREc0s0bBfIuoLJUxHrFC
 aPjx0UxMYQ5XLGmfrjw==
X-Proofpoint-GUID: S9SX3lGJPtXoxfhyZi0g9nwuGJYP8yb5
X-Authority-Analysis: v=2.4 cv=KORXzVFo c=1 sm=1 tr=0 ts=69bd5e81 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=yvctMs8w4tAFySAdhFMA:9 a=kacYvNCVWA4VmyqE58fU:22
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-98945-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.959];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 717B92DC5FB
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


