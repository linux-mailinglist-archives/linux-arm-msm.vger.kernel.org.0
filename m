Return-Path: <linux-arm-msm+bounces-100695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDeXF9U0ymnn6QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:31:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B94B53572FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:31:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D40F7306F3B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 08:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 568923B47CF;
	Mon, 30 Mar 2026 08:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DVa1vPa9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gKHsbLkk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886C43B3893
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858915; cv=none; b=DyqaevXa91G0EZb+TnNrdaU5KnEUd/Wy3Cyv6NxCELAXvPoUkEpYlS4CCz/EbYqzp16xE68AqxoBc47GvJ2FsLmfMxnYHXZtlo0eqYycY5/As/2I4FuiYJh+/0RPs8tMgyVezWLriOKtxCf+WlWIYDUlKtM7nMr4mcquqvb0c1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858915; c=relaxed/simple;
	bh=HcBUaG07YHPkjw7AtCbbPauazCJLhtW0eS3T+3u2Oe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZIQomJtYFgpH0o+/+vMow/5ASwKQxYeiExg+2D4NcrRtL6osXPZS6hWp9VCNlGK7uG6X62GhwApSIZpT+6qw30eauM7wm+Rkvelp+ZhtDAoA/mAeVzQSQPWSTzOQMBcKwpZzscNizOZhsvgUrFv+COzZJ5gFNh3ZJVIQi7IOEqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DVa1vPa9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gKHsbLkk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U7UHwp2413584
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:21:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=K2FJHPPcvdd
	DuyFi5b9Enk3oj2KWR4s1Mi0JeIXu8dk=; b=DVa1vPa9Y4wBlOhXCMKHzVMAzBY
	Kz7vtZNCLU2TDiWtpr97zM4Q5yxljodCNoF2LvtMNP6g4AkOOaLFas04H0j0x89q
	/0Egm/ctAkOX8sa7qeoJ7bfcrjNzOSQL2ckCfFEiGJzVZDpdDfpX7Df6WgyvhSIr
	DoNMhmk+VEm/CfM0XiOG6WB3BDB/fri1Q3xsc+cvquVUVJ6+JMjxzTH2TQoVoKEw
	Bxn7qO5S9x7egH/hwWi2Hx8QPkWXY5qIgut1iZHwsNH8eL2LSUDvy8vym5ygpx2c
	GSK0bU9L+Zhy3TVswmmQnvay4E5eheAlB9AEpWkUZMpFlPcFDxudJkeVi8g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d685hd3sy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:21:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b274f94f8so52945501cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 01:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774858912; x=1775463712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2FJHPPcvddDuyFi5b9Enk3oj2KWR4s1Mi0JeIXu8dk=;
        b=gKHsbLkkn3WCJHWEvbQIYufHSGlyQr7jq3p1LK2TuwE0MWbXGJZ6Wh+GAjYDJfiy/O
         PUvLBXlttrn1PteDIpJi/YZolE85Psgat46KchGFoVAgfRD2vtswBgW16OD08M5rsBUq
         8bf6krjwNHd05RIEZBwKftp9MjZ1fPttXMTzQ7U1iZIE8Zl7mQLKBTbW0hUokayNF8SY
         7u8dNRWXvX4589mreHEkGPWmqtXtjhXJeX7eixgDtzQAYZUhyABwMiyaXb5kpCGuLGCM
         X7evHBAddigVHQQ3ouaguzRr9AhE8tp6XXtRuMnto+yilII94l0Wd4r53FYFKhSc94hT
         yuaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774858912; x=1775463712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K2FJHPPcvddDuyFi5b9Enk3oj2KWR4s1Mi0JeIXu8dk=;
        b=etWgCydR7ArRUGvBt3wg0KnoHjX2Gt47+DsP+lPlmT4niXNotKy4Yzz9+OEfMa0vyt
         vNFHKrgLK/5ExVrepRoN6gXoAJNQlu8ZIq9sACPex6E6s4DriO2Xmf7nsQMpJQebMyUE
         zVEMZ1g5ZxfOdL5/TCRL6tLBsuotsC/o7oGXY+koDitQf4ktNwINyf9rbhH+oyOgMJgX
         dxcwZ/3nkQqK7AAdLra4uC7pAgZPzf9xvvkD4Zb4h4TEMvSrVhlU2enTBQpFTk4wItrG
         7uH9C6jE5SXaBeCJsrNWH9QLz5Qx9hiw79NCx4KLaExXECwe1efaNOt8vRXjXbwTw5AD
         4BrA==
X-Forwarded-Encrypted: i=1; AJvYcCUoffw70DwFxRqW4kNKWgtQP9edsLYuuhF5hW0dkbAJzFp1RJHW8n2eUH0zh3AkeVtMQ/dysxpPMrs75sbN@vger.kernel.org
X-Gm-Message-State: AOJu0YxvjEhb8oZO3NY5veR5HOmyH2dZNTBk2P8s+mrekp8Lj1QwbCvL
	G+Y7SOY8cab3zv6nk5fzlR/SDINEFXXteqB5x898oJjZx+WC7zq6sayUHQswWdd3KFoVeWryHhQ
	JERyBLeZ4+ZQpXqjVCvVSm+4bHel15WomUOMPRjNhG1nIheZBxrcJwt8d5fxackkloc1M
X-Gm-Gg: ATEYQzxcto9bEygyP7cu3hnumX2R23W4ZmvRQxkTs+cp1lzshcxm9G8y/Ydq5IZ4LH+
	J0EMuucg2cg/g3xh+IisHjRLWnst5CVGgAIdmKgDDQmRbrvhRpI5TBj3eR7vmD91Px5kij+C0xA
	BdRbjEGiIeXuy3PvX380ctM+Bo5Utcw4D76v1k2iWRa8HUzAbQpGBKdkWtCyUAJafb8lRjibBal
	7S+4rfPNGNOX/JKbSzIZ2UHvdDmIrFySCGqyzUPja7+NTX7Cwfu08HBZCj5P96nf8IU0UoJp4YT
	0SsugnPXeIZIizdediGkkBnTk5TbctcqyOQBSxEsLLDK8D98k3cvrnoKlFA7i8XrgVy819FTp8f
	eXhw0tJE6hHWb9o0ngXRK2cAEf92xvTC0o2ch/yn67ioy0BrYH6UvDUQ=
X-Received: by 2002:ac8:5a46:0:b0:50b:41ec:5e85 with SMTP id d75a77b69052e-50b993de828mr186876631cf.11.1774858912001;
        Mon, 30 Mar 2026 01:21:52 -0700 (PDT)
X-Received: by 2002:ac8:5a46:0:b0:50b:41ec:5e85 with SMTP id d75a77b69052e-50b993de828mr186876431cf.11.1774858911593;
        Mon, 30 Mar 2026 01:21:51 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf1db08e6sm26244773f8f.0.2026.03.30.01.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:21:50 -0700 (PDT)
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
Subject: [PATCH v8 11/13] ASoC: qcom: q6apm-lpass-dai: move graph start to trigger
Date: Mon, 30 Mar 2026 08:21:03 +0000
Message-ID: <20260330082105.278055-12-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=csKWUl4i c=1 sm=1 tr=0 ts=69ca32a0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=8udmP7N65bQo3KbB_RsA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2NSBTYWx0ZWRfX+7d0atGfq4O5
 NocM0e/gvR0Tnv2jLDP6EkBKIi0/Bfd6iM378iENPjNH3cHEOJ4mkq414/vMJ/6eJMwdX4aTzmQ
 D1QU9y87n35q09djLv1p71nRXVUocGAO730AucxbwTqIQ0J7yIkoAFSJm/s453TC1+6F473riDv
 3+cXFSQCQtNOGcUhQk/jRSUc+m5qZTWp7CBg9IXl6omyFDtx1MxCpJhs6EVK5CLpmQ8uM43StLP
 7nTI0c2se+/7tQ//lmfOUMKdbzVzfrK9Sw6CFRHoOnkqYNF8hiP9UgvPaObSfb1Zypx9LUPK2mY
 NTaStiXIPIABoxVA2LpgXzy5xvirUgpsDWLpfIn6XQVY5tdGbYonm4Ew93FAD0ILV+z1oLjjgAj
 5Bms9wPgqvkWEkIWhr0q333ONNrXwHkCZGflhhrEz406O3vYMZH0cL+U0bn1+GvfBcZUXSqOufB
 BOo/dDql26q2hcLr9tw==
X-Proofpoint-ORIG-GUID: DA_NlKxPNyjfSaFlM9oYCPZs50xuzDRp
X-Proofpoint-GUID: DA_NlKxPNyjfSaFlM9oYCPZs50xuzDRp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300065
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
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100695-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B94B53572FB
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


