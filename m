Return-Path: <linux-arm-msm+bounces-99422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHI5NBTCwWkHWQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:43:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6E92FE695
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:43:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE3FC30DB9F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 22:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44BBD383C8A;
	Mon, 23 Mar 2026 22:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UXFPfg4P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BEcDTOH0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D96383C98
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774305551; cv=none; b=u0+mDsdJZevflHNaMsVX5cpnjFSlUw4azB6f/4wCk+F/kfj7qPRDgDYmPQFkzTp9xzr/Xn0QiMrKsIdDdJ53cmBftVTp678UNqLvkqxpKBpVJxcihKDMlYKmj8u9P83gOeIVEUNyvIF2BliljtFdllqkpvChD5lteyJht05N+Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774305551; c=relaxed/simple;
	bh=uSbPbbEF96iO4/jDf1d3kH2TPon+s7DHfw5HFTuRwdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rQ+OQYOa+WF8ESzTQLg1JbA5eaRGVxzTdKXIpy1/MeefMl1yfR+5NEPaVgkfEsxV9sCSVGda+/4CokneSXIfwgyAy+w7X03izsjCtJ5mW1dy6m+7aByWT3exp3vXSqvV8HCXYb7AsHYteqNd+virN0s3iLc21JmeUWuitbvarNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UXFPfg4P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BEcDTOH0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqugR618664
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/jKQw8dGxLC
	6/wkqCmrBcQV0wz2LZBd3Fby8QVjVQNY=; b=UXFPfg4Pc+yf2grujnyk+iEix6P
	EGl0Ezy9IKDWfnTcxfEvfXpvaAJFq3lHhyjbh1jzAZQGY3JYxrksAaCIj7p/pgZE
	hfMNe1sd+/7jkyqC58m32NZMcXODN0demDCsiK8ZELr/k1er/+R+WMIZhN+/GTte
	FcUfTV/TEqls7IDe5JLBacuUYH1InGq1t1lqX2JVbM/EUafhNTnQs1+7ZZ2INz1J
	w7cSpJLpbyq7wl4cbGBt4x1FaZZ1mB+iEHMkiaXvt0fuBG1oBTX1IcLpHR3/pBZh
	9Y9Qbstm4o0EtvMhrI33AwKNTU3OAv6Ir0mqyBfdf3+zNI5gxdF1/hZ7mQg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jgjysc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:39:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b317c40acso49143121cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 15:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774305544; x=1774910344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jKQw8dGxLC6/wkqCmrBcQV0wz2LZBd3Fby8QVjVQNY=;
        b=BEcDTOH0KlM6asJ6wnjVNKvGXIuXK3CTdxPmHy+FQO7Qf+LoayBeqMpW2xMwoB4AZj
         E3dmeSUelNXffw+oTXQAx28xlIoaanZ1k3w7LICnb2tEz43DNQspMDqR3g/5Hi7mpMkC
         1C810/nO+dCc9x+q/aydtWdIBOsvn/hFKPnlgf3aq0uJ7mEFWfOv2D5OBRm9a4AX2QZP
         BhYJPboIZliifUk0bnC5WV/nOnMu9AOkdsvDYe+FCqsA08ObqPQj7tU5NRZQvjJ3QDfo
         jAOjfXeTFfvKzbyTw4kgwto1vpn/xkEO4cNptVgE+kxy8K/zhhuIuw7dno8RyaHtA8J/
         0T0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774305544; x=1774910344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/jKQw8dGxLC6/wkqCmrBcQV0wz2LZBd3Fby8QVjVQNY=;
        b=P2GkcSS4Y4ba6dAA+cb4lTTMWSWgi3/L1/quOeUvKAaZAOb6eoVQcaIBu6iZnX8MkJ
         OEziNlHhDcdonGx5bkDFnSEZ+JH0UGi7rpTp0bXwJqr7B4qj6IE6lhTuPIf5RRS9qXOa
         v9DE6MQeVwj1BjZF2EvtjeEF7jSxd42AwwfAUt1BsiB2BMUSzJUp0t+tihVTX1V4JmGT
         75AdcABWVqXT8TvwoKe86pGwg12FYL2nCBRoMgJglNVajt5kg1DQCYtSc8HDpukY7+3r
         UUkCmAoCu0nhPk9zN7sdGZIWVVK/uhvCsTXqksvhFqoM9zc5l3qRzMM3E8IkgEeWhA6N
         NN4w==
X-Forwarded-Encrypted: i=1; AJvYcCWjxOzTDc64p8uErvQpVaxmvXbmSTX40bb4qacHD/s5/lz4NCnynnK+q27LSeY8zf/wV3cTFv6Wo3F6vDjO@vger.kernel.org
X-Gm-Message-State: AOJu0YxvwW1ayp1xvr8BzMDZMgUlWKS4FnLVBgm7JsqJZR/x9+qHuF/+
	TAB3W+oxBhTVkhZbrjpY6kAfo+xRTE3PVeIVeYHino7g1UII+FwfhqWJkUhouYgKSJ3x/uiyx2W
	9AZ5MEAejefM7OqWeTcRc8oQbPCQjQvj2v8+s0FoRJ7Zry0mvkaaTtKJve0XxO3tv+kKb
X-Gm-Gg: ATEYQzwQGNvLt0YW9IAhfzA59BSxCgmSOzZAJHP8WpnMX5U44qUHfpLIPHPF92WyZfz
	ef+No/fk3vEYcRQCd7QsDsOubvmkRUrza4j5I1DM2xrRLegxE15vog+idbrGNo1EknHPMLsnQ/T
	aI3wG3Y2rHDB25ZO26P+CRmScu0j/k0/kC1W4NePAeb4pYW7Wo6tU6EBwxuIR0JwtArNLazYxzN
	3chNH+HknFdwReWUD2RSCWQqiLUKH/RcgbWH4sIfV1kVRc0lAPD+kcxgZ88tj2Do9PaIHc8vm/S
	fahji2NvzVYNrK9IZPf76XXShDGtsgbq/r++4YlzzNMH5N7ZnM+0RjyTWBwCJSNWx8/G4ZnVTu2
	4t+0+0viSz+mB3o82aCvBYdjLQa/XBXKGp7Nt/0EapD2BS5uljTsY+kE=
X-Received: by 2002:a05:622a:154:b0:50b:6fb2:fe1a with SMTP id d75a77b69052e-50b6fb30404mr14837231cf.42.1774305543682;
        Mon, 23 Mar 2026 15:39:03 -0700 (PDT)
X-Received: by 2002:a05:622a:154:b0:50b:6fb2:fe1a with SMTP id d75a77b69052e-50b6fb30404mr14837011cf.42.1774305543137;
        Mon, 23 Mar 2026 15:39:03 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64715539sm33320351f8f.33.2026.03.23.15.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:39:02 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v7 05/13] ASoC: qcom: q6apm-dai: reset queue ptr on trigger stop
Date: Mon, 23 Mar 2026 22:38:37 +0000
Message-ID: <20260323223845.2126142-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yD3r38kdQCBjMHjBqvKXLHtFFpHEvXU5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2NyBTYWx0ZWRfX0Ao8Y5t1v5ai
 QkqyYjnPKz1TO1Uh2dO1qcAFg2+ZlbCVHhoJwjfsSVTFRb3hVP7QBParWBRfyAMsIJ13PqM9s2G
 wz0HkzSHHEWN0DJkZCmL8Wv++g4qTjNG9GxrMMkPF37HgLf+xoMxgFnQwRLlwDDWnbG4RskhQIn
 FAfC7I6ECJTyve3zy77Z4TUzS8SfQvTwkW7MzKeLsC730F1WhQiJoWInqrXaULLoLp9wQEQDi9M
 juo8z29jykexkOpB7L0uH/HbwIbCYlapsIRR2gBL5buSzgFaWWvxswGm1TZjXhDNhwpFMfhZWPi
 1Q7UuKQDzOSJpv0+/pUdehMEg5Sa//bbWpADhe4Jm1z0IFTMNz1678SRYWhOSDUg9iA1Spotxh6
 BzHcW987IWm4fNWuliAVnYYfTe7K5/teErtD7sm7qlwyKQdByvQ01jsI+PAIUfnShzEntCfgG2L
 BwGrQqpmHBOGMp0Y3Eg==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c1c108 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=w9bA4Yi6UXS1dLCTJJEA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: yD3r38kdQCBjMHjBqvKXLHtFFpHEvXU5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230167
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
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99422-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3F6E92FE695
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Reset queue pointer on SNDRV_PCM_TRIGGER_STOP event to be inline
with resetting appl_ptr. Without this we will end up with a queue_ptr
out of sync and driver could try to send data that is not ready yet.

Fix this by resetting the queue_ptr.

Fixes: 3d4a4411aa8bb ("ASoC: q6apm-dai: schedule all available frames to avoid dsp under-runs")
Cc: Stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 1 +
 sound/soc/qcom/qdsp6/q6apm.c     | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 306e928e7b49..292be457764f 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -317,6 +317,7 @@ static int q6apm_dai_trigger(struct snd_soc_component *component,
 	case SNDRV_PCM_TRIGGER_STOP:
 		/* TODO support be handled via SoftPause Module */
 		prtd->state = Q6APM_STREAM_STOPPED;
+		prtd->queue_ptr = 0;
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 1fbcbbf3123d..9d4cbe29cf94 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -215,6 +215,8 @@ int q6apm_map_memory_regions(struct q6apm_graph *graph, unsigned int dir, phys_a
 
 	mutex_lock(&graph->lock);
 
+	data->dsp_buf = 0;
+
 	if (data->buf) {
 		mutex_unlock(&graph->lock);
 		return 0;
-- 
2.47.3


