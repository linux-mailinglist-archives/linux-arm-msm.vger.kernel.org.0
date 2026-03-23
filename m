Return-Path: <linux-arm-msm+bounces-99427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHbtCGjCwWkHWQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:44:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBAE2FE726
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:44:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A156E30F9297
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 22:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EE6438422D;
	Mon, 23 Mar 2026 22:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BHx8J1yF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KDjCEIGh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA45D384233
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774305560; cv=none; b=aWLZ2D7+Js4IqUBU3KtoSjuolHSD3EATk0U3ubbA1mls5gO5QpxolqhS9JKVHwt3xH6cECgfBtn0rUu1jvzxORSr8SxYW9xaa8fDImjG0+Pq7RxeYbcVAF1LLULvY22yTGehekyEq2I+QGTMdsw/Mw4VgLTxIxpH68UKldGSvog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774305560; c=relaxed/simple;
	bh=HcBUaG07YHPkjw7AtCbbPauazCJLhtW0eS3T+3u2Oe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nGYw/bqaN2EACQytej0r3vTcRUxtqlOKC3hx7aP8lro7HsmtjCnbbJ9KHb+ijJccyoZHpgNHJLIT0R7ezYC9bZwJNY22G0bGriJHRyOAhciO6U3dwcoU7W1qDncRzyRhele03uNiGzPOVy2gYPObjEwm9HqDKtaD9Xj/zg5GR7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BHx8J1yF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KDjCEIGh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqXaJ362509
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:39:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=K2FJHPPcvdd
	DuyFi5b9Enk3oj2KWR4s1Mi0JeIXu8dk=; b=BHx8J1yFo1xpjzEhGJLyFEBTzA+
	4e4+U2PBPRvGdxTnwU8wAlqXVfOdn0YcfWXudGx8OZA7KiyoybX49eScXSEPHrkM
	2RWnrVWPGDWJh4duBejRDDBYlajd2t+0yGIOIbG68up/F4HooOXoaPanvh/AjeF3
	b3hlX+xMG6huaulHJZYLcfXj0pvgM/a8SD4KAIzgmysix/LjZce/gqzxA8e8ylYx
	rUZIiWvFQZUdbuqIL8vT6vexXt/uRSFV6vm02z8Qz/MwKU4+hSw+aJKf+Vton1aI
	YVaiu7UPpvKqtgkhrLgaDwPTtujEC//v0JnSp9atttFbMkechLjQxS1eXDw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d33k32ebp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:39:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5091782ab06so159311021cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 15:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774305554; x=1774910354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2FJHPPcvddDuyFi5b9Enk3oj2KWR4s1Mi0JeIXu8dk=;
        b=KDjCEIGhoE/GwNWNnohLVPaN2oOmtVNTb76u4eGrymeNBku6ulxkmxZwoEeOpeY1Z3
         nIUoRmQNw9cKXJTFIQ/1aivcSlrJ+aCVdPBMJdSNoe0S59aCyN5f38aFrkAtIL+8Hczd
         G0gBrcamke74cYyq8ZqV+ro5vihpJMJsnIUC8o2cYLrjt0LTErVkCtFMdYTwBwiMwSos
         UDyVvKeZq2Tbh+8dZO58csj4XYEe0M5JJmpL0UvZ3vmGj5gTAzMOsOTvvv9JxYwYS1ku
         /pQT1V0Zph+Js+13KDoJbCUseeohZ+YhoVW9iEqd6MWm/irkxEL6z6miFicwFzDG+AYK
         Vo7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774305554; x=1774910354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K2FJHPPcvddDuyFi5b9Enk3oj2KWR4s1Mi0JeIXu8dk=;
        b=bMM3VVLS91YgfS1WgP1uJQ2aZBoegoFKdy/aEttZzNeOs4a6scpzbCMmUiNcpaPe3e
         ue1XvVJqRPDHL8OYbgSJgIv8wZOLnNKTNCZwbTumtCB0NLurJGlA5EIncwoVe3BmyD8T
         ArENyFX+rSIFk2m6WfEo7u04Ye+VKMxpDVRdB9zvP8C5oyP5E9jozD69PVfh12yZuzrZ
         GICQ253yKx65cOqZ/mJtfM37c73e+Hm5vJECigv6QBamWm/H6Ps40BvLrgU9EYD6Z8SV
         ts2HrPc6c1OybE8Sl332+p76650v7OCB7T0+KBwvlwZ6MC5ayqsYHy09GR/jA2dsShG9
         7ujQ==
X-Forwarded-Encrypted: i=1; AJvYcCWN4Ce4MNBX6/Q7DIxbDAB90JOPdreSVO9dtZiiJFTOhxfOe3YwuHDjXUhXJIAttGCLeJX0T6oaSP2azdfx@vger.kernel.org
X-Gm-Message-State: AOJu0YzdpQ6iEQRLqU1BnE/H9KsTPw5Pjg5Nto9gfHyteu/pa1QS0YZ6
	H3u139axAZDgyrPWxD/bef+/xOVg32Ujguog0gKyG7n15m+ykjADphXchvsls1iU1cX4NflBAiB
	S7s3vyMJywHwV/Y+m5Zp5/SB7GzdYggxidf1tTTBvuWtt0/i+w42SvRRWiKUEx2ZIz9Y/
X-Gm-Gg: ATEYQzws6BVVGKK+kbYoVm+9Ds+zS99PbM1kj9lCsNHXRNz0pNklhRqOoDIDfcU1vaa
	vUw0RLTUdO0vcHfOklOP9sgxHVa9w0lqP1HoXtuyh03q3Z9GiDZZAJ5iebGLtqVq/edWBZXERMq
	F/MLNiL5yILyQP09UAXmTHWDu76J1akoHuispfWlVI4NVL/MfWn7xWx+mJzJ/BiGVMUu073X0Lq
	OHnzk0xynyDLjMhTJAPyapeBhCE/OVAt/AzmTFebT45ITLqnLwi4y3BeRicIhDIBtfqh0uZ6Yn5
	n1OVRWxooh5aXC/JqqAMfkD5hikNRRV3IByMjiF2Rha2ug82YhJdqGC/eC2Mf0uwTO6aRglQBpz
	BE0vqONKBSfkL+ZFB/VhFyVEwVH2dA6Ti+9kwozMMwmYzGMIOx7mHo70=
X-Received: by 2002:a05:622a:1e0c:b0:50b:3ff3:f4a7 with SMTP id d75a77b69052e-50b3ff3f592mr191077381cf.35.1774305554338;
        Mon, 23 Mar 2026 15:39:14 -0700 (PDT)
X-Received: by 2002:a05:622a:1e0c:b0:50b:3ff3:f4a7 with SMTP id d75a77b69052e-50b3ff3f592mr191077051cf.35.1774305553946;
        Mon, 23 Mar 2026 15:39:13 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64715539sm33320351f8f.33.2026.03.23.15.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:39:13 -0700 (PDT)
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
Subject: [PATCH v7 11/13] ASoC: qcom: q6apm-lpass-dai: move graph start to trigger
Date: Mon, 23 Mar 2026 22:38:43 +0000
Message-ID: <20260323223845.2126142-12-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=CYYFJbrl c=1 sm=1 tr=0 ts=69c1c112 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=8udmP7N65bQo3KbB_RsA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2NyBTYWx0ZWRfX2nw8Xz9zaI9J
 cOngkFFnM1np5H/lzpaxeeNGY0I9VVohsMLjOKlo2vm3MpPYgK1JQ2EdjSnUqhXWtTMuI6e/TPN
 cHMmUK5cdqcsBsK1u3bZS1xb6JOsYwEZIGOuzDwU3OWo7YjvvI3BVqiqCaZPcCE0o3Pui7eVZ9K
 5PbXsb5KpFfBuBei7OS5u+f9FBNJJAdLtj4XgvNgcAy3LtVhk/lvCXX+puKy+hKnLM9LBjM8Iti
 SXqpHjZUXEiCxLGS/02HyZ4h8HKxiw50vkN3/EZuUOzPqlu/dd0qqSPtZbe+uO54ML3sppJYyoa
 oNy5CcmHcWNwbz8soQ7TsSfesFachjdSMOop+6+suV42Ua7qWqN9r1vgsGYf1nO0Pn29IUv+sLZ
 DkxuVQ9evxDBx9wxNHSCmKoEI8WTuODXCrKdZnRoMmbSZp+/zxCTiDqeNWBCk5ZkcZ5FrR1CRY+
 gJDkZqvUVoPFXBWrqyQ==
X-Proofpoint-GUID: nvA7gUOnMLD67LVV-uBbWmOyF6odnGYn
X-Proofpoint-ORIG-GUID: nvA7gUOnMLD67LVV-uBbWmOyF6odnGYn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230167
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99427-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7BBAE2FE726
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Start the graph at trigger callback. Staring the graph at prepare does
not make sense as there is no data transfer at this point.
Moving this to trigger will also help cope situation where pipewire
is not happy if display port is not connected during start.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 40 +++++++++++++++++--------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 87f6db12003e..e904066484d5 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -159,6 +159,31 @@ static void q6apm_lpass_dai_shutdown(struct snd_pcm_substream *substream, struct
 	}
 }
 
+static int q6apm_lpass_dai_trigger(struct snd_pcm_substream *substream, int cmd,
+				   struct snd_soc_dai *dai)
+{
+	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
+	int ret = 0;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		if (!dai_data->is_port_started[dai->id]) {
+			ret = q6apm_graph_start(dai_data->graph[dai->id]);
+			if (ret < 0)
+				dev_err(dai->dev, "Failed to start APM port %d\n", dai->id);
+			else
+				dai_data->is_port_started[dai->id] = true;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
 static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
@@ -171,10 +196,6 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
 		q6apm_graph_stop(dai_data->graph[dai->id]);
 		dai_data->is_port_started[dai->id] = false;
 
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-			q6apm_graph_close(dai_data->graph[dai->id]);
-			dai_data->graph[dai->id] = NULL;
-		}
 	}
 
 	/**
@@ -203,14 +224,6 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
 		dev_err(dai->dev, "Failed to prepare Graph %d\n", rc);
 		goto err;
 	}
-
-	rc = q6apm_graph_start(dai_data->graph[dai->id]);
-	if (rc < 0) {
-		dev_err(dai->dev, "Failed to start APM port %d\n", dai->id);
-		goto err;
-	}
-	dai_data->is_port_started[dai->id] = true;
-
 	return 0;
 err:
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
@@ -254,6 +267,7 @@ static const struct snd_soc_dai_ops q6dma_ops = {
 	.shutdown	= q6apm_lpass_dai_shutdown,
 	.set_channel_map  = q6dma_set_channel_map,
 	.hw_params        = q6dma_hw_params,
+	.trigger	= q6apm_lpass_dai_trigger,
 };
 
 static const struct snd_soc_dai_ops q6i2s_ops = {
@@ -263,6 +277,7 @@ static const struct snd_soc_dai_ops q6i2s_ops = {
 	.set_channel_map  = q6dma_set_channel_map,
 	.hw_params        = q6dma_hw_params,
 	.set_fmt	= q6i2s_set_fmt,
+	.trigger	= q6apm_lpass_dai_trigger,
 };
 
 static const struct snd_soc_dai_ops q6hdmi_ops = {
@@ -271,6 +286,7 @@ static const struct snd_soc_dai_ops q6hdmi_ops = {
 	.shutdown	= q6apm_lpass_dai_shutdown,
 	.hw_params	= q6hdmi_hw_params,
 	.set_fmt	= q6i2s_set_fmt,
+	.trigger	= q6apm_lpass_dai_trigger,
 };
 
 static const struct snd_soc_component_driver q6apm_lpass_dai_component = {
-- 
2.47.3


