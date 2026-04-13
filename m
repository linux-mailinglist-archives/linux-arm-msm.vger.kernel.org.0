Return-Path: <linux-arm-msm+bounces-102922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MX48KX+13Gm2VgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:21:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA5F3E9C54
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:21:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5DDD9302B828
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 09:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 393D43B47D2;
	Mon, 13 Apr 2026 09:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e0vK6uHZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF39F3B389E;
	Mon, 13 Apr 2026 09:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776071997; cv=none; b=gOW1+uf4xfZA591RsuU9f4o1t6KgMT65iVdUS6vR+tYOo6c/AFgPEmJPTlO2frIWZowOrDWGVbSXWKmLpjKAiG9Co1uV0GOIDYn++2n80NEIrSVVpslTK1rfwneu9KD0+ydPNLZB3kHFNGpy4va456sA9NWxpaZvbwAIbraALAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776071997; c=relaxed/simple;
	bh=wUrahBXkp7xBdtiPa7tn55vI7WfyfB6zlZUSBvEFzWQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GtaQIr8uJXOeF34+Usz16UQ6bu1BXZpXGLa1BMq+9xwEbW6u3DVh4KEf+nBTv4qMiJ1cnUVGJ/XZKhCez2UAFhzGufkWMRhFbGcbtMILN3+FaCIjUgxJmZ6JVuFytE7XQCquHscz6xs31V7TlYJQLFZICndNMxENujyPV9poVMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e0vK6uHZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D5m8DH3315443;
	Mon, 13 Apr 2026 09:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ic8mAljWR6n
	2FCXZ41JWRqy/yVgMt5b6BWZrbWpbNCY=; b=e0vK6uHZijCZ4rFghP+lc2ymlok
	gFCorYF41xLXmFsfmvMkkIzxnEU/C0/rkxWTfmvdbc+3S513sHs7sWhzqOorApcD
	ugV9eeG+8xzTWuO/g6wi718hDIPw4cIyxwOUdCb5P36Tic3ZfYzyO+6pP5ANKBL6
	K7iNSS8Fk9eg4ACnq7ENLIkNFFbQH+gpB+WQHtykZKWU7fhCtwQ5sk3ZKpjkKQBy
	2LkcWChCVzTjB2JOhCva1E0c34QFrQ79viReOY1c5z5Bk4843iZucPaf5TcXapw0
	NgKVqSP6ZnFta5v4DG2ELc8r/QQPSX9+IYq3rq+K/sSnJRnYeYMAuao/kyQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfewkvpj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Apr 2026 09:19:49 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63D9JmnR010655;
	Mon, 13 Apr 2026 09:19:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 4dgmy2mx16-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Apr 2026 09:19:48 +0000 (GMT)
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63D9JlBS010648;
	Mon, 13 Apr 2026 09:19:47 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-kumaranu-lv.qualcomm.com [10.81.89.194])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 63D9Jlhs010646
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Apr 2026 09:19:47 +0000 (GMT)
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 4187942)
	id 7C40B6B0; Mon, 13 Apr 2026 02:19:47 -0700 (PDT)
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
Subject: [PATCH v1 3/4] ASoC: qcom: q6dsp: Update bit format support for secondary i2s
Date: Mon, 13 Apr 2026 02:19:36 -0700
Message-Id: <20260413091937.134469-4-kumar.singh@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=bcFbluPB c=1 sm=1 tr=0 ts=69dcb535 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=Kr1C7d2_x6d6foX2rXMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA5MCBTYWx0ZWRfX95ZsQgm7K01j
 udWUjyEkLihugP6Eup2pRbqy7ohgiCLMPiFgwuXnt4Njv+cCw4wZPQV35pGBVYMrnmnbXnRsOYb
 o5zoC7EuvUv1wGzYNTpUlLNeG9OmZBgXApKvAezIr6sSYbukgEnhsbYFVk0siMDlelGzYySApbi
 mZVrKK/Xb8EhnbS+YjYVYjd9XsBDDMSlqcL0CcUms3ZTZoG4jamgipm9zQl/yzKlVqp3VhJe7KC
 aX7o9d8t24usJv/Iw6uI3zhlOEEJ7VPcB1K6yOTxcxVKNKp8JN6ZFigX69pYu2vElzE3N7jXKVN
 zeHWCij7rUZTWs3FyKVO/BB5fhxle36F4rDhN0aaHYyiJtcSXwYi6nWI84onJ8Q2S8Z50SO50DM
 vH5/N2lHPLAPPAXVJMj3NCLva5U8+HLGDbR1/Xn5HUJRJbmU4SqJOsiMFGF0rs9n/atffgewCXe
 OCdfBuTA4p9TitdhWiA==
X-Proofpoint-ORIG-GUID: f-7EzeCmLOFjXwDfroTtcrV-WUka0kCf
X-Proofpoint-GUID: f-7EzeCmLOFjXwDfroTtcrV-WUka0kCf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130090
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102922-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1AA5F3E9C54
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add 32bit for playback and capture over secondary mi2s.

Signed-off-by: Kumar Anurag <kumar.singh@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
index 4eed54b071a5..0664f18d7a44 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
@@ -380,7 +380,9 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 			.stream_name = "Secondary MI2S Playback",
 			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
 				 SNDRV_PCM_RATE_16000,
-			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
@@ -394,7 +396,8 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
 				 SNDRV_PCM_RATE_16000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
-				   SNDRV_PCM_FMTBIT_S24_LE,
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
-- 
2.34.1


