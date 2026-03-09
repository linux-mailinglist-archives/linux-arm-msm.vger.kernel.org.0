Return-Path: <linux-arm-msm+bounces-96132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKSjOmRurmnCEAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 07:53:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 962B22346FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 07:53:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 07C2030234C4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 06:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0999364EB0;
	Mon,  9 Mar 2026 06:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N2d/YJuB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZcGvT+ee"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C3D367F3E
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 06:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773039125; cv=none; b=Fj9V4IVjl8V/WVlv1vWdTlpfkhiI8PGGRkiQHA/wfbhAawLZqy2usf0zokeW8CSZYnPNOFIzQbYWk1eO0qxL1Z4/mUKOk+3zC8VZB8cDhfw4DQoliS2nZVXV5vehbXem4LDZ6hhgN4yi2lJYwIzodt7kx2Qy/3R5WAjLDYilZHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773039125; c=relaxed/simple;
	bh=B8mb+C29aHmXpiZ0KkyuEWv+QuyMzs+RA8VA08jucnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qrOWl8IvWUFvJqGnpWuW1DNiV4g7/tGtRxnH7w+z29Ydhj9NovXLGIp2Pg10u5Gb/980xOPwJ/UWi4SYuQVFKXEWpKoUAml6VDc/p+NZ4FT5evEuXS16EbMXgV/taNdpdihgBLEkWTK1uQfII8w0w7S4//wdXzv8Tx5pQw4H24M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N2d/YJuB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZcGvT+ee; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6294eoYP1587278
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 06:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aC+um2a762g
	fpLWPhHdIhYlAN3YczWO4vgnfj1X+hyE=; b=N2d/YJuBs56jlxVkNwleuMJSaYK
	NgP8IuYQ5GQOaXC2SDLhxAbfE8NMx5/EJzpk+FACga9WJcLVEdP30fEUenug2equ
	3hK8LwQze03kg7WqCQXlz2fOJAWJlAhT8ZstTjC11hb+ICYvSsmFI7+Mdt/nJ//9
	y4wxsTJfPNJh9a6UIrlDPtRRuI3wnTJbvuUn2Q4utXsDswCxZFlArD2wjjU2rOgc
	f6ZaLKOh8q8gQo+uNS9Iq3E0epKgdiyqMiOURoqaKazeuAS1BeGVXnXGu27OMsrq
	OGOuuq5j6pK3b21anaL+Yiou7C/75mPNCKlNZgtTFw5Royp3kdIR1uth9SQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csqcy8ba3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 06:51:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd77e5e187so1031777785a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 23:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773039117; x=1773643917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aC+um2a762gfpLWPhHdIhYlAN3YczWO4vgnfj1X+hyE=;
        b=ZcGvT+eeaatu/EkhxaWG68MDV/ZcidHRRK9rCnxszfqc9e/86+0Blu96DT8/Sl6Ocb
         PDoi2+G07PSEZhMy9A9SbnOktmg5zEz2StzhRquFNhXu4wncetTZAkHawa3OsdWZ83TG
         wHru3kybis+c5mxSP22UE0hna1v+JDrRHj/kTMg0CR2z22grCLQyEbfGG5p7DYjydeyh
         7101ZrSD4XRgkBjPllJ2ydBpSxdI4VizW+a3KjSajn4ZpgLNH4/YD6JXkoaiRlGv8lc2
         L4n+Auhpw1jSiCJCrIZTnqFx/voiLqGcJKcpPWRiNE3d/tztxX2yxa7yp9GzffIKuZUR
         AvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773039117; x=1773643917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aC+um2a762gfpLWPhHdIhYlAN3YczWO4vgnfj1X+hyE=;
        b=W/IPDy5pSa7lMl+IbPIxn0e3EciWYO5N09+Gz/2tAs1vHXYRCP6b7wWrKvvWNNUuzA
         aZGSWY3H37RW3e9fBQ6VTayJFJC/0cqWJeKFV1le9KTuVBRRX4SltI/6Qz/I0fmIi5Px
         PfaC8nO1iqECUcM9ydvwtfI9sLp0zHUTWFJNnx8+Bzuqk9VTnyPF+OEnzC30dZK24LdZ
         JDFZjvronWYxT+Wm+9sLDxYkxonX+1daAfoQvnxQzWWVm3py15WwAKYiLJeQks3vi42r
         WnjcRX3ZHBx9Sw6ttorwM4mK8+btjmc0MYSSk9pFs3fG7xZZkHgpR79+MN2YprClfsD4
         Qt0g==
X-Forwarded-Encrypted: i=1; AJvYcCWkiGUhDDw15R25YpIP2bJdJAHoE6st37bOyxZ8mSS6vU0QdH9pFUAlLVzOewvB3Nghj8sgoqKmQHjZZuwH@vger.kernel.org
X-Gm-Message-State: AOJu0YwkNyfgvTOdPvaEYhNWsq4DSAaO29w9FU7WcvJmc4b61ZfXmrkO
	rSJmm9pyykxJ0CQfOHiYDtpTTazxtgM/DJuvzSdJtOU5I76Phde31wbxfOSfTFbnaJD/JxcLceH
	03Kd7ao2pDThJ9lYcIDR8xUuFTGLQl4vmaDK0f2ycDv5E4gUACX8fHcNeqxIs0b45kTWg
X-Gm-Gg: ATEYQzzMVW99G++IOo7KlWA6xBx7ksjmQAozoU8F9d9be9zkSINd2zsq2EIrUnxESqb
	om5ByeR7wshurB9oF6Bg5sBsZ+UV6L6qju6TOXBQrOfxihlSL8ZkP+XV1C32/4A0GeDuUMxlylP
	YA7JORlodgdpBNDCZn6+f95CLC8Y94GncCUN7qRJCP7fU5G021wy3yHrGiAhQeU7SPKOCUFpN7w
	MUkG8lSbFK6wHVGnwxlCykYtJMlElf3G6A2SWLL63XcgMRWhgFtPz7wjqornmG537Me7VfzH7p4
	ifR2GEIpm/EDtaB36FmAhTMbNtNvM7L6btdRUVhOINPJngfyfJ/YOyJHC++X1KwEeErX5CUEAbL
	DOcR3qKXLf/eEtHuLn+EFame7AudX6HdzVnOC6kuOxH/vA63v4REAMVk=
X-Received: by 2002:a05:620a:444f:b0:8cd:8cb8:6ff9 with SMTP id af79cd13be357-8cd8cb87302mr150324585a.34.1773039117227;
        Sun, 08 Mar 2026 23:51:57 -0700 (PDT)
X-Received: by 2002:a05:620a:444f:b0:8cd:8cb8:6ff9 with SMTP id af79cd13be357-8cd8cb87302mr150322885a.34.1773039116846;
        Sun, 08 Mar 2026 23:51:56 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48529f01997sm80449975e9.14.2026.03.08.23.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 23:51:56 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 11/13] ASoC: qcom: q6apm-lpass-dai: move graph start to trigger
Date: Mon,  9 Mar 2026 06:51:35 +0000
Message-ID: <20260309065137.949053-12-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA2MSBTYWx0ZWRfXzZNzSV/8ao/I
 HvpLC+eqHD3SrfV0fidABhucnh5iwapQB/XZYsnDxWqg8fpGJ+aM36GmdVC8xj0eZio61qAaA2m
 ONSuXC+OQw+rAfVAi5w4buQzURGvOyvyLs6PXbwsEI0OrNGGPJsX2Y/FhjVE56M9bmzBbmeJDds
 LLlNMC1d0NRq2OJ4yxsD1wrgenw5r/nyvOv4+wINInUegmp67VwRcnutvN5vNdLzvJoj8e8tavS
 8InocfS7IoHL9hahxx6FlS/dYKohB5pt/5HibNusxiNKQy50tIfUUjCTN2pzK9QJtDnzjmp98Qk
 VGH/jZW3K10KoHIouBGvt2o6a3Ss26TfO6UtVQm0HhllaTlNnKrmPcd9QDUsdSCpeSRHAorak/5
 vA5zYymcNOXXUnEU0qkM+w5issYoAqJGtE3/uqFZ4NRDIxjoSRzYmHf57LKr+45CHImDO7zrbxd
 1XxJtPqvzzbOre8RUHA==
X-Authority-Analysis: v=2.4 cv=QJtlhwLL c=1 sm=1 tr=0 ts=69ae6e0e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=8udmP7N65bQo3KbB_RsA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: y4IxSbYJyrVHvEWWjXhyLK8vVgYL2tvl
X-Proofpoint-GUID: y4IxSbYJyrVHvEWWjXhyLK8vVgYL2tvl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090061
X-Rspamd-Queue-Id: 962B22346FE
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
	TAGGED_FROM(0.00)[bounces-96132-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.997];
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


