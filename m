Return-Path: <linux-arm-msm+bounces-91956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIgtLinRhGk45QMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 18:19:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21486F5CFE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 18:19:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B206304AD91
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 17:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C8A143DA23;
	Thu,  5 Feb 2026 17:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HUBGYboi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W4j0ZGLz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFD343D51C
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 17:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770311669; cv=none; b=KfriBm7rvQWJ9KYyVNzl/rZhmrUtSXc/adaZ6agLUAwQDLthDVlmG0j5zxaqeKqkYJ/gJDz1EWJ1a7OMLEpIYYix9H2ykEaoGJpVLwsaevaBC9EL7J7+bFYSvZEEHy411Q2eFIPxx8n5DMP/vMIdgvIbGh3EGFvP6RqUfq/6+2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770311669; c=relaxed/simple;
	bh=jFJ7rXFjEEX2IgSJ4lsi92py1epN7EisVUgldVC1iLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qZTJBVd9H6O7hpUCOFLUo2cWuuGNwmVatJPxkEchVsttRCWPgeeXq9gSBWJfX6Qh/8hhKTwrrrcZjpQ4pJ5TviagBPcBYxx9+ZbDJ0Rq61HwDm5191atTOWieXbHgnl8f4aO1GSOs2/WC3HnKo5jH9wXhzq3hNr0SmU4kPf1lYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HUBGYboi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W4j0ZGLz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615B4KXB3077707
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 17:14:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QeXNPncWOQl
	n6sXzodfErITJ/YZ4Z4KW6LENrZa0q1c=; b=HUBGYboiAca+MaF2KpgoQ754iG8
	TaJP67DuKvNlFtHQidrv/ilchPjgi3fCMb7ZjjkKnfVLmcVoP+mJhR1bDX6GSZsa
	b9QDjK+NQ0rMtf/XE1g+HANQ9PPUsWoq2dTZrhvTRRrRoQabMM/4pM8irFioQSO4
	vswgACJOuqzOROEWR2eXpO74EQYh37MYPdHcpoiu4exk2qomzFxGx2SYY63p86FL
	sjN656t6wPoYk8sQrRxMeI2CjybTFB9eVjYZtJmROK+xNAuIUhPYS9WfAq5KzOJa
	PIdILhNIKa6i3CqdC/J38nJ2c1XTaSDIifJ/SeGL/hGfAXtH9va//6HEICA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4t0t15ag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 17:14:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70a08daf3so295682485a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 09:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770311667; x=1770916467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QeXNPncWOQln6sXzodfErITJ/YZ4Z4KW6LENrZa0q1c=;
        b=W4j0ZGLzdKAubAYmDHsyhZj2+Ueqy/0p69kFIQvVy4pYtt5a2qGhK59UTKCiPEQeYC
         CiDnn7dRrQVX4RthzfREMdawTsnftTI2BNFper30hlOKlR3LRoDuncjF2iq7JcBjXOGr
         S2thPPEv3IJNRsC8NSJWTatZpQQRSLgazcfwVp6vYEzdV1/f1VEhqt0FSTT6iTHoiDeM
         ZUeBkhmblCEupJ1TAizQbjwm4UyrW9duHFa19W88oT/fE8FwqNIlJLWvucks26DC/TAF
         1HnNSwyPbvQ3Es72AId/ZUIK6SvnoZesbkf8bVka3EM4+aev6mzHRAU8W+jG+FS8p+x1
         7ZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770311667; x=1770916467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QeXNPncWOQln6sXzodfErITJ/YZ4Z4KW6LENrZa0q1c=;
        b=oqrReEMEJ3bS8QVNYUuZHwjgBAkrCunK70nhzEQys9FN087cmA7U0BuUwSROuUcrWJ
         gfy9GKsjLrZHsZqnES/mIgc3yM8YkZ4hR62FN5SprolvXe6TSGJFh8h44wjNt5sk22TS
         6yrzC2lcT4fldZB45r358s9lrXQNjSbfmE6X00V5PvJWfQKgsvZcD1vYww5jcWqDi3Uc
         eX1ttiVU6XPV/kcFksJPdCqcU3M/zCFoOR9pVGG53GzC9JQEMU0q/so2l/pg4HnwCF18
         mOR3rzMCTMXn2LLueRe87ieEGnxljKE0AIA4p0HeObn6BFL7ckpWuhUVvOmYbP/H+NDR
         n3zw==
X-Forwarded-Encrypted: i=1; AJvYcCXqEqapNsOGn6Sa4i6LGrgABhV0qWcEHdaYQE/Kp6MjhTsyeEM/iVV4H7x/oqzPIfQxq5XUVVuprFaMJ3ci@vger.kernel.org
X-Gm-Message-State: AOJu0YxpOY20wgQ+g0yMnmMY4F4sEQgESXyorwy5w/fZ4zHHizuhmE1a
	hQhj8zqt62RGSKahgORL7ztX2sLZZA2aMwhNV8NO+iqLRYHLeHkRKifJ0qUqWyopLb+M1vujxP+
	B6QhlRn2z76Se0wW+kD8/Xy47z/bN4Svucwzp/GSNR68PIDBxWbmicg1LOOYDIidFvzfQ
X-Gm-Gg: AZuq6aLCiZJEK4qVgZjCumgVXkGqdy5RT+xfo5gqcp5QqODwtORgbNi5s+gkSDbzEIt
	LzlbNkXZwWtuzQIb+xX5pliowIamg6rUQ/IUe6FJh6hhxlDobpg/xhaqiZXBB/NowrggvaIoEMo
	nyAV6m0CgTTgXC4FVNiiTJ9qt5WDTst74kU+wXTa9DBzvRD1EvxQidnJ48nOzaU0Vl8CmtP4MeU
	rPZW52Y6Stdngy9EHKkM5KYtTe/3s9NQGJZXx7uH2rojzTKefEreQtSGOOXJ/5O1N0kqRgVkbLi
	Ytrb30dABJ93G6BGVKfbRDx1gBwf4eEEVnBWfAXE3a9/0asvDX9Okd71PSahh0jD5zaxdNuwAqU
	e8qMEG+u7cJ1H27NeWFw5tPAhv64gGhDx3R7XB+yB3+s=
X-Received: by 2002:a05:620a:1902:b0:8a9:ef98:6835 with SMTP id af79cd13be357-8ca2f8675bamr889403985a.33.1770311666971;
        Thu, 05 Feb 2026 09:14:26 -0800 (PST)
X-Received: by 2002:a05:620a:1902:b0:8a9:ef98:6835 with SMTP id af79cd13be357-8ca2f8675bamr889398985a.33.1770311666447;
        Thu, 05 Feb 2026 09:14:26 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43618057f87sm14802849f8f.21.2026.02.05.09.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 09:14:26 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        cnor+dt@kernel.org, srini@kernel.org, perex@perex.cz, tiwai@suse.com,
        alexey.klimov@linaro.org, mohammad.rafi.shaik@oss.qualcomm.com,
        quic_wcheng@quicinc.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 08/10] ASoC: qcom: q6apm-lpass-dai: move graph start to trigger
Date: Thu,  5 Feb 2026 12:14:09 -0500
Message-ID: <20260205171411.34908-9-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WZMBqkhX c=1 sm=1 tr=0 ts=6984cff3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=D19gQVrFAAAA:8 a=EUspDBNiAAAA:8 a=nXfEiGUnzg8titmCROQA:9
 a=NFOGd7dJGGMPyQGDc5-O:22 a=W4TVW4IDbPiebHqcZpNg:22
X-Proofpoint-GUID: viRmRc_N1VzymYHXgtUuxfTRjjUd-aZ7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDEzMCBTYWx0ZWRfX43s1UfSZIuSG
 YXq8yfY6JNSIv0EjjYuCIGpGDzE/DHxsuYDzZRcrTncDflgp9Z++1F+peR+5A1EDwGKkoxEa2wZ
 xWln6i/0c5EyFNNl83YE0ivdpWwiufP0BZ7ogM8qXfpMPR00L2+YY9oXztervPlO4/YUNlSp18d
 MAcOrPMGixGgk6pKoVx+QXfZoSkpRyBpkKp9VYTBBvxYMVv0PHJB0UdKraa3c5KN0YhFUz8ggax
 XoS/R5jTRTfYCE7gFRVIglRrrjOOS8ylt1g5h8YygeZaInaLUKVagHfz6zSe8QorI+5noxoWz19
 gyJQeKRsoVmGB4RniBT0ElZ33nPfV7wqp2ZyZp6M92AF4UcKsVgktJNcBlIO/BiWoFxeuThu6dw
 Xp/C7Ag5Q67UeZ46xTAfXI8oH04ab66fzdW4LnJgZeOjBO4k0k3ltQ9p7CxUnNrfNO1j6dCM6XB
 dxvp5OEFDsk8MrGTHMg==
X-Proofpoint-ORIG-GUID: viRmRc_N1VzymYHXgtUuxfTRjjUd-aZ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_04,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050130
X-Rspamd-Server: lfdr
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
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,linaro.org,oss.qualcomm.com,quicinc.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-91956-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,lkml.org:url];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 21486F5CFE
X-Rspamd-Action: no action

Start the graph at trigger callback. Staring the graph at prepare does
not make sense as there is no data transfer at this point.
Moving this to trigger will also helps fix some of the issues seen with
pipewire and display port. This should also fix some of the Qualcomm DP codec
issues discussed at https://lkml.org/lkml/2025/5/29/102

CC: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 39 +++++++++++++++++--------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index fc246485e326..21624a2803a6 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -159,6 +159,30 @@ static void q6apm_lpass_dai_shutdown(struct snd_pcm_substream *substream, struct
 	}
 }
 
+static int q6apm_lpass_dai_trigger(struct snd_pcm_substream *substream, int cmd, struct snd_soc_dai *dai)
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
@@ -171,10 +195,6 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
 		q6apm_graph_stop(dai_data->graph[dai->id]);
 		dai_data->is_port_started[dai->id] = false;
 
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-			q6apm_graph_close(dai_data->graph[dai->id]);
-			dai_data->graph[dai->id] = NULL;
-		}
 	}
 
 	/**
@@ -203,14 +223,6 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
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
@@ -254,6 +266,7 @@ static const struct snd_soc_dai_ops q6dma_ops = {
 	.shutdown	= q6apm_lpass_dai_shutdown,
 	.set_channel_map  = q6dma_set_channel_map,
 	.hw_params        = q6dma_hw_params,
+	.trigger	= q6apm_lpass_dai_trigger,
 };
 
 static const struct snd_soc_dai_ops q6i2s_ops = {
@@ -263,6 +276,7 @@ static const struct snd_soc_dai_ops q6i2s_ops = {
 	.set_channel_map  = q6dma_set_channel_map,
 	.hw_params        = q6dma_hw_params,
 	.set_fmt	= q6i2s_set_fmt,
+	.trigger	= q6apm_lpass_dai_trigger,
 };
 
 static const struct snd_soc_dai_ops q6hdmi_ops = {
@@ -271,6 +285,7 @@ static const struct snd_soc_dai_ops q6hdmi_ops = {
 	.shutdown	= q6apm_lpass_dai_shutdown,
 	.hw_params	= q6hdmi_hw_params,
 	.set_fmt	= q6i2s_set_fmt,
+	.trigger	= q6apm_lpass_dai_trigger,
 };
 
 static const struct snd_soc_component_driver q6apm_lpass_dai_component = {
-- 
2.47.3


