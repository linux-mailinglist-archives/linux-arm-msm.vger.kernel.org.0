Return-Path: <linux-arm-msm+bounces-98941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iORRBchgvWl09QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 15:59:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DD52DC2B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 15:59:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 100663033BCB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 14:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE3233C8724;
	Fri, 20 Mar 2026 14:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BZQ7rV5/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EoXw7R2G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BA03C73F4
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 14:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774018172; cv=none; b=HkSLOUb2b1ageDBWipzaeMNbV6QJxvV9cfYvYBkAQOLnNAA7fJf9qF34cg8U7PJz3veCCPXRiDn2EjV/8BQC9XFkmc/NG0qssMEMIZNGf5c2RATMiQVweFtRB4DYOlkakzRdF5+Bd6sZFMH8p+kGTwOtsXhBOhOjAhBu44h9UUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774018172; c=relaxed/simple;
	bh=Nn5W6j2KgfG3MXrQpHQ1hcxXhxv/yUbhKAiv5Knj23A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jra5vYP5eidpV6PyDxfkDTY2b70VcR+PBiFKYiIKAit4Jnc/2MWW/5Tr/lNSrXXzp/nbR26Fd2izLF5yhNQVamByfxJC2i+VdcBF2/mVTcJ11O5Q6x/mtMZyVMvt9wfoemq/eKG3o8qUMxf2KsPBdwWiBuJ3KCNIFuEDclKSQCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BZQ7rV5/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EoXw7R2G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62KBsgYt3876218
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 14:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=it+OAEpYU8v
	0MR39X1WR6T1UKdIHL61i+TcaqL8baj4=; b=BZQ7rV5/GyyNa8ccYSgIrTTB2fD
	QkljqL7NXHQUJMRG7q+BNPaL8+raXhjI87j1bwAocGjCvoj+Z8GYTn1MWdUla4LE
	v077WSzk/FN5yQ8MqEz9GBvhD5DaYL4FCkPHMklwtfIK20+4eeyX+4U7lh2/6PuM
	aidycHxqCrJD00u0iDqrKdgZ0BKr74bAprHqxHybF1VbR47pp1wXGaVURrKalSI7
	pj/n3Bx4qgNxpCRz0HbhB/NSIF7rn30AEgfyb8cOuwja3z6tbs7eoEvfE6jqr8Nt
	T2BpU0CegVRCKSrtXelsU3xgCdSsg+5INQUwM5CBH8Y6cj/PUhD8yOqkRVg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d15s08e4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 14:49:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b3a341f3dso46782221cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 07:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774018170; x=1774622970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=it+OAEpYU8v0MR39X1WR6T1UKdIHL61i+TcaqL8baj4=;
        b=EoXw7R2G3nUQ93kVGDEQbjcXcFIsQkozOB6ZVD9p4PqE08iqqMYOvN+dLtnnaR4MsE
         hclDv/KEA5UVMVRlTd1K7eYomI7VS7PhYAOTyJK9ADKJR+k6P5OThJRpr7dJqrLKqrXc
         AvnovdLm8tPBRnuVQyCve+VyDXlzS49D4DR1pLgYSo/EzDkRj8hWf5OMvc3R4ISUOlfw
         1BY1Z5t9wVf/rII1aTs1PUOSDA5gAvnUhCVa4vT8pjVk1gXZn+IczoLrsvx1M/CxLwrG
         LeZinTfXWLczo5lwrmDMvIqoEqJ8THzjkEdvN4Xa2C/PrN5rgU34fsm35dzEsteU7Ejp
         7ljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774018170; x=1774622970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=it+OAEpYU8v0MR39X1WR6T1UKdIHL61i+TcaqL8baj4=;
        b=U/H3KHp2N+mg2S0k4Xpm9lIhaJoyx5bzNe58qtYjNC03nScGfZiXl0VfT+e2tvDJWi
         o4XdT0Yd2aeGhSQnhHpm6SscZeizf38fbSwGWXTZIiCXwto8f2LiN2yjfuhKp2wRjdh9
         MKVOHZn0NnTZTCPRRfoKHfaBU1dO267YoYKswJs9095Gxzq59UPaW4YiW48341FsG0KM
         kvnfamry47kFKi/zthM09xaMwuCyq0nwhvxhykoQpKL48NbavVtF5ABN4p/4mgEkl6jr
         EqUWhBpPUavf1CM0c+Ta6Voj8BR1kYfx23V9l3ZCXYd+ABcRQ7K0UaVxMhJ6/dwj0ZCA
         DDrA==
X-Forwarded-Encrypted: i=1; AJvYcCU75+s+JNE19NNJ5CV/XRdKlMjOA9RvPeVU57l8z6L4oAslkn5SWeh6gpBTXBXOGteReP3Tro9ZbLf2tpcI@vger.kernel.org
X-Gm-Message-State: AOJu0YyIWM5QQ6yJjGpvrtxAng8EP53wT8gvm+mjK0q81G+G7mO9/QE+
	iR/YORkz+Sn8e1FdgNCa8cCkWZ8UjvUioJ1ehggTkVRzgG+Qr4RCPSVAeqF3ZXmVWnigHRF1j5s
	s3wmMTnO9yI719bc3rWknKvw/y6CvGJogLhJG56gkKWxGIrZ9JOQT7t4LJWhiqu2e/Tnk
X-Gm-Gg: ATEYQzxENUYepjM/JkaysotLMefehzVo7Qbf8NmkLn2QK3loJI7UIuDUAAQn7mmMj2g
	pqxKI9he9XMbyr3J1aw+LW3Jxdp3w7aW3BdrXe9DZuRlI43gWnGEYQEcEk/adxqAr2Wy7mFirVj
	hsnKQ8mbMVXEld2nyE8MgsQ95mFXcDzJR4bcmtcJZp464LPxiBN1qYBhYREMoNER5shFuKKVSjr
	WXIA4riPW6tRywUMNHscJTas4m368cEPOclJey/C7E2bHSJlnBCcnvcLpK90x7SCa7U4XWEchpn
	hSJSwQWSpi2vYXDDS0mgH4GWAm39MfcWs9RfADY5Ys3ry2LgsZR255l7MEz+U2apO2cCvxm6439
	gfk3ejOx7ogKkz/VDhNkG1HAZOYqf0d+RkezmSoJntkom1wipymbpky4=
X-Received: by 2002:a05:622a:11c6:b0:509:4342:9966 with SMTP id d75a77b69052e-50b2461b2a5mr104983631cf.16.1774018169611;
        Fri, 20 Mar 2026 07:49:29 -0700 (PDT)
X-Received: by 2002:a05:622a:11c6:b0:509:4342:9966 with SMTP id d75a77b69052e-50b2461b2a5mr104983171cf.16.1774018169094;
        Fri, 20 Mar 2026 07:49:29 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff109b95sm47906825e9.1.2026.03.20.07.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:49:27 -0700 (PDT)
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
Subject: [PATCH v6 04/13] ASoC: qcom: q6apm-lpass-dai: Fix multiple graph opens
Date: Fri, 20 Mar 2026 14:49:09 +0000
Message-ID: <20260320144918.1685838-5-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: HSTqVxlZZITOKjfOabhzPXR_LQs-d9kI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDExOCBTYWx0ZWRfXxs0VKVOQyTmE
 KEkqih+uiyqXBBp7PRhw+ahA7vNHzJs0kIH0K8lYeMK95NsbW57OxtusDdqVjnZI7x4TZw5wcoG
 LhFUu+uxKlndHABkh6VvZ99YHL5pprFI3RD5DtKHhxzH9U9SRCk7e9TnuLlMgBId7H1EnhS4fxi
 BBfuoHhEEb3blbB4jQzCkfUMEBJlMzSq4R8yxbR7XO0RKWItZhHRg2yh4Yo558VCArX+Yubo5gq
 fMY0oY6md7Z+KC9WRX4040P78miJdUQWgTuDerAvXVXy+EfFwgcdD9qpvidCPTGn+X0emk41Kwz
 SmT15AwjCeKBIIyihGXb81jnVc1HyMith1tiwqyx3Do2FhJKiR/ISBJAdoBUIOm3VUo4+DA3NHS
 hyTBwwf/rQrFTxmzxv5IgkUKIaz9A33Vs2YfnSt3oBwhYd3UYYubq2kpWFt3Tvc0s/y8OAtwvrd
 YbqJs3y8p27uoqjbf7g==
X-Proofpoint-GUID: HSTqVxlZZITOKjfOabhzPXR_LQs-d9kI
X-Authority-Analysis: v=2.4 cv=KORXzVFo c=1 sm=1 tr=0 ts=69bd5e7a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=M_mAHeyD2EURj3i0m2kA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200118
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
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-98941-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.970];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C4DD52DC2B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index 5be37eeea329..ba64117b8cfe 100644
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


