Return-Path: <linux-arm-msm+bounces-95805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8C2nCJzHqmlTXAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 13:25:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A73022208BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 13:24:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6975F305020B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 12:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 921BD392C56;
	Fri,  6 Mar 2026 12:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h9zx2upK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XFL27lFw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F2D38E5CB
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 12:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772799744; cv=none; b=BsPnu+dHbXDOBWiaXJH/iH/+yGIUeq2sQB4a8qsKOqLd2JTYXFgHUYRWj2Mvn4esuyOJUmJF9lRnXXfb7mRGNxk4z7qJXAqbHVsJbVV4prkAp4rxzT78PDQr4QHbiX+7ZUXYgR1ObsByFUTTXKFNAucYou+w4yKTZJJRXi5oN4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772799744; c=relaxed/simple;
	bh=B8mb+C29aHmXpiZ0KkyuEWv+QuyMzs+RA8VA08jucnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fGtpPGpeQ03CbBSrQovhFRFk1YPjwe/OVG3dBW/SlnE96RJWCc0LVpySAISuZxxk1liiSF7aVnQfqtjyauZqPM1kkCqmecKurneyouISF7LubFSUZ6kvFay28kN5AWSSx6xB1oXqbIdIm567YchrKWRIUgasWMpueqvToEIPyao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h9zx2upK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XFL27lFw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BbN8u2022828
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 12:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aC+um2a762g
	fpLWPhHdIhYlAN3YczWO4vgnfj1X+hyE=; b=h9zx2upKPzxJjheBIJqXNAqxAne
	AIJvmnyGUIHvD9i16GUHja2k1z4Nww2tTonNnWYr6hh74K0/S4RRkRm338A98Zlq
	uoge84oru11xNzKyBOVtjN+ls8PcEw1LETfgLQOwzELgSgZR7sPOMUDnSMgmW+Wq
	bPg6si9E37Z639DD+MdjyFgHpefk2gh1G1JdKfPyWRlkCZUmQst+35tLRodpEZar
	r23oXYCioSFf2LXzg7Cm3Dj8fGWXBHqn42Kcs9W9FcRo+ULrFRcu7LXk6uqoQGcW
	a/qP1Wm/8vlH/DzITpJI5Te7UgI90zKyXlbyfjarH8mhOE26ySxCW0llUaA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqfg6b3mb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 12:22:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb37db8b79so6626985685a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 04:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772799734; x=1773404534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aC+um2a762gfpLWPhHdIhYlAN3YczWO4vgnfj1X+hyE=;
        b=XFL27lFwzV/tY5/OFor8j/JNkUHrEAGITzKfOW+SPeizBURqumZY+7y/0nfuwFTPHt
         MB9TAHOB038mye/0esAXBEdb0FzxJT2Ucq9aL1s+Dk7ilCgVlaYn2Rvn8VGUlIH8Ql0s
         o+dUDTBtJAwQbGTEwBvMv0yTh/CHtXmeCE7OmTUvas88OXSsBtsN6Xd8tnzEp9SMHD2n
         iWq+YCn557ytcLxsR3YXoHiJMkFV/4qtu4uvqou59+6yGlVsJ6D7Ijh29PI1JJc9GCYs
         M3zX2+8D56V/wGlzA3DdIj6mE3J3ghr5uShQXUGyupRMS3GN3o0SJqTxQXkPvzYjHbIr
         UGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772799734; x=1773404534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aC+um2a762gfpLWPhHdIhYlAN3YczWO4vgnfj1X+hyE=;
        b=lzcMkhsFWtWngfEUEuveEKhy7uNz2CgJKvGFE56cpfAGkjT4hdvyVqwrHMumijvN3h
         JC4Bb0wAXPNO5xC4zXMN/eXtlHYM89LZST4T82nazTrDudfAGKLw9mdY8MGKDL7pl531
         9YG3UQxDReR6kyhYfmo65OZHxRGv+eURV4UL7pD1g2nqeK0YO9DOGTKkZcJFmLZ2jhCM
         GN01NePNTu00aDVwBEIj0+L/GhEiN1/Uk297Y5veeu9TIk4po8zGzAKi0jz3qLKkqBf3
         J1o6+ngL50C3fFphzyZFAeyDg+8LbmEfeN0agk6q11YouaBEbx94ObRQSaChz2kIGTsS
         yP8g==
X-Forwarded-Encrypted: i=1; AJvYcCUENlIw9uWT5KGQE1AWbV81p+7Nfyx8+boL4rosowIkNMIEwqu1j2F3zeDJqoCiVUf8v5o44E+A3CZqHQ7P@vger.kernel.org
X-Gm-Message-State: AOJu0YyRoZeRPzBqRtGCjJwt7aWVxSrlNuleMHAqSViTuwSUmRxthrwi
	o8PYRySUtFbrfITJ1qSSfevE+vI2eiRWCSBlhRLd58cON2kb4gbzik7OhmyPmI8076uWkKN7yV6
	nxb1L92jxWaE6825ty+WfmbTCM6oWbhuUuFMjiEUacynf7ud7l0DDBwAnSV2IRNsG3+Hr
X-Gm-Gg: ATEYQzwkXGQietok6Ef+/5S0Ki4tzrS+eVdRjHxljIfy45SzD9H/4shBI1zhegf1M1a
	Dsu0bFf+CdZH/aTmEZJhYV1AsjJ90pb8xALZNBwiJkyPFa6ygM1Tdax2GNqv01cWbvJkvIvCJs6
	xmP4XzabYqCtY7Z8PgBHasQpPV77rRHEXw9NcjeLIyBfLAH6L31WloYItK2pKmZtM/UVvkqt4A/
	M+cK0XIAYRbhAtqyy6UJl+r4TfvIQNtK3aoaIB3FOerYt+SIblokeIyVt4KFvKP5vpwnnCHX2Ib
	rUxsp1Z0PacRPjR6dqXkF3G1eUXdn0oZRrhCNEDO1IF52Uwu5icPucTV8oF/kkstzLbKiABpqXQ
	IP3a/r1lxGDZBmY1mUpviXhBDQglTSft3sM3Zg0FkaEoh48Hjy6qtvZs=
X-Received: by 2002:a05:620a:7017:b0:8c6:af59:5e28 with SMTP id af79cd13be357-8cd6d411a4fmr237572385a.22.1772799734476;
        Fri, 06 Mar 2026 04:22:14 -0800 (PST)
X-Received: by 2002:a05:620a:7017:b0:8c6:af59:5e28 with SMTP id af79cd13be357-8cd6d411a4fmr237568585a.22.1772799734049;
        Fri, 06 Mar 2026 04:22:14 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fa87e56sm111972395e9.0.2026.03.06.04.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:22:13 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 11/13] ASoC: qcom: q6apm-lpass-dai: move graph start to trigger
Date: Fri,  6 Mar 2026 12:21:13 +0000
Message-ID: <20260306122115.509705-12-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260306122115.509705-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260306122115.509705-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: RqHSYrBEet_cOJXLpb5EgApZPX-ecpM6
X-Proofpoint-ORIG-GUID: RqHSYrBEet_cOJXLpb5EgApZPX-ecpM6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDExNyBTYWx0ZWRfXzJV5FpKgEDnp
 0lgaSvg9YxHXBShDzb8vHfKleBcqWu0bEzqUZq8HT19CTAOvaZwN/b2pqPKZKsJYBO+hDjUfOgz
 fJXRGDEBHnjA7xCI/xeBZ7OrUKckFM+b5zs/OcGl3oypWUKDxyBSB5QpZ3sw9BrZqYg0h0NBQEM
 6Zcg2C2m7nvQOxYqEsMh0u5DrZVzAtT5OIqMd/U0od0P3v+Sj4Izqck5uGbsuMhXvZLbCiRbsIz
 Sd6L0O0bQp8gIwyWeHtuNMeeuyD5Y39O1e6ONa3UB9QZez0chJ15aQThT7RRskVkzclBzhZ3ZTV
 gMHJpK6YSY1QP+ak+wM/vJ4qZxcYIohtnLESYjk4Nn20xQ0urklXiF8kr5exGN1QHxv7CC4+3Xb
 DyShahRWH2OHqGE5XTicPBymfffiFG/kx3F/jgolbGCdGl+erEDzyXqTTcTD749/6uz2Qnxewv8
 ZBAVhEubPfb8D7n2d7A==
X-Authority-Analysis: v=2.4 cv=XKg9iAhE c=1 sm=1 tr=0 ts=69aac6f7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=8udmP7N65bQo3KbB_RsA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060117
X-Rspamd-Queue-Id: A73022208BE
X-Rspamd-Server: lfdr
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
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-95805-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Start the graph at trigger callback. Staring the graph at prepare does
not make sense as there is no data transfer at this point.
Moving this to trigger will also help cope situation where pipewire
is not happy if display port is not connected during start.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 40 +++++++++++++++++--------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 472b2114c81e..70e283671f43 100644
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


