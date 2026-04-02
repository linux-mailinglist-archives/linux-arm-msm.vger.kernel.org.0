Return-Path: <linux-arm-msm+bounces-101473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2O1ADXclzmnElAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 10:14:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CEECD385BE1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 10:14:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0C0E030A3FF5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 08:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AAC13A4F33;
	Thu,  2 Apr 2026 08:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fPW4Zu4j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GFVIBpho"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56153A963B
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 08:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117520; cv=none; b=COWnNV15aTv+ao7ZZw0akQaZ3iRaRFzCVV3rApjzaSZlC77TH2Tn1olwZOCW5X/dQJqPteo5moXa/aCDbvmJmpLeNjiwoijTPG9YVPWSdfa026DO7fmDC1cNBJREGUAJe3M0RHsuaTOgpa3R1R3s81E1pmhcMhf8kJN8axrXhNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117520; c=relaxed/simple;
	bh=DWuvTD8Cw0DUhqpHbWAOgp0+9q9ilBF02Exs71eghWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q4dGo/vJS1qyRIrpBZGf9ScqN2w5RqaYNiQ7DKMcELzuSAyZWrLLNQgjzPJwkwizwIx7ETqkiS7yCvXGHV0jNWe552xj2roXjR+Ip7gg0VPxiphLZecWAltLpLUiR6NZ/N2ilYjyvq0XXQTIRweMNgfNxI19VOjfKYv7eFoDTZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fPW4Zu4j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GFVIBpho; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6326ujJa3044460
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 08:11:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VHHn5cWjpEy
	VxsTN9vGBX+/Npp0nx1w8ZRbazvG1gDU=; b=fPW4Zu4jMGX5fSuB89qWmVplWE5
	DaZAiNL3+05mBiw/jaBxulYaeXbNgRi9unSdJol1fJeCbjF5u21KAR5kXfirWEJ4
	mCGV59PZWjxSmrL1tbnM6c6d7acV06ivM3kA6vGAfN4ck0SvZaMLWPn31rzl0z2w
	l6BwR4PuJHoK6Q02+YmnEfe1wZPltUgTosN5j7MsHu5RrP+2Amb1/BfGunKNFpYF
	iOEGXm9XQ0Hh7b80XhtgU1su3ub0A1zd1xP5f/J4PSs8hF9XvAi0CN/AMG8o6yzu
	ZtKgOIkbTf3nVINsXzNa+9bGH35kA6xEkS56PgrSw1YmeHCGnqgg27dn0aQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9483uurg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 08:11:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso2371121cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 01:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775117502; x=1775722302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHHn5cWjpEyVxsTN9vGBX+/Npp0nx1w8ZRbazvG1gDU=;
        b=GFVIBphopyjLJHRl747FL4r2BmRz+/AAt9bjuJQ6Was7/VltlK/R3S3AWxlQqlLnVd
         xd/6hUj6PA1Kg/JpESiXWhP0w5cgCoEFiBZdaw6p5IFHhjZmRQTIpGOhShVk+sIAvOFv
         4lCNo7Mey2BW+UIwYyWMWPozYdV2YWKww4x/y3I1/RPio+Mvq6oXcloej1rGmSzoZO3g
         0brrZfkRPyWQWc2pNaEAup9+1v+3GCktv3atFNA93Se8rNAC8xAbnRa+Uy9/TgqW8AS1
         PsLJ70Nst0+inBo0NgtCi9hMXZ4y3IlXFWVmHQwQOtvu1bUg9jhQ/zjCLQZYq8RUpZhb
         1+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775117502; x=1775722302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VHHn5cWjpEyVxsTN9vGBX+/Npp0nx1w8ZRbazvG1gDU=;
        b=oqi7RP+uHBKiSmZ9PM86aK3myvur9SxUjkRmDB/Eb/S+8MZENbY9rn8th3pxvJbH73
         DbJ8leb16lw8KPkxEWYcU/80grBPU8VQsl+cQi4J8wAWNqTn0/mSIVdpRArygUmNSKpN
         2tMc956yDtQ8zbF2LlrvaMTW3GcCcWJxty9JY5xjk2BsWJMpHwOTuUz7wSNf4EF4Tv9L
         +gt4OYa+wYlonBLMV1O4Tb8R1EwGSdxEOlIFwzMJTUlEaugR5a0Itw+CR2LGrYi/2sJf
         JV9BXTyPH8JCgYy/6YRxvN/rQM8KojQSfDTDxy2NEih94NbfMVM2gszIRpN3onCEVHwr
         gavA==
X-Forwarded-Encrypted: i=1; AJvYcCWV/ga+9dEsYkHAeZEFARIm7sYLFTldxho8P4/2IomQWoMfC0/AEiPFzg2oKjAFgK0flvBDCD/akemlOftC@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbj8UJwTHEBBLx3WCL9E1zpURedlOtK4CKUvt2qAA8ne2GV3Da
	lCFVlX3eRuBVUbnRLuCpeDAywq2RDmwF8e3OQS0S0Tfu0uFVqh7rv1JcjBI2obZ+Ev5yD1OKYHp
	GgnOqSzReRPjyMsfJTKJVkCAMP4HMS5bEuvY9NLlvj7pC4O2eXi1+FbeJLQsJtL0tYvnT
X-Gm-Gg: ATEYQzzYoMzkYUkDtixQ1u+EfHAkAkYkl+QuttFDXHvIxu05/4U2WF1jDDTIFUd5bRj
	7t6vZjy5doG6XBHZDGd4hH9oGe8w0NJiY3DPYtsoOQIdwLac2sd+ibpvhOC1ujdKa7/hUmJvxrT
	6T91Y8G8pQkok8zjQZYLv3SW8stY+t3S08n04ByRtWHJs6sx0JTdA1mUI3+lSJMa1iEJDYagxhB
	0yn2jk0tZa59SHvYCWt/HGXTPwZ7OeTfRnXK0ZvhsWedqcI6U4bXWYa9j6Kv34Cp9d65hny/e7t
	h+LEvq9btyI4LF5twMKnmJ54QGGkBFJQVoiehbYqyTouiK67i3efJn8JTEuJKMQQLVr9FRonbTX
	tLmkHxL7FJKNKvOmRD8kooxF8bNVoS1B3lFwZ0iLzCM3z5dSWBcanKYk=
X-Received: by 2002:a05:622a:835b:b0:50b:3128:9916 with SMTP id d75a77b69052e-50d4fac4c65mr12622751cf.18.1775117502115;
        Thu, 02 Apr 2026 01:11:42 -0700 (PDT)
X-Received: by 2002:a05:622a:835b:b0:50b:3128:9916 with SMTP id d75a77b69052e-50d4fac4c65mr12622571cf.18.1775117501684;
        Thu, 02 Apr 2026 01:11:41 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c3a01sm5712604f8f.12.2026.04.02.01.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 01:11:40 -0700 (PDT)
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
Subject: [PATCH v9 09/13] ASoC: qcom: q6dsp: Add Senary MI2S audio interface support
Date: Thu,  2 Apr 2026 08:11:14 +0000
Message-ID: <20260402081118.348071-10-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RYydyltv c=1 sm=1 tr=0 ts=69ce24bf cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=yvctMs8w4tAFySAdhFMA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3MiBTYWx0ZWRfX90WCrv+j8UPp
 jHtRchtXDsFDCctE3go73Gh/uqoPJMJD+KIRPECC9nyDQISLmjxzb4MKiH0jRvrjX7uirg1yVGt
 Pu9Ov7fWSuzRkEfVKfB+g1il0Qjrqp36VAPHwHPGmHjIxvnAGauq75DlvZgDbUKedcyN/08q+eb
 vieycyzi4sdIMKnOaZhofyywK4psAiEEfqxPxCOSjLpV0SIDJLanAZ6XkVjUHcenl7aW+4C2mlf
 PyMtyiR+W1fH2uPgOpPWimJKGA0wJ5ZPZICPF3j8lE/zZt8qIqorvGVFH/EM/oHI/sdXp+dMbUM
 LGCBDpnO6tK0gSZ199rUxaFO7MH80ILLaI2zOL1E9vx6ik+PqUMJ4COEZMluQKcm9HS17bkqbuA
 nlE+1DjjJr2RryvNiJbrnrnEtr2Uoa2NuCao94CQ2cSXl4MsGAH2s7gQp87xum+va+xh0fqz8Mw
 iQ/UG//yQvptewyQhCQ==
X-Proofpoint-ORIG-GUID: f5QLambJQwUlzRvBtsmIjkbwPNS6RTJn
X-Proofpoint-GUID: f5QLambJQwUlzRvBtsmIjkbwPNS6RTJn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020072
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-101473-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,packett.cool:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CEECD385BE1
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


