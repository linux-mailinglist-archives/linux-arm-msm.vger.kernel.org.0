Return-Path: <linux-arm-msm+bounces-101474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCHkGIklzmnElAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 10:15:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F96D385C01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 10:15:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B337F303F70F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 08:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F19AA3B895A;
	Thu,  2 Apr 2026 08:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WXWoOQac";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YU8B/D4X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AF53A6EFA
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 08:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117520; cv=none; b=AIUE92YaTJxYc0a9yTvf/ku7eeMnG0uGnMxMlPHQtJ4HxNUeoER3nV5iMY/XdRy1xG9RC+tPmA0mcfbGJ8AtFcMIxKDQvgYZ8eRUxZBY0SjFAUy/v/0O9K8tS508wS11GHL9/xho+JjxPGYUEE3hdcrgtTEOyZkm1w02052RZNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117520; c=relaxed/simple;
	bh=HcBUaG07YHPkjw7AtCbbPauazCJLhtW0eS3T+3u2Oe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kMPkDS2IfJQsAdfKfbAmjry1NkR5RsUGQ32P7iqZFblKVYg6OXaZrIHVCesbnhOJ2K+oApFgiFgGnrhFSo9orfjxuP1Uo1ejHj48t6iqtOQEsBby7wM5E6d42r/WmvY1craQ+o34SCgfrd+XRxsEgyEK8Ihi9KF6Q4ZTlW7dVYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WXWoOQac; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YU8B/D4X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6326qNvB3746217
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 08:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=K2FJHPPcvdd
	DuyFi5b9Enk3oj2KWR4s1Mi0JeIXu8dk=; b=WXWoOQacAwtuIXibE5A1tE6zjT5
	OKcVbFpDpTO5uvLmm3BDcO9ft9skGO/P5ah5mrGRIc43fdjpneEbgLYUcGm1F3Dv
	I9UJ5WPOw9KnnPjsJKXjmZJynZ/nKtXaxFE+e8YJZfqEsY1MHQH/hEz8js8Z3BBw
	E77B7UiA5dJWONnA+Ja2VdgJgDiqRhJGV4suKzYub9fvvQ59I9Z6nnCa4Y7YJfwx
	2cco1QI3EB7fHzhOeXTn3K3q2Qv01HvXvDoYuyg4jXxyEYefLztiYI3jjBqo6RHj
	MvsnOonh8ieWk5e4wEUXE6ZBmNqLwXhlmMKJETUNfpzG1cvAS4uvGJYwINw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9324m80n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 08:11:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso2372081cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 01:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775117505; x=1775722305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2FJHPPcvddDuyFi5b9Enk3oj2KWR4s1Mi0JeIXu8dk=;
        b=YU8B/D4X+a7RKaeY2Wwofi14yD7XArmrjjP2BCpWFZWsrbrZhVdJuw8BPmNplEm+iD
         xAH6fNVAZ3Wu3kr2M2kqRBYafLweQU/RaSX75QtFGMirqZOAZMlaTGByjzBEBDUaR8Ak
         /jos0bzPW7UES9M2ba+a+W3PmwF6Z2NssDO5MrLrRV2DOZkAWYzxXDwoWItX5yKxHsLf
         LURfDz0vqpQglW/QRuYag++HZcZDz1hNJPZn/QcWCIJJ1aZ0fMnEX1061OH018iXppX+
         mDDHvHCdN5Z4gXKwzo4A2mpd8nrxOp3wjcGMLENdg7tMZ3TDS3sJqG7NrCyEcrNN25h1
         d1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775117505; x=1775722305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K2FJHPPcvddDuyFi5b9Enk3oj2KWR4s1Mi0JeIXu8dk=;
        b=DoeVUCjMCy2UgtzBKMU/dnLg1Xkm5MlXV6gYs4MdiK9k4m6riFbMDAJHCs5PpoHzkf
         uFsK/oX6FWRpCTetPpHQ7p/Q1QOra3mUzWLR9imjOsyn1fgWXf3JbC5p4Y+sg5O+rfm0
         1dsylvK8O3hnX960Z7IXYBgnUTv8/fGCzipSx2bPzRlcGeBsLp7LFjAb0Q119VkvyW2e
         9NghgQGFeektW/OeS8uBDKOgMwM3nPfPvkNx4JzyBlAxaQH/ONUCv2Lzx9A7WuI5d1sU
         /JUzndY/MPdasSBLEUeZKth+QBcILfpwqLhgZPMMDA+ayoA/jFs97HLVdznHAWaeCBjr
         f1/A==
X-Forwarded-Encrypted: i=1; AJvYcCXWF6Qf8D+hrpr6AlDGPzWt0/GJSAG7kfTEE8/oCGkmlknlgbDJzu4SBzjfV3AYiy2CLSPVJ2BdTAImXJ4c@vger.kernel.org
X-Gm-Message-State: AOJu0YyXUji0f9lONRv2DprEgVffnJjGWVAzhLTlNu8L4V1o3dEtSEwt
	lB0SVhG1tWl8+U7L5mw7kouzj3M3Yglgvyy1jqZXbTNEZNHuYPvPMfdrYXYSSY1fIvv2rir1WKV
	cwK4uKKYgH8KPIFJvLO7V1y8yiBrp4Q7bk6ocdzWRAjPq9mD+xhnjqi3cGGXA+Ib44De8
X-Gm-Gg: ATEYQzyyB9N8DkzknAbVK9VJpEpA9fjrMyOswdDYO+pBlJHAic8Ncls9SEJpSpNnuzr
	N8ZDzabCMMCFN0A822IKo2jaZVgSF/yB1g1d6q9v4YK7j5cGUl/X0O2OVogbf2pWtSkQ5aYHS3W
	uXvfJBm3kvajvKMblZzOK3gSYXk7uS/Rk2wfyWQP28sMQZISB1ofV4S2h+PfSxvARBdHukUrVBd
	IKPRqAaPrubtYRjD7Go1/xcMjXNyCFLVVusGm7YCWQWUKWqpS1JHFBnxxXU2RnEHaTswYUceMRN
	PVfJZxmRtwnoWHQ5Ppef+ZyrDq02c/hTh9ogTkvvx2gWjOnazK2CUatdw0XUS4tQKrWID/96dfK
	Q8cdTNxwSQUgJEq1lRcum1dqyU7Nz4HINx3/pGP1VjWAmM/G8GSOyJQ8=
X-Received: by 2002:a05:622a:8c0d:b0:50b:31d6:f7c6 with SMTP id d75a77b69052e-50d4fa3616amr14829871cf.7.1775117505042;
        Thu, 02 Apr 2026 01:11:45 -0700 (PDT)
X-Received: by 2002:a05:622a:8c0d:b0:50b:31d6:f7c6 with SMTP id d75a77b69052e-50d4fa3616amr14829551cf.7.1775117504668;
        Thu, 02 Apr 2026 01:11:44 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c3a01sm5712604f8f.12.2026.04.02.01.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 01:11:43 -0700 (PDT)
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
Subject: [PATCH v9 11/13] ASoC: qcom: q6apm-lpass-dai: move graph start to trigger
Date: Thu,  2 Apr 2026 08:11:16 +0000
Message-ID: <20260402081118.348071-12-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: O7golgquun-hao_hnRAXZpwmlon6Xu9C
X-Authority-Analysis: v=2.4 cv=TKBIilla c=1 sm=1 tr=0 ts=69ce24c1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=8udmP7N65bQo3KbB_RsA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3MiBTYWx0ZWRfX+4g7UstCa1eO
 woj9p7AoWvx9NtevQw2L+rFARGOh/Isf4ERMfbEgC4CBsCNfAbqFR308HvBie7yFVMDTLxHyCvE
 twqw7X98hjFr2rUoBv/t36biVOsJBR8z6jOv1aIkmnexoVK5rkhbwmwWXc6dAXgVZ9sJjbQJLo9
 rFtFjAo1hfiwujO7YnBGe6kjYognvlzK6PrAf4spyzOicp2vMDlrnP4y+F4uk3RKA+LVmriPIWi
 o7l/Tv+TfWVp+nFru2j4Bp9ZHupa97ocCC0PPAbxk1NfcGpbEPPqWd2Ng8LveqJIQaXl1aVTEx1
 9j/Sw9kTwsw1ab9e9VKDK6Tx0f7542adp1Q/bOMCc+7Iq6SqFu74A97iEj/qxeohIqy9GxGAmuy
 xszO/ciVSoO7eIPOiXEyVck+SfgjhWmXfdr/reP30dheorBYj4hc6TdOJ+BgucgVZzTFaknK1aO
 zknvDuibWT38tJjmsfg==
X-Proofpoint-ORIG-GUID: O7golgquun-hao_hnRAXZpwmlon6Xu9C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020072
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
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-101474-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4F96D385C01
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


