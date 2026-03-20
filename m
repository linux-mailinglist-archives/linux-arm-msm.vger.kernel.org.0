Return-Path: <linux-arm-msm+bounces-98948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJRcNpJivWlF9gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 16:06:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B842DC4D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 16:06:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C8EB13073D97
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 14:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6898B3CE48F;
	Fri, 20 Mar 2026 14:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IqWS0ATE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LjBZHLKy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABB83CD8D0
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 14:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774018185; cv=none; b=Dt5L6NasEXgbhX2/w/GdsPhOEKkMuICqiGnZoXvRPX/kwHFCmi1z/QiPj1GYIp3d4osnCvQS5QM+2h9KUXniCJQV9XbaEEK4d703jKX7pVpBmEhV71TTp8OdkF6sHX/bWPqHu6OVy9kzz66cVU69MhfuUCelz+ni78AE7Z5IOV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774018185; c=relaxed/simple;
	bh=HcBUaG07YHPkjw7AtCbbPauazCJLhtW0eS3T+3u2Oe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UMR163WhQZAoIeNRt/4YSjKeAu0zCxVXcxxaWjSTTh30+2Wy1eEEDsrmay8MZ8cI6NrBr/I6cwMcJTowqpddm4GAnlLFMhMGg3sXAPhn1UczjFqLsaYIvaBDWIMnzioscZcf6ABU31aLpTxoWqfwdIbZL4+ScKoQ3cRsc/74BPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IqWS0ATE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LjBZHLKy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62KEYaA83557556
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 14:49:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=K2FJHPPcvdd
	DuyFi5b9Enk3oj2KWR4s1Mi0JeIXu8dk=; b=IqWS0ATE2IIUT2Zo0bm+ufMAxEQ
	LYTadGvd493j/mY/tSJSsFolB6nnJyftoJ7wTBSqTDfViClsUL76F7s4Yc58Ulb2
	YKpRkjIYaDXS7UUavG4liHS+YF+Ng0E25y9DE71WD/sEqn7ng29brVKlRo1WbecD
	tT2J87vn1G07V4gaK8wD/zAhgUgvuUJsNQb9TidLocP64WEDwOF8UdWlqCkQwwym
	9ZIVTdMciP1/EAcEsk2USL3SRkA8dezPPo+lNF28EIspcJYlcbQK8PtlqHTR/07s
	vW6QekB0NsL3n/ESOM4WgZ8MoEBmroxuhrU+jYcxxO3RS33lb8otZeB+stA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0r1gtfpd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 14:49:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5091ee9f1d8so175428751cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 07:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774018182; x=1774622982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2FJHPPcvddDuyFi5b9Enk3oj2KWR4s1Mi0JeIXu8dk=;
        b=LjBZHLKyDqZgsyViT1jNc51noRRYu0dyAPHO337bYPG36bMlplkcs6KdOtglIxTB8i
         MKct4lo5BeAi9rPsqY+ZmtG3UYx8nVYK5c9uEu1ki1uiIFP057mlwFemK2lsxXDKF3XD
         fVPXO2zqKIMy/X5BM3BaW/0M6e7TD8ElbsrjZht6GwZCNGROTOSHo8oZT9wr+8PG/H/Y
         sh5+9TTZprMR1wehH4gLaSXgrfBVcGQ1+IVFGxaZ0KEnVBfFippocLUXlC3FIUM/pjyG
         Tidqwgc09e/tkshJCPqHPcwl5+h8IJTN49jHWkqNu0FNnSXnQ0Hgd+Cj6p4PvEDYBmll
         RmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774018182; x=1774622982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K2FJHPPcvddDuyFi5b9Enk3oj2KWR4s1Mi0JeIXu8dk=;
        b=qLlCsGdTZSn1KfthDy5iaOM0FiJ6u36V0mOvRRQ6H61evOUzfE+b5/bmjw2jDrpBw8
         NbN87ffFny64Lx3hTEuB/0HQuFGGxnx3FM5LbmocHc+W3iHuN+5Dbi1+IZVFESCDhUih
         YX9CzOV9EaGp7wh+f8gopb02Um1pgsGXqOcXvMFyh6MVvpc88EPS+JaMbhv/teZYX827
         oSwjqN85h6n8Kxx2IK7/vfZBc4Ni1ScNtNAEhPcWH/stZSq4UTxY3Wokn2hVKnyGiux4
         XINfoF5ADxFGCrH8TL041XMXalsBG61W+YrbY117Cra11Y/aqDTzA2Q5UgT4kvxVLnXF
         /klw==
X-Forwarded-Encrypted: i=1; AJvYcCUasau3+B3GrjjcgR1xjw4hjAnzChyjpWEflgBhAXLWhjXP1S+Q0t3FqtCKmbyEzMMNKGexSk1ZLH1wmWzs@vger.kernel.org
X-Gm-Message-State: AOJu0YxCpVWybGHmr+EYNXSC48iYyfud3t301SdVVTDQ1GtvclvTjF6p
	a9P8Sb88JGQGU0iFbJvG7X2u4JJzqo4UbFUv/DSa3Jb9mfFzrmsIRqj6ED06ZD/WTE7fFF3ft9V
	cy3PDRPuhts4ZKE0JUcr8ibYoDpNFRDSLFhXEdkokw3DrPhG9pCtnau0FIMT1ybXM/mWU
X-Gm-Gg: ATEYQzwnWgGp6bdDceqoi8KnfchVDR4fwyLqqHPpnFVpgt1vRL4ADqFbpnr481LdwL4
	BdUb83I1NKdGTXanPVDyDNeeL6HSY1j6/q41J9q76Pfozmlp9jcVdHLrT6nJassNbhGWx7ATDqA
	vVIxNOU34V23NJ2RCKITiYJ1H2nwbxIIiASKGNQsty1y+ap/L2RsNkBKQHHUkzELiBVsdUBKowS
	ELpRb4ediLG7joTjL/hACjGL1GKwOtPvjiZY6APgHeRfbjHVt9cM5+gK9NgsX4Hz7npzJntIwFD
	i5wqj+XLlgNlVHbQ2H5lcrLqNMXLzWUr2Qqgw7JvOJ8i58Lg6BCcDJUgxtZsOaTsCUu6wBELOVH
	+XjaZMSgt5Z3a8OXrdscHietVyN2399Dw2NRp3zesTxx26nCCL6IZkfM=
X-Received: by 2002:a05:622a:130c:b0:509:202f:f03 with SMTP id d75a77b69052e-50b247ad184mr105792191cf.38.1774018182327;
        Fri, 20 Mar 2026 07:49:42 -0700 (PDT)
X-Received: by 2002:a05:622a:130c:b0:509:202f:f03 with SMTP id d75a77b69052e-50b247ad184mr105791611cf.38.1774018181640;
        Fri, 20 Mar 2026 07:49:41 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff109b95sm47906825e9.1.2026.03.20.07.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:49:40 -0700 (PDT)
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
Subject: [PATCH v6 11/13] ASoC: qcom: q6apm-lpass-dai: move graph start to trigger
Date: Fri, 20 Mar 2026 14:49:16 +0000
Message-ID: <20260320144918.1685838-12-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDExOCBTYWx0ZWRfX1gV41wawFABO
 jBTU120QjgiQDapHUGyCXDuUkcvlngqpg3YvVnUX/8zQq/cx0nacF7tG7HvVDYHmiCzkgTxSrpP
 MKoFGCRLymW0qnXQdJoG4SYZYy59qL1yIap8BnGO6RFfE+hqQv6Cn2yLA+8X51eL8fDuOeL3DR4
 4plRMfjKUeg3MJFwVkJE0B/fv5kS3sgNdixlu/LQG5rdT+a9kkphqj0mFsYw427n45FsDIfCUvz
 9p09VZH3Drus4bXMvtWfzMnJ2qX2MRGntmeKDvjwub5EkkYQxZivPYtdmoSE7tRdMtHVk1/24f9
 6lzOqx3DGjWJn5sIqqhC5zzYaUSCXkwAK0a8A+Wom6qcd2Uf2Q7Ukwq258xp5WRJJOky+UoYVmb
 J0J51Z31PQP7aFaHojl/zcoeNh0bP31u+5QAs9l2V3kTWc07BWiApDc7lme3+QuTtN/sPBXEk9N
 i0jaZv2PyG2ruXJaOew==
X-Proofpoint-GUID: EBE2Z-e0kyxJEA0mh3h8eB8nDvn-djVv
X-Proofpoint-ORIG-GUID: EBE2Z-e0kyxJEA0mh3h8eB8nDvn-djVv
X-Authority-Analysis: v=2.4 cv=Y/D1cxeN c=1 sm=1 tr=0 ts=69bd5e87 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=8udmP7N65bQo3KbB_RsA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200118
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-98948-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.971];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 51B842DC4D5
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


