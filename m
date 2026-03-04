Return-Path: <linux-arm-msm+bounces-95314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ClFOTQvqGlPpQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:10:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DD1200190
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:10:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 81A9C304B94C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 13:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252382E975E;
	Wed,  4 Mar 2026 13:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bJgHZ2YN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ufi9ipDk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E9228C037
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 13:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772629645; cv=none; b=R1z2kRjNa7j8F3p4rM7X/EMMqnJlywbeZdiUvP5KhAKV5t6n8AuzrUAtOIXEP9c5SVOIhJPREJn2vEtKmWneVXba9Mw7da0YZP5xucOk1PoMGJKqtiJkL9K7VD9mC3imxy3J6D8gYmRQc0dW625rNHvjTxmADDNtxfYcSfGFjI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772629645; c=relaxed/simple;
	bh=KvhN5EIM3XXPaotrLaYPSuOdgBSYq4SNpSPqi8ZqfN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Av8KHznJGP3sE6/DwcWCOFDgHhH3tSzQycJbRu1SBtB3zsd1MYxYZ5LqQCPoJ/yogM49zrKPh0VghotdlGcbSXnGObYqsSv4xAYwIGjwvqaThB4uiA9rtEbyGlasds8odcnsPaROQoKEeu3+SZpFs9g0/TQnK57prWZam29yfE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bJgHZ2YN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ufi9ipDk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624CmsOe957059
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 13:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=K4gYoo9JoJP
	OJ5mTuliJj+hphclVDgk4+5Zp53bnrEg=; b=bJgHZ2YNtRjhg6ZNGKNu2y4jQWV
	6RTo0IzyHTPTEUIcoQ9lI2wzYZhBEKeT1CiKLTf24CQbEdW+TpHTblxcvhgKFUp1
	VkItVJfjhAo3P0HANGFx1kyXtKcBVBjaoJwhxLEoMr24mgndGSNgN69+8q6PJwaR
	epa8+tscQWZVAXUVObi0Omb/sTwMfep293ADC7493PtmvAd5tghTBLnkMGcYvSvR
	qMH6EIqTpo/XLJl0iy7Cx+qqVXCKe1uUQQaKjG+0vNM7gwPc4nhD2kJAwLvDEEve
	gSu1mtEKGhNHheSO06u9bBLQsg9u7c0FPcRNSqVpw9YjkXVZmIDEWE1ilQQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp6qgaxbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 13:07:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c71304beb4so788577985a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 05:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772629642; x=1773234442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4gYoo9JoJPOJ5mTuliJj+hphclVDgk4+5Zp53bnrEg=;
        b=Ufi9ipDklVsKQO7cF/i5cac1ETpF+1RuMeO5J3mbO9Y/10vLXsd6dhHoXLD+Gmt3dJ
         h9IOCYqAOOiNQw+HDngw5EVz2+nnw3X7BkY7yJEmT9mD+2A5jXsajnuJlL3oPbSxuJzY
         zRQ3BiNj5UjwIOTU+Hjbij2vZXLToNIeURrBOeV7E6WKZqZSSB0paQLv2bDtQD6t7iFd
         QP9J8qsthWdGK2MVO0Aq7FyrM3XrKKjkh73I/7W2IwpkV5ZBfWFI2rlrovh001xqLc9Y
         1S7+NsABzCUreTQZEb2l8HArsF9iYHV02/O6OqpVdY87KQVPt8uzvcfCdSOeKZQIgGro
         qj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772629642; x=1773234442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K4gYoo9JoJPOJ5mTuliJj+hphclVDgk4+5Zp53bnrEg=;
        b=J65DPyNww2nmAQnHtwfFrClHkI4UIhAEGCFQx5N8qjFerRfXA2SMUpMfOZBFkPubUA
         AlcCn7SFdbLkD1xMxLxhI8ncxivZh4zVf9j3wBto7AA4FDvpav/hHFHCYqK58NIChwcn
         Zu5BGG2IcHqd5z44qSpjFua9tsjli2pfKtlA8kQC+96RceN4ionIe/oUCBEPSi+IcdcV
         TNvSGY9a862ioE+QyPT0SQs0J6ox2dYKuTKv43c9qrJfnfw5pcxQlBwli4hmQv+U1Tc+
         rcQd5qO26KRH3p80sVm38CnRAuxmJRV3Spvi/bNcf7lJcF1bfN7V0J906kl5l5XwlEvT
         5QrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUROA0rXRjhYqYt6tXsIlZRlxg23xSzWI6nrPjEUjkYusilgOWxkVYVQdzLkn0Ft2WGKULMIf9xV5UheX5g@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxq8F7J/w0vk/gVjnyVU/ndSNc8GTvmpc8B5tKL640eYhFu40C
	7oX464ejgJAUKxnyMUQBwDEPl3NlQIPTS8ADQUCZK0wkWAiKltGFbOohL9aHpMf5BQ/Jfnb4q+8
	31datLhrneaclhiDlHr01RjdxwTbxjsJyZuGIHADm7Xx9OHzN/zbDR/vkVWdrkEFpiRSl
X-Gm-Gg: ATEYQzwHGiM9WIy9k4/OPuB4NA53aAFNJ7tOBse7RRBON5zbv3rDBCxSDS+uzYDnMl9
	rHecN+ZynI54UK9N93SrPFt1Kt72Ue2pxq9VKyvyrhHCl1OzNGfyHBGwCUUdOR0SU8Kp+TiiOkQ
	gfSODBETlZx9R0kbnCMn65D1LyNdvSolX4I70gdbOaqoBrQ4N3F56UG2l+wLHsqmOjfeWn6+dXf
	Bhj4GGpdU8/TWgahv6gVGK+9a04KFIbVydxCuP2UTSAkUDxnte2mMuqWeTbNHNUUqMUZPyuX3ji
	t1SycYlLF8C8qA5Egh0B4mKbSjjimwQWdzXI0x+r9qzgh6qHfWMZfUWHU++drNfueaPdBGN3Hj7
	9dXbAvxQOBLa3qD2qiLUN2Dzyl+hwKnwtIIpz+WBGYj6ouPEhQzxFxmw=
X-Received: by 2002:a05:620a:4727:b0:8c7:1a0d:7d9d with SMTP id af79cd13be357-8cd5afd2111mr209562585a.81.1772629642205;
        Wed, 04 Mar 2026 05:07:22 -0800 (PST)
X-Received: by 2002:a05:620a:4727:b0:8c7:1a0d:7d9d with SMTP id af79cd13be357-8cd5afd2111mr209558085a.81.1772629641720;
        Wed, 04 Mar 2026 05:07:21 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485188122a6sm49969745e9.12.2026.03.04.05.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 05:07:21 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v3 04/14] ASoC: qcom: q6apm-lpass-dai: Fix multiple graph opens
Date: Wed,  4 Mar 2026 13:07:02 +0000
Message-ID: <20260304130712.222246-5-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwNSBTYWx0ZWRfX9OErMb+3zMwk
 jozyYvnYpL0zsrP6/iDQv89p+sQXT048YSS0Rj2g4RSiBdV9gvlazSU336bS5GYzGVAmNwn3Z0o
 FY1gUkBI4WbECTJmci3klYyaSEc+cm93ALExpGIRq7EkpCnf1uevqV49j+rb85yxMeC487yd8W9
 6CY3NQpVLMvxM8/0NL+n1aSc42R5PoU8Q/fsXuFbdiPaHmpXvlK+QpGCG7wz36ziYv2ttCOBXid
 5apMh0c9AVjjfuoymAYtEVuHrvIF6j3N59zRqsb+Fz8JD/zUSv9oyACUXOAMuOrzibCfVYL0w4g
 lZy9tFBU16iJ1EVsGQh6wasg+EY/m3DomEcv1vg04VxIyb+Ypgd3ETZcDl8+xnkaA7wi3srNtm0
 n9I53qYyFOEH3RIPj6CfffStlXTDd7cVB/41xKEGQ+72Oz4i2omum5PmWQkdmAG/to5Id3PipHT
 w1gMRkj3OA32PiPAgIA==
X-Authority-Analysis: v=2.4 cv=UJ3Q3Sfy c=1 sm=1 tr=0 ts=69a82e8a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=M_mAHeyD2EURj3i0m2kA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: SEr_prwSGMPhoBRKniIkogllOZDiHq8Y
X-Proofpoint-GUID: SEr_prwSGMPhoBRKniIkogllOZDiHq8Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040105
X-Rspamd-Queue-Id: F0DD1200190
X-Rspamd-Server: lfdr
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
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-95314-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

As prepare can be called mulitple times, this can result in multiple
graph opens for playback path.

This will result in a memory leaks, fix this by adding a check before
opening.

Fixes: be1fae62cf25 ("ASoC: q6apm-lpass-dai: close graph on prepare errors")
Cc: Stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 528756f1332b..f68d4b4974f3 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -181,7 +181,7 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
 	 * It is recommend to load DSP with source graph first and then sink
 	 * graph, so sequence for playback and capture will be different
 	 */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK && dai_data->graph[dai->id] == NULL) {
 		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id);
 		if (IS_ERR(graph)) {
 			dev_err(dai->dev, "Failed to open graph (%d)\n", graph_id);
-- 
2.47.3


