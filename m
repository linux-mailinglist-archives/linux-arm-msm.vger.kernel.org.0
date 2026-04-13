Return-Path: <linux-arm-msm+bounces-102923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFZzCqq13Gm2VgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:21:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C353E9C6C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:21:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA6D1302084F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 09:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 053203B389E;
	Mon, 13 Apr 2026 09:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VXIm4qx5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE12B3B19A7;
	Mon, 13 Apr 2026 09:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776072001; cv=none; b=eQpDp1KpxjdPaAPw8kHgU0MnTEkYTooxjvsxZ1uRYERJlsBGFM1rcMI16lQcbZKXyfCZCkiHJGYaya2103eUwIkegKu3wpzKW42iT9pZtwcM2aKSLUJ3D0pe726uYWiQjMArqM9KcxYb5oHBHvOYtZ0PjrtY0zqVUi5IoCAQeBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776072001; c=relaxed/simple;
	bh=vZ1xKAkwtz6hyMABBouJkUlR9h9RqOm8ureovRrW33g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qyQOp2hQ161WO9FUF7NjNVe4Kw6wJqBd5rK4sYoSuMe496Jrtn35WiY0XKaUDyqpHQDyHGPA5pdlD55yl6zJyYjcOnxCmd4QrqoXg9NssKsVCWmH0/re6GcIJHVfYjhkl9AM2CQNspteVY5OTWNifLpwnN11seZgyaxJHdGvTKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VXIm4qx5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D5t8Rd439900;
	Mon, 13 Apr 2026 09:19:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=deJnviWwGhE
	gD4Sw1OB0YdaKut6FaLlSryuBAgXVr9k=; b=VXIm4qx5O/Pni5gCWT3rX2uiZaY
	R8yE/t2FLV/CmvqdH4qpnLNjPP8MTBQmhxBbhwTUQD5caF6K06cIDDP/Ntl+pqfO
	nsM4qXxbdnccy1xHDHq5s6KHXx1M1jqikVp94vGCOtWkhnUH2msuSiy3/o48tA+P
	CaRWct65bMl/p6d574LfyLWBVfbABulTy6T3YmVcg7j7pS2VUyqLD+q8mqx6nr40
	Va16nl+i2tuZrjQUJv5Ye0VXQ/DXLHMwZKQl1gaxmMzg56soyxIujf4FIflYhBZ8
	tPpXtBH4b3L4zhOkMq3parLV13evpFSDlu7nTTu1bDN+U0RjKS/59pBbWeA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfevtmp1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Apr 2026 09:19:53 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63D9JqZ8014809;
	Mon, 13 Apr 2026 09:19:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 4dg5er2ekp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Apr 2026 09:19:52 +0000 (GMT)
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63D9Jpqb014800;
	Mon, 13 Apr 2026 09:19:51 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-kumaranu-lv.qualcomm.com [10.81.89.194])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 63D9JpVj014796
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Apr 2026 09:19:51 +0000 (GMT)
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 4187942)
	id A2FF96B0; Mon, 13 Apr 2026 02:19:51 -0700 (PDT)
From: Kumar Anurag <kumar.singh@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        Kumar Anurag <kumar.singh@oss.qualcomm.com>
Subject: [PATCH v1 4/4] ASoC: qcom: sc8280xp: don't force S16_LE in hw_params fixup
Date: Mon, 13 Apr 2026 02:19:37 -0700
Message-Id: <20260413091937.134469-5-kumar.singh@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260413091937.134469-1-kumar.singh@oss.qualcomm.com>
References: <20260413091937.134469-1-kumar.singh@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=RYWgzVtv c=1 sm=1 tr=0 ts=69dcb539 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=MudgD1MToes5hn6vDNUA:9
X-Proofpoint-GUID: q34jnvIeQV2gaxK5LSYXRqGiNVmizlpa
X-Proofpoint-ORIG-GUID: q34jnvIeQV2gaxK5LSYXRqGiNVmizlpa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA5MCBTYWx0ZWRfX4uzdtnhsr0K3
 S6kU4h8UlMDnGu0kMamngt0gmk7hf4IhR6fe6Dqlg67yYSfkSsoEBG39wNIXjGohAIV9/Fpmuef
 //53bZv41pTwz0pZHYQCE+sIb0WSJkHWBz2qEKZ8f0vCRtX149miKBCJ8OiEEh0TmzeKe9u+6GQ
 tUuQu6/FT4BUpWJ96dXMsFgILA9v4/HhPX1vCzxhj1ehBFji1vGUqbfEtE/yBPVg0Ru7FyhfNyn
 isjjZc9F3pTSCXW5lMj9wet/3l9zXjMChHSww/kPWhdPGh+JkQWroXyORom0uveEOYiJCz5OIlE
 PURnPaVymS66xH8mSSzMgV/qh3Q81qlAKbpGnSkdz1iAGUHjc177dznar8N/Yud0DH7hKevolq4
 mjJUImiuthkm39KHKnJgDcLUKMQNbKiVaVoaFOm72kVAxFyKRyjw4PqrWmTMuDEwXdPbzdh2smr
 Mswn9mWKvS6Ct4wauog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130090
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102923-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kumar.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 92C353E9C6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The machine driver was unconditionally forcing S16_LE in
sc8280xp_be_hw_params_fixup(), which prevents links (e.g. HDMI bridges)
that require 32-bit formats from working. Drop the format override and
keep only the fixed rate/channels constraints.

Signed-off-by: Kumar Anurag <kumar.singh@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 7925aa3f63ba..c00eabf200b7 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -75,10 +75,8 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 					SNDRV_PCM_HW_PARAM_RATE);
 	struct snd_interval *channels = hw_param_interval(params,
 					SNDRV_PCM_HW_PARAM_CHANNELS);
-	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
 
 	rate->min = rate->max = 48000;
-	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
 	channels->min = 2;
 	channels->max = 2;
 	switch (cpu_dai->id) {
-- 
2.34.1


